-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 12, 2023 at 11:16 PM
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
-- Database: `laravel_doccure`
--

-- --------------------------------------------------------

--
-- Table structure for table `adjusted_products`
--

CREATE TABLE `adjusted_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `adjustment_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `adjusted_products`
--

INSERT INTO `adjusted_products` (`id`, `adjustment_id`, `product_id`, `quantity`, `type`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 3, 'add', '2022-10-11 13:49:41', '2022-10-11 13:49:41'),
(8, 3, 3, 15, 'add', '2023-08-25 20:34:30', '2023-08-25 20:34:30');

-- --------------------------------------------------------

--
-- Table structure for table `adjustments`
--

CREATE TABLE `adjustments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `reference` varchar(255) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `adjustments`
--

INSERT INTO `adjustments` (`id`, `date`, `reference`, `note`, `created_at`, `updated_at`) VALUES
(1, '2022-10-11', 'ADJ-00001', NULL, '2022-10-11 13:49:41', '2022-10-11 13:49:41'),
(3, '2023-08-25', 'ADJ-00002', NULL, '2023-08-25 20:33:42', '2023-08-25 20:33:42');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_code` varchar(255) NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category_code`, `category_name`, `created_at`, `updated_at`) VALUES
(1, '1', 'mobile', '2022-10-07 18:21:19', '2022-10-07 18:21:19'),
(2, '2', 'laptop', '2022-10-07 18:21:35', '2022-10-07 18:21:35'),
(4, '666', 'hfghgfh', '2022-10-28 16:48:54', '2022-10-28 16:48:54'),
(5, 'yrt', 'bcvbcvb', '2022-10-28 16:49:06', '2022-10-28 16:49:06'),
(6, 'jhgjg', 'jghjgj', '2022-10-28 17:06:22', '2022-10-28 17:06:22'),
(7, 'vc', 'vc', '2022-10-28 17:07:38', '2022-10-28 17:07:38');

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `currency_name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `symbol` varchar(255) NOT NULL,
  `thousand_separator` varchar(255) NOT NULL,
  `decimal_separator` varchar(255) NOT NULL,
  `exchange_rate` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `currency_name`, `code`, `symbol`, `thousand_separator`, `decimal_separator`, `exchange_rate`, `created_at`, `updated_at`) VALUES
(1, 'US Dollar', 'USD', '$', ',', '.', NULL, '2022-10-07 18:00:08', '2022-10-07 18:00:08'),
(2, 'iraq dinar', 'IQD', 'IQD', ',', ',', NULL, '2022-10-07 18:03:08', '2022-10-07 19:54:09');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `customer_email` varchar(255) NOT NULL,
  `customer_phone` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `customer_name`, `customer_email`, `customer_phone`, `city`, `country`, `address`, `created_at`, `updated_at`) VALUES
(1, 'Rawezh ahmed', 'rawezh180@gmail.com', '07501520657', 'Qalat Dizah', 'Iraq', 'Iraq', '2022-10-07 18:28:48', '2022-10-07 18:28:48'),
(2, 'defualt', 'rawezh180@gmail.com', '7501520657', 'Qaladiza', 'Iraq', 'Qaladiza', '2023-08-25 20:00:12', '2023-08-25 20:00:12');

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `reference` varchar(255) NOT NULL,
  `details` text DEFAULT NULL,
  `amount` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expenses`
--

INSERT INTO `expenses` (`id`, `category_id`, `date`, `reference`, `details`, `amount`, `created_at`, `updated_at`) VALUES
(1, 1, '2022-10-11', 'EXP-00001', NULL, 50000000, '2022-10-11 14:12:21', '2022-10-11 14:12:21');

-- --------------------------------------------------------

--
-- Table structure for table `expense_categories`
--

CREATE TABLE `expense_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `category_description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expense_categories`
--

INSERT INTO `expense_categories` (`id`, `category_name`, `category_description`, `created_at`, `updated_at`) VALUES
(1, 'mobile', NULL, '2022-10-11 14:11:34', '2022-10-11 14:11:34'),
(2, 'laptop', NULL, '2022-10-11 14:11:39', '2022-10-11 14:11:39'),
(3, 'tv', NULL, '2022-10-11 14:11:54', '2022-10-11 14:11:54');

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
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) DEFAULT NULL,
  `collection_name` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `mime_type` varchar(255) DEFAULT NULL,
  `disk` varchar(255) NOT NULL,
  `conversions_disk` varchar(255) DEFAULT NULL,
  `size` bigint(20) UNSIGNED NOT NULL,
  `manipulations` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`manipulations`)),
  `custom_properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`custom_properties`)),
  `generated_conversions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`generated_conversions`)),
  `responsive_images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`responsive_images`)),
  `order_column` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `model_type`, `model_id`, `uuid`, `collection_name`, `name`, `file_name`, `mime_type`, `disk`, `conversions_disk`, `size`, `manipulations`, `custom_properties`, `generated_conversions`, `responsive_images`, `order_column`, `created_at`, `updated_at`) VALUES
(1, 'Modules\\Product\\Entities\\Product', 1, '3ce3811d-f67b-40aa-b7a9-86a5901dd10c', 'images', '1665156272', '1665156272.jpg', 'image/jpeg', 'public', 'public', 486277, '[]', '[]', '{\"thumb\":true}', '[]', 1, '2022-10-07 18:24:36', '2022-10-07 18:24:37'),
(2, 'Modules\\Product\\Entities\\Product', 2, 'aea650fd-f9a7-4bfd-8d2f-37ee3a4aaa81', 'images', '1665156327', '1665156327.jpg', 'image/jpeg', 'public', 'public', 486277, '[]', '[]', '{\"thumb\":true}', '[]', 2, '2022-10-07 18:25:34', '2022-10-07 18:25:34'),
(6, 'App\\Models\\User', 2, '5924ae03-d94f-4384-9630-7fa22f745d9d', 'avatars', '1666988000', '1666988000.jpg', 'image/jpeg', 'public', 'public', 245689, '[]', '[]', '[]', '[]', 1, '2022-10-28 17:13:23', '2022-10-28 17:13:23'),
(7, 'App\\Models\\Product', 3, '49a1d671-b0e7-4cc4-b1fd-e3e50293e09e', 'images', '1666992442', '1666992442.jpg', 'image/jpeg', 'public', 'public', 63544, '[]', '[]', '{\"thumb\":true}', '[]', 1, '2022-10-28 18:27:25', '2022-10-28 18:27:25');

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
(4, '2021_07_14_145038_create_categories_table', 1),
(5, '2021_07_14_145047_create_products_table', 1),
(6, '2021_07_15_211319_create_media_table', 1),
(7, '2021_07_16_010005_create_uploads_table', 1),
(8, '2021_07_16_220524_create_permission_tables', 1),
(9, '2021_07_22_003941_create_adjustments_table', 1),
(10, '2021_07_22_004043_create_adjusted_products_table', 1),
(11, '2021_07_28_192608_create_expense_categories_table', 1),
(12, '2021_07_28_192616_create_expenses_table', 1),
(13, '2021_07_29_165419_create_customers_table', 1),
(14, '2021_07_29_165440_create_suppliers_table', 1),
(15, '2021_07_31_015923_create_currencies_table', 1),
(16, '2021_07_31_140531_create_settings_table', 1),
(17, '2021_07_31_201003_create_sales_table', 1),
(18, '2021_07_31_212446_create_sale_details_table', 1),
(19, '2021_08_07_192203_create_sale_payments_table', 1),
(20, '2021_08_08_021108_create_purchases_table', 1),
(21, '2021_08_08_021131_create_purchase_payments_table', 1),
(22, '2021_08_08_021713_create_purchase_details_table', 1),
(23, '2021_08_08_175345_create_sale_returns_table', 1),
(24, '2021_08_08_175358_create_sale_return_details_table', 1),
(25, '2021_08_08_175406_create_sale_return_payments_table', 1),
(26, '2021_08_08_222603_create_purchase_returns_table', 1),
(27, '2021_08_08_222612_create_purchase_return_details_table', 1),
(28, '2021_08_08_222646_create_purchase_return_payments_table', 1),
(29, '2021_08_16_015031_create_quotations_table', 1),
(30, '2021_08_16_155013_create_quotation_details_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(2, 'App\\Models\\User', 2);

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
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'edit_own_profile', 'web', '2022-10-07 18:00:07', '2022-10-07 18:00:07'),
(2, 'access_user_management', 'web', '2022-10-07 18:00:07', '2022-10-07 18:00:07'),
(3, 'show_total_stats', 'web', '2022-10-07 18:00:07', '2022-10-07 18:00:07'),
(4, 'show_month_overview', 'web', '2022-10-07 18:00:07', '2022-10-07 18:00:07'),
(5, 'show_weekly_sales_purchases', 'web', '2022-10-07 18:00:07', '2022-10-07 18:00:07'),
(6, 'show_monthly_cashflow', 'web', '2022-10-07 18:00:07', '2022-10-07 18:00:07'),
(7, 'show_notifications', 'web', '2022-10-07 18:00:07', '2022-10-07 18:00:07'),
(8, 'access_products', 'web', '2022-10-07 18:00:07', '2022-10-07 18:00:07'),
(9, 'create_products', 'web', '2022-10-07 18:00:07', '2022-10-07 18:00:07'),
(10, 'show_products', 'web', '2022-10-07 18:00:07', '2022-10-07 18:00:07'),
(11, 'edit_products', 'web', '2022-10-07 18:00:07', '2022-10-07 18:00:07'),
(12, 'delete_products', 'web', '2022-10-07 18:00:07', '2022-10-07 18:00:07'),
(13, 'access_product_categories', 'web', '2022-10-07 18:00:07', '2022-10-07 18:00:07'),
(14, 'print_barcodes', 'web', '2022-10-07 18:00:07', '2022-10-07 18:00:07'),
(15, 'access_adjustments', 'web', '2022-10-07 18:00:07', '2022-10-07 18:00:07'),
(16, 'create_adjustments', 'web', '2022-10-07 18:00:07', '2022-10-07 18:00:07'),
(17, 'show_adjustments', 'web', '2022-10-07 18:00:07', '2022-10-07 18:00:07'),
(18, 'edit_adjustments', 'web', '2022-10-07 18:00:07', '2022-10-07 18:00:07'),
(19, 'delete_adjustments', 'web', '2022-10-07 18:00:07', '2022-10-07 18:00:07'),
(20, 'access_quotations', 'web', '2022-10-07 18:00:07', '2022-10-07 18:00:07'),
(21, 'create_quotations', 'web', '2022-10-07 18:00:07', '2022-10-07 18:00:07'),
(22, 'show_quotations', 'web', '2022-10-07 18:00:07', '2022-10-07 18:00:07'),
(23, 'edit_quotations', 'web', '2022-10-07 18:00:07', '2022-10-07 18:00:07'),
(24, 'delete_quotations', 'web', '2022-10-07 18:00:07', '2022-10-07 18:00:07'),
(25, 'create_quotation_sales', 'web', '2022-10-07 18:00:07', '2022-10-07 18:00:07'),
(26, 'send_quotation_mails', 'web', '2022-10-07 18:00:07', '2022-10-07 18:00:07'),
(27, 'access_expenses', 'web', '2022-10-07 18:00:07', '2022-10-07 18:00:07'),
(28, 'create_expenses', 'web', '2022-10-07 18:00:07', '2022-10-07 18:00:07'),
(29, 'edit_expenses', 'web', '2022-10-07 18:00:07', '2022-10-07 18:00:07'),
(30, 'delete_expenses', 'web', '2022-10-07 18:00:07', '2022-10-07 18:00:07'),
(31, 'access_expense_categories', 'web', '2022-10-07 18:00:07', '2022-10-07 18:00:07'),
(32, 'access_customers', 'web', '2022-10-07 18:00:07', '2022-10-07 18:00:07'),
(33, 'create_customers', 'web', '2022-10-07 18:00:07', '2022-10-07 18:00:07'),
(34, 'show_customers', 'web', '2022-10-07 18:00:07', '2022-10-07 18:00:07'),
(35, 'edit_customers', 'web', '2022-10-07 18:00:07', '2022-10-07 18:00:07'),
(36, 'delete_customers', 'web', '2022-10-07 18:00:07', '2022-10-07 18:00:07'),
(37, 'access_suppliers', 'web', '2022-10-07 18:00:07', '2022-10-07 18:00:07'),
(38, 'create_suppliers', 'web', '2022-10-07 18:00:07', '2022-10-07 18:00:07'),
(39, 'show_suppliers', 'web', '2022-10-07 18:00:07', '2022-10-07 18:00:07'),
(40, 'edit_suppliers', 'web', '2022-10-07 18:00:07', '2022-10-07 18:00:07'),
(41, 'delete_suppliers', 'web', '2022-10-07 18:00:07', '2022-10-07 18:00:07'),
(42, 'access_sales', 'web', '2022-10-07 18:00:07', '2022-10-07 18:00:07'),
(43, 'create_sales', 'web', '2022-10-07 18:00:07', '2022-10-07 18:00:07'),
(44, 'show_sales', 'web', '2022-10-07 18:00:07', '2022-10-07 18:00:07'),
(45, 'edit_sales', 'web', '2022-10-07 18:00:07', '2022-10-07 18:00:07'),
(46, 'delete_sales', 'web', '2022-10-07 18:00:07', '2022-10-07 18:00:07'),
(47, 'create_pos_sales', 'web', '2022-10-07 18:00:07', '2022-10-07 18:00:07'),
(48, 'access_sale_payments', 'web', '2022-10-07 18:00:07', '2022-10-07 18:00:07'),
(49, 'access_sale_returns', 'web', '2022-10-07 18:00:08', '2022-10-07 18:00:08'),
(50, 'create_sale_returns', 'web', '2022-10-07 18:00:08', '2022-10-07 18:00:08'),
(51, 'show_sale_returns', 'web', '2022-10-07 18:00:08', '2022-10-07 18:00:08'),
(52, 'edit_sale_returns', 'web', '2022-10-07 18:00:08', '2022-10-07 18:00:08'),
(53, 'delete_sale_returns', 'web', '2022-10-07 18:00:08', '2022-10-07 18:00:08'),
(54, 'access_sale_return_payments', 'web', '2022-10-07 18:00:08', '2022-10-07 18:00:08'),
(55, 'access_purchases', 'web', '2022-10-07 18:00:08', '2022-10-07 18:00:08'),
(56, 'create_purchases', 'web', '2022-10-07 18:00:08', '2022-10-07 18:00:08'),
(57, 'show_purchases', 'web', '2022-10-07 18:00:08', '2022-10-07 18:00:08'),
(58, 'edit_purchases', 'web', '2022-10-07 18:00:08', '2022-10-07 18:00:08'),
(59, 'delete_purchases', 'web', '2022-10-07 18:00:08', '2022-10-07 18:00:08'),
(60, 'access_purchase_payments', 'web', '2022-10-07 18:00:08', '2022-10-07 18:00:08'),
(61, 'access_purchase_returns', 'web', '2022-10-07 18:00:08', '2022-10-07 18:00:08'),
(62, 'create_purchase_returns', 'web', '2022-10-07 18:00:08', '2022-10-07 18:00:08'),
(63, 'show_purchase_returns', 'web', '2022-10-07 18:00:08', '2022-10-07 18:00:08'),
(64, 'edit_purchase_returns', 'web', '2022-10-07 18:00:08', '2022-10-07 18:00:08'),
(65, 'delete_purchase_returns', 'web', '2022-10-07 18:00:08', '2022-10-07 18:00:08'),
(66, 'access_purchase_return_payments', 'web', '2022-10-07 18:00:08', '2022-10-07 18:00:08'),
(67, 'access_reports', 'web', '2022-10-07 18:00:08', '2022-10-07 18:00:08'),
(68, 'access_currencies', 'web', '2022-10-07 18:00:08', '2022-10-07 18:00:08'),
(69, 'create_currencies', 'web', '2022-10-07 18:00:08', '2022-10-07 18:00:08'),
(70, 'edit_currencies', 'web', '2022-10-07 18:00:08', '2022-10-07 18:00:08'),
(71, 'delete_currencies', 'web', '2022-10-07 18:00:08', '2022-10-07 18:00:08'),
(72, 'access_settings', 'web', '2022-10-07 18:00:08', '2022-10-07 18:00:08');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_code` varchar(255) DEFAULT NULL,
  `product_barcode_symbology` varchar(255) DEFAULT NULL,
  `product_quantity` int(11) NOT NULL,
  `product_cost` int(11) NOT NULL,
  `product_price` int(11) NOT NULL,
  `product_unit` varchar(255) DEFAULT NULL,
  `product_stock_alert` int(11) NOT NULL,
  `product_order_tax` int(11) DEFAULT NULL,
  `product_tax_type` tinyint(4) DEFAULT NULL,
  `product_note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `product_name`, `product_code`, `product_barcode_symbology`, `product_quantity`, `product_cost`, `product_price`, `product_unit`, `product_stock_alert`, `product_order_tax`, `product_tax_type`, `product_note`, `created_at`, `updated_at`) VALUES
(1, 1, 'samsung s21', '123', 'C128', 40, 90000, 100000, 'dana', 10, NULL, 1, NULL, '2022-10-07 18:24:36', '2023-08-27 08:58:56'),
(2, 1, 'samsung s22', '1234', 'C128', 6, 80000, 90000, 'dana', 5, NULL, NULL, NULL, '2022-10-07 18:25:34', '2022-10-11 13:46:03'),
(3, 1, 'samsung s214', '444', 'EAN8', 10, 5555, 5555, 'dana', 5, NULL, NULL, NULL, '2022-10-28 18:27:25', '2023-08-26 08:39:31'),
(4, 1, 'test Product', '13143', 'C128', 298, 1000, 2000, 'dana', 10, NULL, NULL, NULL, '2023-08-25 19:43:28', '2023-08-25 20:30:41');

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `reference` varchar(255) NOT NULL,
  `supplier_id` bigint(20) UNSIGNED DEFAULT NULL,
  `supplier_name` varchar(255) NOT NULL,
  `tax_percentage` int(11) NOT NULL DEFAULT 0,
  `tax_amount` int(11) NOT NULL DEFAULT 0,
  `discount_percentage` int(11) NOT NULL DEFAULT 0,
  `discount_amount` int(11) NOT NULL DEFAULT 0,
  `shipping_amount` int(11) NOT NULL DEFAULT 0,
  `total_amount` int(11) NOT NULL,
  `paid_amount` int(11) NOT NULL,
  `due_amount` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `payment_status` varchar(255) NOT NULL,
  `payment_method` varchar(255) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchases`
--

INSERT INTO `purchases` (`id`, `date`, `reference`, `supplier_id`, `supplier_name`, `tax_percentage`, `tax_amount`, `discount_percentage`, `discount_amount`, `shipping_amount`, `total_amount`, `paid_amount`, `due_amount`, `status`, `payment_status`, `payment_method`, `note`, `created_at`, `updated_at`) VALUES
(1, '2022-10-11', 'PR-00001', 1, 'rawezh310', 0, 0, 0, 0, 0, 200000, 200000, 0, 'Completed', 'Paid', 'Cash', NULL, '2022-10-11 14:04:16', '2022-10-11 14:05:30'),
(2, '2023-08-25', 'PR-00002', 1, 'rawezh310', 0, 0, 0, 0, 0, 18000, 0, 18000, 'Completed', 'Unpaid', 'Cash', NULL, '2023-08-25 19:55:31', '2023-08-25 19:55:31'),
(3, '2023-08-25', 'PR-00003', 1, 'rawezh310', 0, 0, 0, 0, 0, 18000, 0, 18000, 'Completed', 'Unpaid', 'Cash', NULL, '2023-08-25 19:58:58', '2023-08-25 19:59:06'),
(4, '2023-08-27', 'PR-00004', 1, 'rawezh310', 0, 0, 0, 0, 0, 1000000, 0, 1000000, 'Completed', 'Unpaid', 'Cash', NULL, '2023-08-27 08:57:46', '2023-08-27 08:57:46');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_details`
--

CREATE TABLE `purchase_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `purchase_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_code` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `unit_price` int(11) NOT NULL,
  `sub_total` int(11) NOT NULL,
  `product_discount_amount` int(11) NOT NULL,
  `product_discount_type` varchar(255) NOT NULL DEFAULT 'fixed',
  `product_tax_amount` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchase_details`
--

INSERT INTO `purchase_details` (`id`, `purchase_id`, `product_id`, `product_name`, `product_code`, `quantity`, `price`, `unit_price`, `sub_total`, `product_discount_amount`, `product_discount_type`, `product_tax_amount`, `created_at`, `updated_at`) VALUES
(2, 1, 1, 'samsung s21', '123', 2, 100000, 100000, 200000, 0, 'fixed', 0, '2022-10-11 14:05:30', '2022-10-11 14:05:30'),
(3, 2, 4, 'test Product', '13143', 9, 2000, 2000, 2000, 0, 'fixed', 0, '2023-08-25 19:55:31', '2023-08-25 19:55:31'),
(5, 3, 4, 'test Product', '13143', 9, 2000, 2000, 2000, 0, 'fixed', 0, '2023-08-25 19:59:06', '2023-08-25 19:59:06'),
(6, 4, 1, 'samsung s21', '123', 10, 100000, 100000, 100000, 0, 'fixed', 0, '2023-08-27 08:57:46', '2023-08-27 08:57:46');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_payments`
--

CREATE TABLE `purchase_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `purchase_id` bigint(20) UNSIGNED NOT NULL,
  `amount` int(11) NOT NULL,
  `date` date NOT NULL,
  `reference` varchar(255) NOT NULL,
  `payment_method` varchar(255) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchase_payments`
--

INSERT INTO `purchase_payments` (`id`, `purchase_id`, `amount`, `date`, `reference`, `payment_method`, `note`, `created_at`, `updated_at`) VALUES
(1, 1, 100000, '2022-10-11', 'INV/PR-00001', 'Cash', NULL, '2022-10-11 14:04:16', '2022-10-11 14:04:16'),
(2, 1, 50000, '2022-10-11', 'INV/PR-00001', 'Cash', NULL, '2022-10-11 14:04:44', '2022-10-11 14:04:44'),
(3, 1, 50000, '2022-10-11', 'INV/PR-00001', 'Cash', NULL, '2022-10-11 14:05:09', '2022-10-11 14:05:09');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_returns`
--

CREATE TABLE `purchase_returns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `reference` varchar(255) NOT NULL,
  `supplier_id` bigint(20) UNSIGNED DEFAULT NULL,
  `supplier_name` varchar(255) NOT NULL,
  `tax_percentage` int(11) NOT NULL DEFAULT 0,
  `tax_amount` int(11) NOT NULL DEFAULT 0,
  `discount_percentage` int(11) NOT NULL DEFAULT 0,
  `discount_amount` int(11) NOT NULL DEFAULT 0,
  `shipping_amount` int(11) NOT NULL DEFAULT 0,
  `total_amount` int(11) NOT NULL,
  `paid_amount` int(11) NOT NULL,
  `due_amount` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `payment_status` varchar(255) NOT NULL,
  `payment_method` varchar(255) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchase_returns`
--

INSERT INTO `purchase_returns` (`id`, `date`, `reference`, `supplier_id`, `supplier_name`, `tax_percentage`, `tax_amount`, `discount_percentage`, `discount_amount`, `shipping_amount`, `total_amount`, `paid_amount`, `due_amount`, `status`, `payment_status`, `payment_method`, `note`, `created_at`, `updated_at`) VALUES
(1, '2022-10-11', 'PRRN-00001', 1, 'rawezh310', 0, 0, 0, 0, 0, 100000, 100000, 0, 'Completed', 'Paid', 'Cash', NULL, '2022-10-11 14:07:44', '2022-10-11 14:07:44'),
(2, '2023-08-25', 'PRRN-00002', 1, 'rawezh310', 0, 0, 0, 0, 0, 18000, 0, 18000, 'Completed', 'Unpaid', 'Cash', NULL, '2023-08-25 19:58:08', '2023-08-25 19:58:08');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_return_details`
--

CREATE TABLE `purchase_return_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `purchase_return_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_code` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `unit_price` int(11) NOT NULL,
  `sub_total` int(11) NOT NULL,
  `product_discount_amount` int(11) NOT NULL,
  `product_discount_type` varchar(255) NOT NULL DEFAULT 'fixed',
  `product_tax_amount` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchase_return_details`
--

INSERT INTO `purchase_return_details` (`id`, `purchase_return_id`, `product_id`, `product_name`, `product_code`, `quantity`, `price`, `unit_price`, `sub_total`, `product_discount_amount`, `product_discount_type`, `product_tax_amount`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'samsung s21', '123', 1, 100000, 100000, 100000, 0, 'fixed', 0, '2022-10-11 14:07:44', '2022-10-11 14:07:44'),
(2, 2, 4, 'test Product', '13143', 9, 2000, 2000, 2000, 0, 'fixed', 0, '2023-08-25 19:58:08', '2023-08-25 19:58:08');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_return_payments`
--

CREATE TABLE `purchase_return_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `purchase_return_id` bigint(20) UNSIGNED NOT NULL,
  `amount` int(11) NOT NULL,
  `date` date NOT NULL,
  `reference` varchar(255) NOT NULL,
  `payment_method` varchar(255) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchase_return_payments`
--

INSERT INTO `purchase_return_payments` (`id`, `purchase_return_id`, `amount`, `date`, `reference`, `payment_method`, `note`, `created_at`, `updated_at`) VALUES
(1, 1, 100000, '2022-10-11', 'INV/PRRN-00001', 'Cash', NULL, '2022-10-11 14:07:44', '2022-10-11 14:07:44');

-- --------------------------------------------------------

--
-- Table structure for table `quotations`
--

CREATE TABLE `quotations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `reference` varchar(255) NOT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_name` varchar(255) NOT NULL,
  `tax_percentage` int(11) NOT NULL DEFAULT 0,
  `tax_amount` int(11) NOT NULL DEFAULT 0,
  `discount_percentage` int(11) NOT NULL DEFAULT 0,
  `discount_amount` int(11) NOT NULL DEFAULT 0,
  `shipping_amount` int(11) NOT NULL DEFAULT 0,
  `total_amount` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `quotations`
--

INSERT INTO `quotations` (`id`, `date`, `reference`, `customer_id`, `customer_name`, `tax_percentage`, `tax_amount`, `discount_percentage`, `discount_amount`, `shipping_amount`, `total_amount`, `status`, `note`, `created_at`, `updated_at`) VALUES
(1, '2022-10-11', 'QT-00001', 1, 'Rawezh ahmed', 0, 0, 0, 0, 0, 300000, 'Sent', NULL, '2022-10-11 13:54:15', '2022-10-11 13:54:15'),
(2, '2023-08-25', 'QT-00002', 1, 'Rawezh ahmed', 0, 0, 0, 0, 0, 20000, 'Pending', NULL, '2023-08-25 20:29:50', '2023-08-25 20:29:50'),
(3, '2023-08-25', 'QT-00003', 1, 'Rawezh ahmed', 0, 0, 0, 0, 0, 5555, 'Pending', NULL, '2023-08-25 20:31:34', '2023-08-25 20:31:34');

-- --------------------------------------------------------

--
-- Table structure for table `quotation_details`
--

CREATE TABLE `quotation_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `quotation_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_code` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `unit_price` int(11) NOT NULL,
  `sub_total` int(11) NOT NULL,
  `product_discount_amount` int(11) NOT NULL,
  `product_discount_type` varchar(255) NOT NULL DEFAULT 'fixed',
  `product_tax_amount` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `quotation_details`
--

INSERT INTO `quotation_details` (`id`, `quotation_id`, `product_id`, `product_name`, `product_code`, `quantity`, `price`, `unit_price`, `sub_total`, `product_discount_amount`, `product_discount_type`, `product_tax_amount`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'samsung s21', '123', 3, 100000, 100000, 300000, 0, 'fixed', 0, '2022-10-11 13:54:15', '2022-10-11 13:54:15'),
(2, 2, 4, 'test Product', '13143', 10, 2000, 2000, 2000, 0, 'fixed', 0, '2023-08-25 20:29:50', '2023-08-25 20:29:50'),
(3, 3, 3, 'samsung s214', '444', 1, 5555, 5555, 5555, 0, 'fixed', 0, '2023-08-25 20:31:34', '2023-08-25 20:31:34');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'web', '2022-10-07 18:00:08', '2022-10-07 18:00:08'),
(2, 'Super Admin', 'web', '2022-10-07 18:00:08', '2022-10-07 18:00:08'),
(3, 'yy', 'web', '2022-10-28 17:15:32', '2022-10-28 17:15:32');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(3, 1),
(3, 3),
(4, 1),
(4, 3),
(5, 1),
(5, 3),
(6, 1),
(6, 3),
(7, 1),
(7, 3),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(62, 1),
(63, 1),
(64, 1),
(65, 1),
(66, 1),
(67, 1),
(68, 1),
(69, 1),
(70, 1),
(71, 1),
(72, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `reference` varchar(255) NOT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_name` varchar(255) NOT NULL,
  `tax_percentage` int(11) NOT NULL DEFAULT 0,
  `tax_amount` int(11) NOT NULL DEFAULT 0,
  `discount_percentage` int(11) NOT NULL DEFAULT 0,
  `discount_amount` int(11) NOT NULL DEFAULT 0,
  `shipping_amount` int(11) NOT NULL DEFAULT 0,
  `total_amount` int(11) NOT NULL,
  `paid_amount` int(11) NOT NULL,
  `due_amount` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `payment_status` varchar(255) NOT NULL,
  `payment_method` varchar(255) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `date`, `reference`, `customer_id`, `customer_name`, `tax_percentage`, `tax_amount`, `discount_percentage`, `discount_amount`, `shipping_amount`, `total_amount`, `paid_amount`, `due_amount`, `status`, `payment_status`, `payment_method`, `note`, `created_at`, `updated_at`) VALUES
(1, '2022-10-07', 'SL-00001', 1, 'Rawezh ahmed', 0, 0, 0, 0, 0, 290000, 290000, 0, 'Completed', 'Paid', 'Cash', NULL, '2022-10-07 18:55:10', '2022-10-07 18:57:17'),
(2, '2022-10-07', 'SL-00002', 1, 'Rawezh ahmed', 0, 0, 0, 0, 0, 280000, 280000, 0, 'Completed', 'Paid', 'Cash', NULL, '2022-10-07 19:53:15', '2022-10-11 14:16:08'),
(3, '2022-10-11', 'SL-00003', 1, 'Rawezh ahmed', 0, 0, 0, 0, 0, 90000, 90000, 0, 'Completed', 'Paid', 'Other', NULL, '2022-10-11 13:46:03', '2022-10-11 14:16:00'),
(4, '2022-10-11', 'SL-00004', 1, 'Rawezh ahmed', 0, 0, 0, 0, 0, 300000, 300000, 0, 'Completed', 'Paid', 'Cash', NULL, '2022-10-11 13:57:22', '2022-10-11 14:13:53'),
(5, '2023-08-25', 'SL-00005', 2, 'defualt', 0, 0, 0, 0, 0, 2000, 2000, 0, 'Completed', 'Paid', 'Cash', 'test', '2023-08-25 20:02:31', '2023-08-25 20:02:31'),
(6, '2023-08-25', 'SL-00006', 2, 'defualt', 0, 0, 0, 0, 0, 22220, 22220, 0, 'Completed', 'Paid', 'Cash', NULL, '2023-08-25 20:16:53', '2023-08-25 20:16:53'),
(7, '2023-08-25', 'SL-00007', 1, 'Rawezh ahmed', 0, 0, 0, 0, 0, 20000, 20000, 0, 'Completed', 'Paid', 'Cash', NULL, '2023-08-25 20:30:41', '2023-08-25 20:30:41'),
(8, '2023-08-25', 'SL-00008', 1, 'Rawezh ahmed', 0, 0, 0, 0, 0, 5555, 5500, 55, 'Completed', 'Partial', 'Cash', NULL, '2023-08-25 20:32:15', '2023-08-25 20:32:15'),
(9, '2023-08-25', 'SL-00009', 1, 'Rawezh ahmed', 0, 0, 0, 0, 0, 5555, 5600, -45, 'Completed', 'Paid', 'Cash', NULL, '2023-08-25 20:32:40', '2023-08-25 20:32:40'),
(10, '2023-08-26', 'SL-00010', 2, 'defualt', 0, 0, 0, 0, 0, 22220, 22220, 0, 'Completed', 'Paid', 'Cash', NULL, '2023-08-26 08:39:31', '2023-08-26 08:39:31'),
(11, '2023-08-27', 'SL-00011', 1, 'Rawezh ahmed', 0, 0, 0, 0, 0, 500000, 500000, 0, 'Completed', 'Paid', 'Cash', NULL, '2023-08-27 08:58:56', '2023-08-27 08:58:56');

-- --------------------------------------------------------

--
-- Table structure for table `sale_details`
--

CREATE TABLE `sale_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sale_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_code` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `unit_price` int(11) NOT NULL,
  `sub_total` int(11) NOT NULL,
  `product_discount_amount` int(11) NOT NULL,
  `product_discount_type` varchar(255) NOT NULL DEFAULT 'fixed',
  `product_tax_amount` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sale_details`
--

INSERT INTO `sale_details` (`id`, `sale_id`, `product_id`, `product_name`, `product_code`, `quantity`, `price`, `unit_price`, `sub_total`, `product_discount_amount`, `product_discount_type`, `product_tax_amount`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 'samsung s22', '1234', 1, 90000, 90000, 90000, 0, 'fixed', 0, '2022-10-07 18:55:10', '2022-10-07 18:55:10'),
(2, 1, 1, 'samsung s21', '123', 2, 100000, 100000, 200000, 0, 'fixed', 0, '2022-10-07 18:55:10', '2022-10-07 18:55:10'),
(3, 2, 2, 'samsung s22', '1234', 2, 90000, 90000, 90000, 0, 'fixed', 0, '2022-10-07 19:53:15', '2022-10-07 19:53:15'),
(4, 2, 1, 'samsung s21', '123', 1, 100000, 100000, 100000, 0, 'fixed', 0, '2022-10-07 19:53:15', '2022-10-07 19:53:15'),
(5, 3, 2, 'samsung s22', '1234', 1, 90000, 90000, 90000, 0, 'fixed', 0, '2022-10-11 13:46:03', '2022-10-11 13:46:03'),
(7, 4, 1, 'samsung s21', '123', 3, 100000, 100000, 300000, 0, 'fixed', 0, '2022-10-11 14:13:53', '2022-10-11 14:13:53'),
(8, 5, 4, 'test Product', '13143', 1, 2000, 2000, 2000, 0, 'fixed', 0, '2023-08-25 20:02:31', '2023-08-25 20:02:31'),
(9, 6, 3, 'samsung s214', '444', 4, 5555, 5555, 5555, 0, 'fixed', 0, '2023-08-25 20:16:53', '2023-08-25 20:16:53'),
(10, 7, 4, 'test Product', '13143', 10, 2000, 2000, 2000, 0, 'fixed', 0, '2023-08-25 20:30:41', '2023-08-25 20:30:41'),
(11, 8, 3, 'samsung s214', '444', 1, 5555, 5555, 5555, 0, 'fixed', 0, '2023-08-25 20:32:15', '2023-08-25 20:32:15'),
(12, 9, 3, 'samsung s214', '444', 1, 5555, 5555, 5555, 0, 'fixed', 0, '2023-08-25 20:32:40', '2023-08-25 20:32:40'),
(13, 10, 3, 'samsung s214', '444', 4, 5555, 5555, 5555, 0, 'fixed', 0, '2023-08-26 08:39:31', '2023-08-26 08:39:31'),
(14, 11, 1, 'samsung s21', '123', 5, 100000, 100000, 100000, 0, 'fixed', 0, '2023-08-27 08:58:56', '2023-08-27 08:58:56');

-- --------------------------------------------------------

--
-- Table structure for table `sale_payments`
--

CREATE TABLE `sale_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sale_id` bigint(20) UNSIGNED NOT NULL,
  `amount` int(11) NOT NULL,
  `date` date NOT NULL,
  `reference` varchar(255) NOT NULL,
  `payment_method` varchar(255) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sale_payments`
--

INSERT INTO `sale_payments` (`id`, `sale_id`, `amount`, `date`, `reference`, `payment_method`, `note`, `created_at`, `updated_at`) VALUES
(1, 1, 90000, '2022-10-07', 'INV/SL-00001', 'Cash', NULL, '2022-10-07 18:55:10', '2022-10-07 18:55:10'),
(2, 1, 200000, '2022-10-07', 'INV/SL-00001', 'Cash', NULL, '2022-10-07 18:57:17', '2022-10-07 18:57:17'),
(3, 2, 200000, '2022-10-07', 'INV/SL-00002', 'Cash', NULL, '2022-10-07 19:53:15', '2022-10-07 19:53:15'),
(4, 3, 5000, '2022-10-11', 'INV/SL-00003', 'Other', NULL, '2022-10-11 13:46:03', '2022-10-11 13:46:03'),
(5, 4, 300000, '2022-10-11', 'INV/SL-00004', 'Cash', NULL, '2022-10-11 13:58:52', '2022-10-11 13:58:52'),
(6, 3, 5000, '2022-10-11', 'INV/SL-00003', 'Cash', NULL, '2022-10-11 13:59:54', '2022-10-11 13:59:54'),
(7, 3, 80000, '2022-10-11', 'INV/SL-00003', 'Cash', NULL, '2022-10-11 14:16:00', '2022-10-11 14:16:00'),
(8, 2, 80000, '2022-10-11', 'INV/SL-00002', 'Cash', NULL, '2022-10-11 14:16:08', '2022-10-11 14:16:08'),
(9, 5, 2000, '2023-08-25', 'INV/SL-00005', 'Cash', NULL, '2023-08-25 20:02:31', '2023-08-25 20:02:31'),
(10, 6, 22220, '2023-08-25', 'INV/SL-00006', 'Cash', NULL, '2023-08-25 20:16:53', '2023-08-25 20:16:53'),
(11, 7, 20000, '2023-08-25', 'INV/SL-00007', 'Cash', NULL, '2023-08-25 20:30:41', '2023-08-25 20:30:41'),
(12, 8, 5500, '2023-08-25', 'INV/SL-00008', 'Cash', NULL, '2023-08-25 20:32:15', '2023-08-25 20:32:15'),
(13, 9, 5600, '2023-08-25', 'INV/SL-00009', 'Cash', NULL, '2023-08-25 20:32:40', '2023-08-25 20:32:40'),
(14, 10, 22220, '2023-08-26', 'INV/SL-00010', 'Cash', NULL, '2023-08-26 08:39:31', '2023-08-26 08:39:31'),
(15, 11, 500000, '2023-08-27', 'INV/SL-00011', 'Cash', NULL, '2023-08-27 08:58:56', '2023-08-27 08:58:56');

-- --------------------------------------------------------

--
-- Table structure for table `sale_returns`
--

CREATE TABLE `sale_returns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `reference` varchar(255) NOT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_name` varchar(255) NOT NULL,
  `tax_percentage` int(11) NOT NULL DEFAULT 0,
  `tax_amount` int(11) NOT NULL DEFAULT 0,
  `discount_percentage` int(11) NOT NULL DEFAULT 0,
  `discount_amount` int(11) NOT NULL DEFAULT 0,
  `shipping_amount` int(11) NOT NULL DEFAULT 0,
  `total_amount` int(11) NOT NULL,
  `paid_amount` int(11) NOT NULL,
  `due_amount` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `payment_status` varchar(255) NOT NULL,
  `payment_method` varchar(255) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sale_returns`
--

INSERT INTO `sale_returns` (`id`, `date`, `reference`, `customer_id`, `customer_name`, `tax_percentage`, `tax_amount`, `discount_percentage`, `discount_amount`, `shipping_amount`, `total_amount`, `paid_amount`, `due_amount`, `status`, `payment_status`, `payment_method`, `note`, `created_at`, `updated_at`) VALUES
(1, '2022-10-11', 'SLRN-00001', 1, 'Rawezh ahmed', 0, 0, 0, 0, 0, 100000, 100000, 0, 'Completed', 'Paid', 'Cash', NULL, '2022-10-11 14:09:57', '2022-10-11 14:09:57');

-- --------------------------------------------------------

--
-- Table structure for table `sale_return_details`
--

CREATE TABLE `sale_return_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sale_return_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_code` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `unit_price` int(11) NOT NULL,
  `sub_total` int(11) NOT NULL,
  `product_discount_amount` int(11) NOT NULL,
  `product_discount_type` varchar(255) NOT NULL DEFAULT 'fixed',
  `product_tax_amount` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sale_return_details`
--

INSERT INTO `sale_return_details` (`id`, `sale_return_id`, `product_id`, `product_name`, `product_code`, `quantity`, `price`, `unit_price`, `sub_total`, `product_discount_amount`, `product_discount_type`, `product_tax_amount`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'samsung s21', '123', 1, 100000, 100000, 100000, 0, 'fixed', 0, '2022-10-11 14:09:57', '2022-10-11 14:09:57');

-- --------------------------------------------------------

--
-- Table structure for table `sale_return_payments`
--

CREATE TABLE `sale_return_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sale_return_id` bigint(20) UNSIGNED NOT NULL,
  `amount` int(11) NOT NULL,
  `date` date NOT NULL,
  `reference` varchar(255) NOT NULL,
  `payment_method` varchar(255) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sale_return_payments`
--

INSERT INTO `sale_return_payments` (`id`, `sale_return_id`, `amount`, `date`, `reference`, `payment_method`, `note`, `created_at`, `updated_at`) VALUES
(1, 1, 100000, '2022-10-11', 'INV/SLRN-00001', 'Cash', NULL, '2022-10-11 14:09:57', '2022-10-11 14:09:57');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `company_email` varchar(255) NOT NULL,
  `company_phone` varchar(255) NOT NULL,
  `site_logo` varchar(255) DEFAULT NULL,
  `default_currency_id` int(11) NOT NULL,
  `default_currency_position` varchar(255) NOT NULL,
  `notification_email` varchar(255) NOT NULL,
  `footer_text` text NOT NULL,
  `company_address` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `company_name`, `company_email`, `company_phone`, `site_logo`, `default_currency_id`, `default_currency_position`, `notification_email`, `footer_text`, `company_address`, `created_at`, `updated_at`) VALUES
(1, 'Rawezh POS', 'company@test.com', '012345678901', NULL, 2, 'prefix', 'notification@test.com', 'Rawezh POS © 2021 || Developed by <strong><a target=\"_blank\" href=\"#\">Rawezh CST</a></strong>', 'Iraq,Sulaymany', '2022-10-07 18:00:08', '2023-08-27 09:33:46');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `supplier_name` varchar(255) NOT NULL,
  `supplier_email` varchar(255) NOT NULL,
  `supplier_phone` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `supplier_name`, `supplier_email`, `supplier_phone`, `city`, `country`, `address`, `created_at`, `updated_at`) VALUES
(1, 'rawezh310', 'rawezh310@gmail.com', '07501520657', 'Qalat Dizah', 'Iraq', 'Iraq', '2022-10-11 14:01:55', '2022-10-11 14:01:55');

-- --------------------------------------------------------

--
-- Table structure for table `uploads`
--

CREATE TABLE `uploads` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `folder` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `uploads`
--

INSERT INTO `uploads` (`id`, `folder`, `filename`, `created_at`, `updated_at`) VALUES
(2, '63415a65c9fd6-1665227365', '1665227365.jpg', '2022-10-08 14:09:25', '2022-10-08 14:09:25'),
(3, '634556a94b2b9-1665488553', '1665488553.jpg', '2022-10-11 14:42:33', '2022-10-11 14:42:33'),
(4, '634556c00ddd8-1665488576', '1665488576.png', '2022-10-11 14:42:56', '2022-10-11 14:42:56');

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
  `is_active` tinyint(1) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `is_active`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@example.com', NULL, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, NULL, '2022-10-07 14:51:33', NULL),
(2, 'Administrator', 'admin@test.com', '2022-11-01 17:57:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, NULL, '2022-10-07 18:00:08', '2022-10-28 17:14:51');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adjusted_products`
--
ALTER TABLE `adjusted_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `adjusted_products_adjustment_id_foreign` (`adjustment_id`);

--
-- Indexes for table `adjustments`
--
ALTER TABLE `adjustments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_category_code_unique` (`category_code`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expenses_category_id_foreign` (`category_id`);

--
-- Indexes for table `expense_categories`
--
ALTER TABLE `expense_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `media_uuid_unique` (`uuid`),
  ADD KEY `media_model_type_model_id_index` (`model_type`,`model_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_product_code_unique` (`product_code`),
  ADD KEY `products_category_id_foreign` (`category_id`);

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchases_supplier_id_foreign` (`supplier_id`);

--
-- Indexes for table `purchase_details`
--
ALTER TABLE `purchase_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_details_purchase_id_foreign` (`purchase_id`),
  ADD KEY `purchase_details_product_id_foreign` (`product_id`);

--
-- Indexes for table `purchase_payments`
--
ALTER TABLE `purchase_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_payments_purchase_id_foreign` (`purchase_id`);

--
-- Indexes for table `purchase_returns`
--
ALTER TABLE `purchase_returns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_returns_supplier_id_foreign` (`supplier_id`);

--
-- Indexes for table `purchase_return_details`
--
ALTER TABLE `purchase_return_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_return_details_purchase_return_id_foreign` (`purchase_return_id`),
  ADD KEY `purchase_return_details_product_id_foreign` (`product_id`);

--
-- Indexes for table `purchase_return_payments`
--
ALTER TABLE `purchase_return_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_return_payments_purchase_return_id_foreign` (`purchase_return_id`);

--
-- Indexes for table `quotations`
--
ALTER TABLE `quotations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quotations_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `quotation_details`
--
ALTER TABLE `quotation_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quotation_details_quotation_id_foreign` (`quotation_id`),
  ADD KEY `quotation_details_product_id_foreign` (`product_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sales_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `sale_details`
--
ALTER TABLE `sale_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sale_details_sale_id_foreign` (`sale_id`),
  ADD KEY `sale_details_product_id_foreign` (`product_id`);

--
-- Indexes for table `sale_payments`
--
ALTER TABLE `sale_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sale_payments_sale_id_foreign` (`sale_id`);

--
-- Indexes for table `sale_returns`
--
ALTER TABLE `sale_returns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sale_returns_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `sale_return_details`
--
ALTER TABLE `sale_return_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sale_return_details_sale_return_id_foreign` (`sale_return_id`),
  ADD KEY `sale_return_details_product_id_foreign` (`product_id`);

--
-- Indexes for table `sale_return_payments`
--
ALTER TABLE `sale_return_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sale_return_payments_sale_return_id_foreign` (`sale_return_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uploads`
--
ALTER TABLE `uploads`
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
-- AUTO_INCREMENT for table `adjusted_products`
--
ALTER TABLE `adjusted_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `adjustments`
--
ALTER TABLE `adjustments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `expense_categories`
--
ALTER TABLE `expense_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `purchase_details`
--
ALTER TABLE `purchase_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `purchase_payments`
--
ALTER TABLE `purchase_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `purchase_returns`
--
ALTER TABLE `purchase_returns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `purchase_return_details`
--
ALTER TABLE `purchase_return_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `purchase_return_payments`
--
ALTER TABLE `purchase_return_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `quotations`
--
ALTER TABLE `quotations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `quotation_details`
--
ALTER TABLE `quotation_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `sale_details`
--
ALTER TABLE `sale_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `sale_payments`
--
ALTER TABLE `sale_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `sale_returns`
--
ALTER TABLE `sale_returns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sale_return_details`
--
ALTER TABLE `sale_return_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sale_return_payments`
--
ALTER TABLE `sale_return_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `uploads`
--
ALTER TABLE `uploads`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `adjusted_products`
--
ALTER TABLE `adjusted_products`
  ADD CONSTRAINT `adjusted_products_adjustment_id_foreign` FOREIGN KEY (`adjustment_id`) REFERENCES `adjustments` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `expenses`
--
ALTER TABLE `expenses`
  ADD CONSTRAINT `expenses_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `expense_categories` (`id`);

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Constraints for table `purchases`
--
ALTER TABLE `purchases`
  ADD CONSTRAINT `purchases_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `purchase_details`
--
ALTER TABLE `purchase_details`
  ADD CONSTRAINT `purchase_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `purchase_details_purchase_id_foreign` FOREIGN KEY (`purchase_id`) REFERENCES `purchases` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `purchase_payments`
--
ALTER TABLE `purchase_payments`
  ADD CONSTRAINT `purchase_payments_purchase_id_foreign` FOREIGN KEY (`purchase_id`) REFERENCES `purchases` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `purchase_returns`
--
ALTER TABLE `purchase_returns`
  ADD CONSTRAINT `purchase_returns_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `purchase_return_details`
--
ALTER TABLE `purchase_return_details`
  ADD CONSTRAINT `purchase_return_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `purchase_return_details_purchase_return_id_foreign` FOREIGN KEY (`purchase_return_id`) REFERENCES `purchase_returns` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `purchase_return_payments`
--
ALTER TABLE `purchase_return_payments`
  ADD CONSTRAINT `purchase_return_payments_purchase_return_id_foreign` FOREIGN KEY (`purchase_return_id`) REFERENCES `purchase_returns` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `quotations`
--
ALTER TABLE `quotations`
  ADD CONSTRAINT `quotations_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `quotation_details`
--
ALTER TABLE `quotation_details`
  ADD CONSTRAINT `quotation_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `quotation_details_quotation_id_foreign` FOREIGN KEY (`quotation_id`) REFERENCES `quotations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `sale_details`
--
ALTER TABLE `sale_details`
  ADD CONSTRAINT `sale_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `sale_details_sale_id_foreign` FOREIGN KEY (`sale_id`) REFERENCES `sales` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sale_payments`
--
ALTER TABLE `sale_payments`
  ADD CONSTRAINT `sale_payments_sale_id_foreign` FOREIGN KEY (`sale_id`) REFERENCES `sales` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sale_returns`
--
ALTER TABLE `sale_returns`
  ADD CONSTRAINT `sale_returns_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `sale_return_details`
--
ALTER TABLE `sale_return_details`
  ADD CONSTRAINT `sale_return_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `sale_return_details_sale_return_id_foreign` FOREIGN KEY (`sale_return_id`) REFERENCES `sale_returns` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sale_return_payments`
--
ALTER TABLE `sale_return_payments`
  ADD CONSTRAINT `sale_return_payments_sale_return_id_foreign` FOREIGN KEY (`sale_return_id`) REFERENCES `sale_returns` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
