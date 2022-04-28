-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 28 avr. 2022 à 15:29
-- Version du serveur : 8.0.27
-- Version de PHP : 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `comptam02`
--

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

DROP TABLE IF EXISTS `article`;
CREATE TABLE IF NOT EXISTS `article` (
  `ID` int NOT NULL,
  `REF` varchar(13) NOT NULL,
  `DESIGNATION` varchar(255) NOT NULL,
  `PRIX` decimal(7,2) NOT NULL,
  `ID_FOU` int NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `article`
--

INSERT INTO `article` (`ID`, `REF`, `DESIGNATION`, `PRIX`, `ID_FOU`) VALUES
(1, 'A01', 'Perceuse P1', '74.99', 1),
(2, 'F01', 'Boulon laiton 4 x 40 mm(sachet de 10)', '2.25', 2),
(3, 'F02', 'Boulon laiton 5 x 40 mm (sachet de 10)', '4.45', 2),
(4, 'D01', 'Boulon laiton 5 x 40 mm (sachet de 10)', '4.40', 3),
(5, 'A02', 'Meuleuse 125mm', '37.85', 1),
(6, 'D03', 'Boulon acier zingué 4 x 40mm (sachet de 10)', '1.80', 3),
(7, 'A03', 'Perceuse à colonne', '185.25', 1),
(8, 'D04', 'Coffret mêches à bois', '12.25', 3),
(9, 'F03', 'Coffret mêches plates', '6.25', 2),
(10, 'F04', 'Fraises d’encastrement', '8.14', 2);

-- --------------------------------------------------------

--
-- Structure de la table `bon`
--

DROP TABLE IF EXISTS `bon`;
CREATE TABLE IF NOT EXISTS `bon` (
  `ID` int NOT NULL,
  `NUMERO` int DEFAULT NULL,
  `DATE_CMDE` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `DELAI` int DEFAULT NULL,
  `ID_FOU` int NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `bon`
--

INSERT INTO `bon` (`ID`, `NUMERO`, `DATE_CMDE`, `DELAI`, `ID_FOU`) VALUES
(1, 1, '2019-02-08 09:30:00', 3, 1),
(2, 2, '2019-03-02 09:30:00', 5, 2),
(3, 3, '2019-04-03 17:30:00', 2, 3),
(4, 4, '2019-04-05 11:40:00', 2, 3),
(5, 5, '2019-05-15 14:45:00', 7, 2),
(6, 6, '2019-06-24 18:55:00', 0, 1);

-- --------------------------------------------------------

--
-- Structure de la table `compo`
--

DROP TABLE IF EXISTS `compo`;
CREATE TABLE IF NOT EXISTS `compo` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ID_ART` int DEFAULT NULL,
  `ID_BON` int DEFAULT NULL,
  `QTE` int DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `compo`
--

INSERT INTO `compo` (`ID`, `ID_ART`, `ID_BON`, `QTE`) VALUES
(1, 1, 1, 3),
(2, 5, 1, 4),
(3, 7, 1, 1),
(4, 2, 2, 25),
(5, 3, 2, 15),
(6, 9, 2, 8),
(7, 10, 2, 11),
(8, 4, 3, 25),
(9, 6, 3, 40),
(10, 8, 3, 15),
(11, 4, 4, 10),
(12, 6, 4, 15),
(13, 8, 4, 8),
(14, 2, 5, 17),
(15, 3, 5, 13),
(16, 10, 5, 9);

-- --------------------------------------------------------

--
-- Structure de la table `fournisseur`
--

DROP TABLE IF EXISTS `fournisseur`;
CREATE TABLE IF NOT EXISTS `fournisseur` (
  `ID` int NOT NULL,
  `NOM` varchar(25) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `fournisseur`
--

INSERT INTO `fournisseur` (`ID`, `NOM`) VALUES
(1, 'Française d’Imports'),
(2, 'FDM SA'),
(3, 'Dubois & Fils');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
