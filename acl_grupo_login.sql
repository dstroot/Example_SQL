/*
Navicat MySQL Data Transfer

Source Server         : Locahost
Source Server Version : 50710
Source Host           : localhost:3306
Source Database       : kahina

Target Server Type    : MYSQL
Target Server Version : 50710
File Encoding         : 65001

Date: 2016-02-16 17:57:28
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for acl_grupo_login
-- ----------------------------
DROP TABLE IF EXISTS `acl_grupo_login`;
CREATE TABLE `acl_grupo_login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` int(11) NOT NULL,
  `grupo_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `login_grupo_fk` (`login_id`),
  KEY `grupo_id_fk` (`grupo_id`),
  CONSTRAINT `grupo_id_fk` FOREIGN KEY (`grupo_id`) REFERENCES `acl_grupos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `login_grupo_fk` FOREIGN KEY (`login_id`) REFERENCES `login` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
