-- MySQL dump 10.13  Distrib 5.5.57, for debian-linux-gnu (x86_64)
--
-- Host: 0.0.0.0    Database: c9
-- ------------------------------------------------------
-- Server version	5.5.57-0ubuntu0.14.04.1

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
-- Table structure for table `craft_assetfiles`
--

DROP TABLE IF EXISTS `craft_assetfiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_assetfiles` (
  `id` int(11) NOT NULL,
  `sourceId` int(11) DEFAULT NULL,
  `folderId` int(11) NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `kind` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unknown',
  `width` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `size` bigint(20) unsigned DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_assetfiles_filename_folderId_unq_idx` (`filename`,`folderId`),
  KEY `craft_assetfiles_sourceId_fk` (`sourceId`),
  KEY `craft_assetfiles_folderId_fk` (`folderId`),
  CONSTRAINT `craft_assetfiles_folderId_fk` FOREIGN KEY (`folderId`) REFERENCES `craft_assetfolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_assetfiles_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_assetfiles_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `craft_assetsources` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_assetfiles`
--

LOCK TABLES `craft_assetfiles` WRITE;
/*!40000 ALTER TABLE `craft_assetfiles` DISABLE KEYS */;
INSERT INTO `craft_assetfiles` VALUES (4,1,1,'neville-brody-portrait.jpg','image',1679,1112,379665,'2017-08-24 10:15:48','2017-08-24 10:15:48','2017-08-24 10:15:48','c220df72-0390-4175-ab4e-e7f4af693455'),(33,1,1,'2208.jpg','image',300,360,36343,'2017-08-28 15:49:10','2017-08-28 15:49:10','2017-08-28 15:49:10','6723c008-da48-4139-a040-2c2f1578e3cb'),(34,1,1,'NevilleBrody2005.jpg','image',300,273,10015,'2017-08-28 16:30:59','2017-08-28 16:30:59','2017-08-28 16:30:59','e70e8d03-81cd-44e6-bae3-1aa33e4a34cf'),(46,1,1,'BA.Web.TestStories.Channel4.Image.21.jpg','image',1600,900,227937,'2017-08-30 13:12:07','2017-08-30 13:12:07','2017-08-30 13:12:07','cb0f3579-1189-47d9-892c-44da6c20588d'),(48,1,1,'yZlqh.png','image',600,600,3786,'2017-08-30 13:33:48','2017-08-30 13:33:48','2017-08-30 13:33:48','a1f1801e-6cff-4970-9dd5-63249cec2167'),(60,1,1,'BA.Web.TestStories.Channel4.Image.14.jpg','image',1200,773,144326,'2017-08-30 14:21:35','2017-08-30 14:21:35','2017-08-30 14:21:35','3d4692de-189e-4457-9af4-d306650030fa'),(63,1,1,'BA.Web.TestStories.Channel4.Image.1.jpg','image',1200,1164,325599,'2017-08-30 14:57:11','2017-08-30 14:57:11','2017-08-30 14:57:11','4aa41b26-37e3-4d72-aab3-6afe963cfed2'),(64,1,1,'BA.Web.TestStories.Channel4.Image.10.jpg','image',1200,854,202750,'2017-08-30 14:57:13','2017-08-30 14:57:13','2017-08-30 14:57:13','281e0b2c-a5b5-474b-a7ee-722d11fedd3c'),(65,1,1,'BA.Web.TestStories.Channel4.Image.30.jpg','image',849,1200,64607,'2017-08-30 14:57:13','2017-08-30 14:57:13','2017-08-30 14:57:13','72fc39fa-78ec-4d6f-8d8b-0c2f5bfdc3cc');
/*!40000 ALTER TABLE `craft_assetfiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_assetfolders`
--

DROP TABLE IF EXISTS `craft_assetfolders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_assetfolders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) DEFAULT NULL,
  `sourceId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_assetfolders_name_parentId_sourceId_unq_idx` (`name`,`parentId`,`sourceId`),
  KEY `craft_assetfolders_parentId_fk` (`parentId`),
  KEY `craft_assetfolders_sourceId_fk` (`sourceId`),
  CONSTRAINT `craft_assetfolders_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `craft_assetfolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_assetfolders_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `craft_assetsources` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_assetfolders`
--

LOCK TABLES `craft_assetfolders` WRITE;
/*!40000 ALTER TABLE `craft_assetfolders` DISABLE KEYS */;
INSERT INTO `craft_assetfolders` VALUES (1,NULL,1,'Assets','','2017-08-24 10:14:54','2017-08-24 10:14:54','d03958d4-8d80-4166-9a76-a3169497d7ae'),(2,NULL,2,'Fonts','','2017-08-24 13:29:07','2017-08-24 13:29:12','404c7754-5737-49e6-8631-2ca5aecf9e6a');
/*!40000 ALTER TABLE `craft_assetfolders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_assetindexdata`
--

DROP TABLE IF EXISTS `craft_assetindexdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_assetindexdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sessionId` varchar(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sourceId` int(10) NOT NULL,
  `offset` int(10) NOT NULL,
  `uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `recordId` int(10) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_assetindexdata_sessionId_sourceId_offset_unq_idx` (`sessionId`,`sourceId`,`offset`),
  KEY `craft_assetindexdata_sourceId_fk` (`sourceId`),
  CONSTRAINT `craft_assetindexdata_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `craft_assetsources` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_assetindexdata`
--

LOCK TABLES `craft_assetindexdata` WRITE;
/*!40000 ALTER TABLE `craft_assetindexdata` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_assetindexdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_assetsources`
--

DROP TABLE IF EXISTS `craft_assetsources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_assetsources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `fieldLayoutId` int(10) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_assetsources_name_unq_idx` (`name`),
  UNIQUE KEY `craft_assetsources_handle_unq_idx` (`handle`),
  KEY `craft_assetsources_fieldLayoutId_fk` (`fieldLayoutId`),
  CONSTRAINT `craft_assetsources_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_assetsources`
--

LOCK TABLES `craft_assetsources` WRITE;
/*!40000 ALTER TABLE `craft_assetsources` DISABLE KEYS */;
INSERT INTO `craft_assetsources` VALUES (1,'Assets','assets','Local','{\"path\":\"{basePath}\\/assets\\/content\\/\",\"publicURLs\":\"1\",\"url\":\"{siteUrl}\\/assets\\/content\\/\"}',1,119,'2017-08-24 10:14:54','2017-08-30 11:09:19','8e1c3849-fe7b-404d-b65b-105b51edc0bf'),(2,'Fonts','fonts','Local','{\"path\":\"fonts\\/content\\/\",\"publicURLs\":\"1\",\"url\":\"\\/fonts\\/content\\/\"}',2,59,'2017-08-24 13:29:07','2017-08-24 13:30:08','50235b62-95a9-4c30-a02a-073a4eb0cb7b');
/*!40000 ALTER TABLE `craft_assetsources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_assettransformindex`
--

DROP TABLE IF EXISTS `craft_assettransformindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_assettransformindex` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fileId` int(11) NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `format` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sourceId` int(11) DEFAULT NULL,
  `fileExists` tinyint(1) DEFAULT NULL,
  `inProgress` tinyint(1) DEFAULT NULL,
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_assettransformindex_sourceId_fileId_location_idx` (`sourceId`,`fileId`,`location`)
) ENGINE=InnoDB AUTO_INCREMENT=177 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_assettransformindex`
--

LOCK TABLES `craft_assettransformindex` WRITE;
/*!40000 ALTER TABLE `craft_assettransformindex` DISABLE KEYS */;
INSERT INTO `craft_assettransformindex` VALUES (141,4,'neville-brody-portrait.jpg',NULL,'_desktop',1,1,1,'2017-08-30 11:11:11','2017-08-30 11:11:11','2017-08-30 11:11:11','199160c4-6027-414e-9d45-21fd2e60c676'),(142,4,'neville-brody-portrait.jpg',NULL,'_desktopLarge',1,1,1,'2017-08-30 11:11:11','2017-08-30 11:11:11','2017-08-30 11:11:11','1af21894-07b2-42de-b361-9e445bb852ed'),(143,4,'neville-brody-portrait.jpg',NULL,'_phone',1,1,1,'2017-08-30 11:11:11','2017-08-30 11:11:11','2017-08-30 11:11:12','a3d31b89-8fbd-4ace-9da3-6dff154e46f1'),(144,4,'neville-brody-portrait.jpg',NULL,'_phone2x',1,1,1,'2017-08-30 11:11:12','2017-08-30 11:11:12','2017-08-30 11:11:12','96ee0482-1ddd-4c85-857b-61ba069b6b25'),(145,4,'neville-brody-portrait.jpg',NULL,'_tablet',1,1,1,'2017-08-30 11:11:12','2017-08-30 11:11:12','2017-08-30 11:11:12','aae2bd4f-9159-493b-a990-b04e2e4cbd9f'),(146,4,'neville-brody-portrait.jpg',NULL,'_tablet2x',1,1,1,'2017-08-30 11:11:12','2017-08-30 11:11:12','2017-08-30 11:11:13','1aaeec62-f2a7-4bb9-a2a2-b348afe22911'),(147,4,'neville-brody-portrait.jpg',NULL,'_tabletLandscape',1,1,1,'2017-08-30 11:11:13','2017-08-30 11:11:13','2017-08-30 11:11:13','b382c0c8-101e-4de0-bb69-282bf87a5967'),(148,46,'BA.Web.TestStories.Channel4.Image.21.jpg',NULL,'_desktop',1,1,1,'2017-08-30 13:39:09','2017-08-30 13:39:09','2017-08-30 13:39:10','949543dc-a141-41d2-aa11-43af31763f2d'),(149,46,'BA.Web.TestStories.Channel4.Image.21.jpg',NULL,'_desktopLarge',1,1,1,'2017-08-30 13:39:10','2017-08-30 13:39:10','2017-08-30 13:39:11','8e5e293b-d538-4f02-a923-72ca8455529e'),(150,46,'BA.Web.TestStories.Channel4.Image.21.jpg',NULL,'_phone',1,1,1,'2017-08-30 13:39:11','2017-08-30 13:39:11','2017-08-30 13:39:12','33ef6f20-43fb-4e0c-b7a7-c0ee375177d8'),(151,46,'BA.Web.TestStories.Channel4.Image.21.jpg',NULL,'_phone2x',1,1,1,'2017-08-30 13:39:12','2017-08-30 13:39:12','2017-08-30 13:39:12','2f9911b5-97d4-4877-8495-12feba691027'),(152,46,'BA.Web.TestStories.Channel4.Image.21.jpg',NULL,'_tablet',1,1,1,'2017-08-30 13:39:12','2017-08-30 13:39:12','2017-08-30 13:39:13','1b5c3aca-d207-47ca-94fe-b550a981345a'),(153,46,'BA.Web.TestStories.Channel4.Image.21.jpg',NULL,'_tablet2x',1,1,1,'2017-08-30 13:39:13','2017-08-30 13:39:13','2017-08-30 13:39:14','5e8c1c8f-8df1-4cd0-86b4-7159e94f4fd6'),(154,46,'BA.Web.TestStories.Channel4.Image.21.jpg',NULL,'_tabletLandscape',1,1,1,'2017-08-30 13:39:14','2017-08-30 13:39:14','2017-08-30 13:39:15','4d93c544-aada-49c4-938e-7e20fb6d99c2'),(155,48,'yZlqh.png',NULL,'_phone',1,1,1,'2017-08-30 13:48:16','2017-08-30 13:48:16','2017-08-30 13:48:18','5ebbcc19-ea8e-4419-9266-a370904e5872'),(156,60,'BA.Web.TestStories.Channel4.Image.14.jpg',NULL,'_phone',1,1,1,'2017-08-30 14:26:51','2017-08-30 14:26:51','2017-08-30 14:26:52','573556e0-daa5-4784-9c30-6b892f635001'),(157,60,'BA.Web.TestStories.Channel4.Image.14.jpg',NULL,'_tablet',1,1,1,'2017-08-30 14:26:52','2017-08-30 14:26:52','2017-08-30 14:26:52','e4dc23b1-80d8-49f4-b9d4-fd98ac895e8b'),(158,60,'BA.Web.TestStories.Channel4.Image.14.jpg',NULL,'_tabletLandscape',1,1,1,'2017-08-30 14:26:52','2017-08-30 14:26:52','2017-08-30 14:26:53','85a4c1cd-ee62-4b3a-884c-1e6e8e968ae6'),(159,60,'BA.Web.TestStories.Channel4.Image.14.jpg',NULL,'_desktop',1,1,1,'2017-08-30 14:26:54','2017-08-30 14:26:54','2017-08-30 14:26:57','96a8563f-2555-4ba3-9168-d43e2aa307b9'),(160,63,'BA.Web.TestStories.Channel4.Image.1.jpg',NULL,'_phone',1,1,1,'2017-08-30 14:57:32','2017-08-30 14:57:32','2017-08-30 14:57:33','24d86461-7008-4b90-99f7-94a20ebd4ed3'),(161,63,'BA.Web.TestStories.Channel4.Image.1.jpg',NULL,'_tablet',1,1,1,'2017-08-30 14:57:33','2017-08-30 14:57:33','2017-08-30 14:57:33','1b466459-2c92-4349-a64d-dd4473901b23'),(162,63,'BA.Web.TestStories.Channel4.Image.1.jpg',NULL,'_tabletLandscape',1,1,1,'2017-08-30 14:57:33','2017-08-30 14:57:33','2017-08-30 14:57:35','92410b36-cd01-4dd3-b43a-34de36fa9e3b'),(163,63,'BA.Web.TestStories.Channel4.Image.1.jpg',NULL,'_desktop',1,1,1,'2017-08-30 14:57:35','2017-08-30 14:57:35','2017-08-30 14:57:36','02507c7f-89dd-49db-8397-fff9dd43c527'),(164,64,'BA.Web.TestStories.Channel4.Image.10.jpg',NULL,'_phone',1,1,1,'2017-08-30 14:57:37','2017-08-30 14:57:37','2017-08-30 14:57:38','3dac9ae7-0a7e-4709-8b3d-ca85976e7f60'),(165,64,'BA.Web.TestStories.Channel4.Image.10.jpg',NULL,'_tablet',1,1,1,'2017-08-30 14:57:38','2017-08-30 14:57:38','2017-08-30 14:57:38','b34e45e6-e69c-40bc-8504-0d6ecae84316'),(166,64,'BA.Web.TestStories.Channel4.Image.10.jpg',NULL,'_tabletLandscape',1,1,1,'2017-08-30 14:57:38','2017-08-30 14:57:38','2017-08-30 14:57:39','e048b349-dde2-4b37-a53c-6193f8aef8e0'),(167,64,'BA.Web.TestStories.Channel4.Image.10.jpg',NULL,'_desktop',1,1,1,'2017-08-30 14:57:39','2017-08-30 14:57:39','2017-08-30 14:57:40','2cc07d4e-b44a-448c-a906-39f9130b63e7'),(168,65,'BA.Web.TestStories.Channel4.Image.30.jpg',NULL,'_phone',1,1,1,'2017-08-30 14:57:41','2017-08-30 14:57:41','2017-08-30 14:57:42','2d97f802-5db2-4f4f-8089-7e77a6747910'),(169,65,'BA.Web.TestStories.Channel4.Image.30.jpg',NULL,'_tablet',1,1,1,'2017-08-30 14:57:42','2017-08-30 14:57:42','2017-08-30 14:57:43','8d3ce8ac-e800-4133-b44a-f135216594d9'),(170,60,'BA.Web.TestStories.Channel4.Image.14.jpg',NULL,'_placeholder',1,1,1,'2017-08-30 15:07:02','2017-08-30 15:07:02','2017-08-30 15:07:03','c074d392-0316-4919-8f0e-36c0d7a84945'),(171,4,'neville-brody-portrait.jpg',NULL,'_placeholder',1,1,1,'2017-08-30 15:07:03','2017-08-30 15:07:03','2017-08-30 15:07:04','09b2d661-9aef-49ec-9c35-9579654ec874'),(172,63,'BA.Web.TestStories.Channel4.Image.1.jpg',NULL,'_placeholder',1,1,1,'2017-08-30 15:07:37','2017-08-30 15:07:37','2017-08-30 15:07:37','124a9b63-057c-41c6-831d-14aaa024bae8'),(173,64,'BA.Web.TestStories.Channel4.Image.10.jpg',NULL,'_placeholder',1,1,1,'2017-08-30 15:07:37','2017-08-30 15:07:37','2017-08-30 15:07:37','6e48ccca-bd5e-4fb9-90a9-b7f6f8a00f11'),(174,65,'BA.Web.TestStories.Channel4.Image.30.jpg',NULL,'_placeholder',1,1,1,'2017-08-30 15:07:37','2017-08-30 15:07:37','2017-08-30 15:07:37','54bb45b1-d09b-4830-a24c-91df8fdd6fec'),(175,46,'BA.Web.TestStories.Channel4.Image.21.jpg',NULL,'_placeholder',1,1,1,'2017-08-30 15:09:29','2017-08-30 15:09:29','2017-08-30 15:09:30','265e964a-ccd4-430a-84ac-cdc553a8028f'),(176,48,'yZlqh.png',NULL,'_placeholder',1,1,1,'2017-08-30 15:10:11','2017-08-30 15:10:11','2017-08-30 15:10:11','a76b09a2-08a6-4fe2-b123-356d076fa3e5');
/*!40000 ALTER TABLE `craft_assettransformindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_assettransforms`
--

DROP TABLE IF EXISTS `craft_assettransforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_assettransforms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mode` enum('stretch','fit','crop') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'center-center',
  `height` int(10) DEFAULT NULL,
  `width` int(10) DEFAULT NULL,
  `format` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quality` int(10) DEFAULT NULL,
  `dimensionChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_assettransforms_name_unq_idx` (`name`),
  UNIQUE KEY `craft_assettransforms_handle_unq_idx` (`handle`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_assettransforms`
--

LOCK TABLES `craft_assettransforms` WRITE;
/*!40000 ALTER TABLE `craft_assettransforms` DISABLE KEYS */;
INSERT INTO `craft_assettransforms` VALUES (1,'Phone','phone','crop','center-center',NULL,736,NULL,60,'2017-08-30 08:49:11','2017-08-30 08:49:11','2017-08-30 08:49:11','e9b4e15d-2d9b-41af-859c-ca0521a370b4'),(2,'Phone 2x','phone2x','crop','center-center',NULL,1472,NULL,60,'2017-08-30 08:49:56','2017-08-30 08:49:34','2017-08-30 08:49:56','36c702b0-dc22-42fc-b0d4-1713c5eedc5e'),(3,'Tablet','tablet','crop','center-center',NULL,768,NULL,60,'2017-08-30 08:49:51','2017-08-30 08:49:46','2017-08-30 08:49:51','c11d5288-987c-43d2-b8c1-83ab997330e1'),(4,'Tablet 2x','tablet2x','crop','center-center',NULL,1536,NULL,60,'2017-08-30 08:50:17','2017-08-30 08:50:11','2017-08-30 08:50:17','473e423a-3186-45ac-a375-231f30a11ea4'),(5,'Tablet Landscape','tabletLandscape','crop','center-center',NULL,1024,NULL,60,'2017-08-30 08:50:33','2017-08-30 08:50:33','2017-08-30 08:50:33','501ce607-8446-4b4a-8f1d-c0dbff3e896c'),(6,'Tablet Landscape 2x','tabletLandscape2x','crop','center-center',NULL,2048,NULL,60,'2017-08-30 08:50:50','2017-08-30 08:50:50','2017-08-30 08:50:50','f08f69eb-dbde-46b9-8b2f-6583f895907e'),(7,'Desktop','desktop','crop','center-center',NULL,1200,NULL,60,'2017-08-30 08:51:11','2017-08-30 08:51:11','2017-08-30 08:51:11','c6d03d1a-0571-4e2a-af37-2f277443259b'),(8,'Desktop 2x','desktop2x','crop','center-center',NULL,2400,NULL,60,'2017-08-30 08:51:29','2017-08-30 08:51:29','2017-08-30 08:51:29','442bbd68-7adf-4e80-ac18-c6557125bd03'),(9,'Desktop Large','desktopLarge','crop','center-center',NULL,1600,NULL,60,'2017-08-30 08:51:43','2017-08-30 08:51:43','2017-08-30 08:51:43','d687103f-879c-469a-9371-2976120c318f'),(10,'Desktop Large 2x','desktopLarge2x','crop','center-center',NULL,3200,NULL,60,'2017-08-30 08:51:58','2017-08-30 08:51:58','2017-08-30 08:51:58','cbf11496-afa7-4727-8b92-d2752e2221ab'),(11,'Placeholder','placeholder','crop','center-center',NULL,1,NULL,NULL,'2017-08-30 15:06:53','2017-08-30 15:06:53','2017-08-30 15:06:53','0cad9898-e071-4cbe-829a-7adfaa9a99fc');
/*!40000 ALTER TABLE `craft_assettransforms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_categories`
--

DROP TABLE IF EXISTS `craft_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_categories` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_categories_groupId_fk` (`groupId`),
  CONSTRAINT `craft_categories_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_categories_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_categories`
--

LOCK TABLES `craft_categories` WRITE;
/*!40000 ALTER TABLE `craft_categories` DISABLE KEYS */;
INSERT INTO `craft_categories` VALUES (7,1,'2017-08-25 11:08:43','2017-08-25 11:08:43','e021d892-c50b-44fb-9303-8ea444dc579c'),(18,1,'2017-08-28 13:47:43','2017-08-28 13:47:43','4de874a5-90b2-4c0f-8218-3505f12d922a'),(19,1,'2017-08-28 13:47:50','2017-08-28 13:47:50','0df2b1c7-c23f-4e4b-90b1-211744e14a31'),(20,1,'2017-08-28 13:48:02','2017-08-28 13:48:02','a12c8dd4-4794-495b-bbb9-190069b6bcfb'),(47,1,'2017-08-30 13:33:03','2017-08-30 13:33:03','c427d405-8d43-429d-96f5-100ca81878c4');
/*!40000 ALTER TABLE `craft_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_categorygroups`
--

DROP TABLE IF EXISTS `craft_categorygroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_categorygroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hasUrls` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `template` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_categorygroups_name_unq_idx` (`name`),
  UNIQUE KEY `craft_categorygroups_handle_unq_idx` (`handle`),
  KEY `craft_categorygroups_structureId_fk` (`structureId`),
  KEY `craft_categorygroups_fieldLayoutId_fk` (`fieldLayoutId`),
  CONSTRAINT `craft_categorygroups_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_categorygroups_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `craft_structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_categorygroups`
--

LOCK TABLES `craft_categorygroups` WRITE;
/*!40000 ALTER TABLE `craft_categorygroups` DISABLE KEYS */;
INSERT INTO `craft_categorygroups` VALUES (1,1,53,'Disciplines','disciplines',1,'','2017-08-24 13:18:13','2017-08-24 13:18:13','b29ad97c-b6cc-4321-a2b9-c5ef45a5fc9b');
/*!40000 ALTER TABLE `craft_categorygroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_categorygroups_i18n`
--

DROP TABLE IF EXISTS `craft_categorygroups_i18n`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_categorygroups_i18n` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `urlFormat` text COLLATE utf8_unicode_ci,
  `nestedUrlFormat` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_categorygroups_i18n_groupId_locale_unq_idx` (`groupId`,`locale`),
  KEY `craft_categorygroups_i18n_locale_fk` (`locale`),
  CONSTRAINT `craft_categorygroups_i18n_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_categorygroups_i18n_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_categorygroups_i18n`
--

LOCK TABLES `craft_categorygroups_i18n` WRITE;
/*!40000 ALTER TABLE `craft_categorygroups_i18n` DISABLE KEYS */;
INSERT INTO `craft_categorygroups_i18n` VALUES (1,1,'en_gb','disciplines/{slug}','{parent.uri}/{slug}','2017-08-24 13:18:13','2017-08-24 13:18:13','7307aa87-1fe4-4fb8-bdd6-6d8a98d2ea25');
/*!40000 ALTER TABLE `craft_categorygroups_i18n` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_content`
--

DROP TABLE IF EXISTS `craft_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_body` text COLLATE utf8_unicode_ci,
  `field_client` text COLLATE utf8_unicode_ci,
  `field_completionDate` datetime DEFAULT NULL,
  `field_intro` text COLLATE utf8_unicode_ci,
  `field_textColor` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_bgColor` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_bgFixed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_content_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_content_title_idx` (`title`),
  KEY `craft_content_locale_fk` (`locale`),
  CONSTRAINT `craft_content_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_content_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_content`
--

LOCK TABLES `craft_content` WRITE;
/*!40000 ALTER TABLE `craft_content` DISABLE KEYS */;
INSERT INTO `craft_content` VALUES (1,1,'en_gb',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'2017-08-23 20:18:17','2017-08-23 20:18:17','9b53b54d-8443-4f25-a9d9-2397c4b7748a'),(2,2,'en_gb','Home','<p>It’s true, this site doesn’t have a whole lot of content yet, but don’t worry. Our web developers have just installed the CMS, and they’re setting things up for the content editors this very moment. Soon Brody-backend-simonsweeney.c9users.io will be an oasis of fresh perspectives, sharp analyses, and astute opinions that will keep you coming back again and again.</p>',NULL,NULL,NULL,NULL,NULL,0,'2017-08-23 20:18:19','2017-08-30 10:22:10','bb0f504a-f0ce-4099-b474-8c631086aeff'),(4,4,'en_gb','Neville Brody Portrait',NULL,NULL,NULL,NULL,NULL,NULL,0,'2017-08-24 10:15:48','2017-08-24 10:15:48','63ee7584-0438-4a6d-8798-f9aa36a1a7cf'),(5,5,'en_gb','Channel 4',NULL,'Channel 4','2016-01-01 00:00:00','<p>TEST</p>','#000000','#000000',0,'2017-08-25 09:03:02','2017-08-30 13:19:24','b7097783-b0ab-438e-9281-7c7ed68f79ef'),(6,6,'en_gb','Coca Cola',NULL,'Coca Cola','2017-08-01 00:00:00','<p>TEST</p>','#000000','#c2c2c2',0,'2017-08-25 09:03:17','2017-08-30 11:15:08','b51b14e5-a3f6-4d0f-9ef7-2f38f35f3fe1'),(7,7,'en_gb','Identity',NULL,NULL,NULL,NULL,NULL,NULL,0,'2017-08-25 11:08:43','2017-08-25 11:08:43','03edc842-4390-4727-8b8a-84b0476030b2'),(8,9,'en_gb','Samsung',NULL,'',NULL,'','#000000','#000000',0,'2017-08-28 13:45:29','2017-08-30 11:15:08','d64fbef4-3cfa-4f91-8193-c61c0c50be5b'),(9,10,'en_gb','Paris Baguette',NULL,'',NULL,'','#000000','#000000',0,'2017-08-28 13:45:56','2017-08-30 11:15:08','6effbecf-e3d5-4f3b-a67d-1b153c6d9401'),(10,11,'en_gb','Punk London / Design Museum',NULL,'',NULL,'','#000000','#000000',0,'2017-08-28 13:46:19','2017-08-30 11:15:08','348dbc04-66ff-436b-8458-746fabe00195'),(11,12,'en_gb','Nike / England',NULL,'',NULL,'','#000000','#000000',0,'2017-08-28 13:46:30','2017-08-30 11:15:08','cb66dd7a-550c-4eea-97fc-d78f2e68ce74'),(12,13,'en_gb','C@W',NULL,'',NULL,'','#000000','#000000',0,'2017-08-28 13:46:45','2017-08-30 11:15:08','5787e7b5-64d4-425f-9f95-b8749e0c6e5f'),(13,14,'en_gb','Balfron Tower',NULL,'',NULL,'','#000000','#000000',0,'2017-08-28 13:46:57','2017-08-30 11:15:08','d6df3fc2-f4d0-40a2-9e13-749b6107a327'),(14,15,'en_gb','Samlip',NULL,'',NULL,'','#000000','#000000',0,'2017-08-28 13:47:07','2017-08-30 11:15:08','658fe010-5705-4e31-a285-be39ababa0c1'),(15,16,'en_gb','RCA 175',NULL,'',NULL,'','#000000','#000000',0,'2017-08-28 13:47:22','2017-08-30 11:15:08','9d4ec6fd-d716-4a01-8af8-07f8776c9b78'),(16,17,'en_gb','RCA 180',NULL,'',NULL,'','#000000','#000000',0,'2017-08-28 13:47:31','2017-08-30 11:15:08','c62bbbc9-ba25-416e-a181-013bc9fb6c29'),(17,18,'en_gb','Typography',NULL,NULL,NULL,NULL,NULL,NULL,0,'2017-08-28 13:47:43','2017-08-28 13:47:43','f2664fca-1614-4a65-b8fe-e2e73eb3a633'),(18,19,'en_gb','Digital',NULL,NULL,NULL,NULL,NULL,NULL,0,'2017-08-28 13:47:50','2017-08-28 13:47:50','1bf5d735-d428-4185-82bc-4cc3cc0560ff'),(19,20,'en_gb','Art Direction',NULL,NULL,NULL,NULL,NULL,NULL,0,'2017-08-28 13:48:02','2017-08-28 13:48:02','0e97d6d7-e6ca-4496-9e17-a36fdb2ad7a7'),(20,21,'en_gb','Christian Dior',NULL,'',NULL,'','#000000','#000000',0,'2017-08-28 14:04:38','2017-08-30 11:15:08','8ef52148-8d21-487d-b2e4-12531dfd946a'),(21,22,'en_gb','UFA',NULL,'',NULL,'','#000000','#000000',0,'2017-08-28 14:05:01','2017-08-30 11:15:08','853ea275-78cb-494a-a149-97306d3e8bc9'),(22,23,'en_gb','BBC Website',NULL,'',NULL,'','#000000','#000000',0,'2017-08-28 14:05:24','2017-08-30 11:15:08','85151104-d310-404d-a185-a75c100b2770'),(23,24,'en_gb','RCA Website',NULL,'',NULL,'','#000000','#000000',0,'2017-08-28 14:05:44','2017-08-30 11:15:09','65b8e9df-e107-4160-a3d1-cbb79bb66b71'),(24,25,'en_gb','Vandals',NULL,'',NULL,'','#000000','#000000',0,'2017-08-28 14:06:13','2017-08-30 11:15:09','b9bcab21-6de2-4784-b509-b8beffc0bb11'),(25,26,'en_gb','Supreme',NULL,'',NULL,'','#000000','#000000',0,'2017-08-28 14:06:34','2017-08-30 11:15:09','93257f10-c9f0-4775-a440-7326453e0186'),(26,27,'en_gb','Ginza Magazine',NULL,'',NULL,'','#000000','#000000',0,'2017-08-28 14:08:00','2017-08-30 11:15:09','2317fb88-aaa1-449b-88c9-bd4b350582dd'),(27,28,'en_gb','Uniqlo',NULL,'',NULL,'','#000000','#000000',0,'2017-08-28 14:08:25','2017-08-30 11:15:09','adbf85fd-f633-4f70-a412-d53768151673'),(28,29,'en_gb','Tate / BMW Tate Live Book',NULL,'',NULL,'','#000000','#000000',0,'2017-08-28 14:08:50','2017-08-30 11:15:09','a7af9550-8fef-4be0-ba00-f6401888c3fb'),(29,33,'en_gb','2208',NULL,NULL,NULL,NULL,NULL,NULL,0,'2017-08-28 15:49:10','2017-08-28 15:49:10','73c7c196-e919-4dbe-96b6-1314585df35b'),(30,34,'en_gb','Neville Brody2005',NULL,NULL,NULL,NULL,NULL,NULL,0,'2017-08-28 16:30:59','2017-08-28 16:30:59','91b33032-912e-45d8-b3b4-1b031ddfc503'),(31,37,'en_gb','Menu',NULL,NULL,NULL,NULL,NULL,NULL,0,'2017-08-28 17:22:36','2017-08-30 13:40:02','0b88cd2b-43f3-4261-8cf3-bbe2b620c24d'),(32,42,'en_gb','Contact',NULL,NULL,NULL,NULL,NULL,NULL,0,'2017-08-29 16:14:37','2017-08-29 16:14:37','5bb4cb6e-b6a5-4339-b79a-f79cf4bd0908'),(35,46,'en_gb','Ba Web Test Stories Channel4 Image 21',NULL,NULL,NULL,NULL,NULL,NULL,0,'2017-08-30 13:12:07','2017-08-30 13:12:07','6062af67-fdf7-4cb6-bb93-2293747088d2'),(36,47,'en_gb','Test',NULL,NULL,NULL,NULL,NULL,NULL,0,'2017-08-30 13:33:03','2017-08-30 13:33:03','47f5ad2a-d6f3-4787-ac89-54818dcae703'),(37,48,'en_gb','Y Zlqh',NULL,NULL,NULL,NULL,NULL,NULL,0,'2017-08-30 13:33:48','2017-08-30 13:33:48','86639e03-6457-4aca-a6a5-399f26d86518'),(38,49,'en_gb','Text Test',NULL,'Brody Associates',NULL,'<p>sure</p>','#000000','#dddddd',0,'2017-08-30 13:35:23','2017-08-30 14:09:06','5b647a65-b8fb-40e7-bdcc-c6b49265a9e0'),(39,60,'en_gb','Ba Web Test Stories Channel4 Image 14',NULL,NULL,NULL,NULL,NULL,NULL,0,'2017-08-30 14:21:35','2017-08-30 14:21:35','90972b9a-77bd-4523-9fc5-1f171d8d4503'),(40,61,'en_gb','Visuals Test',NULL,'Brody Associates',NULL,'<p>Yeah</p>','#000000','#dddddd',0,'2017-08-30 14:21:43','2017-08-30 14:57:26','a369def6-7863-4219-89b3-c21573469385'),(41,63,'en_gb','Ba Web Test Stories Channel4 Image 1',NULL,NULL,NULL,NULL,NULL,NULL,0,'2017-08-30 14:57:11','2017-08-30 14:57:11','0def4205-131e-4794-ad7e-e710d0224f06'),(42,64,'en_gb','Ba Web Test Stories Channel4 Image 10',NULL,NULL,NULL,NULL,NULL,NULL,0,'2017-08-30 14:57:13','2017-08-30 14:57:13','7e2b5e83-6cc8-4eed-8f29-7f29518400f5'),(43,65,'en_gb','Ba Web Test Stories Channel4 Image 30',NULL,NULL,NULL,NULL,NULL,NULL,0,'2017-08-30 14:57:13','2017-08-30 14:57:13','9f2ab22c-66f4-4528-95d7-7e660231e696');
/*!40000 ALTER TABLE `craft_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_deprecationerrors`
--

DROP TABLE IF EXISTS `craft_deprecationerrors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_deprecationerrors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fingerprint` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `line` smallint(6) unsigned NOT NULL,
  `class` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `method` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `template` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `templateLine` smallint(6) unsigned DEFAULT NULL,
  `message` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `traces` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_deprecationerrors_key_fingerprint_unq_idx` (`key`,`fingerprint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_deprecationerrors`
--

LOCK TABLES `craft_deprecationerrors` WRITE;
/*!40000 ALTER TABLE `craft_deprecationerrors` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_deprecationerrors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_elementindexsettings`
--

DROP TABLE IF EXISTS `craft_elementindexsettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_elementindexsettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_elementindexsettings_type_unq_idx` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_elementindexsettings`
--

LOCK TABLES `craft_elementindexsettings` WRITE;
/*!40000 ALTER TABLE `craft_elementindexsettings` DISABLE KEYS */;
INSERT INTO `craft_elementindexsettings` VALUES (1,'Entry','{\"sources\":{\"section:4\":{\"tableAttributes\":{\"1\":\"field:39\"}}}}','2017-08-30 10:29:06','2017-08-30 11:15:19','5727c7ed-9765-4f4a-8c60-3aa745dc56ef');
/*!40000 ALTER TABLE `craft_elementindexsettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_elements`
--

DROP TABLE IF EXISTS `craft_elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_elements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `archived` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_elements_type_idx` (`type`),
  KEY `craft_elements_enabled_idx` (`enabled`),
  KEY `craft_elements_archived_dateCreated_idx` (`archived`,`dateCreated`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_elements`
--

LOCK TABLES `craft_elements` WRITE;
/*!40000 ALTER TABLE `craft_elements` DISABLE KEYS */;
INSERT INTO `craft_elements` VALUES (1,'User',1,0,'2017-08-23 20:18:17','2017-08-23 20:18:17','734eeb2d-07db-461d-bdc0-055f4df420fd'),(2,'Entry',1,0,'2017-08-23 20:18:19','2017-08-30 10:22:10','b00c6305-00c3-454a-8046-d1d983331145'),(4,'Asset',1,0,'2017-08-24 10:15:48','2017-08-24 10:15:48','bdc90b44-e1e3-48bd-8fa5-35cf6736ae65'),(5,'Entry',1,0,'2017-08-25 09:03:02','2017-08-30 13:19:24','3a114c83-988f-46c2-beac-ec658ffdfddc'),(6,'Entry',1,0,'2017-08-25 09:03:17','2017-08-30 11:15:08','9d3d680a-512d-44dc-9534-ecc79b41b435'),(7,'Category',1,0,'2017-08-25 11:08:43','2017-08-25 11:08:43','1cd1ad16-f599-4257-93e6-64c9c3cb9815'),(8,'MatrixBlock',1,0,'2017-08-25 11:12:07','2017-08-28 13:50:03','59453d9b-31ad-4129-835b-5fd3f2fed0ae'),(9,'Entry',1,0,'2017-08-28 13:45:29','2017-08-30 11:15:08','11d184e5-0a51-42ca-833c-6a5ce29b145f'),(10,'Entry',1,0,'2017-08-28 13:45:56','2017-08-30 11:15:08','888e449f-8bd4-414c-85da-36d57b2681c5'),(11,'Entry',1,0,'2017-08-28 13:46:19','2017-08-30 11:15:08','dbd8f44b-c8b9-4844-ac3a-93b035000241'),(12,'Entry',1,0,'2017-08-28 13:46:30','2017-08-30 11:15:08','df95e517-e355-4d47-9e40-1c55271604bf'),(13,'Entry',1,0,'2017-08-28 13:46:45','2017-08-30 11:15:08','8fe47345-2b2e-44dd-9366-98763a1a8123'),(14,'Entry',1,0,'2017-08-28 13:46:57','2017-08-30 11:15:08','ef833927-ada9-429a-a478-8ab3a374c1c6'),(15,'Entry',1,0,'2017-08-28 13:47:07','2017-08-30 11:15:08','b529e83e-4bee-45f9-a23c-0460f6e6442d'),(16,'Entry',1,0,'2017-08-28 13:47:22','2017-08-30 11:15:08','d1bc78dd-eb0b-4160-a2e7-210f451a97e2'),(17,'Entry',1,0,'2017-08-28 13:47:31','2017-08-30 11:15:08','b443545b-f31e-41aa-916a-22550a4f46f7'),(18,'Category',1,0,'2017-08-28 13:47:43','2017-08-28 13:47:43','dfccd4fc-34ba-444b-b740-390b12f679fd'),(19,'Category',1,0,'2017-08-28 13:47:50','2017-08-28 13:47:50','5ea86e42-bdff-4a85-b726-8b49f29c7c10'),(20,'Category',1,0,'2017-08-28 13:48:02','2017-08-28 13:48:02','af300e4c-6a1f-4da9-a5d0-59a6b3bca595'),(21,'Entry',1,0,'2017-08-28 14:04:38','2017-08-30 11:15:08','7ea8a21e-5fc6-4cd8-9c30-65b2b4245e8c'),(22,'Entry',1,0,'2017-08-28 14:05:01','2017-08-30 11:15:08','cea7b9c4-0a25-4637-b7b9-433a2a07d7f8'),(23,'Entry',1,0,'2017-08-28 14:05:24','2017-08-30 11:15:08','73f14de0-1897-4d11-a51a-7322fdf76f29'),(24,'Entry',1,0,'2017-08-28 14:05:44','2017-08-30 11:15:09','58cdac23-07db-4fad-ab24-65da36e47067'),(25,'Entry',1,0,'2017-08-28 14:06:13','2017-08-30 11:15:09','3a9a76ed-5595-4790-915d-565d62103312'),(26,'Entry',1,0,'2017-08-28 14:06:34','2017-08-30 11:15:09','752ab382-ba1d-4872-92a4-9e45c0ea2eed'),(27,'Entry',1,0,'2017-08-28 14:08:00','2017-08-30 11:15:09','db011ee2-1fd5-4eb0-a1f9-d270b8b8ad7b'),(28,'Entry',1,0,'2017-08-28 14:08:25','2017-08-30 11:15:09','6b47448f-8dc5-4c1d-99ca-0d52cfad53c0'),(29,'Entry',1,0,'2017-08-28 14:08:50','2017-08-30 11:15:09','39a47d7b-23b7-469c-8f1b-c0403178c386'),(30,'MatrixBlock',1,0,'2017-08-28 14:50:40','2017-08-30 13:19:24','eff13b47-4f3e-4bc8-9812-c396834cef2e'),(33,'Asset',1,0,'2017-08-28 15:49:10','2017-08-28 15:49:10','2098f880-c29c-4f7a-ba18-e21a4e816465'),(34,'Asset',1,0,'2017-08-28 16:30:59','2017-08-28 16:30:59','00f6f0bb-ba62-49be-ab57-4763a6d7bc0e'),(37,'Entry',1,0,'2017-08-28 17:22:36','2017-08-30 13:40:02','50f3ef21-6c63-4fac-b036-9b83a3900bc5'),(38,'MatrixBlock',1,0,'2017-08-29 14:04:11','2017-08-30 13:40:02','c4a6e361-b272-4f2e-b604-2dcb434d1db5'),(39,'MatrixBlock',1,0,'2017-08-29 14:31:02','2017-08-30 13:40:02','e8587237-ec4d-4639-917e-e3ceba8c6a69'),(40,'MatrixBlock',1,0,'2017-08-29 14:31:02','2017-08-30 13:40:02','318dade9-c8b8-4c4a-aa1d-d396e3f1db76'),(41,'MatrixBlock',1,0,'2017-08-29 14:31:02','2017-08-30 13:40:02','0c2d946a-bdcf-412b-87e6-867204766ece'),(42,'Entry',1,0,'2017-08-29 16:14:37','2017-08-29 16:14:37','c125b84c-75ac-40ab-aa02-c3e658ae89d9'),(43,'MatrixBlock',1,0,'2017-08-29 16:15:13','2017-08-30 13:40:03','c2b7ff9e-8ecd-4af4-8e17-23649702a70a'),(46,'Asset',1,0,'2017-08-30 13:12:07','2017-08-30 13:12:07','1fbd6ff4-39e7-4134-ba87-ad6b38c9a95d'),(47,'Category',1,0,'2017-08-30 13:33:03','2017-08-30 13:33:03','29072e13-fceb-486d-8b80-bddf0a16d21a'),(48,'Asset',1,0,'2017-08-30 13:33:48','2017-08-30 13:33:48','5b35fe80-9aea-449e-a1fc-5b288e26201a'),(49,'Entry',1,0,'2017-08-30 13:35:23','2017-08-30 14:09:06','10099483-f596-4ce0-96f4-be5430112622'),(50,'MatrixBlock',1,0,'2017-08-30 13:35:23','2017-08-30 14:09:06','cc0e7b36-6b78-4170-b134-eb6da948c4cb'),(51,'MatrixBlock',1,0,'2017-08-30 13:35:23','2017-08-30 14:09:06','9aca5e14-49b8-481f-9c24-c04a35835bb6'),(52,'MatrixBlock',1,0,'2017-08-30 13:35:23','2017-08-30 14:09:06','537a45e4-7870-4a04-8a5f-71eb0922103c'),(53,'MatrixBlock',1,0,'2017-08-30 13:35:23','2017-08-30 14:09:06','22454aa4-cdb7-4df0-9196-938416e3880c'),(54,'MatrixBlock',1,0,'2017-08-30 13:35:23','2017-08-30 14:09:06','51eee1ae-d87d-4594-91c1-1fb2ce0e9560'),(55,'MatrixBlock',1,0,'2017-08-30 13:35:23','2017-08-30 14:09:06','f34197f2-b8b6-418b-9f03-9302dea189f1'),(56,'MatrixBlock',1,0,'2017-08-30 13:35:23','2017-08-30 14:09:06','5e4d6fd0-ab5a-4fb0-8a50-d3d45abbf5f5'),(57,'MatrixBlock',1,0,'2017-08-30 13:35:23','2017-08-30 14:09:06','fef87ed0-b0ce-460a-8070-bcbf353949af'),(58,'MatrixBlock',1,0,'2017-08-30 13:35:23','2017-08-30 14:09:06','71bfca7e-555a-443b-886e-851788cf5552'),(59,'MatrixBlock',1,0,'2017-08-30 13:40:03','2017-08-30 13:40:03','5f8e5e25-54c3-4f2f-aa3e-c4bec639090a'),(60,'Asset',1,0,'2017-08-30 14:21:35','2017-08-30 14:21:35','8e837117-75dd-4b42-8f24-9d4c5f58f980'),(61,'Entry',1,0,'2017-08-30 14:21:43','2017-08-30 14:57:26','4ade6e3d-906a-42ae-9a4f-eaad514dea02'),(62,'MatrixBlock',1,0,'2017-08-30 14:21:43','2017-08-30 14:57:26','6cab94a9-14a5-4017-905f-ef6cb43265cc'),(63,'Asset',1,0,'2017-08-30 14:57:11','2017-08-30 14:57:11','d2bc5a3c-3cda-4351-91b5-325d9af7c8bf'),(64,'Asset',1,0,'2017-08-30 14:57:13','2017-08-30 14:57:13','b6c12197-f650-4ac3-bea7-5d70197fb557'),(65,'Asset',1,0,'2017-08-30 14:57:13','2017-08-30 14:57:13','36dc6a19-7c01-428a-a3ce-fe85c104913b'),(66,'MatrixBlock',1,0,'2017-08-30 14:57:26','2017-08-30 14:57:26','2ad01e1b-665c-4082-b92f-3521cd845d0b');
/*!40000 ALTER TABLE `craft_elements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_elements_i18n`
--

DROP TABLE IF EXISTS `craft_elements_i18n`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_elements_i18n` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_elements_i18n_elementId_locale_unq_idx` (`elementId`,`locale`),
  UNIQUE KEY `craft_elements_i18n_uri_locale_unq_idx` (`uri`,`locale`),
  KEY `craft_elements_i18n_slug_locale_idx` (`slug`,`locale`),
  KEY `craft_elements_i18n_enabled_idx` (`enabled`),
  KEY `craft_elements_i18n_locale_fk` (`locale`),
  CONSTRAINT `craft_elements_i18n_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_elements_i18n_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_elements_i18n`
--

LOCK TABLES `craft_elements_i18n` WRITE;
/*!40000 ALTER TABLE `craft_elements_i18n` DISABLE KEYS */;
INSERT INTO `craft_elements_i18n` VALUES (1,1,'en_gb','',NULL,1,'2017-08-23 20:18:18','2017-08-23 20:18:18','3cbea314-916b-46d2-adc9-9ab148c108d5'),(2,2,'en_gb','homepage','__home__',1,'2017-08-23 20:18:19','2017-08-30 10:22:10','fccccb59-4f35-42d7-8746-ded186153bbf'),(4,4,'en_gb','neville-brody-portrait',NULL,1,'2017-08-24 10:15:48','2017-08-24 10:15:48','b1b59325-0ea7-421a-b7c4-a3f5c880e98c'),(5,5,'en_gb','channel-4',NULL,1,'2017-08-25 09:03:02','2017-08-30 13:19:24','67503367-7d9e-4c34-9c04-e0d9d662aa7f'),(6,6,'en_gb','coca-cola',NULL,1,'2017-08-25 09:03:17','2017-08-30 11:15:08','6260919e-41dd-4a16-a78f-dd7fa4daace4'),(7,7,'en_gb','identity','disciplines/identity',1,'2017-08-25 11:08:43','2017-08-25 11:08:43','e4017c4c-f87c-4021-8731-d04b6fe3387d'),(8,8,'en_gb','',NULL,1,'2017-08-25 11:12:07','2017-08-28 13:50:03','8ffc250c-8851-40e6-aa6f-8bfff00a1576'),(9,9,'en_gb','samsung',NULL,1,'2017-08-28 13:45:29','2017-08-30 11:15:08','10d9bd55-a8af-4e8d-90e0-a27b668321f2'),(10,10,'en_gb','paris-baguette',NULL,1,'2017-08-28 13:45:56','2017-08-30 11:15:08','368c2542-e550-44c4-8254-00f6f1b1c2bd'),(11,11,'en_gb','punk-london-design-museum',NULL,1,'2017-08-28 13:46:19','2017-08-30 11:15:08','27aa0f71-ad8a-44ae-be0d-7653ed1e5d92'),(12,12,'en_gb','nike-england',NULL,1,'2017-08-28 13:46:30','2017-08-30 11:15:08','436efe04-65a4-4e49-aa72-d8826919b7ff'),(13,13,'en_gb','c-w',NULL,1,'2017-08-28 13:46:45','2017-08-30 11:15:08','b98d7fca-3bb5-4abc-98e0-7f52dcee9570'),(14,14,'en_gb','balfron-tower',NULL,1,'2017-08-28 13:46:57','2017-08-30 11:15:08','839c4c3e-7997-474e-bf1f-1d5ad06e2ce9'),(15,15,'en_gb','samlip',NULL,1,'2017-08-28 13:47:07','2017-08-30 11:15:08','192a53c7-3805-4430-b129-f6709547cc49'),(16,16,'en_gb','rca-175',NULL,1,'2017-08-28 13:47:22','2017-08-30 11:15:08','97967f75-be23-4b22-9005-b58695c958a3'),(17,17,'en_gb','rca-180',NULL,1,'2017-08-28 13:47:31','2017-08-30 11:15:08','cb833359-11b5-4ac8-98c2-0d994fb4d40d'),(18,18,'en_gb','typography','disciplines/typography',1,'2017-08-28 13:47:43','2017-08-28 13:47:43','583ee1f6-d82d-4551-be63-9f74b0abc40d'),(19,19,'en_gb','digital','disciplines/digital',1,'2017-08-28 13:47:50','2017-08-28 13:47:50','a6dd5940-cba0-4a79-80ad-b7aa70f47e49'),(20,20,'en_gb','art-direction','disciplines/art-direction',1,'2017-08-28 13:48:02','2017-08-28 13:48:02','749105ff-5dea-4be8-8aa5-855149b17e0b'),(21,21,'en_gb','christian-dior',NULL,1,'2017-08-28 14:04:38','2017-08-30 11:15:08','3553f7f6-5920-423d-99e9-56374e53c3d4'),(22,22,'en_gb','ufa',NULL,1,'2017-08-28 14:05:01','2017-08-30 11:15:08','0307dd91-885e-40ba-a50f-9e4d78676e55'),(23,23,'en_gb','bbc-website',NULL,1,'2017-08-28 14:05:24','2017-08-30 11:15:09','237d25f9-60a8-4a94-88c5-75e530147fe8'),(24,24,'en_gb','rca-website',NULL,1,'2017-08-28 14:05:44','2017-08-30 11:15:09','ea417fc9-f6dd-4227-b83e-d341ae076c53'),(25,25,'en_gb','vandals',NULL,1,'2017-08-28 14:06:13','2017-08-30 11:15:09','4066e535-6bec-4ba3-8b5a-24044dc22f3b'),(26,26,'en_gb','supreme',NULL,1,'2017-08-28 14:06:34','2017-08-30 11:15:09','4d73c034-b04a-4b2b-9afe-f1da7d8643e7'),(27,27,'en_gb','ginza-magazine',NULL,1,'2017-08-28 14:08:00','2017-08-30 11:15:09','5cee748d-af65-4f92-ac0d-21a2545ede37'),(28,28,'en_gb','uniqlo',NULL,1,'2017-08-28 14:08:25','2017-08-30 11:15:09','29b7de5d-45a8-4088-bcb9-8ff2c2eb8d0b'),(29,29,'en_gb','tate-bmw-tate-live-book',NULL,1,'2017-08-28 14:08:50','2017-08-30 11:15:09','de687253-ed96-43bc-bcc8-d060771e5812'),(30,30,'en_gb','',NULL,1,'2017-08-28 14:50:40','2017-08-30 13:19:24','d851f611-233e-4ded-bc3a-5d44278aa535'),(33,33,'en_gb','2208',NULL,1,'2017-08-28 15:49:10','2017-08-28 15:49:10','b647796a-2caf-43d0-9140-ae65283a3fa9'),(34,34,'en_gb','neville-brody2005',NULL,1,'2017-08-28 16:30:59','2017-08-28 16:30:59','da1c3272-c989-4134-85d3-686578c12efa'),(37,37,'en_gb','menu','menu',1,'2017-08-28 17:22:36','2017-08-30 13:40:02','464a65da-2934-43c2-8ce1-6dbc95695d30'),(38,38,'en_gb','',NULL,1,'2017-08-29 14:04:11','2017-08-30 13:40:02','e3c91a62-8206-4e75-af0d-8b9535e67fc7'),(39,39,'en_gb','',NULL,1,'2017-08-29 14:31:02','2017-08-30 13:40:02','9a964388-9b36-458a-a11d-d919f2beac96'),(40,40,'en_gb','',NULL,1,'2017-08-29 14:31:02','2017-08-30 13:40:02','509cbe93-5760-4292-9bbc-0c85f195e163'),(41,41,'en_gb','',NULL,1,'2017-08-29 14:31:02','2017-08-30 13:40:03','13a89ed7-5e5a-4f56-9cc8-1639c27162bd'),(42,42,'en_gb','contact','contact',1,'2017-08-29 16:14:37','2017-08-29 16:14:37','d2f1f01d-6110-4fc9-a21d-16f505e2dfe5'),(43,43,'en_gb','',NULL,1,'2017-08-29 16:15:13','2017-08-30 13:40:03','fbb1d2cf-bc8d-4b8f-be5f-4e4dbb14df8b'),(46,46,'en_gb','ba-web-test-stories-channel4-image-21',NULL,1,'2017-08-30 13:12:07','2017-08-30 13:12:07','41ecd096-9431-41d2-812e-e1e8b8a17581'),(47,47,'en_gb','test','disciplines/test',1,'2017-08-30 13:33:03','2017-08-30 13:33:05','8c236c5c-6225-418f-872a-42524d36f0e1'),(48,48,'en_gb','y-zlqh',NULL,1,'2017-08-30 13:33:48','2017-08-30 13:33:48','a0848826-29f9-4168-966e-e7e30f4b8396'),(49,49,'en_gb','text-test',NULL,1,'2017-08-30 13:35:23','2017-08-30 14:09:06','4c73977e-474e-468c-9372-cb6acc576c03'),(50,50,'en_gb','',NULL,1,'2017-08-30 13:35:23','2017-08-30 14:09:06','72422c47-3ff6-4752-b768-2fd8b5e24331'),(51,51,'en_gb','',NULL,1,'2017-08-30 13:35:23','2017-08-30 14:09:06','1597c631-662f-41dc-8191-49b70e21ce09'),(52,52,'en_gb','',NULL,1,'2017-08-30 13:35:23','2017-08-30 14:09:06','18a43cea-a889-47d1-ab60-0387d500cfbe'),(53,53,'en_gb','',NULL,1,'2017-08-30 13:35:23','2017-08-30 14:09:06','b242012b-0d8a-48d2-8d90-37a96c16dd38'),(54,54,'en_gb','',NULL,1,'2017-08-30 13:35:23','2017-08-30 14:09:06','d3e8036c-99f8-45ae-a8f1-12d71d1da822'),(55,55,'en_gb','',NULL,1,'2017-08-30 13:35:23','2017-08-30 14:09:06','47cdb1d1-708e-4ce7-918d-8e76c0063852'),(56,56,'en_gb','',NULL,1,'2017-08-30 13:35:23','2017-08-30 14:09:06','b9cf4e5f-0a30-40f9-b549-2e2923b2014f'),(57,57,'en_gb','',NULL,1,'2017-08-30 13:35:23','2017-08-30 14:09:06','8e8ea33d-4bab-4835-ad21-071351178231'),(58,58,'en_gb','',NULL,1,'2017-08-30 13:35:23','2017-08-30 14:09:06','5b08ab60-e46e-4bd7-9be1-0a987cc2f3c9'),(59,59,'en_gb','',NULL,1,'2017-08-30 13:40:03','2017-08-30 13:40:03','8e117a70-2153-45a7-9579-7696917d9aa7'),(60,60,'en_gb','ba-web-test-stories-channel4-image-14',NULL,1,'2017-08-30 14:21:35','2017-08-30 14:21:35','5154a24a-9bbc-4133-9671-45e8bb98e2ef'),(61,61,'en_gb','visuals-test',NULL,1,'2017-08-30 14:21:43','2017-08-30 14:57:26','36cd9488-8d94-4cf5-80e6-c346a747f321'),(62,62,'en_gb','',NULL,1,'2017-08-30 14:21:43','2017-08-30 14:57:26','d100ef57-ec80-4e09-a5bd-aaa08f94d4c9'),(63,63,'en_gb','ba-web-test-stories-channel4-image-1',NULL,1,'2017-08-30 14:57:11','2017-08-30 14:57:11','6cc24493-092a-4e0a-8281-27f5f5837958'),(64,64,'en_gb','ba-web-test-stories-channel4-image-10',NULL,1,'2017-08-30 14:57:13','2017-08-30 14:57:13','94fed0ee-60c2-4a6d-a40b-bdabfdde63cd'),(65,65,'en_gb','ba-web-test-stories-channel4-image-30',NULL,1,'2017-08-30 14:57:13','2017-08-30 14:57:13','385cad35-c1cb-49eb-be4a-e55b5fb892fd'),(66,66,'en_gb','',NULL,1,'2017-08-30 14:57:26','2017-08-30 14:57:26','ebdc6a63-cb0c-4b1c-9490-7ce2564fcfab');
/*!40000 ALTER TABLE `craft_elements_i18n` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_emailmessages`
--

DROP TABLE IF EXISTS `craft_emailmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_emailmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` char(150) COLLATE utf8_unicode_ci NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `subject` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_emailmessages_key_locale_unq_idx` (`key`,`locale`),
  KEY `craft_emailmessages_locale_fk` (`locale`),
  CONSTRAINT `craft_emailmessages_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_emailmessages`
--

LOCK TABLES `craft_emailmessages` WRITE;
/*!40000 ALTER TABLE `craft_emailmessages` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_emailmessages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_entries`
--

DROP TABLE IF EXISTS `craft_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_entries` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `typeId` int(11) DEFAULT NULL,
  `authorId` int(11) DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_entries_sectionId_idx` (`sectionId`),
  KEY `craft_entries_typeId_idx` (`typeId`),
  KEY `craft_entries_postDate_idx` (`postDate`),
  KEY `craft_entries_expiryDate_idx` (`expiryDate`),
  KEY `craft_entries_authorId_fk` (`authorId`),
  CONSTRAINT `craft_entries_authorId_fk` FOREIGN KEY (`authorId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_entries_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_entries_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_entries_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `craft_entrytypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_entries`
--

LOCK TABLES `craft_entries` WRITE;
/*!40000 ALTER TABLE `craft_entries` DISABLE KEYS */;
INSERT INTO `craft_entries` VALUES (2,1,NULL,NULL,'2017-08-23 20:18:19',NULL,'2017-08-23 20:18:19','2017-08-30 10:22:10','0dfdd9cf-8917-4312-bfcd-d9dd3feefce9'),(5,4,4,1,'2017-08-25 09:03:00',NULL,'2017-08-25 09:03:02','2017-08-30 13:19:24','1f994801-8c34-40b6-bb55-b53c3d6c5446'),(6,4,4,1,'2017-08-25 09:03:00',NULL,'2017-08-25 09:03:17','2017-08-28 13:50:03','ad4a6a20-d85d-4962-aaa1-ce3f4857c186'),(9,4,4,1,'2017-08-28 13:45:00',NULL,'2017-08-28 13:45:29','2017-08-28 13:50:26','4206957d-8ffe-44e9-84ec-88bc2bf0a23f'),(10,4,4,1,'2017-08-28 13:45:00',NULL,'2017-08-28 13:45:56','2017-08-28 13:50:40','9c9abc43-0b70-43a4-8f18-71a27c3facbb'),(11,4,4,1,'2017-08-28 13:46:00',NULL,'2017-08-28 13:46:19','2017-08-28 14:02:26','5f4c84f0-fdd7-4b60-9a63-52e027a45755'),(12,4,4,1,'2017-08-28 13:46:00',NULL,'2017-08-28 13:46:30','2017-08-28 14:02:00','4a762be3-f0b3-428b-8038-747c486fc1e2'),(13,4,4,1,'2017-08-28 13:46:00',NULL,'2017-08-28 13:46:45','2017-08-28 14:02:45','bb981d3e-f05d-4fc9-8cb6-bcda14e72b18'),(14,4,4,1,'2017-08-28 13:46:00',NULL,'2017-08-28 13:46:57','2017-08-28 14:02:54','9336d22a-da20-4024-ba0e-8085915199bf'),(15,4,4,1,'2017-08-28 13:47:00',NULL,'2017-08-28 13:47:07','2017-08-28 14:06:53','50b8e88f-3a82-4016-b8f3-112233858fc5'),(16,4,4,1,'2017-08-28 13:47:00',NULL,'2017-08-28 13:47:22','2017-08-28 14:07:05','a61d97c6-d7a1-486e-ab79-9d015e3e3311'),(17,4,4,1,'2017-08-28 13:47:00',NULL,'2017-08-28 13:47:31','2017-08-28 14:04:08','8e1edbca-c6d2-40a4-be1d-4fb30bc35e49'),(21,4,4,1,'2017-08-28 14:04:38',NULL,'2017-08-28 14:04:38','2017-08-28 14:04:38','1e8fe998-ef74-4474-80fa-835125c60286'),(22,4,4,1,'2017-08-28 14:05:01',NULL,'2017-08-28 14:05:01','2017-08-28 14:05:01','800fb1f2-5544-4835-a866-50e36c892a70'),(23,4,4,1,'2017-08-28 14:05:24',NULL,'2017-08-28 14:05:24','2017-08-28 14:05:24','8f9cd2ad-e952-41a0-b3a7-b62ad552076c'),(24,4,4,1,'2017-08-28 14:05:44',NULL,'2017-08-28 14:05:44','2017-08-28 14:05:44','d959503c-94bc-4ad8-a955-7bc5d3abfb7c'),(25,4,4,1,'2017-08-28 14:06:00',NULL,'2017-08-28 14:06:13','2017-08-28 14:06:13','e05da826-8d2d-4c71-9a6a-0a5e73e07ae8'),(26,4,4,1,'2017-08-28 14:06:34',NULL,'2017-08-28 14:06:34','2017-08-28 14:06:34','b6de29dc-ca3b-4734-95d6-c75f42ba0254'),(27,4,4,1,'2017-08-28 14:08:00',NULL,'2017-08-28 14:08:00','2017-08-28 14:08:00','187b1770-2932-4695-aff6-80e042f5a6a1'),(28,4,4,1,'2017-08-28 14:08:25',NULL,'2017-08-28 14:08:25','2017-08-28 14:08:25','fb141a76-ebe1-4d1d-b224-e4e682069da0'),(29,4,4,1,'2017-08-28 14:08:50',NULL,'2017-08-28 14:08:50','2017-08-28 14:08:50','439c44c1-0fe5-45fd-aaa3-f414deb23ec4'),(37,5,NULL,NULL,'2017-08-28 17:22:36',NULL,'2017-08-28 17:22:36','2017-08-30 13:40:03','3fdde22e-fbe8-4b94-b518-77d5b2effac7'),(42,6,NULL,NULL,'2017-08-29 16:14:37',NULL,'2017-08-29 16:14:37','2017-08-29 16:14:37','a9c7d695-1e28-40e5-abef-efd8f867715f'),(49,4,4,1,'2017-08-30 13:35:00',NULL,'2017-08-30 13:35:23','2017-08-30 14:09:06','beae2f9a-27ec-4d56-b9b1-2ad94d0db83e'),(61,4,4,1,'2017-08-30 14:21:00',NULL,'2017-08-30 14:21:43','2017-08-30 14:57:26','8f115194-bc7c-4d31-8765-f7c0cc8c9978');
/*!40000 ALTER TABLE `craft_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_entrydrafts`
--

DROP TABLE IF EXISTS `craft_entrydrafts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_entrydrafts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entryId` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `creatorId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `notes` tinytext COLLATE utf8_unicode_ci,
  `data` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_entrydrafts_entryId_locale_idx` (`entryId`,`locale`),
  KEY `craft_entrydrafts_sectionId_fk` (`sectionId`),
  KEY `craft_entrydrafts_creatorId_fk` (`creatorId`),
  KEY `craft_entrydrafts_locale_fk` (`locale`),
  CONSTRAINT `craft_entrydrafts_creatorId_fk` FOREIGN KEY (`creatorId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_entrydrafts_entryId_fk` FOREIGN KEY (`entryId`) REFERENCES `craft_entries` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_entrydrafts_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craft_entrydrafts_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_entrydrafts`
--

LOCK TABLES `craft_entrydrafts` WRITE;
/*!40000 ALTER TABLE `craft_entrydrafts` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_entrydrafts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_entrytypes`
--

DROP TABLE IF EXISTS `craft_entrytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_entrytypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hasTitleField` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `titleLabel` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'Title',
  `titleFormat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_entrytypes_name_sectionId_unq_idx` (`name`,`sectionId`),
  UNIQUE KEY `craft_entrytypes_handle_sectionId_unq_idx` (`handle`,`sectionId`),
  KEY `craft_entrytypes_sectionId_fk` (`sectionId`),
  KEY `craft_entrytypes_fieldLayoutId_fk` (`fieldLayoutId`),
  CONSTRAINT `craft_entrytypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_entrytypes_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_entrytypes`
--

LOCK TABLES `craft_entrytypes` WRITE;
/*!40000 ALTER TABLE `craft_entrytypes` DISABLE KEYS */;
INSERT INTO `craft_entrytypes` VALUES (1,1,110,'Homepage','homepage',0,NULL,'Home',1,'2017-08-23 20:18:19','2017-08-30 10:22:25','a9928e31-cbcf-47e1-b24b-0b9357f513b6'),(3,3,6,'Fonts','fonts',1,'Title',NULL,1,'2017-08-23 20:36:48','2017-08-23 20:36:48','624e0888-4354-4418-98ce-fc1ec0f9428f'),(4,4,120,'Projects','projects',1,'Title',NULL,1,'2017-08-23 20:37:04','2017-08-30 13:25:34','3f7efdf8-b8c4-4d31-9e7d-4a4779870303'),(5,5,95,'Menu','menu',0,NULL,'{section.name|raw}',1,'2017-08-28 17:22:36','2017-08-28 17:26:54','230551aa-3e66-4f40-a71f-010bf6e84f1a'),(6,6,100,'Contact','contact',0,NULL,'{section.name|raw}',1,'2017-08-29 16:14:37','2017-08-29 16:14:37','84111933-f61f-490c-86b0-0f79c6c02195');
/*!40000 ALTER TABLE `craft_entrytypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_entryversions`
--

DROP TABLE IF EXISTS `craft_entryversions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_entryversions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entryId` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `num` smallint(6) unsigned NOT NULL,
  `notes` tinytext COLLATE utf8_unicode_ci,
  `data` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_entryversions_entryId_locale_idx` (`entryId`,`locale`),
  KEY `craft_entryversions_sectionId_fk` (`sectionId`),
  KEY `craft_entryversions_creatorId_fk` (`creatorId`),
  KEY `craft_entryversions_locale_fk` (`locale`),
  CONSTRAINT `craft_entryversions_creatorId_fk` FOREIGN KEY (`creatorId`) REFERENCES `craft_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_entryversions_entryId_fk` FOREIGN KEY (`entryId`) REFERENCES `craft_entries` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_entryversions_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craft_entryversions_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_entryversions`
--

LOCK TABLES `craft_entryversions` WRITE;
/*!40000 ALTER TABLE `craft_entryversions` DISABLE KEYS */;
INSERT INTO `craft_entryversions` VALUES (1,2,1,1,'en_gb',1,NULL,'{\"typeId\":\"1\",\"authorId\":null,\"title\":\"Homepage\",\"slug\":\"homepage\",\"postDate\":1503519499,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":[]}','2017-08-23 20:18:19','2017-08-23 20:18:19','5e0670c4-a792-41f8-a9cb-a94909fd7580'),(2,2,1,1,'en_gb',2,NULL,'{\"typeId\":null,\"authorId\":null,\"title\":\"Welcome to Brody-backend-simonsweeney.c9users.io!\",\"slug\":\"homepage\",\"postDate\":1503519499,\"expiryDate\":null,\"enabled\":\"1\",\"parentId\":null,\"fields\":{\"1\":\"<p>It\\u2019s true, this site doesn\\u2019t have a whole lot of content yet, but don\\u2019t worry. Our web developers have just installed the CMS, and they\\u2019re setting things up for the content editors this very moment. Soon Brody-backend-simonsweeney.c9users.io will be an oasis of fresh perspectives, sharp analyses, and astute opinions that will keep you coming back again and again.<\\/p>\"}}','2017-08-23 20:18:19','2017-08-23 20:18:19','b80978fc-b5e2-43b2-8172-8469b9ea6f43'),(3,5,4,1,'en_gb',1,'','{\"typeId\":null,\"authorId\":\"1\",\"title\":\"Channel 4\",\"slug\":\"channel-4\",\"postDate\":1503651782,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"46\":\"#000000\",\"36\":\"\",\"38\":\"\",\"40\":{\"date\":\"\"},\"39\":\"\",\"37\":\"\",\"41\":\"\",\"3\":\"\",\"45\":\"#000000\"}}','2017-08-25 09:03:02','2017-08-25 09:03:02','4381dff3-2f5e-4d20-a20b-cccfe2bf5d5f'),(4,6,4,1,'en_gb',1,'','{\"typeId\":null,\"authorId\":\"1\",\"title\":\"Coca Cola\",\"slug\":\"coca-cola\",\"postDate\":1503651797,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"46\":\"#000000\",\"36\":\"\",\"38\":\"\",\"40\":{\"date\":\"\"},\"39\":\"\",\"37\":\"\",\"41\":\"\",\"3\":\"\",\"45\":\"#000000\"}}','2017-08-25 09:03:17','2017-08-25 09:03:17','c999e6bc-440d-4e59-b6f9-8a2dcdb5f779'),(5,6,4,1,'en_gb',2,'','{\"typeId\":\"4\",\"authorId\":\"1\",\"title\":\"Coca Cola\",\"slug\":\"coca-cola\",\"postDate\":1503651780,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"46\":\"#c2c2c2\",\"36\":\"\",\"38\":\"Coca Cola\",\"40\":{\"date\":\"01\\/08\\/2017\"},\"39\":\"\",\"37\":\"\",\"41\":\"<p>TEST<\\/p>\",\"3\":\"\",\"45\":\"#000000\"}}','2017-08-25 10:57:55','2017-08-25 10:57:55','1b83bdf6-7622-48b6-9c79-480140347067'),(6,6,4,1,'en_gb',3,'','{\"typeId\":\"4\",\"authorId\":\"1\",\"title\":\"Coca Cola\",\"slug\":\"coca-cola\",\"postDate\":1503651780,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"46\":\"#c2c2c2\",\"36\":\"\",\"38\":\"Coca Cola\",\"40\":{\"date\":\"01\\/08\\/2017\"},\"39\":[\"7\"],\"37\":\"\",\"41\":\"<p>TEST<\\/p>\",\"3\":\"\",\"45\":\"#000000\"}}','2017-08-25 11:09:16','2017-08-25 11:09:16','6630d4b6-dfa8-4dc2-aa42-27ef7015968e'),(7,6,4,1,'en_gb',4,'','{\"typeId\":\"4\",\"authorId\":\"1\",\"title\":\"Coca Cola\",\"slug\":\"coca-cola\",\"postDate\":1503651780,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"46\":\"#c2c2c2\",\"36\":\"\",\"38\":\"Coca Cola\",\"40\":{\"date\":\"01\\/08\\/2017\"},\"39\":[\"7\"],\"37\":\"\",\"41\":\"<p>TEST<\\/p>\",\"3\":{\"new1\":{\"type\":\"text\",\"enabled\":\"1\",\"fields\":{\"copy\":\"<p>TEST<\\/p>\",\"size\":\"full\",\"offset\":\"none\",\"alignment\":\"center\",\"font\":\"\"}}},\"45\":\"#000000\"}}','2017-08-25 11:12:07','2017-08-25 11:12:07','2fec0236-ff02-440d-b167-6916a795c3f7'),(8,5,4,1,'en_gb',2,'','{\"typeId\":\"4\",\"authorId\":\"1\",\"title\":\"Channel 4\",\"slug\":\"channel-4\",\"postDate\":1503651780,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"46\":\"#000000\",\"36\":\"\",\"38\":\"\",\"40\":{\"date\":\"\"},\"39\":\"\",\"37\":\"\",\"41\":\"\",\"3\":\"\",\"45\":\"#000000\",\"53\":[\"4\"]}}','2017-08-28 13:27:34','2017-08-28 13:27:34','b8c80f14-2637-46b8-832b-79321f702968'),(9,6,4,1,'en_gb',5,'','{\"typeId\":\"4\",\"authorId\":\"1\",\"title\":\"Coca Cola\",\"slug\":\"coca-cola\",\"postDate\":1503651780,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"46\":\"#c2c2c2\",\"36\":\"\",\"38\":\"Coca Cola\",\"40\":{\"date\":\"01\\/08\\/2017\"},\"39\":[\"7\"],\"37\":\"\",\"41\":\"<p>TEST<\\/p>\",\"3\":{\"8\":{\"type\":\"text\",\"enabled\":\"1\",\"fields\":{\"copy\":\"<p>TEST<\\/p>\",\"size\":\"full\",\"offset\":\"none\",\"alignment\":\"center\",\"font\":\"\"}}},\"45\":\"#000000\",\"53\":[\"4\"]}}','2017-08-28 13:39:39','2017-08-28 13:39:39','20d65da8-398c-40a3-94e7-ee4eb31b2cf2'),(10,9,4,1,'en_gb',1,'','{\"typeId\":null,\"authorId\":\"1\",\"title\":\"Samsung\",\"slug\":\"samsung\",\"postDate\":1503927929,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"46\":\"#000000\",\"36\":\"\",\"38\":\"\",\"40\":{\"date\":\"\"},\"39\":\"\",\"37\":\"\",\"41\":\"\",\"3\":\"\",\"45\":\"#000000\",\"53\":[\"4\"]}}','2017-08-28 13:45:29','2017-08-28 13:45:29','139ce8f4-7428-4dd4-9e94-49b4b2b74ab8'),(11,10,4,1,'en_gb',1,'','{\"typeId\":null,\"authorId\":\"1\",\"title\":\"Paris Baguette\",\"slug\":\"paris-baguette\",\"postDate\":1503927956,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"46\":\"#000000\",\"36\":\"\",\"38\":\"\",\"40\":{\"date\":\"\"},\"39\":\"\",\"37\":\"\",\"41\":\"\",\"3\":\"\",\"45\":\"#000000\",\"53\":[\"4\"]}}','2017-08-28 13:45:56','2017-08-28 13:45:56','7916b605-520d-4190-bf99-f813d7c15c16'),(12,11,4,1,'en_gb',1,'','{\"typeId\":null,\"authorId\":\"1\",\"title\":\"Punk London \\/ Design Museum\",\"slug\":\"punk-london-design-museum\",\"postDate\":1503927979,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"46\":\"#000000\",\"36\":\"\",\"38\":\"\",\"40\":{\"date\":\"\"},\"39\":\"\",\"37\":\"\",\"41\":\"\",\"3\":\"\",\"45\":\"#000000\",\"53\":[\"4\"]}}','2017-08-28 13:46:19','2017-08-28 13:46:19','0f51d273-c743-4a1d-aea8-45a0ec993e96'),(13,12,4,1,'en_gb',1,'','{\"typeId\":null,\"authorId\":\"1\",\"title\":\"Nike \\/ England\",\"slug\":\"nike-england\",\"postDate\":1503927990,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"46\":\"#000000\",\"36\":\"\",\"38\":\"\",\"40\":{\"date\":\"\"},\"39\":\"\",\"37\":\"\",\"41\":\"\",\"3\":\"\",\"45\":\"#000000\",\"53\":\"\"}}','2017-08-28 13:46:30','2017-08-28 13:46:30','7d465a58-1153-42ad-b744-a7ac31a0f739'),(14,13,4,1,'en_gb',1,'','{\"typeId\":null,\"authorId\":\"1\",\"title\":\"C@W\",\"slug\":\"c-w\",\"postDate\":1503928005,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"46\":\"#000000\",\"36\":\"\",\"38\":\"\",\"40\":{\"date\":\"\"},\"39\":\"\",\"37\":\"\",\"41\":\"\",\"3\":\"\",\"45\":\"#000000\",\"53\":[\"4\"]}}','2017-08-28 13:46:45','2017-08-28 13:46:45','584d0976-9f16-4c4f-9c58-7e68868d5e72'),(15,14,4,1,'en_gb',1,'','{\"typeId\":null,\"authorId\":\"1\",\"title\":\"Balfron Tower\",\"slug\":\"balfron-tower\",\"postDate\":1503928017,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"46\":\"#000000\",\"36\":\"\",\"38\":\"\",\"40\":{\"date\":\"\"},\"39\":\"\",\"37\":\"\",\"41\":\"\",\"3\":\"\",\"45\":\"#000000\",\"53\":[\"4\"]}}','2017-08-28 13:46:57','2017-08-28 13:46:57','bda88547-3908-4d3a-a7e3-f56aac84f65d'),(16,15,4,1,'en_gb',1,'','{\"typeId\":null,\"authorId\":\"1\",\"title\":\"Samlip\",\"slug\":\"samlip\",\"postDate\":1503928027,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"46\":\"#000000\",\"36\":\"\",\"38\":\"\",\"40\":{\"date\":\"\"},\"39\":\"\",\"37\":\"\",\"41\":\"\",\"3\":\"\",\"45\":\"#000000\",\"53\":[\"4\"]}}','2017-08-28 13:47:07','2017-08-28 13:47:07','637f9b8a-1e3c-41c2-a2ec-5e8cee3746a0'),(17,16,4,1,'en_gb',1,'','{\"typeId\":null,\"authorId\":\"1\",\"title\":\"RCA 175\",\"slug\":\"rca-175\",\"postDate\":1503928042,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"46\":\"#000000\",\"36\":\"\",\"38\":\"\",\"40\":{\"date\":\"\"},\"39\":\"\",\"37\":\"\",\"41\":\"\",\"3\":\"\",\"45\":\"#000000\",\"53\":[\"4\"]}}','2017-08-28 13:47:22','2017-08-28 13:47:22','3632baa2-295b-4562-bacb-192c0601da6c'),(18,17,4,1,'en_gb',1,'','{\"typeId\":null,\"authorId\":\"1\",\"title\":\"RCA 180\",\"slug\":\"rca-180\",\"postDate\":1503928051,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"46\":\"#000000\",\"36\":\"\",\"38\":\"\",\"40\":{\"date\":\"\"},\"39\":\"\",\"37\":\"\",\"41\":\"\",\"3\":\"\",\"45\":\"#000000\",\"53\":\"\"}}','2017-08-28 13:47:31','2017-08-28 13:47:31','18f756f3-f7ea-4a51-8bc1-abe8f5c20969'),(19,6,4,1,'en_gb',6,'','{\"typeId\":\"4\",\"authorId\":\"1\",\"title\":\"Coca Cola\",\"slug\":\"coca-cola\",\"postDate\":1503651780,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"46\":\"#c2c2c2\",\"36\":\"\",\"38\":\"Coca Cola\",\"40\":{\"date\":\"01\\/08\\/2017\"},\"39\":[\"18\"],\"37\":\"\",\"41\":\"<p>TEST<\\/p>\",\"3\":{\"8\":{\"type\":\"text\",\"enabled\":\"1\",\"fields\":{\"copy\":\"<p>TEST<\\/p>\",\"size\":\"full\",\"offset\":\"none\",\"alignment\":\"center\",\"font\":\"\"}}},\"45\":\"#000000\",\"53\":[\"4\"]}}','2017-08-28 13:50:03','2017-08-28 13:50:03','26d9edcb-b241-4266-9e25-8646d3506c88'),(20,5,4,1,'en_gb',3,'','{\"typeId\":\"4\",\"authorId\":\"1\",\"title\":\"Channel 4\",\"slug\":\"channel-4\",\"postDate\":1503651780,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"46\":\"#000000\",\"36\":\"\",\"38\":\"\",\"40\":{\"date\":\"\"},\"39\":[\"18\"],\"37\":\"\",\"41\":\"\",\"3\":\"\",\"45\":\"#000000\",\"53\":[\"4\"]}}','2017-08-28 13:50:14','2017-08-28 13:50:14','d2d27694-d65a-4b37-9150-c96c77a1adb3'),(21,9,4,1,'en_gb',2,'','{\"typeId\":\"4\",\"authorId\":\"1\",\"title\":\"Samsung\",\"slug\":\"samsung\",\"postDate\":1503927900,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"46\":\"#000000\",\"36\":\"\",\"38\":\"\",\"40\":{\"date\":\"\"},\"39\":[\"18\"],\"37\":\"\",\"41\":\"\",\"3\":\"\",\"45\":\"#000000\",\"53\":[\"4\"]}}','2017-08-28 13:50:26','2017-08-28 13:50:26','4767d7be-9866-432b-b645-5ac989598b01'),(22,10,4,1,'en_gb',2,'','{\"typeId\":\"4\",\"authorId\":\"1\",\"title\":\"Paris Baguette\",\"slug\":\"paris-baguette\",\"postDate\":1503927900,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"46\":\"#000000\",\"36\":\"\",\"38\":\"\",\"40\":{\"date\":\"\"},\"39\":[\"18\"],\"37\":\"\",\"41\":\"\",\"3\":\"\",\"45\":\"#000000\",\"53\":[\"4\"]}}','2017-08-28 13:50:40','2017-08-28 13:50:40','21cdfdec-714a-4cda-8994-9a194f61b365'),(23,17,4,1,'en_gb',2,'','{\"typeId\":\"4\",\"authorId\":\"1\",\"title\":\"RCA 180\",\"slug\":\"rca-180\",\"postDate\":1503928020,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"46\":\"#000000\",\"36\":\"\",\"38\":\"\",\"40\":{\"date\":\"\"},\"39\":\"\",\"37\":\"\",\"41\":\"\",\"3\":\"\",\"45\":\"#000000\",\"53\":[\"4\"]}}','2017-08-28 13:56:00','2017-08-28 13:56:00','8c441535-7dcc-4637-8cf8-a359a1078492'),(24,12,4,1,'en_gb',2,'','{\"typeId\":\"4\",\"authorId\":\"1\",\"title\":\"Nike \\/ England\",\"slug\":\"nike-england\",\"postDate\":1503927960,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"46\":\"#000000\",\"36\":\"\",\"38\":\"\",\"40\":{\"date\":\"\"},\"39\":\"\",\"37\":\"\",\"41\":\"\",\"3\":\"\",\"45\":\"#000000\",\"53\":[\"4\"]}}','2017-08-28 13:56:18','2017-08-28 13:56:18','99bab598-a12b-4192-80c4-c31adcfbe306'),(25,12,4,1,'en_gb',3,'','{\"typeId\":\"4\",\"authorId\":\"1\",\"title\":\"Nike \\/ England\",\"slug\":\"nike-england\",\"postDate\":1503927960,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"46\":\"#000000\",\"36\":\"\",\"38\":\"\",\"40\":{\"date\":\"\"},\"39\":[\"18\"],\"37\":\"\",\"41\":\"\",\"3\":\"\",\"45\":\"#000000\",\"53\":[\"4\"]}}','2017-08-28 14:02:00','2017-08-28 14:02:00','641d0fda-7706-4888-a078-56ee5e638bcf'),(26,11,4,1,'en_gb',2,'','{\"typeId\":\"4\",\"authorId\":\"1\",\"title\":\"Punk London \\/ Design Museum\",\"slug\":\"punk-london-design-museum\",\"postDate\":1503927960,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"46\":\"#000000\",\"36\":\"\",\"38\":\"\",\"40\":{\"date\":\"\"},\"39\":[\"18\"],\"37\":\"\",\"41\":\"\",\"3\":\"\",\"45\":\"#000000\",\"53\":[\"4\"]}}','2017-08-28 14:02:26','2017-08-28 14:02:26','b2b32def-05a1-4ef6-ab26-a91c722121b9'),(27,13,4,1,'en_gb',2,'','{\"typeId\":\"4\",\"authorId\":\"1\",\"title\":\"C@W\",\"slug\":\"c-w\",\"postDate\":1503927960,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"46\":\"#000000\",\"36\":\"\",\"38\":\"\",\"40\":{\"date\":\"\"},\"39\":[\"7\"],\"37\":\"\",\"41\":\"\",\"3\":\"\",\"45\":\"#000000\",\"53\":[\"4\"]}}','2017-08-28 14:02:45','2017-08-28 14:02:45','99e6c45f-fb08-4013-84bb-7ff5651f90e5'),(28,14,4,1,'en_gb',2,'','{\"typeId\":\"4\",\"authorId\":\"1\",\"title\":\"Balfron Tower\",\"slug\":\"balfron-tower\",\"postDate\":1503927960,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"46\":\"#000000\",\"36\":\"\",\"38\":\"\",\"40\":{\"date\":\"\"},\"39\":[\"7\"],\"37\":\"\",\"41\":\"\",\"3\":\"\",\"45\":\"#000000\",\"53\":[\"4\"]}}','2017-08-28 14:02:54','2017-08-28 14:02:54','66dc1753-596a-4f71-ae44-81b605dbf2db'),(29,17,4,1,'en_gb',3,'','{\"typeId\":\"4\",\"authorId\":\"1\",\"title\":\"RCA 180\",\"slug\":\"rca-180\",\"postDate\":1503928020,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"46\":\"#000000\",\"36\":\"\",\"38\":\"\",\"40\":{\"date\":\"\"},\"39\":[\"7\"],\"37\":\"\",\"41\":\"\",\"3\":\"\",\"45\":\"#000000\",\"53\":[\"4\"]}}','2017-08-28 14:04:08','2017-08-28 14:04:08','7fae4aec-cef2-4463-9530-67ab6c7c6bf2'),(30,21,4,1,'en_gb',1,'','{\"typeId\":null,\"authorId\":\"1\",\"title\":\"Christian Dior\",\"slug\":\"christian-dior\",\"postDate\":1503929078,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"46\":\"#000000\",\"36\":\"\",\"38\":\"\",\"40\":{\"date\":\"\"},\"39\":[\"7\"],\"37\":\"\",\"41\":\"\",\"3\":\"\",\"45\":\"#000000\",\"53\":[\"4\"]}}','2017-08-28 14:04:38','2017-08-28 14:04:38','c6fadeb7-aebc-4d8c-adbd-7f2d8749c7a5'),(31,22,4,1,'en_gb',1,'','{\"typeId\":null,\"authorId\":\"1\",\"title\":\"UFA\",\"slug\":\"ufa\",\"postDate\":1503929101,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"46\":\"#000000\",\"36\":\"\",\"38\":\"\",\"40\":{\"date\":\"\"},\"39\":[\"19\"],\"37\":\"\",\"41\":\"\",\"3\":\"\",\"45\":\"#000000\",\"53\":[\"4\"]}}','2017-08-28 14:05:01','2017-08-28 14:05:01','e3bfc421-d463-4403-a594-4ceb0b0066b6'),(32,23,4,1,'en_gb',1,'','{\"typeId\":null,\"authorId\":\"1\",\"title\":\"BBC Website\",\"slug\":\"bbc-website\",\"postDate\":1503929124,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"46\":\"#000000\",\"36\":\"\",\"38\":\"\",\"40\":{\"date\":\"\"},\"39\":[\"19\"],\"37\":\"\",\"41\":\"\",\"3\":\"\",\"45\":\"#000000\",\"53\":[\"4\"]}}','2017-08-28 14:05:24','2017-08-28 14:05:24','03ccb530-4e1a-4088-85b8-4ba29adb41cb'),(33,24,4,1,'en_gb',1,'','{\"typeId\":null,\"authorId\":\"1\",\"title\":\"RCA Website\",\"slug\":\"rca-website\",\"postDate\":1503929144,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"46\":\"#000000\",\"36\":\"\",\"38\":\"\",\"40\":{\"date\":\"\"},\"39\":[\"19\"],\"37\":\"\",\"41\":\"\",\"3\":\"\",\"45\":\"#000000\",\"53\":[\"4\"]}}','2017-08-28 14:05:44','2017-08-28 14:05:44','c1978def-2d3d-42f4-ade1-61abe1dd6296'),(34,25,4,1,'en_gb',1,'','{\"typeId\":null,\"authorId\":\"1\",\"title\":\"Vandals\",\"slug\":\"vandals\",\"postDate\":1503929160,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"46\":\"#000000\",\"36\":\"\",\"38\":\"\",\"40\":{\"date\":\"\"},\"39\":[\"20\"],\"37\":\"\",\"41\":\"\",\"3\":\"\",\"45\":\"#000000\",\"53\":[\"4\"]}}','2017-08-28 14:06:13','2017-08-28 14:06:13','18dbc7a5-82d6-4b48-a07b-f035f2a7d4e4'),(35,26,4,1,'en_gb',1,'','{\"typeId\":null,\"authorId\":\"1\",\"title\":\"Supreme\",\"slug\":\"supreme\",\"postDate\":1503929194,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"46\":\"#000000\",\"36\":\"\",\"38\":\"\",\"40\":{\"date\":\"\"},\"39\":[\"20\"],\"37\":\"\",\"41\":\"\",\"3\":\"\",\"45\":\"#000000\",\"53\":[\"4\"]}}','2017-08-28 14:06:34','2017-08-28 14:06:34','416475cf-083f-4083-8013-f531c341ec43'),(36,15,4,1,'en_gb',2,'','{\"typeId\":\"4\",\"authorId\":\"1\",\"title\":\"Samlip\",\"slug\":\"samlip\",\"postDate\":1503928020,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"46\":\"#000000\",\"36\":\"\",\"38\":\"\",\"40\":{\"date\":\"\"},\"39\":[\"7\"],\"37\":\"\",\"41\":\"\",\"3\":\"\",\"45\":\"#000000\",\"53\":[\"4\"]}}','2017-08-28 14:06:53','2017-08-28 14:06:53','5e3e9abf-9091-423a-9d7b-63b588eca501'),(37,16,4,1,'en_gb',2,'','{\"typeId\":\"4\",\"authorId\":\"1\",\"title\":\"RCA 175\",\"slug\":\"rca-175\",\"postDate\":1503928020,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"46\":\"#000000\",\"36\":\"\",\"38\":\"\",\"40\":{\"date\":\"\"},\"39\":[\"7\"],\"37\":\"\",\"41\":\"\",\"3\":\"\",\"45\":\"#000000\",\"53\":[\"4\"]}}','2017-08-28 14:07:05','2017-08-28 14:07:05','8dc2089a-0912-4b7a-90b9-6bf022bad793'),(38,27,4,1,'en_gb',1,'','{\"typeId\":null,\"authorId\":\"1\",\"title\":\"Ginza Magazine\",\"slug\":\"ginza-magazine\",\"postDate\":1503929280,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"46\":\"#000000\",\"36\":\"\",\"38\":\"\",\"40\":{\"date\":\"\"},\"39\":[\"20\"],\"37\":\"\",\"41\":\"\",\"3\":\"\",\"45\":\"#000000\",\"53\":[\"4\"]}}','2017-08-28 14:08:00','2017-08-28 14:08:00','5ba7adbe-bc40-418d-b678-8dc93256bdca'),(39,28,4,1,'en_gb',1,'','{\"typeId\":null,\"authorId\":\"1\",\"title\":\"Uniqlo\",\"slug\":\"uniqlo\",\"postDate\":1503929305,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"46\":\"#000000\",\"36\":\"\",\"38\":\"\",\"40\":{\"date\":\"\"},\"39\":[\"20\"],\"37\":\"\",\"41\":\"\",\"3\":\"\",\"45\":\"#000000\",\"53\":[\"4\"]}}','2017-08-28 14:08:25','2017-08-28 14:08:25','e028b2ad-3c02-4133-9785-f1a4a469ef8e'),(40,29,4,1,'en_gb',1,'','{\"typeId\":null,\"authorId\":\"1\",\"title\":\"Tate \\/ BMW Tate Live Book\",\"slug\":\"tate-bmw-tate-live-book\",\"postDate\":1503929330,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"46\":\"#000000\",\"36\":\"\",\"38\":\"\",\"40\":{\"date\":\"\"},\"39\":[\"20\"],\"37\":\"\",\"41\":\"\",\"3\":\"\",\"45\":\"#000000\",\"53\":[\"4\"]}}','2017-08-28 14:08:50','2017-08-28 14:08:50','a1cdcc6c-78f7-4555-99fc-1548e150cf77'),(41,5,4,1,'en_gb',4,'','{\"typeId\":\"4\",\"authorId\":\"1\",\"title\":\"Channel 4\",\"slug\":\"channel-4\",\"postDate\":1503651780,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"46\":\"#000000\",\"36\":\"\",\"38\":\"Channel 4\",\"40\":{\"date\":\"01\\/01\\/2016\"},\"39\":[\"18\"],\"37\":\"\",\"41\":\"<p>TEST<\\/p>\",\"3\":\"\",\"45\":\"#000000\",\"53\":[\"4\"]}}','2017-08-28 14:47:09','2017-08-28 14:47:09','e521e9c5-03d7-4520-add0-e41c096119d2'),(42,5,4,1,'en_gb',5,'','{\"typeId\":\"4\",\"authorId\":\"1\",\"title\":\"Channel 4\",\"slug\":\"channel-4\",\"postDate\":1503651780,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"46\":\"#000000\",\"36\":\"\",\"38\":\"Channel 4\",\"40\":{\"date\":\"01\\/01\\/2016\"},\"39\":[\"18\"],\"37\":\"\",\"41\":\"<p>TEST<\\/p>\",\"3\":{\"new1\":{\"type\":\"text\",\"enabled\":\"1\",\"fields\":{\"copy\":\"<p>TEST<\\/p>\",\"size\":\"full\",\"offset\":\"none\",\"alignment\":\"center\",\"font\":\"\"}}},\"45\":\"#000000\",\"53\":[\"4\"]}}','2017-08-28 14:50:40','2017-08-28 14:50:40','0a389263-8f92-4c0f-8f98-3acb494a05c3'),(43,5,4,1,'en_gb',6,'','{\"typeId\":\"4\",\"authorId\":\"1\",\"title\":\"Channel 4\",\"slug\":\"channel-4\",\"postDate\":1503651780,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"46\":\"#000000\",\"36\":\"\",\"38\":\"Channel 4\",\"40\":{\"date\":\"01\\/01\\/2016\"},\"39\":[\"18\"],\"37\":\"\",\"41\":\"<p>TEST<\\/p>\",\"3\":{\"30\":{\"type\":\"text\",\"enabled\":\"1\",\"fields\":{\"copy\":\"<p>TEST<\\/p>\",\"size\":\"full\",\"offset\":\"none\",\"alignment\":\"center\",\"font\":\"\"}},\"new1\":{\"type\":\"oneImage\",\"enabled\":\"1\",\"fields\":{\"file\":[\"4\"],\"size\":\"small\",\"position\":\"left\"}}},\"45\":\"#000000\",\"53\":[\"4\"]}}','2017-08-28 14:52:52','2017-08-28 14:52:52','b8cfc7b0-7b33-4314-a099-b5bb471826e0'),(44,5,4,1,'en_gb',7,'','{\"typeId\":\"4\",\"authorId\":\"1\",\"title\":\"Channel 4\",\"slug\":\"channel-4\",\"postDate\":1503651780,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"46\":\"#000000\",\"36\":\"\",\"38\":\"Channel 4\",\"40\":{\"date\":\"01\\/01\\/2016\"},\"39\":[\"18\"],\"37\":\"\",\"41\":\"<p>TEST<\\/p>\",\"3\":{\"30\":{\"type\":\"text\",\"enabled\":\"1\",\"fields\":{\"copy\":\"<p>TEST<\\/p>\",\"size\":\"full\",\"offset\":\"none\",\"alignment\":\"center\",\"font\":\"\"}},\"31\":{\"type\":\"oneImage\",\"enabled\":\"1\",\"fields\":{\"file\":[\"4\"],\"size\":\"small\",\"position\":\"left\"}},\"new1\":{\"type\":\"twoImages\",\"enabled\":\"1\",\"fields\":{\"file\":[\"4\"],\"size\":\"small\",\"position\":\"left\",\"gutter\":\"\"}}},\"45\":\"#000000\",\"53\":[\"4\"]}}','2017-08-28 15:06:26','2017-08-28 15:06:26','6ba53cd6-7691-47b3-a314-81282f941873'),(45,5,4,1,'en_gb',8,'','{\"typeId\":\"4\",\"authorId\":\"1\",\"title\":\"Channel 4\",\"slug\":\"channel-4\",\"postDate\":1503651780,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"46\":\"#000000\",\"36\":\"\",\"38\":\"Channel 4\",\"40\":{\"date\":\"01\\/01\\/2016\"},\"39\":[\"18\"],\"37\":\"\",\"41\":\"<p>TEST<\\/p>\",\"3\":{\"30\":{\"type\":\"text\",\"enabled\":\"1\",\"fields\":{\"copy\":\"<p>TEST<\\/p>\",\"size\":\"full\",\"offset\":\"none\",\"alignment\":\"center\",\"font\":\"\"}},\"31\":{\"type\":\"oneImage\",\"enabled\":\"1\",\"fields\":{\"file\":[\"4\"],\"size\":\"small\",\"position\":\"left\"}},\"32\":{\"type\":\"twoImages\",\"enabled\":\"1\",\"fields\":{\"file\":[\"4\"],\"size\":\"small\",\"position\":\"left\",\"gutter\":\"1\"}}},\"45\":\"#000000\",\"53\":[\"4\"]}}','2017-08-28 15:37:58','2017-08-28 15:37:58','2484af3c-6c23-4a65-9570-67d3adefe849'),(46,5,4,1,'en_gb',9,'','{\"typeId\":\"4\",\"authorId\":\"1\",\"title\":\"Channel 4\",\"slug\":\"channel-4\",\"postDate\":1503651780,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"46\":\"#000000\",\"36\":\"\",\"38\":\"Channel 4\",\"40\":{\"date\":\"01\\/01\\/2016\"},\"39\":[\"18\"],\"37\":\"\",\"41\":\"<p>TEST<\\/p>\",\"3\":{\"30\":{\"type\":\"text\",\"enabled\":\"1\",\"fields\":{\"copy\":\"<p>TEST<\\/p>\",\"size\":\"full\",\"offset\":\"none\",\"alignment\":\"center\",\"font\":\"\"}},\"31\":{\"type\":\"oneImage\",\"enabled\":\"1\",\"fields\":{\"file\":[\"4\"],\"size\":\"small\",\"position\":\"left\"}},\"32\":{\"type\":\"twoImages\",\"enabled\":\"1\",\"fields\":{\"file\":[\"4\",\"33\"],\"size\":\"small\",\"position\":\"left\",\"gutter\":\"1\"}}},\"45\":\"#000000\",\"53\":[\"4\"]}}','2017-08-28 15:49:14','2017-08-28 15:49:14','9f1d5866-901f-4ad6-8664-f3d3c6ef4f0a'),(47,5,4,1,'en_gb',10,'','{\"typeId\":\"4\",\"authorId\":\"1\",\"title\":\"Channel 4\",\"slug\":\"channel-4\",\"postDate\":1503651780,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"46\":\"#000000\",\"36\":\"\",\"38\":\"Channel 4\",\"40\":{\"date\":\"01\\/01\\/2016\"},\"39\":[\"18\"],\"37\":\"\",\"41\":\"<p>TEST<\\/p>\",\"3\":{\"30\":{\"type\":\"text\",\"enabled\":\"1\",\"fields\":{\"copy\":\"<p>TEST<\\/p>\",\"size\":\"full\",\"offset\":\"none\",\"alignment\":\"center\",\"font\":\"\"}},\"31\":{\"type\":\"oneImage\",\"enabled\":\"1\",\"fields\":{\"file\":[\"4\"],\"size\":\"small\",\"position\":\"left\"}},\"32\":{\"type\":\"twoImages\",\"enabled\":\"1\",\"fields\":{\"file\":[\"4\",\"33\"],\"size\":\"small\",\"position\":\"left\",\"gutter\":\"1\"}},\"new1\":{\"type\":\"threeImages\",\"enabled\":\"1\",\"fields\":{\"file\":[\"33\",\"4\",\"34\"],\"size\":\"large\",\"position\":\"Right\",\"gutter\":\"\"}}},\"45\":\"#000000\",\"53\":[\"4\"]}}','2017-08-28 16:31:10','2017-08-28 16:31:10','96de6481-33d3-4b9f-996c-b98d19c0d2f8'),(48,5,4,1,'en_gb',11,'','{\"typeId\":\"4\",\"authorId\":\"1\",\"title\":\"Channel 4\",\"slug\":\"channel-4\",\"postDate\":1503651780,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"46\":\"#000000\",\"36\":\"\",\"38\":\"Channel 4\",\"40\":{\"date\":\"01\\/01\\/2016\"},\"39\":[\"18\"],\"37\":\"\",\"41\":\"<p>TEST<\\/p>\",\"3\":{\"30\":{\"type\":\"text\",\"enabled\":\"1\",\"fields\":{\"copy\":\"<p>TEST<\\/p>\",\"size\":\"full\",\"offset\":\"none\",\"alignment\":\"center\",\"font\":\"\"}},\"31\":{\"type\":\"oneImage\",\"enabled\":\"1\",\"fields\":{\"file\":[\"4\"],\"size\":\"small\",\"position\":\"left\"}},\"32\":{\"type\":\"twoImages\",\"enabled\":\"1\",\"fields\":{\"file\":[\"4\",\"33\"],\"size\":\"small\",\"position\":\"left\",\"gutter\":\"1\"}},\"35\":{\"type\":\"threeImages\",\"enabled\":\"1\",\"fields\":{\"file\":[\"33\",\"4\",\"34\"],\"size\":\"large\",\"position\":\"Right\",\"gutter\":\"\"}},\"new1\":{\"type\":\"imageFrame\",\"enabled\":\"1\",\"fields\":{\"file\":[\"33\",\"4\",\"34\"],\"size\":\"reduced\",\"gutter\":\"1\",\"direction\":\"horizontal\"}}},\"45\":\"#000000\",\"53\":[\"4\"]}}','2017-08-28 16:37:47','2017-08-28 16:37:47','9af9ded5-46cc-49d5-b2c9-91b16792c88f'),(49,37,5,1,'en_gb',1,NULL,'{\"typeId\":\"5\",\"authorId\":null,\"title\":\"Menu\",\"slug\":\"menu\",\"postDate\":1503940956,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":[]}','2017-08-28 17:22:36','2017-08-28 17:22:36','61014b66-ee9f-43fb-a48f-e0a77440ccc4'),(50,37,5,1,'en_gb',2,'','{\"typeId\":null,\"authorId\":null,\"title\":\"Menu\",\"slug\":\"menu\",\"postDate\":1503940956,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"54\":{\"new1\":{\"type\":\"discipline\",\"enabled\":\"1\",\"fields\":{\"discipline\":[\"18\"],\"entries\":\"\"}}}}}','2017-08-29 14:04:11','2017-08-29 14:04:11','53485bdf-00c7-4b01-bb0a-2f49907a4729'),(51,37,5,1,'en_gb',3,'','{\"typeId\":null,\"authorId\":null,\"title\":\"Menu\",\"slug\":\"menu\",\"postDate\":1503940956,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"54\":{\"38\":{\"type\":\"discipline\",\"enabled\":\"1\",\"fields\":{\"discipline\":[\"18\"],\"entries\":[\"11\",\"12\",\"9\",\"10\",\"5\",\"6\"]}}}}}','2017-08-29 14:04:56','2017-08-29 14:04:56','da3a49f8-7c88-4c91-8a5f-ddcc3773f58d'),(52,37,5,1,'en_gb',4,'','{\"typeId\":null,\"authorId\":null,\"title\":\"Menu\",\"slug\":\"menu\",\"postDate\":1503940956,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"54\":{\"38\":{\"type\":\"disciplineItem\",\"enabled\":\"1\",\"fields\":{\"discipline\":[\"18\"],\"entries\":[\"9\",\"6\",\"5\",\"10\",\"11\",\"12\"]}},\"new2\":{\"type\":\"disciplineItem\",\"enabled\":\"1\",\"fields\":{\"discipline\":[\"7\"],\"entries\":[\"13\",\"14\",\"15\",\"16\",\"17\",\"21\"]}},\"new3\":{\"type\":\"disciplineItem\",\"enabled\":\"1\",\"fields\":{\"discipline\":[\"19\"],\"entries\":[\"22\",\"23\",\"24\"]}},\"new4\":{\"type\":\"disciplineItem\",\"enabled\":\"1\",\"fields\":{\"discipline\":[\"20\"],\"entries\":[\"25\",\"26\",\"27\",\"28\",\"29\"]}}}}}','2017-08-29 14:31:02','2017-08-29 14:31:02','75af1d26-a65a-488b-adbb-1689011fdcd8'),(53,42,6,1,'en_gb',1,NULL,'{\"typeId\":\"6\",\"authorId\":null,\"title\":\"Contact\",\"slug\":\"contact\",\"postDate\":1504023277,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":[]}','2017-08-29 16:14:37','2017-08-29 16:14:37','1c0fab89-6089-40f5-8517-6acc7297f122'),(54,37,5,1,'en_gb',5,'','{\"typeId\":null,\"authorId\":null,\"title\":\"Menu\",\"slug\":\"menu\",\"postDate\":1503940956,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"54\":{\"38\":{\"type\":\"disciplineItem\",\"enabled\":\"1\",\"fields\":{\"discipline\":[\"18\"],\"entries\":[\"9\",\"6\",\"5\",\"10\",\"11\",\"12\"]}},\"39\":{\"type\":\"disciplineItem\",\"enabled\":\"1\",\"fields\":{\"discipline\":[\"7\"],\"entries\":[\"13\",\"14\",\"15\",\"16\",\"17\",\"21\"]}},\"40\":{\"type\":\"disciplineItem\",\"enabled\":\"1\",\"fields\":{\"discipline\":[\"19\"],\"entries\":[\"22\",\"23\",\"24\"]}},\"41\":{\"type\":\"disciplineItem\",\"enabled\":\"1\",\"fields\":{\"discipline\":[\"20\"],\"entries\":[\"25\",\"26\",\"27\",\"28\",\"29\"]}},\"new1\":{\"type\":\"pageItem\",\"enabled\":\"1\",\"fields\":{\"itemName\":\"\",\"entry\":[\"42\"]}}}}}','2017-08-29 16:15:13','2017-08-29 16:15:13','e71055ec-9dae-4615-a16e-ec4accbd293f'),(55,2,1,1,'en_gb',3,'','{\"typeId\":null,\"authorId\":null,\"title\":\"Home\",\"slug\":\"homepage\",\"postDate\":1503519499,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"\",\"1\":\"<p>It\\u2019s true, this site doesn\\u2019t have a whole lot of content yet, but don\\u2019t worry. Our web developers have just installed the CMS, and they\\u2019re setting things up for the content editors this very moment. Soon Brody-backend-simonsweeney.c9users.io will be an oasis of fresh perspectives, sharp analyses, and astute opinions that will keep you coming back again and again.<\\/p>\",\"51\":\"\",\"50\":\"\",\"49\":\"\"}}','2017-08-30 10:22:08','2017-08-30 10:22:08','5ce183c3-b0f3-4dc4-a280-53964e818042'),(56,2,1,1,'en_gb',4,'','{\"typeId\":null,\"authorId\":null,\"title\":\"Home\",\"slug\":\"homepage\",\"postDate\":1503519499,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"52\":\"\",\"1\":\"<p>It\\u2019s true, this site doesn\\u2019t have a whole lot of content yet, but don\\u2019t worry. Our web developers have just installed the CMS, and they\\u2019re setting things up for the content editors this very moment. Soon Brody-backend-simonsweeney.c9users.io will be an oasis of fresh perspectives, sharp analyses, and astute opinions that will keep you coming back again and again.<\\/p>\",\"51\":\"\",\"50\":\"\",\"49\":\"\"}}','2017-08-30 10:22:10','2017-08-30 10:22:10','d3bb4dce-8aa2-4d56-81d1-8e1e5963fc34'),(57,37,5,1,'en_gb',6,'','{\"typeId\":null,\"authorId\":null,\"title\":\"Menu\",\"slug\":\"menu\",\"postDate\":1503940956,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"54\":{\"38\":{\"type\":\"discipline\",\"enabled\":\"1\",\"fields\":{\"discipline\":[\"18\"]}},\"39\":{\"type\":\"discipline\",\"enabled\":\"1\",\"fields\":{\"discipline\":[\"7\"]}},\"40\":{\"type\":\"discipline\",\"enabled\":\"1\",\"fields\":{\"discipline\":[\"19\"]}},\"41\":{\"type\":\"discipline\",\"enabled\":\"1\",\"fields\":{\"discipline\":[\"20\"]}},\"43\":{\"type\":\"single\",\"enabled\":\"1\",\"fields\":{\"entry\":[\"42\"]}}}}}','2017-08-30 10:25:12','2017-08-30 10:25:12','94152cea-6e3e-4214-b92e-99d39ae6df53'),(58,5,4,1,'en_gb',12,'','{\"typeId\":\"4\",\"authorId\":\"1\",\"title\":\"Channel 4\",\"slug\":\"channel-4\",\"postDate\":1503651780,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"46\":\"#000000\",\"36\":\"\",\"38\":\"Channel 4\",\"40\":{\"date\":\"01\\/01\\/2016\"},\"39\":[\"18\"],\"37\":\"\",\"41\":\"<p>TEST<\\/p>\",\"3\":{\"30\":{\"type\":\"text\",\"enabled\":\"1\",\"fields\":{\"copy\":\"<p>TEST<\\/p>\",\"size\":\"full\",\"offset\":\"none\",\"alignment\":\"center\",\"font\":\"\"}},\"31\":{\"type\":\"oneImage\",\"enabled\":\"1\",\"fields\":{\"file\":[\"4\"],\"size\":\"small\",\"position\":\"left\"}},\"32\":{\"type\":\"twoImages\",\"enabled\":\"1\",\"fields\":{\"file\":[\"4\",\"33\"],\"size\":\"small\",\"position\":\"left\",\"gutter\":\"1\"}},\"35\":{\"type\":\"threeImages\",\"enabled\":\"1\",\"fields\":{\"file\":[\"33\",\"4\",\"34\"],\"size\":\"large\",\"position\":\"Right\",\"gutter\":\"\"}},\"36\":{\"type\":\"imageFrame\",\"enabled\":\"1\",\"fields\":{\"file\":[\"33\",\"4\",\"34\"],\"size\":\"reduced\",\"gutter\":\"1\",\"direction\":\"horizontal\"}}},\"45\":\"#000000\",\"53\":[\"46\"]}}','2017-08-30 13:12:47','2017-08-30 13:12:47','92d73ed3-c734-4ccd-bf8b-f4d97a755b9c'),(59,5,4,1,'en_gb',13,'','{\"typeId\":\"4\",\"authorId\":\"1\",\"title\":\"Channel 4\",\"slug\":\"channel-4\",\"postDate\":1503651780,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"46\":\"#000000\",\"36\":\"\",\"38\":\"Channel 4\",\"40\":{\"date\":\"01\\/01\\/2016\"},\"39\":[\"18\"],\"37\":\"\",\"41\":\"<p>TEST<\\/p>\",\"3\":{\"30\":{\"type\":\"text\",\"enabled\":\"1\",\"fields\":{\"copy\":\"<p>TEST<\\/p>\",\"size\":\"full\",\"offset\":\"none\",\"alignment\":\"center\",\"font\":\"\"}},\"31\":{\"type\":\"oneImage\",\"enabled\":\"1\",\"fields\":{\"file\":[\"4\"],\"size\":\"small\",\"position\":\"left\"}},\"32\":{\"type\":\"twoImages\",\"enabled\":\"1\",\"fields\":{\"file\":[\"4\",\"33\"],\"size\":\"small\",\"position\":\"left\",\"gutter\":\"1\"}},\"35\":{\"type\":\"threeImages\",\"enabled\":\"1\",\"fields\":{\"file\":[\"33\",\"4\",\"34\"],\"size\":\"large\",\"position\":\"Right\",\"gutter\":\"\"}},\"36\":{\"type\":\"imageFrame\",\"enabled\":\"1\",\"fields\":{\"file\":[\"33\",\"4\",\"34\"],\"size\":\"reduced\",\"gutter\":\"1\",\"direction\":\"horizontal\"}}},\"45\":\"#000000\",\"53\":[\"46\"]}}','2017-08-30 13:14:19','2017-08-30 13:14:19','d818dd5d-8d81-479b-89b6-eb5c9d0d807e'),(60,5,4,1,'en_gb',14,'','{\"typeId\":\"4\",\"authorId\":\"1\",\"title\":\"Channel 4\",\"slug\":\"channel-4\",\"postDate\":1503651780,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"46\":\"#000000\",\"36\":\"\",\"38\":\"Channel 4\",\"40\":{\"date\":\"01\\/01\\/2016\"},\"39\":[\"18\"],\"37\":\"\",\"41\":\"<p>TEST<\\/p>\",\"3\":{\"30\":{\"type\":\"text\",\"enabled\":\"1\",\"fields\":{\"copy\":\"<p>TEST<\\/p>\",\"size\":\"full\",\"offset\":\"none\",\"alignment\":\"center\",\"font\":\"\"}},\"31\":{\"type\":\"oneImage\",\"enabled\":\"1\",\"fields\":{\"file\":[\"4\"],\"size\":\"small\",\"position\":\"left\"}},\"32\":{\"type\":\"twoImages\",\"enabled\":\"1\",\"fields\":{\"file\":[\"4\",\"33\"],\"size\":\"small\",\"position\":\"left\",\"gutter\":\"1\"}},\"35\":{\"type\":\"threeImages\",\"enabled\":\"1\",\"fields\":{\"file\":[\"33\",\"4\",\"34\"],\"size\":\"large\",\"position\":\"Right\",\"gutter\":\"\"}},\"36\":{\"type\":\"imageFrame\",\"enabled\":\"1\",\"fields\":{\"file\":[\"33\",\"4\",\"34\"],\"size\":\"reduced\",\"gutter\":\"1\",\"direction\":\"horizontal\"}}},\"45\":\"#000000\",\"53\":[\"46\"]}}','2017-08-30 13:15:21','2017-08-30 13:15:21','ddc7d548-8b99-45c1-9191-d12e18f64c8b'),(61,5,4,1,'en_gb',15,'','{\"typeId\":\"4\",\"authorId\":\"1\",\"title\":\"Channel 4\",\"slug\":\"channel-4\",\"postDate\":1503651780,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"46\":\"#000000\",\"36\":\"\",\"38\":\"Channel 4\",\"40\":{\"date\":\"01\\/01\\/2016\"},\"39\":[\"18\"],\"37\":\"\",\"41\":\"<p>TEST<\\/p>\",\"3\":{\"30\":{\"type\":\"text\",\"enabled\":\"1\",\"fields\":{\"copy\":\"<p>TEST<\\/p>\",\"size\":\"full\",\"offset\":\"none\",\"alignment\":\"center\",\"font\":\"\"}},\"31\":{\"type\":\"oneImage\",\"enabled\":\"1\",\"fields\":{\"file\":[\"4\"],\"size\":\"small\",\"position\":\"left\"}},\"32\":{\"type\":\"twoImages\",\"enabled\":\"1\",\"fields\":{\"file\":[\"4\",\"33\"],\"size\":\"small\",\"position\":\"left\",\"gutter\":\"1\"}},\"35\":{\"type\":\"threeImages\",\"enabled\":\"1\",\"fields\":{\"file\":[\"33\",\"4\",\"34\"],\"size\":\"large\",\"position\":\"Right\",\"gutter\":\"\"}},\"36\":{\"type\":\"imageFrame\",\"enabled\":\"1\",\"fields\":{\"file\":[\"33\",\"4\",\"34\"],\"size\":\"reduced\",\"gutter\":\"1\",\"direction\":\"horizontal\"}}},\"45\":\"#000000\",\"53\":[\"46\"]}}','2017-08-30 13:19:24','2017-08-30 13:19:24','a31e30f7-1855-4bc7-af50-6d19af51f9e6'),(62,49,4,1,'en_gb',1,'','{\"typeId\":null,\"authorId\":\"1\",\"title\":\"Text Test\",\"slug\":\"text-test\",\"postDate\":1504100123,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"46\":\"#000000\",\"38\":\"Brody Associates\",\"39\":[\"47\"],\"37\":\"\",\"41\":\"\",\"3\":{\"new1\":{\"type\":\"text\",\"enabled\":\"1\",\"fields\":{\"copy\":\"<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p>\",\"width\":\"large\",\"position\":\"left\",\"font\":\"\"}},\"new2\":{\"type\":\"text\",\"enabled\":\"1\",\"fields\":{\"copy\":\"<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p>\",\"width\":\"large\",\"position\":\"center\",\"font\":\"\"}},\"new3\":{\"type\":\"text\",\"enabled\":\"1\",\"fields\":{\"copy\":\"<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p>\",\"width\":\"large\",\"position\":\"right\",\"font\":\"\"}},\"new4\":{\"type\":\"text\",\"enabled\":\"1\",\"fields\":{\"copy\":\"<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p>\",\"width\":\"medium\",\"position\":\"left\",\"font\":\"\"}},\"new5\":{\"type\":\"text\",\"enabled\":\"1\",\"fields\":{\"copy\":\"<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p>\",\"width\":\"medium\",\"position\":\"center\",\"font\":\"\"}},\"new6\":{\"type\":\"text\",\"enabled\":\"1\",\"fields\":{\"copy\":\"<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p>\",\"width\":\"medium\",\"position\":\"right\",\"font\":\"\"}},\"new7\":{\"type\":\"text\",\"enabled\":\"1\",\"fields\":{\"copy\":\"<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p>\",\"width\":\"small\",\"position\":\"left\",\"font\":\"\"}},\"new8\":{\"type\":\"text\",\"enabled\":\"1\",\"fields\":{\"copy\":\"<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p>\",\"width\":\"small\",\"position\":\"center\",\"font\":\"\"}},\"new9\":{\"type\":\"text\",\"enabled\":\"1\",\"fields\":{\"copy\":\"<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p>\",\"width\":\"small\",\"position\":\"right\",\"font\":\"\"}}},\"45\":\"#000000\",\"53\":[\"48\"]}}','2017-08-30 13:35:23','2017-08-30 13:35:23','5cec8c13-953f-49a6-86dd-fde911443c7d'),(63,49,4,1,'en_gb',2,'','{\"typeId\":\"4\",\"authorId\":\"1\",\"title\":\"Text Test\",\"slug\":\"text-test\",\"postDate\":1504100100,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"46\":\"#000000\",\"38\":\"Brody Associates\",\"39\":[\"47\"],\"37\":\"\",\"41\":\"\",\"3\":{\"50\":{\"type\":\"text\",\"enabled\":\"1\",\"fields\":{\"copy\":\"<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p>\",\"width\":\"large\",\"position\":\"left\",\"font\":\"\"}},\"51\":{\"type\":\"text\",\"enabled\":\"1\",\"fields\":{\"copy\":\"<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p>\",\"width\":\"large\",\"position\":\"center\",\"font\":\"\"}},\"52\":{\"type\":\"text\",\"enabled\":\"1\",\"fields\":{\"copy\":\"<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p>\",\"width\":\"large\",\"position\":\"right\",\"font\":\"\"}},\"53\":{\"type\":\"text\",\"enabled\":\"1\",\"fields\":{\"copy\":\"<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p>\",\"width\":\"medium\",\"position\":\"left\",\"font\":\"\"}},\"54\":{\"type\":\"text\",\"enabled\":\"1\",\"fields\":{\"copy\":\"<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p>\",\"width\":\"medium\",\"position\":\"center\",\"font\":\"\"}},\"55\":{\"type\":\"text\",\"enabled\":\"1\",\"fields\":{\"copy\":\"<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p>\",\"width\":\"medium\",\"position\":\"right\",\"font\":\"\"}},\"56\":{\"type\":\"text\",\"enabled\":\"1\",\"fields\":{\"copy\":\"<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p>\",\"width\":\"small\",\"position\":\"left\",\"font\":\"\"}},\"57\":{\"type\":\"text\",\"enabled\":\"1\",\"fields\":{\"copy\":\"<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p>\",\"width\":\"small\",\"position\":\"center\",\"font\":\"\"}},\"58\":{\"type\":\"text\",\"enabled\":\"1\",\"fields\":{\"copy\":\"<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p>\",\"width\":\"small\",\"position\":\"right\",\"font\":\"\"}}},\"45\":\"#000000\",\"53\":[\"48\"]}}','2017-08-30 13:36:57','2017-08-30 13:36:57','a80392d3-16be-49a4-b1cd-053e8fcaafec'),(64,37,5,1,'en_gb',7,'','{\"typeId\":null,\"authorId\":null,\"title\":\"Menu\",\"slug\":\"menu\",\"postDate\":1503940956,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"54\":{\"38\":{\"type\":\"discipline\",\"enabled\":\"1\",\"fields\":{\"discipline\":[\"18\"]}},\"39\":{\"type\":\"discipline\",\"enabled\":\"1\",\"fields\":{\"discipline\":[\"7\"]}},\"40\":{\"type\":\"discipline\",\"enabled\":\"1\",\"fields\":{\"discipline\":[\"19\"]}},\"41\":{\"type\":\"discipline\",\"enabled\":\"1\",\"fields\":{\"discipline\":[\"20\"]}},\"new1\":{\"type\":\"discipline\",\"enabled\":\"1\",\"fields\":{\"discipline\":[\"47\"]}},\"43\":{\"type\":\"single\",\"enabled\":\"1\",\"fields\":{\"entry\":[\"42\"]}}}}}','2017-08-30 13:40:03','2017-08-30 13:40:03','63ead328-fd62-4c40-b124-764acfd78c8d'),(65,49,4,1,'en_gb',3,'','{\"typeId\":\"4\",\"authorId\":\"1\",\"title\":\"Text Test\",\"slug\":\"text-test\",\"postDate\":1504100100,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"46\":\"#dddddd\",\"38\":\"Brody Associates\",\"39\":[\"47\"],\"37\":\"\",\"41\":\"\",\"3\":{\"50\":{\"type\":\"text\",\"enabled\":\"1\",\"fields\":{\"copy\":\"<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p>\",\"width\":\"large\",\"position\":\"left\",\"font\":\"\"}},\"51\":{\"type\":\"text\",\"enabled\":\"1\",\"fields\":{\"copy\":\"<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p>\",\"width\":\"large\",\"position\":\"center\",\"font\":\"\"}},\"52\":{\"type\":\"text\",\"enabled\":\"1\",\"fields\":{\"copy\":\"<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p>\",\"width\":\"large\",\"position\":\"right\",\"font\":\"\"}},\"53\":{\"type\":\"text\",\"enabled\":\"1\",\"fields\":{\"copy\":\"<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p>\",\"width\":\"medium\",\"position\":\"left\",\"font\":\"\"}},\"54\":{\"type\":\"text\",\"enabled\":\"1\",\"fields\":{\"copy\":\"<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p>\",\"width\":\"medium\",\"position\":\"center\",\"font\":\"\"}},\"55\":{\"type\":\"text\",\"enabled\":\"1\",\"fields\":{\"copy\":\"<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p>\",\"width\":\"medium\",\"position\":\"right\",\"font\":\"\"}},\"56\":{\"type\":\"text\",\"enabled\":\"1\",\"fields\":{\"copy\":\"<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p>\",\"width\":\"small\",\"position\":\"left\",\"font\":\"\"}},\"57\":{\"type\":\"text\",\"enabled\":\"1\",\"fields\":{\"copy\":\"<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p>\",\"width\":\"small\",\"position\":\"center\",\"font\":\"\"}},\"58\":{\"type\":\"text\",\"enabled\":\"1\",\"fields\":{\"copy\":\"<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p>\",\"width\":\"small\",\"position\":\"right\",\"font\":\"\"}}},\"45\":\"#000000\",\"53\":[\"48\"]}}','2017-08-30 13:57:05','2017-08-30 13:57:05','d58dc465-e354-4b48-a9da-03709176bfbb'),(66,49,4,1,'en_gb',4,'','{\"typeId\":\"4\",\"authorId\":\"1\",\"title\":\"Text Test\",\"slug\":\"text-test\",\"postDate\":1504100100,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"46\":\"#dddddd\",\"38\":\"Brody Associates\",\"39\":[\"47\"],\"37\":\"\",\"41\":\"<p>sure<\\/p>\",\"3\":{\"50\":{\"type\":\"text\",\"enabled\":\"1\",\"fields\":{\"copy\":\"<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p>\",\"width\":\"large\",\"position\":\"left\",\"font\":\"\"}},\"51\":{\"type\":\"text\",\"enabled\":\"1\",\"fields\":{\"copy\":\"<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p>\",\"width\":\"large\",\"position\":\"center\",\"font\":\"\"}},\"52\":{\"type\":\"text\",\"enabled\":\"1\",\"fields\":{\"copy\":\"<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p>\",\"width\":\"large\",\"position\":\"right\",\"font\":\"\"}},\"53\":{\"type\":\"text\",\"enabled\":\"1\",\"fields\":{\"copy\":\"<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p>\",\"width\":\"medium\",\"position\":\"left\",\"font\":\"\"}},\"54\":{\"type\":\"text\",\"enabled\":\"1\",\"fields\":{\"copy\":\"<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p>\",\"width\":\"medium\",\"position\":\"center\",\"font\":\"\"}},\"55\":{\"type\":\"text\",\"enabled\":\"1\",\"fields\":{\"copy\":\"<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p>\",\"width\":\"medium\",\"position\":\"right\",\"font\":\"\"}},\"56\":{\"type\":\"text\",\"enabled\":\"1\",\"fields\":{\"copy\":\"<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p>\",\"width\":\"small\",\"position\":\"left\",\"font\":\"\"}},\"57\":{\"type\":\"text\",\"enabled\":\"1\",\"fields\":{\"copy\":\"<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p>\",\"width\":\"small\",\"position\":\"center\",\"font\":\"\"}},\"58\":{\"type\":\"text\",\"enabled\":\"1\",\"fields\":{\"copy\":\"<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p>\",\"width\":\"small\",\"position\":\"right\",\"font\":\"\"}}},\"45\":\"#000000\",\"53\":[\"48\"]}}','2017-08-30 14:09:06','2017-08-30 14:09:06','e7a88034-21a1-4f0e-8ab8-3c5ee997747b'),(67,61,4,1,'en_gb',1,'','{\"typeId\":null,\"authorId\":\"1\",\"title\":\"Visuals Test\",\"slug\":\"visuals-test\",\"postDate\":1504102860,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"46\":\"#dddddd\",\"38\":\"Brody Associates\",\"39\":[\"47\"],\"37\":\"\",\"41\":\"<p>Yeah<\\/p>\",\"3\":{\"new1\":{\"type\":\"visuals\",\"enabled\":\"1\",\"fields\":{\"files\":[\"60\"],\"width\":\"large\",\"position\":\"left\",\"gutter\":\"\"}}},\"45\":\"#000000\",\"53\":[\"48\"]}}','2017-08-30 14:21:43','2017-08-30 14:21:43','f830c188-9e3c-479d-8e8a-a63c574235ed'),(68,61,4,1,'en_gb',2,'','{\"typeId\":\"4\",\"authorId\":\"1\",\"title\":\"Visuals Test\",\"slug\":\"visuals-test\",\"postDate\":1504102860,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"46\":\"#dddddd\",\"38\":\"Brody Associates\",\"39\":[\"47\"],\"37\":\"\",\"41\":\"<p>Yeah<\\/p>\",\"3\":{\"62\":{\"type\":\"visuals\",\"enabled\":\"1\",\"fields\":{\"files\":[\"60\"],\"width\":\"large\",\"position\":\"left\",\"gutter\":\"\"}},\"new1\":{\"type\":\"visuals\",\"enabled\":\"1\",\"fields\":{\"files\":[\"63\",\"64\",\"65\"],\"width\":\"small\",\"position\":\"center\",\"gutter\":\"1\"}}},\"45\":\"#000000\",\"53\":[\"48\"]}}','2017-08-30 14:57:26','2017-08-30 14:57:26','13d386c3-5fd9-4f7e-a081-f6524f2de5f4');
/*!40000 ALTER TABLE `craft_entryversions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_fieldgroups`
--

DROP TABLE IF EXISTS `craft_fieldgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_fieldgroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_fieldgroups_name_unq_idx` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_fieldgroups`
--

LOCK TABLES `craft_fieldgroups` WRITE;
/*!40000 ALTER TABLE `craft_fieldgroups` DISABLE KEYS */;
INSERT INTO `craft_fieldgroups` VALUES (1,'Default','2017-08-23 20:18:19','2017-08-23 20:18:19','10b2e557-df8b-43f2-8a03-6df1f71006ae'),(2,'Project Fields','2017-08-24 09:23:35','2017-08-24 09:23:35','42440bf3-da57-435a-9b31-69882fc72d73'),(3,'Font Fields','2017-08-24 13:23:59','2017-08-24 13:23:59','26658ef2-bed8-4c67-8955-1ffa50652918'),(4,'Home Fields','2017-08-24 15:13:07','2017-08-24 15:13:07','ca29aa56-aff0-444c-ab3d-55ab395cc4ff'),(5,'Menu Fields','2017-08-28 17:22:50','2017-08-28 17:22:50','06bc2e97-9f93-4c5f-8595-db151f6eb9a3');
/*!40000 ALTER TABLE `craft_fieldgroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_fieldlayoutfields`
--

DROP TABLE IF EXISTS `craft_fieldlayoutfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_fieldlayoutfields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `tabId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `required` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_fieldlayoutfields_layoutId_fieldId_unq_idx` (`layoutId`,`fieldId`),
  KEY `craft_fieldlayoutfields_sortOrder_idx` (`sortOrder`),
  KEY `craft_fieldlayoutfields_tabId_fk` (`tabId`),
  KEY `craft_fieldlayoutfields_fieldId_fk` (`fieldId`),
  CONSTRAINT `craft_fieldlayoutfields_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fieldlayoutfields_layoutId_fk` FOREIGN KEY (`layoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fieldlayoutfields_tabId_fk` FOREIGN KEY (`tabId`) REFERENCES `craft_fieldlayouttabs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=373 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_fieldlayoutfields`
--

LOCK TABLES `craft_fieldlayoutfields` WRITE;
/*!40000 ALTER TABLE `craft_fieldlayoutfields` DISABLE KEYS */;
INSERT INTO `craft_fieldlayoutfields` VALUES (164,61,51,43,0,1,'2017-08-24 15:02:29','2017-08-24 15:02:29','5087bd43-5101-4226-8bf1-a589e48d11b3'),(165,61,51,44,0,2,'2017-08-24 15:02:29','2017-08-24 15:02:29','541bab74-1ab8-4254-a179-f3269c673842'),(301,95,87,54,0,1,'2017-08-28 17:26:54','2017-08-28 17:26:54','7a9853f6-b22b-4cb2-b7b2-b0d78af40688'),(320,110,94,1,0,1,'2017-08-30 10:22:25','2017-08-30 10:22:25','a647c95d-a7d4-42e4-af5a-99a998b12c62'),(321,110,94,49,0,2,'2017-08-30 10:22:25','2017-08-30 10:22:25','7bde7e85-d1db-430b-a7df-1ad14a30e114'),(322,110,94,50,0,3,'2017-08-30 10:22:25','2017-08-30 10:22:25','f5d3085e-5085-4ebc-9be0-fc5b2be685a8'),(323,110,94,51,0,4,'2017-08-30 10:22:25','2017-08-30 10:22:25','e75ae540-3a89-4b9e-88db-d11b137c9628'),(324,110,94,52,0,5,'2017-08-30 10:22:25','2017-08-30 10:22:25','15ef47e4-9a40-42fa-bfab-c4ad876cef6f'),(327,113,97,58,1,1,'2017-08-30 10:24:43','2017-08-30 10:24:43','64b21476-756a-4767-a63e-a2c5475db8a0'),(328,114,98,55,1,1,'2017-08-30 10:24:43','2017-08-30 10:24:43','bd26980d-33f1-4c02-9728-fe487fdc81dc'),(329,120,99,38,1,1,'2017-08-30 13:25:34','2017-08-30 13:25:34','89f95e1c-7f5c-4727-b8f2-ee40b9f48e16'),(330,120,99,39,1,2,'2017-08-30 13:25:34','2017-08-30 13:25:34','b2250ec1-a9c5-41db-bf0c-8d5e3697f74b'),(331,120,99,53,1,3,'2017-08-30 13:25:34','2017-08-30 13:25:34','54ca2e10-fb78-4f42-afa8-1875a254fa5d'),(332,120,100,46,0,1,'2017-08-30 13:25:34','2017-08-30 13:25:34','976f8fa4-5aee-413e-a025-0a4be7efe628'),(333,120,100,45,0,2,'2017-08-30 13:25:34','2017-08-30 13:25:34','3e44caff-c668-4951-9550-215a8cd299f5'),(334,120,100,37,0,3,'2017-08-30 13:25:34','2017-08-30 13:25:34','861ef9c7-e0c0-40b5-8ee2-c9a4f34fb458'),(335,120,101,41,0,1,'2017-08-30 13:25:34','2017-08-30 13:25:34','c654b9f9-d929-4d46-adfc-8f9bde8dca21'),(336,120,101,3,0,2,'2017-08-30 13:25:34','2017-08-30 13:25:34','bbb55028-8f17-43c0-a3c0-dbe9dffeb2d5'),(361,127,108,9,0,1,'2017-08-30 14:21:10','2017-08-30 14:21:10','1a676a03-37b6-493e-943d-4996f3cf4bf1'),(362,127,108,10,0,2,'2017-08-30 14:21:10','2017-08-30 14:21:10','8a2fc204-34c5-4270-b808-4b73629d817b'),(363,127,108,11,0,3,'2017-08-30 14:21:10','2017-08-30 14:21:10','e9313325-787d-4794-ae8f-66493d53e410'),(364,127,108,48,0,4,'2017-08-30 14:21:10','2017-08-30 14:21:10','df6a7b70-82c2-409a-b2ab-4b2f91f617ab'),(365,128,109,4,0,1,'2017-08-30 14:21:10','2017-08-30 14:21:10','7f4092bd-a2b3-4b6a-9b54-0c14df69cd38'),(366,128,109,5,1,2,'2017-08-30 14:21:10','2017-08-30 14:21:10','d0b85eea-ebfb-4bfa-8199-1e6fab2c4d0e'),(367,128,109,6,1,3,'2017-08-30 14:21:10','2017-08-30 14:21:10','aa3abfe0-4edf-4dea-bf99-4ecaa9695008'),(368,128,109,8,0,4,'2017-08-30 14:21:10','2017-08-30 14:21:10','48735119-ec22-41e9-9df0-897093c45d16'),(369,129,110,59,1,1,'2017-08-30 14:21:10','2017-08-30 14:21:10','c83e1494-322e-4ed4-b741-acdd8931b2d7'),(370,129,110,60,1,2,'2017-08-30 14:21:10','2017-08-30 14:21:10','81af8cf3-c61f-4d7a-a47c-b621abbc7dd0'),(371,129,110,61,1,3,'2017-08-30 14:21:10','2017-08-30 14:21:10','33b4045b-e93c-4ef6-82c8-36349c771444'),(372,129,110,62,1,4,'2017-08-30 14:21:10','2017-08-30 14:21:10','256f4c4e-69e7-49fd-bb33-fdc04c58c385');
/*!40000 ALTER TABLE `craft_fieldlayoutfields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_fieldlayouts`
--

DROP TABLE IF EXISTS `craft_fieldlayouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_fieldlayouts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_fieldlayouts_type_idx` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_fieldlayouts`
--

LOCK TABLES `craft_fieldlayouts` WRITE;
/*!40000 ALTER TABLE `craft_fieldlayouts` DISABLE KEYS */;
INSERT INTO `craft_fieldlayouts` VALUES (1,'Tag','2017-08-23 20:18:19','2017-08-23 20:18:19','1ad5dca9-805c-4a81-871d-362dad0fa383'),(6,'Entry','2017-08-23 20:36:48','2017-08-23 20:36:48','9a518993-4300-4432-8b0a-63e4ca1ae9bb'),(53,'Category','2017-08-24 13:18:13','2017-08-24 13:18:13','f5459965-c289-4e18-97eb-742241e9ead7'),(59,'Asset','2017-08-24 13:30:08','2017-08-24 13:30:08','1b86af47-b054-4cfa-b372-5eb39a68b4dc'),(61,'MatrixBlock','2017-08-24 15:02:29','2017-08-24 15:02:29','fb987065-825e-43e1-ab76-e8f925b072e3'),(95,'Entry','2017-08-28 17:26:54','2017-08-28 17:26:54','0b8653ab-933c-45dc-9d88-8bb30b21bd1c'),(100,'Entry','2017-08-29 16:14:37','2017-08-29 16:14:37','ee118d27-e69c-4930-bbfc-65bc50afb605'),(110,'Entry','2017-08-30 10:22:25','2017-08-30 10:22:25','c5d28670-02ab-4c5a-9bbc-a47c25e807b2'),(113,'MatrixBlock','2017-08-30 10:24:43','2017-08-30 10:24:43','a6146232-a23f-4f46-8ad9-5d8787045103'),(114,'MatrixBlock','2017-08-30 10:24:43','2017-08-30 10:24:43','84b06f94-1828-4202-9ff5-e4aee097ae61'),(119,'Asset','2017-08-30 11:09:19','2017-08-30 11:09:19','c64a401a-0eac-42a3-9806-0cbf6e8a35f8'),(120,'Entry','2017-08-30 13:25:34','2017-08-30 13:25:34','b2365f4e-213a-4896-8401-7fc725c42716'),(127,'MatrixBlock','2017-08-30 14:21:10','2017-08-30 14:21:10','57674e82-9f12-41a9-8e4c-449ce1fc2939'),(128,'MatrixBlock','2017-08-30 14:21:10','2017-08-30 14:21:10','150ce58e-f74e-4a6d-92e3-8741dff2ff94'),(129,'MatrixBlock','2017-08-30 14:21:10','2017-08-30 14:21:10','becc51d5-f6cc-4c66-b110-05fe70f2f74b');
/*!40000 ALTER TABLE `craft_fieldlayouts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_fieldlayouttabs`
--

DROP TABLE IF EXISTS `craft_fieldlayouttabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_fieldlayouttabs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_fieldlayouttabs_sortOrder_idx` (`sortOrder`),
  KEY `craft_fieldlayouttabs_layoutId_fk` (`layoutId`),
  CONSTRAINT `craft_fieldlayouttabs_layoutId_fk` FOREIGN KEY (`layoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_fieldlayouttabs`
--

LOCK TABLES `craft_fieldlayouttabs` WRITE;
/*!40000 ALTER TABLE `craft_fieldlayouttabs` DISABLE KEYS */;
INSERT INTO `craft_fieldlayouttabs` VALUES (51,61,'Content',1,'2017-08-24 15:02:29','2017-08-24 15:02:29','6fc55428-b0a8-441d-9cd5-c5bbc06077e0'),(87,95,'Content',1,'2017-08-28 17:26:54','2017-08-28 17:26:54','bcc0c416-49d8-4a78-9ec6-0fedf1185c41'),(94,110,'Content',1,'2017-08-30 10:22:25','2017-08-30 10:22:25','f9fe717b-c0e2-4f3a-9c94-9bbe22b137e0'),(97,113,'Content',1,'2017-08-30 10:24:43','2017-08-30 10:24:43','afec4b18-d2b2-4713-a0dc-faa9ce8d6634'),(98,114,'Content',1,'2017-08-30 10:24:43','2017-08-30 10:24:43','95b625e8-99dc-418a-8aa2-96b2f6d423ac'),(99,120,'Project',1,'2017-08-30 13:25:34','2017-08-30 13:25:34','80f62dea-3604-485b-8716-5c9d4e9c1c9b'),(100,120,'Style',2,'2017-08-30 13:25:34','2017-08-30 13:25:34','dd6cf2d1-f9b8-426c-9fbb-320505d520c1'),(101,120,'Content',3,'2017-08-30 13:25:34','2017-08-30 13:25:34','0a7a4964-20c6-48bb-a43c-87a65edbeaa2'),(108,127,'Content',1,'2017-08-30 14:21:10','2017-08-30 14:21:10','40ac04ca-9552-458b-a1db-62044f7baf3b'),(109,128,'Content',1,'2017-08-30 14:21:10','2017-08-30 14:21:10','dd07a8f9-dbea-4631-872b-31f66b3cbe22'),(110,129,'Content',1,'2017-08-30 14:21:10','2017-08-30 14:21:10','1e234404-dedc-48bd-b432-b7256ca9b1ca');
/*!40000 ALTER TABLE `craft_fieldlayouttabs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_fields`
--

DROP TABLE IF EXISTS `craft_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(58) COLLATE utf8_unicode_ci NOT NULL,
  `context` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'global',
  `instructions` text COLLATE utf8_unicode_ci,
  `translatable` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_fields_handle_context_unq_idx` (`handle`,`context`),
  KEY `craft_fields_context_idx` (`context`),
  KEY `craft_fields_groupId_fk` (`groupId`),
  CONSTRAINT `craft_fields_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_fieldgroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_fields`
--

LOCK TABLES `craft_fields` WRITE;
/*!40000 ALTER TABLE `craft_fields` DISABLE KEYS */;
INSERT INTO `craft_fields` VALUES (1,1,'Body','body','global',NULL,1,'RichText','{\"configFile\":\"Standard.json\",\"columnType\":\"text\"}','2017-08-23 20:18:19','2017-08-23 20:18:19','42b213d9-680f-4b7f-bd72-6679a7ddd223'),(2,1,'Tags','tags','global',NULL,0,'Tags','{\"source\":\"taggroup:1\"}','2017-08-23 20:18:19','2017-08-23 20:18:19','c7401c77-45b2-4b37-9115-fa7a14998a16'),(3,2,'Modules','modules','global','',0,'Matrix','{\"maxBlocks\":null}','2017-08-24 09:58:22','2017-08-30 14:21:10','af8228e4-2a6a-4da1-8bce-be4093429c85'),(4,NULL,'__blank__','copy','matrixBlockType:1','',0,'RichText','{\"configFile\":\"\",\"availableAssetSources\":\"*\",\"availableTransforms\":\"*\",\"cleanupHtml\":\"1\",\"purifyHtml\":\"1\",\"purifierConfig\":\"\",\"columnType\":\"text\"}','2017-08-24 09:58:22','2017-08-30 14:21:10','b1bbc67d-f2cb-4f35-9357-6e64a5f355a7'),(5,NULL,'Width','width','matrixBlockType:1','',0,'Dropdown','{\"options\":[{\"label\":\"Large\",\"value\":\"large\",\"default\":\"1\"},{\"label\":\"Medium\",\"value\":\"medium\",\"default\":\"\"},{\"label\":\"Small\",\"value\":\"small\",\"default\":\"\"}]}','2017-08-24 09:58:22','2017-08-30 14:21:10','9303e697-29ac-4349-b9d0-38d888b772d8'),(6,NULL,'Position','position','matrixBlockType:1','',0,'Dropdown','{\"options\":[{\"label\":\"Left\",\"value\":\"left\",\"default\":\"1\"},{\"label\":\"Center\",\"value\":\"center\",\"default\":\"\"},{\"label\":\"Right\",\"value\":\"right\",\"default\":\"\"}]}','2017-08-24 10:09:51','2017-08-30 14:21:10','b24b3f19-d03c-4438-a39c-7b9b8f6b47de'),(8,NULL,'Font','font','matrixBlockType:1','',0,'Entries','{\"sources\":[\"section:3\"],\"limit\":\"\",\"selectionLabel\":\"Set font\"}','2017-08-24 10:11:03','2017-08-30 14:21:10','9e6a95c6-b9c6-4cac-97be-a0b432089e1b'),(9,NULL,'File','File','matrixBlockType:2','image or video file',0,'Assets','{\"useSingleFolder\":\"\",\"sources\":[\"folder:1\"],\"defaultUploadLocationSource\":\"1\",\"defaultUploadLocationSubpath\":\"\",\"singleUploadLocationSource\":\"1\",\"singleUploadLocationSubpath\":\"\",\"restrictFiles\":\"\",\"limit\":\"1\",\"viewMode\":\"list\",\"selectionLabel\":\"\"}','2017-08-24 10:13:50','2017-08-30 14:21:10','0f150c89-0d03-4ea6-ac3b-7373660b30b7'),(10,NULL,'Color','color','matrixBlockType:2','',0,'Color',NULL,'2017-08-24 11:52:59','2017-08-30 14:21:10','12e11114-53b3-4af1-a286-c2bc5afa8ecd'),(11,NULL,'Fixed','fixed','matrixBlockType:2','Is the background image fixed? ',0,'Lightswitch','{\"default\":\"\"}','2017-08-24 11:52:59','2017-08-30 14:21:10','1937d4e3-9893-48e0-814f-20ed8c885bf1'),(36,2,'Background File','bgFile','global','',0,'Assets','{\"useSingleFolder\":\"\",\"sources\":[\"folder:1\"],\"defaultUploadLocationSource\":\"1\",\"defaultUploadLocationSubpath\":\"\",\"singleUploadLocationSource\":\"1\",\"singleUploadLocationSubpath\":\"\",\"restrictFiles\":\"\",\"limit\":\"1\",\"viewMode\":\"list\",\"selectionLabel\":\"\"}','2017-08-24 13:17:24','2017-08-24 13:17:24','830e1280-0620-43dd-85e2-1d230c3c7559'),(37,2,'Font','font','global','',0,'Entries','{\"sources\":[\"section:3\"],\"limit\":\"\",\"selectionLabel\":\"Set font\"}','2017-08-24 13:17:39','2017-08-30 13:59:08','b1fcc34a-569f-49e4-a95c-ce778d015778'),(38,2,'Client','client','global','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2017-08-24 13:17:54','2017-08-24 13:17:54','f61e694b-6989-4701-a7a5-570940e55624'),(39,2,'Discipline','discipline','global','',0,'Categories','{\"source\":\"group:1\",\"limit\":\"1\",\"selectionLabel\":\"\"}','2017-08-24 13:20:48','2017-08-28 14:01:01','81059f6b-08ad-4ba5-b470-c0ca4a23fd42'),(40,2,'Date','completionDate','global','',0,'Date','{\"minuteIncrement\":\"30\",\"showDate\":1,\"showTime\":0}','2017-08-24 13:21:14','2017-08-25 11:03:33','2550b8df-a4f3-4fab-a27a-65f2248eb475'),(41,2,'Introduction','intro','global','',0,'RichText','{\"configFile\":\"\",\"availableAssetSources\":\"\",\"availableTransforms\":\"*\",\"cleanupHtml\":\"1\",\"purifyHtml\":\"1\",\"purifierConfig\":\"\",\"columnType\":\"text\"}','2017-08-24 13:21:50','2017-08-24 13:21:50','5f5197a5-05c2-4612-a072-766b15040335'),(42,3,'Fonts','fonts','global','',0,'Matrix','{\"maxBlocks\":null}','2017-08-24 13:26:32','2017-08-24 15:02:29','8768cb5d-e2ef-4f6b-8fa3-73967646b03a'),(43,NULL,'Name','fontName','matrixBlockType:10','',0,'Dropdown','{\"options\":[{\"label\":\"Thin\",\"value\":\"thin\",\"default\":\"\"},{\"label\":\"Thin Italic\",\"value\":\"thinItalic\",\"default\":\"\"},{\"label\":\"Extralight\",\"value\":\"extralight\",\"default\":\"\"},{\"label\":\"Extralight Italic\",\"value\":\"extralightItalic\",\"default\":\"\"},{\"label\":\"Light\",\"value\":\"light\",\"default\":\"\"},{\"label\":\"Light Italic\",\"value\":\"lightItalic\",\"default\":\"\"},{\"label\":\"Regular\",\"value\":\"regular\",\"default\":\"\"},{\"label\":\"Regular Italic\",\"value\":\"regularItalic\",\"default\":\"\"},{\"label\":\"Medium\",\"value\":\"medium\",\"default\":\"\"},{\"label\":\"Medium Italic\",\"value\":\"mediumItalic\",\"default\":\"\"},{\"label\":\"Semibold\",\"value\":\"semibold\",\"default\":\"\"},{\"label\":\"Semibold Italic\",\"value\":\"semiboldItalic\",\"default\":\"\"},{\"label\":\"Bold\",\"value\":\"bold\",\"default\":\"\"},{\"label\":\"Bold Italic\",\"value\":\"boldItalic\",\"default\":\"\"},{\"label\":\"Black\",\"value\":\"black\",\"default\":\"\"},{\"label\":\"Black Italic\",\"value\":\"blackItalic\",\"default\":\"\"},{\"label\":\"Super\",\"value\":\"super\",\"default\":\"\"},{\"label\":\"Super Italic\",\"value\":\"superItalic\",\"default\":\"\"}]}','2017-08-24 13:26:32','2017-08-24 15:02:29','e8cbf493-f7a7-4c09-a68f-8c0aaa212b08'),(44,NULL,'File','file','matrixBlockType:10','',0,'Assets','{\"useSingleFolder\":\"\",\"sources\":[\"folder:2\"],\"defaultUploadLocationSource\":\"1\",\"defaultUploadLocationSubpath\":\"\",\"singleUploadLocationSource\":\"1\",\"singleUploadLocationSubpath\":\"\",\"restrictFiles\":\"\",\"limit\":\"1\",\"viewMode\":\"list\",\"selectionLabel\":\"\"}','2017-08-24 13:26:32','2017-08-24 15:02:29','2040418e-f657-4f08-9fdc-5f79808e7962'),(45,2,'Text Color','textColor','global','',0,'Hue','{\"defaultColor\":\"#000000\"}','2017-08-24 15:07:17','2017-08-30 13:56:41','47d6b6e8-02e6-4872-b57d-5cff2787692b'),(46,2,'Background Color','bgColor','global','',0,'Hue','{\"defaultColor\":\"#dddddd\"}','2017-08-24 15:07:54','2017-08-30 13:56:51','ed5b2e2a-e1e5-4440-ae6f-e25cb27da54d'),(47,1,'Background Fixed','bgFixed','global','Is the background image fixed? ',0,'Lightswitch','{\"default\":\"\"}','2017-08-24 15:09:17','2017-08-24 15:09:17','2b8b1113-3518-4bbf-afe7-50571692e82f'),(48,NULL,'Show All','showAll','matrixBlockType:2','Show all of the background image, ie do not crop',0,'Lightswitch','{\"default\":\"\"}','2017-08-24 15:11:32','2017-08-30 14:21:10','0bda2349-b7c9-40da-94b8-c4b73ff5ce32'),(49,4,'Typography Entries','typographyEntries','global','',0,'Entries','{\"sources\":[\"section:4\"],\"limit\":\"\",\"selectionLabel\":\"\"}','2017-08-24 15:13:35','2017-08-24 15:13:35','f716f4a9-029b-4fd7-b323-4e3aac4e5442'),(50,4,'Identity Entries','identityEntries','global','',0,'Entries','{\"sources\":[\"section:4\"],\"limit\":\"\",\"selectionLabel\":\"\"}','2017-08-24 15:14:38','2017-08-24 15:14:38','787f4cec-8d42-4002-9f53-f350419250b1'),(51,4,'Digital Entries','digitalEntries','global','',0,'Entries','{\"sources\":[\"section:4\"],\"limit\":\"\",\"selectionLabel\":\"\"}','2017-08-24 15:15:11','2017-08-24 15:15:11','c89513fa-8972-4a0f-9e5d-a3b1de8d4dc8'),(52,4,'Art Direction Entries','artDirectionEntries','global','',0,'Entries','{\"sources\":[\"section:4\"],\"limit\":\"\",\"selectionLabel\":\"\"}','2017-08-24 15:15:32','2017-08-24 15:15:32','8ab2c89c-04a6-4ff0-81cc-b0fb854f178e'),(53,2,'Thumbnail','thumbnail','global','',0,'Assets','{\"useSingleFolder\":\"\",\"sources\":[\"folder:1\"],\"defaultUploadLocationSource\":\"1\",\"defaultUploadLocationSubpath\":\"\",\"singleUploadLocationSource\":\"1\",\"singleUploadLocationSubpath\":\"\",\"restrictFiles\":\"\",\"limit\":\"1\",\"viewMode\":\"large\",\"selectionLabel\":\"\"}','2017-08-28 13:26:00','2017-08-30 13:26:03','b6671a15-ce48-4833-858e-5a39ce3823de'),(54,5,'Menu Items','menuItems','global','',0,'Matrix','{\"maxBlocks\":null}','2017-08-28 17:24:52','2017-08-30 10:24:43','f19220dc-d8c6-4709-8565-4764ed44de2c'),(55,NULL,'__blank__','discipline','matrixBlockType:11','',0,'Categories','{\"source\":\"group:1\",\"limit\":\"1\",\"selectionLabel\":\"\"}','2017-08-28 17:24:52','2017-08-30 10:24:43','543501c6-3fcf-41d2-b36d-abc63ede702a'),(58,NULL,'__blank__','entry','matrixBlockType:12','',0,'Entries','{\"sources\":[\"singles\"],\"limit\":\"1\",\"selectionLabel\":\"\"}','2017-08-29 14:06:27','2017-08-30 10:24:43','9b71d8f8-b786-497b-85d4-e7d418a33300'),(59,NULL,'__blank__','files','matrixBlockType:13','',0,'Assets','{\"useSingleFolder\":\"\",\"sources\":[\"folder:1\"],\"defaultUploadLocationSource\":\"1\",\"defaultUploadLocationSubpath\":\"\",\"singleUploadLocationSource\":\"1\",\"singleUploadLocationSubpath\":\"\",\"restrictFiles\":\"1\",\"allowedKinds\":[\"image\",\"video\"],\"limit\":\"3\",\"viewMode\":\"large\",\"selectionLabel\":\"File\"}','2017-08-30 13:32:47','2017-08-30 14:21:10','47d79376-c8fe-436b-a65b-0d8bf13d332b'),(60,NULL,'Width','width','matrixBlockType:13','',0,'Dropdown','{\"options\":[{\"label\":\"Large\",\"value\":\"large\",\"default\":\"\"},{\"label\":\"Medium\",\"value\":\"medium\",\"default\":\"1\"},{\"label\":\"Small\",\"value\":\"small\",\"default\":\"\"}]}','2017-08-30 13:32:47','2017-08-30 14:21:10','46c43328-0c95-483f-b4a9-f5ab6dd84d7e'),(61,NULL,'Position','position','matrixBlockType:13','',0,'Dropdown','{\"options\":[{\"label\":\"Left\",\"value\":\"left\",\"default\":\"1\"},{\"label\":\"Center\",\"value\":\"center\",\"default\":\"\"},{\"label\":\"Right\",\"value\":\"right\",\"default\":\"\"}]}','2017-08-30 13:32:47','2017-08-30 14:21:10','8f4c5ef9-0501-4318-a7a3-08168ca8279b'),(62,NULL,'Gutter','gutter','matrixBlockType:13','',0,'Lightswitch','{\"default\":\"\"}','2017-08-30 13:32:47','2017-08-30 14:21:10','75ce3880-8851-4cb4-a648-b986eeaed766');
/*!40000 ALTER TABLE `craft_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_globalsets`
--

DROP TABLE IF EXISTS `craft_globalsets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_globalsets` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fieldLayoutId` int(10) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_globalsets_name_unq_idx` (`name`),
  UNIQUE KEY `craft_globalsets_handle_unq_idx` (`handle`),
  KEY `craft_globalsets_fieldLayoutId_fk` (`fieldLayoutId`),
  CONSTRAINT `craft_globalsets_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_globalsets_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_globalsets`
--

LOCK TABLES `craft_globalsets` WRITE;
/*!40000 ALTER TABLE `craft_globalsets` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_globalsets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_info`
--

DROP TABLE IF EXISTS `craft_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `schemaVersion` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `edition` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `siteName` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `siteUrl` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `timezone` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `on` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `maintenance` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_info`
--

LOCK TABLES `craft_info` WRITE;
/*!40000 ALTER TABLE `craft_info` DISABLE KEYS */;
INSERT INTO `craft_info` VALUES (1,'2.6.2989','2.6.10',0,'Brody Associates','http://brody-backend-simonsweeney.c9users.io','UTC',1,0,'2017-08-23 20:18:17','2017-08-23 20:18:17','82b0bb4d-6d92-4528-a054-a1dd2ae3d2d9');
/*!40000 ALTER TABLE `craft_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_locales`
--

DROP TABLE IF EXISTS `craft_locales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_locales` (
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`locale`),
  KEY `craft_locales_sortOrder_idx` (`sortOrder`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_locales`
--

LOCK TABLES `craft_locales` WRITE;
/*!40000 ALTER TABLE `craft_locales` DISABLE KEYS */;
INSERT INTO `craft_locales` VALUES ('en_gb',1,'2017-08-23 20:18:17','2017-08-23 20:18:17','2bbc77ab-5792-43ee-b54a-6c43f3224b25');
/*!40000 ALTER TABLE `craft_locales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_matrixblocks`
--

DROP TABLE IF EXISTS `craft_matrixblocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_matrixblocks` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `ownerLocale` char(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_matrixblocks_ownerId_idx` (`ownerId`),
  KEY `craft_matrixblocks_fieldId_idx` (`fieldId`),
  KEY `craft_matrixblocks_typeId_idx` (`typeId`),
  KEY `craft_matrixblocks_sortOrder_idx` (`sortOrder`),
  KEY `craft_matrixblocks_ownerLocale_fk` (`ownerLocale`),
  CONSTRAINT `craft_matrixblocks_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_matrixblocks_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_matrixblocks_ownerId_fk` FOREIGN KEY (`ownerId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_matrixblocks_ownerLocale_fk` FOREIGN KEY (`ownerLocale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craft_matrixblocks_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `craft_matrixblocktypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_matrixblocks`
--

LOCK TABLES `craft_matrixblocks` WRITE;
/*!40000 ALTER TABLE `craft_matrixblocks` DISABLE KEYS */;
INSERT INTO `craft_matrixblocks` VALUES (8,6,3,1,1,NULL,'2017-08-25 11:12:07','2017-08-28 13:50:03','2c1ae327-c0ac-4532-8401-67e2246f2f65'),(30,5,3,1,1,NULL,'2017-08-28 14:50:40','2017-08-30 13:19:24','20fdabf3-c605-4936-8997-4c0d45629847'),(38,37,54,11,1,NULL,'2017-08-29 14:04:11','2017-08-30 13:40:02','508ae101-75af-4d8d-9330-5e9c16df9999'),(39,37,54,11,2,NULL,'2017-08-29 14:31:02','2017-08-30 13:40:02','4f4902ca-8d66-4ff5-a06c-13eb1ced03bb'),(40,37,54,11,3,NULL,'2017-08-29 14:31:02','2017-08-30 13:40:02','8a6ed2a7-1207-4496-aea6-54aacee44d98'),(41,37,54,11,4,NULL,'2017-08-29 14:31:02','2017-08-30 13:40:03','f2eee41f-5aa7-4232-a80b-c1e511ad4b26'),(43,37,54,12,6,NULL,'2017-08-29 16:15:13','2017-08-30 13:40:03','857a1c58-6834-41a8-8748-87ca7f057af5'),(50,49,3,1,1,NULL,'2017-08-30 13:35:23','2017-08-30 14:09:06','ee002307-e002-4460-844c-067928143ca2'),(51,49,3,1,2,NULL,'2017-08-30 13:35:23','2017-08-30 14:09:06','ba910e63-4a79-4253-ac0e-7557f1b77aa5'),(52,49,3,1,3,NULL,'2017-08-30 13:35:23','2017-08-30 14:09:06','04d81638-0cd0-434c-9704-8e1880c0c965'),(53,49,3,1,4,NULL,'2017-08-30 13:35:23','2017-08-30 14:09:06','6fedd357-9970-403a-a584-649615c2e95f'),(54,49,3,1,5,NULL,'2017-08-30 13:35:23','2017-08-30 14:09:06','c6984388-41a9-4010-b168-ebd9e4b3c37b'),(55,49,3,1,6,NULL,'2017-08-30 13:35:23','2017-08-30 14:09:06','dc7f2289-3266-477d-8ff4-038f62d5c24d'),(56,49,3,1,7,NULL,'2017-08-30 13:35:23','2017-08-30 14:09:06','407b9a03-5e99-48d7-8f7c-a46b1726cabb'),(57,49,3,1,8,NULL,'2017-08-30 13:35:23','2017-08-30 14:09:06','742b1bd8-bab5-42ed-9285-cfdbf24ee482'),(58,49,3,1,9,NULL,'2017-08-30 13:35:23','2017-08-30 14:09:06','5b78f16a-33fb-4ed7-b166-43b0b344323f'),(59,37,54,11,5,NULL,'2017-08-30 13:40:03','2017-08-30 13:40:03','3a1f8d09-ac41-40c9-96f8-a37aaf107af1'),(62,61,3,13,1,NULL,'2017-08-30 14:21:43','2017-08-30 14:57:26','c4178158-04ee-4aba-b361-4343fb3c1df6'),(66,61,3,13,2,NULL,'2017-08-30 14:57:26','2017-08-30 14:57:26','063aa02d-fcc8-4416-b1e2-ae749a241119');
/*!40000 ALTER TABLE `craft_matrixblocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_matrixblocktypes`
--

DROP TABLE IF EXISTS `craft_matrixblocktypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_matrixblocktypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_matrixblocktypes_name_fieldId_unq_idx` (`name`,`fieldId`),
  UNIQUE KEY `craft_matrixblocktypes_handle_fieldId_unq_idx` (`handle`,`fieldId`),
  KEY `craft_matrixblocktypes_fieldId_fk` (`fieldId`),
  KEY `craft_matrixblocktypes_fieldLayoutId_fk` (`fieldLayoutId`),
  CONSTRAINT `craft_matrixblocktypes_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_matrixblocktypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_matrixblocktypes`
--

LOCK TABLES `craft_matrixblocktypes` WRITE;
/*!40000 ALTER TABLE `craft_matrixblocktypes` DISABLE KEYS */;
INSERT INTO `craft_matrixblocktypes` VALUES (1,3,128,'Text','text',2,'2017-08-24 09:58:22','2017-08-30 14:21:10','b966718e-7983-40d2-9875-eba53de5d0f9'),(2,3,127,'Background','background',1,'2017-08-24 10:13:50','2017-08-30 14:21:10','b0d98f51-f7bb-48c2-8fb2-1b43037b0d1e'),(10,42,61,'Weight','weight',1,'2017-08-24 13:26:32','2017-08-24 15:02:29','91f8a748-12f8-46ab-a872-9df36f5914a3'),(11,54,114,'Discipline','discipline',2,'2017-08-28 17:24:52','2017-08-30 10:24:43','a15bdfec-f67a-48f9-8556-8a7da5a24163'),(12,54,113,'Single','single',1,'2017-08-29 14:06:27','2017-08-30 10:24:43','e18f9d26-23e1-48d2-ab0e-3c4a9bcf8c49'),(13,3,129,'Visuals','visuals',3,'2017-08-30 13:32:47','2017-08-30 14:21:10','c7131e70-6ebf-42af-9443-bc47fd8f720a');
/*!40000 ALTER TABLE `craft_matrixblocktypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_matrixcontent_fonts`
--

DROP TABLE IF EXISTS `craft_matrixcontent_fonts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_matrixcontent_fonts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_weight_fontName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_matrixcontent_fonts_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_matrixcontent_fonts_locale_fk` (`locale`),
  CONSTRAINT `craft_matrixcontent_fonts_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_matrixcontent_fonts_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_matrixcontent_fonts`
--

LOCK TABLES `craft_matrixcontent_fonts` WRITE;
/*!40000 ALTER TABLE `craft_matrixcontent_fonts` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_matrixcontent_fonts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_matrixcontent_menuitems`
--

DROP TABLE IF EXISTS `craft_matrixcontent_menuitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_matrixcontent_menuitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_matrixcontent_menuitems_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_matrixcontent_menuitems_locale_fk` (`locale`),
  CONSTRAINT `craft_matrixcontent_menuitems_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_matrixcontent_menuitems_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_matrixcontent_menuitems`
--

LOCK TABLES `craft_matrixcontent_menuitems` WRITE;
/*!40000 ALTER TABLE `craft_matrixcontent_menuitems` DISABLE KEYS */;
INSERT INTO `craft_matrixcontent_menuitems` VALUES (1,38,'en_gb','2017-08-29 14:04:11','2017-08-30 13:40:02','f9ec899c-5c2d-4438-a2b2-c425fe73638e'),(2,39,'en_gb','2017-08-29 14:31:02','2017-08-30 13:40:02','cdbc03a3-d0fe-435f-a54d-1eb0661d244b'),(3,40,'en_gb','2017-08-29 14:31:02','2017-08-30 13:40:02','d29b3ee6-01a0-4ff5-9b06-e6b0156e9e3f'),(4,41,'en_gb','2017-08-29 14:31:02','2017-08-30 13:40:02','94b8c25f-038d-4d43-8c06-8feed7f11a75'),(5,43,'en_gb','2017-08-29 16:15:13','2017-08-30 13:40:03','e9a52003-624c-42b3-bdbf-890083abe81e'),(6,59,'en_gb','2017-08-30 13:40:03','2017-08-30 13:40:03','ea3e50dc-0448-4898-b5b4-b82065e50487');
/*!40000 ALTER TABLE `craft_matrixcontent_menuitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_matrixcontent_modules`
--

DROP TABLE IF EXISTS `craft_matrixcontent_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_matrixcontent_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_text_copy` text COLLATE utf8_unicode_ci,
  `field_text_width` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'large',
  `field_text_position` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'left',
  `field_background_color` char(7) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_background_fixed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_background_showAll` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_visuals_width` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'medium',
  `field_visuals_position` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'left',
  `field_visuals_gutter` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_matrixcontent_modules_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_matrixcontent_modules_locale_fk` (`locale`),
  CONSTRAINT `craft_matrixcontent_modules_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_matrixcontent_modules_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_matrixcontent_modules`
--

LOCK TABLES `craft_matrixcontent_modules` WRITE;
/*!40000 ALTER TABLE `craft_matrixcontent_modules` DISABLE KEYS */;
INSERT INTO `craft_matrixcontent_modules` VALUES (1,8,'en_gb','<p>TEST</p>','full','none',NULL,0,0,'medium','left',0,'2017-08-25 11:12:07','2017-08-28 13:50:03','cdbe91f0-c6dc-47cd-8f8b-3e162d97de49'),(2,30,'en_gb','<p>TEST</p>','full','none',NULL,0,0,'medium','left',0,'2017-08-28 14:50:40','2017-08-30 13:19:24','bd258d28-bb89-4348-960e-542298e76e0d'),(7,50,'en_gb','<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>','large','left',NULL,0,0,NULL,NULL,0,'2017-08-30 13:35:23','2017-08-30 14:09:06','cf3f3941-c6f4-49bc-94a2-59cedbaf4ad7'),(8,51,'en_gb','<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>','large','center',NULL,0,0,NULL,NULL,0,'2017-08-30 13:35:23','2017-08-30 14:09:06','efc6e4b8-2803-4080-8ab4-6027a4e1d883'),(9,52,'en_gb','<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>','large','right',NULL,0,0,NULL,NULL,0,'2017-08-30 13:35:23','2017-08-30 14:09:06','6cda1a58-34c1-4f8a-b957-cec52b921094'),(10,53,'en_gb','<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>','medium','left',NULL,0,0,NULL,NULL,0,'2017-08-30 13:35:23','2017-08-30 14:09:06','cdc0c57d-2839-42ad-865d-b17f67b5e1f2'),(11,54,'en_gb','<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>','medium','center',NULL,0,0,NULL,NULL,0,'2017-08-30 13:35:23','2017-08-30 14:09:06','4406b017-2945-4e96-9e2f-a0fda654e9ab'),(12,55,'en_gb','<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>','medium','right',NULL,0,0,NULL,NULL,0,'2017-08-30 13:35:23','2017-08-30 14:09:06','f4e5473f-5e04-46c8-8c60-ba4fba717809'),(13,56,'en_gb','<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>','small','left',NULL,0,0,NULL,NULL,0,'2017-08-30 13:35:23','2017-08-30 14:09:06','1b42d018-5a13-4ec9-8c91-64059d923056'),(14,57,'en_gb','<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>','small','center',NULL,0,0,NULL,NULL,0,'2017-08-30 13:35:23','2017-08-30 14:09:06','3e6e6b4d-6b65-408a-b8d9-3028b3f24a98'),(15,58,'en_gb','<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>','small','right',NULL,0,0,NULL,NULL,0,'2017-08-30 13:35:23','2017-08-30 14:09:06','db4d18ac-f0a5-4266-8fb5-8623f3630b3f'),(16,62,'en_gb',NULL,NULL,NULL,NULL,0,0,'large','left',0,'2017-08-30 14:21:43','2017-08-30 14:57:26','01e9efe0-9e80-424b-a84e-dfa803f7958d'),(17,66,'en_gb',NULL,NULL,NULL,NULL,0,0,'small','center',1,'2017-08-30 14:57:26','2017-08-30 14:57:26','f1187b67-621a-4bf3-940c-823c47ea3313');
/*!40000 ALTER TABLE `craft_matrixcontent_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_migrations`
--

DROP TABLE IF EXISTS `craft_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pluginId` int(11) DEFAULT NULL,
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_migrations_version_unq_idx` (`version`),
  KEY `craft_migrations_pluginId_fk` (`pluginId`),
  CONSTRAINT `craft_migrations_pluginId_fk` FOREIGN KEY (`pluginId`) REFERENCES `craft_plugins` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_migrations`
--

LOCK TABLES `craft_migrations` WRITE;
/*!40000 ALTER TABLE `craft_migrations` DISABLE KEYS */;
INSERT INTO `craft_migrations` VALUES (1,NULL,'m000000_000000_base','2017-08-23 20:18:17','2017-08-23 20:18:17','2017-08-23 20:18:17','a12b1000-4055-406f-a558-f61ec0e298dc'),(2,NULL,'m140730_000001_add_filename_and_format_to_transformindex','2017-08-23 20:18:17','2017-08-23 20:18:17','2017-08-23 20:18:17','6bd1852c-8d70-4514-90f3-05c369b06b2e'),(3,NULL,'m140815_000001_add_format_to_transforms','2017-08-23 20:18:17','2017-08-23 20:18:17','2017-08-23 20:18:17','037dc074-0608-40c3-ab5a-e31e589588ce'),(4,NULL,'m140822_000001_allow_more_than_128_items_per_field','2017-08-23 20:18:17','2017-08-23 20:18:17','2017-08-23 20:18:17','1f910aa3-e852-4d9e-8584-59edcbc79df4'),(5,NULL,'m140829_000001_single_title_formats','2017-08-23 20:18:17','2017-08-23 20:18:17','2017-08-23 20:18:17','7ee8b7ab-fef4-47f4-a70c-0fe282b7d306'),(6,NULL,'m140831_000001_extended_cache_keys','2017-08-23 20:18:17','2017-08-23 20:18:17','2017-08-23 20:18:17','6cab24dd-8848-4cb0-92d8-8e5e5cdc676d'),(7,NULL,'m140922_000001_delete_orphaned_matrix_blocks','2017-08-23 20:18:17','2017-08-23 20:18:17','2017-08-23 20:18:17','a8f431fd-0edf-4c25-9583-e30b051b2abd'),(8,NULL,'m141008_000001_elements_index_tune','2017-08-23 20:18:17','2017-08-23 20:18:17','2017-08-23 20:18:17','cec403f9-1f4a-466c-87f4-69ffa9093532'),(9,NULL,'m141009_000001_assets_source_handle','2017-08-23 20:18:17','2017-08-23 20:18:17','2017-08-23 20:18:17','1a6391cc-450f-4810-a974-25d4686ff20c'),(10,NULL,'m141024_000001_field_layout_tabs','2017-08-23 20:18:17','2017-08-23 20:18:17','2017-08-23 20:18:17','aabf5195-b732-4b16-81b3-f44829df4924'),(11,NULL,'m141030_000000_plugin_schema_versions','2017-08-23 20:18:17','2017-08-23 20:18:17','2017-08-23 20:18:17','b2c1ebd0-02be-44c3-94aa-8b384f6085b1'),(12,NULL,'m141030_000001_drop_structure_move_permission','2017-08-23 20:18:17','2017-08-23 20:18:17','2017-08-23 20:18:17','16ce5eea-975a-4ae0-9d18-6ac459347e46'),(13,NULL,'m141103_000001_tag_titles','2017-08-23 20:18:17','2017-08-23 20:18:17','2017-08-23 20:18:17','7588203e-a731-432a-997a-2f41da35642f'),(14,NULL,'m141109_000001_user_status_shuffle','2017-08-23 20:18:17','2017-08-23 20:18:17','2017-08-23 20:18:17','537f9033-9f02-43bc-a87b-9829f278be61'),(15,NULL,'m141126_000001_user_week_start_day','2017-08-23 20:18:17','2017-08-23 20:18:17','2017-08-23 20:18:17','5c8a0cca-1539-48b2-b3e5-42deca7e3eec'),(16,NULL,'m150210_000001_adjust_user_photo_size','2017-08-23 20:18:17','2017-08-23 20:18:17','2017-08-23 20:18:17','4f31945a-3b06-4538-add4-8e5c01691b24'),(17,NULL,'m150724_000001_adjust_quality_settings','2017-08-23 20:18:17','2017-08-23 20:18:17','2017-08-23 20:18:17','40079477-378f-4252-a546-16ca92e4a7d8'),(18,NULL,'m150827_000000_element_index_settings','2017-08-23 20:18:17','2017-08-23 20:18:17','2017-08-23 20:18:17','e0db9886-f968-4fe8-8408-5ce3af5b2b0c'),(19,NULL,'m150918_000001_add_colspan_to_widgets','2017-08-23 20:18:17','2017-08-23 20:18:17','2017-08-23 20:18:17','c82c66fc-93da-47e5-b52b-883f8c02638d'),(20,NULL,'m151007_000000_clear_asset_caches','2017-08-23 20:18:17','2017-08-23 20:18:17','2017-08-23 20:18:17','b5642bc9-9a23-4c14-ad7e-418851aa83f8'),(21,NULL,'m151109_000000_text_url_formats','2017-08-23 20:18:17','2017-08-23 20:18:17','2017-08-23 20:18:17','be83b189-626a-4562-bcc3-d6de6a567a53'),(22,NULL,'m151110_000000_move_logo','2017-08-23 20:18:17','2017-08-23 20:18:17','2017-08-23 20:18:17','acc8f201-4c50-486d-b267-cb490927a81e'),(23,NULL,'m151117_000000_adjust_image_widthheight','2017-08-23 20:18:17','2017-08-23 20:18:17','2017-08-23 20:18:17','d4be7d81-a7f5-48c9-98ea-326347b861f8'),(24,NULL,'m151127_000000_clear_license_key_status','2017-08-23 20:18:17','2017-08-23 20:18:17','2017-08-23 20:18:17','3321bd9d-3953-4698-ab69-45df4af387c9'),(25,NULL,'m151127_000000_plugin_license_keys','2017-08-23 20:18:17','2017-08-23 20:18:17','2017-08-23 20:18:17','76d3f4b8-8243-4087-bdb1-70ed6248e777'),(26,NULL,'m151130_000000_update_pt_widget_feeds','2017-08-23 20:18:17','2017-08-23 20:18:17','2017-08-23 20:18:17','cd04d4b3-9640-4ae5-ba78-538468b1c017'),(27,NULL,'m160114_000000_asset_sources_public_url_default_true','2017-08-23 20:18:17','2017-08-23 20:18:17','2017-08-23 20:18:17','c9c277e7-82bf-48a5-8dd0-b9b804696ead'),(28,NULL,'m160223_000000_sortorder_to_smallint','2017-08-23 20:18:17','2017-08-23 20:18:17','2017-08-23 20:18:17','6c506cec-3351-4821-bc0f-0dc026da822f'),(29,NULL,'m160229_000000_set_default_entry_statuses','2017-08-23 20:18:17','2017-08-23 20:18:17','2017-08-23 20:18:17','9a6c461c-c0f0-4e52-a3c7-bb4828c37c0f'),(30,NULL,'m160304_000000_client_permissions','2017-08-23 20:18:17','2017-08-23 20:18:17','2017-08-23 20:18:17','dceee960-8cf5-4764-befd-eb3d2186d16c'),(31,NULL,'m160322_000000_asset_filesize','2017-08-23 20:18:17','2017-08-23 20:18:17','2017-08-23 20:18:17','c78c2005-5fd4-4c8d-b6d9-d3c94e7d6434'),(32,NULL,'m160503_000000_orphaned_fieldlayouts','2017-08-23 20:18:17','2017-08-23 20:18:17','2017-08-23 20:18:17','2a6320a0-d3dd-47ee-8fa0-3a5133faa39e'),(33,NULL,'m160510_000000_tasksettings','2017-08-23 20:18:17','2017-08-23 20:18:17','2017-08-23 20:18:17','be6baee6-a701-477a-a3b9-aa08b7b6b2a0'),(34,NULL,'m160829_000000_pending_user_content_cleanup','2017-08-23 20:18:17','2017-08-23 20:18:17','2017-08-23 20:18:17','2c50fb62-b45e-4712-8da6-25c59b83f0df'),(35,NULL,'m160830_000000_asset_index_uri_increase','2017-08-23 20:18:17','2017-08-23 20:18:17','2017-08-23 20:18:17','ab09b6b3-c8e3-484b-b2db-506e69e5d4db'),(36,NULL,'m160919_000000_usergroup_handle_title_unique','2017-08-23 20:18:17','2017-08-23 20:18:17','2017-08-23 20:18:17','60c47602-9cf9-43fb-8454-7e639d22b8a8'),(37,NULL,'m161108_000000_new_version_format','2017-08-23 20:18:17','2017-08-23 20:18:17','2017-08-23 20:18:17','28a3156b-7221-4432-a0bb-f9efbacb8f17'),(38,NULL,'m161109_000000_index_shuffle','2017-08-23 20:18:17','2017-08-23 20:18:17','2017-08-23 20:18:17','892eec9e-2dff-40e2-9def-5001a9315da7'),(39,NULL,'m170612_000000_route_index_shuffle','2017-08-23 20:18:17','2017-08-23 20:18:17','2017-08-23 20:18:17','b8582082-84e2-43a1-92ff-4868cee849f6');
/*!40000 ALTER TABLE `craft_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_plugins`
--

DROP TABLE IF EXISTS `craft_plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_plugins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `version` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `schemaVersion` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `licenseKey` char(24) COLLATE utf8_unicode_ci DEFAULT NULL,
  `licenseKeyStatus` enum('valid','invalid','mismatched','unknown') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unknown',
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `settings` text COLLATE utf8_unicode_ci,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_plugins`
--

LOCK TABLES `craft_plugins` WRITE;
/*!40000 ALTER TABLE `craft_plugins` DISABLE KEYS */;
INSERT INTO `craft_plugins` VALUES (2,'Api','1.0',NULL,NULL,'unknown',1,NULL,'2017-08-30 09:32:02','2017-08-30 09:32:02','2017-08-30 13:18:23','7d2a34ef-28d7-4e41-892a-a27450abe694'),(3,'Imager','1.6.3','1.0.0',NULL,'unknown',1,NULL,'2017-08-30 12:40:30','2017-08-30 12:40:30','2017-08-30 13:18:23','e0f25a32-6c78-4831-af6f-4d2401a02508'),(5,'Hue','1.1.1','0.0.0.0',NULL,'unknown',1,NULL,'2017-08-30 13:56:25','2017-08-30 13:56:25','2017-08-30 13:56:25','44c04eef-811e-4f48-9596-58f3807aada1');
/*!40000 ALTER TABLE `craft_plugins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_rackspaceaccess`
--

DROP TABLE IF EXISTS `craft_rackspaceaccess`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_rackspaceaccess` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `connectionKey` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `storageUrl` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cdnUrl` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_rackspaceaccess_connectionKey_unq_idx` (`connectionKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_rackspaceaccess`
--

LOCK TABLES `craft_rackspaceaccess` WRITE;
/*!40000 ALTER TABLE `craft_rackspaceaccess` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_rackspaceaccess` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_relations`
--

DROP TABLE IF EXISTS `craft_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_relations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `sourceLocale` char(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `targetId` int(11) NOT NULL,
  `sortOrder` smallint(6) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_relations_fieldId_sourceId_sourceLocale_targetId_unq_idx` (`fieldId`,`sourceId`,`sourceLocale`,`targetId`),
  KEY `craft_relations_sourceId_fk` (`sourceId`),
  KEY `craft_relations_sourceLocale_fk` (`sourceLocale`),
  KEY `craft_relations_targetId_fk` (`targetId`),
  CONSTRAINT `craft_relations_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_relations_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_relations_sourceLocale_fk` FOREIGN KEY (`sourceLocale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craft_relations_targetId_fk` FOREIGN KEY (`targetId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=223 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_relations`
--

LOCK TABLES `craft_relations` WRITE;
/*!40000 ALTER TABLE `craft_relations` DISABLE KEYS */;
INSERT INTO `craft_relations` VALUES (13,53,6,NULL,4,1,'2017-08-28 13:50:03','2017-08-28 13:50:03','97e57862-0bcd-47d1-a56c-7ab80ec9a3f0'),(14,39,6,NULL,18,1,'2017-08-28 13:50:03','2017-08-28 13:50:03','7138f736-a53d-4f08-9dbb-520659b39794'),(17,53,9,NULL,4,1,'2017-08-28 13:50:26','2017-08-28 13:50:26','a88abd14-f1ec-421a-8dc9-4008726be51e'),(18,39,9,NULL,18,1,'2017-08-28 13:50:26','2017-08-28 13:50:26','b2c07270-dc63-4bb8-8dc9-503ff81f40e2'),(19,53,10,NULL,4,1,'2017-08-28 13:50:40','2017-08-28 13:50:40','9730b0e6-5b8e-4d4d-9ec3-102607ceb92d'),(20,39,10,NULL,18,1,'2017-08-28 13:50:40','2017-08-28 13:50:40','b21ca586-7973-44df-8677-8c73d0b15508'),(23,53,12,NULL,4,1,'2017-08-28 14:02:00','2017-08-28 14:02:00','dd0ff5a8-f30d-450d-ad15-f336065ebc2e'),(24,39,12,NULL,18,1,'2017-08-28 14:02:00','2017-08-28 14:02:00','118770b1-8144-45fc-922d-72e08cba5a5d'),(25,53,11,NULL,4,1,'2017-08-28 14:02:26','2017-08-28 14:02:26','8bf90cbb-b571-41f5-8305-385f59532c43'),(26,39,11,NULL,18,1,'2017-08-28 14:02:26','2017-08-28 14:02:26','75eb0626-cf79-40c2-8fb3-28297ba48683'),(27,53,13,NULL,4,1,'2017-08-28 14:02:45','2017-08-28 14:02:45','54094040-3830-463f-9624-4f95f13937d7'),(28,39,13,NULL,7,1,'2017-08-28 14:02:45','2017-08-28 14:02:45','ecfb63b4-2599-4e21-b739-bda53ada4cb9'),(29,53,14,NULL,4,1,'2017-08-28 14:02:54','2017-08-28 14:02:54','5b424c05-69c1-4ca2-90dc-426c25f14420'),(30,39,14,NULL,7,1,'2017-08-28 14:02:54','2017-08-28 14:02:54','6bb4e996-41ed-4c68-aa64-552211c1434d'),(31,53,17,NULL,4,1,'2017-08-28 14:04:08','2017-08-28 14:04:08','852d1969-20b2-43ec-9501-1b735fc2b716'),(32,39,17,NULL,7,1,'2017-08-28 14:04:08','2017-08-28 14:04:08','3190b171-8613-483a-8947-48ff5635db22'),(33,53,21,NULL,4,1,'2017-08-28 14:04:38','2017-08-28 14:04:38','ae972d35-d99c-438f-82bb-0c64c34d2f58'),(34,39,21,NULL,7,1,'2017-08-28 14:04:38','2017-08-28 14:04:38','63cba430-0762-41e9-ad43-a4cc11b94120'),(35,53,22,NULL,4,1,'2017-08-28 14:05:01','2017-08-28 14:05:01','1cde8019-81dc-4440-bb39-ad6e45f81d81'),(36,39,22,NULL,19,1,'2017-08-28 14:05:01','2017-08-28 14:05:01','4b352948-e60d-4b25-8491-10ac7d5234d6'),(37,53,23,NULL,4,1,'2017-08-28 14:05:24','2017-08-28 14:05:24','09c76984-9139-4d93-9ab5-35367d70dfa0'),(38,39,23,NULL,19,1,'2017-08-28 14:05:24','2017-08-28 14:05:24','8478a9a1-6c82-4383-94d6-d88e9517e639'),(39,53,24,NULL,4,1,'2017-08-28 14:05:44','2017-08-28 14:05:44','f68e8e4e-f214-4fa5-8411-8610f55284d0'),(40,39,24,NULL,19,1,'2017-08-28 14:05:44','2017-08-28 14:05:44','c1221de4-272f-49b4-a957-5988af876849'),(41,53,25,NULL,4,1,'2017-08-28 14:06:13','2017-08-28 14:06:13','75d58a8d-dbc1-4338-bfdd-99425ad823db'),(42,39,25,NULL,20,1,'2017-08-28 14:06:13','2017-08-28 14:06:13','53cd7570-f2e0-4d19-b7ed-0d767583a461'),(43,53,26,NULL,4,1,'2017-08-28 14:06:34','2017-08-28 14:06:34','90df88e0-90c7-46f5-9037-9b606ee4eed4'),(44,39,26,NULL,20,1,'2017-08-28 14:06:34','2017-08-28 14:06:34','e2dde87f-412e-4ad8-a083-9159aabad9ab'),(45,53,15,NULL,4,1,'2017-08-28 14:06:53','2017-08-28 14:06:53','f56b9ab7-0b15-493e-912c-933b17770ae2'),(46,39,15,NULL,7,1,'2017-08-28 14:06:53','2017-08-28 14:06:53','bc9b7868-90e5-4917-9949-947f5ba61cff'),(47,53,16,NULL,4,1,'2017-08-28 14:07:05','2017-08-28 14:07:05','083d61df-7506-47a3-b33c-ee83656b5c88'),(48,39,16,NULL,7,1,'2017-08-28 14:07:05','2017-08-28 14:07:05','79158c7d-32dd-429a-aacc-d28802520e38'),(49,53,27,NULL,4,1,'2017-08-28 14:08:00','2017-08-28 14:08:00','90fa984c-607c-4796-8bf2-329e31115d5f'),(50,39,27,NULL,20,1,'2017-08-28 14:08:00','2017-08-28 14:08:00','6d739e23-f5ec-410a-91ce-0873ebb8ef98'),(51,53,28,NULL,4,1,'2017-08-28 14:08:25','2017-08-28 14:08:25','67556f21-7115-4de6-9ca3-0fb1431e85ba'),(52,39,28,NULL,20,1,'2017-08-28 14:08:25','2017-08-28 14:08:25','53bdd276-76d5-494e-8899-bb4ad879fe28'),(53,53,29,NULL,4,1,'2017-08-28 14:08:50','2017-08-28 14:08:50','3f78f043-39f0-4e5d-8119-8e92816b024a'),(54,39,29,NULL,20,1,'2017-08-28 14:08:50','2017-08-28 14:08:50','92660ff2-6923-4799-81c3-42b134ae90fb'),(189,53,5,NULL,46,1,'2017-08-30 13:19:24','2017-08-30 13:19:24','69897e4e-c8d7-4ab9-92ab-ccaa2e8afc5c'),(190,39,5,NULL,18,1,'2017-08-30 13:19:24','2017-08-30 13:19:24','fe65810c-edb7-457f-b169-07672ffc03ea'),(204,55,38,NULL,18,1,'2017-08-30 13:40:02','2017-08-30 13:40:02','df1d216f-48a2-49c2-80ef-ea9e56f49191'),(205,55,39,NULL,7,1,'2017-08-30 13:40:02','2017-08-30 13:40:02','1c256471-7e56-4990-8b65-9d0d6ad3c417'),(206,55,40,NULL,19,1,'2017-08-30 13:40:02','2017-08-30 13:40:02','f7123bdb-e6c7-488d-97be-8fba55fe6056'),(207,55,41,NULL,20,1,'2017-08-30 13:40:03','2017-08-30 13:40:03','3e401ee5-b113-4df9-892f-8a1308410fc7'),(208,55,59,NULL,47,1,'2017-08-30 13:40:03','2017-08-30 13:40:03','29a6b648-d7af-4b15-992c-c2e2665c1185'),(209,58,43,NULL,42,1,'2017-08-30 13:40:03','2017-08-30 13:40:03','135fb6fc-79a2-4bf1-aa24-a5a3e16b295e'),(212,39,49,NULL,47,1,'2017-08-30 14:09:06','2017-08-30 14:09:06','e89751e4-cbdc-494d-a180-833a950525cc'),(213,53,49,NULL,48,1,'2017-08-30 14:09:06','2017-08-30 14:09:06','558804c7-f217-4a86-973b-e2e0ffd688e1'),(217,39,61,NULL,47,1,'2017-08-30 14:57:26','2017-08-30 14:57:26','caf56e74-612e-415d-baa5-b004b35caa9d'),(218,53,61,NULL,48,1,'2017-08-30 14:57:26','2017-08-30 14:57:26','3e5d29a6-ea8f-476d-adf1-495c5c5081cb'),(219,59,62,NULL,60,1,'2017-08-30 14:57:26','2017-08-30 14:57:26','e9f96c26-26c3-4871-8c77-8543ac3a1a32'),(220,59,66,NULL,63,1,'2017-08-30 14:57:26','2017-08-30 14:57:26','3a1b22f3-227e-4a98-805d-d4d272969059'),(221,59,66,NULL,64,2,'2017-08-30 14:57:26','2017-08-30 14:57:26','d5a0e08d-aa23-4e4e-8312-3c54e1b4acc3'),(222,59,66,NULL,65,3,'2017-08-30 14:57:26','2017-08-30 14:57:26','2c93c09c-2151-47e5-9a6e-5b9a98eb58b0');
/*!40000 ALTER TABLE `craft_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_routes`
--

DROP TABLE IF EXISTS `craft_routes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_routes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locale` char(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `urlParts` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `urlPattern` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `template` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_routes_locale_idx` (`locale`),
  KEY `craft_routes_urlPattern_idx` (`urlPattern`),
  CONSTRAINT `craft_routes_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_routes`
--

LOCK TABLES `craft_routes` WRITE;
/*!40000 ALTER TABLE `craft_routes` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_routes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_searchindex`
--

DROP TABLE IF EXISTS `craft_searchindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_searchindex` (
  `elementId` int(11) NOT NULL,
  `attribute` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `fieldId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `keywords` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`locale`),
  FULLTEXT KEY `craft_searchindex_keywords_idx` (`keywords`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_searchindex`
--

LOCK TABLES `craft_searchindex` WRITE;
/*!40000 ALTER TABLE `craft_searchindex` DISABLE KEYS */;
INSERT INTO `craft_searchindex` VALUES (1,'username',0,'en_gb',' admin '),(1,'firstname',0,'en_gb',''),(1,'lastname',0,'en_gb',''),(1,'fullname',0,'en_gb',''),(1,'email',0,'en_gb',' admin bong international '),(1,'slug',0,'en_gb',''),(2,'slug',0,'en_gb',' homepage '),(2,'title',0,'en_gb',' home '),(2,'field',1,'en_gb',' it s true this site doesn t have a whole lot of content yet but don t worry our web developers have just installed the cms and they re setting things up for the content editors this very moment soon brody backend simonsweeney c9users io will be an oasis of fresh perspectives sharp analyses and astute opinions that will keep you coming back again and again '),(5,'field',37,'en_gb',''),(5,'field',45,'en_gb',' 000000 '),(5,'field',38,'en_gb',' channel 4 '),(5,'field',40,'en_gb',' 2016 01 01 '),(5,'field',39,'en_gb',' typography '),(5,'field',3,'en_gb',' center test none full neville brody portrait left small neville brody portrait 2208 1 left small 2208 neville brody portrait neville brody2005 0 right large horizontal 2208 neville brody portrait neville brody2005 1 reduced '),(5,'slug',0,'en_gb',' channel 4 '),(5,'title',0,'en_gb',' channel 4 '),(6,'field',41,'en_gb',' test '),(6,'field',46,'en_gb',' c2c2c2 '),(6,'field',36,'en_gb',''),(5,'field',36,'en_gb',''),(5,'field',41,'en_gb',' test '),(5,'field',46,'en_gb',' 000000 '),(4,'filename',0,'en_gb',' neville brody portrait jpg '),(4,'extension',0,'en_gb',' jpg '),(4,'kind',0,'en_gb',' image '),(4,'slug',0,'en_gb',' neville brody portrait '),(4,'title',0,'en_gb',' neville brody portrait '),(6,'field',37,'en_gb',''),(6,'field',45,'en_gb',' 000000 '),(6,'field',38,'en_gb',' coca cola '),(6,'field',40,'en_gb',' 2017 08 01 '),(6,'field',39,'en_gb',' typography '),(6,'field',3,'en_gb',' center test none full '),(6,'slug',0,'en_gb',' coca cola '),(6,'title',0,'en_gb',' coca cola '),(7,'slug',0,'en_gb',' identity '),(7,'title',0,'en_gb',' identity '),(8,'field',4,'en_gb',' test '),(8,'field',5,'en_gb',' full '),(8,'field',6,'en_gb',' none '),(8,'field',7,'en_gb',' center '),(8,'field',8,'en_gb',''),(8,'slug',0,'en_gb',''),(5,'field',53,'en_gb',' ba web test stories channel4 image 21 '),(6,'field',53,'en_gb',' neville brody portrait '),(9,'field',53,'en_gb',' neville brody portrait '),(9,'field',41,'en_gb',''),(9,'field',46,'en_gb',' 000000 '),(9,'field',36,'en_gb',''),(9,'field',37,'en_gb',''),(9,'field',45,'en_gb',' 000000 '),(9,'field',38,'en_gb',''),(9,'field',40,'en_gb',''),(9,'field',39,'en_gb',' typography '),(9,'field',3,'en_gb',''),(9,'slug',0,'en_gb',' samsung '),(9,'title',0,'en_gb',' samsung '),(10,'field',53,'en_gb',' neville brody portrait '),(10,'field',41,'en_gb',''),(10,'field',46,'en_gb',' 000000 '),(10,'field',36,'en_gb',''),(10,'field',37,'en_gb',''),(10,'field',45,'en_gb',' 000000 '),(10,'field',38,'en_gb',''),(10,'field',40,'en_gb',''),(10,'field',39,'en_gb',' typography '),(10,'field',3,'en_gb',''),(10,'slug',0,'en_gb',' paris baguette '),(10,'title',0,'en_gb',' paris baguette '),(11,'field',53,'en_gb',' neville brody portrait '),(11,'field',41,'en_gb',''),(11,'field',46,'en_gb',' 000000 '),(11,'field',36,'en_gb',''),(11,'field',37,'en_gb',''),(11,'field',45,'en_gb',' 000000 '),(11,'field',38,'en_gb',''),(11,'field',40,'en_gb',''),(11,'field',39,'en_gb',' typography '),(11,'field',3,'en_gb',''),(11,'slug',0,'en_gb',' punk london design museum '),(11,'title',0,'en_gb',' punk london design museum '),(12,'field',53,'en_gb',' neville brody portrait '),(12,'field',41,'en_gb',''),(12,'field',46,'en_gb',' 000000 '),(12,'field',36,'en_gb',''),(12,'field',37,'en_gb',''),(12,'field',45,'en_gb',' 000000 '),(12,'field',38,'en_gb',''),(12,'field',40,'en_gb',''),(12,'field',39,'en_gb',' typography '),(12,'field',3,'en_gb',''),(12,'slug',0,'en_gb',' nike england '),(12,'title',0,'en_gb',' nike england '),(13,'field',53,'en_gb',' neville brody portrait '),(13,'field',41,'en_gb',''),(13,'field',46,'en_gb',' 000000 '),(13,'field',36,'en_gb',''),(13,'field',37,'en_gb',''),(13,'field',45,'en_gb',' 000000 '),(13,'field',38,'en_gb',''),(13,'field',40,'en_gb',''),(13,'field',39,'en_gb',' identity '),(13,'field',3,'en_gb',''),(13,'slug',0,'en_gb',' c w '),(13,'title',0,'en_gb',' c w '),(14,'field',53,'en_gb',' neville brody portrait '),(14,'field',41,'en_gb',''),(14,'field',46,'en_gb',' 000000 '),(14,'field',36,'en_gb',''),(14,'field',37,'en_gb',''),(14,'field',45,'en_gb',' 000000 '),(14,'field',38,'en_gb',''),(14,'field',40,'en_gb',''),(14,'field',39,'en_gb',' identity '),(14,'field',3,'en_gb',''),(14,'slug',0,'en_gb',' balfron tower '),(14,'title',0,'en_gb',' balfron tower '),(15,'field',53,'en_gb',' neville brody portrait '),(15,'field',41,'en_gb',''),(15,'field',46,'en_gb',' 000000 '),(15,'field',36,'en_gb',''),(15,'field',37,'en_gb',''),(15,'field',45,'en_gb',' 000000 '),(15,'field',38,'en_gb',''),(15,'field',40,'en_gb',''),(15,'field',39,'en_gb',' identity '),(15,'field',3,'en_gb',''),(15,'slug',0,'en_gb',' samlip '),(15,'title',0,'en_gb',' samlip '),(16,'field',53,'en_gb',' neville brody portrait '),(16,'field',41,'en_gb',''),(16,'field',46,'en_gb',' 000000 '),(16,'field',36,'en_gb',''),(16,'field',37,'en_gb',''),(16,'field',45,'en_gb',' 000000 '),(16,'field',38,'en_gb',''),(16,'field',40,'en_gb',''),(16,'field',39,'en_gb',' identity '),(16,'field',3,'en_gb',''),(16,'slug',0,'en_gb',' rca 175 '),(16,'title',0,'en_gb',' rca 175 '),(17,'field',53,'en_gb',' neville brody portrait '),(17,'field',41,'en_gb',''),(17,'field',46,'en_gb',' 000000 '),(17,'field',36,'en_gb',''),(17,'field',37,'en_gb',''),(17,'field',45,'en_gb',' 000000 '),(17,'field',38,'en_gb',''),(17,'field',40,'en_gb',''),(17,'field',39,'en_gb',' identity '),(17,'field',3,'en_gb',''),(17,'slug',0,'en_gb',' rca 180 '),(17,'title',0,'en_gb',' rca 180 '),(18,'slug',0,'en_gb',' typography '),(18,'title',0,'en_gb',' typography '),(19,'slug',0,'en_gb',' digital '),(19,'title',0,'en_gb',' digital '),(20,'slug',0,'en_gb',' art direction '),(20,'title',0,'en_gb',' art direction '),(21,'field',53,'en_gb',' neville brody portrait '),(21,'field',41,'en_gb',''),(21,'field',46,'en_gb',' 000000 '),(21,'field',36,'en_gb',''),(21,'field',37,'en_gb',''),(21,'field',45,'en_gb',' 000000 '),(21,'field',38,'en_gb',''),(21,'field',40,'en_gb',''),(21,'field',39,'en_gb',' identity '),(21,'field',3,'en_gb',''),(21,'slug',0,'en_gb',' christian dior '),(21,'title',0,'en_gb',' christian dior '),(22,'field',53,'en_gb',' neville brody portrait '),(22,'field',41,'en_gb',''),(22,'field',46,'en_gb',' 000000 '),(22,'field',36,'en_gb',''),(22,'field',37,'en_gb',''),(22,'field',45,'en_gb',' 000000 '),(22,'field',38,'en_gb',''),(22,'field',40,'en_gb',''),(22,'field',39,'en_gb',' digital '),(22,'field',3,'en_gb',''),(22,'slug',0,'en_gb',' ufa '),(22,'title',0,'en_gb',' ufa '),(23,'field',53,'en_gb',' neville brody portrait '),(23,'field',41,'en_gb',''),(23,'field',46,'en_gb',' 000000 '),(23,'field',36,'en_gb',''),(23,'field',37,'en_gb',''),(23,'field',45,'en_gb',' 000000 '),(23,'field',38,'en_gb',''),(23,'field',40,'en_gb',''),(23,'field',39,'en_gb',' digital '),(23,'field',3,'en_gb',''),(23,'slug',0,'en_gb',' bbc website '),(23,'title',0,'en_gb',' bbc website '),(24,'field',53,'en_gb',' neville brody portrait '),(24,'field',41,'en_gb',''),(24,'field',46,'en_gb',' 000000 '),(24,'field',36,'en_gb',''),(24,'field',37,'en_gb',''),(24,'field',45,'en_gb',' 000000 '),(24,'field',38,'en_gb',''),(24,'field',40,'en_gb',''),(24,'field',39,'en_gb',' digital '),(24,'field',3,'en_gb',''),(24,'slug',0,'en_gb',' rca website '),(24,'title',0,'en_gb',' rca website '),(25,'field',53,'en_gb',' neville brody portrait '),(25,'field',41,'en_gb',''),(25,'field',46,'en_gb',' 000000 '),(25,'field',36,'en_gb',''),(25,'field',37,'en_gb',''),(25,'field',45,'en_gb',' 000000 '),(25,'field',38,'en_gb',''),(25,'field',40,'en_gb',''),(25,'field',39,'en_gb',' art direction '),(25,'field',3,'en_gb',''),(25,'slug',0,'en_gb',' vandals '),(25,'title',0,'en_gb',' vandals '),(26,'field',53,'en_gb',' neville brody portrait '),(26,'field',41,'en_gb',''),(26,'field',46,'en_gb',' 000000 '),(26,'field',36,'en_gb',''),(26,'field',37,'en_gb',''),(26,'field',45,'en_gb',' 000000 '),(26,'field',38,'en_gb',''),(26,'field',40,'en_gb',''),(26,'field',39,'en_gb',' art direction '),(26,'field',3,'en_gb',''),(26,'slug',0,'en_gb',' supreme '),(26,'title',0,'en_gb',' supreme '),(27,'field',53,'en_gb',' neville brody portrait '),(27,'field',41,'en_gb',''),(27,'field',46,'en_gb',' 000000 '),(27,'field',36,'en_gb',''),(27,'field',37,'en_gb',''),(27,'field',45,'en_gb',' 000000 '),(27,'field',38,'en_gb',''),(27,'field',40,'en_gb',''),(27,'field',39,'en_gb',' art direction '),(27,'field',3,'en_gb',''),(27,'slug',0,'en_gb',' ginza magazine '),(27,'title',0,'en_gb',' ginza magazine '),(28,'field',53,'en_gb',' neville brody portrait '),(28,'field',41,'en_gb',''),(28,'field',46,'en_gb',' 000000 '),(28,'field',36,'en_gb',''),(28,'field',37,'en_gb',''),(28,'field',45,'en_gb',' 000000 '),(28,'field',38,'en_gb',''),(28,'field',40,'en_gb',''),(28,'field',39,'en_gb',' art direction '),(28,'field',3,'en_gb',''),(28,'slug',0,'en_gb',' uniqlo '),(28,'title',0,'en_gb',' uniqlo '),(29,'field',53,'en_gb',' neville brody portrait '),(29,'field',41,'en_gb',''),(29,'field',46,'en_gb',' 000000 '),(29,'field',36,'en_gb',''),(29,'field',37,'en_gb',''),(29,'field',45,'en_gb',' 000000 '),(29,'field',38,'en_gb',''),(29,'field',40,'en_gb',''),(29,'field',39,'en_gb',' art direction '),(29,'field',3,'en_gb',''),(29,'slug',0,'en_gb',' tate bmw tate live book '),(29,'title',0,'en_gb',' tate bmw tate live book '),(30,'field',4,'en_gb',' test '),(30,'field',5,'en_gb',' full '),(30,'field',6,'en_gb',' none '),(30,'field',7,'en_gb',' center '),(30,'field',8,'en_gb',''),(30,'slug',0,'en_gb',''),(49,'field',41,'en_gb',' sure '),(49,'field',37,'en_gb',''),(49,'field',45,'en_gb',' 000000 '),(49,'field',53,'en_gb',' y zlqh '),(49,'field',39,'en_gb',' test '),(33,'filename',0,'en_gb',' 2208 jpg '),(33,'extension',0,'en_gb',' jpg '),(33,'kind',0,'en_gb',' image '),(33,'slug',0,'en_gb',' 2208 '),(33,'title',0,'en_gb',' 2208 '),(49,'field',46,'en_gb',' dddddd '),(34,'filename',0,'en_gb',' nevillebrody2005 jpg '),(34,'extension',0,'en_gb',' jpg '),(34,'kind',0,'en_gb',' image '),(34,'slug',0,'en_gb',' neville brody2005 '),(34,'title',0,'en_gb',' neville brody2005 '),(49,'field',38,'en_gb',' brody associates '),(48,'title',0,'en_gb',' y zlqh '),(48,'slug',0,'en_gb',' y zlqh '),(48,'kind',0,'en_gb',' image '),(48,'extension',0,'en_gb',' png '),(48,'filename',0,'en_gb',' yzlqh png '),(47,'title',0,'en_gb',' test '),(47,'slug',0,'en_gb',' test '),(37,'slug',0,'en_gb',' menu '),(37,'title',0,'en_gb',' menu '),(37,'field',54,'en_gb',' typography identity digital art direction test contact '),(38,'field',55,'en_gb',' typography '),(38,'field',56,'en_gb',' samsung coca cola channel 4 paris baguette punk london design museum nike england '),(38,'slug',0,'en_gb',''),(49,'field',3,'en_gb',' it is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout the point of using lorem ipsum is that it has a more or less normal distribution of letters as opposed to using content here content here making it look like readable english many desktop publishing packages and web page editors now use lorem ipsum as their default model text and a search for lorem ipsum will uncover many web sites still in their infancy various versions have evolved over the years sometimes by accident sometimes on purpose injected humour and the like left large it is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout the point of using lorem ipsum is that it has a more or less normal distribution of letters as opposed to using content here content here making it look like readable english many desktop publishing packages and web page editors now use lorem ipsum as their default model text and a search for lorem ipsum will uncover many web sites still in their infancy various versions have evolved over the years sometimes by accident sometimes on purpose injected humour and the like center large it is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout the point of using lorem ipsum is that it has a more or less normal distribution of letters as opposed to using content here content here making it look like readable english many desktop publishing packages and web page editors now use lorem ipsum as their default model text and a search for lorem ipsum will uncover many web sites still in their infancy various versions have evolved over the years sometimes by accident sometimes on purpose injected humour and the like right large it is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout the point of using lorem ipsum is that it has a more or less normal distribution of letters as opposed to using content here content here making it look like readable english many desktop publishing packages and web page editors now use lorem ipsum as their default model text and a search for lorem ipsum will uncover many web sites still in their infancy various versions have evolved over the years sometimes by accident sometimes on purpose injected humour and the like left medium it is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout the point of using lorem ipsum is that it has a more or less normal distribution of letters as opposed to using content here content here making it look like readable english many desktop publishing packages and web page editors now use lorem ipsum as their default model text and a search for lorem ipsum will uncover many web sites still in their infancy various versions have evolved over the years sometimes by accident sometimes on purpose injected humour and the like center medium it is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout the point of using lorem ipsum is that it has a more or less normal distribution of letters as opposed to using content here content here making it look like readable english many desktop publishing packages and web page editors now use lorem ipsum as their default model text and a search for lorem ipsum will uncover many web sites still in their infancy various versions have evolved over the years sometimes by accident sometimes on purpose injected humour and the like right medium it is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout the point of using lorem ipsum is that it has a more or less normal distribution of letters as opposed to using content here content here making it look like readable english many desktop publishing packages and web page editors now use lorem ipsum as their default model text and a search for lorem ipsum will uncover many web sites still in their infancy various versions have evolved over the years sometimes by accident sometimes on purpose injected humour and the like left small it is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout the point of using lorem ipsum is that it has a more or less normal distribution of letters as opposed to using content here content here making it look like readable english many desktop publishing packages and web page editors now use lorem ipsum as their default model text and a search for lorem ipsum will uncover many web sites still in their infancy various versions have evolved over the years sometimes by accident sometimes on purpose injected humour and the like center small it is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout the point of using lorem ipsum is that it has a more or less normal distribution of letters as opposed to using content here content here making it look like readable english many desktop publishing packages and web page editors now use lorem ipsum as their default model text and a search for lorem ipsum will uncover many web sites still in their infancy various versions have evolved over the years sometimes by accident sometimes on purpose injected humour and the like right small '),(39,'field',55,'en_gb',' identity '),(39,'field',56,'en_gb',' c w balfron tower samlip rca 175 rca 180 christian dior '),(39,'slug',0,'en_gb',''),(40,'field',55,'en_gb',' digital '),(40,'field',56,'en_gb',' ufa bbc website rca website '),(40,'slug',0,'en_gb',''),(41,'field',55,'en_gb',' art direction '),(41,'field',56,'en_gb',' vandals supreme ginza magazine uniqlo tate bmw tate live book '),(41,'slug',0,'en_gb',''),(42,'slug',0,'en_gb',' contact '),(42,'title',0,'en_gb',' contact '),(43,'field',57,'en_gb',''),(43,'field',58,'en_gb',' contact '),(43,'slug',0,'en_gb',''),(2,'field',49,'en_gb',''),(2,'field',50,'en_gb',''),(2,'field',51,'en_gb',''),(2,'field',52,'en_gb',''),(46,'slug',0,'en_gb',' ba web test stories channel4 image 21 '),(46,'title',0,'en_gb',' ba web test stories channel4 image 21 '),(46,'kind',0,'en_gb',' image '),(46,'filename',0,'en_gb',' ba web teststories channel4 image 21 jpg '),(46,'extension',0,'en_gb',' jpg '),(49,'slug',0,'en_gb',' text test '),(49,'title',0,'en_gb',' text test '),(50,'field',4,'en_gb',' it is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout the point of using lorem ipsum is that it has a more or less normal distribution of letters as opposed to using content here content here making it look like readable english many desktop publishing packages and web page editors now use lorem ipsum as their default model text and a search for lorem ipsum will uncover many web sites still in their infancy various versions have evolved over the years sometimes by accident sometimes on purpose injected humour and the like '),(50,'field',5,'en_gb',' large '),(50,'field',6,'en_gb',' left '),(50,'field',8,'en_gb',''),(50,'slug',0,'en_gb',''),(51,'field',4,'en_gb',' it is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout the point of using lorem ipsum is that it has a more or less normal distribution of letters as opposed to using content here content here making it look like readable english many desktop publishing packages and web page editors now use lorem ipsum as their default model text and a search for lorem ipsum will uncover many web sites still in their infancy various versions have evolved over the years sometimes by accident sometimes on purpose injected humour and the like '),(51,'field',5,'en_gb',' large '),(51,'field',6,'en_gb',' center '),(51,'field',8,'en_gb',''),(51,'slug',0,'en_gb',''),(52,'field',4,'en_gb',' it is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout the point of using lorem ipsum is that it has a more or less normal distribution of letters as opposed to using content here content here making it look like readable english many desktop publishing packages and web page editors now use lorem ipsum as their default model text and a search for lorem ipsum will uncover many web sites still in their infancy various versions have evolved over the years sometimes by accident sometimes on purpose injected humour and the like '),(52,'field',5,'en_gb',' large '),(52,'field',6,'en_gb',' right '),(52,'field',8,'en_gb',''),(52,'slug',0,'en_gb',''),(53,'field',4,'en_gb',' it is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout the point of using lorem ipsum is that it has a more or less normal distribution of letters as opposed to using content here content here making it look like readable english many desktop publishing packages and web page editors now use lorem ipsum as their default model text and a search for lorem ipsum will uncover many web sites still in their infancy various versions have evolved over the years sometimes by accident sometimes on purpose injected humour and the like '),(53,'field',5,'en_gb',' medium '),(53,'field',6,'en_gb',' left '),(53,'field',8,'en_gb',''),(53,'slug',0,'en_gb',''),(54,'field',4,'en_gb',' it is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout the point of using lorem ipsum is that it has a more or less normal distribution of letters as opposed to using content here content here making it look like readable english many desktop publishing packages and web page editors now use lorem ipsum as their default model text and a search for lorem ipsum will uncover many web sites still in their infancy various versions have evolved over the years sometimes by accident sometimes on purpose injected humour and the like '),(54,'field',5,'en_gb',' medium '),(54,'field',6,'en_gb',' center '),(54,'field',8,'en_gb',''),(54,'slug',0,'en_gb',''),(55,'field',4,'en_gb',' it is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout the point of using lorem ipsum is that it has a more or less normal distribution of letters as opposed to using content here content here making it look like readable english many desktop publishing packages and web page editors now use lorem ipsum as their default model text and a search for lorem ipsum will uncover many web sites still in their infancy various versions have evolved over the years sometimes by accident sometimes on purpose injected humour and the like '),(55,'field',5,'en_gb',' medium '),(55,'field',6,'en_gb',' right '),(55,'field',8,'en_gb',''),(55,'slug',0,'en_gb',''),(56,'field',4,'en_gb',' it is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout the point of using lorem ipsum is that it has a more or less normal distribution of letters as opposed to using content here content here making it look like readable english many desktop publishing packages and web page editors now use lorem ipsum as their default model text and a search for lorem ipsum will uncover many web sites still in their infancy various versions have evolved over the years sometimes by accident sometimes on purpose injected humour and the like '),(56,'field',5,'en_gb',' small '),(56,'field',6,'en_gb',' left '),(56,'field',8,'en_gb',''),(56,'slug',0,'en_gb',''),(57,'field',4,'en_gb',' it is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout the point of using lorem ipsum is that it has a more or less normal distribution of letters as opposed to using content here content here making it look like readable english many desktop publishing packages and web page editors now use lorem ipsum as their default model text and a search for lorem ipsum will uncover many web sites still in their infancy various versions have evolved over the years sometimes by accident sometimes on purpose injected humour and the like '),(57,'field',5,'en_gb',' small '),(57,'field',6,'en_gb',' center '),(57,'field',8,'en_gb',''),(57,'slug',0,'en_gb',''),(58,'field',4,'en_gb',' it is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout the point of using lorem ipsum is that it has a more or less normal distribution of letters as opposed to using content here content here making it look like readable english many desktop publishing packages and web page editors now use lorem ipsum as their default model text and a search for lorem ipsum will uncover many web sites still in their infancy various versions have evolved over the years sometimes by accident sometimes on purpose injected humour and the like '),(58,'field',5,'en_gb',' small '),(58,'field',6,'en_gb',' right '),(58,'field',8,'en_gb',''),(58,'slug',0,'en_gb',''),(59,'field',55,'en_gb',' test '),(59,'slug',0,'en_gb',''),(60,'filename',0,'en_gb',' ba web teststories channel4 image 14 jpg '),(60,'extension',0,'en_gb',' jpg '),(60,'kind',0,'en_gb',' image '),(60,'slug',0,'en_gb',' ba web test stories channel4 image 14 '),(60,'title',0,'en_gb',' ba web test stories channel4 image 14 '),(61,'field',38,'en_gb',' brody associates '),(61,'field',39,'en_gb',' test '),(61,'field',53,'en_gb',' y zlqh '),(61,'field',46,'en_gb',' dddddd '),(61,'field',45,'en_gb',' 000000 '),(61,'field',37,'en_gb',''),(61,'field',41,'en_gb',' yeah '),(61,'field',3,'en_gb',' ba web test stories channel4 image 14 0 left large ba web test stories channel4 image 1 ba web test stories channel4 image 10 ba web test stories channel4 image 30 1 center small '),(61,'slug',0,'en_gb',' visuals test '),(61,'title',0,'en_gb',' visuals test '),(62,'field',59,'en_gb',' ba web test stories channel4 image 14 '),(62,'field',60,'en_gb',' large '),(62,'field',61,'en_gb',' left '),(62,'field',62,'en_gb',' 0 '),(62,'slug',0,'en_gb',''),(63,'filename',0,'en_gb',' ba web teststories channel4 image 1 jpg '),(63,'extension',0,'en_gb',' jpg '),(63,'kind',0,'en_gb',' image '),(63,'slug',0,'en_gb',' ba web test stories channel4 image 1 '),(63,'title',0,'en_gb',' ba web test stories channel4 image 1 '),(64,'filename',0,'en_gb',' ba web teststories channel4 image 10 jpg '),(64,'extension',0,'en_gb',' jpg '),(64,'kind',0,'en_gb',' image '),(64,'slug',0,'en_gb',' ba web test stories channel4 image 10 '),(64,'title',0,'en_gb',' ba web test stories channel4 image 10 '),(65,'filename',0,'en_gb',' ba web teststories channel4 image 30 jpg '),(65,'extension',0,'en_gb',' jpg '),(65,'kind',0,'en_gb',' image '),(65,'slug',0,'en_gb',' ba web test stories channel4 image 30 '),(65,'title',0,'en_gb',' ba web test stories channel4 image 30 '),(66,'field',59,'en_gb',' ba web test stories channel4 image 1 ba web test stories channel4 image 10 ba web test stories channel4 image 30 '),(66,'field',60,'en_gb',' small '),(66,'field',61,'en_gb',' center '),(66,'field',62,'en_gb',' 1 '),(66,'slug',0,'en_gb','');
/*!40000 ALTER TABLE `craft_searchindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_sections`
--

DROP TABLE IF EXISTS `craft_sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` enum('single','channel','structure') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'channel',
  `hasUrls` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `template` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enableVersioning` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_sections_name_unq_idx` (`name`),
  UNIQUE KEY `craft_sections_handle_unq_idx` (`handle`),
  KEY `craft_sections_structureId_fk` (`structureId`),
  CONSTRAINT `craft_sections_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `craft_structures` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_sections`
--

LOCK TABLES `craft_sections` WRITE;
/*!40000 ALTER TABLE `craft_sections` DISABLE KEYS */;
INSERT INTO `craft_sections` VALUES (1,NULL,'Homepage','homepage','single',1,'index',1,'2017-08-23 20:18:19','2017-08-23 20:18:19','2245fdcb-d32c-476a-a53f-c5efdcd4579b'),(3,NULL,'Fonts','fonts','channel',1,'fonts/_entry',1,'2017-08-23 20:36:48','2017-08-23 20:36:48','7f83e934-bff7-4901-bbe2-b53350ec3d5b'),(4,NULL,'Projects','projects','channel',0,NULL,1,'2017-08-23 20:37:04','2017-08-30 11:15:07','f026cd3c-c766-4130-b9f5-c3e10fddfe47'),(5,NULL,'Menu','menu','single',1,'menu',1,'2017-08-28 17:22:36','2017-08-28 17:22:36','f23570ac-f3f9-4bd6-92ac-2e2de5faa37f'),(6,NULL,'Contact','contact','single',1,'contact',1,'2017-08-29 16:14:37','2017-08-29 16:14:37','e8827a26-2f9c-4c76-9792-5ab350297000');
/*!40000 ALTER TABLE `craft_sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_sections_i18n`
--

DROP TABLE IF EXISTS `craft_sections_i18n`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_sections_i18n` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `enabledByDefault` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `urlFormat` text COLLATE utf8_unicode_ci,
  `nestedUrlFormat` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_sections_i18n_sectionId_locale_unq_idx` (`sectionId`,`locale`),
  KEY `craft_sections_i18n_locale_fk` (`locale`),
  CONSTRAINT `craft_sections_i18n_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craft_sections_i18n_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_sections_i18n`
--

LOCK TABLES `craft_sections_i18n` WRITE;
/*!40000 ALTER TABLE `craft_sections_i18n` DISABLE KEYS */;
INSERT INTO `craft_sections_i18n` VALUES (1,1,'en_gb',1,'__home__',NULL,'2017-08-23 20:18:19','2017-08-23 20:18:19','2e3a54b9-c0be-438f-b7ff-9ea8a4de86a9'),(3,3,'en_gb',1,'fonts/{slug}',NULL,'2017-08-23 20:36:48','2017-08-23 20:36:48','49c68d98-1138-4314-ba61-b97072d46e85'),(4,4,'en_gb',1,NULL,NULL,'2017-08-23 20:37:04','2017-08-30 11:14:02','f4fc2245-6d87-4196-bfaf-752e6ccc5a8a'),(5,5,'en_gb',1,'menu',NULL,'2017-08-28 17:22:36','2017-08-28 17:22:36','ab1e6806-f2c4-413c-8be4-601cb15be054'),(6,6,'en_gb',1,'contact',NULL,'2017-08-29 16:14:37','2017-08-29 16:14:37','6db99588-ec99-49b8-a669-dbbfe84ed15f');
/*!40000 ALTER TABLE `craft_sections_i18n` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_sessions`
--

DROP TABLE IF EXISTS `craft_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `token` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_sessions_uid_idx` (`uid`),
  KEY `craft_sessions_token_idx` (`token`),
  KEY `craft_sessions_dateUpdated_idx` (`dateUpdated`),
  KEY `craft_sessions_userId_fk` (`userId`),
  CONSTRAINT `craft_sessions_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_sessions`
--

LOCK TABLES `craft_sessions` WRITE;
/*!40000 ALTER TABLE `craft_sessions` DISABLE KEYS */;
INSERT INTO `craft_sessions` VALUES (1,1,'994fb79e4881b610b5ff0ae31adebb2a0b721d10czozMjoiV2ZqQmVXSmwwWWludmJsYm91TTY2N29DRklKZTYxVXUiOw==','2017-08-23 20:18:19','2017-08-23 20:18:19','70cebbe4-0cc5-4ef1-a8b9-1f712af6a1de'),(2,1,'d676420e885f2c7ea779760c3c9ca1acd6eeac5dczozMjoiRVp1Z1A4UTUzcnVlRXFpcXl1bGZhR3J6RjIzRnJ4blgiOw==','2017-08-24 09:23:13','2017-08-24 09:23:13','6829cf51-4192-4eb7-823a-c1a9bcdfde18'),(3,1,'e7808b87dc86a8841bb9de5bd9876e0795a8fc58czozMjoiT0NWOFFmWHVpMUlMNlBjakJUQklVZXVlbjV0MGF1MFQiOw==','2017-08-24 11:42:59','2017-08-24 11:42:59','632bb91e-fcb4-4b30-8a44-a0a15d1987ae'),(4,1,'21720ea041126e1cc9856d7aaf5b2af24ca3170dczozMjoiSUp2SnpIVnVRQXNmemNPWFVMV3hXRzc5enAwdGx4dWEiOw==','2017-08-24 14:49:52','2017-08-24 14:49:52','faedc7fe-8384-4a3c-b335-15c7ebac2064'),(5,1,'62a0e6ab179e6263565cde8f7f388ce1e3d4b558czozMjoib0xSdmtsVGdfeU9ZN3dmM3ZoTl9GRFVtenRyT0VMSTEiOw==','2017-08-25 08:16:16','2017-08-25 08:16:16','9ba6c64d-746c-428e-9c82-87c93ce8de22'),(6,1,'e726296be51ecd03f4d8ef7e7b88927414500bf9czozMjoiaXZOOWVhdGcxZnhHWjF4amhaOFJraVNLT3kzYmpXMlYiOw==','2017-08-25 10:57:18','2017-08-25 10:57:18','b0bb0ddd-a6ed-45e1-967f-829baacd4392'),(7,1,'50d9069e7ec2b8a700aee0ee647493650d248b6dczozMjoiOTNtelBYY0g4blY1OUdPY0MwcWd6NlpEeFFnaldLTW8iOw==','2017-08-25 14:03:06','2017-08-25 14:03:06','0eea21f3-bf4c-4088-9027-97925d1236c6'),(8,1,'065082c25a531f3562e9274f2076ec283ec9a26eczozMjoicFkzWEhqY05JRG0yWn5Lb2VXMmxOQUlzSmZFOFdrcjQiOw==','2017-08-28 13:25:24','2017-08-28 13:25:24','47454375-5c89-46b3-83b4-48b0f0eb53fe'),(9,1,'994f10366d8dc0bd24eda89b6bcec8ea1779d6d7czozMjoiYVB0S2N1bE1XYk5HcEcwVFpVRFJOfnpkcnY3MkE0aTUiOw==','2017-08-29 14:01:55','2017-08-29 14:01:55','a41e831c-4625-43f5-8299-607af54f1865');
/*!40000 ALTER TABLE `craft_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_shunnedmessages`
--

DROP TABLE IF EXISTS `craft_shunnedmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_shunnedmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `message` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_shunnedmessages_userId_message_unq_idx` (`userId`,`message`),
  CONSTRAINT `craft_shunnedmessages_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_shunnedmessages`
--

LOCK TABLES `craft_shunnedmessages` WRITE;
/*!40000 ALTER TABLE `craft_shunnedmessages` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_shunnedmessages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_structureelements`
--

DROP TABLE IF EXISTS `craft_structureelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_structureelements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `elementId` int(11) DEFAULT NULL,
  `root` int(11) unsigned DEFAULT NULL,
  `lft` int(11) unsigned NOT NULL,
  `rgt` int(11) unsigned NOT NULL,
  `level` smallint(6) unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_structureelements_structureId_elementId_unq_idx` (`structureId`,`elementId`),
  KEY `craft_structureelements_root_idx` (`root`),
  KEY `craft_structureelements_lft_idx` (`lft`),
  KEY `craft_structureelements_rgt_idx` (`rgt`),
  KEY `craft_structureelements_level_idx` (`level`),
  KEY `craft_structureelements_elementId_fk` (`elementId`),
  CONSTRAINT `craft_structureelements_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_structureelements_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `craft_structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_structureelements`
--

LOCK TABLES `craft_structureelements` WRITE;
/*!40000 ALTER TABLE `craft_structureelements` DISABLE KEYS */;
INSERT INTO `craft_structureelements` VALUES (1,1,NULL,1,1,12,0,'2017-08-25 11:08:43','2017-08-25 11:08:43','eb594cee-1cbe-4b81-a07d-dc5fb0f6b307'),(2,1,7,1,2,3,1,'2017-08-25 11:08:43','2017-08-25 11:08:43','594fa44b-5208-42e8-86a3-7eb3f3686612'),(3,1,18,1,4,5,1,'2017-08-28 13:47:43','2017-08-28 13:47:43','2ae14d3e-4d23-41ff-97ff-21a40e88fd56'),(4,1,19,1,6,7,1,'2017-08-28 13:47:50','2017-08-28 13:47:50','5bfa3775-9f84-4d28-96a7-1d198659207e'),(5,1,20,1,8,9,1,'2017-08-28 13:48:02','2017-08-28 13:48:02','36e675ed-686f-4a4d-b644-7cef76e42a1c'),(6,1,47,1,10,11,1,'2017-08-30 13:33:03','2017-08-30 13:33:03','da2ac6cb-7d6a-4e24-ac61-d2c8e21dd4ae');
/*!40000 ALTER TABLE `craft_structureelements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_structures`
--

DROP TABLE IF EXISTS `craft_structures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_structures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `maxLevels` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_structures`
--

LOCK TABLES `craft_structures` WRITE;
/*!40000 ALTER TABLE `craft_structures` DISABLE KEYS */;
INSERT INTO `craft_structures` VALUES (1,NULL,'2017-08-24 13:18:13','2017-08-24 13:18:13','7ffc8cec-2eb1-48b3-8d87-323541e2442d');
/*!40000 ALTER TABLE `craft_structures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_systemsettings`
--

DROP TABLE IF EXISTS `craft_systemsettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_systemsettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_systemsettings_category_unq_idx` (`category`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_systemsettings`
--

LOCK TABLES `craft_systemsettings` WRITE;
/*!40000 ALTER TABLE `craft_systemsettings` DISABLE KEYS */;
INSERT INTO `craft_systemsettings` VALUES (1,'email','{\"protocol\":\"php\",\"emailAddress\":\"admin@bong.international\",\"senderName\":\"Brody Associates\"}','2017-08-23 20:18:19','2017-08-23 20:18:19','ca43a23d-ba6d-42ae-a9da-f6ce62bf2bd3');
/*!40000 ALTER TABLE `craft_systemsettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_taggroups`
--

DROP TABLE IF EXISTS `craft_taggroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_taggroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fieldLayoutId` int(10) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_taggroups_name_unq_idx` (`name`),
  UNIQUE KEY `craft_taggroups_handle_unq_idx` (`handle`),
  KEY `craft_taggroups_fieldLayoutId_fk` (`fieldLayoutId`),
  CONSTRAINT `craft_taggroups_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_taggroups`
--

LOCK TABLES `craft_taggroups` WRITE;
/*!40000 ALTER TABLE `craft_taggroups` DISABLE KEYS */;
INSERT INTO `craft_taggroups` VALUES (1,'Default','default',1,'2017-08-23 20:18:19','2017-08-23 20:18:19','bc45986c-de2d-40b0-b73c-99e8fc68e415');
/*!40000 ALTER TABLE `craft_taggroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_tags`
--

DROP TABLE IF EXISTS `craft_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_tags` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_tags_groupId_fk` (`groupId`),
  CONSTRAINT `craft_tags_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_taggroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_tags_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_tags`
--

LOCK TABLES `craft_tags` WRITE;
/*!40000 ALTER TABLE `craft_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_tasks`
--

DROP TABLE IF EXISTS `craft_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_tasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `root` int(11) unsigned DEFAULT NULL,
  `lft` int(11) unsigned NOT NULL,
  `rgt` int(11) unsigned NOT NULL,
  `level` smallint(6) unsigned NOT NULL,
  `currentStep` int(11) unsigned DEFAULT NULL,
  `totalSteps` int(11) unsigned DEFAULT NULL,
  `status` enum('pending','error','running') COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `settings` mediumtext COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_tasks_root_idx` (`root`),
  KEY `craft_tasks_lft_idx` (`lft`),
  KEY `craft_tasks_rgt_idx` (`rgt`),
  KEY `craft_tasks_level_idx` (`level`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_tasks`
--

LOCK TABLES `craft_tasks` WRITE;
/*!40000 ALTER TABLE `craft_tasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_templatecachecriteria`
--

DROP TABLE IF EXISTS `craft_templatecachecriteria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_templatecachecriteria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cacheId` int(11) NOT NULL,
  `type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `criteria` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `craft_templatecachecriteria_cacheId_fk` (`cacheId`),
  KEY `craft_templatecachecriteria_type_idx` (`type`),
  CONSTRAINT `craft_templatecachecriteria_cacheId_fk` FOREIGN KEY (`cacheId`) REFERENCES `craft_templatecaches` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_templatecachecriteria`
--

LOCK TABLES `craft_templatecachecriteria` WRITE;
/*!40000 ALTER TABLE `craft_templatecachecriteria` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_templatecachecriteria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_templatecacheelements`
--

DROP TABLE IF EXISTS `craft_templatecacheelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_templatecacheelements` (
  `cacheId` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  KEY `craft_templatecacheelements_cacheId_fk` (`cacheId`),
  KEY `craft_templatecacheelements_elementId_fk` (`elementId`),
  CONSTRAINT `craft_templatecacheelements_cacheId_fk` FOREIGN KEY (`cacheId`) REFERENCES `craft_templatecaches` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_templatecacheelements_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_templatecacheelements`
--

LOCK TABLES `craft_templatecacheelements` WRITE;
/*!40000 ALTER TABLE `craft_templatecacheelements` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_templatecacheelements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_templatecaches`
--

DROP TABLE IF EXISTS `craft_templatecaches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_templatecaches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cacheKey` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `body` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `craft_templatecaches_expiryDate_cacheKey_locale_path_idx` (`expiryDate`,`cacheKey`,`locale`,`path`),
  KEY `craft_templatecaches_locale_fk` (`locale`),
  CONSTRAINT `craft_templatecaches_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_templatecaches`
--

LOCK TABLES `craft_templatecaches` WRITE;
/*!40000 ALTER TABLE `craft_templatecaches` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_templatecaches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_tokens`
--

DROP TABLE IF EXISTS `craft_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` char(32) COLLATE utf8_unicode_ci NOT NULL,
  `route` text COLLATE utf8_unicode_ci,
  `usageLimit` tinyint(3) unsigned DEFAULT NULL,
  `usageCount` tinyint(3) unsigned DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_tokens_token_unq_idx` (`token`),
  KEY `craft_tokens_expiryDate_idx` (`expiryDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_tokens`
--

LOCK TABLES `craft_tokens` WRITE;
/*!40000 ALTER TABLE `craft_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_usergroups`
--

DROP TABLE IF EXISTS `craft_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_usergroups_name_unq_idx` (`name`),
  UNIQUE KEY `craft_usergroups_handle_unq_idx` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_usergroups`
--

LOCK TABLES `craft_usergroups` WRITE;
/*!40000 ALTER TABLE `craft_usergroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_usergroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_usergroups_users`
--

DROP TABLE IF EXISTS `craft_usergroups_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_usergroups_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_usergroups_users_groupId_userId_unq_idx` (`groupId`,`userId`),
  KEY `craft_usergroups_users_userId_fk` (`userId`),
  CONSTRAINT `craft_usergroups_users_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_usergroups_users_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_usergroups_users`
--

LOCK TABLES `craft_usergroups_users` WRITE;
/*!40000 ALTER TABLE `craft_usergroups_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_usergroups_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_userpermissions`
--

DROP TABLE IF EXISTS `craft_userpermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_userpermissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_userpermissions_name_unq_idx` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_userpermissions`
--

LOCK TABLES `craft_userpermissions` WRITE;
/*!40000 ALTER TABLE `craft_userpermissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_userpermissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_userpermissions_usergroups`
--

DROP TABLE IF EXISTS `craft_userpermissions_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_userpermissions_usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_userpermissions_usergroups_permissionId_groupId_unq_idx` (`permissionId`,`groupId`),
  KEY `craft_userpermissions_usergroups_groupId_fk` (`groupId`),
  CONSTRAINT `craft_userpermissions_usergroups_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_userpermissions_usergroups_permissionId_fk` FOREIGN KEY (`permissionId`) REFERENCES `craft_userpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_userpermissions_usergroups`
--

LOCK TABLES `craft_userpermissions_usergroups` WRITE;
/*!40000 ALTER TABLE `craft_userpermissions_usergroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_userpermissions_usergroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_userpermissions_users`
--

DROP TABLE IF EXISTS `craft_userpermissions_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_userpermissions_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_userpermissions_users_permissionId_userId_unq_idx` (`permissionId`,`userId`),
  KEY `craft_userpermissions_users_userId_fk` (`userId`),
  CONSTRAINT `craft_userpermissions_users_permissionId_fk` FOREIGN KEY (`permissionId`) REFERENCES `craft_userpermissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_userpermissions_users_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_userpermissions_users`
--

LOCK TABLES `craft_userpermissions_users` WRITE;
/*!40000 ALTER TABLE `craft_userpermissions_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_userpermissions_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_users`
--

DROP TABLE IF EXISTS `craft_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `photo` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `firstName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `preferredLocale` char(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `weekStartDay` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `admin` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `client` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `locked` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `suspended` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `pending` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `archived` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIPAddress` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint(4) unsigned DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `verificationCode` char(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `passwordResetRequired` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_users_username_unq_idx` (`username`),
  UNIQUE KEY `craft_users_email_unq_idx` (`email`),
  KEY `craft_users_verificationCode_idx` (`verificationCode`),
  KEY `craft_users_uid_idx` (`uid`),
  KEY `craft_users_preferredLocale_fk` (`preferredLocale`),
  CONSTRAINT `craft_users_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_users_preferredLocale_fk` FOREIGN KEY (`preferredLocale`) REFERENCES `craft_locales` (`locale`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_users`
--

LOCK TABLES `craft_users` WRITE;
/*!40000 ALTER TABLE `craft_users` DISABLE KEYS */;
INSERT INTO `craft_users` VALUES (1,'admin',NULL,NULL,NULL,'admin@bong.international','$2y$13$NQVHW2QmLxbcdOEpNH1az.K43W3UCvHWHq/xpVfLwDzJwSBKNaOfa',NULL,0,1,0,0,0,0,0,'2017-08-30 08:36:19','82.170.233.246',NULL,NULL,'2017-08-30 08:36:04',NULL,NULL,NULL,NULL,0,'2017-08-23 20:18:17','2017-08-23 20:18:18','2017-08-30 08:36:19','7a41ac0e-c0df-4228-85d2-b7caa7435e1e');
/*!40000 ALTER TABLE `craft_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_widgets`
--

DROP TABLE IF EXISTS `craft_widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_widgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `colspan` tinyint(4) unsigned DEFAULT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_widgets_userId_fk` (`userId`),
  CONSTRAINT `craft_widgets_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_widgets`
--

LOCK TABLES `craft_widgets` WRITE;
/*!40000 ALTER TABLE `craft_widgets` DISABLE KEYS */;
INSERT INTO `craft_widgets` VALUES (1,1,'RecentEntries',1,NULL,NULL,1,'2017-08-23 20:20:04','2017-08-23 20:20:04','b6c654a8-345f-41ed-82cf-4b429ef0436f'),(2,1,'GetHelp',2,NULL,NULL,1,'2017-08-23 20:20:04','2017-08-23 20:20:04','00c7d888-65fe-486d-82b7-856e116016fd'),(3,1,'Updates',3,NULL,NULL,1,'2017-08-23 20:20:04','2017-08-23 20:20:04','9f640fa1-bd1d-4d03-a88d-5d93a2e3e22c'),(4,1,'Feed',4,NULL,'{\"url\":\"https:\\/\\/craftcms.com\\/news.rss\",\"title\":\"Craft News\"}',1,'2017-08-23 20:20:04','2017-08-23 20:20:04','c76d9fdc-15a3-479c-be9b-4d18747ce294');
/*!40000 ALTER TABLE `craft_widgets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-08-30 16:00:30
