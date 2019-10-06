-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 04, 2019 at 11:55 AM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project_asset`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_borrow` (IN `document_no_pr` VARCHAR(200), IN `use_for_pr` VARCHAR(200), IN `date_pr` VARCHAR(20), IN `return_date_pr` VARCHAR(20), IN `status_pr` VARCHAR(50), IN `note_pr` VARCHAR(200), IN `user_id` INT)  BEGIN
INSERT INTO `borrow`
(
`document_no`,
`use_for`,
`date`,
`return_date`,
`status`,
`note`,
`user_id`
)
VALUES
(
document_no_pr,
use_for_pr,
date_pr,
return_date_pr,
status_pr,
note_pr,
user_id
);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `add_borrow_details` (IN `bor_id_pr` INT, IN `asset_code_pr` VARCHAR(200), IN `asset_name_pr` VARCHAR(200), IN `asset_id_pr` INT)  BEGIN
INSERT INTO `borrow_details`
(
`bor_id`,
`asset_code`,
`asset_name`,
`asset_id`
)
VALUES
(
bor_id_pr,
asset_code_pr,
asset_name_pr,
asset_id_pr
);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `add_expose` (IN `document_no_pr` VARCHAR(200), IN `user_id_pr` INT, IN `use_for_pr` VARCHAR(200), IN `date_pr` VARCHAR(200), IN `status_pr` VARCHAR(200), IN `note_pr` VARCHAR(200))  BEGIN
INSERT INTO expose_asset
(
`document_no`,
`user_id`,
`use_for`,
`date`,
`status`,
`note`
)
VALUES
(
document_no_pr,
user_id_pr,
use_for_pr,
date_pr,
status_pr,
note_pr
);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `add_expose_details` (IN `ex_id_pr` INT, IN `con_id_pr` INT, IN `amount_pr` INT, IN `con_name_pr` VARCHAR(200), IN `con_code_pr` VARCHAR(200))  BEGIN
INSERT INTO `expose_details`
(
`ex_id`,
`con_id`,
`amount`,
`con_name`,
`con_code`
)
VALUES
(
ex_id_pr,
con_id_pr,
amount_pr,
con_name_pr,
con_code_pr
);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `add_perDetails` (IN `asset_code_pr` VARCHAR(255), IN `asset_name_pr` VARCHAR(255), IN `status_pr` VARCHAR(255), IN `storage_pr` VARCHAR(255), IN `note_pr` VARCHAR(255), IN `per_id_pr` INT, IN `use_status_pr` VARCHAR(255))  BEGIN
INSERT INTO per_details
(
asset_code,
asset_name,
per_status,
per_storage,
note,
per_id,
use_status)
VALUES
(
asset_code_pr,
asset_name_pr,
status_pr,
storage_pr,
note_pr,
per_id_pr,
use_status_pr
);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `add_permanent` (IN `per_code_pr` VARCHAR(255), IN `per_name_pr` VARCHAR(255), IN `amount_pr` INT, IN `unit_pr` VARCHAR(255), IN `price_pr` DOUBLE, IN `peice_sum_pr` DOUBLE, IN `input_date_pr` VARCHAR(255), IN `life_time_pr` INT, IN `note_pr` VARCHAR(255))  BEGIN
INSERT INTO permanent(
`per_code`,
`per_name`,
`amount`,
`unit`,
`price`,
`peice_sum`,
`input_date`,
`life_time`,
`note`
)
VALUES
(
per_code_pr,
per_name_pr,
amount_pr,
unit_pr,
price_pr,
peice_sum_pr,
input_date_pr,
life_time_pr,
note_pr
);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `add_perOfUser` (IN `asset_id_pr` INT, IN `user_id_pr` INT)  BEGIN
INSERT INTO `per_of_user`
(
`asset_id`,
`user_id`
)
VALUES
(
asset_id_pr,
user_id_pr
);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `add_repair_details` (IN `asset_id_pr` INT, IN `asset_code_pr` VARCHAR(200), IN `asset_name_pr` VARCHAR(200), IN `note_pr` VARCHAR(200), IN `repair_id_pr` INT)  BEGIN
INSERT INTO `repair_details`
(
`asset_id`,
`asset_code`,
`asset_name`,
`note`,
`repair_id`
)
VALUES
(
asset_id_pr,
asset_code_pr,
asset_name_pr,
note_pr,
repair_id_pr
);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `add_repair_permanent` (IN `document_no_pr` VARCHAR(200), IN `date_pr` VARCHAR(200), IN `return_date_pr` VARCHAR(200), IN `repair_center_pr` VARCHAR(200), IN `note_pr` VARCHAR(200), IN `user_id_pr` INT, IN `status_pr` VARCHAR(200))  BEGIN
INSERT INTO `repair_permanent`
(
`document_no`,
`date`,
`return_date`,
`repair_center`,
`note`,
`user_id`,
`status`
)
VALUES
(
document_no_pr,
date_pr,
return_date_pr,
repair_center_pr,
note_pr,
user_id_pr,
status_pr
);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `add_user` (IN `user_code_pr` VARCHAR(200), IN `username_pr` VARCHAR(200), IN `title_pr` VARCHAR(200), IN `password_pr` VARCHAR(200), IN `first_name_pr` VARCHAR(200), IN `last_name_pr` VARCHAR(200), IN `address_pr` VARCHAR(200), IN `phone_pr` VARCHAR(200), IN `email_pr` VARCHAR(200), IN `role_pr` VARCHAR(200), IN `faculty_id_pr` INT, IN `department_id_pr` INT, IN `last_update_pr` VARCHAR(200), IN `status_pr` VARCHAR(200))  BEGIN

INSERT INTO `users`
(
`user_code`,
`username`,
`title`,
`password`,
`first_name`,
`last_name`,
`address`,
`phone`,
`email`,
`role`,
`faculty_id`,
`department_id`,
`last_update`,
`status`)
VALUES
(
user_code_pr ,
username_pr ,
title_pr ,
password_pr ,
first_name_pr ,
last_name_pr ,
address_pr ,
phone_pr ,
email_pr ,
role_pr ,
faculty_id_pr ,
department_id_pr ,
last_update_pr,
status_pr
);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_borrow` (IN `id_pr` INT)  BEGIN
DELETE FROM `borrow`
WHERE bor_id = id_pr;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_borrow_details` (IN `id_pr` INT)  BEGIN
DELETE FROM `borrow_details`
WHERE id = id_pr;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_bor_details` (IN `id_pr` INT)  BEGIN
DELETE FROM `borrow_details`
WHERE id = id_pr;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_expose` (IN `id_pr` INT)  BEGIN
DELETE FROM `expose_asset`
WHERE ex_id = id_pr;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_expose_details` (IN `id_pr` INT)  BEGIN
DELETE FROM `expose_details`
WHERE id = id_pr;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_perDetails` (IN `asset_id_pr` INT)  BEGIN
DELETE FROM per_details
WHERE asset_id = asset_id_pr;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_permanent` (IN `per_id_pr` INT)  BEGIN
DELETE FROM permanent
WHERE per_id = per_id_pr;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_perOfUser` (IN `id_pr` INT)  BEGIN
DELETE FROM per_of_user
WHERE id = id_pr;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_repair_details` (IN `id_pr` INT)  BEGIN
DELETE FROM `repair_details`
WHERE id = id_pr;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_repair_permanent` (IN `id_pr` INT)  BEGIN
DELETE FROM `repair_permanent`
WHERE repair_id = id_pr;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `edit_borrow` (IN `bor_id_pr` INT, IN `document_no_pr` VARCHAR(200), IN `use_for_pr` VARCHAR(200), IN `date_pr` VARCHAR(200), IN `return_date_pr` VARCHAR(200), IN `status_pr` VARCHAR(200), IN `note_pr` VARCHAR(200), IN `user_id_pr` INT)  BEGIN
UPDATE `borrow`
SET
`document_no` = document_no_pr,
`use_for` = use_for_pr,
`date` = date_pr,
`return_date` = return_date_pr,
`status` = status_pr,
`note` = note_pr,
`user_id` = user_id_pr
WHERE `bor_id` = bor_id_pr;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `edit_borrow_details` (IN `id_pr` INT, IN `bor_id_pr` INT, IN `asset_code_pr` VARCHAR(200), IN `asset_name_pr` VARCHAR(200), IN `asset_id_pr` INT)  BEGIN
UPDATE `borrow_details`
SET
`bor_id` = bor_id_pr,
`asset_code` = asset_code_pr,
`asset_name` = asset_name_pr,
`asset_id` = asset_id_pr
WHERE `id` = id_pr;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `edit_expose` (IN `ex_id_pr` INT, IN `document_no_pr` VARCHAR(200), IN `user_id_pr` INT, IN `use_for_pr` VARCHAR(200), IN `date_pr` VARCHAR(200), IN `status_pr` VARCHAR(200), IN `note_pr` VARCHAR(200))  BEGIN
UPDATE `expose_asset`
SET
`document_no` = document_no_pr,
`user_id` = user_id_pr,
`use_for` = use_for_pr,
`date` = date_pr,
`status` = status_pr,
`note` = note_pr
WHERE `ex_id` = ex_id_pr;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `edit_expose_details` (IN `id_pr` INT, IN `ex_id_pr` INT, IN `con_id_pr` INT, IN `amount_pr` INT, IN `con_name_pr` VARCHAR(200), IN `con_code_pr` VARCHAR(200))  BEGIN
UPDATE `expose_details`
SET
`ex_id` = ex_id_pr,
`con_id` = con_id_pr,
`amount` = amount_pr,
`con_name` = con_name_pr,
`con_code` = con_code_pr
WHERE `id` = id_pr;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `edit_perDetails` (IN `asset_id_pr` INT, IN `asset_code_pr` VARCHAR(255), IN `asset_name_pr` VARCHAR(255), IN `status_pr` VARCHAR(255), IN `storage_pr` VARCHAR(255), IN `note_pr` VARCHAR(255), IN `per_id_pr` INT, IN `use_status_pr` VARCHAR(255))  BEGIN
UPDATE per_details
SET
`asset_code` = asset_code_pr,
`asset_name` = asset_name_pr,
`per_status` = status_pr,
`per_storage` = storage_pr,
`note` = note_pr,
`per_id` = per_id_pr,
`use_status` = use_status_pr
WHERE `asset_id` = asset_id_pr;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `edit_permanent` (IN `per_id_pr` INT, IN `per_code_pr` VARCHAR(255), IN `per_name_pr` VARCHAR(255), IN `amount_pr` INT, IN `unit_pr` VARCHAR(255), IN `price_pr` DOUBLE, IN `peice_sum_pr` DOUBLE, IN `input_date_pr` VARCHAR(255), IN `life_time_pr` INT, IN `note_pr` VARCHAR(255))  BEGIN
UPDATE permanent
SET
`per_code` = per_code_pr,
`per_name` = per_name_pr,
`amount` = amount_pr,
`unit` = unit_pr,
`price` = price_pr,
`peice_sum` = peice_sum_pr,
`input_date` = input_date_pr,
`life_time` = life_time_pr,
`note` = note_pr
WHERE `per_id` = per_id_pr;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `edit_perOfUser` (IN `id_pr` INT, IN `asset_id_pr` INT, IN `user_id_pr` INT)  BEGIN
UPDATE per_of_user
SET
`asset_id` = asset_id_pr,
`user_id` = user_id_pr
WHERE `id` = id_pr;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `edit_repair_details` (IN `id_pr` INT, IN `asset_id_pr` INT, IN `asset_code_pr` VARCHAR(200), IN `asset_name_pr` VARCHAR(200), IN `note_pr` VARCHAR(200))  BEGIN
UPDATE `project_asset`.`repair_details`
SET
`asset_id` = asset_id_pr,
`asset_code` = asset_code_pr,
`asset_name` = asset_name_pr,
`note` = note_pr
WHERE `id` = id_pr;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `edit_repair_permanent` (IN `repair_id_pr` INT, IN `document_no_pr` VARCHAR(200), IN `date_pr` VARCHAR(200), IN `return_date_pr` VARCHAR(200), IN `repair_center_pr` VARCHAR(200), IN `note_pr` VARCHAR(200), IN `user_id_pr` INT, IN `status_pr` VARCHAR(200))  BEGIN
UPDATE `project_asset`.`repair_permanent`
SET
`document_no` = document_no_pr,
`date` = date_pr,
`return_date` = return_date_pr,
`repair_center` = repair_center_pr,
`note` = note_pr,
`user_id` = user_id_pr,
`status` = status_pr
WHERE `repair_id` = repair_id_pr;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `edit_user` (IN `user_id_pr` INT, IN `user_code_pr` VARCHAR(200), IN `username_pr` VARCHAR(200), IN `title_pr` VARCHAR(200), IN `password_pr` VARCHAR(200), IN `first_name_pr` VARCHAR(200), IN `last_name_pr` VARCHAR(200), IN `address_pr` VARCHAR(200), IN `phone_pr` VARCHAR(200), IN `email_pr` VARCHAR(200), IN `role_pr` VARCHAR(200), IN `faculty_id_pr` INT, IN `department_id_pr` INT, IN `last_update_pr` VARCHAR(200), IN `status_pr` VARCHAR(200))  BEGIN
UPDATE `users`
SET
`user_code` = user_code_pr,
`username` = username_pr,
`title` = title_pr,
`password` = password_pr,
`first_name` = first_name_pr,
`last_name` = last_name_pr,
`address` = address_pr,
`phone` = phone_pr,
`email` = email_pr,
`role` = role_pr,
`faculty_id` = faculty_id_pr,
`department_id` = department_id_pr,
`last_update` = last_update_pr,
`status` = status_pr
WHERE `user_id` = user_id_pr;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getAll_perDetails` ()  BEGIN
select
pou.id,
pd.asset_id,
pd.asset_code,
pd.asset_name,
pd.per_id,
pd.per_status,
pd.use_status,
pd.per_storage,
pd.note,
u.user_id,
u.user_code,
u.username,
u.first_name+' '+u.last_name as full_name
from per_details as pd
join per_of_user as pou
on pd.asset_id = pou.asset_id
join users as u
on pou.user_id = u.user_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `searchPermanent` (IN `search_pr` VARCHAR(200), IN `input_date_pr` VARCHAR(200))  BEGIN
select * from permanent
where (per_code like search_pr or per_name like search_pr) and input_date like input_date_pr;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `search_borrow` (IN `document_no_pr` VARCHAR(200), IN `date_pr` VARCHAR(50), IN `status_pr` VARCHAR(50), IN `username` VARCHAR(200))  BEGIN
(
SELECT * FROM borrow 
join users
on borrow.user_id = users.user_id
where borrow.document_no like document_no_pr COLLATE utf8mb4_unicode_ci
and 
borrow.date like date_pr COLLATE utf8mb4_unicode_ci
and 
borrow.status like status_pr COLLATE utf8mb4_unicode_ci
and 
users.username like username COLLATE utf8mb4_unicode_ci
);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `search_expose` (IN `document_no_pr` VARCHAR(200), IN `date_pr` VARCHAR(200), IN `stauts_pr` VARCHAR(200), IN `username_pr` VARCHAR(200))  BEGIN
SELECT * FROM expose_asset
join users
on users.user_id = expose_asset.user_id
where 
expose_asset.document_no like document_no_pr COLLATE utf8mb4_unicode_ci
and 
expose_asset.date like date_pr COLLATE utf8mb4_unicode_ci
and 
expose_asset.status like stauts_pr COLLATE utf8mb4_unicode_ci
and 
users.username like username_pr COLLATE utf8mb4_unicode_ci;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `search_repair` (IN `document_no_pr` VARCHAR(200), IN `date_pr` VARCHAR(50), IN `return_date_pr` VARCHAR(50), IN `status_pr` VARCHAR(50))  BEGIN
(
SELECT * FROM repair_permanent 

where repair_permanent .document_no like document_no_pr COLLATE utf8mb4_unicode_ci
and 
repair_permanent .date like date_pr COLLATE utf8mb4_unicode_ci
and 
repair_permanent .return_date like return_date_pr COLLATE utf8mb4_unicode_ci
and 
repair_permanent .status like status_pr COLLATE utf8mb4_unicode_ci

);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `test` (IN `id` INT)  BEGIN
select * from users where user_id = id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_user` (IN `user_id_pr` INT, IN `user_code_pr` VARCHAR(200), IN `username_pr` VARCHAR(200), IN `title_pr` VARCHAR(200), IN `password_pr` VARCHAR(200), IN `first_name_pr` VARCHAR(200), IN `last_name_pr` VARCHAR(200), IN `address_pr` VARCHAR(200), IN `phone_pr` VARCHAR(200), IN `email_pr` VARCHAR(200), IN `role_pr` VARCHAR(200), IN `faculty_id_pr` INT, IN `department_id_pr` INT, IN `last_update_pr` VARCHAR(200))  BEGIN
UPDATE `users`
SET
`user_code` = user_code_pr,
`username` = username_pr,
`title` = title_pr,
`password` = password_pr,
`first_name` = first_name_pr,
`last_name` = last_name_pr,
`address` = address_pr,
`phone` = phone_pr,
`email` = email_pr,
`role` = role_pr,
`faculty_id` = faculty_id_pr,
`department_id` = department_id_pr,
`last_update` = last_update_pr
WHERE `user_id` = user_id_pr;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `borrow`
--

CREATE TABLE `borrow` (
  `bor_id` int(11) NOT NULL,
  `document_no` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL,
  `use_for` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL,
  `date` varchar(45) CHARACTER SET utf8mb4 DEFAULT NULL,
  `return_date` varchar(45) CHARACTER SET utf8mb4 DEFAULT NULL,
  `status` varchar(45) CHARACTER SET utf8mb4 DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `borrow`
--

INSERT INTO `borrow` (`bor_id`, `document_no`, `use_for`, `date`, `return_date`, `status`, `note`, `user_id`) VALUES
(12, '0001', 'ldkfjglkjdfgf', '10/04/2019', '10/10/2019', 'Returned', 'null', 1);

-- --------------------------------------------------------

--
-- Table structure for table `borrow_details`
--

CREATE TABLE `borrow_details` (
  `id` int(11) NOT NULL,
  `bor_id` int(11) DEFAULT NULL,
  `asset_code` varchar(255) DEFAULT NULL,
  `asset_name` varchar(255) DEFAULT NULL,
  `asset_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='table of details borrowing permanent asset ';

--
-- Dumping data for table `borrow_details`
--

INSERT INTO `borrow_details` (`id`, `bor_id`, `asset_code`, `asset_name`, `asset_id`) VALUES
(90, 12, '001-T1', 'tebel', 57);

-- --------------------------------------------------------

--
-- Table structure for table `consumable`
--

CREATE TABLE `consumable` (
  `con_id` int(11) NOT NULL,
  `con_code` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `con_name` varchar(250) CHARACTER SET utf8 DEFAULT NULL,
  `unit` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `note` varchar(250) CHARACTER SET utf8 DEFAULT NULL,
  `picture` longblob DEFAULT NULL,
  `amount_tt` int(11) DEFAULT NULL,
  `imp_amount` int(11) DEFAULT NULL,
  `exp_amount` int(11) DEFAULT NULL,
  `price_tt` double DEFAULT NULL,
  `storage` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `price` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `consumable`
--

INSERT INTO `consumable` (`con_id`, `con_code`, `con_name`, `unit`, `note`, `picture`, `amount_tt`, `imp_amount`, `exp_amount`, `price_tt`, `storage`, `price`) VALUES
(34, '0002', 'สีทาภายในยี่ห้อ TOA สีขาว', 'Gallon', '', NULL, 10, 20, 10, 20000, 'null', 2000);

-- --------------------------------------------------------

--
-- Table structure for table `consum_details`
--

CREATE TABLE `consum_details` (
  `id` int(11) NOT NULL,
  `amount` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `input_date` varchar(250) CHARACTER SET utf8 DEFAULT NULL,
  `note` varchar(250) CHARACTER SET utf8 DEFAULT NULL,
  `con_id` int(11) DEFAULT NULL,
  `price_sum` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `consum_details`
--

INSERT INTO `consum_details` (`id`, `amount`, `price`, `input_date`, `note`, `con_id`, `price_sum`) VALUES
(26, 20, 2000, '04/10/2019', '', 34, 40000);

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `department_id` int(11) NOT NULL,
  `department_name` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`department_id`, `department_name`) VALUES
(1, 'ช่างซ่อมบำรุง'),
(2, 'ธุระการบัญชี'),
(3, 'ธุระการช่าง');

-- --------------------------------------------------------

--
-- Table structure for table `expose_asset`
--

CREATE TABLE `expose_asset` (
  `ex_id` int(11) NOT NULL,
  `document_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `use_for` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `note` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `expose_asset`
--

INSERT INTO `expose_asset` (`ex_id`, `document_no`, `user_id`, `use_for`, `date`, `status`, `note`) VALUES
(7, '0001', 1, 'jyfgjhgj', '10/04/2019', 'Approved', 'null');

-- --------------------------------------------------------

--
-- Table structure for table `expose_details`
--

CREATE TABLE `expose_details` (
  `id` int(11) NOT NULL,
  `ex_id` int(11) DEFAULT NULL,
  `con_id` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `con_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `con_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `expose_details`
--

INSERT INTO `expose_details` (`id`, `ex_id`, `con_id`, `amount`, `con_name`, `con_code`) VALUES
(35, 7, 34, 10, 'Colors', '0002');

-- --------------------------------------------------------

--
-- Table structure for table `faculty`
--

CREATE TABLE `faculty` (
  `faculty_id` int(11) NOT NULL,
  `faculty_name` varchar(4250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `faculty`
--

INSERT INTO `faculty` (`faculty_id`, `faculty_name`) VALUES
(1, 'ซ่อมบำรุง'),
(2, 'บัญชี');

-- --------------------------------------------------------

--
-- Table structure for table `permanent`
--

CREATE TABLE `permanent` (
  `per_id` int(11) NOT NULL,
  `per_code` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `per_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `unit` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `price` double DEFAULT NULL,
  `peice_sum` double DEFAULT NULL,
  `input_date` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `life_time` int(11) DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permanent`
--

INSERT INTO `permanent` (`per_id`, `per_code`, `per_name`, `amount`, `unit`, `price`, `peice_sum`, `input_date`, `life_time`, `note`) VALUES
(61, '001', 'ชุดโต๊ะและเก้าอี้สำหรับห้องประชุม 001', 1, 'ชุด', 5900, 5900, '10/04/2019', 3, 'null'),
(62, '002', 'ชุดคอมพิวเตอร์สำนักงาน', 2, 'ชุด', 30000, 60000, '10/04/2019', 5, 'null');

-- --------------------------------------------------------

--
-- Table structure for table `per_details`
--

CREATE TABLE `per_details` (
  `asset_id` int(11) NOT NULL,
  `asset_code` varchar(255) DEFAULT NULL,
  `asset_name` varchar(255) DEFAULT NULL,
  `per_status` varchar(255) DEFAULT NULL,
  `per_storage` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `per_id` int(11) DEFAULT NULL,
  `use_status` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `per_details`
--

INSERT INTO `per_details` (`asset_id`, `asset_code`, `asset_name`, `per_status`, `per_storage`, `note`, `per_id`, `use_status`) VALUES
(57, '001-T1', 'โต๊ะขนาด 1x3 เมตร', 'Normal', 'ห้องประชุม 001', '', 61, 'Normal'),
(60, '002-CPU01', 'เครื่องคอมพวิเตอร์', 'Repairing', 'แผนกบัญชี', '', 62, 'Normal'),
(61, '002-CPU02', 'เครื่องคอมพิวเตอร์', 'Repairing', 'แผนกบัญชี', '', 62, 'Normal'),
(62, '002-MOR01', 'จอคอมพิวเตอร์', 'Normal', 'แผนกบัญชี', '', 62, 'Normal'),
(63, '002-MOR02', 'จอคอมพิวเตอร์', 'Normal', 'แผนกบัญชี', '', 62, 'Normal'),
(64, '002-MOUSE01', 'เม้าส์', 'Normal', 'แผนกบัญชี', '', 62, 'Normal'),
(65, '002-MOUSE02', 'เม้าส์', 'Normal', 'แผนกบัญชี', '', 62, 'Normal'),
(66, '001-C1', 'เก้าอี้', 'Normal', 'ห้องประชุม 001', '', 61, 'Normal');

-- --------------------------------------------------------

--
-- Table structure for table `per_of_user`
--

CREATE TABLE `per_of_user` (
  `id` int(11) NOT NULL,
  `asset_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `per_of_user`
--

INSERT INTO `per_of_user` (`id`, `asset_id`, `user_id`) VALUES
(56, 57, 1),
(59, 60, 1),
(60, 61, 1),
(61, 62, 1),
(62, 63, 1),
(63, 64, 1),
(64, 65, 1),
(65, 66, 1);

-- --------------------------------------------------------

--
-- Table structure for table `repair_details`
--

CREATE TABLE `repair_details` (
  `id` int(11) NOT NULL,
  `asset_id` int(11) DEFAULT NULL,
  `asset_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `asset_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `note` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `repair_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `repair_details`
--

INSERT INTO `repair_details` (`id`, `asset_id`, `asset_code`, `asset_name`, `note`, `repair_id`) VALUES
(38, 60, '002-CPU01', 'เครื่องคอมพวิเตอร์', '', 18),
(39, 57, '001-T1', 'โต๊ะขนาด 1x3 เมตร', '', 17),
(40, 61, '002-CPU02', 'เครื่องคอมพิวเตอร์', '', 19);

-- --------------------------------------------------------

--
-- Table structure for table `repair_permanent`
--

CREATE TABLE `repair_permanent` (
  `repair_id` int(11) NOT NULL,
  `document_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `return_date` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `repair_center` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `note` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `status` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `repair_permanent`
--

INSERT INTO `repair_permanent` (`repair_id`, `document_no`, `date`, `return_date`, `repair_center`, `note`, `user_id`, `status`) VALUES
(17, '0001', '10/04/2019', '10/10/2019', 'jhgjhgjhg', 'mhgjhgjhg', 1, 'Returned'),
(18, '0002', '10/04/2019', '10/30/2019', 'J-net Computer', '', 1, 'Repairing'),
(19, '0003', '10/04/2019', '10/18/2019', 'asdffd', 'asdfasd', 1, 'Repairing');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_code` varchar(250) DEFAULT NULL,
  `username` varchar(250) DEFAULT NULL,
  `title` varchar(250) DEFAULT NULL,
  `password` varchar(250) DEFAULT NULL,
  `first_name` varchar(250) DEFAULT NULL,
  `last_name` varchar(250) DEFAULT NULL,
  `address` varchar(250) DEFAULT NULL,
  `phone` varchar(250) DEFAULT NULL,
  `email` varchar(250) DEFAULT NULL,
  `role` varchar(250) DEFAULT NULL,
  `faculty_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `last_update` varchar(250) DEFAULT NULL,
  `picture` longblob DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_code`, `username`, `title`, `password`, `first_name`, `last_name`, `address`, `phone`, `email`, `role`, `faculty_id`, `department_id`, `last_update`, `picture`, `status`) VALUES
(1, 'admin', 'admin', 'นาย', '1234', 'admin', 'admin', 'sdfsdfas', '-', 'ibraganger@gmail.com', 'admin', 2, 2, '-', NULL, 'active'),
(123, '6142040016', 'watcharaporn', 'null', '1234', 'วัชราภรณ์', 'รื่นนุสาน', '', '0945069389', 'watcharaporn.nanny@gmail.com', 'admin', 1, 3, '', NULL, 'active'),
(124, '1400800067716', 'ibraganger', 'นาย', '1234', 'เจนวิทย์', 'ชนีวงศ์', '', '0926169469', 'jenwit.work@gmail.com', 'user', 1, 1, '', NULL, 'active');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `borrow`
--
ALTER TABLE `borrow`
  ADD PRIMARY KEY (`bor_id`),
  ADD KEY `user_borrow_idx` (`user_id`);

--
-- Indexes for table `borrow_details`
--
ALTER TABLE `borrow_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `borrow_and_details_idx` (`bor_id`);

--
-- Indexes for table `consumable`
--
ALTER TABLE `consumable`
  ADD PRIMARY KEY (`con_id`);

--
-- Indexes for table `consum_details`
--
ALTER TABLE `consum_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `con_id_idx` (`con_id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`department_id`);

--
-- Indexes for table `expose_asset`
--
ALTER TABLE `expose_asset`
  ADD PRIMARY KEY (`ex_id`),
  ADD KEY `user_and_expose_idx` (`user_id`);

--
-- Indexes for table `expose_details`
--
ALTER TABLE `expose_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ex_and_exDetails_idx` (`ex_id`);

--
-- Indexes for table `faculty`
--
ALTER TABLE `faculty`
  ADD PRIMARY KEY (`faculty_id`);

--
-- Indexes for table `permanent`
--
ALTER TABLE `permanent`
  ADD PRIMARY KEY (`per_id`);

--
-- Indexes for table `per_details`
--
ALTER TABLE `per_details`
  ADD PRIMARY KEY (`asset_id`),
  ADD KEY `ฟหกด_idx` (`per_id`);

--
-- Indexes for table `per_of_user`
--
ALTER TABLE `per_of_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_idx` (`user_id`),
  ADD KEY `per_details_idx` (`asset_id`);

--
-- Indexes for table `repair_details`
--
ALTER TABLE `repair_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `re_idx` (`repair_id`);

--
-- Indexes for table `repair_permanent`
--
ALTER TABLE `repair_permanent`
  ADD PRIMARY KEY (`repair_id`),
  ADD KEY `user_repair_idx` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `faculty_idx` (`faculty_id`),
  ADD KEY `department_idx` (`department_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `borrow`
--
ALTER TABLE `borrow`
  MODIFY `bor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `borrow_details`
--
ALTER TABLE `borrow_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `consumable`
--
ALTER TABLE `consumable`
  MODIFY `con_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `consum_details`
--
ALTER TABLE `consum_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `department_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `expose_asset`
--
ALTER TABLE `expose_asset`
  MODIFY `ex_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `expose_details`
--
ALTER TABLE `expose_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `faculty`
--
ALTER TABLE `faculty`
  MODIFY `faculty_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `permanent`
--
ALTER TABLE `permanent`
  MODIFY `per_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `per_details`
--
ALTER TABLE `per_details`
  MODIFY `asset_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `per_of_user`
--
ALTER TABLE `per_of_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `repair_details`
--
ALTER TABLE `repair_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `repair_permanent`
--
ALTER TABLE `repair_permanent`
  MODIFY `repair_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `borrow`
--
ALTER TABLE `borrow`
  ADD CONSTRAINT `user_borrow` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `borrow_details`
--
ALTER TABLE `borrow_details`
  ADD CONSTRAINT `borrow_and_details` FOREIGN KEY (`bor_id`) REFERENCES `borrow` (`bor_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `consum_details`
--
ALTER TABLE `consum_details`
  ADD CONSTRAINT `con_id` FOREIGN KEY (`con_id`) REFERENCES `consumable` (`con_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `expose_asset`
--
ALTER TABLE `expose_asset`
  ADD CONSTRAINT `user_and_expose` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `expose_details`
--
ALTER TABLE `expose_details`
  ADD CONSTRAINT `ex_and_exDetails` FOREIGN KEY (`ex_id`) REFERENCES `expose_asset` (`ex_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `per_details`
--
ALTER TABLE `per_details`
  ADD CONSTRAINT `ฟหกด` FOREIGN KEY (`per_id`) REFERENCES `permanent` (`per_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `per_of_user`
--
ALTER TABLE `per_of_user`
  ADD CONSTRAINT `per_details` FOREIGN KEY (`asset_id`) REFERENCES `per_details` (`asset_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `repair_details`
--
ALTER TABLE `repair_details`
  ADD CONSTRAINT `re` FOREIGN KEY (`repair_id`) REFERENCES `repair_permanent` (`repair_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `repair_permanent`
--
ALTER TABLE `repair_permanent`
  ADD CONSTRAINT `user_repair` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `department` FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `faculty` FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`faculty_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
