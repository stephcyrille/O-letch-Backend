-- MySQL dump 10.13  Distrib 5.5.54, for debian-linux-gnu (x86_64)
--
-- Host: mebenga.mysql.pythonanywhere-services.com    Database: mebenga$oletchdb
-- ------------------------------------------------------
-- Server version	5.6.27-log

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add user',2,'add_user'),(5,'Can change user',2,'change_user'),(6,'Can delete user',2,'delete_user'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add permission',4,'add_permission'),(11,'Can change permission',4,'change_permission'),(12,'Can delete permission',4,'delete_permission'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add user profile',7,'add_userprofile'),(20,'Can change user profile',7,'change_userprofile'),(21,'Can delete user profile',7,'delete_userprofile'),(22,'Can add user avatar',8,'add_useravatar'),(23,'Can change user avatar',8,'change_useravatar'),(24,'Can delete user avatar',8,'delete_useravatar'),(25,'Can add article',9,'add_article'),(26,'Can change article',9,'change_article'),(27,'Can delete article',9,'delete_article'),(28,'Can add question',10,'add_question'),(29,'Can change question',10,'change_question'),(30,'Can delete question',10,'delete_question'),(31,'Can add answer',11,'add_answer'),(32,'Can change answer',11,'change_answer'),(33,'Can delete answer',11,'delete_answer'),(34,'Can add project',12,'add_project'),(35,'Can change project',12,'change_project'),(36,'Can delete project',12,'delete_project'),(37,'Can add project starter',13,'add_projectstarter'),(38,'Can change project starter',13,'change_projectstarter'),(39,'Can delete project starter',13,'delete_projectstarter');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$30000$r3sRBR7kOm7G$W+gOoB5Lqfy7e4MznzCY9E8JHXNG41hsgYq5NcULqJ8=','2018-04-05 22:17:45.249257',1,'stephcyrille','','','stephcyril.sc@gmail.com',1,1,'2018-04-05 22:11:47.942346'),(2,'pbkdf2_sha256$30000$6b1o1biT0Atk$PshOk0Z/a2wB1VsLeIbN3/q4SawYVnB1kAseMlTn9I4=',NULL,0,'mebenga','','','',0,1,'2018-04-05 22:29:11.684594');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2018-04-05 22:18:07.451600','1','stephcyrille',1,'[{\"added\": {}}]',8,1),(2,'2018-04-05 22:19:24.100120','1','stephcyrille, Douala',1,'[{\"added\": {}}]',7,1),(3,'2018-04-05 22:23:31.836446','1','Z5',1,'[{\"added\": {}}]',9,1),(4,'2018-04-05 22:24:31.648768','2','Z5',1,'[{\"added\": {}}]',9,1),(5,'2018-04-05 22:25:11.895460','3','Z4',1,'[{\"added\": {}}]',9,1),(6,'2018-04-05 22:26:06.298410','4','Z3',1,'[{\"added\": {}}]',9,1),(7,'2018-04-05 22:28:04.087007','4','Z3',2,'[{\"changed\": {\"fields\": [\"image\"]}}]',9,1),(8,'2018-04-05 22:29:11.740999','2','mebenga',1,'[{\"added\": {}}]',2,1),(9,'2018-04-05 22:31:18.436754','2','mebenga, Yaounde',1,'[{\"added\": {}}]',7,1),(10,'2018-04-05 22:32:06.006703','2','mebenga',1,'[{\"added\": {}}]',8,1),(11,'2018-04-05 22:32:40.344362','1','Comment commencer une exploitation agricole',1,'[{\"added\": {}}]',10,1),(12,'2018-04-05 22:33:00.042340','2','Plaintain ou manioc dans mon champ',1,'[{\"added\": {}}]',10,1),(13,'2018-04-05 22:33:18.964598','3','Corn Help',1,'[{\"added\": {}}]',10,1),(14,'2018-04-05 22:33:37.735118','4','Invasion de de bacterie sur mes pasteques',1,'[{\"added\": {}}]',10,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(4,'auth','permission'),(2,'auth','user'),(5,'contenttypes','contenttype'),(9,'news','article'),(12,'project','project'),(13,'project','projectstarter'),(11,'question','answer'),(10,'question','question'),(6,'sessions','session'),(8,'userProfile','useravatar'),(7,'userProfile','userprofile');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2018-04-05 22:08:57.396230'),(2,'auth','0001_initial','2018-04-05 22:09:09.533202'),(3,'admin','0001_initial','2018-04-05 22:09:14.211714'),(4,'admin','0002_logentry_remove_auto_add','2018-04-05 22:09:14.248411'),(5,'contenttypes','0002_remove_content_type_name','2018-04-05 22:09:14.398488'),(6,'auth','0002_alter_permission_name_max_length','2018-04-05 22:09:14.452668'),(7,'auth','0003_alter_user_email_max_length','2018-04-05 22:09:14.508845'),(8,'auth','0004_alter_user_username_opts','2018-04-05 22:09:14.526210'),(9,'auth','0005_alter_user_last_login_null','2018-04-05 22:09:14.593004'),(10,'auth','0006_require_contenttypes_0002','2018-04-05 22:09:14.600838'),(11,'auth','0007_alter_validators_add_error_messages','2018-04-05 22:09:14.619433'),(12,'auth','0008_alter_user_username_max_length','2018-04-05 22:09:14.675249'),(13,'news','0001_initial','2018-04-05 22:09:18.074686'),(14,'userProfile','0001_initial','2018-04-05 22:09:23.352461'),(15,'project','0001_initial','2018-04-05 22:09:34.940658'),(16,'project','0002_auto_20180402_1329','2018-04-05 22:09:35.103720'),(17,'project','0003_auto_20180402_1537','2018-04-05 22:09:35.198238'),(18,'project','0004_auto_20180402_1544','2018-04-05 22:09:35.332190'),(19,'project','0005_project_projecttype','2018-04-05 22:09:35.401805'),(20,'userProfile','0002_auto_20180312_1945','2018-04-05 22:09:35.414722'),(21,'userProfile','0003_auto_20180405_2205','2018-04-05 22:09:35.706138'),(22,'userProfile','0004_auto_20180405_2209','2018-04-05 22:09:35.732425'),(23,'question','0001_initial','2018-04-05 22:09:42.509054'),(24,'question','0002_auto_20180312_2017','2018-04-05 22:09:42.589104'),(25,'sessions','0001_initial','2018-04-05 22:10:10.380727');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('6dvn1902s9dm1cewd2jj5ujch2j6oubx','ODY1Mjk3NGE2OWM3YjhlMzFmNGY3NWIwMWRkODJhNGYyMzZjMzczYjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiI2NTRhNzM2Yjk2NGUyZmE2MjVjMDNmMTRjZGY1YWM0NTg3ODUxYjgzIn0=','2018-04-19 22:17:45.257429');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news_article`
--

DROP TABLE IF EXISTS `news_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `zone` varchar(20) NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` longtext NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `update_at` datetime(6) NOT NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news_article`
--

LOCK TABLES `news_article` WRITE;
/*!40000 ALTER TABLE `news_article` DISABLE KEYS */;
INSERT INTO `news_article` VALUES (1,'Z5','Foire Agricole de Mbankomo','La foire de agricole de Mbankomo comme chaque annee au mois de Janvier a bel et bien debuter et les population toujours aussi excite par l\\\'evenement accourent nombreux pour decouvrir les differentes expositions',1,'2018-04-05 22:23:31.815082','2018-04-05 22:23:31.815120','news/card-centre.jpg'),(2,'Z5','Cacao et derive: transformation','Un nouveau procédé de transformation local a été mis en place par les population du village de Biyan. Le délégué regional s\'est rendu dans la localité pour encourager les jeune plein d\'imagination.',1,'2018-04-05 22:24:31.634980','2018-04-05 22:24:31.635043','news/header.jpg'),(3,'Z4','Subvention des Agriculteur de Penja','Désormais les agriculteurs de Djombe Penja auront accès a différentes formations sur la mise en place d\'un projet agricole ainsi que des différents outils de suivi de projet',1,'2018-04-05 22:25:11.878995','2018-04-05 22:25:11.879058','news/card-saopaolo.png'),(4,'Z3','Nouvelle Faculté des science agronomes de Bamenda','La foire de agricole de Bamenda comme chaque année au mois de Janvier a bel et bien débuter et les population toujours aussi excite par l’événement accourent nombreux pour découvrir.',1,'2018-04-05 22:26:06.297503','2018-04-05 22:26:06.297542','news/card-etoudy.jpg');
/*!40000 ALTER TABLE `news_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_project`
--

DROP TABLE IF EXISTS `project_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `zone` varchar(50) NOT NULL,
  `product` varchar(50) NOT NULL,
  `surface` int(11) NOT NULL,
  `treeNursery` tinyint(1) NOT NULL,
  `treeNumberByHectare` int(11) NOT NULL,
  `semDensity` int(11) NOT NULL,
  `fertilizerProportion` int(11) NOT NULL,
  `phytoThreatment` int(11) NOT NULL,
  `productPrice` int(11) NOT NULL,
  `semDate` datetime(6) NOT NULL,
  `cropDate` datetime(6) NOT NULL,
  `cropTotalProduct` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `update_at` datetime(6) NOT NULL,
  `author_id` int(11) NOT NULL,
  `projectType` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `project_project_author_id_f265eaee_fk_userProfile_userprofile_id` (`author_id`),
  CONSTRAINT `project_project_author_id_f265eaee_fk_userProfile_userprofile_id` FOREIGN KEY (`author_id`) REFERENCES `userProfile_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_project`
--

LOCK TABLES `project_project` WRITE;
/*!40000 ALTER TABLE `project_project` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_projectstarter`
--

DROP TABLE IF EXISTS `project_projectstarter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_projectstarter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `zone` varchar(200) NOT NULL,
  `product` varchar(50) NOT NULL,
  `surface` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `update_at` datetime(6) NOT NULL,
  `author_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `project_projectstarter_author_id_086bfe01_uniq` (`author_id`),
  CONSTRAINT `project_project_author_id_086bfe01_fk_userProfile_userprofile_id` FOREIGN KEY (`author_id`) REFERENCES `userProfile_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_projectstarter`
--

LOCK TABLES `project_projectstarter` WRITE;
/*!40000 ALTER TABLE `project_projectstarter` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_projectstarter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_answer`
--

DROP TABLE IF EXISTS `question_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question_answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` longtext NOT NULL,
  `vote` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `update_at` datetime(6) NOT NULL,
  `author_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `question_answer_author_id_84c0e2c6_fk_userProfile_userprofile_id` (`author_id`),
  KEY `question_answer_7aa0f6ee` (`question_id`),
  CONSTRAINT `question_answer_author_id_84c0e2c6_fk_userProfile_userprofile_id` FOREIGN KEY (`author_id`) REFERENCES `userProfile_userprofile` (`id`),
  CONSTRAINT `question_answer_question_id_2220065b_fk_question_question_id` FOREIGN KEY (`question_id`) REFERENCES `question_question` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_answer`
--

LOCK TABLES `question_answer` WRITE;
/*!40000 ALTER TABLE `question_answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `question_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_question`
--

DROP TABLE IF EXISTS `question_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `vote` int(11) NOT NULL,
  `content` longtext NOT NULL,
  `toggle` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `update_at` datetime(6) NOT NULL,
  `author_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `question_questi_author_id_e60a90bb_fk_userProfile_userprofile_id` (`author_id`),
  CONSTRAINT `question_questi_author_id_e60a90bb_fk_userProfile_userprofile_id` FOREIGN KEY (`author_id`) REFERENCES `userProfile_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_question`
--

LOCK TABLES `question_question` WRITE;
/*!40000 ALTER TABLE `question_question` DISABLE KEYS */;
INSERT INTO `question_question` VALUES (1,'Comment commencer une exploitation agricole',0,'Bonjour, je suis un jeune passioné par l\'agriculture et je souhaite me lancer dans la culture de manioc. J\'ai un terrain de 2 hectares à Mbankomo. Besoin d\'aide s\'il-vous plait.',1,'2018-04-05 22:32:40.343397','2018-04-05 22:32:40.343436',2),(2,'Plaintain ou manioc dans mon champ',0,'Bonsoir, je suis dans l\'embaras la, jesors d\'une recolte de plantains et je souhaiterais enchainer soit une nouvelle culture de plantain ou alors le manioc... Je suis un peux confus, besoin d\'aide. Merci.',1,'2018-04-05 22:33:00.041398','2018-04-05 22:33:00.041435',2),(3,'Corn Help',0,'Hello, I\'m just starting my corn startup and I need some help for finding corn cultivator. thanks.',1,'2018-04-05 22:33:18.963781','2018-04-05 22:33:18.963819',1),(4,'Invasion de de bacterie sur mes pasteques',0,'Besoin d\'aide pour l\'invasion de champignons dont je suis victime dans mon champ de pasteque, j\'ai besoin d\'un bon pesticide bio. Merci.',1,'2018-04-05 22:33:37.734135','2018-04-05 22:33:37.734196',2);
/*!40000 ALTER TABLE `question_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userProfile_useravatar`
--

DROP TABLE IF EXISTS `userProfile_useravatar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userProfile_useravatar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `avatar` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userProfile_useravatar_user_id_d8ae0c7c_fk_auth_user_id` (`user_id`),
  CONSTRAINT `userProfile_useravatar_user_id_d8ae0c7c_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userProfile_useravatar`
--

LOCK TABLES `userProfile_useravatar` WRITE;
/*!40000 ALTER TABLE `userProfile_useravatar` DISABLE KEYS */;
INSERT INTO `userProfile_useravatar` VALUES (1,'avatars/stephcyrille/stephcyrille-None_77eNc03.jpg',1),(2,'avatars/mebenga/mebenga-None_bkJFqcs.png',2);
/*!40000 ALTER TABLE `userProfile_useravatar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userProfile_userprofile`
--

DROP TABLE IF EXISTS `userProfile_userprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userProfile_userprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(9) NOT NULL,
  `profession` varchar(50) NOT NULL,
  `country` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `update_at` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userProfile_userprofile_e8701ad4` (`user_id`),
  CONSTRAINT `userProfile_userprofile_user_id_c47c58e7_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userProfile_userprofile`
--

LOCK TABLES `userProfile_userprofile` WRITE;
/*!40000 ALTER TABLE `userProfile_userprofile` DISABLE KEYS */;
INSERT INTO `userProfile_userprofile` VALUES (1,'693458540','Etudiant','Cameroun','Douala','2018-04-05 22:19:24.099246','2018-04-05 22:19:24.099282',1),(2,'697267207','Developpeur Fullstack','Cameroun','Yaounde','2018-04-05 22:31:18.435796','2018-04-05 22:31:18.435837',2);
/*!40000 ALTER TABLE `userProfile_userprofile` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-04-05 22:34:45
