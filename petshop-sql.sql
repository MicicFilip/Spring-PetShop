SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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

-- INSERT INTO `authorities` (`authoritiesId`, `username`, `authority`) VALUES
-- (5, 'admin', 'ROLE_ADMIN');


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

-- INSERT INTO `customer` (`customerId`, `customerName`, `customerEmail`, `customerPhone`, `customerStreetName`, `customerCity`, `customerCountry`, `username`, `password`, `enabled`) VALUES
-- (1, 'Filip', 'filip@mail.com', 'filip', 'filip', 'filip', 'filip', 'filip.micic.2388', 'filip', 1);

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
(1, 'Adult sa govedinom i zivinom', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed urna nunc, mollis vitae pretium vel, tincidunt at erat.', 'Food', 25, 'active', 60, 'Pedigree', '/MetPetShop/resources/images/dogfood1.jpg'),
(2, 'Come''n Get It', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed urna nunc, mollis vitae pretium vel, tincidunt at erat.', 'Food', 15, 'active', 30, 'Alpo', '/MetPetShop/resources/images/dogfood2.jpg'),
(3, 'Meaty Selections', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed urna nunc, mollis vitae pretium vel, tincidunt at erat.', 'Food', 17, 'active', 23, 'Whiskas', '/MetPetShop/resources/images/catfood1.jpg'),
(4, 'Ogrlica protiv krpelja', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed urna nunc, mollis vitae pretium vel, tincidunt at erat.', 'Grooming', 5, 'active', 150, 'Foresto', '/MetPetShop/resources/images/grooming1.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `usersId` int(11) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`usersId`, `username`, `password`, `enabled`) VALUES
(4, 'filip.micic.2388', 'filip', 1);

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
  ADD KEY `fk_username_idx` (`username`);

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
  ADD KEY `Index 2` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `authorities`
--
ALTER TABLE `authorities`
  MODIFY `authoritiesId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customerId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `ordersId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ordersdetail`
--
ALTER TABLE `ordersdetail`
  MODIFY `ordersDetailId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `productId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `usersId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
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
  ADD CONSTRAINT `FK_customer_users` FOREIGN KEY (`username`) REFERENCES `users` (`username`);

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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
