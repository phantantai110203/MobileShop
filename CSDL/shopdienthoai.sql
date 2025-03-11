-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th3 11, 2025 lúc 01:41 AM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `shopdienthoai`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `image` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `brands`
--

INSERT INTO `brands` (`id`, `name`, `image`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Vivo', 'asset/img/Vivo.jpg', '2024-06-20 07:50:04', '2024-06-20 07:50:04', NULL),
(2, 'IPhone', 'asset/img/Image/Brand/IPhone.png', '2024-06-20 07:50:04', '2024-06-20 07:50:04', NULL),
(3, 'Oppo', 'asset/img/Brand/Oppo.png', '2024-06-20 07:50:04', '2024-06-20 07:50:04', NULL),
(4, 'Realme', 'asset/img/Image/Brand/Oppo.png', '2024-06-20 07:50:04', '2024-06-20 07:50:04', NULL),
(5, 'SamSung', 'asset/img/Image/Brand/SamSung.jpg', '2024-06-20 07:50:04', '2024-06-20 07:50:04', NULL),
(6, 'Xiaomi', 'asset/img/Image/Brand/Xiaomi.png', '2024-06-20 07:50:04', '2024-06-20 07:50:04', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `quantity` bigint(20) NOT NULL,
  `price` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `phone_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `content` text NOT NULL,
  `like` bigint(20) NOT NULL,
  `Status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `phonemod_id` bigint(20) UNSIGNED NOT NULL,
  `parentcomment_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `discounts`
--

CREATE TABLE `discounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `code` varchar(20) NOT NULL,
  `quantity` bigint(20) NOT NULL,
  `sercent` bigint(20) NOT NULL,
  `status` varchar(30) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `failed_jobs`
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
-- Cấu trúc bảng cho bảng `favorites`
--

CREATE TABLE `favorites` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `status` tinyint(1) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `phonemod_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `invoicedetails`
--

CREATE TABLE `invoicedetails` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) DEFAULT 0,
  `unitPrice` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `invoice_id` bigint(20) UNSIGNED NOT NULL,
  `phone_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `invoices`
--

CREATE TABLE `invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(60) NOT NULL,
  `issuedDate` datetime NOT NULL,
  `shippingAddress` varchar(50) DEFAULT NULL,
  `shippingPhone` varchar(50) DEFAULT NULL,
  `total` bigint(20) NOT NULL,
  `status` varchar(30) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `PaymentMethod_id` bigint(20) UNSIGNED NOT NULL,
  `Discount_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_05_24_153122_create_phones_table', 1),
(6, '2024_05_24_153232_create_phone_mods_table', 1),
(7, '2024_05_24_153422_create_carts_table', 1),
(8, '2024_05_24_154938_create_favorites_table', 1),
(9, '2024_05_24_155004_create_reviews_table', 1),
(10, '2024_05_24_155102_create_comments_table', 1),
(11, '2024_05_24_155420_create_phone_mod_images_table', 1),
(12, '2024_05_24_155507_create_slide_shows_table', 1),
(13, '2024_05_24_155540_create_brands_table', 1),
(14, '2024_05_24_155616_create_invoices_table', 1),
(15, '2024_05_24_155742_create_invoice_details_table', 1),
(16, '2024_05_24_155812_create_discounts_table', 1),
(17, '2024_05_24_155943_create_payment_methods_table', 1),
(18, '2024_05_28_070030_foreign_keys', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `paymentmethods`
--

CREATE TABLE `paymentmethods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `image` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `personal_access_tokens`
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
-- Đang đổ dữ liệu cho bảng `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'Personal Access Token', 'a71847741f0ef12f479dc9ae73a4b76b6df0d37d09c2db9737bff7cc99b3c4e6', '[\"*\"]', NULL, NULL, '2024-09-01 06:06:26', '2024-09-01 06:06:26'),
(2, 'App\\Models\\User', 1, 'Personal Access Token', 'fe952e949d0f8e85c0915481413c41af821d7d9ee0e628ef083dd4f22e1d48fe', '[\"*\"]', NULL, NULL, '2024-09-01 06:25:29', '2024-09-01 06:25:29');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phonemodimages`
--

CREATE TABLE `phonemodimages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `phonemod_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phonemods`
--

CREATE TABLE `phonemods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `screen` varchar(100) NOT NULL,
  `operatingSystem` varchar(255) NOT NULL,
  `price` bigint(20) NOT NULL,
  `frontCamera` varchar(255) NOT NULL,
  `rearCamera` varchar(255) NOT NULL,
  `chip` varchar(255) NOT NULL,
  `ram` varchar(30) NOT NULL,
  `sim` varchar(50) NOT NULL,
  `batteryAndCharger` varchar(50) NOT NULL,
  `image` text NOT NULL,
  `phoneModelType` varchar(30) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `brand_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `phonemods`
--

INSERT INTO `phonemods` (`id`, `name`, `screen`, `operatingSystem`, `price`, `frontCamera`, `rearCamera`, `chip`, `ram`, `sim`, `batteryAndCharger`, `image`, `phoneModelType`, `created_at`, `updated_at`, `deleted_at`, `brand_id`) VALUES
(1, 'Xiaomi Redmi 12', 'IPS LCD, 6.79\", Full HD+', 'Android 13', 4290000, '8 MP', 'Chính 50 MP & Phụ 8 MP, 2 MP', 'MediaTek Helio G88', '4 GB', '2 Nano SIM (SIM 2 chung khe thẻ nhớ), Hỗ trợ 4G', '5000 mAh, 18 W', 'xiaomi-redmi-12-bac-thumb.jpg', 'Android', '2024-06-20 07:50:04', '2024-06-20 07:50:04', NULL, 6),
(2, 'Xiaomi 13T 5G', 'AMOLED, 6.67\", 1.5K', 'Android 13', 11990000, '20 MP', 'Chính 50 MP & Phụ 50 MP, 12 MP', 'MediaTek Dimensity 8200-Ultra', '8 GB', '2 Nano SIM, Hỗ trợ 5G', '5000 mAh, 67 W', 'xiaomi-13-t-xanh-duong-thumb.jpg', 'Android', '2024-06-20 07:50:04', '2024-06-20 07:50:04', NULL, 6),
(3, 'Samsung Galaxy S21 FE 5G', 'Dynamic AMOLED 2X, 6.4\", Full HD+', 'Android 12', 9490000, '32 MP', 'Chính 12 MP & Phụ 12 MP, 8 MP', 'Exynos 2100', '6 GB', '2 Nano SIM, Hỗ trợ 5G', '4500 mAh, 25 W', 'Samsung-Galaxy-S21-FE-vang-600x600.jpg', 'Android', '2024-06-20 07:50:04', '2024-06-20 07:50:04', NULL, 5),
(4, 'Samsung Galaxy S22 Ultra 5G', 'Dynamic AMOLED 2X, 6.8\", Quad HD+ (2K+)', 'Android 12', 16990000, '40 MP', 'Chính 108 MP & Phụ 12 MP, 10 MP, 10 MP', 'Snapdragon 8 Gen 1', '8 GB', '2 Nano SIM hoặc 1 Nano SIM + 1 eSIM, Hỗ trợ 5G', '5000 mAh, 45 W', 'Galaxy-S22-Ultra-Burgundy.jpg', 'Android', '2024-06-20 07:50:04', '2024-06-20 07:50:04', NULL, 5),
(5, 'vivo V25 5G', 'AMOLED, 6.44\", Full HD+', 'Android 12', 7490000, '50 MP', 'Chính 64 MP & Phụ 8 MP, 2 MP', 'MediaTek Dimensity 900 5G', '8 GB', '2 Nano SIM (SIM 2 chung khe thẻ nhớ), Hỗ trợ 5G', '4500 mAh, 44 W', 'vivo-v25-5g-vang-thumb.jpg', 'Android', '2024-06-20 07:50:04', '2024-06-20 07:50:04', NULL, 1),
(6, 'Xiaomi 13 Lite 5G', 'AMOLED, 6.55\", Full HD+', 'Android 12', 8990000, 'Chính 32 MP & Phụ 8 MP', 'Chính 50 MP & Phụ 8 MP, 2 MP', 'Snapdragon 7 Gen 1 8 nhân', '8 GB', '2 Nano SIM, Hỗ trợ 5G', '4500 mAh, 67 W', 'xiaomi-13-lite-xanh-thumb.jpg', 'Android', '2024-06-20 07:50:04', '2024-06-20 07:50:04', NULL, 6),
(7, 'Xiaomi Redmi Note 12 Pro', 'AMOLED, 6.67\", Full HD+', 'Android 11', 6290000, '16 MP', 'Chính 108 MP & Phụ 8 MP, 2 MP, 2 MP', 'Snapdragon 732G', '8 GB', '2 Nano SIM (SIM 2 chung khe thẻ nhớ), Hỗ trợ 4G', '5000 mAh, 67 W', 'xiaomi-redmi-12-pro-4g-xanh-thumb.jpg', 'Android', '2024-06-20 07:50:04', '2024-06-20 07:50:04', NULL, 6),
(8, 'Xiaomi Redmi Note 12S', 'AMOLED, 6.43\", Full HD+', 'Android 13', 5490000, '16 MP', 'Chính 108 MP & Phụ 8 MP, 2 MP', 'MediaTek Helio G96', '8 GB', '2 Nano SIM, Hỗ trợ 4G', '5000 mAh, 33 W', 'xiaomi-redmi-note12s-den-thumb.jpg', 'Android', '2024-06-20 07:50:04', '2024-06-20 07:50:04', NULL, 6),
(9, 'vivo V29e 5G', 'AMOLED, 6.67\", Full HD+', 'Android 13', 9690000, '50 MP', 'Chính 64 MP & Phụ 8 MP', 'Snapdragon 695 5G', '12 GB', '2 Nano SIM, Hỗ trợ 5G', 'Android   4800 mAh, 44 W', 'vivo-v29e-tim-thumb.jpg', 'Android', '2024-06-20 07:50:04', '2024-06-20 07:50:04', NULL, 1),
(10, 'vivo Y17s', '[value-3]', '[value-4]', 3390000, '[value-6]', '[value-7]', '[value-8]', '[value-9]', '[value-10]', '[value-11]', 'vivo-y17-xanh-thumb.jpg', '[value-13]', '2024-06-20 07:50:04', '2024-06-20 07:50:04', NULL, 1),
(11, 'Samsung Galaxy S23 5G', '[value-3]', '[value-4]', 13990000, '[value-6]', '[value-7]', '[value-8]', '[value-9]', '[value-10]', '[value-11]', 'samsung-galaxy-s23.jpg', '[value-13]', '2024-06-20 07:50:04', '2024-06-20 07:50:04', NULL, 5),
(12, 'Samsung Galaxy S23 Ultra 5G', '[value-3]', '[value-4]', 23990000, '[value-6]', '[value-7]', '[value-8]', '[value-9]', '[value-10]', '[value-11]', 'samsung-galaxy-s23-ultra-thumb-xanh.jpg', '[value-13]', '2024-06-20 07:50:04', '2024-06-20 07:50:04', NULL, 5),
(13, 'Samsung Galaxy S23+ 5G', '[value-3]', '[value-4]', 17990000, '[value-6]', '[value-7]', '[value-8]', '[value-9]', '[value-10]', '[value-11]', 'samsung-galaxy-s23-plus.jpg', '[value-13]', '2024-06-20 07:50:04', '2024-06-20 07:50:04', NULL, 5),
(14, 'Samsung Galaxy Z Flip5 5G', '[value-3]', '[value-4]', 19790000, '[value-6]', '[value-7]', '[value-8]', '[value-9]', '[value-10]', '[value-11]', 'samsung-galaxy-z-flip5-xanh-mint-thumb.jpg', '[value-13]', '2024-06-20 07:50:04', '2024-06-20 07:50:04', NULL, 5),
(15, 'Samsung Galaxy Z Fold5 5G', '[value-3]', '[value-4]', 37990000, '[value-6]', '[value-7]', '[value-8]', '[value-9]', '[value-10]', '[value-11]', 'samsung-galaxy-z-fold5- kem.jpg', '[value-13]', '2024-06-20 07:50:04', '2024-06-20 07:50:04', NULL, 5);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phones`
--

CREATE TABLE `phones` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `color` varchar(30) NOT NULL,
  `rom` varchar(30) NOT NULL,
  `image` text NOT NULL,
  `price` bigint(20) NOT NULL,
  `stock` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `phonemod_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `phones`
--

INSERT INTO `phones` (`id`, `name`, `color`, `rom`, `image`, `price`, `stock`, `created_at`, `updated_at`, `deleted_at`, `phonemod_id`) VALUES
(1, 'Xiaomi Redmi 12 64GB', 'Bạc', '64GB', 'xiaomi-redmi-12-bac.jpg', 4290000, 10, '2024-06-20 07:50:04', '2024-06-20 07:50:04', NULL, 1),
(2, 'Xiaomi Redmi 12 64GB', 'Đen', '64GB', 'xiaomi-redmi-12-den.jpg', 4290000, 10, '2024-06-20 07:50:04', '2024-06-20 07:50:04', NULL, 1),
(3, 'Xiaomi Redmi 12 64GB', 'Xanh', '64GB', 'xiaomi-redmi-12-xanh.jpg', 4290000, 10, '2024-06-20 07:50:04', '2024-06-20 07:50:04', NULL, 1),
(4, 'Xiaomi 13T 5G 128GB', 'Xanh dương', '128GB', 'xiaomi-13t-xanh-duong.jpg', 11990000, 10, '2024-06-20 07:50:04', '2024-06-20 07:50:04', NULL, 2),
(5, 'Xiaomi 13T 5G 128GB', 'Xanh lá', '128GB', 'xiaomi-13t-xanh-la.jpg', 11990000, 10, '2024-06-20 07:50:04', '2024-06-20 07:50:04', NULL, 2),
(6, 'Xiaomi 13T 5G 128GB', 'Đen', '128GB', 'xiaomi-13t-den.jpg', 11990000, 10, '2024-06-20 07:50:04', '2024-06-20 07:50:04', NULL, 2),
(7, 'Xiaomi 13T 5G 256GB', 'Xanh dương', '256GB', 'xiaomi-13t-xanh-duong.jpg', 13990000, 10, '2024-06-20 07:50:04', '2024-06-20 07:50:04', NULL, 2),
(8, 'Xiaomi 13T 5G 256GB', 'Xanh lá', '256GB', 'xiaomi-13t-xanh-la.jpg', 13990000, 10, '2024-06-20 07:50:04', '2024-06-20 07:50:04', NULL, 2),
(9, 'Xiaomi 13T 5G 256GB', 'Đen', '256GB', 'xiaomi-13t-den.jpg', 13990000, 10, '2024-06-20 07:50:04', '2024-06-20 07:50:04', NULL, 2),
(10, 'Samsung Galaxy S21 FE 5G 128GB', 'Xanh lá nhạt', '128GB', 'samsung-galaxy-s21-fe-xanh.jpg', 9490000, 10, '2024-06-20 07:50:04', '2024-06-20 07:50:04', NULL, 3),
(11, 'Samsung Galaxy S21 FE 5G 128GB', 'Xám đậm', '128GB', 'samsung-galaxy-s21-fe-xam.jpg', 9490000, 10, '2024-06-20 07:50:04', '2024-06-20 07:50:04', NULL, 3),
(12, 'Samsung Galaxy S21 FE 5G 256GB', 'Xanh lá nhạt', '256GB', 'samsung-galaxy-s21-fe-xanh.jpg', 12990000, 10, '2024-06-20 07:50:04', '2024-06-20 07:50:04', NULL, 3),
(13, 'Samsung Galaxy S21 FE 5G 256GB', 'Xám đậm', '256GB', 'samsung-galaxy-s21-fe-xam.jpg', 12990000, 10, '2024-06-20 07:50:04', '2024-06-20 07:50:04', NULL, 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `content` text NOT NULL,
  `star` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `phonemod_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `reviews`
--

INSERT INTO `reviews` (`id`, `content`, `star`, `created_at`, `updated_at`, `deleted_at`, `user_id`, `phonemod_id`) VALUES
(1, 'Rất đẹp', 4, '2024-06-20 07:50:04', '2024-06-20 07:50:04', NULL, 1, 1),
(2, 'Tôi sẽ ghé lại', 3, '2024-06-20 07:50:04', '2024-06-20 07:50:04', NULL, 2, 1),
(3, 'đẹp vãi', 4, '2024-09-02 03:21:28', '2024-09-02 03:21:28', NULL, 1, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `slideshows`
--

CREATE TABLE `slideshows` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `phonemod_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `slideshows`
--

INSERT INTO `slideshows` (`id`, `image`, `created_at`, `updated_at`, `deleted_at`, `phonemod_id`) VALUES
(1, 'slider01.png', '2024-06-20 07:50:04', '2024-06-20 07:50:04', NULL, 1),
(2, 'slider02.png', '2024-06-20 07:50:04', '2024-06-20 07:50:04', NULL, 1),
(3, 'slider03.png', '2024-06-20 07:50:04', '2024-06-20 07:50:04', NULL, 1),
(4, 'slider04.png', '2024-06-20 07:50:04', '2024-06-20 07:50:04', NULL, 1),
(5, 'slider05.png', '2024-06-20 07:50:04', '2024-06-20 07:50:04', NULL, 1),
(6, 'slider06.png', '2024-06-20 07:50:04', '2024-06-20 07:50:04', NULL, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(200) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `role` tinyint(1) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `address`, `password`, `phone`, `role`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Phan Tấn Tài', 'ptai0866@gmail.com', 'Bến Tre', '$2y$10$jZoAtDJKrxNopJIv4xAXf.M7DPJMgeGTnF91KDOKRKZJ27xaBZEB2', '0344312253', 1, NULL, '2024-06-06 09:23:26', '2024-06-06 09:23:26', NULL),
(2, 'Trần Huỳnh Thơ', 'quangnam@gmail.com', 'Tiền Giang', '$2y$10$6517TYcJx6MtXKPT/l5r1.YUFQVEXYnYVSY.JUxvbRBU1DgkPV2LC', '0344312254', 1, NULL, '2024-06-06 09:23:27', '2024-06-06 09:23:27', NULL),
(3, 'Bùi Quốc Việt', 'quocviet@gmail.com', 'TP HCM', '$2y$10$mVauatjmHjhYgjNStSsYXuYdS6AMuaTUCLdTMxrGhs6BI2AJGvf/e', '0344312255', 0, NULL, '2024-06-06 09:23:27', '2024-06-06 09:23:27', NULL);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `brands_name_unique` (`name`);

--
-- Chỉ mục cho bảng `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_user_id_foreign` (`user_id`),
  ADD KEY `carts_phone_id_foreign` (`phone_id`);

--
-- Chỉ mục cho bảng `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_user_id_foreign` (`user_id`),
  ADD KEY `comments_phonemod_id_foreign` (`phonemod_id`),
  ADD KEY `comments_parentcomment_id_foreign` (`parentcomment_id`);

--
-- Chỉ mục cho bảng `discounts`
--
ALTER TABLE `discounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `discounts_code_unique` (`code`);

--
-- Chỉ mục cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Chỉ mục cho bảng `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `favorites_user_id_foreign` (`user_id`),
  ADD KEY `favorites_phonemod_id_foreign` (`phonemod_id`);

--
-- Chỉ mục cho bảng `invoicedetails`
--
ALTER TABLE `invoicedetails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoicedetails_invoice_id_foreign` (`invoice_id`),
  ADD KEY `invoicedetails_phone_id_foreign` (`phone_id`);

--
-- Chỉ mục cho bảng `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `invoices_code_unique` (`code`),
  ADD KEY `invoices_user_id_foreign` (`user_id`),
  ADD KEY `invoices_paymentmethod_id_foreign` (`PaymentMethod_id`),
  ADD KEY `invoices_discount_id_foreign` (`Discount_id`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Chỉ mục cho bảng `paymentmethods`
--
ALTER TABLE `paymentmethods`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Chỉ mục cho bảng `phonemodimages`
--
ALTER TABLE `phonemodimages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `phonemodimages_phonemod_id_foreign` (`phonemod_id`);

--
-- Chỉ mục cho bảng `phonemods`
--
ALTER TABLE `phonemods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `phonemods_brand_id_foreign` (`brand_id`);

--
-- Chỉ mục cho bảng `phones`
--
ALTER TABLE `phones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `phones_phonemod_id_foreign` (`phonemod_id`);

--
-- Chỉ mục cho bảng `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reviews_user_id_foreign` (`user_id`),
  ADD KEY `reviews_phonemod_id_foreign` (`phonemod_id`);

--
-- Chỉ mục cho bảng `slideshows`
--
ALTER TABLE `slideshows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `slideshows_phonemod_id_foreign` (`phonemod_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_phone_unique` (`phone`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `discounts`
--
ALTER TABLE `discounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `favorites`
--
ALTER TABLE `favorites`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `invoicedetails`
--
ALTER TABLE `invoicedetails`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `paymentmethods`
--
ALTER TABLE `paymentmethods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `phonemodimages`
--
ALTER TABLE `phonemodimages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `phonemods`
--
ALTER TABLE `phonemods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `phones`
--
ALTER TABLE `phones`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `slideshows`
--
ALTER TABLE `slideshows`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_phone_id_foreign` FOREIGN KEY (`phone_id`) REFERENCES `phones` (`id`),
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_parentcomment_id_foreign` FOREIGN KEY (`parentcomment_id`) REFERENCES `comments` (`id`),
  ADD CONSTRAINT `comments_phonemod_id_foreign` FOREIGN KEY (`phonemod_id`) REFERENCES `phonemods` (`id`),
  ADD CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `favorites`
--
ALTER TABLE `favorites`
  ADD CONSTRAINT `favorites_phonemod_id_foreign` FOREIGN KEY (`phonemod_id`) REFERENCES `phonemods` (`id`),
  ADD CONSTRAINT `favorites_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `invoicedetails`
--
ALTER TABLE `invoicedetails`
  ADD CONSTRAINT `invoicedetails_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`),
  ADD CONSTRAINT `invoicedetails_phone_id_foreign` FOREIGN KEY (`phone_id`) REFERENCES `phones` (`id`);

--
-- Các ràng buộc cho bảng `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_discount_id_foreign` FOREIGN KEY (`Discount_id`) REFERENCES `discounts` (`id`),
  ADD CONSTRAINT `invoices_paymentmethod_id_foreign` FOREIGN KEY (`PaymentMethod_id`) REFERENCES `paymentmethods` (`id`),
  ADD CONSTRAINT `invoices_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `phonemodimages`
--
ALTER TABLE `phonemodimages`
  ADD CONSTRAINT `phonemodimages_phonemod_id_foreign` FOREIGN KEY (`phonemod_id`) REFERENCES `phonemods` (`id`);

--
-- Các ràng buộc cho bảng `phonemods`
--
ALTER TABLE `phonemods`
  ADD CONSTRAINT `phonemods_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`);

--
-- Các ràng buộc cho bảng `phones`
--
ALTER TABLE `phones`
  ADD CONSTRAINT `phones_phonemod_id_foreign` FOREIGN KEY (`phonemod_id`) REFERENCES `phonemods` (`id`);

--
-- Các ràng buộc cho bảng `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_phonemod_id_foreign` FOREIGN KEY (`phonemod_id`) REFERENCES `phonemods` (`id`),
  ADD CONSTRAINT `reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `slideshows`
--
ALTER TABLE `slideshows`
  ADD CONSTRAINT `slideshows_phonemod_id_foreign` FOREIGN KEY (`phonemod_id`) REFERENCES `phonemods` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
