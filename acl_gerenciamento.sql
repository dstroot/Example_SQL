/*
Navicat MySQL Data Transfer

Source Server         : Locahost
Source Server Version : 50710
Source Host           : localhost:3306
Source Database       : kahina

Target Server Type    : MYSQL
Target Server Version : 50710
File Encoding         : 65001

Date: 2016-02-16 17:57:12
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for acl_gerenciamento
-- ----------------------------
DROP TABLE IF EXISTS `acl_gerenciamento`;
CREATE TABLE `acl_gerenciamento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `grupo_id` int(11) NOT NULL,
  `recurso_id` int(11) NOT NULL,
  `ver` tinyint(1) NOT NULL DEFAULT '0',
  `cadastrar` tinyint(1) NOT NULL DEFAULT '0',
  `editar` tinyint(1) NOT NULL DEFAULT '0',
  `excluir` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `acl_grupo_fk` (`grupo_id`),
  KEY `acl_recurso_fk` (`recurso_id`),
  CONSTRAINT `acl_grupo_fk` FOREIGN KEY (`grupo_id`) REFERENCES `acl_grupos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `acl_recurso_fk` FOREIGN KEY (`recurso_id`) REFERENCES `acl_recursos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
