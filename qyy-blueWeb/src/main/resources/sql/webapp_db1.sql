/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50096
Source Host           : localhost:3306
Source Database       : webapp_db

Target Server Type    : MYSQL
Target Server Version : 50096
File Encoding         : 65001

Date: 2015-05-22 18:28:01
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_sys_login`
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_login`;
CREATE TABLE `t_sys_login` (
  `id` int(11) NOT NULL auto_increment,
  `stutas` varchar(8) NOT NULL default 'ADD',
  `login_name` varchar(255) NOT NULL,
  `login_pwd` varchar(255) NOT NULL,
  `is_ban` int(4) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `UK_LOGIN_LOGIN_NAME` (`login_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sys_login
-- ----------------------------
INSERT INTO `t_sys_login` VALUES ('1', 'ADD', 'admin', '21232f297a57a5a743894a0e4a801fc3', '0');

-- ----------------------------
-- Table structure for `t_sys_menu`
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_menu`;
CREATE TABLE `t_sys_menu` (
  `id` int(11) NOT NULL auto_increment COMMENT '主键，自增',
  `stutas` varchar(8) NOT NULL default 'ADD' COMMENT '数据状态',
  `menu_key` varchar(32) NOT NULL COMMENT '菜单的key',
  `menu_name` varchar(32) NOT NULL COMMENT '菜单的名称',
  `is_root` int(4) NOT NULL default '1' COMMENT '是否根节点(1:否  0:是)',
  `is_parent` int(4) NOT NULL default '1' COMMENT '是否父节点(1:否  0:是)',
  `parent_key` varchar(32) default NULL COMMENT '父节点的key',
  `menu_icon` varchar(100) default NULL,
  `menu_path` varchar(100) default NULL COMMENT '菜单的path',
  `menu_type` int(4) NOT NULL COMMENT '菜单类型(横排类型)',
  `menu_order` int(11) default NULL COMMENT '菜单排序',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sys_menu
-- ----------------------------
INSERT INTO `t_sys_menu` VALUES ('1', 'ADD', '0000', '系统管理', '1', '0', null, 'icon-desktop', null, '1', '1');
INSERT INTO `t_sys_menu` VALUES ('2', 'ADD', '0000_0000', '菜单管理', '1', '1', '0000', '', 'menu/main', '1', '1');
INSERT INTO `t_sys_menu` VALUES ('3', 'ADD', '0000_0001', '用户管理', '1', '1', '0000', null, 'home/user', '1', '2');
INSERT INTO `t_sys_menu` VALUES ('4', 'ADD', '0000_0002', '角色管理', '1', '1', '0000', null, 'home/role', '1', '3');
INSERT INTO `t_sys_menu` VALUES ('5', 'ADD', '0001', '日志管理', '1', '0', null, 'icon-list-alt', null, '1', '2');
INSERT INTO `t_sys_menu` VALUES ('6', 'ADD', '0001_0000', '系统日志', '1', '1', '0001', null, 'home/edit', '1', null);
INSERT INTO `t_sys_menu` VALUES ('7', 'ADD', '0001_0001', '业务日志', '1', '1', '0001', null, 'home/logs', '1', null);

-- ----------------------------
-- Table structure for `t_sys_menu_right`
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_menu_right`;
CREATE TABLE `t_sys_menu_right` (
  `id` int(11) NOT NULL auto_increment,
  `stutas` varchar(8) NOT NULL default 'ADD',
  `menu_key` varchar(32) NOT NULL COMMENT '菜单的key',
  `right_keys` varchar(1024) NOT NULL default 'SEL_0,ADD_0,UPD_0,DEL_0,ECL_0' COMMENT '当前菜单中的所有权限keys',
  `model` varchar(100) NOT NULL default 'default' COMMENT '默认的全部权限',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sys_menu_right
-- ----------------------------
INSERT INTO `t_sys_menu_right` VALUES ('1', 'ADD', '0000_0000', 'SEL_0,ADD_0,UPD_0,DEL_0', 'default');
INSERT INTO `t_sys_menu_right` VALUES ('2', 'ADD', '0000_0001', 'SEL_0,ADD_0,UPD_0,DEL_0,ECL_0', 'default');
INSERT INTO `t_sys_menu_right` VALUES ('3', 'ADD', '0000_0002', 'SEL_0,ADD_0,UPD_0,DEL_0,ECL_0', 'default');
INSERT INTO `t_sys_menu_right` VALUES ('4', 'ADD', '0001_0000', 'SEL_0,ADD_0,UPD_0,DEL_0,ECL_0', 'default');
INSERT INTO `t_sys_menu_right` VALUES ('5', 'ADD', '0001_0001', 'SEL_0,ADD_0,UPD_0,DEL_0,ECL_0', 'default');
INSERT INTO `t_sys_menu_right` VALUES ('6', 'ADD', '0001_0001', 'SEL_0,ECL_0', 'none');

-- ----------------------------
-- Table structure for `t_sys_right`
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_right`;
CREATE TABLE `t_sys_right` (
  `id` int(100) NOT NULL auto_increment,
  `stutas` varchar(8) NOT NULL default 'ADD',
  `right_key` varchar(100) NOT NULL COMMENT '权限key',
  `right_name` varchar(100) NOT NULL COMMENT '权限名',
  `right_code` int(12) NOT NULL COMMENT '权限的编号',
  `right_btn` varchar(32) default NULL COMMENT '权限btn的id',
  `right_css` varchar(100) default NULL COMMENT '权限的css',
  `right_img` varchar(100) default NULL COMMENT '权限的图片css',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sys_right
-- ----------------------------
INSERT INTO `t_sys_right` VALUES ('1', 'ADD', 'SEL_0', '查询', '1', 'oper_searchBtn', 'btn btn-mini btn-light', 'icon-search');
INSERT INTO `t_sys_right` VALUES ('2', 'ADD', 'ADD_0', '添加', '2', 'oper_addBtn', 'btn btn-mini btn-success', 'icon-pencil');
INSERT INTO `t_sys_right` VALUES ('3', 'ADD', 'UPD_0', '编辑', '3', 'oper_editBtn', 'btn btn-mini btn-purple', 'icon-edit');
INSERT INTO `t_sys_right` VALUES ('4', 'ADD', 'DEL_0', '删除', '4', 'oper_trashBtn', 'btn btn-mini btn-danger', 'icon-trash');
INSERT INTO `t_sys_right` VALUES ('5', 'ADD', 'ECL_0', '导出到EXCEL', '5', 'oper_excelBtn', 'btn btn-mini btn-grey', 'icon-download-alt');

-- ----------------------------
-- Table structure for `t_sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_role`;
CREATE TABLE `t_sys_role` (
  `id` int(11) NOT NULL auto_increment,
  `stutas` varchar(8) NOT NULL default 'ADD',
  `role_key` varchar(100) NOT NULL COMMENT '角色key',
  `role_name` varchar(100) NOT NULL COMMENT '角色名',
  `parent_key` varchar(100) default NULL COMMENT '当前角色的父节点key',
  `menu_keys` varchar(2048) NOT NULL COMMENT '所有菜单的key',
  `menu_right_model` varchar(100) NOT NULL COMMENT '菜单权限的model,对应关系',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sys_role
-- ----------------------------
INSERT INTO `t_sys_role` VALUES ('1', 'ADD', 'SYSTEM', '系统管理员', null, 'ALL', 'default');
INSERT INTO `t_sys_role` VALUES ('2', 'ADD', 'SUPER', '超级管理员', null, 'ALL', 'default');
INSERT INTO `t_sys_role` VALUES ('3', 'ADD', 'OBSERVER', '观察者', null, '0001,0001_0001', 'none');

-- ----------------------------
-- Table structure for `t_sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_user`;
CREATE TABLE `t_sys_user` (
  `id` int(11) NOT NULL auto_increment COMMENT '用户id,程序处理',
  `stutas` varchar(8) NOT NULL default 'ADD',
  `user_id` varchar(100) NOT NULL default '用户id',
  `login_name` varchar(255) NOT NULL COMMENT '登录名',
  `name` varchar(255) NOT NULL COMMENT '姓名',
  `email` varchar(255) NOT NULL COMMENT '邮箱',
  `phone` varchar(255) NOT NULL COMMENT '电话',
  `is_ban` int(4) NOT NULL default '1' COMMENT '是否禁止登录（0：是 1：否）',
  `last_login_ip` varchar(100) default NULL COMMENT '最后一次登陆的ip',
  `last_login_time` datetime default NULL COMMENT '最后登录的时间',
  `role_key` varchar(100) NOT NULL COMMENT '角色的key',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `UK_USER_USER_ID` (`user_id`),
  UNIQUE KEY `UK_USER_USER_LOGIN_NAME` (`login_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sys_user
-- ----------------------------
INSERT INTO `t_sys_user` VALUES ('1', 'ADD', '3246d04a004147d59b14ba282887d700', 'admin', '系统管理大大', '123@123.com', '12312312312', '0', '127.0.0.1', '2015-05-22 11:30:55', 'SYSTEM');
