CREATE DATABASE  IF NOT EXISTS `hogwarts_project_schema` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `hogwarts_project_schema`;
-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: hogwarts_project_schema
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses` (
  `course_id` varchar(20) NOT NULL,
  `course_name` varchar(45) NOT NULL,
  PRIMARY KEY (`course_id`),
  UNIQUE KEY `course_id_UNIQUE` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES ('Da01','Dark Arts'),('He03','Herbology'),('Hm04','History of Magic'),('Mg06','Magic Creatures'),('Ms05','Muggle Studies'),('Ta02','Transfiguration');
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grades`
--

DROP TABLE IF EXISTS `grades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grades` (
  `student` int NOT NULL,
  `course` varchar(45) NOT NULL,
  `grade` float DEFAULT NULL,
  `prof_id_number` int DEFAULT NULL,
  KEY `studen_idx` (`student`),
  KEY `course_idx` (`course`),
  KEY `prof_idx` (`prof_id_number`),
  CONSTRAINT `course` FOREIGN KEY (`course`) REFERENCES `courses` (`course_id`),
  CONSTRAINT `prof` FOREIGN KEY (`prof_id_number`) REFERENCES `professors` (`professor_id`),
  CONSTRAINT `student` FOREIGN KEY (`student`) REFERENCES `students` (`students_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grades`
--

LOCK TABLES `grades` WRITE;
/*!40000 ALTER TABLE `grades` DISABLE KEYS */;
INSERT INTO `grades` VALUES (1,'Da01',90,1),(2,'He03',80,2),(1,'He03',75,2),(4,'He03',80,2),(6,'He03',70,2),(6,'Da01',70,1),(5,'Da01',80,1),(1,'Da01',70,1),(2,'Da01',70,1),(6,'Hm04',80,3),(4,'Hm04',70,3),(3,'Hm04',70,3),(5,'Mg06',80,4),(1,'Mg06',70,4),(2,'Mg06',70,4),(6,'Ms05',80,5),(4,'Ms05',70,5),(3,'Ms05',70,5),(5,'Ta02',80,6),(1,'Ta02',70,6),(2,'Ta02',70,6),(1,'Ms05',100,5),(2,'Ms05',72,5),(3,'Ms05',100,5),(3,'Ta02',60,6),(1,'Ta02',90,6),(2,'Ta02',100,6);
/*!40000 ALTER TABLE `grades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professors`
--

DROP TABLE IF EXISTS `professors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `professors` (
  `professor_name` varchar(45) NOT NULL,
  `prof_course_id` varchar(45) NOT NULL,
  `professor_id` int NOT NULL AUTO_INCREMENT,
  UNIQUE KEY `prof_id_UNIQUE` (`professor_id`),
  KEY `prof_course_id_idx` (`prof_course_id`),
  CONSTRAINT `prof_course_id` FOREIGN KEY (`prof_course_id`) REFERENCES `courses` (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professors`
--

LOCK TABLES `professors` WRITE;
/*!40000 ALTER TABLE `professors` DISABLE KEYS */;
INSERT INTO `professors` VALUES ('Snape','Da01',1),('Sprout','He03',2),('Headless Nick','Hm04',3),('Hagrid','Mg06',4),('Hagrid','Ms05',5),('Mcgonnagall','Ta02',6);
/*!40000 ALTER TABLE `professors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `students_id` int NOT NULL AUTO_INCREMENT,
  `students_name` varchar(45) NOT NULL,
  PRIMARY KEY (`students_id`),
  UNIQUE KEY `idstudents_UNIQUE` (`students_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,'Harry Potter'),(2,'Ron Weasley'),(3,'Hermoine Granger'),(4,'Lucius Malfoy'),(5,'Tom Riddle'),(6,'Bill Weasley');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-23 18:30:05
