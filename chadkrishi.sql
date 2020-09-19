-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 14, 2018 at 08:32 PM
-- Server version: 10.1.33-MariaDB
-- PHP Version: 7.2.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `chadkrishi`
--

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `item_id` int(11) NOT NULL,
  `item_name` varchar(100) NOT NULL,
  `item_type` varchar(255) NOT NULL,
  `item_price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `showt_id2` int(11) DEFAULT NULL,
  `showi_id2` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `show_item`
--

CREATE TABLE `show_item` (
  `showi_id` int(11) NOT NULL,
  `item_id2` int(11) NOT NULL,
  `user_id2` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `show_tree`
--

CREATE TABLE `show_tree` (
  `showt_id` int(11) NOT NULL,
  `tree_id2` int(11) NOT NULL,
  `user_id1` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tips`
--

CREATE TABLE `tips` (
  `tips_id` int(11) NOT NULL,
  `tree_id1` int(11) NOT NULL,
  `tips` varchar(255) NOT NULL,
  `deaseas` varchar(255) NOT NULL,
  `medicine` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tree`
--

CREATE TABLE `tree` (
  `tree_id` int(11) NOT NULL,
  `tree_name` varchar(255) NOT NULL,
  `tree_type` varchar(100) NOT NULL,
  `tree_price` int(11) NOT NULL,
  `place` int(11) NOT NULL,
  `session` varchar(100) NOT NULL,
  `details` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `type` varchar(100) NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `number` int(11) NOT NULL,
  `location` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`item_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `fk_cons6` (`showt_id2`),
  ADD KEY `fk_cons7` (`showi_id2`);

--
-- Indexes for table `show_item`
--
ALTER TABLE `show_item`
  ADD PRIMARY KEY (`showi_id`),
  ADD KEY `fk_cons4` (`item_id2`),
  ADD KEY `fk_cons5` (`user_id2`);

--
-- Indexes for table `show_tree`
--
ALTER TABLE `show_tree`
  ADD PRIMARY KEY (`showt_id`),
  ADD KEY `fk_cons2` (`tree_id2`),
  ADD KEY `fk_cons3` (`user_id1`);

--
-- Indexes for table `tips`
--
ALTER TABLE `tips`
  ADD PRIMARY KEY (`tips_id`),
  ADD KEY `fk_cons1` (`tree_id1`);

--
-- Indexes for table `tree`
--
ALTER TABLE `tree`
  ADD PRIMARY KEY (`tree_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `show_item`
--
ALTER TABLE `show_item`
  MODIFY `showi_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `show_tree`
--
ALTER TABLE `show_tree`
  MODIFY `showt_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tips`
--
ALTER TABLE `tips`
  MODIFY `tips_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tree`
--
ALTER TABLE `tree`
  MODIFY `tree_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_cons6` FOREIGN KEY (`showt_id2`) REFERENCES `show_tree` (`showt_id`),
  ADD CONSTRAINT `fk_cons7` FOREIGN KEY (`showi_id2`) REFERENCES `show_item` (`showi_id`);

--
-- Constraints for table `show_item`
--
ALTER TABLE `show_item`
  ADD CONSTRAINT `fk_cons4` FOREIGN KEY (`item_id2`) REFERENCES `item` (`item_id`),
  ADD CONSTRAINT `fk_cons5` FOREIGN KEY (`user_id2`) REFERENCES `user` (`id`);

--
-- Constraints for table `show_tree`
--
ALTER TABLE `show_tree`
  ADD CONSTRAINT `fk_cons2` FOREIGN KEY (`tree_id2`) REFERENCES `tree` (`tree_id`),
  ADD CONSTRAINT `fk_cons3` FOREIGN KEY (`user_id1`) REFERENCES `user` (`id`);

--
-- Constraints for table `tips`
--
ALTER TABLE `tips`
  ADD CONSTRAINT `fk_cons1` FOREIGN KEY (`tree_id1`) REFERENCES `tree` (`tree_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
