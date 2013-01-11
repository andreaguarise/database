-- MySQL dump 10.13  Distrib 5.6.2-m5, for Linux (x86_64)
--
-- Host: localhost    Database: hlr
-- ------------------------------------------------------
-- Server version	5.6.2-m5-log

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
-- Current Database: `hlr`
--

/*!40000 DROP DATABASE IF EXISTS `hlr`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `hlr` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `hlr`;

--
-- Table structure for table `hlrAdmin`
--

DROP TABLE IF EXISTS `hlrAdmin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hlrAdmin` (
  `acl` blob NOT NULL,
  PRIMARY KEY (`acl`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jobTransSummary`
--

DROP TABLE IF EXISTS `jobTransSummary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobTransSummary` (
  `dgJobId` varchar(160) NOT NULL DEFAULT '',
  `date` datetime DEFAULT NULL,
  `gridResource` varchar(160) DEFAULT NULL,
  `gridUser` varchar(160) DEFAULT NULL,
  `userFqan` varchar(255) DEFAULT NULL,
  `userVo` varchar(160) DEFAULT NULL,
  `cpuTime` int(10) unsigned DEFAULT NULL,
  `wallTime` int(10) unsigned DEFAULT NULL,
  `pmem` int(10) unsigned DEFAULT NULL,
  `vmem` int(10) unsigned DEFAULT NULL,
  `amount` smallint(5) unsigned DEFAULT NULL,
  `start` int(10) unsigned DEFAULT NULL,
  `end` int(10) unsigned DEFAULT NULL,
  `iBench` mediumint(8) unsigned DEFAULT NULL,
  `iBenchType` varchar(16) DEFAULT 'si2k',
  `fBench` mediumint(8) unsigned DEFAULT NULL,
  `fBenchType` varchar(16) DEFAULT 'sf2k',
  `acl` varchar(160) DEFAULT NULL,
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `lrmsId` varchar(160) DEFAULT NULL,
  `localUserId` varchar(32) DEFAULT NULL,
  `hlrGroup` varchar(128) DEFAULT NULL,
  `localGroup` varchar(160) DEFAULT NULL,
  `endDate` datetime DEFAULT NULL,
  `siteName` varchar(160) DEFAULT NULL,
  `urSourceServer` varchar(255) DEFAULT NULL,
  `hlrTid` bigint(20) unsigned DEFAULT NULL,
  `accountingProcedure` varchar(32) DEFAULT NULL,
  `voOrigin` varchar(16) DEFAULT NULL,
  `GlueCEInfoTotalCPUs` smallint(5) unsigned DEFAULT NULL,
  `executingNodes` varchar(255) DEFAULT '',
  `uniqueChecksum` char(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`dgJobId`,`uniqueChecksum`),
  KEY `id` (`id`),
  KEY `siteName` (`siteName`),
  KEY `uservo` (`userVo`),
  KEY `date` (`date`),
  KEY `endDate` (`endDate`),
  KEY `urSourceServer` (`urSourceServer`),
  KEY `uniqueChecksum` (`uniqueChecksum`)
) ENGINE=MyISAM AUTO_INCREMENT=386207865 DEFAULT CHARSET=latin1 MAX_ROWS=4294967295;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(11) DEFAULT NULL,
  `dn` varchar(255) NOT NULL DEFAULT '',
  `role` varchar(160) NOT NULL DEFAULT '',
  `permission` varchar(16) DEFAULT NULL,
  `queryType` varchar(160) DEFAULT NULL,
  `queryAdd` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`dn`,`role`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `siteStatus`
--

DROP TABLE IF EXISTS `siteStatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `siteStatus` (
  `siteName` varchar(160) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`siteName`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `urConcentratorIndex`
--

DROP TABLE IF EXISTS `urConcentratorIndex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `urConcentratorIndex` (
  `urSourceServer` varchar(255) NOT NULL DEFAULT '',
  `urSourceServerDN` varchar(255) DEFAULT NULL,
  `remoteRecordId` varchar(31) DEFAULT NULL,
  `recordDate` datetime DEFAULT NULL,
  `recordInsertDate` datetime DEFAULT NULL,
  PRIMARY KEY (`urSourceServer`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `voAdmin`
--

DROP TABLE IF EXISTS `voAdmin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voAdmin` (
  `vo_id` varchar(160) NOT NULL DEFAULT '',
  `acl` blob NOT NULL,
  PRIMARY KEY (`vo_id`,`acl`(255))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `voStorageRecords`
--

DROP TABLE IF EXISTS `voStorageRecords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voStorageRecords` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uniqueChecksum` char(32) NOT NULL DEFAULT '',
  `timestamp` int(10) unsigned DEFAULT NULL,
  `siteName` varchar(255) DEFAULT NULL,
  `vo` varchar(255) DEFAULT NULL,
  `voDefSubClass` varchar(255) DEFAULT NULL,
  `storage` varchar(255) DEFAULT NULL,
  `storageSubClass` varchar(255) DEFAULT NULL,
  `urSourceServer` varchar(255) DEFAULT NULL,
  `usedBytes` bigint(20) unsigned DEFAULT NULL,
  `freeBytes` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`uniqueChecksum`),
  KEY `id` (`id`),
  KEY `vo` (`vo`),
  KEY `storage` (`storage`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vomsAuthMap`
--

DROP TABLE IF EXISTS `vomsAuthMap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vomsAuthMap` (
  `vo_id` varchar(255) NOT NULL DEFAULT '',
  `voRole` varchar(255) NOT NULL DEFAULT '',
  `hlrRole` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`vo_id`,`voRole`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-09-11 12:28:52
