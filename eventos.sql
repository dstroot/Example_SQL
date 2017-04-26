/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50710
Source Host           : localhost:3306
Source Database       : kahina

Target Server Type    : MYSQL
Target Server Version : 50710
File Encoding         : 65001

Date: 2016-02-22 12:08:36
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for eventos
-- ----------------------------
DROP TABLE IF EXISTS `eventos`;
CREATE TABLE `eventos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `evento` varchar(255) NOT NULL,
  `imagem` varchar(255) DEFAULT NULL,
  `iniciaem` date NOT NULL,
  `finalizaem` date NOT NULL,
  `descricao` text NOT NULL,
  `horario` time NOT NULL,
  `local` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
