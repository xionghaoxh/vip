/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 80017
Source Host           : 127.0.0.1:3306
Source Database       : apms

Target Server Type    : MYSQL
Target Server Version : 80017
File Encoding         : 65001

Date: 2020-02-13 20:19:12
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` char(32) NOT NULL COMMENT '主键',
  `account` varchar(32) NOT NULL COMMENT '账号',
  `name` varchar(32) NOT NULL COMMENT '名称',
  `password` char(32) NOT NULL COMMENT '密码',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `last_Login_IP` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `last_login_time` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `last_modify_password_time` datetime DEFAULT NULL COMMENT '最后密码修改时间',
  `phone` varchar(32) DEFAULT NULL,
  `security_Email` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `flag` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态（0=正常 1=锁定）',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否已删除',
  `create_user_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account` (`account`),
  KEY `create_user_id` (`create_user_id`),
  CONSTRAINT `sys_user_ibfk_1` FOREIGN KEY (`create_user_id`) REFERENCES `sys_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('00000000000000000000000000000000', 'administrator', '系统超级管理员', '123456', '2017-09-08 10:27:00', '127.0.0.1', '2019-08-08 12:04:03', '2018-07-10 09:34:56', null, '110@110.com', '{\"contentType\":\"image/png\",\"fileSufix\":\".png\",\"height\":0,\"length\":32476,\"name\":\"00000000000000000000000000000000\",\"width\":0}', '系统超级管理员,不可删除，不可修改', '0', '\0', '00000000000000000000000000000000');
INSERT INTO `sys_user` VALUES ('11111111111111111111111111111111', 'system', '系统管理员', '123456', '2018-07-18 09:50:39', '127.0.0.1', '2018-09-19 14:17:59', null, null, null, null, null, '0', '\0', '00000000000000000000000000000000');
INSERT INTO `sys_user` VALUES ('503d4986724a02eb74c4b9d94b6b518b', 'liubei', '刘备', '123456', '2018-09-18 16:59:25', null, null, null, null, null, null, null, '0', '\0', '11111111111111111111111111111111');
INSERT INTO `sys_user` VALUES ('698192f9b4018aabc7648bffbb9912a8', 'guanyu', '关羽', '123456', '2018-09-18 17:04:21', null, null, null, null, null, null, null, '0', '\0', '11111111111111111111111111111111');
INSERT INTO `sys_user` VALUES ('ae3bb65f384d1baab9546dd6bb2853f5', 'test', '测试人员', '2ea1cd0405ab06baeb761e863ff199e4', '2018-08-14 08:51:08', '10.25.208.90', '2018-09-12 16:07:48', '2018-08-14 09:09:18', null, null, null, '测试账号', '0', '\0', '00000000000000000000000000000000');
INSERT INTO `sys_user` VALUES ('dd294dd6c72b903b1784ee21f42a190e', 'zhangfei', '张飞', '123456', '2018-09-18 17:02:55', null, null, null, null, null, null, '测试员工1', '0', '\0', '11111111111111111111111111111111');
