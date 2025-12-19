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
-- Table structure for table `usagerecord`
--

DROP TABLE IF EXISTS `usagerecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usagerecord` (
  `UsageID` int NOT NULL AUTO_INCREMENT,
  `SessionID` int DEFAULT NULL,
  `PromptID` int DEFAULT NULL,
  `ResponseID` int DEFAULT NULL,
  `TokensUsed` int DEFAULT NULL,
  `LoggedAt` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`UsageID`),
  KEY `SessionID` (`SessionID`),
  KEY `PromptID` (`PromptID`),
  KEY `ResponseID` (`ResponseID`),
  CONSTRAINT `usagerecord_ibfk_1` FOREIGN KEY (`SessionID`) REFERENCES `chatsession` (`SessionID`),
  CONSTRAINT `usagerecord_ibfk_2` FOREIGN KEY (`PromptID`) REFERENCES `prompt` (`PromptID`),
  CONSTRAINT `usagerecord_ibfk_3` FOREIGN KEY (`ResponseID`) REFERENCES `response` (`ResponseID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usagerecord`
--

LOCK TABLES `usagerecord` WRITE;
/*!40000 ALTER TABLE `usagerecord` DISABLE KEYS */;
INSERT INTO `usagerecord` VALUES (1,1,1,1,40,'2025-12-06 14:06:10'),(2,1,2,2,35,'2025-12-06 14:06:10'),(3,2,3,3,32,'2025-12-06 14:06:10'),(4,2,4,4,48,'2025-12-06 14:06:10'),(5,3,5,5,50,'2025-12-06 14:06:10'),(6,3,6,6,37,'2025-12-06 14:06:10'),(7,4,7,7,28,'2025-12-06 14:06:10'),(8,4,8,8,42,'2025-12-06 14:06:10'),(9,5,9,9,57,'2025-12-06 14:06:10'),(10,6,10,10,33,'2025-12-06 14:06:10'),(11,6,11,11,39,'2025-12-06 14:06:10'),(12,1,16,16,0,'2025-12-06 14:08:31');
/*!40000 ALTER TABLE `usagerecord` ENABLE KEYS */;
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
