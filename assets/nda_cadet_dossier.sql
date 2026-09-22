-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 08, 2026 at 09:41 PM
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
-- Table structure for table `appointments_held`
--

CREATE TABLE `appointments_held` (
  `id` int(11) NOT NULL,
  `cadet_id` int(11) NOT NULL,
  `year` varchar(10) DEFAULT NULL,
  `rank` varchar(50) DEFAULT NULL,
  `appointment_from` date DEFAULT NULL,
  `appointment_to` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `autobiography`
--

CREATE TABLE `autobiography` (
  `id` int(11) NOT NULL,
  `cadet_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `date_submitted` date DEFAULT NULL,
  `cadet_signature` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `awards`
--

CREATE TABLE `awards` (
  `id` int(11) NOT NULL,
  `cadet_id` int(11) NOT NULL,
  `year` varchar(10) DEFAULT NULL,
  `award_name` varchar(200) DEFAULT NULL,
  `award_date` date DEFAULT NULL,
  `event` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `awol_records`
--

CREATE TABLE `awol_records` (
  `id` int(11) NOT NULL,
  `cadet_id` int(11) NOT NULL,
  `serial_no` int(11) DEFAULT NULL,
  `absent_from` datetime DEFAULT NULL,
  `absent_to` datetime DEFAULT NULL,
  `duration_hours` decimal(5,2) DEFAULT NULL,
  `reported_by` varchar(100) DEFAULT NULL,
  `witnesses` text DEFAULT NULL,
  `action_taken` text DEFAULT NULL,
  `co_signature` varchar(100) DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `photo_path` varchar(255) DEFAULT NULL,
  `date_of_arrival` date DEFAULT NULL,
  `course_commenced` date DEFAULT NULL,
  `expected_graduation` int(4) DEFAULT NULL,
  `status` varchar(50) DEFAULT 'ACTIVE',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cadets`
--

INSERT INTO `cadets` (`id`, `intake`, `nda_no`, `surname`, `other_names`, `date_of_birth`, `place_of_birth`, `religion`, `denomination`, `tribe`, `state`, `lga`, `course`, `battalion`, `service`, `faculty`, `department`, `academic_group`, `medical_category`, `blood_group`, `identification_marks`, `photo_path`, `date_of_arrival`, `course_commenced`, `expected_graduation`, `status`, `created_at`, `updated_at`) VALUES
(1, '', 'NDA001', 'Ade', 'Chinedu', '2000-01-05', 'Lagos', 'Christianity', 'Catholic', 'Yoruba', 'Lagos', 'Ikeja', 'Mechanical Engineering', 'A Battalion', 'ARMY', 'Engineering', 'Mechanical Engineering', 'Engineering/Science', 'A1', 'O+', 'Scar on left eyebrow', 'uploads/photos/nda001.jpg', '2019-09-01', '2019-09-01', 2024, 'ACTIVE', '2026-04-03 23:34:39', '2026-04-03 23:34:39'),
(2, '', 'NDA002', 'Bello', 'Musa', '2000-05-10', 'Kano', 'Islam', 'Sunni', 'Hausa', 'Kano', 'Kano Municipal', 'Electrical Engineering', 'B Battalion', 'ARMY', 'Engineering', 'Electrical Engineering', 'Engineering/Science', 'A2', 'A+', 'Tattoo on right wrist', 'uploads/photos/nda002.jpg', '2019-09-01', '2019-09-01', 2024, 'ACTIVE', '2026-04-03 23:34:39', '2026-04-03 23:34:39'),
(3, '', 'NDA003', 'Okafor', 'Emeka', '1999-11-22', 'Enugu', 'Christianity', 'Protestant', 'Igbo', 'Enugu', 'Nsukka', 'Political Science', 'C Battalion', 'ARMY', 'Arts', 'Political Science', 'Arts/Social Science', 'B1', 'B+', 'Mole on left cheek', 'uploads/photos/nda003.jpg', '2019-09-01', '2019-09-01', 2024, 'ACTIVE', '2026-04-03 23:34:39', '2026-04-03 23:34:39'),
(4, '', 'NDA004', 'Ali', 'Fatima', '2000-09-15', 'Abuja', 'Islam', 'Sunni', 'Gwari', 'FCT', 'Gwagwalada', 'Management Science', 'D Battalion', 'ARMY', 'Management Science', 'Business Administration', 'Management Science', 'C1', 'O-', 'None', 'uploads/photos/nda004.jpg', '2019-09-01', '2019-09-01', 2024, 'ACTIVE', '2026-04-03 23:34:39', '2026-04-03 23:34:39'),
(5, '', 'NDA005', 'Nwankwo', 'Ifeanyi', '2001-03-12', 'Anambra', 'Christianity', 'Catholic', 'Igbo', 'Anambra', 'Aguata', 'History', 'E Battalion', 'ARMY', 'Arts', 'History', 'Arts/Social Science', 'B2', 'AB+', 'Birthmark on neck', 'uploads/photos/nda005.jpg', '2019-09-01', '2019-09-01', 2024, 'ACTIVE', '2026-04-03 23:34:39', '2026-04-03 23:34:39');

-- --------------------------------------------------------

--
-- Table structure for table `certifications`
--

CREATE TABLE `certifications` (
  `id` int(11) NOT NULL,
  `cadet_id` int(11) NOT NULL,
  `certification_date` date DEFAULT NULL,
  `cadet_signature` varchar(100) DEFAULT NULL,
  `course_officer_signature` varchar(100) DEFAULT NULL,
  `course_officer_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `combined_service_course`
--

CREATE TABLE `combined_service_course` (
  `id` int(11) NOT NULL,
  `cadet_id` int(11) NOT NULL,
  `date_of_passing_out` date DEFAULT NULL,
  `order_of_merit` int(11) DEFAULT NULL,
  `out_of` int(11) DEFAULT NULL,
  `date_of_commission` date DEFAULT NULL,
  `posted_to` varchar(100) DEFAULT NULL,
  `number_allotted` varchar(50) DEFAULT NULL,
  `authority` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `device_approval_logs`
--

CREATE TABLE `device_approval_logs` (
  `id` int(11) NOT NULL,
  `device_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `action` enum('APPROVED','REJECTED','REVOKED','REACTIVATED','AUTO_APPROVED') NOT NULL,
  `previous_status` tinyint(1) DEFAULT NULL,
  `new_status` tinyint(1) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `performed_by` int(11) NOT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `disciplinary_records`
--

CREATE TABLE `disciplinary_records` (
  `id` int(11) NOT NULL,
  `cadet_id` int(11) NOT NULL,
  `offence_type` enum('MINOR','MAJOR') NOT NULL,
  `serial_no` int(11) DEFAULT NULL,
  `date_of_offence` date DEFAULT NULL,
  `offence_description` text DEFAULT NULL,
  `punishment_awarded` text DEFAULT NULL,
  `by_whom_awarded` varchar(100) DEFAULT NULL,
  `publication` varchar(200) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `educational_qualifications`
--

CREATE TABLE `educational_qualifications` (
  `id` int(11) NOT NULL,
  `cadet_id` int(11) NOT NULL,
  `school_name` varchar(200) NOT NULL,
  `date_from` year(4) DEFAULT NULL,
  `date_to` year(4) DEFAULT NULL,
  `examination_passed` varchar(100) DEFAULT NULL,
  `examination_date` date DEFAULT NULL,
  `subjects_grades` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `extracurricular_activities`
--

CREATE TABLE `extracurricular_activities` (
  `id` int(11) NOT NULL,
  `cadet_id` int(11) NOT NULL,
  `scout_membership` varchar(100) DEFAULT NULL,
  `scout_details` text DEFAULT NULL,
  `acf_member` tinyint(1) DEFAULT 0,
  `acf_details` text DEFAULT NULL,
  `games_represented` text DEFAULT NULL,
  `hobbies` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `family_details`
--

CREATE TABLE `family_details` (
  `id` int(11) NOT NULL,
  `cadet_id` int(11) NOT NULL,
  `father_name` varchar(200) DEFAULT NULL,
  `father_profession` varchar(100) DEFAULT NULL,
  `father_address` text DEFAULT NULL,
  `guardian_name` varchar(200) DEFAULT NULL,
  `guardian_profession` varchar(100) DEFAULT NULL,
  `guardian_address` text DEFAULT NULL,
  `father_phone` varchar(20) DEFAULT NULL,
  `mother_phone` varchar(20) DEFAULT NULL,
  `annual_income` decimal(15,2) DEFAULT NULL,
  `scholarship_granted` varchar(200) DEFAULT NULL,
  `next_of_kin_name` varchar(200) DEFAULT NULL,
  `next_of_kin_relationship` varchar(50) DEFAULT NULL,
  `next_of_kin_address` text DEFAULT NULL,
  `permanent_home_address` text DEFAULT NULL,
  `nearest_railway_station` varchar(100) DEFAULT NULL,
  `distance_from_home_km` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `interviews_warnings`
--

CREATE TABLE `interviews_warnings` (
  `id` int(11) NOT NULL,
  `cadet_id` int(11) NOT NULL,
  `interview_date` date DEFAULT NULL,
  `conducted_by` varchar(100) DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `is_warning` tinyint(1) DEFAULT 0,
  `officer_initials` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(11) NOT NULL,
  `cadet_id` int(11) NOT NULL,
  `language_name` varchar(100) NOT NULL,
  `can_write` tinyint(1) DEFAULT 0,
  `can_read` tinyint(1) DEFAULT 0,
  `can_speak` tinyint(1) DEFAULT 0,
  `examination_passed` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `username_attempted` varchar(50) DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `ip_address_v6` varchar(45) DEFAULT NULL,
  `device_fingerprint` varchar(255) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `browser_name` varchar(50) DEFAULT NULL,
  `platform` varchar(50) DEFAULT NULL,
  `login_status` enum('SUCCESS','FAILED_INVALID_USER','FAILED_INVALID_PASSWORD','FAILED_DEVICE_NOT_APPROVED','FAILED_ACCOUNT_LOCKED','FAILED_INACTIVE','FAILED_EXCEEDED_DEVICES') NOT NULL,
  `failure_reason` varchar(255) DEFAULT NULL,
  `session_id` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `military_relatives`
--

CREATE TABLE `military_relatives` (
  `id` int(11) NOT NULL,
  `cadet_id` int(11) NOT NULL,
  `relative_name` varchar(200) NOT NULL,
  `rank` varchar(50) DEFAULT NULL,
  `unit` varchar(100) DEFAULT NULL,
  `relationship` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `performance_summary`
--

CREATE TABLE `performance_summary` (
  `id` int(11) NOT NULL,
  `cadet_id` int(11) NOT NULL,
  `academic_year` int(11) NOT NULL,
  `academics_max_marks` decimal(5,2) DEFAULT NULL,
  `academics_obtained_marks` decimal(5,2) DEFAULT NULL,
  `academics_percentage` decimal(5,2) DEFAULT NULL,
  `academics_grading` varchar(10) DEFAULT NULL,
  `peculiar_max_marks` decimal(5,2) DEFAULT NULL,
  `peculiar_obtained_marks` decimal(5,2) DEFAULT NULL,
  `peculiar_percentage` decimal(5,2) DEFAULT NULL,
  `peculiar_grading` varchar(10) DEFAULT NULL,
  `common_max_marks` decimal(5,2) DEFAULT NULL,
  `common_obtained_marks` decimal(5,2) DEFAULT NULL,
  `common_percentage` decimal(5,2) DEFAULT NULL,
  `common_grading` varchar(10) DEFAULT NULL,
  `personal_qualities_max_marks` decimal(5,2) DEFAULT NULL,
  `personal_qualities_obtained_marks` decimal(5,2) DEFAULT NULL,
  `personal_qualities_percentage` decimal(5,2) DEFAULT NULL,
  `personal_qualities_grading` varchar(10) DEFAULT NULL,
  `grand_total_max` decimal(5,2) DEFAULT NULL,
  `grand_total_obtained` decimal(5,2) DEFAULT NULL,
  `grand_total_percentage` decimal(5,2) DEFAULT NULL,
  `grand_total_grading` varchar(10) DEFAULT NULL,
  `order_merit_battalion` int(11) DEFAULT NULL,
  `out_of_battalion` int(11) DEFAULT NULL,
  `order_merit_course` int(11) DEFAULT NULL,
  `out_of_course` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_qualities`
--

CREATE TABLE `personal_qualities` (
  `id` int(11) NOT NULL,
  `cadet_id` int(11) NOT NULL,
  `academic_year` int(11) NOT NULL,
  `adaptability` decimal(3,1) DEFAULT NULL,
  `appearance_bearing` decimal(3,1) DEFAULT NULL,
  `conceptual_skill` decimal(3,1) DEFAULT NULL,
  `decisiveness` decimal(3,1) DEFAULT NULL,
  `dependability` decimal(3,1) DEFAULT NULL,
  `discipline` decimal(3,1) DEFAULT NULL,
  `drive_determination` decimal(3,1) DEFAULT NULL,
  `esprit_de_corps` decimal(3,1) DEFAULT NULL,
  `initiative` decimal(3,1) DEFAULT NULL,
  `integrity` decimal(3,1) DEFAULT NULL,
  `loyalty` decimal(3,1) DEFAULT NULL,
  `moral_courage` decimal(3,1) DEFAULT NULL,
  `self_improvement` decimal(3,1) DEFAULT NULL,
  `stamina` decimal(3,1) DEFAULT NULL,
  `verbal_expression` decimal(3,1) DEFAULT NULL,
  `total_score` decimal(5,2) DEFAULT NULL,
  `assessment_date` date DEFAULT NULL,
  `assessed_by` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `physical_measurements`
--

CREATE TABLE `physical_measurements` (
  `id` int(11) NOT NULL,
  `cadet_id` int(11) NOT NULL,
  `year_number` int(11) NOT NULL,
  `weight_beginning` decimal(5,2) DEFAULT NULL,
  `weight_end` decimal(5,2) DEFAULT NULL,
  `height_beginning` decimal(5,2) DEFAULT NULL,
  `height_end` decimal(5,2) DEFAULT NULL,
  `chest_beginning_normal` decimal(5,2) DEFAULT NULL,
  `chest_beginning_expanded` decimal(5,2) DEFAULT NULL,
  `chest_end_normal` decimal(5,2) DEFAULT NULL,
  `chest_end_expanded` decimal(5,2) DEFAULT NULL,
  `measurement_date` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `previous_service`
--

CREATE TABLE `previous_service` (
  `id` int(11) NOT NULL,
  `cadet_id` int(11) NOT NULL,
  `has_previous_service` tinyint(1) DEFAULT 0,
  `service_number` varchar(50) DEFAULT NULL,
  `rank` varchar(50) DEFAULT NULL,
  `date_of_enlistment` date DEFAULT NULL,
  `unit_formation` varchar(100) DEFAULT NULL,
  `pay_office_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `recommendations_remarks`
--

CREATE TABLE `recommendations_remarks` (
  `id` int(11) NOT NULL,
  `cadet_id` int(11) NOT NULL,
  `academic_year` int(11) NOT NULL,
  `bn_officer_remarks` text DEFAULT NULL,
  `bn_officer_signature` varchar(100) DEFAULT NULL,
  `bn_officer_name` varchar(100) DEFAULT NULL,
  `bn_officer_rank` varchar(50) DEFAULT NULL,
  `bn_officer_date` date DEFAULT NULL,
  `co_remarks` text DEFAULT NULL,
  `co_signature` varchar(100) DEFAULT NULL,
  `co_name` varchar(100) DEFAULT NULL,
  `co_rank` varchar(50) DEFAULT NULL,
  `co_date` date DEFAULT NULL,
  `cadet_signature` varchar(100) DEFAULT NULL,
  `cadet_date` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `record_of_leave`
--

CREATE TABLE `record_of_leave` (
  `id` int(11) NOT NULL,
  `cadet_id` int(11) NOT NULL,
  `serial_no` int(11) DEFAULT NULL,
  `leave_from` date DEFAULT NULL,
  `leave_to` date DEFAULT NULL,
  `type_of_leave` varchar(100) DEFAULT NULL,
  `destination` varchar(200) DEFAULT NULL,
  `battalion_officer_initials` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `relegations`
--

CREATE TABLE `relegations` (
  `id` int(11) NOT NULL,
  `cadet_id` int(11) NOT NULL,
  `relegation_number` int(11) DEFAULT NULL,
  `date_from` date DEFAULT NULL,
  `date_to` date DEFAULT NULL,
  `relegation_date` date DEFAULT NULL,
  `authority` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `security_settings`
--

CREATE TABLE `security_settings` (
  `id` int(11) NOT NULL,
  `setting_key` varchar(100) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(50) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `security_settings`
--

INSERT INTO `security_settings` (`id`, `setting_key`, `setting_value`, `setting_type`, `description`, `is_active`, `updated_at`) VALUES
(1, 'require_device_approval', '1', 'boolean', 'Require admin approval for new devices', 1, '2026-04-06 17:24:06'),
(2, 'auto_approve_same_ip', '0', 'boolean', 'Auto-approve devices from same IP range', 0, '2026-04-06 17:24:06'),
(3, 'max_login_attempts', '5', 'number', 'Maximum failed login attempts before lockout', 1, '2026-04-06 17:24:06'),
(4, 'lockout_duration_minutes', '30', 'number', 'Account lockout duration in minutes', 1, '2026-04-06 17:24:06'),
(5, 'session_timeout_minutes', '120', 'number', 'Session timeout in minutes', 1, '2026-04-06 17:24:06'),
(6, 'require_2fa', '0', 'boolean', 'Require two-factor authentication', 0, '2026-04-06 17:24:06'),
(7, 'allow_multiple_devices', '1', 'boolean', 'Allow multiple devices per user', 1, '2026-04-06 17:24:06'),
(8, 'max_devices_per_user', '5', 'number', 'Maximum devices allowed per user', 1, '2026-04-06 17:24:06'),
(9, 'log_all_login_attempts', '1', 'boolean', 'Log all login attempts', 1, '2026-04-06 17:24:06'),
(10, 'alert_on_new_device', '1', 'boolean', 'Send alert on new device login', 1, '2026-04-06 17:24:06'),
(11, 'auto_approve_admin_devices', '1', 'boolean', 'Auto-approve devices for ADMIN role', 0, '2026-04-06 17:24:06'),
(12, 'role_based_device_limit', '{\"ADMIN\": 10, \"OFFICER\": 5, \"CADET\": 3, \"STAFF\": 4}', 'json', 'Device limit per role', 1, '2026-04-06 17:24:06');

-- --------------------------------------------------------

--
-- Table structure for table `service_preferences`
--

CREATE TABLE `service_preferences` (
  `id` int(11) NOT NULL,
  `cadet_id` int(11) NOT NULL,
  `service_opted` varchar(50) DEFAULT NULL,
  `service_accepted` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sick_report_records`
--

CREATE TABLE `sick_report_records` (
  `id` int(11) NOT NULL,
  `cadet_id` int(11) NOT NULL,
  `training_year` enum('FIRST','SECOND','THIRD','FOURTH','FIFTH') NOT NULL,
  `serial_no` int(11) DEFAULT NULL,
  `sick_report_date` date DEFAULT NULL,
  `confinement_from` date DEFAULT NULL,
  `confinement_to` date DEFAULT NULL,
  `hospital_adm_from` date DEFAULT NULL,
  `hospital_adm_to` date DEFAULT NULL,
  `excuse_duty_from` date DEFAULT NULL,
  `excuse_duty_to` date DEFAULT NULL,
  `no_of_days` int(11) DEFAULT NULL,
  `reason_diagnosis` text DEFAULT NULL,
  `venue` varchar(100) DEFAULT NULL,
  `signature` varchar(100) DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `full_name` varchar(150) DEFAULT NULL,
  `role` enum('ADMIN','OFFICER','CADET','STAFF') NOT NULL,
  `rank` varchar(50) DEFAULT NULL,
  `battalion` varchar(50) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `account_locked` tinyint(1) DEFAULT 0,
  `account_locked_until` timestamp NULL DEFAULT NULL,
  `failed_login_attempts` int(11) DEFAULT 0,
  `require_device_approval` tinyint(1) DEFAULT 1,
  `two_factor_enabled` tinyint(1) DEFAULT 0,
  `two_factor_method` varchar(50) DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `last_device_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `full_name`, `role`, `rank`, `battalion`, `is_active`, `account_locked`, `account_locked_until`, `failed_login_attempts`, `require_device_approval`, `two_factor_enabled`, `two_factor_method`, `last_login`, `last_device_id`, `created_at`, `updated_at`) VALUES
(1, 'CBadmin', '790f48e3ba51e2d0762e7d4a74d4076a62cfb34d44e3dfbc43798fe9ff399602', 'admin@nda.mil', 'Admin User', 'ADMIN', 'Colonel', 'Command', 1, 0, NULL, 0, 1, 0, NULL, NULL, NULL, '2026-04-03 11:21:57', '2026-04-03 11:21:57'),
(2, 'cadet_smith', 'cc625fc23201ce69d216c1ae58ae1490c9ba840f8b04dd3bc62f05f51b9e89ac', 'smith@nda.mil', 'John Smith', 'CADET', 'Cadet', 'A Battalion', 1, 0, NULL, 0, 1, 0, NULL, NULL, NULL, '2026-04-03 11:21:57', '2026-04-03 11:21:57'),
(3, 'staff_jane', '9658e034fca22cc2a1008e5b0b177618f4e8f7113ebcf369a7a7ac7a8889ee2a', 'jane@nda.mil', 'Jane Okonkwo', 'STAFF', 'Senior NCO', 'B Battalion', 1, 0, NULL, 0, 1, 0, NULL, NULL, NULL, '2026-04-03 11:21:57', '2026-04-03 11:21:57'),
(5, 'admin', 'ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f', 'admin@nda.edu.ng', 'Admin User', 'ADMIN', NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, NULL, NULL, '2026-04-03 11:32:19', '2026-04-03 11:32:19'),
(6, 'silas', '$2y$10$EtFNkO3Sr5vE.Vus1QOXluj7Q12jR4nnUgcl6o.JHGRS.XuxLRcie', 'us@nda.mil', 'Ugwu Silas', 'OFFICER', NULL, NULL, 1, 0, NULL, 0, 1, 0, NULL, '2026-04-08 16:42:39', NULL, '2026-04-03 12:01:09', '2026-04-08 16:42:39');

-- --------------------------------------------------------

--
-- Table structure for table `user_devices`
--

CREATE TABLE `user_devices` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `device_name` varchar(100) DEFAULT NULL,
  `device_fingerprint` varchar(255) NOT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `ip_address_v6` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `browser_name` varchar(50) DEFAULT NULL,
  `browser_version` varchar(20) DEFAULT NULL,
  `platform` varchar(50) DEFAULT NULL,
  `screen_resolution` varchar(20) DEFAULT NULL,
  `timezone` varchar(50) DEFAULT NULL,
  `language` varchar(10) DEFAULT NULL,
  `mac_address_hash` varchar(255) DEFAULT NULL,
  `is_approved` tinyint(1) DEFAULT 0,
  `is_active` tinyint(1) DEFAULT 1,
  `is_current` tinyint(1) DEFAULT 0,
  `approval_requested_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `approved_at` timestamp NULL DEFAULT NULL,
  `approved_by` int(11) DEFAULT NULL,
  `last_login_at` timestamp NULL DEFAULT NULL,
  `last_ip_address` varchar(45) DEFAULT NULL,
  `login_count` int(11) DEFAULT 0,
  `failed_login_attempts` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_failed_login_summary`
-- (See below for the actual view)
--
CREATE TABLE `v_failed_login_summary` (
`id` int(11)
,`username` varchar(50)
,`full_name` varchar(150)
,`role` enum('ADMIN','OFFICER','CADET','STAFF')
,`failed_attempts_24h` bigint(21)
,`failed_attempts_1h` bigint(21)
,`failed_login_attempts` int(11)
,`account_locked` tinyint(1)
,`account_locked_until` timestamp
,`last_failed_attempt` timestamp
,`last_successful_login` timestamp
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_pending_device_approvals`
-- (See below for the actual view)
--
CREATE TABLE `v_pending_device_approvals` (
`device_id` int(11)
,`user_id` int(11)
,`username` varchar(50)
,`full_name` varchar(150)
,`email` varchar(100)
,`role` enum('ADMIN','OFFICER','CADET','STAFF')
,`rank` varchar(50)
,`battalion` varchar(50)
,`device_name` varchar(100)
,`device_fingerprint` varchar(255)
,`ip_address` varchar(45)
,`browser_name` varchar(50)
,`browser_version` varchar(20)
,`platform` varchar(50)
,`screen_resolution` varchar(20)
,`timezone` varchar(50)
,`approval_requested_at` timestamp
,`login_count` int(11)
,`device_status` varchar(16)
,`hours_pending` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_security_alerts`
-- (See below for the actual view)
--
CREATE TABLE `v_security_alerts` (
`id` int(11)
,`user_id` int(11)
,`username` varchar(50)
,`full_name` varchar(150)
,`role` enum('ADMIN','OFFICER','CADET','STAFF')
,`rank` varchar(50)
,`ip_address` varchar(45)
,`device_fingerprint` varchar(255)
,`browser_name` varchar(50)
,`platform` varchar(50)
,`login_status` enum('SUCCESS','FAILED_INVALID_USER','FAILED_INVALID_PASSWORD','FAILED_DEVICE_NOT_APPROVED','FAILED_ACCOUNT_LOCKED','FAILED_INACTIVE','FAILED_EXCEEDED_DEVICES')
,`failure_reason` varchar(255)
,`created_at` timestamp
,`alert_type` varchar(8)
,`minutes_ago` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_user_devices_summary`
-- (See below for the actual view)
--
CREATE TABLE `v_user_devices_summary` (
`user_id` int(11)
,`username` varchar(50)
,`full_name` varchar(150)
,`email` varchar(100)
,`role` enum('ADMIN','OFFICER','CADET','STAFF')
,`rank` varchar(50)
,`battalion` varchar(50)
,`total_devices` bigint(21)
,`approved_devices` decimal(22,0)
,`pending_devices` decimal(22,0)
,`current_device` decimal(22,0)
,`last_login` timestamp
,`last_ip` varchar(45)
,`is_locked` tinyint(1)
,`failed_login_attempts` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `withdrawals_dismissals`
--

CREATE TABLE `withdrawals_dismissals` (
  `id` int(11) NOT NULL,
  `cadet_id` int(11) NOT NULL,
  `withdrawal_date` date DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `authority` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure for view `v_failed_login_summary`
--
DROP TABLE IF EXISTS `v_failed_login_summary`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_failed_login_summary`  AS SELECT `u`.`id` AS `id`, `u`.`username` AS `username`, `u`.`full_name` AS `full_name`, `u`.`role` AS `role`, count(case when `la`.`login_status` like 'FAILED%' then 1 end) AS `failed_attempts_24h`, count(case when `la`.`created_at` >= current_timestamp() - interval 1 hour and `la`.`login_status` like 'FAILED%' then 1 end) AS `failed_attempts_1h`, `u`.`failed_login_attempts` AS `failed_login_attempts`, `u`.`account_locked` AS `account_locked`, `u`.`account_locked_until` AS `account_locked_until`, max(`la`.`created_at`) AS `last_failed_attempt`, max(case when `la`.`login_status` = 'SUCCESS' then `la`.`created_at` end) AS `last_successful_login` FROM (`users` `u` left join `login_attempts` `la` on(`u`.`id` = `la`.`user_id` and `la`.`created_at` >= current_timestamp() - interval 24 hour)) WHERE `u`.`is_active` = 1 GROUP BY `u`.`id`, `u`.`username`, `u`.`full_name`, `u`.`role`, `u`.`failed_login_attempts`, `u`.`account_locked`, `u`.`account_locked_until` ;

-- --------------------------------------------------------

--
-- Structure for view `v_pending_device_approvals`
--
DROP TABLE IF EXISTS `v_pending_device_approvals`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_pending_device_approvals`  AS SELECT `ud`.`id` AS `device_id`, `ud`.`user_id` AS `user_id`, `u`.`username` AS `username`, `u`.`full_name` AS `full_name`, `u`.`email` AS `email`, `u`.`role` AS `role`, `u`.`rank` AS `rank`, `u`.`battalion` AS `battalion`, `ud`.`device_name` AS `device_name`, `ud`.`device_fingerprint` AS `device_fingerprint`, `ud`.`ip_address` AS `ip_address`, `ud`.`browser_name` AS `browser_name`, `ud`.`browser_version` AS `browser_version`, `ud`.`platform` AS `platform`, `ud`.`screen_resolution` AS `screen_resolution`, `ud`.`timezone` AS `timezone`, `ud`.`approval_requested_at` AS `approval_requested_at`, `ud`.`login_count` AS `login_count`, CASE WHEN `ud`.`login_count` = 0 THEN 'First Time' ELSE 'Returning Device' END AS `device_status`, timestampdiff(HOUR,`ud`.`approval_requested_at`,current_timestamp()) AS `hours_pending` FROM (`user_devices` `ud` join `users` `u` on(`ud`.`user_id` = `u`.`id`)) WHERE `ud`.`is_approved` = 0 AND `ud`.`is_active` = 1 ORDER BY `ud`.`approval_requested_at` DESC ;

-- --------------------------------------------------------

--
-- Structure for view `v_security_alerts`
--
DROP TABLE IF EXISTS `v_security_alerts`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_security_alerts`  AS SELECT `la`.`id` AS `id`, `la`.`user_id` AS `user_id`, `u`.`username` AS `username`, `u`.`full_name` AS `full_name`, `u`.`role` AS `role`, `u`.`rank` AS `rank`, `la`.`ip_address` AS `ip_address`, `la`.`device_fingerprint` AS `device_fingerprint`, `la`.`browser_name` AS `browser_name`, `la`.`platform` AS `platform`, `la`.`login_status` AS `login_status`, `la`.`failure_reason` AS `failure_reason`, `la`.`created_at` AS `created_at`, CASE WHEN `la`.`login_status` = 'LOGIN_ATTEMPTS_EXCEEDED' THEN 'critical' WHEN `la`.`login_status` like 'FAILED%' THEN 'danger' WHEN `ud`.`is_approved` = 0 THEN 'warning' ELSE 'info' END AS `alert_type`, timestampdiff(MINUTE,`la`.`created_at`,current_timestamp()) AS `minutes_ago` FROM ((`login_attempts` `la` left join `users` `u` on(`la`.`user_id` = `u`.`id`)) left join `user_devices` `ud` on(`la`.`device_fingerprint` = `ud`.`device_fingerprint` and `la`.`user_id` = `ud`.`user_id`)) WHERE `la`.`created_at` >= current_timestamp() - interval 24 hour ORDER BY `la`.`created_at` DESC ;

-- --------------------------------------------------------

--
-- Structure for view `v_user_devices_summary`
--
DROP TABLE IF EXISTS `v_user_devices_summary`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_user_devices_summary`  AS SELECT `u`.`id` AS `user_id`, `u`.`username` AS `username`, `u`.`full_name` AS `full_name`, `u`.`email` AS `email`, `u`.`role` AS `role`, `u`.`rank` AS `rank`, `u`.`battalion` AS `battalion`, count(`ud`.`id`) AS `total_devices`, sum(case when `ud`.`is_approved` = 1 then 1 else 0 end) AS `approved_devices`, sum(case when `ud`.`is_approved` = 0 then 1 else 0 end) AS `pending_devices`, sum(case when `ud`.`is_current` = 1 then 1 else 0 end) AS `current_device`, max(`ud`.`last_login_at`) AS `last_login`, max(`ud`.`ip_address`) AS `last_ip`, `u`.`account_locked` AS `is_locked`, `u`.`failed_login_attempts` AS `failed_login_attempts` FROM (`users` `u` left join `user_devices` `ud` on(`u`.`id` = `ud`.`user_id`)) WHERE `u`.`is_active` = 1 GROUP BY `u`.`id`, `u`.`username`, `u`.`full_name`, `u`.`email`, `u`.`role`, `u`.`rank`, `u`.`battalion`, `u`.`account_locked`, `u`.`failed_login_attempts` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointments_held`
--
ALTER TABLE `appointments_held`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_cadet_id` (`cadet_id`);

--
-- Indexes for table `autobiography`
--
ALTER TABLE `autobiography`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_cadet_id` (`cadet_id`);

--
-- Indexes for table `awards`
--
ALTER TABLE `awards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_cadet_id` (`cadet_id`);

--
-- Indexes for table `awol_records`
--
ALTER TABLE `awol_records`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_cadet_id` (`cadet_id`);

--
-- Indexes for table `cadets`
--
ALTER TABLE `cadets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nda_no` (`nda_no`);

--
-- Indexes for table `certifications`
--
ALTER TABLE `certifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_cadet_id` (`cadet_id`);

--
-- Indexes for table `combined_service_course`
--
ALTER TABLE `combined_service_course`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_cadet_id` (`cadet_id`);

--
-- Indexes for table `device_approval_logs`
--
ALTER TABLE `device_approval_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_device_id` (`device_id`),
  ADD KEY `idx_user_id` (`user_id`),
  ADD KEY `idx_performed_by` (`performed_by`),
  ADD KEY `idx_action` (`action`),
  ADD KEY `idx_created_at` (`created_at`);

--
-- Indexes for table `disciplinary_records`
--
ALTER TABLE `disciplinary_records`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_cadet_type` (`cadet_id`,`offence_type`);

--
-- Indexes for table `educational_qualifications`
--
ALTER TABLE `educational_qualifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_cadet_id` (`cadet_id`);

--
-- Indexes for table `extracurricular_activities`
--
ALTER TABLE `extracurricular_activities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_cadet_id` (`cadet_id`);

--
-- Indexes for table `family_details`
--
ALTER TABLE `family_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_cadet_id` (`cadet_id`);

--
-- Indexes for table `interviews_warnings`
--
ALTER TABLE `interviews_warnings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_cadet_id` (`cadet_id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_cadet_id` (`cadet_id`);

--
-- Indexes for table `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user_id` (`user_id`),
  ADD KEY `idx_username_attempted` (`username_attempted`),
  ADD KEY `idx_ip_address` (`ip_address`),
  ADD KEY `idx_created_at` (`created_at`),
  ADD KEY `idx_login_status` (`login_status`),
  ADD KEY `idx_device_fingerprint` (`device_fingerprint`);

--
-- Indexes for table `military_relatives`
--
ALTER TABLE `military_relatives`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_cadet_id` (`cadet_id`);

--
-- Indexes for table `performance_summary`
--
ALTER TABLE `performance_summary`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_cadet_year` (`cadet_id`,`academic_year`);

--
-- Indexes for table `personal_qualities`
--
ALTER TABLE `personal_qualities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_cadet_year` (`cadet_id`,`academic_year`);

--
-- Indexes for table `physical_measurements`
--
ALTER TABLE `physical_measurements`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_cadet_year` (`cadet_id`,`year_number`),
  ADD KEY `idx_cadet_year` (`cadet_id`,`year_number`);

--
-- Indexes for table `previous_service`
--
ALTER TABLE `previous_service`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_cadet_id` (`cadet_id`);

--
-- Indexes for table `recommendations_remarks`
--
ALTER TABLE `recommendations_remarks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_cadet_year` (`cadet_id`,`academic_year`);

--
-- Indexes for table `record_of_leave`
--
ALTER TABLE `record_of_leave`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_cadet_id` (`cadet_id`);

--
-- Indexes for table `relegations`
--
ALTER TABLE `relegations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_cadet_id` (`cadet_id`);

--
-- Indexes for table `security_settings`
--
ALTER TABLE `security_settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `setting_key` (`setting_key`),
  ADD KEY `idx_setting_key` (`setting_key`);

--
-- Indexes for table `service_preferences`
--
ALTER TABLE `service_preferences`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_cadet_id` (`cadet_id`);

--
-- Indexes for table `sick_report_records`
--
ALTER TABLE `sick_report_records`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_cadet_year` (`cadet_id`,`training_year`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `idx_username` (`username`),
  ADD KEY `idx_role` (`role`),
  ADD KEY `last_device_id` (`last_device_id`);

--
-- Indexes for table `user_devices`
--
ALTER TABLE `user_devices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_user_device` (`user_id`,`device_fingerprint`),
  ADD KEY `approved_by` (`approved_by`),
  ADD KEY `idx_user_id` (`user_id`),
  ADD KEY `idx_device_fingerprint` (`device_fingerprint`),
  ADD KEY `idx_ip_address` (`ip_address`),
  ADD KEY `idx_is_approved` (`is_approved`),
  ADD KEY `idx_browser_name` (`browser_name`);

--
-- Indexes for table `withdrawals_dismissals`
--
ALTER TABLE `withdrawals_dismissals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_cadet_id` (`cadet_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointments_held`
--
ALTER TABLE `appointments_held`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `autobiography`
--
ALTER TABLE `autobiography`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `awards`
--
ALTER TABLE `awards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `awol_records`
--
ALTER TABLE `awol_records`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cadets`
--
ALTER TABLE `cadets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `certifications`
--
ALTER TABLE `certifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `combined_service_course`
--
ALTER TABLE `combined_service_course`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `device_approval_logs`
--
ALTER TABLE `device_approval_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `disciplinary_records`
--
ALTER TABLE `disciplinary_records`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `educational_qualifications`
--
ALTER TABLE `educational_qualifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `extracurricular_activities`
--
ALTER TABLE `extracurricular_activities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `family_details`
--
ALTER TABLE `family_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `interviews_warnings`
--
ALTER TABLE `interviews_warnings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `military_relatives`
--
ALTER TABLE `military_relatives`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `performance_summary`
--
ALTER TABLE `performance_summary`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_qualities`
--
ALTER TABLE `personal_qualities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `physical_measurements`
--
ALTER TABLE `physical_measurements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `previous_service`
--
ALTER TABLE `previous_service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `recommendations_remarks`
--
ALTER TABLE `recommendations_remarks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `record_of_leave`
--
ALTER TABLE `record_of_leave`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `relegations`
--
ALTER TABLE `relegations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `security_settings`
--
ALTER TABLE `security_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `service_preferences`
--
ALTER TABLE `service_preferences`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sick_report_records`
--
ALTER TABLE `sick_report_records`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user_devices`
--
ALTER TABLE `user_devices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `withdrawals_dismissals`
--
ALTER TABLE `withdrawals_dismissals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointments_held`
--
ALTER TABLE `appointments_held`
  ADD CONSTRAINT `appointments_held_ibfk_1` FOREIGN KEY (`cadet_id`) REFERENCES `cadets` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `autobiography`
--
ALTER TABLE `autobiography`
  ADD CONSTRAINT `autobiography_ibfk_1` FOREIGN KEY (`cadet_id`) REFERENCES `cadets` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `awards`
--
ALTER TABLE `awards`
  ADD CONSTRAINT `awards_ibfk_1` FOREIGN KEY (`cadet_id`) REFERENCES `cadets` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `awol_records`
--
ALTER TABLE `awol_records`
  ADD CONSTRAINT `awol_records_ibfk_1` FOREIGN KEY (`cadet_id`) REFERENCES `cadets` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `certifications`
--
ALTER TABLE `certifications`
  ADD CONSTRAINT `certifications_ibfk_1` FOREIGN KEY (`cadet_id`) REFERENCES `cadets` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `combined_service_course`
--
ALTER TABLE `combined_service_course`
  ADD CONSTRAINT `combined_service_course_ibfk_1` FOREIGN KEY (`cadet_id`) REFERENCES `cadets` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `device_approval_logs`
--
ALTER TABLE `device_approval_logs`
  ADD CONSTRAINT `device_approval_logs_ibfk_1` FOREIGN KEY (`device_id`) REFERENCES `user_devices` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `device_approval_logs_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `device_approval_logs_ibfk_3` FOREIGN KEY (`performed_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `disciplinary_records`
--
ALTER TABLE `disciplinary_records`
  ADD CONSTRAINT `disciplinary_records_ibfk_1` FOREIGN KEY (`cadet_id`) REFERENCES `cadets` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `educational_qualifications`
--
ALTER TABLE `educational_qualifications`
  ADD CONSTRAINT `educational_qualifications_ibfk_1` FOREIGN KEY (`cadet_id`) REFERENCES `cadets` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `extracurricular_activities`
--
ALTER TABLE `extracurricular_activities`
  ADD CONSTRAINT `extracurricular_activities_ibfk_1` FOREIGN KEY (`cadet_id`) REFERENCES `cadets` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `family_details`
--
ALTER TABLE `family_details`
  ADD CONSTRAINT `family_details_ibfk_1` FOREIGN KEY (`cadet_id`) REFERENCES `cadets` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `interviews_warnings`
--
ALTER TABLE `interviews_warnings`
  ADD CONSTRAINT `interviews_warnings_ibfk_1` FOREIGN KEY (`cadet_id`) REFERENCES `cadets` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `languages`
--
ALTER TABLE `languages`
  ADD CONSTRAINT `languages_ibfk_1` FOREIGN KEY (`cadet_id`) REFERENCES `cadets` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD CONSTRAINT `login_attempts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `military_relatives`
--
ALTER TABLE `military_relatives`
  ADD CONSTRAINT `military_relatives_ibfk_1` FOREIGN KEY (`cadet_id`) REFERENCES `cadets` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `performance_summary`
--
ALTER TABLE `performance_summary`
  ADD CONSTRAINT `performance_summary_ibfk_1` FOREIGN KEY (`cadet_id`) REFERENCES `cadets` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `personal_qualities`
--
ALTER TABLE `personal_qualities`
  ADD CONSTRAINT `personal_qualities_ibfk_1` FOREIGN KEY (`cadet_id`) REFERENCES `cadets` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `physical_measurements`
--
ALTER TABLE `physical_measurements`
  ADD CONSTRAINT `physical_measurements_ibfk_1` FOREIGN KEY (`cadet_id`) REFERENCES `cadets` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `previous_service`
--
ALTER TABLE `previous_service`
  ADD CONSTRAINT `previous_service_ibfk_1` FOREIGN KEY (`cadet_id`) REFERENCES `cadets` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `recommendations_remarks`
--
ALTER TABLE `recommendations_remarks`
  ADD CONSTRAINT `recommendations_remarks_ibfk_1` FOREIGN KEY (`cadet_id`) REFERENCES `cadets` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `record_of_leave`
--
ALTER TABLE `record_of_leave`
  ADD CONSTRAINT `record_of_leave_ibfk_1` FOREIGN KEY (`cadet_id`) REFERENCES `cadets` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `relegations`
--
ALTER TABLE `relegations`
  ADD CONSTRAINT `relegations_ibfk_1` FOREIGN KEY (`cadet_id`) REFERENCES `cadets` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `service_preferences`
--
ALTER TABLE `service_preferences`
  ADD CONSTRAINT `service_preferences_ibfk_1` FOREIGN KEY (`cadet_id`) REFERENCES `cadets` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sick_report_records`
--
ALTER TABLE `sick_report_records`
  ADD CONSTRAINT `sick_report_records_ibfk_1` FOREIGN KEY (`cadet_id`) REFERENCES `cadets` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`last_device_id`) REFERENCES `user_devices` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `user_devices`
--
ALTER TABLE `user_devices`
  ADD CONSTRAINT `user_devices_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_devices_ibfk_2` FOREIGN KEY (`approved_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `withdrawals_dismissals`
--
ALTER TABLE `withdrawals_dismissals`
  ADD CONSTRAINT `withdrawals_dismissals_ibfk_1` FOREIGN KEY (`cadet_id`) REFERENCES `cadets` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
