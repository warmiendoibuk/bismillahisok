-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 18, 2026 at 06:19 AM
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
-- Database: `jaria_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cash_transactions`
--

CREATE TABLE `cash_transactions` (
  `id` int(11) NOT NULL,
  `type` enum('income','expense') NOT NULL,
  `category` varchar(100) NOT NULL DEFAULT 'Lain-lain',
  `person_name` varchar(150) DEFAULT NULL,
  `amount` decimal(12,2) NOT NULL,
  `description` text DEFAULT NULL,
  `transaction_date` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cash_transactions`
--

INSERT INTO `cash_transactions` (`id`, `type`, `category`, `person_name`, `amount`, `description`, `transaction_date`, `created_at`) VALUES
(20, 'income', 'Penjualan Produk', NULL, 25000.00, 'Penjualan Otomatis ORD-20261009-3E4B (akuuu)', '2026-10-09', '2026-10-09 15:49:52'),
(21, 'income', 'Penjualan Produk', NULL, 30000.00, 'Penjualan Otomatis ORD-20261009-86F5 (tessss)', '2026-10-09', '2026-10-09 16:11:30'),
(25, 'income', 'Penjualan Produk', NULL, 5000.00, 'Penjualan Otomatis ORD-20261009-1594 (yow)', '2026-10-10', '2026-10-09 18:03:15'),
(26, 'income', 'Penjualan Produk', NULL, 50000.00, 'Penjualan Otomatis ORD-20261009-6B96 (taaa)', '2026-10-10', '2026-10-09 18:04:55'),
(29, 'income', 'Penjualan Produk', NULL, 5000.00, 'Penjualan Otomatis ORD-20261009-1AD5 (ewqwqw)', '2026-10-10', '2026-10-09 18:11:02'),
(34, 'income', 'Penjualan Produk', NULL, 21000.00, 'Penjualan Otomatis ORD-20261010-96CD (indah)', '2026-10-10', '2026-10-10 07:20:12'),
(41, 'income', 'Penjualan Produk', NULL, 50000.00, 'Penjualan Otomatis ORD-20261010-F640 (LALALALA)', '2026-10-10', '2026-10-10 13:52:30'),
(42, 'income', 'Penjualan Produk', NULL, 155000.00, 'Penjualan Otomatis ORD-20261010-CD95 (giiii)', '2026-10-10', '2026-10-10 14:03:58'),
(43, 'income', 'Penjualan Produk', NULL, 90000.00, 'Penjualan Otomatis ORD-20261011-5A04 (DDDDD)', '2026-10-11', '2026-10-11 05:11:20'),
(56, 'income', 'Donasi / Modal', 'tuyul', 2000000.00, 'OYUYUYYUFEW', '2026-10-15', '2026-10-15 02:16:18'),
(58, 'expense', 'pengeluaran', 'wawawawawa', 700000.00, 'gxdddgf', '2026-10-15', '2026-10-15 02:21:35'),
(59, 'expense', 'Operasional', 'rombeng', 1400000.00, 'gyiluy;', '2026-10-15', '2026-10-15 02:23:21'),
(60, 'income', 'Penjualan Produk', NULL, 30000.00, 'Penjualan Otomatis ORD-20261018-7D62 (lalapo)', '2026-10-18', '2026-10-18 03:54:53'),
(61, 'income', 'Penjualan Produk', NULL, 70000.00, 'Penjualan Otomatis ORD-20261018-FB79 (hahahahaa)', '2026-10-18', '2026-10-18 03:55:23');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `description`, `created_at`) VALUES
(1, 'Keychain', 'keychain', 'Gantungan kunci unik dari kain perca', '2026-10-07 01:17:43'),
(2, 'Bros', 'bros', 'Bros hias handmade yang cantik', '2026-10-07 01:17:43'),
(3, 'Sling Bag', 'sling-bag', 'Tas selempang praktis ramah lingkungan', '2026-10-07 01:17:43'),
(4, 'Kerajinan Lainnya', 'kerajinan-lainnya', 'Aksesori dan dekorasi kreasi perca', '2026-10-07 01:17:43');

-- --------------------------------------------------------

--
-- Table structure for table `contact_banners`
--

CREATE TABLE `contact_banners` (
  `id` int(11) NOT NULL,
  `image_path` varchar(255) NOT NULL,
  `badge_text` varchar(255) DEFAULT 'Kesekretariatan & Mitra Pemberdayaan',
  `title` varchar(255) DEFAULT 'Hubungi Kami & Lokasi Mitra',
  `description` text DEFAULT NULL,
  `sort_order` int(11) DEFAULT 0,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact_banners`
--

INSERT INTO `contact_banners` (`id`, `image_path`, `badge_text`, `title`, `description`, `sort_order`, `is_active`, `created_at`) VALUES
(1, 'assets/images/banners/contact_banner_1791647714_871.jpg', 'Kesekretariatan & Mitra Pemberdayaan', 'Hubungi Kami & Lokasi Mitra', 'Ingin memesan produk souvenir custom atau bersilaturahmi dengan panti asuhan? Kami siap menyambut Anda.', 1, 1, '2026-10-09 14:14:34');

-- --------------------------------------------------------

--
-- Table structure for table `contact_settings`
--

CREATE TABLE `contact_settings` (
  `id` int(11) NOT NULL DEFAULT 1,
  `badge_section` varchar(255) DEFAULT 'Informasi Alamat Lengkap & Layanan',
  `title_section` varchar(255) DEFAULT 'Lokasi & Kontak Penanggung Jawab',
  `subtitle_section` text DEFAULT NULL,
  `institution_name` varchar(255) DEFAULT 'Yayasan & Panti Asuhan Al-Jihad',
  `institution_sub` varchar(255) DEFAULT 'Mitra Pemberdayaan Kerajinan Perca JARIA Craft',
  `address` text DEFAULT NULL,
  `email` varchar(150) DEFAULT 'jaria.craft@gmail.com',
  `wa_number` varchar(50) DEFAULT '6285704545150',
  `wa_contact_person` varchar(100) DEFAULT 'Azizah',
  `wa_display_text` varchar(100) DEFAULT '+62 857-0454-5150',
  `website_url` varchar(255) DEFAULT 'https://yayasanaljihad.org/tentang-kami/profil/',
  `initiator_text` text DEFAULT NULL,
  `maps_embed_url` text DEFAULT NULL,
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact_settings`
--

INSERT INTO `contact_settings` (`id`, `badge_section`, `title_section`, `subtitle_section`, `institution_name`, `institution_sub`, `address`, `email`, `wa_number`, `wa_contact_person`, `wa_display_text`, `website_url`, `initiator_text`, `maps_embed_url`, `updated_at`) VALUES
(1, 'Informasi Alamat Lengkap & Layanan', 'Lokasi & Kontak Penanggung Jawab', 'Hubungi tim mahasiswa atau pengurus panti asuhan untuk konsultasi produk & kerja sama.', 'Yayasan & Panti Asuhan Al-Jihad', 'Mitra Pemberdayaan Kerajinan Perca JARIA Craft', 'Jl. Jemursari Utara III No.9, Jemur Wonosari, Kecamatan Wonocolo, Kota Surabaya, Jawa Timur 60237', 'jaria.craft@gmail.com', '6285704545150', 'Azizah', '+62 857-0454-5150', 'https://yayasanaljihad.org/tentang-kami/profil/', 'Mahasiswa Ilmu Komunikasi Kelas E1 Semester 5 UIN Sunan Ampel Surabaya (UINSA)', 'https://maps.google.com/maps?q=-7.324513,112.7362044&hl=id&z=17&output=embed', '2026-10-10 22:56:03');

-- --------------------------------------------------------

--
-- Table structure for table `contact_socials`
--

CREATE TABLE `contact_socials` (
  `id` int(11) NOT NULL,
  `platform_name` varchar(100) NOT NULL,
  `icon` varchar(100) DEFAULT 'bi-share-fill',
  `color_theme` varchar(50) DEFAULT 'primary',
  `url` varchar(255) NOT NULL,
  `sort_order` int(11) DEFAULT 0,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact_socials`
--

INSERT INTO `contact_socials` (`id`, `platform_name`, `icon`, `color_theme`, `url`, `sort_order`, `is_active`, `created_at`) VALUES
(1, 'Instagram', 'bi-instagram', 'danger', 'https://instagram.com/jaria.craft', 1, 1, '2026-10-09 14:14:34'),
(2, 'TikTok', 'bi-tiktok', 'dark', 'https://tiktok.com/@jaria.craft', 2, 1, '2026-10-09 14:14:34'),
(3, 'YouTube', 'bi-youtube', 'danger', 'https://youtube.com', 3, 1, '2026-10-09 14:14:34');

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` int(11) NOT NULL,
  `category` enum('Raw Materials','Production','Packaging','Transport','Promotion','Operations','Equipment','Other') NOT NULL,
  `title` varchar(150) NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `date` date DEFAULT NULL,
  `description` text DEFAULT NULL,
  `expense_date` date NOT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expenses`
--

INSERT INTO `expenses` (`id`, `category`, `title`, `amount`, `date`, `description`, `expense_date`, `notes`, `created_at`) VALUES
(3, 'Raw Materials', '', 7000.00, '2026-10-07', 'lem', '0000-00-00', NULL, '2026-10-07 06:10:13'),
(4, 'Raw Materials', '', 1900000.00, '2026-10-07', 'stand', '0000-00-00', NULL, '2026-10-07 06:20:06');

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` int(11) NOT NULL,
  `category` varchar(100) NOT NULL DEFAULT 'Umum',
  `icon` varchar(100) DEFAULT 'bi-question-circle-fill',
  `color` varchar(50) DEFAULT 'primary',
  `question` text NOT NULL,
  `answer` text NOT NULL,
  `sort_order` int(11) DEFAULT 0,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `faqs`
--

INSERT INTO `faqs` (`id`, `category`, `icon`, `color`, `question`, `answer`, `sort_order`, `is_active`, `created_at`) VALUES
(1, 'Produk & Bahan', 'bi-bag-heart-fill', 'primary', 'Apa itu JARIA Craft dan apa keunikan produknya?', 'JARIA Craft (Jahit Ceria) adalah brand kewirausahaan sosial yang memproduksi kerajinan tangan berbahan dasar limbah kain perca. Setiap produk seperti bros, keychain, dan tas dibuat secara kreatif oleh adik-adik Panti Asuhan Al-Jihad Surabaya didampingi oleh mahasiswa UIN Sunan Ampel Surabaya.', 1, 1, '2026-10-09 13:46:28'),
(2, 'Pemesanan', 'bi-cart-check-fill', 'primary', 'Bagaimana cara membeli produk di JARIA Craft?', 'Anda dapat memilih produk yang diinginkan melalui halaman Katalog Produk, menambahkannya ke Keranjang, lalu menekan tombol Checkout. Pemesanan juga dapat dilakukan langsung via WhatsApp admin untuk respon cepat.', 2, 1, '2026-10-09 13:46:28'),
(3, 'Dampak Sosial', 'bi-heart-pulse-fill', 'danger', 'Ke mana alokasi keuntungan dari penjualan produk?', 'Seluruh hasil penjualan dialokasikan untuk beasiswa pendidikan anak panti, dana tabungan mandiri anak, serta operasional pelatihan jahit secara berkelanjutan di Panti Asuhan Al-Jihad Surabaya.', 3, 1, '2026-10-09 13:46:28'),
(4, 'Pengiriman', 'bi-truck', 'info', 'Apakah JARIA Craft melayani pengiriman ke luar kota?', 'Ya, kami melayani pengiriman ke seluruh daerah di Indonesia menggunakan ekspedisi tepercaya (JNE, J&T, POS, dll) dari Surabaya.', 4, 1, '2026-10-09 13:46:28'),
(5, 'Custom Order', 'bi-scissors', 'warning', 'Apakah bisa memesan kerajinan secara custom/suvenir acara?', 'Sangat bisa! Kami menerima pesanan suvenir dalam jumlah besar untuk pernikahan, seminar, atau acara spesial lainnya. Silakan hubungi kami via menu Kontak / WhatsApp untuk konsultasi desain dan harga khusus.', 5, 1, '2026-10-09 13:46:28');

-- --------------------------------------------------------

--
-- Table structure for table `faq_banners`
--

CREATE TABLE `faq_banners` (
  `id` int(11) NOT NULL,
  `image_path` varchar(255) NOT NULL,
  `badge_text` varchar(255) DEFAULT 'Bantuan & Informasi',
  `title` varchar(255) DEFAULT 'Pertanyaan Sering Diajukan',
  `description` text DEFAULT NULL,
  `sort_order` int(11) DEFAULT 0,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `faq_banners`
--

INSERT INTO `faq_banners` (`id`, `image_path`, `badge_text`, `title`, `description`, `sort_order`, `is_active`, `created_at`) VALUES
(1, 'assets/images/banners/faq_banner_1791646711_238.jpg', 'Bantuan & Informasi', 'Pertanyaan Sering Diajukan', 'Temukan jawaban lengkap seputar pemesanan, produk kerajinan perca, dan dampak sosial pemberdayaan JARIA Craft.', 1, 1, '2026-10-09 13:46:28');

-- --------------------------------------------------------

--
-- Table structure for table `footer_links`
--

CREATE TABLE `footer_links` (
  `id` int(11) NOT NULL,
  `section_name` varchar(100) DEFAULT 'Tautan Cepat',
  `title` varchar(100) NOT NULL,
  `url` varchar(255) NOT NULL,
  `sort_order` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `footer_links`
--

INSERT INTO `footer_links` (`id`, `section_name`, `title`, `url`, `sort_order`) VALUES
(1, 'Navigasi Utama', 'Katalog Produk', 'catalog.php', 1),
(2, 'Navigasi Utama', 'Kisah Kami', 'about.php', 2),
(3, 'Navigasi Utama', 'Dampak Sosial', 'impact.php', 3),
(4, 'Layanan', 'Lacak Pesanan', 'orders.php', 1),
(5, 'Layanan', 'Syarat & Ketentuan', 'faq.php', 2);

-- --------------------------------------------------------

--
-- Table structure for table `gallery`
--

CREATE TABLE `gallery` (
  `id` int(11) NOT NULL,
  `type` enum('image','video') NOT NULL DEFAULT 'image',
  `title` varchar(255) NOT NULL,
  `caption` text DEFAULT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `media_url` varchar(500) DEFAULT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 1,
  `created_at` datetime DEFAULT current_timestamp(),
  `is_active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gallery`
--

INSERT INTO `gallery` (`id`, `type`, `title`, `caption`, `file_path`, `media_url`, `sort_order`, `created_at`, `is_active`) VALUES
(13, 'video', 'SABDCW', 'dwqfwvewv', NULL, 'https://youtu.be/nXOfv4-tT9o?si=ghhwqJdhbU7A_aw6', 1, '2026-10-09 13:07:03', 1),
(14, 'video', 'efeff', 'fvfveq', '', 'https://youtu.be/En4dlTdM2tk?si=6ORtW643m4Ll9BWU', 2, '2026-10-10 18:23:29', 1),
(15, 'image', 'ewfef', 'wefwefwef', 'assets/images/gallery/gal_1791687631_240.png', '', 3, '2026-10-11 10:00:31', 1);

-- --------------------------------------------------------

--
-- Table structure for table `hero_slides`
--

CREATE TABLE `hero_slides` (
  `id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `badge_text_1` varchar(255) DEFAULT 'Wirausaha Sosial Pemberdayaan',
  `badge_text_2` varchar(255) DEFAULT 'Ilkom E1 S5 UINSA × Panti Asuhan Al-Jihad',
  `title` varchar(255) NOT NULL DEFAULT 'Sentuhan Karya Jahit Ceria',
  `description` text DEFAULT NULL,
  `btn_text_1` varchar(100) DEFAULT 'Jelajahi Katalog',
  `btn_link_1` varchar(255) DEFAULT 'catalog.php',
  `btn_text_2` varchar(100) DEFAULT 'Kisah Kami →',
  `btn_link_2` varchar(255) DEFAULT 'about.php',
  `sort_order` int(11) NOT NULL DEFAULT 1,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hero_slides`
--

INSERT INTO `hero_slides` (`id`, `image`, `badge_text_1`, `badge_text_2`, `title`, `description`, `btn_text_1`, `btn_link_1`, `btn_text_2`, `btn_link_2`, `sort_order`, `is_active`, `created_at`) VALUES
(4, 'hero_1791452045_412.jpg', 'Wirausaha Sosial Pemberdayaan', 'Ilkom E1 Semester 5 UINSA × Panti Asuhan Al-Jihad', 'JARIA', 'Sinergi kreatif Mahasiswa Ilmu Komunikasi Kelas E1 Semester 5 UINSA bersama adik-adik Panti Asuhan Al-Jihad Surabaya.', 'Jelajahi Katalog', 'catalog.php', 'Kisah Kami →', 'about.php', 2, 1, '2026-10-08 09:01:19'),
(6, 'hero_1792031601_549.jpg', 'Wirausaha Sosial Pemberdayaan', 'Ilkom E1 Semester 5 UINSA × Panti Asuhan Al-Jihad', 'ffhffy', 'erwewtw', 'Jelajahi Katalog', 'catalog.php', 'Kisah Kami →', 'about.php', 1, 1, '2026-10-15 02:33:21');

-- --------------------------------------------------------

--
-- Table structure for table `home_categories`
--

CREATE TABLE `home_categories` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `category_keyword` varchar(255) NOT NULL,
  `icon_class` varchar(100) NOT NULL DEFAULT 'bi-stars',
  `sort_order` int(11) NOT NULL DEFAULT 1,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `home_categories`
--

INSERT INTO `home_categories` (`id`, `title`, `category_keyword`, `icon_class`, `sort_order`, `is_active`, `created_at`) VALUES
(1, 'Bros', 'Bros', 'bi-flower1', 1, 1, '2026-10-11 02:35:46'),
(2, 'Keychain', 'Keychain', 'bi-key-fill', 2, 1, '2026-10-11 02:35:46'),
(3, 'Sling Bag', 'Sling Bag', 'bi-bag-heart-fill', 3, 1, '2026-10-11 02:35:46'),
(4, 'Karya Lainnya', 'Kerajinan Lainnya', 'bi-stars', 4, 1, '2026-10-11 02:35:46');

-- --------------------------------------------------------

--
-- Table structure for table `impact_banners`
--

CREATE TABLE `impact_banners` (
  `id` int(11) NOT NULL,
  `image_path` varchar(255) NOT NULL,
  `badge_text` varchar(255) DEFAULT 'Jejak Kebaikan Pembelian Anda',
  `title` varchar(255) DEFAULT 'Dampak Sosial JARIA Craft',
  `description` text DEFAULT NULL,
  `sort_order` int(11) DEFAULT 0,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `impact_banners`
--

INSERT INTO `impact_banners` (`id`, `image_path`, `badge_text`, `title`, `description`, `sort_order`, `is_active`, `created_at`) VALUES
(3, 'assets/images/banners/banner_1791643113_164.png', 'Jejak Kebaikan Pembelian Anda', 'Dampak Sosial JARIA Craft', 'wdwwqdwq', 1, 1, '2026-10-10 21:38:33');

-- --------------------------------------------------------

--
-- Table structure for table `impact_items`
--

CREATE TABLE `impact_items` (
  `id` int(11) NOT NULL,
  `icon` varchar(100) DEFAULT 'bi-heart-fill',
  `color` varchar(50) DEFAULT 'primary',
  `title` varchar(255) NOT NULL,
  `short_desc` text NOT NULL,
  `full_desc` text NOT NULL,
  `metrics` text DEFAULT NULL,
  `sort_order` int(11) DEFAULT 0,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `impact_items`
--

INSERT INTO `impact_items` (`id`, `icon`, `color`, `title`, `short_desc`, `full_desc`, `metrics`, `sort_order`, `is_active`, `created_at`) VALUES
(1, 'bi-mortarboard-fill', 'primary', 'Beasiswa & Perlengkapan Sekolah', 'Menyokong biaya SPP, buku, seragam, dan perlengkapan belajar anak-anak panti.', 'Setiap keuntungan penjualan kerajinan JARIA Craft disalurkan secara langsung untuk menunjang dana pendidikan anak-anak Panti Asuhan Al-Jihad Surabaya.', 'Mendukung dana SPP & kebutuhan sekolah bulanan anak-anak panti.', 1, 1, '2026-10-09 13:18:38'),
(3, 'bi-piggy-bank-fill', 'warning', 'Tabungan Kemandirian Finansial', 'Alokasi bagi hasil usaha sebagai tabungan masa depan saat lulus dari panti asuhan.', 'Sebagian dari pendapatan penjualan disimpan dalam bentuk tabungan pribadi adik-adik panti.', 'Membangun kebiasaan menabung dan literasi keuangan sejak dini.', 3, 1, '2026-10-09 13:18:38'),
(4, 'bi-recycle', 'info', 'Daur Ulang Tekstil Zero Waste', 'Memanfaatkan sisa kain perca konveksi menjadi produk fungsional bernilai tinggi.', 'Limbah kain perca sisa industri konveksi yang tadinya dibuang, disulap menjadi produk kerajinan tangan yang cantik dan unik.', 'Mencegah puluhan kilogram limbah kain terbuang sia-sia ke TPA.', 4, 1, '2026-10-09 13:18:38'),
(5, 'bi-rocket-takeoff-fill', 'danger', 'Penanaman Mental Wirausaha', 'Melatih rasa percaya diri, manajemen produk, dan konsep komunikasi pemasaran.', 'Proyek ini melibatkan anak-anak panti dalam proses perencanaan produk, kontrol kualitas, hingga pengemasan.', 'Meningkatkan rasa percaya diri dan karakter tangguh anak-anak panti.', 5, 1, '2026-10-09 13:18:38'),
(6, 'bi-house-heart-fill', 'primary', 'Fasilitas Penunjang Panti', 'Pengadaan perlengkapan operasional dan perbaikan sarana ruang belajar panti.', 'Sebagian dari dana sosial dialokasikan untuk pemeliharaan fasilitas umum di Panti Asuhan Al-Jihad Surabaya.', 'Menciptakan lingkungan panti yang aman, nyaman, dan mendukung kegiatan belajar.', 6, 1, '2026-10-09 13:18:38'),
(8, 'bi-scissors', 'success', 'Pelatihan Jahit & Keterampilan', 'Penyediaan fasilitas mesin jahit dan modul pelatihan pola/penciptaan karya secara berkala.', 'Melalui pendampingan dari Mahasiswa Ilmu Komunikasi E1 UINSA dan praktisi konveksi, adik-adik panti dibekali teknik dasar hingga mahir dalam mengolah kain perca menjadi aksesoris, bros, keychain, dan tas bernilai jual tinggi.', 'Pelatihan rutin mingguan yang mengasah keahlian motorik & kreativitas.', 2, 1, '2026-10-10 21:43:39');

-- --------------------------------------------------------

--
-- Table structure for table `income`
--

CREATE TABLE `income` (
  `id` int(11) NOT NULL,
  `source` varchar(100) NOT NULL,
  `title` varchar(150) NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `date` date DEFAULT NULL,
  `description` text DEFAULT NULL,
  `income_date` date NOT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `income`
--

INSERT INTO `income` (`id`, `source`, `title`, `amount`, `date`, `description`, `income_date`, `notes`, `created_at`) VALUES
(1, '', '', 1000000.00, '2026-10-07', 'tes', '0000-00-00', NULL, '2026-10-07 06:09:27'),
(2, '', '', 5000000.00, '2026-10-07', 'investor', '0000-00-00', NULL, '2026-10-07 06:19:31');

-- --------------------------------------------------------

--
-- Table structure for table `inventory_movements`
--

CREATE TABLE `inventory_movements` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `movement_type` enum('in','out','adjustment','sale') NOT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `navbar_menu`
--

CREATE TABLE `navbar_menu` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `url` varchar(255) NOT NULL,
  `sort_order` int(11) DEFAULT 1,
  `is_active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `navbar_menu`
--

INSERT INTO `navbar_menu` (`id`, `title`, `url`, `sort_order`, `is_active`) VALUES
(1, 'Beranda', 'index.php', 1, 1),
(2, 'Katalog Produk', 'catalog.php', 2, 1),
(3, 'Kisah Kami', 'about.php', 3, 1),
(4, 'Dampak Sosial', 'impact.php', 4, 1),
(5, 'Berita', 'news.php', 5, 1),
(6, 'Ulasan', 'reviews.php', 6, 1),
(7, 'FAQ', 'faq.php', 7, 1),
(8, 'Kontak', 'contact.php', 8, 1);

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `content` longtext NOT NULL,
  `featured_image` varchar(255) DEFAULT NULL,
  `hashtags` varchar(255) DEFAULT NULL COMMENT 'Contoh: #JariaCraft #KerajinanPerca #UINSA',
  `meta_description` varchar(255) DEFAULT NULL,
  `views_count` int(11) DEFAULT 0,
  `is_published` tinyint(1) DEFAULT 1,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `category_id`, `title`, `slug`, `content`, `featured_image`, `hashtags`, `meta_description`, `views_count`, `is_published`, `created_at`, `updated_at`) VALUES
(2, 1, 'Mahasiswa Ilmu Komunikasi UINSA Kolaborasi dengan Anak Panti Asuhan Al-Jihad Surabaya dalam Pengolahan Kain Perca', 'mahasiswa-ilmu-komunikasi-uinsa-kolaborasi-dengan-anak-panti-asuhan-al-jihad-surabaya-dalam-pengolahan-kain-perca-1792172519', '<h1>Mahasiswa Ilmu Komunikasi UINSA Kolaborasi dengan Anak Panti Asuhan Al-Jihad Surabaya dalam Pengolahan Kain Perca</h1>\r\n\r\n<p><strong>SURABAYA</strong> &ndash; Mahasiswa Program Studi Ilmu Komunikasi semester 5 kelas E1, Universitas Islam Negeri Sunan Ampel Surabaya (UINSA), berkolaborasi dengan adik-adik Panti Asuhan Al-Jihad Surabaya dalam kegiatan pengolahan kain perca menjadi produk kerajinan yang memiliki nilai guna dan nilai ekonomi.</p>\r\n\r\n<p>Kegiatan ini merupakan bagian dari upaya mengembangkan kreativitas serta mendorong pemanfaatan limbah kain menjadi barang yang lebih bermanfaat. Kain perca yang umumnya merupakan sisa proses menjahit diolah menjadi berbagai produk kerajinan, seperti gantungan kunci, bros, tas selempang (<em>sling bag</em>), dan beragam kerajinan lainnya.</p>\r\n\r\n<p>Melalui kolaborasi ini, mahasiswa Ilmu Komunikasi UINSA tidak hanya berperan dalam mendampingi proses pengembangan produk, tetapi juga mendorong adik-adik panti asuhan untuk mengeksplorasi kreativitas dan menghasilkan karya dari bahan yang sederhana. Kegiatan ini menjadi ruang belajar bersama yang mengedepankan kerja sama, inovasi, dan kepedulian sosial.</p>\r\n\r\n<p>Selain menghasilkan produk kerajinan, kegiatan tersebut juga mengandung nilai edukatif mengenai pemanfaatan kembali bahan sisa agar tidak terbuang sia-sia. Pengolahan kain perca diharapkan dapat menumbuhkan kesadaran tentang pentingnya kreativitas dalam mengurangi limbah sekaligus membuka peluang pengembangan usaha berbasis kerajinan.</p>\r\n\r\n<p>Kolaborasi ini mencerminkan penerapan kewirausahaan sosial yang mengintegrasikan kreativitas, pemberdayaan masyarakat, dan potensi ekonomi. Melalui kegiatan tersebut, mahasiswa diharapkan dapat mengimplementasikan pengetahuan yang diperoleh selama perkuliahan, khususnya dalam membangun komunikasi dan kerja sama yang memberikan manfaat bagi masyarakat.</p>\r\n\r\n<p>Ke depannya, produk-produk kerajinan berbahan kain perca ini berpotensi dikembangkan lebih lanjut melalui pengemasan produk, pemasaran digital, serta pengenalan kepada masyarakat luas. Dengan demikian, kegiatan ini tidak hanya menjadi sarana berkarya, tetapi juga langkah awal dalam membangun peluang usaha kreatif yang berkelanjutan.</p>\r\n', 'assets/images/news/news_1792172519_893.jpg', '#JariaCraft #KerajinanPerca', '', 1, 1, '2026-10-17 00:41:59', '2026-10-17 00:42:08'),
(3, 1, 'Sulap Limbah Kain Menjadi Kerajinan Bernilai, Mahasiswa Ilmu Komunikasi UINSA Gandeng Anak Panti Asuhan Al-Jihad', 'sulap-limbah-kain-menjadi-kerajinan-bernilai-mahasiswa-ilmu-komunikasi-uinsa-gandeng-anak-panti-asuhan-al-jihad-1792199564', '<h1>Sulap Limbah Kain Menjadi Kerajinan Bernilai, Mahasiswa Ilmu Komunikasi UINSA Gandeng Anak Panti Asuhan Al-Jihad</h1>\r\n\r\n<p><strong>SURABAYA</strong> &ndash; Kreativitas dapat tumbuh dari bahan-bahan sederhana yang kerap dianggap tidak lagi berguna. Hal inilah yang menjadi semangat kolaborasi mahasiswa Program Studi Ilmu Komunikasi semester 5 kelas E1, Universitas Islam Negeri Sunan Ampel Surabaya (UINSA), bersama adik-adik Panti Asuhan Al-Jihad Surabaya dalam mengolah kain perca menjadi produk kerajinan kreatif.</p>\r\n\r\n<p>Kain perca merupakan potongan kain sisa yang masih memiliki potensi untuk dimanfaatkan kembali. Melalui proses pengolahan yang kreatif, bahan tersebut dapat disulap menjadi berbagai produk, mulai dari gantungan kunci, bros, tas selempang (<em>sling bag</em>), hingga kerajinan lainnya yang memiliki daya tarik tersendiri.</p>\r\n\r\n<p>Kolaborasi ini menjadi salah satu upaya untuk memperkenalkan bahwa keterbatasan bahan bukanlah penghalang untuk menghasilkan karya yang bernilai. Dengan memanfaatkan kain perca, mahasiswa dan adik-adik panti asuhan dapat mengeksplorasi ide, mengembangkan keterampilan, serta menciptakan produk yang memiliki fungsi dan nilai estetika.</p>\r\n\r\n<p>Lebih dari sekadar menghasilkan kerajinan, kegiatan ini juga mengedepankan semangat pemberdayaan dan kepedulian sosial. Keterlibatan adik-adik panti asuhan menjadi bagian penting dalam proses kreatif, sekaligus membuka ruang untuk belajar, berkreasi, dan mengembangkan potensi diri.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p class=\"align-center\"><img alt=\"\" height=\"340\" src=\"assets/images/news/blog_img_1792200068_8069.png\" width=\"605\" /></p>\r\n\r\n<p>Bagi mahasiswa Ilmu Komunikasi UINSA, kolaborasi ini menjadi kesempatan untuk menerapkan nilai-nilai kewirausahaan sosial secara langsung. Mahasiswa tidak hanya dituntut untuk menghasilkan gagasan kreatif, tetapi juga memahami bagaimana sebuah kegiatan dapat memberikan manfaat nyata bagi lingkungan sosial.</p>\r\n\r\n<p>Pemanfaatan kain perca juga membawa pesan tentang pentingnya kepedulian terhadap lingkungan. Alih-alih membiarkan sisa kain menjadi limbah, bahan tersebut dapat dimanfaatkan kembali menjadi produk yang berpotensi memiliki nilai ekonomi. Pendekatan ini menunjukkan bahwa kreativitas dapat berjalan beriringan dengan upaya mengurangi limbah tekstil.</p>\r\n\r\n<p>Melalui kolaborasi ini, diharapkan kerajinan berbahan kain perca dapat terus dikembangkan menjadi produk kreatif yang berkelanjutan. Dukungan dalam pengembangan desain, pengemasan, dan pemasaran digital juga berpotensi memperluas jangkauan produk agar dikenal oleh masyarakat.</p>\r\n\r\n<p>Kolaborasi mahasiswa Ilmu Komunikasi UINSA dan adik-adik Panti Asuhan Al-Jihad Surabaya menjadi pengingat bahwa sebuah karya tidak hanya dinilai dari hasil akhirnya, tetapi juga dari proses, kreativitas, dan manfaat sosial yang menyertainya. Dari potongan kain yang sederhana, tumbuh peluang untuk menciptakan karya sekaligus menghadirkan nilai bagi sesama.</p>\r\n', 'assets/images/news/news_1792199564_858.jpg', '#JariaCraft #KerajinanPerca', '', 10, 1, '2026-10-17 08:12:44', '2026-10-17 14:33:21');

-- --------------------------------------------------------

--
-- Table structure for table `news_banners`
--

CREATE TABLE `news_banners` (
  `id` int(11) NOT NULL,
  `image_path` varchar(255) NOT NULL,
  `badge_text_1` varchar(100) DEFAULT 'Kabar & Artikel',
  `badge_text_2` varchar(100) DEFAULT 'Seputar JARIA Craft',
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `sort_order` int(11) DEFAULT 1,
  `is_active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `news_banners`
--

INSERT INTO `news_banners` (`id`, `image_path`, `badge_text_1`, `badge_text_2`, `title`, `description`, `sort_order`, `is_active`) VALUES
(1, 'assets/images/banners/news_banner_1792118941_723.jpeg', 'Kabar & Artikel', 'Seputar JARIA Craft', 'aas', 'cssadas', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `news_categories`
--

CREATE TABLE `news_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(110) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `news_categories`
--

INSERT INTO `news_categories` (`id`, `name`, `slug`, `created_at`) VALUES
(1, 'Kegiatan & Berita', 'kegiatan-berita', '2026-10-12 09:07:18'),
(2, 'Edukasi Perca', 'edukasi-perca', '2026-10-12 09:07:18'),
(3, 'Dampak Sosial', 'dampak-sosial', '2026-10-12 09:07:18');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `order_number` varchar(50) NOT NULL,
  `order_code` varchar(50) NOT NULL,
  `customer_name` varchar(100) NOT NULL,
  `whatsapp` varchar(30) NOT NULL,
  `customer_email` varchar(100) NOT NULL,
  `customer_phone` varchar(20) NOT NULL,
  `customer_address` text NOT NULL,
  `notes` text DEFAULT NULL,
  `total_amount` decimal(12,2) NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'paid',
  `order_status` enum('Pending','Paid','Processing','Shipped','Completed','Cancelled') DEFAULT 'Pending',
  `payment_status` enum('Pending','Paid','Failed','Expired','Cancelled') DEFAULT 'Pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `order_number`, `order_code`, `customer_name`, `whatsapp`, `customer_email`, `customer_phone`, `customer_address`, `notes`, `total_amount`, `status`, `order_status`, `payment_status`, `created_at`, `updated_at`) VALUES
(52, 'ORD-20261018-7D62', 'ORD-20261018-7D62', 'lalapo', '09376276', '', '', '', NULL, 30000.00, 'paid', 'Pending', 'Paid', '2026-10-18 03:54:53', '2026-10-18 03:54:53'),
(53, 'ORD-20261018-FB79', 'ORD-20261018-FB79', 'hahahahaa', '23761618261', '', '', '', NULL, 70000.00, 'paid', 'Pending', 'Paid', '2026-10-18 03:55:23', '2026-10-18 03:55:23');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(150) NOT NULL,
  `price` decimal(12,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `subtotal` decimal(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `product_name`, `price`, `quantity`, `subtotal`) VALUES
(55, 52, 21, 'Sling Bag', 30000.00, 1, 0.00),
(56, 53, 22, 'keychain', 5000.00, 2, 0.00),
(57, 53, 21, 'Sling Bag', 30000.00, 2, 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `transaction_id` varchar(100) DEFAULT NULL,
  `payment_type` varchar(50) DEFAULT 'qris',
  `gross_amount` decimal(12,2) NOT NULL,
  `status` varchar(50) DEFAULT 'pending',
  `snap_token` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_logs`
--

CREATE TABLE `payment_logs` (
  `id` int(11) NOT NULL,
  `order_code` varchar(50) NOT NULL,
  `raw_response` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `slug` varchar(150) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(255) DEFAULT 'default-product.jpg',
  `image2` varchar(255) DEFAULT NULL,
  `image3` varchar(255) DEFAULT NULL,
  `video_url` varchar(255) DEFAULT NULL,
  `price` decimal(12,2) NOT NULL DEFAULT 0.00,
  `hpp` decimal(12,2) NOT NULL DEFAULT 0.00,
  `stock` int(11) NOT NULL DEFAULT 0,
  `material` varchar(100) DEFAULT NULL,
  `video_path` varchar(255) DEFAULT NULL,
  `size` varchar(50) DEFAULT NULL,
  `weight` int(11) DEFAULT 0,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `name`, `slug`, `description`, `image`, `image2`, `image3`, `video_url`, `price`, `hpp`, `stock`, `material`, `video_path`, `size`, `weight`, `is_active`, `created_at`, `updated_at`) VALUES
(12, 2, 'Bros Rijal', 'bros-rijal-1791359674', 'lucu pokoke', 'prod_1791359577_6ac5fa59cc6ad.jpg', 'prod_1791359577_6ac5fa59cdf42.jpg', 'prod_1791359577_6ac5fa59ce91e.jpg', 'https://www.tiktok.com/@ratnadwiseptiyani/video/7676400828009270536?is_from_webapp=1&amp;sender_device=pc', 5000.00, 0.00, 22, 'perca katun', NULL, '7 cm x 5 cm', 1, 0, '2026-10-07 06:49:08', '2026-10-15 02:13:53'),
(13, 1, 'Keychain', 'keychain-1791359791', 'LUCU', 'prod_1791359782_6ac5fb26e30e8.jpg', 'prod_1791359782_6ac5fb26e5ffd.jpg', 'prod_1791359782_6ac5fb26e7536.jpg', 'https://www.tiktok.com/@jahitku_hub/video/7686862191961574663?is_from_webapp=1&amp;amp;sender_device=pc', 5000.00, 0.00, 8, 'perca katun', NULL, '7 cm x 5 cm', 1, 0, '2026-10-07 07:56:22', '2026-10-15 02:13:55'),
(14, 3, 'Sling Bag', 'sling-bag-1791432033', 'gemas', 'prod_1791359868_6ac5fb7cf3792.jpg', 'prod_1791359868_6ac5fb7cf3f58.jpg', 'prod_1791359869_6ac5fb7d023ed.jpg', 'https://www.tiktok.com/@iqlim52419/video/7303853168234892549?is_from_webapp=1&amp;amp;amp;sender_device=pc', 25000.00, 0.00, 1, 'perca katun', NULL, '5 cm x 12 cm', 5, 0, '2026-10-07 07:57:49', '2026-10-15 02:14:00'),
(15, 4, 'Pouch', 'pouch-1791531805', 'tes aja', 'prod_1791444244_6ac7451423544.jpg', 'prod_1791444244_6ac7451426390.jpg', 'prod_1791444244_6ac745142681e.jpg', 'https://www.instagram.com/reel/DZ96YmHx7II/?utm_source=ig_web_button_share_sheet', 7000.00, 0.00, 1, 'perca katun', NULL, '7 cm x 5 cm', 15, 0, '2026-10-08 07:24:04', '2026-10-12 03:58:56'),
(16, 4, 'boneka', 'boneka-1791562140', 'ndojoeqwfdewnj', 'prod_1791562140_6ac9119cc361b.png', 'prod_1791562140_6ac9119cc3d52.jpg', 'prod_1791562140_6ac9119cc4267.jpg', 'https://youtu.be/kTCA9C4f9g4?si=NWFxfmVVRNvC5-lW', 30000.00, 0.00, 1, 'perca katun', NULL, '5 cm x 12 cm', 2, 0, '2026-10-09 16:09:00', '2026-10-12 03:58:53'),
(17, 4, 'baju', 'baju-1791686502', 'efefew', 'prod_1791686502_6acaf766c7b2a.jpg', 'prod_1791686502_6acaf766c93de.jpg', 'prod_1791686502_6acaf766c9c61.jpg', 'https://youtu.be/kTCA9C4f9g4?si=NWFxfmVVRNvC5-lW', 35000.00, 0.00, 10, 'perca katun', NULL, '7 cm x 5 cm', 12, 0, '2026-10-11 02:41:42', '2026-10-15 02:13:58'),
(18, 4, 'daster', 'daster-1791686892', 'fewvewvew', 'prod_1791686892_6acaf8ecccda8.jpg', 'prod_1791686892_6acaf8eccfaf2.jpg', 'prod_1791686892_6acaf8ecd0008.png', 'https://www.tiktok.com/@jahitku_hub/video/7686862191961574663?is_from_webapp=1&amp;amp;sender_device=pc', 30000.00, 0.00, 2, 'perca katun', NULL, '5 cm x 12 cm', 21, 0, '2026-10-11 02:48:12', '2026-10-12 03:58:48'),
(19, 4, 'kriuk', 'kriuk-1791774119', 'yurekyteyteyteytdd', 'prod_1791774119_6acc4da725aa0.png', 'prod_1791774119_6acc4da727722.png', 'prod_1791774119_6acc4da728030.png', 'https://www.instagram.com/reel/DZ96YmHx7II/?utm_source=ig_web_button_share_sheet', 7000.00, 0.00, 4, 'Qewaes', NULL, '7 cm x 5 cm', 4, 0, '2026-10-12 03:01:59', '2026-10-12 03:58:45'),
(20, 4, 'kriuk', 'kriuk-1791774173', 'yurekyteyteyteytdd', 'prod_1791774173_6acc4ddd9950e.png', 'prod_1791774173_6acc4ddd99b00.png', 'prod_1791774173_6acc4ddd9b1dc.png', 'https://www.instagram.com/reel/DZ96YmHx7II/?utm_source=ig_web_button_share_sheet', 7000.00, 0.00, 4, 'Qewaes', NULL, '7 cm x 5 cm', 4, 0, '2026-10-12 03:02:53', '2026-10-12 03:02:59'),
(21, 3, 'Sling Bag', 'sling-bag-1791779830', 'kuge', 'prod_1791779830_6acc63f649f04.jpg', 'prod_1791779830_6acc63f64a992.jpg', 'prod_1791779830_6acc63f64cc83.jpg', 'https://www.tiktok.com/@jahitku_hub/video/7686862191961574663?is_from_webapp=1&amp;amp;sender_device=pc', 30000.00, 0.00, 2, 'perca katun', NULL, '7 cm x 5 cm', 12, 1, '2026-10-12 04:37:10', '2026-10-18 03:55:23'),
(22, 1, 'keychain', 'keychain-1792030247', 'FHFFHFFYFOIRW', 'prod_1792030247_6ad0362761745.jpg', 'prod_1792030247_6ad0362762be8.jpg', 'prod_1792030247_6ad0362763244.jpg', 'https://www.instagram.com/reel/DZ96YmHx7II/?utm_source=ig_web_button_share_sheet', 5000.00, 0.00, 3, 'perca katun', NULL, '7 cm x 5 cm', 12, 1, '2026-10-15 02:10:47', '2026-10-18 03:55:23');

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `image_path` varchar(255) NOT NULL,
  `is_primary` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `customer_name` varchar(150) NOT NULL,
  `avatar_path` varchar(255) DEFAULT NULL,
  `rating` tinyint(1) DEFAULT 5,
  `comment` text NOT NULL,
  `photo_path` varchar(255) DEFAULT NULL,
  `likes` int(11) DEFAULT 0,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `customer_name`, `avatar_path`, `rating`, `comment`, `photo_path`, `likes`, `created_at`) VALUES
(1, 'fytf', '', 5, 'giuguy', '', 0, '2026-10-10 18:16:06'),
(2, 'tes', 'uploads/avatars/1791631006_avatar_990.jpg', 5, 'ethhethehb', 'uploads/testimonials/1791631006_review_761.png', 0, '2026-10-10 18:16:46');

-- --------------------------------------------------------

--
-- Table structure for table `review_banners`
--

CREATE TABLE `review_banners` (
  `id` int(11) NOT NULL,
  `image_path` varchar(255) NOT NULL,
  `badge_text` varchar(100) DEFAULT 'Apresiasi & Testimoni',
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `sort_order` int(11) DEFAULT 1,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `review_banners`
--

INSERT INTO `review_banners` (`id`, `image_path`, `badge_text`, `title`, `description`, `sort_order`, `is_active`, `created_at`) VALUES
(1, 'assets/images/banners/banners1.jpg', 'Apresiasi & Testimoni', 'Ulasan & Testimoni Audiens', 'Dengarkan cerita, apresiasi, dan pengalaman nyata dari para pengunjung serta pendukung pemberdayaan JARIA Craft.', 1, 1, '2026-10-10 11:14:09');

-- --------------------------------------------------------

--
-- Table structure for table `site_settings`
--

CREATE TABLE `site_settings` (
  `id` int(11) NOT NULL,
  `setting_key` varchar(100) NOT NULL,
  `setting_value` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `site_settings`
--

INSERT INTO `site_settings` (`id`, `setting_key`, `setting_value`) VALUES
(1, 'site_logo', 'assets/images/logo_1792240522.png'),
(2, 'site_qris', 'assets/images/qris.png'),
(3, 'qris_account_name', 'JARIA CRAFT'),
(4, 'footer_copyright_text', 'JARIA Craft (Jahit Ceria) — Panti Asuhan Al-Jihad Surabaya.'),
(5, 'footer_subtext', 'Proyek Kewirausahaan Sosial | Mahasiswa Ilmu Komunikasi E1 Semester 5 UIN Sunan Ampel Surabaya.'),
(6, 'footer_about_text', 'Wirausaha sosial pemberdayaan santri Panti Asuhan Al-Jihad Surabaya menyulap kain perca menjadi kerajinan bernilai tinggi.'),
(7, 'footer_phone', '+62 812-3456-7890'),
(8, 'footer_email', 'mhafizawwalul@gmail.com'),
(9, 'footer_address', 'Panti Asuhan Al-Jihad, Surabaya, Jawa Timur');

-- --------------------------------------------------------

--
-- Table structure for table `story_points`
--

CREATE TABLE `story_points` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `detail_text` text DEFAULT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 1,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `story_points`
--

INSERT INTO `story_points` (`id`, `title`, `description`, `detail_text`, `sort_order`, `is_active`, `created_at`) VALUES
(1, 'Arti Nama JARIA:', 'Singkatan dari Jahit Ceria, simbol semangat & keceriaan berkarya.', '', 1, 1, '2026-10-08 09:46:42'),
(2, 'Inisiator Proyek:', 'Mahasiswa Ilmu Komunikasi Kelas E1 Semester 5 UINSA Surabaya.', 'Mahasiswa Ilmu Komunikasi Kelas E1 Semester 5 UINSA Surabaya.', 2, 1, '2026-10-08 09:46:42'),
(3, 'Mitra Pemberdayaan:', 'Anak-anak Panti Asuhan Al-Jihad Surabaya.', NULL, 3, 1, '2026-10-08 09:46:42'),
(4, 'Mata Kuliah:', 'Proyek Kewirausahaan Sosial.', NULL, 4, 1, '2026-10-08 09:46:42'),
(5, 'Harapan Utama:', 'Program dapat berkelanjutan & menjadi bekal kemandirian masa depan anak-anak panti.', NULL, 5, 1, '2026-10-08 09:46:42');

-- --------------------------------------------------------

--
-- Table structure for table `story_settings`
--

CREATE TABLE `story_settings` (
  `id` int(11) NOT NULL,
  `badge_text` varchar(255) DEFAULT 'Kolaborasi Sosial & Pemberdayaan',
  `title_prefix` varchar(255) DEFAULT 'Di Balik Sentuhan Karya',
  `title_highlight` varchar(255) DEFAULT 'JARIA Craft',
  `lead_text` text DEFAULT NULL,
  `paragraph_1` text DEFAULT NULL,
  `paragraph_2` text DEFAULT NULL,
  `btn_1_text` varchar(100) DEFAULT 'Lihat Karya Kerajinan',
  `btn_1_link` varchar(255) DEFAULT 'catalog.php',
  `btn_2_text` varchar(100) DEFAULT 'Dampak Sosial',
  `btn_2_link` varchar(255) DEFAULT 'impact.php',
  `card_title` varchar(255) DEFAULT 'Sinergi Pendidikan & Sosial',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `story_settings`
--

INSERT INTO `story_settings` (`id`, `badge_text`, `title_prefix`, `title_highlight`, `lead_text`, `paragraph_1`, `paragraph_2`, `btn_1_text`, `btn_1_link`, `btn_2_text`, `btn_2_link`, `card_title`, `updated_at`) VALUES
(1, 'Kolaborasi Sosial & Pemberdayaan', 'Di Balik Sentuhan Karya', 'JARIA Craft', 'JARIA merupakan singkatan dari Jahit Ceria — sebuah inisiatif wirausaha sosial yang menghadirkan keceriaan dan keterampilan melalui setiap lembar karya kain perca.', 'Program ini merupakan wujud aksi nyata dalam mata kuliah Proyek Kewirausahaan Sosial yang diinisiasi oleh Mahasiswa Ilmu Komunikasi Kelas E1 Semester 5 UIN Sunan Ampel Surabaya (UINSA) berkolaborasi secara langsung dengan anak-anak Panti Asuhan Al-Jihad Surabaya.', 'Melalui kegiatan olah kain perca menjadi berbagai produk kerajinan tangan bernilai jual, kami tidak hanya memanfaatkan kembali limbah kain konveksi, melainkan juga menanamkan jiwa kewirausahaan, kreativitas, dan rasa percaya diri pada adik-adik panti. Harapan besarnya, proyek ini dapat berjalan secara berkelanjutan (sustainable) dan menjadi langkah awal yang baik dalam membekali adik-adik Panti Asuhan Al-Jihad menuju kemandirian di masa depan.', 'Lihat Karya Kerajinan', 'catalog.php', 'Dampak Sosial', 'impact.php', 'Sinergi Pendidikan & Sosial', '2026-10-08 09:46:42');

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

CREATE TABLE `testimonials` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT 'Anonim',
  `rating` int(1) NOT NULL DEFAULT 5,
  `message` text NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `status` enum('approved','pending') DEFAULT 'approved',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `role` varchar(100) DEFAULT 'Pembeli',
  `avatar` varchar(255) DEFAULT NULL,
  `likes_count` int(11) DEFAULT 0,
  `is_approved` tinyint(1) DEFAULT 1,
  `comment` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `testimonials`
--

INSERT INTO `testimonials` (`id`, `name`, `rating`, `message`, `photo`, `status`, `created_at`, `role`, `avatar`, `likes_count`, `is_approved`, `comment`) VALUES
(2, 'rijal', 5, '', NULL, 'approved', '2026-10-10 12:39:13', 'Pendukung', 'uploads/avatars/avatar_1791635953_265.jpg', 2, 1, 'wiuohfewuhfwhfwhfw'),
(3, 'kriuk', 5, '', NULL, 'approved', '2026-10-10 12:57:34', 'Pendukung', 'uploads/avatars/avatar_1791637054_934.jpeg', 1, 1, 'GSGFSHDZNJDTJ'),
(4, 'ropi', 5, '', NULL, 'approved', '2026-10-15 02:26:12', 'pembeli', 'uploads/avatars/avatar_1792031172_433.jpg', 1, 1, 'jrjerjuree');

-- --------------------------------------------------------

--
-- Table structure for table `testimonial_banners`
--

CREATE TABLE `testimonial_banners` (
  `id` int(11) NOT NULL,
  `image_path` varchar(255) NOT NULL,
  `badge_text` varchar(100) DEFAULT 'Apresiasi & Testimoni',
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `sort_order` int(11) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `testimonial_banners`
--

INSERT INTO `testimonial_banners` (`id`, `image_path`, `badge_text`, `title`, `description`, `sort_order`, `created_at`) VALUES
(1, 'assets/images/banners/banner_testi_1792247679_888.png', 'Apresiasi & Kata Mereka', 'Apa Kata Mereka Tentang JARIA Craft?', 'Dengarkan langsung ulasan dan pengalaman berkesan para pelanggan yang mempercayakan produk kerajinan perca buatan anak panti.', 1, '2026-10-17 14:34:39');

-- --------------------------------------------------------

--
-- Table structure for table `testimonial_photos`
--

CREATE TABLE `testimonial_photos` (
  `id` int(11) NOT NULL,
  `testimonial_id` int(11) NOT NULL,
  `photo_path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `testimonial_photos`
--

INSERT INTO `testimonial_photos` (`id`, `testimonial_id`, `photo_path`) VALUES
(1, 2, 'uploads/testimonials/photo_1791635953_0_112.jpg'),
(2, 3, 'uploads/testimonials/photo_1791637054_0_389.png'),
(3, 3, 'uploads/testimonials/photo_1791637054_1_187.png'),
(4, 3, 'uploads/testimonials/photo_1791637054_2_851.png'),
(5, 4, 'uploads/testimonials/photo_1792031172_0_172.jpg'),
(6, 4, 'uploads/testimonials/photo_1792031172_1_114.jpg'),
(7, 4, 'uploads/testimonials/photo_1792031172_2_580.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(100) DEFAULT 'Admin JARIA',
  `is_admin` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `name`, `is_admin`) VALUES
(1, 'admin', 'admin@jaria.id', 'adminjaria', 'Admin JARIA', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `cash_transactions`
--
ALTER TABLE `cash_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `contact_banners`
--
ALTER TABLE `contact_banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_settings`
--
ALTER TABLE `contact_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_socials`
--
ALTER TABLE `contact_socials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faq_banners`
--
ALTER TABLE `faq_banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `footer_links`
--
ALTER TABLE `footer_links`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hero_slides`
--
ALTER TABLE `hero_slides`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `home_categories`
--
ALTER TABLE `home_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `impact_banners`
--
ALTER TABLE `impact_banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `impact_items`
--
ALTER TABLE `impact_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `income`
--
ALTER TABLE `income`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inventory_movements`
--
ALTER TABLE `inventory_movements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `navbar_menu`
--
ALTER TABLE `navbar_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `news_banners`
--
ALTER TABLE `news_banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news_categories`
--
ALTER TABLE `news_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `order_code` (`order_code`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `payment_logs`
--
ALTER TABLE `payment_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `review_banners`
--
ALTER TABLE `review_banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `site_settings`
--
ALTER TABLE `site_settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `setting_key` (`setting_key`);

--
-- Indexes for table `story_points`
--
ALTER TABLE `story_points`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `story_settings`
--
ALTER TABLE `story_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testimonial_banners`
--
ALTER TABLE `testimonial_banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testimonial_photos`
--
ALTER TABLE `testimonial_photos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `testimonial_id` (`testimonial_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cash_transactions`
--
ALTER TABLE `cash_transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `contact_banners`
--
ALTER TABLE `contact_banners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `contact_socials`
--
ALTER TABLE `contact_socials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `faq_banners`
--
ALTER TABLE `faq_banners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `footer_links`
--
ALTER TABLE `footer_links`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `gallery`
--
ALTER TABLE `gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `hero_slides`
--
ALTER TABLE `hero_slides`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `home_categories`
--
ALTER TABLE `home_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `impact_banners`
--
ALTER TABLE `impact_banners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `impact_items`
--
ALTER TABLE `impact_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `income`
--
ALTER TABLE `income`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `inventory_movements`
--
ALTER TABLE `inventory_movements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `navbar_menu`
--
ALTER TABLE `navbar_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `news_banners`
--
ALTER TABLE `news_banners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `news_categories`
--
ALTER TABLE `news_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_logs`
--
ALTER TABLE `payment_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `review_banners`
--
ALTER TABLE `review_banners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `site_settings`
--
ALTER TABLE `site_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `story_points`
--
ALTER TABLE `story_points`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `story_settings`
--
ALTER TABLE `story_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `testimonial_banners`
--
ALTER TABLE `testimonial_banners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `testimonial_photos`
--
ALTER TABLE `testimonial_photos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `inventory_movements`
--
ALTER TABLE `inventory_movements`
  ADD CONSTRAINT `inventory_movements_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `news`
--
ALTER TABLE `news`
  ADD CONSTRAINT `news_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `news_categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `product_images_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `testimonial_photos`
--
ALTER TABLE `testimonial_photos`
  ADD CONSTRAINT `testimonial_photos_ibfk_1` FOREIGN KEY (`testimonial_id`) REFERENCES `testimonials` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
