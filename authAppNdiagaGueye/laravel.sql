-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : lun. 09 déc. 2024 à 15:00
-- Version du serveur : 11.4.3-MariaDB-deb12
-- Version de PHP : 8.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `laravel`
--

-- --------------------------------------------------------

--
-- Structure de la table `log`
--

CREATE TABLE `log` (
  `idLog` int(11) NOT NULL,
  `typeActionLog` varchar(500) NOT NULL,
  `dateHeureLog` datetime NOT NULL DEFAULT current_timestamp(),
  `adresseIPLog` varchar(15) NOT NULL,
  `idUtilisateur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Déchargement des données de la table `log`
--

INSERT INTO `log` (`idLog`, `typeActionLog`, `dateHeureLog`, `adresseIPLog`, `idUtilisateur`) VALUES
(3, 'Inscription', '2024-11-26 08:10:54', '172.18.201.91', 3),
(4, 'Inscription', '2024-12-02 14:16:36', '172.18.201.91', 4),
(5, 'Connexion echoué', '2024-12-02 15:14:03', '172.18.201.91', 4),
(6, 'Connexion echoué', '2024-12-02 15:20:51', '172.18.201.91', 3),
(7, 'Connexion echoué', '2024-12-02 15:24:44', '172.18.201.91', 3),
(8, 'Connexion echoué', '2024-12-02 15:24:58', '172.18.201.91', 3),
(9, 'Connexion reussi', '2024-12-02 15:25:31', '172.18.201.91', 3),
(10, 'Connexion echoué', '2024-12-02 15:28:14', '172.18.201.91', 3),
(11, 'Connexion echoué', '2024-12-02 15:37:26', '172.18.201.91', 3),
(12, 'Connexion echoué', '2024-12-02 15:37:33', '172.18.201.91', 3),
(13, 'Connexion echoué', '2024-12-02 15:37:37', '172.18.201.91', 3),
(14, 'Connexion echoué', '2024-12-02 15:37:43', '172.18.201.91', 3),
(15, 'Connexion echoué', '2024-12-02 15:37:53', '172.18.201.91', 3),
(16, 'Connexion reussi', '2024-12-02 15:38:16', '172.18.201.91', 3),
(17, 'Connexion echoué', '2024-12-02 16:19:30', '172.18.201.91', 3),
(18, 'Connexion reussie', '2024-12-02 16:20:12', '172.18.201.91', 3),
(19, 'Connexion echoué', '2024-12-02 16:20:23', '172.18.201.91', 3),
(22, 'Inscription', '2024-12-03 07:12:19', '172.18.201.91', 6),
(23, 'Connexion echoué', '2024-12-03 07:15:17', '172.18.201.91', 6),
(24, 'Connexion echoué', '2024-12-03 07:15:36', '172.18.201.91', 6),
(25, 'Connexion echoué', '2024-12-03 07:15:44', '172.18.201.91', 6),
(26, 'Connexion echoué', '2024-12-03 07:15:53', '172.18.201.91', 6),
(27, 'Connexion echoué', '2024-12-03 07:16:13', '172.18.201.91', 6),
(28, 'Connexion reussie', '2024-12-03 07:18:59', '172.18.201.91', 6),
(29, 'Connexion echoué', '2024-12-03 07:19:31', '172.18.201.91', 3),
(30, 'Connexion reussie', '2024-12-03 07:19:47', '172.18.201.91', 3),
(31, 'Connexion echoué', '2024-12-03 07:20:14', '172.18.201.91', 3),
(32, 'Connexion reussie', '2024-12-03 07:25:08', '172.18.201.91', 3),
(33, 'Connexion echoué', '2024-12-03 07:25:24', '172.18.201.91', 3),
(34, 'Connexion echoué', '2024-12-03 07:27:53', '172.18.201.91', 4),
(35, 'Connexion echoué', '2024-12-03 07:30:28', '172.18.201.91', 4),
(36, 'Connexion echoué', '2024-12-03 07:30:34', '172.18.201.91', 4),
(37, 'Connexion echoué', '2024-12-03 07:30:39', '172.18.201.91', 4),
(38, 'Connexion echoué', '2024-12-03 07:30:44', '172.18.201.91', 4),
(39, 'Connexion echoué', '2024-12-03 07:32:23', '172.18.201.91', 4),
(40, 'Connexion echoué', '2024-12-03 07:32:37', '172.18.201.91', 4),
(41, 'Connexion reussie', '2024-12-03 07:33:03', '172.18.201.91', 4),
(42, 'Connexion echoué', '2024-12-03 07:33:19', '172.18.201.91', 4),
(43, 'Connexion reussie', '2024-12-03 07:44:25', '172.18.201.91', 4),
(44, 'Connexion echoué', '2024-12-03 07:44:34', '172.18.201.91', 4),
(45, 'Connexion reussie', '2024-12-03 07:46:57', '172.18.201.91', 4),
(46, 'Connexion reussie', '2024-12-03 08:03:13', '172.18.201.91', 4),
(47, 'Connexion reussie', '2024-12-03 08:11:41', '172.18.201.91', 4),
(48, 'Connexion reussie', '2024-12-03 08:12:47', '172.18.201.91', 4),
(49, 'Connexion reussie', '2024-12-03 08:26:15', '172.18.201.91', 4),
(50, 'Connexion reussie', '2024-12-03 08:30:44', '172.18.201.91', 4),
(51, 'Connexion reussie', '2024-12-05 17:16:30', '192.168.100.254', 4),
(52, 'Connexion reussie', '2024-12-05 17:21:36', '192.168.100.254', 4),
(53, 'Connexion reussie', '2024-12-05 17:41:14', '192.168.100.254', 4),
(54, 'Connexion reussie', '2024-12-05 17:42:09', '192.168.100.254', 4),
(55, 'Connexion reussie', '2024-12-05 17:43:32', '192.168.100.254', 4),
(56, 'Connexion reussie', '2024-12-05 17:48:38', '192.168.100.254', 4),
(57, 'Connexion reussie', '2024-12-05 17:58:18', '192.168.100.254', 4),
(58, 'Connexion reussie', '2024-12-05 17:59:04', '192.168.100.254', 4),
(59, 'Connexion reussie', '2024-12-05 18:07:54', '192.168.100.254', 4),
(60, 'Connexion reussie', '2024-12-05 18:11:44', '192.168.100.254', 4),
(61, 'Connexion reussie', '2024-12-05 18:17:11', '192.168.100.254', 4),
(62, 'Connexion reussie', '2024-12-05 18:18:41', '192.168.100.254', 4),
(63, 'Inscription', '2024-12-05 18:23:03', '192.168.100.254', 7),
(64, 'Connexion reussie', '2024-12-05 18:29:12', '192.168.100.254', 4),
(65, 'Connexion reussie', '2024-12-05 18:30:28', '192.168.100.254', 4),
(66, 'Connexion reussie', '2024-12-05 18:32:35', '192.168.100.254', 4),
(67, 'Connexion reussie', '2024-12-05 18:45:08', '192.168.100.254', 4),
(68, 'Connexion reussie', '2024-12-05 18:46:50', '192.168.100.254', 4),
(69, 'Connexion echoué', '2024-12-09 12:57:59', '172.18.201.91', 4),
(70, 'Connexion echoué', '2024-12-09 12:58:21', '172.18.201.91', 4),
(71, 'Connexion echoué', '2024-12-09 12:58:35', '172.18.201.91', 4),
(72, 'Connexion echoué', '2024-12-09 12:58:51', '172.18.201.91', 4),
(73, 'Connexion echoué', '2024-12-09 12:58:57', '172.18.201.91', 4),
(74, 'Connexion echoué', '2024-12-09 13:01:41', '172.18.201.91', 6),
(75, 'Connexion echoué', '2024-12-09 13:01:47', '172.18.201.91', 6),
(76, 'Connexion echoué', '2024-12-09 13:01:54', '172.18.201.91', 6),
(77, 'Connexion echoué', '2024-12-09 13:01:59', '172.18.201.91', 6),
(78, 'Connexion echoué', '2024-12-09 13:02:10', '172.18.201.91', 6),
(79, 'Connexion echoué', '2024-12-09 13:15:17', '172.18.201.91', 6),
(80, 'Connexion echoué', '2024-12-09 13:16:13', '172.18.201.91', 6),
(81, 'Connexion echoué', '2024-12-09 13:16:18', '172.18.201.91', 6),
(82, 'Connexion echoué', '2024-12-09 13:16:22', '172.18.201.91', 6),
(83, 'Connexion echoué', '2024-12-09 13:16:27', '172.18.201.91', 6),
(84, 'Connexion echoué', '2024-12-09 13:20:14', '172.18.201.91', 6),
(85, 'Connexion echoué', '2024-12-09 13:20:19', '172.18.201.91', 6),
(86, 'Connexion echoué', '2024-12-09 13:20:23', '172.18.201.91', 6),
(87, 'Connexion echoué', '2024-12-09 13:20:28', '172.18.201.91', 6),
(88, 'Connexion echoué', '2024-12-09 13:20:34', '172.18.201.91', 6),
(89, 'Connexion echoué', '2024-12-09 13:34:49', '172.18.201.91', 6),
(90, 'Connexion echoué', '2024-12-09 13:34:53', '172.18.201.91', 6),
(91, 'Connexion echoué', '2024-12-09 13:34:57', '172.18.201.91', 6),
(92, 'Connexion echoué', '2024-12-09 13:35:02', '172.18.201.91', 6),
(93, 'Connexion echoué', '2024-12-09 13:35:09', '172.18.201.91', 6),
(94, 'Connexion echoué', '2024-12-09 13:38:51', '172.18.201.91', 4),
(95, 'Connexion reussie', '2024-12-09 13:39:14', '172.18.201.91', 4),
(96, 'Connexion reussie', '2024-12-09 13:41:21', '172.18.201.91', 4),
(97, 'Connexion reussie', '2024-12-09 13:42:21', '172.18.201.91', 4),
(98, 'Connexion reussie', '2024-12-09 13:45:45', '172.18.201.91', 4),
(99, 'Connexion reussie', '2024-12-09 13:49:01', '172.18.201.91', 4),
(100, 'Connexion reussie', '2024-12-09 13:50:03', '172.18.201.91', 4);

-- --------------------------------------------------------

--
-- Structure de la table `reactivation`
--

CREATE TABLE `reactivation` (
  `idReactivation` int(11) NOT NULL,
  `idUtilisateur` int(11) NOT NULL,
  `codeReactivation` varchar(255) NOT NULL,
  `dateHeureExpirationReactivation` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Déchargement des données de la table `reactivation`
--

INSERT INTO `reactivation` (`idReactivation`, `idUtilisateur`, `codeReactivation`, `dateHeureExpirationReactivation`) VALUES
(1, 6, 'JgsY6hGPbjKkdVORDIw1EF58fLaxu3WB', '2024-12-09 13:20:34'),
(2, 6, 'ZqvfNrlxTXQ9ctBbJjWFYM8HEPOm3yea', '2024-12-09 13:35:09');

-- --------------------------------------------------------

--
-- Structure de la table `recuperation`
--

CREATE TABLE `recuperation` (
  `idRecuperation` int(11) NOT NULL,
  `idUtilisateur` int(11) NOT NULL,
  `codeRecuperation` varchar(255) NOT NULL,
  `dateHeureExpirationRecuperation` datetime NOT NULL,
  `caractere` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `idUtilisateur` int(11) NOT NULL,
  `emailUtilisateur` varchar(500) NOT NULL,
  `motDePasseUtilisateur` varchar(500) NOT NULL,
  `nomUtilisateur` varchar(500) NOT NULL,
  `prenomUtilisateur` varchar(500) NOT NULL,
  `secretA2FUtilisateur` varchar(500) DEFAULT NULL,
  `tentativesEchoueesUtilisateur` int(11) NOT NULL DEFAULT 0,
  `estDesactiveUtilisateur` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`idUtilisateur`, `emailUtilisateur`, `motDePasseUtilisateur`, `nomUtilisateur`, `prenomUtilisateur`, `secretA2FUtilisateur`, `tentativesEchoueesUtilisateur`, `estDesactiveUtilisateur`) VALUES
(3, 'ndiaga@gmail.com', '$2y$10$xdLGeJPCaRM.YdNWXRpcs.QiMfcBzONLGCjs6HnXbY4FhcxrRXSp2', 'Ndiaga', 'Gueye', 'RHHVYXR6AJU6OBV2', 1, 1),
(4, 'toto@gmail.com', '$2y$10$veZpEwtE09rGk6elUThnwOflJkxKqYjTFsUogSON7eFwtyznTRZ1u', 'toto', 'titi', 'N56I7D5CGHQWBA35', 0, 0),
(6, 'ndiagagueye@esp.sn', '$2y$10$pkpARmnf864HzZoMbIUX5eDAZU19m.R9ZveBBeh7nh628DD9deQHm', 'Ndiaga', 'Gueye', '2V5OQGRGXQCUMHDX', 5, 1),
(7, 'aaaa@gmail.com', '$2y$10$/h0EVNM/meKlqvrZArimx.8Uors73iDxXWALVJ63tZ/4g0sTAlgQ2', 'sdakj', 'sdjjj', 'UBIUR6WHN7VC4BJF', 0, 0);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`idLog`),
  ADD KEY `idUtilisateur` (`idUtilisateur`);

--
-- Index pour la table `reactivation`
--
ALTER TABLE `reactivation`
  ADD PRIMARY KEY (`idReactivation`),
  ADD KEY `idUtilisateur` (`idUtilisateur`);

--
-- Index pour la table `recuperation`
--
ALTER TABLE `recuperation`
  ADD PRIMARY KEY (`idRecuperation`),
  ADD KEY `idUtilisateur` (`idUtilisateur`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`idUtilisateur`),
  ADD UNIQUE KEY `emailUtilisateur` (`emailUtilisateur`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `log`
--
ALTER TABLE `log`
  MODIFY `idLog` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT pour la table `reactivation`
--
ALTER TABLE `reactivation`
  MODIFY `idReactivation` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `recuperation`
--
ALTER TABLE `recuperation`
  MODIFY `idRecuperation` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `idUtilisateur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `log`
--
ALTER TABLE `log`
  ADD CONSTRAINT `log_ibfk_1` FOREIGN KEY (`idUtilisateur`) REFERENCES `utilisateur` (`idUtilisateur`);

--
-- Contraintes pour la table `reactivation`
--
ALTER TABLE `reactivation`
  ADD CONSTRAINT `reactivation_ibfk_1` FOREIGN KEY (`idUtilisateur`) REFERENCES `utilisateur` (`idUtilisateur`) ON DELETE CASCADE;

--
-- Contraintes pour la table `recuperation`
--
ALTER TABLE `recuperation`
  ADD CONSTRAINT `recuperation_ibfk_1` FOREIGN KEY (`idUtilisateur`) REFERENCES `utilisateur` (`idUtilisateur`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
