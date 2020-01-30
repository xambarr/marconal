-- MySQL dump 10.13  Distrib 8.0.18, for macos10.14 (x86_64)
--
-- Host: 127.0.0.1    Database: marconal
-- ------------------------------------------------------
-- Server version	8.0.18

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
-- Table structure for table `bankLedger`
--

DROP TABLE IF EXISTS `bankLedger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bankLedger` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bankId` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `accountNumber` int(11) DEFAULT NULL,
  `etcBankId` int(11) DEFAULT NULL,
  `etcAccountNumber` int(11) DEFAULT NULL,
  `birrDebit` decimal(12,2) NOT NULL,
  `birrCredit` decimal(12,2) NOT NULL,
  `balance` decimal(12,2) NOT NULL,
  `airtimeDelta` decimal(12,5) DEFAULT NULL,
  `bankingConfrimationCode` varchar(45) DEFAULT NULL,
  `authorizedBy` varchar(45) DEFAULT NULL,
  `createdTime` datetime NOT NULL,
  `createdBy` varchar(45) DEFAULT NULL,
  `updatedTime` datetime DEFAULT NULL,
  `updatedBy` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `etcAirtimeLedger`
--

DROP TABLE IF EXISTS `etcAirtimeLedger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `etcAirtimeLedger` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `refId` int(11) DEFAULT NULL COMMENT '									',
  `phoneNumber` varchar(45) DEFAULT NULL,
  `etcConfirmationID` varchar(45) DEFAULT NULL,
  `airtimeDebit` decimal(12,5) NOT NULL,
  `airtimeCredit` decimal(12,5) NOT NULL,
  `airtimeBalance` decimal(12,5) NOT NULL,
  `createdDate` datetime NOT NULL,
  `createdBy` datetime NOT NULL,
  `updatedDate` datetime NOT NULL,
  `updatedBy` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `redemptionCodes`
--

DROP TABLE IF EXISTS `redemptionCodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `redemptionCodes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `redemptionCode` int(11) NOT NULL,
  `etcAirtimeLedgerId` varchar(45) DEFAULT NULL,
  `birrValue` int(11) NOT NULL,
  `serialNo` varchar(45) NOT NULL,
  `isActivated` tinyint(4) NOT NULL DEFAULT '0',
  `redemptionDate` datetime DEFAULT NULL,
  `expirationTime` datetime DEFAULT NULL,
  `createdTime` datetime NOT NULL,
  `updatedTime` datetime NOT NULL,
  `createdBy` varchar(45) NOT NULL,
  `updatedBy` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `serialNo_UNIQUE` (`serialNo`),
  UNIQUE KEY `redemptionCode_UNIQUE` (`redemptionCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-30  8:24:32
