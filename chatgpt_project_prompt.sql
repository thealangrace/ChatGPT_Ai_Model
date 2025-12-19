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
-- Table structure for table `prompt`
--

DROP TABLE IF EXISTS `prompt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prompt` (
  `PromptID` int NOT NULL AUTO_INCREMENT,
  `SessionID` int DEFAULT NULL,
  `UserID` int DEFAULT NULL,
  `MessageText` text,
  `CreatedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`PromptID`),
  KEY `SessionID` (`SessionID`),
  KEY `UserID` (`UserID`),
  CONSTRAINT `prompt_ibfk_1` FOREIGN KEY (`SessionID`) REFERENCES `chatsession` (`SessionID`),
  CONSTRAINT `prompt_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prompt`
--

LOCK TABLES `prompt` WRITE;
/*!40000 ALTER TABLE `prompt` DISABLE KEYS */;
INSERT INTO `prompt` VALUES (1,1,1,'Explain normalization.','2025-12-06 14:06:10'),(2,1,1,'Why do we use ERDs?','2025-12-06 14:06:10'),(3,2,2,'Primary key vs foreign key?','2025-12-06 14:06:10'),(4,2,2,'Explain ACID properties.','2025-12-06 14:06:10'),(5,3,3,'How does AI store conversation context?','2025-12-06 14:06:10'),(6,3,3,'What is a token in LLMs?','2025-12-06 14:06:10'),(7,4,4,'Explain cardinality in ERDs.','2025-12-06 14:06:10'),(8,4,4,'What is composite key?','2025-12-06 14:06:10'),(9,5,5,'Explain load balancing.','2025-12-06 14:06:10'),(10,6,6,'What is an index?','2025-12-06 14:06:10'),(11,6,6,'Difference between join types?','2025-12-06 14:06:10'),(12,6,6,'What is inner join?','2025-12-06 14:06:10'),(13,6,6,'Explain outer join.','2025-12-06 14:06:10'),(14,3,3,'What is embedding in AI?','2025-12-06 14:06:10'),(15,2,2,'Explain SQL constraints.','2025-12-06 14:06:10'),(16,1,1,'What is a foreign key in SQL?','2025-12-06 14:08:31'),(17,1,1,'Explain SQL joins.','2025-12-06 14:08:55'),(18,1,1,'Explain SQL joins.','2025-12-06 14:11:25');
/*!40000 ALTER TABLE `prompt` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-06 14:14:32
