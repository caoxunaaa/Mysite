-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: mysite_db
-- ------------------------------------------------------
-- Server version	8.0.20

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add blog',7,'add_blog'),(26,'Can change blog',7,'change_blog'),(27,'Can delete blog',7,'delete_blog'),(28,'Can view blog',7,'view_blog'),(29,'Can add blog type',8,'add_blogtype'),(30,'Can change blog type',8,'change_blogtype'),(31,'Can delete blog type',8,'delete_blogtype'),(32,'Can view blog type',8,'view_blogtype'),(33,'Can add read statistics',9,'add_readstatistics'),(34,'Can change read statistics',9,'change_readstatistics'),(35,'Can delete read statistics',9,'delete_readstatistics'),(36,'Can view read statistics',9,'view_readstatistics'),(37,'Can add read statistics detail',10,'add_readstatisticsdetail'),(38,'Can change read statistics detail',10,'change_readstatisticsdetail'),(39,'Can delete read statistics detail',10,'delete_readstatisticsdetail'),(40,'Can view read statistics detail',10,'view_readstatisticsdetail'),(41,'Can add comment',11,'add_comment'),(42,'Can change comment',11,'change_comment'),(43,'Can delete comment',11,'delete_comment'),(44,'Can view comment',11,'view_comment'),(45,'Can add likes count',12,'add_likescount'),(46,'Can change likes count',12,'change_likescount'),(47,'Can delete likes count',12,'delete_likescount'),(48,'Can view likes count',12,'view_likescount'),(49,'Can add likes record',13,'add_likesrecord'),(50,'Can change likes record',13,'change_likesrecord'),(51,'Can delete likes record',13,'delete_likesrecord'),(52,'Can view likes record',13,'view_likesrecord'),(53,'Can add dislikes count',14,'add_dislikescount'),(54,'Can change dislikes count',14,'change_dislikescount'),(55,'Can delete dislikes count',14,'delete_dislikescount'),(56,'Can view dislikes count',14,'view_dislikescount'),(57,'Can add profile',15,'add_profile'),(58,'Can change profile',15,'change_profile'),(59,'Can delete profile',15,'delete_profile'),(60,'Can view profile',15,'view_profile');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$180000$LG8y7QMG9HA6$Jx/ShwAGx+v/Iz/aomINb68eTzxtAnbqOXRZSqkW7bU=','2020-06-29 05:37:11.039400',1,'caoxun','','','273935195@qq.com',1,1,'2020-05-29 03:03:00.000000'),(3,'pbkdf2_sha256$180000$04r11seC3pUQ$GCKnQ4tEC9SSsjZX8eEEG/gR7R7r2FHMpjZjSP30Mxs=','2020-06-16 05:17:34.159000',0,'yezi123','','','yezi@qq.com',0,1,'2020-06-05 01:36:38.535000'),(4,'pbkdf2_sha256$180000$Vi7KrEMwAGIz$4j1vwPcODnsB8QmG5oqb539Kp/LgkuVcEvmknXHq9eA=','2020-06-16 14:07:59.222000',0,'yeziyezi','','','123@qq.com',0,1,'2020-06-12 01:11:56.061000'),(5,'pbkdf2_sha256$180000$FYy2ZIwUgPy2$/v7tbIsfGHsa4vHrwhYuOGcWDX3qcvvjrEKR7KuFSQg=','2020-06-23 02:55:49.649000',0,'test_person_1','','','test_person_1@qq.com',0,1,'2020-06-16 05:27:08.785000'),(6,'pbkdf2_sha256$180000$FvuFCYILCDvS$FdFkBO/VwPRAy1ZJKCfzTSrWnS9EWIzqIl/+DyA5IkQ=','2020-06-23 08:01:25.843000',0,'test_person_3','','','xun.cao@superxon.com',0,1,'2020-06-23 07:53:46.093000');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_blog`
--

DROP TABLE IF EXISTS `blog_blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_blog` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `updated_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `auth_id` int NOT NULL,
  `blog_type_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_blog_auth_id_56cd6e6a_fk_auth_user_id` (`auth_id`),
  KEY `blog_blog_blog_type_id_de11bd65_fk_blog_blogtype_id` (`blog_type_id`),
  CONSTRAINT `blog_blog_auth_id_56cd6e6a_fk_auth_user_id` FOREIGN KEY (`auth_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `blog_blog_blog_type_id_de11bd65_fk_blog_blogtype_id` FOREIGN KEY (`blog_type_id`) REFERENCES `blog_blogtype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_blog`
--

LOCK TABLES `blog_blog` WRITE;
/*!40000 ALTER TABLE `blog_blog` DISABLE KEYS */;
INSERT INTO `blog_blog` VALUES (1,'新的开始','<p>这是自学之后开始写网站的第一篇文章。这是一个开始。<img alt=\"wink\" src=\"http://127.0.0.1:8000/static/ckeditor/ckeditor/plugins/smiley/images/wink_smile.png\" style=\"height:23px; width:23px\" title=\"wink\" /></p>\r\n\r\n<p><img alt=\"\" src=\"/media/upload/2020/06/01/12.png\" style=\"height:180px; width:180px\" /></p>','2020-05-29 03:04:50.192000','2020-06-08 01:15:41.090000',0,1,1),(2,'晴天','从前从前有个人爱你很久，但偏偏风渐渐把距离吹得好远，好不容易又能再多爱一天，但故事的最后你好像还是说了拜拜','2020-05-29 03:51:05.732000','2020-06-01 05:17:12.248000',0,1,4),(3,'夜曲','我用漂亮的押韵，形容被掠夺一空的爱情；我用凄美的字型，描绘后悔莫及的那爱情。','2020-05-29 03:51:25.689000','2020-06-01 05:17:35.364000',0,1,4),(4,'一路向北','我一路向北，离开有你的季节，你说你好累，已无法再爱上谁。风在山路吹，过往的画面全都是不对，细数惭愧，我伤你几回','2020-05-29 03:52:00.143000','2020-06-01 05:17:55.450000',0,1,4),(5,'七里香','窗外的麻雀 在电线杆上多嘴\r\n你说这一句 很有夏天的感觉\r\n手中的铅笔 在纸上来来回回\r\n我用几行字形容你是我的bai谁\r\n秋刀鱼的滋味 猫跟你都想了解\r\n初恋的香味就这样被我们寻回\r\n那温暖的阳光 象刚摘的鲜艳草莓\r\n你说你舍不得吃掉这一种感觉\r\n雨下整夜 我的爱溢出就象雨水\r\n院子落叶 跟我的思念厚厚一叠\r\n几句是非 也无法将我的热情冷却\r\n你出现在我诗的每一页\r\n雨下整夜 我的爱溢出就象雨水\r\n窗台蝴du蝶 象诗里纷飞的美丽章节\r\n我接着写 把永远爱你写进诗的结尾\r\n你是我唯一想要的了解\r\n雨下整夜 我的爱溢出就象雨水\r\n院子落叶 跟我的思念厚厚一叠zhi\r\n几句是非 也无法将我的热情冷却\r\n你出现在我诗的每一页\r\n那饱满的稻穗 幸福了这个季节\r\n而你的脸颊象田里熟dao透的蕃茄\r\n你突然对我说\r\n七里香的名字很美\r\n我此刻却只想亲吻你倔强的嘴\r\n雨下整夜 我的爱溢出就象雨水\r\n院子落叶 跟我的思念厚厚一叠\r\n几句是非 也无法将我的热情冷却\r\n你出现在我诗的每一页\r\n整夜 我的爱溢出就象雨水\r\n窗台蝴蝶 象诗里纷飞的美丽章节\r\n我接着写 把永远爱你写进诗的结尾\r\n你是我唯一想要的了解','2020-06-01 01:50:56.573000','2020-06-01 05:23:03.218000',0,1,4),(6,'shell下循环创建第1篇文章','循环第1篇文章正文','2020-06-01 02:47:56.603000','2020-06-01 02:47:56.603000',0,1,1),(7,'shell下循环创建第2篇文章','循环第2篇文章正文','2020-06-01 02:47:56.712000','2020-06-01 02:47:56.712000',0,1,1),(8,'shell下循环创建第3篇文章','循环第3篇文章正文','2020-06-01 02:47:56.815000','2020-06-01 02:47:56.815000',0,1,1),(9,'shell下循环创建第4篇文章','循环第4篇文章正文','2020-06-01 02:47:56.901000','2020-06-01 02:47:56.902000',0,1,1),(10,'shell下循环创建第5篇文章','循环第5篇文章正文','2020-06-01 02:47:56.989000','2020-06-01 02:47:56.989000',0,1,1),(11,'shell下循环创建第6篇文章','循环第6篇文章正文','2020-06-01 02:47:57.078000','2020-06-01 02:47:57.079000',0,1,1),(12,'shell下循环创建第7篇文章','循环第7篇文章正文','2020-06-01 02:47:57.180000','2020-06-01 02:47:57.180000',0,1,1),(13,'shell下循环创建第8篇文章','循环第8篇文章正文','2020-06-01 02:47:57.283000','2020-06-01 02:47:57.283000',0,1,1),(14,'shell下循环创建第9篇文章','循环第9篇文章正文','2020-06-01 02:47:57.371000','2020-06-01 02:47:57.371000',0,1,1),(15,'shell下循环创建第10篇文章','循环第10篇文章正文','2020-06-01 02:47:57.462000','2020-06-01 02:47:57.462000',0,1,1),(16,'shell下循环创建第11篇文章','循环第11篇文章正文','2020-06-01 02:47:57.555000','2020-06-01 02:47:57.555000',0,1,1),(17,'shell下循环创建第12篇文章','循环第12篇文章正文','2020-06-01 02:47:57.645000','2020-06-01 02:47:57.645000',0,1,1),(18,'shell下循环创建第13篇文章','循环第13篇文章正文','2020-06-01 02:47:57.739000','2020-06-01 02:47:57.739000',0,1,1),(19,'shell下循环创建第14篇文章','循环第14篇文章正文','2020-06-01 02:47:57.844000','2020-06-01 02:47:57.844000',0,1,1),(20,'shell下循环创建第15篇文章','循环第15篇文章正文','2020-06-01 02:47:57.939000','2020-06-01 02:47:57.939000',0,1,1),(21,'shell下循环创建第16篇文章','循环第16篇文章正文','2020-06-01 02:47:58.030000','2020-06-01 02:47:58.030000',0,1,1),(22,'shell下循环创建第17篇文章','循环第17篇文章正文','2020-06-01 02:47:58.169000','2020-06-01 02:47:58.170000',0,1,1),(23,'shell下循环创建第18篇文章','循环第18篇文章正文','2020-06-01 02:47:58.333000','2020-06-01 02:47:58.333000',0,1,1),(24,'shell下循环创建第19篇文章','循环第19篇文章正文','2020-06-01 02:47:58.602000','2020-06-01 02:47:58.602000',0,1,1),(25,'shell下循环创建第20篇文章','循环第20篇文章正文','2020-06-01 02:47:58.706000','2020-06-01 02:47:58.706000',0,1,1),(26,'shell下循环创建第21篇文章','循环第21篇文章正文','2020-06-01 02:47:58.811000','2020-06-01 02:47:58.811000',0,1,1),(27,'shell下循环创建第22篇文章','循环第22篇文章正文','2020-06-01 02:47:58.905000','2020-06-01 02:47:58.905000',0,1,1),(28,'shell下循环创建第23篇文章','循环第23篇文章正文','2020-06-01 02:47:59.012000','2020-06-01 02:47:59.012000',0,1,1),(29,'shell下循环创建第24篇文章','循环第24篇文章正文','2020-06-01 02:47:59.110000','2020-06-01 02:47:59.110000',0,1,1),(30,'shell下循环创建第25篇文章','循环第25篇文章正文','2020-06-01 02:47:59.211000','2020-06-01 02:47:59.211000',0,1,1),(31,'shell下循环创建第26篇文章','循环第26篇文章正文','2020-06-01 02:47:59.314000','2020-06-01 02:47:59.314000',0,1,1),(32,'shell下循环创建第27篇文章','循环第27篇文章正文','2020-06-01 02:47:59.419000','2020-06-01 02:47:59.419000',0,1,1),(33,'shell下循环创建第28篇文章','循环第28篇文章正文','2020-06-01 02:47:59.513000','2020-06-01 02:47:59.513000',0,1,1),(34,'shell下循环创建第29篇文章','循环第29篇文章正文','2020-06-01 02:47:59.611000','2020-06-01 02:47:59.611000',0,1,1),(35,'shell下循环创建第30篇文章','循环第30篇文章正文','2020-06-01 02:47:59.705000','2020-06-01 07:56:32.371000',1,1,1),(36,'test 发邮件','<p>test 发邮件</p>','2020-06-24 05:48:34.116000','2020-06-24 05:48:34.116000',0,6,2);
/*!40000 ALTER TABLE `blog_blog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_blogtype`
--

DROP TABLE IF EXISTS `blog_blogtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_blogtype` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_blogtype`
--

LOCK TABLES `blog_blogtype` WRITE;
/*!40000 ALTER TABLE `blog_blogtype` DISABLE KEYS */;
INSERT INTO `blog_blogtype` VALUES (1,'随笔'),(2,'代码'),(3,'错误记录'),(4,'歌词');
/*!40000 ALTER TABLE `blog_blogtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment_comment`
--

DROP TABLE IF EXISTS `comment_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment_comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `context` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `commented_time` datetime(6) NOT NULL,
  `object_id` int unsigned NOT NULL,
  `content_type_id` int NOT NULL,
  `user_id` int NOT NULL,
  `parent_id` int DEFAULT NULL,
  `reply_to_id` int DEFAULT NULL,
  `root_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comment_comment_content_type_id_fbfb9793_fk_django_co` (`content_type_id`),
  KEY `comment_comment_parent_id_b612524c_fk_comment_comment_id` (`parent_id`),
  KEY `comment_comment_reply_to_id_e0adcef8_fk_auth_user_id` (`reply_to_id`),
  KEY `comment_comment_root_id_28721811_fk_comment_comment_id` (`root_id`),
  KEY `comment_comment_user_id_6078e57b_fk_auth_user_id` (`user_id`),
  CONSTRAINT `comment_comment_content_type_id_fbfb9793_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `comment_comment_parent_id_b612524c_fk_comment_comment_id` FOREIGN KEY (`parent_id`) REFERENCES `comment_comment` (`id`),
  CONSTRAINT `comment_comment_reply_to_id_e0adcef8_fk_auth_user_id` FOREIGN KEY (`reply_to_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `comment_comment_root_id_28721811_fk_comment_comment_id` FOREIGN KEY (`root_id`) REFERENCES `comment_comment` (`id`),
  CONSTRAINT `comment_comment_user_id_6078e57b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `comment_comment_chk_1` CHECK ((`object_id` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment_comment`
--

LOCK TABLES `comment_comment` WRITE;
/*!40000 ALTER TABLE `comment_comment` DISABLE KEYS */;
INSERT INTO `comment_comment` VALUES (107,'<p>写的不错<img alt=\"smiley\" src=\"http://localhost:8000/static/ckeditor/ckeditor/plugins/smiley/images/regular_smile.png\" style=\"height:23px; width:23px\" title=\"smiley\" /></p>','2020-06-09 05:37:11.267000',1,7,1,NULL,NULL,NULL),(108,'<p>评论的不错。<img alt=\"angel\" src=\"http://localhost:8000/static/ckeditor/ckeditor/plugins/smiley/images/angel_smile.png\" style=\"height:23px; width:23px\" title=\"angel\" /></p>','2020-06-09 05:38:42.290000',1,7,3,107,1,107),(109,'<p>123</p>','2020-06-12 02:21:13.772000',1,7,1,NULL,NULL,NULL),(110,'<p>OJBK.</p>','2020-06-16 05:38:21.645000',1,7,5,108,3,107),(111,'<p>还可以</p>','2020-06-16 05:39:49.598000',1,7,5,108,3,107),(112,'<p>还可以。</p>','2020-06-16 05:41:52.064000',1,7,5,108,3,107),(113,'<p>test评论</p>','2020-06-24 05:44:35.116000',1,7,6,NULL,NULL,NULL),(114,'<p>写得好</p>','2020-06-24 05:49:01.220000',36,7,1,NULL,NULL,NULL),(115,'<p>评论得不错</p>','2020-06-24 05:50:29.395000',1,7,1,113,6,113);
/*!40000 ALTER TABLE `comment_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8mb4_unicode_ci,
  `object_repr` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=181 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2020-05-29 03:04:50.194000','1','Blog object (1)',1,'[{\"added\": {}}]',7,1),(2,'2020-05-29 03:06:01.750000','1','BlogType object (1)',1,'[{\"added\": {}}]',8,1),(3,'2020-05-29 03:06:16.765000','2','BlogType object (2)',1,'[{\"added\": {}}]',8,1),(4,'2020-05-29 03:06:26.162000','3','BlogType object (3)',1,'[{\"added\": {}}]',8,1),(5,'2020-05-29 03:51:05.733000','2','测试1',1,'[{\"added\": {}}]',7,1),(6,'2020-05-29 03:51:25.690000','3','测试2',1,'[{\"added\": {}}]',7,1),(7,'2020-05-29 03:52:00.144000','4','测试3',1,'[{\"added\": {}}]',7,1),(8,'2020-06-01 05:15:05.748000','1','新的开始',2,'[{\"changed\": {\"fields\": [\"\\u6b63\\u6587\"]}}]',7,1),(9,'2020-06-01 05:16:39.502000','2','晴天',2,'[{\"changed\": {\"fields\": [\"\\u6807\\u9898\", \"\\u6b63\\u6587\"]}}]',7,1),(10,'2020-06-01 05:16:59.294000','4','歌词',1,'[{\"added\": {}}]',8,1),(11,'2020-06-01 05:17:12.250000','2','晴天',2,'[{\"changed\": {\"fields\": [\"\\u5206\\u7c7b\"]}}]',7,1),(12,'2020-06-01 05:17:35.366000','3','夜曲',2,'[{\"changed\": {\"fields\": [\"\\u6807\\u9898\", \"\\u5206\\u7c7b\", \"\\u6b63\\u6587\"]}}]',7,1),(13,'2020-06-01 05:17:55.451000','4','一路向北',2,'[{\"changed\": {\"fields\": [\"\\u6807\\u9898\", \"\\u5206\\u7c7b\", \"\\u6b63\\u6587\"]}}]',7,1),(14,'2020-06-01 05:18:40.121000','5','七里香',2,'[{\"changed\": {\"fields\": [\"\\u6807\\u9898\", \"\\u5206\\u7c7b\", \"\\u6b63\\u6587\"]}}]',7,1),(15,'2020-06-01 05:23:03.219000','5','七里香',2,'[]',7,1),(16,'2020-06-01 07:56:32.424000','35','shell下循环创建第30篇文章',2,'[{\"changed\": {\"fields\": [\"Is delete\"]}}]',7,1),(17,'2020-06-01 08:46:56.076000','1','新的开始',2,'[{\"changed\": {\"fields\": [\"\\u6b63\\u6587\"]}}]',7,1),(18,'2020-06-01 08:53:54.528000','1','新的开始',2,'[{\"changed\": {\"fields\": [\"\\u6b63\\u6587\"]}}]',7,1),(19,'2020-06-01 09:07:26.269000','1','新的开始',2,'[{\"changed\": {\"fields\": [\"\\u6b63\\u6587\"]}}]',7,1),(20,'2020-06-01 09:15:08.889000','1','新的开始',2,'[{\"changed\": {\"fields\": [\"\\u6b63\\u6587\"]}}]',7,1),(21,'2020-06-01 09:16:29.702000','1','新的开始',2,'[{\"changed\": {\"fields\": [\"\\u6b63\\u6587\"]}}]',7,1),(22,'2020-06-01 09:17:43.997000','1','新的开始',2,'[{\"changed\": {\"fields\": [\"\\u6b63\\u6587\"]}}]',7,1),(23,'2020-06-01 09:23:38.198000','1','新的开始',2,'[{\"changed\": {\"fields\": [\"\\u6b63\\u6587\"]}}]',7,1),(24,'2020-06-01 09:23:57.370000','1','新的开始',2,'[{\"changed\": {\"fields\": [\"\\u6b63\\u6587\"]}}]',7,1),(25,'2020-06-03 01:15:24.307000','1','ReadStatistics object (1)',3,'',9,1),(26,'2020-06-03 01:26:27.445000','1','ReadStatisticsDetail object (1)',2,'[{\"changed\": {\"fields\": [\"Read num\"]}}]',10,1),(27,'2020-06-03 01:26:59.356000','2','ReadStatisticsDetail object (2)',1,'[{\"added\": {}}]',10,1),(28,'2020-06-03 01:27:12.515000','2','ReadStatistics object (2)',2,'[{\"changed\": {\"fields\": [\"Read num\"]}}]',9,1),(29,'2020-06-03 04:17:13.554000','6','ReadStatisticsDetail object (6)',1,'[{\"added\": {}}]',10,1),(30,'2020-06-03 04:17:35.340000','2','ReadStatistics object (2)',2,'[{\"changed\": {\"fields\": [\"Read num\"]}}]',9,1),(31,'2020-06-03 06:47:05.026000','4','ReadStatistics object (4)',2,'[{\"changed\": {\"fields\": [\"Read num\"]}}]',9,1),(32,'2020-06-03 06:47:18.206000','4','ReadStatisticsDetail object (4)',2,'[{\"changed\": {\"fields\": [\"Read num\"]}}]',10,1),(33,'2020-06-03 08:47:30.650000','1','Comment object (1)',1,'[{\"added\": {}}]',11,1),(34,'2020-06-07 15:33:49.416000','29','Comment object (29)',3,'',11,1),(35,'2020-06-07 15:33:49.420000','28','Comment object (28)',3,'',11,1),(36,'2020-06-07 15:33:49.424000','27','Comment object (27)',3,'',11,1),(37,'2020-06-07 15:33:49.429000','26','Comment object (26)',3,'',11,1),(38,'2020-06-07 15:33:49.432000','25','Comment object (25)',3,'',11,1),(39,'2020-06-07 15:33:49.436000','24','Comment object (24)',3,'',11,1),(40,'2020-06-07 15:33:49.441000','23','Comment object (23)',3,'',11,1),(41,'2020-06-07 15:33:49.446000','22','Comment object (22)',3,'',11,1),(42,'2020-06-07 15:33:49.450000','21','Comment object (21)',3,'',11,1),(43,'2020-06-07 15:33:49.455000','20','Comment object (20)',3,'',11,1),(44,'2020-06-07 15:33:49.460000','19','Comment object (19)',3,'',11,1),(45,'2020-06-07 15:33:49.464000','18','Comment object (18)',3,'',11,1),(46,'2020-06-07 15:33:49.469000','17','Comment object (17)',3,'',11,1),(47,'2020-06-07 15:33:49.474000','16','Comment object (16)',3,'',11,1),(48,'2020-06-07 15:33:49.478000','15','Comment object (15)',3,'',11,1),(49,'2020-06-07 15:33:49.483000','14','Comment object (14)',3,'',11,1),(50,'2020-06-07 15:33:49.488000','13','Comment object (13)',3,'',11,1),(51,'2020-06-07 15:33:49.492000','12','Comment object (12)',3,'',11,1),(52,'2020-06-07 15:33:49.509000','11','Comment object (11)',3,'',11,1),(53,'2020-06-07 15:33:49.514000','10','Comment object (10)',3,'',11,1),(54,'2020-06-07 15:33:49.518000','9','Comment object (9)',3,'',11,1),(55,'2020-06-07 15:33:49.524000','8','Comment object (8)',3,'',11,1),(56,'2020-06-07 15:33:49.528000','7','Comment object (7)',3,'',11,1),(57,'2020-06-07 15:33:49.532000','6','Comment object (6)',3,'',11,1),(58,'2020-06-07 15:33:49.536000','5','Comment object (5)',3,'',11,1),(59,'2020-06-07 15:33:49.541000','4','Comment object (4)',3,'',11,1),(60,'2020-06-07 15:33:49.545000','3','Comment object (3)',3,'',11,1),(61,'2020-06-07 15:33:49.550000','2','Comment object (2)',3,'',11,1),(62,'2020-06-07 15:33:49.554000','1','Comment object (1)',3,'',11,1),(63,'2020-06-07 16:07:56.643000','66','Comment object (66)',3,'',11,1),(64,'2020-06-07 16:07:56.649000','65','Comment object (65)',3,'',11,1),(65,'2020-06-07 16:07:56.654000','64','Comment object (64)',3,'',11,1),(66,'2020-06-07 16:07:56.658000','63','Comment object (63)',3,'',11,1),(67,'2020-06-07 16:07:56.663000','62','Comment object (62)',3,'',11,1),(68,'2020-06-07 16:07:56.668000','61','Comment object (61)',3,'',11,1),(69,'2020-06-07 16:07:56.673000','60','Comment object (60)',3,'',11,1),(70,'2020-06-07 16:07:56.678000','59','Comment object (59)',3,'',11,1),(71,'2020-06-07 16:07:56.683000','58','Comment object (58)',3,'',11,1),(72,'2020-06-07 16:07:56.688000','57','Comment object (57)',3,'',11,1),(73,'2020-06-07 16:07:56.693000','56','Comment object (56)',3,'',11,1),(74,'2020-06-07 16:07:56.698000','55','Comment object (55)',3,'',11,1),(75,'2020-06-07 16:07:56.703000','54','Comment object (54)',3,'',11,1),(76,'2020-06-07 16:07:56.708000','53','Comment object (53)',3,'',11,1),(77,'2020-06-07 16:07:56.712000','52','Comment object (52)',3,'',11,1),(78,'2020-06-07 16:07:56.716000','51','Comment object (51)',3,'',11,1),(79,'2020-06-07 16:07:56.721000','50','Comment object (50)',3,'',11,1),(80,'2020-06-07 16:07:56.726000','49','Comment object (49)',3,'',11,1),(81,'2020-06-07 16:07:56.730000','48','Comment object (48)',3,'',11,1),(82,'2020-06-07 16:07:56.736000','47','Comment object (47)',3,'',11,1),(83,'2020-06-07 16:07:56.740000','46','Comment object (46)',3,'',11,1),(84,'2020-06-07 16:07:56.744000','45','Comment object (45)',3,'',11,1),(85,'2020-06-07 16:07:56.749000','44','Comment object (44)',3,'',11,1),(86,'2020-06-07 16:07:56.754000','43','Comment object (43)',3,'',11,1),(87,'2020-06-07 16:07:56.759000','42','Comment object (42)',3,'',11,1),(88,'2020-06-07 16:07:56.764000','41','Comment object (41)',3,'',11,1),(89,'2020-06-07 16:07:56.768000','40','Comment object (40)',3,'',11,1),(90,'2020-06-07 16:07:56.774000','39','Comment object (39)',3,'',11,1),(91,'2020-06-07 16:07:56.777000','38','Comment object (38)',3,'',11,1),(92,'2020-06-07 16:07:56.783000','37','Comment object (37)',3,'',11,1),(93,'2020-06-07 16:07:56.787000','36','Comment object (36)',3,'',11,1),(94,'2020-06-07 16:07:56.793000','35','Comment object (35)',3,'',11,1),(95,'2020-06-07 16:07:56.797000','34','Comment object (34)',3,'',11,1),(96,'2020-06-07 16:07:56.802000','33','Comment object (33)',3,'',11,1),(97,'2020-06-07 16:07:56.807000','32','Comment object (32)',3,'',11,1),(98,'2020-06-07 16:07:56.811000','31','Comment object (31)',3,'',11,1),(99,'2020-06-07 16:07:56.815000','30','Comment object (30)',3,'',11,1),(100,'2020-06-08 01:15:41.092000','1','新的开始',2,'[{\"changed\": {\"fields\": [\"\\u6b63\\u6587\"]}}]',7,1),(101,'2020-06-08 09:18:34.531000','82','Comment object (82)',2,'[{\"changed\": {\"fields\": [\"Root\", \"Parent\", \"Reply to\"]}}]',11,1),(102,'2020-06-09 01:05:04.576000','82','<p>123</p>',2,'[]',11,1),(103,'2020-06-09 01:20:29.213000','82','<p>123</p>',3,'',11,1),(104,'2020-06-09 01:20:29.322000','81','<p>123</p>',3,'',11,1),(105,'2020-06-09 01:20:29.429000','80','<p>5</p>',3,'',11,1),(106,'2020-06-09 01:20:29.556000','79','<p>5</p>',3,'',11,1),(107,'2020-06-09 01:20:29.638000','78','<p>4</p>',3,'',11,1),(108,'2020-06-09 01:20:29.727000','77','<p>3</p>',3,'',11,1),(109,'2020-06-09 01:20:29.852000','76','<p>2</p>',3,'',11,1),(110,'2020-06-09 01:20:29.932000','75','<p>1</p>',3,'',11,1),(111,'2020-06-09 01:20:30.014000','74','<p>1</p>',3,'',11,1),(112,'2020-06-09 01:20:30.093000','73','<p>1235324</p>',3,'',11,1),(113,'2020-06-09 01:20:30.182000','72','<p>123</p>',3,'',11,1),(114,'2020-06-09 01:20:30.266000','71','<p>123</p>',3,'',11,1),(115,'2020-06-09 01:20:30.348000','70','<p>123</p>',3,'',11,1),(116,'2020-06-09 01:20:30.433000','69','<p>123</p>',3,'',11,1),(117,'2020-06-09 01:20:30.514000','68','<p>32qr</p>',3,'',11,1),(118,'2020-06-09 01:20:30.599000','67','<p>干得不错<img alt=\"smiley\" src=\"http://localhost:8000/static/ckeditor/ckeditor/plugins/smiley/images/regular_smile.png\" style=\"height:23px; width:23px\" title=\"smiley\" /></p>',3,'',11,1),(119,'2020-06-09 02:21:06.455000','85','回复内容',1,'[{\"added\": {}}]',11,1),(120,'2020-06-09 05:36:38.331000','106','<p>渤海股份都会反感</p>',3,'',11,1),(121,'2020-06-09 05:36:38.455000','105','<p>告诉对方公司的</p>',3,'',11,1),(122,'2020-06-09 05:36:38.564000','104','<p>】评论</p>',3,'',11,1),(123,'2020-06-09 05:36:38.671000','103','<p>】评论</p>',3,'',11,1),(124,'2020-06-09 05:36:38.768000','102','<p>312312</p>',3,'',11,1),(125,'2020-06-09 05:36:38.880000','101','<p>32213</p>',3,'',11,1),(126,'2020-06-09 05:36:38.974000','100','<p>32213</p>',3,'',11,1),(127,'2020-06-09 05:36:39.080000','99','<p>123213123</p>',3,'',11,1),(128,'2020-06-09 05:36:39.180000','98','<p>123</p>',3,'',11,1),(129,'2020-06-09 05:36:39.287000','97','<p>评论给</p>',3,'',11,1),(130,'2020-06-09 05:36:39.409000','96','<p>评论给</p>',3,'',11,1),(131,'2020-06-09 05:36:39.521000','95','<p>123</p>',3,'',11,1),(132,'2020-06-09 05:36:39.623000','94','<p>123</p>',3,'',11,1),(133,'2020-06-09 05:36:39.722000','93','<p>个梵蒂冈</p>',3,'',11,1),(134,'2020-06-09 05:36:39.913000','92','<p>231213</p>',3,'',11,1),(135,'2020-06-09 05:36:40.006000','91','<p>3234</p>',3,'',11,1),(136,'2020-06-09 05:36:40.115000','90','<p>1232</p>',3,'',11,1),(137,'2020-06-09 05:36:40.214000','89','<p>123</p>',3,'',11,1),(138,'2020-06-09 05:36:40.317000','88','<p>123</p>',3,'',11,1),(139,'2020-06-09 05:36:40.415000','87','<p>111</p>',3,'',11,1),(140,'2020-06-09 05:36:40.565000','86','<p>12333</p>',3,'',11,1),(141,'2020-06-09 05:36:40.654000','85','回复内容',3,'',11,1),(142,'2020-06-09 05:36:40.747000','84','<p>234</p>',3,'',11,1),(143,'2020-06-09 05:36:40.838000','83','<p>123</p>',3,'',11,1),(144,'2020-06-09 07:18:53.674000','117','<p>123</p>',3,'',11,1),(145,'2020-06-09 07:18:53.922000','116','<p>12345y</p>',3,'',11,1),(146,'2020-06-09 07:18:54.057000','115','<p>12345y</p>',3,'',11,1),(147,'2020-06-09 07:18:54.165000','114','<p>12345y</p>',3,'',11,1),(148,'2020-06-09 07:18:54.258000','113','<p>12345y</p>',3,'',11,1),(149,'2020-06-09 07:18:54.356000','112','<p>12345y</p>',3,'',11,1),(150,'2020-06-09 07:18:54.461000','111','<p>123</p>',3,'',11,1),(151,'2020-06-09 07:18:54.566000','110','<p>123</p>',3,'',11,1),(152,'2020-06-09 07:18:54.691000','109','<p>123</p>',3,'',11,1),(153,'2020-06-09 08:24:48.617000','1','LikesCount object (1)',1,'[{\"added\": {}}]',12,1),(154,'2020-06-11 03:12:26.980000','6','LikesCount object (6)',2,'[{\"changed\": {\"fields\": [\"\\u70b9\\u8d5e\\u6570\"]}}]',12,1),(155,'2020-06-11 03:42:05.964000','13','LikesRecord object (13)',3,'',13,1),(156,'2020-06-11 03:42:06.059000','12','LikesRecord object (12)',3,'',13,1),(157,'2020-06-11 03:42:06.148000','11','LikesRecord object (11)',3,'',13,1),(158,'2020-06-11 03:42:06.243000','10','LikesRecord object (10)',3,'',13,1),(159,'2020-06-11 03:42:06.433000','9','LikesRecord object (9)',3,'',13,1),(160,'2020-06-11 03:42:06.519000','8','LikesRecord object (8)',3,'',13,1),(161,'2020-06-11 03:42:06.610000','7','LikesRecord object (7)',3,'',13,1),(162,'2020-06-11 03:42:06.702000','6','LikesRecord object (6)',3,'',13,1),(163,'2020-06-11 03:42:06.784000','5','LikesRecord object (5)',3,'',13,1),(164,'2020-06-11 03:42:06.882000','4','LikesRecord object (4)',3,'',13,1),(165,'2020-06-11 03:42:06.967000','3','LikesRecord object (3)',3,'',13,1),(166,'2020-06-11 03:42:07.061000','2','LikesRecord object (2)',3,'',13,1),(167,'2020-06-11 03:42:07.154000','1','LikesRecord object (1)',3,'',13,1),(168,'2020-06-11 03:42:15.583000','8','LikesCount object (8)',3,'',12,1),(169,'2020-06-11 03:42:15.700000','7','LikesCount object (7)',3,'',12,1),(170,'2020-06-11 03:42:15.845000','6','LikesCount object (6)',3,'',12,1),(171,'2020-06-11 03:42:15.950000','5','LikesCount object (5)',3,'',12,1),(172,'2020-06-11 03:42:16.066000','4','LikesCount object (4)',3,'',12,1),(173,'2020-06-11 03:42:16.167000','3','LikesCount object (3)',3,'',12,1),(174,'2020-06-11 03:42:16.261000','2','LikesCount object (2)',3,'',12,1),(175,'2020-06-11 03:42:16.350000','1','LikesCount object (1)',3,'',12,1),(176,'2020-06-11 03:46:35.402000','9','LikesCount object (9)',3,'',12,1),(177,'2020-06-11 03:46:56.919000','15','LikesRecord object (15)',3,'',13,1),(178,'2020-06-11 03:46:57.035000','14','LikesRecord object (14)',3,'',13,1),(179,'2020-06-12 01:50:13.498000','1','caoxun',2,'[{\"changed\": {\"fields\": [\"Last login\"]}}, {\"added\": {\"name\": \"profile\", \"object\": \"\\u66f9\\u8fc5\"}}]',4,1),(180,'2020-06-24 05:48:34.117000','36','test 发邮件',1,'[{\"added\": {}}]',7,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(7,'blog','blog'),(8,'blog','blogtype'),(11,'comment','comment'),(5,'contenttypes','contenttype'),(14,'likes','dislikescount'),(12,'likes','likescount'),(13,'likes','likesrecord'),(9,'read_statistics','readstatistics'),(10,'read_statistics','readstatisticsdetail'),(6,'sessions','session'),(15,'user','profile');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2020-06-29 03:51:30.439400'),(2,'auth','0001_initial','2020-06-29 03:51:33.841400'),(3,'admin','0001_initial','2020-06-29 03:51:43.266400'),(4,'admin','0002_logentry_remove_auto_add','2020-06-29 03:51:45.756400'),(5,'admin','0003_logentry_add_action_flag_choices','2020-06-29 03:51:45.812400'),(6,'contenttypes','0002_remove_content_type_name','2020-06-29 03:51:47.683400'),(7,'auth','0002_alter_permission_name_max_length','2020-06-29 03:51:48.701400'),(8,'auth','0003_alter_user_email_max_length','2020-06-29 03:51:49.081400'),(9,'auth','0004_alter_user_username_opts','2020-06-29 03:51:49.179400'),(10,'auth','0005_alter_user_last_login_null','2020-06-29 03:51:50.058400'),(11,'auth','0006_require_contenttypes_0002','2020-06-29 03:51:50.141400'),(12,'auth','0007_alter_validators_add_error_messages','2020-06-29 03:51:50.210400'),(13,'auth','0008_alter_user_username_max_length','2020-06-29 03:51:51.248400'),(14,'auth','0009_alter_user_last_name_max_length','2020-06-29 03:51:52.107400'),(15,'auth','0010_alter_group_name_max_length','2020-06-29 03:51:52.272400'),(16,'auth','0011_update_proxy_permissions','2020-06-29 03:51:52.353400'),(17,'blog','0001_initial','2020-06-29 03:51:52.929400'),(18,'blog','0002_blogtype','2020-06-29 03:51:54.281400'),(19,'blog','0003_blog_blog_type','2020-06-29 03:51:55.598400'),(20,'blog','0004_auto_20200529_1116','2020-06-29 03:51:55.674400'),(21,'blog','0005_auto_20200601_1646','2020-06-29 03:51:55.761400'),(22,'blog','0006_auto_20200601_1659','2020-06-29 03:51:55.851400'),(23,'blog','0007_auto_20200603_2045','2020-06-29 03:51:55.918400'),(24,'blog','0007_auto_20200603_1645','2020-06-29 03:51:55.994400'),(25,'blog','0008_merge_20200608_1040','2020-06-29 03:51:56.056400'),(26,'comment','0001_initial','2020-06-29 03:51:56.393400'),(27,'comment','0002_auto_20200603_1733','2020-06-29 03:52:01.097400'),(28,'comment','0003_auto_20200608_1042','2020-06-29 03:52:01.421400'),(29,'comment','0004_auto_20200608_1355','2020-06-29 03:52:07.349400'),(30,'comment','0005_auto_20200608_1703','2020-06-29 03:52:15.201400'),(31,'comment','0006_auto_20200608_1723','2020-06-29 03:52:15.253400'),(32,'comment','0007_auto_20200609_1622','2020-06-29 03:52:22.373400'),(33,'likes','0001_initial','2020-06-29 03:52:23.800400'),(34,'likes','0002_auto_20200611_0956','2020-06-29 03:52:29.226400'),(35,'likes','0003_auto_20200611_1021','2020-06-29 03:52:31.211400'),(36,'likes','0004_auto_20200611_1155','2020-06-29 03:52:31.262400'),(37,'read_statistics','0001_initial','2020-06-29 03:52:32.069400'),(38,'read_statistics','0002_readstatisticsdetail','2020-06-29 03:52:33.749400'),(39,'sessions','0001_initial','2020-06-29 03:52:35.352400'),(40,'user','0001_initial','2020-06-29 03:52:36.469400');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('4pp5rrk0qot2voa6u1tjwvifmvl5kk0e','ODdmMWU2ZDgyNGVhMjUyNWEzYzM4YTY4Y2QyNTRhMzkxNzEzZDA0ZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1M2VmZTM4MjA3MzFkMTRhN2JmYzcxZGRmMzI2ZGZkNDQwNDczNGVmIn0=','2020-06-17 01:24:39.237000'),('7awiquluyccitj8rjlpfvjzmmjkehbhs','OGQ0ZWQ2NWM2OTE3OTY5MjI0NmIwNjg0MWFiMDc3MWFjMGY5MGRiNDp7fQ==','2020-06-18 02:05:05.689000'),('cgumev8zzz6m0qhkgq53jbhri3mzfeqx','ODdmMWU2ZDgyNGVhMjUyNWEzYzM4YTY4Y2QyNTRhMzkxNzEzZDA0ZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1M2VmZTM4MjA3MzFkMTRhN2JmYzcxZGRmMzI2ZGZkNDQwNDczNGVmIn0=','2020-06-17 13:36:43.541000'),('eisogp9ya9souo8ubbzi0fmdz19xqnu8','ODdmMWU2ZDgyNGVhMjUyNWEzYzM4YTY4Y2QyNTRhMzkxNzEzZDA0ZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1M2VmZTM4MjA3MzFkMTRhN2JmYzcxZGRmMzI2ZGZkNDQwNDczNGVmIn0=','2020-06-20 16:40:29.238000'),('f4bl5bwu8p75ob72z3eo4yl47imufh7s','OGQ0ZWQ2NWM2OTE3OTY5MjI0NmIwNjg0MWFiMDc3MWFjMGY5MGRiNDp7fQ==','2020-06-18 02:05:22.519000'),('fk9spcmjg2lcmhpf6v7oj36km62ivue8','ODdmMWU2ZDgyNGVhMjUyNWEzYzM4YTY4Y2QyNTRhMzkxNzEzZDA0ZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1M2VmZTM4MjA3MzFkMTRhN2JmYzcxZGRmMzI2ZGZkNDQwNDczNGVmIn0=','2020-06-30 06:31:00.341000'),('iaqq4vqd5iucj6j3hgh5zsze9rc9ako2','ODdmMWU2ZDgyNGVhMjUyNWEzYzM4YTY4Y2QyNTRhMzkxNzEzZDA0ZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1M2VmZTM4MjA3MzFkMTRhN2JmYzcxZGRmMzI2ZGZkNDQwNDczNGVmIn0=','2020-06-21 16:09:26.438000'),('il6ia3n6330j1thqk2lhxrzhuef4f2x6','OGQ0ZWQ2NWM2OTE3OTY5MjI0NmIwNjg0MWFiMDc3MWFjMGY5MGRiNDp7fQ==','2020-06-19 01:32:13.823000'),('jolljc8iww782uqqq58v7t7sm6ce63h1','ODdmMWU2ZDgyNGVhMjUyNWEzYzM4YTY4Y2QyNTRhMzkxNzEzZDA0ZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1M2VmZTM4MjA3MzFkMTRhN2JmYzcxZGRmMzI2ZGZkNDQwNDczNGVmIn0=','2020-06-21 12:39:09.955000'),('ku2hmb21rpwka9cr3cl55kshf16u290w','ODdmMWU2ZDgyNGVhMjUyNWEzYzM4YTY4Y2QyNTRhMzkxNzEzZDA0ZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1M2VmZTM4MjA3MzFkMTRhN2JmYzcxZGRmMzI2ZGZkNDQwNDczNGVmIn0=','2020-07-08 05:45:27.441000'),('qm7jqk8ksusmeh6hkcqnhih28nzqo1tq','ODdmMWU2ZDgyNGVhMjUyNWEzYzM4YTY4Y2QyNTRhMzkxNzEzZDA0ZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1M2VmZTM4MjA3MzFkMTRhN2JmYzcxZGRmMzI2ZGZkNDQwNDczNGVmIn0=','2020-06-17 01:18:39.377000'),('ts6udlivhvwqulbt1e1xt16ngdyy7iyi','ZGYwMzlhYTlhZWI4Yzk2Y2M2Y2NjODE5OTAxYjRkZGM4NGM3Y2I0NDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1M2VmZTM4MjA3MzFkMTRhN2JmYzcxZGRmMzI2ZGZkNDQwNDczNGVmIiwiYmluZF9lbWFpbF9jb2RlIjoiZmJXUiIsInNlbmRfY29kZV90aW1lIjoxNTkyMzE3MzU0fQ==','2020-06-30 14:22:35.407000'),('tvlhk2qv6x7iehb5kz74am6uvdlul7e0','ODdmMWU2ZDgyNGVhMjUyNWEzYzM4YTY4Y2QyNTRhMzkxNzEzZDA0ZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1M2VmZTM4MjA3MzFkMTRhN2JmYzcxZGRmMzI2ZGZkNDQwNDczNGVmIn0=','2020-07-13 05:37:11.123400'),('uw7sbqqxim4jyr9mkrhvt3mj7ejz5tx6','OGQ0ZWQ2NWM2OTE3OTY5MjI0NmIwNjg0MWFiMDc3MWFjMGY5MGRiNDp7fQ==','2020-06-18 09:06:42.417000');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes_likescount`
--

DROP TABLE IF EXISTS `likes_likescount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likes_likescount` (
  `id` int NOT NULL AUTO_INCREMENT,
  `object_id` int unsigned NOT NULL,
  `likes_number` int NOT NULL,
  `content_type_id` int NOT NULL,
  `dislikes_number` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `likes_likescount_content_type_id_63daaf6d_fk_django_co` (`content_type_id`),
  CONSTRAINT `likes_likescount_content_type_id_63daaf6d_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `likes_likescount_chk_1` CHECK ((`object_id` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes_likescount`
--

LOCK TABLES `likes_likescount` WRITE;
/*!40000 ALTER TABLE `likes_likescount` DISABLE KEYS */;
INSERT INTO `likes_likescount` VALUES (10,6,1,7,1),(11,5,0,7,0),(12,4,0,7,0),(13,3,0,7,0),(14,2,0,7,0),(15,1,0,7,0),(16,33,0,7,0),(17,34,0,7,0),(18,36,0,7,0),(19,7,0,7,0),(20,8,0,7,0);
/*!40000 ALTER TABLE `likes_likescount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes_likesrecord`
--

DROP TABLE IF EXISTS `likes_likesrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likes_likesrecord` (
  `id` int NOT NULL AUTO_INCREMENT,
  `object_id` int unsigned NOT NULL,
  `likes_time` date NOT NULL,
  `content_type_id` int NOT NULL,
  `likes_user_id` int NOT NULL,
  `is_like` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `likes_likesrecord_content_type_id_673500f9_fk_django_co` (`content_type_id`),
  KEY `likes_likesrecord_likes_user_id_f8480fe6_fk_auth_user_id` (`likes_user_id`),
  CONSTRAINT `likes_likesrecord_content_type_id_673500f9_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `likes_likesrecord_likes_user_id_f8480fe6_fk_auth_user_id` FOREIGN KEY (`likes_user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `likes_likesrecord_chk_1` CHECK ((`object_id` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes_likesrecord`
--

LOCK TABLES `likes_likesrecord` WRITE;
/*!40000 ALTER TABLE `likes_likesrecord` DISABLE KEYS */;
INSERT INTO `likes_likesrecord` VALUES (16,6,'2020-06-11',7,1,1),(17,6,'2020-06-11',7,3,0);
/*!40000 ALTER TABLE `likes_likesrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `my_cache_table`
--

DROP TABLE IF EXISTS `my_cache_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `my_cache_table` (
  `cache_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires` datetime(6) NOT NULL,
  PRIMARY KEY (`cache_key`),
  KEY `my_cache_table_expires` (`expires`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `my_cache_table`
--

LOCK TABLES `my_cache_table` WRITE;
/*!40000 ALTER TABLE `my_cache_table` DISABLE KEYS */;
INSERT INTO `my_cache_table` VALUES (':1:last_week_hot_blogs','gASVEAsAAAAAAACMFmRqYW5nby5kYi5tb2RlbHMucXVlcnmUjAhRdWVyeVNldJSTlCmBlH2UKIwFbW9kZWyUjAtibG9nLm1vZGVsc5SMBEJsb2eUk5SMA19kYpROjAZfaGludHOUfZSMBXF1ZXJ5lIwaZGphbmdvLmRiLm1vZGVscy5zcWwucXVlcnmUjAVRdWVyeZSTlCmBlH2UKIwRX2NvbnN0cnVjdG9yX2FyZ3OUaAiFlH2UhpRoBWgIjA5hbGlhc19yZWZjb3VudJR9lCiMCWJsb2dfYmxvZ5RLA4wkcmVhZF9zdGF0aXN0aWNzX3JlYWRzdGF0aXN0aWNzZGV0YWlslEsCdYwJYWxpYXNfbWFwlH2UKGgYjCNkamFuZ28uZGIubW9kZWxzLnNxbC5kYXRhc3RydWN0dXJlc5SMCUJhc2VUYWJsZZSTlCmBlH2UKIwKdGFibGVfbmFtZZRoGIwLdGFibGVfYWxpYXOUaBh1YmgZaByMBEpvaW6Uk5QpgZR9lChoIWgZjAxwYXJlbnRfYWxpYXOUaBhoImgZjAlqb2luX3R5cGWUjApJTk5FUiBKT0lOlIwJam9pbl9jb2xzlIwCaWSUjAlvYmplY3RfaWSUhpSFlIwKam9pbl9maWVsZJSMImRqYW5nby5jb250cmliLmNvbnRlbnR0eXBlcy5maWVsZHOUjApHZW5lcmljUmVslJOUKYGUfZQojAVmaWVsZJSMF2RqYW5nby5kYi5tb2RlbHMuZmllbGRzlIwLX2xvYWRfZmllbGSUk5SMBGJsb2eUaAeMFHJlYWRfc3Rpc3RpY3NfZGV0YWlslIeUUpRoBYwWcmVhZF9zdGF0aXN0aWNzLm1vZGVsc5SMFFJlYWRTdGF0aXN0aWNzRGV0YWlslJOUjAxyZWxhdGVkX25hbWWUjAErlIwScmVsYXRlZF9xdWVyeV9uYW1llE6MEGxpbWl0X2Nob2ljZXNfdG+UfZSMC3BhcmVudF9saW5rlImMCW9uX2RlbGV0ZZSMGWRqYW5nby5kYi5tb2RlbHMuZGVsZXRpb26UjApET19OT1RISU5HlJOUjAtzeW1tZXRyaWNhbJSJjAhtdWx0aXBsZZSIjA1yZWxhdGVkX21vZGVslGgIdWKMCG51bGxhYmxllIiMEWZpbHRlcmVkX3JlbGF0aW9ulE51YnWMEGV4dGVybmFsX2FsaWFzZXOUfZSMCXRhYmxlX21hcJR9lChoGF2UaBhhaBldlGgZYXWMDGRlZmF1bHRfY29sc5SJjBBkZWZhdWx0X29yZGVyaW5nlIiMEXN0YW5kYXJkX29yZGVyaW5nlIiMDHVzZWRfYWxpYXNlc5SPlIwQZmlsdGVyX2lzX3N0aWNreZSJjAhzdWJxdWVyeZSJjAZzZWxlY3SUjBxkamFuZ28uZGIubW9kZWxzLmV4cHJlc3Npb25zlIwDQ29slJOUKYGUfZQoaBJoGGg4aDloB2grh5RSlIaUfZSGlIwMb3V0cHV0X2ZpZWxklGhjjAVhbGlhc5RoGIwGdGFyZ2V0lGhjjBJjb250YWluc19hZ2dyZWdhdGWUiYwIaWRlbnRpdHmUKGhfaGhoGIaUaGmMCWJsb2cuQmxvZ5RoK4aUhpRoZ06GlHSUdWJoXymBlH2UKGgSaBhoOGg5aAeMBXRpdGxllIeUUpSGlH2UhpRoZ2h2aGhoGGhpaHZoayhoX2hoaBiGlGhpjAlibG9nLkJsb2eUaHSGlIaUaGdOhpR0lHVihpSMBXdoZXJllIwaZGphbmdvLmRiLm1vZGVscy5zcWwud2hlcmWUjAlXaGVyZU5vZGWUk5QpgZR9lCiMCGNoaWxkcmVulF2UjBhkamFuZ28uZGIubW9kZWxzLmxvb2t1cHOUjAtHcmVhdGVyVGhhbpSTlCmBlH2UKIwDbGhzlGhfKYGUfZQoaBJoGWg4jA9yZWFkX3N0YXRpc3RpY3OUaD6MBGRhdGWUh5RSlIaUfZSGlGhnaJRoaGgZaGlolGhqiXVijANyaHOUjAhkYXRldGltZZSMBGRhdGWUk5RDBAfkBhaUhZRSlIwUYmlsYXRlcmFsX3RyYW5zZm9ybXOUXZRoaol1YmGMCWNvbm5lY3RvcpSMA0FORJSMB25lZ2F0ZWSUiWhqiXVijAt3aGVyZV9jbGFzc5RohIwIZ3JvdXBfYnmUaGBocoaUjAhvcmRlcl9ieZSMFC1yZWFkX3N0YXRpc3RpY3Nfc3VtlIWUjAhsb3dfbWFya5RLAIwJaGlnaF9tYXJrlEsDjAhkaXN0aW5jdJSJjA9kaXN0aW5jdF9maWVsZHOUKYwRc2VsZWN0X2Zvcl91cGRhdGWUiYwYc2VsZWN0X2Zvcl91cGRhdGVfbm93YWl0lImMHXNlbGVjdF9mb3JfdXBkYXRlX3NraXBfbG9ja2VklImMFHNlbGVjdF9mb3JfdXBkYXRlX29mlCmMDnNlbGVjdF9yZWxhdGVklImMCW1heF9kZXB0aJRLBYwNdmFsdWVzX3NlbGVjdJRoK2h0hpSMC2Fubm90YXRpb25zlH2UjBNyZWFkX3N0YXRpc3RpY3Nfc3VtlIwbZGphbmdvLmRiLm1vZGVscy5hZ2dyZWdhdGVzlIwDU3VtlJOUKYGUfZQoaBKMHnJlYWRfc3Rpc3RpY3NfZGV0YWlsX19yZWFkX251bZSFlH2UhpRorImMBmZpbHRlcpROjBJzb3VyY2VfZXhwcmVzc2lvbnOUXZRoXymBlH2UKGgSaBloOGiRaD6MCHJlYWRfbnVtlIeUUpSGlH2UhpRoZ2jJaGhoGWhpaMmMFV9vdXRwdXRfZmllbGRfb3Jfbm9uZZRoyWhqiXViYYwFZXh0cmGUfZSMCmlzX3N1bW1hcnmUiWhnaMloayhou4wLZXhwcmVzc2lvbnOUaL6FlIaUaKyJhpRowk6GlGjOKYaUdJR1YnOMFmFubm90YXRpb25fc2VsZWN0X21hc2uUj5QoaLiQjBhfYW5ub3RhdGlvbl9zZWxlY3RfY2FjaGWUfZRouGi8c4wKY29tYmluYXRvcpROjA5jb21iaW5hdG9yX2FsbJSJjBBjb21iaW5lZF9xdWVyaWVzlClozn2UjBFleHRyYV9zZWxlY3RfbWFza5SPlIwTX2V4dHJhX3NlbGVjdF9jYWNoZZROjAxleHRyYV90YWJsZXOUKYwOZXh0cmFfb3JkZXJfYnmUKYwQZGVmZXJyZWRfbG9hZGluZ5QokZSIhpSME19maWx0ZXJlZF9yZWxhdGlvbnOUfZSMDWV4cGxhaW5fcXVlcnmUiYwOZXhwbGFpbl9mb3JtYXSUTowPZXhwbGFpbl9vcHRpb25zlH2UjA1fbG9va3VwX2pvaW5zlF2UKGgYaBlljApiYXNlX3RhYmxllGgYdWKMDV9yZXN1bHRfY2FjaGWUXZQofZQoaCtLAWh0jAzmlrDnmoTlvIDlp4uUaLhLA3V9lChoK0skaHSMDnRlc3Qg5Y+R6YKu5Lu2lGi4SwJ1ZYwOX3N0aWNreV9maWx0ZXKUiYwKX2Zvcl93cml0ZZSJjBlfcHJlZmV0Y2hfcmVsYXRlZF9sb29rdXBzlCmMDl9wcmVmZXRjaF9kb25llImMFl9rbm93bl9yZWxhdGVkX29iamVjdHOUfZSMD19pdGVyYWJsZV9jbGFzc5RoAIwOVmFsdWVzSXRlcmFibGWUk5SMB19maWVsZHOUaCtodIaUjA9fZGphbmdvX3ZlcnNpb26UjAUzLjAuNpR1Yi4=','2020-06-29 05:52:38.000000');
/*!40000 ALTER TABLE `my_cache_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `read_statistics_readstatistics`
--

DROP TABLE IF EXISTS `read_statistics_readstatistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `read_statistics_readstatistics` (
  `id` int NOT NULL AUTO_INCREMENT,
  `read_num` int NOT NULL,
  `object_id` int unsigned NOT NULL,
  `content_type_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `read_statistics_read_content_type_id_bbacca0e_fk_django_co` (`content_type_id`),
  CONSTRAINT `read_statistics_read_content_type_id_bbacca0e_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `read_statistics_readstatistics_chk_1` CHECK ((`object_id` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `read_statistics_readstatistics`
--

LOCK TABLES `read_statistics_readstatistics` WRITE;
/*!40000 ALTER TABLE `read_statistics_readstatistics` DISABLE KEYS */;
INSERT INTO `read_statistics_readstatistics` VALUES (2,52,1,7),(3,9,2,7),(4,34,3,7),(5,3,4,7),(6,2,5,7),(7,1,6,7),(8,0,7,7),(9,0,8,7),(10,0,33,7),(11,0,34,7),(12,2,36,7);
/*!40000 ALTER TABLE `read_statistics_readstatistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `read_statistics_readstatisticsdetail`
--

DROP TABLE IF EXISTS `read_statistics_readstatisticsdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `read_statistics_readstatisticsdetail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `read_num` int NOT NULL,
  `date` date NOT NULL,
  `object_id` int unsigned NOT NULL,
  `content_type_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `read_statistics_read_content_type_id_8c419f9d_fk_django_co` (`content_type_id`),
  CONSTRAINT `read_statistics_read_content_type_id_8c419f9d_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `read_statistics_readstatisticsdetail_chk_1` CHECK ((`object_id` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `read_statistics_readstatisticsdetail`
--

LOCK TABLES `read_statistics_readstatisticsdetail` WRITE;
/*!40000 ALTER TABLE `read_statistics_readstatisticsdetail` DISABLE KEYS */;
INSERT INTO `read_statistics_readstatisticsdetail` VALUES (1,6,'2020-06-03',1,7),(2,5,'2020-06-01',1,7),(3,2,'2020-06-03',2,7),(4,31,'2020-06-03',3,7),(5,1,'2020-06-03',4,7),(6,13,'2020-06-02',1,7),(7,3,'2020-06-04',1,7),(8,3,'2020-06-05',1,7),(9,1,'2020-06-05',2,7),(10,1,'2020-06-06',1,7),(11,3,'2020-06-07',1,7),(12,3,'2020-06-08',2,7),(13,1,'2020-06-08',1,7),(14,1,'2020-06-08',3,7),(15,1,'2020-06-08',4,7),(16,1,'2020-06-08',5,7),(17,4,'2020-06-09',1,7),(18,1,'2020-06-09',2,7),(19,1,'2020-06-09',3,7),(20,1,'2020-06-10',1,7),(21,2,'2020-06-11',1,7),(22,1,'2020-06-11',2,7),(23,1,'2020-06-11',3,7),(24,1,'2020-06-11',4,7),(25,1,'2020-06-11',5,7),(26,1,'2020-06-11',6,7),(27,1,'2020-06-12',1,7),(28,1,'2020-06-16',1,7),(29,1,'2020-06-16',2,7),(30,1,'2020-06-22',1,7),(31,2,'2020-06-24',1,7),(32,2,'2020-06-24',36,7),(33,1,'2020-06-29',1,7);
/*!40000 ALTER TABLE `read_statistics_readstatisticsdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_profile`
--

DROP TABLE IF EXISTS `user_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_profile` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nickname` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `user_profile_user_id_8fdce8e2_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_profile`
--

LOCK TABLES `user_profile` WRITE;
/*!40000 ALTER TABLE `user_profile` DISABLE KEYS */;
INSERT INTO `user_profile` VALUES (1,'小小草',1),(2,'叶子',3),(3,'叶子',4);
/*!40000 ALTER TABLE `user_profile` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-29 15:33:20
