-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 03, 2020 at 03:33 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tda`
--

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
CREATE TABLE `company` (
  `CompanyID` varchar(30) NOT NULL,
  `CompanyName` varchar(30) DEFAULT NULL,
  `CompanyContact` varchar(30) DEFAULT NULL,
  `ShareCount` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `positions`
--

DROP TABLE IF EXISTS `positions`;
CREATE TABLE `positions` (
  `PositionID` varchar(30) NOT NULL,
  `ShareCount` int(11) DEFAULT NULL,
  `CostBasis` float DEFAULT NULL,
  `MarketValue` float DEFAULT NULL,
  `OpenDate` date DEFAULT NULL,
  `CloseDate` date DEFAULT NULL,
  `Symbol` varchar(15) DEFAULT NULL,
  `RealizedGain` float DEFAULT NULL,
  `UnrealizedGain` float DEFAULT NULL,
  `UserID` varchar(30) NOT NULL,
  `TransactionID` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `purchaseevent`
--

DROP TABLE IF EXISTS `purchaseevent`;
CREATE TABLE `purchaseevent` (
  `PurchaseEventID` varchar(30) NOT NULL,
  `HasReturned` bit(1) DEFAULT NULL,
  `Item` varchar(50) DEFAULT NULL,
  `PurchaseDate` date DEFAULT NULL,
  `Cost` float DEFAULT NULL,
  `CompanyID` varchar(30) NOT NULL,
  `UserID` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
CREATE TABLE `transactions` (
  `TransactionID` varchar(30) NOT NULL,
  `Side` varchar(15) DEFAULT NULL,
  `TransDate` date DEFAULT NULL,
  `Filled` bit(1) DEFAULT NULL,
  `Symbol` varchar(30) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `OrderType` varchar(30) DEFAULT NULL,
  `UserID` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `UserID` varchar(30) NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Employment` varchar(50) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Income` float DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `Username` varchar(50) NOT NULL,
  `UserPassword` varchar(50) NOT NULL,
  `Address` varchar(100) DEFAULT NULL,
  `Objective` varchar(50) DEFAULT NULL,
  `Phone` int(11) DEFAULT NULL,
  `SSN` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`CompanyID`);

--
-- Indexes for table `positions`
--
ALTER TABLE `positions`
  ADD PRIMARY KEY (`PositionID`),
  ADD KEY `UserID` (`UserID`),
  ADD KEY `TransactionID` (`TransactionID`);

--
-- Indexes for table `purchaseevent`
--
ALTER TABLE `purchaseevent`
  ADD PRIMARY KEY (`PurchaseEventID`),
  ADD KEY `CompanyID` (`CompanyID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`TransactionID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `positions`
--
ALTER TABLE `positions`
  ADD CONSTRAINT `positions_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`),
  ADD CONSTRAINT `positions_ibfk_2` FOREIGN KEY (`TransactionID`) REFERENCES `transactions` (`TransactionID`);

--
-- Constraints for table `purchaseevent`
--
ALTER TABLE `purchaseevent`
  ADD CONSTRAINT `purchaseevent_ibfk_1` FOREIGN KEY (`CompanyID`) REFERENCES `company` (`CompanyID`),
  ADD CONSTRAINT `purchaseevent_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`);

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
