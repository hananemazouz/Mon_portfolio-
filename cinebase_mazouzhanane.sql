-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  lun. 21 avr. 2025 à 14:58
-- Version du serveur :  5.7.24
-- Version de PHP :  7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `cinebase_mazouzhanane`
--

-- --------------------------------------------------------

--
-- Structure de la table `cinema`
--

DROP TABLE IF EXISTS `cinema`;
CREATE TABLE IF NOT EXISTS `cinema` (
  `idCinema` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `adresse` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idCinema`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `cinema`
--

INSERT INTO `cinema` (`idCinema`, `nom`, `adresse`) VALUES
(1, 'le Renoir', '13100 Aix'),
(2, 'le Fontenelle', '78160 Marly'),
(3, 'Gaumont Wilson', '31000 Toulouse'),
(4, 'Espace Ciné', '93800 Epinay');

-- --------------------------------------------------------

--
-- Structure de la table `film`
--

DROP TABLE IF EXISTS `film`;
CREATE TABLE IF NOT EXISTS `film` (
  `idFilm` int(11) NOT NULL,
  `idRealisateur` int(11) NOT NULL,
  `titre` varchar(50) NOT NULL,
  `genre` varchar(25) DEFAULT NULL,
  `annee` int(11) DEFAULT NULL,
  PRIMARY KEY (`idFilm`),
  UNIQUE KEY `un_Film_titre` (`titre`),
  KEY `fk_Film_Personne` (`idRealisateur`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `film`
--

INSERT INTO `film` (`idFilm`, `idRealisateur`, `titre`, `genre`, `annee`) VALUES
(1, 15, 'Crash', 'Drame', 1996),
(2, 15, 'Faux-Senblants', 'Epouvante', 1988),
(3, 14, 'Pulp Fiction', 'Policier', 1994),
(4, 13, 'Breaking the waves', 'Drame', 1996),
(5, 13, 'Dogville', 'Drame', 2002),
(6, 12, 'Almo', 'Western', 1960),
(7, 18, 'Dangereusement votre', 'Espionnage', 1985),
(8, 19, 'Chasseur blanc coeur noir', 'Drame', 1989),
(10, 21, 'American Beauty', 'Drame', 1999);

-- --------------------------------------------------------

--
-- Structure de la table `jouer`
--

DROP TABLE IF EXISTS `jouer`;
CREATE TABLE IF NOT EXISTS `jouer` (
  `idActeur` int(11) NOT NULL,
  `idFilm` int(11) NOT NULL,
  `role` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`idActeur`,`idFilm`),
  KEY `fk_Jouer_Film` (`idFilm`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `jouer`
--

INSERT INTO `jouer` (`idActeur`, `idFilm`, `role`) VALUES
(1, 5, 'Grace'),
(2, 5, 'Tom Edison'),
(3, 4, 'Bess'),
(4, 4, 'Jan'),
(4, 5, 'Chuck'),
(5, 3, 'Vincent Vega'),
(6, 3, 'Jules Winnfield'),
(7, 3, 'Butch Coolidge'),
(8, 2, 'Beverly & Elliot'),
(9, 1, 'James Ballard'),
(10, 1, 'Helen Remington'),
(11, 1, 'Gabrielle'),
(16, 7, 'May Day'),
(19, 8, 'John Wilson'),
(20, 10, 'Lester Burnham');

-- --------------------------------------------------------

--
-- Structure de la table `personne`
--

DROP TABLE IF EXISTS `personne`;
CREATE TABLE IF NOT EXISTS `personne` (
  `idPersonne` int(11) NOT NULL,
  `nom` varchar(25) NOT NULL,
  `prenom` varchar(25) NOT NULL,
  PRIMARY KEY (`idPersonne`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `personne`
--

INSERT INTO `personne` (`idPersonne`, `nom`, `prenom`) VALUES
(1, 'Kidmane', 'Nicole'),
(2, 'Bettany', 'Paul'),
(3, 'Watson', 'Emily'),
(4, 'Skarsgard', 'Stellan'),
(5, 'Travolta', 'John'),
(6, 'Jackson', 'Samuel'),
(7, 'Willis', 'Bruce'),
(8, 'Irons', 'Jeremy'),
(9, 'Spader', 'James'),
(10, 'Hunter', 'Holly'),
(11, 'Arquette', 'Rosanna'),
(12, 'Wayne', 'John'),
(13, 'Von', 'Trier'),
(14, 'Tarantino', 'Quentin'),
(15, 'Cronenberg', 'David'),
(16, 'Mazursky', 'Paul'),
(17, 'Jones', 'Grace'),
(18, 'Glen', 'John'),
(19, 'Eastwood', 'Clint'),
(20, 'Spacey', 'Kevin'),
(21, 'Menves', 'Sam'),
(22, 'Jolie', 'Angelina');

-- --------------------------------------------------------

--
-- Structure de la table `projection`
--

DROP TABLE IF EXISTS `projection`;
CREATE TABLE IF NOT EXISTS `projection` (
  `idCinema` int(11) NOT NULL,
  `idFilm` int(11) NOT NULL,
  `jour` date NOT NULL,
  PRIMARY KEY (`idCinema`,`idFilm`,`jour`),
  KEY `fk_Projection_Film` (`idFilm`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `projection`
--

INSERT INTO `projection` (`idCinema`, `idFilm`, `jour`) VALUES
(1, 1, '1996-05-07'),
(1, 2, '1988-03-12'),
(1, 3, '1994-03-02'),
(1, 4, '1996-08-02'),
(1, 6, '1980-07-05'),
(2, 1, '1997-05-11'),
(2, 2, '1990-12-08'),
(2, 3, '1994-07-05'),
(2, 4, '1996-09-02'),
(2, 4, '1996-12-02'),
(2, 5, '2002-05-01'),
(2, 5, '2002-05-02'),
(2, 5, '2002-05-03'),
(2, 6, '2002-08-01'),
(2, 7, '1985-05-09'),
(2, 8, '1989-02-01'),
(2, 10, '2000-10-03'),
(3, 3, '1994-11-05'),
(3, 6, '1960-11-09'),
(3, 6, '1990-12-02'),
(4, 3, '1994-04-08'),
(4, 3, '1994-11-06'),
(4, 6, '2002-08-01');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `film`
--
ALTER TABLE `film`
  ADD CONSTRAINT `fk_Film_Personne` FOREIGN KEY (`idRealisateur`) REFERENCES `personne` (`idPersonne`) ON UPDATE CASCADE;

--
-- Contraintes pour la table `jouer`
--
ALTER TABLE `jouer`
  ADD CONSTRAINT `fk_Jouer_Film` FOREIGN KEY (`idFilm`) REFERENCES `film` (`idFilm`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Jouer_Personne` FOREIGN KEY (`idActeur`) REFERENCES `personne` (`idPersonne`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
