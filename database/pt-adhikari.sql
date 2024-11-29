-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 29 Nov 2024 pada 12.55
-- Versi server: 10.4.21-MariaDB
-- Versi PHP: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pt-adhikari`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `anggota`
--

CREATE TABLE `anggota` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_telepon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_daftar` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `anggota`
--

INSERT INTO `anggota` (`id`, `nama`, `alamat`, `no_telepon`, `tanggal_daftar`, `created_at`, `updated_at`) VALUES
(1, 'Tryawan', 'Garut', '082313871948', '2024-11-11', '2024-11-28 06:08:47', '2024-11-28 06:09:53'),
(2, 'Firdaus', 'Bandung', '08988911221', '2024-11-11', '2024-11-28 07:58:09', '2024-11-28 07:58:09');

-- --------------------------------------------------------

--
-- Struktur dari tabel `buku`
--

CREATE TABLE `buku` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `judul` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pengarang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_publikasi` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `buku`
--

INSERT INTO `buku` (`id`, `judul`, `pengarang`, `tanggal_publikasi`, `created_at`, `updated_at`) VALUES
(1, 'Ada apa dengan HTML', 'Tryawan', '2024-10-10', '2024-11-27 03:24:11', '2024-11-27 03:24:11');

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_11_26_144816_create_products_table', 1),
(6, '2024_11_26_174728_create_bukus_table', 2),
(7, '2024_11_27_102253_create_buku_table', 3),
(8, '2024_11_27_230212_create_produk_table', 4),
(9, '2024_11_28_035702_create_anggotas_table', 5),
(10, '2024_11_28_040842_create_anggota_table', 6),
(11, '2024_11_28_044205_create_anggota_table', 7),
(12, '2024_11_28_121607_create_pegawai_table', 8),
(13, '2024_11_28_122204_add_tanggal_daftar_to_anggota', 8),
(14, '2024_11_28_125435_create_pegawai_table', 9),
(15, '2024_11_28_125931_create_anggota_table', 10),
(16, '2024_11_28_152659_create_peminjaman_table', 11);

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pegawai`
--

CREATE TABLE `pegawai` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_telepon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `pegawai`
--

INSERT INTO `pegawai` (`id`, `nama`, `alamat`, `no_telepon`, `created_at`, `updated_at`) VALUES
(1, 'Femy', 'Bandung', '0877827339211', '2024-11-28 07:34:03', '2024-11-28 07:34:03');

-- --------------------------------------------------------

--
-- Struktur dari tabel `peminjaman`
--

CREATE TABLE `peminjaman` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_peminjam` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_peminjaman` date NOT NULL,
  `tanggal_pengembalian` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `peminjaman`
--

INSERT INTO `peminjaman` (`id`, `nama_peminjam`, `tanggal_peminjaman`, `tanggal_pengembalian`, `created_at`, `updated_at`) VALUES
(1, 'Tryawan', '2024-11-28', '2024-11-30', NULL, NULL),
(2, 'Arman', '2024-11-11', '2025-01-01', '2024-11-28 08:41:58', '2024-11-28 08:41:58');

-- --------------------------------------------------------

--
-- Struktur dari tabel `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'MyApp', '608e0c98c28ee3abf262a161b860aadddaa4ff2dfedb2c10e319895520a9298b', '[\"*\"]', NULL, NULL, '2024-11-26 10:09:26', '2024-11-26 10:09:26'),
(2, 'App\\Models\\User', 1, 'MyApp', 'd9b6dcaeee909412981189b6b299b56059f21ff83a8430e3120993c9454c73e4', '[\"*\"]', NULL, NULL, '2024-11-26 10:23:56', '2024-11-26 10:23:56'),
(3, 'App\\Models\\User', 2, 'MyApp', '5231fb110c6bec26de4480cd4f2d8ca72efedeaa372be88c98a0e7fda215c42a', '[\"*\"]', NULL, NULL, '2024-11-26 10:25:55', '2024-11-26 10:25:55'),
(4, 'App\\Models\\User', 2, 'MyApp', '414b62b9532004a2925db410246bee098e272bda9537bd14851e06de9f762486', '[\"*\"]', NULL, NULL, '2024-11-26 10:26:09', '2024-11-26 10:26:09'),
(5, 'App\\Models\\User', 3, 'MyApp', '45e2457f7f3786bec53770394737fd0c76279471c97f834360fcefe765026098', '[\"*\"]', NULL, NULL, '2024-11-26 20:50:58', '2024-11-26 20:50:58'),
(6, 'App\\Models\\User', 4, 'MyApp', '112fa0c091c2dcd880b61931426ea819176ff1f6db48b4c7b4b7aeba0fb3b1d6', '[\"*\"]', NULL, NULL, '2024-11-27 17:58:53', '2024-11-27 17:58:53'),
(7, 'App\\Models\\User', 5, 'MyApp', '0826d2412da54478fe361f0abdf1a0bb62d6a9e9fa686efacfef01c2f7dfab43', '[\"*\"]', NULL, NULL, '2024-11-27 18:00:46', '2024-11-27 18:00:46'),
(8, 'App\\Models\\User', 5, 'MyApp', '637a97fd4fe5dc0cd808652fe7eff8a4d46458d951e60d608ac0b010ec29245e', '[\"*\"]', NULL, NULL, '2024-11-27 18:22:57', '2024-11-27 18:22:57');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Tryawan', 'tryawan@gmail.com', NULL, '$2y$12$prMC34CBs4oIhT75gknBKuDL9RoiLDy95pwOiKLn99pL/9AFiDPr.', NULL, '2024-11-26 10:09:25', '2024-11-26 10:09:25'),
(2, 'Sansan', 'sansan@gmail.com', NULL, '$2y$12$x5I6uUivrFBhQWTx2HYLfOsUIfU3wqrt2zMQ13Dq7OOOeIGmTqt9S', NULL, '2024-11-26 10:25:55', '2024-11-26 10:25:55'),
(3, 'Aji', 'aji@gmail.com', NULL, '$2y$12$s5AVOkr4KxOyB5mUn.FQn.4.lZ7czvHidEJP9g73G3B038flIapya', NULL, '2024-11-26 20:50:57', '2024-11-26 20:50:57'),
(4, 'Indra', 'indra@gmail.com', NULL, '$2y$12$BisF8NxrOgX6ExU/pv3dsOUP2cByYF1V.J9/bZ8dnQdiZnTdYGh3q', NULL, '2024-11-27 17:58:53', '2024-11-27 17:58:53'),
(5, 'Asum', 'asum@gmail.com', NULL, '$2y$12$2c3XKTxYhfHMcI8QhfuMGO0jhh3uW6Cua90v6o.k0bCAEfjmGP9B6', NULL, '2024-11-27 18:00:46', '2024-11-27 18:00:46'),
(6, 'Jason', 'jason@gmail.com', NULL, '$2y$12$2IRFZBX89Yx6JtlSsHYe6.1/kEXEotZ2UUEKrYb3O6LhU4vY1ZQEe', NULL, '2024-11-29 01:11:46', '2024-11-29 01:11:46'),
(7, 'Sandi', 'sandi@gmail.com', NULL, '$2y$12$cqyAhlY7NoDlOOg1OuNKkul4W1D0S4iUKLlTh99TbCfI8wcA7EyIm', NULL, '2024-11-29 01:31:04', '2024-11-29 01:31:04'),
(8, 'Dimas', 'dimas@gmail.com', NULL, '$2y$12$.j8FCHYWmLbR8jdQeqnvEu6hJsQLAbsdZXnLD6Zy5JYL/0X3D/xum', NULL, '2024-11-29 01:36:35', '2024-11-29 01:36:35');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `anggota`
--
ALTER TABLE `anggota`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indeks untuk tabel `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `anggota`
--
ALTER TABLE `anggota`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `buku`
--
ALTER TABLE `buku`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `pegawai`
--
ALTER TABLE `pegawai`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
