-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : jeu. 01 fév. 2024 à 15:49
-- Version du serveur : 8.0.35-0ubuntu0.22.04.1
-- Version de PHP : 8.1.2-1ubuntu2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `avion`
--

-- --------------------------------------------------------

--
-- Structure de la table `assigner`
--

CREATE TABLE `assigner` (
  `idsteward` int NOT NULL,
  `immat` int NOT NULL,
  `dateassign` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `assigner`
--

INSERT INTO `assigner` (`idsteward`, `immat`, `dateassign`) VALUES
(1, 8080852, '2021-09-01'),
(2, 50158023, '2021-09-01'),
(3, 50804405, '2021-09-01'),
(4, 50878080, '2021-09-20');

-- --------------------------------------------------------

--
-- Structure de la table `avions`
--

CREATE TABLE `avions` (
  `imat` int NOT NULL,
  `capacite` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `avions`
--

INSERT INTO `avions` (`imat`, `capacite`) VALUES
(8080852, 1000),
(50158023, 1500),
(50804405, 2500),
(50878080, 500),
(505050888, 1000);

-- --------------------------------------------------------

--
-- Structure de la table `billet`
--

CREATE TABLE `billet` (
  `reference` int NOT NULL,
  `nom` varchar(30) DEFAULT NULL,
  `heuredepart` time DEFAULT NULL,
  `heurearriver` time DEFAULT NULL,
  `idClient` int NOT NULL,
  `idvol` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `billet`
--

INSERT INTO `billet` (`reference`, `nom`, `heuredepart`, `heurearriver`, `idClient`, `idvol`) VALUES
(4044040, 'AZEFV5050VFED', NULL, NULL, 4, 508410),
(5005080, 'RFK5405D', NULL, NULL, 1, 1205050),
(5840874, 'DRKW5600', NULL, NULL, 2, 50808080);

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `id` int NOT NULL,
  `nom` varchar(30) DEFAULT NULL,
  `prenom` varchar(30) DEFAULT NULL,
  `dateNaissance` date DEFAULT NULL,
  `ville` varchar(50) DEFAULT NULL,
  `code` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`id`, `nom`, `prenom`, `dateNaissance`, `ville`, `code`) VALUES
(1, 'Tardif', 'Summer', '1946-05-29', 'Lyon', 69002),
(2, 'Beaujolie', 'Daisi', '1959-12-17', 'Levallois-perret', 92300),
(3, 'Langelier', 'Ogier', '1971-12-30', 'Villejuif', 94800),
(4, 'Brasseur', 'Cendrillon', '1967-01-10', 'Lisieux', 14100),
(5, 'Chatigny', 'Javier', '1968-05-01', 'Charenton-le-Pont', 94220);

-- --------------------------------------------------------

--
-- Structure de la table `destination`
--

CREATE TABLE `destination` (
  `code` int NOT NULL,
  `fuseau_horaire` varchar(10) DEFAULT NULL,
  `pays` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `destination`
--

INSERT INTO `destination` (`code`, `fuseau_horaire`, `pays`) VALUES
(1, 'GMT+1', 'France'),
(2, 'GMT+1', 'Algerie'),
(3, 'GMT-4', 'Bolivie'),
(4, 'GMT+8', 'Chine'),
(5, 'GMT-5', 'Colombie');

-- --------------------------------------------------------

--
-- Structure de la table `pilote`
--

CREATE TABLE `pilote` (
  `id` int NOT NULL,
  `grade` varchar(20) DEFAULT NULL,
  `datedebut` date DEFAULT NULL,
  `immat2` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `pilote`
--

INSERT INTO `pilote` (`id`, `grade`, `datedebut`, `immat2`) VALUES
(1, 'Commissaire', '1980-01-01', 50878080),
(2, 'Commissaire Colonel', '1978-05-01', 50878080);

-- --------------------------------------------------------

--
-- Structure de la table `steward`
--

CREATE TABLE `steward` (
  `id` int NOT NULL,
  `nom` varchar(30) DEFAULT NULL,
  `prenom` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `steward`
--

INSERT INTO `steward` (`id`, `nom`, `prenom`) VALUES
(1, 'Iven', 'Primeau'),
(2, 'Eloise', 'Pichette'),
(3, 'Cheney', 'Chabot'),
(4, 'Boisclair', 'Albracca');

-- --------------------------------------------------------

--
-- Structure de la table `vol`
--

CREATE TABLE `vol` (
  `num` int NOT NULL,
  `datedebut` date DEFAULT NULL,
  `datefin` date DEFAULT NULL,
  `codedesti` int NOT NULL,
  `immat3` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `vol`
--

INSERT INTO `vol` (`num`, `datedebut`, `datefin`, `codedesti`, `immat3`) VALUES
(508410, '2021-09-12', '2021-10-22', 3, 50878080),
(1205050, '2021-09-14', '2021-09-17', 1, 50158023),
(50808080, '2021-09-19', '2021-09-25', 2, 8080852);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `assigner`
--
ALTER TABLE `assigner`
  ADD PRIMARY KEY (`idsteward`,`immat`),
  ADD KEY `immat` (`immat`);

--
-- Index pour la table `avions`
--
ALTER TABLE `avions`
  ADD PRIMARY KEY (`imat`);

--
-- Index pour la table `billet`
--
ALTER TABLE `billet`
  ADD PRIMARY KEY (`reference`),
  ADD KEY `fk_1` (`idClient`),
  ADD KEY `fk_2` (`idvol`);

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `destination`
--
ALTER TABLE `destination`
  ADD PRIMARY KEY (`code`);

--
-- Index pour la table `pilote`
--
ALTER TABLE `pilote`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_3` (`immat2`);

--
-- Index pour la table `steward`
--
ALTER TABLE `steward`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `vol`
--
ALTER TABLE `vol`
  ADD PRIMARY KEY (`num`),
  ADD KEY `fk_4` (`immat3`),
  ADD KEY `fk_5` (`codedesti`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `assigner`
--
ALTER TABLE `assigner`
  ADD CONSTRAINT `assigner_ibfk_1` FOREIGN KEY (`idsteward`) REFERENCES `steward` (`id`),
  ADD CONSTRAINT `assigner_ibfk_2` FOREIGN KEY (`immat`) REFERENCES `avions` (`imat`);

--
-- Contraintes pour la table `billet`
--
ALTER TABLE `billet`
  ADD CONSTRAINT `fk_1` FOREIGN KEY (`idClient`) REFERENCES `client` (`id`),
  ADD CONSTRAINT `fk_2` FOREIGN KEY (`idvol`) REFERENCES `vol` (`num`);

--
-- Contraintes pour la table `pilote`
--
ALTER TABLE `pilote`
  ADD CONSTRAINT `fk_3` FOREIGN KEY (`immat2`) REFERENCES `avions` (`imat`);

--
-- Contraintes pour la table `vol`
--
ALTER TABLE `vol`
  ADD CONSTRAINT `fk_4` FOREIGN KEY (`immat3`) REFERENCES `avions` (`imat`),
  ADD CONSTRAINT `fk_5` FOREIGN KEY (`codedesti`) REFERENCES `destination` (`code`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
