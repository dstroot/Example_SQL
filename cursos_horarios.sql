/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50710
Source Host           : localhost:3306
Source Database       : kahina

Target Server Type    : MYSQL
Target Server Version : 50710
File Encoding         : 65001

Date: 2016-02-22 10:17:31
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cursos_horarios
-- ----------------------------
DROP TABLE IF EXISTS `cursos_horarios`;
CREATE TABLE `cursos_horarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `equipe_id` int(11) DEFAULT '0',
  `curso_id` int(11) DEFAULT '0',
  `professor` varchar(100) DEFAULT NULL,
  `curso` varchar(150) DEFAULT NULL,
  `dia` varchar(50) NOT NULL,
  `horario` time NOT NULL,
  `nivel` varchar(100) DEFAULT NULL,
  `sala` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `equipe_id` (`equipe_id`),
  KEY `curso_id` (`curso_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
