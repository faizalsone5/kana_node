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
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(45) NOT NULL,
  `password` varchar(450) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `dob` varchar(45) NOT NULL,
  `gender` int(11) NOT NULL COMMENT '1-Male,2-Female',
  `personal_contact` varchar(45) NOT NULL,
  `alumini_edu1` varchar(45) NOT NULL,
  `alumini_edu2` varchar(45) NOT NULL,
  `profession` varchar(45) NOT NULL,
  `marital_status` int(11) NOT NULL COMMENT '1-Single, 2-Married, 3-Diworced, 4-Widow',
  `home_contact` varchar(45) DEFAULT NULL,
  `is_approved` varchar(1) NOT NULL DEFAULT '0' COMMENT '1-Approved,0-Not Approved',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'test@gmail.com','hash','f','f','f',1,'9','df','fddsf','f',1,NULL,'','2020-09-16 17:33:14','2020-09-16 17:33:14'),(3,'faizalsone5@gmail.com','$2b$10$W0fOF2SXwF4uN6Qd2xS0UOeAMnL91NdkSRBh.rcWfJRO77g0NACD.','faizal','syed','20-11-1990',1,'9791598800','AMS','Assisi','Software',1,NULL,'','2020-09-16 17:33:14','2020-09-16 17:33:14'),(7,'faizalsone8@gmail.com','$2b$10$5qtK0i7P7PWI0Ly6cy9EGeS8SfU/vyZ1FvNnmvyNEwTYPkWzCWyiO','faizal','syed','20-11-1990',1,'9791598800','AMS','Assisi','Software',1,NULL,'','2020-09-16 17:33:14','2020-09-16 17:33:14'),(8,'faizalsone6@gmail.com','$2b$10$TRMmJ56JBp0p84FQXLgsze0p/2w1OqjwZXGyslyyYTxavOqxWviVa','Test','syed','20-11-1990',1,'9791598800','AMS','Assisi','Software',1,NULL,'','2020-09-16 17:33:14','2020-09-16 17:33:14'),(10,'faizal@gmail.com','$2b$10$awWVKjJjmyWrQncrXBHhYeN/OS6WuDl3qP6oY8iSJxZ1vfRdTNnw.','faizal','syed','20-11-1990',1,'9791598800','AMS','Assisi','Software',1,NULL,'','2020-09-16 17:33:14','2020-09-16 17:33:14'),(13,'faizal1@gmail.com','$2b$10$Kgy0qH5litPE84y3afyyQOnrEiKUCCmT5ugjz.1GEU3JmgZn32iOO','faizal','syed','20-11-1990',1,'9791598800','AMS','Assisi','Software',1,NULL,'0','2020-09-16 18:14:04','2020-09-16 18:14:04'),(15,'faizal2@gmail.com','$2b$10$A3weFtbqMTIuBupcjvY6eug6IZvG5a7JRpKXBJrjpb7nU0Z242Uhe','faizal','syed','20-11-1990',1,'9791598800','AMS','Assisi','Software',1,NULL,'0','2020-09-16 18:18:14','2020-09-16 18:18:14'),(17,'faizal3@gmail.com','$2b$10$hPtIsZdBJZWXQeQHLcDNf.MFoOVI4vSEiyvfdKcYc/L1FbKpPscwS','faizal','syed','20-11-1990',1,'9791598800','AMS','Assisi','Software',1,NULL,'0','2020-09-16 18:22:18','2020-09-16 18:22:18'),(19,'faizal4@gmail.com','$2b$10$8AErnddC9Zx8R3axCkY1t.T82kea0plr2XODaTxwFGf07Cq/m/8Gi','faizal','syed','20-11-1990',1,'9791598800','AMS','Assisi','Software',1,NULL,'0','2020-09-16 18:26:28','2020-09-16 18:26:28'),(21,'faizal5@gmail.com','$2b$10$XgD/sIcJB9DkeowF6FmIYeEiirodP4RyW3ru8UUH87BHP8/7Zvn9u','faizal','syed','20-11-1990',1,'9791598800','AMS','Assisi','Software',1,NULL,'0','2020-09-16 18:28:06','2020-09-16 18:28:06'),(23,'faizal7@gmail.com','$2b$10$9WxnU95dP8Dna9OxfqKrPe64TPrk/PpBBjdorynoTuQRenzZzUIW.','faizal','syed','20-11-1990',1,'9791598800','AMS','Assisi','Software',1,NULL,'0','2020-09-16 18:45:05','2020-09-16 18:45:05'),(25,'faizal8@gmail.com','$2b$10$KuBYlWSfFbyMyTk7BjnTheThEw2/QhEPOYzd6u/tgSP28nvJUHe3i','faizal','syed','20-11-1990',1,'9791598800','AMS','Assisi','Software',1,NULL,'0','2020-09-16 19:02:04','2020-09-16 19:02:04'),(27,'faizal9@gmail.com','$2b$10$u5ljAd8MSArZ140vlbqOv.Cf9Gz83qPa7eCHUK8uj0iedDbqlaRJq','faizal','syed','20-11-1990',1,'9791598800','AMS','Assisi','Software',1,NULL,'0','2020-09-16 19:02:43','2020-09-16 19:02:43'),(29,'faizal10@gmail.com','$2b$10$MLSDdSbrNSQYAtzrOM9h7eMWY0UdAgcpwXr3avgzovoXnBJP0Ya4y','faizal','syed','20-11-1990',1,'9791598800','AMS','Assisi','Software',1,NULL,'0','2020-09-16 20:01:15','2020-09-16 20:01:15'),(31,'faizal11@gmail.com','$2b$10$d2PsoT0qf59x3FT8RT5x7uLQWXneBAi/.oeHnuvF6ZNRSPQjZ0j/6','faizal','syed','20-11-1990',1,'9791598800','AMS','Assisi','Software',1,NULL,'0','2020-09-16 20:04:14','2020-09-16 20:04:14'),(32,'faizal12@gmail.com','$2b$10$f2OHv5fdPPad13oWI87H3uiIKdvEAXWWSibvcjEemZVAQ/ySVd5o6','faizal','syed','20-11-1990',1,'9791598800','AMS','Assisi','Software',1,NULL,'0','2020-09-16 20:06:03','2020-09-16 20:06:03'),(33,'faizal13@gmail.com','$2b$10$otOVlMU4FLUIhb6QEAIMIuSWf6PmdJjEa70t5VKzA0Iz3ZRApdLLm','faizal','syed','20-11-1990',1,'9791598800','AMS','Assisi','Software',1,NULL,'0','2020-09-16 20:08:05','2020-09-16 20:08:05'),(35,'faizal14@gmail.com','$2b$10$YLQEiBi0UhFKi6klk/DH.uyaJliSKscKd6iKnJIF.kOBQQZa6oeXK','faizal','syed','20-11-1990',1,'9791598800','AMS','Assisi','Software',1,NULL,'0','2020-09-16 20:10:53','2020-09-16 20:10:53'),(36,'faizal15@gmail.com','$2b$10$9LrI886AWAj8Khq2vm5Fuuf8FkmUoS1NEl6gxtrku2PmJPY5V7RDi','faizal','syed','20-11-1990',1,'9791598800','AMS','Assisi','Software',1,NULL,'0','2020-09-16 20:12:30','2020-09-16 20:12:30'),(38,'faizal16@gmail.com','$2b$10$ApnhGmbM7uynnVCvPdZiEexcgD8kaosy5aoDJDLNdeCgljnO6RHpa','faizal','syed','20-11-1990',1,'9791598800','AMS','Assisi','Software',2,NULL,'0','2020-09-16 20:13:47','2020-09-16 20:13:47'),(40,'faizal17@gmail.com','$2b$10$oPYrcgPKN6V4/ZJH50P9TOt07X1yUWkUYFbBudFnF4jj/EUBVZ0FO','faizal','syed','20-11-1990',1,'9791598800','AMS','Assisi','Software',2,NULL,'0','2020-09-16 20:32:12','2020-09-16 20:32:12');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
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
