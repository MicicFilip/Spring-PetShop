-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 22, 2018 at 06:58 PM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 7.1.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `petshop-sql`
--

-- --------------------------------------------------------

--
-- Table structure for table `authorities`
--

CREATE TABLE `authorities` (
  `authoritiesId` int(11) NOT NULL,
  `username` varchar(45) NOT NULL,
  `authority` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `authorities`
--

INSERT INTO `authorities` (`authoritiesId`, `username`, `authority`) VALUES
(7, 'admin1', 'ROLE_ADMIN'),
(8, 'user1', 'ROLE_USER');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customerId` int(11) NOT NULL,
  `customerName` varchar(50) NOT NULL,
  `customerEmail` varchar(50) NOT NULL,
  `customerPhone` varchar(50) NOT NULL,
  `customerStreetName` varchar(50) NOT NULL,
  `customerCity` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(245) NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customerId`, `customerName`, `customerEmail`, `customerPhone`, `customerStreetName`, `customerCity`, `username`, `password`, `enabled`) VALUES
(7, 'Admin One', 'admin1@email.com', '062111111', 'Makenzijeva 23', 'Beograd', 'admin1', '$2a$10$G/MbA55hi.h580e46kMJEekE19eijnZh0vd8m9KMSBUgaywYRUvzq', 1),
(8, 'User One', 'user1@email.com', '062222222', 'Kataniceva 33', 'Beograd', 'user1', '$2a$10$b6bAO6eS185ah4DjZdWI6ew.8mWNx0yX5euI7BZAT0FViMx0MYWS.', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `ordersId` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `ordersName` varchar(50) DEFAULT NULL,
  `dateCreation` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ordersdetail`
--

CREATE TABLE `ordersdetail` (
  `ordersDetailId` int(11) NOT NULL,
  `productId` int(11) NOT NULL DEFAULT '0',
  `ordersId` int(11) NOT NULL DEFAULT '0',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `quantity` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `productId` int(11) NOT NULL,
  `productName` varchar(50) DEFAULT NULL,
  `productDescription` varchar(256) DEFAULT NULL,
  `productCategory` varchar(50) DEFAULT NULL,
  `productPrice` double DEFAULT NULL,
  `productStatus` varchar(50) DEFAULT NULL,
  `unitInStock` int(11) DEFAULT NULL,
  `productManufacturer` varchar(50) DEFAULT NULL,
  `productImage` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`productId`, `productName`, `productDescription`, `productCategory`, `productPrice`, `productStatus`, `unitInStock`, `productManufacturer`, `productImage`) VALUES
(5, 'Adult Dog Food', 'Pedigree adult food for dogs', 'Food', 150, 'active', 100, 'Pedigree', '/PetShop/resources/images/pedigre-adult-dog-food.jpg'),
(6, 'Adult Cat Food', 'Meow Mix adult cat food', 'Food', 200, 'active', 100, 'Meow Mix', '/PetShop/resources/images/cat-food-meow-mix.jpg'),
(7, 'Small Dog Food', 'Pedigree dog food for small dogs', 'Food', 150, 'active', 50, 'Pedigree', '/PetShop/resources/images/pedigree-small-dog-food.jpg'),
(8, 'Mouse Toy', 'This product is a cat toy in a shape of a mouse', 'Toys', 50, 'active', 20, 'Chubleez', '/PetShop/resources/images/cat-toy-1.jpg'),
(9, 'Chewy Vuiton', 'Chewy Vuiton squeaky toy for dogs', 'Toys', 400, 'active', 20, 'Louis Vuitton', '/PetShop/resources/images/dog-toy-chewyvuiton.jpg'),
(10, 'Grooming Wipes', 'Grooming wet wipes for cats and dogs', 'Grooming', 350, 'active', 400, 'PupMate', '/PetShop/resources/images/cat-dog-grooming-wipes.jpg'),
(11, 'English Bulldog Coat Oil ', 'Coat oil for English Bulldogs made by MagicCoat', 'Grooming', 700, 'active', 15, 'MagicCoat', '/PetShop/resources/images/bulldog-coat-oil.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `usersId` int(11) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(245) NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`usersId`, `username`, `password`, `enabled`) VALUES
(7, 'admin1', '$2a$10$G/MbA55hi.h580e46kMJEekE19eijnZh0vd8m9KMSBUgaywYRUvzq', 1),
(8, 'user1', '$2a$10$b6bAO6eS185ah4DjZdWI6ew.8mWNx0yX5euI7BZAT0FViMx0MYWS.', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `authorities`
--
ALTER TABLE `authorities`
  ADD PRIMARY KEY (`authoritiesId`),
  ADD UNIQUE KEY `uni_username_role` (`authority`,`username`),
  ADD KEY `fk_username_idx` (`username`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customerId`),
  ADD UNIQUE KEY `uni_username_email` (`customerEmail`,`username`),
  ADD KEY `fk_username_idx` (`username`),
  ADD KEY `enabled` (`enabled`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`ordersId`),
  ADD KEY `username` (`username`);

--
-- Indexes for table `ordersdetail`
--
ALTER TABLE `ordersdetail`
  ADD PRIMARY KEY (`ordersDetailId`),
  ADD KEY `productId` (`productId`),
  ADD KEY `ordersId` (`ordersId`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`productId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`usersId`),
  ADD KEY `Index 2` (`username`),
  ADD KEY `enabled_fkey` (`enabled`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `authorities`
--
ALTER TABLE `authorities`
  MODIFY `authoritiesId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customerId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `ordersId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ordersdetail`
--
ALTER TABLE `ordersdetail`
  MODIFY `ordersDetailId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `productId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `usersId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `authorities`
--
ALTER TABLE `authorities`
  ADD CONSTRAINT `fk_username` FOREIGN KEY (`username`) REFERENCES `users` (`username`);

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `FK_customer_users_username` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `FK_orders_customer` FOREIGN KEY (`username`) REFERENCES `customer` (`username`);

--
-- Constraints for table `ordersdetail`
--
ALTER TABLE `ordersdetail`
  ADD CONSTRAINT `FK_ordersdetail_orders` FOREIGN KEY (`ordersId`) REFERENCES `orders` (`ordersId`),
  ADD CONSTRAINT `FK_ordersdetail_product` FOREIGN KEY (`productId`) REFERENCES `product` (`productId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
