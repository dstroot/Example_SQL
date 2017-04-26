/*
Navicat MySQL Data Transfer

Source Server         : Locahost
Source Server Version : 50710
Source Host           : localhost:3306
Source Database       : kahina

Target Server Type    : MYSQL
Target Server Version : 50710
File Encoding         : 65001

Date: 2016-02-16 17:58:35
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for galeria_fotos
-- ----------------------------
DROP TABLE IF EXISTS `galeria_fotos`;
CREATE TABLE `galeria_fotos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL,
  `album_id` int(11) NOT NULL,
  `legenda` varchar(200) DEFAULT NULL,
  `capa` smallint(1) DEFAULT '0',
  `ordem` int(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `album_id` (`album_id`),
  CONSTRAINT `galeria_fotos_ibfk_1` FOREIGN KEY (`album_id`) REFERENCES `galeria_album` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
