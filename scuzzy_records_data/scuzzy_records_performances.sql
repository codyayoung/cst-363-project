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
-- Table structure for table `performances`
--


/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `performances` (
  `performance_id` int(11) NOT NULL,
  `performance_name` varchar(45) NOT NULL,
  `performing_artist_id` int(11) NOT NULL,
  `performance_cost` decimal(9,2) NOT NULL,
  `performance_date` datetime NOT NULL,
  `venue_id` int(11) NOT NULL,
  PRIMARY KEY (`performance_id`),
  KEY `venue_id_idx` (`venue_id`),
  KEY `performing_artist_id_idx` (`performing_artist_id`),
  CONSTRAINT `performing_artist_id` FOREIGN KEY (`performing_artist_id`) REFERENCES `artists` (`artist_id`),
  CONSTRAINT `venue_id` FOREIGN KEY (`venue_id`) REFERENCES `venues` (`venue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `performances`
--

LOCK TABLES `performances` WRITE;
/*!40000 ALTER TABLE `performances` DISABLE KEYS */;
INSERT INTO `performances` VALUES (100,'One Night Only',1,91.00,'2009-02-13 00:00:00',1),(101,'USA Tour',17,52.00,'2010-04-17 00:00:00',2),(102,'Friends and Family ',21,40.00,'2010-05-02 00:00:00',3),(200,'Madison Square Garden',13,98.00,'2011-06-11 00:00:00',2),(201,'Live in NYC',4,81.00,'2011-07-13 00:00:00',2),(202,'Pop Disaster Tour',8,68.00,'2011-10-01 00:00:00',5),(300,'Late Night Special',6,88.00,'2012-03-06 00:00:00',2),(301,'Lollapalooza',9,86.00,'2013-05-02 00:00:00',6),(302,'Coachella',2,58.00,'2014-08-20 00:00:00',4),(400,'Unplugged',10,25.00,'2014-12-23 00:00:00',3),(401,'Live from Chicago',5,44.00,'2017-08-13 00:00:00',6),(402,'Live in NYC',3,55.00,'2018-10-23 00:00:00',1);
/*!40000 ALTER TABLE `performances` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-01-27 19:20:09
