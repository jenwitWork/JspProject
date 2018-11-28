-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 28, 2018 at 03:11 AM
-- Server version: 10.1.29-MariaDB
-- PHP Version: 7.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `toyota_tkkta`
--

-- --------------------------------------------------------

--
-- Table structure for table `branch`
--

CREATE TABLE `branch` (
  `branch_id` varchar(10) NOT NULL,
  `branch_name` varchar(100) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_user` varchar(50) DEFAULT NULL,
  `updated_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_user` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `branch`
--

INSERT INTO `branch` (`branch_id`, `branch_name`, `created_date`, `created_user`, `updated_date`, `updated_user`) VALUES
('BRUHO', 'โตโยต้า บุรีรัมย์ ยูสคาร์ (	สาขาสำนักงานใหญ่)', '2017-10-25 21:27:09', 'jenwit_ch', '2017-10-25 21:27:09', 'jenwit_ch'),
('KKHO', 'บริษัท โตโยต้าขอนแก่น ผู้จำหน่ายโตโยต้า จำกัด', '2017-10-25 20:12:18', 'jenwit_ch', '2017-10-25 20:12:18', 'jenwit_ch'),
('KKMD', 'บริษัท โตโยต้าขอนแก่น ผู้จำหน่ายโตโยต้า จำกัด (สาขามอดินแดง)', '2017-10-14 20:11:40', 'ibraganger', '2017-10-27 23:40:36', 'jenwit_ch'),
('KRUHO', 'โตโยต้า กาฬสินธุ์ ยูสคาร์ (สาขาสำนักงานใหญ่)', '2017-10-18 15:42:38', 'ibraganger', '2017-10-27 23:40:38', 'jenwit_ch');

-- --------------------------------------------------------

--
-- Table structure for table `car_model`
--

CREATE TABLE `car_model` (
  `cm_id` varchar(255) NOT NULL,
  `cm_name` varchar(255) NOT NULL,
  `serie_id` varchar(30) NOT NULL,
  `serie_title` varchar(100) CHARACTER SET utf32 NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_user` varchar(50) DEFAULT NULL,
  `updated_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_user` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `car_model`
--

INSERT INTO `car_model` (`cm_id`, `cm_name`, `serie_id`, `serie_title`, `created_date`, `created_user`, `updated_date`, `updated_user`) VALUES
('NCP91R-AHMDKT/A5', '1.5 J  M/T Standard', '201703101924111489148651387', 'Yaris', '2000-01-01 00:00:00', '', '2017-03-13 09:49:02', 'ibraganger'),
('NCP91R-AHMRKT/A5', '1.5 E  M/T', '201703101924111489148651387', 'Yaris', '2000-01-01 00:00:00', '', '2017-03-13 09:48:23', 'ibraganger'),
('NCP91R-AHPDKT/A5', '1.5 J  A/T  Standard', '201703101924111489148651387', 'Yaris', '2000-01-01 00:00:00', '', '2017-03-13 09:48:51', 'ibraganger'),
('NCP91R-AHPDKT/B5', '1.5 J  A/T', '201703101924111489148651387', 'Yaris', '2000-01-01 00:00:00', '', '2017-03-13 09:48:39', 'ibraganger'),
('NCP91R-AHPGKT/A5', '1.5 G  A/T', '201703101924111489148651387', 'Yaris', '2000-01-01 00:00:00', '', '2017-03-13 09:47:59', 'ibraganger'),
('NCP91R-AHPRKT/A5', '1.5 E  A/T', '201703101924111489148651387', 'Yaris', '2000-01-01 00:00:00', '', '2017-03-13 09:48:10', 'ibraganger'),
('NCP91R-AHPVKT/B5', '1.5 RS  A/T', '201703101924111489148651387', 'Yaris', '2000-01-01 00:00:00', '', '2017-03-13 09:47:27', 'ibraganger'),
('ZRE141R-GEFDKT/A2', '1.6 J M/T', '201703101924201489148660898', 'Corolla', '2000-01-01 00:00:00', '', '2017-03-13 09:54:09', 'ibraganger'),
('ZRE141R-GEPEKT/B2', '1.6 G', '201703101924201489148660898', 'Corolla', '2000-01-01 00:00:00', '', '2017-03-13 09:54:01', 'ibraganger'),
('ZRE142R-GEXGGT/A2', '1.8 G', '201703101924201489148660898', 'Corolla', '2000-01-01 00:00:00', '', '2017-03-13 09:53:38', 'ibraganger'),
('ZRE142R-GEXGGT/B2', '1.8 G Navigator', '201703101924201489148660898', 'Corolla', '2000-01-01 00:00:00', '', '2017-03-13 09:53:27', 'ibraganger'),
('ZRE142R-GEXNGT/A2', '1.8 E', '201703101924201489148660898', 'Corolla', '2000-01-01 00:00:00', '', '2017-03-13 09:53:49', 'ibraganger'),
('ZRE143R-GEXGKT/A2', '2.0 G', '201703101924201489148660898', 'Corolla', '2000-01-01 00:00:00', '', '2017-12-24 16:11:52', 'jenwit_ch'),
('ZRE143R-GEXVKT/A2', '2.0 V', '201703101924201489148660898', 'Corolla', '2000-01-01 00:00:00', '', '2017-12-23 21:57:27', 'jenwit_ch'),
('ZRE143R-GEXVKT/B2', '2.0 V  Navigator', '201703101924201489148660898', 'Corolla', '2000-01-01 00:00:00', '', '2017-12-24 19:49:18', 'jenwit_ch'),
('ZZE141R-GEMRKT/D2', '1.6 CNG M/T', '201703101924201489148660898', 'Corolla', '2000-01-01 00:00:00', '', '2017-03-13 09:54:42', 'ibraganger'),
('ZZE141R-GEMRKT/E2', '1.6 CNG M/T COLOR KEY', '201703101924201489148660898', 'Corolla', '2000-01-01 00:00:00', '', '2017-03-13 09:54:32', 'ibraganger'),
('ZZE141R-GEPEKT/D2', '1.6 E A/T CNG', '201703101924201489148660898', 'Corolla', '2000-01-01 00:00:00', '', '2017-03-13 09:54:18', 'ibraganger');

-- --------------------------------------------------------

--
-- Table structure for table `car_series`
--

CREATE TABLE `car_series` (
  `serie_id` varchar(30) NOT NULL,
  `serie_title` varchar(100) DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_user` varchar(50) DEFAULT NULL,
  `updated_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_user` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `car_series`
--

INSERT INTO `car_series` (`serie_id`, `serie_title`, `created_date`, `created_user`, `updated_date`, `updated_user`) VALUES
('201703101924111489148651387', 'Yaris', '2000-01-01 00:00:00', '', '2017-03-11 21:06:53', 'ibraganger'),
('201703101924201489148660898', 'Corolla', '2000-01-01 00:00:00', '', '2017-03-13 09:52:33', 'ibraganger');

-- --------------------------------------------------------

--
-- Table structure for table `document`
--

CREATE TABLE `document` (
  `doc_no` varchar(50) NOT NULL COMMENT 'เลขที่เอกสาร',
  `branch_id` varchar(10) NOT NULL,
  `status` varchar(20) DEFAULT NULL COMMENT 'สถานะเอกสาร',
  `serie_id` varchar(30) DEFAULT NULL COMMENT 'Series',
  `serie_title` varchar(100) DEFAULT NULL,
  `cm_id` varchar(255) DEFAULT NULL COMMENT 'Model',
  `cm_name` varchar(255) DEFAULT NULL,
  `pb_type` varchar(30) DEFAULT NULL COMMENT 'หมวดปัญหา',
  `pb_name` varchar(255) DEFAULT NULL,
  `case_name_th` varchar(255) DEFAULT NULL COMMENT 'ชื่อปัญหา (ภาษาไทย)',
  `case_name_en` varchar(255) DEFAULT NULL COMMENT 'ชื่อปัญหา (ภาษาอังกฤษ)',
  `view_count` int(11) DEFAULT NULL,
  `its_work` int(11) DEFAULT NULL,
  `its_notwork` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'วันที่สร้างเอกสาร',
  `created_user` varchar(50) DEFAULT NULL COMMENT 'ผู้สร้างเอกสาร',
  `updated_date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'วันที่แก้ไขเอกสาร',
  `updated_user` varchar(50) DEFAULT NULL COMMENT 'ผู้แก้ไขเอกสาร'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `document`
--

INSERT INTO `document` (`doc_no`, `branch_id`, `status`, `serie_id`, `serie_title`, `cm_id`, `cm_name`, `pb_type`, `pb_name`, `case_name_th`, `case_name_en`, `view_count`, `its_work`, `its_notwork`, `created_date`, `created_user`, `updated_date`, `updated_user`) VALUES
('18/T.00001', 'BRUHO', 'approved', '201703101924201489148660898', 'Corolla', 'ZRE141R-GEPEKT/B2', '1.6 G', '201703131935441489408544690', 'เครื่องยนต์', 'test', 'test', 0, 0, 0, '2018-03-20 22:40:24', 'jenwit_ch', '2018-05-19 09:43:51', 'jenwit_ch');

-- --------------------------------------------------------

--
-- Table structure for table `doc_comment`
--

CREATE TABLE `doc_comment` (
  `id` bigint(20) NOT NULL,
  `doc_no` varchar(50) NOT NULL,
  `comment` text NOT NULL,
  `username` varchar(50) NOT NULL,
  `comment_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `doc_comment`
--

INSERT INTO `doc_comment` (`id`, `doc_no`, `comment`, `username`, `comment_date`) VALUES
(9, '18/T.00001', 'ะำหะ', 'jenwit_ch', '2018-03-20 22:40:41'),
(10, '18/T.00001', 'ะำหะ', 'jenwit_ch', '2018-03-20 22:41:09');

-- --------------------------------------------------------

--
-- Table structure for table `doc_desc`
--

CREATE TABLE `doc_desc` (
  `doc_no` varchar(50) NOT NULL,
  `case_desc` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `doc_desc`
--

INSERT INTO `doc_desc` (`doc_no`, `case_desc`) VALUES
('18/T.00001', '<div><span style=\"font-size: large;\">แทนที่จะเปิด Notepad และก็ต้องไปที่เมนู File เพื่อบันทึกมัน จากนั้นต้องย้ายไปยังโฟเดอร์ที่ต้องการอีก ตอนนี้มีวิธีที่ง่ายกว่านั้นที่จะสามารถสร้างไฟล์ text ขึ้นมาในโฟเดอร์ต่างๆ เพียงแค่คลิกขวา จากนั้นก็กดปุ่ม W และ T แทน&nbsp;<br /><br /></span></div>\r\n<div align=\"left\"><span style=\"font-size: large;\">คีย์ลัด คลิกขวา &gt; W &gt; T ไม่จำเป็นต้องเปิด Notepad ก่อน ซึ่งมันจะสร้าง text document จากนั้นก็เปลี่ยนชื่อ และกด Enter จากนั้นก็เพีัยงเข้าไปแก้ไขข้อมูลด้านในตัวไฟล์ (กด CTRL+S บันทึกไฟล์อย่างรวดเร็ว) ก็เป็นอันเสร็จสิ้นการสร้าง text-document ที่ง่ายกว่าเดิม&nbsp;<br /><br /></span></div>\r\n<div align=\"left\"><strong><span style=\"font-size: large;\">คลิกขวา &gt; W &gt; T</span></strong></div>\r\n<p><br /><br />Read more:&nbsp;<a href=\"http://mxhitech.blogspot.com/2011/07/quickly-create-new-text-document.html#ixzz5AOM8p4rM\">http://mxhitech.blogspot.com/2011/07/quickly-create-new-text-document.html#ixzz5AOM8p4rM</a></p>');

-- --------------------------------------------------------

--
-- Table structure for table `doc_file`
--

CREATE TABLE `doc_file` (
  `pdf_path` varchar(255) NOT NULL,
  `pdf_name` varchar(255) NOT NULL,
  `doc_no` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `doc_pic`
--

CREATE TABLE `doc_pic` (
  `image_path` varchar(255) NOT NULL,
  `doc_no` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `doc_pic`
--

INSERT INTO `doc_pic` (`image_path`, `doc_no`) VALUES
('/storage/images/_img_201803202240241521560424388.jpg', '18/T.00001'),
('/storage/images/_img_201803202240241521560424432.jpg', '18/T.00001'),
('/storage/images/_img_201803202240241521560424499.jpg', '18/T.00001'),
('/storage/images/_img_201803202240241521560424565.jpg', '18/T.00001'),
('/storage/images/_img_201803202240241521560424633.jpg', '18/T.00001'),
('/storage/images/_img_201803202240241521560424687.jpg', '18/T.00001'),
('/storage/images/_img_201803202240241521560424760.jpg', '18/T.00001');

-- --------------------------------------------------------

--
-- Table structure for table `doc_vdo`
--

CREATE TABLE `doc_vdo` (
  `video_path` varchar(255) NOT NULL,
  `doc_no` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `doc_vdo`
--

INSERT INTO `doc_vdo` (`video_path`, `doc_no`) VALUES
('/storage/videos/_vdo_201803202240241521560424843.mp4', '18/T.00001');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `page_name` varchar(50) NOT NULL,
  `page_detail` varchar(255) DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_user` varchar(50) DEFAULT NULL,
  `updated_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_user` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`page_name`, `page_detail`, `created_date`, `created_user`, `updated_date`, `updated_user`) VALUES
('document', 'ข่าวสารเทคนิค', '2017-10-23 02:52:29', 'ibraganger', '2018-03-21 21:03:35', 'jenwit_ch'),
('users', 'จัดการผู้ใช้งาน', '2018-03-24 20:03:09', 'jenwit_ch', '2018-03-24 20:03:09', 'jenwit_ch');

-- --------------------------------------------------------

--
-- Table structure for table `problem_type`
--

CREATE TABLE `problem_type` (
  `pb_type` varchar(30) NOT NULL,
  `pb_name` varchar(255) DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  `created_user` varchar(50) DEFAULT NULL,
  `updated_date` datetime DEFAULT '2000-01-01 00:00:00',
  `updated_user` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `problem_type`
--

INSERT INTO `problem_type` (`pb_type`, `pb_name`, `created_date`, `created_user`, `updated_date`, `updated_user`) VALUES
('201703131935441489408544690', 'เครื่องยนต์', '2000-01-01 00:00:00', '', '2017-12-27 14:37:46', 'jenwit_ch'),
('201703131935581489408558092', 'เบรค', '2000-01-01 00:00:00', '', '2017-12-30 07:43:20', 'jenwit_ch');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `detail` varchar(200) DEFAULT NULL,
  `branch_id` varchar(10) NOT NULL,
  `pos_id` varchar(10) NOT NULL,
  `group_id` varchar(50) NOT NULL DEFAULT 'Users',
  `status` varchar(20) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  `created_user` varchar(50) DEFAULT NULL,
  `updated_date` datetime DEFAULT '2000-01-01 00:00:00',
  `updated_user` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`username`, `password`, `name`, `detail`, `branch_id`, `pos_id`, `group_id`, `status`, `created_date`, `created_user`, `updated_date`, `updated_user`) VALUES
('admin', '81dc9bdb52d04dc20036dbd8313ed055', 'admin', NULL, 'KKHO', 'SA', 'Administrator', 'active', '2017-10-25 23:05:42', 'jenwit_ch', '2017-10-25 23:05:42', 'jenwit_ch'),
('jenwit_ch', '79e0b37bc2df0060011da08478954684', 'เจนวิทย์ ชนีวงศ์', NULL, 'BRUHO', 'DEV', 'Administrator', 'active', '2017-10-25 23:06:30', 'admin', '2018-02-21 21:31:32', 'jenwit_ch');

-- --------------------------------------------------------

--
-- Table structure for table `user_branch`
--

CREATE TABLE `user_branch` (
  `id` int(11) NOT NULL,
  `branch_id` varchar(10) NOT NULL,
  `username` varchar(50) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_user` varchar(50) DEFAULT NULL,
  `updated_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_user` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ใช้สำหรับบอกว่าข้อมูลสาขานั้นๆ ใครสามารถดูได้บ้าง';

--
-- Dumping data for table `user_branch`
--

INSERT INTO `user_branch` (`id`, `branch_id`, `username`, `created_date`, `created_user`, `updated_date`, `updated_user`) VALUES
(3, 'KKHO', 'admin', '2017-10-25 23:05:43', 'jenwit_ch', '2017-10-25 23:05:43', 'jenwit_ch'),
(33, 'BRUHO', 'jenwit_ch', '2018-02-22 23:55:22', 'jenwit_ch', '2018-02-22 23:55:22', 'jenwit_ch'),
(34, 'KRUHO', 'jenwit_ch', '2018-02-23 00:00:45', 'jenwit_ch', '2018-02-23 00:00:45', 'jenwit_ch');

-- --------------------------------------------------------

--
-- Table structure for table `user_group`
--

CREATE TABLE `user_group` (
  `group_id` varchar(50) NOT NULL,
  `group_desc` varchar(100) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  `created_user` varchar(50) DEFAULT NULL,
  `updated_date` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  `updated_user` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_group`
--

INSERT INTO `user_group` (`group_id`, `group_desc`, `created_date`, `created_user`, `updated_date`, `updated_user`) VALUES
('Administrator', 'จัดการทุกสิ่งทุกอย่างในจักรวาลอันกว้างไกล', '2000-01-01 00:00:00', 'ibraganger', '2000-01-01 00:00:00', 'ibraganger'),
('User', 'Users are prevented from making accidental or intentional system-wide changes and can run most ', '2000-01-01 00:00:00', 'ibraganger', '2000-01-01 00:00:00', 'ibraganger');

-- --------------------------------------------------------

--
-- Table structure for table `user_page`
--

CREATE TABLE `user_page` (
  `id` bigint(20) NOT NULL,
  `branch_id` varchar(10) NOT NULL,
  `page_name` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `flag_add` char(1) NOT NULL DEFAULT 'N',
  `flag_edit` char(1) NOT NULL DEFAULT 'N',
  `flag_delete` char(1) NOT NULL DEFAULT 'N',
  `flag_approve` char(1) NOT NULL DEFAULT 'N',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_user` varchar(50) DEFAULT NULL,
  `updated_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_user` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_page`
--

INSERT INTO `user_page` (`id`, `branch_id`, `page_name`, `username`, `flag_add`, `flag_edit`, `flag_delete`, `flag_approve`, `created_date`, `created_user`, `updated_date`, `updated_user`) VALUES
(30, 'KKHO', 'document', 'admin', 'Y', 'Y', 'Y', 'Y', '2017-10-25 23:05:43', 'jenwit_ch', '2017-10-25 23:05:43', 'jenwit_ch'),
(476, 'KRUHO', 'document', 'jenwit_ch', 'N', 'N', 'N', 'N', '2018-02-23 00:00:44', 'jenwit_ch', '2018-02-23 00:00:44', 'jenwit_ch'),
(680, 'BRUHO', 'document', 'jenwit_ch', 'Y', 'Y', 'Y', 'Y', '2018-03-21 21:02:15', 'jenwit_ch', '2018-03-21 21:02:15', 'jenwit_ch');

-- --------------------------------------------------------

--
-- Table structure for table `user_pos`
--

CREATE TABLE `user_pos` (
  `pos_id` varchar(10) NOT NULL,
  `pos_desc` varchar(50) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  `created_user` varchar(50) DEFAULT NULL,
  `updated_date` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  `updated_user` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_pos`
--

INSERT INTO `user_pos` (`pos_id`, `pos_desc`, `created_date`, `created_user`, `updated_date`, `updated_user`) VALUES
('DEV', 'นักพัฒนาโปรแกรม', '2018-02-12 22:43:28', 'jenwit_ch', '2018-02-12 22:43:28', 'jenwit_ch'),
('SA', 'ไม่รู้ว่าเค้าเรียกว่าอะไรเหมือนกัน', '2017-12-18 19:16:53', 'jenwit_ch', '2017-12-18 19:16:53', 'jenwit_ch'),
('TA', 'จักเขาเอิ้นว่าหยังบุ', '2017-10-25 22:07:44', 'jenwit_ch', '2017-10-25 22:07:44', 'jenwit_ch');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `branch`
--
ALTER TABLE `branch`
  ADD PRIMARY KEY (`branch_id`);

--
-- Indexes for table `car_model`
--
ALTER TABLE `car_model`
  ADD PRIMARY KEY (`cm_id`);

--
-- Indexes for table `car_series`
--
ALTER TABLE `car_series`
  ADD PRIMARY KEY (`serie_id`);

--
-- Indexes for table `document`
--
ALTER TABLE `document`
  ADD PRIMARY KEY (`doc_no`);

--
-- Indexes for table `doc_comment`
--
ALTER TABLE `doc_comment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doc_desc`
--
ALTER TABLE `doc_desc`
  ADD PRIMARY KEY (`doc_no`);

--
-- Indexes for table `doc_file`
--
ALTER TABLE `doc_file`
  ADD PRIMARY KEY (`pdf_path`);

--
-- Indexes for table `doc_pic`
--
ALTER TABLE `doc_pic`
  ADD PRIMARY KEY (`image_path`);

--
-- Indexes for table `doc_vdo`
--
ALTER TABLE `doc_vdo`
  ADD PRIMARY KEY (`video_path`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`page_name`);

--
-- Indexes for table `problem_type`
--
ALTER TABLE `problem_type`
  ADD PRIMARY KEY (`pb_type`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `user_branch`
--
ALTER TABLE `user_branch`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_group`
--
ALTER TABLE `user_group`
  ADD PRIMARY KEY (`group_id`);

--
-- Indexes for table `user_page`
--
ALTER TABLE `user_page`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_pos`
--
ALTER TABLE `user_pos`
  ADD PRIMARY KEY (`pos_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `doc_comment`
--
ALTER TABLE `doc_comment`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `user_branch`
--
ALTER TABLE `user_branch`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `user_page`
--
ALTER TABLE `user_page`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=681;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
