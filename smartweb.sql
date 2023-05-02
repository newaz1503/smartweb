-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 01, 2023 at 03:29 PM
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
-- Database: `smartweb`
--

-- --------------------------------------------------------

--
-- Table structure for table `districts`
--

CREATE TABLE `districts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `division_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `districts`
--

INSERT INTO `districts` (`id`, `division_id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(6, 8, 'jamalpur', 'jamalpur', '2023-05-01 11:50:17', '2023-05-01 11:50:17'),
(7, 8, 'sherpur', 'sherpur', '2023-05-01 11:50:28', '2023-05-01 11:50:28'),
(8, 8, 'mymensingh', 'mymensingh', '2023-05-01 11:50:43', '2023-05-01 11:50:43'),
(9, 8, 'netrokona', 'netrokona', '2023-05-01 11:50:59', '2023-05-01 11:50:59'),
(10, 7, 'Rangpur', 'rangpur', '2023-05-01 11:51:25', '2023-05-01 11:51:25'),
(11, 7, 'Gaibanda', 'gaibanda', '2023-05-01 11:51:38', '2023-05-01 11:51:38'),
(12, 7, 'Nilphamari', 'nilphamari', '2023-05-01 11:53:18', '2023-05-01 11:53:18'),
(13, 7, 'Lalmonirhat', 'lalmonirhat', '2023-05-01 11:53:32', '2023-05-01 11:53:32'),
(14, 7, 'kurigram', 'kurigram', '2023-05-01 11:53:47', '2023-05-01 11:53:47'),
(15, 6, 'sylhet', 'sylhet', '2023-05-01 12:02:35', '2023-05-01 12:02:35'),
(16, 6, 'Habiganj', 'habiganj', '2023-05-01 12:02:56', '2023-05-01 12:02:56'),
(17, 6, 'Sunamganj', 'sunamganj', '2023-05-01 12:03:04', '2023-05-01 12:03:04'),
(18, 6, 'Maulvibazar', 'maulvibazar', '2023-05-01 12:03:33', '2023-05-01 12:03:33'),
(19, 5, 'Khulna', 'khulna', '2023-05-01 12:03:51', '2023-05-01 12:03:51'),
(20, 5, 'Bagherhat', 'bagherhat', '2023-05-01 12:03:59', '2023-05-01 12:03:59'),
(21, 5, 'Jashore', 'jashore', '2023-05-01 12:04:30', '2023-05-01 12:04:30'),
(22, 5, 'satkhira', 'satkhira', '2023-05-01 12:04:45', '2023-05-01 12:04:45'),
(23, 5, 'magura', 'magura', '2023-05-01 12:04:52', '2023-05-01 12:04:52'),
(24, 5, 'kustia', 'kustia', '2023-05-01 12:05:15', '2023-05-01 12:05:15'),
(25, 4, 'Barishal', 'barishal', '2023-05-01 12:06:29', '2023-05-01 12:06:29'),
(26, 4, 'Bhola', 'bhola', '2023-05-01 12:06:43', '2023-05-01 12:06:43'),
(27, 4, 'pirojpur', 'pirojpur', '2023-05-01 12:06:59', '2023-05-01 12:06:59'),
(28, 4, 'Barguna', 'barguna', '2023-05-01 12:07:15', '2023-05-01 12:07:15'),
(29, 3, 'Chattogram', 'chattogram', '2023-05-01 12:07:33', '2023-05-01 12:07:33'),
(30, 3, 'Cox bazar', 'cox-bazar', '2023-05-01 12:07:42', '2023-05-01 12:07:42'),
(31, 3, 'Feni', 'feni', '2023-05-01 12:08:00', '2023-05-01 12:08:00'),
(32, 3, 'Cumilla', 'cumilla', '2023-05-01 12:08:12', '2023-05-01 12:08:12'),
(33, 3, 'Chadpur', 'chadpur', '2023-05-01 12:08:26', '2023-05-01 12:08:26'),
(34, 3, 'Noakhali', 'noakhali', '2023-05-01 12:08:39', '2023-05-01 12:08:39'),
(35, 2, 'Dhaka', 'dhaka', '2023-05-01 12:08:45', '2023-05-01 12:08:45'),
(36, 2, 'Gazipur', 'gazipur', '2023-05-01 12:09:01', '2023-05-01 12:09:01'),
(37, 2, 'Faridpur', 'faridpur', '2023-05-01 12:09:17', '2023-05-01 12:09:17'),
(38, 2, 'Tangail', 'tangail', '2023-05-01 12:09:46', '2023-05-01 12:09:46'),
(39, 2, 'Manikganj', 'manikganj', '2023-05-01 12:09:58', '2023-05-01 12:09:58'),
(40, 2, 'Narayanganj', 'narayanganj', '2023-05-01 12:10:20', '2023-05-01 12:10:20'),
(41, 1, 'Rajshahi', 'rajshahi', '2023-05-01 12:10:28', '2023-05-01 12:10:28'),
(42, 1, 'Natore', 'natore', '2023-05-01 12:10:40', '2023-05-01 12:10:40'),
(43, 1, 'Naogaon', 'naogaon', '2023-05-01 12:10:55', '2023-05-01 12:10:55'),
(44, 1, 'Pabna', 'pabna', '2023-05-01 12:11:22', '2023-05-01 12:11:22'),
(45, 1, 'Bogura', 'bogura', '2023-05-01 12:11:31', '2023-05-01 12:11:31'),
(46, 1, 'Chapai', 'chapai', '2023-05-01 12:11:45', '2023-05-01 12:11:45');

-- --------------------------------------------------------

--
-- Table structure for table `divisions`
--

CREATE TABLE `divisions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `divisions`
--

INSERT INTO `divisions` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Rajshahi', 'rajshahi', '2023-05-01 09:35:06', '2023-05-01 09:35:06'),
(2, 'Dahaka', 'dahaka', '2023-05-01 09:36:51', '2023-05-01 09:36:51'),
(3, 'Chattogram', 'chattogram', '2023-05-01 09:37:35', '2023-05-01 09:37:35'),
(4, 'Barishal', 'barishal', '2023-05-01 09:37:50', '2023-05-01 09:37:50'),
(5, 'Khulna', 'khulna', '2023-05-01 09:37:56', '2023-05-01 09:37:56'),
(6, 'Sylhet', 'sylhet', '2023-05-01 09:38:40', '2023-05-01 09:38:40'),
(7, 'Rangpur', 'rangpur', '2023-05-01 09:38:48', '2023-05-01 09:38:48'),
(8, 'Mymensingh', 'mymensingh', '2023-05-01 09:39:33', '2023-05-01 09:39:33');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_05_01_143029_create_divisions_table', 2),
(6, '2023_05_01_143110_create_districts_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@gmail.com', NULL, '$2y$10$UyLqiRjfDcqRsZlLw8TgeupUZQ4QpnUE0zXVboL/JwAe7OmsRj49i', NULL, '2023-05-01 07:03:15', '2023-05-01 07:03:15'),
(2, 'demo', 'demo@gmail.com', NULL, '$2y$10$QFRVu9BJh30Gx2MQe/nK4OGSGvGnharmk4TYn7w0JAeXpXIV5a4xS', NULL, '2023-05-01 12:52:56', '2023-05-01 12:52:56');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `districts`
--
ALTER TABLE `districts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `districts_name_unique` (`name`),
  ADD KEY `districts_division_id_foreign` (`division_id`);

--
-- Indexes for table `divisions`
--
ALTER TABLE `divisions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `divisions_name_unique` (`name`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `districts`
--
ALTER TABLE `districts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `divisions`
--
ALTER TABLE `divisions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `districts`
--
ALTER TABLE `districts`
  ADD CONSTRAINT `districts_division_id_foreign` FOREIGN KEY (`division_id`) REFERENCES `divisions` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
