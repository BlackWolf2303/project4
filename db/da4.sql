-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 08, 2019 at 01:39 PM
-- Server version: 10.1.40-MariaDB
-- PHP Version: 7.1.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `da4`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `id` int(11) NOT NULL,
  `username` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`id`, `username`, `password`) VALUES
(1, 'lythihagiang', '$2a$10$3omot2STh01LVfkQDouN.OzQ9givWFoVA4COL78eLNVfeHhm/PXuC');

-- --------------------------------------------------------

--
-- Table structure for table `accounts_roles`
--

CREATE TABLE `accounts_roles` (
  `account_id` int(255) NOT NULL,
  `role_id` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `accounts_roles`
--

INSERT INTO `accounts_roles` (`account_id`, `role_id`) VALUES
(1, 1),
(1, 2),
(1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `parentid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `parentid`) VALUES
(1, 'ao', 1),
(2, 'quan', 2),
(3, 'Áo Khoác', 1),
(4, 'Áo Thun', 1);

-- --------------------------------------------------------

--
-- Table structure for table `category_product`
--

CREATE TABLE `category_product` (
  `categoryid` int(11) NOT NULL,
  `productid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `category_product`
--

INSERT INTO `category_product` (`categoryid`, `productid`) VALUES
(1, 13),
(2, 13);

-- --------------------------------------------------------

--
-- Table structure for table `color`
--

CREATE TABLE `color` (
  `id` int(11) NOT NULL,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `color`
--

INSERT INTO `color` (`id`, `name`) VALUES
(1, 'white'),
(2, 'black'),
(3, 'blue'),
(4, 'red');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `username` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `fullname` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `gender` int(11) NOT NULL,
  `age` int(11) NOT NULL,
  `phone` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `role` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` int(11) NOT NULL,
  `name` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `productId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`id`, `name`, `productId`) VALUES
(1, '/images/product/giay.jpg', 9),
(2, '/images/product/giay2.jpg', 9),
(3, '/images/product/giay3.jpg', 9),
(4, '/images/product/giay4.jpg', 9);

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `productid` int(11) NOT NULL,
  `customerid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `shipaddress` int(11) NOT NULL,
  `createdate` int(11) NOT NULL,
  `modifydate` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` double DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `free_size` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `price`, `quantity`, `status`, `free_size`) VALUES
(9, 'sp 1', 120, 5, 1, 0),
(10, 'sp 2', 220, 7, 1, 0),
(11, 'sp 3', 160, 10, 1, 0),
(12, 'sp 4', 150, 5, 1, 0),
(13, 'Ao 1', 0, 0, 0, 0),
(14, 'Ao 2', 18, 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `product_color`
--

CREATE TABLE `product_color` (
  `productid` int(11) NOT NULL,
  `colorid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product_color`
--

INSERT INTO `product_color` (`productid`, `colorid`) VALUES
(13, 1),
(13, 2),
(13, 3),
(13, 4);

-- --------------------------------------------------------

--
-- Table structure for table `product_size`
--

CREATE TABLE `product_size` (
  `productid` int(11) NOT NULL,
  `sizeid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product_size`
--

INSERT INTO `product_size` (`productid`, `sizeid`) VALUES
(13, 1),
(13, 2),
(13, 3);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `name`) VALUES
(1, 'ROLE_SUPER_ADMIN'),
(2, 'ROLE_ADMIN'),
(3, 'ROLE_EMPLOYEE');

-- --------------------------------------------------------

--
-- Table structure for table `Size`
--

CREATE TABLE `Size` (
  `id` int(11) NOT NULL,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Size`
--

INSERT INTO `Size` (`id`, `name`) VALUES
(1, 'M'),
(2, 'L'),
(3, 'XL');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `fullname` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `gender` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `age` int(11) NOT NULL,
  `phone` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `fullname`, `gender`, `age`, `phone`) VALUES
(1, 'lythihagiang', '$2y$12$eMkABh68f.7efUuF9Zmx3uWX9Lq/wLmWdwqQnqM2zlhmZfWaDrsMO', 'Lý Thị Hà Giang', 'Nữ', 24, '0987654321');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `accounts_roles`
--
ALTER TABLE `accounts_roles`
  ADD PRIMARY KEY (`account_id`,`role_id`),
  ADD KEY `fk_accounts_roles_role` (`role_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_product`
--
ALTER TABLE `category_product`
  ADD PRIMARY KEY (`categoryid`,`productid`),
  ADD KEY `productid` (`productid`);

--
-- Indexes for table `color`
--
ALTER TABLE `color`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_product_image` (`productId`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD KEY `fk_customer_order` (`customerid`),
  ADD KEY `fk_product_order` (`productid`),
  ADD KEY `fk_user_order` (`userid`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_color`
--
ALTER TABLE `product_color`
  ADD PRIMARY KEY (`productid`,`colorid`),
  ADD KEY `fk_color_product` (`colorid`);

--
-- Indexes for table `product_size`
--
ALTER TABLE `product_size`
  ADD PRIMARY KEY (`productid`,`sizeid`),
  ADD KEY `fk_size_productsize` (`sizeid`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Size`
--
ALTER TABLE `Size`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `color`
--
ALTER TABLE `color`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Size`
--
ALTER TABLE `Size`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accounts_roles`
--
ALTER TABLE `accounts_roles`
  ADD CONSTRAINT `fk_accounts_roles_account` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`),
  ADD CONSTRAINT `fk_accounts_roles_role` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);

--
-- Constraints for table `category_product`
--
ALTER TABLE `category_product`
  ADD CONSTRAINT `category_product_ibfk_1` FOREIGN KEY (`categoryid`) REFERENCES `category` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `category_product_ibfk_2` FOREIGN KEY (`productid`) REFERENCES `product` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `fk_product_image` FOREIGN KEY (`productId`) REFERENCES `product` (`id`);

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `fk_customer_order` FOREIGN KEY (`customerid`) REFERENCES `customer` (`id`),
  ADD CONSTRAINT `fk_product_order` FOREIGN KEY (`productid`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `fk_user_order` FOREIGN KEY (`userid`) REFERENCES `user` (`id`);

--
-- Constraints for table `product_color`
--
ALTER TABLE `product_color`
  ADD CONSTRAINT `fk_color_product` FOREIGN KEY (`colorid`) REFERENCES `color` (`id`),
  ADD CONSTRAINT `fk_product_color` FOREIGN KEY (`productid`) REFERENCES `product` (`id`);

--
-- Constraints for table `product_size`
--
ALTER TABLE `product_size`
  ADD CONSTRAINT `fk_product_productsize` FOREIGN KEY (`productId`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `fk_size_productsize` FOREIGN KEY (`sizeId`) REFERENCES `Size` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
