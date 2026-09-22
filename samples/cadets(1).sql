-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 20, 2026 at 12:02 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nda_cadet_dossier`
--

-- --------------------------------------------------------

--
-- Table structure for table `cadets`
--

CREATE TABLE `cadets` (
  `id` int(11) NOT NULL,
  `intake` varchar(10) NOT NULL,
  `nda_no` varchar(20) NOT NULL,
  `surname` varchar(100) NOT NULL,
  `other_names` varchar(200) NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `place_of_birth` varchar(100) DEFAULT NULL,
  `religion` varchar(50) DEFAULT NULL,
  `denomination` varchar(100) DEFAULT NULL,
  `tribe` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `lga` varchar(100) DEFAULT NULL,
  `course` varchar(50) DEFAULT NULL,
  `battalion` varchar(50) DEFAULT NULL,
  `service` varchar(50) DEFAULT NULL,
  `faculty` varchar(100) DEFAULT NULL,
  `department` varchar(100) DEFAULT NULL,
  `academic_group` varchar(100) DEFAULT NULL,
  `medical_category` varchar(50) DEFAULT NULL,
  `blood_group` varchar(10) DEFAULT NULL,
  `identification_marks` text DEFAULT NULL,
  `photo_path` varchar(255) DEFAULT NULL,
  `date_of_arrival` date DEFAULT NULL,
  `course_commenced` date DEFAULT NULL,
  `expected_graduation` year(4) DEFAULT NULL,
  `status` varchar(50) DEFAULT 'ACTIVE',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cadets`
--

INSERT INTO `cadets` (`id`, `intake`, `nda_no`, `surname`, `other_names`, `date_of_birth`, `place_of_birth`, `religion`, `denomination`, `tribe`, `state`, `lga`, `course`, `battalion`, `service`, `faculty`, `department`, `academic_group`, `medical_category`, `blood_group`, `identification_marks`, `photo_path`, `date_of_arrival`, `course_commenced`, `expected_graduation`, `status`, `created_at`, `updated_at`) VALUES
(1, '1', 'NDA001', 'Ade', 'Chinedu', '2000-01-05', 'Lagos', 'Christianity', 'Catholic', 'Yoruba', 'Lagos', 'Ikeja', 'Mechanical Engineering', 'Mogadishu', 'ARMY', 'Engineering', 'Mechanical Engineering', 'Engineering/Science', 'A1', 'O+', 'Scar on left eyebrow', 'uploads/photos/nda001.jpg', '2019-09-01', '2019-09-01', '2024', 'ACTIVE', '2026-04-03 23:34:39', '2026-04-19 19:07:30'),
(2, '1', 'NDA002', 'Bello', 'Musa', '2000-05-10', 'Kano', 'Islam', 'Sunni', 'Hausa', 'Kano', 'Kano Municipal', 'Electrical Engineering', ' 	Assanti', 'ARMY', 'Engineering', 'Electrical Engineering', 'Engineering/Science', 'A2', 'A+', 'Tattoo on right wrist', 'uploads/photos/nda002.jpg', '2019-09-01', '2019-09-01', '2024', 'ACTIVE', '2026-04-03 23:34:39', '2026-04-19 19:08:13'),
(3, '77', 'NDA003', 'Okafor', 'Emeka', '1999-11-22', 'Enugu', 'Christianity', 'Protestant', 'Igbo', 'Enugu', 'Nsukka', 'Political Science', 'Dalet', 'ARMY', 'Arts', 'Political Science', 'Arts/Social Science', 'B1', 'B+', 'Mole on left cheek', 'uploads/photos/nda003.jpg', '2019-09-01', '2019-09-01', '2024', 'ACTIVE', '2026-04-03 23:34:39', '2026-04-19 19:09:10'),
(4, '50', 'NDA004', 'Ali', 'Fatima', '2000-09-15', 'Abuja', 'Islam', 'Sunni', 'Gwari', 'FCT', 'Gwagwalada', 'Management Science', 'Mogadishu', 'ARMY', 'Management Science', 'Business Administration', 'Management Science', 'C1', 'O-', 'None', 'uploads/photos/nda004.jpg', '2019-09-01', '2019-09-01', '2024', 'ACTIVE', '2026-04-03 23:34:39', '2026-04-19 19:07:43'),
(5, '70', 'NDA005', 'Nwankwo', 'Ifeanyi', '2001-03-12', 'Anambra', 'Christianity', 'Catholic', 'Igbo', 'Anambra', 'Aguata', 'History', ' 	Assanti', 'ARMY', 'Arts', 'History', 'Arts/Social Science', 'B2', 'AB+', 'Birthmark on neck', 'uploads/photos/nda005.jpg', '2019-09-01', '2019-09-01', '2024', 'ACTIVE', '2026-04-03 23:34:39', '2026-04-19 19:08:54'),
(6, '20', 'NDA/001', 'Smith', 'John', '1995-05-15', 'Lagos', 'Christianity', 'Catholic', 'Yoruba', 'Lagos', 'Ikeja', 'Engineering', 'Abbysina', 'Army', 'Engineering Faculty', 'Mechanical Engineering Department', 'Group A', 'A1', 'O+', 'None', '/photos/smith.jpg', '2020-01-10', '2020-01-15', '2024', 'Active', '2026-04-19 19:50:41', '2026-04-19 19:50:41'),
(7, '20', 'NDA/002', 'Doe', 'Jane', '1996-08-22', 'Abuja', 'Islam', 'Sunni', 'Hausa', 'FCT', 'Abuja Municipal', 'Science', 'Burma', 'Navy', 'Science Faculty', 'Physics Department', 'Group B', 'B2', 'A-', 'Mole on left cheek', '/photos/doe.jpg', '2020-01-10', '2020-01-15', '2024', 'Active', '2026-04-19 19:50:41', '2026-04-19 19:50:41'),
(8, '31', 'NDA/003', 'Johnson', 'Alice', '1997-12-30', 'Kano', 'Christianity', 'Protestant', 'Hausa', 'Kano', 'Kano Municipal', 'Business Administration', 'Dalet', 'Army', 'Business Faculty', 'Accounting Department', 'Group C', 'C3', 'B+', 'Birthmark on right arm', '/photos/johnson.jpg', '2020-01-10', '2020-01-15', '2024', 'Active', '2026-04-19 19:50:41', '2026-04-19 19:50:41'),
(9, '31', 'NDA/004', 'Williams', 'Bob', '1995-03-10', 'Port Harcourt', 'Christianity', 'Catholic', 'Ijaw', 'Rivers', 'Port Harcourt', 'Law', 'Dalet', 'Air Force', 'Law Faculty', 'International Law Department', 'Group D', 'D4', 'O-', 'Scar on forehead', '/photos/williams.jpg', '2020-01-10', '2020-01-15', '2024', 'Active', '2026-04-19 19:50:41', '2026-04-19 19:50:41'),
(10, '31', 'NDA/005', 'Brown', 'Charlie', '1996-07-25', 'Enugu', 'Islam', 'Sunni', 'Igbo', 'Enugu', 'Enugu North', 'Medicine', 'Mogadishu', 'Army', 'Medical Faculty', 'Surgery Department', 'Group E', 'E5', 'AB+', 'Tattoo on left wrist', '/photos/brown.jpg', '2020-01-10', '2020-01-15', '2024', 'Active', '2026-04-19 19:50:41', '2026-04-19 19:50:41'),
(11, '31', 'NDA/006', 'Davis', 'Eve', '1997-11-05', 'Kaduna', 'Christianity', 'Protestant', 'Hausa', 'Kaduna', 'Kaduna North', 'Computer Science', 'Assanti', 'Navy', 'Computing Faculty', 'Software Engineering Department', 'Group F', 'F6', 'O+', 'None', '/photos/davis.jpg', '2020-01-10', '2020-01-15', '2024', 'Active', '2026-04-19 19:50:41', '2026-04-19 19:50:41'),
(12, '31', 'NDA/007', 'Miller', 'Frank', '1995-09-18', 'Ibadan', 'Christianity', 'Catholic', 'Yoruba', 'Oyo', 'Ibadan North', 'Engineering', 'Abbysina', 'Air Force', 'Engineering Faculty', 'Electrical Engineering Department', 'Group G', 'G7', 'A+', 'Mole on right cheek', '/photos/miller.jpg', '2020-01-10', '2020-01-15', '2024', 'Active', '2026-04-19 19:50:41', '2026-04-19 19:50:41'),
(13, '31', 'NDA/008', 'Wilson', 'Grace', '1996-04-12', 'Lagos', 'Islam', 'Sunni', 'Yoruba', 'Lagos', 'Ikeja', 'Science', 'Burma', 'Army', 'Science Faculty', 'Chemistry Department', 'Group H', 'H8', 'B-', 'Birthmark on left arm', '/photos/wilson.jpg', '2020-01-10', '2020-01-15', '2024', 'Active', '2026-04-19 19:50:41', '2026-04-19 19:50:41'),
(14, '31', 'NDA/009', 'Moore', 'Henry', '1997-10-20', 'Abuja', 'Christianity', 'Protestant', 'Hausa', 'FCT', 'Abuja Municipal', 'Business Administration', 'Dalet', 'Navy', 'Business Faculty', 'Marketing Department', 'Group I', 'I9', 'O+', 'Scar on right arm', '/photos/moore.jpg', '2020-01-10', '2020-01-15', '2024', 'Active', '2026-04-19 19:50:41', '2026-04-19 19:50:41'),
(15, '31', 'NDA/010', 'Taylor', 'Ivy', '1995-06-05', 'Port Harcourt', 'Christianity', 'Catholic', 'Ijaw', 'Rivers', 'Port Harcourt', 'Law', 'Mogadishu', 'Air Force', 'Law Faculty', 'Criminal Law Department', 'Group J', 'J10', 'A-', 'Tattoo on right wrist', '/photos/taylor.jpg', '2020-01-10', '2020-01-15', '2024', 'Active', '2026-04-19 19:50:41', '2026-04-19 19:50:41'),
(16, '31', 'NDA/011', 'Anderson', 'Jack', '1996-08-30', 'Enugu', 'Islam', 'Sunni', 'Igbo', 'Enugu', 'Enugu North', 'Medicine', 'Assanti', 'Army', 'Medical Faculty', 'Pediatrics Department', 'Group K', 'K11', 'B+', 'None', '/photos/anderson.jpg', '2020-01-10', '2020-01-15', '2024', 'Active', '2026-04-19 19:50:41', '2026-04-19 19:50:41'),
(17, '61', 'NDA/012', 'Thomas', 'Karen', '1997-12-15', 'Kaduna', 'Christianity', 'Protestant', 'Hausa', 'Kaduna', 'Kaduna North', 'Computer Science', 'Abbysina', 'Navy', 'Computing Faculty', 'Data Science Department', 'Group L', 'L12', 'O-', 'Mole on left cheek', '/photos/thomas.jpg', '2020-01-10', '2020-01-15', '2024', 'Active', '2026-04-19 19:50:41', '2026-04-19 19:50:41'),
(18, '61', 'NDA/013', 'Jackson', 'Leo', '1995-09-25', 'Ibadan', 'Christianity', 'Catholic', 'Yoruba', 'Oyo', 'Ibadan North', 'Engineering', 'Burma', 'Air Force', 'Engineering Faculty', 'Civil Engineering Department', 'Group M', 'M13', 'AB-', 'Birthmark on right arm', '/photos/jackson.jpg', '2020-01-10', '2020-01-15', '2024', 'Active', '2026-04-19 19:50:41', '2026-04-19 19:50:41'),
(19, '61', 'NDA/014', 'White', 'Mia', '1996-04-18', 'Lagos', 'Islam', 'Sunni', 'Yoruba', 'Lagos', 'Ikeja', 'Science', 'Dalet', 'Army', 'Science Faculty', 'Biology Department', 'Group N', 'N14', 'O+', 'Scar on left arm', '/photos/white.jpg', '2020-01-10', '2020-01-15', '2024', 'Active', '2026-04-19 19:50:41', '2026-04-19 19:50:41'),
(20, '61', 'NDA/01556', 'Harris', 'Noah', '1997-11-25', 'Abuja', 'Christianity', 'Protestant', 'Hausa', 'FCT', 'Abuja Municipal', 'Business Administration', 'Mogadishu', 'Navy', 'Business Faculty', 'Finance Department', 'Group O', 'O15', 'A+', 'Tattoo on left arm', '/photos/harris.jpg', '2020-01-10', '2020-01-15', '2024', 'Active', '2026-04-19 19:50:41', '2026-04-19 19:50:41'),
(21, '71', 'NDA/016', 'Martin', 'Olivia', '1995-03-20', 'Port Harcourt', 'Christianity', 'Catholic', 'Ijaw', 'Rivers', 'Port Harcourt', 'Law', 'Assanti', 'Air Force', 'Law Faculty', 'Constitutional Law Department', 'Group P', 'P16', 'B-', 'None', '/photos/martin.jpg', '2020-01-10', '2020-01-15', '2024', 'Active', '2026-04-19 19:50:41', '2026-04-19 19:50:41'),
(22, '71', 'NDA/017', 'Thompson', 'Paul', '1996-07-30', 'Enugu', 'Islam', 'Sunni', 'Igbo', 'Enugu', 'Enugu North', 'Medicine', 'Abbysina', 'Army', 'Medical Faculty', 'Internal Medicine Department', 'Group Q', 'Q17', 'O+', 'Mole on right arm', '/photos/thompson.jpg', '2020-01-10', '2020-01-15', '2024', 'Active', '2026-04-19 19:50:41', '2026-04-19 19:50:41'),
(23, '71', 'NDA/018', 'Garcia', 'Quinn', '1997-12-05', 'Kaduna', 'Christianity', 'Protestant', 'Hausa', 'Kaduna', 'Kaduna North', 'Computer Science', 'Burma', 'Navy', 'Computing Faculty', 'Cybersecurity Department', 'Group R', 'R18', 'A+', 'Birthmark on left arm', '/photos/garcia.jpg', '2020-01-10', '2020-01-15', '2024', 'Active', '2026-04-19 19:50:41', '2026-04-19 19:50:41'),
(24, '71', 'NDA/019', 'Martinez', 'Rachel', '1995-09-10', 'Ibadan', 'Christianity', 'Catholic', 'Yoruba', 'Oyo', 'Ibadan North', 'Engineering', 'Dalet', 'Air Force', 'Engineering Faculty', 'Aerospace Engineering Department', 'Group S', 'S19', 'O-', 'Scar on forehead', '/photos/martinez.jpg', '2020-01-10', '2020-01-15', '2024', 'Active', '2026-04-19 19:50:41', '2026-04-19 19:50:41'),
(25, '71', 'NDA/020', 'Robinson', 'Steve', '1996-04-25', 'Lagos', 'Islam', 'Sunni', 'Yoruba', 'Lagos', 'Ikeja', 'Science', 'Mogadishu', 'Army', 'Science Faculty', 'Environmental Science Department', 'Group T', 'T20', 'B+', 'Tattoo on right arm', '/photos/robinson.jpg', '2020-01-10', '2020-01-15', '2024', 'Active', '2026-04-19 19:50:41', '2026-04-19 19:50:41'),
(26, '1', 'NDA/101', 'Abubakar', 'Musa', '1970-05-15', 'Kano', 'Islam', 'Sunni', 'Hausa', 'Kano', 'Dala', 'Arts', 'Dalet', 'Army', 'Arts Faculty', 'History', 'Group A', 'A1', 'O+', 'None', '/photos/101.jpg', '1970-01-10', '1970-01-15', '1974', 'Active', '2026-04-19 19:51:18', '2026-04-19 19:51:18'),
(27, '10', 'NDA/102', 'Okonkwo', 'Emeka', '1980-08-22', 'Enugu', 'Christianity', 'Catholic', 'Igbo', 'Enugu', 'Enugu North', 'Science', 'Dalet', 'Navy', 'Science Faculty', 'Physics', 'Group B', 'B2', 'A-', 'Scar on arm', '/photos/102.jpg', '1980-01-10', '1980-01-15', '1984', 'Active', '2026-04-19 19:51:18', '2026-04-19 19:51:18'),
(28, '25', 'NDA/103', 'Balogun', 'Segun', '1990-12-30', 'Lagos', 'Christianity', 'Protestant', 'Yoruba', 'Lagos', 'Ikeja', 'Law', 'Dalet', 'Air Force', 'Law Faculty', 'Law', 'Group C', 'C3', 'B+', 'None', '/photos/103.jpg', '1990-01-10', '1990-01-15', '1994', 'Active', '2026-04-19 19:51:18', '2026-04-19 19:51:18'),
(29, '35', 'NDA/104', 'Effiong', 'Bassey', '1995-03-10', 'Uyo', 'Christianity', 'Catholic', 'Ibibio', 'Akwa Ibom', 'Uyo', 'Engineering', 'Dalet', 'Army', 'Engineering', 'Civil', 'Group D', 'D4', 'O-', 'None', '/photos/104.jpg', '2000-01-10', '2000-01-15', '2004', 'Active', '2026-04-19 19:51:18', '2026-04-19 19:51:18'),
(30, '45', 'NDA/105', 'Umar', 'Sani', '1998-07-25', 'Sokoto', 'Islam', 'Sunni', 'Hausa', 'Sokoto', 'Sokoto North', 'Medicine', 'Dalet', 'Navy', 'Medical', 'Surgery', 'Group E', 'E5', 'AB+', 'Mole on neck', '/photos/105.jpg', '2005-01-10', '2005-01-15', '2009', 'Active', '2026-04-19 19:51:18', '2026-04-19 19:51:18'),
(31, '55', 'NDA/106', 'Danjuma', 'Ishaku', '2000-11-05', 'Jalingo', 'Christianity', 'Protestant', 'Jukun', 'Taraba', 'Jalingo', 'Computing', 'Dalet', 'Air Force', 'Computing', 'CS', 'Group F', 'F6', 'O+', 'None', '/photos/106.jpg', '2010-01-10', '2010-01-15', '2014', 'Active', '2026-04-19 19:51:18', '2026-04-19 19:51:18'),
(32, '65', 'NDA/107', 'Ibrahim', 'Yakubu', '2002-09-18', 'Bauchi', 'Islam', 'Sunni', 'Hausa', 'Bauchi', 'Bauchi', 'Arts', 'Dalet', 'Army', 'Arts', 'NDA', 'Group G', 'G7', 'A+', 'None', '/photos/107.jpg', '2015-01-10', '2015-01-15', '2019', 'Active', '2026-04-19 19:51:18', '2026-04-19 19:51:18'),
(33, '70', 'NDA/108', 'Gomez', 'Victor', '2003-04-12', 'Lagos', 'Christianity', 'Catholic', 'Egun', 'Lagos', 'Badagry', 'Science', 'Dalet', 'Navy', 'Science', 'Chemistry', 'Group H', 'H8', 'B-', 'None', '/photos/108.jpg', '2018-01-10', '2018-01-15', '2022', 'Active', '2026-04-19 19:51:18', '2026-04-19 19:51:18'),
(34, '75', 'NDA/109', 'Nwachukwu', 'Chidi', '2004-10-20', 'Owerri', 'Christianity', 'Catholic', 'Igbo', 'Imo', 'Owerri', 'Law', 'Dalet', 'Air Force', 'Law', 'Law', 'Group I', 'I9', 'O+', 'None', '/photos/109.jpg', '2020-01-10', '2020-01-15', '2024', 'Active', '2026-04-19 19:51:18', '2026-04-19 19:51:18'),
(35, '77', 'NDA/110', 'Shehu', 'Garba', '2005-06-05', 'Kaduna', 'Islam', 'Sunni', 'Hausa', 'Kaduna', 'Zaria', 'Engineering', 'Dalet', 'Army', 'Engineering', 'Mech', 'Group J', 'J10', 'A-', 'None', '/photos/110.jpg', '2022-01-10', '2022-01-15', '2026', 'Active', '2026-04-19 19:51:18', '2026-04-19 19:51:18'),
(36, '5', 'NDA/201', 'Oyetola', 'Kunle', '1975-01-01', 'Ibadan', 'Christianity', 'Catholic', 'Yoruba', 'Oyo', 'Ibadan', 'Science', 'Burma', 'Navy', 'Science', 'Physics', 'A', 'A1', 'O+', 'None', '/photos/201.jpg', '1975-01-10', '1975-01-15', '1979', 'Active', '2026-04-19 19:51:18', '2026-04-19 19:51:18'),
(37, '15', 'NDA/202', 'Abdullahi', 'Bello', '1985-02-02', 'Katsina', 'Islam', 'Sunni', 'Hausa', 'Katsina', 'Katsina', 'Arts', 'Burma', 'Army', 'Arts', 'History', 'B', 'B2', 'A+', 'None', '/photos/202.jpg', '1985-01-10', '1985-01-15', '1989', 'Active', '2026-04-19 19:51:18', '2026-04-19 19:51:18'),
(38, '22', 'NDA/203', 'Chukwuma', 'Ifeanyi', '1992-03-03', 'Awka', 'Christianity', 'Catholic', 'Igbo', 'Anambra', 'Awka', 'Engineering', 'Burma', 'Air Force', 'Engineering', 'Civil', 'C', 'C3', 'B+', 'None', '/photos/203.jpg', '1992-01-10', '1992-01-15', '1996', 'Active', '2026-04-19 19:51:18', '2026-04-19 19:51:18'),
(39, '30', 'NDA/204', 'Ekwueme', 'Alex', '1996-04-04', 'Jos', 'Christianity', 'Protestant', 'Igbo', 'Plateau', 'Jos South', 'Science', 'Burma', 'Navy', 'Science', 'Biology', 'D', 'D4', 'O-', 'None', '/photos/204.jpg', '1996-01-10', '1996-01-15', '2000', 'Active', '2026-04-19 19:51:18', '2026-04-19 19:51:18'),
(40, '40', 'NDA/205', 'Tukur', 'Bamaiyi', '2000-05-05', 'Kebbi', 'Islam', 'Sunni', 'Hausa', 'Kebbi', 'Birnin Kebbi', 'Medicine', 'Burma', 'Army', 'Medical', 'Surgery', 'E', 'E5', 'AB+', 'None', '/photos/205.jpg', '2000-01-10', '2000-01-15', '2004', 'Active', '2026-04-19 19:51:18', '2026-04-19 19:51:18'),
(41, '50', 'NDA/206', 'Oyelowo', 'David', '2002-06-06', 'Ilorin', 'Christianity', 'Catholic', 'Yoruba', 'Kwara', 'Ilorin', 'Computing', 'Burma', 'Air Force', 'Computing', 'CS', 'F', 'F6', 'O+', 'None', '/photos/206.jpg', '2005-01-10', '2005-01-15', '2009', 'Active', '2026-04-19 19:51:18', '2026-04-19 19:51:18'),
(42, '60', 'NDA/207', 'Jallow', 'Modou', '2004-07-07', 'Lagos', 'Islam', 'Sunni', 'Mandinka', 'Lagos', 'Ojo', 'Arts', 'Burma', 'Navy', 'Arts', 'NDA', 'G', 'G7', 'A-', 'None', '/photos/207.jpg', '2010-01-10', '2010-01-15', '2014', 'Active', '2026-04-19 19:51:18', '2026-04-19 19:51:18'),
(43, '68', 'NDA/208', 'Kwame', 'Kofi', '2005-08-08', 'Accra', 'Christianity', 'Protestant', 'Akan', 'External', 'None', 'Science', 'Burma', 'Army', 'Science', 'Math', 'H', 'H8', 'B-', 'None', '/photos/208.jpg', '2018-01-10', '2018-01-15', '2022', 'Active', '2026-04-19 19:51:18', '2026-04-19 19:51:18'),
(44, '73', 'NDA/209', 'Ndiaye', 'Moussa', '2006-09-09', 'Dakar', 'Islam', 'Sunni', 'Wolof', 'External', 'None', 'Law', 'Burma', 'Air Force', 'Law', 'Law', 'I', 'I9', 'O+', 'None', '/photos/209.jpg', '2021-01-10', '2021-01-15', '2025', 'Active', '2026-04-19 19:51:18', '2026-04-19 19:51:18'),
(45, '77', 'NDA/210', 'Ojo', 'Samuel', '2007-10-10', 'Akure', 'Christianity', 'Catholic', 'Yoruba', 'Ondo', 'Akure', 'Engineering', 'Burma', 'Navy', 'Engineering', 'Electrical', 'J', 'J10', 'A+', 'None', '/photos/210.jpg', '2023-01-10', '2023-01-15', '2027', 'Active', '2026-04-19 19:51:18', '2026-04-19 19:51:18'),
(46, '2', 'NDA/301', 'Zubairu', 'Ali', '1971-01-01', 'Kaduna', 'Islam', 'Sunni', 'Hausa', 'Kaduna', 'Kaduna North', 'Science', 'Mogadishu', 'Army', 'Science', 'Physics', 'A', 'A1', 'O+', 'None', '/photos/301.jpg', '1971-01-10', '1971-01-15', '1975', 'Active', '2026-04-19 19:51:18', '2026-04-19 19:51:18'),
(47, '12', 'NDA/302', 'Lawal', 'Taiwo', '1982-02-02', 'Lagos', 'Islam', 'Sunni', 'Yoruba', 'Lagos', 'Epe', 'Arts', 'Mogadishu', 'Navy', 'Arts', 'History', 'B', 'B2', 'A-', 'None', '/photos/302.jpg', '1982-01-10', '1982-01-15', '1986', 'Active', '2026-04-19 19:51:18', '2026-04-19 19:51:18'),
(48, '28', 'NDA/303', 'Eze', 'Chinelo', '1993-03-03', 'Enugu', 'Christianity', 'Catholic', 'Igbo', 'Enugu', 'Udi', 'Engineering', 'Mogadishu', 'Air Force', 'Engineering', 'Civil', 'C', 'C3', 'B+', 'None', '/photos/303.jpg', '1993-01-10', '1993-01-15', '1997', 'Active', '2026-04-19 19:51:18', '2026-04-19 19:51:18'),
(49, '38', 'NDA/304', 'Buhari', 'Aisha', '1998-04-04', 'Daura', 'Islam', 'Sunni', 'Hausa', 'Katsina', 'Daura', 'Science', 'Mogadishu', 'Army', 'Science', 'Biology', 'D', 'D4', 'O-', 'None', '/photos/304.jpg', '1998-01-10', '1998-01-15', '2002', 'Active', '2026-04-19 19:51:18', '2026-04-19 19:51:18'),
(50, '48', 'NDA/305', 'Jonathan', 'Goodluck', '2001-05-05', 'Otuoke', 'Christianity', 'Protestant', 'Ijaw', 'Bayelsa', 'Ogbia', 'Medicine', 'Mogadishu', 'Navy', 'Medical', 'Surgery', 'E', 'E5', 'AB+', 'None', '/photos/305.jpg', '2001-01-10', '2001-01-15', '2005', 'Active', '2026-04-19 19:51:18', '2026-04-19 19:51:18'),
(51, '58', 'NDA/306', 'Tinubu', 'Bola', '2003-06-06', 'Lagos', 'Islam', 'Sunni', 'Yoruba', 'Lagos', 'Ikeja', 'Computing', 'Mogadishu', 'Air Force', 'Computing', 'CS', 'F', 'F6', 'O+', 'None', '/photos/306.jpg', '2006-01-10', '2006-01-15', '2010', 'Active', '2026-04-19 19:51:18', '2026-04-19 19:51:18'),
(52, '64', 'NDA/307', 'Obi', 'Peter', '2004-07-07', 'Onitsha', 'Christianity', 'Catholic', 'Igbo', 'Anambra', 'Onitsha', 'Arts', 'Mogadishu', 'Army', 'Arts', 'NDA', 'G', 'G7', 'A-', 'None', '/photos/307.jpg', '2011-01-10', '2011-01-15', '2015', 'Active', '2026-04-19 19:51:18', '2026-04-19 19:51:18'),
(53, '69', 'NDA/308', 'Sowore', 'Yele', '2005-08-08', 'Akure', 'Christianity', 'Protestant', 'Yoruba', 'Ondo', 'Ese Odo', 'Science', 'Mogadishu', 'Navy', 'Science', 'Math', 'H', 'H8', 'B-', 'None', '/photos/308.jpg', '2019-01-10', '2019-01-15', '2023', 'Active', '2026-04-19 19:51:18', '2026-04-19 19:51:18'),
(54, '74', 'NDA/309', 'Wike', 'Nyesom', '2006-09-09', 'PH', 'Christianity', 'Catholic', 'Ikwerre', 'Rivers', 'Obio Akpor', 'Law', 'Mogadishu', 'Air Force', 'Law', 'Law', 'I', 'I9', 'O+', 'None', '/photos/309.jpg', '2021-01-10', '2021-01-15', '2025', 'Active', '2026-04-19 19:51:18', '2026-04-19 19:51:18'),
(55, '77', 'NDA/310', 'Atiku', 'Abubakar', '2007-10-10', 'Yola', 'Islam', 'Sunni', 'Fulani', 'Adamawa', 'Yola', 'Engineering', 'Mogadishu', 'Navy', 'Engineering', 'Electrical', 'J', 'J10', 'A+', 'None', '/photos/310.jpg', '2023-01-10', '2023-01-15', '2027', 'Active', '2026-04-19 19:51:18', '2026-04-19 19:51:18'),
(56, '3', 'NDA/401', 'Musa', 'Tanimu', '1972-01-01', 'Jos', 'Islam', 'Sunni', 'Berom', 'Plateau', 'Jos North', 'Science', 'Abbysina', 'Army', 'Science', 'Physics', 'A', 'A1', 'O+', 'None', '/photos/401.jpg', '1972-01-10', '1972-01-15', '1976', 'Active', '2026-04-19 19:51:18', '2026-04-19 19:51:18'),
(57, '13', 'NDA/402', 'Idris', 'Gidado', '1983-02-02', 'Kaduna', 'Islam', 'Sunni', 'Hausa', 'Kaduna', 'Zaria', 'Arts', 'Abbysina', 'Navy', 'Arts', 'History', 'B', 'B2', 'A-', 'None', '/photos/402.jpg', '1983-01-10', '1983-01-15', '1987', 'Active', '2026-04-19 19:51:18', '2026-04-19 19:51:18'),
(58, '29', 'NDA/403', 'Amaechi', 'Rotimi', '1994-03-03', 'PH', 'Christianity', 'Catholic', 'Ikwerre', 'Rivers', 'Ikwerre', 'Engineering', 'Abbysina', 'Air Force', 'Engineering', 'Civil', 'C', 'C3', 'B+', 'None', '/photos/403.jpg', '1994-01-10', '1994-01-15', '1998', 'Active', '2026-04-19 19:51:18', '2026-04-19 19:51:18'),
(59, '39', 'NDA/404', 'Diri', 'Douye', '1999-04-04', 'Yenagoa', 'Christianity', 'Protestant', 'Ijaw', 'Bayelsa', 'Yenagoa', 'Science', 'Abbysina', 'Army', 'Science', 'Biology', 'D', 'D4', 'O-', 'None', '/photos/404.jpg', '1999-01-10', '1999-01-15', '2003', 'Active', '2026-04-19 19:51:18', '2026-04-19 19:51:18'),
(60, '49', 'NDA/405', 'Zulum', 'Babagana', '2002-05-05', 'Maiduguri', 'Islam', 'Sunni', 'Kanuri', 'Borno', 'Maiduguri', 'Medicine', 'Abbysina', 'Navy', 'Medical', 'Surgery', 'E', 'E5', 'AB+', 'None', '/photos/405.jpg', '2002-01-10', '2002-01-15', '2006', 'Active', '2026-04-19 19:51:18', '2026-04-19 19:51:18'),
(61, '59', 'NDA/406', 'Makinde', 'Seyi', '2004-06-06', 'Ibadan', 'Christianity', 'Protestant', 'Yoruba', 'Oyo', 'Ibadan', 'Computing', 'Abbysina', 'Air Force', 'Computing', 'CS', 'F', 'F6', 'O+', 'None', '/photos/406.jpg', '2007-01-10', '2007-01-15', '2011', 'Active', '2026-04-19 19:51:18', '2026-04-19 19:51:18'),
(62, '66', 'NDA/407', 'Sanwo', 'Babajide', '2005-07-07', 'Lagos', 'Christianity', 'Catholic', 'Yoruba', 'Lagos', 'Lagos Island', 'Arts', 'Abbysina', 'Army', 'Arts', 'NDA', 'G', 'G7', 'A-', 'None', '/photos/407.jpg', '2012-01-10', '2012-01-15', '2016', 'Active', '2026-04-19 19:51:18', '2026-04-19 19:51:18'),
(63, '71', 'NDA/408', 'Oshio', 'Adams', '2006-08-08', 'Benin', 'Christianity', 'Catholic', 'Edo', 'Edo', 'Etsako', 'Science', 'Abbysina', 'Navy', 'Science', 'Math', 'H', 'H8', 'B-', 'None', '/photos/408.jpg', '2019-01-10', '2019-01-15', '2023', 'Active', '2026-04-19 19:51:18', '2026-04-19 19:51:18'),
(64, '76', 'NDA/409', 'Ibori', 'James', '2007-09-09', 'Asaba', 'Christianity', 'Protestant', 'Urhobo', 'Delta', 'Ethiope', 'Law', 'Abbysina', 'Air Force', 'Law', 'Law', 'I', 'I9', 'O+', 'None', '/photos/409.jpg', '2022-01-10', '2022-01-15', '2026', 'Active', '2026-04-19 19:51:18', '2026-04-19 19:51:18'),
(65, '77', 'NDA/410', 'Sambo', 'Namadi', '2008-10-10', 'Zaria', 'Islam', 'Sunni', 'Hausa', 'Kaduna', 'Zaria', 'Engineering', 'Abbysina', 'Navy', 'Engineering', 'Electrical', 'J', 'J10', 'A+', 'None', '/photos/410.jpg', '2023-01-10', '2023-01-15', '2027', 'Active', '2026-04-19 19:51:18', '2026-04-19 19:51:18');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cadets`
--
ALTER TABLE `cadets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nda_no` (`nda_no`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cadets`
--
ALTER TABLE `cadets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;



-- based on the slq database ``nda_cadet_dossier.sql` can you provide use the sample cadets table datas in the cadets.sql to provide sql insert values for all other table expect users table and cadets table

INSERT INTO `cadet_dossier` (`id`, `cadet_id`, `academic_records`, `disciplinary_records`, `medical_records`, `extracurricular_activities`, `created_at`, `updated_at`) VALUES
(1, 1, 'Excellent academic performance with a GPA of 3.8', 'No disciplinary actions', 'Fit for duty', 'Member of the debate club and football team', '2020-01-10 19:50:41', '2020-01-10 19:50:41'),
(2, 2, 'Good academic performance with a GPA of 3.5', 'Minor disciplinary action for tardiness', 'Fit for duty', 'Member of the chess club and basketball team', '2020-01-10 19:50:41', '2020-01-10 19:50:41'),
(3, 3, 'Average academic performance with a GPA of 3.0', 'Disciplinary action for insubordination', 'Requires medical evaluation for stress-related issues', 'Member of the music club and track team', '2020-01-10 19:50:41', '2020-01-10 19:50:41'),
(4, 4, 'Excellent academic performance with a GPA of 3.9', 'No disciplinary actions', 'Fit for duty', 'Member of the drama club and swimming team', '2020-01-10 19:50:41', '2020-01-10 19:50:41'),
(5, 5, 'Good academic performance with a GPA of 3.6', 'Minor disciplinary action for uniform violation', 'Fit for duty', 'Member of the art club and volleyball team', '2020-01-10 19:50:41', '2020-01-10 19:50:41');

INSERT INTO `cadet_dossier` (`id`, `cadet_id`, `academic_records`, `disciplinary_records`, `medical_records`, `extracurricular_activities`, `created_at`, `updated_at`) VALUES
(6, 6, 'Average academic performance with a GPA of 3.2', 'Disciplinary action for fighting', 'Requires medical evaluation for anxiety', 'Member of the robotics club and soccer team', '2020-01-10 19:50:41', '2020-01-10 19:50:41'),
(7, 7, 'Excellent academic performance with a GPA of 3.9', 'No disciplinary actions', 'Fit for duty', 'Member of the science club and tennis team', '2020-01-10 19:50:41', '2020-01-10 19:50:41'),
(8, 8, 'Good academic performance with a GPA of 3.7', 'Minor disciplinary action for cheating on a test', 'Fit for duty', 'Member of the literature club and baseball team', '2020-01-10 19:50:41', '2020-01-10 19:50:41'),
(9, 9, 'Average academic performance with a GPA of 3.1', 'Disciplinary action for theft', 'Requires medical evaluation for depression', 'Member of the photography club and rugby team', '2020-01-10 19:50:41', '2020-01-10 19:50:41'),
(10, 10, 'Excellent academic performance with a GPA of 4.0', 'No disciplinary actions', 'Fit for duty', 'Member of the math club and lacrosse team', '2020-01-10 19:50:41', '2020-01-10 19:50:41');

INSERT INTO `cadet_dossier` (`id`, `cadet_id`, `academic_records`, `disciplinary_records`, `medical_records`, `extracurricular_activities`, `created_at`, `updated_at`) VALUES
(11, 11, 'Good academic performance with a GPA of 3.5', 'Minor disciplinary action for insubordination', 'Fit for duty', 'Member of the history club and wrestling team', '2020-01-10 19:50:41', '2020-01-10 19:50:41'),
(12, 12, 'Average academic performance with a GPA of 3.0', 'Disciplinary action for drug use', 'Requires medical evaluation for substance abuse', 'Member of the drama club and basketball team', '2020-01-10 19:50:41', '2020-01-10 19:50:41'),
(13, 13, 'Excellent academic performance with a GPA of 3.9', 'No disciplinary actions', 'Fit for duty', 'Member of the science club and soccer team', '2020-01-10 19:50:41', '2020-01-10 19:50:41'),
(14, 14, 'Good academic performance with a GPA of 3.6', 'Minor disciplinary action for uniform violation', 'Fit for duty', 'Member of the art club and volleyball team', '2020-01-10 19:50:41', '2020-01-10 19:50:41'),
(15, 15, 'Average academic performance with a GPA of 3.2', 'Disciplinary action for fighting', 'Requires medical evaluation for anxiety', 'Member of the robotics club and soccer team', '2020-01-10 19:50:41', '2020-01-10 19:50:41');

INSERT INTO `cadet_dossier` (`id`, `cadet_id`, `academic_records`, `disciplinary_records`, `medical_records`, `extracurricular_activities`, `created_at`, `updated_at`) VALUES
(16, 16, 'Excellent academic performance with a GPA of 3.9', 'No disciplinary actions', 'Fit for duty', 'Member of the science club and tennis team', '2020-01-10 19:50:41', '2020-01-10 19:50:41'),
(17, 17, 'Good academic performance with a GPA of 3.7', 'Minor disciplinary action for cheating on a test', 'Fit for duty', 'Member of the literature club and baseball team', '2020-01-10 19:50:41', '2020-01-10 19:50:41'),
(18, 18, 'Average academic performance with a GPA of 3.1', 'Disciplinary action for theft', 'Requires medical evaluation for depression', 'Member of the photography club and rugby team', '2020-01-10 19:50:41', '2020-01-10 19:50:41'),
(19, 19, 'Excellent academic performance with a GPA of 4.0', 'No disciplinary actions', 'Fit for duty', 'Member of the math club and lacrosse team', '2020-01-10 19:50:41', '2020-01-10 19:50:41'),
(20, 20, 'Good academic performance with a GPA of 3.5', 'Minor disciplinary action for insubordination', 'Fit for duty', 'Member of the history club and wrestling team', '2020-01-10 19:50:41', '2020-01-10 19:50:41');

INSERT INTO `cadet_dossier` (`id`, `cadet_id`, `academic_records`, `disciplinary_records`, `medical_records`, `extracurricular_activities`, `created_at`, `updated_at`) VALUES
(21, 21, 'Average academic performance with a GPA of 3.0', 'Disciplinary action for drug use', 'Requires medical evaluation for substance abuse', 'Member of the drama club and basketball team', '2020-01-10 19:50:41', '2020-01-10 19:50:41'),
(22, 22, 'Excellent academic performance with a GPA of 3.9', 'No disciplinary actions', 'Fit for duty', 'Member of the science club and soccer team', '2020-01-10 19:50:41', '2020-01-10 19:50:41'),
(23, 23, 'Good academic performance with a GPA of 3.6', 'Minor disciplinary action for uniform violation', 'Fit for duty', 'Member of the art club and volleyball team', '2020-01-10 19:50:41', '2020-01-10 19:50:41'),
(24, 24, 'Average academic performance with a GPA of 3.2', 'Disciplinary action for fighting', 'Requires medical evaluation for anxiety', 'Member of the robotics club and soccer team', '2020-01-10 19:50:41', '2020-01-10 19:50:41'),
(25, 25, 'Excellent academic performance with a GPA of 3.9', 'No disciplinary actions', 'Fit for duty', 'Member of the science club and tennis team', '2020-01-10 19:50:41', '2020-01-10 19:50:41');

