-- MySQL dump 10.13  Distrib 5.5.24, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: db_account
-- ------------------------------------------------------
-- Server version	5.5.24-0ubuntu0.12.04.1
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `db_account`
--

/*!40000 DROP DATABASE IF EXISTS `db_account`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `db_account` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci */;

USE `db_account`;

--
-- Table structure for table `spend_record`
--

DROP TABLE IF EXISTS `spend_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spend_record` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `buy_date` int(11) NOT NULL,
  `name` char(20) NOT NULL,
  `cost` int(11) NOT NULL,
  `buyer` char(10) NOT NULL,
  `owner` char(10) NOT NULL,
  `way_to_pay` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spend_record`
--

LOCK TABLES `spend_record` WRITE;
/*!40000 ALTER TABLE `spend_record` DISABLE KEYS */;
INSERT INTO `spend_record` (`id`, `buy_date`, `name`, `cost`, `buyer`, `owner`, `way_to_pay`, `project_id`) VALUES (1,1344182400,'早餐',45,'bency','bency',1,1),(2,1344182400,'午餐-炒飯',100,'bency','bency',0,1),(3,1344182400,'晚餐-麥當勞',148,'bency','bency',0,1),(4,1344182400,'早餐',35,'karen','karen',0,1),(5,1344182400,'晚餐',55,'karen','karen',0,1),(6,1344096000,'儲值',500,'bency','bency',0,1),(7,1344182400,'房租',9395,'bency','bency',0,1),(8,1344096000,'晚餐',55,'karen','karen',0,1),(9,1344096000,'隨身聽MP3',1060,'karen','karen',0,1),(10,1344268800,'早餐',35,'bency','bency',0,1),(11,1344268800,'午餐',99,'bency','bency',0,1),(12,1344268800,'晚餐',100,'bency','bency',0,1),(13,1344268800,'珍珠奶茶',60,'karen','karen',0,1);
/*!40000 ALTER TABLE `spend_record` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-08-07 21:38:02
