/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.6.21-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: syslog
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
-- Current Database: `syslog`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `syslog` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `syslog`;

--
-- Table structure for table `systemevents`
--

DROP TABLE IF EXISTS `systemevents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `systemevents` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ReceivedAt` timestamp NULL DEFAULT NULL,
  `DeviceReportedTime` timestamp NULL DEFAULT NULL,
  `Facility` smallint(6) DEFAULT NULL,
  `Priority` smallint(6) DEFAULT NULL,
  `FromHost` varchar(60) DEFAULT NULL,
  `Message` text DEFAULT NULL,
  `InfoUnitID` int(11) DEFAULT NULL,
  `SysLogTag` varchar(60) DEFAULT NULL,
  `processid` varchar(60) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `systemevents`
--

LOCK TABLES `systemevents` WRITE;
/*!40000 ALTER TABLE `systemevents` DISABLE KEYS */;
INSERT INTO `systemevents` VALUES (1,'2025-05-07 17:58:56','2025-05-07 17:58:56',1,6,'p79l3fwxst','TEST 1 2025-05-07 19:58:56 from p79l3fwxst',1,'test-graylog','');
/*!40000 ALTER TABLE `systemevents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `loganalyzer`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `loganalyzer` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `loganalyzer`;

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
-- Dumping data for table `logcon_charts`
--

LOCK TABLES `logcon_charts` WRITE;
/*!40000 ALTER TABLE `logcon_charts` DISABLE KEYS */;
INSERT INTO `logcon_charts` VALUES (1,'Top Hosts',1,3,400,'FROMHOST',NULL,10,0,NULL,NULL),(2,'SyslogTags',1,1,400,'syslogtag',NULL,10,0,NULL,NULL),(3,'Severity Occurences',1,2,400,'syslogseverity',NULL,10,1,NULL,NULL),(4,'Usage by Day',1,1,400,'timereported',NULL,10,1,NULL,NULL);
/*!40000 ALTER TABLE `logcon_charts` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `logcon_config`
--

LOCK TABLES `logcon_config` WRITE;
/*!40000 ALTER TABLE `logcon_config` DISABLE KEYS */;
INSERT INTO `logcon_config` VALUES ('database_installedversion','14',NULL,1,NULL,NULL),('ViewDefaultLanguage','en',NULL,1,NULL,NULL),('ViewDefaultTheme','default',NULL,1,NULL,NULL),('ExportUseTodayYesterday','0',NULL,1,NULL,NULL),('SESSION_MAXIMIZED','0',NULL,1,NULL,NULL),('ViewColoredCells','',NULL,1,NULL,NULL),('ViewUseTodayYesterday','1',NULL,1,NULL,NULL),('ViewEnableDetailPopups','1',NULL,1,NULL,NULL),('EnableContextLinks','1',NULL,1,NULL,NULL),('EnableIPAddressResolve','1',NULL,1,NULL,NULL),('MiscShowDebugMsg','0',NULL,1,NULL,NULL),('MiscShowDebugGridCounter','0',NULL,1,NULL,NULL),('MiscShowPageRenderStats','1',NULL,1,NULL,NULL),('MiscEnableGzipCompression','1',NULL,1,NULL,NULL),('SuppressDuplicatedMessages','0',NULL,1,NULL,NULL),('TreatNotFoundFiltersAsTrue','0',NULL,1,NULL,NULL),('InlineOnlineSearchIcons','1',NULL,1,NULL,NULL),('ViewMessageCharacterLimit','80',NULL,1,NULL,NULL),('ViewStringCharacterLimit','30',NULL,1,NULL,NULL),('ViewEntriesPerPage','50',NULL,1,NULL,NULL),('ViewEnableAutoReloadSeconds','0',NULL,1,NULL,NULL),('AdminChangeWaitTime','',NULL,1,NULL,NULL),('PopupMenuTimeout','3000',NULL,1,NULL,NULL),('PrependTitle','',NULL,1,NULL,NULL),('SearchCustomButtonCaption','I\'d like to feel sad',NULL,1,NULL,NULL),('SearchCustomButtonSearch','error',NULL,1,NULL,NULL),('EventEmptySearchDefaultFilter','',NULL,1,NULL,NULL),('DefaultViewsID','',NULL,1,NULL,NULL),('DefaultSourceID','1',NULL,1,NULL,NULL),('DefaultFont','Arial',NULL,1,NULL,NULL),('DefaultFontSize','100',NULL,1,NULL,NULL),('DebugUserLogin','0',NULL,1,NULL,NULL),('MiscDebugToSyslog','0',NULL,1,NULL,NULL),('MiscMaxExecutionTime','30',NULL,1,NULL,NULL),('UseProxyServerForRemoteQueries','',NULL,1,NULL,NULL),('HeaderDefaultEncoding','ISO-8859-1',NULL,1,NULL,NULL),('DisableAdminUsers','',NULL,1,NULL,NULL),('InjectHtmlHeader','',NULL,1,NULL,NULL),('InjectBodyHeader','',NULL,1,NULL,NULL),('InjectBodyFooter','',NULL,1,NULL,NULL),('PhplogconLogoUrl','',NULL,1,NULL,NULL);
/*!40000 ALTER TABLE `logcon_config` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `logcon_dbmappings`
--

LOCK TABLES `logcon_dbmappings` WRITE;
/*!40000 ALTER TABLE `logcon_dbmappings` DISABLE KEYS */;
/*!40000 ALTER TABLE `logcon_dbmappings` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `logcon_fields`
--

LOCK TABLES `logcon_fields` WRITE;
/*!40000 ALTER TABLE `logcon_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `logcon_fields` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `logcon_groupmembers`
--

LOCK TABLES `logcon_groupmembers` WRITE;
/*!40000 ALTER TABLE `logcon_groupmembers` DISABLE KEYS */;
/*!40000 ALTER TABLE `logcon_groupmembers` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `logcon_groups`
--

LOCK TABLES `logcon_groups` WRITE;
/*!40000 ALTER TABLE `logcon_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `logcon_groups` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `logcon_savedreports`
--

LOCK TABLES `logcon_savedreports` WRITE;
/*!40000 ALTER TABLE `logcon_savedreports` DISABLE KEYS */;
/*!40000 ALTER TABLE `logcon_savedreports` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `logcon_searches`
--

LOCK TABLES `logcon_searches` WRITE;
/*!40000 ALTER TABLE `logcon_searches` DISABLE KEYS */;
INSERT INTO `logcon_searches` VALUES (1,'Syslog Warnings and Errors','filter=severity%3A0%2C1%2C2%2C3%2C4&search=Search',NULL,NULL),(2,'Syslog Errors','filter=severity%3A0%2C1%2C2%2C3&search=Search',NULL,NULL),(3,'All messages from the last hour','filter=datelastxx%3A1&search=Search',NULL,NULL),(4,'All messages from last 12 hours','filter=datelastxx%3A12&search=Search',NULL,NULL),(5,'All messages from last 24 hours','filter=datelastxx%3A24&search=Search',NULL,NULL),(6,'All messages from last 7 days','filter=datelastxx%3A168&search=Search',NULL,NULL),(7,'All messages from last 31 days','filter=datelastxx%3A744&search=Search',NULL,NULL);
/*!40000 ALTER TABLE `logcon_searches` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `logcon_sources`
--

LOCK TABLES `logcon_sources` WRITE;
/*!40000 ALTER TABLE `logcon_sources` DISABLE KEYS */;
INSERT INTO `logcon_sources` VALUES (1,'Syslog via rsyslog','',2,'',0,0,'SYSLOG',NULL,NULL,'monitorware',0,'db','syslog','user','syslogpass','systemevents',0,100,NULL,NULL,NULL);
/*!40000 ALTER TABLE `logcon_sources` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `logcon_users`
--

LOCK TABLES `logcon_users` WRITE;
/*!40000 ALTER TABLE `logcon_users` DISABLE KEYS */;
INSERT INTO `logcon_users` VALUES (1,'admin','a9fe96bb955c267e308bf246d8ec7df4',1,0,0);
/*!40000 ALTER TABLE `logcon_users` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Dumping data for table `logcon_views`
--

LOCK TABLES `logcon_views` WRITE;
/*!40000 ALTER TABLE `logcon_views` DISABLE KEYS */;
/*!40000 ALTER TABLE `logcon_views` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-07 19:59:13
