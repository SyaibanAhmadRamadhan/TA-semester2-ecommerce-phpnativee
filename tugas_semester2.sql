-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 17 Jun 2022 pada 10.07
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tugas_semester2`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `bank`
--

CREATE TABLE `bank` (
  `id_bank` int(11) NOT NULL,
  `nama_bank` varchar(255) NOT NULL,
  `no_rek` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `bank`
--

INSERT INTO `bank` (`id_bank`, `nama_bank`, `no_rek`) VALUES
(1, 'mandiri', 23949074090),
(2, 'bca', 1298804807),
(3, 'bri', 90746847809);

-- --------------------------------------------------------

--
-- Struktur dari tabel `keranjang`
--

CREATE TABLE `keranjang` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `merek` varchar(255) NOT NULL,
  `total` int(11) NOT NULL,
  `total_harga` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `gambar` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `keranjang`
--

INSERT INTO `keranjang` (`id`, `id_user`, `id_barang`, `merek`, `total`, `total_harga`, `harga`, `gambar`, `status`) VALUES
(162, 14, 72, 'Sepeda Gunung, Keren anak jaman, ', 1, 7000000, 7000000, '626ad896f175d.jpg', 1),
(165, 10, 72, 'Sepeda Gunung, Keren anak jaman, ', 1, 7000000, 7000000, '626ad896f175d.jpg', 1),
(182, 9, 72, 'Sepeda Gunung, Keren anak jaman, digunung ada kmau diman kau disni', 3, 21000000, 7000000, '626ad896f175d.jpg', 1),
(226, 32, 72, 'Sepeda Tbag DOWNHILL', 1, 7000000, 7000000, '628c6cb32a1cb.jpg', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_pembayaran` int(11) NOT NULL,
  `id_bank` int(11) NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembeli`
--

CREATE TABLE `pembeli` (
  `id_pembeli` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_bank` int(11) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `produk` varchar(255) NOT NULL,
  `no_hp` varchar(12) NOT NULL,
  `date` varchar(255) DEFAULT NULL,
  `dateout` varchar(255) DEFAULT NULL,
  `provinsi` varchar(255) NOT NULL,
  `kota_kabupaten` varchar(255) NOT NULL,
  `kode_pos` varchar(255) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `ekspedisi` varchar(255) NOT NULL,
  `paket_ekspedisi` varchar(255) NOT NULL,
  `estimasi_pengiriman` varchar(255) NOT NULL,
  `ongkir` varchar(255) NOT NULL,
  `total_produk` int(11) NOT NULL,
  `totalharga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pembeli`
--

INSERT INTO `pembeli` (`id_pembeli`, `id_user`, `id_bank`, `nama`, `produk`, `no_hp`, `date`, `dateout`, `provinsi`, `kota_kabupaten`, `kode_pos`, `alamat`, `ekspedisi`, `paket_ekspedisi`, `estimasi_pengiriman`, `ongkir`, `total_produk`, `totalharga`) VALUES
(330, 32, 2, 'r', 'SEPEDA VINTAGE  1 Pcs - ', '2', '2022-06-07 08:38:22', '07-06-2022 08:38:37', 'Jawa Tengah', 'Jepara', '59419', 's', 'jne', 'OKE', '6-7', '12000', 30000000, 30012000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembeli_detail`
--

CREATE TABLE `pembeli_detail` (
  `id_pembeli_detail` int(11) NOT NULL,
  `id_pembeli` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pembeli_detail`
--

INSERT INTO `pembeli_detail` (`id_pembeli_detail`, `id_pembeli`, `id_user`, `id_produk`, `jumlah`) VALUES
(480, 323, 32, 73, 1),
(481, 324, 32, 73, 1),
(482, 324, 32, 77, 1),
(483, 325, 32, 73, 1),
(484, 325, 32, 77, 1),
(485, 326, 32, 73, 1),
(486, 326, 32, 77, 1),
(487, 327, 32, 73, 1),
(488, 327, 32, 77, 1),
(492, 330, 32, 79, 1),
(493, 330, 32, 81, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengiriman`
--

CREATE TABLE `pengiriman` (
  `id` int(11) NOT NULL,
  `kota` varchar(255) NOT NULL,
  `harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pengiriman`
--

INSERT INTO `pengiriman` (`id`, `kota`, `harga`) VALUES
(1, 'Kota Depok', 25000),
(2, 'kota bogor', 30000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `sepeda`
--

CREATE TABLE `sepeda` (
  `id` int(11) NOT NULL,
  `kode` varchar(30) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `suplier` varchar(255) NOT NULL,
  `price` int(255) NOT NULL,
  `stock` varchar(255) NOT NULL,
  `terjual` int(11) NOT NULL,
  `tgl_masuk` date NOT NULL,
  `berat` int(11) NOT NULL,
  `detail` varchar(255) NOT NULL,
  `gambar` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `sepeda`
--

INSERT INTO `sepeda` (`id`, `kode`, `name`, `suplier`, `price`, `stock`, `terjual`, `tgl_masuk`, `berat`, `detail`, `gambar`) VALUES
(72, 'SPD001', 'Sepeda Tbag DOWNHILL', 'Kota Jakarta Pusat&gt;Kota Jakarta Pusat&lt;/option&gt;\r\n                                &lt;option value=', 7000000, '12', 0, '2022-04-28', 1200, 'garansi 2 tahun ini merupakann sepeda gunung terbaik yang pernah ada disni yekan', '628c6cb32a1cb.jpg'),
(73, 'SPD002', 'sepeda ontel kekinian, warna', 'Kota Jakarta Pusat', 2500000, '0\r\n', 0, '2022-04-28', 1300, 'none garansi', '626ad8c8dd17d.jpg'),
(77, 'SPD003', 'Sepeda BMX  L100', 'Kota Jakarta Pusat', 8000000, '0', 0, '2022-05-24', 1400, 'Bergaransi 6 bulan, Free Hand grip ', '628c6b1dd8a31.jpg'),
(78, 'SPD004', 'Sepeda FIXIE ', 'Kota Jakarta Pusat', 1000000, '3', 0, '2022-05-24', 1250, 'Bergaransi 5bulan\r\nfree jersey ', '628c6bf974421.jpg'),
(79, 'SPD005', 'Sepeda ontel tahun 1945', 'Kota Depok', 120000000, '15', 0, '2022-05-24', 1200, 'HANYA 5 DI INDONESIA, FREE KERANJANG ', '628c6c6b00ee9.jpg'),
(80, 'SPD006', 'SEPEDA  ANAK WIMCYCLE ', 'Kota Jakarta Pusat', 1000000, '5', 0, '2022-05-24', 3000, 'FREE JERSEY ', '628c6d0a58e81.jpg'),
(81, 'SPD007', 'SEPEDA VINTAGE ', 'Kota Jakarta Pusat', 30000000, '12', 0, '2022-05-24', 1000, 'FREE BAN  TUBELESS', '628c6d6728a80.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `bank`
--
ALTER TABLE `bank`
  ADD PRIMARY KEY (`id_bank`);

--
-- Indeks untuk tabel `keranjang`
--
ALTER TABLE `keranjang`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`);

--
-- Indeks untuk tabel `pembeli`
--
ALTER TABLE `pembeli`
  ADD PRIMARY KEY (`id_pembeli`);

--
-- Indeks untuk tabel `pembeli_detail`
--
ALTER TABLE `pembeli_detail`
  ADD PRIMARY KEY (`id_pembeli_detail`);

--
-- Indeks untuk tabel `pengiriman`
--
ALTER TABLE `pengiriman`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `sepeda`
--
ALTER TABLE `sepeda`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `bank`
--
ALTER TABLE `bank`
  MODIFY `id_bank` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `keranjang`
--
ALTER TABLE `keranjang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=227;

--
-- AUTO_INCREMENT untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id_pembayaran` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pembeli`
--
ALTER TABLE `pembeli`
  MODIFY `id_pembeli` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=331;

--
-- AUTO_INCREMENT untuk tabel `pembeli_detail`
--
ALTER TABLE `pembeli_detail`
  MODIFY `id_pembeli_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=494;

--
-- AUTO_INCREMENT untuk tabel `pengiriman`
--
ALTER TABLE `pengiriman`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `sepeda`
--
ALTER TABLE `sepeda`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
