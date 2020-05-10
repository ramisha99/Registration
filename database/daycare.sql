-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: daycare
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
-- Table structure for table `children`
--

DROP TABLE IF EXISTS `children`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `children` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parent` int DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `children`
--

LOCK TABLES `children` WRITE;
/*!40000 ALTER TABLE `children` DISABLE KEYS */;
INSERT INTO `children` VALUES (1,1,'Anais One','2018-01-06'),(2,1,'Bertrand One','2020-01-15'),(3,2,'Evan Two','2017-04-12'),(4,2,'Kim Two','2019-09-20'),(5,3,'Sufiya Three','2016-12-10'),(6,3,'Khaled Three','2019-08-23'),(7,4,'Yannan Four','2017-05-26'),(8,4,'Chiao-Yu Four','2019-04-15');
/*!40000 ALTER TABLE `children` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parents`
--

DROP TABLE IF EXISTS `parents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parents` (
  `idparent` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `phone` varchar(12) DEFAULT NULL,
  `address` varchar(64) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `iduser` int DEFAULT NULL,
  PRIMARY KEY (`idparent`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parents`
--

LOCK TABLES `parents` WRITE;
/*!40000 ALTER TABLE `parents` DISABLE KEYS */;
INSERT INTO `parents` VALUES (1,'Parent One','555-1212','101 Integer Street','Appleton','one@mail.com',1),(2,'Parent Two','555-1212','202 Integer Street','Appleton','two@mail.com',2),(3,'Parent Three','555-1212','303 Integer Street','Appleton','three@mail.com',3),(4,'Parent Four','555-1212','404 Integer Street','Appleton','four@mail.com',4);
/*!40000 ALTER TABLE `parents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `providers`
--

DROP TABLE IF EXISTS `providers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `providers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `address` varchar(80) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `capacity` int DEFAULT NULL,
  `minAge` int DEFAULT NULL,
  `maxAge` int DEFAULT NULL,
  `lat` double DEFAULT NULL,
  `lgt` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `providers`
--

LOCK TABLES `providers` WRITE;
/*!40000 ALTER TABLE `providers` DISABLE KEYS */;
INSERT INTO `providers` VALUES (1,'Kelli\'s Certified Home Daycare','1124 W Lawrence St','Appleton',5,6,48,44.2609204,-88.4234575),(2,'Amy & Kids Family Child','1013 W Oklahoma St','Appleton',4,6,48,44.2682791,-88.421603),(3,'Little Peanuts Home Child Care','1350 W Seneca Dr','Appleton',6,24,48,44.2960123,-88.4271247),(4,'Little Angel Child Care','1208 N Oneida St','Appleton',4,24,60,44.2724556,-88.4056735),(5,'Olson\'s Family Daycare','1720 W Reeve St','Appleton',5,6,60,44.2688091,-88.4331203),(6,'Bunnies & Bears Child Care','2600 S Greenview St','Appleton',6,6,48,44.2387221,-88.3888136),(7,'Little Feet Giant Steps','657 Oak St','Menasha',6,6,48,44.2135310566131,-88.4273800072023),(11,'Sample','Somewhere in town','Appleton',4,4,48,NULL,NULL);
/*!40000 ALTER TABLE `providers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `regdata`
--

DROP TABLE IF EXISTS `regdata`;
/*!50001 DROP VIEW IF EXISTS `regdata`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `regdata` AS SELECT
 1 AS `id`,
 1 AS `parent`,
 1 AS `phone`,
 1 AS `child`,
 1 AS `start`,
 1 AS `end`,
 1 AS `provider`,
 1 AS `status`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `registration`
--

DROP TABLE IF EXISTS `registration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registration` (
  `id` int NOT NULL AUTO_INCREMENT,
  `child` int DEFAULT NULL,
  `provider` int DEFAULT NULL,
  `start` date DEFAULT NULL,
  `end` date DEFAULT NULL,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registration`
--

LOCK TABLES `registration` WRITE;
/*!40000 ALTER TABLE `registration` DISABLE KEYS */;
INSERT INTO `registration` VALUES (1,1,1,'2020-01-01','2021-12-31',2),(2,2,1,'2020-01-01','2021-12-31',2),(3,3,1,'2020-04-01','2020-09-30',2),(4,4,1,'2020-04-01','2020-11-30',2),(5,5,1,'2020-10-01','2021-06-30',2),(6,6,1,'2020-10-01','2021-06-30',2);
/*!40000 ALTER TABLE `registration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `iduser` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`iduser`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'one','one'),(2,'two','two'),(3,'three','three'),(4,'four','four');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'daycare'
--
/*!50003 DROP FUNCTION IF EXISTS `gc_dist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`student`@`localhost` FUNCTION `gc_dist`(lat1 double,lgt1 double,lat2 double,lgt2 double) RETURNS double
    DETERMINISTIC
BEGIN
	declare pi, lambda1, lambda2, phi1, phi2, delta, sigma double;
    set pi = 3.14159265;
    set lambda1 = lgt1*pi/180;
    set lambda2 = lgt2*pi/180;
    set phi1 = lat1*pi/180;
    set phi2 = lat2*pi/180;
    set delta = ABS(lgt1-lgt2)*pi/180;
    set sigma =  ACOS(SIN(phi1)*SIN(phi2)+COS(phi1)*COS(phi2)*COS(delta));
    return 3958.8*sigma;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `regdata`
--

/*!50001 DROP VIEW IF EXISTS `regdata`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `regdata` AS select `registration`.`id` AS `id`,`parents`.`name` AS `parent`,`parents`.`phone` AS `phone`,`children`.`name` AS `child`,`registration`.`start` AS `start`,`registration`.`end` AS `end`,`registration`.`provider` AS `provider`,`registration`.`status` AS `status` from ((`registration` join `children` on((`registration`.`child` = `children`.`id`))) join `parents` on((`children`.`parent` = `parents`.`idparent`))) */;
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

-- Dump completed on 2020-02-13 16:10:45
