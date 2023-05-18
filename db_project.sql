-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 20, 2020 at 10:20 AM
-- Server version: 5.7.17-log
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `borrowing_krp6500`
--

-- --------------------------------------------------------

--
-- Table structure for table `borrow`
--

CREATE TABLE `borrow` (
  `b_id` int(4) UNSIGNED ZEROFILL NOT NULL,
  `b_identity` varchar(11) NOT NULL COMMENT 'รหัสนักเรียน',
  `b_name` varchar(200) NOT NULL COMMENT 'ผู้ยืม',
  `b_allow` varchar(50) NOT NULL COMMENT 'ผู้อนุมัติ',
  `note` text NOT NULL,
  `teacher` varchar(150) NOT NULL,
  `status` int(1) UNSIGNED ZEROFILL NOT NULL,
  `rtn_date` datetime NOT NULL COMMENT 'กำหนดส่งคืน',
  `insdate` datetime NOT NULL COMMENT 'วันที่ส่งคืนจริง',
  `DTime` datetime NOT NULL COMMENT 'วันที่ยืม'
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

--
-- Dumping data for table `borrow`
--

INSERT INTO `borrow` (`b_id`, `b_identity`, `b_name`, `b_allow`, `note`, `teacher`, `status`, `rtn_date`, `insdate`, `DTime`) VALUES
(0026, '57011020510', 'สันติสุข ลีโป', 'ผู้ดูแลระบบ', '-', 'อ.อัรฮาวี', 2, '2018-06-12 12:30:00', '0000-00-00 00:00:00', '2018-06-11 07:32:29'),
(0025, '57011020510', 'สันติสุข ลีโป', 'ผู้ดูแลระบบ', '-', 'อ.อัรฮาวี', 2, '2018-06-11 07:27:12', '0000-00-00 00:00:00', '2018-06-11 07:27:16'),
(0027, '57011020510', 'สันติสุข ลีโป', 'ผู้ดูแลระบบ', '-', 'อ.อัรฮาวี', 1, '2018-07-05 02:38:42', '0000-00-00 00:00:00', '2018-07-05 02:38:44'),
(0028, '57011020510', 'สันติสุข ลีโป', 'ผู้ดูแลระบบ', '-', 'อ.อัรฮาวี', 1, '2018-07-10 01:36:02', '0000-00-00 00:00:00', '2018-07-06 01:36:09'),
(0029, '0123456710', 'suriya juntanala', 'ผู้ดูแลระบบ', '-', 'อาจารย์ที่ปรึกษา1', 2, '2018-09-30 08:59:20', '0000-00-00 00:00:00', '2018-09-30 08:59:22');

-- --------------------------------------------------------

--
-- Table structure for table `borrow_detail`
--

CREATE TABLE `borrow_detail` (
  `brw_id` int(4) UNSIGNED ZEROFILL NOT NULL COMMENT 'รหัสใบยืม-คืน',
  `tool_id` int(4) UNSIGNED ZEROFILL NOT NULL COMMENT 'รหัสอุปกรณ์ที่ยืม',
  `borrow` int(3) NOT NULL COMMENT 'จำนวนที่ยืม',
  `repatriate` int(10) NOT NULL COMMENT 'จำนวนที่คืน',
  `status` int(1) NOT NULL COMMENT 'สถานะการยืม'
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

--
-- Dumping data for table `borrow_detail`
--

INSERT INTO `borrow_detail` (`brw_id`, `tool_id`, `borrow`, `repatriate`, `status`) VALUES
(0025, 0010, 0, 1, 2),
(0026, 0010, 0, 1, 2),
(0027, 0010, 2, 0, 1),
(0028, 0011, 1, 0, 1),
(0029, 0011, 0, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `mb_id` int(11) NOT NULL COMMENT 'รหัสตาราง(pk)',
  `mb_identity` varchar(13) NOT NULL COMMENT 'รหัสนักศึกษา',
  `mb_title_name` varchar(10) NOT NULL COMMENT 'คำนำหน้าชื่อ',
  `mb_fname` varchar(70) NOT NULL COMMENT 'ชื่อ ',
  `mb_lname` varchar(70) NOT NULL COMMENT 'นามสกุล',
  `mb_teacher` varchar(100) NOT NULL COMMENT 'ครูประจำชั้น',
  `mb_status` varchar(20) NOT NULL COMMENT 'สถานะ',
  `mb_date` datetime NOT NULL COMMENT 'วันที่ลงทะเบียน'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='ตารางนักศึกษา';

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`mb_id`, `mb_identity`, `mb_title_name`, `mb_fname`, `mb_lname`, `mb_teacher`, `mb_status`, `mb_date`) VALUES
(61, '5701102051007', 'นาย', 'สันติสุข', 'ลีโป', 'อ.อัรฮาวี', '1', '2018-05-14 00:00:00'),
(62, '0123456710', 'นาย', 'suriya', 'juntanala', 'อาจารย์ที่ปรึกษา1', '1', '2018-09-17 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `mm`
--

CREATE TABLE `mm` (
  `id` int(2) UNSIGNED ZEROFILL NOT NULL,
  `name` varchar(60) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

--
-- Dumping data for table `mm`
--

INSERT INTO `mm` (`id`, `name`) VALUES
(01, 'มกราคม'),
(02, 'กุมภาพันธ์'),
(03, 'มีนาคม'),
(04, 'เมษายน'),
(05, 'พฤษภาคม'),
(06, 'มิถุนายน'),
(07, 'กรกฏาคม'),
(08, 'สิงหาคม'),
(09, 'กันยายน'),
(10, 'ตุลาคม'),
(11, 'พฤศจิกายน'),
(12, 'ธันวาคม');

-- --------------------------------------------------------

--
-- Table structure for table `procurment`
--

CREATE TABLE `procurment` (
  `id` int(4) UNSIGNED ZEROFILL NOT NULL,
  `no` varchar(8) NOT NULL,
  `type` int(3) UNSIGNED ZEROFILL NOT NULL,
  `name` varchar(120) NOT NULL,
  `detail` text NOT NULL,
  `stock` varchar(10) NOT NULL,
  `price` varchar(10) NOT NULL,
  `photo` varchar(40) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

--
-- Dumping data for table `procurment`
--

INSERT INTO `procurment` (`id`, `no`, `type`, `name`, `detail`, `stock`, `price`, `photo`) VALUES
(0010, '001', 001, 'ลูกฟุตบอล', '', '1', '', '1.jpg'),
(0011, '002', 002, 'ลูกฟุตซอล', '', '5', '', '11.jpg'),
(0012, '003', 005, 'ลูกวอลเล่ย์บอล', '.', '5', '499', '12.jpg'),
(0013, '007012', 007, 'dddd', 'ddd', '5', '', '13.jpg'),
(0014, '006013', 006, 'sssss', 'ssss', '3', '', '14.jpg'),
(0015, '006014', 006, 'sssss', 'dfsfsfs', '5', '', '15.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `sup_type`
--

CREATE TABLE `sup_type` (
  `id` int(3) UNSIGNED ZEROFILL NOT NULL,
  `name` varchar(60) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

--
-- Dumping data for table `sup_type`
--

INSERT INTO `sup_type` (`id`, `name`) VALUES
(001, 'ฟุตบอล'),
(002, 'ฟุตซอล'),
(005, 'วอลเล่ย์บอล'),
(006, 'บาสเก็ตบอล'),
(007, 'เปตอง'),
(008, 'ตะกร้อ'),
(009, 'แบดมินตัน'),
(010, 'หมากรุก');

-- --------------------------------------------------------

--
-- Table structure for table `user_info`
--

CREATE TABLE `user_info` (
  `id` int(3) UNSIGNED ZEROFILL NOT NULL,
  `type` int(3) UNSIGNED ZEROFILL NOT NULL,
  `fname` varchar(80) NOT NULL,
  `lname` varchar(80) NOT NULL,
  `position` varchar(60) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `ll_date` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

--
-- Dumping data for table `user_info`
--

INSERT INTO `user_info` (`id`, `type`, `fname`, `lname`, `position`, `username`, `password`, `ll_date`) VALUES
(001, 001, 'ผู้ดูแล', 'ระบบ', 'ผู้ดูแลระบบงาน', 'admin', '1234', '2019-02-26'),
(011, 002, 'บัวลอย', 'ไข่หวาน', 'ผู้จักการฝ่ายกีฬา', '44444', '1234', '2018-05-14');

-- --------------------------------------------------------

--
-- Table structure for table `user_type`
--

CREATE TABLE `user_type` (
  `id` int(3) UNSIGNED ZEROFILL NOT NULL,
  `name` varchar(60) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=tis620;

--
-- Dumping data for table `user_type`
--

INSERT INTO `user_type` (`id`, `name`) VALUES
(001, 'ผู้ดูแลระบบ'),
(002, 'หัวหน้างาน'),
(003, 'เจ้าหน้าที่งาน');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `borrow`
--
ALTER TABLE `borrow`
  ADD PRIMARY KEY (`b_id`);

--
-- Indexes for table `borrow_detail`
--
ALTER TABLE `borrow_detail`
  ADD KEY `brw_id` (`brw_id`),
  ADD KEY `brw_id_2` (`brw_id`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`mb_id`);

--
-- Indexes for table `mm`
--
ALTER TABLE `mm`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `procurment`
--
ALTER TABLE `procurment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sup_type`
--
ALTER TABLE `sup_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_type`
--
ALTER TABLE `user_type`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `borrow`
--
ALTER TABLE `borrow`
  MODIFY `b_id` int(4) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `member`
--
ALTER TABLE `member`
  MODIFY `mb_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'รหัสตาราง(pk)', AUTO_INCREMENT=63;
--
-- AUTO_INCREMENT for table `mm`
--
ALTER TABLE `mm`
  MODIFY `id` int(2) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `procurment`
--
ALTER TABLE `procurment`
  MODIFY `id` int(4) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `sup_type`
--
ALTER TABLE `sup_type`
  MODIFY `id` int(3) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `user_info`
--
ALTER TABLE `user_info`
  MODIFY `id` int(3) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `user_type`
--
ALTER TABLE `user_type`
  MODIFY `id` int(3) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
