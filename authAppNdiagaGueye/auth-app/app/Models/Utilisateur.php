<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Support\Facades\Hash;
class Utilisateur extends Model
{
    protected $table = 'utilisateur';
    protected $primaryKey = 'idUtilisateur';
    public $timestamps = false;

    
    protected $fillable = [
        'emailUtilisateur',
        'motDePasseUtilisateur',
        'nomUtilisateur',
        'prenomUtilisateur',
        'secretA2FUtilisateur',
        'tentativesEchoueesUtilisateur', 
        'estDesactiveUtilisateur',
    ];

    public function logs(): HasMany
    {
        return $this->hasMany(Log::class);
    }

    public static function existeEmail($email) {
        $nb = self::where("emailUtilisateur", $email)->count();

        if($nb > 0) {
            return true;
        }
        else {
            return false;
        }
    }

    public function  desactiverCompte() {
        $this->estDesactiveUtilisateur = 1;
        $this->save();
    }

    public function reactiverCompte() {
        $this->estDesactiveUtilisateur = 0;
        $this->tentativesEchoueesUtilisateur = 0;
        $this->save();
    }

    public static function inscription($email, $motDePasseHache, $nom, $prenom, $secretA2F) {
        $nouvelUtilisateur = new Utilisateur();
        $nouvelUtilisateur->emailUtilisateur = $email;
        $nouvelUtilisateur->motDePasseUtilisateur = $motDePasseHache;
        $nouvelUtilisateur->nomUtilisateur = $nom;
        $nouvelUtilisateur->prenomUtilisateur = $prenom;
        $nouvelUtilisateur->secretA2FUtilisateur = $secretA2F;

        $nouvelUtilisateur->save();
    }

    public static function connexion($email){
        $utilisateur = Utilisateur::where('emailUtilisateur', $email)->first();
        return $utilisateur;
    }
    public static function getNombreTentative($email){
        return Utilisateur::where('emailUtilisateur', $email)->value('tentativesEchoueesUtilisateur'); 
    }
}