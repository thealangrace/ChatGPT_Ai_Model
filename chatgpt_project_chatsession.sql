-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: chatgpt_project
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Table structure for table `chatsession`
--

DROP TABLE IF EXISTS `chatsession`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chatsession` (
  `SessionID` int NOT NULL AUTO_INCREMENT,
  `UserID` int DEFAULT NULL,
  `ModelID` int DEFAULT NULL,
  `Title` varchar(200) DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL,
  `StartTime` datetime DEFAULT CURRENT_TIMESTAMP,
  `EndTime` datetime DEFAULT NULL,
  PRIMARY KEY (`SessionID`),
  KEY `UserID` (`UserID`),
  KEY `ModelID` (`ModelID`),
  CONSTRAINT `chatsession_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`),
  CONSTRAINT `chatsession_ibfk_2` FOREIGN KEY (`ModelID`) REFERENCES `aimodel` (`ModelID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chatsession`
--

LOCK TABLES `chatsession` WRITE;
/*!40000 ALTER TABLE `chatsession` DISABLE KEYS */;
INSERT INTO `chatsession` VALUES (1,1,1,'Database Homework Help','Closed','2025-12-06 14:06:10','2025-12-06 14:08:37'),(2,2,2,'SQL Practice','Closed','2025-12-06 14:06:10',NULL),(3,3,3,'AI Project Planning','Open','2025-12-06 14:06:10',NULL),(4,4,1,'ERD Review','Open','2025-12-06 14:06:10',NULL),(5,5,4,'System Design','Closed','2025-12-06 14:06:10',NULL),(6,6,1,'Class Q&A','Open','2025-12-06 14:06:10',NULL);
/*!40000 ALTER TABLE `chatsession` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-06 14:14:31
