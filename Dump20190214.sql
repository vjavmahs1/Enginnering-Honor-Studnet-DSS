CREATE DATABASE  IF NOT EXISTS `coe-honors` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `coe-honors`;
-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: coe-mysql-db-1.engr.tamu.edu    Database: coe-honors
-- ------------------------------------------------------
-- Server version	5.5.5-10.2.21-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Activity`
--

DROP TABLE IF EXISTS `Activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Activity` (
  `ActivityID` varchar(10) NOT NULL,
  `ReqID` varchar(15) NOT NULL,
  `SemID` varchar(7) NOT NULL,
  `Date` date DEFAULT NULL,
  `Location` varchar(45) DEFAULT NULL,
  `Details` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ActivityID`,`ReqID`,`SemID`),
  KEY `Activity_ReqID_idx` (`ReqID`),
  KEY `Activity.SemID_idx` (`SemID`),
  CONSTRAINT `Activity.SemID` FOREIGN KEY (`SemID`) REFERENCES `Semester` (`SemId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Activity_ReqID` FOREIGN KEY (`ReqID`) REFERENCES `Requirements` (`ReqID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Advisor`
--

DROP TABLE IF EXISTS `Advisor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Advisor` (
  `AUIN` varchar(10) NOT NULL,
  `Firstname` varchar(45) DEFAULT NULL,
  `MiddleName` varchar(45) DEFAULT NULL,
  `Lastname` varchar(45) DEFAULT NULL,
  `TrackID` varchar(7) DEFAULT NULL,
  PRIMARY KEY (`AUIN`),
  KEY `TrackID_idx` (`TrackID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Course`
--

DROP TABLE IF EXISTS `Course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Course` (
  `Courses` varchar(10) NOT NULL,
  `Title` varchar(45) DEFAULT NULL,
  `NumberOfCredits` int(11) DEFAULT NULL,
  `MinCredits` int(11) DEFAULT NULL,
  `MaxCredits` int(11) DEFAULT NULL,
  PRIMARY KEY (`Courses`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Course-Section`
--

DROP TABLE IF EXISTS `Course-Section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Course-Section` (
  `CRN` int(10) NOT NULL,
  `Course` varchar(10) DEFAULT NULL,
  `SemID` varchar(7) NOT NULL,
  `Section` varchar(15) DEFAULT NULL,
  `TUIN` int(10) DEFAULT NULL,
  `Campus` varchar(15) DEFAULT NULL,
  `Level` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`CRN`,`SemID`),
  KEY `Course_sec_TUIN_idx` (`TUIN`),
  KEY `Stud_sect.Course_idx` (`Course`),
  CONSTRAINT `Course_sect.Cuorse` FOREIGN KEY (`Course`) REFERENCES `Course` (`Courses`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Course_sect.TUIN` FOREIGN KEY (`TUIN`) REFERENCES `Teacher` (`TUIN`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DeptActivityRequirements`
--

DROP TABLE IF EXISTS `DeptActivityRequirements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `DeptActivityRequirements` (
  `Dept` varchar(45) NOT NULL,
  `RequiredActivity` int(11) DEFAULT NULL,
  PRIMARY KEY (`Dept`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Exception`
--

DROP TABLE IF EXISTS `Exception`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Exception` (
  `SUIN` varchar(10) NOT NULL,
  `SemID` varchar(7) NOT NULL,
  `TypeOfLeave` varchar(45) DEFAULT NULL,
  `LeaveDuration` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`SUIN`,`SemID`),
  KEY `Leave_sem_idx` (`SemID`),
  KEY `SUIN_Leave_idx` (`SUIN`),
  CONSTRAINT `Leave_.SUIN` FOREIGN KEY (`SUIN`) REFERENCES `Students` (`SUIN`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Leave_sem` FOREIGN KEY (`SemID`) REFERENCES `Semester` (`SemId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Graduated`
--

DROP TABLE IF EXISTS `Graduated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Graduated` (
  `UIN` int(11) NOT NULL,
  `Firstname` varchar(45) DEFAULT NULL,
  `Lastname` varchar(45) DEFAULT NULL,
  `GraduationSemester` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`UIN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Requirements`
--

DROP TABLE IF EXISTS `Requirements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Requirements` (
  `ReqID` varchar(15) NOT NULL,
  `Description` varchar(105) DEFAULT NULL,
  PRIMARY KEY (`ReqID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='		';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Research`
--

DROP TABLE IF EXISTS `Research`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Research` (
  `ResearchID` varchar(25) NOT NULL,
  `ReqID` varchar(15) NOT NULL DEFAULT '',
  `Advisor` varchar(45) DEFAULT NULL,
  `Dept` varchar(6) NOT NULL,
  `Program` varchar(10) DEFAULT NULL,
  `Details` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ResearchID`,`ReqID`,`Dept`),
  KEY `Research_reqID_idx` (`ReqID`),
  CONSTRAINT `Research_reqID` FOREIGN KEY (`ReqID`) REFERENCES `Requirements` (`ReqID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Semester`
--

DROP TABLE IF EXISTS `Semester`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Semester` (
  `SemId` varchar(7) NOT NULL,
  `Semester` varchar(16) DEFAULT NULL,
  `AcademicYear` varchar(9) DEFAULT NULL,
  PRIMARY KEY (`SemId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Status`
--

DROP TABLE IF EXISTS `Status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Status` (
  `StatusID` varchar(15) NOT NULL,
  `Description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`StatusID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Stud-Section`
--

DROP TABLE IF EXISTS `Stud-Section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Stud-Section` (
  `CRN` int(10) NOT NULL,
  `Credits` varchar(4) DEFAULT NULL,
  `Grade` varchar(2) DEFAULT NULL,
  `SemID` varchar(7) NOT NULL,
  `SUIN` varchar(10) NOT NULL DEFAULT '0',
  `GradingMode` varchar(10) DEFAULT NULL,
  `Repeat` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`CRN`,`SemID`,`SUIN`),
  KEY `Stud_sec_SUIN_idx` (`SUIN`),
  KEY `Stud_sect.SemID_idx` (`SemID`),
  CONSTRAINT `Stud_sect.CRN` FOREIGN KEY (`CRN`) REFERENCES `Course-Section` (`CRN`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Stud_sect.SUIN` FOREIGN KEY (`SUIN`) REFERENCES `Students` (`SUIN`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Stud_sect.SemID` FOREIGN KEY (`SemID`) REFERENCES `Semester` (`SemId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Student-Advisor-Meetings`
--

DROP TABLE IF EXISTS `Student-Advisor-Meetings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Student-Advisor-Meetings` (
  `SUIN` varchar(10) NOT NULL,
  `ReqID` varchar(5) NOT NULL,
  `SemID` varchar(7) NOT NULL,
  `AUIN` varchar(10) DEFAULT NULL,
  `DateOfMeeting` date DEFAULT NULL,
  `Details` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`SUIN`,`ReqID`,`SemID`),
  KEY `ReqID-stu_adv_meet_idx` (`ReqID`),
  KEY `suin-studentAdvMeet_idx` (`SUIN`),
  KEY `AUIN-stu_adv_meet_idx` (`AUIN`),
  CONSTRAINT `AUIN-stu_adv_meet` FOREIGN KEY (`AUIN`) REFERENCES `Advisor` (`AUIN`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ReqID-stu_adv_meet` FOREIGN KEY (`ReqID`) REFERENCES `Requirements` (`ReqID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `SUIN-stu_adv_meet` FOREIGN KEY (`SUIN`) REFERENCES `Students` (`SUIN`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Student_Activity`
--

DROP TABLE IF EXISTS `Student_Activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Student_Activity` (
  `SUIN` varchar(10) NOT NULL,
  `ReqID` varchar(5) NOT NULL,
  `ActivityID` varchar(10) NOT NULL,
  `Attendance` int(2) DEFAULT NULL,
  PRIMARY KEY (`SUIN`,`ReqID`,`ActivityID`),
  KEY `SA_table_AID_idx` (`ActivityID`),
  KEY `SA_table_SUIN_idx` (`SUIN`),
  KEY `SA_table_ReqID_idx` (`ReqID`),
  CONSTRAINT `SA_table_ActivityID` FOREIGN KEY (`ActivityID`) REFERENCES `Activity` (`ActivityID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `SA_table_ReqID` FOREIGN KEY (`ReqID`) REFERENCES `Requirements` (`ReqID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `SA_table_SUIN` FOREIGN KEY (`SUIN`) REFERENCES `Students` (`SUIN`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Student_Research`
--

DROP TABLE IF EXISTS `Student_Research`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Student_Research` (
  `SUIN` varchar(10) NOT NULL DEFAULT '0',
  `ReqID` varchar(15) NOT NULL DEFAULT '',
  `SemID` varchar(7) DEFAULT NULL,
  `ResearchID` varchar(25) NOT NULL DEFAULT '',
  `CourseCredit` int(2) DEFAULT NULL,
  `PaperPublished` varchar(2) DEFAULT NULL,
  `ConferenceAttended` varchar(2) DEFAULT NULL,
  `Presentation` varchar(2) DEFAULT NULL,
  `Details` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`SUIN`,`ReqID`,`ResearchID`),
  KEY `Stu_res_SUIN_idx` (`SUIN`),
  KEY `Stu_res_ReqID_idx` (`ReqID`),
  CONSTRAINT `Stu_res_ReqID` FOREIGN KEY (`ReqID`) REFERENCES `Requirements` (`ReqID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Stu_res_SUIN` FOREIGN KEY (`SUIN`) REFERENCES `Students` (`SUIN`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Student_Status`
--

DROP TABLE IF EXISTS `Student_Status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Student_Status` (
  `SUIN` varchar(10) NOT NULL,
  `Status` varchar(15) DEFAULT NULL,
  `SemID` varchar(7) DEFAULT NULL,
  `prevsemcumGPA` varchar(7) DEFAULT NULL,
  `cursemcumGPA` varchar(7) DEFAULT NULL,
  `cursemtermGPA` varchar(7) DEFAULT NULL,
  `cursemhonorsGPA` varchar(7) DEFAULT NULL,
  PRIMARY KEY (`SUIN`),
  KEY `Student_Status.SemID_idx` (`SemID`),
  KEY `Student_Status.Status_idx` (`Status`),
  CONSTRAINT `Student_Status.SUIN` FOREIGN KEY (`SUIN`) REFERENCES `Students` (`SUIN`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Student_Status.SemID` FOREIGN KEY (`SemID`) REFERENCES `Semester` (`SemId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Student_Status.Status` FOREIGN KEY (`Status`) REFERENCES `Status` (`StatusID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Student_Track`
--

DROP TABLE IF EXISTS `Student_Track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Student_Track` (
  `SUIN` varchar(10) NOT NULL,
  `TrackID` varchar(15) NOT NULL,
  `SemEnrolled` varchar(10) NOT NULL DEFAULT '',
  `Academic_year` varchar(9) DEFAULT NULL,
  `Campus` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`SUIN`,`TrackID`,`SemEnrolled`),
  KEY `Stu_track.TrackID_idx` (`TrackID`),
  KEY `Stu_travk.SUIN_idx` (`SUIN`),
  KEY `Stu_track.SemID_idx` (`SemEnrolled`),
  CONSTRAINT `Stu_track.SUIN` FOREIGN KEY (`SUIN`) REFERENCES `Students` (`SUIN`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Stu_track.SemID` FOREIGN KEY (`SemEnrolled`) REFERENCES `Semester` (`SemId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Stu_track.TrackID` FOREIGN KEY (`TrackID`) REFERENCES `Track` (`TrackID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Student_Track_Req`
--

DROP TABLE IF EXISTS `Student_Track_Req`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Student_Track_Req` (
  `SUIN` varchar(10) NOT NULL,
  `TrackID` varchar(15) NOT NULL,
  `ReqID` varchar(15) NOT NULL DEFAULT '',
  `SemID` varchar(7) NOT NULL DEFAULT '',
  `ActualSem` varchar(2) DEFAULT NULL,
  `ActualYear` varchar(2) DEFAULT NULL,
  `ActualOverall` varchar(2) DEFAULT NULL,
  `Exception` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`SUIN`,`TrackID`,`ReqID`,`SemID`),
  KEY `STR.TrackID_idx` (`TrackID`),
  KEY `STR.SemID_idx` (`SemID`),
  KEY `STR.ReqID_idx` (`ReqID`),
  CONSTRAINT `STR.ReqID` FOREIGN KEY (`ReqID`) REFERENCES `Requirements` (`ReqID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `STR.SUIN` FOREIGN KEY (`SUIN`) REFERENCES `Students` (`SUIN`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `STR.SemID` FOREIGN KEY (`SemID`) REFERENCES `Semester` (`SemId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `STR.TrackID` FOREIGN KEY (`TrackID`) REFERENCES `Track` (`TrackID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Students`
--

DROP TABLE IF EXISTS `Students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Students` (
  `SUIN` varchar(10) NOT NULL,
  `Firstname` varchar(45) DEFAULT NULL,
  `Lastname` varchar(45) DEFAULT NULL,
  `MiddleName` varchar(45) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `Major` varchar(45) DEFAULT NULL,
  `Dept` varchar(50) DEFAULT NULL,
  `SemStart` varchar(7) DEFAULT NULL,
  `GPA` varchar(5) DEFAULT NULL,
  `Status` varchar(15) DEFAULT NULL,
  `NumberOfTimesOnProbation` varchar(2) DEFAULT NULL,
  `NumberOfTimesDismissed` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`SUIN`),
  KEY `Students.SemStart_idx` (`SemStart`),
  CONSTRAINT `Students.SemStart` FOREIGN KEY (`SemStart`) REFERENCES `Semester` (`SemId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Teacher`
--

DROP TABLE IF EXISTS `Teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Teacher` (
  `TUIN` int(10) NOT NULL,
  `Firstname` varchar(45) DEFAULT NULL,
  `Middlename` varchar(45) DEFAULT NULL,
  `Lastname` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`TUIN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Test_Table`
--

DROP TABLE IF EXISTS `Test_Table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Test_Table` (
  `CRN` int(11) NOT NULL,
  `Credits` varchar(45) DEFAULT NULL,
  `Grade` varchar(45) DEFAULT NULL,
  `SemID` varchar(45) NOT NULL DEFAULT '',
  `SUIN` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`CRN`,`SemID`,`SUIN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Test_student_track_req`
--

DROP TABLE IF EXISTS `Test_student_track_req`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Test_student_track_req` (
  `SUIN` int(11) NOT NULL,
  `TrackID` varchar(45) NOT NULL,
  `ReqID` varchar(45) NOT NULL,
  `SemID` varchar(45) NOT NULL,
  `ActualSem` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`SUIN`,`TrackID`,`ReqID`,`SemID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Track`
--

DROP TABLE IF EXISTS `Track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Track` (
  `TrackID` varchar(15) NOT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `SemesterStarted` varchar(10) DEFAULT NULL,
  `Academic_year` varchar(9) DEFAULT NULL,
  PRIMARY KEY (`TrackID`),
  KEY `Track.Sem_idx` (`SemesterStarted`),
  CONSTRAINT `Track.Sem` FOREIGN KEY (`SemesterStarted`) REFERENCES `Semester` (`SemId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Track_Requirements`
--

DROP TABLE IF EXISTS `Track_Requirements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Track_Requirements` (
  `ReqID` varchar(15) NOT NULL,
  `TrackID` varchar(15) NOT NULL,
  `RequiredPerSem` varchar(3) DEFAULT NULL,
  `RequiredPerYear` varchar(3) DEFAULT NULL,
  `RequiredOverall` varchar(3) DEFAULT NULL,
  `Description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ReqID`,`TrackID`),
  KEY `Track_req_TrackID_idx` (`TrackID`),
  CONSTRAINT `Track_req.ReqID` FOREIGN KEY (`ReqID`) REFERENCES `Requirements` (`ReqID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Track_req_TrackID` FOREIGN KEY (`TrackID`) REFERENCES `Track` (`TrackID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `V1`
--

DROP TABLE IF EXISTS `V1`;
/*!50001 DROP VIEW IF EXISTS `V1`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `V1` AS SELECT 
 1 AS `UIN`,
 1 AS `Firstname`,
 1 AS `SemStart`,
 1 AS `Lastname`,
 1 AS `Email`,
 1 AS `TrackID`,
 1 AS `ReqID`,
 1 AS `SemID`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `V2`
--

DROP TABLE IF EXISTS `V2`;
/*!50001 DROP VIEW IF EXISTS `V2`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `V2` AS SELECT 
 1 AS `UIN`,
 1 AS `Firstname`,
 1 AS `Lastname`,
 1 AS `Email`,
 1 AS `Course`,
 1 AS `SemID`,
 1 AS `NumberOfCredits`,
 1 AS `Grade`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `V3`
--

DROP TABLE IF EXISTS `V3`;
/*!50001 DROP VIEW IF EXISTS `V3`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `V3` AS SELECT 
 1 AS `UIN`,
 1 AS `Firstname`,
 1 AS `Lastname`,
 1 AS `Email`,
 1 AS `Course`,
 1 AS `SemID`,
 1 AS `NumberOfCredits`,
 1 AS `Grade`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `V4`
--

DROP TABLE IF EXISTS `V4`;
/*!50001 DROP VIEW IF EXISTS `V4`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `V4` AS SELECT 
 1 AS `UIN`,
 1 AS `Firstname`,
 1 AS `Lastname`,
 1 AS `Email`,
 1 AS `Courses`,
 1 AS `TotalHonorsCredits`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `V9`
--

DROP TABLE IF EXISTS `V9`;
/*!50001 DROP VIEW IF EXISTS `V9`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `V9` AS SELECT 
 1 AS `SUIN`,
 1 AS `ReqID`,
 1 AS `ActivityID`,
 1 AS `Attendance`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `V1`
--

/*!50001 DROP VIEW IF EXISTS `V1`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`paulinewade`@`128.194.136.33` SQL SECURITY DEFINER */
/*!50001 VIEW `V1` AS select `coe-honors`.`Students`.`SUIN` AS `UIN`,`coe-honors`.`Students`.`Firstname` AS `Firstname`,`coe-honors`.`Students`.`SemStart` AS `SemStart`,`coe-honors`.`Students`.`Lastname` AS `Lastname`,`coe-honors`.`Students`.`Email` AS `Email`,`coe-honors`.`Student_Track`.`TrackID` AS `TrackID`,`coe-honors`.`Track_Requirements`.`ReqID` AS `ReqID`,`coe-honors`.`Student_Track`.`SemEnrolled` AS `SemID` from ((`Students` join `Student_Track` on(`coe-honors`.`Students`.`SUIN` = `coe-honors`.`Student_Track`.`SUIN`)) join `Track_Requirements` on(`coe-honors`.`Student_Track`.`TrackID` = `coe-honors`.`Track_Requirements`.`TrackID`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `V2`
--

/*!50001 DROP VIEW IF EXISTS `V2`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`paulinewade`@`10.125.206.0/255.255.254.0` SQL SECURITY DEFINER */
/*!50001 VIEW `V2` AS select `Students`.`SUIN` AS `UIN`,`Students`.`Firstname` AS `Firstname`,`Students`.`Lastname` AS `Lastname`,`Students`.`Email` AS `Email`,`Course-Section`.`Course` AS `Course`,`Course-Section`.`SemID` AS `SemID`,`Stud-Section`.`Credits` AS `NumberOfCredits`,`Stud-Section`.`Grade` AS `Grade` from ((`Students` join `Stud-Section` on(`Students`.`SUIN` = `Stud-Section`.`SUIN`)) join `Course-Section` on(`Course-Section`.`CRN` = `Stud-Section`.`CRN` and `Course-Section`.`SemID` = `Stud-Section`.`SemID`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `V3`
--

/*!50001 DROP VIEW IF EXISTS `V3`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`paulinewade`@`10.125.206.0/255.255.254.0` SQL SECURITY DEFINER */
/*!50001 VIEW `V3` AS select `V2`.`UIN` AS `UIN`,`V2`.`Firstname` AS `Firstname`,`V2`.`Lastname` AS `Lastname`,`V2`.`Email` AS `Email`,`V2`.`Course` AS `Course`,`V2`.`SemID` AS `SemID`,`V2`.`NumberOfCredits` AS `NumberOfCredits`,`V2`.`Grade` AS `Grade` from (`V2` join `Course` on(`Course`.`Courses` = `V2`.`Course`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `V4`
--

/*!50001 DROP VIEW IF EXISTS `V4`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`paulinewade`@`10.125.206.0/255.255.254.0` SQL SECURITY DEFINER */
/*!50001 VIEW `V4` AS select `V3`.`UIN` AS `UIN`,`V3`.`Firstname` AS `Firstname`,`V3`.`Lastname` AS `Lastname`,`V3`.`Email` AS `Email`,group_concat(concat(`V3`.`Course`,' (',`V3`.`NumberOfCredits`,')','[',`V3`.`Grade`,']') separator ',') AS `Courses`,sum(`V3`.`NumberOfCredits`) AS `TotalHonorsCredits` from `V3` group by `V3`.`UIN` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `V9`
--

/*!50001 DROP VIEW IF EXISTS `V9`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`srb0203`@`128.194.136.124` SQL SECURITY DEFINER */
/*!50001 VIEW `V9` AS select `Student_Activity`.`SUIN` AS `SUIN`,`Student_Activity`.`ReqID` AS `ReqID`,`Student_Activity`.`ActivityID` AS `ActivityID`,`Student_Activity`.`Attendance` AS `Attendance` from `Student_Activity` where `Student_Activity`.`ActivityID` = 'MAKUP1516' */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-02-14 13:00:04
