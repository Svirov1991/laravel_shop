-- MySQL dump 10.13  Distrib 8.0.41, for Linux (x86_64)
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
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `field` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `order` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `data_rows_data_type_id_foreign` (`data_type_id`),
  CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=168 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_rows`
--

LOCK TABLES `data_rows` WRITE;
/*!40000 ALTER TABLE `data_rows` DISABLE KEYS */;
INSERT INTO `data_rows` VALUES (1,1,'id','number','ID',1,0,0,0,0,0,'{}',1),(2,1,'name','text','Name',1,1,1,1,1,1,'{}',2),(3,1,'email','text','Email',1,1,1,1,1,1,'{}',4),(4,1,'password','password','Password',1,0,0,1,1,0,'{}',5),(5,1,'remember_token','text','Remember Token',0,0,0,0,0,0,'{}',6),(6,1,'created_at','timestamp','Created At',0,1,1,0,0,0,'{}',8),(7,1,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',9),(8,1,'avatar','image','Avatar',0,1,1,1,1,1,'{}',11),(9,1,'user_belongsto_role_relationship','relationship','Role',0,1,1,1,1,0,'{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":\"0\",\"taggable\":\"0\"}',14),(10,1,'user_belongstomany_role_relationship','relationship','Roles',0,1,1,1,1,0,'{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}',15),(11,1,'settings','hidden','Settings',0,0,0,0,0,0,'{}',16),(12,2,'id','number','ID',1,0,0,0,0,0,NULL,1),(13,2,'name','text','Name',1,1,1,1,1,1,NULL,2),(14,2,'created_at','timestamp','Created At',0,0,0,0,0,0,NULL,3),(15,2,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,4),(16,3,'id','number','ID',1,0,0,0,0,0,NULL,1),(17,3,'name','text','Name',1,1,1,1,1,1,NULL,2),(18,3,'created_at','timestamp','Created At',0,0,0,0,0,0,NULL,3),(19,3,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,4),(20,3,'display_name','text','Display Name',1,1,1,1,1,1,NULL,5),(21,1,'role_id','text','Role',0,1,1,1,1,1,'{}',13),(22,4,'id','number','ID',1,0,0,0,0,0,'{}',1),(23,4,'parent_id','select_dropdown','Parent',0,0,1,1,1,1,'{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}',2),(24,4,'order','text','Order',1,1,1,1,1,1,'{\"default\":1}',3),(25,4,'name','text','Name',1,1,1,1,1,1,'{}',4),(26,4,'slug','text','Slug',1,1,1,1,1,1,'{\"slugify\":{\"origin\":\"name\"}}',5),(27,4,'created_at','timestamp','Created At',0,0,1,0,0,0,'{}',6),(28,4,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',7),(29,5,'id','number','ID',1,0,0,0,0,0,'{}',1),(30,5,'author_id','text','Author',1,0,1,1,0,1,'{}',2),(31,5,'category_id','text','Category',0,0,1,1,1,0,'{}',3),(32,5,'title','text','Title',1,1,1,1,1,1,'{}',4),(33,5,'excerpt','text_area','Excerpt',0,0,1,1,1,1,'{}',5),(34,5,'body','rich_text_box','Body',1,0,1,1,1,1,'{}',6),(35,5,'image','image','Post Image',0,1,1,1,1,1,'{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}',7),(36,5,'slug','text','Slug',1,0,1,1,1,1,'{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:posts,slug\"}}',8),(39,5,'status','select_dropdown','Status',1,1,1,1,1,1,'{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}',11),(40,5,'created_at','timestamp','Created At',0,1,1,0,0,0,'{}',12),(41,5,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',13),(43,5,'featured','checkbox','Featured',1,1,1,1,1,1,'{}',15),(44,6,'id','number','ID',1,0,0,0,0,0,'{}',1),(45,6,'author_id','text','Author',1,0,0,0,0,0,'{}',2),(46,6,'title','text','Title',1,1,1,1,1,1,'{}',3),(47,6,'excerpt','text_area','Excerpt',0,0,1,1,1,1,'null',4),(48,6,'body','gutenberg_field','Body',0,0,1,1,1,1,'{}',5),(49,6,'slug','text','Slug',1,0,1,1,1,1,'{\"slugify\":{\"origin\":\"title\"},\"validation\":{\"rule\":\"unique:pages,slug\"}}',6),(52,6,'status','select_dropdown','Status',1,1,1,1,1,1,'{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\"}}',9),(53,6,'created_at','timestamp','Created At',0,1,1,0,0,0,'{}',10),(54,6,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',11),(55,6,'image','image','Page Image',0,1,1,1,1,1,'{}',12),(56,9,'id','text','Id',1,0,0,0,0,0,'{}',1),(57,9,'title','text','Title',1,1,1,1,1,1,'{\"display\":{\"width\":\"10\"}}',2),(58,9,'slug','text','Slug',1,1,1,1,1,1,'{\"slugify\":{\"origin\":\"title\"},\"validation\":{\"rule\":\"unique:product_categories,slug\"}}',4),(59,9,'description','markdown_editor','Description',0,1,1,1,1,1,'{}',5),(60,9,'created_at','timestamp','Created At',0,1,1,1,0,1,'{}',7),(61,9,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',8),(80,13,'id','text','Id',1,0,0,0,0,0,'{}',1),(81,13,'name','text','Name',1,1,1,1,1,1,'{}',2),(82,15,'id','text','Id',1,0,0,0,0,0,'{}',1),(83,15,'attribute_id','select_dropdown','Attribute',1,0,1,1,1,1,'{\"display\":{\"width\":\"4\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\",\"table\":\"attributes\"}}',3),(84,15,'value','text','Value',1,1,1,1,1,1,'{\"display\":{\"width\":\"8\"}}',4),(86,15,'attribute_value_hasone_attribute_relationship','relationship','Attribute',0,1,0,0,0,0,'{\"model\":\"App\\\\Models\\\\Attribute\",\"table\":\"attributes\",\"type\":\"hasOne\",\"column\":\"id\",\"key\":\"attribute_id\",\"label\":\"name\",\"pivot_table\":\"attribute_values\",\"pivot\":\"0\",\"taggable\":\"0\"}',2),(93,9,'image','media_picker','Image',0,1,1,1,1,1,'{}',6),(95,18,'id','text','Id',1,1,0,0,0,0,'{}',1),(96,18,'cart','text','Cart',0,0,1,0,0,1,'{}',3),(97,18,'total_price','text','Total Price',0,1,1,1,0,1,'{}',4),(98,18,'first_name','text','First Name',0,1,1,1,0,1,'{}',6),(99,18,'last_name','text','Last Name',0,1,1,1,1,1,'{}',7),(100,18,'phone','text','Phone',1,1,1,1,0,1,'{}',8),(101,18,'email','text','Email',0,0,1,1,0,1,'{}',9),(102,18,'settlement_code','text','Settlement Code',0,0,1,1,0,1,'{}',10),(103,18,'settlement','text','Settlement',0,0,1,1,0,1,'{}',11),(104,18,'office_code','text','Office Code',0,0,1,1,0,1,'{}',12),(105,18,'office','text','Office',0,0,1,1,0,1,'{}',13),(106,18,'created_at','timestamp','Created At',0,0,1,0,0,1,'{}',14),(107,18,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',15),(110,19,'id','text','Id',1,0,0,0,0,0,'{}',1),(111,19,'code','text','Code',1,1,1,1,1,1,'{}',2),(112,19,'symbol','text','Symbol',1,1,1,1,1,1,'{}',3),(113,19,'rate','text','Rate',1,1,1,1,1,1,'{}',4),(114,19,'is_default','checkbox','Is Default',1,1,1,1,1,1,'{}',5),(115,19,'created_at','timestamp','Created At',0,1,1,1,0,1,'{}',7),(116,19,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',8),(117,18,'currency','text','Currency',0,1,1,1,1,1,'{}',5),(124,9,'featured','checkbox','Избранное',1,1,1,1,1,1,'{\"display\":{\"width\":\"2\"}}',3),(125,21,'id','text','Id',1,0,0,0,0,0,'{}',1),(126,21,'title','text','Title',1,1,1,1,1,1,'{\"display\":{\"width\":\"4\"}}',2),(127,21,'slug','text','Slug',1,0,1,1,1,1,'{\"display\":{\"width\":\"4\"},\"slugify\":{\"origin\":\"title\"},\"validation\":{\"rule\":\"unique:products,slug\"}}',3),(128,21,'description','rich_text_box','Description',0,0,1,1,1,1,'{}',16),(129,21,'full_description','rich_text_box','Full Description',0,0,1,1,1,1,'{}',17),(130,21,'size_chart','rich_text_box','Size Chart',0,0,1,1,1,1,'{}',18),(131,21,'images','media_picker','Images',0,0,1,1,1,1,'{\"max\":10,\"min\":1,\"expanded\":true,\"show_folders\":true,\"show_toolbar\":true,\"allow_upload\":true,\"allow_move\":true,\"allow_delete\":true,\"allow_create_folder\":true,\"allow_rename\":true,\"allow_crop\":true,\"allowed\":[],\"quality\":100,\"base_path\":\"\\/products\\/{pk}\\/\",\"thumbnails\":[{\"type\":\"resize\",\"name\":\"resize-300\",\"width\":300,\"upsize\":false},{\"type\":\"resize\",\"name\":\"resize-500\",\"width\":500,\"upsize\":false},{\"type\":\"resize\",\"name\":\"resize-800\",\"width\":800,\"upsize\":false},{\"type\":\"resize\",\"name\":\"resize-1200\",\"width\":1200,\"upsize\":false}]}',15),(132,21,'article','text','Article',0,0,1,1,1,1,'{\"display\":{\"width\":\"2\"}}',4),(133,21,'price','number','Price',1,1,1,1,1,1,'{\"display\":{\"width\":\"2\"}}',6),(134,21,'discount_price','number','Discount Price',0,1,1,1,1,1,'{\"display\":{\"width\":\"2\"}}',7),(135,21,'currency_id','select_dropdown','Currency Id',0,0,1,1,1,1,'{\"display\":{\"width\":\"2\"},\"relationship\":{\"key\":\"id\",\"label\":\"code\",\"table\":\"curencies\"}}',9),(136,21,'rating','number','Rating',0,0,1,1,1,1,'{\"display\":{\"width\":\"6\"}}',19),(137,21,'number_of_ratings','number','Number Of Ratings',0,0,1,1,1,1,'{\"display\":{\"width\":\"6\"}}',20),(138,21,'product_category_id','select_dropdown','Product Category Id',0,0,1,1,1,1,'{\"display\":{\"width\":\"2\"},\"relationship\":{\"key\":\"id\",\"label\":\"title\",\"table\":\"product_categories\"}}',5),(139,21,'status','select_dropdown','Status',1,1,1,1,1,1,'{\"display\":{\"width\":\"2\"},\"options\":{\"PUBLISHED\":\"PUBLISHED\",\"NOT_AVAILABLE\":\"NOT AVAILABLE\",\"DRAFT\":\"DRAFT\"}}',14),(140,21,'featured','checkbox','Featured',1,0,1,1,1,1,'{\"display\":{\"width\":\"1\"}}',11),(141,21,'new','checkbox','New',1,0,1,1,1,1,'{\"display\":{\"width\":\"1\"}}',12),(142,21,'created_at','timestamp','Created At',0,0,1,1,0,1,'{}',21),(143,21,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',22),(144,21,'product_hasone_currency_relationship','relationship','currencies',0,1,0,0,0,0,'{\"model\":\"App\\\\Models\\\\Currency\",\"table\":\"currencies\",\"type\":\"hasOne\",\"column\":\"id\",\"key\":\"currency_id\",\"label\":\"code\",\"pivot_table\":\"attribute_values\",\"pivot\":\"0\",\"taggable\":\"0\"}',10),(145,21,'product_hasone_product_category_relationship','relationship','product_categories',0,1,0,0,0,0,'{\"model\":\"App\\\\Models\\\\ProductCategory\",\"table\":\"product_categories\",\"type\":\"hasOne\",\"column\":\"id\",\"key\":\"product_category_id\",\"label\":\"title\",\"pivot_table\":\"attribute_values\",\"pivot\":\"0\",\"taggable\":\"0\"}',23),(147,21,'image_thumbnails','text','Image Thumbnails',0,0,0,0,0,0,'{}',13),(148,22,'id','text','Id',1,0,0,0,0,0,'{}',1),(149,22,'type','text','Type',1,1,1,1,1,1,'{}',2),(150,22,'first_name','text','First Name',0,1,1,1,1,1,'{}',3),(151,22,'last_name','text','Last Name',0,1,1,1,1,1,'{}',4),(152,22,'phone','text','Phone',0,1,1,1,1,1,'{}',5),(153,22,'email','text','Email',0,1,1,1,1,1,'{}',6),(154,22,'message','text_area','Message',0,0,1,1,1,1,'{}',7),(155,22,'data','text','Data',0,0,1,1,1,1,'{}',8),(156,22,'created_at','timestamp','Created At',0,1,1,1,0,1,'{}',9),(157,22,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',10),(158,13,'prime','checkbox','Prime',1,1,1,1,1,1,'{}',3),(159,19,'active','checkbox','Active',1,1,1,1,1,1,'{}',6),(160,18,'status','select_dropdown','Status',1,1,1,1,1,1,'{\"options\":{\"NEW\":\"NEW\",\"IN_PROCESSING\":\"IN_PROCESSING\",\"CLOSED\":\"CLOSED\",\"COMPLETED\":\"COMPLETED\"}}',2),(161,1,'last_name','text','Last Name',0,1,1,1,1,1,'{}',3),(162,1,'phone','text','Phone',0,1,1,1,1,1,'{}',7),(163,1,'email_verified_at','timestamp','Email Verified At',0,1,0,0,0,0,'{}',10),(164,1,'wholesaler','select_dropdown','Wholesaler',1,1,1,1,1,1,'{\"default\":\"option1\",\"options\":{\"null\":\"None\",\"REQUEST\":\"REQUEST\",\"WHOLESALER\":\"WHOLESALER\"}}',12),(165,21,'w_price','text','Wholesale price',0,1,1,1,1,1,'{\"display\":{\"width\":\"2\"}}',8),(166,18,'order_hasone_user_relationship','relationship','users',0,1,1,1,1,1,'{\"model\":\"App\\\\Models\\\\User\",\"table\":\"users\",\"type\":\"hasOne\",\"column\":\"id\",\"key\":\"user_id\",\"label\":\"email\",\"pivot_table\":\"attribute_values\",\"pivot\":\"0\",\"taggable\":\"0\"}',16),(167,18,'user_id','text','User Id',0,1,1,1,1,1,'{}',2);
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
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint NOT NULL DEFAULT '0',
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
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
INSERT INTO `data_types` VALUES (1,'users','users','User','Users','voyager-person','TCG\\Voyager\\Models\\User','TCG\\Voyager\\Policies\\UserPolicy','TCG\\Voyager\\Http\\Controllers\\VoyagerUserController',NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}','2024-10-16 13:30:55','2025-01-22 13:12:51'),(2,'menus','menus','Menu','Menus','voyager-list','TCG\\Voyager\\Models\\Menu',NULL,'','',1,0,NULL,'2024-10-16 13:30:55','2024-10-16 13:30:55'),(3,'roles','roles','Role','Roles','voyager-lock','TCG\\Voyager\\Models\\Role',NULL,'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController','',1,0,NULL,'2024-10-16 13:30:55','2024-10-16 13:30:55'),(4,'categories','categories','Category','Categories','voyager-categories','App\\Models\\Category',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}','2024-10-16 13:30:55','2024-12-10 14:31:17'),(5,'posts','posts','Post','Posts','voyager-news','App\\Models\\Post','TCG\\Voyager\\Policies\\PostPolicy',NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}','2024-10-16 13:30:55','2024-12-06 13:46:13'),(6,'pages','pages','Page','Pages','voyager-file-text','App\\Models\\Page',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}','2024-10-16 13:30:55','2025-02-20 09:31:05'),(9,'product_categories','product-categories','Product Category','Product Categories',NULL,'App\\Models\\ProductCategory',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}','2024-10-16 14:14:27','2024-12-17 11:05:49'),(13,'attributes','attributes','Attribute','Attributes',NULL,'App\\Models\\Attribute',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}','2024-10-16 14:19:22','2024-12-23 17:37:49'),(15,'attribute_values','attribute-values','Attribute Value','Attribute Values',NULL,'App\\Models\\AttributeValue',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}','2024-10-16 14:21:31','2024-10-23 14:39:23'),(18,'orders','orders','Order','Orders',NULL,'App\\Models\\Order',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}','2024-11-28 12:46:04','2025-01-26 16:09:07'),(19,'currencies','currencies','Currency','Currencies',NULL,'App\\Models\\Currency',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}','2024-12-11 20:38:40','2025-01-03 17:24:40'),(21,'products','products','Product','Products',NULL,'App\\Models\\Product',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}','2024-12-17 22:41:30','2025-02-05 00:19:11'),(22,'messages','messages','Message','Messages','voyager-file-text','App\\Models\\Message',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}','2024-12-19 13:24:19','2024-12-19 13:37:21');
/*!40000 ALTER TABLE `data_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `laravel`
--

DROP TABLE IF EXISTS `laravel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `laravel` (
  `C1` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `laravel`
--

LOCK TABLES `laravel` WRITE;
/*!40000 ALTER TABLE `laravel` DISABLE KEYS */;
/*!40000 ALTER TABLE `laravel` ENABLE KEYS */;
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
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `order` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
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
INSERT INTO `menu_items` VALUES (1,1,'Dashboard','','_self','voyager-boat',NULL,NULL,1,'2024-10-16 13:30:55','2024-10-16 13:30:55','voyager.dashboard',NULL),(2,1,'Media','','_self','voyager-images',NULL,NULL,11,'2024-10-16 13:30:55','2025-01-08 15:41:10','voyager.media.index',NULL),(3,1,'Users','','_self','voyager-person',NULL,NULL,10,'2024-10-16 13:30:55','2025-01-08 15:41:10','voyager.users.index',NULL),(4,1,'Roles','','_self','voyager-lock',NULL,NULL,9,'2024-10-16 13:30:55','2025-01-08 15:41:10','voyager.roles.index',NULL),(5,1,'Tools','','_self','voyager-tools',NULL,NULL,12,'2024-10-16 13:30:55','2025-01-08 15:41:10',NULL,NULL),(6,1,'Menu Builder','','_self','voyager-list',NULL,5,1,'2024-10-16 13:30:55','2024-10-17 12:34:18','voyager.menus.index',NULL),(7,1,'Database','','_self','voyager-data',NULL,5,2,'2024-10-16 13:30:55','2024-10-17 12:34:18','voyager.database.index',NULL),(8,1,'Compass','','_self','voyager-compass',NULL,5,3,'2024-10-16 13:30:55','2024-10-17 12:34:18','voyager.compass.index',NULL),(9,1,'BREAD','','_self','voyager-bread',NULL,5,4,'2024-10-16 13:30:55','2024-10-17 12:34:18','voyager.bread.index',NULL),(10,1,'Settings','','_self','voyager-settings',NULL,NULL,13,'2024-10-16 13:30:55','2025-01-08 15:41:10','voyager.settings.index',NULL),(11,1,'Categories','','_self','voyager-categories',NULL,NULL,6,'2024-10-16 13:30:55','2025-01-08 15:41:04','voyager.categories.index',NULL),(12,1,'Posts','','_self','voyager-news',NULL,NULL,4,'2024-10-16 13:30:55','2025-01-08 15:41:04','voyager.posts.index',NULL),(13,1,'Pages','','_self','voyager-file-text',NULL,NULL,5,'2024-10-16 13:30:55','2025-01-08 15:41:04','voyager.pages.index',NULL),(14,1,'Product Categories','','_self','voyager-folder','#000000',18,2,'2024-10-16 14:14:27','2024-10-17 12:37:43','voyager.product-categories.index','null'),(16,1,'Attributes','','_self','voyager-list-add','#000000',18,3,'2024-10-16 14:19:22','2024-10-17 12:38:02','voyager.attributes.index','null'),(17,1,'Attribute Values','','_self','voyager-data','#000000',18,4,'2024-10-16 14:21:31','2024-10-17 12:38:14','voyager.attribute-values.index','null'),(18,1,'Shop','','_self','voyager-basket','#000000',NULL,2,'2024-10-17 12:34:03','2024-10-17 12:36:34',NULL,''),(23,1,'Main Banners','','_self','voyager-photos','#000000',NULL,3,'2024-10-29 15:01:16','2025-01-08 15:41:01','voyager.main-banners.index','null'),(25,3,'Категорія 1','','_self',NULL,'#000000',36,1,'2024-11-08 13:09:08','2025-01-28 16:33:25','handle-slug','{\"slug\":\"category-1\"}'),(26,3,'Категорія 2','','_self',NULL,'#000000',36,2,'2024-11-08 13:09:58','2025-01-28 16:33:41','handle-slug','{\"slug\":\"category-2\"}'),(27,3,'Доставка та оплата','/dostavka-ta-oplata','_self',NULL,'#000000',NULL,3,'2024-11-08 13:10:16','2024-12-16 22:15:10',NULL,''),(29,1,'Odreds','','_self','voyager-buy','#000000',18,5,'2024-11-28 12:46:51','2024-12-02 11:05:05','voyager.orders.index','null'),(30,3,'Статті','','_self',NULL,'#000000',NULL,5,'2024-11-29 11:57:44','2024-12-16 22:15:10','handle-slug','{\"slug\": \"blog\"}'),(32,1,'Currencies','','_self','voyager-credit-card','#000000',NULL,8,'2024-12-11 20:38:40','2025-01-08 15:41:10','voyager.currencies.index','null'),(33,3,'Новинки','/new-products','_self',NULL,'#000000',NULL,2,'2024-12-16 21:39:36','2024-12-16 22:15:10',NULL,''),(36,3,'Товари','#','_self',NULL,'#000000',NULL,1,'2024-12-16 22:15:04','2024-12-16 22:15:08',NULL,''),(37,4,'Категорія 1','','_self',NULL,'#000000',NULL,13,'2024-12-17 11:29:38','2025-01-28 16:31:55','handle-slug','{\"slug\":\"category-1\"}'),(38,4,'Категорія 2','','_self',NULL,'#000000',NULL,14,'2024-12-17 11:30:02','2025-01-28 16:32:19','handle-slug','{\"slug\":\"category-2\"}'),(40,5,'Контакты','/contacts','_self',NULL,'#000000',NULL,16,'2024-12-17 11:40:13','2024-12-17 11:40:13',NULL,''),(41,5,'Доставка и оплата','/dostavka-ta-oplata','_self',NULL,'#000000',NULL,17,'2024-12-17 11:40:36','2024-12-17 11:40:36',NULL,''),(42,5,'Статьи','','_self',NULL,'#000000',NULL,18,'2024-12-17 11:41:13','2024-12-17 11:41:13','handle-slug','{\"slug\": \"blog\"}'),(48,1,'voyager::seeders.menu_items.menu_builder','','_self','voyager-list',NULL,47,10,'2024-12-17 19:52:39','2024-12-17 19:52:39','voyager.menus.index',NULL),(49,1,'voyager::seeders.menu_items.database','','_self','voyager-data',NULL,47,11,'2024-12-17 19:52:39','2024-12-17 19:52:39','voyager.database.index',NULL),(50,1,'voyager::seeders.menu_items.compass','','_self','voyager-compass',NULL,47,12,'2024-12-17 19:52:39','2024-12-17 19:52:39','voyager.compass.index',NULL),(51,1,'voyager::seeders.menu_items.bread','','_self','voyager-bread',NULL,47,13,'2024-12-17 19:52:39','2024-12-17 19:52:39','voyager.bread.index',NULL),(53,1,'Products','','_self','voyager-bag','#000000',18,1,'2024-12-17 22:41:30','2024-12-17 23:13:55','voyager.products.index','null'),(54,1,'Messages','','_self','voyager-file-text','#000000',NULL,7,'2024-12-19 13:24:19','2025-01-08 15:41:04','voyager.messages.index','null'),(55,3,'Контакти','/contacts','_self',NULL,'#000000',NULL,20,'2024-12-19 13:29:48','2024-12-19 13:29:48',NULL,'');
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
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
  `page_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `page_id` bigint unsigned NOT NULL,
  `meta_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `og_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `og_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `og_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `og_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `og_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'website',
  `twitter_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `twitter_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter_card` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'summary_large_image',
  `canonical` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `robots` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'index, follow',
  PRIMARY KEY (`id`),
  KEY `meta_tags_page_type_page_id_index` (`page_type`,`page_id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meta_tags`
--

LOCK TABLES `meta_tags` WRITE;
/*!40000 ALTER TABLE `meta_tags` DISABLE KEYS */;
INSERT INTO `meta_tags` VALUES (1,'App\\Models\\Post',7,'test1','test2','test3','test5','test6',NULL,'tes7','website','tes','tes','/images/1733508008-6.webp','summary_large_image','test4','noindex, nofollow'),(2,'App\\Models\\Page',3,'sdasd','asdads','asdad',NULL,NULL,NULL,NULL,'website',NULL,NULL,NULL,'summary_large_image','asd','noindex, nofollow'),(3,'App\\Models\\Page',4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'default',NULL,NULL,NULL,'summary_large_image',NULL,'noindex, nofollow'),(4,'App\\Models\\Page',5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'default',NULL,NULL,NULL,'summary_large_image',NULL,'noindex, nofollow'),(5,'App\\Models\\Page',6,'Crush monobrand',NULL,NULL,NULL,NULL,NULL,NULL,'default',NULL,NULL,NULL,'summary_large_image',NULL,'noindex, nofollow'),(6,'App\\Models\\Category',1,'weqe',NULL,NULL,NULL,NULL,NULL,NULL,'default',NULL,NULL,NULL,'summary_large_image',NULL,'noindex, nofollow'),(7,'App\\Models\\ProductCategory',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'default',NULL,NULL,NULL,'summary_large_image',NULL,'index, follow'),(8,'App\\Models\\Page',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'default',NULL,NULL,NULL,'summary_large_image',NULL,'noindex, nofollow'),(9,'App\\Models\\Product',26,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'default',NULL,NULL,NULL,'summary_large_image',NULL,'noindex, nofollow'),(10,'App\\Models\\ProductCategory',3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'default',NULL,NULL,NULL,'summary_large_image',NULL,'noindex, nofollow'),(11,'App\\Models\\ProductCategory',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'default',NULL,NULL,NULL,'summary_large_image',NULL,'index, follow'),(17,'App\\Models\\Product',32,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'default',NULL,NULL,NULL,'summary_large_image',NULL,'index, follow'),(19,'App\\Models\\Page',7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'default',NULL,NULL,NULL,'summary_large_image',NULL,'index, follow'),(22,'App\\Models\\Product',4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'website',NULL,NULL,NULL,'summary_large_image',NULL,'index, follow'),(23,'App\\Models\\Product',5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'website',NULL,NULL,NULL,'summary_large_image',NULL,'index, follow'),(24,'App\\Models\\Product',6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'website',NULL,NULL,NULL,'summary_large_image',NULL,'index, follow'),(25,'App\\Models\\Product',7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'website',NULL,NULL,NULL,'summary_large_image',NULL,'index, follow'),(26,'App\\Models\\Product',8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'website',NULL,NULL,NULL,'summary_large_image',NULL,'index, follow'),(27,'App\\Models\\Product',9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'website',NULL,NULL,NULL,'summary_large_image',NULL,'index, follow'),(28,'App\\Models\\Product',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'website',NULL,NULL,NULL,'summary_large_image',NULL,'index, follow'),(29,'App\\Models\\Product',11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'website',NULL,NULL,NULL,'summary_large_image',NULL,'index, follow'),(30,'App\\Models\\Product',12,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'website',NULL,NULL,NULL,'summary_large_image',NULL,'index, follow'),(31,'App\\Models\\Product',13,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'website',NULL,NULL,NULL,'summary_large_image',NULL,'index, follow'),(32,'App\\Models\\Product',14,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'website',NULL,NULL,NULL,'summary_large_image',NULL,'index, follow'),(33,'App\\Models\\Product',15,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'website',NULL,NULL,NULL,'summary_large_image',NULL,'index, follow'),(34,'App\\Models\\Product',16,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'website',NULL,NULL,NULL,'summary_large_image',NULL,'index, follow'),(35,'App\\Models\\Product',17,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'website',NULL,NULL,NULL,'summary_large_image',NULL,'index, follow'),(36,'App\\Models\\Product',18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'website',NULL,NULL,NULL,'summary_large_image',NULL,'index, follow'),(37,'App\\Models\\Product',19,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'website',NULL,NULL,NULL,'summary_large_image',NULL,'index, follow'),(38,'App\\Models\\Product',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'default',NULL,NULL,NULL,'summary_large_image',NULL,'index, follow'),(40,'App\\Models\\Post',5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'default',NULL,NULL,NULL,'summary_large_image',NULL,'index, follow'),(41,'App\\Models\\Post',6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'default',NULL,NULL,NULL,'summary_large_image',NULL,'index, follow'),(42,'App\\Models\\Product',3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'default',NULL,NULL,NULL,'summary_large_image',NULL,'index, follow');
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
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=177 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (113,'2014_10_12_000000_create_users_table',1),(114,'2014_10_12_100000_create_password_reset_tokens_table',1),(115,'2016_01_01_000000_add_voyager_user_fields',1),(116,'2016_01_01_000000_create_data_types_table',1),(117,'2016_01_01_000000_create_pages_table',1),(118,'2016_01_01_000000_create_posts_table',1),(119,'2016_02_15_204651_create_categories_table',1),(120,'2016_05_19_173453_create_menu_table',1),(121,'2016_10_21_190000_create_roles_table',1),(122,'2016_10_21_190000_create_settings_table',1),(123,'2016_11_30_135954_create_permission_table',1),(124,'2016_11_30_141208_create_permission_role_table',1),(125,'2016_12_26_201236_data_types__add__server_side',1),(126,'2017_01_13_000000_add_route_to_menu_items_table',1),(127,'2017_01_14_005015_create_translations_table',1),(128,'2017_01_15_000000_make_table_name_nullable_in_permissions_table',1),(129,'2017_03_06_000000_add_controller_to_data_types_table',1),(130,'2017_04_11_000000_alter_post_nullable_fields_table',1),(131,'2017_04_21_000000_add_order_to_data_rows_table',1),(132,'2017_07_05_210000_add_policyname_to_data_types_table',1),(133,'2017_08_05_000000_add_group_to_settings_table',1),(134,'2017_11_26_013050_add_user_role_relationship',1),(135,'2017_11_26_015000_create_user_roles_table',1),(136,'2018_03_11_000000_add_user_settings',1),(137,'2018_03_14_000000_add_details_to_data_types_table',1),(138,'2018_03_16_000000_make_settings_value_nullable',1),(139,'2019_08_19_000000_create_failed_jobs_table',1),(140,'2019_12_14_000001_create_personal_access_tokens_table',1),(141,'2024_10_10_142042_create_product_categories_table',1),(142,'2024_10_11_120055_create_products_table',1),(143,'2024_10_13_130140_create_attributes_table',1),(144,'2024_10_13_130152_create_attribute_values_table',1),(145,'2024_10_13_130208_create_product_attribute_values_table',1),(147,'2024_10_29_152715_add_columns_to_product_categories_table',1),(148,'2024_11_10_200755_create_nova_poshta_areas_table',1),(149,'2024_11_10_201704_create_nova_poshta_districts_table',1),(150,'2024_11_10_203740_create_nova_poshta_settlements_table',1),(151,'2024_11_10_204334_create_nova_poshta_offices_table',1),(152,'2024_11_27_092416_create_orders_table',1),(153,'2024_12_05_152731_create_meta_tags_table',1),(154,'2024_12_06_145149_remove_meta_columns_from_pages_and_posts',1),(155,'2024_12_10_124540_add_home_page_setting_to_settings_table',1),(156,'2024_12_11_174713_create_currencies_table',1),(157,'2024_12_11_181409_add_currencies_to_products_table',1),(158,'2024_12_12_143534_add_currency_to_orders_table',1),(160,'2024_12_16_211436_add_colums_to_products_table',1),(162,'2024_12_18_134108_add_colum_image_thumbnails_to_products_table',1),(163,'2024_12_19_124533_create_messages_table',1),(164,'2024_12_20_163927_add_colum_prime_to_attributes_table',1),(165,'2024_12_26_145653_create_telegraph_bots_table',1),(166,'2024_12_26_145654_create_telegraph_chats_table',1),(167,'2025_01_03_192209_add_colum_to_currencies_table',1),(168,'2025_01_05_172400_add_status_to_orders_table',1),(171,'2025_01_19_124957_add_columns_to_users_table',2),(172,'2025_01_19_130615_add_column_to_orders_table',2),(173,'2025_01_22_133443_add_column_to_products_table',3),(174,'2019_02_08_105647_create_blocks_contents_tables',4),(175,'2021_11_12_153947_remove_blocks_contents_tables',4),(176,'2025_02_12_134757_create_jobs_table',5);
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
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `area_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `area_center` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settlements_updated_at` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nova_poshta_areas_name_unique` (`name`),
  UNIQUE KEY `nova_poshta_areas_area_code_unique` (`area_code`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nova_poshta_areas`
--

LOCK TABLES `nova_poshta_areas` WRITE;
/*!40000 ALTER TABLE `nova_poshta_areas` DISABLE KEYS */;
INSERT INTO `nova_poshta_areas` VALUES (1,'АРК','dcaad3d6-4b33-11e4-ab6d-005056801329','e71df018-4b33-11e4-ab6d-005056801329',NULL),(2,'Вінницька','dcaad5a7-4b33-11e4-ab6d-005056801329','e71629ab-4b33-11e4-ab6d-005056801329',NULL),(3,'Волинська','dcaad676-4b33-11e4-ab6d-005056801329','e71ab70b-4b33-11e4-ab6d-005056801329',NULL),(4,'Дніпропетровська','dcaad735-4b33-11e4-ab6d-005056801329','e717110a-4b33-11e4-ab6d-005056801329',NULL),(5,'Донецька','dcaad81c-4b33-11e4-ab6d-005056801329','e7174c0e-4b33-11e4-ab6d-005056801329',NULL),(6,'Житомирська','dcaad8fb-4b33-11e4-ab6d-005056801329','e717a3d0-4b33-11e4-ab6d-005056801329',NULL),(7,'Закарпатська','dcaad993-4b33-11e4-ab6d-005056801329','e71f4773-4b33-11e4-ab6d-005056801329',NULL),(8,'Запорізька','dcaada26-4b33-11e4-ab6d-005056801329','e717bce9-4b33-11e4-ab6d-005056801329',NULL),(9,'Івано-Франківська','dcaadac6-4b33-11e4-ab6d-005056801329','e7182b3c-4b33-11e4-ab6d-005056801329',NULL),(10,'Київська','dcaadb64-4b33-11e4-ab6d-005056801329','e718a680-4b33-11e4-ab6d-005056801329',NULL),(11,'Кіровоградська','dcaadbf9-4b33-11e4-ab6d-005056801329','e718b361-4b33-11e4-ab6d-005056801329',NULL),(12,'Луганська','dcaadc91-4b33-11e4-ab6d-005056801329','e71aaddb-4b33-11e4-ab6d-005056801329',NULL),(13,'Львівська','dcaadd3a-4b33-11e4-ab6d-005056801329','e71abb60-4b33-11e4-ab6d-005056801329',NULL),(14,'Миколаївська','dcaaddd7-4b33-11e4-ab6d-005056801329','e71b108c-4b33-11e4-ab6d-005056801329',NULL),(15,'Одеська','dcaade6d-4b33-11e4-ab6d-005056801329','e71c2a15-4b33-11e4-ab6d-005056801329',NULL),(16,'Полтавська','dcaadf02-4b33-11e4-ab6d-005056801329','e71d006d-4b33-11e4-ab6d-005056801329',NULL),(17,'Рівненська','dcaadfa0-4b33-11e4-ab6d-005056801329','e71d65e1-4b33-11e4-ab6d-005056801329',NULL),(18,'Сумська','dcaae036-4b33-11e4-ab6d-005056801329','e71e73be-4b33-11e4-ab6d-005056801329',NULL),(19,'Тернопільська','dcaae303-4b33-11e4-ab6d-005056801329','e71efc6a-4b33-11e4-ab6d-005056801329',NULL),(20,'Харківська','dcaae3a1-4b33-11e4-ab6d-005056801329','e71f8842-4b33-11e4-ab6d-005056801329',NULL),(21,'Херсонська','dcaae44b-4b33-11e4-ab6d-005056801329','e71f8b5f-4b33-11e4-ab6d-005056801329',NULL),(22,'Хмельницька','dcaae4e5-4b33-11e4-ab6d-005056801329','e71f8e8f-4b33-11e4-ab6d-005056801329',NULL),(23,'Черкаська','dcaae57c-4b33-11e4-ab6d-005056801329','e71fe3ca-4b33-11e4-ab6d-005056801329',NULL),(24,'Чернівецька','dcaae60e-4b33-11e4-ab6d-005056801329','e71fe717-4b33-11e4-ab6d-005056801329',NULL),(25,'Чернігівська','dcaae6a8-4b33-11e4-ab6d-005056801329','e71feb5c-4b33-11e4-ab6d-005056801329',NULL);
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
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `district_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `district_center` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `area_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nova_poshta_districts_district_code_unique` (`district_code`),
  KEY `nova_poshta_districts_area_code_foreign` (`area_code`),
  CONSTRAINT `nova_poshta_districts_area_code_foreign` FOREIGN KEY (`area_code`) REFERENCES `nova_poshta_areas` (`area_code`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1891 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nova_poshta_districts`
--

LOCK TABLES `nova_poshta_districts` WRITE;
/*!40000 ALTER TABLE `nova_poshta_districts` DISABLE KEYS */;
INSERT INTO `nova_poshta_districts` VALUES (1261,'Алуштинська','e4b0a202-4b33-11e4-ab6d-005056801329','e7140e5d-4b33-11e4-ab6d-005056801329','dcaad3d6-4b33-11e4-ab6d-005056801329'),(1262,'Армянська','e4b0a131-4b33-11e4-ab6d-005056801329','e7142b24-4b33-11e4-ab6d-005056801329','dcaad3d6-4b33-11e4-ab6d-005056801329'),(1263,'Бахчисарайський','e4b0d683-4b33-11e4-ab6d-005056801329','e71455c3-4b33-11e4-ab6d-005056801329','dcaad3d6-4b33-11e4-ab6d-005056801329'),(1264,'Білогірський','e4b0d757-4b33-11e4-ab6d-005056801329','e7149a77-4b33-11e4-ab6d-005056801329','dcaad3d6-4b33-11e4-ab6d-005056801329'),(1265,'Джанкойський','e4b0d82c-4b33-11e4-ab6d-005056801329','e716fcfd-4b33-11e4-ab6d-005056801329','dcaad3d6-4b33-11e4-ab6d-005056801329'),(1266,'Євпаторійська','e4b0a050-4b33-11e4-ab6d-005056801329','e71790d3-4b33-11e4-ab6d-005056801329','dcaad3d6-4b33-11e4-ab6d-005056801329'),(1267,'Керченська','e4b09f3b-4b33-11e4-ab6d-005056801329','e718a531-4b33-11e4-ab6d-005056801329','dcaad3d6-4b33-11e4-ab6d-005056801329'),(1268,'Кіровський','e4b0d8fc-4b33-11e4-ab6d-005056801329','e718bb72-4b33-11e4-ab6d-005056801329','dcaad3d6-4b33-11e4-ab6d-005056801329'),(1269,'Красногвардійський','e4b0aa8e-4b33-11e4-ab6d-005056801329','e71a0e7c-4b33-11e4-ab6d-005056801329','dcaad3d6-4b33-11e4-ab6d-005056801329'),(1270,'Красноперекопський','e4b0a9b3-4b33-11e4-ab6d-005056801329','e71a1bb5-4b33-11e4-ab6d-005056801329','dcaad3d6-4b33-11e4-ab6d-005056801329'),(1271,'Ленінський','e4b0a8e1-4b33-11e4-ab6d-005056801329','e71a5933-4b33-11e4-ab6d-005056801329','dcaad3d6-4b33-11e4-ab6d-005056801329'),(1272,'Нижньогірський','e4b0a811-4b33-11e4-ab6d-005056801329','e71b8145-4b33-11e4-ab6d-005056801329','dcaad3d6-4b33-11e4-ab6d-005056801329'),(1273,'Первомайський','e4b0a72a-4b33-11e4-ab6d-005056801329','e71ca00a-4b33-11e4-ab6d-005056801329','dcaad3d6-4b33-11e4-ab6d-005056801329'),(1274,'Роздольненський','e4b0a653-4b33-11e4-ab6d-005056801329','e71d7ac6-4b33-11e4-ab6d-005056801329','dcaad3d6-4b33-11e4-ab6d-005056801329'),(1275,'Сакський','e4b0a57a-4b33-11e4-ab6d-005056801329','e71d9662-4b33-11e4-ab6d-005056801329','dcaad3d6-4b33-11e4-ab6d-005056801329'),(1276,'Севастопольська','e4aa9d3b-4b33-11e4-ab6d-005056801329','e71db4bb-4b33-11e4-ab6d-005056801329','dcaad3d6-4b33-11e4-ab6d-005056801329'),(1277,'Сімферопольська','e4b09e26-4b33-11e4-ab6d-005056801329','e71df018-4b33-11e4-ab6d-005056801329','dcaad3d6-4b33-11e4-ab6d-005056801329'),(1278,'Сімферопольський','e4b0a49a-4b33-11e4-ab6d-005056801329','e71df018-4b33-11e4-ab6d-005056801329','dcaad3d6-4b33-11e4-ab6d-005056801329'),(1279,'Совєтський','e4b0a3bd-4b33-11e4-ab6d-005056801329','e71e2f8c-4b33-11e4-ab6d-005056801329','dcaad3d6-4b33-11e4-ab6d-005056801329'),(1280,'Судацька','e4b09cf8-4b33-11e4-ab6d-005056801329','e71e6e88-4b33-11e4-ab6d-005056801329','dcaad3d6-4b33-11e4-ab6d-005056801329'),(1281,'Феодосійська','e4b080c8-4b33-11e4-ab6d-005056801329','e71f8342-4b33-11e4-ab6d-005056801329','dcaad3d6-4b33-11e4-ab6d-005056801329'),(1282,'Чорноморський','e4b0a2d5-4b33-11e4-ab6d-005056801329','e7201f01-4b33-11e4-ab6d-005056801329','dcaad3d6-4b33-11e4-ab6d-005056801329'),(1283,'Ялтинська','e4b07fd3-4b33-11e4-ab6d-005056801329','e72080ee-4b33-11e4-ab6d-005056801329','dcaad3d6-4b33-11e4-ab6d-005056801329'),(1284,'Барський','e4af6e10-4b33-11e4-ab6d-005056801329','e7144a27-4b33-11e4-ab6d-005056801329','dcaad5a7-4b33-11e4-ab6d-005056801329'),(1285,'Бершадський','e4af6ef2-4b33-11e4-ab6d-005056801329','e7147f0f-4b33-11e4-ab6d-005056801329','dcaad5a7-4b33-11e4-ab6d-005056801329'),(1286,'Вінницький','e4af9625-4b33-11e4-ab6d-005056801329','e71629ab-4b33-11e4-ab6d-005056801329','dcaad5a7-4b33-11e4-ab6d-005056801329'),(1287,'Гайсинський','e4af974e-4b33-11e4-ab6d-005056801329','e71661a3-4b33-11e4-ab6d-005056801329','dcaad5a7-4b33-11e4-ab6d-005056801329'),(1288,'Жмеринський','e4af9853-4b33-11e4-ab6d-005056801329','e717a5b8-4b33-11e4-ab6d-005056801329','dcaad5a7-4b33-11e4-ab6d-005056801329'),(1289,'Іллінецький','e4afc879-4b33-11e4-ab6d-005056801329','e71839fb-4b33-11e4-ab6d-005056801329','dcaad5a7-4b33-11e4-ab6d-005056801329'),(1290,'Калинівський','e4afc98b-4b33-11e4-ab6d-005056801329','e718690c-4b33-11e4-ab6d-005056801329','dcaad5a7-4b33-11e4-ab6d-005056801329'),(1291,'Козятинська','e4b0dbe7-4b33-11e4-ab6d-005056801329','e7191206-4b33-11e4-ab6d-005056801329','dcaad5a7-4b33-11e4-ab6d-005056801329'),(1292,'Козятинський','e4afca62-4b33-11e4-ab6d-005056801329','e7191206-4b33-11e4-ab6d-005056801329','dcaad5a7-4b33-11e4-ab6d-005056801329'),(1293,'Крижопільський','e4afcb36-4b33-11e4-ab6d-005056801329','e71a2e8c-4b33-11e4-ab6d-005056801329','dcaad5a7-4b33-11e4-ab6d-005056801329'),(1294,'Ладижинська','e4b006a1-4b33-11e4-ab6d-005056801329','e71a4be1-4b33-11e4-ab6d-005056801329','dcaad5a7-4b33-11e4-ab6d-005056801329'),(1295,'Липовецький','e4afcc0e-4b33-11e4-ab6d-005056801329','e71a75c1-4b33-11e4-ab6d-005056801329','dcaad5a7-4b33-11e4-ab6d-005056801329'),(1296,'Літинський','e4afccdf-4b33-11e4-ab6d-005056801329','e71a9beb-4b33-11e4-ab6d-005056801329','dcaad5a7-4b33-11e4-ab6d-005056801329'),(1297,'Могилів-Подільська','e4b0077d-4b33-11e4-ab6d-005056801329','e71b53e8-4b33-11e4-ab6d-005056801329','dcaad5a7-4b33-11e4-ab6d-005056801329'),(1298,'Могилів-Подільський','e4afcdb3-4b33-11e4-ab6d-005056801329','e71b53e8-4b33-11e4-ab6d-005056801329','dcaad5a7-4b33-11e4-ab6d-005056801329'),(1299,'Мурованокуриловецький','e4afce8f-4b33-11e4-ab6d-005056801329','e71b6a10-4b33-11e4-ab6d-005056801329','dcaad5a7-4b33-11e4-ab6d-005056801329'),(1300,'Немирівський','e4afcf6f-4b33-11e4-ab6d-005056801329','e71b7679-4b33-11e4-ab6d-005056801329','dcaad5a7-4b33-11e4-ab6d-005056801329'),(1301,'Оратівський','e4affa11-4b33-11e4-ab6d-005056801329','e71c45d2-4b33-11e4-ab6d-005056801329','dcaad5a7-4b33-11e4-ab6d-005056801329'),(1302,'Піщанський','e4affb32-4b33-11e4-ab6d-005056801329','e71cf287-4b33-11e4-ab6d-005056801329','dcaad5a7-4b33-11e4-ab6d-005056801329'),(1303,'Погребищенський','e4affcfe-4b33-11e4-ab6d-005056801329','e71cf6bf-4b33-11e4-ab6d-005056801329','dcaad5a7-4b33-11e4-ab6d-005056801329'),(1304,'Теплицький','e4affde4-4b33-11e4-ab6d-005056801329','e71eee5d-4b33-11e4-ab6d-005056801329','dcaad5a7-4b33-11e4-ab6d-005056801329'),(1305,'Тиврівський','e4affeca-4b33-11e4-ab6d-005056801329','e71f0144-4b33-11e4-ab6d-005056801329','dcaad5a7-4b33-11e4-ab6d-005056801329'),(1306,'Томашпільський','e4afffad-4b33-11e4-ab6d-005056801329','e71f2ca0-4b33-11e4-ab6d-005056801329','dcaad5a7-4b33-11e4-ab6d-005056801329'),(1307,'Тростянецький','e4b0008b-4b33-11e4-ab6d-005056801329','e71f3b3b-4b33-11e4-ab6d-005056801329','dcaad5a7-4b33-11e4-ab6d-005056801329'),(1308,'Тульчинський','e4b0016e-4b33-11e4-ab6d-005056801329','e71f3f74-4b33-11e4-ab6d-005056801329','dcaad5a7-4b33-11e4-ab6d-005056801329'),(1309,'Хмільницький','e4b00248-4b33-11e4-ab6d-005056801329','e71fb0ed-4b33-11e4-ab6d-005056801329','dcaad5a7-4b33-11e4-ab6d-005056801329'),(1310,'Чернівецький','e4b0031f-4b33-11e4-ab6d-005056801329','e71fe717-4b33-11e4-ab6d-005056801329','dcaad5a7-4b33-11e4-ab6d-005056801329'),(1311,'Чечельницький','e4b003fa-4b33-11e4-ab6d-005056801329','e71ff1e7-4b33-11e4-ab6d-005056801329','dcaad5a7-4b33-11e4-ab6d-005056801329'),(1312,'Шаргородський','e4b004db-4b33-11e4-ab6d-005056801329','e720309b-4b33-11e4-ab6d-005056801329','dcaad5a7-4b33-11e4-ab6d-005056801329'),(1313,'Ямпільський','e4b005bc-4b33-11e4-ab6d-005056801329','e7208867-4b33-11e4-ab6d-005056801329','dcaad5a7-4b33-11e4-ab6d-005056801329'),(1314,'Володимир-Волинський','e4b00865-4b33-11e4-ab6d-005056801329','e7164a21-4b33-11e4-ab6d-005056801329','dcaad676-4b33-11e4-ab6d-005056801329'),(1315,'Горохівський','e4b00933-4b33-11e4-ab6d-005056801329','e716ca2e-4b33-11e4-ab6d-005056801329','dcaad676-4b33-11e4-ab6d-005056801329'),(1316,'Іваничівський','e4b00a0a-4b33-11e4-ab6d-005056801329','e71820ea-4b33-11e4-ab6d-005056801329','dcaad676-4b33-11e4-ab6d-005056801329'),(1317,'Камінь-Каширський','e4b00ada-4b33-11e4-ab6d-005056801329','e71879dd-4b33-11e4-ab6d-005056801329','dcaad676-4b33-11e4-ab6d-005056801329'),(1318,'Ківерцівський','e4b00bac-4b33-11e4-ab6d-005056801329','e718ab85-4b33-11e4-ab6d-005056801329','dcaad676-4b33-11e4-ab6d-005056801329'),(1319,'Ковельський','e4b00c84-4b33-11e4-ab6d-005056801329','e71901e6-4b33-11e4-ab6d-005056801329','dcaad676-4b33-11e4-ab6d-005056801329'),(1320,'Локачинський','e4b02abc-4b33-11e4-ab6d-005056801329','e71aa215-4b33-11e4-ab6d-005056801329','dcaad676-4b33-11e4-ab6d-005056801329'),(1321,'Луцький','e4b02c2b-4b33-11e4-ab6d-005056801329','e71ab70b-4b33-11e4-ab6d-005056801329','dcaad676-4b33-11e4-ab6d-005056801329'),(1322,'Любешівський','e4b02d6b-4b33-11e4-ab6d-005056801329','e71ac397-4b33-11e4-ab6d-005056801329','dcaad676-4b33-11e4-ab6d-005056801329'),(1323,'Любомльський','e4b02e7c-4b33-11e4-ab6d-005056801329','e71ac522-4b33-11e4-ab6d-005056801329','dcaad676-4b33-11e4-ab6d-005056801329'),(1324,'Маневицький','e4b02f9f-4b33-11e4-ab6d-005056801329','e71adb98-4b33-11e4-ab6d-005056801329','dcaad676-4b33-11e4-ab6d-005056801329'),(1325,'Нововолинська','e4b03508-4b33-11e4-ab6d-005056801329','e71be0f2-4b33-11e4-ab6d-005056801329','dcaad676-4b33-11e4-ab6d-005056801329'),(1326,'Ратнівський','e4b0306f-4b33-11e4-ab6d-005056801329','e71d58fd-4b33-11e4-ab6d-005056801329','dcaad676-4b33-11e4-ab6d-005056801329'),(1327,'Рожищенський','e4b03145-4b33-11e4-ab6d-005056801329','e71d73e0-4b33-11e4-ab6d-005056801329','dcaad676-4b33-11e4-ab6d-005056801329'),(1328,'Старовижівський','e4b03214-4b33-11e4-ab6d-005056801329','e71e531e-4b33-11e4-ab6d-005056801329','dcaad676-4b33-11e4-ab6d-005056801329'),(1329,'Турійський','e4b032f4-4b33-11e4-ab6d-005056801329','e71f42c4-4b33-11e4-ab6d-005056801329','dcaad676-4b33-11e4-ab6d-005056801329'),(1330,'Шацький','e4b03422-4b33-11e4-ab6d-005056801329','e720343e-4b33-11e4-ab6d-005056801329','dcaad676-4b33-11e4-ab6d-005056801329'),(1331,'Апостолівський','e4b03620-4b33-11e4-ab6d-005056801329','e71425f3-4b33-11e4-ab6d-005056801329','dcaad735-4b33-11e4-ab6d-005056801329'),(1332,'Васильківський','e4b03731-4b33-11e4-ab6d-005056801329','e715908a-4b33-11e4-ab6d-005056801329','dcaad735-4b33-11e4-ab6d-005056801329'),(1333,'Верхньодніпровський','e4b03847-4b33-11e4-ab6d-005056801329','e715cfeb-4b33-11e4-ab6d-005056801329','dcaad735-4b33-11e4-ab6d-005056801329'),(1334,'Вільногірська','e4ac0786-4b33-11e4-ab6d-005056801329','e71621e9-4b33-11e4-ab6d-005056801329','dcaad735-4b33-11e4-ab6d-005056801329'),(1335,'Дніпровська','e4ac0969-4b33-11e4-ab6d-005056801329','e717110a-4b33-11e4-ab6d-005056801329','dcaad735-4b33-11e4-ab6d-005056801329'),(1336,'Дніпровський','e4b03967-4b33-11e4-ab6d-005056801329','e717110a-4b33-11e4-ab6d-005056801329','dcaad735-4b33-11e4-ab6d-005056801329'),(1337,'Жовтоводська','e4ac0a40-4b33-11e4-ab6d-005056801329','e717ac12-4b33-11e4-ab6d-005056801329','dcaad735-4b33-11e4-ab6d-005056801329'),(1338,'Кам\'янська','e4ac089a-4b33-11e4-ab6d-005056801329','e7170f37-4b33-11e4-ab6d-005056801329','dcaad735-4b33-11e4-ab6d-005056801329'),(1339,'Кам’янський','f5c730f7-46eb-11ec-80fb-b8830365bd04','e7170f37-4b33-11e4-ab6d-005056801329','dcaad735-4b33-11e4-ab6d-005056801329'),(1340,'Криворізька','e4ac0b12-4b33-11e4-ab6d-005056801329','e71a2cab-4b33-11e4-ab6d-005056801329','dcaad735-4b33-11e4-ab6d-005056801329'),(1341,'Криворізький','e4b03a8f-4b33-11e4-ab6d-005056801329','e71a2cab-4b33-11e4-ab6d-005056801329','dcaad735-4b33-11e4-ab6d-005056801329'),(1342,'Криничанський','e4b03bd0-4b33-11e4-ab6d-005056801329','e71a3064-4b33-11e4-ab6d-005056801329','dcaad735-4b33-11e4-ab6d-005056801329'),(1343,'Магдалинівський','e4b075c5-4b33-11e4-ab6d-005056801329','e71acaa7-4b33-11e4-ab6d-005056801329','dcaad735-4b33-11e4-ab6d-005056801329'),(1344,'Марганецька','e4ac0bda-4b33-11e4-ab6d-005056801329','e71ae3b4-4b33-11e4-ab6d-005056801329','dcaad735-4b33-11e4-ab6d-005056801329'),(1345,'Межівський','e4b076e8-4b33-11e4-ab6d-005056801329','e71aedda-4b33-11e4-ab6d-005056801329','dcaad735-4b33-11e4-ab6d-005056801329'),(1346,'Нікопольський','e4b077c8-4b33-11e4-ab6d-005056801329','e71b8789-4b33-11e4-ab6d-005056801329','dcaad735-4b33-11e4-ab6d-005056801329'),(1347,'П\'ятихатський','e4b07980-4b33-11e4-ab6d-005056801329','e71c7069-4b33-11e4-ab6d-005056801329','dcaad735-4b33-11e4-ab6d-005056801329'),(1348,'Павлоградський','e4b07a5d-4b33-11e4-ab6d-005056801329','e71c7432-4b33-11e4-ab6d-005056801329','dcaad735-4b33-11e4-ab6d-005056801329'),(1349,'Першотравенська','e4ac0da2-4b33-11e4-ab6d-005056801329','e71cafea-4b33-11e4-ab6d-005056801329','dcaad735-4b33-11e4-ab6d-005056801329'),(1350,'Петриківський','e4b07b40-4b33-11e4-ab6d-005056801329','e71cb642-4b33-11e4-ab6d-005056801329','dcaad735-4b33-11e4-ab6d-005056801329'),(1351,'Петропавлівський','e4b07c23-4b33-11e4-ab6d-005056801329','e71cc017-4b33-11e4-ab6d-005056801329','dcaad735-4b33-11e4-ab6d-005056801329'),(1352,'Покровська','e4ac0cb9-4b33-11e4-ab6d-005056801329','e71c4a04-4b33-11e4-ab6d-005056801329','dcaad735-4b33-11e4-ab6d-005056801329'),(1353,'Покровський','e4b07d06-4b33-11e4-ab6d-005056801329','e71cf8e6-4b33-11e4-ab6d-005056801329','dcaad735-4b33-11e4-ab6d-005056801329'),(1354,'Самарівський','e4b078a4-4b33-11e4-ab6d-005056801329','e71c0b3a-4b33-11e4-ab6d-005056801329','dcaad735-4b33-11e4-ab6d-005056801329'),(1355,'Синельниківський','e4b07de7-4b33-11e4-ab6d-005056801329','e71dc518-4b33-11e4-ab6d-005056801329','dcaad735-4b33-11e4-ab6d-005056801329'),(1356,'Солонянський','e4b07ed0-4b33-11e4-ab6d-005056801329','e71e36fd-4b33-11e4-ab6d-005056801329','dcaad735-4b33-11e4-ab6d-005056801329'),(1357,'Софіївський','e4abe8a6-4b33-11e4-ab6d-005056801329','e71e4595-4b33-11e4-ab6d-005056801329','dcaad735-4b33-11e4-ab6d-005056801329'),(1358,'Тернівська','e4ac0e73-4b33-11e4-ab6d-005056801329','e71efb12-4b33-11e4-ab6d-005056801329','dcaad735-4b33-11e4-ab6d-005056801329'),(1359,'Томаківський','e4abe974-4b33-11e4-ab6d-005056801329','e71f285e-4b33-11e4-ab6d-005056801329','dcaad735-4b33-11e4-ab6d-005056801329'),(1360,'Царичанський','e4ac0459-4b33-11e4-ab6d-005056801329','e71fbf44-4b33-11e4-ab6d-005056801329','dcaad735-4b33-11e4-ab6d-005056801329'),(1361,'Широківський','e4ac058a-4b33-11e4-ab6d-005056801329','e7203f4a-4b33-11e4-ab6d-005056801329','dcaad735-4b33-11e4-ab6d-005056801329'),(1362,'Юр\'ївський','e4ac0686-4b33-11e4-ab6d-005056801329','e7207941-4b33-11e4-ab6d-005056801329','dcaad735-4b33-11e4-ab6d-005056801329'),(1363,'Авдіївська','e4ac7f36-4b33-11e4-ab6d-005056801329','e71405ee-4b33-11e4-ab6d-005056801329','dcaad81c-4b33-11e4-ab6d-005056801329'),(1364,'Амвросіївський','e4abe707-4b33-11e4-ab6d-005056801329','e71412d6-4b33-11e4-ab6d-005056801329','dcaad81c-4b33-11e4-ab6d-005056801329'),(1365,'Бахмутська','e4ac8004-4b33-11e4-ab6d-005056801329','e7142d78-4b33-11e4-ab6d-005056801329','dcaad81c-4b33-11e4-ab6d-005056801329'),(1366,'Бахмутський','e4ac102a-4b33-11e4-ab6d-005056801329','e7142d78-4b33-11e4-ab6d-005056801329','dcaad81c-4b33-11e4-ab6d-005056801329'),(1367,'Великоновосілківський','e4ac1116-4b33-11e4-ab6d-005056801329','e715ae10-4b33-11e4-ab6d-005056801329','dcaad81c-4b33-11e4-ab6d-005056801329'),(1368,'Волноваський','e4ac4172-4b33-11e4-ab6d-005056801329','e7163d75-4b33-11e4-ab6d-005056801329','dcaad81c-4b33-11e4-ab6d-005056801329'),(1369,'Вугледарська','e4aca2f6-4b33-11e4-ab6d-005056801329','e7165c0f-4b33-11e4-ab6d-005056801329','dcaad81c-4b33-11e4-ab6d-005056801329'),(1370,'Горлівська','e4aca40f-4b33-11e4-ab6d-005056801329','e716afbb-4b33-11e4-ab6d-005056801329','dcaad81c-4b33-11e4-ab6d-005056801329'),(1371,'Горлівський','30416fcf-46ed-11ec-80fb-b8830365bd04','00000000-0000-0000-0000-000000000000','dcaad81c-4b33-11e4-ab6d-005056801329'),(1372,'Дебальцівська','e4aca4e3-4b33-11e4-ab6d-005056801329','e716f1a5-4b33-11e4-ab6d-005056801329','dcaad81c-4b33-11e4-ab6d-005056801329'),(1373,'Добропільська','e4aca743-4b33-11e4-ab6d-005056801329','e71739a6-4b33-11e4-ab6d-005056801329','dcaad81c-4b33-11e4-ab6d-005056801329'),(1374,'Добропільський','e4ac7281-4b33-11e4-ab6d-005056801329','e71739a6-4b33-11e4-ab6d-005056801329','dcaad81c-4b33-11e4-ab6d-005056801329'),(1375,'Докучаєвська','e4aca816-4b33-11e4-ab6d-005056801329','e7173fbe-4b33-11e4-ab6d-005056801329','dcaad81c-4b33-11e4-ab6d-005056801329'),(1376,'Донецька','e4aca8ee-4b33-11e4-ab6d-005056801329','e7174c0e-4b33-11e4-ab6d-005056801329','dcaad81c-4b33-11e4-ab6d-005056801329'),(1377,'Донецький','a5361e03-46ec-11ec-80fb-b8830365bd04','00000000-0000-0000-0000-000000000000','dcaad81c-4b33-11e4-ab6d-005056801329'),(1378,'Дружківська','e4aca9bc-4b33-11e4-ab6d-005056801329','e7175cf7-4b33-11e4-ab6d-005056801329','dcaad81c-4b33-11e4-ab6d-005056801329'),(1379,'Єнакієвська','e4acaa8b-4b33-11e4-ab6d-005056801329','e71798de-4b33-11e4-ab6d-005056801329','dcaad81c-4b33-11e4-ab6d-005056801329'),(1380,'Жданівська','e4acab54-4b33-11e4-ab6d-005056801329','e7179edc-4b33-11e4-ab6d-005056801329','dcaad81c-4b33-11e4-ab6d-005056801329'),(1381,'Кальміуський','18e2690d-46ed-11ec-80fb-b8830365bd04','00000000-0000-0000-0000-000000000000','dcaad81c-4b33-11e4-ab6d-005056801329'),(1382,'Кіровська','e4acac21-4b33-11e4-ab6d-005056801329','e718b969-4b33-11e4-ab6d-005056801329','dcaad81c-4b33-11e4-ab6d-005056801329'),(1383,'Костянтинівський','e4ac73de-4b33-11e4-ab6d-005056801329','e719e4a9-4b33-11e4-ab6d-005056801329','dcaad81c-4b33-11e4-ab6d-005056801329'),(1384,'Краматорська','e4acace8-4b33-11e4-ab6d-005056801329','e719ecad-4b33-11e4-ab6d-005056801329','dcaad81c-4b33-11e4-ab6d-005056801329'),(1385,'Краматорський','e5b59c0d-46ec-11ec-80fb-b8830365bd04','e719ecad-4b33-11e4-ab6d-005056801329','dcaad81c-4b33-11e4-ab6d-005056801329'),(1386,'Лиманська','e4acadb9-4b33-11e4-ab6d-005056801329','e719f45e-4b33-11e4-ab6d-005056801329','dcaad81c-4b33-11e4-ab6d-005056801329'),(1387,'Лиманський','e4ac759c-4b33-11e4-ab6d-005056801329','e719f45e-4b33-11e4-ab6d-005056801329','dcaad81c-4b33-11e4-ab6d-005056801329'),(1388,'Макіївська','e4acaf74-4b33-11e4-ab6d-005056801329','e71ace56-4b33-11e4-ab6d-005056801329','dcaad81c-4b33-11e4-ab6d-005056801329'),(1389,'Мангушський','e4ac79f5-4b33-11e4-ab6d-005056801329','e71ad9c3-4b33-11e4-ab6d-005056801329','dcaad81c-4b33-11e4-ab6d-005056801329'),(1390,'Мар\'їнський','e4ac766e-4b33-11e4-ab6d-005056801329','e71adece-4b33-11e4-ab6d-005056801329','dcaad81c-4b33-11e4-ab6d-005056801329'),(1391,'Маріупольська','e4acb049-4b33-11e4-ab6d-005056801329','e71ae5e9-4b33-11e4-ab6d-005056801329','dcaad81c-4b33-11e4-ab6d-005056801329'),(1392,'Маріупольський','fb283fa6-46ec-11ec-80fb-b8830365bd04','e71ae5e9-4b33-11e4-ab6d-005056801329','dcaad81c-4b33-11e4-ab6d-005056801329'),(1393,'Миколаївська (міська рада, Донецьк)','9476c083-414a-11e7-98ff-d4ae527baed4','e71b1542-4b33-11e4-ab6d-005056801329','dcaad81c-4b33-11e4-ab6d-005056801329'),(1394,'Миколаївська (міська територіальна громада)','256ba832-e6ed-11e7-b9e3-0025b501a04b','e71b1542-4b33-11e4-ab6d-005056801329','dcaad81c-4b33-11e4-ab6d-005056801329'),(1395,'Мирноградська','e4aca67d-4b33-11e4-ab6d-005056801329','e7170822-4b33-11e4-ab6d-005056801329','dcaad81c-4b33-11e4-ab6d-005056801329'),(1396,'Нікольський','e4ac42a9-4b33-11e4-ab6d-005056801329','e71645b0-4b33-11e4-ab6d-005056801329','dcaad81c-4b33-11e4-ab6d-005056801329'),(1397,'Новоазовський','e4ac7751-4b33-11e4-ab6d-005056801329','e71bdb52-4b33-11e4-ab6d-005056801329','dcaad81c-4b33-11e4-ab6d-005056801329'),(1398,'Новогродівська','e4acb127-4b33-11e4-ab6d-005056801329','e71c0174-4b33-11e4-ab6d-005056801329','dcaad81c-4b33-11e4-ab6d-005056801329'),(1399,'Олександрівський','e4ac7832-4b33-11e4-ab6d-005056801329','e71c3239-4b33-11e4-ab6d-005056801329','dcaad81c-4b33-11e4-ab6d-005056801329'),(1400,'Покровська','e4acae91-4b33-11e4-ab6d-005056801329','e71a0c98-4b33-11e4-ab6d-005056801329','dcaad81c-4b33-11e4-ab6d-005056801329'),(1401,'Покровський','e4ac74c5-4b33-11e4-ab6d-005056801329','e71a0c98-4b33-11e4-ab6d-005056801329','dcaad81c-4b33-11e4-ab6d-005056801329'),(1402,'Селидівська','e4acb209-4b33-11e4-ab6d-005056801329','e71db909-4b33-11e4-ab6d-005056801329','dcaad81c-4b33-11e4-ab6d-005056801329'),(1403,'Слов\'янська','e4acb2e5-4b33-11e4-ab6d-005056801329','e71e1d9c-4b33-11e4-ab6d-005056801329','dcaad81c-4b33-11e4-ab6d-005056801329'),(1404,'Слов\'янський','e4ac7af8-4b33-11e4-ab6d-005056801329','e71e1d9c-4b33-11e4-ab6d-005056801329','dcaad81c-4b33-11e4-ab6d-005056801329'),(1405,'Сніжнянська','e4acb3c2-4b33-11e4-ab6d-005056801329','e71e298e-4b33-11e4-ab6d-005056801329','dcaad81c-4b33-11e4-ab6d-005056801329'),(1406,'Старобешівський','e4ac7bd7-4b33-11e4-ab6d-005056801329','e71e58df-4b33-11e4-ab6d-005056801329','dcaad81c-4b33-11e4-ab6d-005056801329'),(1407,'Тельманівський','e4ac7cb2-4b33-11e4-ab6d-005056801329','e71eea62-4b33-11e4-ab6d-005056801329','dcaad81c-4b33-11e4-ab6d-005056801329'),(1408,'Торезька','e4acb49f-4b33-11e4-ab6d-005056801329','e71f2e84-4b33-11e4-ab6d-005056801329','dcaad81c-4b33-11e4-ab6d-005056801329'),(1409,'Торецька','e4aca5b5-4b33-11e4-ab6d-005056801329','e7170088-4b33-11e4-ab6d-005056801329','dcaad81c-4b33-11e4-ab6d-005056801329'),(1410,'Харцизька','e4acb573-4b33-11e4-ab6d-005056801329','e71f8a21-4b33-11e4-ab6d-005056801329','dcaad81c-4b33-11e4-ab6d-005056801329'),(1411,'Шахтарська','e4acb648-4b33-11e4-ab6d-005056801329','e720326c-4b33-11e4-ab6d-005056801329','dcaad81c-4b33-11e4-ab6d-005056801329'),(1412,'Шахтарський','e4ac7d8d-4b33-11e4-ab6d-005056801329','e720326c-4b33-11e4-ab6d-005056801329','dcaad81c-4b33-11e4-ab6d-005056801329'),(1413,'Ясинуватський','e4ac7e60-4b33-11e4-ab6d-005056801329','e720cdae-4b33-11e4-ab6d-005056801329','dcaad81c-4b33-11e4-ab6d-005056801329'),(1414,'Андрушівський','e4ab188d-4b33-11e4-ab6d-005056801329','e7141f0f-4b33-11e4-ab6d-005056801329','dcaad8fb-4b33-11e4-ab6d-005056801329'),(1415,'Баранівський','e4ab1a18-4b33-11e4-ab6d-005056801329','e7144c3d-4b33-11e4-ab6d-005056801329','dcaad8fb-4b33-11e4-ab6d-005056801329'),(1416,'Бердичівська','e4abe38b-4b33-11e4-ab6d-005056801329','e7145e37-4b33-11e4-ab6d-005056801329','dcaad8fb-4b33-11e4-ab6d-005056801329'),(1417,'Бердичівський','e4ab1b09-4b33-11e4-ab6d-005056801329','e7145e37-4b33-11e4-ab6d-005056801329','dcaad8fb-4b33-11e4-ab6d-005056801329'),(1418,'Брусилівський','e4ab1bf3-4b33-11e4-ab6d-005056801329','e715774c-4b33-11e4-ab6d-005056801329','dcaad8fb-4b33-11e4-ab6d-005056801329'),(1419,'Ємільчинський','e4ab1def-4b33-11e4-ab6d-005056801329','e717947f-4b33-11e4-ab6d-005056801329','dcaad8fb-4b33-11e4-ab6d-005056801329'),(1420,'Житомирський','e4ab1eb0-4b33-11e4-ab6d-005056801329','e717a3d0-4b33-11e4-ab6d-005056801329','dcaad8fb-4b33-11e4-ab6d-005056801329'),(1421,'Звягельський','579aaeef-27b9-11ef-99eb-48df37b91f4a','00000000-0000-0000-0000-000000000000','dcaad8fb-4b33-11e4-ab6d-005056801329'),(1422,'Коростенський','e4ab2e10-4b33-11e4-ab6d-005056801329','e719a8d9-4b33-11e4-ab6d-005056801329','dcaad8fb-4b33-11e4-ab6d-005056801329'),(1423,'Коростишівський','e4ab2ee6-4b33-11e4-ab6d-005056801329','e719aada-4b33-11e4-ab6d-005056801329','dcaad8fb-4b33-11e4-ab6d-005056801329'),(1424,'Лугинський','e4ab2fc5-4b33-11e4-ab6d-005056801329','e71aafe2-4b33-11e4-ab6d-005056801329','dcaad8fb-4b33-11e4-ab6d-005056801329'),(1425,'Любарський','e4ab308d-4b33-11e4-ab6d-005056801329','e71abd9d-4b33-11e4-ab6d-005056801329','dcaad8fb-4b33-11e4-ab6d-005056801329'),(1426,'Малинський','e4ab3155-4b33-11e4-ab6d-005056801329','e71ad60a-4b33-11e4-ab6d-005056801329','dcaad8fb-4b33-11e4-ab6d-005056801329'),(1427,'Народицький','e4ab3211-4b33-11e4-ab6d-005056801329','e71b6e0d-4b33-11e4-ab6d-005056801329','dcaad8fb-4b33-11e4-ab6d-005056801329'),(1428,'Новоград-Волинський','e4ab32de-4b33-11e4-ab6d-005056801329','e71bfd49-4b33-11e4-ab6d-005056801329','dcaad8fb-4b33-11e4-ab6d-005056801329'),(1429,'Овруцький','e4ab33b2-4b33-11e4-ab6d-005056801329','e71c28c8-4b33-11e4-ab6d-005056801329','dcaad8fb-4b33-11e4-ab6d-005056801329'),(1430,'Олевський','e4ab3479-4b33-11e4-ab6d-005056801329','e71c3008-4b33-11e4-ab6d-005056801329','dcaad8fb-4b33-11e4-ab6d-005056801329'),(1431,'Попільнянський','e4ab5148-4b33-11e4-ab6d-005056801329','e71d0fd4-4b33-11e4-ab6d-005056801329','dcaad8fb-4b33-11e4-ab6d-005056801329'),(1432,'Пулинський','e4ab54b1-4b33-11e4-ab6d-005056801329','e71fda42-4b33-11e4-ab6d-005056801329','dcaad8fb-4b33-11e4-ab6d-005056801329'),(1433,'Радомишльський','e4ab5243-4b33-11e4-ab6d-005056801329','e71d3c02-4b33-11e4-ab6d-005056801329','dcaad8fb-4b33-11e4-ab6d-005056801329'),(1434,'Романівський','e4ab5311-4b33-11e4-ab6d-005056801329','e71d8512-4b33-11e4-ab6d-005056801329','dcaad8fb-4b33-11e4-ab6d-005056801329'),(1435,'Ружинський','e4ab53de-4b33-11e4-ab6d-005056801329','e71d8eaa-4b33-11e4-ab6d-005056801329','dcaad8fb-4b33-11e4-ab6d-005056801329'),(1436,'Хорошівський','e4ab1ce7-4b33-11e4-ab6d-005056801329','e71643a3-4b33-11e4-ab6d-005056801329','dcaad8fb-4b33-11e4-ab6d-005056801329'),(1437,'Черняхівський','e4ab557b-4b33-11e4-ab6d-005056801329','e71fefe5-4b33-11e4-ab6d-005056801329','dcaad8fb-4b33-11e4-ab6d-005056801329'),(1438,'Чуднівський','e4ab5646-4b33-11e4-ab6d-005056801329','e7202ce9-4b33-11e4-ab6d-005056801329','dcaad8fb-4b33-11e4-ab6d-005056801329'),(1439,'Берегівська','e4ab73df-4b33-11e4-ab6d-005056801329','e7146254-4b33-11e4-ab6d-005056801329','dcaad993-4b33-11e4-ab6d-005056801329'),(1440,'Берегівський','e4ab5707-4b33-11e4-ab6d-005056801329','e7146254-4b33-11e4-ab6d-005056801329','dcaad993-4b33-11e4-ab6d-005056801329'),(1441,'Великоберезнянський','e4ab57cd-4b33-11e4-ab6d-005056801329','e715b520-4b33-11e4-ab6d-005056801329','dcaad993-4b33-11e4-ab6d-005056801329'),(1442,'Виноградівський','e4ab58a6-4b33-11e4-ab6d-005056801329','e7160798-4b33-11e4-ab6d-005056801329','dcaad993-4b33-11e4-ab6d-005056801329'),(1443,'Воловецький','e4ab596b-4b33-11e4-ab6d-005056801329','e7163f5a-4b33-11e4-ab6d-005056801329','dcaad993-4b33-11e4-ab6d-005056801329'),(1444,'Іршавський','e4ab5a36-4b33-11e4-ab6d-005056801329','e71857c4-4b33-11e4-ab6d-005056801329','dcaad993-4b33-11e4-ab6d-005056801329'),(1445,'Міжгірський','e4ab5afa-4b33-11e4-ab6d-005056801329','e71b43e0-4b33-11e4-ab6d-005056801329','dcaad993-4b33-11e4-ab6d-005056801329'),(1446,'Мукачівський','e4ab5bc2-4b33-11e4-ab6d-005056801329','e71b6807-4b33-11e4-ab6d-005056801329','dcaad993-4b33-11e4-ab6d-005056801329'),(1447,'Перечинський','e4ab5c8a-4b33-11e4-ab6d-005056801329','e71ca81f-4b33-11e4-ab6d-005056801329','dcaad993-4b33-11e4-ab6d-005056801329'),(1448,'Рахівський','e4ab5d50-4b33-11e4-ab6d-005056801329','e71d5ef7-4b33-11e4-ab6d-005056801329','dcaad993-4b33-11e4-ab6d-005056801329'),(1449,'Свалявський','e4ab5e16-4b33-11e4-ab6d-005056801329','e71da76b-4b33-11e4-ab6d-005056801329','dcaad993-4b33-11e4-ab6d-005056801329'),(1450,'Тячівський','e4ab5eee-4b33-11e4-ab6d-005056801329','e71f4661-4b33-11e4-ab6d-005056801329','dcaad993-4b33-11e4-ab6d-005056801329'),(1451,'Ужгородський','e4ab720f-4b33-11e4-ab6d-005056801329','e71f4773-4b33-11e4-ab6d-005056801329','dcaad993-4b33-11e4-ab6d-005056801329'),(1452,'Хустська','e4ac0f42-4b33-11e4-ab6d-005056801329','e71fbd47-4b33-11e4-ab6d-005056801329','dcaad993-4b33-11e4-ab6d-005056801329'),(1453,'Хустський','e4ab7316-4b33-11e4-ab6d-005056801329','e71fbd47-4b33-11e4-ab6d-005056801329','dcaad993-4b33-11e4-ab6d-005056801329'),(1454,'Чопська','e4ab74ad-4b33-11e4-ab6d-005056801329','e71ffc61-4b33-11e4-ab6d-005056801329','dcaad993-4b33-11e4-ab6d-005056801329'),(1455,'Бердянська','4347f955-0336-11e7-ac81-d4ae52907a28','e7146044-4b33-11e4-ab6d-005056801329','dcaada26-4b33-11e4-ab6d-005056801329'),(1456,'Бердянський','e4ab7577-4b33-11e4-ab6d-005056801329','e7146044-4b33-11e4-ab6d-005056801329','dcaada26-4b33-11e4-ab6d-005056801329'),(1457,'Більмацький','e4ab7bd9-4b33-11e4-ab6d-005056801329','e71a3a8e-4b33-11e4-ab6d-005056801329','dcaada26-4b33-11e4-ab6d-005056801329'),(1458,'Василівський','e4ab7632-4b33-11e4-ab6d-005056801329','e7158e7c-4b33-11e4-ab6d-005056801329','dcaada26-4b33-11e4-ab6d-005056801329'),(1459,'Великобілозерський','e4ab76ff-4b33-11e4-ab6d-005056801329','e715a231-4b33-11e4-ab6d-005056801329','dcaada26-4b33-11e4-ab6d-005056801329'),(1460,'Веселівський','e4ab77d3-4b33-11e4-ab6d-005056801329','e715dd8d-4b33-11e4-ab6d-005056801329','dcaada26-4b33-11e4-ab6d-005056801329'),(1461,'Вільнянський','e4ab789b-4b33-11e4-ab6d-005056801329','e71623b3-4b33-11e4-ab6d-005056801329','dcaada26-4b33-11e4-ab6d-005056801329'),(1462,'Гуляйпільський','e4ab7967-4b33-11e4-ab6d-005056801329','e716e53a-4b33-11e4-ab6d-005056801329','dcaada26-4b33-11e4-ab6d-005056801329'),(1463,'Енергодарська','e4abe4ff-4b33-11e4-ab6d-005056801329','e7178f07-4b33-11e4-ab6d-005056801329','dcaada26-4b33-11e4-ab6d-005056801329'),(1464,'Запорізький','e4ab7a38-4b33-11e4-ab6d-005056801329','e717bce9-4b33-11e4-ab6d-005056801329','dcaada26-4b33-11e4-ab6d-005056801329'),(1465,'Кам\'янсько-Дніпровський','e4ab7b00-4b33-11e4-ab6d-005056801329','e71877ef-4b33-11e4-ab6d-005056801329','dcaada26-4b33-11e4-ab6d-005056801329'),(1466,'Мелітопольський','e4ab7ccd-4b33-11e4-ab6d-005056801329','e71b08f0-4b33-11e4-ab6d-005056801329','dcaada26-4b33-11e4-ab6d-005056801329'),(1467,'Михайлівський','e4ab7d96-4b33-11e4-ab6d-005056801329','e71b3fcc-4b33-11e4-ab6d-005056801329','dcaada26-4b33-11e4-ab6d-005056801329'),(1468,'Новомиколаївський','e4ab7e62-4b33-11e4-ab6d-005056801329','e71c076a-4b33-11e4-ab6d-005056801329','dcaada26-4b33-11e4-ab6d-005056801329'),(1469,'Оріхівський','e4ab7f32-4b33-11e4-ab6d-005056801329','e71c4dbd-4b33-11e4-ab6d-005056801329','dcaada26-4b33-11e4-ab6d-005056801329'),(1470,'Пологівський','e4ab7ff6-4b33-11e4-ab6d-005056801329','0dbb4384-4b3a-11e4-ab6d-005056801329','dcaada26-4b33-11e4-ab6d-005056801329'),(1471,'Приазовський','e4ab80d1-4b33-11e4-ab6d-005056801329','e71d139c-4b33-11e4-ab6d-005056801329','dcaada26-4b33-11e4-ab6d-005056801329'),(1472,'Приморський','e4ab819e-4b33-11e4-ab6d-005056801329','e71d1744-4b33-11e4-ab6d-005056801329','dcaada26-4b33-11e4-ab6d-005056801329'),(1473,'Розівський','e4ab826a-4b33-11e4-ab6d-005056801329','e71d7ce1-4b33-11e4-ab6d-005056801329','dcaada26-4b33-11e4-ab6d-005056801329'),(1474,'Токмацький','e4ab8334-4b33-11e4-ab6d-005056801329','e71f2312-4b33-11e4-ab6d-005056801329','dcaada26-4b33-11e4-ab6d-005056801329'),(1475,'Чернігівський','e4ab83fc-4b33-11e4-ab6d-005056801329','e71feb5c-4b33-11e4-ab6d-005056801329','dcaada26-4b33-11e4-ab6d-005056801329'),(1476,'Якимівський','e4ab84d6-4b33-11e4-ab6d-005056801329','e7207ef5-4b33-11e4-ab6d-005056801329','dcaada26-4b33-11e4-ab6d-005056801329'),(1477,'Богородчанський','e4aafa6c-4b33-11e4-ab6d-005056801329','e714d0a1-4b33-11e4-ab6d-005056801329','dcaadac6-4b33-11e4-ab6d-005056801329'),(1478,'Болехівська','e4ab126e-4b33-11e4-ab6d-005056801329','e714dc1f-4b33-11e4-ab6d-005056801329','dcaadac6-4b33-11e4-ab6d-005056801329'),(1479,'Бурштинська','e4b0c6ca-4b33-11e4-ab6d-005056801329','e7157df5-4b33-11e4-ab6d-005056801329','dcaadac6-4b33-11e4-ab6d-005056801329'),(1480,'Верховинський','e4aafb2f-4b33-11e4-ab6d-005056801329','e715dba0-4b33-11e4-ab6d-005056801329','dcaadac6-4b33-11e4-ab6d-005056801329'),(1481,'Галицький','e4ab087e-4b33-11e4-ab6d-005056801329','e716636c-4b33-11e4-ab6d-005056801329','dcaadac6-4b33-11e4-ab6d-005056801329'),(1482,'Городенківський','e4ab0960-4b33-11e4-ab6d-005056801329','e716b7f8-4b33-11e4-ab6d-005056801329','dcaadac6-4b33-11e4-ab6d-005056801329'),(1483,'Долинський','e4ab0a3e-4b33-11e4-ab6d-005056801329','e71741d1-4b33-11e4-ab6d-005056801329','dcaadac6-4b33-11e4-ab6d-005056801329'),(1484,'Івано-Франківська','e4ab1332-4b33-11e4-ab6d-005056801329','e7182b3c-4b33-11e4-ab6d-005056801329','dcaadac6-4b33-11e4-ab6d-005056801329'),(1485,'Івано-Франківський','47e52035-46ed-11ec-80fb-b8830365bd04','e7182b3c-4b33-11e4-ab6d-005056801329','dcaadac6-4b33-11e4-ab6d-005056801329'),(1486,'Калуський','e4ab0b2b-4b33-11e4-ab6d-005056801329','e7186af2-4b33-11e4-ab6d-005056801329','dcaadac6-4b33-11e4-ab6d-005056801329'),(1487,'Коломийський','e4ab0bf6-4b33-11e4-ab6d-005056801329','e71917a2-4b33-11e4-ab6d-005056801329','dcaadac6-4b33-11e4-ab6d-005056801329'),(1488,'Косівський','e4ab0cc1-4b33-11e4-ab6d-005056801329','e719b43c-4b33-11e4-ab6d-005056801329','dcaadac6-4b33-11e4-ab6d-005056801329'),(1489,'Надвірнянський','e4ab0d84-4b33-11e4-ab6d-005056801329','e71b6c11-4b33-11e4-ab6d-005056801329','dcaadac6-4b33-11e4-ab6d-005056801329'),(1490,'Рогатинський','e4ab0e8e-4b33-11e4-ab6d-005056801329','e71d6fd6-4b33-11e4-ab6d-005056801329','dcaadac6-4b33-11e4-ab6d-005056801329'),(1491,'Рожнятівський','e4ab0f52-4b33-11e4-ab6d-005056801329','e71d75d7-4b33-11e4-ab6d-005056801329','dcaadac6-4b33-11e4-ab6d-005056801329'),(1492,'Снятинський','e4ab1014-4b33-11e4-ab6d-005056801329','e71e2d88-4b33-11e4-ab6d-005056801329','dcaadac6-4b33-11e4-ab6d-005056801329'),(1493,'Тисменицький','e4ab10d8-4b33-11e4-ab6d-005056801329','e71f037d-4b33-11e4-ab6d-005056801329','dcaadac6-4b33-11e4-ab6d-005056801329'),(1494,'Тлумацький','e4ab11a7-4b33-11e4-ab6d-005056801329','e71f0524-4b33-11e4-ab6d-005056801329','dcaadac6-4b33-11e4-ab6d-005056801329'),(1495,'Яремчанська','e4ab13fb-4b33-11e4-ab6d-005056801329','e720ae12-4b33-11e4-ab6d-005056801329','dcaadac6-4b33-11e4-ab6d-005056801329'),(1496,'Баришівський','e4ab14be-4b33-11e4-ab6d-005056801329','e714506a-4b33-11e4-ab6d-005056801329','dcaadb64-4b33-11e4-ab6d-005056801329'),(1497,'Березанська','e4af639e-4b33-11e4-ab6d-005056801329','e7146c98-4b33-11e4-ab6d-005056801329','dcaadb64-4b33-11e4-ab6d-005056801329'),(1498,'Білоцерківський','e4ab1570-4b33-11e4-ab6d-005056801329','e7148607-4b33-11e4-ab6d-005056801329','dcaadb64-4b33-11e4-ab6d-005056801329'),(1499,'Богуславський','e4ab1633-4b33-11e4-ab6d-005056801329','e714d49f-4b33-11e4-ab6d-005056801329','dcaadb64-4b33-11e4-ab6d-005056801329'),(1500,'Бориспільський','e4ab16fa-4b33-11e4-ab6d-005056801329','e714e1ce-4b33-11e4-ab6d-005056801329','dcaadb64-4b33-11e4-ab6d-005056801329'),(1501,'Бородянський','e4ab17c3-4b33-11e4-ab6d-005056801329','e7155d19-4b33-11e4-ab6d-005056801329','dcaadb64-4b33-11e4-ab6d-005056801329'),(1502,'Броварський','e4aeec8a-4b33-11e4-ab6d-005056801329','e715719e-4b33-11e4-ab6d-005056801329','dcaadb64-4b33-11e4-ab6d-005056801329'),(1503,'Бучанська','e4af6488-4b33-11e4-ab6d-005056801329','e71583e9-4b33-11e4-ab6d-005056801329','dcaadb64-4b33-11e4-ab6d-005056801329'),(1504,'Бучанський','9e1358ce-00e7-11ec-80fb-b8830365bd04','00000000-0000-0000-0000-000000000000','dcaadb64-4b33-11e4-ab6d-005056801329'),(1505,'Васильківський','e4aeed84-4b33-11e4-ab6d-005056801329','e715908a-4b33-11e4-ab6d-005056801329','dcaadb64-4b33-11e4-ab6d-005056801329'),(1506,'Вишгородський','e4aeee88-4b33-11e4-ab6d-005056801329','e7161148-4b33-11e4-ab6d-005056801329','dcaadb64-4b33-11e4-ab6d-005056801329'),(1507,'Володарський','e4aeef99-4b33-11e4-ab6d-005056801329','e71645b0-4b33-11e4-ab6d-005056801329','dcaadb64-4b33-11e4-ab6d-005056801329'),(1508,'Згурівський','e4aef0be-4b33-11e4-ab6d-005056801329','e717ddad-4b33-11e4-ab6d-005056801329','dcaadb64-4b33-11e4-ab6d-005056801329'),(1509,'Іванківський','e4aef1ee-4b33-11e4-ab6d-005056801329','e71829ec-4b33-11e4-ab6d-005056801329','dcaadb64-4b33-11e4-ab6d-005056801329'),(1510,'Ірпінська','e4af656a-4b33-11e4-ab6d-005056801329','e718466d-4b33-11e4-ab6d-005056801329','dcaadb64-4b33-11e4-ab6d-005056801329'),(1511,'Кагарлицький','e4aef2cf-4b33-11e4-ab6d-005056801329','e7185d91-4b33-11e4-ab6d-005056801329','dcaadb64-4b33-11e4-ab6d-005056801329'),(1512,'Києво-Святошинський','e4aef3b0-4b33-11e4-ab6d-005056801329','e718a680-4b33-11e4-ab6d-005056801329','dcaadb64-4b33-11e4-ab6d-005056801329'),(1513,'Макарівський','e4aef48a-4b33-11e4-ab6d-005056801329','e71acc82-4b33-11e4-ab6d-005056801329','dcaadb64-4b33-11e4-ab6d-005056801329'),(1514,'Миронівський','e4aef57f-4b33-11e4-ab6d-005056801329','e71b21cd-4b33-11e4-ab6d-005056801329','dcaadb64-4b33-11e4-ab6d-005056801329'),(1515,'Обухівська','e4b12f2d-4b33-11e4-ab6d-005056801329','e71c2470-4b33-11e4-ab6d-005056801329','dcaadb64-4b33-11e4-ab6d-005056801329'),(1516,'Обухівський','e4aef674-4b33-11e4-ab6d-005056801329','e71c2470-4b33-11e4-ab6d-005056801329','dcaadb64-4b33-11e4-ab6d-005056801329'),(1517,'Переяслав-Хмельницький','e4aef767-4b33-11e4-ab6d-005056801329','e71cadf6-4b33-11e4-ab6d-005056801329','dcaadb64-4b33-11e4-ab6d-005056801329'),(1518,'Поліський','e4aef855-4b33-11e4-ab6d-005056801329','e71a20ea-4b33-11e4-ab6d-005056801329','dcaadb64-4b33-11e4-ab6d-005056801329'),(1519,'Ржищівська','e4af664b-4b33-11e4-ab6d-005056801329','e71d649a-4b33-11e4-ab6d-005056801329','dcaadb64-4b33-11e4-ab6d-005056801329'),(1520,'Рокитнянський','e4aef948-4b33-11e4-ab6d-005056801329','e71d7ef8-4b33-11e4-ab6d-005056801329','dcaadb64-4b33-11e4-ab6d-005056801329'),(1521,'Сквирський','e4aefa36-4b33-11e4-ab6d-005056801329','e71e1034-4b33-11e4-ab6d-005056801329','dcaadb64-4b33-11e4-ab6d-005056801329'),(1522,'Славутицька','e4af673a-4b33-11e4-ab6d-005056801329','e71e175d-4b33-11e4-ab6d-005056801329','dcaadb64-4b33-11e4-ab6d-005056801329'),(1523,'Ставищенський','e4aefb2f-4b33-11e4-ab6d-005056801329','e71e4b3b-4b33-11e4-ab6d-005056801329','dcaadb64-4b33-11e4-ab6d-005056801329'),(1524,'Таращанський','e4af5d29-4b33-11e4-ab6d-005056801329','e71ee1f9-4b33-11e4-ab6d-005056801329','dcaadb64-4b33-11e4-ab6d-005056801329'),(1525,'Тетіївський','e4af5ec9-4b33-11e4-ab6d-005056801329','e71efe5b-4b33-11e4-ab6d-005056801329','dcaadb64-4b33-11e4-ab6d-005056801329'),(1526,'Фастівський','e4af6125-4b33-11e4-ab6d-005056801329','e71f7d49-4b33-11e4-ab6d-005056801329','dcaadb64-4b33-11e4-ab6d-005056801329'),(1527,'Яготинський','e4af6263-4b33-11e4-ab6d-005056801329','e7207d1a-4b33-11e4-ab6d-005056801329','dcaadb64-4b33-11e4-ab6d-005056801329'),(1528,'Благовіщенський','e4b0d307-4b33-11e4-ab6d-005056801329','e71f7424-4b33-11e4-ab6d-005056801329','dcaadbf9-4b33-11e4-ab6d-005056801329'),(1529,'Бобринецький','e4af682d-4b33-11e4-ab6d-005056801329','e714c765-4b33-11e4-ab6d-005056801329','dcaadbf9-4b33-11e4-ab6d-005056801329'),(1530,'Вільшанський','e4af68f7-4b33-11e4-ab6d-005056801329','e716285a-4b33-11e4-ab6d-005056801329','dcaadbf9-4b33-11e4-ab6d-005056801329'),(1531,'Гайворонський','e4af69d0-4b33-11e4-ab6d-005056801329','e7165fe2-4b33-11e4-ab6d-005056801329','dcaadbf9-4b33-11e4-ab6d-005056801329'),(1532,'Голованівський','e4af6aa2-4b33-11e4-ab6d-005056801329','e716a9d1-4b33-11e4-ab6d-005056801329','dcaadbf9-4b33-11e4-ab6d-005056801329'),(1533,'Добровеличківський','e4af6b77-4b33-11e4-ab6d-005056801329','e7171786-4b33-11e4-ab6d-005056801329','dcaadbf9-4b33-11e4-ab6d-005056801329'),(1534,'Долинський','e4af6c47-4b33-11e4-ab6d-005056801329','e71741d1-4b33-11e4-ab6d-005056801329','dcaadbf9-4b33-11e4-ab6d-005056801329'),(1535,'Знам\'янська','e4b0d4c8-4b33-11e4-ab6d-005056801329','e7180c5d-4b33-11e4-ab6d-005056801329','dcaadbf9-4b33-11e4-ab6d-005056801329'),(1536,'Знам\'янський','e4af6d27-4b33-11e4-ab6d-005056801329','e7180c5d-4b33-11e4-ab6d-005056801329','dcaadbf9-4b33-11e4-ab6d-005056801329'),(1537,'Кіровоградська','e4b0d5a1-4b33-11e4-ab6d-005056801329','e718b361-4b33-11e4-ab6d-005056801329','dcaadbf9-4b33-11e4-ab6d-005056801329'),(1538,'Кіровоградський','e4b0c87e-4b33-11e4-ab6d-005056801329','e718b361-4b33-11e4-ab6d-005056801329','dcaadbf9-4b33-11e4-ab6d-005056801329'),(1539,'Компаніївський','e4b0c977-4b33-11e4-ab6d-005056801329','e7191f63-4b33-11e4-ab6d-005056801329','dcaadbf9-4b33-11e4-ab6d-005056801329'),(1540,'Кропивницький ','65511708-46ed-11ec-80fb-b8830365bd04','e718b361-4b33-11e4-ab6d-005056801329','dcaadbf9-4b33-11e4-ab6d-005056801329'),(1541,'Маловисківський','e4b0ca6d-4b33-11e4-ab6d-005056801329','e71ad245-4b33-11e4-ab6d-005056801329','dcaadbf9-4b33-11e4-ab6d-005056801329'),(1542,'Новгородківський','e4b0cb51-4b33-11e4-ab6d-005056801329','e71bb05f-4b33-11e4-ab6d-005056801329','dcaadbf9-4b33-11e4-ab6d-005056801329'),(1543,'Новоархангельський','e4b0cc2c-4b33-11e4-ab6d-005056801329','e71bdf16-4b33-11e4-ab6d-005056801329','dcaadbf9-4b33-11e4-ab6d-005056801329'),(1544,'Новомиргородський','e4b0cd03-4b33-11e4-ab6d-005056801329','e71c0955-4b33-11e4-ab6d-005056801329','dcaadbf9-4b33-11e4-ab6d-005056801329'),(1545,'Новоукраїнський','e4b0cde1-4b33-11e4-ab6d-005056801329','e71c16bd-4b33-11e4-ab6d-005056801329','dcaadbf9-4b33-11e4-ab6d-005056801329'),(1546,'Олександрівський','e4b0ceb9-4b33-11e4-ab6d-005056801329','e71c3239-4b33-11e4-ab6d-005056801329','dcaadbf9-4b33-11e4-ab6d-005056801329'),(1547,'Олександрійська','e4b1308f-4b33-11e4-ab6d-005056801329','e71c38b4-4b33-11e4-ab6d-005056801329','dcaadbf9-4b33-11e4-ab6d-005056801329'),(1548,'Олександрійський','e4b0cf93-4b33-11e4-ab6d-005056801329','e71c38b4-4b33-11e4-ab6d-005056801329','dcaadbf9-4b33-11e4-ab6d-005056801329'),(1549,'Онуфріївський','e4b0d06c-4b33-11e4-ab6d-005056801329','e71c41e0-4b33-11e4-ab6d-005056801329','dcaadbf9-4b33-11e4-ab6d-005056801329'),(1550,'Петрівський','e4b0d145-4b33-11e4-ab6d-005056801329','e71cbc24-4b33-11e4-ab6d-005056801329','dcaadbf9-4b33-11e4-ab6d-005056801329'),(1551,'Світловодський','e4b0d223-4b33-11e4-ab6d-005056801329','e71daf97-4b33-11e4-ab6d-005056801329','dcaadbf9-4b33-11e4-ab6d-005056801329'),(1552,'Устинівський','e4b0d3e6-4b33-11e4-ab6d-005056801329','e71f7b54-4b33-11e4-ab6d-005056801329','dcaadbf9-4b33-11e4-ab6d-005056801329'),(1553,'Алчевська','e4ad5591-4b33-11e4-ab6d-005056801329','e7141098-4b33-11e4-ab6d-005056801329','dcaadc91-4b33-11e4-ab6d-005056801329'),(1554,'Алчевський ','28d2628f-46ee-11ec-80fb-b8830365bd04','00000000-0000-0000-0000-000000000000','dcaadc91-4b33-11e4-ab6d-005056801329'),(1555,'Антрацитівська','e4ad54c7-4b33-11e4-ab6d-005056801329','e714239d-4b33-11e4-ab6d-005056801329','dcaadc91-4b33-11e4-ab6d-005056801329'),(1556,'Антрацитівський','e4b0d9d0-4b33-11e4-ab6d-005056801329','e714239d-4b33-11e4-ab6d-005056801329','dcaadc91-4b33-11e4-ab6d-005056801329'),(1557,'Біловодський','e4b1453f-4b33-11e4-ab6d-005056801329','e7149812-4b33-11e4-ab6d-005056801329','dcaadc91-4b33-11e4-ab6d-005056801329'),(1558,'Білокуракинський','e4b14453-4b33-11e4-ab6d-005056801329','e714b76d-4b33-11e4-ab6d-005056801329','dcaadc91-4b33-11e4-ab6d-005056801329'),(1559,'Брянківська','e4ad53fa-4b33-11e4-ab6d-005056801329','e715791f-4b33-11e4-ab6d-005056801329','dcaadc91-4b33-11e4-ab6d-005056801329'),(1560,'Довжанський','835c46b3-46ee-11ec-80fb-b8830365bd04','00000000-0000-0000-0000-000000000000','dcaadc91-4b33-11e4-ab6d-005056801329'),(1561,'Кіровська','e4ad532e-4b33-11e4-ab6d-005056801329','e718b54f-4b33-11e4-ab6d-005056801329','dcaadc91-4b33-11e4-ab6d-005056801329'),(1562,'Краснодонська','e4b131dc-4b33-11e4-ab6d-005056801329','e71a166d-4b33-11e4-ab6d-005056801329','dcaadc91-4b33-11e4-ab6d-005056801329'),(1563,'Краснодонський','e4b14357-4b33-11e4-ab6d-005056801329','e71a166d-4b33-11e4-ab6d-005056801329','dcaadc91-4b33-11e4-ab6d-005056801329'),(1564,'Краснолуцька','e4ad5255-4b33-11e4-ab6d-005056801329','e71a0891-4b33-11e4-ab6d-005056801329','dcaadc91-4b33-11e4-ab6d-005056801329'),(1565,'Кремінський','e4b14269-4b33-11e4-ab6d-005056801329','e71a28e2-4b33-11e4-ab6d-005056801329','dcaadc91-4b33-11e4-ab6d-005056801329'),(1566,'Лисичанська','e4ad518c-4b33-11e4-ab6d-005056801329','e71a7794-4b33-11e4-ab6d-005056801329','dcaadc91-4b33-11e4-ab6d-005056801329'),(1567,'Луганська','e4ad50bd-4b33-11e4-ab6d-005056801329','e71aaddb-4b33-11e4-ab6d-005056801329','dcaadc91-4b33-11e4-ab6d-005056801329'),(1568,'Луганський ','57e848be-46ee-11ec-80fb-b8830365bd04','00000000-0000-0000-0000-000000000000','dcaadc91-4b33-11e4-ab6d-005056801329'),(1569,'Лутугинський','e4b14185-4b33-11e4-ab6d-005056801329','e71ab5cd-4b33-11e4-ab6d-005056801329','dcaadc91-4b33-11e4-ab6d-005056801329'),(1570,'Марківський','e4b1409e-4b33-11e4-ab6d-005056801329','e71ae7ee-4b33-11e4-ab6d-005056801329','dcaadc91-4b33-11e4-ab6d-005056801329'),(1571,'Міловський','e4b13fbb-4b33-11e4-ab6d-005056801329','e71b47ac-4b33-11e4-ab6d-005056801329','dcaadc91-4b33-11e4-ab6d-005056801329'),(1572,'Новоайдарський','e4b13ed4-4b33-11e4-ab6d-005056801329','e71bdd2d-4b33-11e4-ab6d-005056801329','dcaadc91-4b33-11e4-ab6d-005056801329'),(1573,'Новопсковський','e4b13de8-4b33-11e4-ab6d-005056801329','e71c0d13-4b33-11e4-ab6d-005056801329','dcaadc91-4b33-11e4-ab6d-005056801329'),(1574,'Первомайська','e4ad4fe1-4b33-11e4-ab6d-005056801329','e71c7b62-4b33-11e4-ab6d-005056801329','dcaadc91-4b33-11e4-ab6d-005056801329'),(1575,'Перевальський','e4b13c94-4b33-11e4-ab6d-005056801329','e71ca270-4b33-11e4-ab6d-005056801329','dcaadc91-4b33-11e4-ab6d-005056801329'),(1576,'Попаснянський','e4b13b58-4b33-11e4-ab6d-005056801329','e71d09d5-4b33-11e4-ab6d-005056801329','dcaadc91-4b33-11e4-ab6d-005056801329'),(1577,'Ровеньківська','e4ad4ec8-4b33-11e4-ab6d-005056801329','e71d6bce-4b33-11e4-ab6d-005056801329','dcaadc91-4b33-11e4-ab6d-005056801329'),(1578,'Ровеньківський ','188772b1-46ee-11ec-80fb-b8830365bd04','00000000-0000-0000-0000-000000000000','dcaadc91-4b33-11e4-ab6d-005056801329'),(1579,'Рубіжанська','e4ad4dc6-4b33-11e4-ab6d-005056801329','e71d8af8-4b33-11e4-ab6d-005056801329','dcaadc91-4b33-11e4-ab6d-005056801329'),(1580,'Сватівський','e4b139f0-4b33-11e4-ab6d-005056801329','e71da9e6-4b33-11e4-ab6d-005056801329','dcaadc91-4b33-11e4-ab6d-005056801329'),(1581,'Свердловська','e4ad4ccd-4b33-11e4-ab6d-005056801329','e71dab78-4b33-11e4-ab6d-005056801329','dcaadc91-4b33-11e4-ab6d-005056801329'),(1582,'Свердловський','e4b13893-4b33-11e4-ab6d-005056801329','e71dab78-4b33-11e4-ab6d-005056801329','dcaadc91-4b33-11e4-ab6d-005056801329'),(1583,'Сєвєродонецька','e4ad4be0-4b33-11e4-ab6d-005056801329','e71dc336-4b33-11e4-ab6d-005056801329','dcaadc91-4b33-11e4-ab6d-005056801329'),(1584,'Сєвєродонецький ','42a1a705-46ee-11ec-80fb-b8830365bd04','e71dc336-4b33-11e4-ab6d-005056801329','dcaadc91-4b33-11e4-ab6d-005056801329'),(1585,'Слов\'яносербський','e4b13741-4b33-11e4-ab6d-005056801329','e71e1b8b-4b33-11e4-ab6d-005056801329','dcaadc91-4b33-11e4-ab6d-005056801329'),(1586,'Станично-Луганський','e4ad5806-4b33-11e4-ab6d-005056801329','e71e4d22-4b33-11e4-ab6d-005056801329','dcaadc91-4b33-11e4-ab6d-005056801329'),(1587,'Старобільський','e4ad572e-4b33-11e4-ab6d-005056801329','e71e5ac0-4b33-11e4-ab6d-005056801329','dcaadc91-4b33-11e4-ab6d-005056801329'),(1588,'Стахановська','e4ad4aa9-4b33-11e4-ab6d-005056801329','e71e625a-4b33-11e4-ab6d-005056801329','dcaadc91-4b33-11e4-ab6d-005056801329'),(1589,'Троїцький','e4ad565d-4b33-11e4-ab6d-005056801329','e71f3262-4b33-11e4-ab6d-005056801329','dcaadc91-4b33-11e4-ab6d-005056801329'),(1590,'Щастинський ','6b7bf153-46ee-11ec-80fb-b8830365bd04','e7206a48-4b33-11e4-ab6d-005056801329','dcaadc91-4b33-11e4-ab6d-005056801329'),(1591,'Бориславська','e4ad0d73-4b33-11e4-ab6d-005056801329','e714dfe2-4b33-11e4-ab6d-005056801329','dcaadd3a-4b33-11e4-ab6d-005056801329'),(1592,'Бродівський','e4ad1f7c-4b33-11e4-ab6d-005056801329','e7157381-4b33-11e4-ab6d-005056801329','dcaadd3a-4b33-11e4-ab6d-005056801329'),(1593,'Буський','e4ad1eab-4b33-11e4-ab6d-005056801329','e7157fcd-4b33-11e4-ab6d-005056801329','dcaadd3a-4b33-11e4-ab6d-005056801329'),(1594,'Городоцький','e4ad1dd5-4b33-11e4-ab6d-005056801329','e716c7cb-4b33-11e4-ab6d-005056801329','dcaadd3a-4b33-11e4-ab6d-005056801329'),(1595,'Дрогобицька','e4aa9e0c-4b33-11e4-ab6d-005056801329','e7175897-4b33-11e4-ab6d-005056801329','dcaadd3a-4b33-11e4-ab6d-005056801329'),(1596,'Дрогобицький','e4ad1d04-4b33-11e4-ab6d-005056801329','e7175897-4b33-11e4-ab6d-005056801329','dcaadd3a-4b33-11e4-ab6d-005056801329'),(1597,'Жидачівський','e4ad1c34-4b33-11e4-ab6d-005056801329','e717a28c-4b33-11e4-ab6d-005056801329','dcaadd3a-4b33-11e4-ab6d-005056801329'),(1598,'Жовківський','e4ad1b65-4b33-11e4-ab6d-005056801329','e717aa14-4b33-11e4-ab6d-005056801329','dcaadd3a-4b33-11e4-ab6d-005056801329'),(1599,'Золочівський','e4ad1a93-4b33-11e4-ab6d-005056801329','e71815c4-4b33-11e4-ab6d-005056801329','dcaadd3a-4b33-11e4-ab6d-005056801329'),(1600,'Кам\'янка-Бузький','e4ad19a9-4b33-11e4-ab6d-005056801329','e71875ee-4b33-11e4-ab6d-005056801329','dcaadd3a-4b33-11e4-ab6d-005056801329'),(1601,'Львівська','e4ad0c16-4b33-11e4-ab6d-005056801329','e71abb60-4b33-11e4-ab6d-005056801329','dcaadd3a-4b33-11e4-ab6d-005056801329'),(1602,'Львівський ','a6872bde-46ee-11ec-80fb-b8830365bd04','e71abb60-4b33-11e4-ab6d-005056801329','dcaadd3a-4b33-11e4-ab6d-005056801329'),(1603,'Миколаївський','e4ad1885-4b33-11e4-ab6d-005056801329','e71b108c-4b33-11e4-ab6d-005056801329','dcaadd3a-4b33-11e4-ab6d-005056801329'),(1604,'Моршинська','e4aceac8-4b33-11e4-ab6d-005056801329','e71b5ece-4b33-11e4-ab6d-005056801329','dcaadd3a-4b33-11e4-ab6d-005056801329'),(1605,'Мостиський','e4ad17ab-4b33-11e4-ab6d-005056801329','e71b6420-4b33-11e4-ab6d-005056801329','dcaadd3a-4b33-11e4-ab6d-005056801329'),(1606,'Новороздільська','e4ace9bd-4b33-11e4-ab6d-005056801329','e71bcdbf-4b33-11e4-ab6d-005056801329','dcaadd3a-4b33-11e4-ab6d-005056801329'),(1607,'Перемишлянський','e4ad16c1-4b33-11e4-ab6d-005056801329','e71ca641-4b33-11e4-ab6d-005056801329','dcaadd3a-4b33-11e4-ab6d-005056801329'),(1608,'Пустомитівський','e4ad150f-4b33-11e4-ab6d-005056801329','e71d1925-4b33-11e4-ab6d-005056801329','dcaadd3a-4b33-11e4-ab6d-005056801329'),(1609,'Радехівський','e4ad143b-4b33-11e4-ab6d-005056801329','e71d384c-4b33-11e4-ab6d-005056801329','dcaadd3a-4b33-11e4-ab6d-005056801329'),(1610,'Самбірська','e4aaf99d-4b33-11e4-ab6d-005056801329','e71d9862-4b33-11e4-ab6d-005056801329','dcaadd3a-4b33-11e4-ab6d-005056801329'),(1611,'Самбірський','e4ad1364-4b33-11e4-ab6d-005056801329','e71d9862-4b33-11e4-ab6d-005056801329','dcaadd3a-4b33-11e4-ab6d-005056801329'),(1612,'Сколівський','e4ad128b-4b33-11e4-ab6d-005056801329','e71e1252-4b33-11e4-ab6d-005056801329','dcaadd3a-4b33-11e4-ab6d-005056801329'),(1613,'Сокальський','e4ad11b4-4b33-11e4-ab6d-005056801329','e71e3166-4b33-11e4-ab6d-005056801329','dcaadd3a-4b33-11e4-ab6d-005056801329'),(1614,'Старосамбірський','e4ad10d9-4b33-11e4-ab6d-005056801329','e71e56f6-4b33-11e4-ab6d-005056801329','dcaadd3a-4b33-11e4-ab6d-005056801329'),(1615,'Стрийський','e4ad0ffd-4b33-11e4-ab6d-005056801329','e71e6cc4-4b33-11e4-ab6d-005056801329','dcaadd3a-4b33-11e4-ab6d-005056801329'),(1616,'Трускавецька','e4ace8c3-4b33-11e4-ab6d-005056801329','e71f3d7f-4b33-11e4-ab6d-005056801329','dcaadd3a-4b33-11e4-ab6d-005056801329'),(1617,'Турківський','e4ad0f24-4b33-11e4-ab6d-005056801329','e71f4495-4b33-11e4-ab6d-005056801329','dcaadd3a-4b33-11e4-ab6d-005056801329'),(1618,'Червоноградська','e4ace7d0-4b33-11e4-ab6d-005056801329','e71fdc29-4b33-11e4-ab6d-005056801329','dcaadd3a-4b33-11e4-ab6d-005056801329'),(1619,'Шептицький','15c849cd-0fa7-11ec-80fb-b8830365bd04','e71fdc29-4b33-11e4-ab6d-005056801329','dcaadd3a-4b33-11e4-ab6d-005056801329'),(1620,'Яворівський','e4ad0e48-4b33-11e4-ab6d-005056801329','e7207b35-4b33-11e4-ab6d-005056801329','dcaadd3a-4b33-11e4-ab6d-005056801329'),(1621,'Арбузинський','e4ace6fe-4b33-11e4-ab6d-005056801329','e714282f-4b33-11e4-ab6d-005056801329','dcaaddd7-4b33-11e4-ab6d-005056801329'),(1622,'Баштанський','e4ace61f-4b33-11e4-ab6d-005056801329','e71457d7-4b33-11e4-ab6d-005056801329','dcaaddd7-4b33-11e4-ab6d-005056801329'),(1623,'Березанський','e4ace553-4b33-11e4-ab6d-005056801329','e7146a8c-4b33-11e4-ab6d-005056801329','dcaaddd7-4b33-11e4-ab6d-005056801329'),(1624,'Березнегуватський','e4ace48a-4b33-11e4-ab6d-005056801329','e71477b6-4b33-11e4-ab6d-005056801329','dcaaddd7-4b33-11e4-ab6d-005056801329'),(1625,'Братський','e4ace3c7-4b33-11e4-ab6d-005056801329','e71569cc-4b33-11e4-ab6d-005056801329','dcaaddd7-4b33-11e4-ab6d-005056801329'),(1626,'Веселинівський','e4ace2f3-4b33-11e4-ab6d-005056801329','e715fe74-4b33-11e4-ab6d-005056801329','dcaaddd7-4b33-11e4-ab6d-005056801329'),(1627,'Вітовський','e4acdecc-4b33-11e4-ab6d-005056801329','e71b108c-4b33-11e4-ab6d-005056801329','dcaaddd7-4b33-11e4-ab6d-005056801329'),(1628,'Вознесенський','e4ace22a-4b33-11e4-ab6d-005056801329','e7163b8f-4b33-11e4-ab6d-005056801329','dcaaddd7-4b33-11e4-ab6d-005056801329'),(1629,'Врадіївський','e4ace160-4b33-11e4-ab6d-005056801329','e716582e-4b33-11e4-ab6d-005056801329','dcaaddd7-4b33-11e4-ab6d-005056801329'),(1630,'Доманівський','e4ace09a-4b33-11e4-ab6d-005056801329','e71748b5-4b33-11e4-ab6d-005056801329','dcaaddd7-4b33-11e4-ab6d-005056801329'),(1631,'Єланецький','e4acdfcc-4b33-11e4-ab6d-005056801329','e71792a4-4b33-11e4-ab6d-005056801329','dcaaddd7-4b33-11e4-ab6d-005056801329'),(1632,'Казанківський','e4acbec5-4b33-11e4-ab6d-005056801329','b92cbd67-4f9f-11e4-ab6d-005056801329','dcaaddd7-4b33-11e4-ab6d-005056801329'),(1633,'Кривоозерський','e4acbdf3-4b33-11e4-ab6d-005056801329','e71a2ace-4b33-11e4-ab6d-005056801329','dcaaddd7-4b33-11e4-ab6d-005056801329'),(1634,'Миколаївський','e4acbd17-4b33-11e4-ab6d-005056801329','e71b108c-4b33-11e4-ab6d-005056801329','dcaaddd7-4b33-11e4-ab6d-005056801329'),(1635,'Новобузький','e4acbbfe-4b33-11e4-ab6d-005056801329','e71bc8f1-4b33-11e4-ab6d-005056801329','dcaaddd7-4b33-11e4-ab6d-005056801329'),(1636,'Новоодеський','e4acbaf2-4b33-11e4-ab6d-005056801329','e71c076a-4b33-11e4-ab6d-005056801329','dcaaddd7-4b33-11e4-ab6d-005056801329'),(1637,'Очаківський','e4acb9f7-4b33-11e4-ab6d-005056801329','e71c6c43-4b33-11e4-ab6d-005056801329','dcaaddd7-4b33-11e4-ab6d-005056801329'),(1638,'Первомайський','e4acb8f6-4b33-11e4-ab6d-005056801329','e71ca00a-4b33-11e4-ab6d-005056801329','dcaaddd7-4b33-11e4-ab6d-005056801329'),(1639,'Снігурівський','e4acb7fb-4b33-11e4-ab6d-005056801329','e71e27a4-4b33-11e4-ab6d-005056801329','dcaaddd7-4b33-11e4-ab6d-005056801329'),(1640,'Южноукраїнська','e4acb71d-4b33-11e4-ab6d-005056801329','e7207551-4b33-11e4-ab6d-005056801329','dcaaddd7-4b33-11e4-ab6d-005056801329'),(1641,'Ананьївський','e4abe7d0-4b33-11e4-ab6d-005056801329','e71414e9-4b33-11e4-ab6d-005056801329','dcaade6d-4b33-11e4-ab6d-005056801329'),(1642,'Арцизький','e4aeeb71-4b33-11e4-ab6d-005056801329','e7143498-4b33-11e4-ab6d-005056801329','dcaade6d-4b33-11e4-ab6d-005056801329'),(1643,'Балтський','e4aee979-4b33-11e4-ab6d-005056801329','e714480b-4b33-11e4-ab6d-005056801329','dcaade6d-4b33-11e4-ab6d-005056801329'),(1644,'Березівський','e4ad58e3-4b33-11e4-ab6d-005056801329','e7147128-4b33-11e4-ab6d-005056801329','dcaade6d-4b33-11e4-ab6d-005056801329'),(1645,'Білгород-Дністровська','e4b13323-4b33-11e4-ab6d-005056801329','e714885f-4b33-11e4-ab6d-005056801329','dcaade6d-4b33-11e4-ab6d-005056801329'),(1646,'Білгород-Дністровський','e4ad59d7-4b33-11e4-ab6d-005056801329','e714885f-4b33-11e4-ab6d-005056801329','dcaade6d-4b33-11e4-ab6d-005056801329'),(1647,'Біляївський','e4ad5ad1-4b33-11e4-ab6d-005056801329','e714bf8a-4b33-11e4-ab6d-005056801329','dcaade6d-4b33-11e4-ab6d-005056801329'),(1648,'Болградський','e4ad5bd4-4b33-11e4-ab6d-005056801329','e714d9f8-4b33-11e4-ab6d-005056801329','dcaade6d-4b33-11e4-ab6d-005056801329'),(1649,'Великомихайлівський','e4ad5cd3-4b33-11e4-ab6d-005056801329','e715a9ee-4b33-11e4-ab6d-005056801329','dcaade6d-4b33-11e4-ab6d-005056801329'),(1650,'Захарівський','e4ad6c23-4b33-11e4-ab6d-005056801329','e71f86ff-4b33-11e4-ab6d-005056801329','dcaade6d-4b33-11e4-ab6d-005056801329'),(1651,'Іванівський','e4ad5ded-4b33-11e4-ab6d-005056801329','e7182508-4b33-11e4-ab6d-005056801329','dcaade6d-4b33-11e4-ab6d-005056801329'),(1652,'Ізмаїльський','e4ad5ec2-4b33-11e4-ab6d-005056801329','e71831b7-4b33-11e4-ab6d-005056801329','dcaade6d-4b33-11e4-ab6d-005056801329'),(1653,'Кілійський','e4ad5f8e-4b33-11e4-ab6d-005056801329','e718b009-4b33-11e4-ab6d-005056801329','dcaade6d-4b33-11e4-ab6d-005056801329'),(1654,'Кодимський','e4ad6054-4b33-11e4-ab6d-005056801329','e71903b6-4b33-11e4-ab6d-005056801329','dcaade6d-4b33-11e4-ab6d-005056801329'),(1655,'Лиманський','e4ad6124-4b33-11e4-ab6d-005056801329','e7191d75-4b33-11e4-ab6d-005056801329','dcaade6d-4b33-11e4-ab6d-005056801329'),(1656,'Любашівський','e4ad646f-4b33-11e4-ab6d-005056801329','e71ac1a9-4b33-11e4-ab6d-005056801329','dcaade6d-4b33-11e4-ab6d-005056801329'),(1657,'Миколаївський','e4ad655b-4b33-11e4-ab6d-005056801329','e71b108c-4b33-11e4-ab6d-005056801329','dcaade6d-4b33-11e4-ab6d-005056801329'),(1658,'Овідіопольський','e4ad6649-4b33-11e4-ab6d-005056801329','e71c2698-4b33-11e4-ab6d-005056801329','dcaade6d-4b33-11e4-ab6d-005056801329'),(1659,'Одеський','9332fcaa-7aa3-11ec-80fb-b8830365bd04','e71c2a15-4b33-11e4-ab6d-005056801329','dcaade6d-4b33-11e4-ab6d-005056801329'),(1660,'Окнянський','e4ad62be-4b33-11e4-ab6d-005056801329','e71a0ab6-4b33-11e4-ab6d-005056801329','dcaade6d-4b33-11e4-ab6d-005056801329'),(1661,'Подільський','e4ad61ef-4b33-11e4-ab6d-005056801329','e719e8d7-4b33-11e4-ab6d-005056801329','dcaade6d-4b33-11e4-ab6d-005056801329'),(1662,'Ренійський','e4ad6721-4b33-11e4-ab6d-005056801329','e71d60db-4b33-11e4-ab6d-005056801329','dcaade6d-4b33-11e4-ab6d-005056801329'),(1663,'Роздільнянський','e4ad67f1-4b33-11e4-ab6d-005056801329','e71d77cd-4b33-11e4-ab6d-005056801329','dcaade6d-4b33-11e4-ab6d-005056801329'),(1664,'Савранський','e4ad68cc-4b33-11e4-ab6d-005056801329','e71d947c-4b33-11e4-ab6d-005056801329','dcaade6d-4b33-11e4-ab6d-005056801329'),(1665,'Саратський','e4ad699b-4b33-11e4-ab6d-005056801329','e71d9c62-4b33-11e4-ab6d-005056801329','dcaade6d-4b33-11e4-ab6d-005056801329'),(1666,'Тарутинський','e4ad6a73-4b33-11e4-ab6d-005056801329','e71ee3fd-4b33-11e4-ab6d-005056801329','dcaade6d-4b33-11e4-ab6d-005056801329'),(1667,'Татарбунарський','e4ad6b4a-4b33-11e4-ab6d-005056801329','e71ee84a-4b33-11e4-ab6d-005056801329','dcaade6d-4b33-11e4-ab6d-005056801329'),(1668,'Теплодарська','e4ad6ec2-4b33-11e4-ab6d-005056801329','e71ef0e2-4b33-11e4-ab6d-005056801329','dcaade6d-4b33-11e4-ab6d-005056801329'),(1669,'Чорноморська','e4ad6de5-4b33-11e4-ab6d-005056801329','e7183bf7-4b33-11e4-ab6d-005056801329','dcaade6d-4b33-11e4-ab6d-005056801329'),(1670,'Ширяївський','e4ad6cfc-4b33-11e4-ab6d-005056801329','e7204124-4b33-11e4-ab6d-005056801329','dcaade6d-4b33-11e4-ab6d-005056801329'),(1671,'Южненська','e4ad9f84-4b33-11e4-ab6d-005056801329','e720736f-4b33-11e4-ab6d-005056801329','dcaade6d-4b33-11e4-ab6d-005056801329'),(1672,'Великобагачанський','e4adb93d-4b33-11e4-ab6d-005056801329','e715a02e-4b33-11e4-ab6d-005056801329','dcaadf02-4b33-11e4-ab6d-005056801329'),(1673,'Гадяцький','e4adba42-4b33-11e4-ab6d-005056801329','e7165e06-4b33-11e4-ab6d-005056801329','dcaadf02-4b33-11e4-ab6d-005056801329'),(1674,'Глобинський','e4adbb1b-4b33-11e4-ab6d-005056801329','e7167cd2-4b33-11e4-ab6d-005056801329','dcaadf02-4b33-11e4-ab6d-005056801329'),(1675,'Горішньоплавнівська','e4ae0e96-4b33-11e4-ab6d-005056801329','e7192132-4b33-11e4-ab6d-005056801329','dcaadf02-4b33-11e4-ab6d-005056801329'),(1676,'Гребінківський','e4adbbec-4b33-11e4-ab6d-005056801329','e716d1db-4b33-11e4-ab6d-005056801329','dcaadf02-4b33-11e4-ab6d-005056801329'),(1677,'Диканський','e4adbcc4-4b33-11e4-ab6d-005056801329','e717024d-4b33-11e4-ab6d-005056801329','dcaadf02-4b33-11e4-ab6d-005056801329'),(1678,'Зіньківський','e4adbd9c-4b33-11e4-ab6d-005056801329','e7180442-4b33-11e4-ab6d-005056801329','dcaadf02-4b33-11e4-ab6d-005056801329'),(1679,'Карлівський','e4adbe6c-4b33-11e4-ab6d-005056801329','e7187de9-4b33-11e4-ab6d-005056801329','dcaadf02-4b33-11e4-ab6d-005056801329'),(1680,'Кобеляцький','e4adbf41-4b33-11e4-ab6d-005056801329','e718fe11-4b33-11e4-ab6d-005056801329','dcaadf02-4b33-11e4-ab6d-005056801329'),(1681,'Козельщинський','e4adc016-4b33-11e4-ab6d-005056801329','e719076f-4b33-11e4-ab6d-005056801329','dcaadf02-4b33-11e4-ab6d-005056801329'),(1682,'Котелевський','e4adc0f8-4b33-11e4-ab6d-005056801329','e719e6df-4b33-11e4-ab6d-005056801329','dcaadf02-4b33-11e4-ab6d-005056801329'),(1683,'Кременчуцький','e4adc1cf-4b33-11e4-ab6d-005056801329','e71a26ea-4b33-11e4-ab6d-005056801329','dcaadf02-4b33-11e4-ab6d-005056801329'),(1684,'Лохвицький','e4adde5c-4b33-11e4-ab6d-005056801329','e71aa807-4b33-11e4-ab6d-005056801329','dcaadf02-4b33-11e4-ab6d-005056801329'),(1685,'Лубенський','e4addfde-4b33-11e4-ab6d-005056801329','e71aa9a6-4b33-11e4-ab6d-005056801329','dcaadf02-4b33-11e4-ab6d-005056801329'),(1686,'Машівський','e4ade1dc-4b33-11e4-ab6d-005056801329','e71ae9ea-4b33-11e4-ab6d-005056801329','dcaadf02-4b33-11e4-ab6d-005056801329'),(1687,'Миргородський','e4ade30f-4b33-11e4-ab6d-005056801329','e71b1fe2-4b33-11e4-ab6d-005056801329','dcaadf02-4b33-11e4-ab6d-005056801329'),(1688,'Новосанжарський','e4ade447-4b33-11e4-ab6d-005056801329','e71bd96e-4b33-11e4-ab6d-005056801329','dcaadf02-4b33-11e4-ab6d-005056801329'),(1689,'Оржицький','e4ade52d-4b33-11e4-ab6d-005056801329','e71c4be8-4b33-11e4-ab6d-005056801329','dcaadf02-4b33-11e4-ab6d-005056801329'),(1690,'Пирятинський','e4ade60b-4b33-11e4-ab6d-005056801329','e71cc3df-4b33-11e4-ab6d-005056801329','dcaadf02-4b33-11e4-ab6d-005056801329'),(1691,'Полтавський','e4ade6ea-4b33-11e4-ab6d-005056801329','e71d006d-4b33-11e4-ab6d-005056801329','dcaadf02-4b33-11e4-ab6d-005056801329'),(1692,'Решетилівський','e4ade7d2-4b33-11e4-ab6d-005056801329','e71d62c0-4b33-11e4-ab6d-005056801329','dcaadf02-4b33-11e4-ab6d-005056801329'),(1693,'Семенівський','e4ade8b1-4b33-11e4-ab6d-005056801329','e71dbd57-4b33-11e4-ab6d-005056801329','dcaadf02-4b33-11e4-ab6d-005056801329'),(1694,'Хорольський','e4ae0ae7-4b33-11e4-ab6d-005056801329','e71fb550-4b33-11e4-ab6d-005056801329','dcaadf02-4b33-11e4-ab6d-005056801329'),(1695,'Чорнухинський','e4ae0bfa-4b33-11e4-ab6d-005056801329','e7202312-4b33-11e4-ab6d-005056801329','dcaadf02-4b33-11e4-ab6d-005056801329'),(1696,'Чутівський','e4ae0cdf-4b33-11e4-ab6d-005056801329','e7202ebb-4b33-11e4-ab6d-005056801329','dcaadf02-4b33-11e4-ab6d-005056801329'),(1697,'Шишацький','e4ae0dbb-4b33-11e4-ab6d-005056801329','e7205b41-4b33-11e4-ab6d-005056801329','dcaadf02-4b33-11e4-ab6d-005056801329'),(1698,'Березнівський','e4ae0f71-4b33-11e4-ab6d-005056801329','e714758a-4b33-11e4-ab6d-005056801329','dcaadfa0-4b33-11e4-ab6d-005056801329'),(1699,'Вараський','2f9ad4ce-46ef-11ec-80fb-b8830365bd04','e71a38b2-4b33-11e4-ab6d-005056801329','dcaadfa0-4b33-11e4-ab6d-005056801329'),(1700,'Володимирецький','e4ae104b-4b33-11e4-ab6d-005056801329','e7164c25-4b33-11e4-ab6d-005056801329','dcaadfa0-4b33-11e4-ab6d-005056801329'),(1701,'Гощанський','e4ae1125-4b33-11e4-ab6d-005056801329','e716cc2c-4b33-11e4-ab6d-005056801329','dcaadfa0-4b33-11e4-ab6d-005056801329'),(1702,'Демидівський','e4ae11ff-4b33-11e4-ab6d-005056801329','e716f792-4b33-11e4-ab6d-005056801329','dcaadfa0-4b33-11e4-ab6d-005056801329'),(1703,'Дубенський','e4ae12da-4b33-11e4-ab6d-005056801329','e7176416-4b33-11e4-ab6d-005056801329','dcaadfa0-4b33-11e4-ab6d-005056801329'),(1704,'Дубровицький','e4ae13b6-4b33-11e4-ab6d-005056801329','e7178b22-4b33-11e4-ab6d-005056801329','dcaadfa0-4b33-11e4-ab6d-005056801329'),(1705,'Зарічненський','e4ae1488-4b33-11e4-ab6d-005056801329','e717c0e1-4b33-11e4-ab6d-005056801329','dcaadfa0-4b33-11e4-ab6d-005056801329'),(1706,'Здолбунівський','e4ae1559-4b33-11e4-ab6d-005056801329','e717df81-4b33-11e4-ab6d-005056801329','dcaadfa0-4b33-11e4-ab6d-005056801329'),(1707,'Корецький','e4ae1633-4b33-11e4-ab6d-005056801329','e71992df-4b33-11e4-ab6d-005056801329','dcaadfa0-4b33-11e4-ab6d-005056801329'),(1708,'Костопільський','e4ae170d-4b33-11e4-ab6d-005056801329','e719b856-4b33-11e4-ab6d-005056801329','dcaadfa0-4b33-11e4-ab6d-005056801329'),(1709,'Кузнецовська','e4ae4b9b-4b33-11e4-ab6d-005056801329','e71a38b2-4b33-11e4-ab6d-005056801329','dcaadfa0-4b33-11e4-ab6d-005056801329'),(1710,'Млинівський','e4ae17e0-4b33-11e4-ab6d-005056801329','e71b51f2-4b33-11e4-ab6d-005056801329','dcaadfa0-4b33-11e4-ab6d-005056801329'),(1711,'Острозький','e4ae18bf-4b33-11e4-ab6d-005056801329','e71c65a3-4b33-11e4-ab6d-005056801329','dcaadfa0-4b33-11e4-ab6d-005056801329'),(1712,'Радивилівський','e4ae199e-4b33-11e4-ab6d-005056801329','e71d3a24-4b33-11e4-ab6d-005056801329','dcaadfa0-4b33-11e4-ab6d-005056801329'),(1713,'Рівненський','e4ae1a7b-4b33-11e4-ab6d-005056801329','e71d65e1-4b33-11e4-ab6d-005056801329','dcaadfa0-4b33-11e4-ab6d-005056801329'),(1714,'Рокитнівський','e4ae1b58-4b33-11e4-ab6d-005056801329','e71d8303-4b33-11e4-ab6d-005056801329','dcaadfa0-4b33-11e4-ab6d-005056801329'),(1715,'Сарненський','e4ae4a77-4b33-11e4-ab6d-005056801329','e71d9e4a-4b33-11e4-ab6d-005056801329','dcaadfa0-4b33-11e4-ab6d-005056801329'),(1716,'Білопільський','e4ae4c7f-4b33-11e4-ab6d-005056801329','e714bb39-4b33-11e4-ab6d-005056801329','dcaae036-4b33-11e4-ab6d-005056801329'),(1717,'Буринський','e4ae4e33-4b33-11e4-ab6d-005056801329','e7157c13-4b33-11e4-ab6d-005056801329','dcaae036-4b33-11e4-ab6d-005056801329'),(1718,'Великописарівський','e4ae4f53-4b33-11e4-ab6d-005056801329','e715b308-4b33-11e4-ab6d-005056801329','dcaae036-4b33-11e4-ab6d-005056801329'),(1719,'Глухівська','e4ae5da8-4b33-11e4-ab6d-005056801329','e7167e8a-4b33-11e4-ab6d-005056801329','dcaae036-4b33-11e4-ab6d-005056801329'),(1720,'Глухівський','e4ae5053-4b33-11e4-ab6d-005056801329','e7167e8a-4b33-11e4-ab6d-005056801329','dcaae036-4b33-11e4-ab6d-005056801329'),(1721,'Конотопська','001149ca-4c69-11e4-ab6d-005056801329','e71984cc-4b33-11e4-ab6d-005056801329','dcaae036-4b33-11e4-ab6d-005056801329'),(1722,'Конотопський','e4ae515d-4b33-11e4-ab6d-005056801329','e71984cc-4b33-11e4-ab6d-005056801329','dcaae036-4b33-11e4-ab6d-005056801329'),(1723,'Краснопільський','e4ae5277-4b33-11e4-ab6d-005056801329','e71a1ed5-4b33-11e4-ab6d-005056801329','dcaae036-4b33-11e4-ab6d-005056801329'),(1724,'Кролевецький','e4ae5352-4b33-11e4-ab6d-005056801329','e71a328b-4b33-11e4-ab6d-005056801329','dcaae036-4b33-11e4-ab6d-005056801329'),(1725,'Лебединська','e4ae5e85-4b33-11e4-ab6d-005056801329','e71a537d-4b33-11e4-ab6d-005056801329','dcaae036-4b33-11e4-ab6d-005056801329'),(1726,'Лебединський','e4ae5422-4b33-11e4-ab6d-005056801329','e71a537d-4b33-11e4-ab6d-005056801329','dcaae036-4b33-11e4-ab6d-005056801329'),(1727,'Липоводолинський','e4ae54f1-4b33-11e4-ab6d-005056801329','e71a73b5-4b33-11e4-ab6d-005056801329','dcaae036-4b33-11e4-ab6d-005056801329'),(1728,'Недригайлівський','e4ae55c1-4b33-11e4-ab6d-005056801329','e71b7472-4b33-11e4-ab6d-005056801329','dcaae036-4b33-11e4-ab6d-005056801329'),(1729,'Охтирська','e4abe62b-4b33-11e4-ab6d-005056801329','e71c6a6c-4b33-11e4-ab6d-005056801329','dcaae036-4b33-11e4-ab6d-005056801329'),(1730,'Охтирський','e4ae56a6-4b33-11e4-ab6d-005056801329','e71c6a6c-4b33-11e4-ab6d-005056801329','dcaae036-4b33-11e4-ab6d-005056801329'),(1731,'Путивльський','e4ae577b-4b33-11e4-ab6d-005056801329','e71d3094-4b33-11e4-ab6d-005056801329','dcaae036-4b33-11e4-ab6d-005056801329'),(1732,'Роменська','e4ae5f5e-4b33-11e4-ab6d-005056801329','e71d8907-4b33-11e4-ab6d-005056801329','dcaae036-4b33-11e4-ab6d-005056801329'),(1733,'Роменський','e4ae5857-4b33-11e4-ab6d-005056801329','e71d8907-4b33-11e4-ab6d-005056801329','dcaae036-4b33-11e4-ab6d-005056801329'),(1734,'Середино-Будський','e4ae5936-4b33-11e4-ab6d-005056801329','e71dbf87-4b33-11e4-ab6d-005056801329','dcaae036-4b33-11e4-ab6d-005056801329'),(1735,'Сумська','e4ae7cbf-4b33-11e4-ab6d-005056801329','e71e73be-4b33-11e4-ab6d-005056801329','dcaae036-4b33-11e4-ab6d-005056801329'),(1736,'Сумський','e4ae5a16-4b33-11e4-ab6d-005056801329','e71e73be-4b33-11e4-ab6d-005056801329','dcaae036-4b33-11e4-ab6d-005056801329'),(1737,'Тростянецький','e4ae5aef-4b33-11e4-ab6d-005056801329','e71f3b3b-4b33-11e4-ab6d-005056801329','dcaae036-4b33-11e4-ab6d-005056801329'),(1738,'Шосткинський','e4ae5be1-4b33-11e4-ab6d-005056801329','e7205d5e-4b33-11e4-ab6d-005056801329','dcaae036-4b33-11e4-ab6d-005056801329'),(1739,'Ямпільський','e4ae5cbb-4b33-11e4-ab6d-005056801329','e7208867-4b33-11e4-ab6d-005056801329','dcaae036-4b33-11e4-ab6d-005056801329'),(1740,'Бережанський','e4ae7dce-4b33-11e4-ab6d-005056801329','e7146870-4b33-11e4-ab6d-005056801329','dcaae303-4b33-11e4-ab6d-005056801329'),(1741,'Борщівський','e4ae7e9b-4b33-11e4-ab6d-005056801329','e71563c8-4b33-11e4-ab6d-005056801329','dcaae303-4b33-11e4-ab6d-005056801329'),(1742,'Бучацький','e4ae7f6e-4b33-11e4-ab6d-005056801329','e71585e0-4b33-11e4-ab6d-005056801329','dcaae303-4b33-11e4-ab6d-005056801329'),(1743,'Гусятинський','e4ae8042-4b33-11e4-ab6d-005056801329','e716e9f8-4b33-11e4-ab6d-005056801329','dcaae303-4b33-11e4-ab6d-005056801329'),(1744,'Заліщицький','e4ae8115-4b33-11e4-ab6d-005056801329','e717b936-4b33-11e4-ab6d-005056801329','dcaae303-4b33-11e4-ab6d-005056801329'),(1745,'Збаразький','e4ae81e4-4b33-11e4-ab6d-005056801329','e717d5fe-4b33-11e4-ab6d-005056801329','dcaae303-4b33-11e4-ab6d-005056801329'),(1746,'Зборівський','e4ae82b5-4b33-11e4-ab6d-005056801329','e717d7e5-4b33-11e4-ab6d-005056801329','dcaae303-4b33-11e4-ab6d-005056801329'),(1747,'Козівський','e4ae8395-4b33-11e4-ab6d-005056801329','e719102b-4b33-11e4-ab6d-005056801329','dcaae303-4b33-11e4-ab6d-005056801329'),(1748,'Кременецький','e4ae8470-4b33-11e4-ab6d-005056801329','e71a22d4-4b33-11e4-ab6d-005056801329','dcaae303-4b33-11e4-ab6d-005056801329'),(1749,'Лановецький','e4ae8546-4b33-11e4-ab6d-005056801329','e71a516e-4b33-11e4-ab6d-005056801329','dcaae303-4b33-11e4-ab6d-005056801329'),(1750,'Монастириський','e4ae8617-4b33-11e4-ab6d-005056801329','e71b5b08-4b33-11e4-ab6d-005056801329','dcaae303-4b33-11e4-ab6d-005056801329'),(1751,'Підволочиський','e4ae86f0-4b33-11e4-ab6d-005056801329','e71cc5bc-4b33-11e4-ab6d-005056801329','dcaae303-4b33-11e4-ab6d-005056801329'),(1752,'Підгаєцький','e4ae87d7-4b33-11e4-ab6d-005056801329','e71cc745-4b33-11e4-ab6d-005056801329','dcaae303-4b33-11e4-ab6d-005056801329'),(1753,'Теребовлянський','e4ae88b0-4b33-11e4-ab6d-005056801329','e71ef2fb-4b33-11e4-ab6d-005056801329','dcaae303-4b33-11e4-ab6d-005056801329'),(1754,'Тернопільський','e4ae898b-4b33-11e4-ab6d-005056801329','e71efc6a-4b33-11e4-ab6d-005056801329','dcaae303-4b33-11e4-ab6d-005056801329'),(1755,'Чортківський','e4ae8a6b-4b33-11e4-ab6d-005056801329','e720271f-4b33-11e4-ab6d-005056801329','dcaae303-4b33-11e4-ab6d-005056801329'),(1756,'Шумський','e4ae8b4c-4b33-11e4-ab6d-005056801329','e720645a-4b33-11e4-ab6d-005056801329','dcaae303-4b33-11e4-ab6d-005056801329'),(1757,'Балаклійський','e4ae8c26-4b33-11e4-ab6d-005056801329','e71440e3-4b33-11e4-ab6d-005056801329','dcaae3a1-4b33-11e4-ab6d-005056801329'),(1758,'Барвінківський','e4ae8d50-4b33-11e4-ab6d-005056801329','e7144e57-4b33-11e4-ab6d-005056801329','dcaae3a1-4b33-11e4-ab6d-005056801329'),(1759,'Берестинський','e4aa50b2-4b33-11e4-ab6d-005056801329','e71a148b-4b33-11e4-ab6d-005056801329','dcaae3a1-4b33-11e4-ab6d-005056801329'),(1760,'Близнюківський','e4ae8e86-4b33-11e4-ab6d-005056801329','e714c493-4b33-11e4-ab6d-005056801329','dcaae3a1-4b33-11e4-ab6d-005056801329'),(1761,'Богодухівський','e4aec575-4b33-11e4-ab6d-005056801329','e714cea5-4b33-11e4-ab6d-005056801329','dcaae3a1-4b33-11e4-ab6d-005056801329'),(1762,'Борівський','e4aee379-4b33-11e4-ab6d-005056801329','e7155869-4b33-11e4-ab6d-005056801329','dcaae3a1-4b33-11e4-ab6d-005056801329'),(1763,'Валківський','e4aee520-4b33-11e4-ab6d-005056801329','e71587c0-4b33-11e4-ab6d-005056801329','dcaae3a1-4b33-11e4-ab6d-005056801329'),(1764,'Великобурлуцький','e4aee5fe-4b33-11e4-ab6d-005056801329','e715b89d-4b33-11e4-ab6d-005056801329','dcaae3a1-4b33-11e4-ab6d-005056801329'),(1765,'Вовчанський','e4aee6e0-4b33-11e4-ab6d-005056801329','e716399c-4b33-11e4-ab6d-005056801329','dcaae3a1-4b33-11e4-ab6d-005056801329'),(1766,'Дворічанський','e4aee7ba-4b33-11e4-ab6d-005056801329','e716efe1-4b33-11e4-ab6d-005056801329','dcaae3a1-4b33-11e4-ab6d-005056801329'),(1767,'Дергачівський','e4aee89c-4b33-11e4-ab6d-005056801329','e716fb3b-4b33-11e4-ab6d-005056801329','dcaae3a1-4b33-11e4-ab6d-005056801329'),(1768,'Зачепилівський','e4aa4a9d-4b33-11e4-ab6d-005056801329','e717c6df-4b33-11e4-ab6d-005056801329','dcaae3a1-4b33-11e4-ab6d-005056801329'),(1769,'Зміївський','e4aa4ccc-4b33-11e4-ab6d-005056801329','e7180628-4b33-11e4-ab6d-005056801329','dcaae3a1-4b33-11e4-ab6d-005056801329'),(1770,'Золочівський','e4aa4da4-4b33-11e4-ab6d-005056801329','e71815c4-4b33-11e4-ab6d-005056801329','dcaae3a1-4b33-11e4-ab6d-005056801329'),(1771,'Ізюмський','e4aa4e78-4b33-11e4-ab6d-005056801329','e71833c9-4b33-11e4-ab6d-005056801329','dcaae3a1-4b33-11e4-ab6d-005056801329'),(1772,'Кегичівський','e4aa4f30-4b33-11e4-ab6d-005056801329','e718a113-4b33-11e4-ab6d-005056801329','dcaae3a1-4b33-11e4-ab6d-005056801329'),(1773,'Коломацький','e4aa4ff4-4b33-11e4-ab6d-005056801329','e71915b0-4b33-11e4-ab6d-005056801329','dcaae3a1-4b33-11e4-ab6d-005056801329'),(1774,'Краснокутський','e4aa5171-4b33-11e4-ab6d-005056801329','e71a1854-4b33-11e4-ab6d-005056801329','dcaae3a1-4b33-11e4-ab6d-005056801329'),(1775,'Куп\'янський','e4aa5231-4b33-11e4-ab6d-005056801329','e71a4015-4b33-11e4-ab6d-005056801329','dcaae3a1-4b33-11e4-ab6d-005056801329'),(1776,'Лозівська','e4aa642d-4b33-11e4-ab6d-005056801329','e71a9dfd-4b33-11e4-ab6d-005056801329','dcaae3a1-4b33-11e4-ab6d-005056801329'),(1777,'Лозівський','e4aa52f8-4b33-11e4-ab6d-005056801329','e71a9dfd-4b33-11e4-ab6d-005056801329','dcaae3a1-4b33-11e4-ab6d-005056801329'),(1778,'Люботинська','e4aa6519-4b33-11e4-ab6d-005056801329','e71ac6f5-4b33-11e4-ab6d-005056801329','dcaae3a1-4b33-11e4-ab6d-005056801329'),(1779,'Нововодолазький','e4aa53ba-4b33-11e4-ab6d-005056801329','e71b8bc4-4b33-11e4-ab6d-005056801329','dcaae3a1-4b33-11e4-ab6d-005056801329'),(1780,'Первомайський','e4aa547a-4b33-11e4-ab6d-005056801329','e71ca00a-4b33-11e4-ab6d-005056801329','dcaae3a1-4b33-11e4-ab6d-005056801329'),(1781,'Печенізький','e4aa5a3e-4b33-11e4-ab6d-005056801329','e71cc209-4b33-11e4-ab6d-005056801329','dcaae3a1-4b33-11e4-ab6d-005056801329'),(1782,'Сахновщинський','e4aa5b30-4b33-11e4-ab6d-005056801329','e71da37f-4b33-11e4-ab6d-005056801329','dcaae3a1-4b33-11e4-ab6d-005056801329'),(1783,'Харківський','e4aa5bea-4b33-11e4-ab6d-005056801329','e71f8842-4b33-11e4-ab6d-005056801329','dcaae3a1-4b33-11e4-ab6d-005056801329'),(1784,'Чугуївська','e4b0daf6-4b33-11e4-ab6d-005056801329','e7202b00-4b33-11e4-ab6d-005056801329','dcaae3a1-4b33-11e4-ab6d-005056801329'),(1785,'Чугуївський','e4aa5ca6-4b33-11e4-ab6d-005056801329','e7202b00-4b33-11e4-ab6d-005056801329','dcaae3a1-4b33-11e4-ab6d-005056801329'),(1786,'Шевченківський','e4aa5d64-4b33-11e4-ab6d-005056801329','e72038bd-4b33-11e4-ab6d-005056801329','dcaae3a1-4b33-11e4-ab6d-005056801329'),(1787,'Бериславський','e4aa65dd-4b33-11e4-ab6d-005056801329','e7147cee-4b33-11e4-ab6d-005056801329','dcaae44b-4b33-11e4-ab6d-005056801329'),(1788,'Білозерський','e4aa668a-4b33-11e4-ab6d-005056801329','e714ae7e-4b33-11e4-ab6d-005056801329','dcaae44b-4b33-11e4-ab6d-005056801329'),(1789,'Великолепетиський','e4aa6746-4b33-11e4-ab6d-005056801329','e715a7ff-4b33-11e4-ab6d-005056801329','dcaae44b-4b33-11e4-ab6d-005056801329'),(1790,'Великоолександрівський','e4aa6800-4b33-11e4-ab6d-005056801329','e715b017-4b33-11e4-ab6d-005056801329','dcaae44b-4b33-11e4-ab6d-005056801329'),(1791,'Верхньорогачицький','e4aa68d0-4b33-11e4-ab6d-005056801329','e715cde4-4b33-11e4-ab6d-005056801329','dcaae44b-4b33-11e4-ab6d-005056801329'),(1792,'Високопільський','e4aa6996-4b33-11e4-ab6d-005056801329','e7160d8e-4b33-11e4-ab6d-005056801329','dcaae44b-4b33-11e4-ab6d-005056801329'),(1793,'Генічеський','e4aa6a49-4b33-11e4-ab6d-005056801329','e716670e-4b33-11e4-ab6d-005056801329','dcaae44b-4b33-11e4-ab6d-005056801329'),(1794,'Голопристанська','2ca33e15-4c67-11e4-ab6d-005056801329','e716a5e2-4b33-11e4-ab6d-005056801329','dcaae44b-4b33-11e4-ab6d-005056801329'),(1795,'Голопристанський','e4aa6b08-4b33-11e4-ab6d-005056801329','e716a5e2-4b33-11e4-ab6d-005056801329','dcaae44b-4b33-11e4-ab6d-005056801329'),(1796,'Горностаївський','e4aa6bc8-4b33-11e4-ab6d-005056801329','e716b1ab-4b33-11e4-ab6d-005056801329','dcaae44b-4b33-11e4-ab6d-005056801329'),(1797,'Іванівський','e4aa6c89-4b33-11e4-ab6d-005056801329','e7182508-4b33-11e4-ab6d-005056801329','dcaae44b-4b33-11e4-ab6d-005056801329'),(1798,'Каланчацький','e4aa6d46-4b33-11e4-ab6d-005056801329','e7186363-4b33-11e4-ab6d-005056801329','dcaae44b-4b33-11e4-ab6d-005056801329'),(1799,'Каховський','e4aa6dfd-4b33-11e4-ab6d-005056801329','e7188124-4b33-11e4-ab6d-005056801329','dcaae44b-4b33-11e4-ab6d-005056801329'),(1800,'Нижньосірогозький','e4aa6ec1-4b33-11e4-ab6d-005056801329','e71b7f80-4b33-11e4-ab6d-005056801329','dcaae44b-4b33-11e4-ab6d-005056801329'),(1801,'Нововоронцовський','e4aa7513-4b33-11e4-ab6d-005056801329','e71bfb2e-4b33-11e4-ab6d-005056801329','dcaae44b-4b33-11e4-ab6d-005056801329'),(1802,'Новокаховська','e4aa78cd-4b33-11e4-ab6d-005056801329','e71b8dce-4b33-11e4-ab6d-005056801329','dcaae44b-4b33-11e4-ab6d-005056801329'),(1803,'Новотроїцький','e4aa75dc-4b33-11e4-ab6d-005056801329','e71c14d6-4b33-11e4-ab6d-005056801329','dcaae44b-4b33-11e4-ab6d-005056801329'),(1804,'Олешківський','e4aa775b-4b33-11e4-ab6d-005056801329','e71fc9ea-4b33-11e4-ab6d-005056801329','dcaae44b-4b33-11e4-ab6d-005056801329'),(1805,'Скадовський','e4aa769f-4b33-11e4-ab6d-005056801329','e71df1a0-4b33-11e4-ab6d-005056801329','dcaae44b-4b33-11e4-ab6d-005056801329'),(1806,'Херсонська','e4aa798c-4b33-11e4-ab6d-005056801329','e71f8b5f-4b33-11e4-ab6d-005056801329','dcaae44b-4b33-11e4-ab6d-005056801329'),(1807,'Херсонський','17fd4b6e-46ef-11ec-80fb-b8830365bd04','e71f8b5f-4b33-11e4-ab6d-005056801329','dcaae44b-4b33-11e4-ab6d-005056801329'),(1808,'Чаплинський','e4aa7817-4b33-11e4-ab6d-005056801329','e71fce03-4b33-11e4-ab6d-005056801329','dcaae44b-4b33-11e4-ab6d-005056801329'),(1809,'Білогірський','e4aa7a4b-4b33-11e4-ab6d-005056801329','e7149a77-4b33-11e4-ab6d-005056801329','dcaae4e5-4b33-11e4-ab6d-005056801329'),(1810,'Віньковецький','e4aa7afd-4b33-11e4-ab6d-005056801329','e7162b82-4b33-11e4-ab6d-005056801329','dcaae4e5-4b33-11e4-ab6d-005056801329'),(1811,'Волочиський','e4aa82f2-4b33-11e4-ab6d-005056801329','e7164ef8-4b33-11e4-ab6d-005056801329','dcaae4e5-4b33-11e4-ab6d-005056801329'),(1812,'Городоцький','e4aa83ef-4b33-11e4-ab6d-005056801329','e716c7cb-4b33-11e4-ab6d-005056801329','dcaae4e5-4b33-11e4-ab6d-005056801329'),(1813,'Деражнянський','e4aa84d6-4b33-11e4-ab6d-005056801329','e716f975-4b33-11e4-ab6d-005056801329','dcaae4e5-4b33-11e4-ab6d-005056801329'),(1814,'Дунаєвецький','e4aa85b1-4b33-11e4-ab6d-005056801329','e7178d23-4b33-11e4-ab6d-005056801329','dcaae4e5-4b33-11e4-ab6d-005056801329'),(1815,'Ізяславський','e4aa868c-4b33-11e4-ab6d-005056801329','e71835e3-4b33-11e4-ab6d-005056801329','dcaae4e5-4b33-11e4-ab6d-005056801329'),(1816,'Кам\'янець-Подільський','e4aa874f-4b33-11e4-ab6d-005056801329','e7186cda-4b33-11e4-ab6d-005056801329','dcaae4e5-4b33-11e4-ab6d-005056801329'),(1817,'Красилівський','e4aa8816-4b33-11e4-ab6d-005056801329','e719f098-4b33-11e4-ab6d-005056801329','dcaae4e5-4b33-11e4-ab6d-005056801329'),(1818,'Летичівський','e4aa88d7-4b33-11e4-ab6d-005056801329','e71a5c9f-4b33-11e4-ab6d-005056801329','dcaae4e5-4b33-11e4-ab6d-005056801329'),(1819,'Нетішинська','e4aa9948-4b33-11e4-ab6d-005056801329','e71b7c80-4b33-11e4-ab6d-005056801329','dcaae4e5-4b33-11e4-ab6d-005056801329'),(1820,'Новоушицький','e4aa89a4-4b33-11e4-ab6d-005056801329','e71bac03-4b33-11e4-ab6d-005056801329','dcaae4e5-4b33-11e4-ab6d-005056801329'),(1821,'Полонський','e4aa8a6d-4b33-11e4-ab6d-005056801329','e71cff1d-4b33-11e4-ab6d-005056801329','dcaae4e5-4b33-11e4-ab6d-005056801329'),(1822,'Славутський','e4aa8b35-4b33-11e4-ab6d-005056801329','e71e1467-4b33-11e4-ab6d-005056801329','dcaae4e5-4b33-11e4-ab6d-005056801329'),(1823,'Старокостянтинівський','e4aa8c03-4b33-11e4-ab6d-005056801329','e71e5e8b-4b33-11e4-ab6d-005056801329','dcaae4e5-4b33-11e4-ab6d-005056801329'),(1824,'Старосинявський','e4aa948b-4b33-11e4-ab6d-005056801329','e71e550d-4b33-11e4-ab6d-005056801329','dcaae4e5-4b33-11e4-ab6d-005056801329'),(1825,'Теофіпольський','e4aa9562-4b33-11e4-ab6d-005056801329','e71eec68-4b33-11e4-ab6d-005056801329','dcaae4e5-4b33-11e4-ab6d-005056801329'),(1826,'Хмельницький','e4aa962a-4b33-11e4-ab6d-005056801329','e71f8e8f-4b33-11e4-ab6d-005056801329','dcaae4e5-4b33-11e4-ab6d-005056801329'),(1827,'Чемеровецький','e4aa96f7-4b33-11e4-ab6d-005056801329','e71fd00a-4b33-11e4-ab6d-005056801329','dcaae4e5-4b33-11e4-ab6d-005056801329'),(1828,'Шепетівський','e4aa97c2-4b33-11e4-ab6d-005056801329','e7203d4c-4b33-11e4-ab6d-005056801329','dcaae4e5-4b33-11e4-ab6d-005056801329'),(1829,'Ярмолинецький','e4aa9885-4b33-11e4-ab6d-005056801329','e720cba8-4b33-11e4-ab6d-005056801329','dcaae4e5-4b33-11e4-ab6d-005056801329'),(1830,'Ватутінська','e4b16e89-4b33-11e4-ab6d-005056801329','e7159ba9-4b33-11e4-ab6d-005056801329','dcaae57c-4b33-11e4-ab6d-005056801329'),(1831,'Городищенський','e4aa9a07-4b33-11e4-ab6d-005056801329','e716bc05-4b33-11e4-ab6d-005056801329','dcaae57c-4b33-11e4-ab6d-005056801329'),(1832,'Драбівський','e4aa9ac7-4b33-11e4-ab6d-005056801329','e7174d37-4b33-11e4-ab6d-005056801329','dcaae57c-4b33-11e4-ab6d-005056801329'),(1833,'Жашківський','e4aa9b8a-4b33-11e4-ab6d-005056801329','e7179d15-4b33-11e4-ab6d-005056801329','dcaae57c-4b33-11e4-ab6d-005056801329'),(1834,'Звенигородський','e4aa9c60-4b33-11e4-ab6d-005056801329','e717dbcb-4b33-11e4-ab6d-005056801329','dcaae57c-4b33-11e4-ab6d-005056801329'),(1835,'Золотоніська','e4b16f65-4b33-11e4-ab6d-005056801329','e7181198-4b33-11e4-ab6d-005056801329','dcaae57c-4b33-11e4-ab6d-005056801329'),(1836,'Золотоніський','e4b14621-4b33-11e4-ab6d-005056801329','e7181198-4b33-11e4-ab6d-005056801329','dcaae57c-4b33-11e4-ab6d-005056801329'),(1837,'Кам\'янський','e4b14716-4b33-11e4-ab6d-005056801329','e7186eb7-4b33-11e4-ab6d-005056801329','dcaae57c-4b33-11e4-ab6d-005056801329'),(1838,'Канівський','e4b1481d-4b33-11e4-ab6d-005056801329','e7187c05-4b33-11e4-ab6d-005056801329','dcaae57c-4b33-11e4-ab6d-005056801329'),(1839,'Катеринопільський','e4b14944-4b33-11e4-ab6d-005056801329','e7187f34-4b33-11e4-ab6d-005056801329','dcaae57c-4b33-11e4-ab6d-005056801329'),(1840,'Корсунь-Шевченківський','e4b16345-4b33-11e4-ab6d-005056801329','e719ace8-4b33-11e4-ab6d-005056801329','dcaae57c-4b33-11e4-ab6d-005056801329'),(1841,'Лисянський','e4b16465-4b33-11e4-ab6d-005056801329','e71a9769-4b33-11e4-ab6d-005056801329','dcaae57c-4b33-11e4-ab6d-005056801329'),(1842,'Маньківський','e4b16548-4b33-11e4-ab6d-005056801329','e71adcdb-4b33-11e4-ab6d-005056801329','dcaae57c-4b33-11e4-ab6d-005056801329'),(1843,'Монастирищенський','e4b16639-4b33-11e4-ab6d-005056801329','e71b5cf4-4b33-11e4-ab6d-005056801329','dcaae57c-4b33-11e4-ab6d-005056801329'),(1844,'Смілянська','e4b134e4-4b33-11e4-ab6d-005056801329','e71e23a2-4b33-11e4-ab6d-005056801329','dcaae57c-4b33-11e4-ab6d-005056801329'),(1845,'Смілянський','e4b1672c-4b33-11e4-ab6d-005056801329','e71e23a2-4b33-11e4-ab6d-005056801329','dcaae57c-4b33-11e4-ab6d-005056801329'),(1846,'Тальнівський','e4b16816-4b33-11e4-ab6d-005056801329','e71edde0-4b33-11e4-ab6d-005056801329','dcaae57c-4b33-11e4-ab6d-005056801329'),(1847,'Уманський','e4b16900-4b33-11e4-ab6d-005056801329','e71f771e-4b33-11e4-ab6d-005056801329','dcaae57c-4b33-11e4-ab6d-005056801329'),(1848,'Христинівський','e4b169f1-4b33-11e4-ab6d-005056801329','e71fbb5b-4b33-11e4-ab6d-005056801329','dcaae57c-4b33-11e4-ab6d-005056801329'),(1849,'Черкаська','e4b1704a-4b33-11e4-ab6d-005056801329','e71fe3ca-4b33-11e4-ab6d-005056801329','dcaae57c-4b33-11e4-ab6d-005056801329'),(1850,'Черкаський','e4b16ade-4b33-11e4-ab6d-005056801329','e71fe3ca-4b33-11e4-ab6d-005056801329','dcaae57c-4b33-11e4-ab6d-005056801329'),(1851,'Чигиринський','e4b16bc6-4b33-11e4-ab6d-005056801329','e71ff3e7-4b33-11e4-ab6d-005056801329','dcaae57c-4b33-11e4-ab6d-005056801329'),(1852,'Чорнобаївський','e4b16cab-4b33-11e4-ab6d-005056801329','e7201cce-4b33-11e4-ab6d-005056801329','dcaae57c-4b33-11e4-ab6d-005056801329'),(1853,'Шполянський','e4b16da1-4b33-11e4-ab6d-005056801329','e720626f-4b33-11e4-ab6d-005056801329','dcaae57c-4b33-11e4-ab6d-005056801329'),(1854,'Вижницький','e4b1713a-4b33-11e4-ab6d-005056801329','e716016e-4b33-11e4-ab6d-005056801329','dcaae60e-4b33-11e4-ab6d-005056801329'),(1855,'Герцаївський','e4b17248-4b33-11e4-ab6d-005056801329','e71668d6-4b33-11e4-ab6d-005056801329','dcaae60e-4b33-11e4-ab6d-005056801329'),(1856,'Глибоцький','e4b1734f-4b33-11e4-ab6d-005056801329','e7167b0b-4b33-11e4-ab6d-005056801329','dcaae60e-4b33-11e4-ab6d-005056801329'),(1857,'Дністровський','e38127a3-46ee-11ec-80fb-b8830365bd04','e71fe717-4b33-11e4-ab6d-005056801329','dcaae60e-4b33-11e4-ab6d-005056801329'),(1858,'Заставнівський','e4b17466-4b33-11e4-ab6d-005056801329','e717c2ec-4b33-11e4-ab6d-005056801329','dcaae60e-4b33-11e4-ab6d-005056801329'),(1859,'Кельменецький','e4aa9ed4-4b33-11e4-ab6d-005056801329','e718a34b-4b33-11e4-ab6d-005056801329','dcaae60e-4b33-11e4-ab6d-005056801329'),(1860,'Кіцманський','e4aa9fb5-4b33-11e4-ab6d-005056801329','e718bd74-4b33-11e4-ab6d-005056801329','dcaae60e-4b33-11e4-ab6d-005056801329'),(1861,'Новодністровська','e4aadd1a-4b33-11e4-ab6d-005056801329','e71c0361-4b33-11e4-ab6d-005056801329','dcaae60e-4b33-11e4-ab6d-005056801329'),(1862,'Новоселицький','e4aaa099-4b33-11e4-ab6d-005056801329','e71c0ef8-4b33-11e4-ab6d-005056801329','dcaae60e-4b33-11e4-ab6d-005056801329'),(1863,'Путильський','e4aaa191-4b33-11e4-ab6d-005056801329','e71d32d0-4b33-11e4-ab6d-005056801329','dcaae60e-4b33-11e4-ab6d-005056801329'),(1864,'Сокирянський','e4aaa27b-4b33-11e4-ab6d-005056801329','e71e3344-4b33-11e4-ab6d-005056801329','dcaae60e-4b33-11e4-ab6d-005056801329'),(1865,'Сторожинецький','e4aadb5c-4b33-11e4-ab6d-005056801329','e71e6724-4b33-11e4-ab6d-005056801329','dcaae60e-4b33-11e4-ab6d-005056801329'),(1866,'Хотинський','e4aadc52-4b33-11e4-ab6d-005056801329','e71fb960-4b33-11e4-ab6d-005056801329','dcaae60e-4b33-11e4-ab6d-005056801329'),(1867,'Чернівецький','5c48eb01-4b6c-11ec-80fb-b8830365bd04','e71fe717-4b33-11e4-ab6d-005056801329','dcaae60e-4b33-11e4-ab6d-005056801329'),(1868,'Бахмацький','e4aaddeb-4b33-11e4-ab6d-005056801329','e7145385-4b33-11e4-ab6d-005056801329','dcaae6a8-4b33-11e4-ab6d-005056801329'),(1869,'Бобровицький','e4aae8a0-4b33-11e4-ab6d-005056801329','e714cab5-4b33-11e4-ab6d-005056801329','dcaae6a8-4b33-11e4-ab6d-005056801329'),(1870,'Борзнянський','e4aae96a-4b33-11e4-ab6d-005056801329','e714de08-4b33-11e4-ab6d-005056801329','dcaae6a8-4b33-11e4-ab6d-005056801329'),(1871,'Варвинський','e4aaea2f-4b33-11e4-ab6d-005056801329','e7158c9e-4b33-11e4-ab6d-005056801329','dcaae6a8-4b33-11e4-ab6d-005056801329'),(1872,'Городнянський','e4aaeafb-4b33-11e4-ab6d-005056801329','e716c018-4b33-11e4-ab6d-005056801329','dcaae6a8-4b33-11e4-ab6d-005056801329'),(1873,'Ічнянський','e4aaebc7-4b33-11e4-ab6d-005056801329','e7185bbe-4b33-11e4-ab6d-005056801329','dcaae6a8-4b33-11e4-ab6d-005056801329'),(1874,'Козелецький','e4aaec85-4b33-11e4-ab6d-005056801329','e7190594-4b33-11e4-ab6d-005056801329','dcaae6a8-4b33-11e4-ab6d-005056801329'),(1875,'Коропський','e4aaed44-4b33-11e4-ab6d-005056801329','e719a5c4-4b33-11e4-ab6d-005056801329','dcaae6a8-4b33-11e4-ab6d-005056801329'),(1876,'Корюківський','e4aaee06-4b33-11e4-ab6d-005056801329','e719aee4-4b33-11e4-ab6d-005056801329','dcaae6a8-4b33-11e4-ab6d-005056801329'),(1877,'Куликівський','e4aaeecc-4b33-11e4-ab6d-005056801329','e71a3e3d-4b33-11e4-ab6d-005056801329','dcaae6a8-4b33-11e4-ab6d-005056801329'),(1878,'Менський','e4aaef8a-4b33-11e4-ab6d-005056801329','e71b0d2a-4b33-11e4-ab6d-005056801329','dcaae6a8-4b33-11e4-ab6d-005056801329'),(1879,'Ніжинський','e4aaf5d3-4b33-11e4-ab6d-005056801329','e71b833e-4b33-11e4-ab6d-005056801329','dcaae6a8-4b33-11e4-ab6d-005056801329'),(1880,'Новгород-Сіверська','e4b135ec-4b33-11e4-ab6d-005056801329','e71bae4d-4b33-11e4-ab6d-005056801329','dcaae6a8-4b33-11e4-ab6d-005056801329'),(1881,'Новгород-Сіверський','e4aaf690-4b33-11e4-ab6d-005056801329','e71bae4d-4b33-11e4-ab6d-005056801329','dcaae6a8-4b33-11e4-ab6d-005056801329'),(1882,'Носівський','e4aaf759-4b33-11e4-ab6d-005056801329','e71c1b65-4b33-11e4-ab6d-005056801329','dcaae6a8-4b33-11e4-ab6d-005056801329'),(1883,'Прилуцький','e4aaf81c-4b33-11e4-ab6d-005056801329','e71d1570-4b33-11e4-ab6d-005056801329','dcaae6a8-4b33-11e4-ab6d-005056801329'),(1884,'Ріпкинський','e4aaf8da-4b33-11e4-ab6d-005056801329','e71d69db-4b33-11e4-ab6d-005056801329','dcaae6a8-4b33-11e4-ab6d-005056801329'),(1885,'Семенівський','e4aaf50e-4b33-11e4-ab6d-005056801329','e71dbd57-4b33-11e4-ab6d-005056801329','dcaae6a8-4b33-11e4-ab6d-005056801329'),(1886,'Сновський','e4aaf048-4b33-11e4-ab6d-005056801329','e7206fc9-4b33-11e4-ab6d-005056801329','dcaae6a8-4b33-11e4-ab6d-005056801329'),(1887,'Сосницький','e4aaf44e-4b33-11e4-ab6d-005056801329','e71e3fc4-4b33-11e4-ab6d-005056801329','dcaae6a8-4b33-11e4-ab6d-005056801329'),(1888,'Срібнянський','e4aaf381-4b33-11e4-ab6d-005056801329','e71e495c-4b33-11e4-ab6d-005056801329','dcaae6a8-4b33-11e4-ab6d-005056801329'),(1889,'Талалаївський','e4aaf1d2-4b33-11e4-ab6d-005056801329','e71e79a4-4b33-11e4-ab6d-005056801329','dcaae6a8-4b33-11e4-ab6d-005056801329'),(1890,'Чернігівський','e4aaf10b-4b33-11e4-ab6d-005056801329','e71feb5c-4b33-11e4-ab6d-005056801329','dcaae6a8-4b33-11e4-ab6d-005056801329');
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
  `office_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `office_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settlement_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `settlement_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `district_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
  `currency` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settlement_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settlement` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `office_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `office` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('NEW','IN_PROCESSING','CLOSED','COMPLETED') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'NEW',
  `user_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_user_id_foreign` (`user_id`),
  CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('ACTIVE','INACTIVE') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
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
INSERT INTO `pages` VALUES (1,1,'Доставка та оплата',NULL,'<!-- wp:paragraph --><p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p><!-- /wp:paragraph -->','pages/December2024/OzbsDjUVnEfyWkXhA0mG.webp','dostavka-ta-oplata','ACTIVE','2024-10-16 13:30:55','2025-02-20 09:31:28'),(6,1,'Главная',NULL,'<!-- wp:my-namespace/main-slider {\"fields\":{\"list\":\"[{\\u0022file\\u0022:\\u0022blocks/aYoe3NmEhMejh36lsGnWaYgd3ivr9Gdumew266Ii.jpg\\u0022,\\u0022slide-title\\u0022:\\u0022Slide 1\\u0022,\\u0022slide-subtitle\\u0022:\\u0022Sub title slide 1\\u0022,\\u0022link\\u0022:\\u0022/category-1\\u0022,\\u0022link-text\\u0022:\\u0022Category 1\\u0022,\\u0022slide-description\\u0022:\\u0022Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.\\u0022},{\\u0022file\\u0022:\\u0022blocks/qDM7H7JAj7jBM5WVWelltCkOoa0zwJnny0CVBCEr.jpg\\u0022,\\u0022slide-title\\u0022:\\u0022Slide 2\\u0022,\\u0022slide-subtitle\\u0022:\\u0022Sub title slide 2\\u0022,\\u0022slide-description\\u0022:\\u0022Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.\\u0022}]\"}} /--><!-- wp:my-namespace/information {\"fields\":{\"delivery-title\":\"Безкоштовна доставка по Україні\",\"delivery-subtitle\":\"При замовленні від 20 000 грн.\",\"support-title\":\"Підтримка 24/7\",\"support-subtitle\":\"Телефонуйте нам 24 години на добу\",\"payment-title\":\"100% безпечна оплата\",\"payment-subtitle\":\"Ваш платіж у безпеці з нами.\"}} /--><!-- wp:my-namespace/popular-products /--><!-- wp:my-namespace/product-categories {\"fields\":{\"categories\":[\"1\",\"2\"]}} /--><!-- wp:my-namespace/latest-posts {\"fields\":{\"block-title\":\"Останні статті\"}} /-->',NULL,'glavnaya','ACTIVE','2024-12-10 13:04:41','2025-02-20 11:58:18'),(7,1,'Контакты','[]','<!-- wp:my-namespace/contact-block /--><!-- wp:my-namespace/contact-form /-->',NULL,'contacts','ACTIVE','2024-12-19 13:27:35','2025-02-19 23:34:00');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
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
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('PUBLISHED','DRAFT','PENDING') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_attribute_values`
--

LOCK TABLES `product_attribute_values` WRITE;
/*!40000 ALTER TABLE `product_attribute_values` DISABLE KEYS */;
INSERT INTO `product_attribute_values` VALUES (1,1,9),(2,1,19),(3,1,21),(9,3,7),(10,3,20),(11,3,21),(12,3,22);
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
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
INSERT INTO `product_categories` VALUES (1,'Category 1','category-1',NULL,'product-categories/3_1.jpg','2025-01-08 15:10:00','2025-01-08 15:17:07'),(2,'Category 2','category-2',NULL,'product-categories/3.jpg','2025-01-08 15:10:00','2025-01-08 15:16:56');
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
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `full_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `size_chart` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `images` json DEFAULT NULL,
  `image_thumbnails` json DEFAULT NULL,
  `article` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` int unsigned NOT NULL,
  `discount_price` int unsigned DEFAULT NULL,
  `currency_id` bigint unsigned DEFAULT NULL,
  `rating` double(3,2) DEFAULT NULL,
  `number_of_ratings` int unsigned DEFAULT NULL,
  `product_category_id` bigint unsigned DEFAULT NULL,
  `status` enum('PUBLISHED','NOT_AVAILABLE','DRAFT') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `new` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `w_price` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_article_unique` (`article`),
  KEY `products_product_category_id_foreign` (`product_category_id`),
  KEY `products_currency_id_foreign` (`currency_id`),
  CONSTRAINT `products_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE SET NULL,
  CONSTRAINT `products_product_category_id_foreign` FOREIGN KEY (`product_category_id`) REFERENCES `product_categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Product 1','product-1','<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>','<h2>Where does it come from?</h2>\r\n<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p>\r\n<p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>','<table style=\"border-collapse: collapse; width: 100%;\" border=\"1\"><colgroup><col style=\"width: 24.9785%;\"><col style=\"width: 24.9785%;\"><col style=\"width: 24.9785%;\"><col style=\"width: 24.9785%;\"></colgroup>\r\n<tbody>\r\n<tr>\r\n<td>&nbsp;</td>\r\n<td style=\"text-align: center;\"><strong>S</strong></td>\r\n<td style=\"text-align: center;\"><strong>M</strong></td>\r\n<td style=\"text-align: center;\"><strong>L</strong></td>\r\n</tr>\r\n<tr>\r\n<td>size 1</td>\r\n<td style=\"text-align: center;\">86 - 90 см</td>\r\n<td style=\"text-align: center;\">90 - 94 см</td>\r\n<td style=\"text-align: center;\">94 - 98 см</td>\r\n</tr>\r\n<tr>\r\n<td>size 2</td>\r\n<td style=\"text-align: center;\">66 - 70 см</td>\r\n<td style=\"text-align: center;\">70 - 74 см</td>\r\n<td style=\"text-align: center;\">74 - 78 см</td>\r\n</tr>\r\n<tr>\r\n<td>size 3</td>\r\n<td style=\"text-align: center;\">94 - 98 см</td>\r\n<td style=\"text-align: center;\">98 - 102 см</td>\r\n<td style=\"text-align: center;\">102 - 106 см</td>\r\n</tr>\r\n</tbody>\r\n</table>','[\"products/1/pr.jpg\", \"products/1/pr_1.jpg\", \"products/1/pr_2.jpg\"]','[[{\"url\": \"products/1/pr-resize-300.jpg\", \"width\": \"300\"}, {\"url\": \"products/1/pr-resize-500.jpg\", \"width\": \"500\"}, {\"url\": \"products/1/pr-resize-800.jpg\", \"width\": \"800\"}, {\"url\": \"products/1/pr-resize-1200.jpg\", \"width\": \"1200\"}], [{\"url\": \"products/1/pr_1-resize-300.jpg\", \"width\": \"300\"}, {\"url\": \"products/1/pr_1-resize-500.jpg\", \"width\": \"500\"}, {\"url\": \"products/1/pr_1-resize-800.jpg\", \"width\": \"800\"}, {\"url\": \"products/1/pr_1-resize-1200.jpg\", \"width\": \"1200\"}], [{\"url\": \"products/1/pr_2-resize-300.jpg\", \"width\": \"300\"}, {\"url\": \"products/1/pr_2-resize-500.jpg\", \"width\": \"500\"}, {\"url\": \"products/1/pr_2-resize-800.jpg\", \"width\": \"800\"}, {\"url\": \"products/1/pr_2-resize-1200.jpg\", \"width\": \"1200\"}]]','0000001',1000,900,1,4.00,1,1,'PUBLISHED',1,1,'2025-01-08 15:14:00','2025-01-28 16:47:11',500),(3,'Product 2','product-2','<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>','<h2>Where does it come from?</h2>\r\n<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p>\r\n<p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>','<table style=\"border-collapse: collapse; width: 100%;\" border=\"1\"><colgroup><col style=\"width: 24.9785%;\"><col style=\"width: 24.9785%;\"><col style=\"width: 24.9785%;\"><col style=\"width: 24.9785%;\"></colgroup>\r\n<tbody>\r\n<tr>\r\n<td>&nbsp;</td>\r\n<td style=\"text-align: center;\"><strong>S</strong></td>\r\n<td style=\"text-align: center;\"><strong>M</strong></td>\r\n<td style=\"text-align: center;\"><strong>L</strong></td>\r\n</tr>\r\n<tr>\r\n<td>size 1</td>\r\n<td style=\"text-align: center;\">86 - 90 см</td>\r\n<td style=\"text-align: center;\">90 - 94 см</td>\r\n<td style=\"text-align: center;\">94 - 98 см</td>\r\n</tr>\r\n<tr>\r\n<td>size 2</td>\r\n<td style=\"text-align: center;\">66 - 70 см</td>\r\n<td style=\"text-align: center;\">70 - 74 см</td>\r\n<td style=\"text-align: center;\">74 - 78 см</td>\r\n</tr>\r\n<tr>\r\n<td>size 3</td>\r\n<td style=\"text-align: center;\">94 - 98 см</td>\r\n<td style=\"text-align: center;\">98 - 102 см</td>\r\n<td style=\"text-align: center;\">102 - 106 см</td>\r\n</tr>\r\n</tbody>\r\n</table>','[\"products/3/pr.jpg\"]','[[{\"url\": \"products/3/pr-resize-300.jpg\", \"width\": \"300\"}, {\"url\": \"products/3/pr-resize-500.jpg\", \"width\": \"500\"}, {\"url\": \"products/3/pr-resize-800.jpg\", \"width\": \"800\"}, {\"url\": \"products/3/pr-resize-1200.jpg\", \"width\": \"1200\"}]]',NULL,2000,1900,1,4.98,56,2,'PUBLISHED',1,1,'2025-01-26 18:31:00','2025-02-19 11:50:07',1500);
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
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int NOT NULL DEFAULT '1',
  `group` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'site.title','Site Title','Site name','','text',1,'Site'),(2,'site.description','Site Description','About you site','','text',2,'Site'),(4,'site.google_analytics_tracking_id','Google Analytics Tracking ID',NULL,'','text',4,'Site'),(5,'admin.bg_image','Admin Background Image','','','image',5,'Admin'),(6,'admin.title','Admin Title','Voyager','','text',1,'Admin'),(7,'admin.description','Admin Description','Welcome to Voyager. The Missing Admin for Laravel','','text',2,'Admin'),(8,'admin.loader','Admin Loader','','','image',3,'Admin'),(9,'admin.icon_image','Admin Icon Image','','','image',4,'Admin'),(10,'admin.google_analytics_client_id','Google Analytics Client ID (used for admin dashboard)',NULL,'','text',1,'Admin'),(21,'site.home_page','Главная страница','6','{\"default\":null,\"options\":{\"\":\"\\u0412\\u044b\\u0431\\u0435\\u0440\\u0438\\u0442\\u0435 \\u0441\\u0442\\u0440\\u0430\\u043d\\u0438\\u0446\\u0443\",\"6\":\"\\u0413\\u043b\\u0430\\u0432\\u043d\\u0430\\u044f\",\"1\":\"\\u0414\\u043e\\u0441\\u0442\\u0430\\u0432\\u043a\\u0430 \\u0442\\u0430 \\u043e\\u043f\\u043b\\u0430\\u0442\\u0430\",\"7\":\"\\u041a\\u043e\\u043d\\u0442\\u0430\\u043a\\u0442\\u0438\"}}','select_dropdown',1,'Site'),(22,'site.shipping_policy','Shipping Policy','<div class=\"section-title\">\r\n<h2 class=\"title\">Shipping policy for our store</h2>\r\n<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate</p>\r\n</div>',NULL,'rich_text_box',6,'Site'),(23,'site.mail','Почта','test@gmail.com',NULL,'text',7,'Site'),(24,'site.address','Адрес','Украина',NULL,'text',8,'Site'),(25,'site.favicon','Favicon','settings/December2024/vNSRPx82RknP5kEbzIel.png',NULL,'image',9,'Site'),(26,'site.logo','Logo','settings/December2024/PZVWPCfD1kDT3T3wi190.png',NULL,'image',10,'Site'),(28,'site.phone','Телефон','+38 093 000 00 00',NULL,'text',12,'Site'),(33,'site.telegram_description','Telegram описание','Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.\r\nUt wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate',NULL,'code_editor',14,'Site'),(34,'site.orders_chat','Orders chat',NULL,NULL,'select_dropdown',15,'Site');
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
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
  `chat_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
  `table_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int unsigned NOT NULL,
  `locale` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `wholesaler` enum('NONE','REQUEST','WHOLESALER') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'NONE',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_role_id_foreign` (`role_id`),
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,1,'Admin',NULL,NULL,'admin@admin.com','users/default.png',NULL,'$2y$10$WYtvF172ryqegFnB5k4HTOevaIO2RVeqKwp4z/8Xn0b8S/Fxuf18G','Hykjm2Entr4Pb07U0XLuFsH8A87mVNYfAvcOozJkhaMh8hpAy1a7PB4fblN4','{\"locale\":\"ru\"}','2024-10-16 13:30:55','2024-10-16 13:34:38','NONE');
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

-- Dump completed on 2025-02-20 14:32:03
