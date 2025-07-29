-- MySQL dump 10.13  Distrib 8.4.4, for macos15 (arm64)
--
-- Host: localhost    Database: Employees
-- ------------------------------------------------------
-- Server version	8.4.4

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `caretaking_staff`
--

DROP TABLE IF EXISTS `caretaking_staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `caretaking_staff` (
  `CTstaff_id` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `role` varchar(100) DEFAULT NULL,
  `contact_number` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `committee_id` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`CTstaff_id`),
  KEY `committee_id` (`committee_id`),
  CONSTRAINT `caretaking_staff_ibfk_1` FOREIGN KEY (`committee_id`) REFERENCES `staff_committee` (`committee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caretaking_staff`
--

LOCK TABLES `caretaking_staff` WRITE;
/*!40000 ALTER TABLE `caretaking_staff` DISABLE KEYS */;
INSERT INTO `caretaking_staff` VALUES ('CT_01','Alice Green','Caretaker','9876543210','alice.green@example.com','H01_CT01'),('CT_02','David Brown','Security Officer','9123456789','david.brown@example.com','H01_CT01'),('CT_03','Sophia White','Cleaner','9345678901','sophia.white@example.com','H01_CT01'),('CT_04','James Black','Technician','9456789012','james.black@example.com','H01_CT01'),('CT_05','Olivia Blue','Supervisor','9234567890','olivia.blue@example.com','H01_CT01');
/*!40000 ALTER TABLE `caretaking_staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `museum_head`
--

DROP TABLE IF EXISTS `museum_head`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `museum_head` (
  `head_id` varchar(10) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password_hash` varchar(255) DEFAULT NULL,
  `contact_number` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`head_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `museum_head`
--

LOCK TABLES `museum_head` WRITE;
/*!40000 ALTER TABLE `museum_head` DISABLE KEYS */;
INSERT INTO `museum_head` VALUES ('H01','Bhaskar Raj','bhaskar_admin','hashedpassword123','9876543210','bhaskar@museum.org');
/*!40000 ALTER TABLE `museum_head` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `object_management_staff`
--

DROP TABLE IF EXISTS `object_management_staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `object_management_staff` (
  `OMstaff_id` varchar(15) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `contact_number` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `committee_id` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`OMstaff_id`),
  KEY `committee_id` (`committee_id`),
  CONSTRAINT `object_management_staff_ibfk_1` FOREIGN KEY (`committee_id`) REFERENCES `staff_committee` (`committee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_management_staff`
--

LOCK TABLES `object_management_staff` WRITE;
/*!40000 ALTER TABLE `object_management_staff` DISABLE KEYS */;
INSERT INTO `object_management_staff` VALUES ('OM_01','John Doe','9876543210','john.doe@example.com','H01_OM01'),('OM_02','Jane Smith','9123456789','jane.smith@example.com','H01_OM01'),('OM_03','Emily Davis','9876541230','emily.davis@example.com','H01_OM01'),('OM_04','Michael Johnson','9345678901','michael.johnson@example.com','H01_OM01'),('OM_05','Sarah Lee','9456789012','sarah.lee@example.com','H01_OM01');
/*!40000 ALTER TABLE `object_management_staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `security_staff`
--

DROP TABLE IF EXISTS `security_staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `security_staff` (
  `SDstaff_id` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `role` varchar(100) DEFAULT NULL,
  `contact_number` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `committee_id` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`SDstaff_id`),
  KEY `committee_id` (`committee_id`),
  CONSTRAINT `security_staff_ibfk_1` FOREIGN KEY (`committee_id`) REFERENCES `staff_committee` (`committee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `security_staff`
--

LOCK TABLES `security_staff` WRITE;
/*!40000 ALTER TABLE `security_staff` DISABLE KEYS */;
INSERT INTO `security_staff` VALUES ('SD_01','Ravi Kumar','Security Supervisor','9876543210','ravi.kumar@example.com','H01_SD01'),('SD_02','Pooja Mehta','Surveillance Operator','9123456780','pooja.mehta@example.com','H01_SD01'),('SD_03','Amit Singh','Gate Incharge','9988776655','amit.singh@example.com','H01_SD01'),('SD_04','Sneha Roy','Night Shift Supervisor','9001122334','sneha.roy@example.com','H01_SD01'),('SD_05','Karan Patel','Patrolling Officer','9871234567','karan.patel@example.com','H01_SD01'),('SD_07','Rajeev Ranjan','Exit Gate Officer','9845123876','rajeev.ranjan@example.com','H01_SD01'),('SD_08','Divya Jha','Female Security Officer','9832104567','divya.jha@example.com','H01_SD01'),('SD_09','Mohit Verma','CCTV Technician','9823456710','mohit.verma@example.com','H01_SD01'),('SD_10','Neha Gupta','Communication Officer','9812345098','neha.gupta@example.com','H01_SD01'),('SD_11','Satish Kumar','Parking Area Guard','9809876543','satish.kumar@example.com','H01_SD01'),('SD_12','Ayesha Khan','Visitor Desk Security','9798654321','ayesha.khan@example.com','H01_SD01'),('SD_13','Nitin Yadav','Emergency Response','9787543210','nitin.yadav@example.com','H01_SD01'),('SD_14','Meena Das','Female Guard','9776432109','meena.das@example.com','H01_SD01'),('SD_15','Deepak Rana','Security Analyst','9765321098','deepak.rana@example.com','H01_SD01'),('SD_16','Ritu Pandey','Fire Safety Officer','9754210987','ritu.pandey@example.com','H01_SD01'),('SD_17','Alok Sinha','Metal Detector Operator','9743109876','alok.sinha@example.com','H01_SD01'),('SD_18','Tina Dey','Locker Room Guard','9732098765','tina.dey@example.com','H01_SD01'),('SD_19','Arun Joshi','Perimeter Security','9721987654','arun.joshi@example.com','H01_SD01'),('SD_20','Rakhi Sen','Emergency Exit Guard','9710876543','rakhi.sen@example.com','H01_SD01'),('SD_21','Manoj Das','Day Shift Officer','9709765432','manoj.das@example.com','H01_SD01'),('SD_22','Kajal Thakur','Night Shift Guard','9698654321','kajal.thakur@example.com','H01_SD01'),('SD_23','Pradeep Meena','Floor Patrol Officer','9687543210','pradeep.meena@example.com','H01_SD01'),('SD_24','Swati Mishra','Monitoring Supervisor','9676432109','swati.mishra@example.com','H01_SD01'),('SD_25','Hemant Pal','Control Room Operator','9665321098','hemant.pal@example.com','H01_SD01'),('SD_26','Kritika Jain','Security Coordinator','9654210987','kritika.jain@example.com','H01_SD01'),('SD_27','Rahul Bansal','Checkpoint Guard','9643109876','rahul.bansal@example.com','H01_SD01'),('SD_28','Snehal Deshmukh','Crowd Controller','9632098765','snehal.deshmukh@example.com','H01_SD01'),('SD_29','Vinay Tiwari','Emergency Monitor','9621987654','vinay.tiwari@example.com','H01_SD01'),('SD_30','Komal Yadav','Security Assistant','9610876543','komal.yadav@example.com','H01_SD01'),('SD_31','Saurabh Roy','Equipment Checker','9609765432','saurabh.roy@example.com','H01_SD01'),('SD_32','Jaya Prasad','Log Sheet Manager','9598654321','jaya.prasad@example.com','H01_SD01'),('SD_33','Tarun Negi','Museum Exit Officer','9587543210','tarun.negi@example.com','H01_SD01'),('SD_34','Nisha Rawat','Gallery Watch Guard','9576432109','nisha.rawat@example.com','H01_SD01'),('SD_35','Bhavesh Naik','Visitor Entry Validator','9565321098','bhavesh.naik@example.com','H01_SD01'),('SD_6','Anjali Sharma','Entry Gate Officer','9856321470','anjali.sharma@example.com','H01_SD01');
/*!40000 ALTER TABLE `security_staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_committee`
--

DROP TABLE IF EXISTS `staff_committee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff_committee` (
  `committee_id` varchar(10) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `role` varchar(100) DEFAULT NULL,
  `manages` varchar(50) DEFAULT NULL,
  `contact_number` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `reports_to` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`committee_id`),
  KEY `reports_to` (`reports_to`),
  CONSTRAINT `staff_committee_ibfk_1` FOREIGN KEY (`reports_to`) REFERENCES `museum_head` (`head_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_committee`
--

LOCK TABLES `staff_committee` WRITE;
/*!40000 ALTER TABLE `staff_committee` DISABLE KEYS */;
INSERT INTO `staff_committee` VALUES ('H01_CT01','Anjali Das','Head of Caretaking','Caretaking','9876587654','anjali@museum.org','H01'),('H01_OM01','Ravi Kumar','Head of Object Management','Objects','9876512345','ravi@museum.org','H01'),('H01_SD01','Pooja Sharma','Head of Security','Security','9876598765','pooja@museum.org','H01');
/*!40000 ALTER TABLE `staff_committee` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-29 21:42:57
