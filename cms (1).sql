-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 21, 2024 at 02:32 PM
-- Server version: 5.7.40
-- PHP Version: 8.1.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cms`
--

-- --------------------------------------------------------

--
-- Table structure for table `borrows`
--

DROP TABLE IF EXISTS `borrows`;
CREATE TABLE IF NOT EXISTS `borrows` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `component_archive_id` bigint(20) UNSIGNED DEFAULT NULL,
  `borrower_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `borrower_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `borrow_date` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `return_date` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reason` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `returnstatus` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `returncondition` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `verified` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20240418004642 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `borrows`
--

INSERT INTO `borrows` (`id`, `user_id`, `component_archive_id`, `borrower_name`, `borrower_type`, `status`, `borrow_date`, `return_date`, `reason`, `returnstatus`, `returncondition`, `verified`, `created_at`, `updated_at`) VALUES
(20240418004641, 20210728093545, 20240418004434, 'Jae Enolpe', 'admin', 'RETURNED', '2024-04-20T00:46', '2024-04-20T00:46', 'activity', 'On Time', 'Good', 0, '2024-04-17 16:46:41', '2024-04-17 16:47:53');

-- --------------------------------------------------------

--
-- Table structure for table `components`
--

DROP TABLE IF EXISTS `components`;
CREATE TABLE IF NOT EXISTS `components` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `room_id` bigint(20) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `submitted_by` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `component_archives`
--

DROP TABLE IF EXISTS `component_archives`;
CREATE TABLE IF NOT EXISTS `component_archives` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `room_id` bigint(20) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `submitted_by` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20240418004435 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `component_archives`
--

INSERT INTO `component_archives` (`id`, `user_id`, `room_id`, `name`, `description`, `image`, `model_number`, `status`, `category`, `submitted_by`, `active`, `created_at`, `updated_at`) VALUES
(20240418004434, 20210728093545, 20240418004251, 'Transcend Flash Drive', 'Transcend Flash Drive', NULL, '2.5SATA-SSD512GB', 'AVAILABLE', 'Storage Devices', 'Jae Enolpe', 1, '2024-04-17 16:44:34', '2024-04-17 16:48:26');

-- --------------------------------------------------------

--
-- Table structure for table `component_transactions`
--

DROP TABLE IF EXISTS `component_transactions`;
CREATE TABLE IF NOT EXISTS `component_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `room_id` bigint(20) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `submitted_by` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20240418004827 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `component_transactions`
--

INSERT INTO `component_transactions` (`id`, `user_id`, `room_id`, `name`, `description`, `model_number`, `status`, `category`, `image`, `submitted_by`, `action`, `created_at`, `updated_at`) VALUES
(20240418004434, 20210728093545, 20240418004251, 'Transcend Flash Drive', '8gb 3.0 USB Flash Drive', '2.5SATA-SSD512GB', 'AVAILABLE', 'Storage Devices', NULL, 'Jae Enolpe', 'STORE', '2024-04-17 16:44:34', '2024-04-17 16:44:34'),
(20240418004449, 20210728093545, 20240418004251, 'Transcend Flash Drive', 'Transcend Flash Drive', '2.5SATA-SSD512GB', 'UNAVAILABLE', 'Storage Devices', NULL, 'Jae Enolpe', 'UPDATE', '2024-04-17 16:44:49', '2024-04-17 16:44:49'),
(20240418004622, 20210728093545, 20240418004251, 'Transcend Flash Drive', 'Transcend Flash Drive', '2.5SATA-SSD512GB', 'AVAILABLE', 'Storage Devices', NULL, 'Jae Enolpe', 'UPDATE', '2024-04-17 16:46:22', '2024-04-17 16:46:22'),
(20240418004826, 20210728093545, 20240418004251, 'Transcend Flash Drive', 'Transcend Flash Drive', '2.5SATA-SSD512GB', 'AVAILABLE', 'Storage Devices', NULL, 'Jae Enolpe', 'DELETE', '2024-04-17 16:48:26', '2024-04-17 16:48:26');

-- --------------------------------------------------------

--
-- Table structure for table `computercategs`
--

DROP TABLE IF EXISTS `computercategs`;
CREATE TABLE IF NOT EXISTS `computercategs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20240418005738 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `computercategs`
--

INSERT INTO `computercategs` (`id`, `category_name`, `created_at`, `updated_at`) VALUES
(20240418005737, 'RAMs', '2024-04-17 16:57:37', '2024-04-17 17:06:42'),
(20240418005348, 'Motherboard', '2024-04-17 16:53:48', '2024-04-17 16:53:48');

-- --------------------------------------------------------

--
-- Table structure for table `computercateg_archives`
--

DROP TABLE IF EXISTS `computercateg_archives`;
CREATE TABLE IF NOT EXISTS `computercateg_archives` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `category_name` text NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20240418005738 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `computercateg_archives`
--

INSERT INTO `computercateg_archives` (`id`, `category_name`, `created_at`, `updated_at`) VALUES
(20240418005737, 'RAM', '2024-04-17 16:57:37', '2024-04-17 16:57:37'),
(20240418005348, 'Motherboard', '2024-04-17 16:53:48', '2024-04-17 16:53:48'),
(20240418005219, 'Motherboard', '2024-04-17 16:52:19', '2024-04-17 16:52:19'),
(20240418004947, 'Motherboard', '2024-04-17 16:49:47', '2024-04-17 16:49:47');

-- --------------------------------------------------------

--
-- Table structure for table `computerparts`
--

DROP TABLE IF EXISTS `computerparts`;
CREATE TABLE IF NOT EXISTS `computerparts` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `computer_id` bigint(20) UNSIGNED NOT NULL,
  `computer_serialnumber` bigint(20) DEFAULT NULL,
  `room_id` bigint(20) UNSIGNED NOT NULL,
  `brand` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `computercateg_id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `submitted_by` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20240418005803 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `computerparts`
--

INSERT INTO `computerparts` (`id`, `computer_id`, `computer_serialnumber`, `room_id`, `brand`, `model_number`, `status`, `computercateg_id`, `image`, `submitted_by`, `created_at`, `updated_at`) VALUES
(20240418005459, 20240418004930, 127405, 20240418004251, 'Asus', 'B550-A mATX', 'Inactive', 20240418005348, NULL, 'Jae Enolpe', '2024-04-17 16:54:59', '2024-04-17 16:55:09'),
(20240418005802, 20240418004930, 127405, 20240418004251, 'Asus', 'B550-A mATX', 'Active', 20240418005737, NULL, 'Jae Enolpe', '2024-04-17 16:58:02', '2024-04-17 16:58:02');

-- --------------------------------------------------------

--
-- Table structure for table `computerpart_archives`
--

DROP TABLE IF EXISTS `computerpart_archives`;
CREATE TABLE IF NOT EXISTS `computerpart_archives` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `computer_id` bigint(20) UNSIGNED NOT NULL,
  `computer_serialnumber` bigint(20) DEFAULT NULL,
  `room_id` bigint(20) UNSIGNED NOT NULL,
  `brand` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `computercateg_id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `submitted_by` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20240418005803 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `computerpart_archives`
--

INSERT INTO `computerpart_archives` (`id`, `computer_id`, `computer_serialnumber`, `room_id`, `brand`, `model_number`, `status`, `computercateg_id`, `image`, `active`, `submitted_by`, `created_at`, `updated_at`) VALUES
(20240418005802, 20240418004930, NULL, 20240418004251, 'Asus', 'B550-A mATX', 'Active', 20240418005737, NULL, 0, 'Jae Enolpe', '2024-04-17 16:58:02', '2024-04-17 16:58:02'),
(20240418005459, 20240418004930, NULL, 20240418004251, 'Asus', 'B550-A mATX', 'Active', 20240418005348, NULL, 0, 'Jae Enolpe', '2024-04-17 16:54:59', '2024-04-17 16:54:59'),
(20240418005235, 20240418004930, NULL, 20240418004251, 'Asus', 'B550-A mATX', 'Archived', 20240418005219, NULL, 1, 'Jae Enolpe', '2024-04-17 16:52:35', '2024-04-17 16:54:41');

-- --------------------------------------------------------

--
-- Table structure for table `computerpart_transactions`
--

DROP TABLE IF EXISTS `computerpart_transactions`;
CREATE TABLE IF NOT EXISTS `computerpart_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `computer_id` bigint(20) UNSIGNED NOT NULL,
  `room_id` bigint(20) UNSIGNED NOT NULL,
  `brand` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `computercateg_id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `submitted_by` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20240418005803 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `computerpart_transactions`
--

INSERT INTO `computerpart_transactions` (`id`, `computer_id`, `room_id`, `brand`, `model_number`, `status`, `computercateg_id`, `image`, `action`, `submitted_by`, `created_at`, `updated_at`) VALUES
(20240418005802, 20240418004930, 20240418004251, 'Asus', 'B550-A mATX', 'Active', 20240418005737, NULL, 'STORE', 'Jae Enolpe', '2024-04-17 16:58:02', '2024-04-17 16:58:02'),
(20240418005459, 20240418004930, 20240418004251, 'Asus', 'B550-A mATX', 'Active', 20240418005348, NULL, 'STORE', 'Jae Enolpe', '2024-04-17 16:54:59', '2024-04-17 16:54:59'),
(20240418005441, 20240418004930, 20240418004251, 'Asus', 'B550-A mATX', 'Archived', 20240418005219, NULL, 'DELETE', 'Jae Enolpe', '2024-04-17 16:54:41', '2024-04-17 16:54:41'),
(20240418005235, 20240418004930, 20240418004251, 'Asus', 'B550-A mATX', 'Active', 20240418005219, NULL, 'STORE', 'Jae Enolpe', '2024-04-17 16:52:35', '2024-04-17 16:52:35');

-- --------------------------------------------------------

--
-- Table structure for table `computerperipherals`
--

DROP TABLE IF EXISTS `computerperipherals`;
CREATE TABLE IF NOT EXISTS `computerperipherals` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `brand` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `computercateg_id` int(100) NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `submitted_by` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `computerperipheral_archives`
--

DROP TABLE IF EXISTS `computerperipheral_archives`;
CREATE TABLE IF NOT EXISTS `computerperipheral_archives` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `brand` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `computercateg_id` bigint(191) NOT NULL,
  `model_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `submitted_by` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `computers`
--

DROP TABLE IF EXISTS `computers`;
CREATE TABLE IF NOT EXISTS `computers` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `computer_number` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `serial_number` bigint(11) NOT NULL,
  `room_id` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20240418004931 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `computers`
--

INSERT INTO `computers` (`id`, `computer_number`, `serial_number`, `room_id`, `status`, `created_at`, `updated_at`) VALUES
(20240418004930, '01', 127405, '20240418004251', NULL, '2024-04-17 16:49:30', '2024-04-17 16:49:30');

-- --------------------------------------------------------

--
-- Table structure for table `computer_archives`
--

DROP TABLE IF EXISTS `computer_archives`;
CREATE TABLE IF NOT EXISTS `computer_archives` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `computer_number` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `serial_number` bigint(20) NOT NULL,
  `computer_specification` text COLLATE utf8mb4_unicode_ci,
  `room_id` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20240418004931 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `computer_archives`
--

INSERT INTO `computer_archives` (`id`, `computer_number`, `serial_number`, `computer_specification`, `room_id`, `status`, `active`, `created_at`, `updated_at`) VALUES
(20240418004855, '01', 205472, '[]', '20240418004251', 'Archived', 1, '2024-04-17 16:48:55', '2024-04-17 16:49:22'),
(20240418004930, '01', 127405, NULL, '20240418004251', NULL, 0, '2024-04-17 16:49:30', '2024-04-17 16:49:30');

-- --------------------------------------------------------

--
-- Table structure for table `computer_transactions`
--

DROP TABLE IF EXISTS `computer_transactions`;
CREATE TABLE IF NOT EXISTS `computer_transactions` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `computer_number` text NOT NULL,
  `serial_number` bigint(20) DEFAULT NULL,
  `room_id` text NOT NULL,
  `status` varchar(191) DEFAULT NULL,
  `action` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20240418004931 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `computer_transactions`
--

INSERT INTO `computer_transactions` (`id`, `computer_number`, `serial_number`, `room_id`, `status`, `action`, `created_at`, `updated_at`) VALUES
(20240418004930, '01', 127405, '20240418004251', NULL, 'STORE', '2024-04-17 16:49:30', '2024-04-17 16:49:30'),
(20240418004922, '01', NULL, '20240418004251', 'Archived', 'DELETE', '2024-04-17 16:49:22', '2024-04-17 16:49:22'),
(20240418004855, '01', 205472, '20240418004251', NULL, 'STORE', '2024-04-17 16:48:55', '2024-04-17 16:48:55');

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
CREATE TABLE IF NOT EXISTS `courses` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `coursename` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `department_id` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `coursename`, `department_id`, `created_at`, `updated_at`) VALUES
(16, 'BS ID', '20240418003835', '2024-04-18 15:47:21', '2024-04-18 15:47:21');

-- --------------------------------------------------------

--
-- Table structure for table `course_archives`
--

DROP TABLE IF EXISTS `course_archives`;
CREATE TABLE IF NOT EXISTS `course_archives` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `coursename` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `department_id` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `course_archives`
--

INSERT INTO `course_archives` (`id`, `coursename`, `department_id`, `active`, `created_at`, `updated_at`) VALUES
(16, 'BS ID', '20240418003835', 0, '2024-04-18 15:47:21', '2024-04-18 15:47:21'),
(15, 'BS IE', '20240418011923', 1, '2024-04-17 17:24:53', '2024-04-17 17:42:07'),
(14, 'BS ICT', '20240418003835', 1, '2024-04-17 16:39:09', '2024-04-17 17:40:18');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
CREATE TABLE IF NOT EXISTS `departments` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `departmentname` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20240418011924 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `departmentname`, `email`, `contact_number`, `created_at`, `updated_at`) VALUES
(20240418003835, 'Department of Computer Science', 'DCISM@gmail.com', '09178168419', '2024-04-17 16:38:35', '2024-04-17 16:38:35');

-- --------------------------------------------------------

--
-- Table structure for table `department_archives`
--

DROP TABLE IF EXISTS `department_archives`;
CREATE TABLE IF NOT EXISTS `department_archives` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `departmentname` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20240418011924 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `department_archives`
--

INSERT INTO `department_archives` (`id`, `departmentname`, `email`, `contact_number`, `active`, `created_at`, `updated_at`) VALUES
(20240418011923, 'Department of Engineering', 'jbenolpe007@gmail.com', '09516421445', 1, '2024-04-17 17:19:23', '2024-04-17 17:41:59'),
(20240418003835, 'Department of Computer Science', 'DCISM@gmail.com', '09178168419', 0, '2024-04-17 16:38:35', '2024-04-17 16:38:35');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB AUTO_INCREMENT=501 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`) VALUES
(489, 'default', '{\"displayName\":\"App\\\\Notifications\\\\BorrowComponent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"delay\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":11:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:8:\\\"App\\\\User\\\";s:2:\\\"id\\\";i:20210423132640;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:12:\\\"notification\\\";O:33:\\\"App\\\\Notifications\\\\BorrowComponent\\\":10:{s:9:\\\"component\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:13:\\\"App\\\\Component\\\";s:2:\\\"id\\\";i:20210423132952;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:8:\\\"borrower\\\";s:9:\\\"Sample WS\\\";s:2:\\\"id\\\";s:36:\\\"0d6ff6f2-d7ca-4763-b4a9-2b1bcd28c163\\\";s:6:\\\"locale\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}\"}}', 86, 1619158079, 1619158068, 1619158068),
(490, 'default', '{\"displayName\":\"App\\\\Notifications\\\\AcceptUser\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"delay\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":11:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:8:\\\"App\\\\User\\\";s:2:\\\"id\\\";i:20210423133058;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:12:\\\"notification\\\";O:28:\\\"App\\\\Notifications\\\\AcceptUser\\\":9:{s:4:\\\"user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:8:\\\"App\\\\User\\\";s:2:\\\"id\\\";i:20210423133058;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:2:\\\"id\\\";s:36:\\\"63f23dc6-f787-4b00-a9bf-ca11ec3d7a8c\\\";s:6:\\\"locale\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}\"}}', 99, NULL, 1619158070, 1619158070),
(491, 'default', '{\"displayName\":\"App\\\\Notifications\\\\BorrowComponent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"delay\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":11:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:8:\\\"App\\\\User\\\";s:2:\\\"id\\\";i:20210423132640;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:12:\\\"notification\\\";O:33:\\\"App\\\\Notifications\\\\BorrowComponent\\\":10:{s:9:\\\"component\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:13:\\\"App\\\\Component\\\";s:2:\\\"id\\\";i:20210423132952;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:8:\\\"borrower\\\";s:14:\\\"Sample Student\\\";s:2:\\\"id\\\";s:36:\\\"712b0ae9-da54-4725-8a08-644ddf7b2f1d\\\";s:6:\\\"locale\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}\"}}', 98, NULL, 1619158071, 1619158071),
(492, 'default', '{\"displayName\":\"App\\\\Notifications\\\\BorrowRequest\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"delay\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":11:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:8:\\\"App\\\\User\\\";s:2:\\\"id\\\";i:20210423133058;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:12:\\\"notification\\\";O:31:\\\"App\\\\Notifications\\\\BorrowRequest\\\":10:{s:9:\\\"component\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:20:\\\"App\\\\ComponentArchive\\\";s:2:\\\"id\\\";i:20210423132952;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:6:\\\"status\\\";b:1;s:2:\\\"id\\\";s:36:\\\"c90c6884-6fcb-4f4e-8be3-fa6640ee9eb7\\\";s:6:\\\"locale\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}\"}}', 98, NULL, 1619158073, 1619158073),
(493, 'default', '{\"displayName\":\"App\\\\Notifications\\\\AcceptUser\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"delay\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":11:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:8:\\\"App\\\\User\\\";s:2:\\\"id\\\";i:20210423132838;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:12:\\\"notification\\\";O:28:\\\"App\\\\Notifications\\\\AcceptUser\\\":9:{s:4:\\\"user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:8:\\\"App\\\\User\\\";s:2:\\\"id\\\";i:20210423132838;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:2:\\\"id\\\";s:36:\\\"1cbfb706-29d9-4dd7-a9f2-849726dff457\\\";s:6:\\\"locale\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}\"}}', 99, NULL, 1619158074, 1619158074),
(494, 'default', '{\"displayName\":\"App\\\\Notifications\\\\BorrowRequest\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"delay\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":11:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:8:\\\"App\\\\User\\\";s:2:\\\"id\\\";i:20210423132838;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:12:\\\"notification\\\";O:31:\\\"App\\\\Notifications\\\\BorrowRequest\\\":10:{s:9:\\\"component\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:20:\\\"App\\\\ComponentArchive\\\";s:2:\\\"id\\\";i:20210423132952;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:6:\\\"status\\\";b:1;s:2:\\\"id\\\";s:36:\\\"6bb5b51b-259a-4796-b852-c2e19a6f68f5\\\";s:6:\\\"locale\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}\"}}', 1, NULL, 1619158076, 1619158076),
(495, 'default', '{\"displayName\":\"App\\\\Notifications\\\\BorrowComponent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"delay\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":11:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:8:\\\"App\\\\User\\\";s:2:\\\"id\\\";i:20210423132640;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:12:\\\"notification\\\";O:33:\\\"App\\\\Notifications\\\\BorrowComponent\\\":10:{s:9:\\\"component\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:13:\\\"App\\\\Component\\\";s:2:\\\"id\\\";i:20210423132952;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:8:\\\"borrower\\\";s:14:\\\"Sample Student\\\";s:2:\\\"id\\\";s:36:\\\"0c544ff5-d7ea-4f32-8d05-51267780c789\\\";s:6:\\\"locale\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}\"}}', 1, NULL, 1619158077, 1619158077),
(496, 'default', '{\"displayName\":\"App\\\\Notifications\\\\BorrowRequest\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"delay\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":11:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:8:\\\"App\\\\User\\\";s:2:\\\"id\\\";i:20210423133058;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:12:\\\"notification\\\";O:31:\\\"App\\\\Notifications\\\\BorrowRequest\\\":10:{s:9:\\\"component\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:20:\\\"App\\\\ComponentArchive\\\";s:2:\\\"id\\\";i:20210423132952;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:6:\\\"status\\\";b:1;s:2:\\\"id\\\";s:36:\\\"b22e7828-ee5f-4d68-aaf6-7761ab32f7d2\\\";s:6:\\\"locale\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}\"}}', 1, NULL, 1619158079, 1619158079),
(497, 'default', '{\"displayName\":\"App\\\\Notifications\\\\AcceptUser\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"delay\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":11:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:8:\\\"App\\\\User\\\";s:2:\\\"id\\\";i:20210423133059;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:12:\\\"notification\\\";O:28:\\\"App\\\\Notifications\\\\AcceptUser\\\":9:{s:4:\\\"user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:8:\\\"App\\\\User\\\";s:2:\\\"id\\\";i:20210423133059;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:2:\\\"id\\\";s:36:\\\"ba56321d-48c9-4207-aa25-066bf6725379\\\";s:6:\\\"locale\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1619158706, 1619158706),
(498, 'default', '{\"displayName\":\"App\\\\Notifications\\\\AcceptUser\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"delay\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":11:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:8:\\\"App\\\\User\\\";s:2:\\\"id\\\";i:20210423133059;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:12:\\\"notification\\\";O:28:\\\"App\\\\Notifications\\\\AcceptUser\\\":9:{s:4:\\\"user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:8:\\\"App\\\\User\\\";s:2:\\\"id\\\";i:20210423133059;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:2:\\\"id\\\";s:36:\\\"ba56321d-48c9-4207-aa25-066bf6725379\\\";s:6:\\\"locale\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}s:8:\\\"channels\\\";a:1:{i:0;s:8:\\\"database\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1619158706, 1619158706),
(499, 'default', '{\"displayName\":\"App\\\\Notifications\\\\AcceptUser\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"delay\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":11:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:8:\\\"App\\\\User\\\";s:2:\\\"id\\\";i:20210423133060;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:12:\\\"notification\\\";O:28:\\\"App\\\\Notifications\\\\AcceptUser\\\":9:{s:4:\\\"user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:8:\\\"App\\\\User\\\";s:2:\\\"id\\\";i:20210423133060;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:2:\\\"id\\\";s:36:\\\"04baf0cd-c169-4856-afde-473503234530\\\";s:6:\\\"locale\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1619158784, 1619158784),
(500, 'default', '{\"displayName\":\"App\\\\Notifications\\\\AcceptUser\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"delay\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":11:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:8:\\\"App\\\\User\\\";s:2:\\\"id\\\";i:20210423133060;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:12:\\\"notification\\\";O:28:\\\"App\\\\Notifications\\\\AcceptUser\\\":9:{s:4:\\\"user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:8:\\\"App\\\\User\\\";s:2:\\\"id\\\";i:20210423133060;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:2:\\\"id\\\";s:36:\\\"04baf0cd-c169-4856-afde-473503234530\\\";s:6:\\\"locale\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}s:8:\\\"channels\\\";a:1:{i:0;s:8:\\\"database\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1619158784, 1619158784);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2021_04_02_080446_create_components_table', 1),
(4, '2021_04_02_080551_create_component_transactions_table', 1),
(5, '2021_04_02_080622_create_component_archives_table', 1),
(6, '2021_04_02_080637_create_reports_table', 1),
(7, '2021_04_02_080647_create_report_archives_table', 1),
(8, '2021_04_02_080706_create_report_transactions_table', 1),
(9, '2021_04_02_080724_create_rooms_table', 1),
(10, '2021_04_02_080747_create_borrows_table', 1),
(11, '2021_04_17_190141_create_jobs_table', 1),
(12, '2021_04_17_195111_create_notifications_table', 1),
(13, '2021_05_12_003317__create_course_table', 2),
(14, '2021_05_13_030245_create_course_archives_', 2),
(15, '2021_05_14_030916_create_departments_table', 2),
(16, '2021_05_14_162115_create_department_archives_table', 3),
(17, '2021_06_13_024640_create_computers_table', 4),
(18, '2021_06_13_025516_create_computers_table', 5),
(19, '2021_06_15_000224_create_computerpartscategories_table', 6),
(20, '2021_06_15_233622_create_computer_categories_table', 7),
(21, '2021_06_16_001201_create_computer_parts_table', 8),
(22, '2021_06_17_003115_create_computerparts_table', 9),
(23, '2021_06_17_033622_create_computercategs_table', 10),
(24, '2021_07_02_022904_create_computerpart_archives_table', 11),
(25, '2021_07_02_023239_create_computerpart_transactions_table', 11),
(26, '2021_07_30_123948_create_computerperipherals_table', 12),
(27, '2021_07_30_124114_create_computerperipheral_archives_table', 12),
(28, '2021_07_30_224952_create_computer_archives_table', 13);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
CREATE TABLE IF NOT EXISTS `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('01e56608-c466-446a-9aa7-711fc696227a', 'App\\Notifications\\AcceptUser', 'App\\User', 20210730165962, '{\"subject\":\"New user\",\"message\":\"Hello and welcome to Asset Tracking, please go to the url to change your password.\",\"url\":\"\\/profile\"}', NULL, '2024-04-18 15:58:13', '2024-04-18 15:58:13'),
('0b25f475-8c79-49bc-8549-7e958c47dccf', 'App\\Notifications\\SubmitComputerPartReport', 'App\\User', 20210423183214, '{\"subject\":\"Report submission\",\"message\":\"The Asus with a model number of B550-A mATX has been reported by Jae Enolpe\",\"url\":\"\\/reports\"}', NULL, '2024-04-17 16:58:30', '2024-04-17 16:58:30'),
('0c4168ec-3eb9-4cb6-90ea-87f0bed60a19', 'App\\Notifications\\BorrowRequest', 'App\\User', 20210728093545, '{\"subject\":\"Borrow Component Request\",\"message\":\"The Transcend Flash Drive with a model number of 2.5SATA-SSD512GB that you requested to borrow has been APPROVED.\",\"url\":\"\\/borrowlogs\"}', NULL, '2024-04-17 16:47:02', '2024-04-17 16:47:02'),
('0c52e436-d252-484a-8b24-dd610f8624be', 'App\\Notifications\\SubmitComputerPartReport', 'App\\User', 20210728093545, '{\"subject\":\"Report submission\",\"message\":\"The Asus with a model number of B550-A mATX has been reported by Jae Enolpe\",\"url\":\"\\/reports\"}', NULL, '2024-04-17 16:55:09', '2024-04-17 16:55:09'),
('104587d5-76e5-449a-94a5-3774fc23f84d', 'App\\Notifications\\BorrowComponent', 'App\\User', 20210603160024, '{\"subject\":\"Borrow Component Request\",\"message\":\"Mr\\/Ms. Administrator has requested to borrow the MSI with a model number of Z570-Z\",\"url\":\"\\/borrowlogs\"}', NULL, '2021-07-25 09:30:14', '2021-07-25 09:30:14'),
('105f1da7-8ed8-4ef9-9c29-6a365d7fa15f', 'App\\Notifications\\SubmitComputerPartReport', 'App\\User', 20210603160024, '{\"subject\":\"Report submission\",\"message\":\"The Asus with a model number of 1070ti-8g-Trbo has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2021-07-25 10:17:20', '2021-07-25 10:17:20'),
('111ead70-f671-437a-8717-09f353852c2f', 'App\\Notifications\\SubmitComputerPartReport', 'App\\User', 20210423183214, '{\"subject\":\"Report submission\",\"message\":\"The Western Digital with a model number of 7200rpm-1tb has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2021-07-30 03:36:39', '2021-07-30 03:36:39'),
('11f4e560-bc9f-47f9-8907-f58e9b03c413', 'App\\Notifications\\SubmitReport', 'App\\User', 20210730165957, '{\"subject\":\"Report submission\",\"message\":\"The Transcend Flash Drive with a model number of 8GB-TranscendFlashdrive has been reported by KYNN BURGOS\",\"url\":\"\\/reports\"}', NULL, '2024-04-17 16:31:45', '2024-04-17 16:31:45'),
('12ae76f3-7a16-433a-b963-d1bf09aa36fc', 'App\\Notifications\\SubmitComputerPartReport', 'App\\User', 20210730165954, '{\"subject\":\"Report submission\",\"message\":\"The Asus with a model number of z170-A has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2022-04-28 16:55:37', '2022-04-28 16:55:37'),
('13ba6c1f-d863-4ee1-862d-1a7b8f49b1c3', 'App\\Notifications\\BorrowComponent', 'App\\User', 20210603135419, '{\"subject\":\"Borrow Component Request\",\"message\":\"Mr\\/Ms. Administrator has requested to borrow the MSI with a model number of z121\",\"url\":\"\\/borrowlogs\"}', NULL, '2021-07-14 12:10:12', '2021-07-14 12:10:12'),
('140338af-f4e7-4e85-bfe6-29e07fd8df23', 'App\\Notifications\\OverdueBorrower', 'App\\User', 20210423183214, '{\"subject\":\"Return borrowed component\",\"message\":\"Hello Administrator,  the MSI that you borrowed has been overdue. Please report to the department immediately\",\"url\":\"\\/borrowlogs\"}', '2021-07-25 09:37:55', '2021-07-25 09:31:02', '2021-07-25 09:37:55'),
('1408b5dd-68dd-483c-8810-998884ded733', 'App\\Notifications\\CreateUser', 'App\\User', 20210728093545, '{\"subject\":\"User Registration\",\"message\":\"Jae Enolpe has registered to the system and is currently unverified.\",\"url\":\"\\/users\"}', '2024-04-17 16:27:44', '2021-07-28 01:35:45', '2024-04-17 16:27:44'),
('1584abba-01a8-4c27-a9e3-3ae93b819fac', 'App\\Notifications\\CreateUser', 'App\\User', 20210423132640, '{\"subject\":\"User Registration\",\"message\":\"Sample WS has registered to the system and is currently unverified.\",\"url\":\"\\/users\"}', '2021-04-23 05:28:54', '2021-04-23 05:28:38', '2021-04-23 05:28:54'),
('159a631c-2681-4c33-9034-79f4d05be907', 'App\\Notifications\\AcceptUser', 'App\\User', 20210730165963, '{\"subject\":\"New user\",\"message\":\"Hello and welcome to Asset Tracking, please go to the url to change your password.\",\"url\":\"\\/profile\"}', NULL, '2024-04-18 16:05:48', '2024-04-18 16:05:48'),
('183fb2d2-25f8-49bd-9e5b-d4a7c9d1873a', 'App\\Notifications\\SubmitReport', 'App\\User', 20210423183214, '{\"subject\":\"Report submission\",\"message\":\"The NZXT H510 with a model number of H510 has been reported by Sample WS\",\"url\":\"\\/reports\"}', '2021-07-14 12:09:44', '2021-04-23 23:27:18', '2021-07-14 12:09:44'),
('18430737-c50e-4189-bf3b-048e7ea53378', 'App\\Notifications\\SubmitComputerPartReport', 'App\\User', 20210423132838, '{\"subject\":\"Report submission\",\"message\":\"The Asus with a model number of Z170-A has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2021-07-14 10:03:56', '2021-07-14 10:03:56'),
('1b20b719-a139-45ce-b501-91d2418a5680', 'App\\Notifications\\SubmitComputerPartReport', 'App\\User', 20210423183214, '{\"subject\":\"Report submission\",\"message\":\"The Asus with a model number of B150 has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2022-04-27 00:16:39', '2022-04-27 00:16:39'),
('1b39b571-d70b-4240-8dbd-589edfb85baf', 'App\\Notifications\\AcceptUser', 'App\\User', 20210603160025, '{\"subject\":\"New user\",\"message\":\"Hello and welcome to Asset Tracking, please go to the url to change your password.\",\"url\":\"\\/profile\"}', NULL, '2021-06-03 18:19:08', '2021-06-03 18:19:08'),
('1b4490d9-59fc-456c-b103-091b84f20e42', 'App\\Notifications\\SubmitReport', 'App\\User', 20210603160025, '{\"subject\":\"Report submission\",\"message\":\"The MSI with a model number of Z570-Z has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2021-07-25 09:57:12', '2021-07-25 09:57:12'),
('1cbfb706-29d9-4dd7-a9f2-849726dff457', 'App\\Notifications\\AcceptUser', 'App\\User', 20210423132838, '{\"subject\":\"New user\",\"message\":\"Hello and welcome to Asset Tracking, please go to the url to change your password.\",\"url\":\"\\/profile\"}', '2021-04-23 05:40:06', '2021-04-23 05:37:02', '2021-04-23 05:40:06'),
('1da41347-3f5b-441d-8f54-6518e6af2aaa', 'App\\Notifications\\SubmitReport', 'App\\User', 20210423183214, '{\"subject\":\"Report submission\",\"message\":\"The MSI with a model number of z121 has been reported by Administrator\",\"url\":\"\\/reports\"}', '2021-07-14 12:09:44', '2021-07-14 02:25:21', '2021-07-14 12:09:44'),
('1ed86639-eb57-482b-8665-51fa7d630623', 'App\\Notifications\\SubmitComputerPartReport', 'App\\User', 20210603160025, '{\"subject\":\"Report submission\",\"message\":\"The Asus with a model number of 1070ti-8g-Trbo has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2021-07-25 10:17:20', '2021-07-25 10:17:20'),
('1ee353c5-041a-4cc7-9cca-d7790f641941', 'App\\Notifications\\AcceptUser', 'App\\User', 20210603160025, '{\"subject\":\"New user\",\"message\":\"Hello and welcome to Asset Tracking, please go to the url to change your password.\",\"url\":\"\\/profile\"}', NULL, '2021-06-04 10:22:51', '2021-06-04 10:22:51'),
('1f87bdc1-4828-4fc9-86bd-9dbace96b03a', 'App\\Notifications\\NotifyBorrower', 'App\\User', 20210423183214, '{\"subject\":\"Return borrowed component\",\"message\":\"Hello Administrator,  the sony that you borrowed must be returned on or before Jul 30 2021 01:12 PM\",\"url\":\"\\/borrowlogs\"}', '2021-07-28 05:52:22', '2021-07-29 05:38:32', '2021-07-28 05:52:22'),
('1faa335b-fd2d-445d-b7af-ab5e99da09a8', 'App\\Notifications\\SubmitComputerPartReport', 'App\\User', 20210603160025, '{\"subject\":\"Report submission\",\"message\":\"The Asus with a model number of Z170-A has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2021-07-14 01:25:36', '2021-07-14 01:25:36'),
('1fea76ca-5a12-447e-b491-8972804d3bcb', 'App\\Notifications\\CreateUser', 'App\\User', 20210423183214, '{\"subject\":\"User Registration\",\"message\":\"Hanzel Ceniza has registered to the system and is currently unverified.\",\"url\":\"\\/users\"}', NULL, '2021-07-30 08:59:54', '2021-07-30 08:59:54'),
('1feae6ee-9f51-4ef0-8563-29a6507fb128', 'App\\Notifications\\CreateUser', 'App\\User', 20210603155905, '{\"subject\":\"User Registration\",\"message\":\"Jae Enolpe has registered to the system and is currently unverified.\",\"url\":\"\\/users\"}', NULL, '2021-07-01 22:32:14', '2021-07-01 22:32:14'),
('21530e01-adb8-422f-9283-d30536ca85ac', 'App\\Notifications\\OverdueBorrower', 'App\\User', 20210423183214, '{\"subject\":\"Return borrowed component\",\"message\":\"Hello Administrator,  the sony that you borrowed has been overdue. Please report to the department immediately\",\"url\":\"\\/borrowlogs\"}', '2021-07-29 09:37:36', '2021-07-29 09:03:15', '2021-07-29 09:37:36'),
('21787070-27be-49d5-8fd7-e7875e02247a', 'App\\Notifications\\SubmitComputerPartReport', 'App\\User', 20210423132838, '{\"subject\":\"Report submission\",\"message\":\"The Asus with a model number of 1070ti-8g-Trbo has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2021-07-25 10:00:39', '2021-07-25 10:00:39'),
('21850b60-a9a3-4a78-8d21-2246a79047d0', 'App\\Notifications\\SubmitComputerPartReport', 'App\\User', 20210603160025, '{\"subject\":\"Report submission\",\"message\":\"The Asus with a model number of 1070ti-8g-Trbo has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2021-07-25 10:00:40', '2021-07-25 10:00:40'),
('21c6f4d1-4c00-46a5-95de-003c2ec3fda9', 'App\\Notifications\\SubmitComputerPartReport', 'App\\User', 20210730165954, '{\"subject\":\"Report submission\",\"message\":\"The Asus with a model number of Z170-A has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2022-04-28 16:20:43', '2022-04-28 16:20:43'),
('22dde93d-bb0d-440b-bdd3-e0a65bcd9674', 'App\\Notifications\\SubmitComputerPartReport', 'App\\User', 20210730165955, '{\"subject\":\"Report submission\",\"message\":\"The Asus with a model number of B550-A mATX has been reported by Jae Enolpe\",\"url\":\"\\/reports\"}', NULL, '2024-04-17 16:13:53', '2024-04-17 16:13:53'),
('23d4ccf6-b3fe-4cd8-94e0-641dcfc4ab20', 'App\\Notifications\\SubmitReport', 'App\\User', 20210423183214, '{\"subject\":\"Report submission\",\"message\":\"The Transcend Flash Drive with a model number of 8GB-TranscendFlashdrive has been reported by KYNN BURGOS\",\"url\":\"\\/reports\"}', NULL, '2024-04-17 16:31:45', '2024-04-17 16:31:45'),
('23f29568-4175-44d2-9cc8-2dd4c4ea60ee', 'App\\Notifications\\SubmitComputerPartReport', 'App\\User', 20210603155905, '{\"subject\":\"Report submission\",\"message\":\"The Asus with a model number of 1070ti-8g-Trbo has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2021-07-21 03:17:11', '2021-07-21 03:17:11'),
('24c89306-675e-4898-9334-74e5d632812c', 'App\\Notifications\\SubmitReport', 'App\\User', 20210603155905, '{\"subject\":\"Report submission\",\"message\":\"The MSI with a model number of z121 has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2021-07-14 06:13:04', '2021-07-14 06:13:04'),
('2583d09f-1329-4f8e-8b32-59a40907a63d', 'App\\Notifications\\SubmitReport', 'App\\User', 20210423132838, '{\"subject\":\"Report submission\",\"message\":\"The NZXT H510 with a model number of H510 has been reported by Sample WS\",\"url\":\"\\/reports\"}', '2021-04-23 05:40:06', '2021-04-23 05:30:00', '2021-04-23 05:40:06'),
('25d4e07a-5d3f-4d89-b51a-054b0f721a6f', 'App\\Notifications\\CreateUser', 'App\\User', 20210603155146, '{\"subject\":\"User Registration\",\"message\":\"Hanzel H. Ceniza has registered to the system and is currently unverified.\",\"url\":\"\\/users\"}', NULL, '2021-07-01 22:39:19', '2021-07-01 22:39:19'),
('26033dc1-ceb2-4ef5-8ebc-f1a7e7399aba', 'App\\Notifications\\CreateUser', 'App\\User', 20210702063214, '{\"subject\":\"User Registration\",\"message\":\"Jae Enolpe has registered to the system and is currently unverified.\",\"url\":\"\\/users\"}', NULL, '2021-07-01 22:32:15', '2021-07-01 22:32:15'),
('26f67157-960e-4c0c-9fec-dae239180084', 'App\\Notifications\\BorrowComponent', 'App\\User', 20210423183214, '{\"subject\":\"Borrow Component Request\",\"message\":\"Mr\\/Ms. Administrator has requested to borrow the MSI with a model number of z121\",\"url\":\"\\/borrowlogs\"}', '2021-07-14 12:25:21', '2021-07-14 12:10:12', '2021-07-14 12:25:21'),
('27829bb5-e638-486b-99a7-39c8aa6e128a', 'App\\Notifications\\AcceptUser', 'App\\User', 20210730165954, '{\"subject\":\"New user\",\"message\":\"Hello and welcome to Asset Tracking, please go to the url to change your password.\",\"url\":\"\\/profile\"}', NULL, '2022-04-19 15:41:36', '2022-04-19 15:41:36'),
('28397559-d32a-4d83-ad00-77a994a97912', 'App\\Notifications\\AcceptUser', 'App\\User', 20210730165957, '{\"subject\":\"New user\",\"message\":\"Hello and welcome to Asset Tracking, please go to the url to change your password.\",\"url\":\"\\/profile\"}', NULL, '2024-04-17 16:30:48', '2024-04-17 16:30:48'),
('2a838319-3da9-447e-83d4-81f603eb0dcc', 'App\\Notifications\\CreateUser', 'App\\User', 20210603135419, '{\"subject\":\"User Registration\",\"message\":\"Hanzel H. Ceniza has registered to the system and is currently unverified.\",\"url\":\"\\/users\"}', NULL, '2021-07-01 22:39:18', '2021-07-01 22:39:18'),
('2bb11ad5-99de-4921-8c95-c2eb25bac95a', 'App\\Notifications\\SubmitReport', 'App\\User', 20210603135419, '{\"subject\":\"Report submission\",\"message\":\"The MSI with a model number of z121 has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2021-07-14 02:25:21', '2021-07-14 02:25:21'),
('2c935cf1-a1ff-4258-9685-1169cde4ba90', 'App\\Notifications\\AcceptUser', 'App\\User', 20210728093545, '{\"subject\":\"New user\",\"message\":\"Hello and welcome to Asset Tracking, please go to the url to change your password.\",\"url\":\"\\/profile\"}', '2024-04-17 16:27:44', '2021-07-28 01:36:28', '2024-04-17 16:27:44'),
('2d25d5cc-17ac-45da-801a-46f74ba24a1f', 'App\\Notifications\\OverdueBorrower', 'App\\User', 20210423183214, '{\"subject\":\"Return borrowed component\",\"message\":\"Hello Administrator,  the sony that you borrowed has been overdue. Please report to the department immediately\",\"url\":\"\\/borrowlogs\"}', '2021-07-29 09:02:58', '2021-07-28 05:52:33', '2021-07-29 09:02:58'),
('2deb65eb-d01c-4e79-8e6e-f7fac10d33e7', 'App\\Notifications\\SubmitComputerPartReport', 'App\\User', 20210423183214, '{\"subject\":\"Report submission\",\"message\":\"The Asus with a model number of B550-A mATX has been reported by Jae Enolpe\",\"url\":\"\\/reports\"}', NULL, '2024-04-17 16:13:53', '2024-04-17 16:13:53'),
('30656bba-b681-4aa3-9822-356270755326', 'App\\Notifications\\CreateUser', 'App\\User', 20210603155146, '{\"subject\":\"User Registration\",\"message\":\"Manuel Pingol has registered to the system and is currently unverified.\",\"url\":\"\\/users\"}', NULL, '2021-06-03 08:00:24', '2021-06-03 08:00:24'),
('3296acaf-102a-4c33-b7f7-70fe9c1095d4', 'App\\Notifications\\CreateUser', 'App\\User', 20210423183214, '{\"subject\":\"User Registration\",\"message\":\"Jae Enolpe has registered to the system and is currently unverified.\",\"url\":\"\\/users\"}', '2021-07-14 12:09:44', '2021-06-03 07:51:46', '2021-07-14 12:09:44'),
('35a7b5d1-b799-4cf2-ae44-de434d6a869f', 'App\\Notifications\\SubmitComputerPartReport', 'App\\User', 20210423183214, '{\"subject\":\"Report submission\",\"message\":\"The Asus with a model number of z170-A has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2022-04-28 16:34:36', '2022-04-28 16:34:36'),
('35daa00e-09d2-402a-a620-0d16f99371ec', 'App\\Notifications\\OverdueBorrower', 'App\\User', 20210423183214, '{\"subject\":\"Return borrowed component\",\"message\":\"Hello Administrator,  the MSI that you borrowed has been overdue. Please report to the department immediately\",\"url\":\"\\/borrowlogs\"}', '2021-07-28 04:28:30', '2021-07-26 09:44:55', '2021-07-28 04:28:30'),
('3612fdc0-3236-4f73-a55b-a82a8a6af970', 'App\\Notifications\\SubmitReport', 'App\\User', 20210423183214, '{\"subject\":\"Report submission\",\"message\":\"The 123123 with a model number of 12312 has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2021-07-30 03:36:14', '2021-07-30 03:36:14'),
('3776d8f8-66e2-432e-bd32-d61b7b297514', 'App\\Notifications\\SubmitComputerPartReport', 'App\\User', 20210603135419, '{\"subject\":\"Report submission\",\"message\":\"The Asus with a model number of 1070ti-8g-Trbo has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2021-07-25 10:13:45', '2021-07-25 10:13:45'),
('379bcc51-9fff-4b04-b41f-bb45da5b7b90', 'App\\Notifications\\CreateUser', 'App\\User', 20210423183214, '{\"subject\":\"User Registration\",\"message\":\"Manuel Pingol has registered to the system and is currently unverified.\",\"url\":\"\\/users\"}', '2021-07-14 12:09:44', '2021-06-03 08:00:24', '2021-07-14 12:09:44'),
('384037bf-4864-4d98-8b77-2c1e04aac433', 'App\\Notifications\\SubmitReport', 'App\\User', 20210423132838, '{\"subject\":\"Report submission\",\"message\":\"The MSI with a model number of z121 has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2021-07-14 06:13:03', '2021-07-14 06:13:03'),
('38819631-e4e6-41a8-9095-d736d23709d7', 'App\\Notifications\\SubmitReport', 'App\\User', 20210730165954, '{\"subject\":\"Report submission\",\"message\":\"The 123123 with a model number of 12312 has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2022-04-27 00:17:45', '2022-04-27 00:17:45'),
('3960bdbd-0fe9-4fa8-bf96-a0deed6f5fed', 'App\\Notifications\\SubmitReport', 'App\\User', 20210730165955, '{\"subject\":\"Report submission\",\"message\":\"The Transcend Flash Drive with a model number of 8GB-TranscendFlashdrive has been reported by KYNN BURGOS\",\"url\":\"\\/reports\"}', NULL, '2024-04-17 16:31:45', '2024-04-17 16:31:45'),
('3b238bb7-9b2a-4b31-9590-215da87a60d1', 'App\\Notifications\\NotifyBorrower', 'App\\User', 20210423133058, '{\"subject\":\"Return borrowed component\",\"message\":\"Hello Sample Student,  the NZXT H510 that you borrowed must be returned on or before Apr 24 2021 02:06 PM\",\"url\":\"\\/borrowlogs\"}', NULL, '2021-04-23 14:38:02', '2021-04-23 14:38:02'),
('3c5f6720-579a-4a42-983e-2ab3908a3650', 'App\\Notifications\\SubmitReport', 'App\\User', 20210603135419, '{\"subject\":\"Report submission\",\"message\":\"The MSI with a model number of z121 has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2021-07-14 11:01:28', '2021-07-14 11:01:28'),
('3ca21bb8-d9b8-4b98-bcdb-93e54cd4c285', 'App\\Notifications\\BorrowComponent', 'App\\User', 20210423183214, '{\"subject\":\"Borrow Component Request\",\"message\":\"Mr\\/Ms. Jae Enolpe has requested to borrow the Transcend Flash Drive with a model number of 2.5SATA-SSD512GB\",\"url\":\"\\/borrowlogs\"}', NULL, '2024-04-17 16:46:41', '2024-04-17 16:46:41'),
('3ca80b9c-036e-42d5-9617-55069f6d6f91', 'App\\Notifications\\NotifyBorrower', 'App\\User', 20210423132838, '{\"subject\":\"Return borrowed component\",\"message\":\"Hello Sample WS,  the NZXT H510 that you borrowed must be returned on or before Apr 24 2021 01:40 PM\",\"url\":\"\\/borrowlogs\"}', NULL, '2021-04-23 14:38:02', '2021-04-23 14:38:02'),
('3cf2be88-7e08-45fa-9a7e-a645e501aad0', 'App\\Notifications\\BorrowComponent', 'App\\User', 20210423183214, '{\"subject\":\"Borrow Component Request\",\"message\":\"Mr\\/Ms. Jae Enolpe has requested to borrow the sony with a model number of alpha 7r\",\"url\":\"\\/borrowlogs\"}', '2021-07-28 04:28:30', '2021-07-28 01:51:14', '2021-07-28 04:28:30'),
('3ed8e970-07c1-4f0b-bc76-b64e18f9c764', 'App\\Notifications\\SubmitReport', 'App\\User', 20210423132838, '{\"subject\":\"Report submission\",\"message\":\"The MSI with a model number of z121 has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2021-07-14 11:01:28', '2021-07-14 11:01:28'),
('3eeebc82-4f75-4363-bfee-628206245507', 'App\\Notifications\\SubmitComputerPartReport', 'App\\User', 20210730165954, '{\"subject\":\"Report submission\",\"message\":\"The Asus with a model number of B150 has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2022-04-27 00:16:39', '2022-04-27 00:16:39'),
('3ff075e6-2df7-422c-b29b-a4bb2003f7c8', 'App\\Notifications\\SubmitReport', 'App\\User', 20210603160024, '{\"subject\":\"Report submission\",\"message\":\"The MSI with a model number of z121 has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2021-07-14 11:01:28', '2021-07-14 11:01:28'),
('4075ab49-bc7e-4cb1-9396-fda35f623940', 'App\\Notifications\\NotifyBorrower', 'App\\User', 20210423183214, '{\"subject\":\"Return borrowed component\",\"message\":\"Hello Administrator,  the MSI that you borrowed must be returned on or before Jul 18 2021 06:56 PM\",\"url\":\"\\/borrowlogs\"}', '2021-07-25 09:37:55', '2021-07-17 10:57:30', '2021-07-25 09:37:55'),
('40d7dcbb-4098-4655-85e7-dfab04bfadeb', 'App\\Notifications\\AcceptUser', 'App\\User', 20210730165955, '{\"subject\":\"New user\",\"message\":\"Hello and welcome to Asset Tracking, please go to the url to change your password.\",\"url\":\"\\/profile\"}', NULL, '2022-04-19 15:37:37', '2022-04-19 15:37:37'),
('41703b82-7e29-41b3-b2c5-3e89f92b7bed', 'App\\Notifications\\SubmitReport', 'App\\User', 20210423183214, '{\"subject\":\"Report submission\",\"message\":\"The 123123 with a model number of 12312 has been reported by Administrator\",\"url\":\"\\/reports\"}', '2021-07-29 09:02:57', '2021-07-29 07:03:40', '2021-07-29 09:02:57'),
('41f4ab00-2684-4570-b3a5-984d6f703de0', 'App\\Notifications\\SubmitReport', 'App\\User', 20210730165954, '{\"subject\":\"Report submission\",\"message\":\"The Transcend Flash Drive with a model number of 8GB-TranscendFlashdrive has been reported by Jae Enolpe\",\"url\":\"\\/reports\"}', NULL, '2024-04-17 16:08:38', '2024-04-17 16:08:38'),
('41fdda7c-b37b-4256-8dff-1bf4f3803b32', 'App\\Notifications\\BorrowComponent', 'App\\User', 20210730165955, '{\"subject\":\"Borrow Component Request\",\"message\":\"Mr\\/Ms. HANZEL ceniza has requested to borrow the Transcend Flash Drive with a model number of 8GB-TranscendFlashdrive\",\"url\":\"\\/borrowlogs\"}', NULL, '2024-04-17 16:29:09', '2024-04-17 16:29:09'),
('42b50eba-9d9e-495b-91d6-668155ca1e18', 'App\\Notifications\\SubmitReport', 'App\\User', 20210730165955, '{\"subject\":\"Report submission\",\"message\":\"The Transcend Flash Drive with a model number of 8GB-TranscendFlashdrive has been reported by Jae Enolpe\",\"url\":\"\\/reports\"}', NULL, '2024-04-17 16:08:38', '2024-04-17 16:08:38'),
('42d1adf3-2d32-40b0-b051-69746646ad39', 'App\\Notifications\\SubmitComputerPartReport', 'App\\User', 20210603135419, '{\"subject\":\"Report submission\",\"message\":\"The Asus with a model number of 1070ti-8g-Trbo has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2021-07-21 03:17:11', '2021-07-21 03:17:11'),
('450fda5d-efbb-483d-b988-3bd142c371db', 'App\\Notifications\\SubmitComputerPartReport', 'App\\User', 20210603160025, '{\"subject\":\"Report submission\",\"message\":\"The Asus with a model number of Z170-A has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2021-07-14 11:01:46', '2021-07-14 11:01:46'),
('45718c60-5c3a-4d2d-8deb-8d9ecd876ad9', 'App\\Notifications\\SubmitReport', 'App\\User', 20210423183214, '{\"subject\":\"Report submission\",\"message\":\"The MSI with a model number of z121 has been reported by Administrator\",\"url\":\"\\/reports\"}', '2021-07-14 12:09:44', '2021-07-14 06:13:04', '2021-07-14 12:09:44'),
('469a7630-21e1-40aa-91a4-6995051244f8', 'App\\Notifications\\AcceptUser', 'App\\User', 20210603160025, '{\"subject\":\"New user\",\"message\":\"Hello and welcome to Asset Tracking, please go to the url to change your password.\",\"url\":\"\\/profile\"}', NULL, '2021-06-04 09:10:32', '2021-06-04 09:10:32'),
('46dceb76-4ab6-4f02-9e99-3eedc436ad42', 'App\\Notifications\\SubmitReport', 'App\\User', 20210423132838, '{\"subject\":\"Report submission\",\"message\":\"The Gigabyte GA-A320M with a model number of B100 has been reported by Sample WS\",\"url\":\"\\/reports\"}', NULL, '2021-05-07 06:30:57', '2021-05-07 06:30:57'),
('4760a9af-940f-4e33-9a22-9c76f655a528', 'App\\Notifications\\BorrowComponent', 'App\\User', 20210423183214, '{\"subject\":\"Borrow Component Request\",\"message\":\"Mr\\/Ms. Administrator has requested to borrow the MSI with a model number of Z570-Z\",\"url\":\"\\/borrowlogs\"}', '2021-07-25 09:37:55', '2021-07-25 09:30:14', '2021-07-25 09:37:55'),
('48b390e2-66d4-43d4-b85f-6e48827bc33d', 'App\\Notifications\\SubmitComputerPartReport', 'App\\User', 20210730165955, '{\"subject\":\"Report submission\",\"message\":\"The Corsair with a model number of 16gbDDR4-3200mhz has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2022-04-19 15:47:45', '2022-04-19 15:47:45'),
('4a1444bf-0878-477f-9a0a-a8b589089f29', 'App\\Notifications\\CreateUser', 'App\\User', 20210603135419, '{\"subject\":\"User Registration\",\"message\":\"Jae Enolpe has registered to the system and is currently unverified.\",\"url\":\"\\/users\"}', NULL, '2021-06-03 05:54:20', '2021-06-03 05:54:20'),
('4a342d6c-0e9a-43d2-b663-fb6054ad57ff', 'App\\Notifications\\CreateUser', 'App\\User', 20210603135419, '{\"subject\":\"User Registration\",\"message\":\"Hanzel Ceniza has registered to the system and is currently unverified.\",\"url\":\"\\/users\"}', NULL, '2021-07-01 22:37:32', '2021-07-01 22:37:32'),
('4a476ca5-e839-4050-8496-40be6378a9a2', 'App\\Notifications\\AcceptUser', 'App\\User', 20210730165965, '{\"subject\":\"New user\",\"message\":\"Hello and welcome to Asset Tracking, please go to the url to change your password.\",\"url\":\"\\/profile\"}', NULL, '2024-04-21 14:27:34', '2024-04-21 14:27:34'),
('4a7e0517-e1b5-486b-adbd-add96f52ea6a', 'App\\Notifications\\SubmitReport', 'App\\User', 20210603135419, '{\"subject\":\"Report submission\",\"message\":\"The MSI with a model number of Z570-Z has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2021-07-25 09:57:12', '2021-07-25 09:57:12'),
('4ab9c421-139c-4b7e-8373-2bfbf1a2443a', 'App\\Notifications\\SubmitComputerPartReport', 'App\\User', 20210603155146, '{\"subject\":\"Report submission\",\"message\":\"The Asus with a model number of Z170-A has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2021-07-14 10:03:56', '2021-07-14 10:03:56'),
('4b698cfc-cf92-46ed-ac94-d345d58fe006', 'App\\Notifications\\SubmitComputerPartReport', 'App\\User', 20210603135419, '{\"subject\":\"Report submission\",\"message\":\"The Asus with a model number of 1070ti-8g-Trbo has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2021-07-25 10:17:20', '2021-07-25 10:17:20'),
('4b9b4df1-2066-4666-bd1b-ecd26755af80', 'App\\Notifications\\CreateUser', 'App\\User', 20210603155905, '{\"subject\":\"User Registration\",\"message\":\"Hanzel Ceniza has registered to the system and is currently unverified.\",\"url\":\"\\/users\"}', NULL, '2021-06-03 07:59:05', '2021-06-03 07:59:05'),
('4c5d656b-d2aa-4713-897a-3481e38cf3d8', 'App\\Notifications\\BorrowComponent', 'App\\User', 20210603155905, '{\"subject\":\"Borrow Component Request\",\"message\":\"Mr\\/Ms. Administrator has requested to borrow the MSI with a model number of Z570-Z\",\"url\":\"\\/borrowlogs\"}', NULL, '2021-07-17 10:57:03', '2021-07-17 10:57:03'),
('4e96b86e-7f98-465a-aee8-a1d9556cfd10', 'App\\Notifications\\CreateUser', 'App\\User', 20210603135419, '{\"subject\":\"User Registration\",\"message\":\"Manuel Pingol has registered to the system and is currently unverified.\",\"url\":\"\\/users\"}', NULL, '2021-06-03 08:00:24', '2021-06-03 08:00:24'),
('51847b8f-a57a-4c89-bfee-1d515b81f184', 'App\\Notifications\\SubmitReport', 'App\\User', 20210603135419, '{\"subject\":\"Report submission\",\"message\":\"The MSI with a model number of z121 has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2021-07-14 06:19:16', '2021-07-14 06:19:16'),
('523a60b2-8196-4294-97f8-68e4effb68e2', 'App\\Notifications\\SubmitReport', 'App\\User', 20210730165954, '{\"subject\":\"Report submission\",\"message\":\"The Transcend Flash Drive with a model number of 8GB-TranscendFlashdrive has been reported by KYNN BURGOS\",\"url\":\"\\/reports\"}', NULL, '2024-04-17 16:31:45', '2024-04-17 16:31:45'),
('52c50e89-8893-4247-be09-e49e2b9d19ff', 'App\\Notifications\\SubmitComputerPartReport', 'App\\User', 20210730165954, '{\"subject\":\"Report submission\",\"message\":\"The Asus with a model number of B550-A mATX has been reported by Jae Enolpe\",\"url\":\"\\/reports\"}', NULL, '2024-04-17 16:13:53', '2024-04-17 16:13:53'),
('52c8da81-c494-4fa5-96bf-36292fa230a3', 'App\\Notifications\\SubmitComputerPartReport', 'App\\User', 20210603155146, '{\"subject\":\"Report submission\",\"message\":\"The Asus with a model number of 1070ti-8g-Trbo has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2021-07-21 03:17:11', '2021-07-21 03:17:11'),
('54b11a90-3fbd-4b1f-9a97-51914df1b174', 'App\\Notifications\\SubmitReport', 'App\\User', 20210603155905, '{\"subject\":\"Report submission\",\"message\":\"The MSI with a model number of Z570-Z has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2021-07-14 12:22:35', '2021-07-14 12:22:35'),
('54e16fdb-d1c0-464e-b72e-46154009031d', 'App\\Notifications\\SubmitComputerPartReport', 'App\\User', 20210603155905, '{\"subject\":\"Report submission\",\"message\":\"The Asus with a model number of 1070ti-8g-Trbo has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2021-07-25 10:17:20', '2021-07-25 10:17:20'),
('55d5fe94-33c4-4fba-bc23-8364d9fba70a', 'App\\Notifications\\SubmitComputerPartReport', 'App\\User', 20210603160024, '{\"subject\":\"Report submission\",\"message\":\"The Asus with a model number of Z170-A has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2021-07-14 10:03:56', '2021-07-14 10:03:56'),
('56946ee4-90ca-4830-83e2-7c1d8206b0d3', 'App\\Notifications\\SubmitReport', 'App\\User', 20210603160024, '{\"subject\":\"Report submission\",\"message\":\"The MSI with a model number of z121 has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2021-07-14 06:13:04', '2021-07-14 06:13:04'),
('57b88ed4-abca-42f6-8916-aa7e03c2d662', 'App\\Notifications\\NotifyBorrower', 'App\\User', 20210423183214, '{\"subject\":\"Return borrowed component\",\"message\":\"Hello Administrator,  the MSI that you borrowed must be returned on or before Jul 16 2021 08:24 PM\",\"url\":\"\\/borrowlogs\"}', '2021-07-14 12:26:49', '2021-07-14 12:26:26', '2021-07-14 12:26:49'),
('5876d6c1-ea8c-4a06-926d-52fdc43bf4ff', 'App\\Notifications\\NotifyBorrower', 'App\\User', 20210423183214, '{\"subject\":\"Return borrowed component\",\"message\":\"Hello Administrator,  the sony that you borrowed must be returned on or before Jul 28 2021 12:32 PM\",\"url\":\"\\/borrowlogs\"}', '2021-07-28 05:11:19', '2021-07-28 05:09:52', '2021-07-28 05:11:19'),
('5891f5ab-9906-4143-bf28-59469084ddac', 'App\\Notifications\\AcceptUser', 'App\\User', 20210730165954, '{\"subject\":\"New user\",\"message\":\"Hello and welcome to Asset Tracking, please go to the url to change your password.\",\"url\":\"\\/profile\"}', NULL, '2022-04-19 15:41:51', '2022-04-19 15:41:51'),
('58d4dad6-f56d-4699-b228-5dfd24a503b6', 'App\\Notifications\\CreateUser', 'App\\User', 20210603155905, '{\"subject\":\"User Registration\",\"message\":\"Hanzel H. Ceniza has registered to the system and is currently unverified.\",\"url\":\"\\/users\"}', NULL, '2021-07-01 22:39:19', '2021-07-01 22:39:19'),
('5981ecd3-9b02-45b6-904d-6e03860b7887', 'App\\Notifications\\NotifyBorrower', 'App\\User', 20210423183214, '{\"subject\":\"Return borrowed component\",\"message\":\"Hello Administrator,  the sony that you borrowed must be returned on or before Jul 28 2021 12:32 PM\",\"url\":\"\\/borrowlogs\"}', '2021-07-28 04:44:05', '2021-07-28 04:40:41', '2021-07-28 04:44:05'),
('5a5dd4bd-de29-466f-95bd-fb38da32d352', 'App\\Notifications\\SubmitReport', 'App\\User', 20210423132640, '{\"subject\":\"Report submission\",\"message\":\"The NZXT H510 with a model number of H510 has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2021-04-23 09:59:29', '2021-04-23 09:59:29'),
('5b39d72c-e794-4ae7-973b-5f93b3b66a95', 'App\\Notifications\\SubmitComputerPartReport', 'App\\User', 20210423132838, '{\"subject\":\"Report submission\",\"message\":\"The Asus with a model number of 1070ti-8g-Trbo has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2021-07-25 10:13:45', '2021-07-25 10:13:45'),
('5bb86353-bd28-49a7-acb2-470ad5ab7ab2', 'App\\Notifications\\NotifyBorrower', 'App\\User', 20210423180227, '{\"subject\":\"Return borrowed component\",\"message\":\"Hello Test 1,  the NZXT H510 that you borrowed must be returned on or before Apr 24 2021 10:36 PM\",\"url\":\"\\/borrowlogs\"}', NULL, '2021-04-23 14:38:02', '2021-04-23 14:38:02'),
('5d648208-42b1-40b0-8ca8-08d2d85b04a0', 'App\\Notifications\\BorrowComponent', 'App\\User', 20210730165955, '{\"subject\":\"Borrow Component Request\",\"message\":\"Mr\\/Ms. Jae Enolpe has requested to borrow the Transcend Flash Drive with a model number of 8GB-TranscendFlashdrive\",\"url\":\"\\/borrowlogs\"}', NULL, '2024-04-17 16:27:19', '2024-04-17 16:27:19'),
('5e2a4aa2-ee8d-4dc2-a2dd-31db2b3756b0', 'App\\Notifications\\CreateUser', 'App\\User', 20210423183214, '{\"subject\":\"User Registration\",\"message\":\"Hanzel H. Ceniza has registered to the system and is currently unverified.\",\"url\":\"\\/users\"}', '2021-07-14 12:09:44', '2021-07-01 22:39:18', '2021-07-14 12:09:44'),
('5e5768d9-21e0-4324-a76e-4cba11604d10', 'App\\Notifications\\SubmitReport', 'App\\User', 20210423183214, '{\"subject\":\"Report submission\",\"message\":\"The Transcend Flash Drive with a model number of 8GB-TranscendFlashdrive has been reported by Jae Enolpe\",\"url\":\"\\/reports\"}', NULL, '2024-04-17 16:08:38', '2024-04-17 16:08:38'),
('5e91be03-bbbc-4b9a-a251-e5868b1c2748', 'App\\Notifications\\BorrowRequest', 'App\\User', 20210423183214, '{\"subject\":\"Borrow Component Request\",\"message\":\"The sony with a model number of alpha 7r that you requested to borrow has been APPROVED.\",\"url\":\"\\/borrowlogs\"}', '2021-07-28 04:28:30', '2021-07-28 00:38:55', '2021-07-28 04:28:30'),
('5ea5aa97-4d17-400d-8ad2-0e534537fedd', 'App\\Notifications\\CreateUser', 'App\\User', 20210603160024, '{\"subject\":\"User Registration\",\"message\":\"Jae Enolpe has registered to the system and is currently unverified.\",\"url\":\"\\/users\"}', NULL, '2021-07-01 22:32:15', '2021-07-01 22:32:15'),
('5ec76791-8ffa-454a-a6a9-6f53fb166a23', 'App\\Notifications\\SubmitComputerPartReport', 'App\\User', 20210423183214, '{\"subject\":\"Report submission\",\"message\":\"The Asus with a model number of 1070ti-8g-Trbo has been reported by Administrator\",\"url\":\"\\/reports\"}', '2021-07-28 04:28:30', '2021-07-25 09:57:58', '2021-07-28 04:28:30'),
('60f7e640-8026-45e5-8651-73408c5a7496', 'App\\Notifications\\SubmitComputerPartReport', 'App\\User', 20210423183214, '{\"subject\":\"Report submission\",\"message\":\"The Asus with a model number of Z170-A has been reported by Administrator\",\"url\":\"\\/reports\"}', '2021-07-14 12:09:44', '2021-07-14 10:03:56', '2021-07-14 12:09:44'),
('61d131f6-71de-41fe-9668-0d5910ee9494', 'App\\Notifications\\SubmitReport', 'App\\User', 20210423183214, '{\"subject\":\"Report submission\",\"message\":\"The MSI with a model number of Z570-Z has been reported by Administrator\",\"url\":\"\\/reports\"}', '2021-07-28 04:28:30', '2021-07-25 10:16:07', '2021-07-28 04:28:30'),
('630729a9-f90e-4f9d-a9f9-6a080072ac3d', 'App\\Notifications\\OverdueBorrower', 'App\\User', 20210423183214, '{\"subject\":\"Return borrowed component\",\"message\":\"Hello Administrator,  the sony that you borrowed has been overdue. Please report to the department immediately\",\"url\":\"\\/borrowlogs\"}', '2021-07-29 09:02:57', '2021-07-28 05:57:58', '2021-07-29 09:02:57'),
('63f23dc6-f787-4b00-a9bf-ca11ec3d7a8c', 'App\\Notifications\\AcceptUser', 'App\\User', 20210423133058, '{\"subject\":\"New user\",\"message\":\"Hello and welcome to Asset Tracking, please go to the url to change your password.\",\"url\":\"\\/profile\"}', '2021-04-23 05:38:07', '2021-04-23 05:37:05', '2021-04-23 05:38:07'),
('64176c92-3703-4de3-859c-12ccd9c7d176', 'App\\Notifications\\OverdueBorrower', 'App\\User', 20210423183214, '{\"subject\":\"Return borrowed component\",\"message\":\"Hello Administrator,  the MSI that you borrowed has been overdue. Please report to the department immediately\",\"url\":\"\\/borrowlogs\"}', '2021-07-17 10:32:15', '2021-07-17 10:30:54', '2021-07-17 10:32:15'),
('6479db8f-f9a2-4f0c-9ac1-2e0c663906a0', 'App\\Notifications\\SubmitReport', 'App\\User', 20210603155146, '{\"subject\":\"Report submission\",\"message\":\"The MSI with a model number of Z570-Z has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2021-07-14 12:22:35', '2021-07-14 12:22:35'),
('65f81fb0-0e26-4738-90c9-9864c9043875', 'App\\Notifications\\BorrowComponent', 'App\\User', 20210423183214, '{\"subject\":\"Borrow Component Request\",\"message\":\"Mr\\/Ms. Administrator has requested to borrow the sony with a model number of alpha 7r\",\"url\":\"\\/borrowlogs\"}', '2021-07-28 04:28:30', '2021-07-28 00:34:21', '2021-07-28 04:28:30'),
('666807e5-0db6-4f83-80b5-eb8284ad8ede', 'App\\Notifications\\SubmitReport', 'App\\User', 20210423183214, '{\"subject\":\"Report submission\",\"message\":\"The 123123 with a model number of 12312 has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2022-04-27 00:17:44', '2022-04-27 00:17:44'),
('6698d09c-6c85-49f9-bbd9-cc375efa832b', 'App\\Notifications\\SubmitComputerPartReport', 'App\\User', 20210423132838, '{\"subject\":\"Report submission\",\"message\":\"The Asus with a model number of Z170-A has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2021-07-14 11:01:45', '2021-07-14 11:01:45'),
('6986ca91-d3c0-488c-aec1-2edf6d76c066', 'App\\Notifications\\SubmitReport', 'App\\User', 20210423183214, '{\"subject\":\"Report submission\",\"message\":\"The 123123 with a model number of 12312 has been reported by Administrator\",\"url\":\"\\/reports\"}', '2021-07-29 09:02:57', '2021-07-29 07:25:56', '2021-07-29 09:02:57'),
('6a8b69ed-7e98-4fa5-9f27-ddae8cf6ddf3', 'App\\Notifications\\OverdueBorrower', 'App\\User', 20210423183214, '{\"subject\":\"Return borrowed component\",\"message\":\"Hello Administrator,  the MSI that you borrowed has been overdue. Please report to the department immediately\",\"url\":\"\\/borrowlogs\"}', '2021-07-25 09:37:55', '2021-07-17 10:57:30', '2021-07-25 09:37:55'),
('6ab0a236-378d-432d-980f-e75329d40db6', 'App\\Notifications\\CreateUser', 'App\\User', 20210603135419, '{\"subject\":\"User Registration\",\"message\":\"Hanzel H. Ceniza has registered to the system and is currently unverified.\",\"url\":\"\\/users\"}', NULL, '2021-07-01 22:32:53', '2021-07-01 22:32:53'),
('6abae582-6da5-44dc-be1e-72140f4a8e1e', 'App\\Notifications\\SubmitComputerPartReport', 'App\\User', 20210423132838, '{\"subject\":\"Report submission\",\"message\":\"The Asus with a model number of 1070ti-8g-Trbo has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2021-07-25 09:57:58', '2021-07-25 09:57:58'),
('6bb5b51b-259a-4796-b852-c2e19a6f68f5', 'App\\Notifications\\BorrowRequest', 'App\\User', 20210423132838, '{\"subject\":\"Borrow Component Request\",\"message\":\"The NZXT H510 with a model number of H510 that you requested to borrow has been APPROVED.\",\"url\":\"\\/borrowlogs\"}', NULL, '2021-04-23 06:07:56', '2021-04-23 06:07:56'),
('6bd2b684-1aba-4926-9aa5-6c84f96e94b3', 'App\\Notifications\\SubmitComputerPartReport', 'App\\User', 20210728093545, '{\"subject\":\"Report submission\",\"message\":\"The Asus with a model number of B550-A mATX has been reported by Jae Enolpe\",\"url\":\"\\/reports\"}', '2024-04-17 16:27:44', '2024-04-17 16:13:53', '2024-04-17 16:27:44'),
('6c5d4cb0-ed48-4a9e-9156-2e20326aac2e', 'App\\Notifications\\SubmitComputerPartReport', 'App\\User', 20210423183214, '{\"subject\":\"Report submission\",\"message\":\"The Corsair with a model number of 16gbDDR4-3200mhz has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2022-04-19 15:47:45', '2022-04-19 15:47:45'),
('6dd8603a-fa6d-4f60-8acb-43b1c680e8f4', 'App\\Notifications\\SubmitReport', 'App\\User', 20210730165954, '{\"subject\":\"Report submission\",\"message\":\"The 1234556 with a model number of 123414515 has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2022-04-28 16:34:58', '2022-04-28 16:34:58'),
('6e1bc9da-f0f1-434e-9cc6-a68962533451', 'App\\Notifications\\BorrowRequest', 'App\\User', 20210423180227, '{\"subject\":\"Borrow Component Request\",\"message\":\"The NZXT H510 with a model number of H510 that you requested to borrow has been APPROVED.\",\"url\":\"\\/borrowlogs\"}', NULL, '2021-04-23 14:37:26', '2021-04-23 14:37:26'),
('6f18d6fc-d4bf-4f4c-816e-caf4ab8dd248', 'App\\Notifications\\CreateUser', 'App\\User', 20210423183214, '{\"subject\":\"User Registration\",\"message\":\"Jae Enolpe has registered to the system and is currently unverified.\",\"url\":\"\\/users\"}', '2021-07-14 12:09:44', '2021-07-01 22:32:14', '2021-07-14 12:09:44'),
('70f533d1-b270-49d6-9cc3-9480b75a4278', 'App\\Notifications\\SubmitComputerPartReport', 'App\\User', 20210603160025, '{\"subject\":\"Report submission\",\"message\":\"The Asus with a model number of 1070ti-8g-Trbo has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2021-07-25 10:13:45', '2021-07-25 10:13:45'),
('712b0ae9-da54-4725-8a08-644ddf7b2f1d', 'App\\Notifications\\BorrowComponent', 'App\\User', 20210423132640, '{\"subject\":\"Borrow Component Request\",\"message\":\"Mr\\/Ms. Sample Student has requested to borrow the NZXT H510 with a model number of H510\",\"url\":\"\\/borrowlogs\"}', '2021-04-23 05:39:36', '2021-04-23 05:37:26', '2021-04-23 05:39:36'),
('712cc51b-2ce6-4aa7-9d4c-fe15af0158b2', 'App\\Notifications\\NotifyBorrower', 'App\\User', 20210423183214, '{\"subject\":\"Return borrowed component\",\"message\":\"Hello Administrator,  the MSI that you borrowed must be returned on or before Jul 26 2021 05:29 PM\",\"url\":\"\\/borrowlogs\"}', '2021-07-25 09:37:55', '2021-07-25 09:31:38', '2021-07-25 09:37:55'),
('73c16e22-1a34-4eb8-9551-04c1d4265ce2', 'App\\Notifications\\BorrowRequest', 'App\\User', 20210423183214, '{\"subject\":\"Borrow Component Request\",\"message\":\"The MSI with a model number of Z570-Z that you requested to borrow has been APPROVED.\",\"url\":\"\\/borrowlogs\"}', '2021-07-28 04:28:30', '2021-07-27 03:31:06', '2021-07-28 04:28:30'),
('7710b3a1-71b9-4d34-81a6-22c7d9693b79', 'App\\Notifications\\SubmitComputerPartReport', 'App\\User', 20210730165955, '{\"subject\":\"Report submission\",\"message\":\"The Asus with a model number of B150 has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2022-04-27 00:16:39', '2022-04-27 00:16:39'),
('787813ea-3857-409e-b1a9-3868c39d53ec', 'App\\Notifications\\SubmitReport', 'App\\User', 20210603160025, '{\"subject\":\"Report submission\",\"message\":\"The MSI with a model number of z121 has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2021-07-14 06:19:16', '2021-07-14 06:19:16'),
('78998e95-65bd-4e93-800f-efad9a8fac7a', 'App\\Notifications\\SubmitComputerPartReport', 'App\\User', 20210603155146, '{\"subject\":\"Report submission\",\"message\":\"The Asus with a model number of Z170-A has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2021-07-14 01:25:36', '2021-07-14 01:25:36'),
('79d0aa55-1ed5-48b7-a326-ab25b2f1dd53', 'App\\Notifications\\SubmitReport', 'App\\User', 20210603155905, '{\"subject\":\"Report submission\",\"message\":\"The MSI with a model number of Z570-Z has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2021-07-25 10:16:07', '2021-07-25 10:16:07'),
('7a63e7ae-4d4a-47c0-8f26-aab785f8541c', 'App\\Notifications\\SubmitReport', 'App\\User', 20210603135419, '{\"subject\":\"Report submission\",\"message\":\"The MSI with a model number of Z570-Z has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2021-07-14 12:22:35', '2021-07-14 12:22:35'),
('7a78fc4e-36ed-4f4a-92eb-ec0d76eafd01', 'App\\Notifications\\AcceptUser', 'App\\User', 20210730165954, '{\"subject\":\"New user\",\"message\":\"Hello and welcome to Asset Tracking, please go to the url to change your password.\",\"url\":\"\\/profile\"}', NULL, '2021-12-13 06:31:03', '2021-12-13 06:31:03'),
('7b1051f1-4a85-4d06-996a-dfc1b7b64144', 'App\\Notifications\\SubmitComputerPartReport', 'App\\User', 20210603155905, '{\"subject\":\"Report submission\",\"message\":\"The Asus with a model number of 1070ti-8g-Trbo has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2021-07-25 09:57:58', '2021-07-25 09:57:58'),
('7bba229d-3fe3-4ae0-a59a-a111c7ac59ca', 'App\\Notifications\\CreateUser', 'App\\User', 20210603135419, '{\"subject\":\"User Registration\",\"message\":\"Jae Enolpe has registered to the system and is currently unverified.\",\"url\":\"\\/users\"}', NULL, '2021-07-01 22:32:14', '2021-07-01 22:32:14'),
('7d013be9-4ef0-42fe-82ff-cfad21fb94f1', 'App\\Notifications\\SubmitComputerPartReport', 'App\\User', 20210423183214, '{\"subject\":\"Report submission\",\"message\":\"The Asus with a model number of z170-A has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2022-04-28 16:55:37', '2022-04-28 16:55:37'),
('7dc7058b-8a55-4627-9a9b-ddd9a58139ef', 'App\\Notifications\\SubmitComputerPartReport', 'App\\User', 20210603135419, '{\"subject\":\"Report submission\",\"message\":\"The Asus with a model number of 1070ti-8g-Trbo has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2021-07-25 10:00:39', '2021-07-25 10:00:39'),
('7ff47162-8845-4103-8fc2-73bad25fddc2', 'App\\Notifications\\SubmitReport', 'App\\User', 20210603160024, '{\"subject\":\"Report submission\",\"message\":\"The MSI with a model number of Z570-Z has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2021-07-25 09:57:12', '2021-07-25 09:57:12'),
('80ba74be-19e1-41f9-b06e-d8fa0f896625', 'App\\Notifications\\BorrowComponent', 'App\\User', 20210603155905, '{\"subject\":\"Borrow Component Request\",\"message\":\"Mr\\/Ms. Administrator has requested to borrow the MSI with a model number of Z570-Z\",\"url\":\"\\/borrowlogs\"}', NULL, '2021-07-14 12:24:51', '2021-07-14 12:24:51'),
('818e0139-4a67-4ca3-af8c-a1de9add6b47', 'App\\Notifications\\CreateUser', 'App\\User', 20210603155905, '{\"subject\":\"User Registration\",\"message\":\"Manuel Pingol has registered to the system and is currently unverified.\",\"url\":\"\\/users\"}', NULL, '2021-06-03 08:00:24', '2021-06-03 08:00:24'),
('81e7340f-d4b9-462e-85b9-e5317f48050a', 'App\\Notifications\\OverdueBorrower', 'App\\User', 20210423183214, '{\"subject\":\"Return borrowed component\",\"message\":\"Hello Administrator,  the MSI that you borrowed has been overdue. Please report to the department immediately\",\"url\":\"\\/borrowlogs\"}', '2021-07-28 04:28:30', '2021-07-27 03:26:15', '2021-07-28 04:28:30'),
('8224e7b3-791f-4d14-ae83-8b31b7cdb586', 'App\\Notifications\\BorrowComponent', 'App\\User', 20210603155146, '{\"subject\":\"Borrow Component Request\",\"message\":\"Mr\\/Ms. Administrator has requested to borrow the MSI with a model number of Z570-Z\",\"url\":\"\\/borrowlogs\"}', NULL, '2021-07-25 09:30:14', '2021-07-25 09:30:14'),
('830b655a-d76b-4849-95b9-c6a11770219c', 'App\\Notifications\\CreateUser', 'App\\User', 20210603155905, '{\"subject\":\"User Registration\",\"message\":\"Hanzel H. Ceniza has registered to the system and is currently unverified.\",\"url\":\"\\/users\"}', NULL, '2021-07-01 22:32:53', '2021-07-01 22:32:53'),
('83b1b671-947f-4e78-9022-9ccc150ab8c3', 'App\\Notifications\\CreateUser', 'App\\User', 20210423132640, '{\"subject\":\"User Registration\",\"message\":\"Sample Student has registered to the system and is currently unverified.\",\"url\":\"\\/users\"}', '2021-04-23 05:33:15', '2021-04-23 05:30:58', '2021-04-23 05:33:15'),
('84204825-8f9b-485f-b597-3faa58b84b05', 'App\\Notifications\\SubmitComputerPartReport', 'App\\User', 20210603155905, '{\"subject\":\"Report submission\",\"message\":\"The Asus with a model number of Z170-A has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2021-07-14 10:03:56', '2021-07-14 10:03:56'),
('84fd8ec1-0c7f-441a-afb4-171599e72950', 'App\\Notifications\\SubmitComputerPartReport', 'App\\User', 20210730165954, '{\"subject\":\"Report submission\",\"message\":\"The Asus with a model number of Z170-A has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2022-04-19 15:45:04', '2022-04-19 15:45:04'),
('85bd604d-6958-41cf-993e-ad77558cd2c1', 'App\\Notifications\\BorrowComponent', 'App\\User', 20210603155905, '{\"subject\":\"Borrow Component Request\",\"message\":\"Mr\\/Ms. Administrator has requested to borrow the MSI with a model number of z121\",\"url\":\"\\/borrowlogs\"}', NULL, '2021-07-14 12:10:12', '2021-07-14 12:10:12'),
('8741df6e-5fe4-421a-9936-86423d3ca7b3', 'App\\Notifications\\BorrowComponent', 'App\\User', 20210423183214, '{\"subject\":\"Borrow Component Request\",\"message\":\"Mr\\/Ms. Administrator has requested to borrow the MSI with a model number of Z570-Z\",\"url\":\"\\/borrowlogs\"}', '2021-07-25 09:37:55', '2021-07-17 10:57:03', '2021-07-25 09:37:55');
INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('87de717e-8596-410c-9a7e-3bd0e5a60d04', 'App\\Notifications\\SubmitReport', 'App\\User', 20210603155905, '{\"subject\":\"Report submission\",\"message\":\"The MSI with a model number of z121 has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2021-07-14 06:19:16', '2021-07-14 06:19:16'),
('880d8c5d-86b7-4a77-9aba-5cd98aeb8bda', 'App\\Notifications\\SubmitReport', 'App\\User', 20210423183214, '{\"subject\":\"Report submission\",\"message\":\"The Transcend Flash Drive with a model number of 2.5SATA-SSD512GB has been reported by Jae Enolpe\",\"url\":\"\\/reports\"}', NULL, '2024-04-17 16:45:03', '2024-04-17 16:45:03'),
('8811b9f5-f390-43ff-b929-0af3b0fdc7ec', 'App\\Notifications\\NotifyBorrower', 'App\\User', 20210423183214, '{\"subject\":\"Return borrowed component\",\"message\":\"Hello Administrator,  the sony that you borrowed must be returned on or before Jul 30 2021 01:12 PM\",\"url\":\"\\/borrowlogs\"}', '2021-07-28 05:52:22', '2021-07-28 05:39:52', '2021-07-28 05:52:22'),
('881f2a4d-92d4-42df-8e8c-cd6968ee6f84', 'App\\Notifications\\SubmitReport', 'App\\User', 20210423183214, '{\"subject\":\"Report submission\",\"message\":\"The 123123 with a model number of 12312 has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2021-11-08 17:09:13', '2021-11-08 17:09:13'),
('884199ec-8cb3-433f-b526-4341ee0df581', 'App\\Notifications\\SubmitComputerPartReport', 'App\\User', 20210603155146, '{\"subject\":\"Report submission\",\"message\":\"The Asus with a model number of Z170-A has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2021-07-14 11:01:46', '2021-07-14 11:01:46'),
('8860e0ff-4dab-4751-8e66-00584e619959', 'App\\Notifications\\AcceptUser', 'App\\User', 20210730165961, '{\"subject\":\"New user\",\"message\":\"Hello and welcome to Asset Tracking, please go to the url to change your password.\",\"url\":\"\\/profile\"}', NULL, '2024-04-18 15:53:07', '2024-04-18 15:53:07'),
('899d1322-d8a8-4c49-8b71-8f22903f0103', 'App\\Notifications\\SubmitReport', 'App\\User', 20210728093545, '{\"subject\":\"Report submission\",\"message\":\"The Transcend Flash Drive with a model number of 8GB-TranscendFlashdrive has been reported by KYNN BURGOS\",\"url\":\"\\/reports\"}', NULL, '2024-04-17 16:31:45', '2024-04-17 16:31:45'),
('89d781f8-3491-458f-9ef7-f4dfa1a21492', 'App\\Notifications\\CreateUser', 'App\\User', 20210603160024, '{\"subject\":\"User Registration\",\"message\":\"Hanzel H. Ceniza has registered to the system and is currently unverified.\",\"url\":\"\\/users\"}', NULL, '2021-07-01 22:39:19', '2021-07-01 22:39:19'),
('8a2416ab-4639-4e9b-834b-39456b5b9197', 'App\\Notifications\\CreateUser', 'App\\User', 20210423183214, '{\"subject\":\"User Registration\",\"message\":\"Jae Enolpe has registered to the system and is currently unverified.\",\"url\":\"\\/users\"}', '2021-07-14 12:09:44', '2021-06-03 05:54:20', '2021-07-14 12:09:44'),
('8af54877-a32f-4ac4-b8a8-3f92cdae60e0', 'App\\Notifications\\SubmitComputerPartReport', 'App\\User', 20210603155146, '{\"subject\":\"Report submission\",\"message\":\"The Asus with a model number of 1070ti-8g-Trbo has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2021-07-25 10:17:20', '2021-07-25 10:17:20'),
('8d4b66c4-1e4f-453a-b455-1a689e583f26', 'App\\Notifications\\SubmitComputerPartReport', 'App\\User', 20210603155905, '{\"subject\":\"Report submission\",\"message\":\"The Asus with a model number of 1070ti-8g-Trbo has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2021-07-25 10:13:45', '2021-07-25 10:13:45'),
('8e39db63-b7c5-439a-80f8-f8aad095aa53', 'App\\Notifications\\SubmitComputerPartReport', 'App\\User', 20210423132838, '{\"subject\":\"Report submission\",\"message\":\"The Asus with a model number of 1070ti-8g-Trbo has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2021-07-25 10:17:20', '2021-07-25 10:17:20'),
('8eb329a9-948d-4f64-bbb3-fe1af648e063', 'App\\Notifications\\BorrowComponent', 'App\\User', 20210603135419, '{\"subject\":\"Borrow Component Request\",\"message\":\"Mr\\/Ms. Administrator has requested to borrow the MSI with a model number of Z570-Z\",\"url\":\"\\/borrowlogs\"}', NULL, '2021-07-25 09:30:14', '2021-07-25 09:30:14'),
('8ee8183a-eebb-45f4-af01-9f3919c0b952', 'App\\Notifications\\SubmitReport', 'App\\User', 20210423183214, '{\"subject\":\"Report submission\",\"message\":\"The MSI with a model number of z121 has been reported by Administrator\",\"url\":\"\\/reports\"}', '2021-07-14 12:09:44', '2021-07-14 06:19:16', '2021-07-14 12:09:44'),
('9027d2c8-2d75-48f0-85c4-2708f09a9538', 'App\\Notifications\\BorrowComponent', 'App\\User', 20210423183214, '{\"subject\":\"Borrow Component Request\",\"message\":\"Mr\\/Ms. Administrator has requested to borrow the sony with a model number of alpha 7r\",\"url\":\"\\/borrowlogs\"}', '2021-07-28 04:29:40', '2021-07-28 04:29:08', '2021-07-28 04:29:40'),
('90a2a05e-2759-4e23-84be-e835363b1bb3', 'App\\Notifications\\BorrowComponent', 'App\\User', 20210423183214, '{\"subject\":\"Borrow Component Request\",\"message\":\"Mr\\/Ms. HANZEL ceniza has requested to borrow the Transcend Flash Drive with a model number of 8GB-TranscendFlashdrive\",\"url\":\"\\/borrowlogs\"}', NULL, '2024-04-17 16:29:09', '2024-04-17 16:29:09'),
('924d4c8e-a474-4e93-bac8-1fa329651b7d', 'App\\Notifications\\SubmitComputerPartReport', 'App\\User', 20210423183214, '{\"subject\":\"Report submission\",\"message\":\"The Asus with a model number of Z170-A has been reported by Administrator\",\"url\":\"\\/reports\"}', '2021-07-14 12:09:44', '2021-07-14 11:01:45', '2021-07-14 12:09:44'),
('93d32df0-39b7-461c-b96b-7a4c9325da86', 'App\\Notifications\\SubmitComputerPartReport', 'App\\User', 20210423183214, '{\"subject\":\"Report submission\",\"message\":\"The Asus with a model number of Z170-A has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2022-04-28 16:20:43', '2022-04-28 16:20:43'),
('9502662a-f770-4fb0-b963-6ace6964e565', 'App\\Notifications\\AcceptUser', 'App\\User', 20210730165960, '{\"subject\":\"New user\",\"message\":\"Hello and welcome to Asset Tracking, please go to the url to change your password.\",\"url\":\"\\/profile\"}', NULL, '2024-04-18 15:48:05', '2024-04-18 15:48:05'),
('961d8ddf-8008-4b80-ab0b-f7b34c880eaa', 'App\\Notifications\\SubmitReport', 'App\\User', 20210603155905, '{\"subject\":\"Report submission\",\"message\":\"The MSI with a model number of Z570-Z has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2021-07-25 09:57:12', '2021-07-25 09:57:12'),
('967bdfde-0249-4911-8039-b31cbe7427e2', 'App\\Notifications\\CreateUser', 'App\\User', 20210603135419, '{\"subject\":\"User Registration\",\"message\":\"Jae Enolpe has registered to the system and is currently unverified.\",\"url\":\"\\/users\"}', NULL, '2021-06-03 07:51:46', '2021-06-03 07:51:46'),
('96b850d6-fce5-4166-957e-5be457fe2506', 'App\\Notifications\\OverdueBorrower', 'App\\User', 20210423183214, '{\"subject\":\"Return borrowed component\",\"message\":\"Hello Administrator,  the MSI that you borrowed has been overdue. Please report to the department immediately\",\"url\":\"\\/borrowlogs\"}', '2021-07-25 09:37:55', '2021-07-25 09:31:38', '2021-07-25 09:37:55'),
('96d2d4e2-94b5-479b-8fc4-c810f11dc78e', 'App\\Notifications\\OverdueBorrower', 'App\\User', 20210423183214, '{\"subject\":\"Return borrowed component\",\"message\":\"Hello Administrator,  the sony that you borrowed has been overdue. Please report to the department immediately\",\"url\":\"\\/borrowlogs\"}', '2021-07-29 09:02:58', '2021-07-28 05:52:44', '2021-07-29 09:02:58'),
('9700d7ea-d495-4c5d-81b5-5c74d9d97d4f', 'App\\Notifications\\BorrowComponent', 'App\\User', 20210423183214, '{\"subject\":\"Borrow Component Request\",\"message\":\"Mr\\/Ms. Administrator has requested to borrow the sony with a model number of alpha 7r\",\"url\":\"\\/borrowlogs\"}', '2021-07-28 05:13:27', '2021-07-28 05:12:59', '2021-07-28 05:13:27'),
('994543eb-a581-48a1-a9d1-6a8f6333825c', 'App\\Notifications\\AcceptUser', 'App\\User', 20210423180227, '{\"subject\":\"New user\",\"message\":\"Hello and welcome to Asset Tracking, please go to the url to change your password.\",\"url\":\"\\/profile\"}', NULL, '2021-04-23 14:36:24', '2021-04-23 14:36:24'),
('9e0cf6fe-33b1-4e38-83bd-39ec476b886c', 'App\\Notifications\\SubmitReport', 'App\\User', 20210603155146, '{\"subject\":\"Report submission\",\"message\":\"The MSI with a model number of z121 has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2021-07-14 11:01:28', '2021-07-14 11:01:28'),
('9fa69388-9aab-41da-9812-794a6b1cdf7f', 'App\\Notifications\\SubmitReport', 'App\\User', 20210603160024, '{\"subject\":\"Report submission\",\"message\":\"The MSI with a model number of z121 has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2021-07-14 06:19:16', '2021-07-14 06:19:16'),
('a00ba2f4-e9f1-44e2-94a3-948b7a7efa17', 'App\\Notifications\\SubmitComputerPartReport', 'App\\User', 20210603160025, '{\"subject\":\"Report submission\",\"message\":\"The Asus with a model number of Z170-A has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2021-07-14 10:03:56', '2021-07-14 10:03:56'),
('a12db21e-0dcb-45a0-aa5b-5648b2e85ec2', 'App\\Notifications\\SubmitComputerPartReport', 'App\\User', 20210423183214, '{\"subject\":\"Report submission\",\"message\":\"The Asus with a model number of 1070ti-8g-Trbo has been reported by Administrator\",\"url\":\"\\/reports\"}', '2021-07-28 04:28:30', '2021-07-25 10:17:20', '2021-07-28 04:28:30'),
('a164b43a-9090-4728-bf8e-7cb4c62986e2', 'App\\Notifications\\CreateUser', 'App\\User', 20210423183214, '{\"subject\":\"User Registration\",\"message\":\"Hanzel H. Ceniza has registered to the system and is currently unverified.\",\"url\":\"\\/users\"}', '2021-07-14 12:09:44', '2021-07-01 22:32:53', '2021-07-14 12:09:44'),
('a1744248-fa68-411a-9e00-2a9599352295', 'App\\Notifications\\SubmitComputerPartReport', 'App\\User', 20210728093545, '{\"subject\":\"Report submission\",\"message\":\"The Asus with a model number of B550-A mATX has been reported by Jae Enolpe\",\"url\":\"\\/reports\"}', NULL, '2024-04-17 16:58:30', '2024-04-17 16:58:30'),
('a1f16c10-268f-4479-9d4b-a05aa9afb9aa', 'App\\Notifications\\SubmitReport', 'App\\User', 20210730165955, '{\"subject\":\"Report submission\",\"message\":\"The 1234556 with a model number of 123414515 has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2022-04-28 16:34:58', '2022-04-28 16:34:58'),
('a2266801-55ed-4bbe-85d8-2d92414591c2', 'App\\Notifications\\SubmitReport', 'App\\User', 20210423183214, '{\"subject\":\"Report submission\",\"message\":\"The Gigabyte GA-A320M with a model number of B100 has been reported by Sample WS\",\"url\":\"\\/reports\"}', '2021-07-14 12:09:44', '2021-05-07 06:30:57', '2021-07-14 12:09:44'),
('a4de8f57-214e-4b45-bda9-9b886856bc6e', 'App\\Notifications\\SubmitComputerPartReport', 'App\\User', 20210603135419, '{\"subject\":\"Report submission\",\"message\":\"The Asus with a model number of Z170-A has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2021-07-14 11:01:46', '2021-07-14 11:01:46'),
('a50158f0-bef7-426d-b74e-9969f1e4c224', 'App\\Notifications\\BorrowRequest', 'App\\User', 20210423183214, '{\"subject\":\"Borrow Component Request\",\"message\":\"The MSI with a model number of Z570-Z that you requested to borrow has been APPROVED.\",\"url\":\"\\/borrowlogs\"}', '2021-07-28 04:28:30', '2021-07-27 03:24:03', '2021-07-28 04:28:30'),
('a660d479-0f82-4a8b-a4a4-983f534d8e7e', 'App\\Notifications\\CreateUser', 'App\\User', 20210603160024, '{\"subject\":\"User Registration\",\"message\":\"Hanzel H. Ceniza has registered to the system and is currently unverified.\",\"url\":\"\\/users\"}', NULL, '2021-07-01 22:32:53', '2021-07-01 22:32:53'),
('a6bb9e04-d694-4c2e-9a4d-43d8bcc028fe', 'App\\Notifications\\SubmitComputerPartReport', 'App\\User', 20210603160024, '{\"subject\":\"Report submission\",\"message\":\"The Asus with a model number of Z170-A has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2021-07-14 11:01:46', '2021-07-14 11:01:46'),
('a6d08a4b-8ba9-460e-878e-fe6cb6b1bad0', 'App\\Notifications\\SubmitComputerPartReport', 'App\\User', 20210730165954, '{\"subject\":\"Report submission\",\"message\":\"The Asus with a model number of z170-A has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2022-04-28 16:34:36', '2022-04-28 16:34:36'),
('a70c29aa-2c22-4a35-b231-756b65740e85', 'App\\Notifications\\SubmitReport', 'App\\User', 20210423132838, '{\"subject\":\"Report submission\",\"message\":\"The NZXT H510 with a model number of H510 has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2021-04-23 09:59:29', '2021-04-23 09:59:29'),
('a780624e-222d-4634-ad6e-647e2c1f7441', 'App\\Notifications\\SubmitComputerPartReport', 'App\\User', 20210730165954, '{\"subject\":\"Report submission\",\"message\":\"The Asus with a model number of z170-A has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2022-04-28 16:28:57', '2022-04-28 16:28:57'),
('a7b98e26-ebd6-40d9-b05e-5a0fee95585e', 'App\\Notifications\\CreateUser', 'App\\User', 20210603155146, '{\"subject\":\"User Registration\",\"message\":\"Hanzel H. Ceniza has registered to the system and is currently unverified.\",\"url\":\"\\/users\"}', NULL, '2021-07-01 22:32:53', '2021-07-01 22:32:53'),
('a7ede81f-bc3a-438d-90a0-02136c60c427', 'App\\Notifications\\CreateUser', 'App\\User', 20210702063252, '{\"subject\":\"User Registration\",\"message\":\"Hanzel H. Ceniza has registered to the system and is currently unverified.\",\"url\":\"\\/users\"}', NULL, '2021-07-01 22:32:53', '2021-07-01 22:32:53'),
('a89396a5-f809-4827-a13d-c03684421577', 'App\\Notifications\\SubmitReport', 'App\\User', 20210603160025, '{\"subject\":\"Report submission\",\"message\":\"The MSI with a model number of z121 has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2021-07-14 11:01:28', '2021-07-14 11:01:28'),
('a8a41a69-5cca-4600-8dd8-934cecd3d108', 'App\\Notifications\\CreateUser', 'App\\User', 20210603155146, '{\"subject\":\"User Registration\",\"message\":\"Jae Enolpe has registered to the system and is currently unverified.\",\"url\":\"\\/users\"}', NULL, '2021-06-03 07:51:46', '2021-06-03 07:51:46'),
('a935d935-17af-4a94-89bf-91c8e3ed1382', 'App\\Notifications\\AcceptUser', 'App\\User', 20210730165959, '{\"subject\":\"New user\",\"message\":\"Hello and welcome to Asset Tracking, please go to the url to change your password.\",\"url\":\"\\/profile\"}', NULL, '2024-04-17 17:28:01', '2024-04-17 17:28:01'),
('a9923e6a-a648-4fe1-97f3-edc3d1e6bdc0', 'App\\Notifications\\NotifyBorrower', 'App\\User', 20210423183214, '{\"subject\":\"Return borrowed component\",\"message\":\"Hello Administrator,  the sony that you borrowed must be returned on or before Jul 28 2021 12:32 PM\",\"url\":\"\\/borrowlogs\"}', '2021-07-28 04:34:48', '2021-07-28 04:34:00', '2021-07-28 04:34:48'),
('a9a8f3c5-79c4-44f2-a0a8-87c2ba8eb077', 'App\\Notifications\\AcceptUser', 'App\\User', 20210730165966, '{\"subject\":\"New user\",\"message\":\"Hello and welcome to Asset Tracking, please go to the url to change your password.\",\"url\":\"\\/profile\"}', NULL, '2024-04-21 14:29:30', '2024-04-21 14:29:30'),
('aca88692-5884-4d20-aa65-97092cfd1f9a', 'App\\Notifications\\SubmitReport', 'App\\User', 20210728093545, '{\"subject\":\"Report submission\",\"message\":\"The Transcend Flash Drive with a model number of 2.5SATA-SSD512GB has been reported by Jae Enolpe\",\"url\":\"\\/reports\"}', NULL, '2024-04-17 16:45:03', '2024-04-17 16:45:03'),
('ae4318b9-7038-4131-9383-da20bc3037e4', 'App\\Notifications\\SubmitComputerPartReport', 'App\\User', 20210603160025, '{\"subject\":\"Report submission\",\"message\":\"The Asus with a model number of 1070ti-8g-Trbo has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2021-07-21 03:17:11', '2021-07-21 03:17:11'),
('aeaea177-a3e3-4955-a26a-ed44f25d3243', 'App\\Notifications\\SubmitComputerPartReport', 'App\\User', 20210603160025, '{\"subject\":\"Report submission\",\"message\":\"The Asus with a model number of 1070ti-8g-Trbo has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2021-07-25 09:57:58', '2021-07-25 09:57:58'),
('b12eb01c-f810-4770-bd3e-85d57330c80e', 'App\\Notifications\\SubmitComputerPartReport', 'App\\User', 20210730165954, '{\"subject\":\"Report submission\",\"message\":\"The Gigabyte with a model number of Z570-A has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2021-11-27 04:51:53', '2021-11-27 04:51:53'),
('b1651b24-f1e2-4450-852f-6b1f4d72ba47', 'App\\Notifications\\CreateUser', 'App\\User', 20210603160024, '{\"subject\":\"User Registration\",\"message\":\"Manuel Pingol has registered to the system and is currently unverified.\",\"url\":\"\\/users\"}', NULL, '2021-06-03 08:00:24', '2021-06-03 08:00:24'),
('b22e7828-ee5f-4d68-aaf6-7761ab32f7d2', 'App\\Notifications\\BorrowRequest', 'App\\User', 20210423133058, '{\"subject\":\"Borrow Component Request\",\"message\":\"The NZXT H510 with a model number of H510 that you requested to borrow has been APPROVED.\",\"url\":\"\\/borrowlogs\"}', '2021-04-23 09:43:31', '2021-04-23 06:07:59', '2021-04-23 09:43:31'),
('b389ae17-ebcc-4204-8ac1-3fe29f2d4fab', 'App\\Notifications\\BorrowComponent', 'App\\User', 20210730165954, '{\"subject\":\"Borrow Component Request\",\"message\":\"Mr\\/Ms. Jae Enolpe has requested to borrow the Transcend Flash Drive with a model number of 8GB-TranscendFlashdrive\",\"url\":\"\\/borrowlogs\"}', NULL, '2024-04-17 16:27:19', '2024-04-17 16:27:19'),
('b3990e76-051c-4196-a4cf-00464d1023d3', 'App\\Notifications\\SubmitReport', 'App\\User', 20210423132838, '{\"subject\":\"Report submission\",\"message\":\"The MSI with a model number of z121 has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2021-07-14 06:19:16', '2021-07-14 06:19:16'),
('b418502e-e29f-4810-a5f5-3257b5c02929', 'App\\Notifications\\SubmitComputerPartReport', 'App\\User', 20210730165955, '{\"subject\":\"Report submission\",\"message\":\"The Asus with a model number of Z170-A has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2022-04-28 16:20:43', '2022-04-28 16:20:43'),
('b5fc69c3-0de2-43fa-ab6e-dc4cd5c4f138', 'App\\Notifications\\BorrowComponent', 'App\\User', 20210603135419, '{\"subject\":\"Borrow Component Request\",\"message\":\"Mr\\/Ms. Administrator has requested to borrow the MSI with a model number of Z570-Z\",\"url\":\"\\/borrowlogs\"}', NULL, '2021-07-14 12:24:50', '2021-07-14 12:24:50'),
('b6a00263-1443-4940-adfd-a5889b3d5660', 'App\\Notifications\\SubmitReport', 'App\\User', 20210603155146, '{\"subject\":\"Report submission\",\"message\":\"The MSI with a model number of Z570-Z has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2021-07-25 10:16:07', '2021-07-25 10:16:07'),
('b6c1be54-18ac-4130-a8c2-228a3ab55cb1', 'App\\Notifications\\SubmitComputerPartReport', 'App\\User', 20210603135419, '{\"subject\":\"Report submission\",\"message\":\"The Asus with a model number of 1070ti-8g-Trbo has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2021-07-25 09:57:58', '2021-07-25 09:57:58'),
('b70e364e-a4ff-4154-b036-6e87a8ab919e', 'App\\Notifications\\SubmitReport', 'App\\User', 20210423132838, '{\"subject\":\"Report submission\",\"message\":\"The MSI with a model number of Z570-Z has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2021-07-25 09:57:12', '2021-07-25 09:57:12'),
('b8043861-05c5-43fa-bcf0-df0d7cc9d521', 'App\\Notifications\\BorrowComponent', 'App\\User', 20210728093545, '{\"subject\":\"Borrow Component Request\",\"message\":\"Mr\\/Ms. Jae Enolpe has requested to borrow the Transcend Flash Drive with a model number of 2.5SATA-SSD512GB\",\"url\":\"\\/borrowlogs\"}', NULL, '2024-04-17 16:46:41', '2024-04-17 16:46:41'),
('b937da8e-3bfd-475c-8df7-3f01a55d60e8', 'App\\Notifications\\CreateUser', 'App\\User', 20210702063732, '{\"subject\":\"User Registration\",\"message\":\"Hanzel Ceniza has registered to the system and is currently unverified.\",\"url\":\"\\/users\"}', NULL, '2021-07-01 22:37:32', '2021-07-01 22:37:32'),
('b97e7ca9-0c9b-41ee-8810-688969268c99', 'App\\Notifications\\BorrowComponent', 'App\\User', 20210603155146, '{\"subject\":\"Borrow Component Request\",\"message\":\"Mr\\/Ms. Administrator has requested to borrow the MSI with a model number of z121\",\"url\":\"\\/borrowlogs\"}', NULL, '2021-07-14 12:10:12', '2021-07-14 12:10:12'),
('bb95ad5f-7b42-4a03-af0a-567f77fc4cec', 'App\\Notifications\\SubmitReport', 'App\\User', 20210603155905, '{\"subject\":\"Report submission\",\"message\":\"The MSI with a model number of z121 has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2021-07-14 02:25:21', '2021-07-14 02:25:21'),
('bbc24e01-4309-4400-9b63-ba66765d2d2e', 'App\\Notifications\\BorrowRequest', 'App\\User', 20210423183214, '{\"subject\":\"Borrow Component Request\",\"message\":\"The sony with a model number of alpha 7r that you requested to borrow has been APPROVED.\",\"url\":\"\\/borrowlogs\"}', '2021-07-28 05:13:27', '2021-07-28 05:13:24', '2021-07-28 05:13:27'),
('bbfc198e-48d0-4bd4-ac1b-bc055bd6799c', 'App\\Notifications\\AcceptUser', 'App\\User', 20210603160025, '{\"subject\":\"New user\",\"message\":\"Hello and welcome to Asset Tracking, please go to the url to change your password.\",\"url\":\"\\/profile\"}', NULL, '2021-06-03 18:19:52', '2021-06-03 18:19:52'),
('bc4e3c64-2408-4209-a13c-8ec9c8d87509', 'App\\Notifications\\SubmitReport', 'App\\User', 20210423132838, '{\"subject\":\"Report submission\",\"message\":\"The MSI with a model number of z121 has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2021-07-14 02:25:21', '2021-07-14 02:25:21'),
('bd1fc32d-6d2a-4a11-8dd8-0247c488eb6d', 'App\\Notifications\\BorrowComponent', 'App\\User', 20210423183214, '{\"subject\":\"Borrow Component Request\",\"message\":\"Mr\\/Ms. Administrator has requested to borrow the sony with a model number of alpha 7r\",\"url\":\"\\/borrowlogs\"}', '2021-07-28 04:28:30', '2021-07-28 00:37:50', '2021-07-28 04:28:30'),
('be0f5002-4901-4e01-a7c2-d853886fa4b7', 'App\\Notifications\\SubmitReport', 'App\\User', 20210603155146, '{\"subject\":\"Report submission\",\"message\":\"The MSI with a model number of Z570-Z has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2021-07-25 09:57:12', '2021-07-25 09:57:12'),
('bf703a8c-b6ab-4e10-a0d1-c99c63692132', 'App\\Notifications\\CreateUser', 'App\\User', 20210603160024, '{\"subject\":\"User Registration\",\"message\":\"Hanzel Ceniza has registered to the system and is currently unverified.\",\"url\":\"\\/users\"}', NULL, '2021-07-01 22:37:32', '2021-07-01 22:37:32'),
('bfcf2cd1-24fd-4db9-8f3c-5d85f31afb70', 'App\\Notifications\\SubmitReport', 'App\\User', 20210603160024, '{\"subject\":\"Report submission\",\"message\":\"The MSI with a model number of Z570-Z has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2021-07-25 10:16:07', '2021-07-25 10:16:07'),
('c030b989-e7dc-4ec3-a86f-e7197a404e29', 'App\\Notifications\\SubmitReport', 'App\\User', 20210730165954, '{\"subject\":\"Report submission\",\"message\":\"The 123123 with a model number of 12312 has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2021-11-08 17:09:13', '2021-11-08 17:09:13'),
('c1660a3d-c075-4b69-9192-ef64ae88b0bb', 'App\\Notifications\\OverdueBorrower', 'App\\User', 20210423183214, '{\"subject\":\"Return borrowed component\",\"message\":\"Hello Administrator,  the MSI that you borrowed has been overdue. Please report to the department immediately\",\"url\":\"\\/borrowlogs\"}', '2021-07-28 04:28:30', '2021-07-26 09:44:55', '2021-07-28 04:28:30'),
('c1baf37e-7e2b-4005-bf84-a5e8078e6c0a', 'App\\Notifications\\AcceptUser', 'App\\User', 20210728093545, '{\"subject\":\"New user\",\"message\":\"Hello and welcome to Asset Tracking, please go to the url to change your password.\",\"url\":\"\\/profile\"}', '2024-04-17 16:27:44', '2024-04-17 16:21:58', '2024-04-17 16:27:44'),
('c46e5962-807d-45ef-83f4-44a48cd0c10f', 'App\\Notifications\\SubmitComputerPartReport', 'App\\User', 20210603155146, '{\"subject\":\"Report submission\",\"message\":\"The Asus with a model number of 1070ti-8g-Trbo has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2021-07-25 09:57:58', '2021-07-25 09:57:58'),
('c4f6e8b8-68d3-4dfc-a3e5-b984eb7fcbbb', 'App\\Notifications\\SubmitComputerPartReport', 'App\\User', 20210603160024, '{\"subject\":\"Report submission\",\"message\":\"The Asus with a model number of 1070ti-8g-Trbo has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2021-07-25 10:00:40', '2021-07-25 10:00:40'),
('c4fd98e0-81d7-4d67-a70a-acad068b7f3d', 'App\\Notifications\\NotifyBorrower', 'App\\User', 20210423183214, '{\"subject\":\"Return borrowed component\",\"message\":\"Hello Administrator,  the sony that you borrowed must be returned on or before Jul 30 2021 01:12 PM\",\"url\":\"\\/borrowlogs\"}', '2021-07-28 05:52:22', '2021-07-28 05:50:09', '2021-07-28 05:52:22'),
('c5a90006-02a8-4c14-8c33-92b3c3e97aed', 'App\\Notifications\\BorrowRequest', 'App\\User', 20210423183214, '{\"subject\":\"Borrow Component Request\",\"message\":\"The MSI with a model number of Z570-Z that you requested to borrow has been APPROVED.\",\"url\":\"\\/borrowlogs\"}', '2021-07-25 09:37:55', '2021-07-25 09:30:41', '2021-07-25 09:37:55'),
('c65e3d4d-ffea-4062-8fe6-729baca88531', 'App\\Notifications\\SubmitComputerPartReport', 'App\\User', 20210423183214, '{\"subject\":\"Report submission\",\"message\":\"The Asus with a model number of 1070ti-8g-Trbo has been reported by Administrator\",\"url\":\"\\/reports\"}', '2021-07-25 09:37:55', '2021-07-21 03:17:11', '2021-07-25 09:37:55'),
('c671349b-14b9-4936-b574-0617bec443af', 'App\\Notifications\\AcceptUser', 'App\\User', 20210730165965, '{\"subject\":\"New user\",\"message\":\"Hello and welcome to Asset Tracking, please go to the url to change your password.\",\"url\":\"\\/profile\"}', NULL, '2024-04-18 16:19:18', '2024-04-18 16:19:18'),
('c7bbf07c-f71b-4c88-b811-f4833884f157', 'App\\Notifications\\BorrowComponent', 'App\\User', 20210603160024, '{\"subject\":\"Borrow Component Request\",\"message\":\"Mr\\/Ms. Administrator has requested to borrow the MSI with a model number of z121\",\"url\":\"\\/borrowlogs\"}', NULL, '2021-07-14 12:10:13', '2021-07-14 12:10:13'),
('c7cb5f91-15e2-431b-85ee-d680938310c6', 'App\\Notifications\\SubmitReport', 'App\\User', 20210603160024, '{\"subject\":\"Report submission\",\"message\":\"The MSI with a model number of Z570-Z has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2021-07-14 12:22:35', '2021-07-14 12:22:35'),
('c90c6884-6fcb-4f4e-8be3-fa6640ee9eb7', 'App\\Notifications\\BorrowRequest', 'App\\User', 20210423133058, '{\"subject\":\"Borrow Component Request\",\"message\":\"The NZXT H510 with a model number of H510 that you requested to borrow has been APPROVED.\",\"url\":\"\\/borrowlogs\"}', '2021-04-23 05:38:07', '2021-04-23 05:37:30', '2021-04-23 05:38:07'),
('c93fb26a-c5d9-4c3b-bcfe-73bffcf8d178', 'App\\Notifications\\NotifyBorrower', 'App\\User', 20210423133058, '{\"subject\":\"Return borrowed component\",\"message\":\"Hello Sample Student,  the NZXT H510 that you borrowed must be returned on or before Apr 24 2021 01:32 PM\",\"url\":\"\\/borrowlogs\"}', NULL, '2021-04-23 14:38:02', '2021-04-23 14:38:02'),
('c96fd020-33f2-4d7f-b69e-a56f6d9124c6', 'App\\Notifications\\SubmitComputerPartReport', 'App\\User', 20210603160024, '{\"subject\":\"Report submission\",\"message\":\"The Asus with a model number of 1070ti-8g-Trbo has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2021-07-25 10:13:45', '2021-07-25 10:13:45'),
('c9c3ad72-6864-4c77-a9c6-81fb49b2253d', 'App\\Notifications\\NotifyBorrower', 'App\\User', 20210423183214, '{\"subject\":\"Return borrowed component\",\"message\":\"Hello Administrator,  the MSI that you borrowed must be returned on or before Jul 26 2021 05:29 PM\",\"url\":\"\\/borrowlogs\"}', '2021-07-25 09:37:55', '2021-07-25 09:31:01', '2021-07-25 09:37:55'),
('cb152cc2-9f4c-4700-8adb-c3439189acaf', 'App\\Notifications\\NotifyBorrower', 'App\\User', 20210423183214, '{\"subject\":\"Return borrowed component\",\"message\":\"Hello Administrator,  the sony that you borrowed must be returned on or before Jul 30 2021 01:12 PM\",\"url\":\"\\/borrowlogs\"}', '2021-07-28 05:52:22', '2021-07-28 05:50:35', '2021-07-28 05:52:22'),
('cb1a383b-272f-4b1f-ae00-7fa864416547', 'App\\Notifications\\SubmitReport', 'App\\User', 20210603160025, '{\"subject\":\"Report submission\",\"message\":\"The MSI with a model number of Z570-Z has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2021-07-25 10:16:07', '2021-07-25 10:16:07'),
('cc5a97ce-18c3-4553-a04b-7017cfa63ef0', 'App\\Notifications\\SubmitComputerPartReport', 'App\\User', 20210603135419, '{\"subject\":\"Report submission\",\"message\":\"The Asus with a model number of Z170-A has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2021-07-14 01:25:36', '2021-07-14 01:25:36'),
('ce1f1a4b-fffb-4bcc-b8db-6ecf99931560', 'App\\Notifications\\SubmitReport', 'App\\User', 20210603155146, '{\"subject\":\"Report submission\",\"message\":\"The MSI with a model number of z121 has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2021-07-14 06:13:04', '2021-07-14 06:13:04'),
('ced4ae6f-ca3e-40aa-829d-2a43c7b81bbd', 'App\\Notifications\\SubmitReport', 'App\\User', 20210728093545, '{\"subject\":\"Report submission\",\"message\":\"The Transcend Flash Drive with a model number of 8GB-TranscendFlashdrive has been reported by Jae Enolpe\",\"url\":\"\\/reports\"}', '2024-04-17 16:27:44', '2024-04-17 16:08:38', '2024-04-17 16:27:44'),
('cf475095-786b-4c6b-9bb4-7370db2525eb', 'App\\Notifications\\SubmitComputerPartReport', 'App\\User', 20210730165955, '{\"subject\":\"Report submission\",\"message\":\"The Asus with a model number of z170-A has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2022-04-28 16:28:57', '2022-04-28 16:28:57'),
('cfd60771-e82b-47c3-af7a-351d66a6afc3', 'App\\Notifications\\SubmitReport', 'App\\User', 20210603155146, '{\"subject\":\"Report submission\",\"message\":\"The MSI with a model number of z121 has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2021-07-14 02:25:21', '2021-07-14 02:25:21'),
('d07fb535-131c-46fb-ae83-ea8bdfa95df7', 'App\\Notifications\\AcceptUser', 'App\\User', 20210730165956, '{\"subject\":\"New user\",\"message\":\"Hello and welcome to Asset Tracking, please go to the url to change your password.\",\"url\":\"\\/profile\"}', NULL, '2024-04-17 16:24:49', '2024-04-17 16:24:49'),
('d15a8134-055a-4f76-a9db-237ee39c7b5f', 'App\\Notifications\\BorrowComponent', 'App\\User', 20210423183214, '{\"subject\":\"Borrow Component Request\",\"message\":\"Mr\\/Ms. Jae Enolpe has requested to borrow the Transcend Flash Drive with a model number of 8GB-TranscendFlashdrive\",\"url\":\"\\/borrowlogs\"}', NULL, '2024-04-17 16:27:19', '2024-04-17 16:27:19'),
('d19695df-9dbb-48ef-afa1-0bd42ad92430', 'App\\Notifications\\SubmitReport', 'App\\User', 20210423183214, '{\"subject\":\"Report submission\",\"message\":\"The MSI with a model number of Z570-Z has been reported by Administrator\",\"url\":\"\\/reports\"}', '2021-07-28 04:28:30', '2021-07-25 09:57:12', '2021-07-28 04:28:30'),
('d1fd64c5-bbd7-4ebe-a09b-7669d1bb982d', 'App\\Notifications\\SubmitComputerPartReport', 'App\\User', 20210423183214, '{\"subject\":\"Report submission\",\"message\":\"The Asus with a model number of z170 has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2021-11-27 04:09:08', '2021-11-27 04:09:08'),
('d419a99f-54a6-4b0d-a154-43db04671e8b', 'App\\Notifications\\SubmitReport', 'App\\User', 20210603160025, '{\"subject\":\"Report submission\",\"message\":\"The MSI with a model number of Z570-Z has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2021-07-14 12:22:35', '2021-07-14 12:22:35'),
('d567036e-a9f1-4774-9a5f-cc40afebc7ce', 'App\\Notifications\\SubmitReport', 'App\\User', 20210423183214, '{\"subject\":\"Report submission\",\"message\":\"The 123123 with a model number of 12312 has been reported by Administrator\",\"url\":\"\\/reports\"}', '2021-07-29 09:02:57', '2021-07-29 07:21:55', '2021-07-29 09:02:57'),
('d5786d20-b6b1-49db-880f-227ac2ced2d0', 'App\\Notifications\\SubmitReport', 'App\\User', 20210603160025, '{\"subject\":\"Report submission\",\"message\":\"The MSI with a model number of z121 has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2021-07-14 02:25:21', '2021-07-14 02:25:21'),
('d582b438-09fc-48c1-9d47-4f3838df2d32', 'App\\Notifications\\SubmitComputerPartReport', 'App\\User', 20210603155146, '{\"subject\":\"Report submission\",\"message\":\"The Asus with a model number of 1070ti-8g-Trbo has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2021-07-25 10:13:45', '2021-07-25 10:13:45'),
('d76b290f-218b-4ebc-a3b5-5064b23c50b9', 'App\\Notifications\\CreateUser', 'App\\User', 20210603135419, '{\"subject\":\"User Registration\",\"message\":\"Hanzel Ceniza has registered to the system and is currently unverified.\",\"url\":\"\\/users\"}', NULL, '2021-06-03 07:59:05', '2021-06-03 07:59:05'),
('d795e592-c830-402f-8d1b-86e2cf28bb21', 'App\\Notifications\\CreateUser', 'App\\User', 20210730165954, '{\"subject\":\"User Registration\",\"message\":\"Hanzel Ceniza has registered to the system and is currently unverified.\",\"url\":\"\\/users\"}', NULL, '2021-07-30 08:59:55', '2021-07-30 08:59:55'),
('da5c673f-38b1-4430-8888-8c115b1f4601', 'App\\Notifications\\SubmitReport', 'App\\User', 20210423132838, '{\"subject\":\"Report submission\",\"message\":\"The NZXT H510 with a model number of H510 has been reported by Sample WS\",\"url\":\"\\/reports\"}', NULL, '2021-04-23 23:27:18', '2021-04-23 23:27:18'),
('da828f8c-786b-4e0a-98b8-95436a557a4f', 'App\\Notifications\\SubmitReport', 'App\\User', 20210730165955, '{\"subject\":\"Report submission\",\"message\":\"The 123123 with a model number of 12312 has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2022-04-27 00:17:45', '2022-04-27 00:17:45'),
('dac51b3f-04e9-47de-847f-3893aca1d656', 'App\\Notifications\\SubmitComputerPartReport', 'App\\User', 20210423183214, '{\"subject\":\"Report submission\",\"message\":\"The Asus with a model number of 1070ti-8g-Trbo has been reported by Administrator\",\"url\":\"\\/reports\"}', '2021-07-28 04:28:30', '2021-07-25 10:00:39', '2021-07-28 04:28:30'),
('db53c068-d8fe-41c6-bcfa-7d3a227720a7', 'App\\Notifications\\BorrowComponent', 'App\\User', 20210728093545, '{\"subject\":\"Borrow Component Request\",\"message\":\"Mr\\/Ms. HANZEL ceniza has requested to borrow the Transcend Flash Drive with a model number of 8GB-TranscendFlashdrive\",\"url\":\"\\/borrowlogs\"}', NULL, '2024-04-17 16:29:09', '2024-04-17 16:29:09'),
('db6e3b13-e615-4957-9aa3-38695322da6d', 'App\\Notifications\\BorrowComponent', 'App\\User', 20210603135419, '{\"subject\":\"Borrow Component Request\",\"message\":\"Mr\\/Ms. Administrator has requested to borrow the MSI with a model number of Z570-Z\",\"url\":\"\\/borrowlogs\"}', NULL, '2021-07-17 10:57:03', '2021-07-17 10:57:03'),
('dc2e54a0-aeb4-4e3d-8ff8-43d9a1595a28', 'App\\Notifications\\SubmitReport', 'App\\User', 20210603155146, '{\"subject\":\"Report submission\",\"message\":\"The MSI with a model number of z121 has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2021-07-14 06:19:16', '2021-07-14 06:19:16'),
('de67c90d-b8c1-4c31-9d9f-88d59ff419f9', 'App\\Notifications\\OverdueBorrower', 'App\\User', 20210423183214, '{\"subject\":\"Return borrowed component\",\"message\":\"Hello Administrator,  the MSI that you borrowed has been overdue. Please report to the department immediately\",\"url\":\"\\/borrowlogs\"}', '2021-07-17 10:32:15', '2021-07-17 10:30:54', '2021-07-17 10:32:15'),
('de83f1aa-9355-4ab4-9560-a83b37da82da', 'App\\Notifications\\CreateUser', 'App\\User', 20210603155146, '{\"subject\":\"User Registration\",\"message\":\"Hanzel Ceniza has registered to the system and is currently unverified.\",\"url\":\"\\/users\"}', NULL, '2021-07-01 22:37:32', '2021-07-01 22:37:32'),
('dee70a75-3907-4b3b-beaa-fc3da83d81a2', 'App\\Notifications\\CreateUser', 'App\\User', 20210423132640, '{\"subject\":\"User Registration\",\"message\":\"Test 1 has registered to the system and is currently unverified.\",\"url\":\"\\/users\"}', NULL, '2021-04-23 10:02:27', '2021-04-23 10:02:27'),
('dee89c1e-1fbe-4806-bb2e-6c99d0b15c25', 'App\\Notifications\\SubmitComputerPartReport', 'App\\User', 20210423132838, '{\"subject\":\"Report submission\",\"message\":\"The Asus with a model number of 1070ti-8g-Trbo has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2021-07-21 03:17:10', '2021-07-21 03:17:10'),
('df9acb80-3f04-484f-a21c-29c0290db8ce', 'App\\Notifications\\NotifyBorrower', 'App\\User', 20210423183214, '{\"subject\":\"Return borrowed component\",\"message\":\"Hello Administrator,  the sony that you borrowed must be returned on or before Jul 28 2021 12:32 PM\",\"url\":\"\\/borrowlogs\"}', '2021-07-28 04:34:48', '2021-07-28 04:34:35', '2021-07-28 04:34:48'),
('e051a34e-68c1-4b66-92bf-ad1521aa62ed', 'App\\Notifications\\SubmitComputerPartReport', 'App\\User', 20210603160024, '{\"subject\":\"Report submission\",\"message\":\"The Asus with a model number of 1070ti-8g-Trbo has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2021-07-25 09:57:58', '2021-07-25 09:57:58'),
('e1195af1-4e23-46d4-b6e6-0adced59f803', 'App\\Notifications\\NotifyBorrower', 'App\\User', 20210423183214, '{\"subject\":\"Return borrowed component\",\"message\":\"Hello Administrator,  the sony that you borrowed must be returned on or before Jul 28 2021 12:32 PM\",\"url\":\"\\/borrowlogs\"}', '2021-07-28 05:11:19', '2021-07-28 04:52:35', '2021-07-28 05:11:19'),
('e125248b-9b3e-4294-86f0-5fbb632aee96', 'App\\Notifications\\BorrowComponent', 'App\\User', 20210603155146, '{\"subject\":\"Borrow Component Request\",\"message\":\"Mr\\/Ms. Administrator has requested to borrow the MSI with a model number of Z570-Z\",\"url\":\"\\/borrowlogs\"}', NULL, '2021-07-17 10:57:03', '2021-07-17 10:57:03'),
('e1bc14cc-feab-439f-88b4-0599df14c2d3', 'App\\Notifications\\AcceptUser', 'App\\User', 20210730165958, '{\"subject\":\"New user\",\"message\":\"Hello and welcome to Asset Tracking, please go to the url to change your password.\",\"url\":\"\\/profile\"}', NULL, '2024-04-17 17:16:22', '2024-04-17 17:16:22'),
('e1dc4898-4d2c-4d94-9c8b-ee55e69002c9', 'App\\Notifications\\SubmitComputerPartReport', 'App\\User', 20210603160024, '{\"subject\":\"Report submission\",\"message\":\"The Asus with a model number of 1070ti-8g-Trbo has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2021-07-21 03:17:11', '2021-07-21 03:17:11'),
('e33b452c-134b-4745-b121-8088aa66e125', 'App\\Notifications\\AcceptUser', 'App\\User', 20210730165964, '{\"subject\":\"New user\",\"message\":\"Hello and welcome to Asset Tracking, please go to the url to change your password.\",\"url\":\"\\/profile\"}', NULL, '2024-04-18 16:13:13', '2024-04-18 16:13:13'),
('e3fb6b6e-b63e-4b17-a23a-02343a12ca44', 'App\\Notifications\\AcceptUser', 'App\\User', 20210702063252, '{\"subject\":\"New user\",\"message\":\"Hello and welcome to Asset Tracking, please go to the url to change your password.\",\"url\":\"\\/profile\"}', NULL, '2021-07-01 22:33:08', '2021-07-01 22:33:08'),
('e4036ee2-b586-4ba6-a1a6-a04655b8f225', 'App\\Notifications\\NotifyBorrower', 'App\\User', 20210423183214, '{\"subject\":\"Return borrowed component\",\"message\":\"Hello Administrator,  the MSI that you borrowed must be returned on or before Jul 26 2021 05:29 PM\",\"url\":\"\\/borrowlogs\"}', '2021-07-28 04:28:30', '2021-07-26 09:44:55', '2021-07-28 04:28:30'),
('e5267e6a-2710-44c4-91be-bdceeec50e70', 'App\\Notifications\\BorrowRequest', 'App\\User', 20210728093545, '{\"subject\":\"Borrow Component Request\",\"message\":\"The sony with a model number of alpha 7r that you requested to borrow has been APPROVED.\",\"url\":\"\\/borrowlogs\"}', '2024-04-17 16:27:44', '2021-07-28 01:51:37', '2024-04-17 16:27:44'),
('e5333135-e1e9-4a41-8417-7b86d5d5fe24', 'App\\Notifications\\SubmitReport', 'App\\User', 20210423132838, '{\"subject\":\"Report submission\",\"message\":\"The MSI with a model number of Z570-Z has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2021-07-25 10:16:07', '2021-07-25 10:16:07'),
('e5962b69-c8f6-4975-bb2b-e38f26675cb5', 'App\\Notifications\\AcceptUser', 'App\\User', 20210702063214, '{\"subject\":\"New user\",\"message\":\"Hello and welcome to Asset Tracking, please go to the url to change your password.\",\"url\":\"\\/profile\"}', NULL, '2021-07-01 22:33:15', '2021-07-01 22:33:15'),
('e6f8502b-d8fe-4f5b-844c-dee68262f51c', 'App\\Notifications\\SubmitReport', 'App\\User', 20210603135419, '{\"subject\":\"Report submission\",\"message\":\"The MSI with a model number of Z570-Z has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2021-07-25 10:16:07', '2021-07-25 10:16:07'),
('e79349bf-f9b6-4fbb-94df-bb20541d333a', 'App\\Notifications\\SubmitReport', 'App\\User', 20210423183214, '{\"subject\":\"Report submission\",\"message\":\"The MSI with a model number of z121 has been reported by Administrator\",\"url\":\"\\/reports\"}', '2021-07-14 12:09:44', '2021-07-14 11:01:28', '2021-07-14 12:09:44'),
('e7c6b93b-e729-481e-b8cb-728bbbf092cb', 'App\\Notifications\\OverdueBorrower', 'App\\User', 20210423183214, '{\"subject\":\"Return borrowed component\",\"message\":\"Hello Administrator,  the MSI that you borrowed has been overdue. Please report to the department immediately\",\"url\":\"\\/borrowlogs\"}', '2021-07-25 09:37:55', '2021-07-25 09:31:02', '2021-07-25 09:37:55'),
('e8401d03-286a-42c0-b950-52356f41ca2f', 'App\\Notifications\\CreateUser', 'App\\User', 20210423183214, '{\"subject\":\"User Registration\",\"message\":\"Hanzel Ceniza has registered to the system and is currently unverified.\",\"url\":\"\\/users\"}', '2021-07-14 12:09:44', '2021-06-03 07:59:05', '2021-07-14 12:09:44'),
('ea7f3abc-5fc3-4fe6-b2cc-742d2e1b7538', 'App\\Notifications\\SubmitComputerPartReport', 'App\\User', 20210730165954, '{\"subject\":\"Report submission\",\"message\":\"The Corsair with a model number of 16gbDDR4-3200mhz has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2022-04-19 15:47:45', '2022-04-19 15:47:45'),
('eafeb908-af7b-496a-a275-a04515ec96cf', 'App\\Notifications\\BorrowComponent', 'App\\User', 20210423183214, '{\"subject\":\"Borrow Component Request\",\"message\":\"Mr\\/Ms. Test 1 has requested to borrow the NZXT H510 with a model number of H510\",\"url\":\"\\/borrowlogs\"}', '2021-07-14 12:09:44', '2021-04-23 14:36:56', '2021-07-14 12:09:44'),
('eb22d716-94cc-4993-9a99-c72d113fd309', 'App\\Notifications\\SubmitReport', 'App\\User', 20210603160024, '{\"subject\":\"Report submission\",\"message\":\"The MSI with a model number of z121 has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2021-07-14 02:25:21', '2021-07-14 02:25:21'),
('ec78774d-cee9-4fc7-a1e2-72118562b819', 'App\\Notifications\\SubmitComputerPartReport', 'App\\User', 20210423183214, '{\"subject\":\"Report submission\",\"message\":\"The Asus with a model number of Z170-A has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2022-04-19 15:45:04', '2022-04-19 15:45:04'),
('ed8018bd-d27f-43ab-92d2-ae1fe0b4a9a3', 'App\\Notifications\\BorrowRequest', 'App\\User', 20210423183214, '{\"subject\":\"Borrow Component Request\",\"message\":\"The MSI with a model number of Z570-Z that you requested to borrow has been APPROVED.\",\"url\":\"\\/borrowlogs\"}', '2021-07-14 12:25:21', '2021-07-14 12:25:05', '2021-07-14 12:25:21'),
('f13e490f-7789-4d43-8c28-dfff77467456', 'App\\Notifications\\SubmitComputerPartReport', 'App\\User', 20210730165954, '{\"subject\":\"Report submission\",\"message\":\"The Asus with a model number of z170 has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2021-11-27 04:09:08', '2021-11-27 04:09:08'),
('f1891811-aa39-425a-95fe-2e1e79c88839', 'App\\Notifications\\SubmitComputerPartReport', 'App\\User', 20210730165955, '{\"subject\":\"Report submission\",\"message\":\"The Asus with a model number of z170-A has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2022-04-28 16:34:36', '2022-04-28 16:34:36'),
('f311c0ee-4d24-4f4e-bcff-8838f762f6fb', 'App\\Notifications\\BorrowComponent', 'App\\User', 20210730165954, '{\"subject\":\"Borrow Component Request\",\"message\":\"Mr\\/Ms. HANZEL ceniza has requested to borrow the Transcend Flash Drive with a model number of 8GB-TranscendFlashdrive\",\"url\":\"\\/borrowlogs\"}', NULL, '2024-04-17 16:29:09', '2024-04-17 16:29:09'),
('f36e531f-ec66-4365-a949-fc79faa4b6ba', 'App\\Notifications\\SubmitReport', 'App\\User', 20210423183214, '{\"subject\":\"Report submission\",\"message\":\"The 1234556 with a model number of 123414515 has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2022-04-28 16:34:58', '2022-04-28 16:34:58'),
('f38f55da-82c6-40c0-97bd-0e86845c8051', 'App\\Notifications\\BorrowComponent', 'App\\User', 20210603160024, '{\"subject\":\"Borrow Component Request\",\"message\":\"Mr\\/Ms. Administrator has requested to borrow the MSI with a model number of Z570-Z\",\"url\":\"\\/borrowlogs\"}', NULL, '2021-07-17 10:57:03', '2021-07-17 10:57:03'),
('f4eb77e5-f48f-4be0-9ca8-fa162a2c2749', 'App\\Notifications\\CreateUser', 'App\\User', 20210702063214, '{\"subject\":\"User Registration\",\"message\":\"Hanzel H. Ceniza has registered to the system and is currently unverified.\",\"url\":\"\\/users\"}', NULL, '2021-07-01 22:32:53', '2021-07-01 22:32:53'),
('f5480fb2-391f-4441-9b14-0454a2b126a0', 'App\\Notifications\\BorrowComponent', 'App\\User', 20210603160024, '{\"subject\":\"Borrow Component Request\",\"message\":\"Mr\\/Ms. Administrator has requested to borrow the MSI with a model number of Z570-Z\",\"url\":\"\\/borrowlogs\"}', NULL, '2021-07-14 12:24:51', '2021-07-14 12:24:51'),
('f5e9864c-a0a4-4153-983d-07eecfcde6d4', 'App\\Notifications\\AcceptUser', 'App\\User', 20210603160025, '{\"subject\":\"New user\",\"message\":\"Hello and welcome to Asset Tracking, please go to the url to change your password.\",\"url\":\"\\/profile\"}', NULL, '2021-06-04 10:22:17', '2021-06-04 10:22:17'),
('f615a7be-8f17-44e9-8df1-7b36a85ded71', 'App\\Notifications\\SubmitReport', 'App\\User', 20210603155905, '{\"subject\":\"Report submission\",\"message\":\"The MSI with a model number of z121 has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2021-07-14 11:01:28', '2021-07-14 11:01:28'),
('f7634edb-1869-4a3f-a882-5e032090e189', 'App\\Notifications\\BorrowRequest', 'App\\User', 20210423183214, '{\"subject\":\"Borrow Component Request\",\"message\":\"The sony with a model number of alpha 7r that you requested to borrow has been APPROVED.\",\"url\":\"\\/borrowlogs\"}', '2021-07-28 04:29:40', '2021-07-28 04:29:20', '2021-07-28 04:29:40'),
('f7846c5d-e21e-416d-b1da-bbf669228700', 'App\\Notifications\\SubmitComputerPartReport', 'App\\User', 20210603155905, '{\"subject\":\"Report submission\",\"message\":\"The Asus with a model number of 1070ti-8g-Trbo has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2021-07-25 10:00:40', '2021-07-25 10:00:40'),
('f87a6d5a-862f-430f-a4fa-1ab3a00ea73f', 'App\\Notifications\\NotifyBorrower', 'App\\User', 20210423183214, '{\"subject\":\"Return borrowed component\",\"message\":\"Hello Administrator,  the sony that you borrowed must be returned on or before Jul 28 2021 12:32 PM\",\"url\":\"\\/borrowlogs\"}', '2021-07-28 04:34:48', '2021-07-28 04:33:41', '2021-07-28 04:34:48'),
('f9d8bc22-232f-47a0-a737-2f74013949d0', 'App\\Notifications\\SubmitReport', 'App\\User', 20210423132838, '{\"subject\":\"Report submission\",\"message\":\"The MSI with a model number of Z570-Z has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2021-07-14 12:22:35', '2021-07-14 12:22:35'),
('fadfba56-f8ff-48c9-bfc5-55e7f5f82495', 'App\\Notifications\\BorrowComponent', 'App\\User', 20210423183214, '{\"subject\":\"Borrow Component Request\",\"message\":\"Mr\\/Ms. Administrator has requested to borrow the sony with a model number of alpha 7r\",\"url\":\"\\/borrowlogs\"}', '2021-07-28 04:28:30', '2021-07-28 00:38:41', '2021-07-28 04:28:30'),
('fb124efa-d5f9-4017-b3f7-40035c8de147', 'App\\Notifications\\SubmitComputerPartReport', 'App\\User', 20210423183214, '{\"subject\":\"Report submission\",\"message\":\"The Asus with a model number of B550-A mATX has been reported by Jae Enolpe\",\"url\":\"\\/reports\"}', NULL, '2024-04-17 16:55:09', '2024-04-17 16:55:09'),
('fbb433e5-88c3-46c4-8b08-8eb30890705e', 'App\\Notifications\\SubmitComputerPartReport', 'App\\User', 20210423132838, '{\"subject\":\"Report submission\",\"message\":\"The Asus with a model number of Z170-A has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2021-07-14 01:25:35', '2021-07-14 01:25:35'),
('fc9f3e60-4650-4b76-af11-788053b31e28', 'App\\Notifications\\BorrowComponent', 'App\\User', 20210603155905, '{\"subject\":\"Borrow Component Request\",\"message\":\"Mr\\/Ms. Administrator has requested to borrow the MSI with a model number of Z570-Z\",\"url\":\"\\/borrowlogs\"}', NULL, '2021-07-25 09:30:14', '2021-07-25 09:30:14'),
('fdce6c90-c1b6-4079-87a6-418812658c43', 'App\\Notifications\\CreateUser', 'App\\User', 20210603155146, '{\"subject\":\"User Registration\",\"message\":\"Jae Enolpe has registered to the system and is currently unverified.\",\"url\":\"\\/users\"}', NULL, '2021-07-01 22:32:14', '2021-07-01 22:32:14');
INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('fde33de2-2ab1-408b-b7a5-91573f10d26d', 'App\\Notifications\\NotifyBorrower', 'App\\User', 20210423183214, '{\"subject\":\"Return borrowed component\",\"message\":\"Hello Administrator,  the sony that you borrowed must be returned on or before Jul 30 2021 01:12 PM\",\"url\":\"\\/borrowlogs\"}', '2021-07-28 05:14:01', '2021-07-28 05:13:42', '2021-07-28 05:14:01'),
('fe2a1937-793e-4409-b2bd-3912c0797a74', 'App\\Notifications\\SubmitComputerPartReport', 'App\\User', 20210603160024, '{\"subject\":\"Report submission\",\"message\":\"The Asus with a model number of Z170-A has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2021-07-14 01:25:36', '2021-07-14 01:25:36'),
('febc3795-2fa8-42b8-bc2f-0d0ec6412adb', 'App\\Notifications\\BorrowComponent', 'App\\User', 20210423183214, '{\"subject\":\"Borrow Component Request\",\"message\":\"Mr\\/Ms. Administrator has requested to borrow the MSI with a model number of Z570-Z\",\"url\":\"\\/borrowlogs\"}', '2021-07-14 12:25:21', '2021-07-14 12:24:50', '2021-07-14 12:25:21'),
('ff703143-196f-4a5a-b6c0-866896650f15', 'App\\Notifications\\SubmitComputerPartReport', 'App\\User', 20210603135419, '{\"subject\":\"Report submission\",\"message\":\"The Asus with a model number of Z170-A has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2021-07-14 10:03:56', '2021-07-14 10:03:56'),
('ffd230f1-4f3b-43b6-a277-5846f50c3ff5', 'App\\Notifications\\SubmitComputerPartReport', 'App\\User', 20210423183214, '{\"subject\":\"Report submission\",\"message\":\"The Asus with a model number of Z170-A has been reported by Administrator\",\"url\":\"\\/reports\"}', '2021-07-14 12:09:44', '2021-07-14 01:25:36', '2021-07-14 12:09:44');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

DROP TABLE IF EXISTS `reports`;
CREATE TABLE IF NOT EXISTS `reports` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `component_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `issue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `fix` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` tinyint(4) DEFAULT NULL,
  `submitted_by` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `report_archives`
--

DROP TABLE IF EXISTS `report_archives`;
CREATE TABLE IF NOT EXISTS `report_archives` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `component_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `issue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `fix` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` tinyint(4) DEFAULT NULL,
  `submitted_by` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20240418005831 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `report_archives`
--

INSERT INTO `report_archives` (`id`, `component_id`, `user_id`, `issue`, `fix`, `type`, `submitted_by`, `active`, `created_at`, `updated_at`) VALUES
(20240418004503, 20240418004434, 20210728093545, 'brokens', 'fixed', 1, 'Jae Enolpe', 1, '2024-04-17 16:45:03', '2024-04-17 16:45:58'),
(20240418005509, 20240418005459, 20210728093545, 'brokens', 'Fixed', 0, 'Jae Enolpe', 1, '2024-04-17 16:55:09', '2024-04-17 16:56:10'),
(20240418005830, 20240418005459, 20210728093545, 'broken', 'Not Yet Fixed', 0, 'Jae Enolpe', 1, '2024-04-17 16:58:30', '2024-04-17 16:58:50');

-- --------------------------------------------------------

--
-- Table structure for table `report_transactions`
--

DROP TABLE IF EXISTS `report_transactions`;
CREATE TABLE IF NOT EXISTS `report_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `component_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `report_id` bigint(20) UNSIGNED NOT NULL,
  `issue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `fix` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` tinyint(4) DEFAULT NULL,
  `submitted_by` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20240418005851 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `report_transactions`
--

INSERT INTO `report_transactions` (`id`, `component_id`, `user_id`, `report_id`, `issue`, `fix`, `type`, `submitted_by`, `action`, `created_at`, `updated_at`) VALUES
(20240418004503, 20240418004434, 20210728093545, 20240418004503, 'broken', 'Not Yet Fixed', 1, 'Jae Enolpe', 'STORE', '2024-04-17 16:45:03', '2024-04-17 16:45:03'),
(20240418004519, 20240418004434, 20210728093545, 20240418004503, 'brokens', 'Not Yet Fixed', NULL, 'Jae Enolpe', 'UPDATE', '2024-04-17 16:45:19', '2024-04-17 16:45:19'),
(20240418004529, 20240418004434, 20210728093545, 20240418004503, 'brokens', 'fixed', NULL, 'Jae Enolpe', 'UPDATE', '2024-04-17 16:45:29', '2024-04-17 16:45:29'),
(20240418004532, 20240418004434, 20210728093545, 20240418004503, 'brokens', 'fixed', NULL, 'Jae Enolpe', 'DELETE', '2024-04-17 16:45:32', '2024-04-17 16:45:32'),
(20240418004552, 20240418004434, 20210728093545, 20240418004503, 'brokens', 'fixed', 1, 'Jae Enolpe', 'RESTORE', '2024-04-17 16:45:52', '2024-04-17 16:45:52'),
(20240418004558, 20240418004434, 20210728093545, 20240418004503, 'brokens', 'fixed', NULL, 'Jae Enolpe', 'DELETE', '2024-04-17 16:45:58', '2024-04-17 16:45:58'),
(20240418005509, 20240418005459, 20210728093545, 20240418005509, 'broken', 'Not Yet Fixed', 0, 'Jae Enolpe', 'STORE', '2024-04-17 16:55:09', '2024-04-17 16:55:09'),
(20240418005544, 20240418005459, 20210728093545, 20240418005509, 'brokens', 'Not Yet Fixed', NULL, 'Jae Enolpe', 'UPDATE', '2024-04-17 16:55:44', '2024-04-17 16:55:44'),
(20240418005606, 20240418005459, 20210728093545, 20240418005509, 'brokens', 'Fixed', NULL, 'Jae Enolpe', 'UPDATE', '2024-04-17 16:56:06', '2024-04-17 16:56:06'),
(20240418005610, 20240418005459, 20210728093545, 20240418005509, 'brokens', 'Fixed', NULL, 'Jae Enolpe', 'DELETE', '2024-04-17 16:56:10', '2024-04-17 16:56:10'),
(20240418005830, 20240418005459, 20210728093545, 20240418005830, 'broken', 'Not Yet Fixed', 0, 'Jae Enolpe', 'STORE', '2024-04-17 16:58:30', '2024-04-17 16:58:30'),
(20240418005841, 20240418005459, 20210728093545, 20240418005830, 'broken', 'Not Yet Fixed', NULL, 'Jae Enolpe', 'UPDATE', '2024-04-17 16:58:41', '2024-04-17 16:58:41'),
(20240418005845, 20240418005459, 20210728093545, 20240418005830, 'broken', 'Not Yet Fixed', NULL, 'Jae Enolpe', 'UPDATE', '2024-04-17 16:58:45', '2024-04-17 16:58:45'),
(20240418005850, 20240418005459, 20210728093545, 20240418005830, 'broken', 'Not Yet Fixed', NULL, 'Jae Enolpe', 'DELETE', '2024-04-17 16:58:50', '2024-04-17 16:58:50');

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

DROP TABLE IF EXISTS `rooms`;
CREATE TABLE IF NOT EXISTS `rooms` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20240418004252 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`id`, `name`, `type`, `description`, `created_at`, `updated_at`) VALUES
(20240418004251, 'LB4431', 'Control Room', 'Discussions', '2024-04-17 16:42:51', '2024-04-17 16:59:30');

-- --------------------------------------------------------

--
-- Table structure for table `room_archives`
--

DROP TABLE IF EXISTS `room_archives`;
CREATE TABLE IF NOT EXISTS `room_archives` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `type` varchar(191) NOT NULL,
  `description` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20240418004252 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `room_archives`
--

INSERT INTO `room_archives` (`id`, `name`, `type`, `description`, `created_at`, `updated_at`) VALUES
(20240418004251, 'LB4431', 'Control Room', 'Discussions', '2024-04-17 16:42:51', '2024-04-17 16:59:30');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `school_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birthdate` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `course_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `department_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `borrow_status` tinyint(1) NOT NULL DEFAULT '1',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `verified` tinyint(1) NOT NULL DEFAULT '0',
  `image` varchar(191) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20210730165967 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `school_id`, `contact_number`, `birthdate`, `account_type`, `course_id`, `department_id`, `borrow_status`, `active`, `verified`, `image`, `remember_token`, `created_at`, `updated_at`) VALUES
(20210423183214, 'Administrator', 'usc.dcism@gmail.com', NULL, 'PASSWORD', '14104561', 'N/A', '2021-03-31', 'admin', '7', '20210702060452', 0, 0, 0, '20210604173559.jpg', NULL, '2021-04-23 10:32:14', '2024-04-17 16:22:04'),
(20210728093545, 'Jae Enolpe', 'jbenolpe007@gmail.com', NULL, '$2y$10$LmlxKbnd2G8zHageA6zokuGh42xY6MG1vBLm04KE6MUx7gZtdSKOi', '14101277', '09998889472', '1997-04-07', 'admin', '15', '20240418011923', 1, 1, 1, '20210728093628.jpg', NULL, '2021-07-28 01:35:45', '2024-04-17 17:41:47'),
(20210730165966, 'Lailah Enolpe', 'Lbenolpe@gmail.com', NULL, '$2y$10$QgR3SsCoXBqrxLpPUPScFeq9jMqzW24EmmFh3h3EpjE.LchLvh4jq', '14128372', '091213444123', '1998-11-07', 'student', '16', '20240418003835', 1, 1, 1, NULL, NULL, '2024-04-21 14:29:30', '2024-04-21 14:29:30');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
