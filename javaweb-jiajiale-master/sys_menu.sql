/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 80017
Source Host           : 127.0.0.1:3306
Source Database       : apms

Target Server Type    : MYSQL
Target Server Version : 80017
File Encoding         : 65001

Date: 2020-02-13 20:18:56
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '功能id',
  `code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '功能代号',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '功能名称',
  `icon` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '功能图标',
  `url` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '功能的action',
  `parent_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '父菜单的id',
  `show_order` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '显示顺序号，越小越在前(升序)',
  `flag` tinyint(4) unsigned NOT NULL COMMENT '标识位:0正常 1=禁用',
  `create_user_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `remark` varchar(512) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('00000000000000000000000000000000', '09', '系统管理', null, null, null, null, '1', '00000000000000000000000000000000', '2018-07-17 13:09:10', null);
INSERT INTO `sys_menu` VALUES ('00000000000000000000000000000001', '0902', '系统角色管理', null, '/system/rolemanage/list.jsp', '00000000000000000000000000000000', null, '1', '00000000000000000000000000000000', '2018-07-17 13:09:10', '管理用户角色');
INSERT INTO `sys_menu` VALUES ('00000000000000000000000000000002', '0901', '功能模块管理', null, '/system/modulemanage/list.jsp', '00000000000000000000000000000000', null, '1', '00000000000000000000000000000000', '2018-07-17 13:09:10', null);
INSERT INTO `sys_menu` VALUES ('00000000000000000000000000000003', '0903', '系统用户管理', null, '/system/usermanage/list.jsp', '00000000000000000000000000000000', null, '1', '00000000000000000000000000000000', '2018-07-17 13:09:10', null);
INSERT INTO `sys_menu` VALUES ('03eb5aaf3dbb27780d44607645eba5a6', '呼噜娃', '12356789', null, '345', '3f6bb060afc29e0a0f54df823669f89d', '234', '0', 'ae3bb65f384d1baab9546dd6bb2853f5', '2018-08-17 13:13:41', null);
INSERT INTO `sys_menu` VALUES ('06058e6e51e8673b3264a478bf2eb92b', '12121221122211212112312', '1212', null, '1212', 'c9046f802a091c0b2e64136ca1a5f902', null, '0', 'ae3bb65f384d1baab9546dd6bb2853f5', '2018-08-17 19:15:31', null);
INSERT INTO `sys_menu` VALUES ('09cf022f48edfab90b64b143e405a2f5', 'gggg', 'gggg', null, null, 'a7e6a4d769e83469536480cb0982ad10', null, '0', 'ae3bb65f384d1baab9546dd6bb2853f5', '2018-08-17 13:23:59', null);
INSERT INTO `sys_menu` VALUES ('11f1a240f43edbd9bbe4c9e8222a310f', '0101', '修改密码', null, '/userhome/modify-password.jsp', '34370f8bccd45a0a74941559c91c0441', '01', '1', '00000000000000000000000000000000', '2018-07-17 13:09:10', null);
INSERT INTO `sys_menu` VALUES ('184f41874065627a4a24bd6ee5b97f1c', '002', '第二层', null, null, 'bc2bcdb6140e904bedf4076bda203489', null, '0', '00000000000000000000000000000000', '2018-08-14 09:36:27', null);
INSERT INTO `sys_menu` VALUES ('1e27bf513f8d5b092874f225b8e715aa', '请问', '请问', null, null, '6670a68fe4fdb74963b4c38e4b0581c1', null, '0', 'ae3bb65f384d1baab9546dd6bb2853f5', '2018-08-17 11:51:57', null);
INSERT INTO `sys_menu` VALUES ('201f486a738f567bd154c071ed22a180', '456456465', '55+6', null, null, null, null, '0', 'ae3bb65f384d1baab9546dd6bb2853f5', '2018-08-17 14:47:33', null);
INSERT INTO `sys_menu` VALUES ('2035c15995c2fb9818f4d777960fdd77', 'aaaaa', 'aa', null, null, 'da7f533bbfa3f7ebb5144b61e6335392', null, '0', 'ae3bb65f384d1baab9546dd6bb2853f5', '2018-08-17 18:42:15', null);
INSERT INTO `sys_menu` VALUES ('25b53ff33143c26bd0e47dc3681cd3c7', '03', '员工管理', null, null, null, null, '0', 'd0ed1164987d96f819d450e04ef8e85c', '2018-07-22 12:58:42', null);
INSERT INTO `sys_menu` VALUES ('26f8099a28cd1b2b80140320c185b32b', 'yuyuyuyyuyuyuyyuyuyuyyuyuyuy', 'yuyuyuyyuyuyuyyuyuyuyyuyuyuyyuyu', null, null, '201f486a738f567bd154c071ed22a180', null, '0', 'ae3bb65f384d1baab9546dd6bb2853f5', '2018-08-17 19:12:43', null);
INSERT INTO `sys_menu` VALUES ('2718744ce8f349589764f488854fda30', '1212212121', '121222121', null, 'wwwwwwwwwwwwwwwwwwwwwww', '84893aecea580399b654d6955ddf102b', null, '0', 'ae3bb65f384d1baab9546dd6bb2853f5', '2018-08-17 11:19:18', null);
INSERT INTO `sys_menu` VALUES ('2e33b69c857b20baded404745aaa9d8b', 'www', 'www', null, null, null, null, '0', 'ae3bb65f384d1baab9546dd6bb2853f5', '2018-08-17 10:45:31', null);
INSERT INTO `sys_menu` VALUES ('34370f8bccd45a0a74941559c91c0441', '01', '个人中心', null, null, null, '01', '1', '00000000000000000000000000000000', '2018-07-17 13:09:10', null);
INSERT INTO `sys_menu` VALUES ('360f57ec9948e6b897b4185501a11412', '呼噜娃kkkkhh', '呼噜娃kkkkhh', null, 'http://tech.ifeng.com/a/20171201/44787041_0.shtml', '2718744ce8f349589764f488854fda30', null, '0', 'ae3bb65f384d1baab9546dd6bb2853f5', '2018-08-17 13:14:43', null);
INSERT INTO `sys_menu` VALUES ('3d397a3e445d9768c9d4973ad976ebf8', 'createTimecreateTime', 'createTime', null, 'createTime', '2718744ce8f349589764f488854fda30', 'createTime', '0', 'ae3bb65f384d1baab9546dd6bb2853f5', '2018-08-17 17:04:46', 'createTime');
INSERT INTO `sys_menu` VALUES ('3e00c4554b1c8638ad24394ec3ed652e', 'sdasd', 'sdasda', null, 'sda', '2718744ce8f349589764f488854fda30', 'asda', '0', 'ae3bb65f384d1baab9546dd6bb2853f5', '2018-08-17 17:01:03', 'sase');
INSERT INTO `sys_menu` VALUES ('3f6bb060afc29e0a0f54df823669f89d', 'ls', 'ls', null, 'ls', 'da7f533bbfa3f7ebb5144b61e6335392', null, '0', 'ae3bb65f384d1baab9546dd6bb2853f5', '2018-08-17 13:10:32', null);
INSERT INTO `sys_menu` VALUES ('4055f8ead53a0aca97340d14ecde020d', 'da大多撒大无群群', '1234567lw', null, 'sdadasdaaa', '201f486a738f567bd154c071ed22a180', null, '0', 'ae3bb65f384d1baab9546dd6bb2853f5', '2018-08-17 19:01:31', 'uuuuuuuuuuuuuu');
INSERT INTO `sys_menu` VALUES ('43194a227ed9dd28389481b9c0e05a56', 'wrrrer4', 'r4t4t55', null, null, '2718744ce8f349589764f488854fda30', null, '0', 'ae3bb65f384d1baab9546dd6bb2853f5', '2018-08-17 11:31:19', null);
INSERT INTO `sys_menu` VALUES ('4d701c7b7633a70a21d4833039e37b0a', '45645646s', '55+6', null, null, null, null, '0', 'ae3bb65f384d1baab9546dd6bb2853f5', '2018-08-17 19:05:46', null);
INSERT INTO `sys_menu` VALUES ('50b219d1e6bbe418a7e495441f5fdac8', 'DDWWE', 'EEEE', null, null, '84893aecea580399b654d6955ddf102b', null, '0', 'ae3bb65f384d1baab9546dd6bb2853f5', '2018-08-17 11:39:49', null);
INSERT INTO `sys_menu` VALUES ('53490e863c57b8ead4b46ec520288e40', '1111111', '1111', null, '111111111111', '201f486a738f567bd154c071ed22a180', '11111', '0', 'ae3bb65f384d1baab9546dd6bb2853f5', '2018-08-19 15:32:23', '11111111');
INSERT INTO `sys_menu` VALUES ('577365db17f63e4845f4487fd02a0e3e', 'kkkkkk', 'woooooo', null, '12', null, null, '0', 'ae3bb65f384d1baab9546dd6bb2853f5', '2018-08-17 09:12:38', null);
INSERT INTO `sys_menu` VALUES ('5854c967927ca729b664f097553e3918', '0303', '员工信息管理', null, '/employee/manage.do', '25b53ff33143c26bd0e47dc3681cd3c7', null, '0', 'd0ed1164987d96f819d450e04ef8e85c', '2018-07-22 13:02:13', null);
INSERT INTO `sys_menu` VALUES ('591c1cb889ada9d9f614181b7cda8976', '34', '刘书斌', null, 'www', null, '123', '0', 'ae3bb65f384d1baab9546dd6bb2853f5', '2018-08-17 11:33:58', null);
INSERT INTO `sys_menu` VALUES ('5ab71165001067c96e645a18744ddf82', '0177', '帮助/关于', null, '/userhome/about.jsp', '34370f8bccd45a0a74941559c91c0441', '77', '1', '00000000000000000000000000000000', '2018-07-18 20:50:52', '帮助/关于');
INSERT INTO `sys_menu` VALUES ('6670a68fe4fdb74963b4c38e4b0581c1', 'qqq', '刘书斌', null, 'www', '2718744ce8f349589764f488854fda30', '123', '0', 'ae3bb65f384d1baab9546dd6bb2853f5', '2018-08-17 11:33:52', null);
INSERT INTO `sys_menu` VALUES ('708411603d095ff9150411c6306bf556', 'www112', 'wwww', null, 'wwww', null, null, '0', 'ae3bb65f384d1baab9546dd6bb2853f5', '2018-08-17 12:50:47', null);
INSERT INTO `sys_menu` VALUES ('84893aecea580399b654d6955ddf102b', '打算的娃', '大晚上', null, '我都忘了 1', null, '231', '0', 'ae3bb65f384d1baab9546dd6bb2853f5', '2018-08-17 11:34:26', null);
INSERT INTO `sys_menu` VALUES ('8fa4d037b0c037588194165e693bc6cf', '阿萨德', '杨代胜', null, '大萨达', 'c9046f802a091c0b2e64136ca1a5f902', '123132', '0', 'ae3bb65f384d1baab9546dd6bb2853f5', '2018-08-19 15:31:53', '借款客户');
INSERT INTO `sys_menu` VALUES ('91b332210dd2c69a4e649934ae84eb39', 'createTimecreateTimecreateTime', 'createTime', null, 'createTime', 'bf3f46b2c004517ae9d4ef7ca46881c8', 'createTime', '0', 'ae3bb65f384d1baab9546dd6bb2853f5', '2018-08-17 17:05:26', 'createTime');
INSERT INTO `sys_menu` VALUES ('990ab88e080377db39748e701ff3ed49', '888888', '8888888', null, null, 'da7f533bbfa3f7ebb5144b61e6335392', null, '0', 'ae3bb65f384d1baab9546dd6bb2853f5', '2018-08-17 19:06:16', null);
INSERT INTO `sys_menu` VALUES ('9d19e67c55c6aa5bee1457d20ba40e8d', 'wd', 'wd1234', null, null, null, null, '0', 'ae3bb65f384d1baab9546dd6bb2853f5', '2018-08-17 18:36:05', null);
INSERT INTO `sys_menu` VALUES ('a52ebd0af374ec788874b2f6a366c38b', '呼噜娃kkkk', '123', null, 'http://tech.ifeng.com/a/20171201/44787041_0.shtml', 'd06d7303c2327df8eb6413a4cb1e46d1', null, '0', 'ae3bb65f384d1baab9546dd6bb2853f5', '2018-08-17 13:14:04', null);
INSERT INTO `sys_menu` VALUES ('a78b6af1e08f47d9c2e42347780d9987', 'rjhrhr', 'jejej', null, 'ejreje', '2718744ce8f349589764f488854fda30', 'jerjerjer', '0', 'ae3bb65f384d1baab9546dd6bb2853f5', '2018-08-17 11:46:02', 'jerjrejrejre');
INSERT INTO `sys_menu` VALUES ('a7e6a4d769e83469536480cb0982ad10', 'lw123', 'lw123', null, 'lw123', 'da7f533bbfa3f7ebb5144b61e6335392', null, '0', 'ae3bb65f384d1baab9546dd6bb2853f5', '2018-08-17 12:50:05', null);
INSERT INTO `sys_menu` VALUES ('ac48392e8ffe25393784ec5d8c5ee737', '$addForm.serialize()', '$addForm.serialize()', null, '$addForm.serialize()', '2718744ce8f349589764f488854fda30', 'v', '0', 'ae3bb65f384d1baab9546dd6bb2853f5', '2018-08-17 17:08:54', '$addForm.serialize()');
INSERT INTO `sys_menu` VALUES ('b25c4bb1d130be9800544f4dd2515746', '0301', '新员工入职', null, '/employee/add.do', '25b53ff33143c26bd0e47dc3681cd3c7', null, '0', 'd0ed1164987d96f819d450e04ef8e85c', '2018-07-22 13:00:44', null);
INSERT INTO `sys_menu` VALUES ('b5e9227acfb8f11bf864b7470b0152f0', 'qwe', 'qe', null, 'qwe', '1e27bf513f8d5b092874f225b8e715aa', null, '0', 'ae3bb65f384d1baab9546dd6bb2853f5', '2018-08-17 13:23:22', null);
INSERT INTO `sys_menu` VALUES ('b804d06bd4999ec8b024c16f392ea900', '0103', '问题反馈', null, '/userhome/feedback.jsp', '34370f8bccd45a0a74941559c91c0441', '03', '1', '00000000000000000000000000000000', '2018-07-17 13:09:10', null);
INSERT INTO `sys_menu` VALUES ('b82db5a1be8f725ab804aa9f96f3f462', '这是第二层', '002', null, null, 'bc2bcdb6140e904bedf4076bda203489', null, '0', '00000000000000000000000000000000', '2018-08-14 09:27:40', null);
INSERT INTO `sys_menu` VALUES ('bc2bcdb6140e904bedf4076bda203489', '001', '这是第一层', null, null, null, null, '0', '00000000000000000000000000000000', '2018-08-14 09:26:48', null);
INSERT INTO `sys_menu` VALUES ('bf3f46b2c004517ae9d4ef7ca46881c8', 'pengxinghao', 'pengxinghao', null, 'pengxinghao', null, 'pengxinghao', '0', 'ae3bb65f384d1baab9546dd6bb2853f5', '2018-08-17 17:01:36', 'pengxinghao');
INSERT INTO `sys_menu` VALUES ('c6f467fa37305bcbdd148f626c027dd5', '对方答复', '大风g', null, '发鬼地方df', 'da7f533bbfa3f7ebb5144b61e6335392', null, '0', 'ae3bb65f384d1baab9546dd6bb2853f5', '2018-08-17 11:30:45', null);
INSERT INTO `sys_menu` VALUES ('c894b6ccb2d684790364710b59a62991', 'sssss', 'grsssssss', null, null, null, null, '0', 'ae3bb65f384d1baab9546dd6bb2853f5', '2018-08-17 13:50:21', null);
INSERT INTO `sys_menu` VALUES ('c9046f802a091c0b2e64136ca1a5f902', '用户信息', '信息查看', null, null, null, null, '0', 'ae3bb65f384d1baab9546dd6bb2853f5', '2018-08-17 16:22:58', null);
INSERT INTO `sys_menu` VALUES ('cce84336d779ab48c1740b8bcd09cc3e', 'yuyuyuyq', 'yuyuyuy', null, 'yuyuyuy', 'ea4a70f25d2a546917b447858ed6905e', 'yuyuyuy', '0', 'ae3bb65f384d1baab9546dd6bb2853f5', '2018-08-17 19:12:22', 'yuyuyuy');
INSERT INTO `sys_menu` VALUES ('d06d7303c2327df8eb6413a4cb1e46d1', '我我我我', '12', null, null, null, null, '0', 'ae3bb65f384d1baab9546dd6bb2853f5', '2018-08-17 11:18:32', null);
INSERT INTO `sys_menu` VALUES ('d527bfab99f7ddfad49471be7b1a2583', '22222', '2222', null, null, '201f486a738f567bd154c071ed22a180', null, '0', 'ae3bb65f384d1baab9546dd6bb2853f5', '2018-08-17 13:31:21', null);
INSERT INTO `sys_menu` VALUES ('d94145cf134130c88b8406559e3c2bcb', 'yyyy', 'ppppp', null, 'qww', null, null, '0', 'ae3bb65f384d1baab9546dd6bb2853f5', '2018-08-17 11:26:41', null);
INSERT INTO `sys_menu` VALUES ('da7f533bbfa3f7ebb5144b61e6335392', 'ssss', '1sssss', null, null, '201f486a738f567bd154c071ed22a180', null, '0', 'ae3bb65f384d1baab9546dd6bb2853f5', '2018-08-17 11:27:54', null);
INSERT INTO `sys_menu` VALUES ('dbdc5dcc52c3227a7b24235a22e19383', '0302', '员工离职办理', null, '/employee/dimission.do', '25b53ff33143c26bd0e47dc3681cd3c7', null, '0', 'd0ed1164987d96f819d450e04ef8e85c', '2018-07-22 13:01:31', null);
INSERT INTO `sys_menu` VALUES ('e29c16e62182ec2ac374994e84f7b644', '9999', '999', null, '999', 'da7f533bbfa3f7ebb5144b61e6335392', '99', '0', 'ae3bb65f384d1baab9546dd6bb2853f5', '2018-08-17 13:32:25', '999');
INSERT INTO `sys_menu` VALUES ('e371c9aef5d77da81a54e61cc25d7921', '0102', '我的账号', null, '/userhome/my-account.html', '34370f8bccd45a0a74941559c91c0441', '02', '1', '00000000000000000000000000000000', '2018-07-17 13:09:10', null);
INSERT INTO `sys_menu` VALUES ('e85939014ec99f597b248ed68c9f3fc2', '普通用户', 'lw123', null, null, null, null, '0', '72b7df289d84bd086e240fc09a63ab31', '2018-08-14 09:41:26', null);
INSERT INTO `sys_menu` VALUES ('e8adc890e12524884764108df281fd1f', '6666', '666', null, '66', 'e29c16e62182ec2ac374994e84f7b644', '66', '0', 'ae3bb65f384d1baab9546dd6bb2853f5', '2018-08-17 13:32:41', '66');
INSERT INTO `sys_menu` VALUES ('ea4a70f25d2a546917b447858ed6905e', 'yuyuyuy', 'yuyuyuy', null, 'yuyuyuy', null, 'yuyuyuy', '0', 'ae3bb65f384d1baab9546dd6bb2853f5', '2018-08-17 19:11:46', null);
INSERT INTO `sys_menu` VALUES ('f2b3fc5e52490e888fc40d7a602eeef5', '0108', '修改密保邮箱', null, '/userhome/modify-security-email.jsp', '34370f8bccd45a0a74941559c91c0441', '08', '1', '00000000000000000000000000000000', '2018-07-17 13:09:10', null);
INSERT INTO `sys_menu` VALUES ('f4c93085989b071b4df4bb268ef5fdc8', 'createTime', 'createTime', null, 'createTime', 'f5b7d491ff0b2b3bcd2477c6ed5c9076', 'createTime', '0', 'ae3bb65f384d1baab9546dd6bb2853f5', '2018-08-17 17:03:41', 'createTime');
INSERT INTO `sys_menu` VALUES ('f5b7d491ff0b2b3bcd2477c6ed5c9076', '213123', '3213123', null, null, '3f6bb060afc29e0a0f54df823669f89d', null, '0', 'ae3bb65f384d1baab9546dd6bb2853f5', '2018-08-17 13:12:14', null);
INSERT INTO `sys_menu` VALUES ('fa3568af948476192034801670806e4b', '1', '兰望123', null, 'sdadasdaaa', '201f486a738f567bd154c071ed22a180', null, '0', 'ae3bb65f384d1baab9546dd6bb2853f5', '2018-08-19 15:44:26', 'u8u');
INSERT INTO `sys_menu` VALUES ('fff988a6f0e528787af4ca9a57575f8a', 'aaaaaaaaaa', '杨代胜', null, '大萨达', '577365db17f63e4845f4487fd02a0e3e', '阿萨德', '0', 'ae3bb65f384d1baab9546dd6bb2853f5', '2018-08-19 12:13:43', '大萨达');
