-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 18, 2025 at 01:15 AM
-- Server version: 5.7.15-log
-- PHP Version: 5.6.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_perpusdas`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_buku`
--

CREATE TABLE `tb_buku` (
  `BukuID` int(11) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `penulis` varchar(255) NOT NULL,
  `penerbit` varchar(255) NOT NULL,
  `tahun terbit` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tb_kategoribuku`
--

CREATE TABLE `tb_kategoribuku` (
  `kategoriID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `BukuID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tb_kategoribuku_relasi`
--

CREATE TABLE `tb_kategoribuku_relasi` (
  `KategoribukuID` int(11) NOT NULL,
  `BukuID` int(11) NOT NULL,
  `KategoriID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tb_koleksipribadi`
--

CREATE TABLE `tb_koleksipribadi` (
  `KoleksiID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `BukuID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tb_peminjaman`
--

CREATE TABLE `tb_peminjaman` (
  `peminjamanid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `bukuid` int(11) NOT NULL,
  `tanggalpeminjaman` date NOT NULL,
  `tanggalpengembalian` date NOT NULL,
  `statuspeminjaman` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tb_ulasanbuku`
--

CREATE TABLE `tb_ulasanbuku` (
  `Ulasanid` int(11) NOT NULL,
  `Userid` varchar(255) NOT NULL,
  `Bukuid` varchar(255) NOT NULL,
  `Ulasan` varchar(255) NOT NULL,
  `Rating` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE `tb_user` (
  `userid` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(50) NOT NULL,
  `namalengkap` varchar(255) NOT NULL,
  `alamat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_buku`
--
ALTER TABLE `tb_buku`
  ADD PRIMARY KEY (`BukuID`);

--
-- Indexes for table `tb_kategoribuku`
--
ALTER TABLE `tb_kategoribuku`
  ADD PRIMARY KEY (`kategoriID`);

--
-- Indexes for table `tb_kategoribuku_relasi`
--
ALTER TABLE `tb_kategoribuku_relasi`
  ADD PRIMARY KEY (`KategoribukuID`);

--
-- Indexes for table `tb_koleksipribadi`
--
ALTER TABLE `tb_koleksipribadi`
  ADD PRIMARY KEY (`KoleksiID`);

--
-- Indexes for table `tb_peminjaman`
--
ALTER TABLE `tb_peminjaman`
  ADD PRIMARY KEY (`peminjamanid`),
  ADD KEY `userid` (`userid`);

--
-- Indexes for table `tb_ulasanbuku`
--
ALTER TABLE `tb_ulasanbuku`
  ADD PRIMARY KEY (`Ulasanid`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`userid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_buku`
--
ALTER TABLE `tb_buku`
  MODIFY `BukuID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_kategoribuku`
--
ALTER TABLE `tb_kategoribuku`
  MODIFY `kategoriID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_kategoribuku_relasi`
--
ALTER TABLE `tb_kategoribuku_relasi`
  MODIFY `KategoribukuID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_koleksipribadi`
--
ALTER TABLE `tb_koleksipribadi`
  MODIFY `KoleksiID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_peminjaman`
--
ALTER TABLE `tb_peminjaman`
  MODIFY `peminjamanid` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_ulasanbuku`
--
ALTER TABLE `tb_ulasanbuku`
  MODIFY `Ulasanid` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_buku`
--
ALTER TABLE `tb_buku`
  ADD CONSTRAINT `tb_buku_ibfk_1` FOREIGN KEY (`BukuID`) REFERENCES `tb_koleksipribadi` (`KoleksiID`);

--
-- Constraints for table `tb_kategoribuku`
--
ALTER TABLE `tb_kategoribuku`
  ADD CONSTRAINT `tb_kategoribuku_ibfk_1` FOREIGN KEY (`kategoriID`) REFERENCES `tb_kategoribuku_relasi` (`KategoribukuID`);

--
-- Constraints for table `tb_kategoribuku_relasi`
--
ALTER TABLE `tb_kategoribuku_relasi`
  ADD CONSTRAINT `tb_kategoribuku_relasi_ibfk_1` FOREIGN KEY (`KategoribukuID`) REFERENCES `tb_buku` (`BukuID`),
  ADD CONSTRAINT `tb_kategoribuku_relasi_ibfk_2` FOREIGN KEY (`KategoribukuID`) REFERENCES `tb_kategoribuku` (`kategoriID`);

--
-- Constraints for table `tb_koleksipribadi`
--
ALTER TABLE `tb_koleksipribadi`
  ADD CONSTRAINT `tb_koleksipribadi_ibfk_1` FOREIGN KEY (`KoleksiID`) REFERENCES `tb_user` (`userid`),
  ADD CONSTRAINT `tb_koleksipribadi_ibfk_2` FOREIGN KEY (`KoleksiID`) REFERENCES `tb_buku` (`BukuID`);

--
-- Constraints for table `tb_peminjaman`
--
ALTER TABLE `tb_peminjaman`
  ADD CONSTRAINT `tb_peminjaman_ibfk_1` FOREIGN KEY (`peminjamanid`) REFERENCES `tb_buku` (`BukuID`);

--
-- Constraints for table `tb_ulasanbuku`
--
ALTER TABLE `tb_ulasanbuku`
  ADD CONSTRAINT `tb_ulasanbuku_ibfk_1` FOREIGN KEY (`Ulasanid`) REFERENCES `tb_buku` (`BukuID`);

--
-- Constraints for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD CONSTRAINT `tb_user_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `tb_peminjaman` (`peminjamanid`),
  ADD CONSTRAINT `tb_user_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `tb_koleksipribadi` (`KoleksiID`),
  ADD CONSTRAINT `tb_user_ibfk_3` FOREIGN KEY (`userid`) REFERENCES `tb_ulasanbuku` (`Ulasanid`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
