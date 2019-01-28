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
-- Table structure for table `artists`
--


<<<<<<< HEAD
DROP IF EXISTS 'artists';
=======
DROP TABLE IF EXISTS 'artists';
>>>>>>> master
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `artists` (
  `artist_id` int(11) NOT NULL,
  `artist_name` varchar(45) NOT NULL,
  `artist_genre_id` int(11) NOT NULL,
  PRIMARY KEY (`artist_id`),
  KEY `genre_id_idx` (`artist_genre_id`),
  CONSTRAINT `genre_id` FOREIGN KEY (`artist_genre_id`) REFERENCES `genres` (`genre_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artists`
--

LOCK TABLES `artists` WRITE;
/*!40000 ALTER TABLE `artists` DISABLE KEYS */;
INSERT INTO `artists` VALUES (1,'Stereo Jungle Child',1),(2,'L\'Arc en Ciel',1),(3,'Steel Mistress',1),(4,'James Beaver',2),(5,'The Melodicas',2),(6,'Smiling Butterflies',2),(7,'Robin S.',2),(8,'John Coltrane',3),(9,'Miles Davis',3),(10,'Thelonious Monk',3),(11,'Wes Montgomery',3),(12,'Orange Tang Group',4),(13,'NGSWA',4),(14,'Lil\' Kimchi',4),(15,'A$AP Mob',4),(16,'D\'Angelo and the Vanguard',5),(17,'Maxwell',5),(18,'livemau5',6),(19,'Tiesto',6),(20,'Faythful',6),(21,'Smile DK',6);
/*!40000 ALTER TABLE `artists` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-01-27 19:20:11
