/*
Navicat MySQL Data Transfer

Source Server         : Locahost
Source Server Version : 50710
Source Host           : localhost:3306
Source Database       : kahina

Target Server Type    : MYSQL
Target Server Version : 50710
File Encoding         : 65001

Date: 2016-02-16 17:58:45
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for login_recuperar
-- ----------------------------
DROP TABLE IF EXISTS `login_recuperar`;
CREATE TABLE `login_recuperar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` int(11) NOT NULL,
  `solicitadoem` datetime NOT NULL,
  `expiraem` datetime NOT NULL,
  `utilizado` tinyint(1) NOT NULL DEFAULT '0',
  `chave` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `login_id_fk` (`login_id`),
  CONSTRAINT `login_id_fk` FOREIGN KEY (`login_id`) REFERENCES `login` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
