-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: bus_stations
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `buscompany`
--

DROP TABLE IF EXISTS `buscompany`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `buscompany` (
  `CompanyID` varchar(45) NOT NULL,
  `CompanyName` varchar(45) DEFAULT NULL,
  `CompanyCode` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`CompanyID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buscompany`
--

LOCK TABLES `buscompany` WRITE;
/*!40000 ALTER TABLE `buscompany` DISABLE KEYS */;
INSERT INTO `buscompany` VALUES ('BB','BoltBus','137'),('FB','FlixBus','699'),('GH','Greyhound','001'),('JL','Jefferson Lines','567'),('LB','Lux Bus','295'),('MB','Megabus','040'),('PP','Peter Pan','777'),('RC','RedCoach','007'),('VM','Vamoose','342');
/*!40000 ALTER TABLE `buscompany` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `busstation`
--

DROP TABLE IF EXISTS `busstation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `busstation` (
  `Sname` varchar(45) NOT NULL,
  `state` varchar(45) DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  `Cname` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Sname`),
  KEY `Cname_idx` (`Cname`),
  CONSTRAINT `Cname` FOREIGN KEY (`Cname`) REFERENCES `city` (`Cname`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `busstation`
--

LOCK TABLES `busstation` WRITE;
/*!40000 ALTER TABLE `busstation` DISABLE KEYS */;
INSERT INTO `busstation` VALUES ('Atlanta Bus Station','Georgia','United States','Atlanta'),('Miami Greyhound: Bus Station','Florida','United States','Miami'),('Newark Penn Station','New Jersey','United States','Newark'),('Peter Pan Bus ','Massachusetts','United States','Boston'),('Port Authority Midtown Bus Terminal','New York','United States','New York City'),('Richmond Greyhound: Bus Station','Virginia','United States','Richmond'),('Rosa Parks Transit Center','Michigan','United States','Detroit'),('Transpais Terminal Plaza Fiesta','Tamaulipas','Mexico','Matamoros'),('Turimex Internacional','Texas','United States','Houston'),('Union Station','Ontario','Canada','Toronto');
/*!40000 ALTER TABLE `busstation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city` (
  `Cname` varchar(45) NOT NULL,
  `State` varchar(45) DEFAULT NULL,
  `Country` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Cname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES ('Atlanta','Georgia','United States'),('Boston','Massachusetts','United States'),('Detroit','Michigan','United States'),('Houston','Texas','United States'),('Matamoros','Tamaulipas','Mexico'),('Miami','Florida','United States'),('New York City','New York','United States'),('Newark','New Jersey','United States'),('Richmond','Virginia','United States'),('Toronto','Ontario','Canada');
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contains`
--

DROP TABLE IF EXISTS `contains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contains` (
  `CompanyID` varchar(45) NOT NULL,
  `Sname` varchar(45) NOT NULL,
  PRIMARY KEY (`CompanyID`,`Sname`),
  KEY `Sname_idx` (`Sname`),
  CONSTRAINT `CompanyID` FOREIGN KEY (`CompanyID`) REFERENCES `buscompany` (`CompanyID`) ON DELETE CASCADE,
  CONSTRAINT `Sname` FOREIGN KEY (`Sname`) REFERENCES `busstation` (`Sname`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contains`
--

LOCK TABLES `contains` WRITE;
/*!40000 ALTER TABLE `contains` DISABLE KEYS */;
INSERT INTO `contains` VALUES ('BB','Atlanta Bus Station'),('GH','Atlanta Bus Station'),('MB','Atlanta Bus Station'),('VM','Atlanta Bus Station'),('GH','Miami Greyhound: Bus Station'),('VM','Miami Greyhound: Bus Station'),('GH','Newark Penn Station'),('RC','Newark Penn Station'),('BB','Peter Pan Bus '),('RC','Peter Pan Bus '),('BB','Port Authority Midtown Bus Terminal'),('MB','Port Authority Midtown Bus Terminal'),('RC','Port Authority Midtown Bus Terminal'),('GH','Richmond Greyhound: Bus Station'),('RC','Richmond Greyhound: Bus Station'),('VM','Richmond Greyhound: Bus Station'),('BB','Rosa Parks Transit Center'),('MB','Transpais Terminal Plaza Fiesta'),('VM','Transpais Terminal Plaza Fiesta'),('BB','Turimex Internacional'),('GH','Turimex Internacional'),('MB','Turimex Internacional'),('VM','Turimex Internacional'),('MB','Union Station'),('RC','Union Station');
/*!40000 ALTER TABLE `contains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `SSN` int NOT NULL,
  `Fname` varchar(45) DEFAULT NULL,
  `M` varchar(45) DEFAULT NULL,
  `Lname` varchar(45) DEFAULT NULL,
  `Address` varchar(45) DEFAULT NULL,
  `Phone` varchar(45) DEFAULT NULL,
  `Age` int DEFAULT NULL,
  `Sex` varchar(45) DEFAULT NULL,
  `Job` varchar(45) DEFAULT NULL,
  `Sname` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`SSN`),
  KEY `StationName_idx` (`Sname`),
  CONSTRAINT `StationName` FOREIGN KEY (`Sname`) REFERENCES `busstation` (`Sname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (123456789,'Glory','M','Goodman','1234 abc lane, Houston, TX','1234567890',21,'F','Front Desk','Turimex Internacional'),(312312414,'John','F','Don','334 VITRUVIAN PARK, New York City, NY','3230067890',45,'M','Driver','Port Authority Midtown Bus Terminal'),(314612414,'Kae','E','Son','110 SYNERGY PARK, Newark,NJ','2330067890',56,'M','Driver','Newark Penn Station'),(332123124,'Jorge','M','Goodman','1234 abc lane, Houston, TX','2234567890',23,'M','Driver','Turimex Internacional'),(453564646,'Nick','M','Lee','731 Fondren, Houston, TX','3234567890',23,'M','Mechanic','Turimex Internacional'),(576362636,'Ashley','R','lamb','7498 W. Sutor St, Matamoros, TM','1234567890',21,'F','Front Desk','Transpais Terminal Plaza Fiesta'),(782974287,'Alex','P','Bart','92 Young St, Richmond,VA','2330067890',56,'M','Driver','Richmond Greyhound: Bus Station'),(791749479,'Frank','H','colon','7046 Fawn Dr, Detroit, MI','3234567890',23,'M','Mechanic','Rosa Parks Transit Center'),(974719424,'Donald','Z','star','7304 North Street, Torono, OT','2234567890',23,'M','Driver','Union Station'),(997329792,'Might','T','Guy','372 Marvon St, Boston, MA','3230067890',45,'M','Driver','Peter Pan Bus ');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee2`
--

DROP TABLE IF EXISTS `employee2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee2` (
  `Job` varchar(45) NOT NULL,
  `Salary` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Job`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee2`
--

LOCK TABLES `employee2` WRITE;
/*!40000 ALTER TABLE `employee2` DISABLE KEYS */;
INSERT INTO `employee2` VALUES ('Driver','90000'),('Front Desk','50000'),('Mechanic','70000');
/*!40000 ALTER TABLE `employee2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passenger1`
--

DROP TABLE IF EXISTS `passenger1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `passenger1` (
  `PID` int NOT NULL,
  `TicketNo` varchar(45) NOT NULL,
  PRIMARY KEY (`PID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passenger1`
--

LOCK TABLES `passenger1` WRITE;
/*!40000 ALTER TABLE `passenger1` DISABLE KEYS */;
INSERT INTO `passenger1` VALUES (1,'A1234568'),(2,'Z1234568'),(3,'b1234568'),(4,'C1234568'),(5,'D1234568'),(6,'E1234568'),(7,'F1234568'),(8,'G1234568'),(9,'H1234568'),(10,'Y1234568'),(11,'X1234568'),(12,'W1234568'),(13,'V1234568'),(14,'U1234568'),(15,'T1234568');
/*!40000 ALTER TABLE `passenger1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passenger2`
--

DROP TABLE IF EXISTS `passenger2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `passenger2` (
  `TicketNO` varchar(45) NOT NULL,
  `FName` varchar(45) DEFAULT NULL,
  `M` varchar(45) DEFAULT NULL,
  `LName` varchar(45) DEFAULT NULL,
  `Address` varchar(45) DEFAULT NULL,
  `Phone` varchar(45) DEFAULT NULL,
  `Age` int DEFAULT NULL,
  `Sex` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`TicketNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passenger2`
--

LOCK TABLES `passenger2` WRITE;
/*!40000 ALTER TABLE `passenger2` DISABLE KEYS */;
INSERT INTO `passenger2` VALUES ('A1234568','ALBERT','M','SMITH','2230 NORTHSIDE, APT 11, ALBANY, NY','8080367290',30,'M'),('B1234568','ANKITA','S','PATIL','7720 MCCALLUM BLVD, APT 1082, DALLAS, TX','9080367266',23,'F'),('C1234568','Jazz','A','MISHRA','7820 MCCALLUM COURTS, APT 234, Miami, FL','8082267280',19,'F'),('D1234568','TEJASHREE','B','PANDIT','9082 ESTAES OF RICHARDSON, RICHARDSON, TX','9004360125',28,'F'),('E1234568','LAKSHMI','P','SHARMA','1110 FIR HILLS, APT 903, New York City , NY','7666190505',21,'F'),('F1234568','AKHILESH','D','White','345 CHATHAM COURTS, Newark, NJ','9080369290',29,'M'),('G1234568','MANAN','S','LAKHANI','5589 CHTHAM REFLECTIONS, HOUSTON, TX','9004335126',25,'F'),('H1234568','KARAN','M','MOTANI','42 FRANKFORD VILLA, New York City, NY','9727626643',22,'M'),('T1234568','RIA','T','Kris','3355 PALENCIA, APT 2065, Detroit, MI','4724512343',15,'M'),('U1234568','JOHN','P','Black','6666 ROCK HILL, APT 2902, Atlanta, GA','4624569986',55,'M'),('V1234568','ALIA','V','BHAT','548 MARKET PLACE, Boston, MA','9734567800',20,'F'),('W1234568','SARA','B','GOMES','6785 SPLITSVILLA, MIAMI, FL','9024569226',15,'F'),('X1234568','Terence','L','Bush','1234 BAKER APTS, Richmond, VA','8045649300',10,'M'),('Y1234568','ROM','A','SOLANKI','7720 MCCALLUM BLVD, Newark, NJ','9004568903',60,'M'),('Z1234568','Ally','V','Jackson','3456 VIKAS APTS, APT 102,Houstons, Texas','8080367280',26,'F');
/*!40000 ALTER TABLE `passenger2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passenger3`
--

DROP TABLE IF EXISTS `passenger3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `passenger3` (
  `PID` int NOT NULL,
  `Route_code` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`PID`),
  KEY `Route_code_idx` (`Route_code`),
  CONSTRAINT `Route_code` FOREIGN KEY (`Route_code`) REFERENCES `route` (`Route_code`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passenger3`
--

LOCK TABLES `passenger3` WRITE;
/*!40000 ALTER TABLE `passenger3` DISABLE KEYS */;
INSERT INTO `passenger3` VALUES (1,'BB001'),(2,'FB001'),(3,'GH001'),(4,'GH002'),(5,'MB001'),(6,'MB002'),(7,'PP001'),(8,'VM001'),(9,'VM002');
/*!40000 ALTER TABLE `passenger3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `route`
--

DROP TABLE IF EXISTS `route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `route` (
  `Route_code` varchar(45) NOT NULL,
  `Source` varchar(45) DEFAULT NULL,
  `Destination` varchar(45) DEFAULT NULL,
  `Arrival` varchar(45) DEFAULT NULL,
  `Departure` varchar(45) DEFAULT NULL,
  `Status` varchar(45) DEFAULT NULL,
  `Duration` varchar(45) DEFAULT NULL,
  `Route_type` varchar(45) DEFAULT NULL,
  `Layover_Time` varchar(45) DEFAULT NULL,
  `No_of_Stops` int DEFAULT NULL,
  `CompanyID` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Route_code`),
  KEY `CompanyID_idx` (`CompanyID`),
  CONSTRAINT `ComID` FOREIGN KEY (`CompanyID`) REFERENCES `buscompany` (`CompanyID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `route`
--

LOCK TABLES `route` WRITE;
/*!40000 ALTER TABLE `route` DISABLE KEYS */;
INSERT INTO `route` VALUES ('BB001','RIC','NYC','15:00','09:00','On-Time','24hr','nonstop','1',1,'BB'),('FB001','RIC','NEW','14:00','09:00','Late','24hr','nonstop','0',0,'FB'),('GH001','ATL','MIA','09:30','12:00','On-time','24hr','Non-stop','0',0,'GH'),('GH002','ATL','Tor','03:30','11:00','On-time','24hr','Connecting','2',1,'GH'),('LB001','TOR','MAT','2000','12:00','On-time','29hr','Non-stop','3',2,'LB'),('MB001','DET','BOS','19:00','08:00','Late','24hr','nonstop','0',0,'MB'),('MB002','DET','TOR','12:00','08:00','Late','24hr','nonstop','0',0,'MB'),('PP001','DET','NYC','21:30','12:00','On-Time','24hr','nonstop','0',0,'PP'),('VM001','HOU','MAT','15:45','10:00','Late','24hr','nonstop','0',0,'VM'),('VM002','HOU','ATL','23:00','12:00','Late','24hr','nonstop','0',0,'VM');
/*!40000 ALTER TABLE `route` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `serves`
--

DROP TABLE IF EXISTS `serves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `serves` (
  `SSN` int NOT NULL,
  `PID` int NOT NULL,
  `TicketNO` varchar(45) NOT NULL,
  PRIMARY KEY (`SSN`,`PID`,`TicketNO`),
  KEY `PID_idx` (`PID`),
  CONSTRAINT `PID` FOREIGN KEY (`PID`) REFERENCES `passenger1` (`PID`) ON DELETE CASCADE,
  CONSTRAINT `SSN` FOREIGN KEY (`SSN`) REFERENCES `employee` (`SSN`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `serves`
--

LOCK TABLES `serves` WRITE;
/*!40000 ALTER TABLE `serves` DISABLE KEYS */;
INSERT INTO `serves` VALUES (312312414,1,'A1234568'),(314612414,2,'Z1234568'),(332123124,3,'b1234568'),(782974287,4,'C1234568'),(974719424,5,'D1234568'),(997329792,6,'E1234568'),(312312414,7,'F1234568'),(791749479,8,'G1234568'),(576362636,9,'H1234568'),(453564646,10,'Y1234568');
/*!40000 ALTER TABLE `serves` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket` (
  `ticketNumber` int NOT NULL,
  `Source` varchar(45) DEFAULT NULL,
  `Destination` varchar(45) DEFAULT NULL,
  `BookDate` date DEFAULT NULL,
  `TravelDate` date DEFAULT NULL,
  `SeatNumber` varchar(45) DEFAULT NULL,
  `PID` int DEFAULT NULL,
  KEY `PID2_idx` (`PID`),
  CONSTRAINT `PID2` FOREIGN KEY (`PID`) REFERENCES `passenger1` (`PID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES (1,'RIC','NYC','2021-04-15','2021-05-01','1A',1),(2,'RIC','NEW','2021-04-15','2021-05-01','2A',2),(3,'RIC','NEW','2021-04-15','2021-05-01','2B',3),(4,'ATL','MIA','2021-04-05','2021-05-04','2A',4),(5,'ATL','MIA','2021-04-25','2021-05-04','2C',5),(6,'ATL','MIA','2021-04-20','2021-05-04','3A',6),(7,'ATL','MIA','2021-04-01','2021-05-04','3C',7),(7,'HOU','ATL','2021-04-11','2021-05-04','1C',8),(7,'HOU','ATL','2021-04-13','2021-05-04','2C',9),(7,'HOU','ATL','2021-04-01','2021-05-04','3C',10);
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-20 14:38:16
