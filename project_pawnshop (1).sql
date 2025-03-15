-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 15, 2025 at 06:59 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project_pawnshop`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_auctioned_items`
--

CREATE TABLE `tbl_auctioned_items` (
  `Item_ID` int(11) NOT NULL,
  `Item_Value` float(8,2) DEFAULT NULL,
  `Description` varchar(75) DEFAULT NULL,
  `Net_Value` float(8,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_customer`
--

CREATE TABLE `tbl_customer` (
  `Customer_ID` int(11) NOT NULL,
  `Customer_FirstName` varchar(20) NOT NULL,
  `Customer_MiddleInitial` char(2) DEFAULT NULL,
  `Customer_LastName` varchar(20) NOT NULL,
  `Customer_Birthday` date DEFAULT NULL,
  `Customer_Address` varchar(50) NOT NULL,
  `Customer_Nationality` varchar(20) NOT NULL,
  `Customer_Gender` enum('Male','Female','Other') NOT NULL,
  `Status` enum('Active','Inactive') NOT NULL DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_customer`
--

INSERT INTO `tbl_customer` (`Customer_ID`, `Customer_FirstName`, `Customer_MiddleInitial`, `Customer_LastName`, `Customer_Birthday`, `Customer_Address`, `Customer_Nationality`, `Customer_Gender`, `Status`) VALUES
(1, 'Mateo', '', 'Valderama', NULL, 'Davao City', 'Filipino', 'Male', 'Active'),
(2, 'Prime Rose', '', 'Fujita', NULL, 'Bangkerohan, Davao City', 'Filipino', 'Female', 'Active'),
(3, 'Rosally', '', 'Aquino', NULL, 'Bangkerohan, Davao City', 'Filipino', 'Female', 'Active'),
(4, 'John', '', 'Abasin', NULL, 'Agdao, Davao City', 'Filipino', 'Male', 'Active'),
(5, 'Elmer', '', 'Lorenzo', NULL, 'Davao City', 'Filipino', 'Male', 'Active'),
(6, 'Arien', '', 'Dalanon', NULL, 'Davao City', 'Filipino', 'Male', 'Active'),
(7, 'Arsina', '', 'Dalawis', NULL, 'Davao City', 'Filipino', 'Female', 'Active'),
(8, 'Ferdinand', '', 'Luceras', NULL, 'Fr. Selga, Davao City', 'Filipino', 'Male', 'Active'),
(9, 'Haydae Ann', '', 'Rigor', NULL, 'Davao City', 'Filipino', 'Female', 'Active'),
(10, 'Rodimie', '', 'Bantilan', NULL, 'Davao City', 'Filipino', 'Male', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_item`
--

CREATE TABLE `tbl_item` (
  `Item_ID` int(11) NOT NULL,
  `Pawnticket_ID` int(11) DEFAULT NULL,
  `Item_Value` float(8,2) DEFAULT NULL,
  `Description` varchar(75) DEFAULT NULL,
  `Interest` int(10) DEFAULT NULL,
  `Net_Value` float(8,2) DEFAULT NULL,
  `category` enum('Appliances','Jewelries','Gadgets','Others') NOT NULL,
  `Is_Hidden` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_item`
--

INSERT INTO `tbl_item` (`Item_ID`, `Pawnticket_ID`, `Item_Value`, `Description`, `Interest`, `Net_Value`, `category`, `Is_Hidden`) VALUES
(1, 32, 14200.00, 'Realme Kts 118', 4, 14200.00, 'Gadgets', 0),
(2, 33, 14300.00, 'Mk Watch Yellow', 4, 14300.00, 'Gadgets', 0),
(3, 34, 30000.00, 'Charm', 4, 30000.00, 'Gadgets', 0),
(4, 35, 4000.00, 'Ring', 4, 4000.00, 'Jewelries', 0),
(5, 36, 6000.00, 'Ring with brill', 4, 6000.00, 'Jewelries', 0),
(6, 37, 4500.00, 'chain with pendant', 4, 4500.00, 'Jewelries', 0),
(7, 38, 2500.00, 'ring with titus', 4, 2500.00, 'Jewelries', 0),
(8, 39, 2500.00, 'ring ', 4, 2500.00, 'Jewelries', 0),
(9, 41, 4250.00, 'MK watch', 4, 4250.00, 'Jewelries', 0),
(10, 40, 5500.00, 'Pendant', 4, 5500.00, 'Jewelries', 0),
(11, 42, 7250.00, 'M beli and ross', 4, 7250.00, 'Jewelries', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pawnticket`
--

CREATE TABLE `tbl_pawnticket` (
  `Pawnticket_ID` int(11) NOT NULL,
  `Customer_ID` int(11) DEFAULT NULL,
  `Principal_Value` float(8,2) DEFAULT NULL,
  `Maturity_Date` date DEFAULT NULL,
  `Expiry_Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_pawnticket`
--

INSERT INTO `tbl_pawnticket` (`Pawnticket_ID`, `Customer_ID`, `Principal_Value`, `Maturity_Date`, `Expiry_Date`) VALUES
(32, 1, 14200.00, '2021-05-24', '2021-02-24'),
(33, 2, 14300.00, '2021-05-26', '2021-08-26'),
(34, 3, 30000.00, '2021-05-26', '2021-08-26'),
(35, 4, 4000.00, '2021-05-26', '2021-08-26'),
(36, 4, 6000.00, '2021-05-26', '2021-08-26'),
(37, 4, 4500.00, '2021-05-26', '2021-08-26'),
(38, 4, 2500.00, '2021-05-26', '2021-08-26'),
(39, 4, 2500.00, '2021-05-26', '2021-08-26'),
(40, 5, 5500.00, '2021-05-26', '2021-08-26'),
(41, 6, 4250.00, '2021-05-26', '2021-08-26'),
(42, 6, 7250.00, '2021-05-26', '2021-08-26');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_payment`
--

CREATE TABLE `tbl_payment` (
  `Payment_ID` int(11) NOT NULL,
  `Pawnticket_ID` int(11) DEFAULT NULL,
  `Date_Paid` date DEFAULT NULL,
  `Amount_Paid` float(8,2) DEFAULT NULL,
  `PaymentType` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_redeemed_items`
--

CREATE TABLE `tbl_redeemed_items` (
  `Redeemed_ID` int(11) NOT NULL,
  `Pawnticket_ID` int(11) NOT NULL,
  `Item_Value` float(10,2) NOT NULL,
  `Redeemed_Value` float(10,2) NOT NULL,
  `Redeemed_Date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_renew`
--

CREATE TABLE `tbl_renew` (
  `Renew_ID` int(11) NOT NULL,
  `Payment_ID` int(11) DEFAULT NULL,
  `New_Principal_Value` float(8,2) DEFAULT NULL,
  `Maturity_Date` date DEFAULT NULL,
  `Expiration_Date` date DEFAULT NULL,
  `Penalty` float(8,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_renewed_items`
--

CREATE TABLE `tbl_renewed_items` (
  `Pawnticket_ID` int(11) NOT NULL,
  `Item_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sold_items`
--

CREATE TABLE `tbl_sold_items` (
  `Sold_ID` int(11) NOT NULL,
  `Item_ID` int(11) NOT NULL,
  `Sale_Price` decimal(10,2) NOT NULL,
  `Sold_Date` datetime DEFAULT current_timestamp(),
  `Customer_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_auctioned_items`
--
ALTER TABLE `tbl_auctioned_items`
  ADD PRIMARY KEY (`Item_ID`);

--
-- Indexes for table `tbl_customer`
--
ALTER TABLE `tbl_customer`
  ADD PRIMARY KEY (`Customer_ID`);

--
-- Indexes for table `tbl_item`
--
ALTER TABLE `tbl_item`
  ADD PRIMARY KEY (`Item_ID`),
  ADD KEY `fk_pawnticket_id` (`Pawnticket_ID`);

--
-- Indexes for table `tbl_pawnticket`
--
ALTER TABLE `tbl_pawnticket`
  ADD PRIMARY KEY (`Pawnticket_ID`),
  ADD KEY `Customer_ID` (`Customer_ID`);

--
-- Indexes for table `tbl_payment`
--
ALTER TABLE `tbl_payment`
  ADD PRIMARY KEY (`Payment_ID`),
  ADD KEY `Pawnticket_ID` (`Pawnticket_ID`);

--
-- Indexes for table `tbl_redeemed_items`
--
ALTER TABLE `tbl_redeemed_items`
  ADD PRIMARY KEY (`Redeemed_ID`),
  ADD KEY `fk_redeemed_pawnticket` (`Pawnticket_ID`);

--
-- Indexes for table `tbl_renew`
--
ALTER TABLE `tbl_renew`
  ADD PRIMARY KEY (`Renew_ID`),
  ADD KEY `Payment_ID` (`Payment_ID`);

--
-- Indexes for table `tbl_renewed_items`
--
ALTER TABLE `tbl_renewed_items`
  ADD PRIMARY KEY (`Pawnticket_ID`,`Item_ID`),
  ADD KEY `Item_ID` (`Item_ID`);

--
-- Indexes for table `tbl_sold_items`
--
ALTER TABLE `tbl_sold_items`
  ADD PRIMARY KEY (`Sold_ID`),
  ADD KEY `fk_sold_item` (`Item_ID`),
  ADD KEY `fk_customer` (`Customer_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_auctioned_items`
--
ALTER TABLE `tbl_auctioned_items`
  MODIFY `Item_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_customer`
--
ALTER TABLE `tbl_customer`
  MODIFY `Customer_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tbl_item`
--
ALTER TABLE `tbl_item`
  MODIFY `Item_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tbl_pawnticket`
--
ALTER TABLE `tbl_pawnticket`
  MODIFY `Pawnticket_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `tbl_payment`
--
ALTER TABLE `tbl_payment`
  MODIFY `Payment_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_redeemed_items`
--
ALTER TABLE `tbl_redeemed_items`
  MODIFY `Redeemed_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_renew`
--
ALTER TABLE `tbl_renew`
  MODIFY `Renew_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_sold_items`
--
ALTER TABLE `tbl_sold_items`
  MODIFY `Sold_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_auctioned_items`
--
ALTER TABLE `tbl_auctioned_items`
  ADD CONSTRAINT `fk_auctioned_item` FOREIGN KEY (`Item_ID`) REFERENCES `tbl_item` (`Item_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_item`
--
ALTER TABLE `tbl_item`
  ADD CONSTRAINT `fk_item_pawnticket` FOREIGN KEY (`Pawnticket_ID`) REFERENCES `tbl_pawnticket` (`Pawnticket_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_pawnticket`
--
ALTER TABLE `tbl_pawnticket`
  ADD CONSTRAINT `fk_pawnticket_customer` FOREIGN KEY (`Customer_ID`) REFERENCES `tbl_customer` (`Customer_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_payment`
--
ALTER TABLE `tbl_payment`
  ADD CONSTRAINT `fk_payment_pawnticket` FOREIGN KEY (`Pawnticket_ID`) REFERENCES `tbl_pawnticket` (`Pawnticket_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_redeemed_items`
--
ALTER TABLE `tbl_redeemed_items`
  ADD CONSTRAINT `fk_redeemed_pawnticket` FOREIGN KEY (`Pawnticket_ID`) REFERENCES `tbl_pawnticket` (`Pawnticket_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_renew`
--
ALTER TABLE `tbl_renew`
  ADD CONSTRAINT `fk_renew_payment` FOREIGN KEY (`Payment_ID`) REFERENCES `tbl_payment` (`Payment_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_renewed_items`
--
ALTER TABLE `tbl_renewed_items`
  ADD CONSTRAINT `fk_renewed_item` FOREIGN KEY (`Item_ID`) REFERENCES `tbl_item` (`Item_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_renewed_pawnticket` FOREIGN KEY (`Pawnticket_ID`) REFERENCES `tbl_pawnticket` (`Pawnticket_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_sold_items`
--
ALTER TABLE `tbl_sold_items`
  ADD CONSTRAINT `fk_sold_items_customer` FOREIGN KEY (`Customer_ID`) REFERENCES `tbl_customer` (`Customer_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_sold_items_item` FOREIGN KEY (`Item_ID`) REFERENCES `tbl_item` (`Item_ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
