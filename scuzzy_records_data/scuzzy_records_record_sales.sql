CREATE DATABASE  IF NOT EXISTS `scuzzy_records` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `scuzzy_records`;
-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: localhost    Database: scuzzy_records
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `record_sales`
--

<<<<<<< HEAD
DROP TABLE IF EXISTS 'record_sales';
=======

>>>>>>> master
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `record_sales` (
  `sales_id` int(11) NOT NULL,
  `artist_id` int(11) NOT NULL,
  `sales_date` datetime NOT NULL,
  `sales_total` decimal(9,2) NOT NULL,
  `sales_city` varchar(45) NOT NULL,
  `sales_state` varchar(45) NOT NULL,
  PRIMARY KEY (`sales_id`),
  KEY `artist_id_idx` (`artist_id`),
  CONSTRAINT `artist_id` FOREIGN KEY (`artist_id`) REFERENCES `artists` (`artist_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `record_sales`
--

LOCK TABLES `record_sales` WRITE;
/*!40000 ALTER TABLE `record_sales` DISABLE KEYS */;
INSERT INTO `record_sales` VALUES (1,5,'2010-07-06 00:00:00',20318.00,'New York City','NY'),(2,1,'2019-12-30 00:00:00',15023.00,'Los Angeles','CA'),(3,10,'2018-05-23 00:00:00',21235.00,'Los Angeles','CA'),(4,6,'2016-08-04 00:00:00',12625.00,'Indio','CA'),(5,7,'2015-02-24 00:00:00',14924.00,'Chicago','IL'),(6,9,'2013-09-08 00:00:00',2389.00,'Morrison','CO'),(7,6,'2013-02-16 00:00:00',14197.00,'Los Angeles','CA'),(8,3,'2011-08-04 00:00:00',1872.00,'New York City','NY'),(9,2,'2014-10-20 00:00:00',17918.00,'New York City','NY');
/*!40000 ALTER TABLE `record_sales` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-01-27 19:20:10
