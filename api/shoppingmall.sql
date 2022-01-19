-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 31, 2021 at 11:09 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shoppingmall`
--

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `idSeller` text COLLATE utf8_unicode_ci NOT NULL,
  `nameSeller` text COLLATE utf8_unicode_ci NOT NULL,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `price` text COLLATE utf8_unicode_ci NOT NULL,
  `detail` text COLLATE utf8_unicode_ci NOT NULL,
  `images` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `idSeller`, `nameSeller`, `name`, `price`, `detail`, `images`) VALUES
(1, '$idSeller', '$nameSeller', '$name', '$price', '$detail', '$images'),
(2, '1', 'โชติ', 'บอนไซ ', '500', 'คนรัก ไม้มงคล ไม้ประดับ', '[/product/productEdit284032.jpg, /product/productEdit604827.jpg, /product/productEdit224547.jpg, /product/productEdit459109.jpg]'),
(3, '4', 'โชติวัธร้านค้า', 'สตว์เลี้ยงน่ารัก', '1500', 'หมาๆแมวๆ เลี้ยงแล้วเพลินดี', '[/product/productEdit768667.jpg, /product/productEdit482075.jpg, /product/productEdit698383.jpg, /product/product370535.jpg]'),
(4, '$idSeller', '$nameSeller', '$name', '$price', '$detail', ''),
(5, '8', 'นสา ขายเครื่องใช้ในบ้าน', 'เครื่องนอน เครื่องใช้ในบ้าน', '700', 'เครื่องสำอาง บำรุงผิว', '[/product/productEdit512933.jpg, /product/productEdit725643.jpg, /product/productEdit58971.jpg, /product/productEdit703053.jpg]'),
(6, '8', 'นสา ขายเครื่องใช้ในบ้าน', 'เครื่องนอน', '450', 'ผ้านวม ผ้าปูที่นอน', '[/product/productEdit53973.jpg, /product/productEdit648862.jpg, /product/productEdit786075.jpg, /product/product47901.jpg]'),
(7, '4', 'โชติวัธร้านค้า', 'บอนไซ ไม้ประดับ', '1200', 'ไม้ประดับ ไม้มงคล', '[/product/product58304.jpg, /product/product63346.jpg, /product/product901730.jpg, /product/product344978.jpg]'),
(8, '1', 'โชติวัธร้าค้า ขายวัสดุก่อสร้างทุกชนิด', 'ไม้ประดับ ไม้สวยงาม', '600', 'ไม้ใบสวย ไม้ประดับ', '[/product/product66548.jpg, /product/product976608.jpg, /product/product11169.jpg, /product/product24753.jpg]');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `type` text COLLATE utf8_unicode_ci NOT NULL,
  `address` text COLLATE utf8_unicode_ci NOT NULL,
  `phone` text COLLATE utf8_unicode_ci NOT NULL,
  `user` text COLLATE utf8_unicode_ci NOT NULL,
  `password` text COLLATE utf8_unicode_ci NOT NULL,
  `avatar` text COLLATE utf8_unicode_ci NOT NULL,
  `lat` text COLLATE utf8_unicode_ci NOT NULL,
  `lng` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `type`, `address`, `phone`, `user`, `password`, `avatar`, `lat`, `lng`) VALUES
(1, 'โชติวัธร้าค้า ขายวัสดุก่อสร้างทุกชนิด', 'seller', '31/4 บางปลาอพาร์ท ซอยบางปลา4  บางปลา บางพลี สมุทรปราการ 10540', '0638065432', 'wathseller', '123456', '/shoppingmall/avatar/edit18avatar32322.jpg', '13.5961228', '100.72410869999999'),
(4, 'โชติวัธร้านค้า', 'seller', '31/4 อพาร์ทเม้นท์ บางปลา 4 บางปลา บางพลี สมุทรปราการ 10540', '0638567548', 'shoteseller', '123456', '/shoppingmall/avatar/edit18edit18edit18avatar65308.jpg', '13.5961181', '100.72409620000002'),
(5, 'นสา นะจ๊ะ', 'buyer', '31/5 ตลาดษมาภรณ์ บางปลา 2 บางปลา บางพลี สมุทรปราการ 10540', '0896534702', 'sabuyer', '123456', '/shoppingmall/avatar/avatar90116.jpg', '13.5961195', '100.7241027'),
(6, 'วัธ', 'rider', '32/3 อพาร์ทเม้นท์ครีม บางปลา 4 ษมาภรณ์', '0639245671', 'wathrider', '123456', '/shoppingmall/avatar/avatar56589.jpg', '13.5961115', '100.7241288'),
(7, 'doreamon', 'rider', '11/4 ตลาดษมาภรณ์ ล็อค 10 ซอยบางปลา 2 บางปลา บางพลี สมุทรปราการ 10540', '0631873436', 'wathrider', '123456', '/shoppingmall/avatar/avatar56589.jpg', '13.5961115', '100.7241288'),
(8, 'นสา ขายเครื่องใช้ในบ้าน', 'seller', '13/2 อพาร์ทตลาดษมาภรณ์ บางปลา 2 บางปลา บางพลี สมุทรปราการ 10540', '0856332026', 'nasaraseller', '123456', '/shoppingmall/avatar/avatar85516.jpg', '13.5961226', '100.7241214'),
(9, 'wath Mobile seller', 'seller', '11/4 ตลาดษมาภรณ์ ล็อค 10 ซอยบางปลา 2 บางปลา บางพลี สมุทรปราการ 10540', '0985634658', 'thanaseller', '123456', '/shoppingmall/avatar/avatar31697.jpg', '13.5961226', '100.7241028');

-- --------------------------------------------------------

--
-- Table structure for table `wallet`
--

CREATE TABLE `wallet` (
  `id` int(11) NOT NULL,
  `idBuyer` text COLLATE utf8_unicode_ci NOT NULL,
  `datePay` text COLLATE utf8_unicode_ci NOT NULL,
  `money` text COLLATE utf8_unicode_ci NOT NULL,
  `pathSlip` text COLLATE utf8_unicode_ci NOT NULL,
  `status` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `wallet`
--

INSERT INTO `wallet` (`id`, `idBuyer`, `datePay`, `money`, `pathSlip`, `status`) VALUES
(1, '5', '30/12/2021 08:07', '300', '/slip/slip992411.jpg', 'WaitOrder'),
(2, '5', '30/12/2021 08:19', '300', '/slip/slip293580.jpg', 'WaitOrder');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wallet`
--
ALTER TABLE `wallet`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `wallet`
--
ALTER TABLE `wallet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
