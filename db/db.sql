-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.24 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table cmp_vims.admins
CREATE TABLE IF NOT EXISTS `admins` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admins_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table cmp_vims.admins: ~0 rows (approximately)
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` (`id`, `name`, `email`, `email_verified_at`, `password`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'admin', 'admin@admin.com', NULL, '$2y$10$/RAIYjsr7bPGJ86akrETVOzkdWET0/Gc//1e5ho/SZIBkADYfvjBS', 1, NULL, '2019-10-29 00:00:00', '2019-12-22 15:28:47');
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;

-- Dumping structure for table cmp_vims.departments
CREATE TABLE IF NOT EXISTS `departments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `uploaded_by` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table cmp_vims.departments: ~3 rows (approximately)
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` (`id`, `dept_name`, `description`, `uploaded_by`, `status`, `created_at`, `updated_at`) VALUES
	(1, 'Electrical', 'Electrical', 1, 1, '2019-12-06 19:00:45', '2019-12-06 19:00:45'),
	(2, 'Accounts', 'Accounts', 1, 1, '2019-12-06 19:00:57', '2019-12-06 19:00:57'),
	(3, 'IT', 'IT', 1, 1, '2019-12-06 19:01:09', '2019-12-06 19:01:09');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;

-- Dumping structure for table cmp_vims.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table cmp_vims.failed_jobs: ~0 rows (approximately)
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;

-- Dumping structure for table cmp_vims.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- Dumping data for table cmp_vims.migrations: ~15 rows (approximately)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(2, '2014_10_12_100000_create_password_resets_table', 1),
	(3, '2019_08_19_000000_create_failed_jobs_table', 1),
	(4, '2019_10_29_115605_create_permission_tables', 1),
	(5, '2019_02_02_112609_create_settings_table', 2),
	(6, '2019_03_20_115129_create_news_table', 2),
	(7, '2019_09_07_111410_create_admins_table', 2),
	(12, '2019_11_29_215035_create_departments_table', 5),
	(14, '2014_10_12_000000_create_users_table', 6),
	(19, '2019_12_20_191313_create_request_problems_table', 7),
	(20, '2016_06_01_000001_create_oauth_auth_codes_table', 8),
	(21, '2016_06_01_000002_create_oauth_access_tokens_table', 8),
	(22, '2016_06_01_000003_create_oauth_refresh_tokens_table', 8),
	(23, '2016_06_01_000004_create_oauth_clients_table', 8),
	(24, '2016_06_01_000005_create_oauth_personal_access_clients_table', 8),
	(26, '2020_01_01_124010_create_products_table', 9);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Dumping structure for table cmp_vims.model_has_permissions
CREATE TABLE IF NOT EXISTS `model_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table cmp_vims.model_has_permissions: ~0 rows (approximately)
/*!40000 ALTER TABLE `model_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_has_permissions` ENABLE KEYS */;

-- Dumping structure for table cmp_vims.model_has_roles
CREATE TABLE IF NOT EXISTS `model_has_roles` (
  `role_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table cmp_vims.model_has_roles: ~0 rows (approximately)
/*!40000 ALTER TABLE `model_has_roles` DISABLE KEYS */;
INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
	(1, 'App\\Models\\Admin', 1);
/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;

-- Dumping structure for table cmp_vims.news
CREATE TABLE IF NOT EXISTS `news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `category` varchar(255) NOT NULL,
  `file_path` varchar(255) NOT NULL DEFAULT 'assets/images/blog/default_news_a.jpg',
  `uploaded_by` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- Dumping data for table cmp_vims.news: ~2 rows (approximately)
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` (`id`, `title`, `description`, `category`, `file_path`, `uploaded_by`, `status`, `created_at`, `updated_at`) VALUES
	(9, 'Inline validation is very easy to implement using the Architect Framework.', 'Inline validation is very easy to implement using the Architect Framework.', 'Latest News', 'assets/images/blog/1572428672.png', 1, 1, '2019-10-30 15:44:32', '2019-10-30 15:44:32'),
	(10, 'Inline validation is very easy to implement using the Architect Framework.', 'df', 'Latest News', 'assets/images/blog/default_news_a.jpg', 1, 1, '2019-10-30 15:53:08', '2019-10-30 15:54:12');
/*!40000 ALTER TABLE `news` ENABLE KEYS */;

-- Dumping structure for table cmp_vims.oauth_access_tokens
CREATE TABLE IF NOT EXISTS `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table cmp_vims.oauth_access_tokens: ~3 rows (approximately)
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;
INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
	('1de4d9ae3c2bbc70c3cf9983c5add881d0454f5f5bf4d129673f3c2bf18539d9de75cba72c4bea8e', 3, 1, 'MyApp', '[]', 0, '2020-01-01 12:11:50', '2020-01-01 12:11:50', '2021-01-01 12:11:50'),
	('d76f8ad316a9d962f71cbbac0b6b316fcddbaa9df4fe49f94bda007496d849551c3671f5338127fe', 3, 1, 'MyApp', '[]', 0, '2020-01-01 12:10:22', '2020-01-01 12:10:22', '2021-01-01 12:10:22'),
	('ff1eb00a278116e4eb6bc0b79f638be01f6df6d62d61f3ce1c76efc270d4e0a496f81a0adcc56b2e', 3, 1, 'MyApp', '[]', 0, '2020-01-01 12:12:28', '2020-01-01 12:12:28', '2021-01-01 12:12:28');
/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;

-- Dumping structure for table cmp_vims.oauth_auth_codes
CREATE TABLE IF NOT EXISTS `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table cmp_vims.oauth_auth_codes: ~0 rows (approximately)
/*!40000 ALTER TABLE `oauth_auth_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_auth_codes` ENABLE KEYS */;

-- Dumping structure for table cmp_vims.oauth_clients
CREATE TABLE IF NOT EXISTS `oauth_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table cmp_vims.oauth_clients: ~2 rows (approximately)
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;
INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
	(1, NULL, 'VIMS Personal Access Client', 'RV3pHfv0kilhfCd1d7SWuSTU6PhVmLlgsCTn61tF', 'http://localhost', 1, 0, 0, '2019-12-31 18:34:00', '2019-12-31 18:34:00'),
	(2, NULL, 'VIMS Password Grant Client', 'K5IT2n4JROSQzyanUqs2R1xhuPi2yVnNpZfxYZi7', 'http://localhost', 0, 1, 0, '2019-12-31 18:34:00', '2019-12-31 18:34:00');
/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;

-- Dumping structure for table cmp_vims.oauth_personal_access_clients
CREATE TABLE IF NOT EXISTS `oauth_personal_access_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_personal_access_clients_client_id_index` (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table cmp_vims.oauth_personal_access_clients: ~0 rows (approximately)
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;
INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
	(1, 1, '2019-12-31 18:34:00', '2019-12-31 18:34:00');
/*!40000 ALTER TABLE `oauth_personal_access_clients` ENABLE KEYS */;

-- Dumping structure for table cmp_vims.oauth_refresh_tokens
CREATE TABLE IF NOT EXISTS `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table cmp_vims.oauth_refresh_tokens: ~0 rows (approximately)
/*!40000 ALTER TABLE `oauth_refresh_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_refresh_tokens` ENABLE KEYS */;

-- Dumping structure for table cmp_vims.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table cmp_vims.password_resets: ~0 rows (approximately)
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Dumping structure for table cmp_vims.permissions
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- Dumping data for table cmp_vims.permissions: ~17 rows (approximately)
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
	(1, 'role-view', 'admin', '2019-10-29 15:49:04', '2019-10-30 18:14:13'),
	(2, 'role-create', 'admin', '2019-10-29 15:49:04', '2019-10-29 15:49:04'),
	(3, 'role-edit', 'admin', '2019-10-29 15:49:04', '2019-10-29 15:49:04'),
	(4, 'role-delete', 'admin', '2019-10-29 15:49:05', '2019-10-29 15:49:05'),
	(5, 'permission-view', 'admin', '2019-10-29 15:49:05', '2019-10-29 15:49:05'),
	(6, 'permission-create', 'admin', '2019-10-29 15:49:05', '2019-10-29 15:49:05'),
	(7, 'permission-edit', 'admin', '2019-10-29 15:49:05', '2019-10-29 15:49:05'),
	(8, 'permission-delete', 'admin', '2019-10-29 15:49:05', '2019-10-29 15:49:05'),
	(9, 'user-view', 'admin', '2019-10-29 15:49:05', '2019-10-29 15:49:05'),
	(10, 'user-create', 'admin', '2019-10-29 15:49:05', '2019-10-29 15:49:05'),
	(11, 'user-edit', 'admin', '2019-10-29 15:49:05', '2019-10-29 15:49:05'),
	(12, 'user-delete', 'admin', '2019-10-29 15:49:05', '2019-10-29 15:49:05'),
	(14, 'problem-create', 'admin', '2019-12-04 22:43:53', '2019-12-04 22:43:53'),
	(15, 'problem-edit', 'admin', '2019-12-04 22:44:12', '2019-12-04 22:44:12'),
	(16, 'problem-view', 'admin', '2019-12-04 22:44:23', '2019-12-04 22:44:23'),
	(17, 'problem-delete', 'admin', '2019-12-04 22:44:37', '2019-12-04 22:44:37'),
	(18, 'problem-reply', 'admin', '2019-12-04 22:45:44', '2019-12-04 22:45:44');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;

-- Dumping structure for table cmp_vims.products
CREATE TABLE IF NOT EXISTS `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `detail` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table cmp_vims.products: ~1 rows (approximately)
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` (`id`, `name`, `detail`, `created_at`, `updated_at`) VALUES
	(1, 'Men\'s Watch', 'A Luxary Men\'s Watch', '2020-01-01 13:05:06', '2020-01-01 13:05:07');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;

-- Dumping structure for table cmp_vims.request_problems
CREATE TABLE IF NOT EXISTS `request_problems` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `department_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  `notification` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table cmp_vims.request_problems: ~2 rows (approximately)
/*!40000 ALTER TABLE `request_problems` DISABLE KEYS */;
INSERT INTO `request_problems` (`id`, `title`, `description`, `department_id`, `user_id`, `file_path`, `status`, `notification`, `created_at`, `updated_at`) VALUES
	(2, 'Networking Problem', 'Can not connect all pcs to the network', 3, 3, 'assets/images/problems/1576857747.jpg', 'Working', 0, '2019-12-20 22:02:27', '2019-12-21 23:36:31'),
	(3, 'Internet Slow', 'The internet is very slow', 3, 3, NULL, 'Pending', 0, '2019-12-20 23:56:59', '2019-12-22 14:27:36');
/*!40000 ALTER TABLE `request_problems` ENABLE KEYS */;

-- Dumping structure for table cmp_vims.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table cmp_vims.roles: ~0 rows (approximately)
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
	(1, 'superadmin', 'admin', '2019-10-29 15:49:04', '2019-10-29 15:49:04');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;

-- Dumping structure for table cmp_vims.role_has_permissions
CREATE TABLE IF NOT EXISTS `role_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table cmp_vims.role_has_permissions: ~0 rows (approximately)
/*!40000 ALTER TABLE `role_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_has_permissions` ENABLE KEYS */;

-- Dumping structure for table cmp_vims.settings
CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `slogan` varchar(255) DEFAULT NULL,
  `reg` varchar(255) DEFAULT NULL,
  `stablished` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `favicon` varchar(255) DEFAULT NULL,
  `layout` varchar(255) NOT NULL DEFAULT '1',
  `running_year` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table cmp_vims.settings: ~0 rows (approximately)
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` (`id`, `name`, `slogan`, `reg`, `stablished`, `email`, `contact`, `address`, `website`, `logo`, `favicon`, `layout`, `running_year`, `created_at`, `updated_at`) VALUES
	(1, 'Admin Panel', 'Admin Panel', '12345', '1965', 'info@admin.com', '01851334237', 'Chittagong', 'http://www.w3xplorers.com', 'assets/images/logo/default.png', NULL, '1', '2018-2019', '2019-11-29 21:17:54', '2019-11-29 21:17:54');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;

-- Dumping structure for table cmp_vims.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `department_id` int(11) NOT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `user_type` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `file_path` varchar(255) DEFAULT 'assets/images/users/default.png',
  `status` tinyint(4) DEFAULT '1',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table cmp_vims.users: ~2 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `department_id`, `mobile`, `user_type`, `email`, `email_verified_at`, `password`, `file_path`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
	(2, 'Expert One', 3, '01851663453', 'Expert', 'expertone@admin.com', NULL, '$2y$10$09G4sjHxNT/Cmqq6KNdjJutxt/NDvNKs6I87TdT2bBeH7FwjJCj.C', 'assets/images/users/1575641949.png', 1, NULL, '2019-12-06 20:19:09', '2019-12-06 22:33:37'),
	(3, 'Member One', 3, '324243432', 'Members', 'userone@admin.com', NULL, '$2y$10$yzttZV7qXwJb56zD./Y/WOoxXMz5Kq2MConllQOBonBTlvKTsXlwy', 'assets/images/users/1575643723.png', 1, NULL, '2019-12-06 20:48:43', '2019-12-06 20:48:43');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
