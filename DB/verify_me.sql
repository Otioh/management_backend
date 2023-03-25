-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 25, 2023 at 10:10 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `verify_me`
--

-- --------------------------------------------------------

--
-- Table structure for table `holder`
--

CREATE TABLE `holder` (
  `id` int(11) NOT NULL,
  `verification_code` varchar(255) NOT NULL,
  `verify_link` varchar(255) NOT NULL,
  `date_created` varchar(255) NOT NULL,
  `expiry` varchar(255) NOT NULL,
  `issued` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `designation` varchar(255) NOT NULL,
  `fullname` text NOT NULL,
  `branch` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `PPTMA` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `holder`
--

INSERT INTO `holder` (`id`, `verification_code`, `verify_link`, `date_created`, `expiry`, `issued`, `gender`, `designation`, `fullname`, `branch`, `image`, `PPTMA`) VALUES
(1, '95444171EB', 'card_holder_HDSDYGWUDKSDJSHJKDHJSDKHSKDHKSHDUHDUWEUGWYE62362573T27367EGWTE6W6ETWE623J2G3QK7WQW3TK7273/3434438483840011212n1by2e82ye28tt27vd7v27d72', '12/12/2022', '12/12/2022', '12/12/2022', 'male', 'Web Designer', 'Erim Emmanuel', 'IT', 'jsjds.jpg', '77767767');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `holder`
--
ALTER TABLE `holder`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `holder`
--
ALTER TABLE `holder`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
