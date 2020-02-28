-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  ven. 28 fév. 2020 à 12:27
-- Version du serveur :  5.7.24
-- Version de PHP :  7.3.1

drop database if exists dbfly;
create database dbfly;
	use dbfly;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `dbfly`
--

-- --------------------------------------------------------

--
-- Structure de la table `administrateur`
--

DROP TABLE IF EXISTS `administrateur`;
CREATE TABLE IF NOT EXISTS `administrateur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom_admin` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom_admin` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `identifiant` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mdp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('super','groupe') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'groupe',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `administrateur`
--

INSERT INTO `administrateur` (`id`, `nom_admin`, `prenom_admin`, `identifiant`, `mdp`, `role`) VALUES
(1, 'Pourrer', 'Pierre', 'Pourrer.pierre', 'az98465', 'groupe'),
(2, 'Modric', 'Alexander', 'Modric.alexander', 'er98651', 'groupe'),
(3, 'Rayden', 'Paul', 'Rayden.paul', 'op16589', 'groupe'),
(4, 'Pourrer', 'Pierre', 'Pourrer.pierre', 'az98465', 'groupe'),
(5, 'Modric', 'Alexander', 'Modric.alexander', 'er98651', 'groupe'),
(6, 'Rayden', 'Paul', 'Rayden.paul', 'op16589', 'groupe'),
(7, 'Jean', 'Dupont', 'JD', '123', 'groupe');

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mdp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`id`, `nom`, `prenom`, `email`, `mdp`) VALUES
(1, 'Chen', 'Paul', 'paul@gmail.com', 'aze'),
(2, 'Potric', 'Vladimir', 'Vladimir@gmail.com', 'poi'),
(3, 'Guy', 'Jacques', 'Jacques@gmail.com', 'ery'),
(4, 'Charpentier', 'Maxime', 'Charpentier@gmail.com', 'mlko'),
(5, 'Debuchy', 'Mathieu', 'Mathieu@gmail.com', 'uiouy'),
(6, 'Traore', 'Sarah', 'Sarah@gmail.com', 'oiuy'),
(7, 'Bouvier', 'Dominic', 'Dominic@gmail.com', '5484eer'),
(8, 'Hhiver', 'Alexis', 'Alexis@gmail.com', 'erezt'),
(9, 'Trudeau', 'Denis', 'Denis@gmail.com', 'aze123'),
(10, 'Royden', 'Florence', 'Florence@gmail.com', 'aze15489'),
(11, 'chen', 'kevin', 'tdgd@dsf.com', '$2y$13$ejKooLK1dDpHQ2JBD6DZ3ueoneapXzvoPzNakqCBP4bKhyq/O0Z4.'),
(12, 'chen', 'kevin', 'abc@abc.com', '$2y$13$PxEeEn94JUoxSMZ/r4eGUeljSmP1I2HWLRWXKc8c.kHHaZ2rA3nPW'),
(13, 'Chen', 'Paul', 'paul@gmail.com', 'aze'),
(14, 'Potric', 'Vladimir', 'Vladimir@gmail.com', 'poi'),
(15, 'Guy', 'Jacques', 'Jacques@gmail.com', 'ery'),
(16, 'Charpentier', 'Maxime', 'Charpentier@gmail.com', 'mlko'),
(17, 'Debuchy', 'Mathieu', 'Mathieu@gmail.com', 'uiouy'),
(18, 'Traore', 'Sarah', 'Sarah@gmail.com', 'oiuy'),
(19, 'Bouvier', 'Dominic', 'Dominic@gmail.com', '5484eer'),
(20, 'Hhiver', 'Alexis', 'Alexis@gmail.com', 'erezt'),
(21, 'Trudeau', 'Denis', 'Denis@gmail.com', 'aze123'),
(22, 'Royden', 'Florence', 'Florence@gmail.com', 'aze15489'),
(23, 'kevin', 'kevin', 'kevin@gmail.com', '$2y$13$ZQwlQKhM6GSyvHe4PYSa9..eGPzOkIQAyG5vaGImXfcd1ltpYHpYu');

-- --------------------------------------------------------

--
-- Structure de la table `client_groupe`
--

DROP TABLE IF EXISTS `client_groupe`;
CREATE TABLE IF NOT EXISTS `client_groupe` (
  `client_id` int(11) NOT NULL,
  `groupe_id` int(11) NOT NULL,
  PRIMARY KEY (`client_id`,`groupe_id`),
  KEY `IDX_511FC79219EB6921` (`client_id`),
  KEY `IDX_511FC7927A45358C` (`groupe_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `groupe`
--

DROP TABLE IF EXISTS `groupe`;
CREATE TABLE IF NOT EXISTS `groupe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `administrateur_id` int(11) DEFAULT NULL,
  `destination` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_trajet` int(11) DEFAULT NULL,
  `statut` enum('en cours','valide') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en cours',
  PRIMARY KEY (`id`),
  KEY `IDX_4B98C217EE5403C` (`administrateur_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `groupe`
--

INSERT INTO `groupe` (`id`, `administrateur_id`, `destination`, `date`, `id_trajet`, `statut`) VALUES
(7, 1, 'Nice', '2020-01-22', 1, 'en cours'),
(8, 1, 'Londres', '2020-02-05', 2, 'en cours'),
(9, 1, 'Madrid', '2020-03-09', 3, 'en cours'),
(10, 1, 'Alger', '2020-01-25', 4, 'en cours'),
(11, 1, 'Athenes', '2020-02-10', 5, 'en cours'),
(12, 1, 'Orly (Paris)', '2020-03-02', 6, 'en cours'),
(13, 1, 'Moscou', '2020-01-06', 7, 'en cours'),
(14, 1, 'Newark (New York)', '2020-05-30', 8, 'en cours'),
(15, 1, 'Tunis', '2020-03-04', 9, 'en cours'),
(16, 1, 'Nice', '2020-01-22', 10, 'en cours'),
(17, 1, 'Londres', '2020-02-05', 11, 'en cours'),
(18, 1, 'Lyon', '2020-03-09', 12, 'en cours');

-- --------------------------------------------------------

--
-- Structure de la table `migration_versions`
--

DROP TABLE IF EXISTS `migration_versions`;
CREATE TABLE IF NOT EXISTS `migration_versions` (
  `version` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `executed_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migration_versions`
--

INSERT INTO `migration_versions` (`version`, `executed_at`) VALUES
('20191209115909', '2019-12-09 12:01:13'),
('20191209171558', '2019-12-09 17:16:35'),
('20191211130158', '2019-12-11 13:11:35'),
('20191211131129', '2019-12-11 13:11:35'),
('20191229150734', '2019-12-29 15:09:57'),
('20200108041359', '2020-01-08 04:14:16');

-- --------------------------------------------------------

--
-- Structure de la table `partenaire`
--

DROP TABLE IF EXISTS `partenaire`;
CREATE TABLE IF NOT EXISTS `partenaire` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom_partenaire` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `partenaire`
--

INSERT INTO `partenaire` (`id`, `nom_partenaire`) VALUES
(1, 'BlaBlaCar'),
(2, 'McDonald'),
(3, 'Airbnb'),
(4, 'Xiaomi'),
(5, 'BlaBlaCar'),
(6, 'McDonald'),
(7, 'Airbnb'),
(8, 'Xiaomi');

-- --------------------------------------------------------

--
-- Structure de la table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
CREATE TABLE IF NOT EXISTS `reservation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupe_id` int(11) DEFAULT NULL,
  `tarif` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `trajet_id` int(11) DEFAULT NULL,
  `statut` enum('en cours','valide') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en cours',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_42C849557A45358C` (`groupe_id`),
  KEY `IDX_42C84955D12A823` (`trajet_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `service`
--

DROP TABLE IF EXISTS `service`;
CREATE TABLE IF NOT EXISTS `service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `partenaire_id` int(11) DEFAULT NULL,
  `libelle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_E19D9AD298DE13AC` (`partenaire_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `service`
--

INSERT INTO `service` (`id`, `partenaire_id`, `libelle`) VALUES
(1, 1, 'Covoiturage'),
(2, 2, 'Restauration'),
(3, 3, 'Location immobiliaire'),
(4, 4, 'Vente telephonie'),
(5, 1, 'Covoiturage'),
(6, 2, 'Restauration'),
(7, 3, 'Location immobiliaire'),
(8, 4, 'Vente telephonie');

-- --------------------------------------------------------

--
-- Structure de la table `service_vol`
--

DROP TABLE IF EXISTS `service_vol`;
CREATE TABLE IF NOT EXISTS `service_vol` (
  `service_id` int(11) NOT NULL,
  `vol_id` int(11) NOT NULL,
  PRIMARY KEY (`service_id`,`vol_id`),
  KEY `IDX_2B0CE49CED5CA9E6` (`service_id`),
  KEY `IDX_2B0CE49C9F2BFB7A` (`vol_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `service_vol`
--

INSERT INTO `service_vol` (`service_id`, `vol_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 2),
(2, 3),
(3, 1),
(3, 2),
(3, 3);

-- --------------------------------------------------------

--
-- Structure de la table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
CREATE TABLE IF NOT EXISTS `ticket` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reservation_id` int(11) DEFAULT NULL,
  `tarif_unitaire` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_97A0ADA3B83297E7` (`reservation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `trajet`
--

DROP TABLE IF EXISTS `trajet`;
CREATE TABLE IF NOT EXISTS `trajet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `heure_dep` time NOT NULL,
  `heure_arr` time NOT NULL,
  `aeroport` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `destination` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prix` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `trajet`
--

INSERT INTO `trajet` (`id`, `heure_dep`, `heure_arr`, `aeroport`, `date`, `destination`, `image`, `prix`) VALUES
(1, '10:00:00', '22:40:00', 'Orly', '2020-01-22', 'Nice', 'images/nice.jpg', 52),
(2, '07:00:00', '07:55:00', 'Orly (Paris)', '2020-02-05', 'Londres', 'images/londres.jpg', 56),
(3, '06:00:00', '18:30:00', 'PCD (Paris)', '2020-03-09', 'Madrid', 'images/madrid.jpg', 63),
(4, '08:00:00', '09:30:00', 'Montpellier', '2020-01-25', 'Alger', 'images/alger.jpg', 120),
(5, '10:00:00', '13:10:00', 'PCD (Paris)', '2020-02-10', 'Athenes', 'images/athenes.jpg', 150),
(6, '17:15:00', '18:35:00', 'Toulouse', '2020-03-02', 'Orly (Paris)', 'images/paris.jpg', 62),
(7, '07:05:00', '14:50:00', 'CDG (Paris)', '2020-01-06', 'Moscou', 'images/moscou.jpg', 220),
(8, '09:25:00', '11:45:00', 'CDG (Paris)', '2020-05-30', 'Newark (New york)', 'images/newyork.jpg', 380),
(9, '19:30:00', '22:05:00', 'Orly (Paris)', '2020-03-04', 'Tunis', 'images/tunis.jpg', 212),
(10, '19:00:00', '20:35:00', 'Orly (Paris)', '2020-01-22', 'Nice', 'images/nice.jpg', 53),
(11, '07:00:00', '08:15:00', 'Orly (Paris)', '2020-02-05', 'Londres', 'images/londres.jpg', 102),
(12, '06:00:00', '08:10:00', 'PCD (Paris)', '2020-03-09', 'Madrid', 'images/madrid.jpg', 105);

-- --------------------------------------------------------

--
-- Structure de la table `type_ticket`
--

DROP TABLE IF EXISTS `type_ticket`;
CREATE TABLE IF NOT EXISTS `type_ticket` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `type_ticket`
--

INSERT INTO `type_ticket` (`id`, `libelle`) VALUES
(1, 'Classe Economique'),
(2, 'Classe Affaire'),
(3, 'Premiere classe'),
(4, 'Classe Economique'),
(5, 'Classe Affaire'),
(6, 'Premiere classe');

-- --------------------------------------------------------

--
-- Structure de la table `vol`
--

DROP TABLE IF EXISTS `vol`;
CREATE TABLE IF NOT EXISTS `vol` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trajet_id` int(11) DEFAULT NULL,
  `date_vol` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `heure_dep` time NOT NULL,
  `heure_arr` time NOT NULL,
  `aeroport_dep` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `aeroport_arr` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_95C97EBD12A823` (`trajet_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `vol`
--

INSERT INTO `vol` (`id`, `trajet_id`, `date_vol`, `heure_dep`, `heure_arr`, `aeroport_dep`, `aeroport_arr`) VALUES
(1, 1, '2020-01-22', '10:00:00', '22:40:00', 'Orly (Paris)', 'Nice'),
(2, 2, '2020-02-05', '07:00:00', '07:55:00', 'Orly (Paris)', 'Londres'),
(3, 3, '2020-03-09', '06:00:00', '18:30:00', 'PCD (Paris)', 'Madrid'),
(4, 1, '2020-01-25', '08:00:00', '09:30:00', 'Montpellier', 'Alger'),
(5, 2, '2020-02-10', '10:00:00', '13:10:00', 'PCD (Paris)', 'Athenes'),
(6, 3, '2020-03-02', '17:15:00', '18:35:00', 'Toulouse', 'Orly (Paris)'),
(7, 4, '2020-01-06', '07:05:00', '14:50:00', 'CDG (Paris)', 'Moscou'),
(8, 5, '2020-05-30', '09:25:00', '11:45:00', 'CDG (Paris)', 'Newark (New york)'),
(9, 6, '2020-03-04', '19:30:00', '22:05:00', 'Orly (Paris)', 'Tunis'),
(10, 7, '2020-01-22', '10:00:00', '22:40:00', 'Orly (Paris)', 'Nice'),
(11, 8, '2020-02-05', '07:00:00', '07:55:00', 'Orly (Paris)', 'Londres'),
(12, 9, '2020-03-09', '06:00:00', '18:30:00', 'PCD (Paris)', 'Madrid');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `client_groupe`
--
ALTER TABLE `client_groupe`
  ADD CONSTRAINT `FK_511FC79219EB6921` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_511FC7927A45358C` FOREIGN KEY (`groupe_id`) REFERENCES `groupe` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `groupe`
--
ALTER TABLE `groupe`
  ADD CONSTRAINT `FK_4B98C217EE5403C` FOREIGN KEY (`administrateur_id`) REFERENCES `administrateur` (`id`);

--
-- Contraintes pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `FK_42C849557A45358C` FOREIGN KEY (`groupe_id`) REFERENCES `groupe` (`id`),
  ADD CONSTRAINT `FK_42C84955D12A823` FOREIGN KEY (`trajet_id`) REFERENCES `trajet` (`id`);

--
-- Contraintes pour la table `service`
--
ALTER TABLE `service`
  ADD CONSTRAINT `FK_E19D9AD298DE13AC` FOREIGN KEY (`partenaire_id`) REFERENCES `partenaire` (`id`);

--
-- Contraintes pour la table `service_vol`
--
ALTER TABLE `service_vol`
  ADD CONSTRAINT `FK_2B0CE49C9F2BFB7A` FOREIGN KEY (`vol_id`) REFERENCES `vol` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_2B0CE49CED5CA9E6` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `FK_97A0ADA3B83297E7` FOREIGN KEY (`reservation_id`) REFERENCES `reservation` (`id`);

--
-- Contraintes pour la table `vol`
--
ALTER TABLE `vol`
  ADD CONSTRAINT `FK_95C97EBD12A823` FOREIGN KEY (`trajet_id`) REFERENCES `trajet` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
