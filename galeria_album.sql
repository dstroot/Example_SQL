/*
Navicat MySQL Data Transfer

Source Server         : Locahost
Source Server Version : 50710
Source Host           : localhost:3306
Source Database       : kahina

Target Server Type    : MYSQL
Target Server Version : 50710
File Encoding         : 65001

Date: 2016-02-16 17:58:31
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for galeria_album
-- ----------------------------
DROP TABLE IF EXISTS `galeria_album`;
CREATE TABLE `galeria_album` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(80) NOT NULL,
  `criadoem` datetime NOT NULL,
  `descricao` text NOT NULL,
  `fid` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
