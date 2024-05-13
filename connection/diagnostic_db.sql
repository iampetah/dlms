-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 04, 2024 at 07:38 AM
-- Server version: 10.11.7-MariaDB-cll-lve
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u134176240_diagnosys_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `patient_id` varchar(255) DEFAULT NULL,
  `status` enum('Pending','Approved','Reject','Paid') NOT NULL DEFAULT 'Pending',
  `appointment_date` date NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `comment` varchar(255) DEFAULT '',
  `datetime_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `appointment_services`
--

CREATE TABLE `appointment_services` (
  `appointment_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `user_id` int(11) NOT NULL,
  `position` enum('Cashier','Information Desk Officer') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`user_id`, `position`) VALUES
(4, 'Information Desk Officer'),
(13, 'Information Desk Officer'),
(14, 'Cashier'),
(29, 'Cashier');

-- --------------------------------------------------------

--
-- Table structure for table `package`
--

CREATE TABLE `package` (
  `id` int(11) NOT NULL,
  `package_name` varchar(255) NOT NULL,
  `package_price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `package`
--

INSERT INTO `package` (`id`, `package_name`, `package_price`) VALUES
(5, 'Blood Chemistry(F)', 350),
(6, 'Blood Chemistry(M)', 350),
(7, 'Blood Chemistry(Senior-F)', 300),
(8, 'Blood Chemistry(Senior-M)', 300);

-- --------------------------------------------------------

--
-- Table structure for table `package_services`
--

CREATE TABLE `package_services` (
  `id` int(11) NOT NULL,
  `package_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `package_services`
--

INSERT INTO `package_services` (`id`, `package_id`, `service_id`) VALUES
(19, 5, 38),
(20, 5, 39),
(21, 5, 40),
(22, 5, 41),
(23, 6, 38),
(24, 6, 39),
(25, 6, 43),
(26, 6, 44),
(27, 7, 38),
(28, 7, 39),
(29, 7, 40),
(30, 7, 41),
(31, 8, 38),
(32, 8, 39),
(33, 8, 43),
(34, 8, 44);

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `id` varchar(255) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `suffix` varchar(50) DEFAULT NULL,
  `middle_name` varchar(50) NOT NULL,
  `birthdate` date NOT NULL,
  `age` int(2) NOT NULL,
  `province` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `barangay` varchar(50) NOT NULL,
  `purok` varchar(50) NOT NULL,
  `subdivision` varchar(50) NOT NULL,
  `house_no` varchar(50) NOT NULL,
  `mobile_number` varchar(11) NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `gender` varchar(11) NOT NULL,
  `id_type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`id`, `first_name`, `last_name`, `suffix`, `middle_name`, `birthdate`, `age`, `province`, `city`, `barangay`, `purok`, `subdivision`, `house_no`, `mobile_number`, `image_url`, `gender`, `id_type`) VALUES
('202431414', 'SUSANA', 'VILLARMENTE', '', 'DIOQUINO', '1956-04-19', 67, 'Davao del Norte', 'City of Panabo', 'Nanyo', 'PUROK KATORAY', '', '', '09107074911', '', 'Female', NULL),
('202431415', 'GRACIANO', 'MAPUTOL JR.', NULL, '', '1967-05-12', 56, 'Davao del Norte', 'City of Panabo', 'San Vicente', 'PUROK 1', '', '', '09107074911', '', 'Male', NULL),
('202431716', 'ANITA', 'BUSCADO', '', 'BAWIN', '1939-07-26', 84, 'Davao del Norte', 'City of Panabo', 'San Francisco', 'PUROK 2-A ', '', '', '09107074911', '', 'Female', NULL),
('202431817', 'Anim', 'Buscado', '', '', '1939-02-06', 85, 'Davao del Norte', 'City of Panabo', 'San Francisco', '2', '', '', '09107074911', '', 'Female', NULL),
('202432218', 'Mario', 'Arca', '', 'N/A', '1955-01-02', 69, 'Davao del Norte', 'City of Panabo', 'New Visayas', '2', '', '', '00000000000', '', 'Male', NULL),
('2024353', 'Jeffer', 'Silva', NULL, '', '1982-02-02', 42, 'Davao del Norte', 'City of Panabo', 'Kauswagan', '14', '', '', '09107074911', '', 'Male', NULL),
('20243710', 'Editha', 'Lumanda', '', 'Tiongson', '1961-05-22', 62, 'Davao del Norte', 'Municipality of Carmen', 'Tubod', 'Tubod', '', '', '09107074911', '', 'Female', NULL),
('2024374', 'ERIC ', 'ESTOSE', '', 'LAURON', '1985-02-07', 39, 'Davao del Norte', 'City of Panabo', 'Gredu ', 'PUROK TALONG', 'LOT 12', 'BLK 7, ', '09107074911', '', 'Male', NULL),
('2024375', 'Ronaldo', 'Del Campo', '', 'Madaup', '1971-06-15', 52, 'Davao del Norte', 'City of Panabo', 'New Visayas', 'purok 14', '', '', '09107074911', '', 'Male', NULL),
('2024376', 'Maria cita', 'Almero', '', 'Laderas', '1951-06-08', 72, 'Davao del Norte', 'City of Panabo', 'Kasilak', 'Purok 5', '', '', '09107074911', '', 'Female', NULL),
('2024377', 'THELMA', 'BALANSAG', '', 'INDING', '1950-12-03', 73, 'Davao del Norte', 'Municipality of Carmen', 'Tubod', 'TUBOD', '', '', '09107074911', '', 'Female', NULL),
('2024378', 'Jaime', 'Anora', '', 'Ranalan', '1959-08-21', 64, 'Davao del Norte', 'City of Panabo', 'San Vicente', 'purok 1', '', '', '09107074911', '', 'Male', NULL),
('2024379', 'EMMA', 'JIMENEZ', '', 'LAGUNSAY', '1955-07-30', 68, 'Davao del Norte', 'City of Panabo', 'New Pandan', 'New Pandan', 'Bonifacio St', '', '09107074911', '', 'Female', NULL),
('20243811', 'SOCORRO', 'MOSQUEDA', '', 'MINERALES', '1959-06-10', 64, 'Davao del Norte', 'City of Panabo', 'San Francisco', 'PUROK A ', '', '', '09107074911', '', 'Female', NULL),
('20243812', 'Gregorio', 'Mosqueda', '', 'Orquiza', '1963-04-30', 60, 'Davao del Norte', 'City of Panabo', 'San Francisco', 'PUROK 6A', '', '', '09107074911', '', 'Male', NULL),
('20243813', 'irish', 'eumague', '', 'lustre', '1982-04-09', 0, 'Davao del Norte', 'City of Panabo', 'New Visayas', '5076 lilia homes', '', '', '09107074911', '', 'Female', NULL),
('202442016', 'Joel', 'Bangod', '', '', '1965-08-17', 58, 'Davao del Norte', 'Municipality of Carmen', 'Tubod', '3', '', '', '', '', 'Male', NULL),
('202442017', 'Armando', 'Rabanes', '', '', '1972-02-28', 52, 'Davao del Norte', 'City of Panabo', 'J.P. Laurel', '24', '', '', '', '', 'Male', NULL),
('202442018', 'Jerry', 'Enquito', '', '', '1955-03-15', 69, 'Davao del Norte', 'City of Panabo', 'Cagangohan', 'Lumboy', '', '', '00000000000', '', 'Male', NULL),
('202442019', 'Solamo', 'Benedicta ', '', '', '1953-08-21', 70, 'Davao del Norte', 'City of Panabo', 'San Vicente', '1', '', '', '00000000000', '', 'Female', NULL),
('202442020', 'Arlyn', 'Racho', '', '', '1955-09-01', 68, 'Davao del Norte', 'City of Panabo', 'New Visayas', '18', 'Villa Felisa', '', '', '', 'Female', NULL),
('202442021', 'Leoncio', 'Aporbo', '', '', '1964-01-16', 60, 'Davao del Norte', 'City of Panabo', 'San Pedro', 'Bangus', '', '', '', '', 'Male', NULL),
('202442022', 'Norma', 'Isidro', '', '', '1962-07-28', 61, 'Davao del Norte', 'City of Panabo', 'New Malitbog', '1-B', '', '', '00000000000', '', 'Female', NULL),
('202442023', 'Jimmy', 'Embalsado', '', 'M.', '1964-04-20', 60, 'Davao del Norte', 'City of Panabo', 'Salvacion', '7', '', '', '', '', 'Male', NULL),
('202442024', 'George', 'Ornido', '', '', '1952-01-04', 72, 'Davao del Norte', 'City of Panabo', 'New Visayas', '15', '', '', '', '', 'Male', NULL),
('202442025', 'John', 'Siladan', '', '', '1962-09-12', 61, 'Davao del Norte', 'City of Panabo', 'San Francisco', '6-B', '', '', '', '', 'Male', NULL),
('202442026', 'Lito', 'Aballe', '', 'G.', '1953-10-23', 70, 'Davao del Norte', 'City of Panabo', 'San Vicente', '15', 'Panales', '', '', '', 'Male', NULL),
('202442027', 'Rosalina', 'Lascuña', '', 'S', '1971-10-22', 52, 'Davao del Norte', 'City of Panabo', 'Cagangohan', 'Mangga', '', '', '', '', 'Female', NULL),
('202442028', 'Servando', 'Navaluna', '', 'M.', '1960-01-20', 64, 'Davao del Norte', 'City of Panabo', 'Santo Niño', 'Durian', '', '', '', '', 'Male', NULL),
('202442029', 'Allen', 'Abala', '', 'P', '1960-06-15', 63, 'Davao del Norte', 'City of Panabo', 'New Malitbog', '4', '', '', '', '', 'Female', NULL),
('202442030', 'Lim', 'Fortes', '', 'G.', '1955-02-18', 69, 'Davao del Norte', 'City of Panabo', 'Salvacion', '6', '', '', '', '', 'Male', NULL),
('202442031', 'Marimar', 'Menorias', '', '', '1954-06-23', 69, 'Davao del Norte', 'City of Panabo', 'San Francisco', '5', '', '', '', '', 'Female', NULL),
('202442032', 'Joel', 'Montealto', '', '', '1964-10-04', 59, 'Davao del Norte', 'City of Panabo', 'San Vicente', '5', '', '', '', '', 'Male', NULL),
('202442033', 'Jaime', 'Bacalso', '', 'D', '1960-05-07', 63, 'Davao del Norte', 'City of Panabo', 'San Vicente', '1', '', '', '', '', 'Male', NULL),
('202442034', 'Eldebrando', 'Lamsin', '', 'R', '1966-03-20', 58, 'Davao del Norte', 'City of Panabo', 'San Francisco', '4', '', '', '', '', 'Male', NULL),
('202442035', 'Lilia', 'Prado', '', 'H', '1965-06-10', 58, 'Davao del Norte', 'City of Panabo', 'New Visayas', '15', '', '', '', '', 'Female', NULL),
('202442036', 'Esterlita', 'Bagotsay', '', 'A.', '1963-07-07', 60, 'Davao del Norte', 'City of Panabo', 'San Francisco', '8', '', '', '', '', 'Female', NULL),
('202442037', 'Lolita', 'Benitez', '', 'B.', '1963-04-12', 61, 'Davao del Norte', 'City of Panabo', 'Lower Panaga', '3', '', '', '', '', 'Female', NULL),
('202442738', 'ABEGAIL', 'SABUS', NULL, '', '1999-09-27', 24, 'Davao del Norte', 'City of Panabo', 'Salvacion', '1', 'Cadena de amor', 'Prk 1', '09372899102', '', 'Female', NULL),
('202442839', 'Christian', 'Lopez', '', '', '1999-08-07', 24, 'Davao del Norte', 'City of Panabo', 'San Francisco', '9', '', '', '09700664642', '', 'Male', NULL),
('202442940', 'Dexter George ', 'Cunanan', '', '', '1998-09-11', 25, 'Davao del Norte', 'City of Panabo', 'Santo Niño', 'Mangga ', '', '', '09852918780', '', 'Male', NULL),
('20245141', 'Dioly', 'Abrazaldo', '', 'Baldapan', '1996-04-19', 28, 'Davao del Norte', 'City of Panabo', 'New Pandan', 'Alakta', 'New Pandan', '', '09467398481', '', 'Male', NULL),
('20245142', 'Divina Corazon', 'Merquita', '', 'Sagetarios', '1995-12-08', 28, 'Davao del Norte', 'City of Panabo', 'New Pandan', 'Alakta', 'New Pandan', '', '09467398481', '', 'Female', NULL),
('20245143', 'Jose', 'Bisnar', '', 'T', '1996-06-03', 27, 'Davao del Norte', 'City of Panabo', 'San Francisco', 'Purok 1', '', '', '', '', 'Male', NULL),
('20245144', 'Vilma', 'Anajao', '', 'R', '1997-04-29', 27, 'Davao del Norte', 'City of Panabo', 'Santo Niño', 'Purok 5', '', '', '', '', 'Female', NULL),
('20245145', 'Maricho', 'Sumile', '', 'S', '1987-12-03', 36, 'Davao del Norte', 'City of Panabo', 'Kasilak', 'Purok 2', '', '', '', '', 'Female', NULL),
('20245146', 'Leonarda', 'Fernandez', '', 'F', '1950-01-15', 74, 'Davao del Norte', 'City of Panabo', 'Sindaton', 'Purok 7', '', '', '', '', 'Female', NULL),
('20245147', 'Geneasa', 'Tacqos', NULL, 'A', '1953-08-12', 70, 'Davao del Norte', 'City of Panabo', 'Santo Niño', 'Purok 3', '', '', '', '', 'Female', NULL),
('20245148', 'Victor', 'Mabaylan', 'Jr.', 'N', '1961-06-02', 62, 'Davao del Norte', 'City of Panabo', 'J.P. Laurel', 'Purok 4', '', '', '', '', 'Male', NULL),
('20245149', 'Sixto', 'Luzon', '', 'E', '1976-09-02', 47, 'Davao del Norte', 'City of Panabo', 'Cacao', 'Purok 9', '', '', '', '', 'Male', NULL),
('20245150', 'Elsie', 'Añora', '', 'B', '1959-03-20', 65, 'Davao del Norte', 'City of Panabo', 'San Vicente', 'Purok 2', '', '', '', '', 'Female', NULL),
('20245151', 'Mateo', 'Quisay', '', 'C', '1966-10-12', 57, 'Davao del Norte', 'City of Panabo', 'San Pedro', 'Purok Dugso', '', '', '', '', 'Male', NULL),
('20245152', 'Ronaldo', 'Bustamante', '', 'M', '1981-09-24', 42, 'Davao del Norte', 'City of Panabo', 'Southern Davao', 'Purok Almante', '', '', '', '', 'Male', NULL),
('20245153', 'Santiago', 'De Jesus', '', 'A', '1973-08-22', 50, 'Davao del Norte', 'City of Panabo', 'Gredu ', 'Purok Raddish', '', '', '', '', 'Male', NULL),
('20245154', 'Estrillita', 'Galigao', '', 'T', '1970-02-02', 54, 'Davao del Norte', 'City of Panabo', 'Datu Abdul Dadia', 'Purok Sili', '', '', '', '', 'Female', NULL),
('20245155', 'Laurence', 'Waje', NULL, 'D', '1997-02-01', 27, 'Davao del Norte', 'City of Panabo', 'San Vicente', '1', '', '', '', '', 'Male', NULL),
('20245156', 'Fe', 'Bella', '', 'A', '1958-11-22', 65, 'Davao del Norte', 'City of Panabo', 'San Vicente', 'Purok 1', '', '', '', '', 'Female', NULL),
('20245157', 'Raul', 'Villanueva ', '', 'C', '1961-12-19', 62, 'Davao del Norte', 'City of Panabo', 'Salvacion', 'Purok 1', '', '', '', '', 'Male', NULL),
('20245158', 'francisco', 'Tranquilan', '', 'S', '1964-03-18', 60, 'Davao del Norte', 'City of Panabo', 'Gredu ', 'Purok Nangka', '', '', '', '', 'Male', NULL),
('20245159', 'Talenda', 'Capin', '', 'A', '1970-05-24', 53, 'Davao del Norte', 'City of Panabo', 'New Pandan', 'Purok Alaska', '', '', '', '', 'Female', NULL),
('20245161', 'Boyet', 'Basnello', '', 'M', '1975-12-05', 48, 'Davao del Norte', 'City of Panabo', 'Southern Davao', 'Purok 5B ', '', '', '', '', 'Male', NULL),
('20245162', 'Ivy', 'Andrada', '', 'B', '1974-02-13', 50, 'Davao del Norte', 'City of Panabo', 'Southern Davao', 'Purok 5A', '', '', '', '', 'Female', NULL),
('20245163', 'Aurora', 'Jumawan', '', 'O', '1960-03-15', 64, 'Davao del Norte', 'City of Panabo', 'Salvacion', 'Purok 6 ', '', '', '', '', 'Female', NULL),
('20245164', 'Ruel', 'Capule', '', 'S', '1974-03-24', 50, 'Davao del Norte', 'City of Panabo', 'Santo Niño', 'Purok 2 carmen', '', '', '', '', 'Male', NULL),
('20245165', 'Renato', 'Chao', '', 'C', '1962-11-07', 61, 'Davao del Norte', 'City of Panabo', 'San Vicente', 'Purok 6 ', '', '', '', '', 'Male', NULL),
('20245166', 'Gideonillo', 'Margate', '', 'C', '1975-05-14', 48, 'Davao del Norte', 'City of Panabo', 'San Vicente', 'Purok 27', '', '', '', '', 'Male', NULL),
('20245167', 'Pstrella', 'Tolibas', '', 'R', '1961-06-22', 62, 'Davao del Norte', 'City of Panabo', 'Santo Niño', 'Purok ubas', '', '', '', '', 'Female', NULL),
('20245168', 'Alex', 'Belmores', '', 'S', '1970-02-18', 54, 'Davao del Norte', 'City of Panabo', 'Santo Niño', 'Purok ubas', '', '', '', '', 'Male', NULL),
('20245169', 'Jodita', 'Montero', '', 'M', '1969-09-28', 54, 'Davao del Norte', 'City of Panabo', 'San Vicente', 'Purok 18', '', '', '', '', 'Female', NULL),
('20245170', 'Hannah Ruth', 'Liong', '', 'P', '1987-04-02', 37, 'Davao del Norte', 'City of Panabo', 'San Vicente', 'Purok 3', '', '', '', '', 'Female', NULL),
('20245171', 'Jomarie', 'Abad', '', '', '2001-10-24', 22, 'Davao del Norte', 'City of Panabo', 'San Vicente', '18', '', '', '', 'user_id_1714546863_IMG_20240501_093028_580.jpg', 'Male', 'Drivers License'),
('20245472', 'Arturo', 'Tade', '', 'J', '1945-03-16', 79, 'Davao del Norte', 'City of Panabo', 'Quezon', 'Purok 1 ', '', '', '', '', 'Male', NULL),
('20245473', 'Rosalie', 'Bayot', '', 'L', '1964-03-17', 60, 'Davao del Norte', 'City of Panabo', 'San Pedro', 'Purok 1 Bangus', '', '', '', '', 'Female', NULL),
('20245474', 'Emilyn', 'Olvina', '', 'P.', '1962-03-28', 62, 'Davao del Norte', 'City of Panabo', 'Southern Davao', 'Purok Milagros Village', '', '', '', '', 'Female', NULL),
('20245475', 'Gorgonia', 'Delos Reyes', '', 'C', '1945-05-01', 79, 'Davao del Norte', 'City of Panabo', 'Southern Davao', 'Purok 1 SUBD', '', '', '', '', 'Female', NULL);

--
-- Triggers `patient`
--
DELIMITER $$
CREATE TRIGGER `before_patient_insert` BEFORE INSERT ON `patient` FOR EACH ROW BEGIN
  DECLARE next_id INT DEFAULT 1;  
  
  SET NEW.id = CONCAT(
    YEAR(CURDATE()), 
    MONTH(CURDATE()), 
    DAY(CURDATE()), 
    (SELECT COUNT(*) FROM patient));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `id` int(11) NOT NULL,
  `account_number` varchar(255) DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `insurance` varchar(255) DEFAULT '',
  `company` varchar(255) DEFAULT '',
  `date_paid` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`id`, `account_number`, `amount`, `insurance`, `company`, `date_paid`) VALUES
(1, '', 1000.00, '', '', '2024-02-29 22:22:39'),
(2, '', 500.00, '', '', '2024-02-29 22:29:29'),
(3, '', 50.00, '', '', '2024-02-29 22:48:43'),
(4, '', 500.00, '', '', '2024-02-29 23:00:30'),
(5, '', 200.00, '', '', '2024-02-29 23:19:19'),
(6, '', 100.00, '', '', '2024-02-29 23:19:53'),
(7, '5555', 200.00, 'TESDA', 'TADECO', '2024-02-29 23:20:17'),
(8, '', 400.00, '', '', '2024-02-29 23:20:42'),
(9, '', 330.00, '', '', '2024-02-29 23:21:00'),
(10, '5555', 300.00, 'TESDA', 'TADECO', '2024-03-01 07:49:45'),
(11, '5555', 500.00, 'TESDA', 'TADECO', '2024-03-01 14:08:30'),
(12, '', 500.00, '', '', '2024-03-04 07:30:32'),
(13, '', 200.00, '', '', '2024-03-04 08:15:05'),
(14, '', 350.00, '', '', '2024-03-04 08:20:05'),
(15, '', 100.00, '', '', '2024-03-05 05:30:27'),
(16, '', 1000.00, '', '', '2024-03-05 05:43:22'),
(17, '', 500.00, '', '', '2024-03-06 02:25:26'),
(18, '', 1000.00, '', '', '2024-03-07 04:07:17'),
(19, '', 1000.00, '', '', '2024-03-07 04:07:17'),
(20, '', 500.00, '', '', '2024-03-07 04:11:50'),
(21, '', 500.00, '', '', '2024-03-07 04:16:08'),
(22, '', 500.00, '', '', '2024-03-07 04:25:05'),
(23, '', 500.00, '', '', '2024-03-07 04:27:48'),
(24, '', 1000.00, '', '', '2024-03-07 04:31:08'),
(25, '', 500.00, '', '', '2024-03-07 04:39:59'),
(26, '', 1000.00, '', '', '2024-03-07 04:43:12'),
(27, '', 500.00, '', '', '2024-03-08 06:15:12'),
(28, '', 500.00, '', '', '2024-03-08 06:17:58'),
(29, '', 500.00, '', '', '2024-03-08 06:17:58'),
(30, '', 500.00, '', '', '2024-03-08 06:17:58'),
(31, '', 500.00, '', '', '2024-03-08 06:17:58'),
(32, '', 500.00, '', '', '2024-03-08 06:17:58'),
(33, '', 500.00, '', '', '2024-03-08 06:17:58'),
(34, '', 500.00, '', '', '2024-03-08 06:23:24'),
(35, '', 500.00, '', '', '2024-03-14 01:49:38'),
(36, '', 300.00, '', '', '2024-04-20 06:31:32'),
(37, '', 50.00, '', '', '2024-04-20 06:41:27'),
(38, '', 300.00, '', '', '2024-04-20 06:42:11'),
(39, '', 500.00, '', '', '2024-04-20 07:19:48'),
(40, '', 500.00, '', '', '2024-04-20 07:25:26'),
(41, '', 50.00, '', '', '2024-04-20 07:29:14'),
(42, '', 500.00, '', '', '2024-04-20 07:34:37'),
(43, '', 50.00, '', '', '2024-04-20 07:36:09'),
(44, '', 50.00, '', '', '2024-04-20 07:36:15'),
(45, '', 50.00, '', '', '2024-04-20 07:36:16'),
(46, '', 50.00, '', '', '2024-04-20 07:36:17'),
(47, '', 100.00, '', '', '2024-04-20 07:37:27'),
(48, '', 300.00, '', '', '2024-04-20 07:41:30'),
(49, '', 1000.00, '', '', '2024-04-20 07:48:03'),
(50, '', 1000.00, '', '', '2024-04-20 07:48:12'),
(51, '', 1000.00, '', '', '2024-04-20 07:48:13'),
(52, '', 100.00, '', '', '2024-04-20 07:49:44'),
(53, '', 100.00, '', '', '2024-04-20 07:50:45'),
(54, '', 500.00, '', '', '2024-04-20 07:54:03'),
(55, '', 300.00, '', '', '2024-04-20 07:58:21'),
(56, '', 300.00, '', '', '2024-04-20 08:01:39'),
(57, '', 500.00, '', '', '2024-04-20 08:02:41'),
(58, '', 100.00, '', '', '2024-04-20 08:04:22'),
(59, '', 100.00, '', '', '2024-04-20 08:04:29'),
(60, '', 500.00, '', '', '2024-04-20 08:23:58'),
(61, '', 500.00, '', '', '2024-04-20 08:25:54'),
(62, '', 1000.00, '', '', '2024-04-20 08:26:46'),
(63, '', 100.00, '', '', '2024-04-20 08:29:06'),
(64, '', 1000.00, '', '', '2024-04-20 08:34:41'),
(65, '', 500.00, '', '', '2024-04-20 08:35:51'),
(66, '', 500.00, '', '', '2024-04-20 08:38:56'),
(67, '', 400.00, '', '', '2024-04-28 06:08:33'),
(68, '', 400.00, '', '', '2024-04-28 06:08:48'),
(69, '', 500.00, '', '', '2024-04-28 06:09:39'),
(70, '', 500.00, '', '', '2024-04-28 06:09:42'),
(71, '', 350.00, '', '', '2024-05-01 02:56:04'),
(72, '', 500.00, '', '', '2024-05-01 03:01:09'),
(73, '', 500.00, '', '', '2024-05-01 08:13:09'),
(74, '', 500.00, '', '', '2024-05-01 08:14:50'),
(75, '', 500.00, '', '', '2024-05-01 08:14:53'),
(76, '', 1000.00, '', '', '2024-05-01 08:15:46'),
(77, '', 100.00, '', '', '2024-05-01 08:16:58'),
(78, '', 200.00, '', '', '2024-05-01 08:18:14'),
(79, '', 500.00, '', '', '2024-05-01 08:19:24'),
(80, '', 500.00, '', '', '2024-05-01 08:20:55'),
(81, '', 1000.00, '', '', '2024-05-01 08:22:07'),
(82, '', 1000.00, '', '', '2024-05-01 08:23:16'),
(83, '', 100.00, '', '', '2024-05-01 08:23:58'),
(84, '', 500.00, '', '', '2024-05-01 08:25:15'),
(85, '', 200.00, '', '', '2024-05-01 09:16:06'),
(86, '', 200.00, '', '', '2024-05-01 09:16:08'),
(87, '', 500.00, '', '', '2024-05-01 09:16:44'),
(88, '', 500.00, '', '', '2024-05-01 09:17:36'),
(89, '', 1000.00, '', '', '2024-05-01 09:18:43'),
(90, '', 500.00, '', '', '2024-05-01 09:19:57'),
(91, '', 500.00, '', '', '2024-05-01 09:21:00'),
(92, '', 300.00, '', '', '2024-05-01 09:22:03'),
(93, '', 500.00, '', '', '2024-05-01 09:22:59'),
(94, '', 1000.00, '', '', '2024-05-01 09:23:51'),
(95, '', 100.00, '', '', '2024-05-01 09:25:01'),
(96, '', 100.00, '', '', '2024-05-04 05:58:30'),
(97, '', 500.00, '', '', '2024-05-04 05:59:05'),
(98, '', 100.00, '', '', '2024-05-04 06:02:29'),
(99, '', 500.00, '', '', '2024-05-04 06:03:12'),
(100, '', 100.00, '', '', '2024-05-04 06:14:07'),
(101, '', 500.00, '', '', '2024-05-04 06:14:48'),
(102, '', 100.00, '', '', '2024-05-04 06:15:21'),
(103, '', 1000.00, '', '', '2024-05-04 06:16:27'),
(104, '', 500.00, '', '', '2024-05-04 06:17:16'),
(105, '', 500.00, '', '', '2024-05-04 06:19:15'),
(106, '', 500.00, '', '', '2024-05-04 06:20:19'),
(107, '', 500.00, '', '', '2024-05-04 06:21:06'),
(108, '', 500.00, '', '', '2024-05-04 06:23:23'),
(109, '', 100.00, '', '', '2024-05-04 06:24:11'),
(110, '', 100.00, '', '', '2024-05-04 06:24:12'),
(111, '', 500.00, '', '', '2024-05-04 06:26:39'),
(112, '', 500.00, '', '', '2024-05-04 06:28:00'),
(113, '', 500.00, '', '', '2024-05-04 06:29:54');

-- --------------------------------------------------------

--
-- Table structure for table `request`
--

CREATE TABLE `request` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `patient_id` varchar(255) DEFAULT NULL,
  `status` enum('Pending','Approved','Reject','Paid') NOT NULL DEFAULT 'Pending',
  `request_date` datetime NOT NULL DEFAULT current_timestamp(),
  `total` decimal(10,2) NOT NULL,
  `comment` varchar(255) DEFAULT '',
  `payment` int(11) DEFAULT NULL,
  `result_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `request`
--

INSERT INTO `request` (`id`, `user_id`, `patient_id`, `status`, `request_date`, `total`, `comment`, `payment`, `result_date`) VALUES
(20, 14, '2024353', 'Paid', '2024-03-05 07:50:22', 550.00, '', 16, '2024-03-05 09:22:20'),
(22, 13, '2024374', 'Paid', '2024-03-05 08:07:17', 350.00, '', 19, '2024-03-05 09:40:03'),
(23, 13, '2024375', 'Paid', '2024-03-05 08:15:51', 350.00, '', 20, '2024-03-05 09:55:38'),
(24, 13, '2024376', 'Paid', '2024-03-05 08:22:08', 350.00, '', 21, '2024-03-05 10:04:38'),
(25, 13, '2024377', 'Paid', '2024-03-05 08:35:05', 350.00, '', 22, '2024-03-05 10:12:37'),
(26, 13, '2024378', 'Paid', '2024-03-05 08:47:48', 350.00, '', 23, '2024-03-05 10:28:25'),
(27, 13, '2024379', 'Paid', '2024-03-05 08:58:08', 350.00, '', 24, '2024-03-05 10:39:42'),
(28, 13, '2024379', 'Paid', '2024-03-05 09:06:59', 350.00, '', 25, '2024-03-05 10:55:34'),
(30, 13, '20243710', 'Paid', '2024-03-05 09:15:12', 350.00, '', 26, '2024-03-05 11:04:44'),
(31, 13, '20243811', 'Paid', '2024-03-05 09:28:12', 300.00, '', 27, '2024-03-05 11:18:43'),
(32, 13, '20243812', 'Paid', '2024-03-05 09:37:58', 300.00, '', 33, '2024-03-05 11:39:22'),
(33, 13, '20243813', 'Paid', '2024-03-05 09:49:24', 350.00, '', 34, '2024-03-05 11:50:10'),
(35, 13, '202431414', 'Paid', '2024-03-05 09:58:38', 300.00, '', 35, '2024-03-05 12:50:08'),
(39, 4, '202431716', 'Paid', '2024-03-05 10:10:11', 300.00, '', 38, '2024-03-05 13:10:05'),
(41, 4, '202432218', 'Paid', '2024-03-05 10:22:32', 550.00, '', 36, '2024-03-05 13:29:50'),
(42, 4, '202442016', 'Paid', '2024-03-05 10:41:27', 50.00, '', 37, '2024-03-05 13:50:11'),
(43, 4, '202442017', 'Paid', '2024-03-05 11:03:40', 50.00, '', 59, '2024-03-05 14:07:29'),
(44, 4, '202442018', 'Paid', '2024-03-05 11:18:28', 300.00, '', 55, '2024-03-05 14:15:57'),
(45, 4, '202442019', 'Paid', '2024-03-05 11:40:14', 50.00, '', 41, '2024-03-05 14:33:02'),
(46, 4, '202442020', 'Paid', '2024-03-05 01:03:48', 300.00, '', 39, '2024-03-05 14:50:07'),
(47, 4, '202442021', 'Paid', '2024-03-05 01:08:26', 300.00, '', 40, '2024-03-05 15:11:44'),
(48, 4, '202442022', 'Paid', '2024-03-05 01:20:13', 300.00, '', 51, '2024-03-05 15:24:45'),
(49, 4, '202442023', 'Paid', '2024-03-05 01:41:30', 300.00, '', 48, '2024-03-05 15:46:26'),
(50, 4, '202442024', 'Paid', '2024-03-05 02:03:37', 300.00, '', 42, '2024-03-05 16:04:46'),
(51, 4, '202442025', 'Paid', '2024-03-05 02:28:27', 50.00, '', 47, '2024-03-05 16:28:14'),
(52, 4, '202442026', 'Paid', '2024-03-06 07:36:17', 50.00, '', 46, '2024-05-04 05:44:46'),
(53, 4, '202442027', 'Paid', '2024-03-06 07:54:03', 350.00, '', 54, '2024-05-01 07:18:09'),
(54, 4, '2024378', 'Paid', '2024-03-06 07:50:45', 50.00, '', 53, '2024-05-04 05:46:57'),
(56, 4, '202442028', 'Paid', '2024-05-04 05:59:05', 100.00, '', 97, '2024-05-04 04:29:49'),
(57, 4, '202442029', 'Paid', '2024-03-06 08:02:41', 300.00, '', 57, '2024-05-01 07:23:50'),
(58, 4, '202442030', 'Paid', '2024-03-06 08:01:39', 300.00, '', 56, '2024-05-01 07:27:08'),
(59, 4, '202442031', 'Paid', '2024-03-06 08:38:56', 300.00, '', 66, '2024-05-01 07:28:48'),
(60, 4, '202442032', 'Paid', '2024-03-06 08:25:54', 350.00, '', 61, '2024-05-01 07:30:12'),
(61, 4, '202442033', 'Paid', '2024-03-06 08:23:58', 300.00, '', 60, '2024-05-01 07:32:09'),
(62, 4, '202442034', 'Paid', '2024-03-06 08:26:46', 350.00, '', 62, '2024-05-01 07:33:25'),
(63, 4, '202442035', 'Paid', '2024-03-06 08:29:06', 50.00, '', 63, '2024-05-04 04:31:29'),
(64, 4, '202442036', 'Paid', '2024-03-06 08:35:51', 300.00, '', 65, '2024-05-01 07:35:08'),
(65, 4, '202442037', 'Paid', '2024-03-06 08:34:41', 300.00, '', 64, '2024-05-01 07:37:02'),
(66, 18, '202442738', 'Paid', '2024-03-06 06:09:42', 350.00, '', 70, '2024-05-01 07:39:00'),
(68, NULL, '202442839', 'Paid', '2024-03-07 06:08:48', 350.00, '', 68, '2024-05-01 07:41:03'),
(69, 4, '202431415', 'Paid', '2024-03-07 02:56:04', 350.00, '', 71, '2024-05-01 07:42:55'),
(70, 4, '202431817', 'Paid', '2024-03-07 03:01:09', 300.00, '', 72, '2024-05-01 07:44:33'),
(71, 19, '202442940', 'Paid', '2024-05-04 06:14:07', 50.00, '', 100, NULL),
(72, 26, '20245141', 'Paid', '2024-05-04 06:14:48', 50.00, '', 101, NULL),
(73, 27, '20245142', 'Paid', '2024-05-04 06:15:21', 50.00, '', 102, NULL),
(74, 4, '20245143', 'Paid', '2024-05-01 08:16:58', 100.00, '', 77, '2024-05-04 05:48:54'),
(75, 4, '20245144', 'Paid', '2024-05-04 06:16:27', 600.00, '', 103, NULL),
(76, 4, '20245145', 'Paid', '2024-05-01 08:19:24', 350.00, '', 79, '2024-05-04 03:38:31'),
(77, 4, '20245146', 'Paid', '2024-05-01 08:20:55', 300.00, '', 80, '2024-05-04 03:48:04'),
(78, 4, '20245147', 'Paid', '2024-05-01 08:22:07', 550.00, '', 81, '2024-05-04 03:51:41'),
(79, 4, '20245148', 'Paid', '2024-05-01 08:23:16', 300.00, '', 82, '2024-05-04 03:53:43'),
(80, 4, '20245149', 'Paid', '2024-05-01 08:23:58', 50.00, '', 83, '2024-05-04 05:51:25'),
(81, 4, '20245150', 'Paid', '2024-05-01 08:25:15', 300.00, '', 84, '2024-05-04 03:55:24'),
(82, 4, '20245151', 'Paid', '2024-05-01 09:16:08', 100.00, '', 86, NULL),
(83, 4, '20245152', 'Paid', '2024-05-01 09:16:44', 100.00, '', 87, '2024-05-04 05:53:45'),
(84, 4, '20245153', 'Paid', '2024-05-01 09:17:36', 350.00, '', 88, '2024-05-04 03:56:52'),
(85, 4, '20245154', 'Paid', '2024-05-01 09:18:43', 350.00, '', 89, '2024-05-04 03:58:34'),
(86, 28, '20245155', 'Paid', '2024-05-01 09:19:57', 100.00, '', 90, NULL),
(87, 4, '20245156', 'Paid', '2024-05-01 09:21:00', 150.00, '', 91, '2024-05-04 05:57:11'),
(88, 4, '20245157', 'Paid', '2024-05-01 09:22:03', 300.00, '', 92, '2024-05-04 04:00:05'),
(89, 4, '20245158', 'Paid', '2024-05-01 09:22:59', 300.00, '', 93, '2024-05-04 04:01:35'),
(90, 4, '20245159', 'Paid', '2024-05-01 09:23:51', 100.00, '', 94, NULL),
(92, 4, '20245161', 'Paid', '2024-05-04 05:58:30', 100.00, '', 96, NULL),
(93, 4, '20245161', 'Paid', '2024-05-04 06:02:29', 100.00, '', 98, NULL),
(94, 4, '20245162', 'Paid', '2024-05-04 06:03:12', 350.00, '', 99, NULL),
(95, 4, '20245163', 'Paid', '2024-05-04 06:17:16', 300.00, '', 104, NULL),
(96, 4, '202442023', 'Paid', '2024-05-04 06:19:15', 150.00, '', 105, NULL),
(97, 4, '20245164', 'Paid', '2024-05-04 06:20:19', 250.00, '', 106, NULL),
(98, 4, '20245165', 'Paid', '2024-05-04 06:21:06', 150.00, '', 107, NULL),
(99, 4, '20245166', 'Paid', '2024-05-04 06:23:23', 150.00, '', 108, NULL),
(100, 4, '20245167', 'Paid', '2024-05-04 06:24:12', 100.00, '', 110, NULL),
(101, 4, '20245168', 'Paid', '2024-05-04 06:26:39', 150.00, '', 111, NULL),
(102, 4, '20245169', 'Paid', '2024-05-04 06:28:00', 350.00, '', 112, NULL),
(103, 4, '20245170', 'Paid', '2024-05-04 06:29:54', 250.00, '', 113, NULL),
(104, 30, '20245171', 'Pending', '2024-03-11 07:01:03', 0.00, '', NULL, NULL),
(105, 4, '20245472', 'Pending', '2024-05-04 02:59:35', 50.00, '', NULL, NULL),
(106, 29, '20245473', 'Pending', '2024-05-04 03:14:38', 700.00, '', NULL, NULL),
(107, 29, '20245473', 'Pending', '2024-05-04 03:14:38', 700.00, '', NULL, NULL),
(108, 29, '20245474', 'Pending', '2024-05-04 03:23:11', 50.00, '', NULL, NULL),
(109, 29, '20245475', 'Pending', '2024-05-04 03:29:45', 200.00, '', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `request_result`
--

CREATE TABLE `request_result` (
  `id` int(11) NOT NULL,
  `request_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `result` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `request_result`
--

INSERT INTO `request_result` (`id`, `request_id`, `service_id`, `name`, `result`) VALUES
(99, 20, 38, 'result', '5.63'),
(100, 20, 39, 'result', '4.08'),
(101, 20, 43, 'result', '271.15'),
(102, 20, 44, 'result', '72.30'),
(103, 22, 38, 'result', '4.16'),
(104, 22, 39, 'result', '3.70'),
(105, 22, 43, 'result', '433.36'),
(106, 22, 44, 'result', '67.78'),
(107, 23, 38, 'result', '5.23'),
(108, 23, 39, 'result', '4.80'),
(109, 23, 43, 'result', '316.92'),
(110, 23, 44, 'result', '476.63'),
(111, 24, 38, 'result', '4.20'),
(112, 24, 39, 'result', '4.49'),
(113, 24, 40, 'result', '379.55'),
(114, 24, 41, 'result', '62.25'),
(115, 25, 38, 'result', '6.73'),
(116, 25, 39, 'result', '4.71'),
(117, 25, 40, 'result', '439.88'),
(118, 25, 41, 'result', '84.35'),
(119, 26, 38, 'result', '7.13'),
(120, 26, 39, 'result', '4.22'),
(121, 26, 43, 'result', '234.65'),
(122, 26, 44, 'result', '67.40'),
(123, 27, 38, 'result', '5.91'),
(124, 27, 39, 'result', '5.44'),
(125, 27, 40, 'result', '294.99'),
(126, 27, 41, 'result', '72.73'),
(127, 30, 38, 'result', '15.39'),
(128, 30, 39, 'result', '4.04'),
(129, 30, 40, 'result', '304.30'),
(130, 30, 41, 'result', '72.44'),
(131, 31, 38, 'result', '4.93'),
(132, 31, 39, 'result', '3.51'),
(133, 31, 40, 'result', '258.78'),
(134, 31, 41, 'result', '61.96'),
(135, 32, 38, 'result', '5.85'),
(136, 32, 39, 'result', '5.02'),
(137, 32, 43, 'result', '285.68'),
(138, 32, 44, 'result', '69.02'),
(139, 33, 38, 'result', '3.10'),
(140, 33, 39, 'result', '2.93'),
(141, 33, 40, 'result', '240.40'),
(142, 33, 41, 'result', '51.33'),
(143, 28, 38, 'result', '4.51'),
(144, 28, 39, 'result', '3.30'),
(145, 28, 40, 'result', '128.90'),
(146, 28, 41, 'result', '69.43'),
(147, 35, 38, 'result', '5.09'),
(148, 35, 39, 'result', '4.16'),
(149, 35, 40, 'result', '348.45'),
(150, 35, 41, 'result', '88.73'),
(151, 39, 38, 'result', '4.95'),
(152, 39, 39, 'result', '4.20'),
(153, 39, 40, 'result', '377.65'),
(154, 39, 41, 'result', '84.96'),
(155, 41, 38, 'result', '3.9'),
(156, 41, 39, 'result', '5.2'),
(157, 41, 43, 'result', '2.4'),
(158, 41, 44, 'result', '0.5'),
(159, 44, 38, 'result', '4.20'),
(160, 44, 39, 'result', '3.00'),
(161, 44, 43, 'result', '300'),
(162, 44, 44, 'result', '90'),
(163, 46, 38, 'result', '4.60'),
(164, 46, 39, 'result', '3.80'),
(165, 46, 40, 'result', '350'),
(166, 46, 41, 'result', '85'),
(167, 47, 38, 'result', '5.50'),
(168, 47, 39, 'result', '3.70'),
(169, 47, 43, 'result', '380'),
(170, 47, 44, 'result', '95'),
(171, 48, 38, 'result', '4.80'),
(172, 48, 39, 'result', '3.20'),
(173, 48, 40, 'result', '380'),
(174, 48, 41, 'result', '80'),
(175, 49, 38, 'result', '4.20'),
(176, 49, 39, 'result', '3.00'),
(177, 49, 43, 'result', '350'),
(178, 49, 44, 'result', '90'),
(179, 50, 38, 'result', '4.90'),
(180, 50, 39, 'result', '4.00'),
(181, 50, 43, 'result', '420'),
(182, 50, 44, 'result', '115'),
(183, 53, 38, 'result', '4.20'),
(184, 53, 39, 'result', '3.70'),
(185, 53, 40, 'result', '250'),
(186, 53, 41, 'result', '85'),
(187, 54, 38, 'result', '4.85'),
(188, 54, 39, 'result', '3.20'),
(189, 54, 43, 'result', '250'),
(190, 54, 44, 'result', '95'),
(191, 57, 38, 'result', '5.10'),
(192, 57, 39, 'result', '3.90'),
(193, 57, 40, 'result', '370'),
(194, 57, 41, 'result', '110'),
(195, 58, 38, 'result', '4.85'),
(196, 58, 39, 'result', '4.70'),
(197, 58, 43, 'result', '380'),
(198, 58, 44, 'result', '105'),
(199, 59, 38, 'result', '4.95'),
(200, 59, 39, 'result', '4.10'),
(201, 59, 40, 'result', '370'),
(202, 59, 41, 'result', '90'),
(203, 60, 38, 'result', '5.78'),
(204, 60, 39, 'result', '3.20'),
(205, 60, 40, 'result', '330'),
(206, 60, 41, 'result', '115'),
(207, 61, 38, 'result', '4.40'),
(208, 61, 39, 'result', '4.00'),
(209, 61, 43, 'result', '440'),
(210, 61, 44, 'result', '80'),
(211, 62, 38, 'result', '4.95'),
(212, 62, 39, 'result', '4.70'),
(213, 62, 43, 'result', '370'),
(214, 62, 44, 'result', '105'),
(215, 64, 38, 'result', '4.20'),
(216, 64, 39, 'result', '3.50'),
(217, 64, 40, 'result', '400'),
(218, 64, 41, 'result', '80'),
(219, 65, 38, 'result', '5.78'),
(220, 65, 39, 'result', '3.90'),
(221, 65, 40, 'result', '260'),
(222, 65, 41, 'result', '100'),
(223, 66, 38, 'result', '5.50'),
(224, 66, 39, 'result', '4.20'),
(225, 66, 40, 'result', '330'),
(226, 66, 41, 'result', '95'),
(227, 68, 38, 'result', '4.10'),
(228, 68, 39, 'result', '3.50'),
(229, 68, 43, 'result', '400'),
(230, 68, 44, 'result', '85'),
(231, 69, 38, 'result', '4.75'),
(232, 69, 39, 'result', '3.90'),
(233, 69, 43, 'result', '370'),
(234, 69, 44, 'result', '85'),
(235, 70, 38, 'result', '5.50'),
(236, 70, 39, 'result', '3.60'),
(237, 70, 40, 'result', '370'),
(238, 70, 41, 'result', '105'),
(240, 76, 38, 'result', '4.80'),
(241, 76, 39, 'result', '2.70'),
(242, 76, 40, 'result', '280'),
(243, 76, 41, 'result', '60'),
(244, 76, 38, 'result', '4.80'),
(245, 76, 39, 'result', '2.70'),
(246, 76, 40, 'result', '280'),
(247, 76, 41, 'result', '60'),
(248, 77, 38, 'result', '5.00'),
(249, 77, 39, 'result', '3.80'),
(250, 77, 40, 'result', '270'),
(251, 77, 41, 'result', '80'),
(252, 78, 38, 'result', '4.10'),
(253, 78, 39, 'result', '3.90'),
(254, 78, 40, 'result', '190'),
(255, 78, 41, 'result', '85'),
(256, 78, 38, 'result', '4.10'),
(257, 78, 39, 'result', '3.90'),
(258, 78, 40, 'result', '190'),
(259, 78, 41, 'result', '85'),
(260, 79, 38, 'result', '5.10'),
(261, 79, 39, 'result', '2.80'),
(262, 79, 43, 'result', '180'),
(263, 79, 44, 'result', '95'),
(264, 79, 38, 'result', '5.10'),
(265, 79, 39, 'result', '2.80'),
(266, 79, 43, 'result', '180'),
(267, 79, 44, 'result', '95'),
(268, 81, 38, 'result', '5.10'),
(269, 81, 39, 'result', '2.65'),
(270, 81, 40, 'result', '380'),
(271, 81, 41, 'result', '60'),
(272, 84, 38, 'result', '4.70'),
(273, 84, 39, 'result', '2.90'),
(274, 84, 43, 'result', '190'),
(275, 84, 44, 'result', '70'),
(276, 85, 38, 'result', '4.20'),
(277, 85, 39, 'result', '3.75'),
(278, 85, 40, 'result', '300'),
(279, 85, 41, 'result', '60'),
(280, 88, 38, 'result', '4.10'),
(281, 88, 39, 'result', '3.60'),
(282, 88, 43, 'result', '240'),
(283, 88, 44, 'result', '75'),
(284, 89, 38, 'result', '5.45'),
(285, 89, 39, 'result', '3.25'),
(286, 89, 43, 'result', '270'),
(287, 89, 44, 'result', '95'),
(288, 89, 38, 'result', '5.45'),
(289, 89, 39, 'result', '3.25'),
(290, 89, 43, 'result', '270'),
(291, 89, 44, 'result', '95'),
(292, 43, 7, 'color', 'Yellow'),
(293, 43, 7, 'sugar', 'Negative'),
(294, 43, 7, 'appearance', 'Clear'),
(295, 43, 7, 'albumin', 'Negative'),
(296, 43, 7, 'specific_gravity', '1.010'),
(297, 43, 7, 'reaction', 'Neutral (pH7)'),
(298, 43, 7, 'sq_epithelial_cells', 'Few'),
(299, 43, 7, 'puss_cells', 'Few'),
(300, 43, 7, 'mucous threads', 'Present'),
(301, 43, 7, 'rbc', 'Few'),
(302, 43, 7, 'granular_cast', 'Present'),
(303, 43, 7, 'bacteria', 'None'),
(304, 43, 7, 'hyaline_cast', 'Present'),
(305, 43, 7, 'calcium_oxalate', 'Present'),
(306, 43, 7, 'amorphous_urates', 'Present'),
(307, 43, 7, 'amor_phosphates', 'Present'),
(309, 45, 7, 'color', 'Yellow'),
(310, 45, 7, 'sugar', 'Negative'),
(311, 45, 7, 'appearance', 'Clear'),
(312, 45, 7, 'albumin', 'Negative'),
(313, 45, 7, 'specific_gravity', '1.030'),
(314, 45, 7, 'reaction', 'Alkaline (pH 9)'),
(315, 45, 7, 'sq_epithelial_cells', 'Few'),
(316, 45, 7, 'puss_cells', 'Few'),
(317, 45, 7, 'mucous threads', 'Present'),
(318, 45, 7, 'rbc', 'Few'),
(319, 45, 7, 'granular_cast', 'Present'),
(320, 45, 7, 'bacteria', 'None'),
(321, 45, 7, 'hyaline_cast', 'Present'),
(322, 45, 7, 'calcium_oxalate', 'Present'),
(323, 45, 7, 'amorphous_urates', 'Present'),
(324, 45, 7, 'amor_phosphates', 'Present'),
(326, 51, 7, 'color', 'Yellow'),
(327, 51, 7, 'sugar', 'Negative'),
(328, 51, 7, 'appearance', 'Clear'),
(329, 51, 7, 'albumin', 'Negative'),
(330, 51, 7, 'specific_gravity', '1.015'),
(331, 51, 7, 'reaction', 'Neutral (pH7)'),
(332, 51, 7, 'sq_epithelial_cells', 'Few'),
(333, 51, 7, 'puss_cells', 'Few'),
(334, 51, 7, 'mucous threads', 'Present'),
(335, 51, 7, 'rbc', 'Few'),
(336, 51, 7, 'granular_cast', 'Present'),
(337, 51, 7, 'bacteria', 'None'),
(338, 51, 7, 'hyaline_cast', 'Present'),
(339, 51, 7, 'calcium_oxalate', 'Present'),
(340, 51, 7, 'amorphous_urates', 'Present'),
(341, 51, 7, 'amor_phosphates', 'Present'),
(342, 51, 7, 'color', 'Yellow'),
(343, 51, 7, 'sugar', 'Negative'),
(344, 51, 7, 'appearance', 'Clear'),
(345, 51, 7, 'albumin', 'Negative'),
(346, 51, 7, 'specific_gravity', '1.015'),
(347, 51, 7, 'reaction', 'Neutral (pH7)'),
(348, 51, 7, 'sq_epithelial_cells', 'Few'),
(349, 51, 7, 'puss_cells', 'Few'),
(350, 51, 7, 'mucous threads', 'Present'),
(351, 51, 7, 'rbc', 'Few'),
(352, 51, 7, 'granular_cast', 'Present'),
(353, 51, 7, 'bacteria', 'None'),
(354, 51, 7, 'hyaline_cast', 'Present'),
(355, 51, 7, 'calcium_oxalate', 'Present'),
(356, 51, 7, 'amorphous_urates', 'Present'),
(357, 51, 7, 'amor_phosphates', 'Present'),
(358, 56, 7, 'color', 'Yellow'),
(359, 56, 7, 'sugar', 'Negative'),
(360, 56, 7, 'appearance', 'Clear'),
(361, 56, 7, 'albumin', 'Negative'),
(362, 56, 7, 'specific_gravity', '1.010'),
(363, 56, 7, 'reaction', 'Alkaline (pH 9)'),
(364, 56, 7, 'sq_epithelial_cells', 'Few'),
(365, 56, 7, 'puss_cells', 'Few'),
(366, 56, 7, 'mucous threads', 'Present'),
(367, 56, 7, 'rbc', 'Few'),
(368, 56, 7, 'granular_cast', 'Present'),
(369, 56, 7, 'bacteria', 'None'),
(370, 56, 7, 'hyaline_cast', 'Present'),
(371, 56, 7, 'calcium_oxalate', 'Present'),
(372, 56, 7, 'amorphous_urates', 'Present'),
(373, 56, 7, 'amor_phosphates', 'Present'),
(374, 63, 7, 'color', 'Yellow'),
(375, 63, 7, 'sugar', 'Negative'),
(376, 63, 7, 'appearance', 'Clear'),
(377, 63, 7, 'albumin', 'Negative'),
(378, 63, 7, 'specific_gravity', '1.025'),
(379, 63, 7, 'reaction', 'Neutral (pH7)'),
(380, 63, 7, 'sq_epithelial_cells', 'Few'),
(381, 63, 7, 'puss_cells', 'Few'),
(382, 63, 7, 'mucous threads', 'Present'),
(383, 63, 7, 'rbc', 'Few'),
(384, 63, 7, 'granular_cast', 'Present'),
(385, 63, 7, 'bacteria', 'None'),
(386, 63, 7, 'hyaline_cast', 'Present'),
(387, 63, 7, 'calcium_oxalate', 'Present'),
(388, 63, 7, 'amorphous_urates', 'Present'),
(389, 63, 7, 'amor_phosphates', 'Present'),
(390, 83, 7, 'color', 'Yellow'),
(391, 83, 7, 'sugar', 'Negative'),
(392, 83, 7, 'appearance', 'Clear'),
(393, 83, 7, 'albumin', 'Negative'),
(394, 83, 7, 'specific_gravity', '1.020'),
(395, 83, 7, 'reaction', 'Neutral (pH7)'),
(396, 83, 7, 'sq_epithelial_cells', 'Few'),
(397, 83, 7, 'puss_cells', 'Few'),
(398, 83, 7, 'mucous threads', 'Present'),
(399, 83, 7, 'rbc', 'Few'),
(400, 83, 7, 'granular_cast', 'Present'),
(401, 83, 7, 'bacteria', 'None'),
(402, 83, 7, 'hyaline_cast', 'Present'),
(403, 83, 7, 'calcium_oxalate', 'Present'),
(404, 83, 7, 'amorphous_urates', 'Present'),
(405, 83, 7, 'amor_phosphates', 'Present'),
(407, 42, 6, 'hemoglobin_count', '130'),
(408, 42, 6, 'color', 'Yellow'),
(409, 42, 6, 'sugar', 'Negative'),
(410, 42, 6, 'appearance', 'Clear'),
(411, 42, 6, 'albumin', 'Negative'),
(412, 42, 6, 'specific_gravity', '1.030'),
(413, 42, 6, 'reaction', 'Neutral (pH7)'),
(414, 42, 6, 'sq_epithelial_cells', 'Few'),
(415, 42, 6, 'puss_cells', 'Few'),
(416, 42, 6, 'mucous threads', 'Absent'),
(417, 42, 6, 'rbc', 'Few'),
(418, 42, 6, 'granular_cast', 'Absent'),
(419, 42, 6, 'bacteria', 'None'),
(420, 42, 6, 'hyaline_cast', 'Absent'),
(421, 42, 6, 'calcium_oxalate', 'Absent'),
(422, 42, 6, 'amorphous_urates', 'Absent '),
(423, 42, 6, 'amor_phosphates', 'Absent '),
(424, 42, 6, 'blood_type', 'B'),
(425, 42, 6, 'hepatitis_b_surface_antigen', 'Negative '),
(427, 52, 6, 'hemoglobin_count', '160'),
(428, 52, 6, 'color', 'Yellow'),
(429, 52, 6, 'sugar', 'Negative'),
(430, 52, 6, 'appearance', 'Clear'),
(431, 52, 6, 'albumin', 'Negative'),
(432, 52, 6, 'specific_gravity', '1.015'),
(433, 52, 6, 'reaction', 'Neutral (pH7)'),
(434, 52, 6, 'sq_epithelial_cells', 'Few'),
(435, 52, 6, 'puss_cells', 'Few'),
(436, 52, 6, 'mucous threads', 'Absent'),
(437, 52, 6, 'rbc', 'Few'),
(438, 52, 6, 'granular_cast', 'Absent'),
(439, 52, 6, 'bacteria', 'None'),
(440, 52, 6, 'hyaline_cast', 'Absent'),
(441, 52, 6, 'calcium_oxalate', 'Absent'),
(442, 52, 6, 'amorphous_urates', 'Absent '),
(443, 52, 6, 'amor_phosphates', 'Absent '),
(444, 52, 6, 'blood_type', 'B+'),
(445, 52, 6, 'hepatitis_b_surface_antigen', 'Negative '),
(446, 54, 6, 'hemoglobin_count', ''),
(447, 54, 6, 'color', 'Yellow'),
(448, 54, 6, 'sugar', 'Negative'),
(449, 54, 6, 'appearance', 'Clear'),
(450, 54, 6, 'albumin', 'Negative'),
(451, 54, 6, 'specific_gravity', '1.030'),
(452, 54, 6, 'reaction', 'Neutral (pH7)'),
(453, 54, 6, 'sq_epithelial_cells', 'Few'),
(454, 54, 6, 'puss_cells', 'Few'),
(455, 54, 6, 'mucous threads', 'Absent'),
(456, 54, 6, 'rbc', 'Few'),
(457, 54, 6, 'granular_cast', 'Absent'),
(458, 54, 6, 'bacteria', 'None'),
(459, 54, 6, 'hyaline_cast', 'Absent'),
(460, 54, 6, 'calcium_oxalate', 'Absent'),
(461, 54, 6, 'amorphous_urates', 'Absent '),
(462, 54, 6, 'amor_phosphates', 'Absent '),
(463, 54, 6, 'blood_type', 'A'),
(464, 54, 6, 'hepatitis_b_surface_antigen', 'Negative '),
(465, 74, 6, 'hemoglobin_count', '148'),
(466, 74, 6, 'color', 'Yellow'),
(467, 74, 6, 'sugar', 'Negative'),
(468, 74, 6, 'appearance', 'Clear'),
(469, 74, 6, 'albumin', 'Negative'),
(470, 74, 6, 'specific_gravity', '1.025'),
(471, 74, 6, 'reaction', 'Neutral (pH7)'),
(472, 74, 6, 'sq_epithelial_cells', 'Few'),
(473, 74, 6, 'puss_cells', 'Few'),
(474, 74, 6, 'mucous threads', 'Absent'),
(475, 74, 6, 'rbc', 'Few'),
(476, 74, 6, 'granular_cast', 'Absent'),
(477, 74, 6, 'bacteria', 'None'),
(478, 74, 6, 'hyaline_cast', 'Absent'),
(479, 74, 6, 'calcium_oxalate', 'Absent'),
(480, 74, 6, 'amorphous_urates', ''),
(481, 74, 6, 'amor_phosphates', ''),
(482, 74, 6, 'blood_type', 'O+'),
(483, 74, 6, 'hepatitis_b_surface_antigen', 'Negative '),
(484, 80, 6, 'hemoglobin_count', '142'),
(485, 80, 6, 'color', 'Yellow'),
(486, 80, 6, 'sugar', 'Negative'),
(487, 80, 6, 'appearance', 'Clear'),
(488, 80, 6, 'albumin', 'Negative'),
(489, 80, 6, 'specific_gravity', '1.015'),
(490, 80, 6, 'reaction', 'Neutral (pH7)'),
(491, 80, 6, 'sq_epithelial_cells', 'Few'),
(492, 80, 6, 'puss_cells', 'Few'),
(493, 80, 6, 'mucous threads', 'Absent'),
(494, 80, 6, 'rbc', 'Few'),
(495, 80, 6, 'granular_cast', 'Absent'),
(496, 80, 6, 'bacteria', 'None'),
(497, 80, 6, 'hyaline_cast', 'Absent'),
(498, 80, 6, 'calcium_oxalate', 'Absent'),
(499, 80, 6, 'amorphous_urates', 'Absent '),
(500, 80, 6, 'amor_phosphates', 'Absent '),
(501, 80, 6, 'blood_type', 'B'),
(502, 80, 6, 'hepatitis_b_surface_antigen', 'Negative '),
(503, 83, 6, 'hemoglobin_count', '152'),
(504, 83, 6, 'color', 'Yellow'),
(505, 83, 6, 'sugar', 'Negative'),
(506, 83, 6, 'appearance', 'Clear'),
(507, 83, 6, 'albumin', 'Negative'),
(508, 83, 6, 'specific_gravity', '1.010'),
(509, 83, 6, 'reaction', 'Neutral (pH7)'),
(510, 83, 6, 'sq_epithelial_cells', 'Few'),
(511, 83, 6, 'puss_cells', 'Few'),
(512, 83, 6, 'mucous threads', 'Absent'),
(513, 83, 6, 'rbc', 'Few'),
(514, 83, 6, 'granular_cast', 'Absent'),
(515, 83, 6, 'bacteria', 'None'),
(516, 83, 6, 'hyaline_cast', 'Absent'),
(517, 83, 6, 'calcium_oxalate', 'Absent'),
(518, 83, 6, 'amorphous_urates', 'Absent '),
(519, 83, 6, 'amor_phosphates', 'Absent '),
(520, 83, 6, 'blood_type', 'B+'),
(521, 83, 6, 'hepatitis_b_surface_antigen', 'Negative '),
(523, 87, 6, 'hemoglobin_count', '155'),
(524, 87, 6, 'color', 'Yellow'),
(525, 87, 6, 'sugar', 'Negative'),
(526, 87, 6, 'appearance', 'Clear'),
(527, 87, 6, 'albumin', 'Negative'),
(528, 87, 6, 'specific_gravity', '1.025'),
(529, 87, 6, 'reaction', 'Neutral (pH7)'),
(530, 87, 6, 'sq_epithelial_cells', 'Few'),
(531, 87, 6, 'puss_cells', 'Few'),
(532, 87, 6, 'mucous threads', 'Absent'),
(533, 87, 6, 'rbc', 'Few'),
(534, 87, 6, 'granular_cast', 'Absent'),
(535, 87, 6, 'bacteria', 'None'),
(536, 87, 6, 'hyaline_cast', 'Absent'),
(537, 87, 6, 'calcium_oxalate', 'Absent'),
(538, 87, 6, 'amorphous_urates', 'Absent '),
(539, 87, 6, 'amor_phosphates', 'Absent '),
(540, 87, 6, 'blood_type', 'B+'),
(541, 87, 6, 'hepatitis_b_surface_antigen', 'Negative ');

-- --------------------------------------------------------

--
-- Table structure for table `request_services`
--

CREATE TABLE `request_services` (
  `request_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `request_services`
--

INSERT INTO `request_services` (`request_id`, `service_id`) VALUES
(20, 38),
(20, 39),
(20, 43),
(20, 44),
(22, 38),
(22, 39),
(22, 43),
(22, 44),
(23, 38),
(23, 39),
(23, 43),
(23, 44),
(24, 38),
(24, 39),
(24, 40),
(24, 41),
(25, 38),
(25, 39),
(25, 40),
(25, 41),
(26, 38),
(26, 39),
(26, 43),
(26, 44),
(27, 38),
(27, 39),
(27, 40),
(27, 41),
(28, 38),
(28, 39),
(28, 40),
(28, 41),
(30, 38),
(30, 39),
(30, 40),
(30, 41),
(31, 38),
(31, 39),
(31, 40),
(31, 41),
(32, 38),
(32, 39),
(32, 43),
(32, 44),
(33, 38),
(33, 39),
(33, 40),
(33, 41),
(35, 38),
(35, 39),
(35, 40),
(35, 41),
(39, 38),
(39, 39),
(39, 40),
(39, 41),
(46, 38),
(46, 39),
(46, 40),
(46, 41),
(47, 38),
(47, 39),
(47, 43),
(47, 44),
(44, 38),
(44, 39),
(44, 43),
(44, 44),
(48, 38),
(48, 39),
(48, 40),
(48, 41),
(49, 38),
(49, 39),
(49, 43),
(49, 44),
(50, 38),
(50, 39),
(50, 43),
(50, 44),
(53, 38),
(53, 39),
(53, 40),
(53, 41),
(54, 6),
(54, 38),
(54, 39),
(54, 43),
(54, 44),
(57, 38),
(57, 39),
(57, 40),
(57, 41),
(58, 38),
(58, 39),
(58, 43),
(58, 44),
(59, 38),
(59, 39),
(59, 40),
(59, 41),
(60, 38),
(60, 39),
(60, 40),
(60, 41),
(61, 38),
(61, 39),
(61, 43),
(61, 44),
(62, 38),
(62, 39),
(62, 43),
(62, 44),
(63, 7),
(64, 38),
(64, 39),
(64, 40),
(64, 41),
(65, 38),
(65, 39),
(65, 40),
(65, 41),
(66, 38),
(66, 39),
(66, 40),
(66, 41),
(68, 38),
(68, 39),
(68, 43),
(68, 44),
(69, 38),
(69, 39),
(69, 43),
(69, 44),
(70, 38),
(70, 39),
(70, 40),
(70, 41),
(74, 6),
(74, 10),
(76, 38),
(76, 39),
(76, 40),
(76, 41),
(77, 38),
(77, 39),
(77, 40),
(77, 41),
(79, 38),
(79, 39),
(79, 43),
(79, 44),
(80, 6),
(81, 38),
(81, 39),
(81, 40),
(81, 41),
(82, 14),
(83, 6),
(83, 7),
(84, 38),
(84, 39),
(84, 43),
(84, 44),
(85, 38),
(85, 39),
(85, 40),
(85, 41),
(87, 6),
(87, 14),
(88, 38),
(88, 39),
(88, 43),
(88, 44),
(89, 38),
(89, 39),
(89, 43),
(89, 44),
(90, 14),
(92, 38),
(93, 38),
(94, 38),
(94, 39),
(94, 40),
(94, 41),
(95, 38),
(95, 39),
(95, 40),
(95, 41),
(99, 40),
(100, 32),
(102, 38),
(102, 39),
(102, 43),
(102, 44),
(78, 38),
(78, 39),
(78, 40),
(78, 41),
(86, 32),
(105, 7),
(106, 18),
(107, 18),
(108, 13),
(109, 11),
(63, 46),
(41, 38),
(41, 39),
(41, 43),
(41, 44),
(42, 6),
(42, 46),
(43, 7),
(43, 46),
(45, 7),
(45, 46),
(51, 7),
(51, 46),
(52, 6),
(52, 46),
(56, 7),
(56, 13),
(73, 6),
(73, 46),
(75, 10),
(75, 38),
(75, 39),
(75, 40),
(75, 44),
(72, 6),
(72, 46),
(96, 43),
(96, 46),
(97, 38),
(97, 39),
(97, 46),
(98, 39),
(98, 46),
(71, 7),
(71, 46),
(101, 40),
(101, 46),
(103, 38),
(103, 39);

-- --------------------------------------------------------

--
-- Table structure for table `security_questions`
--

CREATE TABLE `security_questions` (
  `id` int(11) NOT NULL,
  `question` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `security_questions`
--

INSERT INTO `security_questions` (`id`, `question`) VALUES
(1, 'What is your mother\'s maiden name?'),
(2, 'What is the name of your first pet?'),
(3, 'What is your favorite color?'),
(4, 'What is the name of the street you grew up on?'),
(5, 'What is your favorite movie?'),
(6, 'What is your favorite food?'),
(7, 'What is your favorite book?'),
(8, 'What is your favorite hobby?'),
(9, 'What is your favorite animal?'),
(10, 'What is your favorite song?');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `price` int(11) NOT NULL,
  `normal_value` varchar(255) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `name`, `price`, `normal_value`) VALUES
(6, 'Hemoglobin Determination', 50, '120-160 g/dL'),
(7, 'Urine Analysis', 50, '120-160 g/dL'),
(8, 'Complete Blood Count(CBC)', 50, '120-160 g/dL'),
(10, 'SGPT', 50, '23 g/dL'),
(11, 'CBC, Platelet count', 200, ''),
(12, 'Complete Blood Count ', 100, ''),
(13, 'Hemoglobin count', 50, ''),
(14, 'Platelet count', 100, ''),
(15, 'Hematocrit count', 50, ''),
(16, 'Blood Typing with Rhesus (RH) Type', 80, ''),
(17, 'CTBT(Clotting time, Bleeding time)', 80, ''),
(18, 'Glycocelated Hemoglobin(HBA1c)', 700, ''),
(19, 'Prothrombin Time(PT) with INR', 800, ''),
(20, 'Active Partial Tromboplastin Time(APTT)', 900, ''),
(21, 'Erythrocytes Sedimentation Rat(ESR)', 300, ''),
(22, 'Hepa B Virus (HBsAg)', 200, ''),
(23, 'Anti-HBs', 300, ''),
(24, 'Hepa A Virus (Anti-HAV)', 400, ''),
(25, 'Hepa C Virus (Anti-HCV)', 300, ''),
(26, 'Hepa B Virus (HBsAg)', 550, ''),
(27, 'Anti-HBs', 700, ''),
(28, 'Anti-HAV lgM or lgG', 900, ''),
(29, 'Anti-HCV', 800, ''),
(30, 'HBeAg', 750, ''),
(31, 'Urine Examination Manual', 40, ''),
(32, 'Urine Examination Cytometry', 100, ''),
(33, 'Urine Examination (Micral Test)', 450, ''),
(34, 'Urine Examination with 10 parameters', 100, ''),
(35, 'Stool Examination', 40, ''),
(36, 'Occult Blood/FOBT', 250, ''),
(37, 'Stool Examination with Salmonella', 900, ''),
(38, 'Glucose(Fasting Blood Sugar)', 100, '3.85-5.78 mmol/L'),
(39, 'Cholesterol total', 150, '2.60-4.90 mmol/L'),
(40, 'Serum Uric Acid', 150, '149-404mmol/L'),
(41, 'Serum Creatinine', 150, '53-97 mmol/L'),
(43, 'Serum Uric Acid', 150, '214-458mmol/L'),
(44, 'Serum Creatinine', 150, '80-115mmol/L'),
(46, '', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `age` int(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  `mobile_number` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `age`, `address`, `mobile_number`) VALUES
(4, 'Super', 'Admin', 'admin@gmail.com', 'admin1234', 1, 'Purok 1 San Vicente', '09639668498'),
(13, 'Marie Mhar', 'Turado', 'Mariemhar123', 'turado12345', 28, 'New Pandan Panabo City', '09107074911'),
(14, 'Louela', 'Ilagan', 'louela123', 'ilagan12345', 26, 'Tibungco Davao city', '09514091681'),
(16, 'MARION JOHN', 'BALLARES', 'urmrncles_', 'kizzyroblox123123', 14, 'PRK. 4 SAN VICENTE PANABO CITY', '09486210753'),
(17, 'CHAIRA NICOLE', 'BALLARES', 'chaira2005', 'chaira4321', 18, 'PRK. DUGSO, SAN PEDRO, PANABO CITY', '09854572277'),
(18, 'ABEGAIL', 'SABUS', 'Abegailsabus', 'Dnsc2002', 21, 'PRK 1 BRGY SALVACION PANABO CITY', '09700592288'),
(19, 'DEXTER', 'CUNANAN ', 'Dexter_11', 'Gwapoko11', 25, 'PUROK MANGGA STO. NIñO, PANABO CITY', '09852918780'),
(21, 'JEANNIE ANN ', 'RENTUAYA', 'jeannieann@gmail.com', 'jean123', 19, 'BRGY.GREDU,PANABO CITY', '09515178420'),
(23, 'LAURENCE', 'WAJE', 'denver.1241', 'Waje@yt1241', 20, 'WAJE1241@GMAIL.COM', '63999908457'),
(24, 'LURINCE', 'WAJE', 'Lurince@gmail.com', 'Lurince1234', 20, 'PUROK 1,SAN VICENTE PANABO CITY', '09150722384'),
(25, 'MARDY HOPE', 'AMOROSO', 'mardyhopeamoroso', '99071605MARDYamoroso', 25, 'PUROK 17, VILLAROSA NEW VISAYAS PANABO CITY ', '09954719113'),
(26, 'DIOLY', 'ABRAZALDO', 'Dioly', 'Boss0858188', 28, 'PUROK ALAKTA NEW PANDAN, PANABO CITY', '09467398481'),
(27, 'DIVINA CORAZON', 'MERQUITA', 'Divina', 'Boss0858188', 29, 'PUROK ALAKTA NEW PANDAN, PANABO CITY', '09467398481'),
(28, 'LAURENCE', 'WAJE', 'wajelaurence@gmail.com', 'waje12345', 28, 'P-1 SAN VICENTE PANABO CITY', '09150722384'),
(29, 'Cashier ', 'Admin', 'Cashier1234', 'Cashier123', 28, 'Purok 9 San Francisco', '09324588126'),
(30, 'JOMARIE', 'ABAD', 'JMDA', 'JMDA1234', 22, 'PUROK 18, SAN VICENTE, PANABO CITY', '09922344452'),
(31, 'ORACION', 'DELIA', 'Deliaoracion@gmail.com', 'Delia1234', 43, 'DELIAORACION@GMAIL.COM', '09850386102'),
(32, 'DARLENA', 'DOLLA', 'dolla123', 'dolla12345', 43, 'SANTO NINO PANABO CITY', '11111111111');

-- --------------------------------------------------------

--
-- Table structure for table `user_questions`
--

CREATE TABLE `user_questions` (
  `id` int(11) NOT NULL,
  `question_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `answer` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_questions`
--

INSERT INTO `user_questions` (`id`, `question_id`, `user_id`, `answer`) VALUES
(4, 1, 4, 'Jesus'),
(13, 1, 13, 'Margie Martizano Turado'),
(14, 6, 14, 'adobo'),
(16, NULL, 16, NULL),
(17, NULL, 17, NULL),
(18, NULL, 18, NULL),
(19, NULL, 19, NULL),
(21, NULL, 21, NULL),
(23, NULL, 23, NULL),
(24, NULL, 24, NULL),
(25, NULL, 25, NULL),
(26, NULL, 26, NULL),
(27, NULL, 27, NULL),
(28, NULL, 28, NULL),
(29, 6, 29, 'adobo'),
(30, NULL, 30, NULL),
(31, NULL, 31, NULL),
(32, NULL, 32, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `appointment_services`
--
ALTER TABLE `appointment_services`
  ADD KEY `appointment_id` (`appointment_id`),
  ADD KEY `service_id` (`service_id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `package`
--
ALTER TABLE `package`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `package_services`
--
ALTER TABLE `package_services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `package_id` (`package_id`),
  ADD KEY `service_id` (`service_id`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `request`
--
ALTER TABLE `request`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `request_result`
--
ALTER TABLE `request_result`
  ADD PRIMARY KEY (`id`),
  ADD KEY `request_id` (`request_id`),
  ADD KEY `service_id` (`service_id`);

--
-- Indexes for table `request_services`
--
ALTER TABLE `request_services`
  ADD KEY `request_id` (`request_id`),
  ADD KEY `service_id` (`service_id`);

--
-- Indexes for table `security_questions`
--
ALTER TABLE `security_questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_questions`
--
ALTER TABLE `user_questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `question_id` (`question_id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `package`
--
ALTER TABLE `package`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `package_services`
--
ALTER TABLE `package_services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- AUTO_INCREMENT for table `request`
--
ALTER TABLE `request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT for table `request_result`
--
ALTER TABLE `request_result`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=542;

--
-- AUTO_INCREMENT for table `security_questions`
--
ALTER TABLE `security_questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `user_questions`
--
ALTER TABLE `user_questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointment`
--
ALTER TABLE `appointment`
  ADD CONSTRAINT `appointment_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `appointment_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `appointment_services`
--
ALTER TABLE `appointment_services`
  ADD CONSTRAINT `appointment_services_ibfk_1` FOREIGN KEY (`appointment_id`) REFERENCES `appointment` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `appointment_services_ibfk_2` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`);

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `package_services`
--
ALTER TABLE `package_services`
  ADD CONSTRAINT `package_services_ibfk_1` FOREIGN KEY (`package_id`) REFERENCES `package` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `package_services_ibfk_2` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `request`
--
ALTER TABLE `request`
  ADD CONSTRAINT `request_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `request_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `request_result`
--
ALTER TABLE `request_result`
  ADD CONSTRAINT `request_result_ibfk_1` FOREIGN KEY (`request_id`) REFERENCES `request` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `request_result_ibfk_2` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`);

--
-- Constraints for table `request_services`
--
ALTER TABLE `request_services`
  ADD CONSTRAINT `request_services_ibfk_1` FOREIGN KEY (`request_id`) REFERENCES `request` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `request_services_ibfk_2` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`);

--
-- Constraints for table `user_questions`
--
ALTER TABLE `user_questions`
  ADD CONSTRAINT `user_questions_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `security_questions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_questions_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
