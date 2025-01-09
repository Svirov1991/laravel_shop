-- MySQL dump 10.13  Distrib 8.0.40, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: laravel
-- ------------------------------------------------------
-- Server version	8.4.3

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `attribute_values`
--

DROP TABLE IF EXISTS `attribute_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attribute_values` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `attribute_id` bigint unsigned NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `attribute_values_attribute_id_foreign` (`attribute_id`),
  CONSTRAINT `attribute_values_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_values`
--

LOCK TABLES `attribute_values` WRITE;
/*!40000 ALTER TABLE `attribute_values` DISABLE KEYS */;
INSERT INTO `attribute_values` VALUES (6,3,'Нюд'),(7,3,'Білий'),(8,3,'Блакитний'),(9,3,'Капучино'),(10,3,'Леопард'),(11,3,'Молочний'),(12,3,'Морська хвиля'),(13,3,'Пудра'),(14,3,'Фуксія'),(15,3,'Червоний'),(16,3,'Чорний'),(17,3,'Чорний у цятку'),(18,4,'70A'),(19,4,'70B'),(20,4,'70C'),(21,4,'70D'),(22,4,'75A'),(23,4,'75B'),(24,4,'75C'),(25,4,'75D'),(26,4,'80A'),(27,4,'80B'),(28,4,'80C'),(29,4,'80D'),(30,4,'85A'),(31,4,'85B'),(32,4,'85C'),(33,4,'85D'),(34,4,'L'),(35,4,'M'),(36,4,'M-L'),(37,4,'S'),(38,4,'XS-S'),(39,4,'XS-S M-L'),(40,4,'пошиття за індивідуальними мірками'),(41,5,'стрінги на регуляторах'),(42,5,'класичні стрінги'),(43,5,'бразиляна'),(44,4,'one size'),(45,3,'зелений неон');
/*!40000 ALTER TABLE `attribute_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attributes`
--

DROP TABLE IF EXISTS `attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attributes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prime` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attributes`
--

LOCK TABLES `attributes` WRITE;
/*!40000 ALTER TABLE `attributes` DISABLE KEYS */;
INSERT INTO `attributes` VALUES (3,'Колір',0),(4,'Розмір',1),(5,'Модель трусиків',0);
/*!40000 ALTER TABLE `attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int unsigned DEFAULT NULL,
  `order` int NOT NULL DEFAULT '1',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`),
  KEY `categories_parent_id_foreign` (`parent_id`),
  CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,NULL,1,'Blog','blog','2024-10-16 13:30:55','2024-12-09 15:03:46');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currencies`
--

DROP TABLE IF EXISTS `currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `currencies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` decimal(10,4) NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `currencies_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currencies`
--

LOCK TABLES `currencies` WRITE;
/*!40000 ALTER TABLE `currencies` DISABLE KEYS */;
INSERT INTO `currencies` VALUES (1,'UAH','₴',1.0000,1,1,'2024-12-11 17:51:00','2025-01-03 17:25:29'),(2,'USD','$',41.9000,0,1,'2024-12-11 17:51:00','2025-01-03 17:33:36'),(3,'EUR','€',44.3500,0,0,'2024-12-11 20:39:00','2025-01-03 17:25:23');
/*!40000 ALTER TABLE `currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_rows`
--

DROP TABLE IF EXISTS `data_rows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_rows` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `data_type_id` int unsigned NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text COLLATE utf8mb4_unicode_ci,
  `order` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `data_rows_data_type_id_foreign` (`data_type_id`),
  CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_rows`
--

LOCK TABLES `data_rows` WRITE;
/*!40000 ALTER TABLE `data_rows` DISABLE KEYS */;
INSERT INTO `data_rows` VALUES (1,1,'id','number','ID',1,0,0,0,0,0,NULL,1),(2,1,'name','text','Name',1,1,1,1,1,1,NULL,2),(3,1,'email','text','Email',1,1,1,1,1,1,NULL,3),(4,1,'password','password','Password',1,0,0,1,1,0,NULL,4),(5,1,'remember_token','text','Remember Token',0,0,0,0,0,0,NULL,5),(6,1,'created_at','timestamp','Created At',0,1,1,0,0,0,NULL,6),(7,1,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,7),(8,1,'avatar','image','Avatar',0,1,1,1,1,1,NULL,8),(9,1,'user_belongsto_role_relationship','relationship','Role',0,1,1,1,1,0,'{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":0}',10),(10,1,'user_belongstomany_role_relationship','relationship','Roles',0,1,1,1,1,0,'{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}',11),(11,1,'settings','hidden','Settings',0,0,0,0,0,0,NULL,12),(12,2,'id','number','ID',1,0,0,0,0,0,NULL,1),(13,2,'name','text','Name',1,1,1,1,1,1,NULL,2),(14,2,'created_at','timestamp','Created At',0,0,0,0,0,0,NULL,3),(15,2,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,4),(16,3,'id','number','ID',1,0,0,0,0,0,NULL,1),(17,3,'name','text','Name',1,1,1,1,1,1,NULL,2),(18,3,'created_at','timestamp','Created At',0,0,0,0,0,0,NULL,3),(19,3,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,4),(20,3,'display_name','text','Display Name',1,1,1,1,1,1,NULL,5),(21,1,'role_id','text','Role',1,1,1,1,1,1,NULL,9),(22,4,'id','number','ID',1,0,0,0,0,0,'{}',1),(23,4,'parent_id','select_dropdown','Parent',0,0,1,1,1,1,'{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}',2),(24,4,'order','text','Order',1,1,1,1,1,1,'{\"default\":1}',3),(25,4,'name','text','Name',1,1,1,1,1,1,'{}',4),(26,4,'slug','text','Slug',1,1,1,1,1,1,'{\"slugify\":{\"origin\":\"name\"}}',5),(27,4,'created_at','timestamp','Created At',0,0,1,0,0,0,'{}',6),(28,4,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',7),(29,5,'id','number','ID',1,0,0,0,0,0,'{}',1),(30,5,'author_id','text','Author',1,0,1,1,0,1,'{}',2),(31,5,'category_id','text','Category',0,0,1,1,1,0,'{}',3),(32,5,'title','text','Title',1,1,1,1,1,1,'{}',4),(33,5,'excerpt','text_area','Excerpt',0,0,1,1,1,1,'{}',5),(34,5,'body','rich_text_box','Body',1,0,1,1,1,1,'{}',6),(35,5,'image','image','Post Image',0,1,1,1,1,1,'{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}',7),(36,5,'slug','text','Slug',1,0,1,1,1,1,'{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:posts,slug\"}}',8),(39,5,'status','select_dropdown','Status',1,1,1,1,1,1,'{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}',11),(40,5,'created_at','timestamp','Created At',0,1,1,0,0,0,'{}',12),(41,5,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',13),(43,5,'featured','checkbox','Featured',1,1,1,1,1,1,'{}',15),(44,6,'id','number','ID',1,0,0,0,0,0,NULL,1),(45,6,'author_id','text','Author',1,0,0,0,0,0,NULL,2),(46,6,'title','text','Title',1,1,1,1,1,1,NULL,3),(47,6,'excerpt','text_area','Excerpt',1,0,1,1,1,1,NULL,4),(48,6,'body','rich_text_box','Body',1,0,1,1,1,1,NULL,5),(49,6,'slug','text','Slug',1,0,1,1,1,1,'{\"slugify\":{\"origin\":\"title\"},\"validation\":{\"rule\":\"unique:pages,slug\"}}',6),(52,6,'status','select_dropdown','Status',1,1,1,1,1,1,'{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\"}}',9),(53,6,'created_at','timestamp','Created At',1,1,1,0,0,0,NULL,10),(54,6,'updated_at','timestamp','Updated At',1,0,0,0,0,0,NULL,11),(55,6,'image','image','Page Image',0,1,1,1,1,1,NULL,12),(56,9,'id','text','Id',1,0,0,0,0,0,'{}',1),(57,9,'title','text','Title',1,1,1,1,1,1,'{\"display\":{\"width\":\"10\"}}',2),(58,9,'slug','text','Slug',1,1,1,1,1,1,'{\"slugify\":{\"origin\":\"title\"},\"validation\":{\"rule\":\"unique:product_categories,slug\"}}',4),(59,9,'description','markdown_editor','Description',0,1,1,1,1,1,'{}',5),(60,9,'created_at','timestamp','Created At',0,1,1,1,0,1,'{}',7),(61,9,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',8),(80,13,'id','text','Id',1,0,0,0,0,0,'{}',1),(81,13,'name','text','Name',1,1,1,1,1,1,'{}',2),(82,15,'id','text','Id',1,0,0,0,0,0,'{}',1),(83,15,'attribute_id','select_dropdown','Attribute',1,0,1,1,1,1,'{\"display\":{\"width\":\"4\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\",\"table\":\"attributes\"}}',3),(84,15,'value','text','Value',1,1,1,1,1,1,'{\"display\":{\"width\":\"8\"}}',4),(86,15,'attribute_value_hasone_attribute_relationship','relationship','Attribute',0,1,0,0,0,0,'{\"model\":\"App\\\\Models\\\\Attribute\",\"table\":\"attributes\",\"type\":\"hasOne\",\"column\":\"id\",\"key\":\"attribute_id\",\"label\":\"name\",\"pivot_table\":\"attribute_values\",\"pivot\":\"0\",\"taggable\":\"0\"}',2),(87,17,'id','text','Id',1,0,0,0,0,0,'{}',1),(88,17,'title','text','Title',1,1,1,1,1,1,'{}',2),(89,17,'description','rich_text_box','Description',0,0,1,1,1,1,'{}',3),(90,17,'image','media_picker','Image',1,1,1,1,1,1,'{}',6),(91,17,'created_at','timestamp','Created At',0,0,1,1,0,1,'{}',7),(92,17,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',8),(93,9,'image','media_picker','Image',0,1,1,1,1,1,'{}',6),(95,18,'id','text','Id',1,1,0,0,0,0,'{}',1),(96,18,'cart','text','Cart',0,0,1,1,0,1,'{}',3),(97,18,'total_price','text','Total Price',0,1,1,1,0,1,'{}',4),(98,18,'first_name','text','First Name',0,1,1,1,0,1,'{}',6),(99,18,'last_name','text','Last Name',0,1,1,1,1,1,'{}',7),(100,18,'phone','text','Phone',1,1,1,1,0,1,'{}',8),(101,18,'email','text','Email',0,0,1,1,0,1,'{}',9),(102,18,'settlement_code','text','Settlement Code',0,0,1,1,0,1,'{}',10),(103,18,'settlement','text','Settlement',0,0,1,1,0,1,'{}',11),(104,18,'office_code','text','Office Code',0,0,1,1,0,1,'{}',12),(105,18,'office','text','Office',0,0,1,1,0,1,'{}',13),(106,18,'created_at','timestamp','Created At',0,0,1,0,0,1,'{}',14),(107,18,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',15),(110,19,'id','text','Id',1,0,0,0,0,0,'{}',1),(111,19,'code','text','Code',1,1,1,1,1,1,'{}',2),(112,19,'symbol','text','Symbol',1,1,1,1,1,1,'{}',3),(113,19,'rate','text','Rate',1,1,1,1,1,1,'{}',4),(114,19,'is_default','checkbox','Is Default',1,1,1,1,1,1,'{}',5),(115,19,'created_at','timestamp','Created At',0,1,1,1,0,1,'{}',7),(116,19,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',8),(117,18,'currency','text','Currency',0,1,1,1,1,1,'{}',5),(119,17,'button_link','text','Button Link',0,1,1,1,1,1,'{\"display\":{\"width\":\"6\"}}',5),(120,17,'button_text','text','Button Text',0,0,1,1,1,1,'{\"display\":{\"width\":\"6\"}}',4),(124,9,'featured','checkbox','Избранное',1,1,1,1,1,1,'{\"display\":{\"width\":\"2\"}}',3),(125,21,'id','text','Id',1,0,0,0,0,0,'{}',1),(126,21,'title','text','Title',1,1,1,1,1,1,'{\"display\":{\"width\":\"5\"}}',2),(127,21,'slug','text','Slug',1,0,1,1,1,1,'{\"display\":{\"width\":\"5\"},\"slugify\":{\"origin\":\"title\"},\"validation\":{\"rule\":\"unique:products,slug\"}}',3),(128,21,'description','rich_text_box','Description',0,0,1,1,1,1,'{}',14),(129,21,'full_description','rich_text_box','Full Description',0,0,1,1,1,1,'{}',15),(130,21,'size_chart','rich_text_box','Size Chart',0,0,1,1,1,1,'{}',16),(131,21,'images','media_picker','Images',0,0,1,1,1,1,'{\"max\":10,\"min\":1,\"expanded\":true,\"show_folders\":true,\"show_toolbar\":true,\"allow_upload\":true,\"allow_move\":true,\"allow_delete\":true,\"allow_create_folder\":true,\"allow_rename\":true,\"allow_crop\":true,\"allowed\":[],\"quality\":100,\"base_path\":\"\\/products\\/{pk}\\/\",\"thumbnails\":[{\"type\":\"resize\",\"name\":\"resize-300\",\"width\":300,\"upsize\":false},{\"type\":\"resize\",\"name\":\"resize-500\",\"width\":500,\"upsize\":false},{\"type\":\"resize\",\"name\":\"resize-800\",\"width\":800,\"upsize\":false},{\"type\":\"resize\",\"name\":\"resize-1200\",\"width\":1200,\"upsize\":false}]}',13),(132,21,'article','text','Article',0,0,1,1,1,1,'{\"display\":{\"width\":\"2\"}}',12),(133,21,'price','number','Price',1,1,1,1,1,1,'{\"display\":{\"width\":\"2\"}}',5),(134,21,'discount_price','number','Discount Price',0,1,1,1,1,1,'{\"display\":{\"width\":\"2\"}}',6),(135,21,'currency_id','select_dropdown','Currency Id',0,0,1,1,1,1,'{\"display\":{\"width\":\"2\"},\"relationship\":{\"key\":\"id\",\"label\":\"code\",\"table\":\"curencies\"}}',7),(136,21,'rating','number','Rating',0,0,1,1,1,1,'{\"display\":{\"width\":\"6\"}}',17),(137,21,'number_of_ratings','number','Number Of Ratings',0,0,1,1,1,1,'{\"display\":{\"width\":\"6\"}}',18),(138,21,'product_category_id','select_dropdown','Product Category Id',0,0,1,1,1,1,'{\"display\":{\"width\":\"2\"},\"relationship\":{\"key\":\"id\",\"label\":\"title\",\"table\":\"product_categories\"}}',4),(139,21,'status','select_dropdown','Status',1,1,1,1,1,1,'{\"display\":{\"width\":\"2\"},\"options\":{\"PUBLISHED\":\"PUBLISHED\",\"NOT_AVAILABLE\":\"NOT AVAILABLE\",\"DRAFT\":\"DRAFT\"}}',11),(140,21,'featured','checkbox','Featured',1,0,1,1,1,1,'{\"display\":{\"width\":\"1\"}}',9),(141,21,'new','checkbox','New',1,0,1,1,1,1,'{\"display\":{\"width\":\"1\"}}',10),(142,21,'created_at','timestamp','Created At',0,0,1,1,0,1,'{}',19),(143,21,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',20),(144,21,'product_hasone_currency_relationship','relationship','currencies',0,1,0,0,0,0,'{\"model\":\"App\\\\Models\\\\Currency\",\"table\":\"currencies\",\"type\":\"hasOne\",\"column\":\"id\",\"key\":\"currency_id\",\"label\":\"code\",\"pivot_table\":\"attribute_values\",\"pivot\":\"0\",\"taggable\":\"0\"}',8),(145,21,'product_hasone_product_category_relationship','relationship','product_categories',0,1,0,0,0,0,'{\"model\":\"App\\\\Models\\\\ProductCategory\",\"table\":\"product_categories\",\"type\":\"hasOne\",\"column\":\"id\",\"key\":\"product_category_id\",\"label\":\"title\",\"pivot_table\":\"attribute_values\",\"pivot\":\"0\",\"taggable\":\"0\"}',21),(147,21,'image_thumbnails','text','Image Thumbnails',0,0,0,0,0,0,'{}',10),(148,22,'id','text','Id',1,0,0,0,0,0,'{}',1),(149,22,'type','text','Type',1,1,1,1,1,1,'{}',2),(150,22,'first_name','text','First Name',0,1,1,1,1,1,'{}',3),(151,22,'last_name','text','Last Name',0,1,1,1,1,1,'{}',4),(152,22,'phone','text','Phone',0,1,1,1,1,1,'{}',5),(153,22,'email','text','Email',0,1,1,1,1,1,'{}',6),(154,22,'message','text_area','Message',0,0,1,1,1,1,'{}',7),(155,22,'data','text','Data',0,0,1,1,1,1,'{}',8),(156,22,'created_at','timestamp','Created At',0,1,1,1,0,1,'{}',9),(157,22,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',10),(158,13,'prime','checkbox','Prime',1,1,1,1,1,1,'{}',3),(159,19,'active','checkbox','Active',1,1,1,1,1,1,'{}',6),(160,18,'status','select_dropdown','Status',1,1,1,1,1,1,'{\"options\":{\"NEW\":\"NEW\",\"IN_PROCESSING\":\"IN_PROCESSING\",\"CLOSED\":\"CLOSED\",\"COMPLETED\":\"COMPLETED\"}}',2);
/*!40000 ALTER TABLE `data_rows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_types`
--

DROP TABLE IF EXISTS `data_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint NOT NULL DEFAULT '0',
  `details` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `data_types_name_unique` (`name`),
  UNIQUE KEY `data_types_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_types`
--

LOCK TABLES `data_types` WRITE;
/*!40000 ALTER TABLE `data_types` DISABLE KEYS */;
INSERT INTO `data_types` VALUES (1,'users','users','User','Users','voyager-person','TCG\\Voyager\\Models\\User','TCG\\Voyager\\Policies\\UserPolicy','TCG\\Voyager\\Http\\Controllers\\VoyagerUserController','',1,0,NULL,'2024-10-16 13:30:55','2024-10-16 13:30:55'),(2,'menus','menus','Menu','Menus','voyager-list','TCG\\Voyager\\Models\\Menu',NULL,'','',1,0,NULL,'2024-10-16 13:30:55','2024-10-16 13:30:55'),(3,'roles','roles','Role','Roles','voyager-lock','TCG\\Voyager\\Models\\Role',NULL,'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController','',1,0,NULL,'2024-10-16 13:30:55','2024-10-16 13:30:55'),(4,'categories','categories','Category','Categories','voyager-categories','App\\Models\\Category',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}','2024-10-16 13:30:55','2024-12-10 14:31:17'),(5,'posts','posts','Post','Posts','voyager-news','App\\Models\\Post','TCG\\Voyager\\Policies\\PostPolicy',NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}','2024-10-16 13:30:55','2024-12-06 13:46:13'),(6,'pages','pages','Page','Pages','voyager-file-text','App\\Models\\Page',NULL,'','',1,0,NULL,'2024-10-16 13:30:55','2024-10-16 13:30:55'),(9,'product_categories','product-categories','Product Category','Product Categories',NULL,'App\\Models\\ProductCategory',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}','2024-10-16 14:14:27','2024-12-17 11:05:49'),(13,'attributes','attributes','Attribute','Attributes',NULL,'App\\Models\\Attribute',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}','2024-10-16 14:19:22','2024-12-23 17:37:49'),(15,'attribute_values','attribute-values','Attribute Value','Attribute Values',NULL,'App\\Models\\AttributeValue',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}','2024-10-16 14:21:31','2024-10-23 14:39:23'),(16,'main_banner','main-banner','Main Banner','Main Banners',NULL,'App\\Models\\MainBanner',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}','2024-10-29 14:47:13','2024-10-29 14:47:13'),(17,'main_banners','main-banners','Main Banner','Main Banners',NULL,'App\\Models\\MainBanner',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}','2024-10-29 15:01:15','2024-12-16 20:46:31'),(18,'orders','orders','Order','Orders',NULL,'App\\Models\\Order',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}','2024-11-28 12:46:04','2025-01-05 15:46:02'),(19,'currencies','currencies','Currency','Currencies',NULL,'App\\Models\\Currency',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}','2024-12-11 20:38:40','2025-01-03 17:24:40'),(21,'products','products','Product','Products',NULL,'App\\Models\\Product',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}','2024-12-17 22:41:30','2025-01-07 12:10:57'),(22,'messages','messages','Message','Messages','voyager-file-text','App\\Models\\Message',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}','2024-12-19 13:24:19','2024-12-19 13:37:21');
/*!40000 ALTER TABLE `data_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_banners`
--

DROP TABLE IF EXISTS `main_banners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_banners` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `button_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `button_text` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_banners`
--

LOCK TABLES `main_banners` WRITE;
/*!40000 ALTER TABLE `main_banners` DISABLE KEYS */;
INSERT INTO `main_banners` VALUES (1,'Slide 2','<h4>Sub title slide 2</h4>\r\n<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.</p>','/category-2','Read more','main-banners/slider-01.jpg','2024-10-29 15:02:00','2025-01-08 15:19:51'),(2,'Slide 1','<h4>Sub title slide 1</h4>\r\n<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.</p>','/category-1','Read more','main-banners/slider-01.jpg','2024-10-29 15:03:00','2025-01-08 15:19:30');
/*!40000 ALTER TABLE `main_banners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_items`
--

DROP TABLE IF EXISTS `menu_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int unsigned DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `order` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `menu_items_menu_id_foreign` (`menu_id`),
  CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_items`
--

LOCK TABLES `menu_items` WRITE;
/*!40000 ALTER TABLE `menu_items` DISABLE KEYS */;
INSERT INTO `menu_items` VALUES (1,1,'Dashboard','','_self','voyager-boat',NULL,NULL,1,'2024-10-16 13:30:55','2024-10-16 13:30:55','voyager.dashboard',NULL),(2,1,'Media','','_self','voyager-images',NULL,NULL,11,'2024-10-16 13:30:55','2025-01-08 15:41:10','voyager.media.index',NULL),(3,1,'Users','','_self','voyager-person',NULL,NULL,10,'2024-10-16 13:30:55','2025-01-08 15:41:10','voyager.users.index',NULL),(4,1,'Roles','','_self','voyager-lock',NULL,NULL,9,'2024-10-16 13:30:55','2025-01-08 15:41:10','voyager.roles.index',NULL),(5,1,'Tools','','_self','voyager-tools',NULL,NULL,12,'2024-10-16 13:30:55','2025-01-08 15:41:10',NULL,NULL),(6,1,'Menu Builder','','_self','voyager-list',NULL,5,1,'2024-10-16 13:30:55','2024-10-17 12:34:18','voyager.menus.index',NULL),(7,1,'Database','','_self','voyager-data',NULL,5,2,'2024-10-16 13:30:55','2024-10-17 12:34:18','voyager.database.index',NULL),(8,1,'Compass','','_self','voyager-compass',NULL,5,3,'2024-10-16 13:30:55','2024-10-17 12:34:18','voyager.compass.index',NULL),(9,1,'BREAD','','_self','voyager-bread',NULL,5,4,'2024-10-16 13:30:55','2024-10-17 12:34:18','voyager.bread.index',NULL),(10,1,'Settings','','_self','voyager-settings',NULL,NULL,13,'2024-10-16 13:30:55','2025-01-08 15:41:10','voyager.settings.index',NULL),(11,1,'Categories','','_self','voyager-categories',NULL,NULL,6,'2024-10-16 13:30:55','2025-01-08 15:41:04','voyager.categories.index',NULL),(12,1,'Posts','','_self','voyager-news',NULL,NULL,4,'2024-10-16 13:30:55','2025-01-08 15:41:04','voyager.posts.index',NULL),(13,1,'Pages','','_self','voyager-file-text',NULL,NULL,5,'2024-10-16 13:30:55','2025-01-08 15:41:04','voyager.pages.index',NULL),(14,1,'Product Categories','','_self','voyager-folder','#000000',18,2,'2024-10-16 14:14:27','2024-10-17 12:37:43','voyager.product-categories.index','null'),(16,1,'Attributes','','_self','voyager-list-add','#000000',18,3,'2024-10-16 14:19:22','2024-10-17 12:38:02','voyager.attributes.index','null'),(17,1,'Attribute Values','','_self','voyager-data','#000000',18,4,'2024-10-16 14:21:31','2024-10-17 12:38:14','voyager.attribute-values.index','null'),(18,1,'Shop','','_self','voyager-basket','#000000',NULL,2,'2024-10-17 12:34:03','2024-10-17 12:36:34',NULL,''),(23,1,'Main Banners','','_self','voyager-photos','#000000',NULL,3,'2024-10-29 15:01:16','2025-01-08 15:41:01','voyager.main-banners.index','null'),(25,3,'Комплекти','','_self',NULL,'#000000',36,1,'2024-11-08 13:09:08','2024-12-16 22:15:22','handle-slug','{\"slug\" : \"komplektu\"}'),(26,3,'Боді','','_self',NULL,'#000000',36,2,'2024-11-08 13:09:58','2024-12-16 22:15:22','handle-slug','{\"slug\": \"bodi\"}'),(27,3,'Доставка та оплата','/dostavka-ta-oplata','_self',NULL,'#000000',NULL,3,'2024-11-08 13:10:16','2024-12-16 22:15:10',NULL,''),(29,1,'Odreds','','_self','voyager-buy','#000000',18,5,'2024-11-28 12:46:51','2024-12-02 11:05:05','voyager.orders.index','null'),(30,3,'Статті','','_self',NULL,'#000000',NULL,5,'2024-11-29 11:57:44','2024-12-16 22:15:10','handle-slug','{\"slug\": \"blog\"}'),(32,1,'Currencies','','_self','voyager-credit-card','#000000',NULL,8,'2024-12-11 20:38:40','2025-01-08 15:41:10','voyager.currencies.index','null'),(33,3,'Новинки','/new-products','_self',NULL,'#000000',NULL,2,'2024-12-16 21:39:36','2024-12-16 22:15:10',NULL,''),(35,3,'Піжами та сорочки','','_self',NULL,'#000000',36,3,'2024-12-16 22:03:55','2024-12-16 22:15:22','handle-slug','{\"slug\": \"nichni-sorochki-pizhami\"}'),(36,3,'Товари','#','_self',NULL,'#000000',NULL,1,'2024-12-16 22:15:04','2024-12-16 22:15:08',NULL,''),(37,4,'Комплекти','','_self',NULL,'#000000',NULL,13,'2024-12-17 11:29:38','2024-12-17 11:29:38','handle-slug','{\"slug\": \"komplektu\"}'),(38,4,'Боді','','_self',NULL,'#000000',NULL,14,'2024-12-17 11:30:02','2024-12-17 11:30:02','handle-slug','{\"slug\": \"bodi\"}'),(39,4,'Піжами та сорочки','','_self',NULL,'#000000',NULL,15,'2024-12-17 11:30:21','2024-12-17 11:30:21','handle-slug','{\"slug\": \"nichni-sorochki-pizhami\"}'),(40,5,'Контакты','/contacts','_self',NULL,'#000000',NULL,16,'2024-12-17 11:40:13','2024-12-17 11:40:13',NULL,''),(41,5,'Доставка и оплата','/dostavka-ta-oplata','_self',NULL,'#000000',NULL,17,'2024-12-17 11:40:36','2024-12-17 11:40:36',NULL,''),(42,5,'Статьи','','_self',NULL,'#000000',NULL,18,'2024-12-17 11:41:13','2024-12-17 11:41:13','handle-slug','{\"slug\": \"blog\"}'),(48,1,'voyager::seeders.menu_items.menu_builder','','_self','voyager-list',NULL,47,10,'2024-12-17 19:52:39','2024-12-17 19:52:39','voyager.menus.index',NULL),(49,1,'voyager::seeders.menu_items.database','','_self','voyager-data',NULL,47,11,'2024-12-17 19:52:39','2024-12-17 19:52:39','voyager.database.index',NULL),(50,1,'voyager::seeders.menu_items.compass','','_self','voyager-compass',NULL,47,12,'2024-12-17 19:52:39','2024-12-17 19:52:39','voyager.compass.index',NULL),(51,1,'voyager::seeders.menu_items.bread','','_self','voyager-bread',NULL,47,13,'2024-12-17 19:52:39','2024-12-17 19:52:39','voyager.bread.index',NULL),(53,1,'Products','','_self','voyager-bag','#000000',18,1,'2024-12-17 22:41:30','2024-12-17 23:13:55','voyager.products.index','null'),(54,1,'Messages','','_self','voyager-file-text','#000000',NULL,7,'2024-12-19 13:24:19','2025-01-08 15:41:04','voyager.messages.index','null'),(55,3,'Контакти','/contacts','_self',NULL,'#000000',NULL,20,'2024-12-19 13:29:48','2024-12-19 13:29:48',NULL,'');
/*!40000 ALTER TABLE `menu_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menus` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (1,'admin','2024-10-16 13:30:55','2024-10-16 13:30:55'),(3,'Site','2024-11-08 13:08:20','2024-11-08 13:08:20'),(4,'Footer 1','2024-12-17 11:29:03','2024-12-17 11:29:03'),(5,'Footer 2','2024-12-17 11:39:49','2024-12-17 11:39:49');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meta_tags`
--

DROP TABLE IF EXISTS `meta_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meta_tags` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `page_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `page_id` bigint unsigned NOT NULL,
  `meta_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `og_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `og_description` text COLLATE utf8mb4_unicode_ci,
  `og_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `og_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `og_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'website',
  `twitter_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter_description` text COLLATE utf8mb4_unicode_ci,
  `twitter_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter_card` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'summary_large_image',
  `canonical` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `robots` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'index, follow',
  PRIMARY KEY (`id`),
  KEY `meta_tags_page_type_page_id_index` (`page_type`,`page_id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meta_tags`
--

LOCK TABLES `meta_tags` WRITE;
/*!40000 ALTER TABLE `meta_tags` DISABLE KEYS */;
INSERT INTO `meta_tags` VALUES (1,'App\\Models\\Post',7,'test1','test2','test3','test5','test6',NULL,'tes7','website','tes','tes','/images/1733508008-6.webp','summary_large_image','test4','noindex, nofollow'),(2,'App\\Models\\Page',3,'sdasd','asdads','asdad',NULL,NULL,NULL,NULL,'website',NULL,NULL,NULL,'summary_large_image','asd','noindex, nofollow'),(3,'App\\Models\\Page',4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'default',NULL,NULL,NULL,'summary_large_image',NULL,'noindex, nofollow'),(4,'App\\Models\\Page',5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'default',NULL,NULL,NULL,'summary_large_image',NULL,'noindex, nofollow'),(5,'App\\Models\\Page',6,'Crush monobrand',NULL,NULL,NULL,NULL,NULL,NULL,'default',NULL,NULL,NULL,'summary_large_image',NULL,'noindex, nofollow'),(6,'App\\Models\\Category',1,'weqe',NULL,NULL,NULL,NULL,NULL,NULL,'default',NULL,NULL,NULL,'summary_large_image',NULL,'noindex, nofollow'),(7,'App\\Models\\ProductCategory',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'default',NULL,NULL,NULL,'summary_large_image',NULL,'index, follow'),(8,'App\\Models\\Page',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'default',NULL,NULL,NULL,'summary_large_image',NULL,'noindex, nofollow'),(9,'App\\Models\\Product',26,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'default',NULL,NULL,NULL,'summary_large_image',NULL,'noindex, nofollow'),(10,'App\\Models\\ProductCategory',3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'default',NULL,NULL,NULL,'summary_large_image',NULL,'noindex, nofollow'),(11,'App\\Models\\ProductCategory',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'default',NULL,NULL,NULL,'summary_large_image',NULL,'index, follow'),(17,'App\\Models\\Product',32,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'default',NULL,NULL,NULL,'summary_large_image',NULL,'index, follow'),(19,'App\\Models\\Page',7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'default',NULL,NULL,NULL,'summary_large_image',NULL,'index, follow'),(22,'App\\Models\\Product',4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'website',NULL,NULL,NULL,'summary_large_image',NULL,'index, follow'),(23,'App\\Models\\Product',5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'website',NULL,NULL,NULL,'summary_large_image',NULL,'index, follow'),(24,'App\\Models\\Product',6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'website',NULL,NULL,NULL,'summary_large_image',NULL,'index, follow'),(25,'App\\Models\\Product',7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'website',NULL,NULL,NULL,'summary_large_image',NULL,'index, follow'),(26,'App\\Models\\Product',8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'website',NULL,NULL,NULL,'summary_large_image',NULL,'index, follow'),(27,'App\\Models\\Product',9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'website',NULL,NULL,NULL,'summary_large_image',NULL,'index, follow'),(28,'App\\Models\\Product',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'website',NULL,NULL,NULL,'summary_large_image',NULL,'index, follow'),(29,'App\\Models\\Product',11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'website',NULL,NULL,NULL,'summary_large_image',NULL,'index, follow'),(30,'App\\Models\\Product',12,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'website',NULL,NULL,NULL,'summary_large_image',NULL,'index, follow'),(31,'App\\Models\\Product',13,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'website',NULL,NULL,NULL,'summary_large_image',NULL,'index, follow'),(32,'App\\Models\\Product',14,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'website',NULL,NULL,NULL,'summary_large_image',NULL,'index, follow'),(33,'App\\Models\\Product',15,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'website',NULL,NULL,NULL,'summary_large_image',NULL,'index, follow'),(34,'App\\Models\\Product',16,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'website',NULL,NULL,NULL,'summary_large_image',NULL,'index, follow'),(35,'App\\Models\\Product',17,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'website',NULL,NULL,NULL,'summary_large_image',NULL,'index, follow'),(36,'App\\Models\\Product',18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'website',NULL,NULL,NULL,'summary_large_image',NULL,'index, follow'),(37,'App\\Models\\Product',19,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'website',NULL,NULL,NULL,'summary_large_image',NULL,'index, follow'),(38,'App\\Models\\Product',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'default',NULL,NULL,NULL,'summary_large_image',NULL,'index, follow'),(39,'App\\Models\\Product',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'default',NULL,NULL,NULL,'summary_large_image',NULL,'index, follow'),(40,'App\\Models\\Post',5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'default',NULL,NULL,NULL,'summary_large_image',NULL,'index, follow'),(41,'App\\Models\\Post',6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'default',NULL,NULL,NULL,'summary_large_image',NULL,'index, follow');
/*!40000 ALTER TABLE `meta_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=169 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (113,'2014_10_12_000000_create_users_table',1),(114,'2014_10_12_100000_create_password_reset_tokens_table',1),(115,'2016_01_01_000000_add_voyager_user_fields',1),(116,'2016_01_01_000000_create_data_types_table',1),(117,'2016_01_01_000000_create_pages_table',1),(118,'2016_01_01_000000_create_posts_table',1),(119,'2016_02_15_204651_create_categories_table',1),(120,'2016_05_19_173453_create_menu_table',1),(121,'2016_10_21_190000_create_roles_table',1),(122,'2016_10_21_190000_create_settings_table',1),(123,'2016_11_30_135954_create_permission_table',1),(124,'2016_11_30_141208_create_permission_role_table',1),(125,'2016_12_26_201236_data_types__add__server_side',1),(126,'2017_01_13_000000_add_route_to_menu_items_table',1),(127,'2017_01_14_005015_create_translations_table',1),(128,'2017_01_15_000000_make_table_name_nullable_in_permissions_table',1),(129,'2017_03_06_000000_add_controller_to_data_types_table',1),(130,'2017_04_11_000000_alter_post_nullable_fields_table',1),(131,'2017_04_21_000000_add_order_to_data_rows_table',1),(132,'2017_07_05_210000_add_policyname_to_data_types_table',1),(133,'2017_08_05_000000_add_group_to_settings_table',1),(134,'2017_11_26_013050_add_user_role_relationship',1),(135,'2017_11_26_015000_create_user_roles_table',1),(136,'2018_03_11_000000_add_user_settings',1),(137,'2018_03_14_000000_add_details_to_data_types_table',1),(138,'2018_03_16_000000_make_settings_value_nullable',1),(139,'2019_08_19_000000_create_failed_jobs_table',1),(140,'2019_12_14_000001_create_personal_access_tokens_table',1),(141,'2024_10_10_142042_create_product_categories_table',1),(142,'2024_10_11_120055_create_products_table',1),(143,'2024_10_13_130140_create_attributes_table',1),(144,'2024_10_13_130152_create_attribute_values_table',1),(145,'2024_10_13_130208_create_product_attribute_values_table',1),(146,'2024_10_29_144209_create_main_banners_table',1),(147,'2024_10_29_152715_add_columns_to_product_categories_table',1),(148,'2024_11_10_200755_create_nova_poshta_areas_table',1),(149,'2024_11_10_201704_create_nova_poshta_districts_table',1),(150,'2024_11_10_203740_create_nova_poshta_settlements_table',1),(151,'2024_11_10_204334_create_nova_poshta_offices_table',1),(152,'2024_11_27_092416_create_orders_table',1),(153,'2024_12_05_152731_create_meta_tags_table',1),(154,'2024_12_06_145149_remove_meta_columns_from_pages_and_posts',1),(155,'2024_12_10_124540_add_home_page_setting_to_settings_table',1),(156,'2024_12_11_174713_create_currencies_table',1),(157,'2024_12_11_181409_add_currencies_to_products_table',1),(158,'2024_12_12_143534_add_currency_to_orders_table',1),(159,'2024_12_16_204102_add_colums_to_main_banner_table',1),(160,'2024_12_16_211436_add_colums_to_products_table',1),(161,'2024_12_17_110235_add_colum_to_product_categories_table',1),(162,'2024_12_18_134108_add_colum_image_thumbnails_to_products_table',1),(163,'2024_12_19_124533_create_messages_table',1),(164,'2024_12_20_163927_add_colum_prime_to_attributes_table',1),(165,'2024_12_26_145653_create_telegraph_bots_table',1),(166,'2024_12_26_145654_create_telegraph_chats_table',1),(167,'2025_01_03_192209_add_colum_to_currencies_table',1),(168,'2025_01_05_172400_add_status_to_orders_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nova_poshta_areas`
--

DROP TABLE IF EXISTS `nova_poshta_areas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nova_poshta_areas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `area_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `area_center` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settlements_updated_at` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nova_poshta_areas_name_unique` (`name`),
  UNIQUE KEY `nova_poshta_areas_area_code_unique` (`area_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nova_poshta_areas`
--

LOCK TABLES `nova_poshta_areas` WRITE;
/*!40000 ALTER TABLE `nova_poshta_areas` DISABLE KEYS */;
/*!40000 ALTER TABLE `nova_poshta_areas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nova_poshta_districts`
--

DROP TABLE IF EXISTS `nova_poshta_districts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nova_poshta_districts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `district_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `district_center` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `area_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nova_poshta_districts_district_code_unique` (`district_code`),
  KEY `nova_poshta_districts_area_code_foreign` (`area_code`),
  CONSTRAINT `nova_poshta_districts_area_code_foreign` FOREIGN KEY (`area_code`) REFERENCES `nova_poshta_areas` (`area_code`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nova_poshta_districts`
--

LOCK TABLES `nova_poshta_districts` WRITE;
/*!40000 ALTER TABLE `nova_poshta_districts` DISABLE KEYS */;
/*!40000 ALTER TABLE `nova_poshta_districts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nova_poshta_offices`
--

DROP TABLE IF EXISTS `nova_poshta_offices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nova_poshta_offices` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `office_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `office_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settlement_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nova_poshta_offices_office_code_unique` (`office_code`),
  KEY `nova_poshta_offices_settlement_code_foreign` (`settlement_code`),
  CONSTRAINT `nova_poshta_offices_settlement_code_foreign` FOREIGN KEY (`settlement_code`) REFERENCES `nova_poshta_settlements` (`settlement_code`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nova_poshta_offices`
--

LOCK TABLES `nova_poshta_offices` WRITE;
/*!40000 ALTER TABLE `nova_poshta_offices` DISABLE KEYS */;
/*!40000 ALTER TABLE `nova_poshta_offices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nova_poshta_settlements`
--

DROP TABLE IF EXISTS `nova_poshta_settlements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nova_poshta_settlements` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `settlement_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `district_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `offices_updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nova_poshta_settlements_settlement_code_unique` (`settlement_code`),
  KEY `nova_poshta_settlements_district_code_foreign` (`district_code`),
  CONSTRAINT `nova_poshta_settlements_district_code_foreign` FOREIGN KEY (`district_code`) REFERENCES `nova_poshta_districts` (`district_code`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nova_poshta_settlements`
--

LOCK TABLES `nova_poshta_settlements` WRITE;
/*!40000 ALTER TABLE `nova_poshta_settlements` DISABLE KEYS */;
/*!40000 ALTER TABLE `nova_poshta_settlements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `cart` json DEFAULT NULL,
  `total_price` int unsigned DEFAULT NULL,
  `currency` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settlement_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settlement` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `office_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `office` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('NEW','IN_PROCESSING','CLOSED','COMPLETED') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'NEW',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pages_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (1,1,'Доставка та оплата','Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.','<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>','pages/December2024/OzbsDjUVnEfyWkXhA0mG.webp','dostavka-ta-oplata','ACTIVE','2024-10-16 13:30:55','2024-12-10 14:37:06'),(6,1,'Главная','Главная страница',NULL,NULL,'glavnaya','ACTIVE','2024-12-10 13:04:41','2024-12-10 14:25:08'),(7,1,'Контакти','Контакти',NULL,NULL,'contacts','INACTIVE','2024-12-19 13:27:35','2024-12-19 13:29:08');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission_role`
--

DROP TABLE IF EXISTS `permission_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permission_role` (
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission_role`
--

LOCK TABLES `permission_role` WRITE;
/*!40000 ALTER TABLE `permission_role` DISABLE KEYS */;
INSERT INTO `permission_role` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(17,1),(18,1),(19,1),(20,1),(21,1),(22,1),(23,1),(24,1),(25,1),(26,1),(27,1),(28,1),(29,1),(30,1),(31,1),(32,1),(33,1),(34,1),(35,1),(36,1),(37,1),(38,1),(39,1),(40,1),(41,1),(42,1),(43,1),(44,1),(45,1),(51,1),(52,1),(53,1),(54,1),(55,1),(56,1),(57,1),(58,1),(59,1),(60,1),(61,1),(62,1),(63,1),(64,1),(65,1),(66,1),(67,1),(68,1),(69,1),(70,1),(71,1),(72,1),(73,1),(74,1),(75,1),(76,1),(77,1),(78,1),(79,1),(80,1),(81,1),(82,1),(83,1),(84,1),(85,1),(86,1),(87,1),(88,1),(89,1),(90,1);
/*!40000 ALTER TABLE `permission_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_key_index` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'browse_admin',NULL,'2024-10-16 13:30:55','2024-10-16 13:30:55'),(2,'browse_bread',NULL,'2024-10-16 13:30:55','2024-10-16 13:30:55'),(3,'browse_database',NULL,'2024-10-16 13:30:55','2024-10-16 13:30:55'),(4,'browse_media',NULL,'2024-10-16 13:30:55','2024-10-16 13:30:55'),(5,'browse_compass',NULL,'2024-10-16 13:30:55','2024-10-16 13:30:55'),(6,'browse_menus','menus','2024-10-16 13:30:55','2024-10-16 13:30:55'),(7,'read_menus','menus','2024-10-16 13:30:55','2024-10-16 13:30:55'),(8,'edit_menus','menus','2024-10-16 13:30:55','2024-10-16 13:30:55'),(9,'add_menus','menus','2024-10-16 13:30:55','2024-10-16 13:30:55'),(10,'delete_menus','menus','2024-10-16 13:30:55','2024-10-16 13:30:55'),(11,'browse_roles','roles','2024-10-16 13:30:55','2024-10-16 13:30:55'),(12,'read_roles','roles','2024-10-16 13:30:55','2024-10-16 13:30:55'),(13,'edit_roles','roles','2024-10-16 13:30:55','2024-10-16 13:30:55'),(14,'add_roles','roles','2024-10-16 13:30:55','2024-10-16 13:30:55'),(15,'delete_roles','roles','2024-10-16 13:30:55','2024-10-16 13:30:55'),(16,'browse_users','users','2024-10-16 13:30:55','2024-10-16 13:30:55'),(17,'read_users','users','2024-10-16 13:30:55','2024-10-16 13:30:55'),(18,'edit_users','users','2024-10-16 13:30:55','2024-10-16 13:30:55'),(19,'add_users','users','2024-10-16 13:30:55','2024-10-16 13:30:55'),(20,'delete_users','users','2024-10-16 13:30:55','2024-10-16 13:30:55'),(21,'browse_settings','settings','2024-10-16 13:30:55','2024-10-16 13:30:55'),(22,'read_settings','settings','2024-10-16 13:30:55','2024-10-16 13:30:55'),(23,'edit_settings','settings','2024-10-16 13:30:55','2024-10-16 13:30:55'),(24,'add_settings','settings','2024-10-16 13:30:55','2024-10-16 13:30:55'),(25,'delete_settings','settings','2024-10-16 13:30:55','2024-10-16 13:30:55'),(26,'browse_categories','categories','2024-10-16 13:30:55','2024-10-16 13:30:55'),(27,'read_categories','categories','2024-10-16 13:30:55','2024-10-16 13:30:55'),(28,'edit_categories','categories','2024-10-16 13:30:55','2024-10-16 13:30:55'),(29,'add_categories','categories','2024-10-16 13:30:55','2024-10-16 13:30:55'),(30,'delete_categories','categories','2024-10-16 13:30:55','2024-10-16 13:30:55'),(31,'browse_posts','posts','2024-10-16 13:30:55','2024-10-16 13:30:55'),(32,'read_posts','posts','2024-10-16 13:30:55','2024-10-16 13:30:55'),(33,'edit_posts','posts','2024-10-16 13:30:55','2024-10-16 13:30:55'),(34,'add_posts','posts','2024-10-16 13:30:55','2024-10-16 13:30:55'),(35,'delete_posts','posts','2024-10-16 13:30:55','2024-10-16 13:30:55'),(36,'browse_pages','pages','2024-10-16 13:30:55','2024-10-16 13:30:55'),(37,'read_pages','pages','2024-10-16 13:30:55','2024-10-16 13:30:55'),(38,'edit_pages','pages','2024-10-16 13:30:55','2024-10-16 13:30:55'),(39,'add_pages','pages','2024-10-16 13:30:55','2024-10-16 13:30:55'),(40,'delete_pages','pages','2024-10-16 13:30:55','2024-10-16 13:30:55'),(41,'browse_product_categories','product_categories','2024-10-16 14:14:27','2024-10-16 14:14:27'),(42,'read_product_categories','product_categories','2024-10-16 14:14:27','2024-10-16 14:14:27'),(43,'edit_product_categories','product_categories','2024-10-16 14:14:27','2024-10-16 14:14:27'),(44,'add_product_categories','product_categories','2024-10-16 14:14:27','2024-10-16 14:14:27'),(45,'delete_product_categories','product_categories','2024-10-16 14:14:27','2024-10-16 14:14:27'),(51,'browse_attributes','attributes','2024-10-16 14:19:22','2024-10-16 14:19:22'),(52,'read_attributes','attributes','2024-10-16 14:19:22','2024-10-16 14:19:22'),(53,'edit_attributes','attributes','2024-10-16 14:19:22','2024-10-16 14:19:22'),(54,'add_attributes','attributes','2024-10-16 14:19:22','2024-10-16 14:19:22'),(55,'delete_attributes','attributes','2024-10-16 14:19:22','2024-10-16 14:19:22'),(56,'browse_attribute_values','attribute_values','2024-10-16 14:21:31','2024-10-16 14:21:31'),(57,'read_attribute_values','attribute_values','2024-10-16 14:21:31','2024-10-16 14:21:31'),(58,'edit_attribute_values','attribute_values','2024-10-16 14:21:31','2024-10-16 14:21:31'),(59,'add_attribute_values','attribute_values','2024-10-16 14:21:31','2024-10-16 14:21:31'),(60,'delete_attribute_values','attribute_values','2024-10-16 14:21:31','2024-10-16 14:21:31'),(61,'browse_main_banner','main_banner','2024-10-29 14:47:13','2024-10-29 14:47:13'),(62,'read_main_banner','main_banner','2024-10-29 14:47:13','2024-10-29 14:47:13'),(63,'edit_main_banner','main_banner','2024-10-29 14:47:13','2024-10-29 14:47:13'),(64,'add_main_banner','main_banner','2024-10-29 14:47:13','2024-10-29 14:47:13'),(65,'delete_main_banner','main_banner','2024-10-29 14:47:13','2024-10-29 14:47:13'),(66,'browse_main_banners','main_banners','2024-10-29 15:01:15','2024-10-29 15:01:15'),(67,'read_main_banners','main_banners','2024-10-29 15:01:15','2024-10-29 15:01:15'),(68,'edit_main_banners','main_banners','2024-10-29 15:01:15','2024-10-29 15:01:15'),(69,'add_main_banners','main_banners','2024-10-29 15:01:15','2024-10-29 15:01:15'),(70,'delete_main_banners','main_banners','2024-10-29 15:01:16','2024-10-29 15:01:16'),(71,'browse_orders','orders','2024-11-28 12:46:04','2024-11-28 12:46:04'),(72,'read_orders','orders','2024-11-28 12:46:04','2024-11-28 12:46:04'),(73,'edit_orders','orders','2024-11-28 12:46:04','2024-11-28 12:46:04'),(74,'add_orders','orders','2024-11-28 12:46:04','2024-11-28 12:46:04'),(75,'delete_orders','orders','2024-11-28 12:46:04','2024-11-28 12:46:04'),(76,'browse_currencies','currencies','2024-12-11 20:38:40','2024-12-11 20:38:40'),(77,'read_currencies','currencies','2024-12-11 20:38:40','2024-12-11 20:38:40'),(78,'edit_currencies','currencies','2024-12-11 20:38:40','2024-12-11 20:38:40'),(79,'add_currencies','currencies','2024-12-11 20:38:40','2024-12-11 20:38:40'),(80,'delete_currencies','currencies','2024-12-11 20:38:40','2024-12-11 20:38:40'),(81,'browse_products','products','2024-12-17 22:41:30','2024-12-17 22:41:30'),(82,'read_products','products','2024-12-17 22:41:30','2024-12-17 22:41:30'),(83,'edit_products','products','2024-12-17 22:41:30','2024-12-17 22:41:30'),(84,'add_products','products','2024-12-17 22:41:30','2024-12-17 22:41:30'),(85,'delete_products','products','2024-12-17 22:41:30','2024-12-17 22:41:30'),(86,'browse_messages','messages','2024-12-19 13:24:19','2024-12-19 13:24:19'),(87,'read_messages','messages','2024-12-19 13:24:19','2024-12-19 13:24:19'),(88,'edit_messages','messages','2024-12-19 13:24:19','2024-12-19 13:24:19'),(89,'add_messages','messages','2024-12-19 13:24:19','2024-12-19 13:24:19'),(90,'delete_messages','messages','2024-12-19 13:24:19','2024-12-19 13:24:19');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int NOT NULL,
  `category_id` int DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (5,1,1,'Post2','It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English.','<div>\r\n<h2>What is Lorem Ipsum?</h2>\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n</div>\r\n<div>\r\n<h2>Why do we use it?</h2>\r\n<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>\r\n</div>\r\n<h4>&nbsp;</h4>\r\n<div>\r\n<h2>Where does it come from?</h2>\r\n<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p>\r\n<p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>\r\n</div>','posts/January2025/Cez4P8qxJ2gq3eW2Km8t.jpg','post2','PUBLISHED',0,'2024-11-28 16:20:39','2025-01-08 15:28:51'),(6,1,1,'Post3','It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English.','<div>\r\n<h2>What is Lorem Ipsum?</h2>\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n</div>\r\n<div>\r\n<h2>Why do we use it?</h2>\r\n<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>\r\n</div>\r\n<h4>&nbsp;</h4>\r\n<div>\r\n<h2>Where does it come from?</h2>\r\n<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p>\r\n<p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>\r\n</div>','posts/January2025/KSl1ig3k9dnsXpvhM4wd.jpg','post3','PUBLISHED',0,'2024-11-28 16:21:18','2025-01-08 15:29:43'),(7,1,1,'Post1','It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English.','<div>\r\n<h2>What is Lorem Ipsum?</h2>\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n</div>\r\n<div>\r\n<h2>Why do we use it?</h2>\r\n<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>\r\n</div>\r\n<h4>&nbsp;</h4>\r\n<div>\r\n<h2>Where does it come from?</h2>\r\n<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p>\r\n<p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>\r\n</div>','posts/January2025/ItUaP14tUlt3PBUzkrj7.jpg','post1','PUBLISHED',0,'2024-11-28 16:22:00','2025-01-08 15:27:31');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_attribute_values`
--

DROP TABLE IF EXISTS `product_attribute_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_attribute_values` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint unsigned NOT NULL,
  `attribute_value_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_attribute_values_product_id_foreign` (`product_id`),
  KEY `product_attribute_values_attribute_value_id_foreign` (`attribute_value_id`),
  CONSTRAINT `product_attribute_values_attribute_value_id_foreign` FOREIGN KEY (`attribute_value_id`) REFERENCES `attribute_values` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_attribute_values_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_attribute_values`
--

LOCK TABLES `product_attribute_values` WRITE;
/*!40000 ALTER TABLE `product_attribute_values` DISABLE KEYS */;
INSERT INTO `product_attribute_values` VALUES (1,1,9),(2,1,19),(3,1,21),(4,2,16),(5,2,18),(6,2,19),(7,2,20),(8,2,23);
/*!40000 ALTER TABLE `product_attribute_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_categories`
--

DROP TABLE IF EXISTS `product_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_categories`
--

LOCK TABLES `product_categories` WRITE;
/*!40000 ALTER TABLE `product_categories` DISABLE KEYS */;
INSERT INTO `product_categories` VALUES (1,'Category 1','category-1',NULL,'product-categories/3_1.jpg',1,'2025-01-08 15:10:00','2025-01-08 15:17:07'),(2,'Category 2','category-2',NULL,'product-categories/3.jpg',1,'2025-01-08 15:10:00','2025-01-08 15:16:56');
/*!40000 ALTER TABLE `product_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `full_description` text COLLATE utf8mb4_unicode_ci,
  `size_chart` text COLLATE utf8mb4_unicode_ci,
  `images` json DEFAULT NULL,
  `image_thumbnails` json DEFAULT NULL,
  `article` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` int unsigned NOT NULL,
  `discount_price` int unsigned DEFAULT NULL,
  `currency_id` bigint unsigned DEFAULT NULL,
  `rating` double(3,2) DEFAULT NULL,
  `number_of_ratings` int unsigned DEFAULT NULL,
  `product_category_id` bigint unsigned DEFAULT NULL,
  `status` enum('PUBLISHED','NOT_AVAILABLE','DRAFT') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `new` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_article_unique` (`article`),
  KEY `products_product_category_id_foreign` (`product_category_id`),
  KEY `products_currency_id_foreign` (`currency_id`),
  CONSTRAINT `products_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE SET NULL,
  CONSTRAINT `products_product_category_id_foreign` FOREIGN KEY (`product_category_id`) REFERENCES `product_categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Product 1','product-1','<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>','<h2>Where does it come from?</h2>\r\n<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p>\r\n<p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>','<table style=\"border-collapse: collapse; width: 100%;\" border=\"1\"><colgroup><col style=\"width: 24.9785%;\"><col style=\"width: 24.9785%;\"><col style=\"width: 24.9785%;\"><col style=\"width: 24.9785%;\"></colgroup>\r\n<tbody>\r\n<tr>\r\n<td>&nbsp;</td>\r\n<td style=\"text-align: center;\"><strong>S</strong></td>\r\n<td style=\"text-align: center;\"><strong>M</strong></td>\r\n<td style=\"text-align: center;\"><strong>L</strong></td>\r\n</tr>\r\n<tr>\r\n<td>size 1</td>\r\n<td style=\"text-align: center;\">86 - 90 см</td>\r\n<td style=\"text-align: center;\">90 - 94 см</td>\r\n<td style=\"text-align: center;\">94 - 98 см</td>\r\n</tr>\r\n<tr>\r\n<td>size 2</td>\r\n<td style=\"text-align: center;\">66 - 70 см</td>\r\n<td style=\"text-align: center;\">70 - 74 см</td>\r\n<td style=\"text-align: center;\">74 - 78 см</td>\r\n</tr>\r\n<tr>\r\n<td>size 3</td>\r\n<td style=\"text-align: center;\">94 - 98 см</td>\r\n<td style=\"text-align: center;\">98 - 102 см</td>\r\n<td style=\"text-align: center;\">102 - 106 см</td>\r\n</tr>\r\n</tbody>\r\n</table>','[\"products/1/pr.jpg\", \"products/1/pr_1.jpg\", \"products/1/pr_2.jpg\"]','[[{\"url\": \"products/1/pr-resize-300.jpg\", \"width\": \"300\"}, {\"url\": \"products/1/pr-resize-500.jpg\", \"width\": \"500\"}, {\"url\": \"products/1/pr-resize-800.jpg\", \"width\": \"800\"}, {\"url\": \"products/1/pr-resize-1200.jpg\", \"width\": \"1200\"}], [{\"url\": \"products/1/pr_1-resize-300.jpg\", \"width\": \"300\"}, {\"url\": \"products/1/pr_1-resize-500.jpg\", \"width\": \"500\"}, {\"url\": \"products/1/pr_1-resize-800.jpg\", \"width\": \"800\"}, {\"url\": \"products/1/pr_1-resize-1200.jpg\", \"width\": \"1200\"}], [{\"url\": \"products/1/pr_2-resize-300.jpg\", \"width\": \"300\"}, {\"url\": \"products/1/pr_2-resize-500.jpg\", \"width\": \"500\"}, {\"url\": \"products/1/pr_2-resize-800.jpg\", \"width\": \"800\"}, {\"url\": \"products/1/pr_2-resize-1200.jpg\", \"width\": \"1200\"}]]','0000001',1000,900,1,NULL,NULL,1,'PUBLISHED',1,1,'2025-01-08 15:14:00','2025-01-08 15:22:02'),(2,'Product 2','product-2','<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>','<h2>Where does it come from?</h2>\r\n<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p>\r\n<p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>','<table style=\"border-collapse: collapse; width: 100%;\" border=\"1\"><colgroup><col style=\"width: 24.9785%;\"><col style=\"width: 24.9785%;\"><col style=\"width: 24.9785%;\"><col style=\"width: 24.9785%;\"></colgroup>\r\n<tbody>\r\n<tr>\r\n<td>&nbsp;</td>\r\n<td style=\"text-align: center;\"><strong>S</strong></td>\r\n<td style=\"text-align: center;\"><strong>M</strong></td>\r\n<td style=\"text-align: center;\"><strong>L</strong></td>\r\n</tr>\r\n<tr>\r\n<td>size 1</td>\r\n<td style=\"text-align: center;\">86 - 90 см</td>\r\n<td style=\"text-align: center;\">90 - 94 см</td>\r\n<td style=\"text-align: center;\">94 - 98 см</td>\r\n</tr>\r\n<tr>\r\n<td>size 2</td>\r\n<td style=\"text-align: center;\">66 - 70 см</td>\r\n<td style=\"text-align: center;\">70 - 74 см</td>\r\n<td style=\"text-align: center;\">74 - 78 см</td>\r\n</tr>\r\n<tr>\r\n<td>size 3</td>\r\n<td style=\"text-align: center;\">94 - 98 см</td>\r\n<td style=\"text-align: center;\">98 - 102 см</td>\r\n<td style=\"text-align: center;\">102 - 106 см</td>\r\n</tr>\r\n</tbody>\r\n</table>','[\"products/2/pr.jpg\", \"products/2/pr_1.jpg\", \"products/2/pr_2.jpg\"]','[[{\"url\": \"products/2/pr-resize-300.jpg\", \"width\": \"300\"}, {\"url\": \"products/2/pr-resize-500.jpg\", \"width\": \"500\"}, {\"url\": \"products/2/pr-resize-800.jpg\", \"width\": \"800\"}, {\"url\": \"products/2/pr-resize-1200.jpg\", \"width\": \"1200\"}], [{\"url\": \"products/2/pr_1-resize-300.jpg\", \"width\": \"300\"}, {\"url\": \"products/2/pr_1-resize-500.jpg\", \"width\": \"500\"}, {\"url\": \"products/2/pr_1-resize-800.jpg\", \"width\": \"800\"}, {\"url\": \"products/2/pr_1-resize-1200.jpg\", \"width\": \"1200\"}], [{\"url\": \"products/2/pr_2-resize-300.jpg\", \"width\": \"300\"}, {\"url\": \"products/2/pr_2-resize-500.jpg\", \"width\": \"500\"}, {\"url\": \"products/2/pr_2-resize-800.jpg\", \"width\": \"800\"}, {\"url\": \"products/2/pr_2-resize-1200.jpg\", \"width\": \"1200\"}]]','0000002',1200,100,1,5.00,55,2,'PUBLISHED',1,1,'2025-01-08 15:16:00','2025-01-08 15:22:41');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin','Administrator','2024-10-16 13:30:55','2024-10-16 13:30:55'),(2,'user','Normal User','2024-10-16 13:30:55','2024-10-16 13:30:55');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `details` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int NOT NULL DEFAULT '1',
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'site.title','Site Title','Site name','','text',1,'Site'),(2,'site.description','Site Description','About you site','','text',2,'Site'),(4,'site.google_analytics_tracking_id','Google Analytics Tracking ID',NULL,'','text',4,'Site'),(5,'admin.bg_image','Admin Background Image','','','image',5,'Admin'),(6,'admin.title','Admin Title','Voyager','','text',1,'Admin'),(7,'admin.description','Admin Description','Welcome to Voyager. The Missing Admin for Laravel','','text',2,'Admin'),(8,'admin.loader','Admin Loader','','','image',3,'Admin'),(9,'admin.icon_image','Admin Icon Image','','','image',4,'Admin'),(10,'admin.google_analytics_client_id','Google Analytics Client ID (used for admin dashboard)',NULL,'','text',1,'Admin'),(21,'site.home_page','Главная страница','6','{\"default\":null,\"options\":{\"\":\"\\u0412\\u044b\\u0431\\u0435\\u0440\\u0438\\u0442\\u0435 \\u0441\\u0442\\u0440\\u0430\\u043d\\u0438\\u0446\\u0443\",\"6\":\"\\u0413\\u043b\\u0430\\u0432\\u043d\\u0430\\u044f\",\"1\":\"\\u0414\\u043e\\u0441\\u0442\\u0430\\u0432\\u043a\\u0430 \\u0442\\u0430 \\u043e\\u043f\\u043b\\u0430\\u0442\\u0430\",\"7\":\"\\u041a\\u043e\\u043d\\u0442\\u0430\\u043a\\u0442\\u0438\"}}','select_dropdown',1,'Site'),(22,'site.shipping_policy','Shipping Policy','<div class=\"section-title\">\r\n<h2 class=\"title\">Shipping policy for our store</h2>\r\n<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate</p>\r\n</div>',NULL,'rich_text_box',6,'Site'),(23,'site.mail','Почта','test@gmail.com',NULL,'text',7,'Site'),(24,'site.address','Адрес','Украина',NULL,'text',8,'Site'),(25,'site.favicon','Favicon','settings/December2024/vNSRPx82RknP5kEbzIel.png',NULL,'image',9,'Site'),(26,'site.logo','Logo','settings/December2024/PZVWPCfD1kDT3T3wi190.png',NULL,'image',10,'Site'),(27,'site.contact_page','Страница контактов','7','{\"default\":null,\"options\":{\"\":\"\\u0412\\u044b\\u0431\\u0435\\u0440\\u0438\\u0442\\u0435 \\u0441\\u0442\\u0440\\u0430\\u043d\\u0438\\u0446\\u0443\",\"6\":\"\\u0413\\u043b\\u0430\\u0432\\u043d\\u0430\\u044f\",\"1\":\"\\u0414\\u043e\\u0441\\u0442\\u0430\\u0432\\u043a\\u0430 \\u0442\\u0430 \\u043e\\u043f\\u043b\\u0430\\u0442\\u0430\",\"7\":\"\\u041a\\u043e\\u043d\\u0442\\u0430\\u043a\\u0442\\u0438\"}}','select_dropdown',11,'Site'),(28,'site.phone','Телефон','+38 093 000 00 00',NULL,'text',12,'Site'),(33,'site.telegram_description','Telegram описание','Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.\r\nUt wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate',NULL,'code_editor',14,'Site'),(34,'site.orders_chat','Orders chat',NULL,NULL,'select_dropdown',15,'Site');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telegraph_bots`
--

DROP TABLE IF EXISTS `telegraph_bots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telegraph_bots` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `telegraph_bots_token_unique` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telegraph_bots`
--

LOCK TABLES `telegraph_bots` WRITE;
/*!40000 ALTER TABLE `telegraph_bots` DISABLE KEYS */;
/*!40000 ALTER TABLE `telegraph_bots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telegraph_chats`
--

DROP TABLE IF EXISTS `telegraph_chats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telegraph_chats` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `chat_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telegraph_bot_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `telegraph_chats_chat_id_telegraph_bot_id_unique` (`chat_id`,`telegraph_bot_id`),
  KEY `telegraph_chats_telegraph_bot_id_foreign` (`telegraph_bot_id`),
  CONSTRAINT `telegraph_chats_telegraph_bot_id_foreign` FOREIGN KEY (`telegraph_bot_id`) REFERENCES `telegraph_bots` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telegraph_chats`
--

LOCK TABLES `telegraph_chats` WRITE;
/*!40000 ALTER TABLE `telegraph_chats` DISABLE KEYS */;
/*!40000 ALTER TABLE `telegraph_chats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translations`
--

DROP TABLE IF EXISTS `translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translations`
--

LOCK TABLES `translations` WRITE;
/*!40000 ALTER TABLE `translations` DISABLE KEYS */;
INSERT INTO `translations` VALUES (1,'data_types','display_name_singular',5,'pt','Post','2024-10-16 13:30:55','2024-10-16 13:30:55'),(2,'data_types','display_name_singular',6,'pt','Página','2024-10-16 13:30:55','2024-10-16 13:30:55'),(3,'data_types','display_name_singular',1,'pt','Utilizador','2024-10-16 13:30:55','2024-10-16 13:30:55'),(4,'data_types','display_name_singular',4,'pt','Categoria','2024-10-16 13:30:55','2024-10-16 13:30:55'),(5,'data_types','display_name_singular',2,'pt','Menu','2024-10-16 13:30:55','2024-10-16 13:30:55'),(6,'data_types','display_name_singular',3,'pt','Função','2024-10-16 13:30:55','2024-10-16 13:30:55'),(7,'data_types','display_name_plural',5,'pt','Posts','2024-10-16 13:30:55','2024-10-16 13:30:55'),(8,'data_types','display_name_plural',6,'pt','Páginas','2024-10-16 13:30:55','2024-10-16 13:30:55'),(9,'data_types','display_name_plural',1,'pt','Utilizadores','2024-10-16 13:30:55','2024-10-16 13:30:55'),(10,'data_types','display_name_plural',4,'pt','Categorias','2024-10-16 13:30:55','2024-10-16 13:30:55'),(11,'data_types','display_name_plural',2,'pt','Menus','2024-10-16 13:30:55','2024-10-16 13:30:55'),(12,'data_types','display_name_plural',3,'pt','Funções','2024-10-16 13:30:56','2024-10-16 13:30:56'),(13,'categories','slug',1,'pt','categoria-1','2024-10-16 13:30:56','2024-10-16 13:30:56'),(14,'categories','name',1,'pt','Categoria 1','2024-10-16 13:30:56','2024-10-16 13:30:56'),(15,'categories','slug',2,'pt','categoria-2','2024-10-16 13:30:56','2024-10-16 13:30:56'),(16,'categories','name',2,'pt','Categoria 2','2024-10-16 13:30:56','2024-10-16 13:30:56'),(17,'pages','title',1,'pt','Olá Mundo','2024-10-16 13:30:56','2024-10-16 13:30:56'),(18,'pages','slug',1,'pt','ola-mundo','2024-10-16 13:30:56','2024-10-16 13:30:56'),(19,'pages','body',1,'pt','<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>','2024-10-16 13:30:56','2024-10-16 13:30:56'),(20,'menu_items','title',1,'pt','Painel de Controle','2024-10-16 13:30:56','2024-10-16 13:30:56'),(21,'menu_items','title',2,'pt','Media','2024-10-16 13:30:56','2024-10-16 13:30:56'),(22,'menu_items','title',12,'pt','Publicações','2024-10-16 13:30:56','2024-10-16 13:30:56'),(23,'menu_items','title',3,'pt','Utilizadores','2024-10-16 13:30:56','2024-10-16 13:30:56'),(24,'menu_items','title',11,'pt','Categorias','2024-10-16 13:30:56','2024-10-16 13:30:56'),(25,'menu_items','title',13,'pt','Páginas','2024-10-16 13:30:56','2024-10-16 13:30:56'),(26,'menu_items','title',4,'pt','Funções','2024-10-16 13:30:56','2024-10-16 13:30:56'),(27,'menu_items','title',5,'pt','Ferramentas','2024-10-16 13:30:56','2024-10-16 13:30:56'),(28,'menu_items','title',6,'pt','Menus','2024-10-16 13:30:56','2024-10-16 13:30:56'),(29,'menu_items','title',7,'pt','Base de dados','2024-10-16 13:30:56','2024-10-16 13:30:56'),(30,'menu_items','title',10,'pt','Configurações','2024-10-16 13:30:56','2024-10-16 13:30:56');
/*!40000 ALTER TABLE `translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_roles` (
  `user_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `user_roles_user_id_index` (`user_id`),
  KEY `user_roles_role_id_index` (`role_id`),
  CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `role_id` bigint unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_role_id_foreign` (`role_id`),
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,1,'Admin','admin@admin.com','users/default.png',NULL,'$2y$10$WYtvF172ryqegFnB5k4HTOevaIO2RVeqKwp4z/8Xn0b8S/Fxuf18G','DGtR42WykM6QuTJesGlxhQMu7hCgouRhphx4v7TbQYSwZY2pmYrxyi0whXue','{\"locale\":\"ru\"}','2024-10-16 13:30:55','2024-10-16 13:34:38');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-08 17:48:12
