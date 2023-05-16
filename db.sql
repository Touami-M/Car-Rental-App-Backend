-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 24, 2023 at 04:17 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tdm`
--

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `iduser` int(11) NOT NULL,
  `idcar` int(11) NOT NULL,
  `dateres` char(60) NOT NULL,
  `dateret` char(60) NOT NULL,
  `cost` float NOT NULL,
  `code_pin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `saved`
--

CREATE TABLE `saved` (
  `iduser` int(11) NOT NULL,
  `idcar` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `password` text NOT NULL,
  `name` char(50) NOT NULL,
  `telephone` int(11) NOT NULL,
  `credit_card_num` bigint(20) NOT NULL,
  `driver_license_doc` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`password`, `name`, `telephone`, `credit_card_num`, `driver_license_doc`) VALUES
('mypassword', 'John Smith', 5551234, 1234, 'ABC123');

-- --------------------------------------------------------

--
-- Table structure for table `voiture`
--

CREATE TABLE `voiture` (
  `id` int(11) NOT NULL,
  `marque` text NOT NULL,
  `model` text NOT NULL,
  `lat` double NOT NULL,
  `longitude` double NOT NULL,
  `dispo` tinyint(1) NOT NULL,
  `prix` float NOT NULL,
  `couleur` char(40) NOT NULL,
  `puissance` int(11) NOT NULL,
  `année` int(11) NOT NULL,
  `seats` int(11) NOT NULL,
  `classe` char(60) NOT NULL,
  `gearbox` char(50) NOT NULL,
  `description` text NOT NULL,
  `photo_list` varchar(100) NOT NULL,
  `photo1` varchar(100) NOT NULL,
  `photo2` varchar(100) NOT NULL,
  `photo3` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `voiture`
--

INSERT INTO `voiture` (`id`, `marque`, `model`, `lat`, `longitude`, `dispo`, `prix`, `couleur`, `puissance`, `année`, `seats`, `classe`, `gearbox`, `description`, `photo_list`, `photo1`, `photo2`, `photo3`) VALUES
(0, 'Fiat', '500', 35.878077, 18.63635, 0, 1500, 'Rouge', 90, 1985, 2, 'Hatchback', 'Manual', 'Launched as the Nuova (new) 500 in July 1957,[2] as a successor to the 500 \"Topolino\", it was an inexpensive and practical small car. Measuring 2.97 metres (9 feet 9 inches) long, and originally powered by a 479 cc two-cylinder, air-cooled engine, the 500 was 24.5 centimetres (9.6 inches) smaller than Fiat\'s 600, launched two years earlier, and is considered one of the first purpose-designed city cars.', '/images/fiat.jpg', '/images/fiat1.png', '/images/fiat2.jpg', '/images/fiat3.jpg'),
(1, 'Renault', 'Clio', 35.692733, -0.501633, 0, 3500, 'Rouge', 160, 2014, 4, 'Hatchback', 'Manual', 'The Renault Clio (/ˈkli.oʊ/) is a supermini car (B-segment), produced by French automobile manufacturer Renault. It was launched in 1990, and entered its fifth generation in 2019. The Clio has had substantial critical and commercial success, being consistently one of Europe\'s top-selling cars since its launch,[1] and it is largely credited with restoring Renault\'s reputation and stature after a difficult second half of the 1980s. The Clio is one of only two cars, the other being the Volkswagen Golf, to have been voted European Car of the Year twice, in 1991 and 2006.', '/images/clio.png', '/images/clio1.png', '/images/clio2.png', '/images/clio3.jpg'),
(2, 'Seat', 'Ibiza', 36.477079, 2.803597, 1, 3000, 'Blanc', 150, 2016, 4, 'Hatchback', 'Automatic', 'The SEAT Ibiza is a supermini car that has been manufactured by Spanish car manufacturer SEAT since 1984. It is SEAT\'s best-selling car.[2] The Ibiza is named after the Spanish island of Ibiza and was the second SEAT model to be named after a Spanish location, after the SEAT Málaga. It was introduced at the 1984 Paris Motor Show as the first car developed by SEAT as an independent company, although it was designed by SEAT in collaboration with well-known firms including Italdesign, Karmann, and Porsche.[2]', '/images/ibiza.png', '/images/ibiza1.png', '/images/ibiza2.png', '/images/ibiza3.png'),
(3, 'Mercedes', 'S-Class', 36.758496, 2.960625, 0, 6500, 'Gris', 380, 2018, 4, 'Sedan', 'Manul/Automatic', 'The Mercedes-Benz S-Class, formerly known as Sonderklasse (German for \"special class\", abbreviated as \"S-Klasse\"), is a series of full-sized luxury sedans, limousines and armored sedans produced by the German automaker Mercedes-Benz, a division of the German company Mercedes-Benz. The S-Class is the designation for top-of-the-line Mercedes-Benz models and was officially introduced in 1972 with the W116, and has remained in use ever since. The S-Class is the flagship vehicle for Mercedes-Benz.', '/images/merc.png', '/images/merc1.jpg', '/images/merc2.png', '/images/merc3.png'),
(4, 'Dacia', 'Duster', 36.911109, 7.740422, 1, 3200, 'Jaune', 140, 2015, 4, '4X4', 'Automatic', 'The Dacia Duster is a family of automobiles produced and marketed jointly by the French manufacturer Renault and its Romanian subsidiary Dacia since 2010. It is currently in its second generation, launched in the autumn of 2017. It is marketed as the Renault Duster in certain markets such as Latin America, Russia, Ukraine, Asia, the Middle East, South Africa, and New Zealand.[1] The first generation was rebadged and restyled as the Nissan Terrano in CIS countries and India.[2] It was introduced in March 2010, and is the third model of the Dacia brand based on the Logan platform, after the Sandero.', '/images/dacia.png', '/images/dacia1.jpg', '/images/dacia2.jpg', '/images/dacia3.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD KEY `reservation_ibfk_2` (`idcar`),
  ADD KEY `reservation_ibfk_3` (`iduser`);

--
-- Indexes for table `saved`
--
ALTER TABLE `saved`
  ADD UNIQUE KEY `unique_saved` (`iduser`,`idcar`),
  ADD KEY `saved_ibfk_1` (`idcar`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`telephone`);

--
-- Indexes for table `voiture`
--
ALTER TABLE `voiture`
  ADD PRIMARY KEY (`id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`idcar`) REFERENCES `voiture` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reservation_ibfk_3` FOREIGN KEY (`iduser`) REFERENCES `user` (`telephone`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `saved`
--
ALTER TABLE `saved`
  ADD CONSTRAINT `saved_ibfk_1` FOREIGN KEY (`idcar`) REFERENCES `voiture` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `saved_ibfk_2` FOREIGN KEY (`iduser`) REFERENCES `user` (`telephone`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
