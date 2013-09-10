-- MySQL dump 10.13  Distrib 5.5.31, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: akeneo_pim_test
-- ------------------------------------------------------
-- Server version	5.5.31-0+wheezy1

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
-- Table structure for table `jms_job_dependencies`
--

DROP TABLE IF EXISTS `jms_job_dependencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jms_job_dependencies` (
  `source_job_id` bigint(20) unsigned NOT NULL,
  `dest_job_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`source_job_id`,`dest_job_id`),
  KEY `IDX_8DCFE92CBD1F6B4F` (`source_job_id`),
  KEY `IDX_8DCFE92C32CF8D4C` (`dest_job_id`),
  CONSTRAINT `FK_8DCFE92C32CF8D4C` FOREIGN KEY (`dest_job_id`) REFERENCES `jms_jobs` (`id`),
  CONSTRAINT `FK_8DCFE92CBD1F6B4F` FOREIGN KEY (`source_job_id`) REFERENCES `jms_jobs` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jms_job_dependencies`
--

LOCK TABLES `jms_job_dependencies` WRITE;
/*!40000 ALTER TABLE `jms_job_dependencies` DISABLE KEYS */;
/*!40000 ALTER TABLE `jms_job_dependencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jms_job_related_entities`
--

DROP TABLE IF EXISTS `jms_job_related_entities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jms_job_related_entities` (
  `job_id` bigint(20) unsigned NOT NULL,
  `related_class` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `related_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`job_id`,`related_class`,`related_id`),
  KEY `IDX_E956F4E2BE04EA9` (`job_id`),
  CONSTRAINT `FK_E956F4E2BE04EA9` FOREIGN KEY (`job_id`) REFERENCES `jms_jobs` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jms_job_related_entities`
--

LOCK TABLES `jms_job_related_entities` WRITE;
/*!40000 ALTER TABLE `jms_job_related_entities` DISABLE KEYS */;
/*!40000 ALTER TABLE `jms_job_related_entities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jms_job_statistics`
--

DROP TABLE IF EXISTS `jms_job_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jms_job_statistics` (
  `job_id` bigint(20) unsigned NOT NULL,
  `characteristic` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `createdAt` datetime NOT NULL,
  `charValue` double NOT NULL,
  PRIMARY KEY (`job_id`,`characteristic`,`createdAt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jms_job_statistics`
--

LOCK TABLES `jms_job_statistics` WRITE;
/*!40000 ALTER TABLE `jms_job_statistics` DISABLE KEYS */;
/*!40000 ALTER TABLE `jms_job_statistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jms_jobs`
--

DROP TABLE IF EXISTS `jms_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jms_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `state` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `createdAt` datetime NOT NULL,
  `startedAt` datetime DEFAULT NULL,
  `checkedAt` datetime DEFAULT NULL,
  `executeAfter` datetime DEFAULT NULL,
  `closedAt` datetime DEFAULT NULL,
  `command` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `args` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)',
  `output` longtext COLLATE utf8_unicode_ci,
  `errorOutput` longtext COLLATE utf8_unicode_ci,
  `exitCode` smallint(5) unsigned DEFAULT NULL,
  `maxRuntime` smallint(5) unsigned NOT NULL,
  `maxRetries` smallint(5) unsigned NOT NULL,
  `stackTrace` longblob COMMENT '(DC2Type:jms_job_safe_object)',
  `runtime` smallint(5) unsigned DEFAULT NULL,
  `memoryUsage` int(10) unsigned DEFAULT NULL,
  `memoryUsageReal` int(10) unsigned DEFAULT NULL,
  `originalJob_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_704ADB9349C447F1` (`originalJob_id`),
  KEY `IDX_704ADB938ECAEAD4` (`command`),
  KEY `job_runner` (`executeAfter`,`state`),
  CONSTRAINT `FK_704ADB9349C447F1` FOREIGN KEY (`originalJob_id`) REFERENCES `jms_jobs` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jms_jobs`
--

LOCK TABLES `jms_jobs` WRITE;
/*!40000 ALTER TABLE `jms_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jms_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oro_access_group`
--

DROP TABLE IF EXISTS `oro_access_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oro_access_group` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `business_unit_owner_id` int(11) DEFAULT NULL,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_FEF9EDB75E237E06` (`name`),
  KEY `IDX_FEF9EDB759294170` (`business_unit_owner_id`),
  CONSTRAINT `FK_FEF9EDB759294170` FOREIGN KEY (`business_unit_owner_id`) REFERENCES `oro_business_unit` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oro_access_group`
--

LOCK TABLES `oro_access_group` WRITE;
/*!40000 ALTER TABLE `oro_access_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `oro_access_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oro_access_role`
--

DROP TABLE IF EXISTS `oro_access_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oro_access_role` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `business_unit_owner_id` int(11) DEFAULT NULL,
  `role` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_673F65E757698A6A` (`role`),
  KEY `IDX_673F65E759294170` (`business_unit_owner_id`),
  CONSTRAINT `FK_673F65E759294170` FOREIGN KEY (`business_unit_owner_id`) REFERENCES `oro_business_unit` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oro_access_role`
--

LOCK TABLES `oro_access_role` WRITE;
/*!40000 ALTER TABLE `oro_access_role` DISABLE KEYS */;
INSERT INTO `oro_access_role` VALUES (6,NULL,'ROLE_USER','ROLE_USER'),(7,NULL,'ROLE_SUPER_ADMIN','ROLE_SUPER_ADMIN'),(8,NULL,'IS_AUTHENTICATED_ANONYMOUSLY','IS_AUTHENTICATED_ANONYMOUSLY');
/*!40000 ALTER TABLE `oro_access_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oro_audit`
--

DROP TABLE IF EXISTS `oro_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oro_audit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `action` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `logged_at` datetime NOT NULL,
  `object_id` int(11) DEFAULT NULL,
  `object_class` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `object_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `version` int(11) NOT NULL,
  `data` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  KEY `IDX_5FBA427CA76ED395` (`user_id`),
  CONSTRAINT `FK_5FBA427CA76ED395` FOREIGN KEY (`user_id`) REFERENCES `oro_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oro_audit`
--

LOCK TABLES `oro_audit` WRITE;
/*!40000 ALTER TABLE `oro_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `oro_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oro_business_unit`
--

DROP TABLE IF EXISTS `oro_business_unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oro_business_unit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `organization_id` int(11) NOT NULL,
  `business_unit_owner_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fax` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_C033B2D532C8A3DE` (`organization_id`),
  KEY `IDX_C033B2D559294170` (`business_unit_owner_id`),
  CONSTRAINT `FK_C033B2D559294170` FOREIGN KEY (`business_unit_owner_id`) REFERENCES `oro_business_unit` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_C033B2D532C8A3DE` FOREIGN KEY (`organization_id`) REFERENCES `oro_organization` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oro_business_unit`
--

LOCK TABLES `oro_business_unit` WRITE;
/*!40000 ALTER TABLE `oro_business_unit` DISABLE KEYS */;
/*!40000 ALTER TABLE `oro_business_unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oro_config`
--

DROP TABLE IF EXISTS `oro_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oro_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entity` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `record_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQ_ENTITY` (`entity`,`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oro_config`
--

LOCK TABLES `oro_config` WRITE;
/*!40000 ALTER TABLE `oro_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `oro_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oro_config_value`
--

DROP TABLE IF EXISTS `oro_config_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oro_config_value` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `config_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `section` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQ_ENTITY` (`name`,`section`,`config_id`),
  KEY `IDX_DAF6DF5524DB0683` (`config_id`),
  CONSTRAINT `FK_DAF6DF5524DB0683` FOREIGN KEY (`config_id`) REFERENCES `oro_config` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oro_config_value`
--

LOCK TABLES `oro_config_value` WRITE;
/*!40000 ALTER TABLE `oro_config_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `oro_config_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oro_cron_schedule`
--

DROP TABLE IF EXISTS `oro_cron_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oro_cron_schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `command` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `definition` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQ_COMMAND` (`command`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oro_cron_schedule`
--

LOCK TABLES `oro_cron_schedule` WRITE;
/*!40000 ALTER TABLE `oro_cron_schedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `oro_cron_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oro_email`
--

DROP TABLE IF EXISTS `oro_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oro_email` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `folder_id` int(11) DEFAULT NULL,
  `from_email_address_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `subject` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `from_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `received` datetime NOT NULL,
  `sent` datetime NOT NULL,
  `importance` int(11) NOT NULL,
  `internaldate` datetime NOT NULL,
  `message_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `x_message_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `x_thread_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_2A30C171162CB942` (`folder_id`),
  KEY `IDX_2A30C171D445573A` (`from_email_address_id`),
  CONSTRAINT `FK_2A30C171D445573A` FOREIGN KEY (`from_email_address_id`) REFERENCES `oro_email_address` (`id`),
  CONSTRAINT `FK_2A30C171162CB942` FOREIGN KEY (`folder_id`) REFERENCES `oro_email_folder` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oro_email`
--

LOCK TABLES `oro_email` WRITE;
/*!40000 ALTER TABLE `oro_email` DISABLE KEYS */;
/*!40000 ALTER TABLE `oro_email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oro_email_address`
--

DROP TABLE IF EXISTS `oro_email_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oro_email_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_user_id` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `oro_email_address_uq` (`email`),
  KEY `IDX_FC9DBBC52B18554A` (`owner_user_id`),
  CONSTRAINT `FK_FC9DBBC52B18554A` FOREIGN KEY (`owner_user_id`) REFERENCES `oro_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oro_email_address`
--

LOCK TABLES `oro_email_address` WRITE;
/*!40000 ALTER TABLE `oro_email_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `oro_email_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oro_email_attachment`
--

DROP TABLE IF EXISTS `oro_email_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oro_email_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `body_id` int(11) DEFAULT NULL,
  `file_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content_type` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_F4427F239B621D84` (`body_id`),
  CONSTRAINT `FK_F4427F239B621D84` FOREIGN KEY (`body_id`) REFERENCES `oro_email_body` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oro_email_attachment`
--

LOCK TABLES `oro_email_attachment` WRITE;
/*!40000 ALTER TABLE `oro_email_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `oro_email_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oro_email_attachment_content`
--

DROP TABLE IF EXISTS `oro_email_attachment_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oro_email_attachment_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attachment_id` int(11) NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `content_transfer_encoding` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_18704959464E68B` (`attachment_id`),
  CONSTRAINT `FK_18704959464E68B` FOREIGN KEY (`attachment_id`) REFERENCES `oro_email_attachment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oro_email_attachment_content`
--

LOCK TABLES `oro_email_attachment_content` WRITE;
/*!40000 ALTER TABLE `oro_email_attachment_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `oro_email_attachment_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oro_email_body`
--

DROP TABLE IF EXISTS `oro_email_body`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oro_email_body` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email_id` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `body` longtext COLLATE utf8_unicode_ci NOT NULL,
  `body_is_text` tinyint(1) NOT NULL,
  `has_attachments` tinyint(1) NOT NULL,
  `persistent` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_C7CE120DA832C1C9` (`email_id`),
  CONSTRAINT `FK_C7CE120DA832C1C9` FOREIGN KEY (`email_id`) REFERENCES `oro_email` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oro_email_body`
--

LOCK TABLES `oro_email_body` WRITE;
/*!40000 ALTER TABLE `oro_email_body` DISABLE KEYS */;
/*!40000 ALTER TABLE `oro_email_body` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oro_email_folder`
--

DROP TABLE IF EXISTS `oro_email_folder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oro_email_folder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `origin_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_EB940F1C56A273CC` (`origin_id`),
  CONSTRAINT `FK_EB940F1C56A273CC` FOREIGN KEY (`origin_id`) REFERENCES `oro_email_origin` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oro_email_folder`
--

LOCK TABLES `oro_email_folder` WRITE;
/*!40000 ALTER TABLE `oro_email_folder` DISABLE KEYS */;
/*!40000 ALTER TABLE `oro_email_folder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oro_email_origin`
--

DROP TABLE IF EXISTS `oro_email_origin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oro_email_origin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oro_email_origin`
--

LOCK TABLES `oro_email_origin` WRITE;
/*!40000 ALTER TABLE `oro_email_origin` DISABLE KEYS */;
/*!40000 ALTER TABLE `oro_email_origin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oro_email_recipient`
--

DROP TABLE IF EXISTS `oro_email_recipient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oro_email_recipient` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email_id` int(11) DEFAULT NULL,
  `email_address_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_7DAF9656A832C1C9` (`email_id`),
  KEY `IDX_7DAF965659045DAA` (`email_address_id`),
  CONSTRAINT `FK_7DAF965659045DAA` FOREIGN KEY (`email_address_id`) REFERENCES `oro_email_address` (`id`),
  CONSTRAINT `FK_7DAF9656A832C1C9` FOREIGN KEY (`email_id`) REFERENCES `oro_email` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oro_email_recipient`
--

LOCK TABLES `oro_email_recipient` WRITE;
/*!40000 ALTER TABLE `oro_email_recipient` DISABLE KEYS */;
/*!40000 ALTER TABLE `oro_email_recipient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oro_email_template`
--

DROP TABLE IF EXISTS `oro_email_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oro_email_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `isSystem` tinyint(1) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `parent` int(11) DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8_unicode_ci,
  `entityName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQ_NAME` (`name`,`entityName`),
  KEY `email_name_idx` (`name`),
  KEY `email_is_system_idx` (`isSystem`),
  KEY `email_entity_name_idx` (`entityName`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oro_email_template`
--

LOCK TABLES `oro_email_template` WRITE;
/*!40000 ALTER TABLE `oro_email_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `oro_email_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oro_email_template_translation`
--

DROP TABLE IF EXISTS `oro_email_template_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oro_email_template_translation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` int(11) DEFAULT NULL,
  `locale` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `field` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `IDX_F42DCDB8232D562B` (`object_id`),
  KEY `lookup_unique_idx` (`locale`,`object_id`,`field`),
  CONSTRAINT `FK_F42DCDB8232D562B` FOREIGN KEY (`object_id`) REFERENCES `oro_email_template` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oro_email_template_translation`
--

LOCK TABLES `oro_email_template_translation` WRITE;
/*!40000 ALTER TABLE `oro_email_template_translation` DISABLE KEYS */;
/*!40000 ALTER TABLE `oro_email_template_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oro_entity_config`
--

DROP TABLE IF EXISTS `oro_entity_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oro_entity_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime DEFAULT NULL,
  `mode` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oro_entity_config`
--

LOCK TABLES `oro_entity_config` WRITE;
/*!40000 ALTER TABLE `oro_entity_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `oro_entity_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oro_entity_config_field`
--

DROP TABLE IF EXISTS `oro_entity_config_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oro_entity_config_field` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_id` int(11) DEFAULT NULL,
  `field_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime DEFAULT NULL,
  `mode` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_63EC23F781257D5D` (`entity_id`),
  CONSTRAINT `FK_63EC23F781257D5D` FOREIGN KEY (`entity_id`) REFERENCES `oro_entity_config` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oro_entity_config_field`
--

LOCK TABLES `oro_entity_config_field` WRITE;
/*!40000 ALTER TABLE `oro_entity_config_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `oro_entity_config_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oro_entity_config_log`
--

DROP TABLE IF EXISTS `oro_entity_config_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oro_entity_config_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `logged_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_4A4961FBA76ED395` (`user_id`),
  CONSTRAINT `FK_4A4961FBA76ED395` FOREIGN KEY (`user_id`) REFERENCES `oro_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oro_entity_config_log`
--

LOCK TABLES `oro_entity_config_log` WRITE;
/*!40000 ALTER TABLE `oro_entity_config_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `oro_entity_config_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oro_entity_config_log_diff`
--

DROP TABLE IF EXISTS `oro_entity_config_log_diff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oro_entity_config_log_diff` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `log_id` int(11) DEFAULT NULL,
  `class_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `field_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `scope` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `diff` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_D1F6D75AEA675D86` (`log_id`),
  CONSTRAINT `FK_D1F6D75AEA675D86` FOREIGN KEY (`log_id`) REFERENCES `oro_entity_config_log` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oro_entity_config_log_diff`
--

LOCK TABLES `oro_entity_config_log_diff` WRITE;
/*!40000 ALTER TABLE `oro_entity_config_log_diff` DISABLE KEYS */;
/*!40000 ALTER TABLE `oro_entity_config_log_diff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oro_entity_config_value`
--

DROP TABLE IF EXISTS `oro_entity_config_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oro_entity_config_value` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_id` int(11) DEFAULT NULL,
  `field_id` int(11) DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `scope` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8_unicode_ci,
  `serializable` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_256E3E9B81257D5D` (`entity_id`),
  KEY `IDX_256E3E9B443707B0` (`field_id`),
  CONSTRAINT `FK_256E3E9B443707B0` FOREIGN KEY (`field_id`) REFERENCES `oro_entity_config_field` (`id`),
  CONSTRAINT `FK_256E3E9B81257D5D` FOREIGN KEY (`entity_id`) REFERENCES `oro_entity_config` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oro_entity_config_value`
--

LOCK TABLES `oro_entity_config_value` WRITE;
/*!40000 ALTER TABLE `oro_entity_config_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `oro_entity_config_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oro_extend_orobundleuserbundleentitygroup`
--

DROP TABLE IF EXISTS `oro_extend_orobundleuserbundleentitygroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oro_extend_orobundleuserbundleentitygroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `__extend__parent_id` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_C7B0D9ADE28762AC` (`__extend__parent_id`),
  CONSTRAINT `FK_C7B0D9ADE28762AC` FOREIGN KEY (`__extend__parent_id`) REFERENCES `oro_access_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oro_extend_orobundleuserbundleentitygroup`
--

LOCK TABLES `oro_extend_orobundleuserbundleentitygroup` WRITE;
/*!40000 ALTER TABLE `oro_extend_orobundleuserbundleentitygroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `oro_extend_orobundleuserbundleentitygroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oro_extend_orobundleuserbundleentityuser`
--

DROP TABLE IF EXISTS `oro_extend_orobundleuserbundleentityuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oro_extend_orobundleuserbundleentityuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `__extend__parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_F742E127E28762AC` (`__extend__parent_id`),
  CONSTRAINT `FK_F742E127E28762AC` FOREIGN KEY (`__extend__parent_id`) REFERENCES `oro_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oro_extend_orobundleuserbundleentityuser`
--

LOCK TABLES `oro_extend_orobundleuserbundleentityuser` WRITE;
/*!40000 ALTER TABLE `oro_extend_orobundleuserbundleentityuser` DISABLE KEYS */;
/*!40000 ALTER TABLE `oro_extend_orobundleuserbundleentityuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oro_flexibleentity_attribute`
--

DROP TABLE IF EXISTS `oro_flexibleentity_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oro_flexibleentity_attribute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sort_order` int(11) NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `entity_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `attribute_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `backend_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `backend_storage` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `is_required` tinyint(1) NOT NULL,
  `is_unique` tinyint(1) NOT NULL,
  `default_value` text COLLATE utf8_unicode_ci,
  `is_searchable` tinyint(1) NOT NULL,
  `is_translatable` tinyint(1) NOT NULL,
  `is_scopable` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `searchunique_idx` (`code`,`entity_type`),
  KEY `searchcode_idx` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oro_flexibleentity_attribute`
--

LOCK TABLES `oro_flexibleentity_attribute` WRITE;
/*!40000 ALTER TABLE `oro_flexibleentity_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `oro_flexibleentity_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oro_flexibleentity_attribute_option`
--

DROP TABLE IF EXISTS `oro_flexibleentity_attribute_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oro_flexibleentity_attribute_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute_id` int(11) DEFAULT NULL,
  `is_translatable` tinyint(1) NOT NULL,
  `sort_order` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_EBE44235B6E62EFA` (`attribute_id`),
  CONSTRAINT `FK_EBE44235B6E62EFA` FOREIGN KEY (`attribute_id`) REFERENCES `oro_flexibleentity_attribute` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oro_flexibleentity_attribute_option`
--

LOCK TABLES `oro_flexibleentity_attribute_option` WRITE;
/*!40000 ALTER TABLE `oro_flexibleentity_attribute_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `oro_flexibleentity_attribute_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oro_flexibleentity_attribute_option_value`
--

DROP TABLE IF EXISTS `oro_flexibleentity_attribute_option_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oro_flexibleentity_attribute_option_value` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `option_id` int(11) NOT NULL,
  `locale_code` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_1D61C0B1A7C41D6F` (`option_id`),
  CONSTRAINT `FK_1D61C0B1A7C41D6F` FOREIGN KEY (`option_id`) REFERENCES `oro_flexibleentity_attribute_option` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oro_flexibleentity_attribute_option_value`
--

LOCK TABLES `oro_flexibleentity_attribute_option_value` WRITE;
/*!40000 ALTER TABLE `oro_flexibleentity_attribute_option_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `oro_flexibleentity_attribute_option_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oro_flexibleentity_attribute_translation`
--

DROP TABLE IF EXISTS `oro_flexibleentity_attribute_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oro_flexibleentity_attribute_translation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `foreign_key` int(11) NOT NULL,
  `content` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `locale` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `object_class` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `field` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `attribute_translation_idx` (`locale`,`object_class`,`field`,`foreign_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oro_flexibleentity_attribute_translation`
--

LOCK TABLES `oro_flexibleentity_attribute_translation` WRITE;
/*!40000 ALTER TABLE `oro_flexibleentity_attribute_translation` DISABLE KEYS */;
/*!40000 ALTER TABLE `oro_flexibleentity_attribute_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oro_flexibleentity_collection`
--

DROP TABLE IF EXISTS `oro_flexibleentity_collection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oro_flexibleentity_collection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` smallint(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oro_flexibleentity_collection`
--

LOCK TABLES `oro_flexibleentity_collection` WRITE;
/*!40000 ALTER TABLE `oro_flexibleentity_collection` DISABLE KEYS */;
/*!40000 ALTER TABLE `oro_flexibleentity_collection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oro_flexibleentity_media`
--

DROP TABLE IF EXISTS `oro_flexibleentity_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oro_flexibleentity_media` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `filepath` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `originalFilename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mimeType` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_B9C2616D3C0BE965` (`filename`),
  UNIQUE KEY `UNIQ_B9C2616D697C1C6C` (`filepath`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oro_flexibleentity_media`
--

LOCK TABLES `oro_flexibleentity_media` WRITE;
/*!40000 ALTER TABLE `oro_flexibleentity_media` DISABLE KEYS */;
/*!40000 ALTER TABLE `oro_flexibleentity_media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oro_flexibleentity_metric`
--

DROP TABLE IF EXISTS `oro_flexibleentity_metric`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oro_flexibleentity_metric` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data` decimal(10,0) DEFAULT NULL,
  `unit_code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oro_flexibleentity_metric`
--

LOCK TABLES `oro_flexibleentity_metric` WRITE;
/*!40000 ALTER TABLE `oro_flexibleentity_metric` DISABLE KEYS */;
/*!40000 ALTER TABLE `oro_flexibleentity_metric` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oro_flexibleentity_price`
--

DROP TABLE IF EXISTS `oro_flexibleentity_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oro_flexibleentity_price` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data` decimal(10,0) DEFAULT NULL,
  `currency_code` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oro_flexibleentity_price`
--

LOCK TABLES `oro_flexibleentity_price` WRITE;
/*!40000 ALTER TABLE `oro_flexibleentity_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `oro_flexibleentity_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oro_navigation_history`
--

DROP TABLE IF EXISTS `oro_navigation_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oro_navigation_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `url` varchar(1023) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `visited_at` datetime NOT NULL,
  `visit_count` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_B20613B9A76ED395` (`user_id`),
  CONSTRAINT `FK_B20613B9A76ED395` FOREIGN KEY (`user_id`) REFERENCES `oro_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oro_navigation_history`
--

LOCK TABLES `oro_navigation_history` WRITE;
/*!40000 ALTER TABLE `oro_navigation_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `oro_navigation_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oro_navigation_item`
--

DROP TABLE IF EXISTS `oro_navigation_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oro_navigation_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `type` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(1023) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `position` smallint(6) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_323B0258A76ED395` (`user_id`),
  KEY `sorted_items_idx` (`user_id`,`position`),
  CONSTRAINT `FK_323B0258A76ED395` FOREIGN KEY (`user_id`) REFERENCES `oro_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oro_navigation_item`
--

LOCK TABLES `oro_navigation_item` WRITE;
/*!40000 ALTER TABLE `oro_navigation_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `oro_navigation_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oro_navigation_item_pinbar`
--

DROP TABLE IF EXISTS `oro_navigation_item_pinbar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oro_navigation_item_pinbar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `maximized` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_54973433126F525E` (`item_id`),
  CONSTRAINT `FK_54973433126F525E` FOREIGN KEY (`item_id`) REFERENCES `oro_navigation_item` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oro_navigation_item_pinbar`
--

LOCK TABLES `oro_navigation_item_pinbar` WRITE;
/*!40000 ALTER TABLE `oro_navigation_item_pinbar` DISABLE KEYS */;
/*!40000 ALTER TABLE `oro_navigation_item_pinbar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oro_navigation_pagestate`
--

DROP TABLE IF EXISTS `oro_navigation_pagestate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oro_navigation_pagestate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `page_id` varchar(4000) COLLATE utf8_unicode_ci NOT NULL,
  `page_hash` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `data` longtext COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8B43985B567C7E62` (`page_hash`),
  KEY `IDX_8B43985BA76ED395` (`user_id`),
  CONSTRAINT `FK_8B43985BA76ED395` FOREIGN KEY (`user_id`) REFERENCES `oro_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oro_navigation_pagestate`
--

LOCK TABLES `oro_navigation_pagestate` WRITE;
/*!40000 ALTER TABLE `oro_navigation_pagestate` DISABLE KEYS */;
/*!40000 ALTER TABLE `oro_navigation_pagestate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oro_navigation_title`
--

DROP TABLE IF EXISTS `oro_navigation_title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oro_navigation_title` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `route` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_system` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_route` (`route`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oro_navigation_title`
--

LOCK TABLES `oro_navigation_title` WRITE;
/*!40000 ALTER TABLE `oro_navigation_title` DISABLE KEYS */;
/*!40000 ALTER TABLE `oro_navigation_title` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oro_notification_email_spool`
--

DROP TABLE IF EXISTS `oro_notification_email_spool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oro_notification_email_spool` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` int(11) NOT NULL,
  `message` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `notification_spool_status_idx` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oro_notification_email_spool`
--

LOCK TABLES `oro_notification_email_spool` WRITE;
/*!40000 ALTER TABLE `oro_notification_email_spool` DISABLE KEYS */;
/*!40000 ALTER TABLE `oro_notification_email_spool` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oro_notification_emailnotification`
--

DROP TABLE IF EXISTS `oro_notification_emailnotification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oro_notification_emailnotification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) DEFAULT NULL,
  `template_id` int(11) DEFAULT NULL,
  `recipient_list_id` int(11) DEFAULT NULL,
  `entity_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_F3D05A52B9E3E89` (`recipient_list_id`),
  KEY `IDX_F3D05A571F7E88B` (`event_id`),
  KEY `IDX_F3D05A55DA0FB8` (`template_id`),
  CONSTRAINT `FK_F3D05A52B9E3E89` FOREIGN KEY (`recipient_list_id`) REFERENCES `oro_notification_recipient_list` (`id`),
  CONSTRAINT `FK_F3D05A55DA0FB8` FOREIGN KEY (`template_id`) REFERENCES `oro_email_template` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_F3D05A571F7E88B` FOREIGN KEY (`event_id`) REFERENCES `oro_notification_event` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oro_notification_emailnotification`
--

LOCK TABLES `oro_notification_emailnotification` WRITE;
/*!40000 ALTER TABLE `oro_notification_emailnotification` DISABLE KEYS */;
/*!40000 ALTER TABLE `oro_notification_emailnotification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oro_notification_event`
--

DROP TABLE IF EXISTS `oro_notification_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oro_notification_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_2E2482DF5E237E06` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oro_notification_event`
--

LOCK TABLES `oro_notification_event` WRITE;
/*!40000 ALTER TABLE `oro_notification_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `oro_notification_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oro_notification_recipient_group`
--

DROP TABLE IF EXISTS `oro_notification_recipient_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oro_notification_recipient_group` (
  `recipient_list_id` int(11) NOT NULL,
  `group_id` smallint(6) NOT NULL,
  PRIMARY KEY (`recipient_list_id`,`group_id`),
  KEY `IDX_F6E3D23E2B9E3E89` (`recipient_list_id`),
  KEY `IDX_F6E3D23EFE54D947` (`group_id`),
  CONSTRAINT `FK_F6E3D23EFE54D947` FOREIGN KEY (`group_id`) REFERENCES `oro_access_group` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_F6E3D23E2B9E3E89` FOREIGN KEY (`recipient_list_id`) REFERENCES `oro_notification_recipient_list` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oro_notification_recipient_group`
--

LOCK TABLES `oro_notification_recipient_group` WRITE;
/*!40000 ALTER TABLE `oro_notification_recipient_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `oro_notification_recipient_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oro_notification_recipient_list`
--

DROP TABLE IF EXISTS `oro_notification_recipient_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oro_notification_recipient_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `owner` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oro_notification_recipient_list`
--

LOCK TABLES `oro_notification_recipient_list` WRITE;
/*!40000 ALTER TABLE `oro_notification_recipient_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `oro_notification_recipient_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oro_notification_recipient_user`
--

DROP TABLE IF EXISTS `oro_notification_recipient_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oro_notification_recipient_user` (
  `recipient_list_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`recipient_list_id`,`user_id`),
  KEY `IDX_CAC79D892B9E3E89` (`recipient_list_id`),
  KEY `IDX_CAC79D89A76ED395` (`user_id`),
  CONSTRAINT `FK_CAC79D89A76ED395` FOREIGN KEY (`user_id`) REFERENCES `oro_user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_CAC79D892B9E3E89` FOREIGN KEY (`recipient_list_id`) REFERENCES `oro_notification_recipient_list` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oro_notification_recipient_user`
--

LOCK TABLES `oro_notification_recipient_user` WRITE;
/*!40000 ALTER TABLE `oro_notification_recipient_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `oro_notification_recipient_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oro_organization`
--

DROP TABLE IF EXISTS `oro_organization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oro_organization` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `currency` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `currency_precision` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oro_organization`
--

LOCK TABLES `oro_organization` WRITE;
/*!40000 ALTER TABLE `oro_organization` DISABLE KEYS */;
/*!40000 ALTER TABLE `oro_organization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oro_search_index_datetime`
--

DROP TABLE IF EXISTS `oro_search_index_datetime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oro_search_index_datetime` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `field` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `value` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_459F212A126F525E` (`item_id`),
  CONSTRAINT `FK_459F212A126F525E` FOREIGN KEY (`item_id`) REFERENCES `oro_search_item` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oro_search_index_datetime`
--

LOCK TABLES `oro_search_index_datetime` WRITE;
/*!40000 ALTER TABLE `oro_search_index_datetime` DISABLE KEYS */;
/*!40000 ALTER TABLE `oro_search_index_datetime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oro_search_index_decimal`
--

DROP TABLE IF EXISTS `oro_search_index_decimal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oro_search_index_decimal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `field` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `value` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_E0B9BB33126F525E` (`item_id`),
  CONSTRAINT `FK_E0B9BB33126F525E` FOREIGN KEY (`item_id`) REFERENCES `oro_search_item` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oro_search_index_decimal`
--

LOCK TABLES `oro_search_index_decimal` WRITE;
/*!40000 ALTER TABLE `oro_search_index_decimal` DISABLE KEYS */;
/*!40000 ALTER TABLE `oro_search_index_decimal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oro_search_index_integer`
--

DROP TABLE IF EXISTS `oro_search_index_integer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oro_search_index_integer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `field` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `value` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_E04BA3AB126F525E` (`item_id`),
  CONSTRAINT `FK_E04BA3AB126F525E` FOREIGN KEY (`item_id`) REFERENCES `oro_search_item` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oro_search_index_integer`
--

LOCK TABLES `oro_search_index_integer` WRITE;
/*!40000 ALTER TABLE `oro_search_index_integer` DISABLE KEYS */;
/*!40000 ALTER TABLE `oro_search_index_integer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oro_search_index_text`
--

DROP TABLE IF EXISTS `oro_search_index_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oro_search_index_text` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `field` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_A0243539126F525E` (`item_id`)
) ENGINE=MyISAM AUTO_INCREMENT=169 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oro_search_index_text`
--

LOCK TABLES `oro_search_index_text` WRITE;
/*!40000 ALTER TABLE `oro_search_index_text` DISABLE KEYS */;
/*!40000 ALTER TABLE `oro_search_index_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oro_search_item`
--

DROP TABLE IF EXISTS `oro_search_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oro_search_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entity` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `record_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `changed` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_ENTITY` (`entity`,`record_id`),
  KEY `IDX_ALIAS` (`alias`)
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oro_search_item`
--

LOCK TABLES `oro_search_item` WRITE;
/*!40000 ALTER TABLE `oro_search_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `oro_search_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oro_search_query`
--

DROP TABLE IF EXISTS `oro_search_query`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oro_search_query` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entity` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `query` longtext COLLATE utf8_unicode_ci NOT NULL,
  `result_count` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oro_search_query`
--

LOCK TABLES `oro_search_query` WRITE;
/*!40000 ALTER TABLE `oro_search_query` DISABLE KEYS */;
/*!40000 ALTER TABLE `oro_search_query` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oro_session`
--

DROP TABLE IF EXISTS `oro_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oro_session` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sess_data` longtext COLLATE utf8_unicode_ci NOT NULL,
  `sess_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oro_session`
--

LOCK TABLES `oro_session` WRITE;
/*!40000 ALTER TABLE `oro_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `oro_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oro_tag_tag`
--

DROP TABLE IF EXISTS `oro_tag_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oro_tag_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `user_owner_id` int(11) DEFAULT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_CAF0DB575E237E06` (`name`),
  KEY `IDX_CAF0DB57DE12AB56` (`created_by`),
  KEY `IDX_CAF0DB5716FE72E1` (`updated_by`),
  KEY `IDX_CAF0DB579EB185F9` (`user_owner_id`),
  CONSTRAINT `FK_CAF0DB579EB185F9` FOREIGN KEY (`user_owner_id`) REFERENCES `oro_user` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_CAF0DB5716FE72E1` FOREIGN KEY (`updated_by`) REFERENCES `oro_user` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_CAF0DB57DE12AB56` FOREIGN KEY (`created_by`) REFERENCES `oro_user` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oro_tag_tag`
--

LOCK TABLES `oro_tag_tag` WRITE;
/*!40000 ALTER TABLE `oro_tag_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `oro_tag_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oro_tag_tagging`
--

DROP TABLE IF EXISTS `oro_tag_tagging`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oro_tag_tagging` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_id` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `alias` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `entity_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `record_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tagging_idx` (`tag_id`,`entity_name`,`record_id`,`created_by`),
  KEY `IDX_50107502BAD26311` (`tag_id`),
  KEY `IDX_50107502DE12AB56` (`created_by`),
  CONSTRAINT `FK_50107502DE12AB56` FOREIGN KEY (`created_by`) REFERENCES `oro_user` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_50107502BAD26311` FOREIGN KEY (`tag_id`) REFERENCES `oro_tag_tag` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oro_tag_tagging`
--

LOCK TABLES `oro_tag_tagging` WRITE;
/*!40000 ALTER TABLE `oro_tag_tagging` DISABLE KEYS */;
/*!40000 ALTER TABLE `oro_tag_tagging` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oro_user`
--

DROP TABLE IF EXISTS `oro_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oro_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `business_unit_owner_id` int(11) DEFAULT NULL,
  `status_id` smallint(6) DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `firstname` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastname` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `confirmation_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_requested` datetime DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `login_count` int(10) unsigned NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_F82840BCF85E0677` (`username`),
  UNIQUE KEY `UNIQ_F82840BCE7927C74` (`email`),
  UNIQUE KEY `UNIQ_F82840BC6BF700BD` (`status_id`),
  KEY `IDX_F82840BC59294170` (`business_unit_owner_id`),
  CONSTRAINT `FK_F82840BC6BF700BD` FOREIGN KEY (`status_id`) REFERENCES `oro_user_status` (`id`),
  CONSTRAINT `FK_F82840BC59294170` FOREIGN KEY (`business_unit_owner_id`) REFERENCES `oro_business_unit` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oro_user`
--

LOCK TABLES `oro_user` WRITE;
/*!40000 ALTER TABLE `oro_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `oro_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oro_user_access_group`
--

DROP TABLE IF EXISTS `oro_user_access_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oro_user_access_group` (
  `user_id` int(11) NOT NULL,
  `group_id` smallint(6) NOT NULL,
  PRIMARY KEY (`user_id`,`group_id`),
  KEY `IDX_EC003EF3A76ED395` (`user_id`),
  KEY `IDX_EC003EF3FE54D947` (`group_id`),
  CONSTRAINT `FK_EC003EF3FE54D947` FOREIGN KEY (`group_id`) REFERENCES `oro_access_group` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_EC003EF3A76ED395` FOREIGN KEY (`user_id`) REFERENCES `oro_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oro_user_access_group`
--

LOCK TABLES `oro_user_access_group` WRITE;
/*!40000 ALTER TABLE `oro_user_access_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `oro_user_access_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oro_user_access_group_role`
--

DROP TABLE IF EXISTS `oro_user_access_group_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oro_user_access_group_role` (
  `group_id` smallint(6) NOT NULL,
  `role_id` smallint(6) NOT NULL,
  PRIMARY KEY (`group_id`,`role_id`),
  KEY `IDX_E7E7E38EFE54D947` (`group_id`),
  KEY `IDX_E7E7E38ED60322AC` (`role_id`),
  CONSTRAINT `FK_E7E7E38ED60322AC` FOREIGN KEY (`role_id`) REFERENCES `oro_access_role` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_E7E7E38EFE54D947` FOREIGN KEY (`group_id`) REFERENCES `oro_access_group` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oro_user_access_group_role`
--

LOCK TABLES `oro_user_access_group_role` WRITE;
/*!40000 ALTER TABLE `oro_user_access_group_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `oro_user_access_group_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oro_user_access_role`
--

DROP TABLE IF EXISTS `oro_user_access_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oro_user_access_role` (
  `user_id` int(11) NOT NULL,
  `role_id` smallint(6) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `IDX_290571BEA76ED395` (`user_id`),
  KEY `IDX_290571BED60322AC` (`role_id`),
  CONSTRAINT `FK_290571BED60322AC` FOREIGN KEY (`role_id`) REFERENCES `oro_access_role` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_290571BEA76ED395` FOREIGN KEY (`user_id`) REFERENCES `oro_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oro_user_access_role`
--

LOCK TABLES `oro_user_access_role` WRITE;
/*!40000 ALTER TABLE `oro_user_access_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `oro_user_access_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oro_user_acl`
--

DROP TABLE IF EXISTS `oro_user_acl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oro_user_acl` (
  `id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `parent_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `class` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `method` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lft` int(11) NOT NULL,
  `lvl` int(11) NOT NULL,
  `rgt` int(11) NOT NULL,
  `root` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_38EEDC8E727ACA70` (`parent_id`),
  KEY `class_method_idx` (`class`,`method`),
  KEY `lft_idx` (`lft`),
  KEY `lvl_idx` (`lvl`),
  KEY `rgt_idx` (`rgt`),
  KEY `root_idx` (`root`),
  CONSTRAINT `FK_38EEDC8E727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `oro_user_acl` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oro_user_acl`
--

LOCK TABLES `oro_user_acl` WRITE;
/*!40000 ALTER TABLE `oro_user_acl` DISABLE KEYS */;
INSERT INTO `oro_user_acl` VALUES ('bazinga_expose_translation','external_bundle_actions','Frontend translations','Frontend translations provided by APY/JsFormValidationBundle and Bazinga/ExposeTranslationBundle','Bazinga\\ExposeTranslationBundle\\Controller\\Controller','exposeTranslationAction',503,2,504,'root'),('external_bundle_actions','root','External bundle actions','General node for all external bundle actions',NULL,NULL,502,1,505,'root'),('oro_business_unit','root','Business Unit manipulation','Business Unit manipulation',NULL,NULL,108,1,119,'root'),('oro_business_unit_create','oro_business_unit','Create business unit','Create new business unit','Oro\\Bundle\\OrganizationBundle\\Controller\\BusinessUnitController','createAction',109,2,110,'root'),('oro_business_unit_delete','oro_business_unit','Delete business unit','User can delete business units','Oro\\Bundle\\OrganizationBundle\\Controller\\Api\\Rest\\BusinessUnitController','deleteAction',117,2,118,'root'),('oro_business_unit_list','oro_business_unit','View business units list','List of business units','Oro\\Bundle\\OrganizationBundle\\Controller\\BusinessUnitController','indexAction',115,2,116,'root'),('oro_business_unit_update','oro_business_unit','Edit business unit','Edit business unit','Oro\\Bundle\\OrganizationBundle\\Controller\\BusinessUnitController','updateAction',113,2,114,'root'),('oro_business_unit_view','oro_business_unit','View business unit','View business unit','Oro\\Bundle\\OrganizationBundle\\Controller\\BusinessUnitController','viewAction',111,2,112,'root'),('oro_change_record_owner','root','Change record owner','Permission for record owner changing',NULL,NULL,506,1,507,'root'),('oro_cron_job','root','Cron job','Cron job management',NULL,NULL,184,1,193,'root'),('oro_cron_job_list','oro_cron_job','View job list','View job list','Oro\\Bundle\\CronBundle\\Controller\\JobController','indexAction',185,2,186,'root'),('oro_cron_job_run','oro_cron_job','Run daemon','Run job queue daemon in background','Oro\\Bundle\\CronBundle\\Controller\\JobController','runDaemonAction',189,2,190,'root'),('oro_cron_job_stop','oro_cron_job','Stop daemon','Stop job queue daemon','Oro\\Bundle\\CronBundle\\Controller\\JobController','stopDaemonAction',191,2,192,'root'),('oro_cron_job_view','oro_cron_job','View job','View job details','Oro\\Bundle\\CronBundle\\Controller\\JobController','viewAction',187,2,188,'root'),('oro_dataaudit','root','Data audit','Data audit',NULL,NULL,86,1,91,'root'),('oro_dataaudit_history','oro_dataaudit','View entity history','View entity history audit log','Oro\\Bundle\\DataAuditBundle\\Controller\\AuditController','historyAction',89,2,90,'root'),('oro_dataaudit_index','oro_dataaudit','View audit stream','View audit stream','Oro\\Bundle\\DataAuditBundle\\Controller\\AuditController','indexAction',87,2,88,'root'),('oro_email','root','Email manipulation','Email manipulation',NULL,NULL,130,1,133,'root'),('oro_email_emailtemplate','root','Email templates','Email templates manipulation',NULL,NULL,134,1,147,'root'),('oro_email_emailtemplate_clone','oro_email_emailtemplate','Clone email template','Clone email template','Oro\\Bundle\\EmailBundle\\Controller\\EmailTemplateController','cloneAction',141,2,142,'root'),('oro_email_emailtemplate_create','oro_email_emailtemplate','Create email template','Create email template','Oro\\Bundle\\EmailBundle\\Controller\\EmailTemplateController','createAction',139,2,140,'root'),('oro_email_emailtemplate_index','oro_email_emailtemplate','View List of email templates','View List of email templates','Oro\\Bundle\\EmailBundle\\Controller\\EmailTemplateController','indexAction',135,2,136,'root'),('oro_email_emailtemplate_preview','oro_email_emailtemplate','Preview email template','Preview email template','Oro\\Bundle\\EmailBundle\\Controller\\EmailTemplateController','previewAction',143,2,144,'root'),('oro_email_emailtemplate_remove','oro_email_emailtemplate','Delete email template','Delete email template','Oro\\Bundle\\EmailBundle\\Controller\\Api\\Rest\\EmailTemplateController','deleteAction',145,2,146,'root'),('oro_email_emailtemplate_update','oro_email_emailtemplate','Edit email template','Edit email template','Oro\\Bundle\\EmailBundle\\Controller\\EmailTemplateController','updateAction',137,2,138,'root'),('oro_email_view','oro_email','View email','View email','Oro\\Bundle\\EmailBundle\\Controller\\EmailController','viewAction',131,2,132,'root'),('oro_entityconfig','root','Entity config manipulation','Entity config manipulation',NULL,NULL,148,1,161,'root'),('oro_entityconfig_audit','oro_entityconfig','View entity history','View entity history audit log','Oro\\Bundle\\EntityConfigBundle\\Controller\\AuditController','auditAction',149,2,150,'root'),('oro_entityconfig_audit_field','oro_entityconfig','View entity\'s field history','View entity\'s field history audit log','Oro\\Bundle\\EntityConfigBundle\\Controller\\AuditController','auditFieldAction',151,2,152,'root'),('oro_entityconfig_field_update','oro_entityconfig','Update entity field','Update configurable entity field','Oro\\Bundle\\EntityConfigBundle\\Controller\\ConfigController','fieldUpdateAction',159,2,160,'root'),('oro_entityconfig_index','oro_entityconfig','View entities','View configurable entities','Oro\\Bundle\\EntityConfigBundle\\Controller\\ConfigController','indexAction',153,2,154,'root'),('oro_entityconfig_update','oro_entityconfig','Update entity','Update configurable entity','Oro\\Bundle\\EntityConfigBundle\\Controller\\ConfigController','updateAction',155,2,156,'root'),('oro_entityconfig_view','oro_entityconfig','View entity','View configurable entity','Oro\\Bundle\\EntityConfigBundle\\Controller\\ConfigController','viewAction',157,2,158,'root'),('oro_entityextend','root','Entity extend manipulation','Entity extend manipulation',NULL,NULL,162,1,183,'root'),('oro_entityextend_apply','oro_entityextend','Validate changes','Validate entityconfig changes','Oro\\Bundle\\EntityExtendBundle\\Controller\\ApplyController','applyAction',163,2,164,'root'),('oro_entityextend_entity_create','oro_entityextend','Create custom entity','Create custom entity','Oro\\Bundle\\EntityExtendBundle\\Controller\\ConfigEntityGridController','createAction',177,2,178,'root'),('oro_entityextend_entity_remove','oro_entityextend','Remove custom entity','Remove custom entity','Oro\\Bundle\\EntityExtendBundle\\Controller\\ConfigEntityGridController','removeAction',179,2,180,'root'),('oro_entityextend_entity_unique_key','oro_entityextend','Unique keys','Update entity unique keys','Oro\\Bundle\\EntityExtendBundle\\Controller\\ConfigEntityGridController','uniqueAction',175,2,176,'root'),('oro_entityextend_entity_unremove','oro_entityextend','Unremove custom entity','Unremove custom entity','Oro\\Bundle\\EntityExtendBundle\\Controller\\ConfigEntityGridController','unremoveAction',181,2,182,'root'),('oro_entityextend_field_create','oro_entityextend','Create custom field','Update entity create custom field','Oro\\Bundle\\EntityExtendBundle\\Controller\\ConfigFieldGridController','createAction',167,2,168,'root'),('oro_entityextend_field_remove','oro_entityextend','Remove custom field','Update entity remove custom field','Oro\\Bundle\\EntityExtendBundle\\Controller\\ConfigFieldGridController','removeAction',171,2,172,'root'),('oro_entityextend_field_unremove','oro_entityextend','UnRemove custom field','Update entity Unremove custom field','Oro\\Bundle\\EntityExtendBundle\\Controller\\ConfigFieldGridController','unremoveAction',173,2,174,'root'),('oro_entityextend_field_update','oro_entityextend','Update custom field','Update entity update custom field','Oro\\Bundle\\EntityExtendBundle\\Controller\\ConfigFieldGridController','updateAction',169,2,170,'root'),('oro_entityextend_update','oro_entityextend','Apply changes','Apply entityconfig changes','Oro\\Bundle\\EntityExtendBundle\\Controller\\ApplyController','updateAction',165,2,166,'root'),('oro_form_autocomplete','root','Autocomplete functionality','Actions from autocomplete controller',NULL,NULL,22,1,25,'root'),('oro_form_autocomplete_search','oro_form_autocomplete','Autocomplete search request','Autocomplete search request','Oro\\Bundle\\FormBundle\\Controller\\AutocompleteController','searchAction',23,2,24,'root'),('oro_grid','root','Grid manipulation','Grid manipulation',NULL,NULL,82,1,85,'root'),('oro_grid_mass_action','oro_grid','Datagrid mass action','Datagrid mass action entry point','Oro\\Bundle\\GridBundle\\Controller\\MassActionController','massActionAction',83,2,84,'root'),('oro_login','oro_security','Login page','Oro Login page','Oro\\Bundle\\UserBundle\\Controller\\SecurityController','loginAction',3,2,4,'root'),('oro_login_check','oro_security','Login check','Oro Login check','Oro\\Bundle\\UserBundle\\Controller\\SecurityController','checkAction',5,2,6,'root'),('oro_logout','oro_security','Logout','Oro Logout','Oro\\Bundle\\UserBundle\\Controller\\SecurityController','logoutAction',7,2,8,'root'),('oro_notification_emailnotification','root','Transactional emails','Notification rules manipulation',NULL,NULL,120,1,129,'root'),('oro_notification_emailnotification_create','oro_notification_emailnotification','Create notification rule','Create notification rule','Oro\\Bundle\\NotificationBundle\\Controller\\EmailNotificationController','createAction',127,2,128,'root'),('oro_notification_emailnotification_index','oro_notification_emailnotification','View List of notification rules','View list of notification rules','Oro\\Bundle\\NotificationBundle\\Controller\\EmailNotificationController','indexAction',123,2,124,'root'),('oro_notification_emailnotification_remove','oro_notification_emailnotification','Delete notification rule','Delete notification rule','Oro\\Bundle\\NotificationBundle\\Controller\\Api\\Rest\\EmailNotificationController','deleteAction',121,2,122,'root'),('oro_notification_emailnotification_update','oro_notification_emailnotification','Edit notification rule','Edit notification rule','Oro\\Bundle\\NotificationBundle\\Controller\\EmailNotificationController','updateAction',125,2,126,'root'),('oro_reset_check_email','oro_reset_controller','reset password check email','Tell the user to check his email provider','Oro\\Bundle\\UserBundle\\Controller\\ResetController','checkEmailAction',14,3,15,'root'),('oro_reset_controller','oro_security','Reset user password','Reset user password',NULL,NULL,9,2,18,'root'),('oro_reset_password','oro_reset_controller','reset password','Reset user password','Oro\\Bundle\\UserBundle\\Controller\\ResetController','resetAction',16,3,17,'root'),('oro_reset_request','oro_reset_controller','reset password','Oro Reset password page','Oro\\Bundle\\UserBundle\\Controller\\ResetController','requestAction',10,3,11,'root'),('oro_reset_send_mail','oro_reset_controller','send reset mail','Request reset user password','Oro\\Bundle\\UserBundle\\Controller\\ResetController','sendEmailAction',12,3,13,'root'),('oro_security','root','Oro Security','Oro security',NULL,NULL,2,1,19,'root'),('oro_tag','root','Tags','Tags',NULL,NULL,92,1,107,'root'),('oro_tag_assign_unassign','oro_tag','Tag assign/unassign','User can assign tags for entities and unassign only which were assigned by this user',NULL,NULL,101,2,102,'root'),('oro_tag_create','oro_tag','Create tag','User can create tags from grid','Oro\\Bundle\\TagBundle\\Controller\\TagController','createAction',95,2,96,'root'),('oro_tag_delete','oro_tag','Delete tags','User can delete tags','Oro\\Bundle\\TagBundle\\Controller\\Api\\Rest\\TagController','deleteAction',99,2,100,'root'),('oro_tag_list','oro_tag','View list of tags','User can see grid of tags','Oro\\Bundle\\TagBundle\\Controller\\TagController','indexAction',93,2,94,'root'),('oro_tag_unassign_global','oro_tag','Tag unassign global','User can unassign all tags from entities',NULL,NULL,103,2,104,'root'),('oro_tag_update','oro_tag','Update tag','User can edit tags','Oro\\Bundle\\TagBundle\\Controller\\TagController','updateAction',97,2,98,'root'),('oro_tag_view_tag_cloud','oro_tag','View tag cloud','User can view tag cloud',NULL,NULL,105,2,106,'root'),('oro_user','root','User manipulation','General node for all manipulations with users',NULL,NULL,40,1,61,'root'),('oro_user_acl','oro_user_role','ACL manipulation','ACL manipulation from API',NULL,NULL,69,2,76,'root'),('oro_user_acl_edit','oro_user_acl','View ACL tree','View ACL tree for a particular role','Oro\\Bundle\\UserBundle\\Controller\\Api\\Rest\\AclController','cgetAction',70,3,71,'root'),('oro_user_acl_show','oro_user_acl','View ACL resource','View ACL resource','Oro\\Bundle\\UserBundle\\Controller\\Api\\Rest\\AclController','getAction',72,3,73,'root'),('oro_user_group','root','Group manipulation','Group manipulation',NULL,NULL,26,1,39,'root'),('oro_user_group_create','oro_user_group','Create group','Create new group','Oro\\Bundle\\UserBundle\\Controller\\GroupController','createAction',27,2,28,'root'),('oro_user_group_list','oro_user_group','View group list','List of groups','Oro\\Bundle\\UserBundle\\Controller\\GroupController','indexAction',31,2,32,'root'),('oro_user_group_remove','oro_user_group','Remove group','Remove group','Oro\\Bundle\\UserBundle\\Controller\\Api\\Rest\\GroupController','deleteAction',35,2,36,'root'),('oro_user_group_roles','oro_user_group','View group roles','View group roles','Oro\\Bundle\\UserBundle\\Controller\\Api\\Rest\\GroupController','getRolesAction',37,2,38,'root'),('oro_user_group_show','oro_user_group','View user group','View user group','Oro\\Bundle\\UserBundle\\Controller\\Api\\Rest\\GroupController','getAction',33,2,34,'root'),('oro_user_group_update','oro_user_group','Edit group','Edit group','Oro\\Bundle\\UserBundle\\Controller\\GroupController','updateAction',29,2,30,'root'),('oro_user_role','root','Role manipulation','Role manipulation',NULL,NULL,62,1,81,'root'),('oro_user_role_acl','oro_user_acl','Role ACL manipulation','Role ACL manipulation','Oro\\Bundle\\UserBundle\\Controller\\Api\\Rest\\RoleController','postAclAction',74,3,75,'root'),('oro_user_role_create','oro_user_role','Create role','Create new role','Oro\\Bundle\\UserBundle\\Controller\\RoleController','createAction',63,2,64,'root'),('oro_user_role_list','oro_user_role','View role list','List of roles','Oro\\Bundle\\UserBundle\\Controller\\RoleController','indexAction',67,2,68,'root'),('oro_user_role_remove','oro_user_role','Remove role','Remove role','Oro\\Bundle\\UserBundle\\Controller\\Api\\Rest\\RoleController','deleteAction',79,2,80,'root'),('oro_user_role_show','oro_user_role','View role','View role','Oro\\Bundle\\UserBundle\\Controller\\Api\\Rest\\RoleController','getAction',77,2,78,'root'),('oro_user_role_update','oro_user_role','Edit role','Edit role','Oro\\Bundle\\UserBundle\\Controller\\RoleController','updateAction',65,2,66,'root'),('oro_user_user','oro_user','User manipulation','User manipulation',NULL,NULL,41,2,54,'root'),('oro_user_user_acl','oro_user','View user ACL','View user\'s granted ACL resources','Oro\\Bundle\\UserBundle\\Controller\\Api\\Rest\\UserController','getAclAction',59,2,60,'root'),('oro_user_user_apigen','oro_user_user','Generate new API key','Generate new API key','Oro\\Bundle\\UserBundle\\Controller\\UserController','apigenAction',44,3,45,'root'),('oro_user_user_create','oro_user_user','Create user','Create user','Oro\\Bundle\\UserBundle\\Controller\\UserController','createAction',46,3,47,'root'),('oro_user_user_delete','oro_user_user','Remove user user','Remove user user','Oro\\Bundle\\UserBundle\\Controller\\Api\\Rest\\UserController','deleteAction',52,3,53,'root'),('oro_user_user_groups','oro_user','View user groups','View user groups','Oro\\Bundle\\UserBundle\\Controller\\Api\\Rest\\UserController','getGroupsAction',57,2,58,'root'),('oro_user_user_list','oro_user_user','View list of users','View list of users','Oro\\Bundle\\UserBundle\\Controller\\UserController','indexAction',50,3,51,'root'),('oro_user_user_roles','oro_user','View user roles','View user roles','Oro\\Bundle\\UserBundle\\Controller\\Api\\Rest\\UserController','getRolesAction',55,2,56,'root'),('oro_user_user_update','oro_user_user','Edit user','Edit user','Oro\\Bundle\\UserBundle\\Controller\\UserController','updateAction',48,3,49,'root'),('oro_user_user_view','oro_user_user','View user user','View user user','Oro\\Bundle\\UserBundle\\Controller\\UserController','viewAction',42,3,43,'root'),('pim_catalog','root','PIM Catalog','General node for catalog management',NULL,NULL,194,1,455,'root'),('pim_catalog_attribute','pim_catalog','Attribute manipulation','Attribute manipulation',NULL,NULL,243,2,252,'root'),('pim_catalog_attribute_create','pim_catalog_attribute','Create an attribute','Create an attribute','Pim\\Bundle\\CatalogBundle\\Controller\\ProductAttributeController','createAction',246,3,247,'root'),('pim_catalog_attribute_edit','pim_catalog_attribute','Edit an attribute','Edit an attribute','Pim\\Bundle\\CatalogBundle\\Controller\\ProductAttributeController','editAction',248,3,249,'root'),('pim_catalog_attribute_group','pim_catalog','Attribute group manipulation','Attribute group manipulation',NULL,NULL,213,2,226,'root'),('pim_catalog_attribute_group_add_attribute','pim_catalog_attribute_group','Add attribute to group','Add attribute to group','Pim\\Bundle\\CatalogBundle\\Controller\\AttributeGroupController','addProductAttributesAction',222,3,223,'root'),('pim_catalog_attribute_group_create','pim_catalog_attribute_group','Create group','Create group','Pim\\Bundle\\CatalogBundle\\Controller\\AttributeGroupController','createAction',214,3,215,'root'),('pim_catalog_attribute_group_edit','pim_catalog_attribute_group','Edit group','Edit group','Pim\\Bundle\\CatalogBundle\\Controller\\AttributeGroupController','editAction',216,3,217,'root'),('pim_catalog_attribute_group_remove','pim_catalog_attribute_group','Remove group','Remove group','Pim\\Bundle\\CatalogBundle\\Controller\\AttributeGroupController','removeAction',220,3,221,'root'),('pim_catalog_attribute_group_remove_attribute','pim_catalog_attribute_group','Remove attribute from a group','Remove attribute from a group','Pim\\Bundle\\CatalogBundle\\Controller\\AttributeGroupController','removeProductAttributeAction',224,3,225,'root'),('pim_catalog_attribute_group_sort','pim_catalog_attribute_group','Sort groups','Sort groups','Pim\\Bundle\\CatalogBundle\\Controller\\AttributeGroupController','sortAction',218,3,219,'root'),('pim_catalog_attribute_index','pim_catalog_attribute','View attribute list','View attribute list','Pim\\Bundle\\CatalogBundle\\Controller\\ProductAttributeController','indexAction',244,3,245,'root'),('pim_catalog_attribute_sort','pim_catalog_attribute','Sort attribute options','Sort attribute options','Pim\\Bundle\\CatalogBundle\\Controller\\ProductAttributeController','sortAction',250,3,251,'root'),('pim_catalog_category','pim_catalog','Category manipulation','Category manipulation',NULL,NULL,227,2,242,'root'),('pim_catalog_category_children','pim_catalog_category','See category children','See category children','Pim\\Bundle\\CatalogBundle\\Controller\\CategoryTreeController','childrenAction',232,3,233,'root'),('pim_catalog_category_create','pim_catalog_category','Create a category','Create a category','Pim\\Bundle\\CatalogBundle\\Controller\\CategoryTreeController','createAction',236,3,237,'root'),('pim_catalog_category_edit','pim_catalog_category','Edit a category','Edit a category','Pim\\Bundle\\CatalogBundle\\Controller\\CategoryTreeController','editAction',238,3,239,'root'),('pim_catalog_category_list','pim_catalog_category','View tree list','View tree list','Pim\\Bundle\\CatalogBundle\\Controller\\CategoryTreeController','listTreeAction',228,3,229,'root'),('pim_catalog_category_move','pim_catalog_category','Move category','Move category','Pim\\Bundle\\CatalogBundle\\Controller\\CategoryTreeController','moveNodeAction',230,3,231,'root'),('pim_catalog_category_products','pim_catalog_category','See category\'s products','See category\'s products','Pim\\Bundle\\CatalogBundle\\Controller\\CategoryTreeController','listItemsAction',234,3,235,'root'),('pim_catalog_category_remove','pim_catalog_category','Remove a category','Remove a category','Pim\\Bundle\\CatalogBundle\\Controller\\CategoryTreeController','removeAction',240,3,241,'root'),('pim_catalog_channel','pim_catalog','Channel manipulation','Channel manipulation',NULL,NULL,279,2,288,'root'),('pim_catalog_channel_create','pim_catalog_channel','Create a channel','Create a channel','Pim\\Bundle\\CatalogBundle\\Controller\\ChannelController','createAction',282,3,283,'root'),('pim_catalog_channel_edit','pim_catalog_channel','Edit a channel','Edit a channel','Pim\\Bundle\\CatalogBundle\\Controller\\ChannelController','editAction',284,3,285,'root'),('pim_catalog_channel_index','pim_catalog_channel','View channel list','View channel list','Pim\\Bundle\\CatalogBundle\\Controller\\ChannelController','indexAction',280,3,281,'root'),('pim_catalog_channel_remove','pim_catalog_channel','Remove a channel','Remove a channel','Pim\\Bundle\\CatalogBundle\\Controller\\ChannelController','removeAction',286,3,287,'root'),('pim_catalog_currency','pim_catalog','Currency manipulation','Currency manipulation',NULL,NULL,207,2,212,'root'),('pim_catalog_currency_index','pim_catalog_currency','View currency list','View currency list','Pim\\Bundle\\CatalogBundle\\Controller\\CurrencyController','indexAction',208,3,209,'root'),('pim_catalog_currency_toggle','pim_catalog_currency','Change currency status','Change currency status','Pim\\Bundle\\CatalogBundle\\Controller\\CurrencyController','toggleAction',210,3,211,'root'),('pim_catalog_family','pim_catalog','Family manipulation','Family manipulation',NULL,NULL,195,2,206,'root'),('pim_catalog_family_add_attribute','pim_catalog_family','Add attribute to a family','Add attribute to a family','Pim\\Bundle\\CatalogBundle\\Controller\\FamilyController','addProductAttributesAction',202,3,203,'root'),('pim_catalog_family_create','pim_catalog_family','Create a family','Create a family','Pim\\Bundle\\CatalogBundle\\Controller\\FamilyController','createAction',196,3,197,'root'),('pim_catalog_family_edit','pim_catalog_family','Edit a family','Edit a family','Pim\\Bundle\\CatalogBundle\\Controller\\FamilyController','editAction',198,3,199,'root'),('pim_catalog_family_remove','pim_catalog_family','Remove a family','Remove a family','Pim\\Bundle\\CatalogBundle\\Controller\\FamilyController','removeAction',200,3,201,'root'),('pim_catalog_family_remove_atribute','pim_catalog_family','Remove attribute from a family','Remove attribute from a family','Pim\\Bundle\\CatalogBundle\\Controller\\FamilyController','removeProductAttributeAction',204,3,205,'root'),('pim_catalog_locale','pim_catalog','Locale manipulation','Locale manipulation',NULL,NULL,253,2,262,'root'),('pim_catalog_locale_af_ZA','pim_catalog_locales','af_ZA','Access to data related to locale af_ZA',NULL,NULL,290,3,291,'root'),('pim_catalog_locale_ar_DZ','pim_catalog_locales','ar_DZ','Access to data related to locale ar_DZ',NULL,NULL,292,3,293,'root'),('pim_catalog_locale_ar_EG','pim_catalog_locales','ar_EG','Access to data related to locale ar_EG',NULL,NULL,294,3,295,'root'),('pim_catalog_locale_ar_KW','pim_catalog_locales','ar_KW','Access to data related to locale ar_KW',NULL,NULL,296,3,297,'root'),('pim_catalog_locale_ar_MA','pim_catalog_locales','ar_MA','Access to data related to locale ar_MA',NULL,NULL,298,3,299,'root'),('pim_catalog_locale_ar_SA','pim_catalog_locales','ar_SA','Access to data related to locale ar_SA',NULL,NULL,300,3,301,'root'),('pim_catalog_locale_az_AZ','pim_catalog_locales','az_AZ','Access to data related to locale az_AZ',NULL,NULL,302,3,303,'root'),('pim_catalog_locale_be_BY','pim_catalog_locales','be_BY','Access to data related to locale be_BY',NULL,NULL,304,3,305,'root'),('pim_catalog_locale_bg_BG','pim_catalog_locales','bg_BG','Access to data related to locale bg_BG',NULL,NULL,306,3,307,'root'),('pim_catalog_locale_bn_BD','pim_catalog_locales','bn_BD','Access to data related to locale bn_BD',NULL,NULL,308,3,309,'root'),('pim_catalog_locale_bs_BA','pim_catalog_locales','bs_BA','Access to data related to locale bs_BA',NULL,NULL,310,3,311,'root'),('pim_catalog_locale_ca_ES','pim_catalog_locales','ca_ES','Access to data related to locale ca_ES',NULL,NULL,312,3,313,'root'),('pim_catalog_locale_cs_CZ','pim_catalog_locales','cs_CZ','Access to data related to locale cs_CZ',NULL,NULL,314,3,315,'root'),('pim_catalog_locale_cy_GB','pim_catalog_locales','cy_GB','Access to data related to locale cy_GB',NULL,NULL,316,3,317,'root'),('pim_catalog_locale_da_DK','pim_catalog_locales','da_DK','Access to data related to locale da_DK',NULL,NULL,318,3,319,'root'),('pim_catalog_locale_de_AT','pim_catalog_locales','de_AT','Access to data related to locale de_AT',NULL,NULL,320,3,321,'root'),('pim_catalog_locale_de_CH','pim_catalog_locales','de_CH','Access to data related to locale de_CH',NULL,NULL,322,3,323,'root'),('pim_catalog_locale_de_DE','pim_catalog_locales','de_DE','Access to data related to locale de_DE',NULL,NULL,324,3,325,'root'),('pim_catalog_locale_disable','pim_catalog_locale','Disable a locale','Disable a locale','Pim\\Bundle\\CatalogBundle\\Controller\\LocaleController','disableAction',258,3,259,'root'),('pim_catalog_locale_edit','pim_catalog_locale','Edit a locale','Edit a locale','Pim\\Bundle\\CatalogBundle\\Controller\\LocaleController','editAction',256,3,257,'root'),('pim_catalog_locale_el_GR','pim_catalog_locales','el_GR','Access to data related to locale el_GR',NULL,NULL,326,3,327,'root'),('pim_catalog_locale_en_AU','pim_catalog_locales','en_AU','Access to data related to locale en_AU',NULL,NULL,328,3,329,'root'),('pim_catalog_locale_en_CA','pim_catalog_locales','en_CA','Access to data related to locale en_CA',NULL,NULL,330,3,331,'root'),('pim_catalog_locale_en_GB','pim_catalog_locales','en_GB','Access to data related to locale en_GB',NULL,NULL,332,3,333,'root'),('pim_catalog_locale_en_IE','pim_catalog_locales','en_IE','Access to data related to locale en_IE',NULL,NULL,452,3,453,'root'),('pim_catalog_locale_en_NZ','pim_catalog_locales','en_NZ','Access to data related to locale en_NZ',NULL,NULL,334,3,335,'root'),('pim_catalog_locale_en_US','pim_catalog_locales','en_US','Access to data related to locale en_US',NULL,NULL,336,3,337,'root'),('pim_catalog_locale_enable','pim_catalog_locale','Enable a locale','Enable a locale','Pim\\Bundle\\CatalogBundle\\Controller\\LocaleController','enableAction',260,3,261,'root'),('pim_catalog_locale_es_AR','pim_catalog_locales','es_AR','Access to data related to locale es_AR',NULL,NULL,338,3,339,'root'),('pim_catalog_locale_es_CL','pim_catalog_locales','es_CL','Access to data related to locale es_CL',NULL,NULL,448,3,449,'root'),('pim_catalog_locale_es_CO','pim_catalog_locales','es_CO','Access to data related to locale es_CO',NULL,NULL,340,3,341,'root'),('pim_catalog_locale_es_CR','pim_catalog_locales','es_CR','Access to data related to locale es_CR',NULL,NULL,346,3,347,'root'),('pim_catalog_locale_es_ES','pim_catalog_locales','es_ES','Access to data related to locale es_ES',NULL,NULL,348,3,349,'root'),('pim_catalog_locale_es_EU','pim_catalog_locales','es_EU','Access to data related to locale es_EU',NULL,NULL,352,3,353,'root'),('pim_catalog_locale_es_MX','pim_catalog_locales','es_MX','Access to data related to locale es_MX',NULL,NULL,350,3,351,'root'),('pim_catalog_locale_es_PA','pim_catalog_locales','es_PA','Access to data related to locale es_PA',NULL,NULL,342,3,343,'root'),('pim_catalog_locale_es_PE','pim_catalog_locales','es_PE','Access to data related to locale es_PE',NULL,NULL,354,3,355,'root'),('pim_catalog_locale_es_VE','pim_catalog_locales','es_VE','Access to data related to locale es_VE',NULL,NULL,450,3,451,'root'),('pim_catalog_locale_et_EE','pim_catalog_locales','et_EE','Access to data related to locale et_EE',NULL,NULL,356,3,357,'root'),('pim_catalog_locale_fa_IR','pim_catalog_locales','fa_IR','Access to data related to locale fa_IR',NULL,NULL,358,3,359,'root'),('pim_catalog_locale_fi_FI','pim_catalog_locales','fi_FI','Access to data related to locale fi_FI',NULL,NULL,360,3,361,'root'),('pim_catalog_locale_fil_PH','pim_catalog_locales','fil_PH','Access to data related to locale fil_PH',NULL,NULL,362,3,363,'root'),('pim_catalog_locale_fr_CA','pim_catalog_locales','fr_CA','Access to data related to locale fr_CA',NULL,NULL,364,3,365,'root'),('pim_catalog_locale_fr_FR','pim_catalog_locales','fr_FR','Access to data related to locale fr_FR',NULL,NULL,366,3,367,'root'),('pim_catalog_locale_gl_ES','pim_catalog_locales','gl_ES','Access to data related to locale gl_ES',NULL,NULL,344,3,345,'root'),('pim_catalog_locale_gu_IN','pim_catalog_locales','gu_IN','Access to data related to locale gu_IN',NULL,NULL,368,3,369,'root'),('pim_catalog_locale_he_IL','pim_catalog_locales','he_IL','Access to data related to locale he_IL',NULL,NULL,370,3,371,'root'),('pim_catalog_locale_hi_IN','pim_catalog_locales','hi_IN','Access to data related to locale hi_IN',NULL,NULL,372,3,373,'root'),('pim_catalog_locale_hr_HR','pim_catalog_locales','hr_HR','Access to data related to locale hr_HR',NULL,NULL,374,3,375,'root'),('pim_catalog_locale_hu_HU','pim_catalog_locales','hu_HU','Access to data related to locale hu_HU',NULL,NULL,376,3,377,'root'),('pim_catalog_locale_id_ID','pim_catalog_locales','id_ID','Access to data related to locale id_ID',NULL,NULL,378,3,379,'root'),('pim_catalog_locale_index','pim_catalog_locale','View locale list','View locale list','Pim\\Bundle\\CatalogBundle\\Controller\\LocaleController','indexAction',254,3,255,'root'),('pim_catalog_locale_is_IS','pim_catalog_locales','is_IS','Access to data related to locale is_IS',NULL,NULL,380,3,381,'root'),('pim_catalog_locale_it_CH','pim_catalog_locales','it_CH','Access to data related to locale it_CH',NULL,NULL,382,3,383,'root'),('pim_catalog_locale_it_IT','pim_catalog_locales','it_IT','Access to data related to locale it_IT',NULL,NULL,384,3,385,'root'),('pim_catalog_locale_ja_JP','pim_catalog_locales','ja_JP','Access to data related to locale ja_JP',NULL,NULL,386,3,387,'root'),('pim_catalog_locale_ka_GE','pim_catalog_locales','ka_GE','Access to data related to locale ka_GE',NULL,NULL,388,3,389,'root'),('pim_catalog_locale_km_KH','pim_catalog_locales','km_KH','Access to data related to locale km_KH',NULL,NULL,390,3,391,'root'),('pim_catalog_locale_ko_KR','pim_catalog_locales','ko_KR','Access to data related to locale ko_KR',NULL,NULL,392,3,393,'root'),('pim_catalog_locale_lo_LA','pim_catalog_locales','lo_LA','Access to data related to locale lo_LA',NULL,NULL,394,3,395,'root'),('pim_catalog_locale_lt_LT','pim_catalog_locales','lt_LT','Access to data related to locale lt_LT',NULL,NULL,396,3,397,'root'),('pim_catalog_locale_lv_LV','pim_catalog_locales','lv_LV','Access to data related to locale lv_LV',NULL,NULL,398,3,399,'root'),('pim_catalog_locale_mk_MK','pim_catalog_locales','mk_MK','Access to data related to locale mk_MK',NULL,NULL,400,3,401,'root'),('pim_catalog_locale_mn_MN','pim_catalog_locales','mn_MN','Access to data related to locale mn_MN',NULL,NULL,402,3,403,'root'),('pim_catalog_locale_ms_MY','pim_catalog_locales','ms_MY','Access to data related to locale ms_MY',NULL,NULL,404,3,405,'root'),('pim_catalog_locale_nb_NO','pim_catalog_locales','nb_NO','Access to data related to locale nb_NO',NULL,NULL,408,3,409,'root'),('pim_catalog_locale_nl_NL','pim_catalog_locales','nl_NL','Access to data related to locale nl_NL',NULL,NULL,406,3,407,'root'),('pim_catalog_locale_nn_NO','pim_catalog_locales','nn_NO','Access to data related to locale nn_NO',NULL,NULL,410,3,411,'root'),('pim_catalog_locale_pl_PL','pim_catalog_locales','pl_PL','Access to data related to locale pl_PL',NULL,NULL,412,3,413,'root'),('pim_catalog_locale_pt_BR','pim_catalog_locales','pt_BR','Access to data related to locale pt_BR',NULL,NULL,414,3,415,'root'),('pim_catalog_locale_pt_PT','pim_catalog_locales','pt_PT','Access to data related to locale pt_PT',NULL,NULL,416,3,417,'root'),('pim_catalog_locale_ro_RO','pim_catalog_locales','ro_RO','Access to data related to locale ro_RO',NULL,NULL,418,3,419,'root'),('pim_catalog_locale_ru_RU','pim_catalog_locales','ru_RU','Access to data related to locale ru_RU',NULL,NULL,420,3,421,'root'),('pim_catalog_locale_sk_SK','pim_catalog_locales','sk_SK','Access to data related to locale sk_SK',NULL,NULL,422,3,423,'root'),('pim_catalog_locale_sl_SI','pim_catalog_locales','sl_SI','Access to data related to locale sl_SI',NULL,NULL,424,3,425,'root'),('pim_catalog_locale_sq_AL','pim_catalog_locales','sq_AL','Access to data related to locale sq_AL',NULL,NULL,426,3,427,'root'),('pim_catalog_locale_sr_RS','pim_catalog_locales','sr_RS','Access to data related to locale sr_RS',NULL,NULL,428,3,429,'root'),('pim_catalog_locale_sv_SE','pim_catalog_locales','sv_SE','Access to data related to locale sv_SE',NULL,NULL,430,3,431,'root'),('pim_catalog_locale_sw_KE','pim_catalog_locales','sw_KE','Access to data related to locale sw_KE',NULL,NULL,432,3,433,'root'),('pim_catalog_locale_th_TH','pim_catalog_locales','th_TH','Access to data related to locale th_TH',NULL,NULL,434,3,435,'root'),('pim_catalog_locale_tr_TR','pim_catalog_locales','tr_TR','Access to data related to locale tr_TR',NULL,NULL,436,3,437,'root'),('pim_catalog_locale_uk_UA','pim_catalog_locales','uk_UA','Access to data related to locale uk_UA',NULL,NULL,438,3,439,'root'),('pim_catalog_locale_vi_VN','pim_catalog_locales','vi_VN','Access to data related to locale vi_VN',NULL,NULL,440,3,441,'root'),('pim_catalog_locale_zh_CN','pim_catalog_locales','zh_CN','Access to data related to locale zh_CN',NULL,NULL,442,3,443,'root'),('pim_catalog_locale_zh_HK','pim_catalog_locales','zh_HK','Access to data related to locale zh_HK',NULL,NULL,444,3,445,'root'),('pim_catalog_locale_zh_TW','pim_catalog_locales','zh_TW','Access to data related to locale zh_TW',NULL,NULL,446,3,447,'root'),('pim_catalog_locales','pim_catalog','Access to locales','General node for locales manipulation',NULL,NULL,289,2,454,'root'),('pim_catalog_product','pim_catalog','Product manipulation','Product manipulation',NULL,NULL,263,2,278,'root'),('pim_catalog_product_add_attribute','pim_catalog_product','Add an attribute to a product','Add an attribute to a product','Pim\\Bundle\\CatalogBundle\\Controller\\ProductController','addProductAttributesAction',270,3,271,'root'),('pim_catalog_product_categories_view','pim_catalog_product','Consult the categories of a product','Consult the categories of a product','Pim\\Bundle\\CatalogBundle\\Controller\\ProductController','listCategoriesAction',276,3,277,'root'),('pim_catalog_product_create','pim_catalog_product','Create a product','Create a product','Pim\\Bundle\\CatalogBundle\\Controller\\ProductController','createAction',266,3,267,'root'),('pim_catalog_product_edit','pim_catalog_product','Edit a product','Edit a product','Pim\\Bundle\\CatalogBundle\\Controller\\ProductController','editAction',268,3,269,'root'),('pim_catalog_product_index','pim_catalog_product','View product list','View product list','Pim\\Bundle\\CatalogBundle\\Controller\\ProductController','indexAction',264,3,265,'root'),('pim_catalog_product_remove','pim_catalog_product','Remove a product','Remove a product','Pim\\Bundle\\CatalogBundle\\Controller\\ProductController','removeAction',272,3,273,'root'),('pim_catalog_product_remove_attribute','pim_catalog_product','Remove a product\'s attribute','Remove a product\'s attribute','Pim\\Bundle\\CatalogBundle\\Controller\\ProductController','removeProductAttributeAction',274,3,275,'root'),('pim_importexport','root','PIM Import Export','General node for imports and exports',NULL,NULL,456,1,501,'root'),('pim_importexport_export','pim_importexport','Export profile manipulation','Export profile manipulation',NULL,NULL,473,2,486,'root'),('pim_importexport_export_create','pim_importexport_export','Create an export profile','Create an export profile','Pim\\Bundle\\ImportExportBundle\\Controller\\ExportController','createAction',476,3,477,'root'),('pim_importexport_export_edit','pim_importexport_export','Edit the configuration of an export profile','Edit the configuration of an export profile','Pim\\Bundle\\ImportExportBundle\\Controller\\ExportController','editAction',480,3,481,'root'),('pim_importexport_export_index','pim_importexport_export','View export profile list','View export profile list','Pim\\Bundle\\ImportExportBundle\\Controller\\ExportController','indexAction',474,3,475,'root'),('pim_importexport_export_launch','pim_importexport_export','Launch an export profile','Launch an export profile','Pim\\Bundle\\ImportExportBundle\\Controller\\ExportController','launchAction',484,3,485,'root'),('pim_importexport_export_remove','pim_importexport_export','Remove an export profile','Remove an export profile','Pim\\Bundle\\ImportExportBundle\\Controller\\ExportController','removeAction',482,3,483,'root'),('pim_importexport_export_report','pim_importexport','Export report manipulation','Export report manipulation',NULL,NULL,457,2,464,'root'),('pim_importexport_export_report_download_log','pim_importexport_export_report','Download export report log','Download export report log','Pim\\Bundle\\ImportExportBundle\\Controller\\ExportReportController','downloadLogFileAction',462,3,463,'root'),('pim_importexport_export_report_index','pim_importexport_export_report','View export report list','View export report list','Pim\\Bundle\\ImportExportBundle\\Controller\\ExportReportController','indexAction',458,3,459,'root'),('pim_importexport_export_report_show','pim_importexport_export_report','View export report details','View export report details','Pim\\Bundle\\ImportExportBundle\\Controller\\ExportReportController','showAction',460,3,461,'root'),('pim_importexport_export_show','pim_importexport_export','View the configuration of an export profile','View the configuration of an export profile','Pim\\Bundle\\ImportExportBundle\\Controller\\ExportController','showAction',478,3,479,'root'),('pim_importexport_import','pim_importexport','Import profile manipulation','Import profile manipulation',NULL,NULL,487,2,500,'root'),('pim_importexport_import_create','pim_importexport_import','Create an import profile','Create an import profile','Pim\\Bundle\\ImportExportBundle\\Controller\\ImportController','createAction',490,3,491,'root'),('pim_importexport_import_edit','pim_importexport_import','Edit the configuration of an import profile','Edit the configuration of an import profile','Pim\\Bundle\\ImportExportBundle\\Controller\\ImportController','editAction',494,3,495,'root'),('pim_importexport_import_index','pim_importexport_import','View import profile list','View import profile list','Pim\\Bundle\\ImportExportBundle\\Controller\\ImportController','indexAction',488,3,489,'root'),('pim_importexport_import_launch','pim_importexport_import','Launch an import profile','Launch an import profile','Pim\\Bundle\\ImportExportBundle\\Controller\\ImportController','launchAction',498,3,499,'root'),('pim_importexport_import_remove','pim_importexport_import','Remove an import profile','Remove an import profile','Pim\\Bundle\\ImportExportBundle\\Controller\\ImportController','removeAction',496,3,497,'root'),('pim_importexport_import_report','pim_importexport','Export report manipulation','Export report manipulation',NULL,NULL,465,2,472,'root'),('pim_importexport_import_report_download_log','pim_importexport_import_report','Download export report log','Download export report log','Pim\\Bundle\\ImportExportBundle\\Controller\\ImportReportController','downloadLogFileAction',470,3,471,'root'),('pim_importexport_import_report_index','pim_importexport_import_report','View export report list','View export report list','Pim\\Bundle\\ImportExportBundle\\Controller\\ImportReportController','indexAction',466,3,467,'root'),('pim_importexport_import_report_show','pim_importexport_import_report','View export report details','View export report details','Pim\\Bundle\\ImportExportBundle\\Controller\\ImportReportController','showAction',468,3,469,'root'),('pim_importexport_import_show','pim_importexport_import','View the configuration of an import profile','View the configuration of an import profile','Pim\\Bundle\\ImportExportBundle\\Controller\\ImportController','showAction',492,3,493,'root'),('pim_navigation','root','PIM Menus','Access to main menu entries',NULL,NULL,508,1,519,'root'),('pim_navigation_enrich','pim_navigation','Enrich menu entry','Enrich menu entry',NULL,NULL,511,2,512,'root'),('pim_navigation_extract','pim_navigation','Extract menu entry','Extract menu entry',NULL,NULL,509,2,510,'root'),('pim_navigation_settings','pim_navigation','Settings menu entry','Settings menu entry',NULL,NULL,515,2,516,'root'),('pim_navigation_spread','pim_navigation','Spread menu entry','Spread menu entry',NULL,NULL,513,2,514,'root'),('pim_navigation_system','pim_navigation','System menu entry','System menu entry',NULL,NULL,517,2,518,'root'),('root',NULL,'root','root',NULL,NULL,1,0,520,'root'),('template_controller','root','Template controller','Actions from template controller','Symfony\\Bundle\\FrameworkBundle\\Controller\\TemplateController','templateAction',20,1,21,'root');
/*!40000 ALTER TABLE `oro_user_acl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oro_user_acl_role`
--

DROP TABLE IF EXISTS `oro_user_acl_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oro_user_acl_role` (
  `acl_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `role_id` smallint(6) NOT NULL,
  PRIMARY KEY (`acl_id`,`role_id`),
  KEY `IDX_DCFBB3F244082458` (`acl_id`),
  KEY `IDX_DCFBB3F2D60322AC` (`role_id`),
  CONSTRAINT `FK_DCFBB3F2D60322AC` FOREIGN KEY (`role_id`) REFERENCES `oro_access_role` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_DCFBB3F244082458` FOREIGN KEY (`acl_id`) REFERENCES `oro_user_acl` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oro_user_acl_role`
--

LOCK TABLES `oro_user_acl_role` WRITE;
/*!40000 ALTER TABLE `oro_user_acl_role` DISABLE KEYS */;
INSERT INTO `oro_user_acl_role` VALUES ('root',6),('root',7),('oro_security',8);
/*!40000 ALTER TABLE `oro_user_acl_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oro_user_api`
--

DROP TABLE IF EXISTS `oro_user_api`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oro_user_api` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `api_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_296B6993C912ED9D` (`api_key`),
  UNIQUE KEY `UNIQ_296B6993A76ED395` (`user_id`),
  CONSTRAINT `FK_296B6993A76ED395` FOREIGN KEY (`user_id`) REFERENCES `oro_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oro_user_api`
--

LOCK TABLES `oro_user_api` WRITE;
/*!40000 ALTER TABLE `oro_user_api` DISABLE KEYS */;
/*!40000 ALTER TABLE `oro_user_api` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oro_user_business_unit`
--

DROP TABLE IF EXISTS `oro_user_business_unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oro_user_business_unit` (
  `user_id` int(11) NOT NULL,
  `business_unit_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`business_unit_id`),
  KEY `IDX_B190CE8FA76ED395` (`user_id`),
  KEY `IDX_B190CE8FA58ECB40` (`business_unit_id`),
  CONSTRAINT `FK_B190CE8FA58ECB40` FOREIGN KEY (`business_unit_id`) REFERENCES `oro_business_unit` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_B190CE8FA76ED395` FOREIGN KEY (`user_id`) REFERENCES `oro_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oro_user_business_unit`
--

LOCK TABLES `oro_user_business_unit` WRITE;
/*!40000 ALTER TABLE `oro_user_business_unit` DISABLE KEYS */;
/*!40000 ALTER TABLE `oro_user_business_unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oro_user_email`
--

DROP TABLE IF EXISTS `oro_user_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oro_user_email` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_8600BE16A76ED395` (`user_id`),
  CONSTRAINT `FK_8600BE16A76ED395` FOREIGN KEY (`user_id`) REFERENCES `oro_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oro_user_email`
--

LOCK TABLES `oro_user_email` WRITE;
/*!40000 ALTER TABLE `oro_user_email` DISABLE KEYS */;
/*!40000 ALTER TABLE `oro_user_email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oro_user_status`
--

DROP TABLE IF EXISTS `oro_user_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oro_user_status` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_D8DDF7AAA76ED395` (`user_id`),
  CONSTRAINT `FK_D8DDF7AAA76ED395` FOREIGN KEY (`user_id`) REFERENCES `oro_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oro_user_status`
--

LOCK TABLES `oro_user_status` WRITE;
/*!40000 ALTER TABLE `oro_user_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `oro_user_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oro_user_value`
--

DROP TABLE IF EXISTS `oro_user_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oro_user_value` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute_id` int(11) DEFAULT NULL,
  `entity_id` int(11) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `value_string` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value_integer` int(11) DEFAULT NULL,
  `value_decimal` decimal(10,0) DEFAULT NULL,
  `value_text` longtext COLLATE utf8_unicode_ci,
  `value_date` date DEFAULT NULL,
  `value_datetime` datetime DEFAULT NULL,
  `locale_code` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `scope_code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value_boolean` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_7CE59A56B6E62EFA` (`attribute_id`),
  KEY `IDX_7CE59A5681257D5D` (`entity_id`),
  KEY `IDX_7CE59A56A7C41D6F` (`option_id`),
  CONSTRAINT `FK_7CE59A56A7C41D6F` FOREIGN KEY (`option_id`) REFERENCES `oro_flexibleentity_attribute_option` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_7CE59A5681257D5D` FOREIGN KEY (`entity_id`) REFERENCES `oro_user` (`id`),
  CONSTRAINT `FK_7CE59A56B6E62EFA` FOREIGN KEY (`attribute_id`) REFERENCES `oro_flexibleentity_attribute` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oro_user_value`
--

LOCK TABLES `oro_user_value` WRITE;
/*!40000 ALTER TABLE `oro_user_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `oro_user_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oro_user_value_option`
--

DROP TABLE IF EXISTS `oro_user_value_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oro_user_value_option` (
  `value_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  PRIMARY KEY (`value_id`,`option_id`),
  KEY `IDX_9E905910F920BBA2` (`value_id`),
  KEY `IDX_9E905910A7C41D6F` (`option_id`),
  CONSTRAINT `FK_9E905910A7C41D6F` FOREIGN KEY (`option_id`) REFERENCES `oro_flexibleentity_attribute_option` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_9E905910F920BBA2` FOREIGN KEY (`value_id`) REFERENCES `oro_user_value` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oro_user_value_option`
--

LOCK TABLES `oro_user_value_option` WRITE;
/*!40000 ALTER TABLE `oro_user_value_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `oro_user_value_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oro_windows_state`
--

DROP TABLE IF EXISTS `oro_windows_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oro_windows_state` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `data` longtext COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_8B134CF6A76ED395` (`user_id`),
  CONSTRAINT `FK_8B134CF6A76ED395` FOREIGN KEY (`user_id`) REFERENCES `oro_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oro_windows_state`
--

LOCK TABLES `oro_windows_state` WRITE;
/*!40000 ALTER TABLE `oro_windows_state` DISABLE KEYS */;
/*!40000 ALTER TABLE `oro_windows_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_batch_job_execution`
--

DROP TABLE IF EXISTS `pim_batch_job_execution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pim_batch_job_execution` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_instance_id` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `exit_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `exit_description` longtext COLLATE utf8_unicode_ci,
  `failure_exceptions` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  `log_file` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_DCC6631F593D6954` (`job_instance_id`),
  CONSTRAINT `FK_DCC6631F593D6954` FOREIGN KEY (`job_instance_id`) REFERENCES `pim_batch_job_instance` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_batch_job_execution`
--

LOCK TABLES `pim_batch_job_execution` WRITE;
/*!40000 ALTER TABLE `pim_batch_job_execution` DISABLE KEYS */;
/*!40000 ALTER TABLE `pim_batch_job_execution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_batch_job_instance`
--

DROP TABLE IF EXISTS `pim_batch_job_instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pim_batch_job_instance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alias` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `connector` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `rawConfiguration` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_9F1A513377153098` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_batch_job_instance`
--

LOCK TABLES `pim_batch_job_instance` WRITE;
/*!40000 ALTER TABLE `pim_batch_job_instance` DISABLE KEYS */;
/*!40000 ALTER TABLE `pim_batch_job_instance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_batch_mapping_field`
--

DROP TABLE IF EXISTS `pim_batch_mapping_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pim_batch_mapping_field` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) DEFAULT NULL,
  `source` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `destination` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `identifier` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FF5EAFE0126F525E` (`item_id`),
  CONSTRAINT `FK_FF5EAFE0126F525E` FOREIGN KEY (`item_id`) REFERENCES `pim_batch_mapping_item` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_batch_mapping_field`
--

LOCK TABLES `pim_batch_mapping_field` WRITE;
/*!40000 ALTER TABLE `pim_batch_mapping_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `pim_batch_mapping_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_batch_mapping_item`
--

DROP TABLE IF EXISTS `pim_batch_mapping_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pim_batch_mapping_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_batch_mapping_item`
--

LOCK TABLES `pim_batch_mapping_item` WRITE;
/*!40000 ALTER TABLE `pim_batch_mapping_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `pim_batch_mapping_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_batch_step_execution`
--

DROP TABLE IF EXISTS `pim_batch_step_execution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pim_batch_step_execution` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_execution_id` int(11) DEFAULT NULL,
  `step_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL,
  `read_count` int(11) NOT NULL,
  `write_count` int(11) NOT NULL,
  `filter_count` int(11) NOT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `exit_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `exit_description` longtext COLLATE utf8_unicode_ci,
  `terminate_only` tinyint(1) DEFAULT NULL,
  `failure_exceptions` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  KEY `IDX_FE308C1F5871C06B` (`job_execution_id`),
  CONSTRAINT `FK_FE308C1F5871C06B` FOREIGN KEY (`job_execution_id`) REFERENCES `pim_batch_job_execution` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_batch_step_execution`
--

LOCK TABLES `pim_batch_step_execution` WRITE;
/*!40000 ALTER TABLE `pim_batch_step_execution` DISABLE KEYS */;
/*!40000 ALTER TABLE `pim_batch_step_execution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_catalog_attribute`
--

DROP TABLE IF EXISTS `pim_catalog_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pim_catalog_attribute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) DEFAULT NULL,
  `version` int(11) NOT NULL DEFAULT '1',
  `sort_order` int(11) NOT NULL,
  `variant` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_smart` tinyint(1) NOT NULL,
  `useable_as_grid_column` tinyint(1) NOT NULL DEFAULT '0',
  `useable_as_grid_filter` tinyint(1) NOT NULL DEFAULT '0',
  `max_characters` smallint(6) DEFAULT NULL,
  `validation_rule` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `validation_regexp` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `wysiwyg_enabled` tinyint(1) DEFAULT NULL,
  `number_min` decimal(14,4) DEFAULT NULL,
  `number_max` decimal(14,4) DEFAULT NULL,
  `decimals_allowed` tinyint(1) DEFAULT NULL,
  `negative_allowed` tinyint(1) DEFAULT NULL,
  `date_type` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_min` datetime DEFAULT NULL,
  `date_max` datetime DEFAULT NULL,
  `metric_family` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `default_metric_unit` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `allowed_file_sources` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `max_file_size` int(11) DEFAULT NULL,
  `allowed_extensions` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_required` tinyint(1) NOT NULL,
  `is_unique` tinyint(1) NOT NULL,
  `default_value` text COLLATE utf8_unicode_ci,
  `is_searchable` tinyint(1) NOT NULL,
  `is_translatable` tinyint(1) NOT NULL,
  `is_scopable` tinyint(1) NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `entity_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `attribute_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `backend_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `backend_storage` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `searchunique_idx` (`code`,`entity_type`),
  KEY `IDX_492FD44FFE54D947` (`group_id`),
  KEY `searchcode_idx` (`code`),
  CONSTRAINT `FK_492FD44FFE54D947` FOREIGN KEY (`group_id`) REFERENCES `pim_catalog_attribute_group` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_catalog_attribute`
--

LOCK TABLES `pim_catalog_attribute` WRITE;
/*!40000 ALTER TABLE `pim_catalog_attribute` DISABLE KEYS */;
INSERT INTO `pim_catalog_attribute` VALUES (12,NULL,1,0,'',0,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,0,0,'sku','Pim\\Bundle\\CatalogBundle\\Entity\\Product','pim_catalog_identifier','varchar','values','2013-09-10 19:47:33','2013-09-10 19:47:33');
/*!40000 ALTER TABLE `pim_catalog_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_catalog_attribute_group`
--

DROP TABLE IF EXISTS `pim_catalog_attribute_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pim_catalog_attribute_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `sort_order` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `version` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_catalog_attribute_group`
--

LOCK TABLES `pim_catalog_attribute_group` WRITE;
/*!40000 ALTER TABLE `pim_catalog_attribute_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `pim_catalog_attribute_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_catalog_attribute_group_translation`
--

DROP TABLE IF EXISTS `pim_catalog_attribute_group_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pim_catalog_attribute_group_translation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `foreign_key` int(11) DEFAULT NULL,
  `label` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `locale` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_B74958BD7E366551` (`foreign_key`),
  CONSTRAINT `FK_B74958BD7E366551` FOREIGN KEY (`foreign_key`) REFERENCES `pim_catalog_attribute_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_catalog_attribute_group_translation`
--

LOCK TABLES `pim_catalog_attribute_group_translation` WRITE;
/*!40000 ALTER TABLE `pim_catalog_attribute_group_translation` DISABLE KEYS */;
/*!40000 ALTER TABLE `pim_catalog_attribute_group_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_catalog_attribute_locale`
--

DROP TABLE IF EXISTS `pim_catalog_attribute_locale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pim_catalog_attribute_locale` (
  `productattribute_id` int(11) NOT NULL,
  `locale_id` int(11) NOT NULL,
  PRIMARY KEY (`productattribute_id`,`locale_id`),
  KEY `IDX_26D2D5D04474021B` (`productattribute_id`),
  KEY `IDX_26D2D5D0E559DFD1` (`locale_id`),
  CONSTRAINT `FK_26D2D5D0E559DFD1` FOREIGN KEY (`locale_id`) REFERENCES `pim_catalog_locale` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_26D2D5D04474021B` FOREIGN KEY (`productattribute_id`) REFERENCES `pim_catalog_attribute` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_catalog_attribute_locale`
--

LOCK TABLES `pim_catalog_attribute_locale` WRITE;
/*!40000 ALTER TABLE `pim_catalog_attribute_locale` DISABLE KEYS */;
/*!40000 ALTER TABLE `pim_catalog_attribute_locale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_catalog_attribute_option`
--

DROP TABLE IF EXISTS `pim_catalog_attribute_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pim_catalog_attribute_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute_id` int(11) DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_default` tinyint(1) NOT NULL,
  `is_translatable` tinyint(1) NOT NULL,
  `sort_order` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_3DD413F8B6E62EFA` (`attribute_id`),
  CONSTRAINT `FK_3DD413F8B6E62EFA` FOREIGN KEY (`attribute_id`) REFERENCES `pim_catalog_attribute` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_catalog_attribute_option`
--

LOCK TABLES `pim_catalog_attribute_option` WRITE;
/*!40000 ALTER TABLE `pim_catalog_attribute_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `pim_catalog_attribute_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_catalog_attribute_option_value`
--

DROP TABLE IF EXISTS `pim_catalog_attribute_option_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pim_catalog_attribute_option_value` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `option_id` int(11) NOT NULL,
  `locale_code` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_CC4B9A83A7C41D6F` (`option_id`),
  CONSTRAINT `FK_CC4B9A83A7C41D6F` FOREIGN KEY (`option_id`) REFERENCES `pim_catalog_attribute_option` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_catalog_attribute_option_value`
--

LOCK TABLES `pim_catalog_attribute_option_value` WRITE;
/*!40000 ALTER TABLE `pim_catalog_attribute_option_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `pim_catalog_attribute_option_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_catalog_attribute_requirement`
--

DROP TABLE IF EXISTS `pim_catalog_attribute_requirement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pim_catalog_attribute_requirement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `family_id` int(11) DEFAULT NULL,
  `attribute_id` int(11) DEFAULT NULL,
  `channel_id` int(11) DEFAULT NULL,
  `required` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_B494B917C35E566A` (`family_id`),
  KEY `IDX_B494B917B6E62EFA` (`attribute_id`),
  KEY `IDX_B494B91772F5A1AA` (`channel_id`),
  CONSTRAINT `FK_B494B91772F5A1AA` FOREIGN KEY (`channel_id`) REFERENCES `pim_catalog_channel` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_B494B917B6E62EFA` FOREIGN KEY (`attribute_id`) REFERENCES `pim_catalog_attribute` (`id`),
  CONSTRAINT `FK_B494B917C35E566A` FOREIGN KEY (`family_id`) REFERENCES `pim_catalog_family` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_catalog_attribute_requirement`
--

LOCK TABLES `pim_catalog_attribute_requirement` WRITE;
/*!40000 ALTER TABLE `pim_catalog_attribute_requirement` DISABLE KEYS */;
/*!40000 ALTER TABLE `pim_catalog_attribute_requirement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_catalog_attribute_translation`
--

DROP TABLE IF EXISTS `pim_catalog_attribute_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pim_catalog_attribute_translation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `foreign_key` int(11) DEFAULT NULL,
  `label` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `locale` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_DBC2A9287E366551` (`foreign_key`),
  CONSTRAINT `FK_DBC2A9287E366551` FOREIGN KEY (`foreign_key`) REFERENCES `pim_catalog_attribute` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_catalog_attribute_translation`
--

LOCK TABLES `pim_catalog_attribute_translation` WRITE;
/*!40000 ALTER TABLE `pim_catalog_attribute_translation` DISABLE KEYS */;
INSERT INTO `pim_catalog_attribute_translation` VALUES (23,12,'SKU','en_US');
/*!40000 ALTER TABLE `pim_catalog_attribute_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_catalog_category`
--

DROP TABLE IF EXISTS `pim_catalog_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pim_catalog_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `code` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `is_dynamic` tinyint(1) NOT NULL,
  `created` datetime NOT NULL,
  `version` int(11) NOT NULL DEFAULT '1',
  `lft` int(11) NOT NULL,
  `lvl` int(11) NOT NULL,
  `rgt` int(11) NOT NULL,
  `root` int(11) DEFAULT NULL,
  `discr` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_350D833977153098` (`code`),
  KEY `IDX_350D8339727ACA70` (`parent_id`),
  CONSTRAINT `FK_350D8339727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `pim_catalog_category` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_catalog_category`
--

LOCK TABLES `pim_catalog_category` WRITE;
/*!40000 ALTER TABLE `pim_catalog_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `pim_catalog_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_catalog_category_product`
--

DROP TABLE IF EXISTS `pim_catalog_category_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pim_catalog_category_product` (
  `category_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`product_id`),
  KEY `IDX_512179C112469DE2` (`category_id`),
  KEY `IDX_512179C14584665A` (`product_id`),
  CONSTRAINT `FK_512179C14584665A` FOREIGN KEY (`product_id`) REFERENCES `pim_catalog_product` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_512179C112469DE2` FOREIGN KEY (`category_id`) REFERENCES `pim_catalog_category` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_catalog_category_product`
--

LOCK TABLES `pim_catalog_category_product` WRITE;
/*!40000 ALTER TABLE `pim_catalog_category_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `pim_catalog_category_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_catalog_category_translation`
--

DROP TABLE IF EXISTS `pim_catalog_category_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pim_catalog_category_translation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `foreign_key` int(11) DEFAULT NULL,
  `title` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `locale` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_1C0FA6B77E366551` (`foreign_key`),
  CONSTRAINT `FK_1C0FA6B77E366551` FOREIGN KEY (`foreign_key`) REFERENCES `pim_catalog_category` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_catalog_category_translation`
--

LOCK TABLES `pim_catalog_category_translation` WRITE;
/*!40000 ALTER TABLE `pim_catalog_category_translation` DISABLE KEYS */;
/*!40000 ALTER TABLE `pim_catalog_category_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_catalog_channel`
--

DROP TABLE IF EXISTS `pim_catalog_channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pim_catalog_channel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `code` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_E07E932A77153098` (`code`),
  KEY `IDX_E07E932A12469DE2` (`category_id`),
  CONSTRAINT `FK_E07E932A12469DE2` FOREIGN KEY (`category_id`) REFERENCES `pim_catalog_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_catalog_channel`
--

LOCK TABLES `pim_catalog_channel` WRITE;
/*!40000 ALTER TABLE `pim_catalog_channel` DISABLE KEYS */;
INSERT INTO `pim_catalog_channel` VALUES (3,NULL,'ecommerce','Ecommerce'),(4,NULL,'mobile','Mobile');
/*!40000 ALTER TABLE `pim_catalog_channel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_catalog_channel_currency`
--

DROP TABLE IF EXISTS `pim_catalog_channel_currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pim_catalog_channel_currency` (
  `channel_id` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  PRIMARY KEY (`channel_id`,`currency_id`),
  KEY `IDX_5B55C68472F5A1AA` (`channel_id`),
  KEY `IDX_5B55C68438248176` (`currency_id`),
  CONSTRAINT `FK_5B55C68438248176` FOREIGN KEY (`currency_id`) REFERENCES `pim_catalog_currency` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_5B55C68472F5A1AA` FOREIGN KEY (`channel_id`) REFERENCES `pim_catalog_channel` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_catalog_channel_currency`
--

LOCK TABLES `pim_catalog_channel_currency` WRITE;
/*!40000 ALTER TABLE `pim_catalog_channel_currency` DISABLE KEYS */;
/*!40000 ALTER TABLE `pim_catalog_channel_currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_catalog_channel_locale`
--

DROP TABLE IF EXISTS `pim_catalog_channel_locale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pim_catalog_channel_locale` (
  `channel_id` int(11) NOT NULL,
  `locale_id` int(11) NOT NULL,
  PRIMARY KEY (`channel_id`,`locale_id`),
  KEY `IDX_D8113CB272F5A1AA` (`channel_id`),
  KEY `IDX_D8113CB2E559DFD1` (`locale_id`),
  CONSTRAINT `FK_D8113CB2E559DFD1` FOREIGN KEY (`locale_id`) REFERENCES `pim_catalog_locale` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_D8113CB272F5A1AA` FOREIGN KEY (`channel_id`) REFERENCES `pim_catalog_channel` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_catalog_channel_locale`
--

LOCK TABLES `pim_catalog_channel_locale` WRITE;
/*!40000 ALTER TABLE `pim_catalog_channel_locale` DISABLE KEYS */;
INSERT INTO `pim_catalog_channel_locale` VALUES (3,83),(3,84),(4,84);
/*!40000 ALTER TABLE `pim_catalog_channel_locale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_catalog_completeness`
--

DROP TABLE IF EXISTS `pim_catalog_completeness`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pim_catalog_completeness` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locale_id` int(11) DEFAULT NULL,
  `channel_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `ratio` int(11) NOT NULL,
  `missing_count` int(11) NOT NULL,
  `required_count` int(11) NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `searchunique_idx` (`channel_id`,`locale_id`,`product_id`),
  KEY `IDX_113BA854E559DFD1` (`locale_id`),
  KEY `IDX_113BA85472F5A1AA` (`channel_id`),
  KEY `IDX_113BA8544584665A` (`product_id`),
  CONSTRAINT `FK_113BA8544584665A` FOREIGN KEY (`product_id`) REFERENCES `pim_catalog_product` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_113BA85472F5A1AA` FOREIGN KEY (`channel_id`) REFERENCES `pim_catalog_channel` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_113BA854E559DFD1` FOREIGN KEY (`locale_id`) REFERENCES `pim_catalog_locale` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_catalog_completeness`
--

LOCK TABLES `pim_catalog_completeness` WRITE;
/*!40000 ALTER TABLE `pim_catalog_completeness` DISABLE KEYS */;
/*!40000 ALTER TABLE `pim_catalog_completeness` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_catalog_completenesses_attributes`
--

DROP TABLE IF EXISTS `pim_catalog_completenesses_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pim_catalog_completenesses_attributes` (
  `completeness_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  PRIMARY KEY (`completeness_id`,`attribute_id`),
  KEY `IDX_2C51AA0B640FBA5` (`completeness_id`),
  KEY `IDX_2C51AA0B6E62EFA` (`attribute_id`),
  CONSTRAINT `FK_2C51AA0B6E62EFA` FOREIGN KEY (`attribute_id`) REFERENCES `pim_catalog_attribute` (`id`),
  CONSTRAINT `FK_2C51AA0B640FBA5` FOREIGN KEY (`completeness_id`) REFERENCES `pim_catalog_completeness` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_catalog_completenesses_attributes`
--

LOCK TABLES `pim_catalog_completenesses_attributes` WRITE;
/*!40000 ALTER TABLE `pim_catalog_completenesses_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `pim_catalog_completenesses_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_catalog_currency`
--

DROP TABLE IF EXISTS `pim_catalog_currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pim_catalog_currency` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `is_activated` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_5A1712C777153098` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=171 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_catalog_currency`
--

LOCK TABLES `pim_catalog_currency` WRITE;
/*!40000 ALTER TABLE `pim_catalog_currency` DISABLE KEYS */;
/*!40000 ALTER TABLE `pim_catalog_currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_catalog_family`
--

DROP TABLE IF EXISTS `pim_catalog_family`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pim_catalog_family` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label_attribute_id` int(11) DEFAULT NULL,
  `code` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `version` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_9063207277153098` (`code`),
  KEY `IDX_90632072E2D3A503` (`label_attribute_id`),
  CONSTRAINT `FK_90632072E2D3A503` FOREIGN KEY (`label_attribute_id`) REFERENCES `pim_catalog_attribute` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_catalog_family`
--

LOCK TABLES `pim_catalog_family` WRITE;
/*!40000 ALTER TABLE `pim_catalog_family` DISABLE KEYS */;
/*!40000 ALTER TABLE `pim_catalog_family` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_catalog_family_attribute`
--

DROP TABLE IF EXISTS `pim_catalog_family_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pim_catalog_family_attribute` (
  `family_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  PRIMARY KEY (`family_id`,`attribute_id`),
  KEY `IDX_76074884C35E566A` (`family_id`),
  KEY `IDX_76074884B6E62EFA` (`attribute_id`),
  CONSTRAINT `FK_76074884B6E62EFA` FOREIGN KEY (`attribute_id`) REFERENCES `pim_catalog_attribute` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_76074884C35E566A` FOREIGN KEY (`family_id`) REFERENCES `pim_catalog_family` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_catalog_family_attribute`
--

LOCK TABLES `pim_catalog_family_attribute` WRITE;
/*!40000 ALTER TABLE `pim_catalog_family_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `pim_catalog_family_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_catalog_family_translation`
--

DROP TABLE IF EXISTS `pim_catalog_family_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pim_catalog_family_translation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `foreign_key` int(11) DEFAULT NULL,
  `label` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `locale` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_547C9A607E366551` (`foreign_key`),
  CONSTRAINT `FK_547C9A607E366551` FOREIGN KEY (`foreign_key`) REFERENCES `pim_catalog_family` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_catalog_family_translation`
--

LOCK TABLES `pim_catalog_family_translation` WRITE;
/*!40000 ALTER TABLE `pim_catalog_family_translation` DISABLE KEYS */;
/*!40000 ALTER TABLE `pim_catalog_family_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_catalog_locale`
--

DROP TABLE IF EXISTS `pim_catalog_locale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pim_catalog_locale` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `default_currency_id` int(11) DEFAULT NULL,
  `code` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `fallback` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_activated` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_7405C7B177153098` (`code`),
  KEY `IDX_7405C7B1ECD792C0` (`default_currency_id`),
  CONSTRAINT `FK_7405C7B1ECD792C0` FOREIGN KEY (`default_currency_id`) REFERENCES `pim_catalog_currency` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_catalog_locale`
--

LOCK TABLES `pim_catalog_locale` WRITE;
/*!40000 ALTER TABLE `pim_catalog_locale` DISABLE KEYS */;
INSERT INTO `pim_catalog_locale` VALUES (83,NULL,'en_US',NULL,1),(84,NULL,'fr_FR',NULL,1),(85,NULL,'de_DE',NULL,0);
/*!40000 ALTER TABLE `pim_catalog_locale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_catalog_pending_completeness`
--

DROP TABLE IF EXISTS `pim_catalog_pending_completeness`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pim_catalog_pending_completeness` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locale_id` int(11) DEFAULT NULL,
  `channel_id` int(11) DEFAULT NULL,
  `family_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_7770B7FDE559DFD1` (`locale_id`),
  KEY `IDX_7770B7FD72F5A1AA` (`channel_id`),
  KEY `IDX_7770B7FDC35E566A` (`family_id`),
  CONSTRAINT `FK_7770B7FDC35E566A` FOREIGN KEY (`family_id`) REFERENCES `pim_catalog_family` (`id`),
  CONSTRAINT `FK_7770B7FD72F5A1AA` FOREIGN KEY (`channel_id`) REFERENCES `pim_catalog_channel` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_7770B7FDE559DFD1` FOREIGN KEY (`locale_id`) REFERENCES `pim_catalog_locale` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_catalog_pending_completeness`
--

LOCK TABLES `pim_catalog_pending_completeness` WRITE;
/*!40000 ALTER TABLE `pim_catalog_pending_completeness` DISABLE KEYS */;
INSERT INTO `pim_catalog_pending_completeness` VALUES (7,NULL,3,NULL),(8,83,3,NULL),(9,84,3,NULL),(10,NULL,4,NULL),(11,84,4,NULL);
/*!40000 ALTER TABLE `pim_catalog_pending_completeness` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_catalog_product`
--

DROP TABLE IF EXISTS `pim_catalog_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pim_catalog_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `family_id` int(11) DEFAULT NULL,
  `version` int(11) NOT NULL DEFAULT '1',
  `is_enabled` tinyint(1) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_91CD19C0C35E566A` (`family_id`),
  CONSTRAINT `FK_91CD19C0C35E566A` FOREIGN KEY (`family_id`) REFERENCES `pim_catalog_family` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_catalog_product`
--

LOCK TABLES `pim_catalog_product` WRITE;
/*!40000 ALTER TABLE `pim_catalog_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `pim_catalog_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_catalog_product_value`
--

DROP TABLE IF EXISTS `pim_catalog_product_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pim_catalog_product_value` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute_id` int(11) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `media_id` int(11) DEFAULT NULL,
  `metric_id` int(11) DEFAULT NULL,
  `entity_id` int(11) DEFAULT NULL,
  `value_string` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value_integer` int(11) DEFAULT NULL,
  `value_decimal` decimal(10,0) DEFAULT NULL,
  `value_boolean` tinyint(1) DEFAULT NULL,
  `value_text` longtext COLLATE utf8_unicode_ci,
  `value_date` date DEFAULT NULL,
  `value_datetime` datetime DEFAULT NULL,
  `locale_code` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `scope_code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_93A1BBF3EA9FDD75` (`media_id`),
  UNIQUE KEY `UNIQ_93A1BBF3A952D583` (`metric_id`),
  KEY `IDX_93A1BBF3B6E62EFA` (`attribute_id`),
  KEY `IDX_93A1BBF3A7C41D6F` (`option_id`),
  KEY `IDX_93A1BBF381257D5D` (`entity_id`),
  CONSTRAINT `FK_93A1BBF381257D5D` FOREIGN KEY (`entity_id`) REFERENCES `pim_catalog_product` (`id`),
  CONSTRAINT `FK_93A1BBF3A7C41D6F` FOREIGN KEY (`option_id`) REFERENCES `pim_catalog_attribute_option` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_93A1BBF3A952D583` FOREIGN KEY (`metric_id`) REFERENCES `oro_flexibleentity_metric` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_93A1BBF3B6E62EFA` FOREIGN KEY (`attribute_id`) REFERENCES `pim_catalog_attribute` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_93A1BBF3EA9FDD75` FOREIGN KEY (`media_id`) REFERENCES `oro_flexibleentity_media` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=742 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_catalog_product_value`
--

LOCK TABLES `pim_catalog_product_value` WRITE;
/*!40000 ALTER TABLE `pim_catalog_product_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `pim_catalog_product_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_catalog_product_value_price`
--

DROP TABLE IF EXISTS `pim_catalog_product_value_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pim_catalog_product_value_price` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value_id` int(11) DEFAULT NULL,
  `data` decimal(10,2) DEFAULT NULL,
  `currency_code` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_BE63E43EF920BBA2` (`value_id`),
  CONSTRAINT `FK_BE63E43EF920BBA2` FOREIGN KEY (`value_id`) REFERENCES `pim_catalog_product_value` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=157 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_catalog_product_value_price`
--

LOCK TABLES `pim_catalog_product_value_price` WRITE;
/*!40000 ALTER TABLE `pim_catalog_product_value_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `pim_catalog_product_value_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_catalog_value_option`
--

DROP TABLE IF EXISTS `pim_catalog_value_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pim_catalog_value_option` (
  `value_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  PRIMARY KEY (`value_id`,`option_id`),
  KEY `IDX_13214349F920BBA2` (`value_id`),
  KEY `IDX_13214349A7C41D6F` (`option_id`),
  CONSTRAINT `FK_13214349A7C41D6F` FOREIGN KEY (`option_id`) REFERENCES `pim_catalog_attribute_option` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_13214349F920BBA2` FOREIGN KEY (`value_id`) REFERENCES `pim_catalog_product_value` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_catalog_value_option`
--

LOCK TABLES `pim_catalog_value_option` WRITE;
/*!40000 ALTER TABLE `pim_catalog_value_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `pim_catalog_value_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_versioning_pending`
--

DROP TABLE IF EXISTS `pim_versioning_pending`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pim_versioning_pending` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `resource_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `resource_id` int(11) NOT NULL,
  `logged_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_versioning_pending`
--

LOCK TABLES `pim_versioning_pending` WRITE;
/*!40000 ALTER TABLE `pim_versioning_pending` DISABLE KEYS */;
INSERT INTO `pim_versioning_pending` VALUES (160,'admin','Pim\\Bundle\\CatalogBundle\\Entity\\ProductAttribute',12,'2013-09-10 21:47:33');
/*!40000 ALTER TABLE `pim_versioning_pending` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pim_versioning_version`
--

DROP TABLE IF EXISTS `pim_versioning_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pim_versioning_version` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `resource_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `resource_id` int(11) NOT NULL,
  `data` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `version` int(11) NOT NULL,
  `logged_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_A99EF708A76ED395` (`user_id`),
  CONSTRAINT `FK_A99EF708A76ED395` FOREIGN KEY (`user_id`) REFERENCES `oro_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pim_versioning_version`
--

LOCK TABLES `pim_versioning_version` WRITE;
/*!40000 ALTER TABLE `pim_versioning_version` DISABLE KEYS */;
/*!40000 ALTER TABLE `pim_versioning_version` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-09-10 21:48:49
