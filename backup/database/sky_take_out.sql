/*
SQLyog Ultimate v10.00 Beta1
MySQL - 5.7.33-log : Database - sky_take_out
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`sky_take_out` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `sky_take_out`;

/*Table structure for table `address_book` */

DROP TABLE IF EXISTS `address_book`;

CREATE TABLE `address_book` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `consignee` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '收货人',
  `sex` varchar(2) COLLATE utf8_bin DEFAULT NULL COMMENT '性别',
  `phone` varchar(11) COLLATE utf8_bin NOT NULL COMMENT '手机号',
  `province_code` varchar(12) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '省级区划编号',
  `province_name` varchar(32) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '省级名称',
  `city_code` varchar(12) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '市级区划编号',
  `city_name` varchar(32) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '市级名称',
  `district_code` varchar(12) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '区级区划编号',
  `district_name` varchar(32) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '区级名称',
  `detail` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '详细地址',
  `label` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '标签',
  `is_default` tinyint(1) NOT NULL DEFAULT '0' COMMENT '默认 0 否 1是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='地址簿';

/*Data for the table `address_book` */

insert  into `address_book`(`id`,`user_id`,`consignee`,`sex`,`phone`,`province_code`,`province_name`,`city_code`,`city_name`,`district_code`,`district_name`,`detail`,`label`,`is_default`) values (2,1,'EdwinK','0','19081407430','11','北京市','1101','市辖区','110102','西城区','什刹海街道','1',1),(3,1,'AnitaAdams','0','19735827140','15','内蒙古自治区','1501','呼和浩特市','150102','新城区','Scotburgh 49604 Mann Coves','1',0);

/*Table structure for table `category` */

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type` int(11) DEFAULT NULL COMMENT '类型   1 菜品分类 2 套餐分类',
  `name` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '分类名称',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '顺序',
  `status` int(11) DEFAULT NULL COMMENT '分类状态 0:禁用，1:启用',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_user` bigint(20) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_category_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='菜品及套餐分类';

/*Data for the table `category` */

insert  into `category`(`id`,`type`,`name`,`sort`,`status`,`create_time`,`update_time`,`create_user`,`update_user`) values (11,1,'酒水饮料',10,1,'2022-06-09 22:09:18','2022-06-09 22:09:18',1,1),(12,1,'传统主食',9,1,'2022-06-09 22:09:32','2022-06-09 22:18:53',1,1),(13,2,'人气套餐',12,1,'2022-06-09 22:11:38','2024-04-04 15:51:54',1,1),(15,2,'商务套餐',13,1,'2022-06-09 22:14:10','2022-06-10 11:04:48',1,1),(16,1,'蜀味烤鱼',4,1,'2022-06-09 22:15:37','2022-08-31 14:27:25',1,1),(17,1,'牛蛙',5,1,'2022-06-09 22:16:14','2024-04-04 15:52:09',1,1),(18,1,'特色蒸菜',6,1,'2022-06-09 22:17:42','2022-06-09 22:17:42',1,1),(19,1,'新鲜时蔬',7,1,'2022-06-09 22:18:12','2022-06-09 22:18:28',1,1),(20,1,'水煮鱼',8,1,'2022-06-09 22:22:29','2022-06-09 22:23:45',1,1),(21,1,'汤类',11,1,'2022-06-10 10:51:47','2022-06-10 10:51:47',1,1),(23,1,'九转大肠test',0,0,'2024-04-04 16:04:12','2024-04-04 16:16:05',1,1);

/*Table structure for table `dish` */

DROP TABLE IF EXISTS `dish`;

CREATE TABLE `dish` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '菜品名称',
  `category_id` bigint(20) NOT NULL COMMENT '菜品分类id',
  `price` decimal(10,2) DEFAULT NULL COMMENT '菜品价格',
  `image` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '图片',
  `description` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '描述信息',
  `status` int(11) DEFAULT '1' COMMENT '0 停售 1 起售',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_user` bigint(20) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_dish_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='菜品';

/*Data for the table `dish` */

insert  into `dish`(`id`,`name`,`category_id`,`price`,`image`,`description`,`status`,`create_time`,`update_time`,`create_user`,`update_user`) values (46,'王老吉',11,'6.00','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/745264b0-a48f-445f-822d-0a6959b23d7e.jpg','',1,'2022-06-09 22:40:47','2024-04-05 15:13:46',1,1),(47,'北冰洋',11,'4.00','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/ee0fb1ff-6339-44b5-b8aa-a4d3a30007b9.jpg','还是小时候的味道',1,'2022-06-10 09:18:49','2024-04-05 15:13:37',1,1),(48,'雪花啤酒',11,'4.00','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/526ff006-0657-46fc-bcfe-a7674ccaa2bf.jpg','',1,'2022-06-10 09:22:54','2024-04-05 15:13:27',1,1),(49,'米饭',12,'2.00','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/0602c61f-eefd-4727-95a6-77d74093a3ea.jpg','精选五常大米',1,'2022-06-10 09:30:17','2024-04-05 15:13:00',1,1),(50,'馒头',12,'1.00','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/9dac3963-866f-42b8-ae38-804d68ca9a8e.jpg','优质面粉',1,'2022-06-10 09:34:28','2024-04-05 15:12:52',1,1),(51,'老坛酸菜鱼',20,'56.00','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/c31c29bc-4a4d-44d4-af79-9e167976077e.jpg','原料：汤，草鱼，酸菜',1,'2022-06-10 09:40:51','2024-04-05 15:12:43',1,1),(52,'经典酸菜鮰鱼',20,'66.00','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/d4ae642e-baef-42b5-b707-135a8fb809d1.jpg','原料：酸菜，江团，鮰鱼',1,'2022-06-10 09:46:02','2024-04-05 15:12:30',1,1),(53,'蜀味水煮草鱼',20,'38.00','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/3bb87a7c-ffb4-4c81-b899-eaf146076130.jpg','原料：草鱼，汤',1,'2022-06-10 09:48:37','2024-04-05 15:12:22',1,1),(54,'清炒小油菜',19,'18.00','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/ffae499f-c388-4301-b387-0bf2f3befdfe.jpg','原料：小油菜',1,'2022-06-10 09:51:46','2024-04-05 15:12:13',1,1),(55,'蒜蓉娃娃菜',19,'18.00','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/acfea470-b620-4fac-8ec2-26c8bd24b47b.png','原料：蒜，娃娃菜',1,'2022-06-10 09:53:37','2024-04-05 15:11:56',1,1),(56,'清炒西兰花',19,'18.00','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/f3844d24-654c-4c36-a7c0-b60ec09024a6.jpg','原料：西兰花',1,'2022-06-10 09:55:44','2024-04-05 15:11:31',1,1),(57,'炝炒圆白菜',19,'18.00','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/1a473b27-efef-4028-bb24-0412cf0ce545.jpg','原料：圆白菜',1,'2022-06-10 09:58:35','2024-04-05 15:11:40',1,1),(58,'清蒸鲈鱼',18,'98.00','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/90694c2c-ce2f-4898-8520-1ee5a623fd21.jpg','原料：鲈鱼',1,'2022-06-10 10:12:28','2024-04-05 15:11:20',1,1),(59,'东坡肘子',18,'138.00','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/47a00f8a-38fd-448a-bfee-de4ffafaf11b.jpg','原料：猪肘棒',1,'2022-06-10 10:24:03','2024-04-05 15:11:10',1,1),(60,'梅菜扣肉',18,'58.00','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/a9d5a4a2-1643-4324-8bde-da80f3267d15.jpg','原料：猪肉，梅菜',1,'2022-06-10 10:26:03','2024-04-05 15:11:01',1,1),(61,'剁椒鱼头',18,'66.00','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/0363e453-4b4c-4cd8-95d3-51af51028fba.jpg','原料：鲢鱼，剁椒',1,'2022-06-10 10:28:54','2024-04-05 15:10:50',1,1),(62,'金汤酸菜牛蛙',17,'88.00','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/cf2f2a20-d30d-40e9-b7b2-20c2f7886227.jpg','原料：鲜活牛蛙，酸菜',1,'2022-06-10 10:33:05','2024-04-05 15:10:43',1,1),(63,'香锅牛蛙',17,'88.00','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/1e4565fd-99f6-4c88-98e2-dc5b300b89c2.jpg','配料：鲜活牛蛙，莲藕，青笋',1,'2022-06-10 10:35:40','2024-04-05 15:10:36',1,1),(64,'馋嘴牛蛙',17,'88.00','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/39aec755-803c-4ae2-93bb-c8eecb4cda03.jpg','配料：鲜活牛蛙，丝瓜，黄豆芽',1,'2022-06-10 10:37:52','2024-04-05 15:10:26',1,1),(65,'草鱼2斤',16,'68.00','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/07c1a9cb-8ce4-4abf-958d-eaeb570e1aab.jpg','原料：草鱼，黄豆芽，莲藕',1,'2022-06-10 10:41:08','2024-04-05 15:06:02',1,1),(66,'江团鱼2斤',16,'119.00','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/f8249c45-030e-4360-a710-645151a788ce.jpg','配料：江团鱼，黄豆芽，莲藕',1,'2022-06-10 10:42:42','2024-04-05 15:05:52',1,1),(67,'鮰鱼2斤',16,'72.00','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/7b596ab7-7140-4c34-8db4-47c55f0ac26c.jpg','原料：鮰鱼，黄豆芽，莲藕',1,'2022-06-10 10:43:56','2024-04-05 15:05:41',1,1),(68,'鸡蛋汤',21,'4.00','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/e384f10a-2886-419d-8ce2-02c4d66f0114.jpg','配料：鸡蛋，紫菜',1,'2022-06-10 10:54:25','2024-04-05 15:05:32',1,1),(69,'平菇豆腐汤',21,'6.00','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/a4535f03-c277-4f9e-8cf2-e565b2aeffbb.jpg','配料：豆腐，平菇',1,'2022-06-10 10:55:02','2024-04-06 12:51:55',1,1),(71,'九转大肠',11,'99.00','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/fccb976d-6513-4f46-a834-23d0074490c3.jpg','Atque quia sapiente deserunt impedit nobis. Quod officia eligendi nihil necessitatibus ea ut. Doloremque neque quaerat inventore reprehenderit velit. Rerum non voluptas sunt voluptatem cupiditate fugi',0,'2024-04-04 17:45:44','2024-04-06 20:34:45',1,1);

/*Table structure for table `dish_flavor` */

DROP TABLE IF EXISTS `dish_flavor`;

CREATE TABLE `dish_flavor` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dish_id` bigint(20) NOT NULL COMMENT '菜品',
  `name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '口味名称',
  `value` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '口味数据list',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='菜品口味关系表';

/*Data for the table `dish_flavor` */

insert  into `dish_flavor`(`id`,`dish_id`,`name`,`value`) values (40,10,'甜味','[\"无糖\",\"少糖\",\"半糖\",\"多糖\",\"全糖\"]'),(41,7,'忌口','[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]'),(42,7,'温度','[\"热饮\",\"常温\",\"去冰\",\"少冰\",\"多冰\"]'),(45,6,'忌口','[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]'),(46,6,'辣度','[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]'),(47,5,'辣度','[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]'),(48,5,'甜味','[\"无糖\",\"少糖\",\"半糖\",\"多糖\",\"全糖\"]'),(49,2,'甜味','[\"无糖\",\"少糖\",\"半糖\",\"多糖\",\"全糖\"]'),(50,4,'甜味','[\"无糖\",\"少糖\",\"半糖\",\"多糖\",\"全糖\"]'),(51,3,'甜味','[\"无糖\",\"少糖\",\"半糖\",\"多糖\",\"全糖\"]'),(52,3,'忌口','[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]'),(117,67,'辣度','[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]'),(118,66,'辣度','[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]'),(119,65,'辣度','[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]'),(120,60,'忌口','[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]'),(121,56,'忌口','[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]'),(122,57,'忌口','[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]'),(123,54,'忌口','[\"不要葱\",\"不要蒜\",\"不要香菜\"]'),(124,53,'忌口','[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]'),(125,53,'辣度','[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]'),(126,52,'忌口','[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]'),(127,52,'辣度','[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]'),(128,51,'忌口','[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]'),(129,51,'辣度','[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]'),(130,71,'甜味','[\"无糖\"]'),(131,71,'温度','[\"热饮\"]'),(132,71,'忌口','[\"不要葱\",\"不要香菜\",\"不要辣\"]');

/*Table structure for table `employee` */

DROP TABLE IF EXISTS `employee`;

CREATE TABLE `employee` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '姓名',
  `username` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '用户名',
  `password` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '密码',
  `phone` varchar(11) COLLATE utf8_bin NOT NULL COMMENT '手机号',
  `sex` varchar(2) COLLATE utf8_bin NOT NULL COMMENT '性别',
  `id_number` varchar(18) COLLATE utf8_bin NOT NULL COMMENT '身份证号',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '状态 0:禁用，1:启用',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_user` bigint(20) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='员工信息';

/*Data for the table `employee` */

insert  into `employee`(`id`,`name`,`username`,`password`,`phone`,`sex`,`id_number`,`status`,`create_time`,`update_time`,`create_user`,`update_user`) values (1,'管理员','admin','e10adc3949ba59abbe56e057f20f883e','13812312312','1','110101199001010047',1,'2022-02-15 15:51:20','2022-02-17 09:16:20',10,1),(2,'周杰伦','152628200807079893','e10adc3949ba59abbe56e057f20f883e','18209219869','1','152628200807079893',1,'2024-04-04 14:33:17','2024-04-04 15:26:18',10,1),(3,'彭于晏','533479199509103762','e10adc3949ba59abbe56e057f20f883e','13679732755','1','533479199509103762',1,'2024-04-04 14:34:54','2024-04-04 15:25:42',10,1),(6,'Jessie Brekke','573834200711118245','e10adc3949ba59abbe56e057f20f883e','18082060013','1','152628200807079893',1,'2024-04-04 14:54:38','2024-04-04 14:54:38',1,1);

/*Table structure for table `order_detail` */

DROP TABLE IF EXISTS `order_detail`;

CREATE TABLE `order_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '名字',
  `image` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '图片',
  `order_id` bigint(20) NOT NULL COMMENT '订单id',
  `dish_id` bigint(20) DEFAULT NULL COMMENT '菜品id',
  `setmeal_id` bigint(20) DEFAULT NULL COMMENT '套餐id',
  `dish_flavor` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '口味',
  `number` int(11) NOT NULL DEFAULT '1' COMMENT '数量',
  `amount` decimal(10,2) NOT NULL COMMENT '金额',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=144 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='订单明细表';

/*Data for the table `order_detail` */

insert  into `order_detail`(`id`,`name`,`image`,`order_id`,`dish_id`,`setmeal_id`,`dish_flavor`,`number`,`amount`) values (1,'鸡蛋汤','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/e384f10a-2886-419d-8ce2-02c4d66f0114.jpg',1,68,NULL,NULL,1,'4.00'),(2,'平菇豆腐汤','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/a4535f03-c277-4f9e-8cf2-e565b2aeffbb.jpg',1,69,NULL,NULL,1,'6.00'),(3,'端午节套餐','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/481f4ae4-1aae-4080-9a3a-c8456ba7bbec.jpeg',1,NULL,1,NULL,5,'5.50'),(4,'经典酸菜鮰鱼','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/d4ae642e-baef-42b5-b707-135a8fb809d1.jpg',1,52,NULL,'不要葱,不辣',5,'66.00'),(5,'九转大肠','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/fccb976d-6513-4f46-a834-23d0074490c3.jpg',2,71,NULL,'无糖,热饮,不要葱',1,'99.00'),(6,'北冰洋','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/ee0fb1ff-6339-44b5-b8aa-a4d3a30007b9.jpg',2,47,NULL,NULL,1,'4.00'),(7,'雪花啤酒','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/526ff006-0657-46fc-bcfe-a7674ccaa2bf.jpg',2,48,NULL,NULL,1,'4.00'),(8,'米饭','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/0602c61f-eefd-4727-95a6-77d74093a3ea.jpg',2,49,NULL,NULL,1,'2.00'),(9,'馒头','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/9dac3963-866f-42b8-ae38-804d68ca9a8e.jpg',2,50,NULL,NULL,1,'1.00'),(10,'馒头','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/9dac3963-866f-42b8-ae38-804d68ca9a8e.jpg',3,50,NULL,NULL,3,'1.00'),(11,'米饭','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/0602c61f-eefd-4727-95a6-77d74093a3ea.jpg',3,49,NULL,NULL,1,'2.00'),(12,'江团鱼2斤','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/f8249c45-030e-4360-a710-645151a788ce.jpg',3,66,NULL,'不辣',1,'119.00'),(13,'端午节套餐','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/481f4ae4-1aae-4080-9a3a-c8456ba7bbec.jpeg',4,NULL,1,NULL,1,'5.50'),(14,'北冰洋','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/ee0fb1ff-6339-44b5-b8aa-a4d3a30007b9.jpg',4,47,NULL,NULL,1,'4.00'),(15,'雪花啤酒','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/526ff006-0657-46fc-bcfe-a7674ccaa2bf.jpg',4,48,NULL,NULL,1,'4.00'),(16,'馒头','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/9dac3963-866f-42b8-ae38-804d68ca9a8e.jpg',4,50,NULL,NULL,1,'1.00'),(17,'米饭','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/0602c61f-eefd-4727-95a6-77d74093a3ea.jpg',4,49,NULL,NULL,1,'2.00'),(18,'江团鱼2斤','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/f8249c45-030e-4360-a710-645151a788ce.jpg',4,66,NULL,'不辣',1,'119.00'),(19,'端午节套餐','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/481f4ae4-1aae-4080-9a3a-c8456ba7bbec.jpeg',5,NULL,1,NULL,2,'5.50'),(20,'鸡蛋汤','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/e384f10a-2886-419d-8ce2-02c4d66f0114.jpg',5,68,NULL,NULL,3,'4.00'),(21,'平菇豆腐汤','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/a4535f03-c277-4f9e-8cf2-e565b2aeffbb.jpg',5,69,NULL,NULL,1,'6.00'),(22,'馒头','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/9dac3963-866f-42b8-ae38-804d68ca9a8e.jpg',5,50,NULL,NULL,3,'1.00'),(23,'米饭','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/0602c61f-eefd-4727-95a6-77d74093a3ea.jpg',5,49,NULL,NULL,3,'2.00'),(24,'经典酸菜鮰鱼','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/d4ae642e-baef-42b5-b707-135a8fb809d1.jpg',5,52,NULL,'不要葱,不辣',1,'66.00'),(25,'江团鱼2斤','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/f8249c45-030e-4360-a710-645151a788ce.jpg',5,66,NULL,'不辣',1,'119.00'),(26,'鸡蛋汤','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/e384f10a-2886-419d-8ce2-02c4d66f0114.jpg',6,68,NULL,NULL,4,'4.00'),(27,'平菇豆腐汤','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/a4535f03-c277-4f9e-8cf2-e565b2aeffbb.jpg',6,69,NULL,NULL,2,'6.00'),(28,'王老吉','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/745264b0-a48f-445f-822d-0a6959b23d7e.jpg',6,46,NULL,NULL,1,'6.00'),(29,'北冰洋','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/ee0fb1ff-6339-44b5-b8aa-a4d3a30007b9.jpg',6,47,NULL,NULL,4,'4.00'),(30,'雪花啤酒','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/526ff006-0657-46fc-bcfe-a7674ccaa2bf.jpg',6,48,NULL,NULL,2,'4.00'),(31,'米饭','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/0602c61f-eefd-4727-95a6-77d74093a3ea.jpg',6,49,NULL,NULL,3,'2.00'),(32,'馒头','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/9dac3963-866f-42b8-ae38-804d68ca9a8e.jpg',6,50,NULL,NULL,1,'1.00'),(33,'端午节套餐','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/481f4ae4-1aae-4080-9a3a-c8456ba7bbec.jpeg',7,NULL,1,NULL,2,'5.50'),(34,'鸡蛋汤','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/e384f10a-2886-419d-8ce2-02c4d66f0114.jpg',7,68,NULL,NULL,3,'4.00'),(35,'平菇豆腐汤','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/a4535f03-c277-4f9e-8cf2-e565b2aeffbb.jpg',7,69,NULL,NULL,1,'6.00'),(36,'馒头','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/9dac3963-866f-42b8-ae38-804d68ca9a8e.jpg',7,50,NULL,NULL,3,'1.00'),(37,'米饭','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/0602c61f-eefd-4727-95a6-77d74093a3ea.jpg',7,49,NULL,NULL,3,'2.00'),(38,'经典酸菜鮰鱼','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/d4ae642e-baef-42b5-b707-135a8fb809d1.jpg',7,52,NULL,'不要葱,不辣',1,'66.00'),(39,'江团鱼2斤','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/f8249c45-030e-4360-a710-645151a788ce.jpg',7,66,NULL,'不辣',1,'119.00'),(40,'端午节套餐','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/481f4ae4-1aae-4080-9a3a-c8456ba7bbec.jpeg',8,NULL,1,NULL,2,'5.50'),(41,'鸡蛋汤','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/e384f10a-2886-419d-8ce2-02c4d66f0114.jpg',8,68,NULL,NULL,3,'4.00'),(42,'平菇豆腐汤','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/a4535f03-c277-4f9e-8cf2-e565b2aeffbb.jpg',8,69,NULL,NULL,1,'6.00'),(43,'馒头','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/9dac3963-866f-42b8-ae38-804d68ca9a8e.jpg',8,50,NULL,NULL,3,'1.00'),(44,'米饭','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/0602c61f-eefd-4727-95a6-77d74093a3ea.jpg',8,49,NULL,NULL,3,'2.00'),(45,'经典酸菜鮰鱼','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/d4ae642e-baef-42b5-b707-135a8fb809d1.jpg',8,52,NULL,'不要葱,不辣',1,'66.00'),(46,'江团鱼2斤','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/f8249c45-030e-4360-a710-645151a788ce.jpg',8,66,NULL,'不辣',1,'119.00'),(47,'端午节套餐','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/481f4ae4-1aae-4080-9a3a-c8456ba7bbec.jpeg',9,NULL,1,NULL,1,'5.50'),(48,'北冰洋','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/ee0fb1ff-6339-44b5-b8aa-a4d3a30007b9.jpg',9,47,NULL,NULL,1,'4.00'),(49,'雪花啤酒','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/526ff006-0657-46fc-bcfe-a7674ccaa2bf.jpg',9,48,NULL,NULL,1,'4.00'),(50,'馒头','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/9dac3963-866f-42b8-ae38-804d68ca9a8e.jpg',9,50,NULL,NULL,1,'1.00'),(51,'米饭','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/0602c61f-eefd-4727-95a6-77d74093a3ea.jpg',9,49,NULL,NULL,1,'2.00'),(52,'江团鱼2斤','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/f8249c45-030e-4360-a710-645151a788ce.jpg',9,66,NULL,'不辣',1,'119.00'),(53,'米饭','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/0602c61f-eefd-4727-95a6-77d74093a3ea.jpg',10,49,NULL,NULL,3,'2.00'),(54,'馒头','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/9dac3963-866f-42b8-ae38-804d68ca9a8e.jpg',10,50,NULL,NULL,3,'1.00'),(55,'端午节套餐','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/481f4ae4-1aae-4080-9a3a-c8456ba7bbec.jpeg',10,NULL,1,NULL,3,'5.50'),(56,'北冰洋','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/ee0fb1ff-6339-44b5-b8aa-a4d3a30007b9.jpg',10,47,NULL,NULL,3,'4.00'),(57,'九转大肠','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/fccb976d-6513-4f46-a834-23d0074490c3.jpg',10,71,NULL,'无糖,热饮,不要葱',1,'99.00'),(58,'雪花啤酒','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/526ff006-0657-46fc-bcfe-a7674ccaa2bf.jpg',10,48,NULL,NULL,1,'4.00'),(59,'端午节套餐','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/481f4ae4-1aae-4080-9a3a-c8456ba7bbec.jpeg',11,NULL,1,NULL,1,'5.50'),(60,'北冰洋','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/ee0fb1ff-6339-44b5-b8aa-a4d3a30007b9.jpg',11,47,NULL,NULL,1,'4.00'),(61,'雪花啤酒','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/526ff006-0657-46fc-bcfe-a7674ccaa2bf.jpg',11,48,NULL,NULL,1,'4.00'),(62,'馒头','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/9dac3963-866f-42b8-ae38-804d68ca9a8e.jpg',11,50,NULL,NULL,1,'1.00'),(63,'米饭','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/0602c61f-eefd-4727-95a6-77d74093a3ea.jpg',11,49,NULL,NULL,1,'2.00'),(64,'江团鱼2斤','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/f8249c45-030e-4360-a710-645151a788ce.jpg',11,66,NULL,'不辣',1,'119.00'),(65,'端午节套餐','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/481f4ae4-1aae-4080-9a3a-c8456ba7bbec.jpeg',12,NULL,1,NULL,1,'5.50'),(66,'北冰洋','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/ee0fb1ff-6339-44b5-b8aa-a4d3a30007b9.jpg',12,47,NULL,NULL,1,'4.00'),(67,'雪花啤酒','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/526ff006-0657-46fc-bcfe-a7674ccaa2bf.jpg',12,48,NULL,NULL,1,'4.00'),(68,'馒头','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/9dac3963-866f-42b8-ae38-804d68ca9a8e.jpg',12,50,NULL,NULL,1,'1.00'),(69,'米饭','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/0602c61f-eefd-4727-95a6-77d74093a3ea.jpg',12,49,NULL,NULL,1,'2.00'),(70,'江团鱼2斤','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/f8249c45-030e-4360-a710-645151a788ce.jpg',12,66,NULL,'不辣',1,'119.00'),(71,'端午节套餐','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/481f4ae4-1aae-4080-9a3a-c8456ba7bbec.jpeg',13,NULL,1,NULL,1,'5.50'),(72,'北冰洋','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/ee0fb1ff-6339-44b5-b8aa-a4d3a30007b9.jpg',13,47,NULL,NULL,1,'4.00'),(73,'雪花啤酒','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/526ff006-0657-46fc-bcfe-a7674ccaa2bf.jpg',13,48,NULL,NULL,1,'4.00'),(74,'馒头','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/9dac3963-866f-42b8-ae38-804d68ca9a8e.jpg',13,50,NULL,NULL,1,'1.00'),(75,'米饭','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/0602c61f-eefd-4727-95a6-77d74093a3ea.jpg',13,49,NULL,NULL,1,'2.00'),(76,'江团鱼2斤','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/f8249c45-030e-4360-a710-645151a788ce.jpg',13,66,NULL,'不辣',1,'119.00'),(77,'端午节套餐','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/481f4ae4-1aae-4080-9a3a-c8456ba7bbec.jpeg',14,NULL,1,NULL,1,'5.50'),(78,'北冰洋','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/ee0fb1ff-6339-44b5-b8aa-a4d3a30007b9.jpg',14,47,NULL,NULL,1,'4.00'),(79,'雪花啤酒','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/526ff006-0657-46fc-bcfe-a7674ccaa2bf.jpg',14,48,NULL,NULL,1,'4.00'),(80,'馒头','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/9dac3963-866f-42b8-ae38-804d68ca9a8e.jpg',14,50,NULL,NULL,1,'1.00'),(81,'米饭','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/0602c61f-eefd-4727-95a6-77d74093a3ea.jpg',14,49,NULL,NULL,1,'2.00'),(82,'江团鱼2斤','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/f8249c45-030e-4360-a710-645151a788ce.jpg',14,66,NULL,'不辣',1,'119.00'),(83,'端午节套餐','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/481f4ae4-1aae-4080-9a3a-c8456ba7bbec.jpeg',15,NULL,1,NULL,2,'5.50'),(84,'炝炒圆白菜','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/1a473b27-efef-4028-bb24-0412cf0ce545.jpg',15,57,NULL,'不要葱',1,'18.00'),(85,'蒜蓉娃娃菜','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/acfea470-b620-4fac-8ec2-26c8bd24b47b.png',15,55,NULL,NULL,3,'18.00'),(86,'馒头','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/9dac3963-866f-42b8-ae38-804d68ca9a8e.jpg',15,50,NULL,NULL,3,'1.00'),(87,'草鱼2斤','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/07c1a9cb-8ce4-4abf-958d-eaeb570e1aab.jpg',15,65,NULL,'不辣',1,'68.00'),(88,'蜀味水煮草鱼','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/3bb87a7c-ffb4-4c81-b899-eaf146076130.jpg',16,53,NULL,'不要葱,不辣',1,'38.00'),(89,'清蒸鲈鱼','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/90694c2c-ce2f-4898-8520-1ee5a623fd21.jpg',16,58,NULL,NULL,2,'98.00'),(90,'梅菜扣肉','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/a9d5a4a2-1643-4324-8bde-da80f3267d15.jpg',16,60,NULL,'不要葱',1,'58.00'),(91,'东坡肘子','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/47a00f8a-38fd-448a-bfee-de4ffafaf11b.jpg',16,59,NULL,NULL,2,'138.00'),(92,'剁椒鱼头','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/0363e453-4b4c-4cd8-95d3-51af51028fba.jpg',16,61,NULL,NULL,2,'66.00'),(93,'蜀味水煮草鱼','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/3bb87a7c-ffb4-4c81-b899-eaf146076130.jpg',17,53,NULL,'不要葱,不辣',1,'38.00'),(94,'清蒸鲈鱼','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/90694c2c-ce2f-4898-8520-1ee5a623fd21.jpg',17,58,NULL,NULL,2,'98.00'),(95,'梅菜扣肉','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/a9d5a4a2-1643-4324-8bde-da80f3267d15.jpg',17,60,NULL,'不要葱',1,'58.00'),(96,'东坡肘子','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/47a00f8a-38fd-448a-bfee-de4ffafaf11b.jpg',17,59,NULL,NULL,2,'138.00'),(97,'剁椒鱼头','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/0363e453-4b4c-4cd8-95d3-51af51028fba.jpg',17,61,NULL,NULL,2,'66.00'),(98,'蜀味水煮草鱼','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/3bb87a7c-ffb4-4c81-b899-eaf146076130.jpg',18,53,NULL,'不要葱,不辣',1,'38.00'),(99,'清蒸鲈鱼','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/90694c2c-ce2f-4898-8520-1ee5a623fd21.jpg',18,58,NULL,NULL,2,'98.00'),(100,'梅菜扣肉','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/a9d5a4a2-1643-4324-8bde-da80f3267d15.jpg',18,60,NULL,'不要葱',1,'58.00'),(101,'东坡肘子','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/47a00f8a-38fd-448a-bfee-de4ffafaf11b.jpg',18,59,NULL,NULL,2,'138.00'),(102,'剁椒鱼头','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/0363e453-4b4c-4cd8-95d3-51af51028fba.jpg',18,61,NULL,NULL,2,'66.00'),(103,'蜀味水煮草鱼','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/3bb87a7c-ffb4-4c81-b899-eaf146076130.jpg',19,53,NULL,'不要葱,不辣',1,'38.00'),(104,'梅菜扣肉','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/a9d5a4a2-1643-4324-8bde-da80f3267d15.jpg',19,60,NULL,'不要葱',1,'58.00'),(105,'东坡肘子','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/47a00f8a-38fd-448a-bfee-de4ffafaf11b.jpg',19,59,NULL,NULL,2,'138.00'),(106,'剁椒鱼头','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/0363e453-4b4c-4cd8-95d3-51af51028fba.jpg',19,61,NULL,NULL,2,'66.00'),(107,'东坡肘子','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/47a00f8a-38fd-448a-bfee-de4ffafaf11b.jpg',20,59,NULL,NULL,1,'138.00'),(108,'剁椒鱼头','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/0363e453-4b4c-4cd8-95d3-51af51028fba.jpg',20,61,NULL,NULL,2,'66.00'),(109,'清炒西兰花','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/f3844d24-654c-4c36-a7c0-b60ec09024a6.jpg',21,56,NULL,'不要葱',1,'18.00'),(110,'江团鱼2斤','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/f8249c45-030e-4360-a710-645151a788ce.jpg',21,66,NULL,'不辣',1,'119.00'),(111,'蜀味水煮草鱼','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/3bb87a7c-ffb4-4c81-b899-eaf146076130.jpg',21,53,NULL,'不要葱,不辣',1,'38.00'),(112,'梅菜扣肉','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/a9d5a4a2-1643-4324-8bde-da80f3267d15.jpg',21,60,NULL,'不要葱',1,'58.00'),(113,'东坡肘子','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/47a00f8a-38fd-448a-bfee-de4ffafaf11b.jpg',21,59,NULL,NULL,2,'138.00'),(114,'剁椒鱼头','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/0363e453-4b4c-4cd8-95d3-51af51028fba.jpg',21,61,NULL,NULL,2,'66.00'),(115,'清炒西兰花','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/f3844d24-654c-4c36-a7c0-b60ec09024a6.jpg',22,56,NULL,'不要葱',1,'18.00'),(116,'江团鱼2斤','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/f8249c45-030e-4360-a710-645151a788ce.jpg',22,66,NULL,'不辣',1,'119.00'),(117,'蜀味水煮草鱼','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/3bb87a7c-ffb4-4c81-b899-eaf146076130.jpg',22,53,NULL,'不要葱,不辣',1,'38.00'),(118,'梅菜扣肉','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/a9d5a4a2-1643-4324-8bde-da80f3267d15.jpg',22,60,NULL,'不要葱',1,'58.00'),(119,'东坡肘子','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/47a00f8a-38fd-448a-bfee-de4ffafaf11b.jpg',22,59,NULL,NULL,2,'138.00'),(120,'剁椒鱼头','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/0363e453-4b4c-4cd8-95d3-51af51028fba.jpg',22,61,NULL,NULL,2,'66.00'),(121,'梅菜扣肉','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/a9d5a4a2-1643-4324-8bde-da80f3267d15.jpg',23,60,NULL,'不要葱',1,'58.00'),(122,'东坡肘子','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/47a00f8a-38fd-448a-bfee-de4ffafaf11b.jpg',23,59,NULL,NULL,2,'138.00'),(123,'剁椒鱼头','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/0363e453-4b4c-4cd8-95d3-51af51028fba.jpg',23,61,NULL,NULL,2,'66.00'),(124,'东坡肘子','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/47a00f8a-38fd-448a-bfee-de4ffafaf11b.jpg',24,59,NULL,NULL,1,'138.00'),(125,'剁椒鱼头','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/0363e453-4b4c-4cd8-95d3-51af51028fba.jpg',24,61,NULL,NULL,2,'66.00'),(126,'老坛酸菜鱼','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/c31c29bc-4a4d-44d4-af79-9e167976077e.jpg',25,51,NULL,'不要葱,不辣',1,'56.00'),(127,'经典酸菜鮰鱼','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/d4ae642e-baef-42b5-b707-135a8fb809d1.jpg',25,52,NULL,'不要葱,不辣',1,'66.00'),(128,'草鱼2斤','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/07c1a9cb-8ce4-4abf-958d-eaeb570e1aab.jpg',25,65,NULL,'不辣',1,'68.00'),(129,'东坡肘子','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/47a00f8a-38fd-448a-bfee-de4ffafaf11b.jpg',26,59,NULL,NULL,1,'138.00'),(130,'剁椒鱼头','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/0363e453-4b4c-4cd8-95d3-51af51028fba.jpg',26,61,NULL,NULL,2,'66.00'),(131,'东坡肘子','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/47a00f8a-38fd-448a-bfee-de4ffafaf11b.jpg',27,59,NULL,NULL,1,'138.00'),(132,'剁椒鱼头','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/0363e453-4b4c-4cd8-95d3-51af51028fba.jpg',27,61,NULL,NULL,2,'66.00'),(133,'鮰鱼2斤','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/7b596ab7-7140-4c34-8db4-47c55f0ac26c.jpg',28,67,NULL,'不辣',1,'72.00'),(134,'江团鱼2斤','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/f8249c45-030e-4360-a710-645151a788ce.jpg',28,66,NULL,'不辣',1,'119.00'),(135,'草鱼2斤','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/07c1a9cb-8ce4-4abf-958d-eaeb570e1aab.jpg',28,65,NULL,'不辣',1,'68.00'),(136,'东坡肘子','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/47a00f8a-38fd-448a-bfee-de4ffafaf11b.jpg',28,59,NULL,NULL,1,'138.00'),(137,'剁椒鱼头','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/0363e453-4b4c-4cd8-95d3-51af51028fba.jpg',28,61,NULL,NULL,2,'66.00'),(138,'端午节套餐','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/481f4ae4-1aae-4080-9a3a-c8456ba7bbec.jpeg',29,NULL,1,NULL,1,'5.50'),(139,'平菇豆腐汤','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/a4535f03-c277-4f9e-8cf2-e565b2aeffbb.jpg',29,69,NULL,NULL,2,'6.00'),(140,'馒头','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/9dac3963-866f-42b8-ae38-804d68ca9a8e.jpg',29,50,NULL,NULL,4,'1.00'),(141,'米饭','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/0602c61f-eefd-4727-95a6-77d74093a3ea.jpg',29,49,NULL,NULL,5,'2.00'),(142,'炝炒圆白菜','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/1a473b27-efef-4028-bb24-0412cf0ce545.jpg',29,57,NULL,'不要葱',2,'18.00'),(143,'鮰鱼2斤','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/7b596ab7-7140-4c34-8db4-47c55f0ac26c.jpg',29,67,NULL,'不辣',1,'72.00');

/*Table structure for table `orders` */

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `number` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '订单号',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '订单状态 1待付款 2待接单 3已接单 4派送中 5已完成 6已取消 7退款',
  `user_id` bigint(20) NOT NULL COMMENT '下单用户',
  `address_book_id` bigint(20) NOT NULL COMMENT '地址id',
  `order_time` datetime NOT NULL COMMENT '下单时间',
  `checkout_time` datetime DEFAULT NULL COMMENT '结账时间',
  `pay_method` int(11) NOT NULL DEFAULT '1' COMMENT '支付方式 1微信,2支付宝',
  `pay_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '支付状态 0未支付 1已支付 2退款',
  `amount` decimal(10,2) NOT NULL COMMENT '实收金额',
  `remark` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `phone` varchar(11) COLLATE utf8_bin DEFAULT NULL COMMENT '手机号',
  `address` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '地址',
  `user_name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '用户名称',
  `consignee` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '收货人',
  `cancel_reason` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '订单取消原因',
  `rejection_reason` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '订单拒绝原因',
  `cancel_time` datetime DEFAULT NULL COMMENT '订单取消时间',
  `estimated_delivery_time` datetime DEFAULT NULL COMMENT '预计送达时间',
  `delivery_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '配送状态  1立即送出  0选择具体时间',
  `delivery_time` datetime DEFAULT NULL COMMENT '送达时间',
  `pack_amount` int(11) DEFAULT NULL COMMENT '打包费',
  `tableware_number` int(11) DEFAULT NULL COMMENT '餐具数量',
  `tableware_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '餐具数量状态  1按餐量提供  0选择具体数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='订单表';

/*Data for the table `orders` */

insert  into `orders`(`id`,`number`,`status`,`user_id`,`address_book_id`,`order_time`,`checkout_time`,`pay_method`,`pay_status`,`amount`,`remark`,`phone`,`address`,`user_name`,`consignee`,`cancel_reason`,`rejection_reason`,`cancel_time`,`estimated_delivery_time`,`delivery_status`,`delivery_time`,`pack_amount`,`tableware_number`,`tableware_status`) values (1,'1712387649079',6,1,3,'2024-03-31 15:14:09',NULL,1,0,'385.50','Sed rerum nisi qui perspiciatis sit incidunt eius ','19735827140','Scotburgh 49604 Mann Coves',NULL,'AnitaAdams','用户取消',NULL,'2024-04-06 17:42:14','2024-04-06 16:13:00',0,NULL,12,1,0),(2,'1712391032229',6,1,2,'0000-00-00 00:00:00',NULL,1,0,'121.00','','19081407430','Maxiehaven 628 Boyer Burg',NULL,'EdwinK','支付超时，自动取消',NULL,'2024-04-06 18:48:37','2024-04-06 17:10:00',0,NULL,5,0,0),(3,'1712392486463',6,1,2,'2024-04-05 16:34:46',NULL,1,0,'135.00','','19081407430','Maxiehaven 628 Boyer Burg',NULL,'EdwinK','菜品已销售完，暂时无法接单',NULL,'2024-04-06 17:59:26','2024-04-06 17:34:00',0,NULL,5,0,0),(4,'1712393444895',6,1,2,'2024-04-06 16:50:45',NULL,1,0,'147.50','','19081407430','Maxiehaven 628 Boyer Burg',NULL,'EdwinK','用户取消',NULL,'2024-04-06 17:42:31','2024-04-06 17:50:00',0,NULL,6,0,0),(5,'1712394634892',6,1,2,'2024-04-06 17:10:35','2024-04-06 17:10:37',1,1,'243.00','','19081407430','Maxiehaven 628 Boyer Burg',NULL,'EdwinK',NULL,'菜品已销售完，暂时无法接单','2024-04-06 17:57:47','2024-04-06 18:10:00',0,NULL,14,0,0),(6,'1712395074052',6,1,2,'2024-04-05 17:17:54','2024-04-06 17:17:56',1,2,'88.00','Incidunt cupiditate iure voluptas sed. Accusantium','19081407430','Maxiehaven 628 Boyer Burg',NULL,'EdwinK','用户取消',NULL,'2024-04-06 17:33:13','2024-04-06 18:17:00',0,NULL,17,0,0),(7,'1712396507606',6,1,2,'2024-04-06 17:41:48','2024-04-06 17:41:49',1,2,'243.00','','19081407430','Maxiehaven 628 Boyer Burg',NULL,'EdwinK','用户取消',NULL,'2024-04-06 17:41:53','2024-04-06 18:41:00',0,NULL,14,0,0),(8,'1712396517418',6,1,2,'2024-04-06 17:41:57','2024-04-06 17:42:01',1,1,'243.00','','19081407430','Maxiehaven 628 Boyer Burg',NULL,'EdwinK','客户电话取消',NULL,'2024-04-06 17:59:00','2024-04-06 18:41:00',0,'2024-04-06 17:58:50',14,0,0),(9,'1712396556132',6,1,2,'2024-03-06 17:42:36','2024-04-06 17:42:37',1,1,'147.50','','19081407430','Maxiehaven 628 Boyer Burg',NULL,'EdwinK','订单量较多，暂时无法接单',NULL,'2024-04-06 17:57:33','2024-04-06 18:42:00',0,NULL,6,0,0),(10,'1712399388492',5,1,2,'2024-04-06 18:29:48','2024-04-06 18:29:54',1,1,'160.50','','19081407430','什刹海街道',NULL,'EdwinK',NULL,NULL,NULL,'2024-04-06 19:29:00',0,NULL,14,0,0),(11,'1712400769026',6,1,2,'2024-03-22 18:52:49',NULL,1,0,'147.50','','19081407430','什刹海街道',NULL,'EdwinK','支付超时，自动取消',NULL,'2024-04-06 18:54:00','2024-04-06 19:52:00',0,NULL,6,0,0),(12,'1712400984076',5,1,2,'2024-04-06 18:56:24','2024-04-06 18:56:48',1,1,'147.50','','19081407430','什刹海街道',NULL,'EdwinK',NULL,NULL,NULL,'2024-04-06 19:56:00',0,NULL,6,0,0),(13,'1712401148582',6,1,2,'2024-03-26 18:59:09',NULL,1,0,'147.50','','19081407430','什刹海街道',NULL,'EdwinK','支付超时，自动取消',NULL,'2024-04-06 18:59:40','2024-04-06 19:59:00',0,NULL,6,0,0),(14,'1712403246642',4,1,2,'2024-04-06 19:34:07','2024-04-06 19:34:50',1,1,'147.50','Fugit et assumenda totam necessitatibus temporibus','19081407430','什刹海街道',NULL,'EdwinK',NULL,NULL,NULL,'2024-04-06 20:33:00',0,NULL,6,1,0),(15,'1712403398257',4,1,2,'2024-04-06 19:36:38','2024-04-06 19:36:46',1,1,'170.00','','19081407430','什刹海街道',NULL,'EdwinK',NULL,NULL,NULL,'2024-04-06 20:36:00',0,NULL,10,1,0),(16,'1712403576672',6,1,2,'2024-04-06 19:39:37','2024-04-06 19:39:38',1,1,'714.00','','19081407430','什刹海街道',NULL,'EdwinK',NULL,'Distinctio sunt nobi','2024-04-06 19:57:16','2024-04-06 20:39:00',0,NULL,8,0,0),(17,'1712403622169',5,1,2,'2024-03-21 19:40:22','2024-04-06 19:40:23',1,1,'714.00','','19081407430','什刹海街道',NULL,'EdwinK',NULL,NULL,NULL,'2024-04-06 20:40:00',0,'2024-04-06 19:57:28',8,0,0),(18,'1712403652031',6,1,2,'2024-04-06 19:40:52','2024-04-06 19:40:53',1,1,'714.00','','19081407430','什刹海街道',NULL,'EdwinK',NULL,'dsgbf','2024-04-06 19:47:08','2024-04-06 20:40:00',0,NULL,8,0,0),(19,'1712403682378',6,1,2,'2024-04-06 19:41:22','2024-04-06 19:41:24',1,1,'516.00','','19081407430','什刹海街道',NULL,'EdwinK',NULL,'菜品已销售完，暂时无法接单','2024-04-06 19:46:57','2024-04-06 20:41:00',0,NULL,6,0,0),(20,'1712403738876',5,1,2,'2024-04-06 19:42:19','2024-04-06 19:42:20',1,1,'279.00','','19081407430','什刹海街道',NULL,'EdwinK',NULL,NULL,NULL,'2024-04-06 20:42:00',0,'2024-04-06 19:57:28',3,0,0),(21,'1712403824504',5,1,2,'2024-04-05 19:43:45','2024-04-06 19:43:45',1,1,'655.00','','19081407430','什刹海街道',NULL,'EdwinK',NULL,NULL,NULL,'2024-04-06 20:43:00',0,'2024-04-06 19:57:27',8,0,0),(22,'1712403852948',5,1,2,'2024-04-06 19:44:13','2024-04-06 19:44:14',1,1,'655.00','','19081407430','什刹海街道',NULL,'EdwinK',NULL,NULL,NULL,'2024-04-06 20:44:00',0,'2024-04-06 19:57:27',8,0,0),(23,'1712403911211',6,1,2,'2024-04-06 19:45:11','2024-04-06 19:45:12',1,1,'477.00','','19081407430','什刹海街道',NULL,'EdwinK',NULL,'餐厅已打烊，暂时无法接单','2024-04-06 19:46:54','2024-04-06 20:45:00',0,NULL,5,0,0),(24,'1712403951079',5,1,2,'2024-04-06 19:45:51','2024-04-06 19:45:52',1,1,'279.00','','19081407430','什刹海街道',NULL,'EdwinK',NULL,NULL,NULL,'2024-04-06 20:45:00',0,'2024-04-06 19:57:27',3,0,0),(25,'1712403997310',5,1,2,'2024-04-05 19:46:37','2024-04-06 19:46:38',1,1,'199.00','','19081407430','什刹海街道',NULL,'EdwinK',NULL,NULL,NULL,'2024-04-06 20:46:00',0,'2024-04-06 19:57:27',3,0,0),(26,'1712404208678',5,1,2,'2024-04-06 19:50:09','2024-04-06 19:50:10',1,1,'279.00','','19081407430','什刹海街道',NULL,'EdwinK',NULL,NULL,NULL,'2024-04-06 20:50:00',0,'2024-04-06 19:57:36',3,0,0),(27,'1712406914802',4,1,2,'2024-04-06 20:35:15','2024-04-06 20:35:15',1,1,'279.00','','19081407430','什刹海街道',NULL,'EdwinK',NULL,NULL,NULL,'2024-04-06 21:35:00',0,NULL,3,0,0),(28,'1712406952531',2,1,2,'2024-04-05 20:35:53','2024-04-06 20:35:53',1,1,'541.00','','19081407430','什刹海街道',NULL,'EdwinK',NULL,NULL,NULL,'2024-04-06 21:35:00',0,NULL,6,1,0),(29,'1712409958886',2,1,2,'2024-04-06 21:25:59','2024-04-06 21:26:39',1,1,'160.50','','19081407430','什刹海街道',NULL,'EdwinK',NULL,NULL,NULL,'2024-04-06 22:25:00',0,NULL,15,0,0);

/*Table structure for table `setmeal` */

DROP TABLE IF EXISTS `setmeal`;

CREATE TABLE `setmeal` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `category_id` bigint(20) NOT NULL COMMENT '菜品分类id',
  `name` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '套餐名称',
  `price` decimal(10,2) NOT NULL COMMENT '套餐价格',
  `status` int(11) DEFAULT '1' COMMENT '售卖状态 0:停售 1:起售',
  `description` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '描述信息',
  `image` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '图片',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_user` bigint(20) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_setmeal_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='套餐';

/*Data for the table `setmeal` */

insert  into `setmeal`(`id`,`category_id`,`name`,`price`,`status`,`description`,`image`,`create_time`,`update_time`,`create_user`,`update_user`) values (1,15,'端午节套餐','5.50',1,'Saepe enim recusandae. Qui quos animi porro totam omnis. Dicta sunt commodi fugit voluptate ea rerum at quasi. Reprehenderit iusto minima reiciendis sed natus voluptates. Exercitationem ullam ab quo a','https://skytakeway-vectorx.oss-cn-shanghai.aliyuncs.com/481f4ae4-1aae-4080-9a3a-c8456ba7bbec.jpeg','2024-04-05 10:55:32','2024-04-06 20:35:04',1,1);

/*Table structure for table `setmeal_dish` */

DROP TABLE IF EXISTS `setmeal_dish`;

CREATE TABLE `setmeal_dish` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `setmeal_id` bigint(20) DEFAULT NULL COMMENT '套餐id',
  `dish_id` bigint(20) DEFAULT NULL COMMENT '菜品id',
  `name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '菜品名称 （冗余字段）',
  `price` decimal(10,2) DEFAULT NULL COMMENT '菜品单价（冗余字段）',
  `copies` int(11) DEFAULT NULL COMMENT '菜品份数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='套餐菜品关系';

/*Data for the table `setmeal_dish` */

insert  into `setmeal_dish`(`id`,`setmeal_id`,`dish_id`,`name`,`price`,`copies`) values (5,1,49,'米饭','2.00',1),(6,1,56,'清炒西兰花','18.00',1),(7,1,48,'雪花啤酒','4.00',1),(8,1,59,'东坡肘子','138.00',1);

/*Table structure for table `shopping_cart` */

DROP TABLE IF EXISTS `shopping_cart`;

CREATE TABLE `shopping_cart` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '商品名称',
  `image` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '图片',
  `user_id` bigint(20) NOT NULL COMMENT '主键',
  `dish_id` bigint(20) DEFAULT NULL COMMENT '菜品id',
  `setmeal_id` bigint(20) DEFAULT NULL COMMENT '套餐id',
  `dish_flavor` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '口味',
  `number` int(11) NOT NULL DEFAULT '1' COMMENT '数量',
  `amount` decimal(10,2) NOT NULL COMMENT '金额',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='购物车';

/*Data for the table `shopping_cart` */

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `openid` varchar(45) COLLATE utf8_bin DEFAULT NULL COMMENT '微信用户唯一标识',
  `name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '姓名',
  `phone` varchar(11) COLLATE utf8_bin DEFAULT NULL COMMENT '手机号',
  `sex` varchar(2) COLLATE utf8_bin DEFAULT NULL COMMENT '性别',
  `id_number` varchar(18) COLLATE utf8_bin DEFAULT NULL COMMENT '身份证号',
  `avatar` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '头像',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户信息';

/*Data for the table `user` */

insert  into `user`(`id`,`openid`,`name`,`phone`,`sex`,`id_number`,`avatar`,`create_time`) values (1,'ozmO45_9aveGsKuKmdIjmmvCskzk',NULL,NULL,NULL,NULL,NULL,'2024-04-06 14:44:38');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
