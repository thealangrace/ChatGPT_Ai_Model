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
-- Table structure for table `response`
--

DROP TABLE IF EXISTS `response`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `response` (
  `ResponseID` int NOT NULL AUTO_INCREMENT,
  `PromptID` int DEFAULT NULL,
  `ModelID` int DEFAULT NULL,
  `ResponseText` text,
  `CreatedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ResponseID`),
  UNIQUE KEY `PromptID` (`PromptID`),
  KEY `ModelID` (`ModelID`),
  CONSTRAINT `response_ibfk_1` FOREIGN KEY (`PromptID`) REFERENCES `prompt` (`PromptID`),
  CONSTRAINT `response_ibfk_2` FOREIGN KEY (`ModelID`) REFERENCES `aimodel` (`ModelID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `response`
--

LOCK TABLES `response` WRITE;
/*!40000 ALTER TABLE `response` DISABLE KEYS */;
INSERT INTO `response` VALUES (1,1,1,'Normalization reduces redundancy.','2025-12-06 14:06:10'),(2,2,1,'ERDs help visualize structure.','2025-12-06 14:06:10'),(3,3,2,'Primary key identifies a row; foreign key links tables.','2025-12-06 14:06:10'),(4,4,2,'ACID ensures reliable transactions.','2025-12-06 14:06:10'),(5,5,3,'AI stores context using embeddings.','2025-12-06 14:06:10'),(6,6,3,'Tokens represent text pieces.','2025-12-06 14:06:10'),(7,7,1,'Cardinality describes relationship counts.','2025-12-06 14:06:10'),(8,8,1,'Composite key uses multiple fields.','2025-12-06 14:06:10'),(9,9,4,'Load balancing spreads traffic.','2025-12-06 14:06:10'),(10,10,1,'Index improves search performance.','2025-12-06 14:06:10'),(11,11,1,'Joins combine rows.','2025-12-06 14:06:10'),(12,12,1,'Inner join matches rows.','2025-12-06 14:06:10'),(13,13,1,'Outer join keeps unmatched rows.','2025-12-06 14:06:10'),(14,14,3,'Embeddings convert text to vectors.','2025-12-06 14:06:10'),(15,15,2,'Constraints control valid data.','2025-12-06 14:06:10'),(16,16,1,'AI is generating...','2025-12-06 14:08:31');
/*!40000 ALTER TABLE `response` ENABLE KEYS */;
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
