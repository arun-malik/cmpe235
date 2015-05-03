CREATE DATABASE  IF NOT EXISTS `mydb` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `mydb`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: cmpe235project.c6xea0kpbutv.us-east-1.rds.amazonaws.com    Database: mydb
-- ------------------------------------------------------
-- Server version	5.6.19-log

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
-- Table structure for table `course_user`
--

DROP TABLE IF EXISTS `course_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_user` (
  `PCourseId` int(11) NOT NULL,
  `PUserId` int(11) NOT NULL,
  `Homework` int(11) NOT NULL,
  `Labs` int(11) NOT NULL,
  `Project` int(11) NOT NULL DEFAULT '0',
  `Presentation` int(11) NOT NULL DEFAULT '0',
  `Midterm` int(11) NOT NULL DEFAULT '0',
  `Final` int(11) NOT NULL DEFAULT '0',
  `Grade` varchar(10) DEFAULT NULL,
  KEY `PCourseId` (`PCourseId`),
  KEY `PCourseId_2` (`PCourseId`),
  KEY `PUserId` (`PUserId`),
  CONSTRAINT `course_user_ibfk_1` FOREIGN KEY (`PCourseId`) REFERENCES `courses` (`ID`),
  CONSTRAINT `course_user_ibfk_2` FOREIGN KEY (`PUserId`) REFERENCES `users` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_user`
--

LOCK TABLES `course_user` WRITE;
/*!40000 ALTER TABLE `course_user` DISABLE KEYS */;
INSERT INTO `course_user` VALUES (1,1,500,500,500,500,500,500,'A'),(1,2,499,499,199,99,99,99,'A'),(1,3,200,200,99,99,99,99,'F'),(2,4,0,0,0,0,0,0,NULL),(2,5,499,499,199,99,99,99,'A'),(2,6,0,0,0,0,0,0,NULL);
/*!40000 ALTER TABLE `course_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CourseName` varchar(45) NOT NULL,
  `MHomework` int(11) DEFAULT '0',
  `MLabs` int(11) NOT NULL DEFAULT '0',
  `MProject` int(11) NOT NULL DEFAULT '0',
  `MPresentation` int(11) NOT NULL DEFAULT '0',
  `MMidterm` int(11) NOT NULL DEFAULT '0',
  `MFinal` int(11) NOT NULL DEFAULT '0',
  `PHomework` int(11) NOT NULL DEFAULT '0',
  `PLabs` int(11) NOT NULL DEFAULT '0',
  `PProject` int(11) NOT NULL DEFAULT '0',
  `PPresentation` int(11) NOT NULL DEFAULT '0',
  `PMidterm` int(11) NOT NULL DEFAULT '0',
  `PFinal` int(11) NOT NULL DEFAULT '0',
  `ARangeStart` int(11) NOT NULL DEFAULT '0',
  `ARangeEnd` int(11) NOT NULL DEFAULT '0',
  `BRangeStart` int(11) NOT NULL DEFAULT '0',
  `BRangeEnd` int(11) NOT NULL DEFAULT '0',
  `CRangeStart` int(11) NOT NULL DEFAULT '0',
  `CRangeEnd` int(11) NOT NULL DEFAULT '0',
  `DRangeStart` int(11) NOT NULL DEFAULT '0',
  `ERangeStart` int(11) NOT NULL DEFAULT '0',
  `FRangeStart` int(11) NOT NULL DEFAULT '0',
  `DRangeEnd` int(11) NOT NULL DEFAULT '0',
  `ERangeEnd` int(11) NOT NULL DEFAULT '0',
  `FRangeEnd` int(11) NOT NULL DEFAULT '0',
  `Description` varchar(1000) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (1,'CMPE-235',500,500,500,500,500,500,15,15,25,15,25,5,90,100,80,90,70,80,60,50,0,70,60,60,'Study of wireless-based software systems in design and engineering, underlying networks, infrastructures and frameworks, wireless security, mobile user security & privacy (i.e. biometric security), emergent mobile programming platforms and technologies (such as RFID/Barcode/NFC), mobile commerce and service application systems. Prerequisite: CMPE 220 or CMPE 202 or instructor consent.'),(2,'CMPE-274',500,500,200,100,100,100,10,40,20,10,10,10,90,100,80,89,70,79,60,50,0,69,60,59,'This course covers technologies that are key to delivering business intelligence to an enterprise. The goal of business intelligence is to analyze and mine business data to understand and improve business performance by transforming business data into information into knowledge. Prerequisite: CMPE 272 or instructor consent. ');
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login` (
  `ID` varchar(10) NOT NULL,
  `Password` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES ('user1','password1'),('user2','password2');
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Password` varchar(45) DEFAULT NULL,
  `FirstName` varchar(45) DEFAULT NULL,
  `LastName` varchar(45) DEFAULT NULL,
  `EmailId` varchar(45) DEFAULT NULL,
  `Phone` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'password','Amit','Dikkar','amit.dikkar@gmail.com','4088027478'),(2,'password','Prasad','Bidwai','prasad@gmail.com','1234567890'),(3,'password','Pravin','Agarwal','pravin@gmail.com','6524521325'),(4,'password','Vishal2','Chothani','vishal@gmail.com','4578541236'),(5,'password','Arun','Malik','arun@gmail.com','3456127895'),(6,'password','Kavish','Parikh','kavish@gmail.com','2541698735');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-12-06 18:55:02
