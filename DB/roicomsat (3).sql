-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 25, 2023 at 10:07 AM
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
-- Database: `roicomsat`
--

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` int(11) NOT NULL,
  `url` varchar(255) NOT NULL,
  `user` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `transaction_id` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `amount` int(11) NOT NULL,
  `payer` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `date_initiated` varchar(255) NOT NULL,
  `payment_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `programmes`
--

CREATE TABLE `programmes` (
  `title` text NOT NULL,
  `qualification` varchar(255) NOT NULL,
  `fee` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `courses` varchar(255) NOT NULL,
  `duration` varchar(255) NOT NULL,
  `cordinator` varchar(255) NOT NULL,
  `id` int(11) NOT NULL,
  `activities` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `programmes`
--

INSERT INTO `programmes` (`title`, `qualification`, `fee`, `image`, `description`, `courses`, `duration`, `cordinator`, `id`, `activities`) VALUES
('Advanced Web Development with React JS', 'Diploma', '250000', '', 'This Course is going to land you as a Fullstack JavaScript Developer ', 'Web Basics,\nJavaScript Basics,\nAdvance JavaScript,\nReact JS,\nRedux & Redux Toolkit', '3 Months', 'erim', 1, '1,2'),
('Computer Appreciation', 'Dipploma', '30000', '', 'Compputer Literacy Programme\r\n', 'Word, Excel, Powerpoint, Basics', '3 months', '', 2, ''),
('Graphics Design', 'Diploma', '30000', '', 'Learn CorelDraw and Photoshop', '', '3 Months', '', 3, ''),
('Website Design', 'Diploma', '150000', '', 'Learn web design', '', '3 Months', '', 4, '');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `id` int(11) NOT NULL,
  `date_created` varchar(255) NOT NULL,
  `salary` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `other_names` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `dob` varchar(255) NOT NULL,
  `marital` varchar(255) NOT NULL,
  `religion` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `lga` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `accno` varchar(255) NOT NULL,
  `accname` varchar(255) NOT NULL,
  `bank` varchar(255) NOT NULL,
  `guarantor_name` varchar(255) NOT NULL,
  `guarantor_phone` varchar(255) NOT NULL,
  `guarantor_image` varchar(255) NOT NULL,
  `staff_id` varchar(255) NOT NULL,
  `designation` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `other_names` varchar(255) NOT NULL,
  `dob` varchar(255) NOT NULL,
  `marital` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `lga` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `guarantor` varchar(255) NOT NULL,
  `guarantor_image` varchar(255) NOT NULL,
  `guarantor_phone` varchar(255) NOT NULL,
  `reg_no` varchar(255) NOT NULL,
  `fee_paid` varchar(255) NOT NULL,
  `fee` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `programme` varchar(255) NOT NULL,
  `graduated` varchar(255) NOT NULL,
  `prog_id` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `date_admitted` varchar(255) NOT NULL,
  `guarantor_address` varchar(255) NOT NULL,
  `graduation` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `first_name`, `surname`, `other_names`, `dob`, `marital`, `phone`, `email`, `address`, `lga`, `state`, `guarantor`, `guarantor_image`, `guarantor_phone`, `reg_no`, `fee_paid`, `fee`, `image`, `programme`, `graduated`, `prog_id`, `gender`, `date_admitted`, `guarantor_address`, `graduation`) VALUES
(2, 'Collins', 'Andy', 'Okon', '2004-07-16', 'Single', '0817916105', 'collinsandy08032@gmail.com', 'Etagbor Beside Calculux, Calabar', 'Yakurr', 'Cross River', '', '/static/media/pro.44ea40a3eb8dd7fed2a9.png', '', 'ROI393508', '', '30000', '/static/media/pro.44ea40a3eb8dd7fed2a9.png', 'Graphics Design ', '', ' 3', 'Male', 'February/2023', '', 'May/2023'),
(3, 'Marvellous', 'Eyo', 'Effiom', '2004-07-16', 'Single', '09163717092', 'eyomarvellous31@gmail.com', '26 Archibong Asuquo, Calabar', 'Calabar South', 'Cross River', '', '/static/media/pro.44ea40a3eb8dd7fed2a9.png', '', 'ROI516883', '', '30000', '/static/media/pro.44ea40a3eb8dd7fed2a9.png', 'Computer Appreciation ', '', ' 2', 'Female', 'January', '', 'April'),
(4, 'Goodness', 'Egbe', 'Edu', '', 'Single', '09036174960', 'goodnessegbe96@gmail.com', '', '', '', '', '/static/media/pro.44ea40a3eb8dd7fed2a9.png', '', 'ROI858700', '', '30000', '/static/media/pro.44ea40a3eb8dd7fed2a9.png', 'Computer Appreciation ', '', ' 2', 'Female', '', '', ''),
(5, 'Uzoma', 'Godslight', 'Chibuike', '', 'Single', '08107085748', 'chibuikeuzoma1993@gmail.com', '', '', '', '', '/static/media/pro.44ea40a3eb8dd7fed2a9.png', '', 'ROI873485', '', '30000', '/static/media/pro.44ea40a3eb8dd7fed2a9.png', 'Computer Appreciation ', '', ' 2', 'Male', '', '', ''),
(6, 'Ugochhinyere', 'John', 'Success', '', 'Single', '08139083675', 'ugochij2018@gmail.com', '', '', '', '', '/static/media/pro.44ea40a3eb8dd7fed2a9.png', '', 'ROI932602', '', '30000', '/static/media/pro.44ea40a3eb8dd7fed2a9.png', 'Computer Appreciation ', '', ' 2', 'Male', '', '', ''),
(7, 'Divine', 'Martin', 'Ene', '', 'Single', '07031694730', 'divineene30@gmail.com', '', '', '', '', '/static/media/pro.44ea40a3eb8dd7fed2a9.png', '', 'ROI309068', '', '30000', '/static/media/pro.44ea40a3eb8dd7fed2a9.png', 'Computer Appreciation ', '', ' 2', 'Male', '', '', ''),
(8, 'Ginika', 'Obioma', 'ThankGod', '', 'Single', '08167380336', 'obiomathankgod24@gmail.com', '', '', '', '', '/static/media/pro.44ea40a3eb8dd7fed2a9.png', '', 'ROI326227', '', '30000', '/static/media/pro.44ea40a3eb8dd7fed2a9.png', 'Advanced Web Development with React JS ', '', ' 1', 'Male', '', '', ''),
(9, 'Praise', 'Ajom', 'Osowoayi', '', 'Single', '07032179225', 'ajompraise2468@gmaiil.com', '', '', '', '', '/static/media/pro.44ea40a3eb8dd7fed2a9.png', '', 'ROI580614', '', '30000', '/static/media/pro.44ea40a3eb8dd7fed2a9.png', 'Computer Appreciation ', '', ' 2', 'Male', '', '', ''),
(10, 'Elisha ', 'Ekpo', 'Ekpo', '', 'Single', '08060219855', 'eli.legend155@gmail.com', '', '', '', '', '/static/media/pro.44ea40a3eb8dd7fed2a9.png', '', 'ROI090192', '', '30000', '/static/media/pro.44ea40a3eb8dd7fed2a9.png', 'Computer Appreciation ', '', ' 2', 'Male', '', '', ''),
(11, 'Uwem', 'Aniedi', 'Imoh', '', 'Single', '08143997580', 'uwemaniedi14@gmail.com', '', '', '', '', '/static/media/pro.44ea40a3eb8dd7fed2a9.png', '', 'ROI864671', '', '30000', '/static/media/pro.44ea40a3eb8dd7fed2a9.png', 'Computer Appreciation ', '', ' 2', 'Male', '', '', ''),
(12, 'Florence', 'Ekong', 'Etim', '', 'Single', '07019156465', '', '', '', '', '', '/static/media/pro.44ea40a3eb8dd7fed2a9.png', '', 'ROI412704', '', '30000', '/static/media/pro.44ea40a3eb8dd7fed2a9.png', 'Computer Appreciation ', '', ' 2', 'Female', '', '', ''),
(13, 'Elizabeth', 'Pius', 'Archibong', '', 'Single', '08052298809', 'archibongelizabeth373@gmail.com', '', '', '', '', '/static/media/pro.44ea40a3eb8dd7fed2a9.png', '', 'ROI161329', '', '30000', '/static/media/pro.44ea40a3eb8dd7fed2a9.png', 'Graphics Design ', '', ' 3', 'Female', '', '', ''),
(14, 'Precious', 'Ajom', 'Ekekah', '', 'Single', '08020642287', 'omeeprecious456@gmail.com', '', '', '', '', '/static/media/pro.44ea40a3eb8dd7fed2a9.png', '', 'ROI024785', '', '30000', '/static/media/pro.44ea40a3eb8dd7fed2a9.png', 'Computer Appreciation ', '', ' 2', 'Female', '', '', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `programmes`
--
ALTER TABLE `programmes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `programmes`
--
ALTER TABLE `programmes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
