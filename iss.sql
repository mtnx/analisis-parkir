-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 11 Bulan Mei 2019 pada 09.14
-- Versi server: 10.1.38-MariaDB
-- Versi PHP: 7.3.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `iss`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `jenis_karyawan`
--

CREATE TABLE `jenis_karyawan` (
  `id_jenis_karyawan` varchar(12) NOT NULL,
  `nama_jenis_kayawan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `jenis_kendaraan`
--

CREATE TABLE `jenis_kendaraan` (
  `id_jenis_kendaraan` varchar(12) NOT NULL,
  `nama_kendaraan` varchar(50) NOT NULL,
  `tarif_kendaraan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `karyawan`
--

CREATE TABLE `karyawan` (
  `id_karyawan` varchar(12) NOT NULL,
  `nama_karyawan` varchar(50) NOT NULL,
  `alamat_kayawan` text NOT NULL,
  `id_jenis_karyawan` varchar(12) NOT NULL,
  `id_placement` varchar(12) NOT NULL,
  `id_posisi` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kendaraan_keluar`
--

CREATE TABLE `kendaraan_keluar` (
  `id_keluar` varchar(12) NOT NULL,
  `tgl_keluar` date NOT NULL,
  `jam_keluar` time NOT NULL,
  `no_plat` varchar(12) NOT NULL,
  `id_jenis_kendaraan` varchar(12) NOT NULL,
  `id_karyawan` varchar(12) NOT NULL,
  `capture_keluar` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kendaraan_masuk`
--

CREATE TABLE `kendaraan_masuk` (
  `id_masuk` varchar(12) NOT NULL,
  `tgl_masuk` date NOT NULL,
  `jam_masuk` time NOT NULL,
  `capture_masuk` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `parkir`
--

CREATE TABLE `parkir` (
  `id_parkir` varchar(12) NOT NULL,
  `id_masuk` varchar(12) NOT NULL,
  `id_keluar` varchar(12) NOT NULL,
  `total_tarif` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `placement`
--

CREATE TABLE `placement` (
  `id_placement` varchar(12) NOT NULL,
  `nama_placement` varchar(50) NOT NULL,
  `alamat_placement` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `plat`
--

CREATE TABLE `plat` (
  `no_plat` varchar(12) NOT NULL,
  `id_jenis_kendaraan` varchar(12) NOT NULL,
  `daerah` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `posisi`
--

CREATE TABLE `posisi` (
  `id_posisi` varchar(12) NOT NULL,
  `nama_posisi` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `jenis_karyawan`
--
ALTER TABLE `jenis_karyawan`
  ADD PRIMARY KEY (`id_jenis_karyawan`);

--
-- Indeks untuk tabel `jenis_kendaraan`
--
ALTER TABLE `jenis_kendaraan`
  ADD PRIMARY KEY (`id_jenis_kendaraan`);

--
-- Indeks untuk tabel `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`id_karyawan`),
  ADD KEY `id_jenis_karyawan` (`id_jenis_karyawan`),
  ADD KEY `id_placement` (`id_placement`),
  ADD KEY `id_posisi` (`id_posisi`);

--
-- Indeks untuk tabel `kendaraan_keluar`
--
ALTER TABLE `kendaraan_keluar`
  ADD PRIMARY KEY (`id_keluar`),
  ADD KEY `id_jenis_kendaraan` (`id_jenis_kendaraan`),
  ADD KEY `id_karyawan` (`id_karyawan`),
  ADD KEY `no_plat` (`no_plat`);

--
-- Indeks untuk tabel `kendaraan_masuk`
--
ALTER TABLE `kendaraan_masuk`
  ADD PRIMARY KEY (`id_masuk`);

--
-- Indeks untuk tabel `parkir`
--
ALTER TABLE `parkir`
  ADD PRIMARY KEY (`id_parkir`),
  ADD KEY `id_masuk` (`id_masuk`),
  ADD KEY `id_keluar` (`id_keluar`);

--
-- Indeks untuk tabel `placement`
--
ALTER TABLE `placement`
  ADD PRIMARY KEY (`id_placement`);

--
-- Indeks untuk tabel `plat`
--
ALTER TABLE `plat`
  ADD PRIMARY KEY (`no_plat`),
  ADD KEY `id_jenis_kendaraan` (`id_jenis_kendaraan`);

--
-- Indeks untuk tabel `posisi`
--
ALTER TABLE `posisi`
  ADD PRIMARY KEY (`id_posisi`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `karyawan`
--
ALTER TABLE `karyawan`
  ADD CONSTRAINT `karyawan_ibfk_1` FOREIGN KEY (`id_placement`) REFERENCES `placement` (`id_placement`),
  ADD CONSTRAINT `karyawan_ibfk_2` FOREIGN KEY (`id_jenis_karyawan`) REFERENCES `jenis_karyawan` (`id_jenis_karyawan`),
  ADD CONSTRAINT `karyawan_ibfk_3` FOREIGN KEY (`id_posisi`) REFERENCES `posisi` (`id_posisi`);

--
-- Ketidakleluasaan untuk tabel `kendaraan_keluar`
--
ALTER TABLE `kendaraan_keluar`
  ADD CONSTRAINT `kendaraan_keluar_ibfk_1` FOREIGN KEY (`id_karyawan`) REFERENCES `karyawan` (`id_karyawan`),
  ADD CONSTRAINT `kendaraan_keluar_ibfk_2` FOREIGN KEY (`no_plat`) REFERENCES `plat` (`no_plat`),
  ADD CONSTRAINT `kendaraan_keluar_ibfk_3` FOREIGN KEY (`id_jenis_kendaraan`) REFERENCES `jenis_kendaraan` (`id_jenis_kendaraan`);

--
-- Ketidakleluasaan untuk tabel `parkir`
--
ALTER TABLE `parkir`
  ADD CONSTRAINT `parkir_ibfk_1` FOREIGN KEY (`id_masuk`) REFERENCES `kendaraan_masuk` (`id_masuk`),
  ADD CONSTRAINT `parkir_ibfk_2` FOREIGN KEY (`id_keluar`) REFERENCES `kendaraan_keluar` (`id_keluar`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
