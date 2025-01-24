-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: flask_db
-- ------------------------------------------------------
-- Server version	8.0.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `specific_donations`
--

DROP TABLE IF EXISTS `specific_donations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `specific_donations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `donation_type` varchar(50) NOT NULL,
  `food_type` varchar(100) DEFAULT NULL,
  `food_quantity` varchar(50) DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `clothing_type` varchar(100) DEFAULT NULL,
  `clothing_size` varchar(50) DEFAULT NULL,
  `clothing_quantity` varchar(50) DEFAULT NULL,
  `other_type` varchar(100) DEFAULT NULL,
  `pickup_method` varchar(50) NOT NULL,
  `pickup_days` varchar(100) DEFAULT NULL,
  `comments` text,
  `consent` tinyint(1) NOT NULL,
  `submitted_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specific_donations`
--

LOCK TABLES `specific_donations` WRITE;
/*!40000 ALTER TABLE `specific_donations` DISABLE KEYS */;
INSERT INTO `specific_donations` VALUES (1,'Nihal B','nihalburra@gmail.com','08977802107','food','fresh cooked food','10kg','2024-10-29',NULL,NULL,NULL,NULL,'pickup','23/10/24','we cook extra food to donate',1,'2024-10-22 10:31:19'),(2,'kjdbsdkajsbdusa','iadba@gmail.com','08977802107','occasion',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'drop-off','after 10','jdsahdbahsubdbas',1,'2024-10-23 08:43:29'),(3,'Nihal B','nihalburra@gmail.com','08977802107','occasion',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pickup','After 2:00PM','fvsbefbv',1,'2024-10-23 08:57:13');
/*!40000 ALTER TABLE `specific_donations` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-29 21:06:00
