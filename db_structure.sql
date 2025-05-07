/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.6.21-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: loganalyzer
-- ------------------------------------------------------
-- Server version	10.6.21-MariaDB-ubu2004

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `SystemEvents`
--

DROP TABLE IF EXISTS `SystemEvents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `SystemEvents` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ReceivedAt` timestamp NULL DEFAULT NULL,
  `DeviceReportedTime` timestamp NULL DEFAULT NULL,
  `Facility` smallint(6) DEFAULT NULL,
  `Priority` smallint(6) DEFAULT NULL,
  `FromHost` varchar(60) DEFAULT NULL,
  `Message` text DEFAULT NULL,
  `InfoUnitID` int(11) DEFAULT NULL,
  `SysLogTag` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `logcon_charts`
--

DROP TABLE IF EXISTS `logcon_charts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `logcon_charts` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DisplayName` varchar(255) NOT NULL,
  `chart_enabled` tinyint(1) NOT NULL DEFAULT 1,
  `chart_type` int(11) NOT NULL,
  `chart_width` int(11) NOT NULL,
  `chart_field` varchar(255) NOT NULL,
  `chart_defaultfilter` varchar(1024) DEFAULT NULL,
  `maxrecords` int(11) NOT NULL,
  `showpercent` tinyint(1) NOT NULL,
  `userid` int(11) DEFAULT NULL,
  `groupid` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='This table contains all configured charts';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `logcon_config`
--

DROP TABLE IF EXISTS `logcon_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `logcon_config` (
  `propname` varchar(32) NOT NULL,
  `propvalue` varchar(255) DEFAULT NULL,
  `propvalue_text` text DEFAULT NULL,
  `is_global` tinyint(1) NOT NULL,
  `userid` int(11) DEFAULT NULL,
  `groupid` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Table to store global and user specific configurations';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `logcon_dbmappings`
--

DROP TABLE IF EXISTS `logcon_dbmappings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `logcon_dbmappings` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DisplayName` varchar(64) NOT NULL,
  `Mappings` varchar(1024) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `logcon_fields`
--

DROP TABLE IF EXISTS `logcon_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `logcon_fields` (
  `FieldID` varchar(64) NOT NULL,
  `FieldDefine` varchar(64) NOT NULL,
  `FieldCaption` varchar(255) NOT NULL,
  `FieldType` int(11) NOT NULL,
  `Sortable` tinyint(1) NOT NULL DEFAULT 0,
  `DefaultWidth` int(11) NOT NULL,
  `FieldAlign` varchar(32) NOT NULL,
  `SearchField` varchar(64) NOT NULL,
  `SearchOnline` tinyint(1) NOT NULL,
  `Trunscate` int(11) NOT NULL,
  PRIMARY KEY (`FieldID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='This table stores custom fields';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `logcon_groupmembers`
--

DROP TABLE IF EXISTS `logcon_groupmembers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `logcon_groupmembers` (
  `userid` int(11) NOT NULL,
  `groupid` int(11) NOT NULL,
  `is_member` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Helpertable to store which users are in which group';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `logcon_groups`
--

DROP TABLE IF EXISTS `logcon_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `logcon_groups` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `groupname` varchar(32) NOT NULL,
  `groupdescription` varchar(255) NOT NULL,
  `grouptype` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Table for phplogcon groups';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `logcon_savedreports`
--

DROP TABLE IF EXISTS `logcon_savedreports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `logcon_savedreports` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `reportid` varchar(255) NOT NULL,
  `sourceid` varchar(11) NOT NULL,
  `customTitle` varchar(255) NOT NULL,
  `customComment` text NOT NULL,
  `filterString` text NOT NULL,
  `customFilters` text NOT NULL,
  `outputFormat` varchar(64) NOT NULL,
  `outputTarget` varchar(64) NOT NULL,
  `outputTargetDetails` text NOT NULL,
  `scheduleSettings` text NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Table to store saved reports';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `logcon_searches`
--

DROP TABLE IF EXISTS `logcon_searches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `logcon_searches` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DisplayName` varchar(255) NOT NULL,
  `SearchQuery` varchar(1024) NOT NULL,
  `userid` int(11) DEFAULT NULL,
  `groupid` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Stores custom user searches';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `logcon_sources`
--

DROP TABLE IF EXISTS `logcon_sources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `logcon_sources` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  `Description` text NOT NULL,
  `SourceType` tinyint(4) NOT NULL,
  `MsgParserList` varchar(255) NOT NULL,
  `MsgNormalize` tinyint(1) NOT NULL DEFAULT 0,
  `MsgSkipUnparseable` tinyint(1) NOT NULL DEFAULT 0,
  `ViewID` varchar(64) NOT NULL,
  `LogLineType` varchar(64) DEFAULT NULL,
  `DiskFile` varchar(255) DEFAULT NULL,
  `DBTableType` varchar(64) DEFAULT NULL,
  `DBType` tinyint(4) DEFAULT NULL,
  `DBServer` varchar(255) DEFAULT NULL,
  `DBName` varchar(64) DEFAULT NULL,
  `DBUser` varchar(64) DEFAULT NULL,
  `DBPassword` varchar(255) DEFAULT NULL,
  `DBTableName` varchar(64) DEFAULT NULL,
  `DBEnableRowCounting` tinyint(1) DEFAULT NULL,
  `DBRecordsPerQuery` int(11) NOT NULL DEFAULT 100,
  `defaultfilter` varchar(1024) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `groupid` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Table to store datasources in phplogcon';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `logcon_users`
--

DROP TABLE IF EXISTS `logcon_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `logcon_users` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT 0,
  `is_readonly` tinyint(1) NOT NULL DEFAULT 0,
  `last_login` int(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Table for the phplogcon users';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `logcon_views`
--

DROP TABLE IF EXISTS `logcon_views`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `logcon_views` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DisplayName` varchar(255) NOT NULL,
  `Columns` text NOT NULL,
  `userid` int(11) DEFAULT NULL,
  `groupid` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Stores custom defined user views.';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-07 16:21:35
