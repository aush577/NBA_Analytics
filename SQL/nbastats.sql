-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: nbastats
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `favorites`
--

DROP TABLE IF EXISTS `favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorites` (
  `ID` int NOT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `ID` FOREIGN KEY (`ID`) REFERENCES `player` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorites`
--

LOCK TABLES `favorites` WRITE;
/*!40000 ALTER TABLE `favorites` DISABLE KEYS */;
INSERT INTO `favorites` VALUES (2),(6),(7);
/*!40000 ALTER TABLE `favorites` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `favorites_AFTER_INSERT` AFTER INSERT ON `favorites` FOR EACH ROW BEGIN
	CALL recalculateRatings();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `favorites_AFTER_DELETE` AFTER DELETE ON `favorites` FOR EACH ROW BEGIN
	CALL recalculateRatings();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `injuries`
--

DROP TABLE IF EXISTS `injuries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `injuries` (
  `Date` varchar(45) DEFAULT NULL,
  `ID` int NOT NULL AUTO_INCREMENT,
  `Type` varchar(45) DEFAULT NULL,
  `Status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_Player_idx` (`ID`),
  CONSTRAINT `PLAYER_ID1` FOREIGN KEY (`ID`) REFERENCES `player` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=496 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `injuries`
--

LOCK TABLES `injuries` WRITE;
/*!40000 ALTER TABLE `injuries` DISABLE KEYS */;
INSERT INTO `injuries` VALUES ('3/11/2020',8,'Abdominal','Day To Day'),('3/4/2020',15,'Heel','Out'),('3/4/2020',16,'Knee','Out'),('3/11/2020',25,'Hamstring','Day To Day'),('3/11/2020',37,'Ankle','Out'),('3/11/2020',39,'Ankle','Day To Day'),('2/20/2020',46,'Shoulder','Out For Season'),('10/23/2019',50,'Achilles','Out'),('3/11/2020',54,'Left Quad','Day To Day'),('3/11/2020',55,'Achilles','Day To Day'),('2/19/2020',56,'Knee','Out'),('2/27/2020',62,'Ankle','Out'),('3/11/2020',63,'Shoulder','Out For Season'),('3/11/2020',70,'Illness','Day To Day'),('3/6/2020',86,'Groin','Out'),('3/10/2020',87,'Eye','Day To Day'),('2/26/2020',93,'Ankle','Out'),('1/13/2020',100,'Leg','Out For Season'),('3/11/2020',103,'Hip','Day To Day'),('3/11/2020',105,'Ankle','Day To Day'),('3/13/2020',107,'Shoulder','Out'),('3/11/2020',109,'Knee','Day To Day'),('1/22/2020',110,'Achilles','Out For Season'),('3/11/2020',138,'Ankle','Day To Day'),('3/3/2020',140,'Ankle','Out'),('2/19/2020',142,'Knees','Out'),('1/7/2020',143,'Knee','Out'),('3/10/2020',144,'Ankle','Out'),('3/11/2020',155,'Knee','Out'),('3/7/2020',156,'Left Hip','Out'),('3/11/2020',157,'Quad','Out'),('3/11/2020',158,'Ankle','Out'),('2/20/2020',164,'Left Knee ACL Tear','Out For Season'),('3/10/2020',185,'Toe','Day To Day'),('3/7/2020',190,'Hip','Out'),('2/24/2020',191,'Knee','Out For Season'),('3/10/2020',201,'Calf','Day To Day'),('3/11/2020',220,'Groin','Day To Day'),('3/11/2020',221,'Hand','Day To Day'),('3/11/2020',222,'Elbow','Day To Day'),('3/11/2020',233,'Groin','Day To Day'),('3/9/2020',240,'Quadriceps','Out'),('1/27/2020',242,'Hip','Out'),('3/11/2020',247,'Back','Day To Day'),('3/11/2020',253,'Toe','Day To Day'),('3/11/2020',256,'Ankle','Day To Day'),('3/11/2020',271,'Knee','Day To Day'),('3/6/2020',285,'Wrist','Out'),('3/1/2020',304,'Hamstring','Out'),('3/7/2020',309,'Wrist','Out'),('10/23/2019',315,'Achilles','Out'),('2/10/2020',339,'Knee','Out'),('2/27/2020',348,'Knee','Out'),('3/6/2020',351,'Elbow','Out'),('1/2/2020',359,'Knee','Out'),('1/8/2020',360,'Right Knee','Out'),('3/11/2020',371,'Back','Out'),('3/9/2020',389,'Illness','Out'),('1/6/2020',392,'Knee','Out'),('3/10/2020',393,'Ankle','Day To Day'),('12/10/2019',406,'Leg','Out For Season'),('1/17/2020',411,'Shoulder','Out'),('3/6/2020',412,'Leg Fracture','Out'),('3/11/2020',422,'Knee','Out'),('3/9/2020',435,'Calf','Out'),('3/3/2020',436,'Knee','Out'),('3/10/2020',438,'Shin','Day To Day'),('3/9/2020',452,'Shoulder','Day To Day'),('3/9/2020',453,'Ankle','Day To Day'),('3/9/2020',455,'Hamstring','Day To Day'),('1/2/2020',460,'Ankle','Out'),('3/11/2020',466,'Illness','Out'),('3/11/2020',469,'Illness','Out'),('3/4/2020',475,'Quad','Out'),('3/6/2020',480,'Hamstring','Out'),('3/10/2020',481,'Groin','Day To Day'),('12/11/2019',495,'Left Torn Achilles','Out');
/*!40000 ALTER TABLE `injuries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `percents`
--

DROP TABLE IF EXISTS `percents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `percents` (
  `percentID` int NOT NULL,
  `Weight` double NOT NULL DEFAULT '0',
  `Height` double NOT NULL DEFAULT '0',
  `Experience` double NOT NULL DEFAULT '0',
  `PPG` double NOT NULL DEFAULT '0',
  `RPG` double NOT NULL DEFAULT '0',
  `APG` double NOT NULL DEFAULT '0',
  `BPG` double NOT NULL DEFAULT '0',
  `FT` double NOT NULL DEFAULT '0',
  `FG` double NOT NULL DEFAULT '0',
  `TPT` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`percentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `percents`
--

LOCK TABLES `percents` WRITE;
/*!40000 ALTER TABLE `percents` DISABLE KEYS */;
INSERT INTO `percents` VALUES (0,0,0,100,100,0,0,0,0,0,0);
/*!40000 ALTER TABLE `percents` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `percents_AFTER_UPDATE` AFTER UPDATE ON `percents` FOR EACH ROW BEGIN
	CALL recalculateRatings();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `player`
--

DROP TABLE IF EXISTS `player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `player` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) DEFAULT NULL,
  `Weight` int DEFAULT '0',
  `Height` double DEFAULT '0',
  `College` varchar(45) DEFAULT NULL,
  `Nationality` varchar(45) DEFAULT NULL,
  `Experience` int DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=502 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player`
--

LOCK TABLES `player` WRITE;
/*!40000 ALTER TABLE `player` DISABLE KEYS */;
INSERT INTO `player` VALUES (1,'De\'Andre Hunter',225,79,'Virginia','US',0),(2,'Trae Young',180,73,'Oklahoma','US',1),(3,'Vince Carter',220,78,'UNC','US',21),(4,'Cam Reddish',208,80,'Duke','US',0),(5,'Kevin Huerter',190,79,'Maryland','US',1),(6,'Bruno Fernando',233,81,'Maryland','AO',0),(7,'Damian Jones',245,83,'Vanderbilt','US',3),(8,'DeAndre\' Bembry',210,77,'Saint Joseph\'s','US',3),(9,'John Collins',235,81,'Wake Forest','US',2),(10,'Brandon Goodwin',180,72,'Central Florida, Florida Gulf Coast','US',1),(11,'Jeff Teague',195,75,'Wake Forest','US',10),(12,'Treveon Graham',223,77,'Virginia Commonwealth','US',3),(13,'Dewayne Dedmon',245,84,'USC','US',6),(14,'Charlie Brown (TW)',199,78,'Saint Joseph\'s','US',0),(15,'Clint Capela',240,82,'Did not attend','CH',5),(16,'Skal Labissiere',216,82,'Kentucky','HT',3),(17,'Brad Wanamaker',210,75,'Pitt','US',1),(18,'Grant Williams',236,78,'Tennessee','US',0),(19,'Semi Ojeleye',235,78,'Duke, SMU','US',2),(20,'Jayson Tatum',204,80,'Duke','US',2),(21,'Daniel Theis',215,80,'Did not attend','DE',2),(22,'Marcus Smart',227,75,'Oklahoma State','US',5),(23,'Enes Kanter',262,82,'Did not attend','CH',8),(24,'Kemba Walker',172,72,'UConn','US',8),(25,'Jaylen Brown',223,78,'California','US',3),(26,'Gordon Hayward',207,79,'Butler','US',9),(27,'Javonte Green',220,76,'Radford','US',0),(28,'Carsen Edwards',200,71,'Purdue','US',0),(29,'Romeo Langford',216,76,'Indiana','US',0),(30,'Robert Williams',237,80,'Texas A&M','US',1),(31,'Vincent Poirier',235,84,'Did not attend','FR',0),(32,'Tremont Waters (TW)',175,70,'LSU','US',0),(33,'Tacko Fall (TW)',311,89,'Central Florida','SN',0),(34,'Spencer Dinwiddie',215,77,'Colorado','US',5),(35,'Taurean Prince',218,79,'Baylor','US',3),(36,'Jarrett Allen',237,83,'Texas','US',2),(37,'Joe Harris',220,78,'Virginia','US',5),(38,'DeAndre Jordan',265,83,'Texas A&M','US',11),(39,'Garrett Temple',195,77,'LSU','US',9),(40,'Caris LeVert',205,78,'Michigan','US',3),(41,'Timothé Luwawu-Cabarrot',210,79,'Did not attend','FR',3),(42,'Rodions Kurucs',228,81,'Did not attend','LV',1),(43,'Wilson Chandler',235,80,'DePaul','US',11),(44,'Dzanan Musa',217,81,'Did not attend','BA',1),(45,'Theo Pinson',212,77,'UNC','US',1),(46,'Kyrie Irving',195,74,'Duke','AU',8),(47,'Nicolas Claxton',215,83,'Georgia','US',0),(48,'Chris Chiozza (TW)',175,71,'Florida','US',1),(49,'Jeremiah Martin (TW)',184,75,'Memphis','US',0),(50,'Kevin Durant',240,82,'Texas','US',12),(51,'Coby White',185,76,'UNC','US',0),(52,'Tomáš Satoranský',198,79,'Did not attend','CZ',3),(53,'Thaddeus Young',220,80,'Georgia Tech','US',12),(54,'Zach LaVine',181,78,'UCLA','US',5),(55,'Ryan Arcidiacono',195,75,'Villanova','US',2),(56,'Kris Dunn',205,75,'Providence','US',3),(57,'Lauri Markkanen',240,84,'Arizona','FI',2),(58,'Wendell Carter Jr.',259,81,'Duke','US',1),(59,'Daniel Gafford',234,82,'Arkansas','US',0),(60,'Shaquille Harrison',190,79,'Tulsa','US',2),(61,'Denzel Valentine',210,76,'Michigan State','US',2),(62,'Luke Kornet',240,86,'Vanderbilt','US',2),(63,'Chandler Hutchison',196,79,'Boise State','US',1),(64,'Cristiano Felicio',270,82,'Did not attend','BR',4),(65,'Otto Porter',198,80,'Georgetown','US',6),(66,'Adam Mokoka (TW)',190,77,'Did not attend','FR',0),(67,'Max Strus (TW)',215,78,'Lewis, DePaul','US',0),(68,'Miles Bridges',225,78,'Michigan State','US',1),(69,'Devonte\' Graham',185,73,'Kansas','US',1),(70,'Terry Rozier',190,73,'Louisville','US',4),(71,'P.J. Washington',236,79,'Kentucky','US',0),(72,'Cody Zeller',240,84,'Indiana','US',6),(73,'Malik Monk',200,75,'Kentucky','US',2),(74,'Bismack Biyombo',255,80,'Did not attend','CD',8),(75,'Cody Martin',205,77,'NC State, Nevada','US',0),(76,'Dwayne Bacon',221,78,'Florida State','US',2),(77,'Willy Hernangomez',240,83,'Did not attend','ES',3),(78,'Nicolas Batum',200,81,'Did not attend','FR',11),(79,'Caleb Martin',205,77,'NC State, Nevada','US',0),(80,'Jalen McDaniels',192,82,'San Diego State','US',0),(81,'Joe Chealey',190,75,'College of Charleston','US',1),(82,'Kobi Simmons (TW)',166,77,'Arizona','US',2),(83,'Ray Spalding (TW)',215,82,'Louisville','US',1),(84,'Collin Sexton',190,73,'Alabama','US',1),(85,'Cedi Osman',215,79,'Did not attend','MK',2),(86,'Darius Garland',175,73,'Vanderbilt','US',0),(87,'Tristan Thompson',238,81,'Texas','CA',8),(88,'Matthew Dellavedova',200,75,'Saint Mary\'s','AU',6),(89,'Kevin Love',251,80,'UCLA','US',11),(90,'Larry Nance Jr.',230,79,'Wyoming','US',4),(91,'Kevin Porter Jr.',216,76,'USC','US',0),(92,'Alfonzo McKinnie',215,79,'Green Bay','US',2),(93,'Dante Exum',190,77,'Did not attend','AU',4),(94,'Ante Žižić',254,82,'Did not attend','HR',2),(95,'Dean Wade (TW)',228,81,'Kansas State','US',0),(96,'Andre Drummond',279,82,'UConn','US',7),(98,'Sir\'Dominic Pointer',192,78,'St. John\'s','US',0),(99,'Sheldon Mac',200,77,'Miami (FL)','US',1),(100,'Dylan Windler',196,78,'Belmont','US',0),(101,'Maxi Kleber',240,82,'Did not attend','DE',2),(102,'Delon Wright',183,77,'Utah','US',4),(103,'Dorian Finney-Smith',220,79,'Florida','US',3),(104,'Tim Hardaway Jr.',205,77,'Michigan','US',6),(105,'Seth Curry',185,74,'Liberty, Duke','US',5),(106,'Justin Jackson',210,79,'UNC','US',2),(107,'Jalen Brunson',190,73,'Villanova','US',1),(108,'Luka Dončić',218,79,'Did not attend','SI',1),(109,'Kristaps Porziņģis',240,87,'Did not attend','LV',3),(110,'Dwight Powell',240,82,'Stanford','CA',5),(111,'Boban Marjanović',290,88,'Did not attend','RS',4),(112,'J.J. Barea',185,70,'Northeastern University','PR',13),(113,'Courtney Lee',215,77,'Western Kentucky','US',11),(114,'Willie Cauley-Stein',240,84,'Kentucky','US',4),(115,'Michael Kidd-Gilchrist',232,78,'Kentucky','US',7),(116,'Antonius Cleveland (TW)',195,77,'SE Missouri State','US',1),(117,'Josh Reaves (TW)',215,76,'Penn State','US',0),(118,'Nikola Jokić',253,84,'Did not attend','RS',4),(119,'Monte Morris',175,74,'Iowa State','US',2),(120,'Jerami Grant',214,80,'Syracuse','US',5),(121,'Will Barton',175,77,'Memphis','US',7),(122,'Gary Harris',205,76,'Michigan State','US',5),(123,'Jamal Murray',201,76,'Kentucky','CA',3),(124,'Mason Plumlee',238,83,'Duke','US',6),(125,'Torrey Craig',215,79,'USC Upstate','US',2),(126,'Michael Porter Jr.',215,82,'Missouri','US',0),(127,'Paul Millsap',250,79,'Louisiana Tech','US',13),(128,'PJ Dozier (TW)',205,78,'South Carolina','US',2),(129,'Vlatko Čančar',210,80,'Did not attend','SI',0),(130,'Noah Vonleh',257,82,'Indiana','US',5),(131,'Keita Bates-Diop',229,80,'Ohio State','US',1),(132,'Troy Daniels',205,76,'Virginia Commonwealth','US',6),(133,'Bol Bol (TW)',235,86,'Oregon','SD',0),(134,'Langston Galloway',200,73,'Saint Joseph\'s','US',5),(135,'Christian Wood',214,82,'UNLV','US',3),(136,'Thon Maker',221,84,'Did not attend','SS',3),(137,'Tony Snell',213,78,'New Mexico','US',6),(138,'Bruce Brown',202,76,'Miami (FL)','US',1),(139,'Sviatoslav Mykhailiuk',205,79,'Kansas','UA',1),(140,'Derrick Rose',200,74,'Memphis','US',10),(141,'Sekou Doumbouya',209,80,'Did not attend','GN',0),(142,'Luke Kennard',206,77,'Duke','US',2),(143,'Blake Griffin',250,81,'Oklahoma','US',9),(144,'John Henson',219,81,'UNC','US',7),(145,'Louis King (TW)',195,79,'Oregon','US',0),(146,'Jordan Bone (TW)',179,75,'Tennessee','US',0),(147,'Brandon Knight',195,74,'Kentucky','US',7),(148,'Khyri Thomas',210,75,'Creighton','US',1),(149,'Jordan McRae',179,77,'Tennessee','US',3),(150,'Eric Paschall',255,78,'Fordham, Villanova','US',0),(151,'Marquese Chriss',240,81,'Washington','US',3),(152,'Jordan Poole',195,76,'Michigan','US',0),(153,'Damion Lee',210,77,'Drexel, Louisville','US',2),(154,'Ky Bowman',181,73,'Boston College','US',0),(155,'Draymond Green',230,78,'Michigan State','US',7),(156,'Kevon Looney',220,81,'UCLA','US',4),(157,'Alen Smailagić',215,82,'Did not attend','RS',0),(158,'Juan Toscano-Anderson',215,78,'Marquette','US',0),(159,'Andrew Wiggins',194,79,'Kansas','CA',5),(160,'Dragan Bender',225,84,'Did not attend','BA',3),(161,'Mychal Mulder',185,76,'Vincennes University, Kentucky','CA',0),(162,'Stephen Curry',190,75,'Davidson','US',10),(163,'Chasson Randle',185,74,'Stanford','US',2),(164,'Klay Thompson',215,78,'Washington State','US',8),(165,'P.J. Tucker',245,77,'Texas','US',8),(166,'Ben McLemore',195,75,'Kansas','US',6),(167,'James Harden',220,77,'Arizona State','US',10),(168,'Austin Rivers',200,75,'Duke','US',7),(169,'Danuel House',215,78,'Texas A&M','US',3),(170,'Russell Westbrook',200,75,'UCLA','US',11),(171,'Thabo Sefolosha',220,78,'Did not attend','CH',13),(172,'Eric Gordon',215,75,'Indiana','US',11),(173,'Chris Clemons',180,69,'Campbell','US',0),(174,'Tyson Chandler',240,84,'Did not attend','US',18),(175,'Isaiah Hartenstein',249,84,'Did not attend','US',1),(176,'Robert Covington',211,79,'Tennessee State','US',6),(177,'Jeff Green',235,80,'Georgetown','US',11),(178,'Michael Frazier (TW)',200,75,'Florida','US',0),(179,'DeMarre Carroll',215,78,'Vanderbilt, Missouri','US',10),(180,'Bruno Caboclo',218,81,'Did not attend','BR',5),(181,'William Howard (TW)',205,80,'Did not attend','FR',0),(182,'Justin Holiday',181,78,'Washington','US',6),(183,'T.J. McConnell',190,73,'Duquesne, Arizona','US',4),(184,'Domantas Sabonis',240,83,'Gonzaga','US',3),(185,'Doug McDermott',225,79,'Creighton','US',5),(186,'T.J. Warren',215,80,'NC State','US',5),(187,'Aaron Holiday',185,72,'UCLA','US',1),(188,'Myles Turner',250,83,'Texas','US',4),(189,'Goga Bitadze',245,83,'Did not attend','GE',0),(190,'Malcolm Brogdon',229,77,'Virginia','US',3),(191,'Jeremy Lamb',185,77,'UConn','US',7),(192,'JaKarr Sampson',215,79,'St. John\'s','US',4),(193,'Edmond Sumner',176,76,'Xavier','US',2),(194,'T.J. Leaf',225,82,'UCLA','IL',2),(195,'Victor Oladipo',210,76,'Indiana','US',6),(196,'Alize Johnson',212,79,'Missouri State','US',1),(197,'Brian Bowen (TW)',190,78,'Did not attend','US',0),(198,'Naz Mitrou-Long (TW)',218,75,'Iowa State','CA',2),(199,'Ivica Zubac',240,84,'Did not attend','BA',3),(200,'Montrezl Harrell',240,79,'Louisville','US',4),(201,'Lou Williams',175,73,'Did not attend','US',14),(202,'JaMychal Green',227,80,'Alabama','US',5),(203,'Kawhi Leonard',230,79,'San Diego State','US',8),(204,'Patrick Patterson',230,80,'Kentucky','US',9),(205,'Rodney McGruder',200,76,'Kansas State','US',3),(206,'Patrick Beverley',185,73,'Arkansas','US',7),(207,'Landry Shamet',188,76,'Wichita State','US',1),(208,'Paul George',220,80,'Fresno State','US',9),(209,'Terance Mann',215,77,'Florida State','US',0),(210,'Johnathan Motley (TW)',230,80,'Baylor','US',2),(211,'Amir Coffey (TW)',205,79,'Minnesota','US',0),(212,'Marcus Morris',235,80,'Kansas','US',8),(213,'Mfiondu Kabengele',250,81,'Florida State','CA',0),(214,'Reggie Jackson',208,75,'Boston College','IT',8),(215,'Joakim Noah',230,83,'Florida','US',12),(216,'Kentavious Caldwell-Pope',205,77,'Georgia','US',6),(217,'Dwight Howard',265,82,'Did not attend','US',15),(218,'Danny Green',215,78,'UNC','US',10),(219,'JaVale McGee',270,84,'Nevada','US',11),(220,'LeBron James',250,81,'Did not attend','US',16),(221,'Alex Caruso',186,77,'Texas A&M','US',2),(222,'Anthony Davis',253,82,'Kentucky','US',7),(223,'Kyle Kuzma',220,80,'Utah','US',2),(224,'Avery Bradley',180,75,'Texas','US',9),(225,'Rajon Rondo',186,73,'Kentucky','US',13),(226,'Jared Dudley',237,78,'Boston College','US',12),(227,'Quinn Cook',179,73,'Duke','US',3),(228,'Markieff Morris',245,80,'Kansas','US',8),(229,'Kostas Antetokounmpo (TW)',200,82,'Dayton','GR',1),(230,'Talen Horton-Tucker',235,76,'Iowa State','US',0),(231,'Devontae Cacok (TW)',240,79,'UNC Wilmington','US',0),(232,'Dion Waiters',215,75,'Syracuse','US',7),(233,'Dillon Brooks',220,79,'Oregon','CA',2),(234,'Tyus Jones',196,72,'Duke','US',4),(235,'Jonas Valančiūnas',265,83,'Did not attend','LT',7),(236,'Ja Morant',175,75,'Murray State','US',0),(237,'Kyle Anderson',230,81,'UCLA','US',5),(238,'Jaren Jackson Jr.',242,83,'Michigan State','US',1),(239,'De\'Anthony Melton',200,74,'USC','US',1),(240,'Brandon Clarke',210,80,'San Jose State, Gonzaga','CA',0),(241,'Marko Guduric',201,78,'Did not attend','RS',0),(242,'Grayson Allen',198,76,'Duke','US',1),(243,'Josh Jackson',207,80,'Kansas','US',2),(244,'Yuta Watanabe (TW)',205,80,'George Washington','JP',1),(245,'John Konchar (TW)',210,77,'Purdue-Fort Wayne','US',0),(246,'Gorgui Dieng',252,82,'Louisville','SN',6),(247,'Justise Winslow',225,78,'Duke','US',4),(248,'Jontay Porter',240,83,'Missouri','US',0),(249,'Bam Adebayo',255,81,'Kentucky','US',2),(250,'Duncan Robinson',215,79,'Williams, Michigan','US',1),(251,'Kendrick Nunn',190,74,'Illinois, Oakland','US',0),(252,'Kelly Olynyk',240,83,'Gonzaga','CA',6),(253,'Jimmy Butler',230,79,'Marquette','US',8),(254,'Goran Dragić',190,75,'Did not attend','SI',11),(255,'Derrick Jones Jr.',210,78,'UNLV','US',3),(256,'Meyers Leonard',260,84,'Illinois','US',7),(257,'Tyler Herro',200,77,'Kentucky','US',0),(258,'Chris Silva',230,80,'South Carolina','GA',0),(259,'Andre Iguodala',215,78,'Arizona','US',15),(260,'Jae Crowder',235,78,'Marquette','US',7),(261,'Solomon Hill',225,78,'Arizona','US',6),(262,'Gabe Vincent (TW)',200,75,'UC Santa Barbara','US',0),(263,'KZ Okpala',215,80,'Stanford','US',0),(264,'Udonis Haslem',235,80,'Florida','US',16),(265,'Kyle Alexander (TW)',222,83,'Tennessee','CA',0),(266,'Wesley Matthews',220,76,'Marquette','US',10),(267,'Brook Lopez',270,84,'Stanford','US',11),(268,'Pat Connaughton',209,77,'Notre Dame','US',4),(269,'Robin Lopez',275,84,'Stanford','US',11),(270,'Donte DiVincenzo',203,76,'Villanova','US',1),(271,'Giannis Antetokounmpo',242,83,'Did not attend','GR',6),(272,'Eric Bledsoe',205,73,'Kentucky','US',9),(273,'Ersan İlyasova',235,81,'Did not attend','TR',11),(274,'Khris Middleton',222,79,'Texas A&M','US',7),(275,'George Hill',188,75,'IUPUI','US',11),(276,'Kyle Korver',212,79,'Creighton','US',16),(277,'Sterling Brown',232,77,'SMU','US',2),(278,'D.J. Wilson',231,82,'Michigan','US',2),(279,'Thanasis Antetokounmpo',205,78,'Did not attend','GR',1),(280,'Marvin Williams',237,80,'UNC','US',14),(281,'Frank Mason III (TW)',190,71,'Kansas','US',2),(282,'Cameron Reynolds (TW)',225,79,'Tulane','US',1),(283,'Jarrett Culver',195,78,'Texas Tech','US',0),(284,'Josh Okogie',212,76,'Georgia Tech','NG',1),(285,'Karl-Anthony Towns',248,83,'Kentucky','US',4),(286,'Kelan Martin (TW)',235,77,'Butler','US',0),(287,'Naz Reid',264,81,'LSU','US',0),(288,'Jordan McLaughlin (TW)',170,71,'USC','US',0),(289,'Jake Layman',209,80,'Maryland','US',3),(290,'Jaylen Nowell',196,76,'Washington','US',0),(291,'Malik Beasley',198,76,'Florida State','US',3),(292,'Juan Hernangómez',220,81,'Did not attend','ES',3),(293,'James Johnson',240,79,'Wake Forest','US',10),(294,'D\'Angelo Russell',198,76,'Ohio State','US',4),(295,'Jarred Vanderbilt',214,81,'Kentucky','US',1),(296,'Jacob Evans',210,76,'Cincinnati','US',1),(297,'Evan Turner',220,78,'Ohio State','US',9),(298,'Omari Spellman',245,80,'Villanova','US',1),(299,'Josh Hart',215,77,'Villanova','US',2),(300,'Brandon Ingram',190,79,'Duke','US',3),(301,'Lonzo Ball',190,78,'UCLA','US',2),(302,'Jaxson Hayes',220,83,'Texas','US',0),(303,'Jrue Holiday',205,75,'UCLA','US',10),(304,'J.J. Redick',200,75,'Duke','US',13),(305,'Nicolò Melli',235,81,'Did not attend','IT',0),(306,'E\'Twaun Moore',191,75,'Purdue','US',8),(307,'Frank Jackson',205,75,'Duke','US',1),(308,'Derrick Favors',265,81,'Georgia Tech','US',9),(309,'Nickeil Alexander-Walker',205,77,'Virginia Tech','CA',0),(310,'Kenrich Williams',210,78,'TCU','US',1),(311,'Jahlil Okafor',275,82,'Duke','US',4),(312,'Zion Williamson',285,78,'Duke','US',0),(313,'Zylan Cheatham (TW)',220,77,'San Diego State, Arizona State','US',0),(314,'Josh Gray (TW)',180,72,'LSU','US',1),(315,'Darius Miller',225,78,'Kentucky','US',5),(316,'Bobby Portis',246,82,'Arkansas','US',4),(317,'Kevin Knox',215,79,'Kentucky','US',1),(318,'Julius Randle',250,80,'Kentucky','US',5),(319,'Taj Gibson',225,81,'USC','US',10),(320,'Mitchell Robinson',223,84,'Western Kentucky','US',1),(321,'Frank Ntilikina',190,76,'Did not attend','BE',2),(322,'RJ Barrett',202,78,'Duke','CA',0),(323,'Damyean Dotson',202,77,'Oregon, Houston','US',2),(324,'Elfrid Payton',185,75,'LA-Lafayette','US',5),(325,'Wayne Ellington',200,76,'UNC','US',10),(326,'Dennis Smith Jr.',195,74,'NC State','US',2),(327,'Reggie Bullock',200,78,'UNC','US',6),(328,'Allonzo Trier',200,76,'Arizona','US',1),(329,'Maurice Harkless',220,79,'St. John\'s','US',7),(330,'Kadeem Allen (TW)',200,73,'Arizona','US',2),(331,'Ignas Brazdeikis',216,78,'Michigan','LT',0),(332,'Kenny Wooten (TW)',220,81,'Oregon','US',0),(333,'Shai Gilgeous-Alexander',181,77,'Kentucky','CA',1),(334,'Dennis Schröder',172,73,'Did not attend','DE',6),(335,'Chris Paul',175,73,'Wake Forest','US',14),(336,'Steven Adams',265,83,'Pitt','NZ',6),(337,'Danilo Gallinari',233,82,'Did not attend','IT',10),(338,'Nerlens Noel',220,82,'Kentucky','US',5),(339,'Darius Bazley',208,80,'Did not attend','US',0),(340,'Terrance Ferguson',190,78,'Did not attend','US',2),(341,'Abdel Nader',225,77,'Northern Illinois, Iowa State','EG',2),(342,'Mike Muscala',240,82,'Bucknell','US',6),(343,'Hamidou Diallo',202,77,'Kentucky','US',1),(344,'Deonte Burton',240,76,'Marquette, Iowa State','US',1),(345,'Luguentz Dort (TW)',215,75,'Arizona State','CA',0),(346,'Kevin Hervey (TW)',230,81,'UT Arlington','US',0),(347,'Isaiah Roby',230,80,'Nebraska','US',0),(348,'Andre Roberson',210,79,'Colorado','US',5),(349,'Markelle Fultz',200,75,'Washington','US',2),(350,'Terrence Ross',206,78,'Washington','US',7),(351,'Evan Fournier',205,79,'Did not attend','FR',7),(352,'Mo Bamba',241,84,'Texas','US',1),(353,'Aaron Gordon',220,80,'Arizona','US',5),(354,'Nikola Vučević',260,83,'USC','CH',8),(355,'D.J. Augustin',183,71,'Texas','US',11),(356,'Wesley Iwundu',195,78,'Kansas State','US',2),(357,'Michael Carter-Williams',190,77,'Syracuse','US',6),(358,'Khem Birch',233,81,'Pitt, UNLV','CA',2),(359,'Jonathan Isaac',210,83,'Florida State','US',2),(360,'Al-Farouq Aminu',220,80,'Wake Forest','US',9),(361,'Gary Clark',225,78,'Cincinnati','US',1),(362,'Melvin Frazier',200,77,'Tulane','US',1),(363,'James Ennis',210,78,'Cal State Long Beach','US',5),(364,'B.J. Johnson (TW)',200,79,'Syracuse, La Salle','US',1),(365,'Vic Law (TW)',200,79,'Northwestern','US',0),(366,'Tobias Harris',235,80,'Tennessee','US',8),(367,'Furkan Korkmaz',190,79,'Did not attend','TR',2),(368,'Mike Scott',237,79,'Virginia','US',7),(369,'Al Horford',245,81,'Florida','DO',12),(370,'Matisse Thybulle',200,77,'Washington','US',0),(371,'Ben Simmons',230,82,'LSU','AU',2),(372,'Raul Neto',179,73,'Did not attend','BR',4),(373,'Josh Richardson',200,77,'Tennessee','US',4),(374,'Joel Embiid',250,84,'Kansas','CM',3),(375,'Shake Milton',207,77,'SMU','US',1),(376,'Kyle O\'Quinn',250,81,'Norfolk State','US',7),(377,'Norvel Pelle',216,82,'Did not attend','AG',0),(378,'Glenn Robinson III',222,78,'Michigan','US',5),(379,'Alec Burks',214,78,'Colorado','US',8),(380,'Zhaire Smith',199,75,'Texas Tech','US',1),(381,'Marial Shayok (TW)',196,77,'Virginia, Iowa State','CA',0),(382,'Mikal Bridges',210,78,'Villanova','US',1),(383,'Devin Booker',210,77,'Kentucky','US',4),(384,'Dario Šarić',225,82,'Did not attend','HR',3),(385,'Ricky Rubio',190,75,'Did not attend','ES',8),(386,'Kelly Oubre Jr.',205,79,'Kansas','US',4),(387,'Elie Okobo',190,75,'Did not attend','FR',1),(388,'Jevon Carter',195,73,'West Virginia','US',1),(389,'Cameron Johnson',205,80,'Pitt, UNC','US',0),(390,'Cheick Diallo',220,80,'Kansas','ML',3),(391,'Aron Baynes',260,82,'Washington State','NZ',7),(392,'Frank Kaminsky',240,84,'Wisconsin','US',4),(393,'Deandre Ayton',250,83,'Arizona','BS',1),(394,'Ty Jerome',195,77,'Virginia','US',0),(395,'Jalen Lecque',185,75,'Did not attend','US',0),(396,'Tariq Owens (TW)',205,82,'Tennessee, St. John\'s, Texas Tech','US',0),(397,'Anfernee Simons',181,75,'Did not attend','US',1),(398,'CJ McCollum',197,75,'Lehigh','US',6),(399,'Hassan Whiteside',235,84,'Marshall','US',7),(400,'Damian Lillard',195,74,'Weber State','US',7),(401,'Gary Trent Jr.',209,77,'Duke','US',1),(402,'Carmelo Anthony',240,80,'Syracuse','US',16),(403,'Nassir Little',220,77,'UNC','US',0),(404,'Mario Hezonja',201,80,'Did not attend','HR',4),(405,'Trevor Ariza',215,80,'UCLA','US',15),(406,'Rodney Hood',208,80,'Mississippi State, Duke','US',5),(407,'Caleb Swanigan',260,81,'Purdue','US',2),(408,'Wenyen Gabriel',220,81,'Kentucky','SD',0),(409,'Jaylen Hoard (TW)',216,80,'Wake Forest','FR',0),(410,'Moses Brown (TW)',245,86,'UCLA','US',0),(411,'Zach Collins',232,83,'Gonzaga','US',2),(412,'Jusuf Nurkić',280,84,'Did not attend','BA',5),(413,'Buddy Hield',220,76,'Oklahoma','BS',3),(414,'Harrison Barnes',225,80,'UNC','US',7),(415,'Nemanja Bjelica',235,82,'Did not attend','RS',4),(416,'Cory Joseph',200,75,'Texas','CA',8),(417,'Bogdan Bogdanovic',220,78,'Did not attend','RS',2),(418,'De\'Aaron Fox',185,75,'Kentucky','US',2),(419,'Yogi Ferrell',180,72,'Indiana','US',3),(420,'Richaun Holmes',240,82,'Bowling Green','US',4),(421,'Harry Giles',240,83,'Duke','US',1),(422,'Justin James',190,79,'Wyoming','US',0),(423,'Kent Bazemore',195,76,'Old Dominion','US',7),(424,'Marvin Bagley III',240,83,'Duke','US',1),(425,'Alex Len',250,84,'Maryland','UA',6),(426,'DaQuan Jeffries (TW)',216,77,'Oral Roberts, Tulsa','US',0),(427,'Kyle Guy (TW)',170,73,'Virginia','US',0),(428,'Jabari Parker',245,80,'Duke','US',5),(429,'Patty Mills',180,73,'Saint Mary\'s','AU',10),(430,'Bryn Forbes',190,74,'Michigan State','US',3),(431,'Trey Lyles',234,81,'Kentucky','CA',4),(432,'DeMar DeRozan',220,78,'USC','US',10),(433,'Derrick White',190,76,'Colorado-Colorado Springs, Colorado','US',2),(434,'Rudy Gay',230,80,'UConn','US',13),(435,'Dejounte Murray',170,76,'Washington','US',2),(436,'Jakob Poeltl',230,85,'Utah','AT',3),(437,'LaMarcus Aldridge',260,83,'Texas','US',13),(438,'Lonnie Walker',205,77,'Miami (FL)','US',1),(439,'Marco Belinelli',210,77,'Did not attend','IT',12),(440,'Chimezie Metu',225,81,'USC','US',1),(441,'Drew Eubanks (TW)',245,81,'Oregon State','US',1),(442,'Keldon Johnson',211,77,'Kentucky','US',0),(443,'Quinndary Weatherspoon (TW)',207,75,'Mississippi State','US',0),(444,'Luka Šamanić',227,82,'Did not attend','HR',0),(445,'Terence Davis',205,76,'Ole Miss','US',0),(446,'OG Anunoby',232,79,'Indiana','GB',2),(447,'Chris Boucher',200,81,'Oregon','LC',2),(448,'Pascal Siakam',230,81,'New Mexico State','CM',3),(449,'Kyle Lowry',196,72,'Villanova','US',13),(450,'Rondae Hollis-Jefferson',217,78,'Arizona','US',4),(451,'Serge Ibaka',235,84,'Did not attend','CG',10),(452,'Fred VanVleet',195,73,'Wichita State','US',3),(453,'Norman Powell',215,75,'UCLA','US',4),(454,'Patrick McCaw',185,79,'UNLV','US',3),(455,'Marc Gasol',255,83,'Did not attend','ES',11),(456,'Matt Thomas',190,76,'Iowa State','US',0),(457,'Malcolm Miller',210,79,'Holy Cross','US',2),(458,'Stanley Johnson',245,78,'Arizona','US',4),(459,'Oshae Brissett (TW)',210,79,'Syracuse','CA',0),(460,'Dewan Hernandez',235,82,'Miami (FL)','US',0),(461,'Paul Watson (TW)',215,79,'Fresno State','US',0),(462,'Joe Ingles',226,79,'Did not attend','AU',5),(463,'Royce O\'Neale',226,76,'Denver, Baylor','US',2),(464,'Donovan Mitchell',215,73,'Louisville','US',2),(465,'Bojan Bogdanović',216,80,'Did not attend','BA',5),(466,'Rudy Gobert',245,85,'Did not attend','FR',6),(467,'Georges Niang',230,79,'Iowa State','US',3),(468,'Tony Bradley',248,82,'UNC','US',2),(469,'Emmanuel Mudiay',200,75,'Did not attend','CD',4),(470,'Mike Conley',175,73,'Ohio State','US',12),(471,'Jordan Clarkson',194,76,'Tulsa, Missouri','US',5),(472,'Ed Davis',225,81,'UNC','US',9),(473,'Juwan Morgan',232,80,'Indiana','US',0),(474,'Rayjon Tucker',210,77,'Did not attend','US',0),(475,'Nigel Williams-Goss',190,74,'Gonzaga, Washington','US',0),(476,'Miye Oni',206,77,'Yale','US',0),(477,'Jarrell Brantley (TW)',250,77,'College of Charleston','US',0),(478,'Justin Wright-Foreman (TW)',190,72,'Hofstra','US',0),(479,'Troy Brown Jr.',215,78,'Oregon','US',1),(480,'Ish Smith',175,72,'Wake Forest','US',9),(481,'Isaac Bonga',180,80,'Did not attend','DE',1),(482,'Bradley Beal',207,75,'Florida','US',7),(483,'Davis Bertans',225,82,'Did not attend','LV',3),(484,'Rui Hachimura',230,80,'Gonzaga','JP',0),(485,'Thomas Bryant',248,82,'Indiana','US',2),(486,'Ian Mahinmi',262,83,'Did not attend','FR',11),(487,'Moritz Wagner',245,83,'Michigan','DE',1),(488,'Gary Payton II',190,75,'Oregon State','US',3),(489,'Admiral Schofield',241,77,'Tennessee','GB',0),(490,'Anzejs Pasecniks',220,85,'Did not attend','LV',0),(491,'Garrison Mathews (TW)',215,77,'Lipscomb','US',0),(492,'Shabazz Napier',175,72,'UConn','US',5),(493,'Jerome Robinson',190,76,'Boston College','US',1),(494,'Johnathan Williams (TW)',228,81,'Missouri, Gonzaga','US',1),(495,'John Wall',210,76,'Kentucky','US',9);
/*!40000 ALTER TABLE `player` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `player_AFTER_INSERT` AFTER INSERT ON `player` FOR EACH ROW BEGIN
	CALL recalculateRatings();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `player_AFTER_UPDATE` AFTER UPDATE ON `player` FOR EACH ROW BEGIN
	CALL recalculateRatings();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `player_AFTER_DELETE` AFTER DELETE ON `player` FOR EACH ROW BEGIN
	CALL recalculateRatings();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `player_stats`
--

DROP TABLE IF EXISTS `player_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `player_stats` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `PPG` double DEFAULT NULL,
  `RPG` double DEFAULT NULL,
  `APG` double DEFAULT NULL,
  `BPG` double DEFAULT NULL,
  `FT` double DEFAULT NULL,
  `FG` double DEFAULT NULL,
  `TPT` double DEFAULT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `Player_ID` FOREIGN KEY (`ID`) REFERENCES `player` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=502 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_stats`
--

LOCK TABLES `player_stats` WRITE;
/*!40000 ALTER TABLE `player_stats` DISABLE KEYS */;
INSERT INTO `player_stats` VALUES (1,12.3,4.5,1.8,0.3,0.764,0.41,0.355),(2,29.6,4.3,9.3,0.1,0.86,0.437,0.361),(3,5,2.1,0.8,0.4,0.793,0.352,0.302),(4,10.5,3.7,1.5,0.5,0.802,0.384,0.332),(5,12.2,4.1,3.8,0.5,0.828,0.413,0.38),(6,4.3,3.5,0.9,0.3,0.569,0.518,0.135),(7,5.6,3.7,0.6,0.7,0.738,0.68,0.222),(8,5.8,3.5,1.9,0.4,0.542,0.456,0.231),(9,21.6,10.1,1.5,1.6,0.8,0.583,0.401),(10,6.1,2.1,1.5,0.1,0.933,0.4,0.299),(11,7.7,2.2,4,0.2,0.887,0.412,0.333),(12,3.3,2.3,0.7,0.2,0.474,0.373,0.351),(13,8.1,8.2,0.7,1.5,0.875,0.393,0.222),(15,13.9,13.8,1.2,1.8,0.529,0.629,NULL),(16,5.8,5.1,1.3,0.9,0.758,0.551,0.231),(17,6.6,2,2.5,0.2,0.931,0.428,0.367),(18,3.5,2.7,1,0.5,0.725,0.417,0.247),(19,3.1,2,0.5,0.1,0.893,0.409,0.367),(20,23.6,7.1,2.9,0.9,0.806,0.448,0.398),(21,9.3,6.6,1.6,1.3,0.764,0.565,0.321),(22,13.5,3.8,4.8,0.5,0.835,0.38,0.348),(23,8.2,7.7,1,0.7,0.708,0.566,0.143),(24,21.2,4.1,4.9,0.5,0.867,0.421,0.377),(25,20.4,6.4,2.2,0.3,0.736,0.49,0.381),(26,17.3,6.5,4.1,0.4,0.847,0.502,0.392),(27,2.9,1.8,0.5,0.2,0.639,0.5,0.261),(28,3,1.2,0.6,0.1,0.846,0.327,0.309),(29,2.6,1.2,0.2,0.2,0.696,0.375,0.217),(30,4.3,4.7,1,1.2,0.56,0.677,NULL),(31,1.9,1.6,0.3,0.3,0.857,0.485,0.5),(34,20.6,3.5,6.8,0.3,0.778,0.415,0.308),(35,12.1,6,1.8,0.4,0.798,0.376,0.339),(36,10.6,9.5,1.3,1.3,0.62,0.646,0),(37,13.9,4.3,2.1,0.3,0.747,0.471,0.412),(38,8.3,10,1.9,0.9,0.68,0.666,NULL),(39,10.3,3.5,2.6,0.5,0.767,0.378,0.324),(40,17.7,4.1,4.1,0.2,0.72,0.414,0.381),(41,6.3,2.3,0.6,0.2,0.839,0.406,0.358),(42,4.2,2.5,0.8,0.1,0.607,0.448,0.385),(43,5.9,4.1,1.1,0.3,0.87,0.404,0.306),(44,4.2,2,0.9,0,0.75,0.36,0.231),(45,3.6,1.6,1.7,0.1,0.938,0.29,0.188),(46,27.4,5.2,6.4,0.5,0.922,0.478,0.394),(47,4.4,2.9,1.1,0.5,0.524,0.563,0.143),(51,13.2,3.5,2.7,0.1,0.791,0.394,0.354),(52,9.9,3.9,5.4,0.1,0.876,0.43,0.322),(53,10.3,4.9,1.8,0.4,0.583,0.448,0.356),(54,25.5,4.8,4.2,0.5,0.802,0.45,0.38),(55,4.5,1.9,1.7,0.1,0.711,0.409,0.391),(56,7.3,3.6,3.4,0.3,0.741,0.444,0.259),(57,14.7,6.3,1.5,0.5,0.824,0.425,0.344),(58,11.3,9.4,1.2,0.8,0.737,0.534,0.207),(59,5.1,2.5,0.5,1.3,0.533,0.701,NULL),(60,4.9,2,1.1,0.4,0.78,0.467,0.381),(61,6.8,2.1,1.2,0.2,0.75,0.409,0.336),(62,6,2.3,0.9,0.7,0.714,0.439,0.287),(63,7.8,3.9,0.9,0.3,0.59,0.457,0.316),(64,3.9,4.6,0.7,0.1,0.783,0.63,0),(65,11.9,3.4,1.8,0.4,0.704,0.443,0.387),(68,13,5.6,1.8,0.7,0.809,0.424,0.33),(69,18.2,3.4,7.5,0.2,0.82,0.382,0.373),(70,18,4.4,4.1,0.2,0.874,0.423,0.407),(71,12.2,5.4,2.1,0.8,0.647,0.455,0.374),(72,11.1,7.1,1.5,0.4,0.682,0.524,0.24),(73,10.3,2.9,2.1,0.3,0.82,0.434,0.284),(74,7.4,5.8,0.9,0.9,0.603,0.543,NULL),(75,5,3.3,2,0.2,0.646,0.43,0.234),(76,5.7,2.6,1.3,0.1,0.66,0.348,0.284),(77,6.1,4.3,0.9,0.2,0.627,0.532,0.227),(78,3.6,4.5,3,0.4,0.9,0.346,0.286),(79,6.2,2.1,1.3,0.4,0.81,0.44,0.541),(80,5.6,4.1,0.8,0.2,0.824,0.471,0.375),(81,0.5,0,0.3,0,1,0,0),(84,20.8,3.1,3,0.1,0.846,0.472,0.38),(85,11,3.6,2.4,0.2,0.67,0.437,0.383),(86,12.3,1.9,3.9,0.1,0.875,0.401,0.355),(87,12,10.1,2.1,0.9,0.615,0.512,0.391),(88,3.1,1.3,3.2,0,0.865,0.354,0.231),(89,17.6,9.8,3.2,0.3,0.854,0.45,0.374),(90,10.1,7.3,2.2,0.4,0.676,0.531,0.352),(91,10,3.2,2.2,0.3,0.723,0.442,0.335),(92,4.6,2.8,0.4,0.2,0.71,0.427,0.215),(93,5.6,2.3,1.4,0.3,0.732,0.479,0.351),(94,4.4,3,0.3,0.2,0.737,0.569,NULL),(96,17.5,11.1,1.8,1.4,0.513,0.552,0.286),(101,9.2,5.4,1.2,1.2,0.863,0.459,0.374),(102,7.3,4,3.4,0.3,0.789,0.47,0.385),(103,9.3,5.5,1.5,0.6,0.722,0.468,0.374),(104,15.8,3.1,2,0.1,0.801,0.437,0.407),(105,12.6,2.4,2,0.1,0.841,0.5,0.453),(106,5.7,2.4,0.8,0.2,0.818,0.399,0.298),(107,8.2,2.4,3.3,0.1,0.813,0.466,0.358),(108,28.7,9.3,8.7,0.2,0.752,0.461,0.318),(109,19.2,9.5,1.7,2.1,0.776,0.42,0.349),(110,9.4,5.7,1.5,0.6,0.667,0.638,0.256),(111,6.3,4.1,0.4,0.2,0.766,0.555,0.267),(112,7.5,1.8,3.8,0.1,0.944,0.413,0.382),(113,4.5,1.3,0.5,0.3,0.857,0.488,0.447),(114,5.2,4.6,0.8,0.8,0.556,0.689,0),(115,4,2.9,0.8,0.3,0.778,0.34,0.294),(118,20.2,10.2,6.9,0.7,0.813,0.528,0.314),(119,8.4,1.7,3.5,0.2,0.823,0.459,0.375),(120,11.6,3.5,1.2,0.8,0.744,0.471,0.4),(121,15.1,6.3,3.7,0.5,0.767,0.45,0.375),(122,10.4,2.9,2.1,0.3,0.815,0.42,0.333),(123,18.8,3.9,4.8,0.3,0.893,0.455,0.345),(124,7.2,5.3,2.4,0.6,0.536,0.617,0),(125,5,3.1,0.7,0.6,0.645,0.462,0.33),(126,7.5,4.1,0.7,0.4,0.767,0.495,0.422),(127,12,5.9,1.6,0.6,0.833,0.486,0.44),(129,1.2,0.7,0.2,0.1,1,0.4,0.167),(130,2,1.8,0.3,0,0.5,1,1),(131,3.5,1,0,0.5,0.75,1,NULL),(132,0,0,0,0,NULL,0,0),(134,10.3,2.3,1.5,0.2,0.859,0.435,0.399),(135,13.1,6.3,1,0.9,0.744,0.567,0.386),(136,4.7,2.8,0.7,0.7,0.664,0.482,0.344),(137,8,1.9,2.2,0.3,1,0.445,0.402),(138,8.9,4.7,4,0.5,0.739,0.443,0.344),(139,9,1.9,1.9,0.1,0.814,0.41,0.404),(140,18.1,2.4,5.6,0.3,0.871,0.49,0.306),(141,6.4,3.1,0.5,0.2,0.674,0.39,0.286),(142,15.8,3.5,4.1,0.2,0.893,0.442,0.399),(143,15.5,4.7,3.3,0.4,0.776,0.352,0.243),(144,5,3.9,1.5,1.1,0.515,0.508,0.194),(147,4.9,1.3,1.9,0.1,0.308,0.326,0.297),(148,2.1,0.1,0.4,0,0.5,0.294,0.357),(149,2.3,1.3,1,0.3,0.75,0.333,0.5),(150,14,4.6,2.1,0.2,0.774,0.497,0.287),(151,9.3,6.2,1.9,1.1,0.769,0.545,0.205),(152,8.8,2.1,2.4,0.2,0.798,0.333,0.279),(153,12.7,4.9,2.7,0.1,0.873,0.417,0.356),(154,7.4,2.7,2.9,0.2,0.829,0.417,0.308),(155,8,6.2,6.2,0.8,0.759,0.389,0.279),(156,3.4,3.3,1,0.3,0.75,0.367,0.071),(157,4.2,1.9,0.9,0.3,0.842,0.5,0.231),(158,5.3,4,2,0.4,0.6,0.46,0.348),(159,19.4,4.6,3.6,1.4,0.672,0.457,0.339),(160,9,5.9,2.1,0.4,0.727,0.437,0.324),(161,11,3.3,1.1,0.1,0.75,0.388,0.308),(162,20.8,5.2,6.6,0.4,1,0.402,0.245),(163,1.7,0.7,1.7,0,0.833,0,0),(165,7.1,6.9,1.6,0.5,0.841,0.433,0.37),(166,9.8,2.2,0.9,0.2,0.758,0.445,0.395),(167,34.4,6.4,7.4,0.9,0.861,0.435,0.352),(168,8.5,2.4,1.6,0.2,0.667,0.421,0.358),(169,10.2,4.2,1.3,0.6,0.8,0.427,0.363),(170,27.5,8,7,0.3,0.777,0.474,0.254),(171,2.2,2.3,0.6,0.3,0.375,0.407,0.278),(172,14.5,1.9,1.5,0.4,0.757,0.37,0.319),(173,4.9,0.8,0.8,0.2,0.857,0.405,0.351),(174,1.3,2.5,0.2,0.3,0.462,0.778,NULL),(175,4.7,3.9,0.8,0.5,0.679,0.657,0),(176,12.8,7.9,1.3,2.5,0.786,0.421,0.357),(177,10.4,3.2,1.2,0.5,0.8,0.621,0.412),(179,6.7,2.7,1.2,0.3,0.75,0.48,0.286),(180,2,1.8,0.4,0.8,1,0.5,0),(182,8.4,3.2,1.3,0.6,0.78,0.44,0.424),(183,6.5,2.6,5,0.2,0.833,0.517,0.333),(184,18.5,12.4,5,0.5,0.723,0.54,0.254),(185,10.4,2.5,1.1,0.1,0.827,0.491,0.445),(186,18.7,4,1.4,0.4,0.812,0.529,0.375),(187,9.4,2.3,3.3,0.2,0.861,0.407,0.394),(188,11.8,6.5,1.1,2.2,0.75,0.451,0.336),(189,3.1,2,0.4,0.7,0.727,0.473,0.167),(190,16.3,4.7,7.1,0.2,0.895,0.439,0.313),(191,12.5,4.3,2.1,0.5,0.836,0.451,0.335),(192,4.2,2.3,0.3,0.3,0.55,0.593,0.154),(193,4.6,1.5,1.6,0.3,0.667,0.423,0.263),(194,2.9,2.6,0.2,0.1,0.583,0.435,0.357),(195,13.8,3.2,3,0.2,0.78,0.391,0.304),(196,1.4,1.4,0.2,0,0.667,0.467,NULL),(199,8,7.2,1.1,0.9,0.759,0.601,0),(200,18.6,7.1,1.7,1.1,0.658,0.58,0),(201,18.7,3.1,5.7,0.2,0.863,0.416,0.363),(202,6.5,6.3,0.8,0.4,0.727,0.414,0.363),(203,26.9,7.3,5,0.6,0.889,0.469,0.366),(204,4.6,2.4,0.6,0.1,0.794,0.404,0.387),(205,3.2,2.6,0.6,0.2,0.536,0.391,0.278),(206,7.9,5.4,3.7,0.5,0.659,0.428,0.379),(207,9.7,1.9,1.9,0.2,0.905,0.416,0.392),(208,21,5.7,3.9,0.5,0.882,0.432,0.399),(209,1.6,0.9,1.1,0.1,0.75,0.407,0.25),(212,9.5,4,1.5,0.8,0.818,0.386,0.283),(213,3.5,0.9,0.2,0.2,1,0.438,0.45),(214,14.9,2.9,5.1,0.1,0.788,0.384,0.378),(216,9.5,2.1,1.7,0.2,0.779,0.472,0.394),(217,7.5,7.4,0.7,1.2,0.494,0.732,0.6),(218,8.2,3.4,1.4,0.5,0.727,0.419,0.378),(219,6.8,5.8,0.6,1.5,0.653,0.64,0.5),(220,25.7,7.9,10.6,0.5,0.697,0.498,0.349),(221,5.4,1.9,1.8,0.3,0.763,0.423,0.355),(222,26.7,9.4,3.1,2.4,0.845,0.511,0.335),(223,12.5,4.5,1.3,0.4,0.738,0.432,0.297),(224,8.6,2.3,1.3,0.1,0.833,0.444,0.364),(225,7.1,3,5,0,0.659,0.418,0.328),(226,1.5,1.1,0.5,0.1,1,0.4,0.471),(227,4.8,1.1,1.1,0,0.667,0.439,0.379),(228,11,3.9,1.6,0.3,0.772,0.45,0.397),(230,0,0,1,0,NULL,0,0),(232,9.3,3.7,1,0.7,0,0.385,0.471),(233,15.7,3.3,2,0.4,0.809,0.402,0.369),(234,7.4,1.6,4.4,0.1,0.741,0.459,0.379),(235,14.9,11.2,1.8,1.1,0.732,0.586,0.367),(236,17.6,3.5,6.9,0.3,0.77,0.491,0.367),(237,5.7,4.4,2.2,0.5,0.652,0.493,0.258),(238,16.9,4.7,1.4,1.6,0.741,0.468,0.397),(239,8.1,3.7,3,0.3,0.821,0.419,0.316),(240,12,5.8,1.4,0.8,0.785,0.623,0.404),(241,4,1.7,1.1,0.2,0.92,0.396,0.309),(242,7.4,2.2,1.4,0,0.857,0.449,0.363),(243,10.4,3.2,1.7,0.5,0.659,0.439,0.319),(246,7.3,6.7,1.1,1.2,0.583,0.515,0.227),(247,11.3,6.6,4,0.5,0.667,0.388,0.222),(249,16.2,10.5,5.1,1.3,0.69,0.567,0.077),(250,13.3,3.3,1.4,0.2,0.906,0.467,0.448),(251,15.6,2.7,3.4,0.2,0.837,0.448,0.362),(252,7.7,4.4,1.6,0.3,0.854,0.476,0.432),(253,20.2,6.6,6.1,0.5,0.833,0.454,0.248),(254,16.1,3.1,5.1,0.1,0.769,0.437,0.377),(255,8.9,4.2,1.1,0.7,0.779,0.514,0.27),(256,6.1,5.1,1.1,0.3,0.654,0.52,0.429),(257,12.9,4,1.9,0.1,0.835,0.414,0.391),(258,2.9,2.7,0.5,0.4,0.694,0.623,0),(259,4.4,3.8,2,1.1,0.25,0.49,0.375),(260,9.9,6.2,2.8,0.3,0.789,0.368,0.293),(261,5.7,3,2,0.1,0.684,0.412,0.381),(263,1.4,1,0.2,0.2,0.5,0.6,0),(264,1.7,2.7,0.3,0,0.75,0.167,0),(266,7.5,2.6,1.5,0.1,0.762,0.397,0.365),(267,11,4.5,1.6,2.4,0.81,0.427,0.296),(268,5.1,4.2,1.6,0.5,0.75,0.456,0.321),(269,5.5,2.4,0.7,0.7,0.535,0.502,0.344),(270,9.4,4.9,2.3,0.3,0.769,0.462,0.344),(271,29.6,13.7,5.8,1,0.633,0.547,0.306),(272,15.4,4.6,5.4,0.4,0.813,0.482,0.348),(273,6.8,4.9,0.8,0.3,0.827,0.472,0.371),(274,21.1,6.2,4.1,0.1,0.908,0.499,0.418),(275,9.6,3,2.9,0.1,0.831,0.53,0.48),(276,6.7,2.1,1.2,0.2,0.824,0.429,0.415),(277,5,3.7,1,0.2,0.771,0.367,0.316),(278,3.2,2.2,0.7,0.2,0.667,0.396,0.255),(279,2.5,1.1,0.5,0.1,0.467,0.528,0),(280,6.7,2.7,1,0.5,0.86,0.448,0.376),(283,9.2,3.4,1.7,0.6,0.462,0.404,0.299),(284,8.6,4.3,1.6,0.4,0.796,0.427,0.266),(285,26.5,10.8,4.4,1.2,0.796,0.508,0.412),(287,9,4.1,1.2,0.7,0.698,0.412,0.33),(289,9.1,2.5,0.7,0.4,0.75,0.453,0.333),(290,3.8,0.9,1.3,0.1,0.941,0.358,0.115),(291,7.9,1.9,1.2,0.1,0.868,0.389,0.36),(292,3.1,2.8,0.6,0.1,0.64,0.345,0.25),(293,5.7,2.9,1.2,0.7,0.571,0.448,0.356),(294,23.6,3.7,6.2,0.3,0.785,0.43,0.374),(295,1.1,0.9,0.2,0.1,NULL,0.714,NULL),(296,4.7,1.5,1.1,0.4,0.862,0.338,0.342),(297,3.3,2,2,0.4,0.857,0.373,0),(298,7.6,4.5,1,0.5,0.793,0.431,0.391),(299,10.2,6.5,1.6,0.4,0.747,0.416,0.342),(300,24.3,6.3,4.3,0.7,0.858,0.466,0.387),(301,12.4,6.2,7,0.5,0.567,0.412,0.383),(302,7.5,4,0.9,0.9,0.63,0.66,0.25),(303,19.6,4.9,6.9,0.8,0.7,0.452,0.357),(304,14.9,2.6,2,0.2,0.902,0.45,0.452),(305,6.8,3,1.3,0.4,0.733,0.442,0.361),(306,8.6,2.4,1.4,0.2,0.674,0.424,0.375),(307,5.6,1.4,0.8,0.1,0.75,0.385,0.325),(308,9.2,9.9,1.7,1,0.581,0.62,0.143),(309,5.1,2,1.8,0.2,0.607,0.339,0.342),(310,3.8,5.1,1.5,0.6,0.375,0.343,0.26),(311,7.6,4.3,1.3,0.7,0.638,0.611,0.5),(312,23.6,6.8,2.2,0.5,0.645,0.589,0.462),(316,10.1,5.1,1.5,0.3,0.763,0.45,0.358),(317,6.4,2.8,0.9,0.4,0.653,0.359,0.327),(318,19.5,9.7,3.1,0.3,0.733,0.46,0.277),(319,6.1,4.3,0.8,0.5,0.732,0.584,0.286),(320,9.7,7,0.6,2,0.568,0.742,NULL),(321,6.3,2.1,3,0.3,0.864,0.393,0.321),(322,14.3,5,2.6,0.3,0.614,0.402,0.32),(323,6.7,1.9,1.2,0.1,0.667,0.414,0.362),(324,10,4.7,7.2,0.4,0.57,0.439,0.203),(325,5.1,1.8,1.2,0.1,0.846,0.351,0.35),(326,5.5,2.3,2.9,0.2,0.509,0.341,0.296),(327,8.1,2.3,1.4,0.1,0.81,0.402,0.333),(328,6.5,1.2,1.2,0.2,0.791,0.481,0.358),(329,5.5,4,1,0.6,0.571,0.516,0.37),(331,1.9,0.6,0.4,0.1,0.8,0.273,0.111),(333,19.3,6.1,3.3,0.7,0.801,0.473,0.351),(334,19,3.7,4.1,0.2,0.839,0.468,0.381),(335,17.7,4.9,6.8,0.1,0.9,0.489,0.362),(336,10.9,9.4,2.4,1.1,0.59,0.591,0.333),(337,19.2,5.5,2.1,0.1,0.886,0.439,0.409),(338,7.7,4.9,1,1.5,0.765,0.685,0.333),(339,4.5,3.7,0.5,0.7,0.681,0.383,0.3),(340,4.2,1.5,0.9,0.3,0.789,0.372,0.297),(341,6,1.9,0.7,0.4,0.774,0.455,0.371),(342,4.6,2.3,0.8,0.3,0.818,0.403,0.358),(343,6.1,3.2,0.6,0.2,0.622,0.452,0.2),(344,2.8,1.4,0.3,0.3,0.5,0.371,0.217),(347,0,0.7,0,0,NULL,0,NULL),(349,12.1,3.3,5.2,0.2,0.723,0.473,0.254),(350,14.8,3.2,1.2,0.3,0.845,0.407,0.357),(351,18.8,2.6,3.2,0.2,0.82,0.47,0.406),(352,5.5,5,0.7,1.4,0.674,0.468,0.356),(353,14.4,7.6,3.7,0.6,0.675,0.433,0.301),(354,19.5,11,3.7,0.9,0.781,0.47,0.329),(355,10.4,2.2,4.6,0,0.885,0.393,0.345),(356,5.3,2.5,1,0.2,0.816,0.397,0.313),(357,7.2,3.3,2.4,0.5,0.828,0.434,0.294),(358,3.8,4.5,0.9,0.5,0.612,0.487,0),(359,12,6.9,1.4,2.4,0.767,0.463,0.33),(360,4.3,4.8,1.2,0.4,0.655,0.291,0.25),(361,3.9,2.2,0.7,0.4,0.857,0.39,0.353),(362,1.2,0.3,0.1,0.1,0.5,0.353,0.571),(363,6.8,4.1,1.1,0.5,0.882,0.412,0.303),(366,19.4,6.8,3.2,0.5,0.806,0.472,0.362),(367,9.7,2.3,1.1,0.2,0.736,0.432,0.397),(368,5.7,3.6,0.8,0.1,0.833,0.408,0.358),(369,12,6.9,4.1,0.9,0.753,0.442,0.337),(370,4.7,1.5,1.2,0.7,0.61,0.41,0.352),(371,16.7,7.8,8.2,0.6,0.627,0.585,0.333),(372,4.3,1.1,1.6,0.1,0.839,0.451,0.394),(373,13.8,3.4,3.1,0.7,0.789,0.429,0.327),(374,23.4,11.8,3.1,1.3,0.814,0.474,0.348),(375,9.5,2.1,2.2,0.2,0.765,0.498,0.453),(376,3.3,3.8,1.3,0.8,0.526,0.486,0.304),(377,2.1,3,0.4,1.3,0.5,0.514,NULL),(378,12.9,4.7,1.8,0.3,0.851,0.481,0.4),(379,16.1,4.7,3.1,0.4,0.897,0.406,0.375),(380,1.1,0.3,0.3,0,0.5,0.273,0),(382,8.7,4,1.8,0.6,0.848,0.516,0.352),(383,26.1,4.2,6.6,0.3,0.916,0.487,0.36),(384,10.1,5.9,1.9,0.3,0.832,0.462,0.341),(385,13.1,4.6,8.9,0.2,0.853,0.412,0.351),(386,18.7,6.4,1.5,0.7,0.78,0.452,0.352),(387,4,1.6,2.1,0.1,0.687,0.398,0.352),(388,4.6,2,1.3,0.3,0.84,0.4,0.393),(389,8.1,2.9,1.1,0.3,0.761,0.418,0.397),(390,4.8,2.9,0.5,0.3,0.865,0.65,0.5),(391,11.5,5.6,1.6,0.5,0.747,0.48,0.351),(392,11,4.9,2.2,0.3,0.67,0.455,0.348),(393,19,12,1.9,1.7,0.769,0.548,0),(394,3.5,1.5,1.5,0.1,0.786,0.349,0.277),(395,2.5,0,0.5,0,1,0.4,0),(397,8.8,2.3,1.5,0.2,0.826,0.402,0.338),(398,22.5,4.1,4.3,0.6,0.75,0.453,0.38),(399,16.3,14.2,1.2,3.1,0.68,0.618,0.571),(400,28.9,4.3,7.8,0.4,0.888,0.457,0.394),(401,7.7,1.7,0.9,0.2,0.833,0.426,0.388),(402,15.3,6.3,1.6,0.5,0.843,0.426,0.371),(403,3.6,2.3,0.5,0.3,0.636,0.43,0.237),(404,4.8,3.4,0.9,0.2,0.824,0.429,0.328),(405,11,4.8,2,0.4,0.872,0.491,0.4),(406,11,3.4,1.5,0.2,0.778,0.506,0.493),(407,3,4.7,1.5,0.3,0.533,0.605,0),(408,2.4,2.1,0.3,0.2,0.8,0.483,0.417),(411,9,4,2,0.7,1,0.474,0.429),(413,19.8,4.8,3.1,0.3,0.855,0.429,0.395),(414,14.7,4.8,2.4,0.2,0.803,0.459,0.383),(415,11.9,6.4,2.8,0.5,0.822,0.475,0.424),(416,6.3,2.5,3.4,0.3,0.828,0.42,0.351),(417,14.5,3.2,3.2,0.3,0.724,0.433,0.361),(418,20.4,4,6.8,0.5,0.703,0.475,0.307),(419,4.2,1.1,1.3,0.1,0.865,0.396,0.275),(420,12.8,8.3,1,1.4,0.8,0.654,NULL),(421,7,4.2,1.3,0.4,0.767,0.56,NULL),(422,2.5,0.9,0.5,0.3,0.476,0.423,0.346),(423,7.9,4,1.4,0.7,0.806,0.347,0.327),(424,14.2,7.5,0.8,0.9,0.806,0.467,0.182),(425,8.7,5.8,1.1,0.8,0.63,0.546,0.25),(428,15,6,1.8,0.5,0.736,0.504,0.27),(429,11.7,1.6,1.8,0.1,0.861,0.429,0.38),(430,11.2,2,1.7,0,0.833,0.417,0.388),(431,6.4,5.7,1.1,0.4,0.733,0.446,0.387),(432,22.2,5.6,5.6,0.2,0.843,0.526,0.267),(433,10.4,3.2,3.4,0.9,0.857,0.459,0.356),(434,10,5.4,1.7,0.5,0.876,0.442,0.314),(435,10.7,5.8,4.1,0.3,0.798,0.475,0.378),(436,5.3,5.3,1.8,1.4,0.486,0.619,NULL),(437,18.9,7.4,2.4,1.6,0.827,0.493,0.389),(438,5.6,2.2,0.9,0.2,0.717,0.434,0.408),(439,5.8,1.7,1.2,0,0.78,0.391,0.368),(440,2.9,1.6,0.4,0.3,0.75,0.571,0),(442,4.6,1.9,0.7,0.1,0.7,0.516,0.4),(444,0,2,3,0,NULL,0,0),(445,7.7,3.4,1.7,0.2,0.865,0.463,0.396),(446,10.7,5.4,1.6,0.7,0.686,0.507,0.381),(447,6.3,4.4,0.4,1,0.796,0.458,0.283),(448,23.6,7.5,3.6,0.9,0.8,0.459,0.359),(449,19.7,4.8,7.7,0.4,0.861,0.417,0.354),(450,7.2,4.9,1.7,0.4,0.736,0.471,0.118),(451,16,8.3,1.5,0.8,0.748,0.518,0.398),(452,17.6,3.8,6.6,0.3,0.843,0.409,0.388),(453,16.4,3.7,1.8,0.4,0.838,0.502,0.398),(454,4.6,2.3,2.1,0.1,0.722,0.414,0.324),(455,7.6,6.3,3.4,0.9,0.722,0.419,0.402),(456,4.5,1.5,0.5,0,0.7,0.486,0.467),(457,0.9,0.6,0.3,0.1,0.167,0.333,0.316),(458,1.2,1.1,0.4,0.1,0.833,0.258,0.154),(460,1,1.8,0,0,1,0.2,0),(462,9.8,4,5.2,0.1,0.774,0.441,0.397),(463,6.3,5.3,2.5,0.4,0.735,0.439,0.389),(464,24.2,4.4,4.2,0.2,0.859,0.453,0.364),(465,20.2,4.1,2.1,0.1,0.903,0.447,0.414),(466,15.1,13.7,1.5,2,0.621,0.698,NULL),(467,5.8,1.9,0.6,0.1,0.864,0.453,0.416),(468,4.7,4.3,0.3,0.5,0.65,0.665,1),(469,7.3,2.4,2.2,0.2,0.754,0.471,0.355),(470,13.8,3.2,4.3,0.1,0.795,0.405,0.376),(471,14.6,2.4,2.4,0.3,0.884,0.442,0.371),(472,1.3,3.8,0.3,0.4,0.455,0.412,NULL),(473,1.2,1.2,0.1,0.1,NULL,0.529,0.2),(474,1.4,0.9,0.1,0,0.6,0.421,0),(475,0.4,0.6,0.6,0.1,1,0.143,0),(476,0,0.4,0,0,NULL,0,0),(479,9.7,5.3,2.3,0.1,0.754,0.453,0.345),(480,10.5,3.2,4.8,0.4,0.686,0.451,0.367),(481,4.6,3.2,1.1,0.4,0.813,0.522,0.4),(482,30.5,4.2,6.1,0.4,0.842,0.455,0.353),(483,15.4,4.5,1.7,0.6,0.852,0.434,0.424),(484,13.4,6,1.7,0.2,0.829,0.478,0.274),(485,12.1,6.8,1.9,0.9,0.737,0.599,0.407),(486,7.4,5.7,1.3,1.2,0.619,0.495,0.192),(487,9.5,5.2,1.3,0.5,0.817,0.575,0.343),(488,3.9,2.8,1.7,0.2,0.5,0.414,0.283),(489,3.1,1.3,0.5,0.1,0.692,0.4,0.298),(490,6,4.1,0.7,0.5,0.593,0.528,0),(492,9.6,3.1,5.2,0.2,0.818,0.403,0.296),(493,2.9,1.4,1.1,0.2,0.579,0.338,0.284),(494,0,0,0,0,0,0,0),(495,0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `player_stats` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `player_stats_AFTER_INSERT` AFTER INSERT ON `player_stats` FOR EACH ROW BEGIN
	CALL recalculateRatings();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `player_stats_AFTER_UPDATE` AFTER UPDATE ON `player_stats` FOR EACH ROW BEGIN
	CALL recalculateRatings();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `player_stats_AFTER_DELETE` AFTER DELETE ON `player_stats` FOR EACH ROW BEGIN
	CALL recalculateRatings();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `plays_for`
--

DROP TABLE IF EXISTS `plays_for`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plays_for` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Team_City` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`,`Team_City`),
  KEY `Team_Name_idx` (`Team_City`),
  CONSTRAINT `PLAYER_ID2` FOREIGN KEY (`ID`) REFERENCES `player` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Team_City` FOREIGN KEY (`Team_City`) REFERENCES `team` (`Team_City`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=496 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plays_for`
--

LOCK TABLES `plays_for` WRITE;
/*!40000 ALTER TABLE `plays_for` DISABLE KEYS */;
INSERT INTO `plays_for` VALUES (1,'ATL'),(2,'ATL'),(3,'ATL'),(4,'ATL'),(5,'ATL'),(6,'ATL'),(7,'ATL'),(8,'ATL'),(9,'ATL'),(10,'ATL'),(11,'ATL'),(12,'ATL'),(13,'ATL'),(14,'ATL'),(15,'ATL'),(16,'ATL'),(17,'BOS'),(18,'BOS'),(19,'BOS'),(20,'BOS'),(21,'BOS'),(22,'BOS'),(23,'BOS'),(24,'BOS'),(25,'BOS'),(26,'BOS'),(27,'BOS'),(28,'BOS'),(29,'BOS'),(30,'BOS'),(31,'BOS'),(32,'BOS'),(33,'BOS'),(34,'BRK'),(35,'BRK'),(36,'BRK'),(37,'BRK'),(38,'BRK'),(39,'BRK'),(40,'BRK'),(41,'BRK'),(42,'BRK'),(43,'BRK'),(44,'BRK'),(45,'BRK'),(46,'BRK'),(47,'BRK'),(48,'BRK'),(49,'BRK'),(50,'BRK'),(68,'CHA'),(69,'CHA'),(70,'CHA'),(71,'CHA'),(72,'CHA'),(73,'CHA'),(74,'CHA'),(75,'CHA'),(76,'CHA'),(77,'CHA'),(78,'CHA'),(79,'CHA'),(80,'CHA'),(81,'CHA'),(82,'CHA'),(83,'CHA'),(51,'CHI'),(52,'CHI'),(53,'CHI'),(54,'CHI'),(55,'CHI'),(56,'CHI'),(57,'CHI'),(58,'CHI'),(59,'CHI'),(60,'CHI'),(61,'CHI'),(62,'CHI'),(63,'CHI'),(64,'CHI'),(65,'CHI'),(66,'CHI'),(67,'CHI'),(84,'CLE'),(85,'CLE'),(86,'CLE'),(87,'CLE'),(88,'CLE'),(89,'CLE'),(90,'CLE'),(91,'CLE'),(92,'CLE'),(93,'CLE'),(94,'CLE'),(95,'CLE'),(96,'CLE'),(98,'CLE'),(99,'CLE'),(100,'CLE'),(101,'DAL'),(102,'DAL'),(103,'DAL'),(104,'DAL'),(105,'DAL'),(106,'DAL'),(107,'DAL'),(108,'DAL'),(109,'DAL'),(110,'DAL'),(111,'DAL'),(112,'DAL'),(113,'DAL'),(114,'DAL'),(115,'DAL'),(116,'DAL'),(117,'DAL'),(118,'DEN'),(119,'DEN'),(120,'DEN'),(121,'DEN'),(122,'DEN'),(123,'DEN'),(124,'DEN'),(125,'DEN'),(126,'DEN'),(127,'DEN'),(128,'DEN'),(129,'DEN'),(130,'DEN'),(131,'DEN'),(132,'DEN'),(133,'DEN'),(134,'DET'),(135,'DET'),(136,'DET'),(137,'DET'),(138,'DET'),(139,'DET'),(140,'DET'),(141,'DET'),(142,'DET'),(143,'DET'),(144,'DET'),(145,'DET'),(146,'DET'),(147,'DET'),(148,'DET'),(149,'DET'),(150,'GSW'),(151,'GSW'),(152,'GSW'),(153,'GSW'),(154,'GSW'),(155,'GSW'),(156,'GSW'),(157,'GSW'),(158,'GSW'),(159,'GSW'),(160,'GSW'),(161,'GSW'),(162,'GSW'),(163,'GSW'),(164,'GSW'),(165,'HOU'),(166,'HOU'),(167,'HOU'),(168,'HOU'),(169,'HOU'),(170,'HOU'),(171,'HOU'),(172,'HOU'),(173,'HOU'),(174,'HOU'),(175,'HOU'),(176,'HOU'),(177,'HOU'),(178,'HOU'),(179,'HOU'),(180,'HOU'),(181,'HOU'),(182,'IND'),(183,'IND'),(184,'IND'),(185,'IND'),(186,'IND'),(187,'IND'),(188,'IND'),(189,'IND'),(190,'IND'),(191,'IND'),(192,'IND'),(193,'IND'),(194,'IND'),(195,'IND'),(196,'IND'),(197,'IND'),(198,'IND'),(199,'LAC'),(200,'LAC'),(201,'LAC'),(202,'LAC'),(203,'LAC'),(204,'LAC'),(205,'LAC'),(206,'LAC'),(207,'LAC'),(208,'LAC'),(209,'LAC'),(210,'LAC'),(211,'LAC'),(212,'LAC'),(213,'LAC'),(214,'LAC'),(215,'LAC'),(216,'LAL'),(217,'LAL'),(218,'LAL'),(219,'LAL'),(220,'LAL'),(221,'LAL'),(222,'LAL'),(223,'LAL'),(224,'LAL'),(225,'LAL'),(226,'LAL'),(227,'LAL'),(228,'LAL'),(229,'LAL'),(230,'LAL'),(231,'LAL'),(232,'LAL'),(233,'MEM'),(234,'MEM'),(235,'MEM'),(236,'MEM'),(237,'MEM'),(238,'MEM'),(239,'MEM'),(240,'MEM'),(241,'MEM'),(242,'MEM'),(243,'MEM'),(244,'MEM'),(245,'MEM'),(246,'MEM'),(247,'MEM'),(248,'MEM'),(249,'MIA'),(250,'MIA'),(251,'MIA'),(252,'MIA'),(253,'MIA'),(254,'MIA'),(255,'MIA'),(256,'MIA'),(257,'MIA'),(258,'MIA'),(259,'MIA'),(260,'MIA'),(261,'MIA'),(262,'MIA'),(263,'MIA'),(264,'MIA'),(265,'MIA'),(266,'MIL'),(267,'MIL'),(268,'MIL'),(269,'MIL'),(270,'MIL'),(271,'MIL'),(272,'MIL'),(273,'MIL'),(274,'MIL'),(275,'MIL'),(276,'MIL'),(277,'MIL'),(278,'MIL'),(279,'MIL'),(280,'MIL'),(281,'MIL'),(282,'MIL'),(283,'MIN'),(284,'MIN'),(285,'MIN'),(286,'MIN'),(287,'MIN'),(288,'MIN'),(289,'MIN'),(290,'MIN'),(291,'MIN'),(292,'MIN'),(293,'MIN'),(294,'MIN'),(295,'MIN'),(296,'MIN'),(297,'MIN'),(298,'MIN'),(299,'NOP'),(300,'NOP'),(301,'NOP'),(302,'NOP'),(303,'NOP'),(304,'NOP'),(305,'NOP'),(306,'NOP'),(307,'NOP'),(308,'NOP'),(309,'NOP'),(310,'NOP'),(311,'NOP'),(312,'NOP'),(313,'NOP'),(314,'NOP'),(315,'NOP'),(316,'NYK'),(317,'NYK'),(318,'NYK'),(319,'NYK'),(320,'NYK'),(321,'NYK'),(322,'NYK'),(323,'NYK'),(324,'NYK'),(325,'NYK'),(326,'NYK'),(327,'NYK'),(328,'NYK'),(329,'NYK'),(330,'NYK'),(331,'NYK'),(332,'NYK'),(333,'OKC'),(334,'OKC'),(335,'OKC'),(336,'OKC'),(337,'OKC'),(338,'OKC'),(339,'OKC'),(340,'OKC'),(341,'OKC'),(342,'OKC'),(343,'OKC'),(344,'OKC'),(345,'OKC'),(346,'OKC'),(347,'OKC'),(348,'OKC'),(349,'ORL'),(350,'ORL'),(351,'ORL'),(352,'ORL'),(353,'ORL'),(354,'ORL'),(355,'ORL'),(356,'ORL'),(357,'ORL'),(358,'ORL'),(359,'ORL'),(360,'ORL'),(361,'ORL'),(362,'ORL'),(363,'ORL'),(364,'ORL'),(365,'ORL'),(366,'PHI'),(367,'PHI'),(368,'PHI'),(369,'PHI'),(370,'PHI'),(371,'PHI'),(372,'PHI'),(373,'PHI'),(374,'PHI'),(375,'PHI'),(376,'PHI'),(377,'PHI'),(378,'PHI'),(379,'PHI'),(380,'PHI'),(381,'PHI'),(382,'PHO'),(383,'PHO'),(384,'PHO'),(385,'PHO'),(386,'PHO'),(387,'PHO'),(388,'PHO'),(389,'PHO'),(390,'PHO'),(391,'PHO'),(392,'PHO'),(393,'PHO'),(394,'PHO'),(395,'PHO'),(396,'PHO'),(397,'POR'),(398,'POR'),(399,'POR'),(400,'POR'),(401,'POR'),(402,'POR'),(403,'POR'),(404,'POR'),(405,'POR'),(406,'POR'),(407,'POR'),(408,'POR'),(409,'POR'),(410,'POR'),(411,'POR'),(412,'POR'),(413,'SAC'),(414,'SAC'),(415,'SAC'),(416,'SAC'),(417,'SAC'),(418,'SAC'),(419,'SAC'),(420,'SAC'),(421,'SAC'),(422,'SAC'),(423,'SAC'),(424,'SAC'),(425,'SAC'),(426,'SAC'),(427,'SAC'),(428,'SAC'),(429,'SAS'),(430,'SAS'),(431,'SAS'),(432,'SAS'),(433,'SAS'),(434,'SAS'),(435,'SAS'),(436,'SAS'),(437,'SAS'),(438,'SAS'),(439,'SAS'),(440,'SAS'),(441,'SAS'),(442,'SAS'),(443,'SAS'),(444,'SAS'),(445,'TOR'),(446,'TOR'),(447,'TOR'),(448,'TOR'),(449,'TOR'),(450,'TOR'),(451,'TOR'),(452,'TOR'),(453,'TOR'),(454,'TOR'),(455,'TOR'),(456,'TOR'),(457,'TOR'),(458,'TOR'),(459,'TOR'),(460,'TOR'),(461,'TOR'),(462,'UTA'),(463,'UTA'),(464,'UTA'),(465,'UTA'),(466,'UTA'),(467,'UTA'),(468,'UTA'),(469,'UTA'),(470,'UTA'),(471,'UTA'),(472,'UTA'),(473,'UTA'),(474,'UTA'),(475,'UTA'),(476,'UTA'),(477,'UTA'),(478,'UTA'),(479,'WAS'),(480,'WAS'),(481,'WAS'),(482,'WAS'),(483,'WAS'),(484,'WAS'),(485,'WAS'),(486,'WAS'),(487,'WAS'),(488,'WAS'),(489,'WAS'),(490,'WAS'),(491,'WAS'),(492,'WAS'),(493,'WAS'),(494,'WAS'),(495,'WAS');
/*!40000 ALTER TABLE `plays_for` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recommended`
--

DROP TABLE IF EXISTS `recommended`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recommended` (
  `ID` int NOT NULL,
  `Rating` double DEFAULT '0',
  PRIMARY KEY (`ID`),
  CONSTRAINT `Recommended_ID` FOREIGN KEY (`ID`) REFERENCES `player` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recommended`
--

LOCK TABLES `recommended` WRITE;
/*!40000 ALTER TABLE `recommended` DISABLE KEYS */;
INSERT INTO `recommended` VALUES (1,2.199999999666665),(2,16.766666666333336),(3,27.833333333666666),(4,3.9999999996666658),(5,1.2999999996666667),(6,10.199999999666668),(7,9.233333333666666),(8,9.033333333666667),(9,9.100000000333335),(10,7.399999999666666),(11,14.133333333666666),(12,11.533333333666667),(13,9.733333333666668),(14,14.499999999666667),(15,4.400000000333335),(16,9.033333333666667),(17,6.899999999666666),(18,10.999999999666667),(19,10.733333333666666),(20,11.100000000333335),(21,4.533333333666666),(22,4.000000000333334),(23,11.633333333666666),(24,14.700000000333333),(25,8.900000000333332),(26,11.800000000333334),(27,11.599999999666666),(28,11.499999999666667),(29,11.899999999666667),(30,9.199999999666668),(31,12.599999999666666),(32,14.499999999666667),(33,14.499999999666667),(34,11.100000000333335),(35,2.7333333336666668),(36,3.2333333336666668),(37,4.400000000333335),(38,14.533333333666665),(39,10.533333333666665),(40,6.2000000003333335),(41,8.533333333666667),(42,9.299999999666666),(43,16.933333333666667),(44,9.299999999666666),(45,9.899999999666667),(46,20.900000000333332),(47,10.099999999666666),(48,13.499999999666667),(49,14.499999999666667),(50,23.833333333666666),(51,1.3666666663333331),(52,4.933333333666666),(53,13.533333333666665),(54,16.000000000333333),(55,9.333333333666666),(56,7.533333333666667),(57,2.2000000003333335),(58,2.199999999666665),(59,9.399999999666667),(60,8.933333333666665),(61,7.033333333666667),(62,7.833333333666666),(63,5.699999999666666),(64,11.933333333666667),(65,5.933333333666666),(66,14.499999999666667),(67,14.499999999666667),(68,0.499999999666666),(69,5.366666666333333),(70,7.500000000333334),(71,2.2999999996666665),(72,6.733333333666667),(73,3.5333333336666657),(74,12.433333333666667),(75,9.499999999666667),(76,8.133333333666666),(77,8.733333333666666),(78,19.233333333666664),(79,8.299999999666666),(80,8.899999999666667),(81,12.999999999666667),(82,13.833333333666666),(83,13.499999999666667),(84,7.966666666333334),(85,2.8333333336666664),(86,2.199999999666665),(87,7.833333333666666),(88,14.733333333666668),(89,14.100000000333335),(90,5.733333333666667),(91,4.499999999666666),(92,9.233333333666666),(93,10.233333333666668),(94,9.433333333666665),(95,14.499999999666667),(96,10.000000000333333),(98,14.499999999666667),(99,13.499999999666667),(100,14.499999999666667),(101,4.633333333666667),(102,8.533333333666667),(103,5.533333333666666),(104,7.300000000333335),(105,4.233333333666667),(106,8.133333333666666),(107,5.2999999996666665),(108,15.866666666333334),(109,7.7000000003333335),(110,7.433333333666666),(111,9.533333333666667),(112,17.333333333666666),(113,18.333333333666666),(114,10.633333333666666),(115,14.833333333666666),(116,13.499999999666667),(117,14.499999999666667),(118,9.700000000333333),(119,5.433333333666666),(120,5.233333333666667),(121,7.600000000333334),(122,6.433333333666666),(123,7.300000000333335),(124,10.633333333666666),(125,8.833333333666666),(126,6.999999999666666),(127,12.833333333666666),(128,13.833333333666666),(129,13.299999999666667),(130,14.833333333666666),(131,9.999999999666667),(132,17.833333333666666),(133,14.499999999666667),(134,6.533333333666666),(135,1.7333333336666665),(136,10.133333333666664),(137,9.833333333666666),(138,4.599999999666665),(139,4.499999999666666),(140,13.600000000333335),(141,8.099999999666666),(142,3.300000000333335),(143,10.000000000333333),(144,13.833333333666666),(145,14.499999999666667),(146,14.499999999666667),(147,13.933333333666667),(148,11.399999999666667),(149,12.533333333666667),(150,2.1666666663333336),(151,5.533333333666666),(152,5.699999999666665),(153,1.1333333336666669),(154,7.099999999666665),(155,10.833333333666666),(156,12.433333333666667),(157,10.299999999666666),(158,9.199999999666666),(159,9.900000000333332),(160,5.833333333666666),(161,3.4999999996666658),(162,16.300000000333334),(163,12.133333333666666),(164,19.833333333666666),(165,12.733333333666668),(166,8.033333333666665),(167,29.900000000333335),(168,10.333333333666666),(169,4.633333333666667),(170,24.000000000333333),(171,22.633333333666663),(172,11.000000000333333),(173,9.599999999666666),(174,28.53333333366667),(175,8.799999999666666),(176,5.033333333666666),(177,12.433333333666665),(178,14.499999999666667),(179,15.133333333666666),(180,14.833333333666666),(181,14.499999999666667),(182,9.433333333666667),(183,9.333333333666666),(184,7.000000000333334),(185,6.433333333666666),(186,9.200000000333333),(187,4.099999999666665),(188,4.033333333666666),(189,11.399999999666667),(190,4.800000000333335),(191,6.333333333666666),(192,11.633333333666666),(193,9.233333333666666),(194,10.933333333666665),(195,5.300000000333335),(196,12.099999999666666),(197,14.499999999666667),(198,13.833333333666666),(199,6.833333333666666),(200,8.100000000333335),(201,18.200000000333333),(202,10.333333333666666),(203,20.400000000333332),(204,16.233333333666668),(205,11.633333333666664),(206,10.933333333666667),(207,3.7999999996666665),(208,15.500000000333333),(209,12.899999999666667),(210,13.833333333666666),(211,14.499999999666667),(212,10.333333333666666),(213,10.999999999666667),(214,8.400000000333335),(215,23.833333333666666),(216,8.333333333666666),(217,19.333333333666666),(218,13.633333333666666),(219,16.033333333666665),(220,27.200000000333333),(221,8.433333333666665),(222,19.200000000333333),(223,1.3333333336666662),(224,12.233333333666668),(225,17.733333333666664),(226,22.333333333666666),(227,10.033333333666667),(228,8.833333333666666),(229,13.499999999666667),(230,14.499999999666667),(231,14.499999999666667),(232,9.533333333666665),(233,3.2000000003333335),(234,8.433333333666667),(235,7.400000000333335),(236,5.766666666333335),(237,11.133333333666666),(238,4.066666666333332),(239,5.399999999666666),(240,2.4999999996666658),(241,10.499999999666667),(242,6.099999999666665),(243,3.433333333666666),(244,13.499999999666667),(245,14.499999999666667),(246,10.533333333666667),(247,4.533333333666666),(248,14.499999999666667),(249,3.7000000003333335),(250,0.46666666633333453),(251,3.7666666663333332),(252,10.133333333666666),(253,13.700000000333333),(254,12.600000000333335),(255,5.933333333666666),(256,12.733333333666668),(257,1.5999999996666656),(258,11.599999999666666),(259,22.433333333666667),(260,8.933333333666667),(261,12.133333333666666),(262,14.499999999666667),(263,13.099999999666666),(264,26.133333333666666),(265,14.499999999666667),(266,14.333333333666666),(267,11.833333333666666),(268,10.733333333666668),(269,17.333333333666666),(270,4.099999999666665),(271,21.10000000033334),(272,9.900000000333335),(273,16.033333333666665),(274,13.600000000333335),(275,13.233333333666666),(276,21.133333333666666),(277,8.833333333666666),(278,10.633333333666664),(279,10.999999999666667),(280,19.133333333666666),(281,13.833333333666666),(282,13.499999999666667),(283,5.2999999996666665),(284,4.899999999666666),(285,16.000000000333333),(286,14.499999999666667),(287,5.499999999666666),(288,14.499999999666667),(289,5.733333333666667),(290,10.699999999666668),(291,6.933333333666666),(292,11.733333333666666),(293,16.133333333666666),(294,13.100000000333335),(295,12.399999999666667),(296,8.799999999666666),(297,17.53333333366667),(298,5.899999999666666),(299,3.633333333666667),(300,12.800000000333334),(301,1.4333333336666658),(302,6.999999999666666),(303,15.100000000333335),(304,13.400000000333334),(305,7.699999999666666),(306,11.233333333666668),(307,7.899999999666666),(308,11.633333333666666),(309,9.399999999666667),(310,9.699999999666668),(311,8.233333333666668),(312,11.766666666333336),(313,14.499999999666667),(314,13.499999999666667),(315,16.833333333666666),(316,5.733333333666667),(317,7.099999999666665),(318,10.000000000333333),(319,15.733333333666666),(320,3.7999999996666665),(321,7.533333333666667),(322,2.4666666663333343),(323,7.133333333666666),(324,6.833333333666666),(325,16.733333333666664),(326,8.333333333666666),(327,9.733333333666668),(328,6.999999999666666),(329,13.333333333666666),(330,13.833333333666666),(331,12.599999999666666),(332,14.499999999666667),(333,6.466666666333334),(334,10.500000000333333),(335,17.200000000333333),(336,6.933333333666666),(337,14.700000000333333),(338,9.133333333666666),(339,9.999999999666667),(340,9.633333333666664),(341,7.833333333666666),(342,13.233333333666668),(343,7.399999999666666),(344,10.699999999666668),(345,14.499999999666667),(346,14.499999999666667),(347,14.499999999666667),(348,16.833333333666666),(349,1.7333333336666665),(350,7.300000000333335),(351,11.300000000333334),(352,7.999999999666666),(353,4.900000000333335),(354,13.000000000333333),(355,12.433333333666665),(356,8.533333333666667),(357,10.633333333666666),(358,10.033333333666667),(359,1.8333333336666662),(360,16.53333333366667),(361,9.599999999666666),(362,12.299999999666667),(363,10.033333333666667),(364,13.499999999666667),(365,14.499999999666667),(366,12.900000000333332),(367,4.133333333666667),(368,13.133333333666666),(369,11.833333333666666),(370,9.799999999666666),(371,4.2000000003333335),(372,11.533333333666668),(373,3.300000000333335),(374,11.900000000333332),(375,3.9999999996666658),(376,15.533333333666668),(377,12.399999999666667),(378,3.933333333666666),(379,9.600000000333335),(380,12.399999999666667),(381,14.499999999666667),(382,4.7999999996666665),(383,15.600000000333335),(384,4.733333333666667),(385,6.733333333666667),(386,8.200000000333333),(387,9.499999999666667),(388,8.899999999666667),(389,6.399999999666666),(390,10.033333333666667),(391,7.333333333666666),(392,4.833333333666666),(393,6.166666666333334),(394,10.999999999666667),(395,11.999999999666667),(396,14.499999999666667),(397,4.699999999666665),(398,14.000000000333333),(399,8.800000000333334),(400,21.400000000333332),(401,5.799999999666666),(402,16.800000000333334),(403,10.899999999666667),(404,11.033333333666668),(405,15.833333333666666),(406,5.833333333666666),(407,10.833333333666666),(408,12.099999999666666),(409,14.499999999666667),(410,14.499999999666667),(411,4.833333333666666),(412,16.833333333666666),(413,8.300000000333334),(414,7.2000000003333335),(415,3.933333333666666),(416,13.533333333666667),(417,2.0000000003333342),(418,7.900000000333333),(419,10.633333333666664),(420,3.0333333336666657),(421,6.499999999666666),(422,11.999999999666667),(423,10.933333333666667),(424,1.3666666663333331),(425,9.133333333666666),(426,14.499999999666667),(427,14.499999999666667),(428,5.500000000333334),(429,10.133333333666666),(430,3.633333333666667),(431,9.433333333666667),(432,17.700000000333333),(433,3.433333333666666),(434,14.833333333666666),(435,3.133333333666667),(436,9.533333333666667),(437,17.400000000333332),(438,7.899999999666666),(439,18.033333333666665),(440,10.599999999666666),(441,13.499999999666667),(442,9.899999999666667),(443,14.499999999666667),(444,14.499999999666667),(445,6.799999999666666),(446,3.133333333666667),(447,7.533333333666667),(448,12.100000000333335),(449,18.200000000333333),(450,8.633333333666666),(451,11.500000000333333),(452,6.100000000333336),(453,5.900000000333333),(454,10.233333333666666),(455,15.233333333666666),(456,9.999999999666667),(457,12.933333333666665),(458,14.633333333666666),(459,14.499999999666667),(460,13.499999999666667),(461,14.499999999666667),(462,7.033333333666666),(463,7.533333333666667),(464,11.700000000333333),(465,10.700000000333333),(466,6.600000000333334),(467,9.033333333666667),(468,9.133333333666664),(469,8.533333333666667),(470,11.300000000333334),(471,5.100000000333334),(472,19.533333333666665),(473,13.299999999666667),(474,13.099999999666666),(475,14.099999999666666),(476,14.499999999666667),(477,14.499999999666667),(478,14.499999999666667),(479,3.7999999996666665),(480,10.333333333666666),(481,8.899999999666667),(482,23.000000000333337),(483,3.9000000003333346),(484,1.5666666663333342),(485,1.7333333336666665),(486,15.433333333666665),(487,3.9999999996666658),(488,10.933333333666665),(489,11.399999999666667),(490,8.499999999666667),(491,14.499999999666667),(492,7.233333333666667),(493,10.599999999666666),(494,13.499999999666667),(495,20.833333333666666);
/*!40000 ALTER TABLE `recommended` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team` (
  `Team_City` varchar(45) NOT NULL,
  `Defensive_Rating` varchar(45) DEFAULT NULL,
  `Offensive_Rating` varchar(45) DEFAULT NULL,
  `Conference` varchar(45) DEFAULT NULL,
  `Wins` int DEFAULT NULL,
  `Losses` int DEFAULT NULL,
  `Team_Name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Team_City`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
INSERT INTO `team` VALUES ('ATL','114.8','107.2','East',20,47,'Atlanta Hawks'),('BOS','106.8','112.9','East',43,21,'Boston Celtics'),('BRK','108.7','108.1','East',30,34,'Brooklyn Nets'),('CHA','113.3','106.3','East',23,42,'Charlotte Hornets'),('CHI','109.8','106.7','East',22,43,'Chicago Bulls'),('CLE','115.4','107.5','East',19,46,'Cleveland Cavaliers'),('DAL','110.6','116.7','West',40,27,'Dallas Mavericks'),('DEN','109.5','112.5','West',43,22,'Denver Nuggets'),('DET','112.7','109','East',20,46,'Detroit Pistons'),('GSW','113.8','105.2','West',15,50,'Golden State Warriors'),('HOU','110.2','113.8','West',40,24,'Houston Rockets'),('IND','108.3','110.3','East',39,26,'Indiana Pacers'),('LAC','107.2','113.6','West',44,20,'Los Angeles Clippers'),('LAL','105.6','113','West',49,14,'Los Angeles Lakers'),('MEM','110.4','109.4','West',32,33,'Memphis Grizzlies'),('MIA','109.4','112.7','East',41,24,'Miami Heat'),('MIL','101.9','112.6','East',53,12,'Milwaukee Bucks'),('MIN','112.2','108.1','West',19,45,'Minnesota Timberwolves'),('NOP','111.6','110.8','West',28,36,'New Orleans Pelicans'),('NYK','113','106.5','East',21,45,'New York Knicks'),('OKC','109.1','111.6','West',40,24,'Oklahoma City Thunder'),('ORL','109','108','East',30,35,'Orlando Magic'),('PHI','108.2','110.4','East',39,26,'Philadelphia 76ers'),('PHO','111.8','110.5','West',26,39,'Phoenix Suns'),('POR','114.1','112.5','West',29,37,'Portland Trail Blazers'),('SAC','111.6','109.7','West',28,36,'Sacramento Kings'),('SAS','113.7','111.9','West',27,36,'San Antonio Spurs'),('TOR','105.2','111.6','East',46,18,'Toronto Raptors'),('UTA','109.4','112.6','West',41,23,'Utah Jazz'),('WAS','115.8','111.9','East',24,40,'Washington Wizards');
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'nbastats'
--

--
-- Dumping routines for database 'nbastats'
--
/*!50003 DROP PROCEDURE IF EXISTS `RecalculateRatings` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `RecalculateRatings`()
BEGIN

	
	declare weight_id, experience_id double default 0;
    declare height_id, ppg_id, rpg_id, apg_id, bpg_id, ft_id, fg_id, tpt_id double default 0;
    declare weight_p, experience_p, height_p, ppg_p, rpg_p, apg_p, bpg_p, ft_p, fg_p, tpt_p double default 0;
    declare weight_a, experience_a, height_a, ppg_a, rpg_a, apg_a, bpg_a, ft_a, fg_a, tpt_a double default 0;
    declare r double default 0;
    
    declare currCnt1 int default 0;
    declare cnt1 int default 0;
    declare currCnt2 int default 0;
    declare cnt2 int default 0;
    
    # loop
	declare done1 int default 0;
    declare currID int;
    
    # delete loop
    declare done2 int default 0;
    declare currDelID int;
    
    declare delIDCurr cursor for SELECT ID FROM recommended;
    declare IDCurr cursor for SELECT ID FROM player;
    
	# get percents
	select Weight/100, Experience/100, Height/100, PPG/100, RPG/100, APG/100, BPG/100, FT/100, FG/100, TPT/100
	into weight_p, experience_p, height_p, ppg_p, rpg_p, apg_p, bpg_p, ft_p, fg_p, tpt_p
	from percents;
    
    # get favorite averages
    SELECT AVG(Weight), AVG(Height), AVG(Experience), AVG(PPG), AVG(RPG), AVG(APG), AVG(BPG), AVG(FT), AVG(FG), AVG(TPT)
	INTO weight_a, height_a, experience_a, ppg_a, rpg_a, apg_a, bpg_a, ft_a, fg_a, tpt_a
    FROM favorites NATURAL JOIN player P LEFT OUTER JOIN player_stats S ON P.ID = S.ID;
    if (weight_a is null) then set weight_a=0; end if;
    if (experience_a is null) then set experience_a=0; end if;
    if (height_a is null) then set height_a=0; end if;
    if (ppg_a is null) then set ppg_a=0; end if;
    if (rpg_a is null) then set rpg_a=0; end if;
    if (apg_a is null) then set apg_a=0; end if;
    if (bpg_a is null) then set bpg_a=0; end if;
    if (ft_a is null) then set ft_a=0; end if;
    if (fg_a is null) then set fg_a=0; end if;
    if (tpt_a is null) then set tpt_a=0; end if;
    
    # empty the recommended table - can't create/drop/truncate table from a trigger
    select count(*) into cnt1 from recommended;
    open delIDCurr;
    repeat
		fetch delIDCurr into currDelID;
		if (cnt1 != 0) then DELETE FROM recommended WHERE ID=currDelID; end if;
        set currCnt1 = currCnt1 + 1;
        if (cnt1 <= currCnt1) then set done1 = 1; end if;	
    until done1
    end repeat;
    close delIDCurr;

    
    # calculation loop
	select count(*) into cnt2 from player;
    open IDCurr;
    repeat    
		fetch IDCurr into currID;
        
        # get curr player stats
        select Weight, Experience, Height, PPG, RPG, APG, BPG, FT, FG, TPT
        into weight_id, experience_id, height_id, ppg_id, rpg_id, apg_id, bpg_id, ft_id, fg_id, tpt_id
        from player P LEFT OUTER JOIN player_stats S ON P.ID = S.ID
		where currID = P.ID;
        
        if (ppg_id is null) then
			set ppg_id = 0;
            set rpg_id = 0;
            set apg_id = 0;
            set bpg_id = 0;
            set ft_id = 0;
            set fg_id = 0;
            set tpt_id = 0;
		end if;
        if (ft_id is null) then set ft_id = 0; end if;
        if (tpt_id is null) then set tpt_id = 0; end if;
        
		set r = abs(weight_id-weight_a)*weight_p/10 + abs(height_id-height_a)*height_p/5;
        set r = r + abs(experience_id-experience_a)*experience_p + abs(ppg_id-ppg_a)*ppg_p;
        set r = r + abs(rpg_id-rpg_a)*rpg_p*2 + abs(apg_id-apg_a)*apg_p*2;
        set r = r + abs(bpg_id-bpg_a)*bpg_p*10 + abs(ft_id-ft_a)*ft_p*15;
		set r = r + abs(fg_id-fg_a)*fg_p*15 + abs(tpt_id-tpt_a)*tpt_p*15;
        
        insert into recommended
        values (currID, r);
        
        set currCnt2 = currCnt2 + 1;
        if (cnt2 = currCnt2) then set done2 = 1; end if;
    until done2
    end repeat;
    close IDcurr;
    
    #select ID, Rating from recommended order by Rating ASC limit 10;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-06 18:19:17
