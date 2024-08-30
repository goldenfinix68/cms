-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 07, 2021 at 08:32 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
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

CREATE TABLE `borrows` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `component_archive_id` bigint(20) UNSIGNED DEFAULT NULL,
  `borrower_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `borrower_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `borrow_date` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `return_date` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reason` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `verified` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `borrows`
--

INSERT INTO `borrows` (`id`, `user_id`, `component_archive_id`, `borrower_name`, `borrower_type`, `status`, `borrow_date`, `return_date`, `reason`, `verified`, `created_at`, `updated_at`) VALUES
(20210423133213, 20210423133058, 20210423132952, 'Sample Student', 'student', 'APPROVED', '2021-04-24T13:32', '2021-04-24T13:32', 'tasdfasdfasdfasdfa', 0, '2021-04-23 05:32:13', '2021-04-23 05:34:58'),
(20210423134053, 20210423132838, 20210423132952, 'Sample WS', 'working student', 'APPROVED', '2021-04-24T13:40', '2021-04-24T13:40', 'testing WS borrow', 0, '2021-04-23 05:40:54', '2021-04-23 06:05:19'),
(20210423140658, 20210423133058, 20210423132952, 'Sample Student', 'student', 'APPROVED', '2021-04-24T14:06', '2021-04-24T14:06', '23tt3434tsdafasdfasdfasd', 0, '2021-04-23 06:06:58', '2021-04-23 06:07:15'),
(20210423223656, 20210423180227, 20210423132952, 'Test 1', 'student', 'APPROVED', '2021-04-24T22:36', '2021-04-24T22:36', 'testing again 10:36 pm', 0, '2021-04-23 14:36:56', '2021-04-23 14:37:26');

-- --------------------------------------------------------

--
-- Table structure for table `components`
--

CREATE TABLE `components` (
  `id` bigint(20) UNSIGNED NOT NULL,
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
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `components`
--

INSERT INTO `components` (`id`, `user_id`, `room_id`, `name`, `description`, `model_number`, `status`, `category`, `image`, `submitted_by`, `created_at`, `updated_at`) VALUES
(20210423132952, 20210423132838, 20210423132921, 'NZXT H510', 'NZXT H510', 'H510', 'BORROWED', 'I/O Devices', '20210423132952.jpg', 'Sample WS', '2021-04-23 05:29:52', '2021-04-23 14:36:56'),
(20210507143035, 20210423132838, 20210423132921, 'Gigabyte GA-A320M', 'Motherboard', 'B100', 'AVAILABLE', 'I/O Devices', '20210507143035.jpg', 'Sample WS', '2021-05-07 06:30:35', '2021-05-07 06:30:35');

-- --------------------------------------------------------

--
-- Table structure for table `component_archives`
--

CREATE TABLE `component_archives` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `room_id` bigint(20) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `submitted_by` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `component_archives`
--

INSERT INTO `component_archives` (`id`, `user_id`, `room_id`, `name`, `description`, `image`, `model_number`, `status`, `category`, `submitted_by`, `active`, `created_at`, `updated_at`) VALUES
(20210423132952, 20210423132838, 20210423132921, 'NZXT H510', 'NZXT H510', '20210423132952.jpg', 'H510', 'AVAILABLE', 'I/O Devices', 'Sample WS', 0, '2021-04-23 05:29:52', '2021-04-23 05:40:27'),
(20210507143035, 20210423132838, 20210423132921, 'Gigabyte GA-A320M', 'Motherboard', '20210507143035.jpg', 'B100', 'AVAILABLE', 'I/O Devices', 'Sample WS', 0, '2021-05-07 06:30:35', '2021-05-07 06:30:35');

-- --------------------------------------------------------

--
-- Table structure for table `component_transactions`
--

CREATE TABLE `component_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
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
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `component_transactions`
--

INSERT INTO `component_transactions` (`id`, `user_id`, `room_id`, `name`, `description`, `model_number`, `status`, `category`, `image`, `submitted_by`, `action`, `created_at`, `updated_at`) VALUES
(20210423132952, 20210423132838, 20210423132921, 'NZXT H510', 'PC Case', 'H510', 'AVAILABLE', 'I/O Devices', '20210423132952.jpg', 'Sample WS', 'STORE', '2021-04-23 05:29:52', '2021-04-23 05:29:52'),
(20210423134027, 20210423132838, 20210423132921, 'NZXT H510', 'NZXT H510', 'H510', 'AVAILABLE', 'I/O Devices', '20210423132952.jpg', 'Sample WS', 'UPDATE', '2021-04-23 05:40:27', '2021-04-23 05:40:27'),
(20210423140620, 20210423132838, 20210423132921, 'NZXT H510', 'NZXT H510', 'H510', 'AVAILABLE', 'I/O Devices', '20210423132952.jpg', 'Sample WS', 'UPDATE', '2021-04-23 06:06:20', '2021-04-23 06:06:20'),
(20210423143547, 20210423132838, 20210423132921, 'NZXT H510', 'NZXT H510', 'H510', 'AVAILABLE', 'I/O Devices', '20210423132952.jpg', 'Sample WS', 'UPDATE', '2021-04-23 06:35:47', '2021-04-23 06:35:47'),
(20210423175344, 20210423132838, 20210423132921, 'NZXT H510', 'NZXT H510', 'H510', 'AVAILABLE', 'I/O Devices', '20210423132952.jpg', 'Sample WS', 'UPDATE', '2021-04-23 09:53:44', '2021-04-23 09:53:44'),
(20210423175919, 20210423132838, 20210423132921, 'NZXT H510', 'NZXT H510', 'H510', 'AVAILABLE', 'I/O Devices', '20210423132952.jpg', 'Sample WS', 'UPDATE', '2021-04-23 09:59:19', '2021-04-23 09:59:19'),
(20210423183231, 20210423132838, 20210423132921, 'NZXT H510', 'NZXT H510', 'H510', 'AVAILABLE', 'I/O Devices', '20210423132952.jpg', 'Sample WS', 'UPDATE', '2021-04-23 10:32:31', '2021-04-23 10:32:31'),
(20210423223548, 20210423132838, 20210423132921, 'NZXT H510', 'NZXT H510', 'H510', 'AVAILABLE', 'I/O Devices', '20210423132952.jpg', 'Sample WS', 'UPDATE', '2021-04-23 14:35:48', '2021-04-23 14:35:48'),
(20210507143036, 20210423132838, 20210423132921, 'Gigabyte GA-A320M', 'Motherboard', 'B100', 'AVAILABLE', 'I/O Devices', '20210507143035.jpg', 'Sample WS', 'STORE', '2021-05-07 06:30:36', '2021-05-07 06:30:36');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(12, '2021_04_17_195111_create_notifications_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('02751bef-baf9-49d3-a59b-dec7878e9704', 'App\\Notifications\\SubmitReport', 'App\\User', 20210423132640, '{\"subject\":\"Report submission\",\"message\":\"The NZXT H510 with a model number of H510 has been reported by Sample WS\",\"url\":\"\\/reports\"}', '2021-04-23 05:33:15', '2021-04-23 05:30:00', '2021-04-23 05:33:15'),
('0c544ff5-d7ea-4f32-8d05-51267780c789', 'App\\Notifications\\BorrowComponent', 'App\\User', 20210423132640, '{\"subject\":\"Borrow Component Request\",\"message\":\"Mr\\/Ms. Sample Student has requested to borrow the NZXT H510 with a model number of H510\",\"url\":\"\\/borrowlogs\"}', '2021-04-23 06:17:57', '2021-04-23 06:07:57', '2021-04-23 06:17:57'),
('0d6ff6f2-d7ca-4763-b4a9-2b1bcd28c163', 'App\\Notifications\\BorrowComponent', 'App\\User', 20210423132640, '{\"subject\":\"Borrow Component Request\",\"message\":\"Mr\\/Ms. Sample WS has requested to borrow the NZXT H510 with a model number of H510\",\"url\":\"\\/borrowlogs\"}', '2021-04-23 06:06:12', '2021-04-23 05:42:09', '2021-04-23 06:06:12'),
('1584abba-01a8-4c27-a9e3-3ae93b819fac', 'App\\Notifications\\CreateUser', 'App\\User', 20210423132640, '{\"subject\":\"User Registration\",\"message\":\"Sample WS has registered to the system and is currently unverified.\",\"url\":\"\\/users\"}', '2021-04-23 05:28:54', '2021-04-23 05:28:38', '2021-04-23 05:28:54'),
('183fb2d2-25f8-49bd-9e5b-d4a7c9d1873a', 'App\\Notifications\\SubmitReport', 'App\\User', 20210423183214, '{\"subject\":\"Report submission\",\"message\":\"The NZXT H510 with a model number of H510 has been reported by Sample WS\",\"url\":\"\\/reports\"}', NULL, '2021-04-23 23:27:18', '2021-04-23 23:27:18'),
('1cbfb706-29d9-4dd7-a9f2-849726dff457', 'App\\Notifications\\AcceptUser', 'App\\User', 20210423132838, '{\"subject\":\"New user\",\"message\":\"Hello and welcome to Asset Tracking, please go to the url to change your password.\",\"url\":\"\\/profile\"}', '2021-04-23 05:40:06', '2021-04-23 05:37:02', '2021-04-23 05:40:06'),
('2583d09f-1329-4f8e-8b32-59a40907a63d', 'App\\Notifications\\SubmitReport', 'App\\User', 20210423132838, '{\"subject\":\"Report submission\",\"message\":\"The NZXT H510 with a model number of H510 has been reported by Sample WS\",\"url\":\"\\/reports\"}', '2021-04-23 05:40:06', '2021-04-23 05:30:00', '2021-04-23 05:40:06'),
('3b238bb7-9b2a-4b31-9590-215da87a60d1', 'App\\Notifications\\NotifyBorrower', 'App\\User', 20210423133058, '{\"subject\":\"Return borrowed component\",\"message\":\"Hello Sample Student,  the NZXT H510 that you borrowed must be returned on or before Apr 24 2021 02:06 PM\",\"url\":\"\\/borrowlogs\"}', NULL, '2021-04-23 14:38:02', '2021-04-23 14:38:02'),
('3ca80b9c-036e-42d5-9617-55069f6d6f91', 'App\\Notifications\\NotifyBorrower', 'App\\User', 20210423132838, '{\"subject\":\"Return borrowed component\",\"message\":\"Hello Sample WS,  the NZXT H510 that you borrowed must be returned on or before Apr 24 2021 01:40 PM\",\"url\":\"\\/borrowlogs\"}', NULL, '2021-04-23 14:38:02', '2021-04-23 14:38:02'),
('46dceb76-4ab6-4f02-9e99-3eedc436ad42', 'App\\Notifications\\SubmitReport', 'App\\User', 20210423132838, '{\"subject\":\"Report submission\",\"message\":\"The Gigabyte GA-A320M with a model number of B100 has been reported by Sample WS\",\"url\":\"\\/reports\"}', NULL, '2021-05-07 06:30:57', '2021-05-07 06:30:57'),
('5a5dd4bd-de29-466f-95bd-fb38da32d352', 'App\\Notifications\\SubmitReport', 'App\\User', 20210423132640, '{\"subject\":\"Report submission\",\"message\":\"The NZXT H510 with a model number of H510 has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2021-04-23 09:59:29', '2021-04-23 09:59:29'),
('5bb86353-bd28-49a7-acb2-470ad5ab7ab2', 'App\\Notifications\\NotifyBorrower', 'App\\User', 20210423180227, '{\"subject\":\"Return borrowed component\",\"message\":\"Hello Test 1,  the NZXT H510 that you borrowed must be returned on or before Apr 24 2021 10:36 PM\",\"url\":\"\\/borrowlogs\"}', NULL, '2021-04-23 14:38:02', '2021-04-23 14:38:02'),
('63f23dc6-f787-4b00-a9bf-ca11ec3d7a8c', 'App\\Notifications\\AcceptUser', 'App\\User', 20210423133058, '{\"subject\":\"New user\",\"message\":\"Hello and welcome to Asset Tracking, please go to the url to change your password.\",\"url\":\"\\/profile\"}', '2021-04-23 05:38:07', '2021-04-23 05:37:05', '2021-04-23 05:38:07'),
('6bb5b51b-259a-4796-b852-c2e19a6f68f5', 'App\\Notifications\\BorrowRequest', 'App\\User', 20210423132838, '{\"subject\":\"Borrow Component Request\",\"message\":\"The NZXT H510 with a model number of H510 that you requested to borrow has been APPROVED.\",\"url\":\"\\/borrowlogs\"}', NULL, '2021-04-23 06:07:56', '2021-04-23 06:07:56'),
('6e1bc9da-f0f1-434e-9cc6-a68962533451', 'App\\Notifications\\BorrowRequest', 'App\\User', 20210423180227, '{\"subject\":\"Borrow Component Request\",\"message\":\"The NZXT H510 with a model number of H510 that you requested to borrow has been APPROVED.\",\"url\":\"\\/borrowlogs\"}', NULL, '2021-04-23 14:37:26', '2021-04-23 14:37:26'),
('712b0ae9-da54-4725-8a08-644ddf7b2f1d', 'App\\Notifications\\BorrowComponent', 'App\\User', 20210423132640, '{\"subject\":\"Borrow Component Request\",\"message\":\"Mr\\/Ms. Sample Student has requested to borrow the NZXT H510 with a model number of H510\",\"url\":\"\\/borrowlogs\"}', '2021-04-23 05:39:36', '2021-04-23 05:37:26', '2021-04-23 05:39:36'),
('83b1b671-947f-4e78-9022-9ccc150ab8c3', 'App\\Notifications\\CreateUser', 'App\\User', 20210423132640, '{\"subject\":\"User Registration\",\"message\":\"Sample Student has registered to the system and is currently unverified.\",\"url\":\"\\/users\"}', '2021-04-23 05:33:15', '2021-04-23 05:30:58', '2021-04-23 05:33:15'),
('994543eb-a581-48a1-a9d1-6a8f6333825c', 'App\\Notifications\\AcceptUser', 'App\\User', 20210423180227, '{\"subject\":\"New user\",\"message\":\"Hello and welcome to Asset Tracking, please go to the url to change your password.\",\"url\":\"\\/profile\"}', NULL, '2021-04-23 14:36:24', '2021-04-23 14:36:24'),
('a2266801-55ed-4bbe-85d8-2d92414591c2', 'App\\Notifications\\SubmitReport', 'App\\User', 20210423183214, '{\"subject\":\"Report submission\",\"message\":\"The Gigabyte GA-A320M with a model number of B100 has been reported by Sample WS\",\"url\":\"\\/reports\"}', NULL, '2021-05-07 06:30:57', '2021-05-07 06:30:57'),
('a70c29aa-2c22-4a35-b231-756b65740e85', 'App\\Notifications\\SubmitReport', 'App\\User', 20210423132838, '{\"subject\":\"Report submission\",\"message\":\"The NZXT H510 with a model number of H510 has been reported by Administrator\",\"url\":\"\\/reports\"}', NULL, '2021-04-23 09:59:29', '2021-04-23 09:59:29'),
('b22e7828-ee5f-4d68-aaf6-7761ab32f7d2', 'App\\Notifications\\BorrowRequest', 'App\\User', 20210423133058, '{\"subject\":\"Borrow Component Request\",\"message\":\"The NZXT H510 with a model number of H510 that you requested to borrow has been APPROVED.\",\"url\":\"\\/borrowlogs\"}', '2021-04-23 09:43:31', '2021-04-23 06:07:59', '2021-04-23 09:43:31'),
('c90c6884-6fcb-4f4e-8be3-fa6640ee9eb7', 'App\\Notifications\\BorrowRequest', 'App\\User', 20210423133058, '{\"subject\":\"Borrow Component Request\",\"message\":\"The NZXT H510 with a model number of H510 that you requested to borrow has been APPROVED.\",\"url\":\"\\/borrowlogs\"}', '2021-04-23 05:38:07', '2021-04-23 05:37:30', '2021-04-23 05:38:07'),
('c93fb26a-c5d9-4c3b-bcfe-73bffcf8d178', 'App\\Notifications\\NotifyBorrower', 'App\\User', 20210423133058, '{\"subject\":\"Return borrowed component\",\"message\":\"Hello Sample Student,  the NZXT H510 that you borrowed must be returned on or before Apr 24 2021 01:32 PM\",\"url\":\"\\/borrowlogs\"}', NULL, '2021-04-23 14:38:02', '2021-04-23 14:38:02'),
('da5c673f-38b1-4430-8888-8c115b1f4601', 'App\\Notifications\\SubmitReport', 'App\\User', 20210423132838, '{\"subject\":\"Report submission\",\"message\":\"The NZXT H510 with a model number of H510 has been reported by Sample WS\",\"url\":\"\\/reports\"}', NULL, '2021-04-23 23:27:18', '2021-04-23 23:27:18'),
('dee70a75-3907-4b3b-beaa-fc3da83d81a2', 'App\\Notifications\\CreateUser', 'App\\User', 20210423132640, '{\"subject\":\"User Registration\",\"message\":\"Test 1 has registered to the system and is currently unverified.\",\"url\":\"\\/users\"}', NULL, '2021-04-23 10:02:27', '2021-04-23 10:02:27'),
('eafeb908-af7b-496a-a275-a04515ec96cf', 'App\\Notifications\\BorrowComponent', 'App\\User', 20210423183214, '{\"subject\":\"Borrow Component Request\",\"message\":\"Mr\\/Ms. Test 1 has requested to borrow the NZXT H510 with a model number of H510\",\"url\":\"\\/borrowlogs\"}', NULL, '2021-04-23 14:36:56', '2021-04-23 14:36:56');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `component_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `issue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `submitted_by` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reports`
--

INSERT INTO `reports` (`id`, `component_id`, `user_id`, `issue`, `submitted_by`, `created_at`, `updated_at`) VALUES
(20210423133000, 20210423132952, 20210423132838, 'broken glass', 'Sample WS', '2021-04-23 05:30:00', '2021-04-23 05:30:00'),
(20210423175929, 20210423132952, 20210423132640, 'test', 'Administrator', '2021-04-23 09:59:29', '2021-04-23 09:59:29'),
(20210424072718, 20210423132952, 20210423132838, 'testing today', 'Sample WS', '2021-04-23 23:27:18', '2021-04-23 23:27:18'),
(20210507143057, 20210507143035, 20210423132838, 'broken cmos', 'Sample WS', '2021-05-07 06:30:57', '2021-05-07 06:30:57');

-- --------------------------------------------------------

--
-- Table structure for table `report_archives`
--

CREATE TABLE `report_archives` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `component_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `issue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `submitted_by` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `report_archives`
--

INSERT INTO `report_archives` (`id`, `component_id`, `user_id`, `issue`, `submitted_by`, `active`, `created_at`, `updated_at`) VALUES
(20210423133000, 20210423132952, 20210423132838, 'broken glass', 'Sample WS', 0, '2021-04-23 05:30:00', '2021-04-23 05:30:00'),
(20210423175929, 20210423132952, 20210423132640, 'test', 'Administrator', 0, '2021-04-23 09:59:29', '2021-04-23 09:59:29'),
(20210424072718, 20210423132952, 20210423132838, 'testing today', 'Sample WS', 0, '2021-04-23 23:27:18', '2021-04-23 23:27:18'),
(20210507143057, 20210507143035, 20210423132838, 'broken cmos', 'Sample WS', 0, '2021-05-07 06:30:57', '2021-05-07 06:30:57');

-- --------------------------------------------------------

--
-- Table structure for table `report_transactions`
--

CREATE TABLE `report_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `component_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `report_id` bigint(20) UNSIGNED NOT NULL,
  `issue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `submitted_by` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `report_transactions`
--

INSERT INTO `report_transactions` (`id`, `component_id`, `user_id`, `report_id`, `issue`, `submitted_by`, `action`, `created_at`, `updated_at`) VALUES
(20210423133000, 20210423132952, 20210423132838, 20210423133000, 'broken glass', 'Sample WS', 'STORE', '2021-04-23 05:30:00', '2021-04-23 05:30:00'),
(20210423175929, 20210423132952, 20210423132640, 20210423175929, 'test', 'Administrator', 'STORE', '2021-04-23 09:59:29', '2021-04-23 09:59:29'),
(20210424072718, 20210423132952, 20210423132838, 20210424072718, 'testing today', 'Sample WS', 'STORE', '2021-04-23 23:27:18', '2021-04-23 23:27:18'),
(20210507143057, 20210507143035, 20210423132838, 20210507143057, 'broken cmos', 'Sample WS', 'STORE', '2021-05-07 06:30:57', '2021-05-07 06:30:57');

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`id`, `name`, `type`, `description`, `created_at`, `updated_at`) VALUES
(20210423132921, 'LB466', 'Classroom', 'Classroom', '2021-04-23 05:29:21', '2021-04-23 05:29:21');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `school_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birthdate` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `course` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `borrow_status` tinyint(1) NOT NULL DEFAULT 1,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `verified` tinyint(1) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `school_id`, `contact_number`, `birthdate`, `account_type`, `course`, `borrow_status`, `active`, `verified`, `remember_token`, `created_at`, `updated_at`) VALUES
(20210423132838, 'Sample WS', 'mhiehiecon1@gmail.com', NULL, '$2y$10$rk1wprsU0FlHjQsQ3lnHmOa0ZYJbkBjFWQHzHdHLMNTQ6k.sOLWiu', '14104560', '09772577173', '2021-04-04', 'working student', 'BSCS', 1, 1, 1, NULL, '2021-04-23 05:28:38', '2021-04-23 05:28:50'),
(20210423133058, 'Sample Student', 'assettracking13@gmail.com', NULL, '$2y$10$TxdYu0RmqlfQZiTfAVJFQeOY8gVVrYFUoqtmW3k/N80KKjuTmj7Hy', '14132425', '09772577145', '2021-04-19', 'student', 'BSICT', 1, 1, 1, NULL, '2021-04-23 05:30:58', '2021-04-23 05:31:52'),
(20210423180227, 'Test 1', 'atmr@gmail.com', NULL, '$2y$10$pkLXCq5q/1FOP1pakaocw.G.KpkO6NxwNLKraKrSARhO1yCyy4YNG', '14103326', '09772577173', '2021-04-13', 'student', 'BSICT', 1, 1, 1, NULL, '2021-04-23 10:02:27', '2021-04-23 14:36:24'),
(20210423183214, 'Administrator', 'usc.dcism@gmail.com', NULL, '$2y$10$ZIjZZURReV/t0RpR5as8c.8rCHPdcGCFcAdK4vdQyNLYLuHFJdtRC', '14104561', 'N/A', '2021-03-31', 'admin', 'BSICT', 1, 1, 1, NULL, '2021-04-23 10:32:14', '2021-04-23 10:32:14');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `borrows`
--
ALTER TABLE `borrows`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `components`
--
ALTER TABLE `components`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `component_archives`
--
ALTER TABLE `component_archives`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `component_transactions`
--
ALTER TABLE `component_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `report_archives`
--
ALTER TABLE `report_archives`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `report_transactions`
--
ALTER TABLE `report_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `borrows`
--
ALTER TABLE `borrows`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20210423223657;

--
-- AUTO_INCREMENT for table `components`
--
ALTER TABLE `components`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20210507143036;

--
-- AUTO_INCREMENT for table `component_archives`
--
ALTER TABLE `component_archives`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20210507143036;

--
-- AUTO_INCREMENT for table `component_transactions`
--
ALTER TABLE `component_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20210507143037;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=501;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20210507143058;

--
-- AUTO_INCREMENT for table `report_archives`
--
ALTER TABLE `report_archives`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20210507143058;

--
-- AUTO_INCREMENT for table `report_transactions`
--
ALTER TABLE `report_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20210507143058;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20210423132922;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20210423183215;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
