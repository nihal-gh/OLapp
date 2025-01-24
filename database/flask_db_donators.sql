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
-- Table structure for table `donators`
--

DROP TABLE IF EXISTS `donators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `donators` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `purpose` varchar(50) DEFAULT NULL,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donators`
--

LOCK TABLES `donators` WRITE;
/*!40000 ALTER TABLE `donators` DISABLE KEYS */;
INSERT INTO `donators` VALUES (2,'nihal','nihalburra@gmail.com',35000.00,'food','2024-10-03 16:53:49'),(3,'yash','nihalbsadasurra@gmail.com',35000.00,'food','2024-10-03 18:31:46'),(4,'b','nihalburra@gmail.com',35000.00,'food','2024-10-03 18:32:21'),(5,'randomuser','randomuserxx07@gmail.com',35000.00,'food','2024-10-03 18:32:50'),(6,'Niasdsa','buhahahah@gmail.com',145000.00,'operation','2024-10-03 18:35:42'),(7,'nihal','burra@gmail.com',35000.00,'food','2024-10-04 04:17:19'),(8,'nihal','nihalbsadaurra@gmail.com',35000.00,'food','2024-10-04 04:18:35'),(9,'nihal','nihalbsadaurra@gmail.com',35000.00,'food','2024-10-04 04:18:56'),(10,'nihal','nihra@gmail.com',35000.00,'food','2024-10-04 04:20:03'),(11,'nihal','nihalburra@gmail.com',35000.00,'food','2024-10-04 04:20:06'),(12,'nihal','example1923y@gmail.com',35000.00,'food','2024-10-04 04:31:11'),(13,'nihal','nihalburra@gmail.com',35000.00,'food','2024-10-04 04:31:28'),(14,'Nihal','example@gmail.com',35000.00,'food','2024-10-04 04:35:47'),(15,'Nihal','eample1@gmail.com',35000.00,'food','2024-10-04 04:36:17'),(16,'nihal','randomuserxx07@gmail.com',300000.00,'lifetime','2024-10-04 04:50:04'),(17,'asdaasdas','asd@gmail.com',1.00,'lifetime','2024-10-04 04:54:36'),(18,'nihal','nihalburra@gmail.com',145000.00,'operation','2024-10-06 08:47:13'),(19,'adasd','asdksabd@gmail.com',35000.00,'food','2024-10-06 09:09:17'),(20,'Nihal','adasasdasdv@gmail.com',35000.00,'food','2024-10-06 13:04:19'),(21,'adawd','adasd@gmail.com',1.00,'lifetime','2024-10-06 13:47:42'),(22,'ssaafvaf','fsdfadasd@gmail.com',1.00,'lifetime','2024-10-06 13:47:54'),(23,'ssaafvaf','fsdefefadasd@gmail.com',1.00,'lifetime','2024-10-06 13:48:03'),(24,'ssaafvaf','fsdefefefefadasd@gmail.com',1.00,'lifetime','2024-10-06 13:48:07'),(25,'ssaafvaf','fsdefefefefaegregdasd@gmail.com',1.00,'lifetime','2024-10-06 13:48:12'),(26,'afaAS','nihalburra07@gmail.com',45000.00,'tution','2024-10-08 16:24:52'),(27,'sjdbahusbduasb','asdasasdsadas@gmail.com',45000.00,'tution','2024-10-08 16:27:26'),(28,'nihal','nihalbuasdsavdrra@gmail.com',45000.00,'tution','2024-10-08 16:51:46'),(29,'nihal','nihalburra@gmail.com',35000.00,'food','2024-10-21 17:48:23'),(30,'nihal','nihalburra@gmail.com',45000.00,'tution','2024-10-21 17:56:31'),(31,'Yashwnt','nihalburra@gmail.com',45000.00,'tution','2024-10-22 18:40:46'),(32,'Yashwnt','nihalburra@gmail.com',45000.00,'tution','2024-10-22 18:41:04'),(33,'Yashwnt','nihalburra@gmail.com',45000.00,'tution','2024-10-22 18:41:10'),(34,'hbuhb','nihalburra@gmail.com',45000.00,'tution','2024-10-23 06:26:12');
/*!40000 ALTER TABLE `donators` ENABLE KEYS */;
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
