/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50710
Source Host           : localhost:3306
Source Database       : kahina

Target Server Type    : MYSQL
Target Server Version : 50710
File Encoding         : 65001

Date: 2016-02-18 14:33:50
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for blog_postagem
-- ----------------------------
DROP TABLE IF EXISTS `blog_postagem`;
CREATE TABLE `blog_postagem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(150) NOT NULL,
  `postagem` mediumtext NOT NULL,
  `categoria_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL COMMENT 'Autor',
  `imagem` varchar(255) DEFAULT NULL,
  `postadoem` datetime NOT NULL,
  `tags` text NOT NULL,
  `alteradoem` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `categoria_id` (`categoria_id`),
  KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `blog_postagem_ibfk_1` FOREIGN KEY (`categoria_id`) REFERENCES `blog_categorias` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `blog_postagem_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios_detalhes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
