/*
Navicat MySQL Data Transfer

Source Server         : Locahost
Source Server Version : 50710
Source Host           : localhost:3306
Source Database       : kahina

Target Server Type    : MYSQL
Target Server Version : 50710
File Encoding         : 65001

Date: 2016-02-16 17:57:43
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for acl_recursos
-- ----------------------------
DROP TABLE IF EXISTS `acl_recursos`;
CREATE TABLE `acl_recursos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `recurso` varchar(100) NOT NULL,
  `modulo` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
