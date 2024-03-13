-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: hospital_management
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment` (
  `appointmentNumber` int NOT NULL AUTO_INCREMENT,
  `serviceType` varchar(255) NOT NULL,
  `appointmentDate` varchar(45) NOT NULL,
  `appointmentTime` varchar(45) NOT NULL,
  `appointmentFee` decimal(10,2) NOT NULL,
  `doctor` varchar(45) NOT NULL,
  `username` varchar(45) NOT NULL,
  `status` int NOT NULL,
  `message` text,
  PRIMARY KEY (`appointmentNumber`),
  UNIQUE KEY `appointmentNumber_UNIQUE` (`appointmentNumber`),
  KEY `username_idx` (`username`),
  CONSTRAINT `username` FOREIGN KEY (`username`) REFERENCES `patient` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment`
--

LOCK TABLES `appointment` WRITE;
/*!40000 ALTER TABLE `appointment` DISABLE KEYS */;
INSERT INTO `appointment` VALUES (1,'Inflammatory Markers','2024-03-14','',2000.00,'Kavindu Anderson - Rheumatologist','user1',0,'vdsvdsvs'),(2,'Autoantibodies','2024-03-13','',2000.00,'Kavindu Anderson - Rheumatologist','user1',0,NULL),(3,'Bone Markers','2024-03-29','',2000.00,'Ananda Jepson - Endocrinologist','user1',0,'rfeger'),(5,'Autoantibodies','2024-03-22','',2000.00,'William Gopallawa - Allergist/Immunologist','user1',0,'vcdfvd'),(6,'Metabolic Tests','2024-03-22','',2000.00,'Ananda Jepson - Endocrinologist','user1',0,'vdfvd'),(7,'Allergy Testing','2024-03-20','23:34',2000.00,'William Gopallawa - Allergist/Immunologist','user1',1,'dvsvs');
/*!40000 ALTER TABLE `appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login` (
  `username` varchar(255) NOT NULL,
  `userType` int NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES ('admin',1,'21232f297a57a5a743894a0e4a801fc3'),('user1',2,'24c9e15e52afc47c225b757e7bee1f9d');
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient` (
  `patientId` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `contact` varchar(45) NOT NULL,
  `username` varchar(45) NOT NULL,
  `nic` varchar(45) DEFAULT NULL,
  `age` int NOT NULL,
  `gender` varchar(45) NOT NULL,
  PRIMARY KEY (`patientId`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `patientId_UNIQUE` (`patientId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES (1,'Thari perera','panadura','tharinduperera199818@gmail.com','0776154567','user1','989909979V',23,'male');
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testresults`
--

DROP TABLE IF EXISTS `testresults`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testresults` (
  `testResultsid` int NOT NULL AUTO_INCREMENT,
  `appointmentNumber` int NOT NULL,
  `user_name` varchar(45) NOT NULL,
  `resultDate` varchar(45) NOT NULL,
  `doctor` varchar(45) NOT NULL,
  `technician` varchar(45) NOT NULL,
  `testFee` decimal(10,2) NOT NULL,
  PRIMARY KEY (`testResultsid`),
  KEY `appoinmentId_idx` (`appointmentNumber`),
  KEY `username_idx` (`user_name`),
  KEY `user_name_idx` (`user_name`),
  CONSTRAINT `appoinmentNumber` FOREIGN KEY (`appointmentNumber`) REFERENCES `appointment` (`appointmentNumber`),
  CONSTRAINT `user_name` FOREIGN KEY (`user_name`) REFERENCES `patient` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testresults`
--

LOCK TABLES `testresults` WRITE;
/*!40000 ALTER TABLE `testresults` DISABLE KEYS */;
INSERT INTO `testresults` VALUES (1,2,'user1','2024-03-28','Kavindu Anderson - Rheumatologist','technician2',2500.00),(2,1,'user1','2024-03-28','Kavindu Anderson - Rheumatologist','technician3',2500.00),(3,5,'user1','2024-03-27','William Gopallawa - Allergist/Immunologist','technician3',2500.00),(4,6,'user1','2024-03-27','Ananda Jepson - Endocrinologist','technician5',2500.00),(5,3,'user1','2024-03-30','Ananda Jepson - Endocrinologist','technician3',2500.00);
/*!40000 ALTER TABLE `testresults` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-07 20:38:06
