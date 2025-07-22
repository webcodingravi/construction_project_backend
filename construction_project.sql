-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 22, 2025 at 09:35 AM
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
-- Database: `construction_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE `articles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `author` varchar(255) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `articles`
--

INSERT INTO `articles` (`id`, `title`, `slug`, `author`, `content`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Blog title', 'blog-title', 'Ravi kumar', '<p>hi Blog title<br></p>', '17525984981.jpg', 1, '2025-07-14 06:22:31', '2025-07-15 11:25:00'),
(3, 'dummy for', 'dummy-for', 'Ravi kumar', '<p>dummy for</p>', '17525978593.jpg', 1, '2025-07-15 11:09:22', '2025-07-15 11:14:21');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `job_title` varchar(255) NOT NULL,
  `linkedin_url` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`id`, `name`, `image`, `job_title`, `linkedin_url`, `status`, `created_at`, `updated_at`) VALUES
(2, 'karan kumar', '17525801512.jpg', 'CEO', 'www.linkden.in', 1, '2025-07-15 06:14:42', '2025-07-15 06:19:11'),
(3, 'Pankaj', NULL, 'CEO', 'www.linkden.in', 1, '2025-07-21 06:03:38', '2025-07-21 06:03:38');

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
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_07_04_104232_create_personal_access_tokens_table', 2),
(5, '2025_07_11_095522_create_services_table', 3),
(6, '2025_07_11_103611_create_temp_images_table', 4),
(8, '2025_07_13_072321_create_projects_table', 5),
(9, '2025_07_13_120319_create_articles_table', 6),
(11, '2025_07_14_145424_create_testimonials_table', 7),
(12, '2025_07_15_091716_create_members_table', 8),
(15, '2025_07_18_165411_update_users_table', 9);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_reset_tokens`
--

INSERT INTO `password_reset_tokens` (`email`, `token`, `created_at`) VALUES
('ravi@gmail.com', '$2y$12$Le3zBq6wtS1DYC8D7via2.NtIVQXNHZCjXIOdu2Bhhhe1fQSiPxSi', '2025-07-21 12:12:48');

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

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(3, 'App\\Models\\User', 2, 'token', 'b1d009ffb768752b81475db082621e0c35a4781c3bacf5b31fe6616e480e7d9c', '[\"*\"]', NULL, NULL, '2025-07-04 08:17:48', '2025-07-04 08:17:48'),
(4, 'App\\Models\\User', 2, 'token', '5a21f3b5e3a05987c9d815009b99ded28f9e5613056bc06bbaf5dca665e54460', '[\"*\"]', NULL, NULL, '2025-07-04 08:30:21', '2025-07-04 08:30:21'),
(5, 'App\\Models\\User', 2, 'token', '7adde9df53748120ee8b91aae02b660da67f038470be154f70b5ed101407c20a', '[\"*\"]', NULL, NULL, '2025-07-04 08:30:23', '2025-07-04 08:30:23'),
(6, 'App\\Models\\User', 2, 'token', '25e12338c00185ada8fa4753555a0bb0fb37f205526d7fbb49bc5f31079f1942', '[\"*\"]', NULL, NULL, '2025-07-04 08:45:28', '2025-07-04 08:45:28'),
(7, 'App\\Models\\User', 2, 'token', 'b51db0b1919e8a4ddd43048fe32ac04989f36799eea015f5d14c806813cd1111', '[\"*\"]', NULL, NULL, '2025-07-04 08:46:06', '2025-07-04 08:46:06'),
(8, 'App\\Models\\User', 2, 'token', '09f9650cf95165a847840f3f8e67444351bd7e3a422ba7bbba0fb1ebcc2aaaa4', '[\"*\"]', NULL, NULL, '2025-07-04 08:50:53', '2025-07-04 08:50:53'),
(9, 'App\\Models\\User', 2, 'token', '619ed4261a4bae02b2ac5ed000b1a7a57f656d6228cede67070d565911062e68', '[\"*\"]', NULL, NULL, '2025-07-04 08:56:12', '2025-07-04 08:56:12'),
(10, 'App\\Models\\User', 2, 'token', '7a71f3582f095387c20e20e6aac7343cec421fc655db62b1ac4975c05e8644c4', '[\"*\"]', NULL, NULL, '2025-07-04 08:56:28', '2025-07-04 08:56:28'),
(11, 'App\\Models\\User', 2, 'token', 'bcc35e2deca3d77d8c261653b35689fe9f750b033c61b3b5df0c5b1b5ce653bb', '[\"*\"]', NULL, NULL, '2025-07-04 08:57:44', '2025-07-04 08:57:44'),
(12, 'App\\Models\\User', 2, 'token', '982671d3658f49cf06ef27adac79f0fd70ecdacbd4201e1b772878c0af93fc87', '[\"*\"]', NULL, NULL, '2025-07-04 08:59:17', '2025-07-04 08:59:17'),
(13, 'App\\Models\\User', 2, 'token', '7153282c38fb0292d99e4ca09ec4fa975b3bb6262239c940b074e3c64ff55297', '[\"*\"]', NULL, NULL, '2025-07-05 07:26:11', '2025-07-05 07:26:11'),
(14, 'App\\Models\\User', 2, 'token', 'a56f2fa62f3b52e8a91bc89ffde35615c20f5a24491e4a1253a5459bcfe7805d', '[\"*\"]', NULL, NULL, '2025-07-05 07:26:22', '2025-07-05 07:26:22'),
(15, 'App\\Models\\User', 2, 'token', 'ff832deee129537cf0a857283ea2087a6c344b9a01d3adacc867bb52ce431801', '[\"*\"]', NULL, NULL, '2025-07-05 07:28:03', '2025-07-05 07:28:03'),
(16, 'App\\Models\\User', 2, 'token', '84cc1fd693df35b02821d23bdef40b138754053b1eb386d770a4ce0ffa51e6a8', '[\"*\"]', NULL, NULL, '2025-07-05 07:28:41', '2025-07-05 07:28:41'),
(17, 'App\\Models\\User', 2, 'token', '419e2b5d9e0a070fb2f5cf414e29a00cc64936d8f7519a7e8efb8f4cd8e9bf63', '[\"*\"]', NULL, NULL, '2025-07-05 07:31:36', '2025-07-05 07:31:36'),
(18, 'App\\Models\\User', 2, 'token', '6f2828570ec39537131b63065876d9c767780975f918e42ebda18451a08c3c70', '[\"*\"]', NULL, NULL, '2025-07-05 07:32:47', '2025-07-05 07:32:47'),
(19, 'App\\Models\\User', 2, 'token', '8d20778deb7b08410b5cc453988a17b07c140e2b724db1ea4f0a65e111ce6f03', '[\"*\"]', NULL, NULL, '2025-07-05 07:33:10', '2025-07-05 07:33:10'),
(20, 'App\\Models\\User', 2, 'token', '7f3ccc7d61f444164c8d0c77fd260cfd224a0d5c5f698cd0ceb26510950c25e5', '[\"*\"]', NULL, NULL, '2025-07-05 07:54:28', '2025-07-05 07:54:28'),
(21, 'App\\Models\\User', 2, 'token', '4adbede53aee1ace1019d60628eb70c06f7cbf4ca807193a666276c3e1525839', '[\"*\"]', NULL, NULL, '2025-07-05 07:54:56', '2025-07-05 07:54:56'),
(22, 'App\\Models\\User', 2, 'token', 'd523ea58dcfe58b909bb2dd25babba3dc14c4c0c26f82a96093a1c1637403b6c', '[\"*\"]', NULL, NULL, '2025-07-05 07:55:03', '2025-07-05 07:55:03'),
(23, 'App\\Models\\User', 2, 'token', '962294231c2448056f178c368f2058e613a5b5f5168bd2d6f4bfdd5da0e218ff', '[\"*\"]', NULL, NULL, '2025-07-05 07:55:16', '2025-07-05 07:55:16'),
(24, 'App\\Models\\User', 2, 'token', '82ec43eb5a644bf80e22c4f3bab808afb8a90bde14f43adf84188275db8f8894', '[\"*\"]', NULL, NULL, '2025-07-05 07:55:28', '2025-07-05 07:55:28'),
(25, 'App\\Models\\User', 2, 'token', '5e9e7f8c798f072b4310171486f86e95452c990335a4d22dc0c001574b620cc3', '[\"*\"]', NULL, NULL, '2025-07-05 07:55:39', '2025-07-05 07:55:39'),
(26, 'App\\Models\\User', 2, 'token', '553776a28569285b5bf98dbd02eb0731811227df7aa349072b7931daa1118978', '[\"*\"]', NULL, NULL, '2025-07-05 07:55:49', '2025-07-05 07:55:49'),
(27, 'App\\Models\\User', 2, 'token', '4d7d429b14ed88f79b016c908ce4f57c222081cf3a749fadf80a8dc31e0db4c6', '[\"*\"]', NULL, NULL, '2025-07-05 07:56:02', '2025-07-05 07:56:02'),
(28, 'App\\Models\\User', 2, 'token', 'e741e2736bb5226aeb63edc0c24bcf11b2088a1f78be958f2f5d9a15ed6b3c8f', '[\"*\"]', NULL, NULL, '2025-07-05 07:57:15', '2025-07-05 07:57:15'),
(29, 'App\\Models\\User', 2, 'token', '8e4d5e84583605cdc4a9e7a546a4e2525855e2d74cdafb179c0e31e764d241ed', '[\"*\"]', NULL, NULL, '2025-07-05 07:57:30', '2025-07-05 07:57:30'),
(30, 'App\\Models\\User', 2, 'token', '7ba95b1acfc8772ec2ffca9052129651b6818deb15c3b6ee6632fd21edbcb600', '[\"*\"]', NULL, NULL, '2025-07-05 07:59:15', '2025-07-05 07:59:15'),
(31, 'App\\Models\\User', 2, 'token', '40128db827b82ab3c5d68229d851fc6a34878b9bd5547a21b5eccfdf05132323', '[\"*\"]', NULL, NULL, '2025-07-05 07:59:53', '2025-07-05 07:59:53'),
(32, 'App\\Models\\User', 2, 'token', 'd212f1b481fc235f9c2abf6e0b61b1459e5e581a218fa291d36d16fa4197b29f', '[\"*\"]', NULL, NULL, '2025-07-05 08:00:04', '2025-07-05 08:00:04'),
(33, 'App\\Models\\User', 2, 'token', 'bfc231dafc1e069aab46c6232d79cc076084f6c5fd78cea7e8513d8e188c48d6', '[\"*\"]', NULL, NULL, '2025-07-05 08:05:08', '2025-07-05 08:05:08'),
(34, 'App\\Models\\User', 2, 'token', '801048344c388feef21db7428c9c6cb771b285a151efe1ade3fcc96d5a08e270', '[\"*\"]', NULL, NULL, '2025-07-05 08:05:19', '2025-07-05 08:05:19'),
(35, 'App\\Models\\User', 2, 'token', 'd3e3707f823c3f1ccc188fc17a50ba72b68bd7fcec43028e47b0a33bf50aad66', '[\"*\"]', NULL, NULL, '2025-07-05 08:06:18', '2025-07-05 08:06:18'),
(36, 'App\\Models\\User', 2, 'token', '6379071658773e51e921ad6410a3410e0dc1809e9c03dc66c9977a382cb7f46a', '[\"*\"]', NULL, NULL, '2025-07-05 08:06:30', '2025-07-05 08:06:30'),
(37, 'App\\Models\\User', 2, 'token', '5ed17e94ad818a4c708dc6353a917a8513436e5c444909f4b17e32fa8997a96e', '[\"*\"]', NULL, NULL, '2025-07-05 08:08:49', '2025-07-05 08:08:49'),
(38, 'App\\Models\\User', 2, 'token', '9922ae5be7f18bd045d0a2a04e36eb198d4722e50cd8aa3192ea95c61e21af92', '[\"*\"]', NULL, NULL, '2025-07-05 08:08:59', '2025-07-05 08:08:59'),
(39, 'App\\Models\\User', 2, 'token', '868ea61d4da998789d79a0aad0544ac3f6b5b479b2ba98fd682c44a52a469fd4', '[\"*\"]', NULL, NULL, '2025-07-05 08:09:14', '2025-07-05 08:09:14'),
(40, 'App\\Models\\User', 2, 'token', 'aa35a65215c613dd3fecfae37f3fab0f3e94cd7b91a5567a3aac34910c13be37', '[\"*\"]', NULL, NULL, '2025-07-05 08:10:05', '2025-07-05 08:10:05'),
(41, 'App\\Models\\User', 2, 'token', 'e9f40597f2e15a289a86a54b15ec7f00c678801f535ddf7f94fcd86cd24fb7ea', '[\"*\"]', NULL, NULL, '2025-07-05 08:10:19', '2025-07-05 08:10:19'),
(42, 'App\\Models\\User', 2, 'token', 'ee4bb790ad49b31c6b22a0b2fed123b705cc66cd66862507df5604ace28089b5', '[\"*\"]', NULL, NULL, '2025-07-05 08:10:33', '2025-07-05 08:10:33'),
(43, 'App\\Models\\User', 2, 'token', '7da1f0396452ef47a189b6e9bcef07457cb1e498f7c04b054098c29114ae14c6', '[\"*\"]', NULL, NULL, '2025-07-05 08:10:47', '2025-07-05 08:10:47'),
(44, 'App\\Models\\User', 2, 'token', '6249915fcfa0928a51cee5c3bcee663d53c3e6ee5278d55a782b1b8c12f032df', '[\"*\"]', NULL, NULL, '2025-07-05 08:11:06', '2025-07-05 08:11:06'),
(45, 'App\\Models\\User', 2, 'token', '4e94aa584e5e5093279c9d72683956901ea198dce634c73b9ded079c366e7895', '[\"*\"]', NULL, NULL, '2025-07-05 08:15:42', '2025-07-05 08:15:42'),
(46, 'App\\Models\\User', 2, 'token', '09d6165c67b3e949b86dedcefdea2f3e9fd2bd884c4a90a8e562eb06b8e84d72', '[\"*\"]', NULL, NULL, '2025-07-05 08:16:04', '2025-07-05 08:16:04'),
(47, 'App\\Models\\User', 2, 'token', 'c3e5a61e83defd14bec110b87cf122b23ab0492597578ab88f5b9d116bbc7800', '[\"*\"]', NULL, NULL, '2025-07-05 08:16:13', '2025-07-05 08:16:13'),
(48, 'App\\Models\\User', 2, 'token', 'd970792c3312ba4c2b55a0561cb5f9dde042106c67eb25f5a895e1a7cae433bc', '[\"*\"]', NULL, NULL, '2025-07-05 08:16:22', '2025-07-05 08:16:22'),
(49, 'App\\Models\\User', 2, 'token', '0b09478885e201ea253c9d724056728fdf362dc31326a5630bcffcd661c11a80', '[\"*\"]', NULL, NULL, '2025-07-05 08:16:38', '2025-07-05 08:16:38'),
(50, 'App\\Models\\User', 2, 'token', '15f6fd0565a0268850ff61091cea0ca750fee06ed34e688cd81c93544ae75f95', '[\"*\"]', NULL, NULL, '2025-07-05 08:20:33', '2025-07-05 08:20:33'),
(51, 'App\\Models\\User', 2, 'token', '2907a75ae0c25d6fd2837de45096d7b4b76d678d0b79400acedea474ccb3b252', '[\"*\"]', NULL, NULL, '2025-07-05 08:20:47', '2025-07-05 08:20:47'),
(52, 'App\\Models\\User', 2, 'token', '1befbb5a109343b7cc9b3ca563cc5610661f44d161797fd8e69015fbf8c92168', '[\"*\"]', NULL, NULL, '2025-07-05 08:20:56', '2025-07-05 08:20:56'),
(53, 'App\\Models\\User', 2, 'token', 'b0a77eae7e6a606c99c8f1dc9eadc6512b87473274cf0fcaa3e2e9064469dd6c', '[\"*\"]', NULL, NULL, '2025-07-05 08:25:36', '2025-07-05 08:25:36'),
(54, 'App\\Models\\User', 2, 'token', 'b511d52bac8b54b59c3e6998c61f6249e3fbe96355eb8f2990d9bb016360ee26', '[\"*\"]', NULL, NULL, '2025-07-05 08:25:47', '2025-07-05 08:25:47'),
(55, 'App\\Models\\User', 2, 'token', 'd9c4f500bf354fe3f45cf1684fecaf0378c43b84a9fef7edc91097cfb0bb91cf', '[\"*\"]', NULL, NULL, '2025-07-05 08:25:57', '2025-07-05 08:25:57'),
(56, 'App\\Models\\User', 2, 'token', '6f1eac2dbe331fcc49ed4c05f27f8813aa4973feb969929213588d2e9f7abbe3', '[\"*\"]', NULL, NULL, '2025-07-05 08:28:28', '2025-07-05 08:28:28'),
(57, 'App\\Models\\User', 2, 'token', '3b210ec45cbcc255645fa49993c340083de65571b9a741059d1ec5d21774bef8', '[\"*\"]', NULL, NULL, '2025-07-05 08:28:48', '2025-07-05 08:28:48'),
(58, 'App\\Models\\User', 2, 'token', '1a8af5e6e8e51b0843566eab373e265a8e23c00f41acfe36feb80d1a8cf8fded', '[\"*\"]', NULL, NULL, '2025-07-05 08:28:59', '2025-07-05 08:28:59'),
(59, 'App\\Models\\User', 2, 'token', 'b73837d11f408bda4dc9b63897a3471964946ebd37d64569f946a88e90bc8eba', '[\"*\"]', NULL, NULL, '2025-07-05 08:30:10', '2025-07-05 08:30:10'),
(60, 'App\\Models\\User', 2, 'token', 'b40131f29c0a0f1d4aabf8659e7c920b2dd0d0a01a5641e32252fc6a0346fc98', '[\"*\"]', NULL, NULL, '2025-07-05 08:30:21', '2025-07-05 08:30:21'),
(61, 'App\\Models\\User', 2, 'token', '08ed408f8716a8abd2fe35496977bddaf518a81ca40178b9804e54b4b8789e6d', '[\"*\"]', NULL, NULL, '2025-07-05 08:30:41', '2025-07-05 08:30:41'),
(62, 'App\\Models\\User', 2, 'token', 'ba008dcfe5225e96caf6e92f456e95dcf7ef8de1b4363c3735c10e1b6fe5f59a', '[\"*\"]', NULL, NULL, '2025-07-05 08:30:50', '2025-07-05 08:30:50'),
(63, 'App\\Models\\User', 2, 'token', 'aca2ae1b27045158cbbdc93fb242e7e1c037dc0c9183745bdda603a2913d7b1a', '[\"*\"]', NULL, NULL, '2025-07-05 08:31:00', '2025-07-05 08:31:00'),
(64, 'App\\Models\\User', 2, 'token', '60a285cc12e9840943be97ccd770e0fa2a41a3ea946c161dc0a0f855ab572226', '[\"*\"]', NULL, NULL, '2025-07-05 08:31:18', '2025-07-05 08:31:18'),
(65, 'App\\Models\\User', 2, 'token', '10404ca7804b73df63fdf23b57e585d94069aa42a02d5df0afc22c17e4ee9765', '[\"*\"]', NULL, NULL, '2025-07-05 08:33:03', '2025-07-05 08:33:03'),
(66, 'App\\Models\\User', 2, 'token', '7fa7fe726770f51d581424bc9200366a609867feebd2ea1bfc052ab111bb3a23', '[\"*\"]', NULL, NULL, '2025-07-05 08:37:29', '2025-07-05 08:37:29'),
(67, 'App\\Models\\User', 2, 'token', '552b6a50f183bc419a94836ba6adcaaa3cfc1b6acfa56d108277fa3daec53831', '[\"*\"]', NULL, NULL, '2025-07-05 08:37:32', '2025-07-05 08:37:32'),
(68, 'App\\Models\\User', 2, 'token', '8a063e15311ba6fc40604759b65a47dd64e9a2edec0e4ca8ada76fd1a08892ce', '[\"*\"]', NULL, NULL, '2025-07-05 08:37:33', '2025-07-05 08:37:33'),
(69, 'App\\Models\\User', 2, 'token', '70dd1fb79fe3cd020393d41ec5713828ebae198c957a0965f6abe20194f6428a', '[\"*\"]', NULL, NULL, '2025-07-05 08:37:34', '2025-07-05 08:37:34'),
(70, 'App\\Models\\User', 2, 'token', 'ecf07a4d5203f1518193b45d55d67a82080b16137d018d31e5c65a8d12f30414', '[\"*\"]', NULL, NULL, '2025-07-05 08:38:37', '2025-07-05 08:38:37'),
(71, 'App\\Models\\User', 2, 'token', '13d9fbc5b4b910eb801072aa6a54bed3269da5a7552a26bfab0cab41da9b2d69', '[\"*\"]', NULL, NULL, '2025-07-05 08:38:39', '2025-07-05 08:38:39'),
(72, 'App\\Models\\User', 2, 'token', 'f6d3078756228ab06de4bfd384b45858a8aaa615a1ef48374f627976e6943339', '[\"*\"]', NULL, NULL, '2025-07-05 08:38:40', '2025-07-05 08:38:40'),
(73, 'App\\Models\\User', 2, 'token', 'b7499041b56ff14e782b4db044370cbdeacb04bedb9f079311769b4493d12ca6', '[\"*\"]', NULL, NULL, '2025-07-05 08:38:41', '2025-07-05 08:38:41'),
(74, 'App\\Models\\User', 2, 'token', '837bda1d5c5a912699501d8033c49a6bca7dc2af1d14c2149a41402acbfdb9bc', '[\"*\"]', NULL, NULL, '2025-07-05 08:38:42', '2025-07-05 08:38:42'),
(75, 'App\\Models\\User', 2, 'token', 'baa05a415e3d285a4efb5f23ab73a44e8ef4755a061ceda20c162862d4769c25', '[\"*\"]', NULL, NULL, '2025-07-05 08:38:43', '2025-07-05 08:38:43'),
(76, 'App\\Models\\User', 2, 'token', 'e2912da071494e6ff141bf576867808a64ee51899b45a398c70d1d1e86095789', '[\"*\"]', NULL, NULL, '2025-07-05 08:38:44', '2025-07-05 08:38:44'),
(77, 'App\\Models\\User', 2, 'token', '8a0c0c269f2a81136b7ba879e759f0a5fee7b38610d3cc34883adcb270e46663', '[\"*\"]', NULL, NULL, '2025-07-05 08:38:45', '2025-07-05 08:38:45'),
(78, 'App\\Models\\User', 2, 'token', '46eabd1c689728f3d62d82383954578ec3921425984c48dcf298f9f61ec91083', '[\"*\"]', NULL, NULL, '2025-07-05 08:38:56', '2025-07-05 08:38:56'),
(79, 'App\\Models\\User', 2, 'token', '4e5622a5dbc6dea8ac4733ee398fe10daad39f287d0beb6ebba7e70aa006c12d', '[\"*\"]', NULL, NULL, '2025-07-05 08:40:06', '2025-07-05 08:40:06'),
(80, 'App\\Models\\User', 2, 'token', 'e2fdfe3551230291189f9321c5eceddffee6b29e8cc841806e4900c0fb8d9186', '[\"*\"]', NULL, NULL, '2025-07-05 08:41:10', '2025-07-05 08:41:10'),
(81, 'App\\Models\\User', 2, 'token', 'aa79b7a59c2fd5e73921b5ab8999f6084207499156c2232359c7ce118500e295', '[\"*\"]', NULL, NULL, '2025-07-05 08:41:23', '2025-07-05 08:41:23'),
(82, 'App\\Models\\User', 2, 'token', 'd0f71805c26799ea3a31ab18b946b696784328a4c27e9a691d10c77c56866276', '[\"*\"]', NULL, NULL, '2025-07-05 08:41:36', '2025-07-05 08:41:36'),
(83, 'App\\Models\\User', 2, 'token', '0d636d70460d5add2cd1080c8970878c6fb0ddb5dec9a3b0feefc0e8a81411d4', '[\"*\"]', NULL, NULL, '2025-07-05 08:44:48', '2025-07-05 08:44:48'),
(84, 'App\\Models\\User', 2, 'token', 'b19c96b63acbc638cc33542378ef740a559357f06effa388f5bbf171dc095fd4', '[\"*\"]', NULL, NULL, '2025-07-05 08:51:12', '2025-07-05 08:51:12'),
(85, 'App\\Models\\User', 2, 'token', '0e50cf073318f27263c26b08f9b61425ed73567ff01b8b5425bf21e2e1fce708', '[\"*\"]', NULL, NULL, '2025-07-05 08:52:14', '2025-07-05 08:52:14'),
(86, 'App\\Models\\User', 2, 'token', '69c3a44a97d17976b9b57cb258b1c002f9d32b772e5779426a5963e45231d6d0', '[\"*\"]', NULL, NULL, '2025-07-05 08:52:35', '2025-07-05 08:52:35'),
(87, 'App\\Models\\User', 2, 'token', '2adc5f7de1ca699fac2a1266044a9ecf5b8cd221aa8df7e07dc06c12506b3b92', '[\"*\"]', NULL, NULL, '2025-07-05 08:53:45', '2025-07-05 08:53:45'),
(88, 'App\\Models\\User', 2, 'token', '64c128a649ac614bde8c0826cde734c9bd3955a5315dfffe5e6661b3cdf4ce5f', '[\"*\"]', NULL, NULL, '2025-07-05 08:54:09', '2025-07-05 08:54:09'),
(89, 'App\\Models\\User', 2, 'token', 'f3d0ba70e7748d4e1900132093b2cf2a2629fa87e806ee98d92aeeff4dd3217c', '[\"*\"]', NULL, NULL, '2025-07-05 08:54:25', '2025-07-05 08:54:25'),
(90, 'App\\Models\\User', 2, 'token', 'b6b4fb4e9aaab97baa6ee2faa9cabebc0fd66d58a73695a5fda23e0476283c42', '[\"*\"]', NULL, NULL, '2025-07-05 08:56:00', '2025-07-05 08:56:00'),
(91, 'App\\Models\\User', 2, 'token', 'ba49f8d10e7b276d7a8305f737ca7217f41232420b03a3c64910bf2a24a9d1d3', '[\"*\"]', NULL, NULL, '2025-07-05 08:58:16', '2025-07-05 08:58:16'),
(92, 'App\\Models\\User', 2, 'token', '96ab8532c7ebb38e1324003ae999faded85f68a8bfab91dd05f3a743ea899a53', '[\"*\"]', NULL, NULL, '2025-07-05 08:58:42', '2025-07-05 08:58:42'),
(93, 'App\\Models\\User', 2, 'token', '5f362647cb9949a4ef6cafd8a3da8e0d424af306d2bedfa9c7c4a60109f515b9', '[\"*\"]', NULL, NULL, '2025-07-05 09:00:16', '2025-07-05 09:00:16'),
(94, 'App\\Models\\User', 2, 'token', '294a42c25564e53cbcacfb9c52fe4857539205db86a462baf30a44f492bf6a7a', '[\"*\"]', NULL, NULL, '2025-07-05 09:00:50', '2025-07-05 09:00:50'),
(95, 'App\\Models\\User', 2, 'token', '9f27332946db4a416323f3ef99187ae113441187e4999d4029d8887e9e3db35f', '[\"*\"]', NULL, NULL, '2025-07-05 09:01:07', '2025-07-05 09:01:07'),
(96, 'App\\Models\\User', 2, 'token', '4ee3fffebccfcf7dfe37b8611977698a3edaa6fe43fb50e6ff6924dbcd8b0cfe', '[\"*\"]', NULL, NULL, '2025-07-05 09:01:41', '2025-07-05 09:01:41'),
(97, 'App\\Models\\User', 2, 'token', '3763f366c8844885a15b3f0c4ffa8667d276e3b22987d562ebfb61a360bfbb7f', '[\"*\"]', NULL, NULL, '2025-07-05 09:01:50', '2025-07-05 09:01:50'),
(98, 'App\\Models\\User', 2, 'token', '534ffb176917bb575e4eac21781ed93d31183f55105e007be29c9e280fdbaa03', '[\"*\"]', NULL, NULL, '2025-07-05 09:01:59', '2025-07-05 09:01:59'),
(99, 'App\\Models\\User', 2, 'token', 'fcccc39ce01a4f1b58c8edd68ef3f3159dd725943240b132eb0a70adeee97875', '[\"*\"]', NULL, NULL, '2025-07-05 09:02:10', '2025-07-05 09:02:10'),
(100, 'App\\Models\\User', 2, 'token', 'a0c7f9cc3828d94cad75ead93c8a5cc0f537e4f57c1fafe333b1ceb2865a9ced', '[\"*\"]', NULL, NULL, '2025-07-05 09:02:19', '2025-07-05 09:02:19'),
(101, 'App\\Models\\User', 2, 'token', 'd913cca46110897b01f609bc6416140fef6944e6576f63aa796ff276412afb7c', '[\"*\"]', NULL, NULL, '2025-07-05 09:03:24', '2025-07-05 09:03:24'),
(102, 'App\\Models\\User', 2, 'token', 'd74b084ebdf244146e56ff7d50101de55605b2b6a3a6a81b22ec64d7763379b3', '[\"*\"]', '2025-07-21 05:31:51', NULL, '2025-07-11 04:47:59', '2025-07-21 05:31:51'),
(103, 'App\\Models\\User', 2, 'token', '4e6f34d0c29ebede6b3e0c1c727419c6dfd63af1921396866708a784d6eaa37d', '[\"*\"]', NULL, NULL, '2025-07-11 07:52:57', '2025-07-11 07:52:57'),
(104, 'App\\Models\\User', 2, 'token', '59cfe834c85ded19edacc063475ffc090a9eb759754b10450b6efbf4b43d2a90', '[\"*\"]', NULL, NULL, '2025-07-11 07:53:11', '2025-07-11 07:53:11'),
(105, 'App\\Models\\User', 2, 'token', 'f74775b5c9c5a1aa1196d3845163eecc0e3fe11d8d5ae55b3f4e2d6a9c759ea8', '[\"*\"]', NULL, NULL, '2025-07-12 00:10:08', '2025-07-12 00:10:08'),
(106, 'App\\Models\\User', 2, 'token', '5479a9b9fff7c0113c7afaa167f3ca906c852b54ff64931cacfb887ba7c62693', '[\"*\"]', NULL, NULL, '2025-07-12 00:10:17', '2025-07-12 00:10:17'),
(107, 'App\\Models\\User', 2, 'token', '75415b457416fd956a1e6c8793c4d1f741297cb71d6ca2f8440c6d2c0fde9592', '[\"*\"]', NULL, NULL, '2025-07-12 00:10:32', '2025-07-12 00:10:32'),
(108, 'App\\Models\\User', 2, 'token', '7adbbf761931426b2961e33264054743c10e3d67cd93af9b03e1a0ab61d75a41', '[\"*\"]', NULL, NULL, '2025-07-12 00:12:38', '2025-07-12 00:12:38'),
(109, 'App\\Models\\User', 2, 'token', 'e7b24f15034de38b4805450b1ef9b54e77fd7cfa94657b375c6c2fd8e67212b6', '[\"*\"]', NULL, NULL, '2025-07-12 00:12:50', '2025-07-12 00:12:50'),
(110, 'App\\Models\\User', 2, 'token', '509d1ecd1cf3b4c3205a4abd49d790bcd09ab0248ff13e9dba15fc5479af5423', '[\"*\"]', NULL, NULL, '2025-07-12 00:12:59', '2025-07-12 00:12:59'),
(111, 'App\\Models\\User', 2, 'token', '1790f18d8122093e2f87c72f7c22170c9a1d36d2781318932556b3d6100e9b3d', '[\"*\"]', NULL, NULL, '2025-07-12 00:13:08', '2025-07-12 00:13:08'),
(112, 'App\\Models\\User', 2, 'token', 'cea0b9b3343f678a53e4076b31a341790a200706c78e0543497911e9a8c3a632', '[\"*\"]', NULL, NULL, '2025-07-12 00:13:38', '2025-07-12 00:13:38'),
(113, 'App\\Models\\User', 2, 'token', '7aa589712c4f825d7848b2c2371077ded5663e64c3c61e86908a2090c09f2bdd', '[\"*\"]', NULL, NULL, '2025-07-12 00:13:52', '2025-07-12 00:13:52'),
(114, 'App\\Models\\User', 2, 'token', 'd0c2a698ced3b5037c34a802cca5746d3aa99e77295525fbd79cb43556b312da', '[\"*\"]', NULL, NULL, '2025-07-12 00:14:06', '2025-07-12 00:14:06'),
(115, 'App\\Models\\User', 2, 'token', '9d4e7defa1ece22afe580517f04edc10df58c46da2556a6646ab327f28235acf', '[\"*\"]', NULL, NULL, '2025-07-12 00:14:25', '2025-07-12 00:14:25'),
(116, 'App\\Models\\User', 2, 'token', 'a02e1d015e0da2a823aa44412e99788c4830b80849eed47a304699178adf5eda', '[\"*\"]', NULL, NULL, '2025-07-12 00:32:08', '2025-07-12 00:32:08'),
(117, 'App\\Models\\User', 2, 'token', '12c9ad6236d29d2b0d5215374c6da51d92c5ca55a8644c5dbda72b82a1682698', '[\"*\"]', NULL, NULL, '2025-07-12 00:32:45', '2025-07-12 00:32:45'),
(118, 'App\\Models\\User', 2, 'token', '772dc2185f543bedecc0fdd94abfa81fc7fbc7f07cba9f6f63c06e5436b82e33', '[\"*\"]', NULL, NULL, '2025-07-12 00:34:35', '2025-07-12 00:34:35'),
(119, 'App\\Models\\User', 2, 'token', '8eabb86a878743d3fd411dd5b418332b47ca2ed76d0e7fa3ec996fb0685208bc', '[\"*\"]', NULL, NULL, '2025-07-12 00:35:51', '2025-07-12 00:35:51'),
(120, 'App\\Models\\User', 2, 'token', '82a1026fed5e6719303ae2be6f5dde119b6b552f349f46d98fbc90e86163f0b5', '[\"*\"]', NULL, NULL, '2025-07-12 00:36:10', '2025-07-12 00:36:10'),
(121, 'App\\Models\\User', 2, 'token', '3a233d57a6c914de801a8aa5b0c98bf0b716d130175899a7343f5df586cc15b5', '[\"*\"]', NULL, NULL, '2025-07-12 00:38:47', '2025-07-12 00:38:47'),
(122, 'App\\Models\\User', 2, 'token', '4be6514663437fc8138c658c2ae508280ade2064aa812ba4a3d23f67bf500037', '[\"*\"]', NULL, NULL, '2025-07-12 00:39:20', '2025-07-12 00:39:20'),
(123, 'App\\Models\\User', 2, 'token', 'adf11776a1910cb4310347fc0d4d91f9030c07c61bc3ddea73b5631f8ebaa37b', '[\"*\"]', NULL, NULL, '2025-07-12 00:39:29', '2025-07-12 00:39:29'),
(124, 'App\\Models\\User', 2, 'token', '98ca185a6a6d3c9f6f5ea3708d3e25e9cf40fef8970ff9a3ea439fc272382605', '[\"*\"]', NULL, NULL, '2025-07-12 00:39:38', '2025-07-12 00:39:38'),
(125, 'App\\Models\\User', 2, 'token', '32124c47924f9eb77c7c1df969748d92f3fcfa89ef300b813bee9d4c7c2eaa2d', '[\"*\"]', NULL, NULL, '2025-07-12 00:40:31', '2025-07-12 00:40:31'),
(126, 'App\\Models\\User', 2, 'token', '8de0e53c539ba20782e314b45526d6cddfff5268f85ebab6789197b359394f0f', '[\"*\"]', NULL, NULL, '2025-07-12 00:41:00', '2025-07-12 00:41:00'),
(127, 'App\\Models\\User', 2, 'token', '82c69e4f0759cd525707de39926757ec7d8e61dea9e4e38573c061e7e257bd0c', '[\"*\"]', NULL, NULL, '2025-07-12 00:41:20', '2025-07-12 00:41:20'),
(128, 'App\\Models\\User', 2, 'token', '4f616e8f90419cc74d5fcacd33adf95e1bd83268249d1b1256de3dac730614da', '[\"*\"]', NULL, NULL, '2025-07-12 00:42:10', '2025-07-12 00:42:10'),
(129, 'App\\Models\\User', 2, 'token', '4f3956b1643b9c4a5ca787ba5bf35262a9d735e2508e6e28f05fda740078ff1f', '[\"*\"]', NULL, NULL, '2025-07-12 00:43:22', '2025-07-12 00:43:22'),
(130, 'App\\Models\\User', 2, 'token', 'f1cc3a76f5af9b22ab7bc2a689a4a15d3947132664585d4d42bfdf253f006989', '[\"*\"]', NULL, NULL, '2025-07-12 00:43:40', '2025-07-12 00:43:40'),
(131, 'App\\Models\\User', 2, 'token', '4eab1fb0a9138a3dae1f1c397ab0e85c73dd9e4ef24ea5fb8e647a495ad963ef', '[\"*\"]', NULL, NULL, '2025-07-12 00:43:55', '2025-07-12 00:43:55'),
(132, 'App\\Models\\User', 2, 'token', 'd6fe4bf3dd657fa77c38e76622598173d6339a6a486a1b3de0a92aad181dc945', '[\"*\"]', NULL, NULL, '2025-07-12 00:48:03', '2025-07-12 00:48:03'),
(133, 'App\\Models\\User', 2, 'token', '9b7d78f07a475ca85dae329f2ee5000a7feceef2e99bc89d6f332a5a097d80d6', '[\"*\"]', NULL, NULL, '2025-07-12 00:57:29', '2025-07-12 00:57:29'),
(134, 'App\\Models\\User', 2, 'token', '28fb1931c259d3aef9ced97dadebaa474f17c8d4e163324dbadd283311742414', '[\"*\"]', NULL, NULL, '2025-07-12 00:58:36', '2025-07-12 00:58:36'),
(135, 'App\\Models\\User', 2, 'token', 'e8b557fb15596e9b43ef9fb515c08be80bfb81ecb00103a85595ea317856f52b', '[\"*\"]', NULL, NULL, '2025-07-12 00:59:09', '2025-07-12 00:59:09'),
(136, 'App\\Models\\User', 2, 'token', '9b6a4e452e2fcc0fda10b870d30b5a3f2448f6edcaf6bf3888c83abcf2632a87', '[\"*\"]', NULL, NULL, '2025-07-12 01:06:52', '2025-07-12 01:06:52'),
(137, 'App\\Models\\User', 2, 'token', 'cae6c4de508eea473bb61a14f22908be66bcf39fb7257cfdc77eab3ffb585571', '[\"*\"]', NULL, NULL, '2025-07-12 01:07:50', '2025-07-12 01:07:50'),
(138, 'App\\Models\\User', 2, 'token', '3306275c09282cc8fd52f4c1505cdc9e09afc71e9399cf55a75626346b0b7c83', '[\"*\"]', NULL, NULL, '2025-07-12 01:08:31', '2025-07-12 01:08:31'),
(139, 'App\\Models\\User', 2, 'token', '38ab0b179386e6554ae35b661c0beec0cb724baeb1984e347aa5b8e0feb6af4b', '[\"*\"]', NULL, NULL, '2025-07-12 01:08:57', '2025-07-12 01:08:57'),
(140, 'App\\Models\\User', 2, 'token', '9c47d75e9bd663713ba777a9820c474bc4c018fdb0b40ca4158e7887b06f4b73', '[\"*\"]', NULL, NULL, '2025-07-12 01:11:00', '2025-07-12 01:11:00'),
(141, 'App\\Models\\User', 2, 'token', '0a61af1dd2af48d233d079078c5762199cf71073b3bb7c3a29c0f5ec47d637bd', '[\"*\"]', NULL, NULL, '2025-07-12 01:13:44', '2025-07-12 01:13:44'),
(142, 'App\\Models\\User', 2, 'token', 'fcb07bab98c8f023efacfb25abff056f6bcb7d51ab046702f65f019b1116eecd', '[\"*\"]', NULL, NULL, '2025-07-12 01:18:58', '2025-07-12 01:18:58'),
(143, 'App\\Models\\User', 2, 'token', 'b2e916ec81f6b0043c78fe11bbd93799a7c06a7b8163a8ddd230b991a493f7eb', '[\"*\"]', NULL, NULL, '2025-07-12 01:43:50', '2025-07-12 01:43:50'),
(144, 'App\\Models\\User', 2, 'token', '4d8031794c8c749c4739b9c8464b727dde5aa62f5f72b73281ccd139707008ee', '[\"*\"]', NULL, NULL, '2025-07-12 01:48:13', '2025-07-12 01:48:13'),
(145, 'App\\Models\\User', 2, 'token', '35271ab7966673be9b19d8c7031ff5372e716188290d4ebcb5e40b7d23dc5d84', '[\"*\"]', '2025-07-12 03:29:01', NULL, '2025-07-12 01:48:48', '2025-07-12 03:29:01'),
(146, 'App\\Models\\User', 2, 'token', 'c072346e0b74e80ae843e44aa5972c2a27ed741c49f93a4a997a1685a7ae6ffb', '[\"*\"]', '2025-07-12 08:43:42', NULL, '2025-07-12 04:01:16', '2025-07-12 08:43:42'),
(147, 'App\\Models\\User', 2, 'token', 'e9af9c905a5874a9491fa3c72586fc22aab29f530493ee3b8fea04ac1845e207', '[\"*\"]', '2025-07-13 05:20:13', NULL, '2025-07-12 09:18:55', '2025-07-13 05:20:13'),
(148, 'App\\Models\\User', 2, 'token', '68071eae6e40a4a54ee2c491904d15769261a04987e5ad8b4d866639c10cb4a1', '[\"*\"]', '2025-07-17 10:13:14', NULL, '2025-07-13 05:56:38', '2025-07-17 10:13:14'),
(149, 'App\\Models\\User', 2, 'token', '802c66fc3af14689a091feb94117859ef56948ec953ac692162a25ebb3504777', '[\"*\"]', '2025-07-19 02:25:07', NULL, '2025-07-18 11:28:44', '2025-07-19 02:25:07'),
(150, 'App\\Models\\User', 2, 'token', 'dc052a383c418526a76dacfc690c8d58e172e46660f63e398f479d48677e4bc9', '[\"*\"]', '2025-07-19 02:29:53', NULL, '2025-07-19 02:28:56', '2025-07-19 02:29:53'),
(151, 'App\\Models\\User', 2, 'token', 'ed53f6359265c4fcb9a02872f5432ab111584eaa737c72ea0fe47be515936c67', '[\"*\"]', '2025-07-19 02:30:54', NULL, '2025-07-19 02:30:38', '2025-07-19 02:30:54'),
(152, 'App\\Models\\User', 2, 'token', '827c7ac3fd979382973deb6f972d4631b9f67c142866e302d767aef9c0db66dc', '[\"*\"]', '2025-07-19 10:36:27', NULL, '2025-07-19 10:05:50', '2025-07-19 10:36:27'),
(153, 'App\\Models\\User', 2, 'token', 'c175345eb2230f9c9a90559bcefe487095ab2e33cec1ff0de9b1a15f4dc06a45', '[\"*\"]', '2025-07-21 01:52:16', NULL, '2025-07-20 02:30:13', '2025-07-21 01:52:16'),
(154, 'App\\Models\\User', 2, 'token', '78f6330a6eb30eca8b60ae75b124aa3eb5d16ae5e2b845c274c242fa5f9ef88b', '[\"*\"]', '2025-07-21 06:33:39', NULL, '2025-07-21 01:53:29', '2025-07-21 06:33:39'),
(155, 'App\\Models\\User', 2, 'token', '283792333b65a125e52891de98fb7853ed8ebb78156cf4faac3628baabc2cdee', '[\"*\"]', '2025-07-21 12:43:40', NULL, '2025-07-21 12:43:38', '2025-07-21 12:43:40'),
(156, 'App\\Models\\User', 2, 'token', '583fd39c7ef98040f8486bb55c5cadb1c0959eac36e225a5ba29094aeeb3e33d', '[\"*\"]', '2025-07-21 13:08:36', NULL, '2025-07-21 13:08:34', '2025-07-21 13:08:36'),
(157, 'App\\Models\\User', 2, 'token', '9d6560daa29c10a97fe9f6256ee4afb1aa02d1c7009116e45b25563523c5b988', '[\"*\"]', '2025-07-21 13:25:39', NULL, '2025-07-21 13:09:44', '2025-07-21 13:25:39'),
(158, 'App\\Models\\User', 2, 'token', '3b5cf1dea1dcac21bb84cd34d9a7dbb02846e9ea4814a1db682cf0306fb35ba0', '[\"*\"]', '2025-07-21 13:26:35', NULL, '2025-07-21 13:26:31', '2025-07-21 13:26:35');

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `short_desc` varchar(255) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `construction_type` varchar(255) DEFAULT NULL,
  `sector` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `title`, `slug`, `short_desc`, `content`, `construction_type`, `sector`, `location`, `image`, `status`, `created_at`, `updated_at`) VALUES
(4, 'dummy for projects', 'dummy-for-projects', 'dummy for projects', '<p>dummy for projects</p>', 'Commercial construction', '', 'Delhi', '17530992144.jpg', 1, '2025-07-21 06:30:14', '2025-07-21 06:30:16');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `short_desc` varchar(255) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `title`, `slug`, `short_desc`, `content`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Construction', 'consturction', '', 'this is content pleasse description', '17523318311.jpg', 1, '2025-07-11 04:54:41', '2025-07-12 09:20:33'),
(4, 'dummy service test', 'dummy-service-test', 'Dummy Service test', 'Dummy Service test', '17523317894.jpg', 1, '2025-07-12 04:41:58', '2025-07-12 09:19:51'),
(19, 'Site preparation', 'site-preparation', 'Site preparation, or “site work,” is the foundational set of tasks done before any construction begins—ensuring the land is safe, stable, and clear for building. It typically includes surveying, clearing', '<h3 data-start=\"321\" data-end=\"350\"><strong>1. Site Survey &amp; Planning</strong></h3>\n<ul data-start=\"351\" data-end=\"467\">\n<li data-start=\"351\" data-end=\"390\">\n<p data-start=\"353\" data-end=\"390\"><span class=\"relative -mx-px my-[-0.2rem] rounded px-px py-[0.2rem] transition-colors duration-100 ease-in-out\">Conduct topographical and boundary surveys to map elevation, site contours, and utility locations.</span></p>\n</li>\n<li data-start=\"391\" data-end=\"467\">\n<p data-start=\"393\" data-end=\"467\"><span class=\"relative -mx-px my-[-0.2rem] rounded px-px py-[0.2rem] transition-colors duration-100 ease-in-out\">Perform geotechnical soil testing to understand bearing capacity, groundwater levels, liquefaction risk, and foundation suitability.</span></p></li></ul>\n<ul data-start=\"351\" data-end=\"467\">\n<li data-start=\"351\" data-end=\"390\">\n<p data-start=\"353\" data-end=\"390\"><span class=\"relative -mx-px my-[-0.2rem] rounded px-px py-[0.2rem] transition-colors duration-100 ease-in-out\">Conduct topographical and boundary surveys to map elevation, site contours, and utility locations.</span></p>\n</li>\n<li data-start=\"391\" data-end=\"467\">\n<p data-start=\"393\" data-end=\"467\"><span class=\"relative -mx-px my-[-0.2rem] rounded px-px py-[0.2rem] transition-colors duration-100 ease-in-out\">Perform geotechnical soil testing to understand bearing capacity, groundwater levels, liquefaction risk, and foundation suitability.</span></p></li></ul><p><br></p><h3 data-start=\"469\" data-end=\"521\"><strong>2. Permits, Regulations &amp; Environmental Planning</strong></h3>\n<ul data-start=\"522\" data-end=\"642\">\n<li data-start=\"522\" data-end=\"561\">\n<p data-start=\"524\" data-end=\"561\"><span class=\"relative -mx-px my-[-0.2rem] rounded px-px py-[0.2rem] transition-colors duration-100 ease-in-out\">Secure zoning, excavation, and environmental permits from local authorities.</span></p>\n</li>\n<li data-start=\"562\" data-end=\"642\">\n<p data-start=\"564\" data-end=\"642\"><span class=\"relative -mx-px my-[-0.2rem] rounded px-px py-[0.2rem] transition-colors duration-100 ease-in-out\">Plan drainage, erosion control, and safety measures in compliance with building codes.</span></p></li><li data-start=\"562\" data-end=\"642\"><p data-start=\"564\" data-end=\"642\"><span class=\"relative -mx-px my-[-0.2rem] rounded px-px py-[0.2rem] transition-colors duration-100 ease-in-out\"><br></span></p></li></ul><h3 data-start=\"644\" data-end=\"672\"><strong>3.Clearing &amp; Demolition</strong></h3>\n<ul data-start=\"673\" data-end=\"795\">\n<li data-start=\"673\" data-end=\"714\">\n<p data-start=\"675\" data-end=\"714\"><span class=\"relative -mx-px my-[-0.2rem] rounded px-px py-[0.2rem] transition-colors duration-100 ease-in-out\">Remove vegetation (trees, stumps, shrubs), debris, and existing structures.</span></p>\n</li>\n<li data-start=\"715\" data-end=\"795\">\n<p data-start=\"717\" data-end=\"795\"><span class=\"relative -mx-px my-[-0.2rem] rounded px-px py-[0.2rem] transition-colors duration-100 ease-in-out\">Remove roots or organic material to prevent future soil settling.</span></p></li></ul><h3 data-start=\"797\" data-end=\"836\">4. Excavation, Grading &amp; Compaction</h3>\n<ul data-start=\"837\" data-end=\"1001\">\n<li data-start=\"837\" data-end=\"878\">\n<p data-start=\"839\" data-end=\"878\"><span class=\"relative -mx-px my-[-0.2rem] rounded px-px py-[0.2rem] transition-colors duration-100 ease-in-out\">Dig trenches for footings, basements, utilities; excavate to design depth.</span></p>\n</li>\n<li data-start=\"879\" data-end=\"920\">\n<p data-start=\"881\" data-end=\"920\"><span class=\"relative -mx-px my-[-0.2rem] rounded px-px py-[0.2rem] transition-colors duration-100 ease-in-out\">Perform “cut and fill” grading to shape site elevations, ensure slope away from foundation.</span></p>\n</li>\n<li data-start=\"921\" data-end=\"1001\">\n<p data-start=\"923\" data-end=\"1001\"><span class=\"relative -mx-px my-[-0.2rem] rounded px-px py-[0.2rem] transition-colors duration-100 ease-in-out\">Compact soil (typically ≥95% of Proctor density) using rollers or tampers to avoid future foundation settlement.</span></p></li><li data-start=\"921\" data-end=\"1001\"><p data-start=\"923\" data-end=\"1001\"><span class=\"relative -mx-px my-[-0.2rem] rounded px-px py-[0.2rem] transition-colors duration-100 ease-in-out\"><br></span></p>\n</li>\n</ul>\n<h3 data-start=\"1003\" data-end=\"1036\"><strong>5. Drainage &amp; Erosion Control</strong></h3>\n<ul data-start=\"1037\" data-end=\"1159\">\n<li data-start=\"1037\" data-end=\"1078\">\n<p data-start=\"1039\" data-end=\"1078\"><span class=\"relative -mx-px my-[-0.2rem] rounded px-px py-[0.2rem] transition-colors duration-100 ease-in-out\">Build drainage features such as French drains, swales, sediment basins.</span></p>\n</li>\n<li data-start=\"1079\" data-end=\"1159\">\n<p data-start=\"1081\" data-end=\"1159\"><span class=\"relative -mx-px my-[-0.2rem] rounded px-px py-[0.2rem] transition-colors duration-100 ease-in-out\">Use silt fences or erosion mats to prevent sediment runoff during and after construction.</span></p></li><li data-start=\"1079\" data-end=\"1159\"><p data-start=\"1081\" data-end=\"1159\"><span class=\"\" data-state=\"closed\"><span class=\"ms-1 inline-flex max-w-full items-center relative top-[-0.094rem] animate-[show_150ms_ease-in]\"><a href=\"https://designhorizons.org/effective-site-preparation-steps-for-construction-projects/?utm_source=chatgpt.com\" target=\"_blank\" rel=\"noopener\" alt=\"https://designhorizons.org/effective-site-preparation-steps-for-construction-projects/?utm_source=chatgpt.com\" class=\"flex h-4.5 overflow-hidden rounded-xl px-2 text-[9px] font-medium text-token-text-secondary! bg-[#F4F4F4]! dark:bg-[#303030]! transition-colors duration-150 ease-in-out\"><span class=\"relative start-0 bottom-0 flex h-full w-full items-center\"><span class=\"flex h-4 w-full items-center justify-between absolute\"><span class=\"max-w-full grow truncate overflow-hidden text-center\">Construct Estimates</span><span class=\"-me-1 flex h-full items-center rounded-full px-1 text-[#8F8F8F]\">+2</span></span></span></a></span></span></p>\n</li>\n</ul>\n<h3 data-start=\"1161\" data-end=\"1195\"><strong>6. Utilities &amp; Access Planning</strong></h3>\n<ul data-start=\"1196\" data-end=\"1360\">\n<li data-start=\"1196\" data-end=\"1237\">\n<p data-start=\"1198\" data-end=\"1237\"><span class=\"relative -mx-px my-[-0.2rem] rounded px-px py-[0.2rem] transition-colors duration-100 ease-in-out\">Locate existing utility lines via utility maps or ground-penetrating radar to avoid damage.</span></p>\n</li>\n<li data-start=\"1238\" data-end=\"1279\">\n<p data-start=\"1240\" data-end=\"1279\"><span class=\"relative -mx-px my-[-0.2rem] rounded px-px py-[0.2rem] transition-colors duration-100 ease-in-out\">Coordinate installation or relocation of water, sewage, gas, electricity, and telecom services.</span></p>\n</li>\n<li data-start=\"1280\" data-end=\"1360\">\n<p data-start=\"1282\" data-end=\"1360\"><span class=\"relative -mx-px my-[-0.2rem] rounded px-px py-[0.2rem] transition-colors duration-100 ease-in-out\">Plan access roads and onsite staging areas to support construction logistics</span></p></li><li data-start=\"1280\" data-end=\"1360\"><p data-start=\"1282\" data-end=\"1360\"><span class=\"relative -mx-px my-[-0.2rem] rounded px-px py-[0.2rem] transition-colors duration-100 ease-in-out\"><br></span></p>\n</li>\n</ul>\n<h3 data-start=\"1362\" data-end=\"1397\"><strong>7. Final Inspection &amp; Readiness</strong></h3>\n<ul data-start=\"1398\" data-end=\"1520\">\n<li data-start=\"1398\" data-end=\"1439\">\n<p data-start=\"1400\" data-end=\"1439\"><span class=\"relative -mx-px my-[-0.2rem] rounded px-px py-[0.2rem] transition-colors duration-100 ease-in-out\">Conduct a final site check to confirm: cleared land, even grade, proper drainage, stabilized soil, utility trenches in place, and site safety in order.</span></p>\n</li>\n<li data-start=\"1440\" data-end=\"1520\">\n<p data-start=\"1442\" data-end=\"1520\"><span class=\"relative -mx-px my-[-0.2rem] rounded px-px py-[0.2rem] transition-colors duration-100 ease-in-out\">Maintain a checklist to ensure nothing is overlooked</span></p>\n</li>\n</ul>\n<p><br></p>', '175312386819.jpg', 1, '2025-07-12 07:34:50', '2025-07-21 13:25:18');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `temp_images`
--

CREATE TABLE `temp_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `temp_images`
--

INSERT INTO `temp_images` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, '1752323445.jpg', '2025-07-12 07:00:45', '2025-07-12 07:00:45'),
(2, '1752324015.jpg', '2025-07-12 07:10:15', '2025-07-12 07:10:15'),
(3, '1752324085.jpg', '2025-07-12 07:11:25', '2025-07-12 07:11:25'),
(4, '1752324106.jpg', '2025-07-12 07:11:46', '2025-07-12 07:11:46'),
(5, '1752324236.PNG', '2025-07-12 07:13:56', '2025-07-12 07:13:56'),
(6, '1752324320.jpg', '2025-07-12 07:15:20', '2025-07-12 07:15:20'),
(7, '1752324460.jpg', '2025-07-12 07:17:40', '2025-07-12 07:17:40'),
(8, '1752324506.jpg', '2025-07-12 07:18:26', '2025-07-12 07:18:26'),
(9, '1752324603.jpg', '2025-07-12 07:20:03', '2025-07-12 07:20:03'),
(10, '1752324621.jpg', '2025-07-12 07:20:21', '2025-07-12 07:20:21'),
(11, '1752324841.jpg', '2025-07-12 07:24:01', '2025-07-12 07:24:01'),
(12, '1752324967.jpg', '2025-07-12 07:26:07', '2025-07-12 07:26:07'),
(13, '1752324983.jpg', '2025-07-12 07:26:23', '2025-07-12 07:26:23'),
(14, '1752325028.jpg', '2025-07-12 07:27:08', '2025-07-12 07:27:08'),
(15, '1752325324.jpg', '2025-07-12 07:32:04', '2025-07-12 07:32:04'),
(16, '1752325358.jpg', '2025-07-12 07:32:38', '2025-07-12 07:32:38'),
(17, '1752325459.jpg', '2025-07-12 07:34:19', '2025-07-12 07:34:19'),
(18, '1752325789.jpg', '2025-07-12 07:39:49', '2025-07-12 07:39:49'),
(19, '1752328817.jpg', '2025-07-12 08:30:17', '2025-07-12 08:30:17'),
(20, '1752331765.jpg', '2025-07-12 09:19:25', '2025-07-12 09:19:25'),
(21, '1752331788.jpg', '2025-07-12 09:19:48', '2025-07-12 09:19:48'),
(22, '1752331806.jpg', '2025-07-12 09:20:06', '2025-07-12 09:20:06'),
(23, '1752331830.jpg', '2025-07-12 09:20:30', '2025-07-12 09:20:30'),
(24, '1752400788.jpg', '2025-07-13 04:29:48', '2025-07-13 04:29:48'),
(25, '1752400814.jpg', '2025-07-13 04:30:14', '2025-07-13 04:30:14'),
(26, '1752402815.jpg', '2025-07-13 05:03:35', '2025-07-13 05:03:35'),
(27, '1752402879.jpg', '2025-07-13 05:04:39', '2025-07-13 05:04:39'),
(28, '1752402897.jpg', '2025-07-13 05:04:57', '2025-07-13 05:04:57'),
(29, '1752403101.jpg', '2025-07-13 05:08:21', '2025-07-13 05:08:21'),
(30, '1752403573.jpg', '2025-07-13 05:16:13', '2025-07-13 05:16:13'),
(31, '1752406011.jpg', '2025-07-13 05:56:51', '2025-07-13 05:56:51'),
(32, '1752406031.jpg', '2025-07-13 05:57:11', '2025-07-13 05:57:11'),
(33, '1752493026.jpg', '2025-07-14 06:07:06', '2025-07-14 06:07:06'),
(34, '1752493163.jpg', '2025-07-14 06:09:23', '2025-07-14 06:09:23'),
(35, '1752493255.jpg', '2025-07-14 06:10:55', '2025-07-14 06:10:55'),
(36, '1752493326.jpg', '2025-07-14 06:12:06', '2025-07-14 06:12:06'),
(37, '1752493403.jpg', '2025-07-14 06:13:23', '2025-07-14 06:13:23'),
(38, '1752493764.jpg', '2025-07-14 06:19:24', '2025-07-14 06:19:24'),
(39, '1752497535.jpg', '2025-07-14 07:22:15', '2025-07-14 07:22:15'),
(40, '1752513199.jpg', '2025-07-14 11:43:19', '2025-07-14 11:43:19'),
(41, '1752513269.jpg', '2025-07-14 11:44:29', '2025-07-14 11:44:29'),
(42, '1752513326.jpg', '2025-07-14 11:45:26', '2025-07-14 11:45:26'),
(43, '1752513647.jpg', '2025-07-14 11:50:47', '2025-07-14 11:50:47'),
(44, '1752513697.jpg', '2025-07-14 11:51:37', '2025-07-14 11:51:37'),
(45, '1752514139.jpg', '2025-07-14 11:58:59', '2025-07-14 11:58:59'),
(46, '1752514160.jpg', '2025-07-14 11:59:20', '2025-07-14 11:59:20'),
(47, '1752514298.jpg', '2025-07-14 12:01:38', '2025-07-14 12:01:38'),
(48, '1752514372.jpg', '2025-07-14 12:02:52', '2025-07-14 12:02:52'),
(49, '1752514415.jpg', '2025-07-14 12:03:35', '2025-07-14 12:03:35'),
(50, '1752514447.jpg', '2025-07-14 12:04:07', '2025-07-14 12:04:07'),
(51, '1752514495.jpg', '2025-07-14 12:04:55', '2025-07-14 12:04:55'),
(52, '1752514764.jpg', '2025-07-14 12:09:24', '2025-07-14 12:09:24'),
(53, '1752569774.jpg', '2025-07-15 03:26:14', '2025-07-15 03:26:14'),
(54, '1752569970.jpg', '2025-07-15 03:29:30', '2025-07-15 03:29:30'),
(55, '1752570287.jpg', '2025-07-15 03:34:47', '2025-07-15 03:34:47'),
(56, '1752570513.jpg', '2025-07-15 03:38:33', '2025-07-15 03:38:33'),
(57, '1752570657.jpg', '2025-07-15 03:40:57', '2025-07-15 03:40:57'),
(58, '1752579513.jpg', '2025-07-15 06:08:33', '2025-07-15 06:08:33'),
(59, '1752579538.jpg', '2025-07-15 06:08:58', '2025-07-15 06:08:58'),
(60, '1752579640.jpg', '2025-07-15 06:10:40', '2025-07-15 06:10:40'),
(61, '1752579684.jpg', '2025-07-15 06:11:24', '2025-07-15 06:11:24'),
(62, '1752579781.jpg', '2025-07-15 06:13:01', '2025-07-15 06:13:01'),
(63, '1752579879.jpg', '2025-07-15 06:14:39', '2025-07-15 06:14:39'),
(64, '1752579929.jpg', '2025-07-15 06:15:29', '2025-07-15 06:15:29'),
(65, '1752579957.jpg', '2025-07-15 06:15:57', '2025-07-15 06:15:57'),
(66, '1752580149.jpg', '2025-07-15 06:19:09', '2025-07-15 06:19:09'),
(67, '1752597560.jpg', '2025-07-15 11:09:20', '2025-07-15 11:09:20'),
(68, '1752597804.jpg', '2025-07-15 11:13:24', '2025-07-15 11:13:24'),
(69, '1752597858.jpg', '2025-07-15 11:14:18', '2025-07-15 11:14:18'),
(70, '1752598474.jpg', '2025-07-15 11:24:34', '2025-07-15 11:24:34'),
(71, '1752598491.jpg', '2025-07-15 11:24:51', '2025-07-15 11:24:51'),
(72, '1752939576.jpg', '2025-07-19 10:09:36', '2025-07-19 10:09:36'),
(73, '1752939646.jpg', '2025-07-19 10:10:46', '2025-07-19 10:10:46'),
(74, '1752939749.jpg', '2025-07-19 10:12:29', '2025-07-19 10:12:29'),
(75, '1752939788.jpg', '2025-07-19 10:13:08', '2025-07-19 10:13:08'),
(76, '1752939824.jpg', '2025-07-19 10:13:44', '2025-07-19 10:13:44'),
(77, '1752939856.jpg', '2025-07-19 10:14:16', '2025-07-19 10:14:16'),
(78, '1752939905.jpg', '2025-07-19 10:15:05', '2025-07-19 10:15:05'),
(79, '1752939940.jpg', '2025-07-19 10:15:40', '2025-07-19 10:15:40'),
(80, '1752940098.jpg', '2025-07-19 10:18:18', '2025-07-19 10:18:18'),
(81, '1752940267.jpg', '2025-07-19 10:21:07', '2025-07-19 10:21:07'),
(82, '1752940298.jpg', '2025-07-19 10:21:38', '2025-07-19 10:21:38'),
(83, '1752940378.jpg', '2025-07-19 10:22:58', '2025-07-19 10:22:58'),
(84, '1752940533.jpg', '2025-07-19 10:25:33', '2025-07-19 10:25:33'),
(85, '1752940576.jpg', '2025-07-19 10:26:16', '2025-07-19 10:26:16'),
(86, '1752940619.jpg', '2025-07-19 10:26:59', '2025-07-19 10:26:59'),
(87, '1752940659.jpg', '2025-07-19 10:27:39', '2025-07-19 10:27:39'),
(88, '1752940832.jpg', '2025-07-19 10:30:32', '2025-07-19 10:30:32'),
(89, '1752941178.jpg', '2025-07-19 10:36:18', '2025-07-19 10:36:18'),
(90, '1753097615.jpg', '2025-07-21 06:03:35', '2025-07-21 06:03:35'),
(91, '1753099212.jpg', '2025-07-21 06:30:12', '2025-07-21 06:30:12'),
(92, '1753123866.jpg', '2025-07-21 13:21:06', '2025-07-21 13:21:06');

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

CREATE TABLE `testimonials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `testimonial` text NOT NULL,
  `citation` varchar(255) NOT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `testimonials`
--

INSERT INTO `testimonials` (`id`, `testimonial`, `citation`, `designation`, `image`, `status`, `created_at`, `updated_at`) VALUES
(4, 'Blog tirle', 'Ravi kumar', 'Blog tirle', '17525706574.jpg', 1, '2025-07-14 11:49:02', '2025-07-15 03:40:57'),
(13, 'hi ravi kese ho', 'hi ravi kese ho', 'Music Teacher', '175251476613.jpg', 1, '2025-07-14 12:09:26', '2025-07-15 02:54:25');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
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

INSERT INTO `users` (`id`, `name`, `image`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(2, 'Ravi kumar', '1752903251.jpg', 'ravi@gmail.com', '2025-07-21 13:08:26', '$2y$12$cZ4JYF7nvomHp3BooOF2aeAL50hLLEXeXG6rusNeI/3NxexOiGXVu', 'kjrbv2nSwXttWNsCr79rm9vzZ27L5tpkDLFW9wBJ', '2025-07-04 05:59:50', '2025-07-21 13:08:26');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `temp_images`
--
ALTER TABLE `temp_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `articles`
--
ALTER TABLE `articles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=159;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `temp_images`
--
ALTER TABLE `temp_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT for table `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
