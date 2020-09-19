-- MySQL dump 10.13  Distrib 5.7.31, for Linux (x86_64)
--
-- Host: 33.33.33.10    Database: kana
-- ------------------------------------------------------
-- Server version	5.7.31-0ubuntu0.16.04.1

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
-- Table structure for table `user_address`
--

DROP TABLE IF EXISTS `user_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `address1` varchar(200) NOT NULL,
  `address2` varchar(200) DEFAULT NULL,
  `city` varchar(45) NOT NULL,
  `state` varchar(45) NOT NULL,
  `country` varchar(45) NOT NULL,
  `home_town` varchar(45) NOT NULL,
  `grew_town` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_address`
--

LOCK TABLES `user_address` WRITE;
/*!40000 ALTER TABLE `user_address` DISABLE KEYS */;
INSERT INTO `user_address` VALUES (1,21,'sdfsdf','dfsdf','chennai','tamilnadu','india','fas','sfdsf'),(2,23,'sdfsdf','dfsdf','chennai','tamilnadu','india','fas','sfdsf'),(3,25,'sdfsdf','dfsdf','chennai','tamilnadu','india','fas','sfdsf'),(4,27,'sdfsdf','dfsdf','chennai','tamilnadu','india','fas','sfdsf'),(5,29,'sdfsdf','dfsdf','chennai','tamilnadu','india','fas','sfdsf'),(6,31,'sdfsdf','dfsdf','chennai','tamilnadu','india','fas','sfdsf'),(7,32,'sdfsdf','dfsdf','chennai','tamilnadu','india','fas','sfdsf'),(8,33,'sdfsdf','dfsdf','chennai','tamilnadu','india','fas','sfdsf'),(9,35,'sdfsdf','dfsdf','chennai','tamilnadu','india','fas','sfdsf'),(10,36,'sdfsdf','dfsdf','chennai','tamilnadu','india','fas','sfdsf'),(11,38,'sdfsdf','dfsdf','chennai','tamilnadu','india','fas','sfdsf'),(12,40,'sdfsdf','dfsdf','chennai','tamilnadu','india','fas','sfdsf');
/*!40000 ALTER TABLE `user_address` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-19 14:06:53
