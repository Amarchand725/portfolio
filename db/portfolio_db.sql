-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 12, 2023 at 01:38 PM
-- Server version: 8.0.27
-- PHP Version: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `portfolio_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `abouts`
--

DROP TABLE IF EXISTS `abouts`;
CREATE TABLE IF NOT EXISTS `abouts` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `tagline` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cv` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `abouts`
--

INSERT INTO `abouts` (`id`, `name`, `photo`, `email`, `phone`, `address`, `description`, `tagline`, `cv`, `created_at`, `updated_at`) VALUES
(1, 'Dolore maiores esse', 'photo.png', 'kizazi@mailinator.com', 'Quia sit exercitati', 'Voluptatem deserunt', 'Reprehenderit anim', 'Debitis reiciendis q', 'cv.png', NULL, '2023-01-08 14:25:47');

-- --------------------------------------------------------

--
-- Table structure for table `education`
--

DROP TABLE IF EXISTS `education`;
CREATE TABLE IF NOT EXISTS `education` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `institution` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `period` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `degree` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `department` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `education`
--

INSERT INTO `education` (`id`, `institution`, `period`, `degree`, `department`, `created_at`, `updated_at`) VALUES
(7, 'Germany-Institute', '2014 - 2017', 'Web Design', 'Web Design', '2023-01-12 07:53:51', '2023-01-12 07:53:51'),
(8, 'Germany-Institute', '2017 - 2019', 'Web Development', 'Web Development', '2023-01-12 07:54:18', '2023-01-12 07:54:18'),
(9, 'Germany-Institute', '2019 - 2021', 'Master in UI/UX', 'Master in UI/UX', '2023-01-12 07:54:49', '2023-01-12 07:54:49'),
(6, 'Germany-University', '2009 - 2014', 'Computer Science', 'IMCS', '2023-01-12 07:53:24', '2023-01-12 07:53:24');

-- --------------------------------------------------------

--
-- Table structure for table `experiences`
--

DROP TABLE IF EXISTS `experiences`;
CREATE TABLE IF NOT EXISTS `experiences` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `company` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `period` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
CREATE TABLE IF NOT EXISTS `messages` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `name`, `email`, `subject`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Jay Smith', 'customer@mail.com', 'Subject of message', 'Description of message', '0', '2023-01-12 07:04:58', '2023-01-12 07:04:58');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_01_07_142316_create_abouts_table', 2),
(6, '2023_01_09_114748_create_services_table', 3),
(7, '2023_01_09_233229_create_skills_table', 4),
(8, '2023_01_10_091850_create_education_table', 5),
(9, '2023_01_10_220907_create_experiences_table', 6),
(10, '2023_01_10_224610_create_projects_table', 6),
(11, '2023_01_11_121256_create_testimonials_table', 7),
(12, '2023_01_11_173334_create_messages_table', 8),
(13, '2023_01_11_184820_add_type_to_users_table', 8),
(14, '2023_01_11_185636_add_bio_to_users_table', 8),
(15, '2023_01_11_185849_add_photo_to_users_table', 8);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'MyApp', '8555e6f4c1caba8e18c38228a33b6f598529efaeecc4c22fbac854a293567533', '[\"*\"]', NULL, NULL, '2023-01-06 07:57:17', '2023-01-06 07:57:17'),
(2, 'App\\Models\\User', 1, 'MyApp', '3ae662e7536a663cad812b63a378d8dbf1c3060dea564196f95cea938cb7c8b7', '[\"*\"]', NULL, NULL, '2023-01-06 08:02:32', '2023-01-06 08:02:32'),
(3, 'App\\Models\\User', 1, 'MyApp', 'b4fa096ec68e246c360ab6b3f1bb973d3bdbc50ed441aba5242e0465462df731', '[\"*\"]', NULL, NULL, '2023-01-06 08:07:26', '2023-01-06 08:07:26'),
(4, 'App\\Models\\User', 1, 'MyApp', '69bea666f75f199ec0d9385af6a93769159e70f10c1e72d1a6615ae68d2fa6d5', '[\"*\"]', NULL, NULL, '2023-01-06 08:07:39', '2023-01-06 08:07:39'),
(5, 'App\\Models\\User', 1, 'MyApp', '906420b4fa252699d1856972524f6e5915b975c80740c2481363fad53e04c212', '[\"*\"]', NULL, NULL, '2023-01-06 08:24:19', '2023-01-06 08:24:19'),
(6, 'App\\Models\\User', 1, 'MyApp', '4d652665f85641c30f854f548c089d7730e14b1a479fc6a95f8596bf59c1a9a4', '[\"*\"]', NULL, NULL, '2023-01-06 08:40:17', '2023-01-06 08:40:17'),
(7, 'App\\Models\\User', 1, 'MyApp', '140cdb933965dbbb882401626bcd29c1cee97ea2f295d75cc2be5214d0899b21', '[\"*\"]', NULL, NULL, '2023-01-06 08:53:08', '2023-01-06 08:53:08'),
(8, 'App\\Models\\User', 1, 'MyApp', '4877a99bc5d2d98c0c946f5a1087ff99dabce6c3825878822e26ab2d4f98ff98', '[\"*\"]', NULL, NULL, '2023-01-06 08:53:38', '2023-01-06 08:53:38'),
(9, 'App\\Models\\User', 1, 'MyApp', '86f6e848032c8a9887db145e464f70e66dde10ddfc30fa2a326cab05a682ff6f', '[\"*\"]', NULL, NULL, '2023-01-06 08:56:24', '2023-01-06 08:56:24'),
(10, 'App\\Models\\User', 1, 'MyApp', 'ec872f1ed46422b083e51ef5365e7f9ce91384867898762044c5495ecc17af7b', '[\"*\"]', NULL, NULL, '2023-01-07 07:09:09', '2023-01-07 07:09:09'),
(11, 'App\\Models\\User', 1, 'MyApp', '07f5beefaada3a90c02f2578c7f4521ac12923c655ad7f82f9df4e6ea3ad34ad', '[\"*\"]', NULL, NULL, '2023-01-07 07:19:30', '2023-01-07 07:19:30'),
(12, 'App\\Models\\User', 1, 'MyApp', '3214400d57c4fb8a838ccb146df3a3459d3dd1864c5e6dc8efb65aa27220c9f0', '[\"*\"]', NULL, NULL, '2023-01-07 07:34:07', '2023-01-07 07:34:07'),
(13, 'App\\Models\\User', 1, 'MyApp', 'b0858965e04ea0dc94a4710402ef5c5a6d21608e0780ba7fd01c885ccfa2dd5d', '[\"*\"]', NULL, NULL, '2023-01-07 08:41:19', '2023-01-07 08:41:19'),
(14, 'App\\Models\\User', 1, 'MyApp', '6df48903f678388dc3f1dfc6e18a3b3cb7907cdc91593feb45f30cb428a6ae0a', '[\"*\"]', NULL, NULL, '2023-01-07 08:50:50', '2023-01-07 08:50:50'),
(15, 'App\\Models\\User', 1, 'MyApp', 'df68269a18833c82255800c310289300b4c3c7586ec38549c78c0973cfa91ab1', '[\"*\"]', NULL, NULL, '2023-01-07 09:10:43', '2023-01-07 09:10:43'),
(16, 'App\\Models\\User', 1, 'MyApp', 'bcf090915b3de0a17b1e007da236f5967696466ca25d3a64da5a3ce891d9bfc6', '[\"*\"]', NULL, NULL, '2023-01-07 09:13:38', '2023-01-07 09:13:38'),
(17, 'App\\Models\\User', 1, 'MyApp', 'f34b70b5640658d701b3c3ab0d68fd97143e284dfee1c687932a282291002fe4', '[\"*\"]', NULL, NULL, '2023-01-07 09:16:49', '2023-01-07 09:16:49'),
(18, 'App\\Models\\User', 1, 'MyApp', '4bb05117eb982391cb36d5962ca049d9d1baf277f610701e3b25939195b63f68', '[\"*\"]', NULL, NULL, '2023-01-07 09:20:13', '2023-01-07 09:20:13'),
(19, 'App\\Models\\User', 1, 'MyApp', '1884cb75fddff287cc94ef369aa61648a2c38faebade795b5902119ae77d4904', '[\"*\"]', NULL, NULL, '2023-01-08 09:57:25', '2023-01-08 09:57:25'),
(20, 'App\\Models\\User', 1, 'MyApp', 'c9af5b7bfb021d5731e783c6a7a1c3ccc27e7124460d6223a8c04c75485f87d3', '[\"*\"]', NULL, NULL, '2023-01-10 03:00:31', '2023-01-10 03:00:31');

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
CREATE TABLE IF NOT EXISTS `projects` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `title`, `description`, `link`, `photo`, `created_at`, `updated_at`) VALUES
(7, 'Modern Website', 'Lorem ipsum websites.', 'https://github.com/Amarchand725/portfolio', '1673528382.jpeg', '2023-01-12 07:59:42', '2023-01-12 07:59:42'),
(5, 'POS App', 'POS App Lorem ipsum', 'https://github.com/share-tutorials-dev', '1673528268.jpeg', '2023-01-12 07:57:48', '2023-01-12 07:57:48'),
(6, 'Online Store', 'Lorem ipsum', 'https://github.com/share-tutorials-dev', '1673528323.jpeg', '2023-01-12 07:58:43', '2023-01-12 07:58:43');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
CREATE TABLE IF NOT EXISTS `services` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `name`, `icon`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Frontend developer', 'fa fa-circle', 'More than 3 years', '2023-01-12 07:35:31', '2023-01-12 07:44:29'),
(2, 'Designer', 'fa fa-circle', 'More than 5 years', '2023-01-12 07:44:16', '2023-01-12 07:44:16'),
(3, 'Backend developer', 'fa fa-circle', 'More than 4 years', '2023-01-12 07:45:04', '2023-01-12 07:45:44');

-- --------------------------------------------------------

--
-- Table structure for table `skills`
--

DROP TABLE IF EXISTS `skills`;
CREATE TABLE IF NOT EXISTS `skills` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `service_id` int DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `proficiency` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `skills`
--

INSERT INTO `skills` (`id`, `service_id`, `name`, `proficiency`, `created_at`, `updated_at`) VALUES
(1, 1, 'HTML', 90, '2023-01-12 07:46:18', '2023-01-12 07:47:06'),
(2, 1, 'CSS', 80, '2023-01-12 07:46:39', '2023-01-12 07:46:39'),
(3, 1, 'JavaScript', 60, '2023-01-12 07:46:59', '2023-01-12 07:46:59'),
(4, 2, 'Figma', 90, '2023-01-12 07:48:21', '2023-01-12 07:48:21'),
(5, 2, 'Sketch', 85, '2023-01-12 07:48:37', '2023-01-12 07:48:37'),
(6, 2, 'Adobe XD', 80, '2023-01-12 07:48:56', '2023-01-12 07:48:56'),
(7, 2, 'Photoshop', 85, '2023-01-12 07:49:13', '2023-01-12 07:49:13'),
(8, 3, 'PHP', 80, '2023-01-12 07:49:36', '2023-01-12 07:49:36'),
(9, 3, 'Node J6', 80, '2023-01-12 07:49:50', '2023-01-12 07:49:50'),
(10, 3, 'Python', 60, '2023-01-12 07:50:06', '2023-01-12 07:50:06'),
(11, 3, 'Ruby', 55, '2023-01-12 07:50:20', '2023-01-12 07:50:20');

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

DROP TABLE IF EXISTS `testimonials`;
CREATE TABLE IF NOT EXISTS `testimonials` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `function` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `testinomy` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rating` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `testimonials`
--

INSERT INTO `testimonials` (`id`, `name`, `function`, `testinomy`, `rating`, `photo`, `created_at`, `updated_at`) VALUES
(2, 'Jay smith', 'Client', 'I get a good impression, I carry out my project with all the possible quality and attention and support 24 hours a day.', '4', '1673528833.jpeg', '2023-01-12 08:07:13', '2023-01-12 08:09:25'),
(3, 'John Smith', 'Client', 'Great job. I am impressed on this service. thanks a lot.', '5', '1673529081.jpeg', '2023-01-12 08:11:22', '2023-01-12 08:11:22'),
(4, 'Mike Smith', 'Client', 'Well done. I am so happy on your work superb job.', '5', '1673529155.jpeg', '2023-01-12 08:12:35', '2023-01-12 08:12:35');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bio` text COLLATE utf8mb4_unicode_ci,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `type`, `bio`, `photo`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'John Doe', NULL, 'High level experience in web design,fornt-en and backend development, producing quality work.', '1673527912.png', 'admin@mail.com', NULL, '$2y$10$RIb7a0DtrtrmUBw8oCgveeEd.F2md4vdwmZDr6XunhCYU/72FYgq2', NULL, '2023-01-06 08:02:32', '2023-01-12 07:51:53');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
