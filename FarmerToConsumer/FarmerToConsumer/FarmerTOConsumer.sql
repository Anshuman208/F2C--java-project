-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 03, 2021 at 10:23 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kdkfarm`
--

-- --------------------------------------------------------

--
-- Table structure for table `buy`
--

CREATE TABLE `buy` (
  `buy_id` int(11) DEFAULT NULL,
  `product` varchar(250) COLLATE utf8mb4_bin DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `kg` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `purchase_d` date DEFAULT NULL,
  `name` varchar(300) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Triggers `buy`
--
DELIMITER $$
CREATE TRIGGER `delt` AFTER DELETE ON `buy` FOR EACH ROW delete from purchase where buy_id=old.buy_id and purchase_d=old.purchase_d
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `myt` AFTER INSERT ON `buy` FOR EACH ROW insert into purchase set
product=new.product,kg=new.kg,total=new.total,purchase_d=new.purchase_d,name=new.name,buy_id=new.buy_id
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `cust_reg`
--

CREATE TABLE `cust_reg` (
  `name` varchar(250) COLLATE utf8mb4_bin NOT NULL,
  `address` varchar(250) COLLATE utf8mb4_bin NOT NULL,
  `phone` bigint(20) NOT NULL,
  `email` varchar(260) COLLATE utf8mb4_bin DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `username` varchar(250) COLLATE utf8mb4_bin NOT NULL,
  `password` varchar(250) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `cust_reg`
--

INSERT INTO `cust_reg` (`name`, `address`, `phone`, `email`, `dob`, `age`, `username`, `password`) VALUES
('Kirti Salunkhe', 'Bhagirathi Nagar ', 6769463567, 'kirti@gmail.com', '2000-03-03', 20, 'kittu', 'kittu'),
('neha ghadge', 'satara', 4576342353, 'neha@gmail.com', '2000-06-05', 21, 'neha', 'neha'),
('pooja rupnwar', 'karve Nagar', 1256783456, 'poo@gmail.com', '2000-05-14', 76, 'pooja', 'poo123'),
('sakshi Narwalkar', 'nanded', 7645983409, 'sakshi@gmail.com', '2000-02-01', 21, 'sakshi', 'sakshi'),
('Sanchita Joshi', 'kolhapur', 2134785654, 'sanchita@gmail.com', '2000-03-05', 21, 'sanchita@', 'sanchita'),
('Shreya Nagar', 'Nagar', 1223457689, 'shreya@gmail.com', '2021-05-03', 20, 'shreya', '123'),
('swati kale', 'pune', 8765347656, 'swati@gmail.com', '2004-03-04', 17, 'swati', '12swati');

-- --------------------------------------------------------

--
-- Table structure for table `farmer_reg`
--

CREATE TABLE `farmer_reg` (
  `farmer_id` int(11) NOT NULL,
  `name` varchar(250) COLLATE utf8mb4_bin NOT NULL,
  `city` varchar(250) COLLATE utf8mb4_bin NOT NULL,
  `address` varchar(250) COLLATE utf8mb4_bin NOT NULL,
  `phone` bigint(30) DEFAULT NULL,
  `username` varchar(250) COLLATE utf8mb4_bin DEFAULT NULL,
  `password` varchar(250) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `farmer_reg`
--

INSERT INTO `farmer_reg` (`farmer_id`, `name`, `city`, `address`, `phone`, `username`, `password`) VALUES
(1, 'giriRaj More', 'Satara', 'Bhagirathi Nagar', 9876543276, 'giri', '1234'),
(2, 'Shantabai swami', 'pune', 'Karve Road', 5678436574, 'shanta', 'shanta'),
(3, 'SanchitaBai Joshi', 'Kolhapur', 'Madhusudan Home', 5476895432, 'sanchita', 'Sanchi112'),
(4, 'Divya  varpe', 'Solapur', 'Kalewadi Road', 56348932, 'Divya', 'varpe'),
(5, 'suman jagtap', 'Nagpur', 'Guru building', 34568709, 'Suman', 'suman'),
(6, 'Shevanta Jadhav', 'Aurangabad', 'Panchvati Road', 1234568754, 'Shevanta', '5656'),
(7, 'Kanchan Wagh', 'Pune', 'Bhagirath Wadi', 5678453256, 'Kanchan', 'Kanchi'),
(8, 'kajolbai pawar', 'pune', 'hadapsar', 3245768956, 'kajolbai', 'kajolbai'),
(9, 'Mohan Mane', 'Nagpur', 'Nagar wadi', 1234568754, 'mohan', 'mohan12');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `pro_id` int(11) NOT NULL,
  `pro_name` varchar(250) COLLATE utf8mb4_bin NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`pro_id`, `pro_name`, `price`) VALUES
(1, 'apple', 300),
(2, 'mango', 600),
(3, 'apple', 20),
(4, 'tomato', 54),
(5, 'potato', 100),
(6, 'potato', 30),
(7, 'cabbage', 60),
(8, 'tomato', 40),
(9, 'apple', 200),
(10, 'apple', 200);

-- --------------------------------------------------------

--
-- Table structure for table `purchase`
--

CREATE TABLE `purchase` (
  `product` varchar(300) COLLATE utf8mb4_bin DEFAULT NULL,
  `kg` int(11) DEFAULT NULL,
  `total` int(50) DEFAULT NULL,
  `purchase_d` date DEFAULT NULL,
  `name` varchar(200) COLLATE utf8mb4_bin DEFAULT NULL,
  `buy_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `purchase`
--

INSERT INTO `purchase` (`product`, `kg`, `total`, `purchase_d`, `name`, `buy_id`) VALUES
('mango', 60, 36000, '2020-12-29', 'Kirti Salunkhe', 2),
('potato', 60, 6000, '2020-12-29', 'Kirti Salunkhe', 5),
('cabbage', 30, 1800, '2020-12-29', 'Kirti Salunkhe', 7),
('potato', 10, 1000, '2020-12-29', 'Kirti Salunkhe', 5),
('mango', 50, 30000, '2020-12-29', 'pooja rupnwar', 2),
('potato', 100, 10000, '2020-12-29', 'pooja rupnwar', 5),
('apple', 4, 1200, '2020-12-29', 'pooja rupnwar', 1),
('potato', 80, 8000, '2020-12-30', 'Kirti Salunkhe', 5),
('apple', 4, 80, '2020-12-30', 'Kirti Salunkhe', 3),
('potato', 7, 210, '2020-12-30', 'Kirti Salunkhe', 6),
('mango', 7, 4200, '2020-12-30', 'Kirti Salunkhe', 2),
('apple', 34, 10200, '2021-01-01', 'Kirti Salunkhe', 1),
('apple', 22, 6600, '2021-01-01', 'Kirti Salunkhe', 1),
('potato', 66, 6600, '2021-01-01', 'Kirti Salunkhe', 5),
('potato', 30, 900, '2021-01-01', 'Sanchita Joshi', 6),
('tomato', 30, 1620, '2021-01-01', 'Sanchita Joshi', 4),
('cabbage', 60, 3600, '2021-01-01', 'Sanchita Joshi', 7),
('potato', 55, 1650, '2021-01-01', 'Sanchita Joshi', 6),
('apple', 4, 80, '2021-01-03', 'swati kale', 3),
('tomato', 45, 2430, '2021-01-03', 'swati kale', 4),
('potato', 6, 600, '2021-01-03', 'neha ghadge', 5),
('cabbage', 6, 360, '2021-01-03', 'neha ghadge', 7),
('tomato', 65, 2600, '2021-01-03', 'neha ghadge', 8),
('tomato', 5, 200, '2021-01-03', 'Kirti Salunkhe', 8),
('cabbage', 4, 240, '2021-01-03', 'Kirti Salunkhe', 7),
('apple', 40, 800, '2021-01-04', 'swati kale', 3),
('tomato', 10, 540, '2021-01-04', 'swati kale', 4),
('tomato', 20, 800, '2021-01-04', 'swati kale', 8),
('tomato', 12, 480, '2021-01-05', 'swati kale', 8),
('apple', 3, 900, '2021-04-05', 'Kirti Salunkhe', 1),
('apple', 2, 600, '2021-04-05', 'Kirti Salunkhe', 1),
('mango', 2, 1200, '2021-05-03', 'Shreya Nagar', 2),
('apple', 5, 100, '2021-05-03', 'Shreya Nagar', 3),
('mango', 1, 600, '2021-05-03', 'Shreya Nagar', 2),
('apple', 4, 800, '2021-05-03', 'Shreya Nagar', 9),
('apple', 2, 400, '2021-05-03', 'Shreya Nagar', 9);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cust_reg`
--
ALTER TABLE `cust_reg`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `farmer_reg`
--
ALTER TABLE `farmer_reg`
  ADD PRIMARY KEY (`farmer_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`pro_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `farmer_reg`
--
ALTER TABLE `farmer_reg`
  MODIFY `farmer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
