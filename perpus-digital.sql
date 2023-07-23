-- Adminer 4.8.1-dev MySQL 8.0.30 dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `books`;
CREATE TABLE `books` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint unsigned NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_books` int NOT NULL,
  `cover` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `author_id` int NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `books_slug_unique` (`slug`),
  KEY `books_category_id_foreign` (`category_id`),
  CONSTRAINT `books_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `books` (`id`, `title`, `slug`, `category_id`, `description`, `total_books`, `cover`, `file`, `author_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1,	'The Daily Stoic',	'the-daily-stoic-php4h',	1,	'The private diaries of one of Rome’s greatest emperors, the personal letters of one of Rome’s best playwrights and wisest power brokers, the lectures of a former slave and exile, turned influential teacher. Against all odds and the passing of some two millennia, these incredible documents survive. What do they say? Could these ancient and obscure pages really contain anything relevant to modern life? The answer, it turns out, is yes. They contain some of the greatest wisdom in the history of the world.',	100,	'assets/covers/hB5uGhlcT8YD2Fny8sHjaHAXy8ggThZcIy0Ym5aw.jpg',	'assets/files/The Daily Stoic.pdf',	2,	NULL,	'2023-07-23 02:01:57',	'2023-07-23 02:01:57'),
(2,	'The Daily Stoic',	'the-daily-stoic-ntdha',	1,	'The private diaries of one of Rome’s greatest emperors, the personal letters of one of Rome’s best playwrights and wisest power brokers, the lectures of a former slave and exile, turned influential teacher. Against all odds and the passing of some two millennia, these incredible documents survive. What do they say? Could these ancient and obscure pages really contain anything relevant to modern life? The answer, it turns out, is yes. They contain some of the greatest wisdom in the history of the world.',	100,	'assets/covers/V3Py5wY6iU1dzuvyuCeWMU6x9N4ToeNh3UTKt9lt.jpg',	'assets/files/The Daily Stoic.pdf',	2,	'2023-07-23 02:02:10',	'2023-07-23 02:01:58',	'2023-07-23 02:02:10'),
(3,	'Beginning AngularJS',	'beginning-angularjs-engvo',	2,	'If you want to learn AngularJS, then you will need to know JavaScript. However, you don’t have to be a JavaScript expert.',	10,	'assets/covers/snpJ0JK7Ya90yl0HfT5453iFHTGWshkE6RhTM8Hm.jpg',	'assets/files/Beginning AngularJS.pdf',	2,	NULL,	'2023-07-23 02:09:05',	'2023-07-23 02:09:05'),
(4,	'Romeo And Juliet',	'romeo-and-juliet-kwzbs',	3,	'Romeo and Juliet is a tragedy written by William Shakespeare early in his career about two young star-crossed lovers whose deaths ultimately reconcile their feuding families. It was among Shakespeare most popular plays during his lifetime and along with Hamlet, is one of his most frequently performed plays. Today, the title characters are regarded as archetypal young lovers.',	100,	'assets/covers/lmnmPpPFLQYWjm1si80pdRetvr8Qc17wC1kBtPLF.jpg',	'assets/files/Romeo And Juliet.pdf',	3,	NULL,	'2023-07-23 02:11:52',	'2023-07-23 02:11:52');

DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `categories` (`id`, `name`, `slug`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1,	'General',	'general-9kyea',	NULL,	'2023-07-23 01:57:25',	'2023-07-23 01:57:25'),
(2,	'Programming',	'programming-fncqj',	NULL,	'2023-07-23 02:06:50',	'2023-07-23 02:06:50'),
(3,	'Drama',	'drama-ewzpa',	NULL,	'2023-07-23 02:07:00',	'2023-07-23 02:10:58');

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1,	'2014_10_12_000000_create_users_table',	1),
(2,	'2014_10_12_100000_create_password_reset_tokens_table',	1),
(3,	'2014_10_12_200000_add_two_factor_columns_to_users_table',	1),
(4,	'2019_08_19_000000_create_failed_jobs_table',	1),
(5,	'2019_12_14_000001_create_personal_access_tokens_table',	1),
(6,	'2023_07_20_100112_create_sessions_table',	1),
(7,	'2023_07_20_101145_create_categories_table',	1),
(8,	'2023_07_20_101359_create_books_table',	1),
(9,	'2023_07_20_101740_add_roles_to_users_table',	1);

DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('FgDXdAtISAiJaduHDpb5AfRiPBMIK8i4ZkQcfrHc',	3,	'127.0.0.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36',	'YTo1OntzOjY6Il90b2tlbiI7czo0MDoicHRnZVV2Z2FpSkRDeHN5b0xIdkNiUnRRdE9hTU1rcVhhNDVpSWdHSCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9ib29rIjt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MztzOjIxOiJwYXNzd29yZF9oYXNoX3NhbmN0dW0iO3M6NjA6IiQyeSQxMCRNUUx1TmRBVHcycy9nZVdYdFpOOU9PWE54THpUdXhDRXVIOUJHdUVJSkI5dEJ1bmVKbGQ0aSI7fQ==',	1690103547),
('wrLu4hL5dVB1EeaDynH6x94AgENROqJU8c81sX9f',	NULL,	'127.0.0.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36',	'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNTQxM2NsRXhIVWswQ01JNG14UUZ5WWdBVjg5RDZlcER3akF2aDI1QiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9wZXJwdXMtZGlnaXRhbC50ZXN0L2xvZ2luIjt9fQ==',	1690102534);

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_team_id` bigint unsigned DEFAULT NULL,
  `profile_photo_path` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `roles` enum('admin','user') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `remember_token`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`, `roles`) VALUES
(1,	'Admin',	'admin@example.com',	'2023-07-23 01:50:32',	'$2y$10$t5Kc3c5mnZIowbToOovLx.TvXLAG6iSNlf2htya0.ZUNamzAfBbQa',	NULL,	NULL,	NULL,	'Qn1QpKInmRfSBJWi5h7rsJ4ULXXtNs69elmx8dRbuSHBR0NkjU0bshGhVwdQ',	NULL,	NULL,	'2023-07-23 01:50:32',	'2023-07-23 01:50:32',	'admin'),
(2,	'farino',	'farino@gmail.com',	NULL,	'$2y$10$60Lnweh6.e67yxD6oHoi3ud7vW16rCatqym8NVR35xA8PK5qGXT6C',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-07-23 01:55:09',	'2023-07-23 01:55:09',	'user'),
(3,	'joshua',	'josh@gmail.com',	NULL,	'$2y$10$MQLuNdATw2s/geWXtZN9OOXNxLzTuxCEuH9BGuEIJB9tBuneJld4i',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2023-07-23 02:09:52',	'2023-07-23 02:09:52',	'user');

-- 2023-07-23 09:13:33
