<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Utilisateur;
use App\Models\Log;
use App\Models\Reactivation;
use App\Http\Controllers\Email;
use Illuminate\Support\Facades\Hash;
use Firebase\JWT\JWT;
use Firebase\JWT\Key;



use PragmaRX\Google2FA\Google2FA;


/* A FAIRE (fiche 3, partie 2, question 1) : inclure ci-dessous le use PHP pour la libriairie gérant l'A2F */

// A FAIRE (fiche 3, partie 3, question 4) : inclure ci-dessous le use PHP pour la libriairie gérant le JWT

class Connexion extends Controller
{
   
    public function afficherFormulaireConnexion() {
        return view('formulaireConnexion', []);
    }

    public function afficherFormulaireVerificationA2F() {
        if(session()->has('connexion')) {
            if(Utilisateur::where("idUtilisateur", session()->get('connexion'))->count() > 0) {
                return view('formulaireA2F', []);
            }
            else {
                session()->forget('connexion');
                return view('formulaireConnexion', []);
            }
        }
        else {
            return view('formulaireConnexion', []);
        }
    }

    public function reactivationCompte() {
        $validation = false; 
        $messageAAfficher = null;
        $code = $_GET['code']; 
    
        if (isset($code)) {
            if (Reactivation::existeCode($code)) {
                if (Reactivation::estValide($code)) {
                    $utilisateur = Reactivation::getUtilisateurConcerne($code);
    
                    if ($utilisateur) {
                        $utilisateur->estDesactiveUtilisateur = 0;
                        $utilisateur->save();
                        Reactivation::where("codeReactivation", $code)->delete();
                        Log::ecrireLog($utilisateur->emailUtilisateur, "Compte réactivé avec succès.");
                        $validation = true;
                        $messageAAfficher = "Votre compte a été réactivé avec succès.";
                        return view('formulaireConnexion', ["messageConfirmation" => $messageAAfficher]);
                    } else {
                        $messageAAfficher = "Utilisateur introuvable.";
                    }
                } else {
                    $messageAAfficher = "Le code de réactivation a expiré.";
                }
            } else {
                $messageAAfficher = "Le code de réactivation est invalide.";
                Log::ecrireLog($utilisateur->emailUtilisateur, "Réactivation échouée");
            }
        } else {
            $messageAAfficher = "Code de réactivation manquant.";
        }
    
       
    }
    
    

    public function boutonVerificationCodeA2F() {
        $validationFormulaire = false; // Booléen qui indique si les données du formulaire sont valides
        $messagesErreur = array(); // Tableau contenant les messages d'erreur à afficher

        /* A FAIRE (fiche 3, partie 2, question 1) : vérification du code A2F */

        $google2fa = new \PragmaRX\Google2FA\Google2FA();
        $utilisateur = Utilisateur::connexion(session()->get('email'));
        if (isset($_POST["codeA2F"])) {
            if ($google2fa->verifyKey( $utilisateur->secretA2FUtilisateur,$_POST["codeA2F"] )) {
                session()->forget('connexion');

                $dateHeureCreation = time();  
                $secretKey = 'T3mUjGjhC6WuxyNGR2rkUt2uQgrlFUHx'; 
                $expirationTime = $dateHeureCreation + 3600;
                $payload = [
                    'iat' => $dateHeureCreation,         
                    'name' => $utilisateur->emailUtilisateur,
                    'sub' => $utilisateur->idUtilisateur,
                    'exp' => $expirationTime
                ];

                $jwt = JWT::encode($payload, $secretKey, 'HS256');
                setcookie('auth', $jwt, $expirationTime, '/', '', false, true);
                return redirect()->to('profil')->send();
            }
             else {
                $messagesErreur =["Code incorrect, réessayez."];
                return view('formulaireA2F',$messagesErreur);
            
            }
        }else{
            $messagesErreur=["Veuillez saisir le code"];
            return view('formulaireA2F',$messagesErreur);
        }    
    }

        /* A FAIRE (fiche 3, partie 3, question 4) : générer un JWT une fois le code A2F validé + création du cookie + redirection vers la page de profil */

        // Redirection vers la page du profil :
        //return redirect()->to('profil')->send();
    
    
    public function boutonConnexion() {
        $validationFormulaire = false; // Booléen qui indique si les données du formulaire sont valides
        $messagesErreur = array(); // Tableau contenant les messages d'erreur à afficher

        /* A FAIRE (fiche 3, partie 1, question 3) : vérification du couple login/mot de passe */
        if(isset($_POST["email"]) && isset($_POST["motdepasse"])) {
            $utilisateur = Utilisateur::connexion($_POST["email"]);
            if($utilisateur){
                $tentativeEchoue=Utilisateur::getNombreTentative($_POST['email']);
                $tentativerestant=0;
                if($utilisateur->estDesactiveUtilisateur==1){  
                    $validationFormulaire=false;
                    $messagesErreur[]="votre compte est désactivé";
                }
                else{
                    if ( Hash::check($_POST['motdepasse'], $utilisateur->motDePasseUtilisateur)){
                        $utilisateur->update(['tentativesEchoueesUtilisateur' => 0]);
                        $utilisateur->update(['estDesactiveUtilisateur' => 0]);
                        $validationFormulaire=true;
                        session()->put('connexion',true);
                        Log::ecrireLog($_POST["email"],"Connexion reussie");
                        session()->put('email',$_POST['email']);
                    }
                    else{
                        $validationFormulaire=false;
                        $messagesErreur[]="email ou mot de passe non valide";
                        Log::ecrireLog($_POST["email"], "Connexion echoué");
                        $tentativeEchoue=$tentativeEchoue+1;
                        $tentativerestant=5-$tentativeEchoue;
                        $utilisateur->update(['tentativesEchoueesUtilisateur' => $tentativeEchoue]);
                        $messagesErreur[]="Il vous reste ".$tentativerestant." tentatives";
        
                        if ($tentativeEchoue >= 5) {
                            $utilisateur->desactiverCompte();
                            $messagesErreur[]="Votre compte est bloqué";

                            $code = Reactivation::creerCodeReactivation($utilisateur);
                            $urlReactivation = "http://172.17.0.7:9000/reactivation?code=" . $code;
                            Email::envoyerEmail($utilisateur->emailUtilisateur, "Blocage de compte", 
                            " Votre compte a été désacrivé, cliquez sur le lien pour le déasctiver $urlReactivation");
                        }
                    }
                }
                
            }else{
                $validationFormulaire=false;
                $messagesErreur[]="votre compte n'existe pas";
            }
           
        }


        if($validationFormulaire === false) {
            return view('formulaireConnexion', ["messagesErreur" => $messagesErreur]);
        }
        else {
            return view('formulaireA2F', []);
        }
    }

    public function deconnexion() {
        if(session()->has('connexion')) {
            session()->forget('connexion');
        }
        if(isset($_COOKIE["auth"])) {
            setcookie("auth", "", time()-3600);
        }

        return redirect()->to('connexion')->send();
    }

    public function validationFormulaire() {
        if(isset($_POST["boutonVerificationCodeA2F"])) {
            return $this->boutonVerificationCodeA2F();
        }
        else {
            if(isset($_POST["boutonConnexion"])) {
                return $this->boutonConnexion();
            }
            else {
                return redirect()->to('connexion')->send();
            }
        }
    }
}