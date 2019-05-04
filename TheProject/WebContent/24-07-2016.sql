-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: project_asset
-- ------------------------------------------------------
-- Server version	5.7.11-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `borrow`
--

DROP TABLE IF EXISTS `borrow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `borrow` (
  `bor_id` int(11) NOT NULL AUTO_INCREMENT,
  `document_no` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL,
  `use_for` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL,
  `date` varchar(45) CHARACTER SET utf8mb4 DEFAULT NULL,
  `return_date` varchar(45) CHARACTER SET utf8mb4 DEFAULT NULL,
  `status` varchar(45) CHARACTER SET utf8mb4 DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`bor_id`),
  KEY `user_borrow_idx` (`user_id`),
  CONSTRAINT `user_borrow` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrow`
--

LOCK TABLES `borrow` WRITE;
/*!40000 ALTER TABLE `borrow` DISABLE KEYS */;
INSERT INTO `borrow` VALUES (10,'0001','sdfasdfasd','07/14/2016','07/29/2016','Returned','null',121);
/*!40000 ALTER TABLE `borrow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `borrow_details`
--

DROP TABLE IF EXISTS `borrow_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `borrow_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bor_id` int(11) DEFAULT NULL,
  `asset_code` varchar(255) DEFAULT NULL,
  `asset_name` varchar(255) DEFAULT NULL,
  `asset_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `borrow_and_details_idx` (`bor_id`),
  CONSTRAINT `borrow_and_details` FOREIGN KEY (`bor_id`) REFERENCES `borrow` (`bor_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8 COMMENT='table of details borrowing permanent asset ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrow_details`
--

LOCK TABLES `borrow_details` WRITE;
/*!40000 ALTER TABLE `borrow_details` DISABLE KEYS */;
INSERT INTO `borrow_details` VALUES (84,10,'3252333071851','โต๊ะและเก้าอี้สำหรับอาจารย์',51),(85,10,'3252333071852','โต๊ะและเก้าอี้สำหรับอาจารย์',52);
/*!40000 ALTER TABLE `borrow_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consum_details`
--

DROP TABLE IF EXISTS `consum_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consum_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `input_date` varchar(250) CHARACTER SET utf8 DEFAULT NULL,
  `note` varchar(250) CHARACTER SET utf8 DEFAULT NULL,
  `con_id` int(11) DEFAULT NULL,
  `price_sum` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `con_id_idx` (`con_id`),
  CONSTRAINT `con_id` FOREIGN KEY (`con_id`) REFERENCES `consumable` (`con_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consum_details`
--

LOCK TABLES `consum_details` WRITE;
/*!40000 ALTER TABLE `consum_details` DISABLE KEYS */;
INSERT INTO `consum_details` VALUES (24,10,5,'19/07/2016','',32,50),(25,10,10,'21/07/2016','',33,100);
/*!40000 ALTER TABLE `consum_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consumable`
--

DROP TABLE IF EXISTS `consumable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consumable` (
  `con_id` int(11) NOT NULL AUTO_INCREMENT,
  `con_code` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `con_name` varchar(250) CHARACTER SET utf8 DEFAULT NULL,
  `unit` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `note` varchar(250) CHARACTER SET utf8 DEFAULT NULL,
  `picture` longblob,
  `amount_tt` int(11) DEFAULT NULL,
  `imp_amount` int(11) DEFAULT NULL,
  `exp_amount` int(11) DEFAULT NULL,
  `price_tt` double DEFAULT NULL,
  `storage` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `price` double DEFAULT NULL,
  PRIMARY KEY (`con_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consumable`
--

LOCK TABLES `consumable` WRITE;
/*!40000 ALTER TABLE `consumable` DISABLE KEYS */;
INSERT INTO `consumable` VALUES (32,'','ปาก','แท่ง','',NULL,10,10,0,50,'null',5),(33,'','ยางลบ','ก้อน','',NULL,20,20,0,200,'null',10);
/*!40000 ALTER TABLE `consumable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department` (
  `department_id` int(11) NOT NULL AUTO_INCREMENT,
  `department_name` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'วิศวกรรมคอมพิวเตอร์'),(2,'วิศกรรมไฟฟ้า');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expose_asset`
--

DROP TABLE IF EXISTS `expose_asset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expose_asset` (
  `ex_id` int(11) NOT NULL AUTO_INCREMENT,
  `document_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `use_for` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `note` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ex_id`),
  KEY `user_and_expose_idx` (`user_id`),
  CONSTRAINT `user_and_expose` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expose_asset`
--

LOCK TABLES `expose_asset` WRITE;
/*!40000 ALTER TABLE `expose_asset` DISABLE KEYS */;
INSERT INTO `expose_asset` VALUES (5,'001',121,'dbn','07/28/2016','Waiting','null');
/*!40000 ALTER TABLE `expose_asset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expose_details`
--

DROP TABLE IF EXISTS `expose_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expose_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ex_id` int(11) DEFAULT NULL,
  `con_id` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `con_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `con_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ex_and_exDetails_idx` (`ex_id`),
  CONSTRAINT `ex_and_exDetails` FOREIGN KEY (`ex_id`) REFERENCES `expose_asset` (`ex_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expose_details`
--

LOCK TABLES `expose_details` WRITE;
/*!40000 ALTER TABLE `expose_details` DISABLE KEYS */;
INSERT INTO `expose_details` VALUES (31,5,32,9,'ปาก','');
/*!40000 ALTER TABLE `expose_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faculty`
--

DROP TABLE IF EXISTS `faculty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faculty` (
  `faculty_id` int(11) NOT NULL AUTO_INCREMENT,
  `faculty_name` varchar(4250) DEFAULT NULL,
  PRIMARY KEY (`faculty_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faculty`
--

LOCK TABLES `faculty` WRITE;
/*!40000 ALTER TABLE `faculty` DISABLE KEYS */;
INSERT INTO `faculty` VALUES (1,'วิศวกรรมศาสตร์'),(2,'ครุศาสตร์');
/*!40000 ALTER TABLE `faculty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `per_details`
--

DROP TABLE IF EXISTS `per_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `per_details` (
  `asset_id` int(11) NOT NULL AUTO_INCREMENT,
  `asset_code` varchar(255) DEFAULT NULL,
  `asset_name` varchar(255) DEFAULT NULL,
  `per_status` varchar(255) DEFAULT NULL,
  `per_storage` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `per_id` int(11) DEFAULT NULL,
  `use_status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`asset_id`),
  KEY `ฟหกด_idx` (`per_id`),
  CONSTRAINT `ฟหกด` FOREIGN KEY (`per_id`) REFERENCES `permanent` (`per_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `per_details`
--

LOCK TABLES `per_details` WRITE;
/*!40000 ALTER TABLE `per_details` DISABLE KEYS */;
INSERT INTO `per_details` VALUES (50,'32523333052811','ชุดปฏิบัตการออกแบบวงจร VHDL','Repairing','','',59,'Normal'),(51,'3252333071851','โต๊ะและเก้าอี้สำหรับอาจารย์','Normal','','',60,'Normal'),(52,'3252333071852','โต๊ะและเก้าอี้สำหรับอาจารย์','Repairing','','',60,'Normal'),(53,'3252333071853','โต๊ะและเก้าอี้สำหรับอาจารย์','Normal','','',60,'Normal'),(54,'3252333071854','โต๊ะและเก้าอี้สำหรับอาจารย์','Normal','','',60,'Normal'),(55,'3252333071855','โต๊ะและเก้าอี้สำหรับอาจารย์','Normal','','',60,'Normal'),(56,'3252333071856','โต๊ะและเก้าอี้สำหรับอาจารย์','Normal','','',60,'Normal');
/*!40000 ALTER TABLE `per_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `per_of_user`
--

DROP TABLE IF EXISTS `per_of_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `per_of_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asset_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_idx` (`user_id`),
  KEY `per_details_idx` (`asset_id`),
  CONSTRAINT `per_details` FOREIGN KEY (`asset_id`) REFERENCES `per_details` (`asset_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `per_of_user`
--

LOCK TABLES `per_of_user` WRITE;
/*!40000 ALTER TABLE `per_of_user` DISABLE KEYS */;
INSERT INTO `per_of_user` VALUES (49,50,1),(50,51,1),(51,52,1),(52,53,1),(53,54,1),(54,55,1),(55,56,1);
/*!40000 ALTER TABLE `per_of_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permanent`
--

DROP TABLE IF EXISTS `permanent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permanent` (
  `per_id` int(11) NOT NULL AUTO_INCREMENT,
  `per_code` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `per_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `unit` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `price` double DEFAULT NULL,
  `peice_sum` double DEFAULT NULL,
  `input_date` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `life_time` int(11) DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`per_id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permanent`
--

LOCK TABLES `permanent` WRITE;
/*!40000 ALTER TABLE `permanent` DISABLE KEYS */;
INSERT INTO `permanent` VALUES (59,'32523333052811','ชุดปฏิบัตการออกแบบวงจร VHDL',1,'ชุด',1,1,'07/01/2016',1,'null'),(60,'3252333071856','โต๊ะและเก้าอี้สำหรับอาจารย์',6,'ชุด',1,6,'07/01/2016',1,'null');
/*!40000 ALTER TABLE `permanent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repair_details`
--

DROP TABLE IF EXISTS `repair_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repair_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asset_id` int(11) DEFAULT NULL,
  `asset_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `asset_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `note` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `repair_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `re_idx` (`repair_id`),
  CONSTRAINT `re` FOREIGN KEY (`repair_id`) REFERENCES `repair_permanent` (`repair_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repair_details`
--

LOCK TABLES `repair_details` WRITE;
/*!40000 ALTER TABLE `repair_details` DISABLE KEYS */;
INSERT INTO `repair_details` VALUES (33,50,'32523333052811','ชุดปฏิบัตการออกแบบวงจร VHDL','',16),(34,52,'3252333071852','โต๊ะและเก้าอี้สำหรับอาจารย์','',16);
/*!40000 ALTER TABLE `repair_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repair_permanent`
--

DROP TABLE IF EXISTS `repair_permanent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repair_permanent` (
  `repair_id` int(11) NOT NULL AUTO_INCREMENT,
  `document_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `return_date` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `repair_center` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `note` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `status` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`repair_id`),
  KEY `user_repair_idx` (`user_id`),
  CONSTRAINT `user_repair` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repair_permanent`
--

LOCK TABLES `repair_permanent` WRITE;
/*!40000 ALTER TABLE `repair_permanent` DISABLE KEYS */;
INSERT INTO `repair_permanent` VALUES (16,'001','07/30/2016','07/15/2016','dd','asd',120,'Repairing');
/*!40000 ALTER TABLE `repair_permanent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
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
  `picture` longblob,
  `status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `faculty_idx` (`faculty_id`),
  KEY `department_idx` (`department_id`),
  CONSTRAINT `department` FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `faculty` FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`faculty_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','admin','นาย','1234','admin','admin','sdfsdfas','-','ibraganger@gmail.com','admin',2,2,'-',NULL,'active'),(119,'553333013019-1','ibraganger','นาย','1234','เจนวิทย์.','ชนีวงศ์','','876346769','ibragangessr@gmail.com','user',1,1,'',NULL,'active'),(120,'5533333013416-9','adminjoe','นาย','1234','ธนชัย','ขุนศรี','','0900210522','kh.tanachai@gmail.com','admin',1,1,'',NULL,'active'),(121,'55333301300','user001','นาย','1234','สมชาติ','ลาดพร้าว','88','','','user',1,1,'',NULL,'active');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'project_asset'
--

--
-- Dumping routines for database 'project_asset'
--
/*!50003 DROP PROCEDURE IF EXISTS `add_borrow` */;
ALTER DATABASE `project_asset` CHARACTER SET utf8 COLLATE utf8_unicode_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_borrow`(
in document_no_pr varchar(200),
in use_for_pr varchar(200),
in date_pr varchar(20),
in return_date_pr varchar(20),
in status_pr varchar(50),
in note_pr varchar(200),
in user_id int
)
BEGIN
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `project_asset` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ;
/*!50003 DROP PROCEDURE IF EXISTS `add_borrow_details` */;
ALTER DATABASE `project_asset` CHARACTER SET utf8 COLLATE utf8_unicode_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_borrow_details`(
in bor_id_pr int,
in asset_code_pr varchar(200),
in asset_name_pr varchar(200),
in asset_id_pr int
)
BEGIN
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `project_asset` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ;
/*!50003 DROP PROCEDURE IF EXISTS `add_expose` */;
ALTER DATABASE `project_asset` CHARACTER SET utf8 COLLATE utf8_unicode_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_expose`(
in document_no_pr varchar(200),
in user_id_pr int,
in use_for_pr varchar(200),
in date_pr varchar(200),
in status_pr varchar(200),
in note_pr varchar(200)
)
BEGIN
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `project_asset` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ;
/*!50003 DROP PROCEDURE IF EXISTS `add_expose_details` */;
ALTER DATABASE `project_asset` CHARACTER SET utf8 COLLATE utf8_unicode_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_expose_details`(
in ex_id_pr int,
in con_id_pr int,
in amount_pr int,
in con_name_pr varchar(200),
in con_code_pr varchar(200)
)
BEGIN
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

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `project_asset` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ;
/*!50003 DROP PROCEDURE IF EXISTS `add_perDetails` */;
ALTER DATABASE `project_asset` CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_perDetails`(
in asset_code_pr varchar(255),
in asset_name_pr varchar(255),
in status_pr varchar(255),
in storage_pr varchar(255),
in note_pr varchar(255),
in per_id_pr int,
in use_status_pr varchar(255)
)
BEGIN
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

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `project_asset` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ;
/*!50003 DROP PROCEDURE IF EXISTS `add_permanent` */;
ALTER DATABASE `project_asset` CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_permanent`(
in per_code_pr varchar(255), 
in per_name_pr varchar(255),
in amount_pr int,
in unit_pr varchar(255),
in price_pr double,
in peice_sum_pr double,
in input_date_pr varchar(255),
in life_time_pr int,
in note_pr varchar(255)
)
BEGIN
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

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `project_asset` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ;
/*!50003 DROP PROCEDURE IF EXISTS `add_perOfUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_perOfUser`(
in asset_id_pr int,
in user_id_pr int
)
BEGIN
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_repair_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_repair_details`(
in asset_id_pr int,
in asset_code_pr varchar(200),
in asset_name_pr varchar(200),
in note_pr varchar(200),
in repair_id_pr int
)
BEGIN
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

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_repair_permanent` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_repair_permanent`(
in document_no_pr varchar(200),
in date_pr varchar(200),
in return_date_pr varchar(200),
in repair_center_pr varchar(200),
in note_pr varchar(200),
in user_id_pr int,
in status_pr varchar(200)
)
BEGIN
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_user`(
in user_code_pr varchar(200),
in username_pr varchar(200),
in title_pr varchar(200),
in password_pr varchar(200),
in first_name_pr varchar(200),
in last_name_pr varchar(200),
in address_pr varchar(200),
in phone_pr varchar(200),
in email_pr varchar(200),
in role_pr varchar(200),
in faculty_id_pr int,
in department_id_pr int,
in last_update_pr varchar(200),
in status_pr varchar(200)
)
BEGIN

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

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_borrow` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_borrow`(
in id_pr int
)
BEGIN
DELETE FROM `borrow`
WHERE bor_id = id_pr;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_borrow_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_borrow_details`(
in id_pr int
)
BEGIN
DELETE FROM `borrow_details`
WHERE id = id_pr;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_bor_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_bor_details`(
in id_pr int
)
BEGIN
DELETE FROM `borrow_details`
WHERE id = id_pr;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_expose` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_expose`(
in id_pr int
)
BEGIN
DELETE FROM `expose_asset`
WHERE ex_id = id_pr;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_expose_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_expose_details`(
in id_pr int
)
BEGIN
DELETE FROM `expose_details`
WHERE id = id_pr;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_perDetails` */;
ALTER DATABASE `project_asset` CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_perDetails`(
	in asset_id_pr int
)
BEGIN
DELETE FROM per_details
WHERE asset_id = asset_id_pr;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `project_asset` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_permanent` */;
ALTER DATABASE `project_asset` CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_permanent`(
in per_id_pr int
)
BEGIN
DELETE FROM permanent
WHERE per_id = per_id_pr;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `project_asset` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_perOfUser` */;
ALTER DATABASE `project_asset` CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_perOfUser`(
in id_pr int
)
BEGIN
DELETE FROM per_of_user
WHERE id = id_pr;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `project_asset` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_repair_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_repair_details`(
in id_pr int
)
BEGIN
DELETE FROM `repair_details`
WHERE id = id_pr;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_repair_permanent` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_repair_permanent`(
in id_pr int
)
BEGIN
DELETE FROM `repair_permanent`
WHERE repair_id = id_pr;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `edit_borrow` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `edit_borrow`(
in bor_id_pr int,
in document_no_pr varchar(200),
in use_for_pr varchar(200),
in date_pr varchar(200),
in return_date_pr varchar(200),
in status_pr varchar(200),
in note_pr varchar(200),
in user_id_pr int

)
BEGIN
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

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `edit_borrow_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `edit_borrow_details`(
in id_pr int,
in bor_id_pr int,
in asset_code_pr varchar(200),
in asset_name_pr varchar(200),
in asset_id_pr int
)
BEGIN
UPDATE `borrow_details`
SET
`bor_id` = bor_id_pr,
`asset_code` = asset_code_pr,
`asset_name` = asset_name_pr,
`asset_id` = asset_id_pr
WHERE `id` = id_pr;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `edit_expose` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `edit_expose`(
in ex_id_pr int,
in document_no_pr varchar(200),
in user_id_pr int,
in use_for_pr varchar(200),
in date_pr varchar(200),
in status_pr varchar(200),
in note_pr varchar(200)
)
BEGIN
UPDATE `expose_asset`
SET
`document_no` = document_no_pr,
`user_id` = user_id_pr,
`use_for` = use_for_pr,
`date` = date_pr,
`status` = status_pr,
`note` = note_pr
WHERE `ex_id` = ex_id_pr;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `edit_expose_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `edit_expose_details`(
in id_pr int ,
in ex_id_pr int ,
in con_id_pr int,
in amount_pr int,
in con_name_pr varchar(200),
in con_code_pr varchar(200)
)
BEGIN
UPDATE `expose_details`
SET
`ex_id` = ex_id_pr,
`con_id` = con_id_pr,
`amount` = amount_pr,
`con_name` = con_name_pr,
`con_code` = con_code_pr
WHERE `id` = id_pr;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `edit_perDetails` */;
ALTER DATABASE `project_asset` CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `edit_perDetails`(
in asset_id_pr int,
in asset_code_pr varchar(255),
in asset_name_pr varchar(255),
in status_pr varchar(255),
in storage_pr varchar(255),
in note_pr varchar(255),
in per_id_pr int,
in use_status_pr varchar(255)
)
BEGIN
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `project_asset` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ;
/*!50003 DROP PROCEDURE IF EXISTS `edit_permanent` */;
ALTER DATABASE `project_asset` CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `edit_permanent`(
in per_id_pr int,
in per_code_pr varchar(255), 
in per_name_pr varchar(255),
in amount_pr int,
in unit_pr varchar(255),
in price_pr double,
in peice_sum_pr double,
in input_date_pr varchar(255),
in life_time_pr int,
in note_pr varchar(255)
)
BEGIN
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `project_asset` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ;
/*!50003 DROP PROCEDURE IF EXISTS `edit_perOfUser` */;
ALTER DATABASE `project_asset` CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `edit_perOfUser`(
in id_pr int,
in asset_id_pr int,
in user_id_pr int
)
BEGIN
UPDATE per_of_user
SET
`asset_id` = asset_id_pr,
`user_id` = user_id_pr
WHERE `id` = id_pr;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `project_asset` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ;
/*!50003 DROP PROCEDURE IF EXISTS `edit_repair_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `edit_repair_details`(
in id_pr int,
in asset_id_pr int,
in asset_code_pr varchar(200),
in asset_name_pr varchar(200),
in note_pr varchar(200)
)
BEGIN
UPDATE `project_asset`.`repair_details`
SET
`asset_id` = asset_id_pr,
`asset_code` = asset_code_pr,
`asset_name` = asset_name_pr,
`note` = note_pr
WHERE `id` = id_pr;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `edit_repair_permanent` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `edit_repair_permanent`(
in repair_id_pr int,
in document_no_pr varchar(200),
in date_pr varchar(200),
in return_date_pr varchar(200),
in repair_center_pr varchar(200),
in note_pr varchar(200),
in user_id_pr int,
in status_pr varchar(200)
)
BEGIN
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

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `edit_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `edit_user`(
in user_id_pr int,
in user_code_pr varchar(200),
in username_pr varchar(200),
in title_pr varchar(200),
in password_pr varchar(200),
in first_name_pr varchar(200),
in last_name_pr varchar(200),
in address_pr varchar(200),
in phone_pr varchar(200),
in email_pr varchar(200),
in role_pr varchar(200),
in faculty_id_pr int,
in department_id_pr int,
in last_update_pr varchar(200),
in status_pr varchar(200)
)
BEGIN
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getAll_perDetails` */;
ALTER DATABASE `project_asset` CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getAll_perDetails`()
BEGIN
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `project_asset` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ;
/*!50003 DROP PROCEDURE IF EXISTS `searchPermanent` */;
ALTER DATABASE `project_asset` CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `searchPermanent`(in search_pr varchar(200),in input_date_pr varchar(200))
BEGIN
select * from permanent
where (per_code like search_pr or per_name like search_pr) and input_date like input_date_pr;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `project_asset` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ;
/*!50003 DROP PROCEDURE IF EXISTS `search_borrow` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `search_borrow`(
in document_no_pr varchar(200),
in date_pr varchar(50),
in status_pr varchar(50),
in username varchar(200)
)
BEGIN
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `search_expose` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `search_expose`(
in document_no_pr varchar(200),
in date_pr varchar(200),
in stauts_pr varchar(200),
in username_pr varchar(200)
)
BEGIN
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `search_repair` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `search_repair`(
in document_no_pr varchar(200),
in date_pr varchar(50),
in return_date_pr varchar(50),
in status_pr varchar(50)
)
BEGIN
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `test` */;
ALTER DATABASE `project_asset` CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `test`(in id int)
BEGIN
select * from users where user_id = id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `project_asset` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ;
/*!50003 DROP PROCEDURE IF EXISTS `update_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_user`(
in user_id_pr int,
in user_code_pr varchar(200),
in username_pr varchar(200),
in title_pr varchar(200),
in password_pr varchar(200),
in first_name_pr varchar(200),
in last_name_pr varchar(200),
in address_pr varchar(200),
in phone_pr varchar(200),
in email_pr varchar(200),
in role_pr varchar(200),
in faculty_id_pr int,
in department_id_pr int,
in last_update_pr varchar(200)
)
BEGIN
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-07-24 14:00:21
