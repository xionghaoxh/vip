/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 80017
Source Host           : 127.0.0.1:3306
Source Database       : apms

Target Server Type    : MYSQL
Target Server Version : 80017
File Encoding         : 65001

Date: 2020-02-13 20:18:41
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for roleofmenu
-- ----------------------------
DROP TABLE IF EXISTS `roleofmenu`;
CREATE TABLE `roleofmenu` (
  `role_id` char(32) NOT NULL,
  `menu_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`role_id`,`menu_id`),
  KEY `menu_id` (`menu_id`),
  CONSTRAINT `roleofmenu_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`id`),
  CONSTRAINT `roleofmenu_ibfk_2` FOREIGN KEY (`menu_id`) REFERENCES `sys_menu` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of roleofmenu
-- ----------------------------
INSERT INTO `roleofmenu` VALUES ('29e8d63ee89276098e346a348ca243f3', '00000000000000000000000000000000');
