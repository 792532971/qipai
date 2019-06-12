/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50553
 Source Host           : localhost:3306
 Source Schema         : qipai

 Target Server Type    : MySQL
 Target Server Version : 50553
 File Encoding         : 65001

 Date: 12/06/2019 16:46:31
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名称',
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户密码',
  `sex` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '性别：0=男，1=女',
  `mobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户邮箱',
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `groupid` int(20) UNSIGNED NOT NULL COMMENT '用户组ID',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '管理员状态:0=正常，1=禁用',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '注册时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `coin` decimal(11, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 57 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', 0, '18981009188', 'lt1233@outlook.com', '至尊级权限,大老板的享受.', 1, 0, '0000-00-00 00:00:00', '2018-11-15 15:05:51', 1.02);
INSERT INTO `admin` VALUES (2, 'admin1', 'e10adc3949ba59abbe56e057f20f883e', 0, '17608031234', '456@163.com', '我就是一个普通的文艺青年', 7, 0, '0000-00-00 00:00:00', NULL, NULL);
INSERT INTO `admin` VALUES (3, 'admin2', 'e10adc3949ba59abbe56e057f20f883e', 0, '17608031234', '456@163.com', '我奶乡镇文艺标兵', 7, 0, '0000-00-00 00:00:00', NULL, NULL);
INSERT INTO `admin` VALUES (4, 'admin3', 'e10adc3949ba59abbe56e057f20f883e', 0, '13882568987', '6546@126.com', '乡村老尸恐怖大片,让你一次性看个够', 7, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL);
INSERT INTO `admin` VALUES (5, 'admin4', '25f9e794323b453885f5181f1b624d0b', 0, '17608031234', '446@qq.com', '此人思想肮脏,滚粗', 6, 0, '0000-00-00 00:00:00', NULL, NULL);

-- ----------------------------
-- Table structure for admin_login_log
-- ----------------------------
DROP TABLE IF EXISTS `admin_login_log`;
CREATE TABLE `admin_login_log`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `admin_id` int(10) UNSIGNED NOT NULL,
  `ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录IP',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '登录时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 157 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_login_log
-- ----------------------------
INSERT INTO `admin_login_log` VALUES (27, 2, '192.168.31.115', '0000-00-00 00:00:00');
INSERT INTO `admin_login_log` VALUES (28, 1, '192.168.31.115', '0000-00-00 00:00:00');
INSERT INTO `admin_login_log` VALUES (29, 1, '192.168.31.115', '0000-00-00 00:00:00');
INSERT INTO `admin_login_log` VALUES (30, 1, '192.168.31.115', '0000-00-00 00:00:00');
INSERT INTO `admin_login_log` VALUES (31, 2, '192.168.31.115', '0000-00-00 00:00:00');
INSERT INTO `admin_login_log` VALUES (32, 2, '192.168.31.115', '0000-00-00 00:00:00');
INSERT INTO `admin_login_log` VALUES (33, 2, '192.168.31.115', '0000-00-00 00:00:00');
INSERT INTO `admin_login_log` VALUES (34, 1, '192.168.31.115', '0000-00-00 00:00:00');
INSERT INTO `admin_login_log` VALUES (35, 1, '192.168.31.115', '0000-00-00 00:00:00');
INSERT INTO `admin_login_log` VALUES (36, 1, '192.168.31.115', '0000-00-00 00:00:00');
INSERT INTO `admin_login_log` VALUES (37, 1, '192.168.31.115', '0000-00-00 00:00:00');
INSERT INTO `admin_login_log` VALUES (38, 1, '192.168.31.115', '0000-00-00 00:00:00');
INSERT INTO `admin_login_log` VALUES (39, 1, '192.168.31.115', '0000-00-00 00:00:00');
INSERT INTO `admin_login_log` VALUES (40, 1, '192.168.31.115', '0000-00-00 00:00:00');
INSERT INTO `admin_login_log` VALUES (41, 1, '192.168.31.115', '0000-00-00 00:00:00');
INSERT INTO `admin_login_log` VALUES (42, 1, '192.168.31.27', '0000-00-00 00:00:00');
INSERT INTO `admin_login_log` VALUES (43, 1, '192.168.31.68', '0000-00-00 00:00:00');
INSERT INTO `admin_login_log` VALUES (44, 1, '192.168.31.115', '0000-00-00 00:00:00');
INSERT INTO `admin_login_log` VALUES (45, 1, '192.168.31.115', '0000-00-00 00:00:00');
INSERT INTO `admin_login_log` VALUES (46, 1, '192.168.31.115', '0000-00-00 00:00:00');
INSERT INTO `admin_login_log` VALUES (47, 1, '192.168.31.115', '0000-00-00 00:00:00');
INSERT INTO `admin_login_log` VALUES (48, 1, '192.168.31.115', '0000-00-00 00:00:00');
INSERT INTO `admin_login_log` VALUES (49, 1, '192.168.31.115', '0000-00-00 00:00:00');
INSERT INTO `admin_login_log` VALUES (50, 1, '192.168.31.115', '0000-00-00 00:00:00');
INSERT INTO `admin_login_log` VALUES (51, 1, '192.168.31.115', '0000-00-00 00:00:00');
INSERT INTO `admin_login_log` VALUES (52, 1, '192.168.31.115', '0000-00-00 00:00:00');
INSERT INTO `admin_login_log` VALUES (53, 1, '192.168.31.115', '0000-00-00 00:00:00');
INSERT INTO `admin_login_log` VALUES (54, 1, '192.168.31.115', '0000-00-00 00:00:00');
INSERT INTO `admin_login_log` VALUES (55, 1, '192.168.31.115', '0000-00-00 00:00:00');
INSERT INTO `admin_login_log` VALUES (56, 1, '192.168.31.115', '0000-00-00 00:00:00');
INSERT INTO `admin_login_log` VALUES (57, 1, '192.168.31.115', '0000-00-00 00:00:00');
INSERT INTO `admin_login_log` VALUES (58, 1, '192.168.31.115', '0000-00-00 00:00:00');
INSERT INTO `admin_login_log` VALUES (59, 1, '192.168.31.115', '0000-00-00 00:00:00');
INSERT INTO `admin_login_log` VALUES (60, 1, '192.168.31.27', '0000-00-00 00:00:00');
INSERT INTO `admin_login_log` VALUES (61, 1, '192.168.4.109', '0000-00-00 00:00:00');
INSERT INTO `admin_login_log` VALUES (62, 1, '192.168.4.109', '0000-00-00 00:00:00');
INSERT INTO `admin_login_log` VALUES (63, 1, '192.168.4.110', '0000-00-00 00:00:00');
INSERT INTO `admin_login_log` VALUES (64, 1, '192.168.4.198', '0000-00-00 00:00:00');
INSERT INTO `admin_login_log` VALUES (65, 2, '192.168.4.110', '0000-00-00 00:00:00');
INSERT INTO `admin_login_log` VALUES (66, 1, '192.168.4.110', '0000-00-00 00:00:00');
INSERT INTO `admin_login_log` VALUES (67, 1, '192.168.4.109', '0000-00-00 00:00:00');
INSERT INTO `admin_login_log` VALUES (68, 1, '192.168.4.109', '0000-00-00 00:00:00');
INSERT INTO `admin_login_log` VALUES (69, 1, '192.168.4.109', '0000-00-00 00:00:00');
INSERT INTO `admin_login_log` VALUES (70, 1, '192.168.4.109', '2018-11-08 17:29:07');
INSERT INTO `admin_login_log` VALUES (71, 1, '192.168.4.109', '2018-11-08 17:29:39');
INSERT INTO `admin_login_log` VALUES (72, 1, '192.168.4.109', '2018-11-08 17:38:46');
INSERT INTO `admin_login_log` VALUES (73, 1, '192.168.4.110', '2018-11-09 10:31:39');
INSERT INTO `admin_login_log` VALUES (74, 1, '192.168.4.110', '2018-11-09 10:40:15');
INSERT INTO `admin_login_log` VALUES (75, 1, '192.168.4.110', '2018-11-09 11:18:00');
INSERT INTO `admin_login_log` VALUES (76, 2, '192.168.4.110', '2018-11-09 14:12:18');
INSERT INTO `admin_login_log` VALUES (77, 1, '192.168.4.110', '2018-11-09 14:12:44');
INSERT INTO `admin_login_log` VALUES (78, 1, '192.168.4.110', '2018-11-09 14:14:07');
INSERT INTO `admin_login_log` VALUES (79, 2, '192.168.4.110', '2018-11-09 14:14:34');
INSERT INTO `admin_login_log` VALUES (80, 5, '192.168.4.110', '2018-11-09 14:18:22');
INSERT INTO `admin_login_log` VALUES (81, 5, '192.168.4.110', '2018-11-09 14:20:37');
INSERT INTO `admin_login_log` VALUES (82, 1, '192.168.4.110', '2018-11-09 14:20:58');
INSERT INTO `admin_login_log` VALUES (83, 1, '192.168.4.110', '2018-11-09 15:13:45');
INSERT INTO `admin_login_log` VALUES (84, 1, '192.168.4.109', '2018-11-10 10:22:58');
INSERT INTO `admin_login_log` VALUES (85, 1, '192.168.4.109', '2018-11-12 09:39:02');
INSERT INTO `admin_login_log` VALUES (86, 1, '192.168.4.109', '2018-11-12 13:46:30');
INSERT INTO `admin_login_log` VALUES (87, 1, '192.168.4.109', '2018-11-12 13:47:49');
INSERT INTO `admin_login_log` VALUES (88, 1, '192.168.4.109', '2018-11-12 13:48:13');
INSERT INTO `admin_login_log` VALUES (89, 1, '192.168.4.109', '2018-11-12 13:49:00');
INSERT INTO `admin_login_log` VALUES (90, 1, '192.168.4.109', '2018-11-12 13:51:21');
INSERT INTO `admin_login_log` VALUES (91, 1, '192.168.4.109', '2018-11-12 14:05:57');
INSERT INTO `admin_login_log` VALUES (92, 1, '192.168.4.109', '2018-11-12 14:06:31');
INSERT INTO `admin_login_log` VALUES (93, 1, '192.168.4.109', '2018-11-12 14:23:45');
INSERT INTO `admin_login_log` VALUES (94, 1, '192.168.4.109', '2018-11-12 16:42:05');
INSERT INTO `admin_login_log` VALUES (95, 1, '192.168.4.109', '2018-11-12 16:42:56');
INSERT INTO `admin_login_log` VALUES (96, 1, '192.168.4.109', '2018-11-12 16:44:42');
INSERT INTO `admin_login_log` VALUES (97, 1, '192.168.4.109', '2018-11-13 09:05:17');
INSERT INTO `admin_login_log` VALUES (98, 1, '192.168.4.109', '2018-11-13 09:12:50');
INSERT INTO `admin_login_log` VALUES (99, 1, '192.168.4.109', '2018-11-13 09:18:04');
INSERT INTO `admin_login_log` VALUES (100, 1, '192.168.4.109', '2018-11-13 09:18:45');
INSERT INTO `admin_login_log` VALUES (101, 1, '192.168.4.109', '2018-11-13 09:19:38');
INSERT INTO `admin_login_log` VALUES (102, 1, '192.168.4.109', '2018-11-13 09:26:10');
INSERT INTO `admin_login_log` VALUES (103, 1, '192.168.4.109', '2018-11-13 09:27:27');
INSERT INTO `admin_login_log` VALUES (104, 2, '192.168.4.109', '2018-11-13 09:30:35');
INSERT INTO `admin_login_log` VALUES (105, 1, '192.168.4.109', '2018-11-13 10:29:21');
INSERT INTO `admin_login_log` VALUES (106, 1, '192.168.4.109', '2018-11-13 11:06:14');
INSERT INTO `admin_login_log` VALUES (107, 1, '192.168.4.109', '2018-11-13 14:59:53');
INSERT INTO `admin_login_log` VALUES (108, 1, '192.168.4.109', '2018-11-14 09:22:24');
INSERT INTO `admin_login_log` VALUES (109, 1, '192.168.4.109', '2018-11-14 10:42:58');
INSERT INTO `admin_login_log` VALUES (110, 1, '192.168.4.109', '2018-11-14 14:17:35');
INSERT INTO `admin_login_log` VALUES (111, 1, '192.168.4.109', '2018-11-15 14:07:40');
INSERT INTO `admin_login_log` VALUES (112, 2, '192.168.4.109', '2018-11-15 15:06:16');
INSERT INTO `admin_login_log` VALUES (113, 1, '192.168.4.109', '2018-11-15 15:07:07');
INSERT INTO `admin_login_log` VALUES (114, 2, '192.168.4.109', '2018-11-15 15:08:03');
INSERT INTO `admin_login_log` VALUES (115, 1, '192.168.4.109', '2018-11-15 15:08:49');
INSERT INTO `admin_login_log` VALUES (116, 1, '192.168.4.109', '2018-11-15 15:33:15');
INSERT INTO `admin_login_log` VALUES (117, 2, '192.168.4.109', '2018-11-15 15:53:31');
INSERT INTO `admin_login_log` VALUES (118, 1, '192.168.4.109', '2018-11-15 15:58:58');
INSERT INTO `admin_login_log` VALUES (119, 2, '192.168.4.109', '2018-11-15 15:59:40');
INSERT INTO `admin_login_log` VALUES (120, 1, '192.168.4.123', '2018-11-16 09:11:49');
INSERT INTO `admin_login_log` VALUES (121, 1, '192.168.4.109', '2018-11-16 09:11:53');
INSERT INTO `admin_login_log` VALUES (122, 1, '192.168.4.109', '2018-11-17 09:08:21');
INSERT INTO `admin_login_log` VALUES (123, 1, '192.168.4.109', '2018-11-19 09:00:53');
INSERT INTO `admin_login_log` VALUES (124, 1, '192.168.4.109', '2018-11-20 10:25:20');
INSERT INTO `admin_login_log` VALUES (125, 1, '192.168.4.109', '2018-11-22 10:14:03');
INSERT INTO `admin_login_log` VALUES (126, 1, '192.168.4.109', '2018-11-22 17:35:04');
INSERT INTO `admin_login_log` VALUES (127, 1, '192.168.4.109', '2018-11-22 17:43:23');
INSERT INTO `admin_login_log` VALUES (128, 1, '192.168.4.109', '2018-11-22 17:55:24');
INSERT INTO `admin_login_log` VALUES (129, 1, '192.168.4.109', '2018-11-23 09:11:40');
INSERT INTO `admin_login_log` VALUES (130, 1, '192.168.4.109', '2018-11-23 15:03:50');
INSERT INTO `admin_login_log` VALUES (131, 1, '192.168.4.109', '2018-11-24 10:39:15');
INSERT INTO `admin_login_log` VALUES (132, 1, '192.168.4.109', '2018-12-04 10:11:39');
INSERT INTO `admin_login_log` VALUES (133, 1, '192.168.4.109', '2018-12-04 18:42:42');
INSERT INTO `admin_login_log` VALUES (134, 1, '192.168.4.109', '2018-12-05 09:29:02');
INSERT INTO `admin_login_log` VALUES (135, 1, '127.0.0.1', '2018-12-05 09:44:43');
INSERT INTO `admin_login_log` VALUES (136, 1, '127.0.0.1', '2018-12-05 09:57:43');
INSERT INTO `admin_login_log` VALUES (137, 1, '127.0.0.1', '2018-12-05 16:40:01');
INSERT INTO `admin_login_log` VALUES (138, 1, '192.168.4.109', '2018-12-06 16:08:20');
INSERT INTO `admin_login_log` VALUES (139, 1, '127.0.0.1', '2018-12-06 16:10:34');
INSERT INTO `admin_login_log` VALUES (140, 1, '127.0.0.1', '2018-12-07 15:34:58');
INSERT INTO `admin_login_log` VALUES (141, 1, '127.0.0.1', '2018-12-08 15:44:22');
INSERT INTO `admin_login_log` VALUES (142, 1, '127.0.0.1', '2018-12-10 09:41:33');
INSERT INTO `admin_login_log` VALUES (143, 1, '127.0.0.1', '2018-12-10 15:04:53');
INSERT INTO `admin_login_log` VALUES (144, 1, '127.0.0.1', '2018-12-11 09:31:09');
INSERT INTO `admin_login_log` VALUES (145, 1, '127.0.0.1', '2018-12-12 09:09:36');
INSERT INTO `admin_login_log` VALUES (146, 1, '127.0.0.1', '2018-12-12 10:04:42');
INSERT INTO `admin_login_log` VALUES (147, 1, '127.0.0.1', '2018-12-15 10:11:55');
INSERT INTO `admin_login_log` VALUES (148, 1, '127.0.0.1', '2018-12-17 09:11:16');
INSERT INTO `admin_login_log` VALUES (149, 1, '127.0.0.1', '2018-12-18 09:03:17');
INSERT INTO `admin_login_log` VALUES (150, 1, '127.0.0.1', '2018-12-18 18:08:09');
INSERT INTO `admin_login_log` VALUES (151, 1, '127.0.0.1', '2018-12-18 18:08:39');
INSERT INTO `admin_login_log` VALUES (152, 1, '127.0.0.1', '2018-12-19 09:10:07');
INSERT INTO `admin_login_log` VALUES (153, 1, '127.0.0.1', '2018-12-21 09:03:12');
INSERT INTO `admin_login_log` VALUES (154, 1, '192.168.4.109', '2019-02-11 10:14:53');
INSERT INTO `admin_login_log` VALUES (155, 1, '192.168.4.109', '2019-02-12 14:08:36');
INSERT INTO `admin_login_log` VALUES (156, 1, '127.0.0.1', '2019-06-12 15:50:39');

-- ----------------------------
-- Table structure for agent
-- ----------------------------
DROP TABLE IF EXISTS `agent`;
CREATE TABLE `agent`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '账号',
  `sex` tinyint(255) UNSIGNED NULL DEFAULT 0,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `bank` decimal(18, 2) UNSIGNED NULL DEFAULT 0.00,
  `coin` decimal(11, 2) NULL DEFAULT 0.00 COMMENT '金币',
  `node_status` int(255) UNSIGNED NULL DEFAULT 0 COMMENT '0=男，1=女',
  `bank_card` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机',
  `photo` int(11) NULL DEFAULT 1 COMMENT '头像',
  `vip_exp` int(11) NULL DEFAULT 0 COMMENT 'vip经验',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '注册时间',
  `last_time` datetime NULL DEFAULT NULL COMMENT '上次登录时间',
  `active_time` datetime NULL DEFAULT NULL COMMENT '最新活跃时间',
  `active_ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活跃IP',
  `create_ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '注册ip',
  `lft` int(11) UNSIGNED NULL DEFAULT 1 COMMENT '左节点',
  `rgt` int(11) UNSIGNED NULL DEFAULT 2 COMMENT '右节点',
  `status` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '0游客，1正式',
  `lock` int(11) NULL DEFAULT 0 COMMENT '是否锁定，锁定后会员将无法登陆',
  `parent_id` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '父级id',
  `agent` tinyint(2) UNSIGNED NULL DEFAULT 0 COMMENT '代理0，用户1',
  `test` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 226 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of agent
-- ----------------------------
INSERT INTO `agent` VALUES (212, '老子天下第三', 'admin3344', 0, 'e10adc3949ba59abbe56e057f20f883e', 0.00, 0.00, 0, NULL, '13980717899', 1, 0, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 6, 7, 0, 0, 213, 0, NULL);
INSERT INTO `agent` VALUES (213, '老大', 'admin', 0, 'e10adc3949ba59abbe56e057f20f883e', 0.00, 10.00, 0, NULL, NULL, 1, 0, NULL, NULL, NULL, '127.0.0.1', NULL, 1, 8, 0, 0, 0, 0, NULL);
INSERT INTO `agent` VALUES (215, '代理一号', 'agent165', 0, 'e10adc3949ba59abbe56e057f20f883e', 0.00, 0.00, 0, NULL, '13800000000', 1, 0, '0000-00-00 00:00:00', NULL, NULL, '127.0.0.1', '127.0.0.1', 9, 18, 1, 0, 0, 0, NULL);
INSERT INTO `agent` VALUES (216, '啊是哒是哒撒打破', 'user123456', 0, 'e10adc3949ba59abbe56e057f20f883e', 0.00, 0.00, 0, NULL, '13800000000', 1, 0, '0000-00-00 00:00:00', NULL, NULL, NULL, '127.0.0.1', 12, 17, 1, 0, 215, 0, NULL);
INSERT INTO `agent` VALUES (217, '代理一号一号', 'user12344', 0, 'e10adc3949ba59abbe56e057f20f883e', 0.00, 0.00, 0, NULL, '13800000000', 1, 0, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 4, 5, 0, 0, 213, 0, NULL);

-- ----------------------------
-- Table structure for article_cate
-- ----------------------------
DROP TABLE IF EXISTS `article_cate`;
CREATE TABLE `article_cate`  (
  `id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `catename` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of article_cate
-- ----------------------------
INSERT INTO `article_cate` VALUES (1, '文章');
INSERT INTO `article_cate` VALUES (2, '新闻');
INSERT INTO `article_cate` VALUES (4, '广告');

-- ----------------------------
-- Table structure for article_list
-- ----------------------------
DROP TABLE IF EXISTS `article_list`;
CREATE TABLE `article_list`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '文章ID',
  `uid` int(10) UNSIGNED NOT NULL COMMENT '管理员id',
  `cate_id` int(10) UNSIGNED NOT NULL COMMENT '文章分类',
  `author` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '作者',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文章名称',
  `s_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '小标题',
  `img_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片保存路径',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '文章更新时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '文章更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 63 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of article_list
-- ----------------------------
INSERT INTO `article_list` VALUES (53, 0, 4, '', '萨达撒上', '爱上大飒飒', 'http://test.liao.cn:89/uploads/20181219/0d78821157dbf2a1c43504a77fa7910f.jpg', 1, '2018-12-19 15:35:37', NULL);
INSERT INTO `article_list` VALUES (54, 0, 1, '', '啊实打实', '我是谁', 'http://test.liao.cn:89/uploads/20181219/671e5b27bd65837fcd4805a983bb67b8.jpg', 0, '2018-12-19 15:35:30', NULL);
INSERT INTO `article_list` VALUES (55, 0, 2, '', '啊实打实', '撒大声地', 'http://test.liao.cn:89/uploads/20181219/8488d3cd37c0a5ce57f28fd88fa43a4b.jpg', 0, '2018-12-19 15:35:24', NULL);
INSERT INTO `article_list` VALUES (56, 0, 1, '', '啊实打实大萨达撒是个耳光', '12312请问', 'http://test.liao.cn:89/uploads/20181219/73a7c510d05560c2dc75f89315e25712.jpg', 0, '2018-12-19 15:35:17', NULL);
INSERT INTO `article_list` VALUES (57, 0, 1, '', '阿萨达', '2131', 'http://test.liao.cn:89/uploads/20181219/f48c9b41b86d52d0cc6a40a4ab1eb264.jpg', 0, '2018-12-19 15:35:11', NULL);
INSERT INTO `article_list` VALUES (58, 0, 4, '', '啊实打实', '12312', 'http://test.liao.cn:89/uploads/20181219/f875bdedfd7111369077d4a137a70214.jpg', 0, '2018-12-19 15:35:04', NULL);
INSERT INTO `article_list` VALUES (59, 0, 4, '', '啊实打实大萨达撒是个耳光', '驱蚊器', 'http://test.liao.cn:89/uploads/20181219/aa2e00e99f1e5e03398663a2b07cc31d.jpg', 0, '2018-12-19 15:34:58', NULL);
INSERT INTO `article_list` VALUES (60, 0, 1, '', '啊实打实', '我去二群无', 'http://test.liao.cn:89/uploads/20181219/c1743a76b9f532f8bb7fcba13af9ea93.jpg', 0, '2018-12-19 15:34:50', NULL);
INSERT INTO `article_list` VALUES (61, 0, 1, '', 'poii', 'opo[图', 'http://test.liao.cn:89/uploads/20181219/2aacf341233444a776a891c0adea7fd5.jpg', 0, '2018-12-19 15:34:39', NULL);
INSERT INTO `article_list` VALUES (62, 0, 1, 'admin', 'sadasda', 'asdasdas', 'http://test.liao.cn:89/uploads/20181219/77d6d9eed9da07f6e52a639f6696532d.jpg', 0, '2018-12-19 15:36:19', NULL);

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户组ID',
  `title` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '规则名称',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态：0=开启，1=关闭',
  `rules` char(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '规则（所对应的是规则表的id）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of auth_group
-- ----------------------------
INSERT INTO `auth_group` VALUES (1, '超级管理员', 0, '35,36,38,39,46,45,40,41,42,43,44,47,48,49,50,51,52,53,54,55,56');
INSERT INTO `auth_group` VALUES (6, '小小管理员', 0, '14,22,26,31,32');
INSERT INTO `auth_group` VALUES (7, '普通管理员', 0, '35,36,38,39,46,45,40,41,42,43,44,47,48,49,50,51,52,53,54,55,56,57');

-- ----------------------------
-- Table structure for auth_group_access
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_access`;
CREATE TABLE `auth_group_access`  (
  `uid` mediumint(8) UNSIGNED NOT NULL COMMENT '用户ID',
  `group_id` mediumint(8) UNSIGNED NOT NULL COMMENT '用户组ID',
  UNIQUE INDEX `uid_group_id`(`uid`, `group_id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `group_id`(`group_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of auth_group_access
-- ----------------------------
INSERT INTO `auth_group_access` VALUES (1, 1);
INSERT INTO `auth_group_access` VALUES (2, 7);
INSERT INTO `auth_group_access` VALUES (35, 2);
INSERT INTO `auth_group_access` VALUES (37, 2);
INSERT INTO `auth_group_access` VALUES (39, 2);
INSERT INTO `auth_group_access` VALUES (41, 1);
INSERT INTO `auth_group_access` VALUES (44, 2);
INSERT INTO `auth_group_access` VALUES (45, 2);
INSERT INTO `auth_group_access` VALUES (46, 2);
INSERT INTO `auth_group_access` VALUES (47, 2);
INSERT INTO `auth_group_access` VALUES (47, 3);
INSERT INTO `auth_group_access` VALUES (48, 1);
INSERT INTO `auth_group_access` VALUES (49, 1);
INSERT INTO `auth_group_access` VALUES (50, 7);
INSERT INTO `auth_group_access` VALUES (51, 7);
INSERT INTO `auth_group_access` VALUES (52, 6);

-- ----------------------------
-- Table structure for auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `auth_rule`;
CREATE TABLE `auth_rule`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '规则表ID',
  `name` char(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '路径（控制器/方法）',
  `title` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '规则名称例如:管理员添加,修改,删除',
  `type` tinyint(1) NOT NULL DEFAULT 1,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '状态：0=开启，1=关闭',
  `condition` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '规则表达式，为空表示存在就验证，不为空表示按照条件验证',
  `pid` int(10) UNSIGNED NULL DEFAULT 0,
  `show` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 58 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of auth_rule
-- ----------------------------
INSERT INTO `auth_rule` VALUES (35, 'admin/index', '管理员列表', 1, 0, '', 0, 0);
INSERT INTO `auth_rule` VALUES (36, 'admin/add', '管理员添加', 1, 0, '', 35, 0);
INSERT INTO `auth_rule` VALUES (38, 'admin/del', '管理员删除', 1, 0, '', 35, 0);
INSERT INTO `auth_rule` VALUES (39, 'admin/edit', '管理员编辑', 1, 0, '', 35, 0);
INSERT INTO `auth_rule` VALUES (40, 'rule/index', '权限规则列表', 1, 0, '', 0, 0);
INSERT INTO `auth_rule` VALUES (41, 'rule/add', '规则添加', 1, 0, '', 40, 0);
INSERT INTO `auth_rule` VALUES (42, 'rule/edit', '规则编辑', 1, 0, '', 40, 0);
INSERT INTO `auth_rule` VALUES (43, 'rule/del', '规则删除', 1, 0, '', 40, 0);
INSERT INTO `auth_rule` VALUES (44, 'rule/editSave', '权限规则编辑保存', 1, 0, '', 40, 0);
INSERT INTO `auth_rule` VALUES (45, 'admin/adminChangePasswords', '管理员密码修改', 1, 0, '', 35, 0);
INSERT INTO `auth_rule` VALUES (46, 'admin/adminChangePasswordSave', '管理员密码更新保存', 1, 0, '', 35, 0);
INSERT INTO `auth_rule` VALUES (47, 'group/index', '用户组列表', 1, 0, '', 0, 0);
INSERT INTO `auth_rule` VALUES (48, 'group/add', '用户组添加', 1, 0, '', 47, 0);
INSERT INTO `auth_rule` VALUES (49, 'group/edit', '用户组编辑', 1, 0, '', 47, 0);
INSERT INTO `auth_rule` VALUES (50, 'group/del', '用户组删除', 1, 0, '', 47, 0);
INSERT INTO `auth_rule` VALUES (51, 'group/power', '用户组分配权限', 1, 0, '', 47, 0);
INSERT INTO `auth_rule` VALUES (52, 'group/cha_kan', '查看用户组成员', 1, 0, '', 47, 0);
INSERT INTO `auth_rule` VALUES (53, 'article/index', '文章列表', 1, 0, '', 0, 0);
INSERT INTO `auth_rule` VALUES (54, 'article/add', '文章添加', 1, 0, '', 53, 0);
INSERT INTO `auth_rule` VALUES (55, 'article/edit', '文章编辑', 1, 0, '', 53, 0);
INSERT INTO `auth_rule` VALUES (56, 'article/del', '文章删除', 1, 0, '', 53, 0);
INSERT INTO `auth_rule` VALUES (57, 'index/index', '首页', 1, 0, '', 0, 0);

-- ----------------------------
-- Table structure for bank
-- ----------------------------
DROP TABLE IF EXISTS `bank`;
CREATE TABLE `bank`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT 0,
  `coin` decimal(11, 2) NULL DEFAULT 0.00 COMMENT '银行余额',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 71 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '银行' ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of bank
-- ----------------------------
INSERT INTO `bank` VALUES (1, 1, 600.00);
INSERT INTO `bank` VALUES (2, 190, 20.00);
INSERT INTO `bank` VALUES (3, 189, 0.00);
INSERT INTO `bank` VALUES (18, 170, 50.00);
INSERT INTO `bank` VALUES (19, 171, 0.00);
INSERT INTO `bank` VALUES (20, 192, 0.00);
INSERT INTO `bank` VALUES (21, 191, 0.00);
INSERT INTO `bank` VALUES (22, 172, 0.00);
INSERT INTO `bank` VALUES (23, 176, 0.00);
INSERT INTO `bank` VALUES (24, 198, 100.00);
INSERT INTO `bank` VALUES (25, 194, 0.00);
INSERT INTO `bank` VALUES (26, 195, 0.00);
INSERT INTO `bank` VALUES (27, 196, 300.00);
INSERT INTO `bank` VALUES (28, 197, 150.00);
INSERT INTO `bank` VALUES (29, 177, 800.00);
INSERT INTO `bank` VALUES (30, 178, 0.00);
INSERT INTO `bank` VALUES (31, 179, 0.00);
INSERT INTO `bank` VALUES (32, 199, 0.00);
INSERT INTO `bank` VALUES (33, 180, 0.00);
INSERT INTO `bank` VALUES (34, 182, 0.00);
INSERT INTO `bank` VALUES (35, 183, 0.00);
INSERT INTO `bank` VALUES (36, 184, 0.00);
INSERT INTO `bank` VALUES (37, 185, 0.00);
INSERT INTO `bank` VALUES (38, 186, 0.00);
INSERT INTO `bank` VALUES (39, 189, 0.00);
INSERT INTO `bank` VALUES (40, 205, 0.00);
INSERT INTO `bank` VALUES (41, 190, 0.00);
INSERT INTO `bank` VALUES (42, 206, 0.00);
INSERT INTO `bank` VALUES (43, 191, 0.00);
INSERT INTO `bank` VALUES (44, 208, 0.00);
INSERT INTO `bank` VALUES (45, 192, 0.00);
INSERT INTO `bank` VALUES (46, 193, 205.00);
INSERT INTO `bank` VALUES (47, 194, 0.00);
INSERT INTO `bank` VALUES (48, 195, 12.00);
INSERT INTO `bank` VALUES (49, 197, 0.00);
INSERT INTO `bank` VALUES (50, 210, 100.00);
INSERT INTO `bank` VALUES (51, 201, 0.00);
INSERT INTO `bank` VALUES (52, 202, 0.00);
INSERT INTO `bank` VALUES (53, 203, 0.00);
INSERT INTO `bank` VALUES (54, 207, 0.00);
INSERT INTO `bank` VALUES (55, 208, 0.00);
INSERT INTO `bank` VALUES (56, 209, 0.00);
INSERT INTO `bank` VALUES (57, 211, 130.00);
INSERT INTO `bank` VALUES (58, 216, 0.00);
INSERT INTO `bank` VALUES (59, 225, 0.00);
INSERT INTO `bank` VALUES (60, 226, 0.00);
INSERT INTO `bank` VALUES (61, 227, 0.00);
INSERT INTO `bank` VALUES (62, 228, 0.00);
INSERT INTO `bank` VALUES (63, 229, 0.00);
INSERT INTO `bank` VALUES (64, 230, 0.00);
INSERT INTO `bank` VALUES (65, 231, 0.00);
INSERT INTO `bank` VALUES (66, 232, 0.00);
INSERT INTO `bank` VALUES (67, 233, 0.00);
INSERT INTO `bank` VALUES (68, 234, 0.00);
INSERT INTO `bank` VALUES (69, 217, 0.00);
INSERT INTO `bank` VALUES (70, 100001, 0.00);

-- ----------------------------
-- Table structure for detail_action
-- ----------------------------
DROP TABLE IF EXISTS `detail_action`;
CREATE TABLE `detail_action`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of detail_action
-- ----------------------------
INSERT INTO `detail_action` VALUES (1, '充值');
INSERT INTO `detail_action` VALUES (2, '游戏下注');
INSERT INTO `detail_action` VALUES (3, '游戏奖金');
INSERT INTO `detail_action` VALUES (4, '银行存入');
INSERT INTO `detail_action` VALUES (5, '银行取出');

-- ----------------------------
-- Table structure for detail_log
-- ----------------------------
DROP TABLE IF EXISTS `detail_log`;
CREATE TABLE `detail_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT 0 COMMENT '用户ID',
  `game_id` int(11) NULL DEFAULT 0 COMMENT '游戏ID',
  `action_id` int(11) NULL DEFAULT 0 COMMENT '操作类型ID',
  `room_id` int(11) UNSIGNED NULL DEFAULT NULL,
  `coin` decimal(11, 2) NULL DEFAULT 0.00 COMMENT '变动金额',
  `before_coin` decimal(11, 2) NULL DEFAULT 0.00 COMMENT '操作前余额',
  `after_coin` decimal(11, 2) NULL DEFAULT 0.00 COMMENT '操作后余额',
  `info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注说明',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `create_ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 44 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '资金记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of detail_log
-- ----------------------------
INSERT INTO `detail_log` VALUES (1, 213, 2, 2, 1, 900000.00, 100.00, 75.00, '这个用户是个高手哦赌圣', '2018-12-05 14:21:17', '187.145.26.141');
INSERT INTO `detail_log` VALUES (2, 213, 1, 2, 2, 10000.00, 25000.00, 15000.00, '我的天,这是个土豪', '2018-12-05 16:12:07', '112.168.25.157');
INSERT INTO `detail_log` VALUES (3, 267, 1, 2, 1, 30000.00, 300.00, 400.00, '好人一生品安', '2018-12-11 15:45:53', '112.168.25.157');
INSERT INTO `detail_log` VALUES (4, 213, 2, 2, 2, 10000.00, 80.00, -50.00, '穷人', '2018-12-04 15:46:27', '187.145.26.141');
INSERT INTO `detail_log` VALUES (5, 215, 2, 1, 2, 36000.00, 20.00, 30.00, '123', '2018-11-17 09:12:09', NULL);
INSERT INTO `detail_log` VALUES (13, 215, 2, 1, NULL, 10.00, 183.00, 195.00, '我是一个天才', '2018-11-17 13:55:01', NULL);
INSERT INTO `detail_log` VALUES (14, 217, 1, 1, NULL, 10000.00, 195.00, 205.00, '你是天才吗', '2018-12-04 13:54:56', NULL);
INSERT INTO `detail_log` VALUES (15, 212, 0, 2, NULL, 10000.00, 0.00, 0.00, NULL, '2018-12-04 17:10:06', NULL);
INSERT INTO `detail_log` VALUES (16, 216, 0, 2, NULL, 1000000.00, 0.00, 0.00, NULL, '2018-12-05 17:10:51', NULL);
INSERT INTO `detail_log` VALUES (17, 218, 0, 2, NULL, 440000.00, 0.00, 0.00, NULL, '2018-12-04 09:51:18', NULL);
INSERT INTO `detail_log` VALUES (18, 217, 0, 2, NULL, 90000.00, NULL, 0.00, NULL, '2018-12-05 09:51:39', NULL);
INSERT INTO `detail_log` VALUES (19, 213, 0, 1, NULL, 50000.00, 0.00, 0.00, NULL, '2018-11-19 09:52:31', NULL);
INSERT INTO `detail_log` VALUES (20, 215, 0, 1, NULL, 40000.00, 0.00, 0.00, NULL, '2018-11-19 09:58:01', NULL);
INSERT INTO `detail_log` VALUES (21, 215, 0, 1, NULL, 590000.00, 0.00, 0.00, NULL, '2018-11-19 11:57:41', NULL);
INSERT INTO `detail_log` VALUES (22, 231, 0, 1, NULL, 990000.00, 0.00, 0.00, NULL, '2018-11-19 11:57:54', NULL);
INSERT INTO `detail_log` VALUES (23, 233, 0, 2, NULL, 100000.00, 0.00, 0.00, NULL, '2018-12-03 13:29:07', NULL);
INSERT INTO `detail_log` VALUES (24, 234, 0, 2, NULL, 10.00, 0.00, 10.00, NULL, '2018-12-07 14:55:15', NULL);
INSERT INTO `detail_log` VALUES (25, 232, 0, 1, NULL, 20.00, 10.00, 30.00, NULL, '2018-11-19 14:55:46', NULL);
INSERT INTO `detail_log` VALUES (26, 232, 0, 1, NULL, 100.00, 30.00, 130.00, NULL, '2018-11-19 14:56:30', NULL);
INSERT INTO `detail_log` VALUES (27, 231, 0, 1, NULL, 100.00, 100.00, 115.00, NULL, '2018-11-19 15:00:03', NULL);
INSERT INTO `detail_log` VALUES (28, 234, 0, 1, NULL, 20.00, 215.00, 235.00, NULL, '2018-11-19 15:05:00', NULL);
INSERT INTO `detail_log` VALUES (29, 233, 0, 1, NULL, 20.00, 36.00, 56.00, '充值', '2018-11-19 15:08:18', NULL);
INSERT INTO `detail_log` VALUES (30, 100002, 0, 2, NULL, 14.00, 56.00, 70.00, '充值', '2018-12-07 15:09:09', '192.168.4.109');
INSERT INTO `detail_log` VALUES (31, 234, 0, 1, NULL, 10000.00, 0.00, 10000.00, '充值', '2018-11-23 09:15:05', '192.168.4.109');
INSERT INTO `detail_log` VALUES (32, 232, 0, 1, NULL, 10000.00, 0.00, 10000.00, '充值', '2018-11-23 09:16:15', '192.168.4.109');
INSERT INTO `detail_log` VALUES (33, 231, 0, 1, NULL, 1.00, NULL, 1.00, '充值', '2018-12-07 17:16:42', '127.0.0.1');
INSERT INTO `detail_log` VALUES (34, 230, 0, 1, NULL, 1.00, NULL, 1.00, '充值', '2018-12-07 17:17:00', '127.0.0.1');
INSERT INTO `detail_log` VALUES (35, 230, 0, 1, NULL, 1.00, NULL, 1.00, '充值', '2018-12-07 17:17:08', '127.0.0.1');
INSERT INTO `detail_log` VALUES (36, 233, 0, 1, NULL, 1.00, NULL, 1.00, '充值', '2018-12-07 17:18:25', '127.0.0.1');
INSERT INTO `detail_log` VALUES (37, 234, 0, 1, NULL, 1.00, NULL, 1.00, '充值', '2018-12-07 17:18:45', '127.0.0.1');
INSERT INTO `detail_log` VALUES (38, 231, 0, 1, NULL, 1.00, NULL, 1.00, '充值', '2018-12-07 17:18:46', '127.0.0.1');
INSERT INTO `detail_log` VALUES (39, 231, 0, 1, NULL, 0.00, NULL, 0.00, '充值', '2018-12-07 17:18:47', '127.0.0.1');
INSERT INTO `detail_log` VALUES (40, 230, 0, 1, NULL, 0.00, 0.00, 0.00, '充值', '2018-12-10 10:17:26', '127.0.0.1');
INSERT INTO `detail_log` VALUES (41, 230, 0, 1, NULL, 0.01, 0.01, 0.02, '充值', '2018-12-10 13:45:42', '127.0.0.1');
INSERT INTO `detail_log` VALUES (42, 230, 0, 1, NULL, 0.01, 0.02, 0.03, '充值', '2018-12-10 15:26:06', '127.0.0.1');
INSERT INTO `detail_log` VALUES (43, 230, 0, 1, NULL, 0.01, 0.03, 0.04, '充值', '2018-12-10 15:26:11', '127.0.0.1');

-- ----------------------------
-- Table structure for email
-- ----------------------------
DROP TABLE IF EXISTS `email`;
CREATE TABLE `email`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT 0 COMMENT '用户id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `context` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内容',
  `item` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JSON数据，物品',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '发送时间',
  `read_time` datetime NULL DEFAULT NULL COMMENT '用户阅读领取时间',
  `status` int(11) NULL DEFAULT 0 COMMENT '0未读 1已读',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 33 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '邮件' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of email
-- ----------------------------
INSERT INTO `email` VALUES (25, 192, '你好啊 ', NULL, '我是大哥1号', NULL, '2018-10-20 09:24:01', NULL, 0);
INSERT INTO `email` VALUES (26, 192, '大标题吧', NULL, '没问题吧', NULL, '2018-10-20 09:29:19', NULL, 1);
INSERT INTO `email` VALUES (27, 140, '45445454', NULL, '4545454545', NULL, '2018-11-19 11:34:12', NULL, 0);
INSERT INTO `email` VALUES (28, 1, '45445454', NULL, '4545454545', NULL, '2018-11-19 11:34:15', NULL, 0);
INSERT INTO `email` VALUES (29, 1, '45645645', NULL, '456456456456', NULL, '2018-11-19 11:34:56', NULL, 0);
INSERT INTO `email` VALUES (30, 1, '45645645', NULL, '456456456456', NULL, '2018-11-19 11:34:59', NULL, 0);
INSERT INTO `email` VALUES (31, 1, '45645645', NULL, '456456456456', NULL, '2018-11-19 11:35:02', NULL, 0);
INSERT INTO `email` VALUES (32, 1, '45645645', NULL, '456456456456', NULL, '2018-11-19 11:35:05', NULL, 0);

-- ----------------------------
-- Table structure for game_list
-- ----------------------------
DROP TABLE IF EXISTS `game_list`;
CREATE TABLE `game_list`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `setting` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '游戏配置',
  `status` int(11) NULL DEFAULT 1 COMMENT '状态 0 为关闭， 1为开启',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '游戏列表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of game_list
-- ----------------------------
INSERT INTO `game_list` VALUES (1, '百人牛牛', '驱蚊器无12232', 1);
INSERT INTO `game_list` VALUES (2, '抢庄牛牛', '2阿萨达', 1);
INSERT INTO `game_list` VALUES (3, '炸金花', '哈哈哈', 1);
INSERT INTO `game_list` VALUES (4, '德州扑克', '积极', 1);

-- ----------------------------
-- Table structure for game_play_log
-- ----------------------------
DROP TABLE IF EXISTS `game_play_log`;
CREATE TABLE `game_play_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `room_id` int(11) UNSIGNED NULL DEFAULT NULL,
  `game_id` int(11) NULL DEFAULT 0,
  `level` int(11) NULL DEFAULT 0,
  `info` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '对局详细',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '对局开始时间',
  `end_time` datetime NULL DEFAULT NULL COMMENT '对局结束时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 166 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '对局记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of game_play_log
-- ----------------------------
INSERT INTO `game_play_log` VALUES (3, 1, 2, 1, '{\"banker_id\":130,\"banker_mul\":4,\"bet_mul\":{\"133\":5,\"134\":20,\"131\":10,\"132\":20},\"poker\":{\"130\":{\"poker\":[19,1,44,7,47],\"size\":0,\"win\":-180},\"131\":{\"poker\":[50,10,25,27,34],\"size\":6,\"win\":80},\"132\":{\"poker\":[6,4,32,23,43],\"size\":9,\"win\":160},\"133\":{\"poker\":[9,31,5,28,45],\"size\":1,\"win\":20},\"134\":{\"poker\":[26,37,16,3,40],\"size\":0,\"win\":-80}}}', '2018-10-15 15:06:54', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (4, 1, 1, 1, '{\"banker_id\":133,\"banker_mul\":4,\"bet_mul\":{\"134\":20,\"132\":20,\"131\":10,\"130\":5},\"poker\":{\"130\":{\"poker\":[47,36,46,9,22],\"size\":9,\"win\":40},\"131\":{\"poker\":[29,26,40,16,45],\"size\":10,\"win\":120},\"132\":{\"poker\":[38,3,13,12,49],\"size\":0,\"win\":80},\"133\":{\"poker\":[28,17,41,42,8],\"size\":12,\"win\":-320},\"134\":{\"poker\":[23,39,32,14,5],\"size\":11,\"win\":80}}}', '2018-10-15 15:07:27', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (5, 1, 1, 1, '{\"banker_id\":132,\"banker_mul\":4,\"bet_mul\":{\"134\":10,\"133\":20,\"131\":20,\"130\":5},\"poker\":{\"130\":{\"poker\":[14,37,29,33,19],\"size\":0,\"win\":-20},\"131\":{\"poker\":[44,11,45,7,49],\"size\":5,\"win\":80},\"132\":{\"poker\":[27,17,26,2,48],\"size\":0,\"win\":-340},\"133\":{\"poker\":[3,51,47,22,41],\"size\":7,\"win\":160},\"134\":{\"poker\":[23,13,34,46,0],\"size\":10,\"win\":120}}}', '2018-10-15 15:08:07', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (6, 1, 2, 1, '{\"banker_id\":132,\"banker_mul\":4,\"bet_mul\":{\"134\":10,\"131\":5,\"133\":15,\"130\":5},\"poker\":{\"130\":{\"poker\":[7,6,1,43,48],\"size\":0,\"win\":-20},\"131\":{\"poker\":[35,40,33,15,45],\"size\":0,\"win\":-20},\"132\":{\"poker\":[16,5,39,28,12],\"size\":9,\"win\":200},\"133\":{\"poker\":[51,32,50,46,30],\"size\":7,\"win\":-120},\"134\":{\"poker\":[38,29,47,25,0],\"size\":0,\"win\":-40}}}', '2018-10-15 15:08:47', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (7, 2, 2, 1, '{\"banker_id\":134,\"banker_mul\":4,\"bet_mul\":{\"131\":10,\"132\":20,\"133\":15,\"130\":5},\"poker\":{\"130\":{\"poker\":[12,9,21,38,44],\"size\":3,\"win\":-20},\"131\":{\"poker\":[18,47,48,31,29],\"size\":0,\"win\":-40},\"132\":{\"poker\":[25,2,24,33,30],\"size\":0,\"win\":-80},\"133\":{\"poker\":[46,42,40,23,7],\"size\":8,\"win\":-120},\"134\":{\"poker\":[19,37,36,13,43],\"size\":9,\"win\":260}}}', '2018-10-15 15:09:27', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (8, 2, 2, 1, '{\"banker_id\":130,\"banker_mul\":4,\"bet_mul\":{\"133\":10,\"131\":5,\"132\":10,\"134\":20},\"poker\":{\"130\":{\"poker\":[1,15,33,9,48],\"size\":7,\"win\":160},\"131\":{\"poker\":[36,47,44,5,21],\"size\":8,\"win\":40},\"132\":{\"poker\":[38,19,30,41,8],\"size\":0,\"win\":-40},\"134\":{\"poker\":[24,49,13,10,3],\"size\":5,\"win\":-80},\"133\":{\"poker\":[25,50,39,37,35],\"size\":6,\"win\":-80}}}', '2018-10-15 15:12:47', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (9, 2, 2, 1, '{\"banker_id\":131,\"banker_mul\":4,\"bet_mul\":{\"132\":20,\"134\":15,\"133\":5,\"130\":10},\"poker\":{\"130\":{\"poker\":[43,49,44,1,36],\"size\":1,\"win\":40},\"131\":{\"poker\":[25,8,6,30,11],\"size\":0,\"win\":-200},\"132\":{\"poker\":[19,2,41,37,16],\"size\":1,\"win\":80},\"134\":{\"poker\":[47,21,45,32,39],\"size\":5,\"win\":60},\"133\":{\"poker\":[22,10,20,27,0],\"size\":3,\"win\":20}}}', '2018-10-15 15:13:20', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (10, 2, 2, 1, '{\"banker_id\":132,\"banker_mul\":1,\"bet_mul\":{\"131\":5,\"133\":10,\"134\":10,\"130\":5},\"poker\":{\"130\":{\"poker\":[45,10,41,23,26],\"size\":6,\"win\":10},\"132\":{\"poker\":[44,43,15,28,14],\"size\":0,\"win\":-15},\"133\":{\"poker\":[25,40,50,24,47],\"size\":4,\"win\":10},\"134\":{\"poker\":[31,9,29,3,7],\"size\":0,\"win\":-10},\"131\":{\"poker\":[32,42,21,17,8],\"size\":3,\"win\":5}}}', '2018-10-15 15:14:13', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (11, 2, 2, 1, '{\"banker_id\":132,\"banker_mul\":3,\"bet_mul\":{\"134\":10,\"133\":20,\"131\":10,\"130\":5},\"poker\":{\"130\":{\"poker\":[42,46,2,0,36],\"size\":2,\"win\":15},\"132\":{\"poker\":[25,44,24,26,51],\"size\":0,\"win\":-105},\"133\":{\"poker\":[9,45,31,34,17],\"size\":5,\"win\":60},\"134\":{\"poker\":[19,50,49,11,13],\"size\":0,\"win\":-30},\"131\":{\"poker\":[5,39,4,21,30],\"size\":8,\"win\":60}}}', '2018-10-15 15:14:53', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (12, 2, 2, 1, '{\"banker_id\":131,\"banker_mul\":2,\"bet_mul\":{\"132\":10,\"133\":20,\"134\":5,\"130\":20},\"poker\":{\"130\":{\"poker\":[40,34,48,26,11],\"size\":9,\"win\":80},\"131\":{\"poker\":[47,35,42,17,31],\"size\":0,\"win\":-150},\"132\":{\"poker\":[4,41,3,50,38],\"size\":3,\"win\":20},\"133\":{\"poker\":[13,1,7,30,46],\"size\":5,\"win\":40},\"134\":{\"poker\":[10,33,49,19,39],\"size\":0,\"win\":10}}}', '2018-10-15 15:15:45', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (13, 2, 2, 1, '{\"banker_id\":134,\"banker_mul\":4,\"bet_mul\":{\"131\":15,\"132\":5,\"133\":20,\"130\":5},\"poker\":{\"130\":{\"poker\":[7,33,30,16,46],\"size\":4,\"win\":20},\"131\":{\"poker\":[18,41,43,19,31],\"size\":8,\"win\":120},\"132\":{\"poker\":[24,29,13,3,17],\"size\":5,\"win\":20},\"133\":{\"poker\":[36,10,50,32,28],\"size\":10,\"win\":240},\"134\":{\"poker\":[42,27,14,44,25],\"size\":0,\"win\":-400}}}', '2018-10-15 15:16:18', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (14, 2, 2, 1, '{\"banker_id\":131,\"banker_mul\":4,\"bet_mul\":{\"133\":20,\"134\":5,\"132\":15,\"130\":5},\"poker\":{\"130\":{\"poker\":[4,15,13,19,18],\"size\":10,\"win\":60},\"131\":{\"poker\":[45,12,44,3,30],\"size\":0,\"win\":-60},\"132\":{\"poker\":[11,47,8,33,48],\"size\":0,\"win\":60},\"133\":{\"poker\":[27,9,20,35,5],\"size\":0,\"win\":-80},\"134\":{\"poker\":[0,46,28,51,16],\"size\":0,\"win\":20}}}', '2018-10-15 15:16:58', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (15, 2, 2, 1, '{\"banker_id\":131,\"banker_mul\":2,\"bet_mul\":{\"132\":15,\"133\":10,\"134\":10,\"130\":5},\"poker\":{\"130\":{\"poker\":[6,42,15,3,45],\"size\":0,\"win\":-10},\"131\":{\"poker\":[9,25,0,8,23],\"size\":10,\"win\":150},\"132\":{\"poker\":[32,10,27,29,34],\"size\":6,\"win\":-60},\"133\":{\"poker\":[20,47,41,37,49],\"size\":6,\"win\":-40},\"134\":{\"poker\":[17,12,2,19,1],\"size\":6,\"win\":-40}}}', '2018-10-15 15:18:17', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (16, 2, 2, 1, '{\"banker_id\":133,\"banker_mul\":4,\"bet_mul\":{\"131\":5,\"132\":5,\"134\":20,\"130\":5},\"poker\":{\"130\":{\"poker\":[47,23,8,7,30],\"size\":9,\"win\":40},\"131\":{\"poker\":[12,6,48,46,26],\"size\":0,\"win\":20},\"132\":{\"poker\":[28,20,51,37,34],\"size\":0,\"win\":20},\"133\":{\"poker\":[0,14,9,38,42],\"size\":0,\"win\":-160},\"134\":{\"poker\":[32,18,44,27,1],\"size\":2,\"win\":80}}}', '2018-10-15 15:18:57', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (17, 2, 2, 1, '{\"banker_id\":132,\"banker_mul\":1,\"bet_mul\":{\"133\":10,\"134\":10,\"131\":5,\"130\":5},\"poker\":{\"130\":{\"poker\":[33,10,13,50,30],\"size\":4,\"win\":-5},\"131\":{\"poker\":[45,41,0,49,42],\"size\":1,\"win\":-5},\"132\":{\"poker\":[44,31,51,46,34],\"size\":7,\"win\":0},\"133\":{\"poker\":[1,38,4,21,32],\"size\":8,\"win\":20},\"134\":{\"poker\":[27,47,24,29,48],\"size\":0,\"win\":-10}}}', '2018-10-15 15:20:09', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (18, 2, 2, 1, '{\"banker_id\":132,\"banker_mul\":4,\"bet_mul\":{\"131\":20,\"133\":15,\"134\":10,\"130\":5},\"poker\":{\"130\":{\"poker\":[51,20,29,17,28],\"size\":0,\"win\":20},\"131\":{\"poker\":[38,1,22,43,32],\"size\":6,\"win\":160},\"132\":{\"poker\":[10,15,12,39,42],\"size\":0,\"win\":-420},\"133\":{\"poker\":[36,33,26,14,35],\"size\":9,\"win\":120},\"134\":{\"poker\":[7,6,21,49,41],\"size\":10,\"win\":120}}}', '2018-10-15 15:20:49', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (19, 2, 2, 1, '{\"banker_id\":131,\"banker_mul\":2,\"bet_mul\":{\"134\":20,\"132\":20,\"133\":20,\"130\":5},\"poker\":{\"130\":{\"poker\":[35,27,10,25,26],\"size\":0,\"win\":-10},\"131\":{\"poker\":[46,37,32,41,42],\"size\":9,\"win\":10},\"133\":{\"poker\":[11,48,0,45,18],\"size\":0,\"win\":-40},\"132\":{\"poker\":[36,20,15,12,9],\"size\":7,\"win\":-80},\"134\":{\"poker\":[44,40,19,43,17],\"size\":10,\"win\":120}}}', '2018-10-15 15:21:39', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (20, 1, 2, 1, '{\"banker_id\":131,\"banker_mul\":2,\"bet_mul\":{\"133\":10,\"132\":15,\"134\":20,\"130\":5},\"poker\":{\"130\":{\"poker\":[39,30,23,38,20],\"size\":10,\"win\":30},\"131\":{\"poker\":[43,16,37,18,35],\"size\":9,\"win\":-220},\"133\":{\"poker\":[9,24,22,31,29],\"size\":0,\"win\":-20},\"132\":{\"poker\":[8,36,49,25,50],\"size\":10,\"win\":90},\"134\":{\"poker\":[10,26,41,28,5],\"size\":10,\"win\":120}}}', '2018-10-15 15:22:19', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (21, NULL, 2, 1, '{\"banker_id\":132,\"banker_mul\":4,\"bet_mul\":{\"133\":10,\"131\":15,\"134\":15,\"130\":5},\"poker\":{\"130\":{\"poker\":[27,11,0,28,19],\"size\":4,\"win\":20},\"131\":{\"poker\":[16,6,22,49,31],\"size\":1,\"win\":60},\"133\":{\"poker\":[29,30,8,15,12],\"size\":7,\"win\":80},\"132\":{\"poker\":[3,23,47,17,5],\"size\":0,\"win\":-280},\"134\":{\"poker\":[36,40,13,48,10],\"size\":7,\"win\":120}}}', '2018-10-15 15:22:59', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (22, NULL, 2, 1, '{\"banker_id\":133,\"banker_mul\":4,\"bet_mul\":{\"131\":10,\"134\":5,\"132\":5,\"130\":5},\"poker\":{\"130\":{\"poker\":[33,14,39,8,44],\"size\":0,\"win\":-20},\"131\":{\"poker\":[28,41,32,2,18],\"size\":3,\"win\":-40},\"133\":{\"poker\":[45,38,40,23,15],\"size\":10,\"win\":100},\"132\":{\"poker\":[4,21,3,50,1],\"size\":0,\"win\":-20},\"134\":{\"poker\":[31,20,29,27,42],\"size\":0,\"win\":-20}}}', '2018-10-15 15:23:39', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (23, NULL, 2, 1, '{\"banker_id\":132,\"banker_mul\":4,\"bet_mul\":{\"133\":20,\"131\":15,\"134\":15,\"130\":5},\"poker\":{\"130\":{\"poker\":[21,22,43,31,35],\"size\":9,\"win\":40},\"131\":{\"poker\":[49,36,13,33,42],\"size\":3,\"win\":-60},\"133\":{\"poker\":[47,41,14,7,44],\"size\":6,\"win\":160},\"132\":{\"poker\":[38,45,20,37,39],\"size\":6,\"win\":-80},\"134\":{\"poker\":[9,27,26,34,29],\"size\":4,\"win\":-60}}}', '2018-10-15 15:24:19', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (24, NULL, 2, 1, '{\"banker_id\":131,\"banker_mul\":3,\"bet_mul\":{\"134\":5,\"133\":15,\"132\":15,\"130\":5},\"poker\":{\"130\":{\"poker\":[14,31,17,25,3],\"size\":5,\"win\":15},\"131\":{\"poker\":[19,32,0,21,38],\"size\":1,\"win\":-225},\"133\":{\"poker\":[46,35,41,26,44],\"size\":6,\"win\":90},\"132\":{\"poker\":[30,2,23,10,5],\"size\":10,\"win\":135},\"134\":{\"poker\":[11,12,34,42,43],\"size\":0,\"win\":-15}}}', '2018-10-15 15:24:59', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (25, NULL, 2, 1, '{\"banker_id\":131,\"banker_mul\":2,\"bet_mul\":{\"133\":10,\"134\":20,\"132\":15,\"130\":5},\"poker\":{\"130\":{\"poker\":[38,37,7,18,1],\"size\":0,\"win\":-10},\"131\":{\"poker\":[30,43,6,49,3],\"size\":1,\"win\":-190},\"133\":{\"poker\":[42,10,19,45,24],\"size\":5,\"win\":20},\"132\":{\"poker\":[28,5,47,26,33],\"size\":6,\"win\":60},\"134\":{\"poker\":[32,29,12,0,31],\"size\":10,\"win\":120}}}', '2018-10-15 15:25:39', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (26, NULL, 2, 1, '{\"banker_id\":132,\"banker_mul\":4,\"bet_mul\":{\"134\":10,\"133\":15,\"132\":10,\"130\":5,\"131\":5},\"poker\":{\"130\":{\"poker\":[41,27,31,50,2],\"size\":0,\"win\":-20},\"131\":{\"poker\":[33,17,24,18,45],\"size\":6,\"win\":40},\"132\":{\"poker\":[25,30,19,35,3],\"size\":10,\"win\":80},\"133\":{\"poker\":[44,26,28,48,14],\"size\":0,\"win\":-60},\"134\":{\"poker\":[43,36,40,15,34],\"size\":3,\"win\":-40}}}', '2018-10-15 15:27:16', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (27, NULL, 2, 1, '{\"banker_id\":132,\"banker_mul\":4,\"bet_mul\":{\"134\":10,\"133\":15,\"132\":10,\"130\":5,\"131\":5},\"poker\":{\"130\":{\"poker\":[10,0,7,14,13],\"size\":4,\"win\":-20},\"131\":{\"poker\":[27,29,31,16,1],\"size\":9,\"win\":40},\"132\":{\"poker\":[23,4,42,20,12],\"size\":8,\"win\":80},\"133\":{\"poker\":[35,46,51,5,6],\"size\":0,\"win\":-60},\"134\":{\"poker\":[3,17,22,48,34],\"size\":1,\"win\":-40}}}', '2018-10-15 15:27:16', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (28, NULL, 2, 1, '{\"banker_id\":132,\"banker_mul\":4,\"bet_mul\":{\"134\":10,\"133\":15,\"132\":10,\"130\":5,\"131\":5},\"poker\":{\"130\":{\"poker\":[5,6,36,51,46],\"size\":4,\"win\":-20},\"131\":{\"poker\":[24,11,40,1,25],\"size\":8,\"win\":40},\"132\":{\"poker\":[0,7,2,33,17],\"size\":0,\"win\":80},\"133\":{\"poker\":[43,39,37,26,13],\"size\":1,\"win\":-60},\"134\":{\"poker\":[32,16,3,18,30],\"size\":0,\"win\":-40}}}', '2018-10-15 15:27:16', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (29, NULL, 2, 1, '{\"banker_id\":132,\"banker_mul\":4,\"bet_mul\":{\"134\":10,\"133\":15,\"132\":10,\"130\":5,\"131\":5},\"poker\":{\"130\":{\"poker\":[14,6,5,15,0],\"size\":3,\"win\":-20},\"131\":{\"poker\":[18,22,43,36,12],\"size\":5,\"win\":20},\"132\":{\"poker\":[45,26,27,42,51],\"size\":4,\"win\":-20},\"133\":{\"poker\":[1,4,28,9,3],\"size\":5,\"win\":60},\"134\":{\"poker\":[49,10,31,30,21],\"size\":0,\"win\":-40}}}', '2018-10-15 15:27:16', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (30, NULL, 2, 1, '{\"banker_id\":130,\"banker_mul\":1,\"bet_mul\":{\"131\":5,\"132\":5,\"133\":5,\"134\":5},\"poker\":{\"130\":{\"poker\":[23,44,13,51,3],\"size\":1,\"win\":0},\"131\":{\"poker\":[2,10,11,0,20],\"size\":4,\"win\":5},\"132\":{\"poker\":[46,32,25,24,45],\"size\":0,\"win\":-5},\"133\":{\"poker\":[16,37,40,35,4],\"size\":0,\"win\":-5},\"134\":{\"poker\":[7,9,29,39,1],\"size\":4,\"win\":5}}}', '2018-10-15 15:27:55', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (31, NULL, 2, 1, '{\"banker_id\":131,\"banker_mul\":2,\"bet_mul\":{\"134\":20,\"132\":5,\"133\":5,\"130\":5},\"poker\":{\"130\":{\"poker\":[41,44,9,24,23],\"size\":6,\"win\":20},\"131\":{\"poker\":[50,30,18,5,34],\"size\":4,\"win\":-30},\"133\":{\"poker\":[40,10,51,27,48],\"size\":10,\"win\":30},\"134\":{\"poker\":[37,45,1,4,32],\"size\":2,\"win\":-40},\"132\":{\"poker\":[21,28,36,13,49],\"size\":8,\"win\":20}}}', '2018-10-15 15:30:00', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (32, NULL, 2, 1, '{\"banker_id\":133,\"banker_mul\":2,\"bet_mul\":{\"134\":15,\"132\":10,\"131\":20,\"130\":20},\"poker\":{\"130\":{\"poker\":[50,30,15,5,34],\"size\":3,\"win\":-40},\"131\":{\"poker\":[23,16,45,22,9],\"size\":0,\"win\":-40},\"133\":{\"poker\":[27,24,36,0,11],\"size\":8,\"win\":130},\"134\":{\"poker\":[19,20,7,33,42],\"size\":2,\"win\":-30},\"132\":{\"poker\":[35,47,8,1,51],\"size\":3,\"win\":-20}}}', '2018-10-15 15:30:40', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (33, NULL, 2, 1, '{\"banker_id\":134,\"banker_mul\":4,\"bet_mul\":{\"131\":5,\"130\":5,\"132\":5,\"133\":10},\"poker\":{\"130\":{\"poker\":[7,34,29,50,21],\"size\":5,\"win\":20},\"131\":{\"poker\":[49,19,28,35,5],\"size\":4,\"win\":20},\"132\":{\"poker\":[22,36,39,47,18],\"size\":1,\"win\":-20},\"133\":{\"poker\":[43,10,51,20,26],\"size\":6,\"win\":80},\"134\":{\"poker\":[1,12,16,15,44],\"size\":4,\"win\":-100}}}', '2018-10-15 15:31:22', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (34, NULL, 2, 1, '{\"banker_id\":134,\"banker_mul\":4,\"bet_mul\":{\"133\":10,\"131\":5,\"132\":10,\"130\":10},\"poker\":{\"130\":{\"poker\":[23,36,5,14,0],\"size\":3,\"win\":-40},\"133\":{\"poker\":[32,30,4,45,48],\"size\":9,\"win\":80},\"131\":{\"poker\":[42,25,33,19,38],\"size\":0,\"win\":-20},\"132\":{\"poker\":[11,12,50,51,3],\"size\":0,\"win\":-40},\"134\":{\"poker\":[44,34,43,37,29],\"size\":7,\"win\":20}}}', '2018-10-15 15:32:36', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (35, NULL, 2, 1, '{\"banker_id\":133,\"banker_mul\":3,\"bet_mul\":{\"134\":15,\"131\":5,\"130\":5,\"132\":5},\"poker\":{\"130\":{\"poker\":[50,46,30,35,42],\"size\":7,\"win\":30},\"134\":{\"poker\":[32,7,49,10,17],\"size\":9,\"win\":90},\"131\":{\"poker\":[29,13,3,4,28],\"size\":3,\"win\":15},\"132\":{\"poker\":[0,41,43,51,27],\"size\":8,\"win\":30},\"133\":{\"poker\":[20,47,38,26,31],\"size\":0,\"win\":-165}}}', '2018-10-15 15:33:25', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (36, NULL, 2, 1, '{\"banker_id\":132,\"banker_mul\":4,\"bet_mul\":{\"131\":15,\"133\":10,\"134\":20,\"130\":5},\"poker\":{\"130\":{\"poker\":[2,3,18,48,43],\"size\":0,\"win\":-20},\"134\":{\"poker\":[31,49,1,23,37],\"size\":0,\"win\":-80},\"131\":{\"poker\":[20,21,32,47,24],\"size\":0,\"win\":-60},\"132\":{\"poker\":[33,30,26,13,40],\"size\":8,\"win\":200},\"133\":{\"poker\":[16,22,44,36,15],\"size\":5,\"win\":-40}}}', '2018-10-15 15:33:58', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (37, NULL, 2, 1, '{\"banker_id\":132,\"banker_mul\":4,\"bet_mul\":{\"133\":20,\"134\":10,\"131\":15,\"130\":5},\"poker\":{\"130\":{\"poker\":[10,24,9,33,43],\"size\":2,\"win\":20},\"134\":{\"poker\":[5,32,11,6,12],\"size\":0,\"win\":-40},\"131\":{\"poker\":[13,20,7,16,23],\"size\":0,\"win\":-60},\"132\":{\"poker\":[15,17,39,47,25],\"size\":0,\"win\":160},\"133\":{\"poker\":[41,26,45,28,27],\"size\":0,\"win\":-80}}}', '2018-10-15 15:34:38', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (38, NULL, 2, 1, '{\"banker_id\":133,\"banker_mul\":3,\"bet_mul\":{\"131\":20,\"132\":15,\"134\":10,\"130\":5},\"poker\":{\"130\":{\"poker\":[47,20,51,38,22],\"size\":2,\"win\":15},\"134\":{\"poker\":[21,16,36,29,0],\"size\":0,\"win\":-30},\"131\":{\"poker\":[27,2,23,24,30],\"size\":9,\"win\":120},\"132\":{\"poker\":[26,5,17,46,4],\"size\":0,\"win\":-45},\"133\":{\"poker\":[18,6,14,41,50],\"size\":0,\"win\":-60}}}', '2018-10-15 15:35:18', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (39, NULL, 2, 1, '{\"banker_id\":130,\"banker_mul\":2,\"bet_mul\":{\"130\":15,\"131\":20,\"132\":10,\"134\":5,\"133\":20},\"poker\":{\"130\":{\"poker\":[47,43,25,40,30],\"size\":5,\"win\":110},\"132\":{\"poker\":[16,49,4,27,34],\"size\":0,\"win\":-20},\"134\":{\"poker\":[9,50,35,33,8],\"size\":0,\"win\":-10},\"131\":{\"poker\":[15,17,36,24,6],\"size\":0,\"win\":-40},\"133\":{\"poker\":[38,26,0,28,14],\"size\":0,\"win\":-40}}}', '2018-10-15 15:36:33', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (40, NULL, 2, 1, '{\"banker_id\":134,\"banker_mul\":4,\"bet_mul\":{\"132\":20,\"133\":5,\"131\":15,\"130\":5},\"poker\":{\"130\":{\"poker\":[3,39,14,42,6],\"size\":0,\"win\":-20},\"132\":{\"poker\":[46,23,28,16,4],\"size\":1,\"win\":-80},\"134\":{\"poker\":[2,38,41,48,8],\"size\":4,\"win\":-80},\"131\":{\"poker\":[44,21,45,5,49],\"size\":8,\"win\":120},\"133\":{\"poker\":[27,36,47,31,19],\"size\":10,\"win\":60}}}', '2018-10-15 15:37:06', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (41, NULL, 2, 1, '{\"banker_id\":131,\"banker_mul\":4,\"bet_mul\":{\"133\":20,\"132\":20,\"134\":5,\"130\":5},\"poker\":{\"130\":{\"poker\":[39,41,34,3,19],\"size\":5,\"win\":20},\"132\":{\"poker\":[40,49,9,27,46],\"size\":10,\"win\":240},\"134\":{\"poker\":[13,38,50,42,17],\"size\":9,\"win\":40},\"131\":{\"poker\":[22,11,35,4,23],\"size\":0,\"win\":-460},\"133\":{\"poker\":[43,24,30,2,8],\"size\":9,\"win\":160}}}', '2018-10-15 15:37:46', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (42, NULL, 2, 1, '{\"banker_id\":131,\"banker_mul\":4,\"bet_mul\":{\"133\":5,\"132\":15,\"134\":20,\"130\":5},\"poker\":{\"130\":{\"poker\":[11,36,21,26,14],\"size\":10,\"win\":60},\"132\":{\"poker\":[7,0,23,2,18],\"size\":0,\"win\":-60},\"134\":{\"poker\":[33,34,1,5,24],\"size\":8,\"win\":160},\"131\":{\"poker\":[10,4,39,46,8],\"size\":0,\"win\":-200},\"133\":{\"poker\":[35,42,50,28,45],\"size\":7,\"win\":40}}}', '2018-10-15 15:38:26', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (43, NULL, 2, 1, '{\"banker_id\":132,\"banker_mul\":4,\"bet_mul\":{\"133\":5,\"134\":10,\"131\":15,\"130\":5},\"poker\":{\"130\":{\"poker\":[33,46,25,10,3],\"size\":10,\"win\":60},\"132\":{\"poker\":[41,8,31,48,5],\"size\":3,\"win\":-20},\"134\":{\"poker\":[14,40,22,9,2],\"size\":4,\"win\":40},\"131\":{\"poker\":[43,24,16,1,37],\"size\":0,\"win\":-60},\"133\":{\"poker\":[13,34,51,50,28],\"size\":0,\"win\":-20}}}', '2018-10-15 15:39:06', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (44, NULL, 2, 1, '{\"banker_id\":134,\"banker_mul\":4,\"bet_mul\":{\"133\":5,\"132\":5,\"131\":5,\"130\":5},\"poker\":{\"130\":{\"poker\":[4,30,50,49,3],\"size\":1,\"win\":-20},\"132\":{\"poker\":[23,13,5,14,47],\"size\":6,\"win\":40},\"134\":{\"poker\":[31,11,2,21,16],\"size\":3,\"win\":20},\"131\":{\"poker\":[42,45,7,33,22],\"size\":0,\"win\":-20},\"133\":{\"poker\":[15,1,29,35,12],\"size\":0,\"win\":-20}}}', '2018-10-15 15:39:46', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (45, NULL, 2, 1, '{\"banker_id\":133,\"banker_mul\":2,\"bet_mul\":{\"132\":5,\"134\":15,\"131\":5,\"130\":5},\"poker\":{\"130\":{\"poker\":[46,48,32,13,7],\"size\":0,\"win\":10},\"132\":{\"poker\":[42,26,9,2,41],\"size\":1,\"win\":10},\"134\":{\"poker\":[14,20,11,19,36],\"size\":8,\"win\":60},\"131\":{\"poker\":[1,23,10,29,4],\"size\":10,\"win\":30},\"133\":{\"poker\":[17,21,45,43,24],\"size\":0,\"win\":-110}}}', '2018-10-15 15:40:26', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (46, NULL, 2, 1, '{\"banker_id\":134,\"banker_mul\":4,\"bet_mul\":{\"132\":5,\"131\":5,\"133\":10,\"130\":5},\"poker\":{\"130\":{\"poker\":[24,49,38,36,46],\"size\":7,\"win\":40},\"132\":{\"poker\":[11,33,44,3,9],\"size\":6,\"win\":40},\"134\":{\"poker\":[20,15,32,48,8],\"size\":2,\"win\":-60},\"131\":{\"poker\":[42,35,40,0,12],\"size\":4,\"win\":20},\"133\":{\"poker\":[21,51,10,17,22],\"size\":0,\"win\":-40}}}', '2018-10-15 15:41:06', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (47, NULL, 2, 1, '{\"banker_id\":131,\"banker_mul\":3,\"bet_mul\":{\"134\":5,\"133\":20,\"132\":5,\"130\":5},\"poker\":{\"130\":{\"poker\":[31,28,38,30,33],\"size\":0,\"win\":-15},\"132\":{\"poker\":[27,43,22,18,11],\"size\":1,\"win\":-15},\"134\":{\"poker\":[37,29,5,23,13],\"size\":10,\"win\":45},\"131\":{\"poker\":[44,21,2,10,8],\"size\":3,\"win\":45},\"133\":{\"poker\":[26,1,0,49,12],\"size\":0,\"win\":-60}}}', '2018-10-15 15:41:46', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (48, NULL, 2, 1, '{\"banker_id\":132,\"banker_mul\":4,\"bet_mul\":{\"131\":10,\"133\":10,\"134\":20,\"130\":5},\"poker\":{\"130\":{\"poker\":[46,14,42,35,28],\"size\":0,\"win\":20},\"132\":{\"poker\":[22,12,20,34,32],\"size\":0,\"win\":-220},\"134\":{\"poker\":[5,8,26,51,4],\"size\":4,\"win\":80},\"131\":{\"poker\":[41,47,15,48,29],\"size\":2,\"win\":40},\"133\":{\"poker\":[38,37,19,39,13],\"size\":9,\"win\":80}}}', '2018-10-15 15:42:26', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (49, NULL, 2, 1, '{\"banker_id\":130,\"banker_mul\":1,\"bet_mul\":{\"130\":10,\"132\":20,\"133\":5,\"134\":5,\"131\":20},\"poker\":{\"130\":{\"poker\":[14,1,42,0,7],\"size\":0,\"win\":-25},\"131\":{\"poker\":[34,8,23,41,22],\"size\":0,\"win\":-20},\"132\":{\"poker\":[50,4,9,33,6],\"size\":0,\"win\":20},\"133\":{\"poker\":[16,27,26,20,18],\"size\":10,\"win\":15},\"134\":{\"poker\":[45,11,28,32,25],\"size\":7,\"win\":10}}}', '2018-10-15 15:43:33', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (50, NULL, 2, 1, '{\"banker_id\":132,\"banker_mul\":3,\"bet_mul\":{\"133\":20,\"134\":10,\"130\":10,\"131\":10},\"poker\":{\"130\":{\"poker\":[50,48,33,28,30],\"size\":0,\"win\":-30},\"131\":{\"poker\":[21,45,22,51,11],\"size\":0,\"win\":-30},\"132\":{\"poker\":[0,26,10,42,39],\"size\":1,\"win\":60},\"133\":{\"poker\":[12,35,6,16,3],\"size\":1,\"win\":-60},\"134\":{\"poker\":[41,20,19,29,27],\"size\":6,\"win\":60}}}', '2018-10-15 15:44:06', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (51, NULL, 2, 1, '{\"banker_id\":131,\"banker_mul\":3,\"bet_mul\":{\"132\":15,\"133\":20,\"134\":5,\"130\":5},\"poker\":{\"130\":{\"poker\":[5,41,27,45,17],\"size\":0,\"win\":-15},\"131\":{\"poker\":[21,38,51,37,30],\"size\":4,\"win\":-105},\"132\":{\"poker\":[24,40,22,16,6],\"size\":0,\"win\":-45},\"133\":{\"poker\":[39,23,14,20,15],\"size\":10,\"win\":180},\"134\":{\"poker\":[9,43,0,44,11],\"size\":0,\"win\":-15}}}', '2018-10-15 15:44:27', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (52, NULL, 2, 1, '{\"banker_id\":133,\"banker_mul\":4,\"bet_mul\":{\"134\":15,\"132\":10,\"131\":20,\"130\":5},\"poker\":{\"130\":{\"poker\":[14,42,16,19,8],\"size\":7,\"win\":-40},\"131\":{\"poker\":[36,35,26,21,45],\"size\":0,\"win\":-80},\"132\":{\"poker\":[5,47,50,4,44],\"size\":4,\"win\":-40},\"133\":{\"poker\":[31,9,18,17,25],\"size\":8,\"win\":220},\"134\":{\"poker\":[51,7,37,33,20],\"size\":0,\"win\":-60}}}', '2018-10-15 15:45:07', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (53, NULL, 2, 1, '{\"banker_id\":132,\"banker_mul\":4,\"bet_mul\":{\"133\":20,\"131\":10,\"134\":15,\"130\":5},\"poker\":{\"130\":{\"poker\":[20,30,31,49,17],\"size\":0,\"win\":20},\"131\":{\"poker\":[10,46,51,27,50],\"size\":10,\"win\":120},\"132\":{\"poker\":[16,34,7,1,28],\"size\":0,\"win\":-360},\"133\":{\"poker\":[48,6,25,22,13],\"size\":9,\"win\":160},\"134\":{\"poker\":[26,19,21,23,45],\"size\":0,\"win\":60}}}', '2018-10-15 15:45:47', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (54, NULL, 2, 1, '{\"banker_id\":134,\"banker_mul\":4,\"bet_mul\":{\"133\":15,\"131\":5,\"132\":5,\"130\":5},\"poker\":{\"130\":{\"poker\":[25,1,36,46,14],\"size\":0,\"win\":-20},\"131\":{\"poker\":[24,44,34,16,48],\"size\":0,\"win\":-20},\"132\":{\"poker\":[50,22,28,51,11],\"size\":0,\"win\":-20},\"133\":{\"poker\":[39,30,42,0,47],\"size\":9,\"win\":120},\"134\":{\"poker\":[17,20,12,2,33],\"size\":5,\"win\":-60}}}', '2018-10-15 15:46:27', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (55, NULL, 2, 1, '{\"banker_id\":133,\"banker_mul\":4,\"bet_mul\":{\"134\":5,\"131\":20,\"132\":15,\"130\":5},\"poker\":{\"130\":{\"poker\":[6,32,19,47,25],\"size\":0,\"win\":-20},\"131\":{\"poker\":[28,4,30,33,7],\"size\":0,\"win\":-80},\"132\":{\"poker\":[3,27,23,39,41],\"size\":0,\"win\":-60},\"133\":{\"poker\":[1,15,9,22,43],\"size\":4,\"win\":100},\"134\":{\"poker\":[34,21,36,13,2],\"size\":10,\"win\":60}}}', '2018-10-15 15:47:07', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (56, NULL, 2, 1, '{\"banker_id\":131,\"banker_mul\":4,\"bet_mul\":{\"134\":5,\"133\":10,\"132\":20,\"130\":5},\"poker\":{\"130\":{\"poker\":[38,13,49,48,29],\"size\":2,\"win\":20},\"131\":{\"poker\":[34,22,17,40,7],\"size\":2,\"win\":-340},\"132\":{\"poker\":[26,25,11,8,44],\"size\":10,\"win\":240},\"133\":{\"poker\":[1,30,15,5,36],\"size\":5,\"win\":40},\"134\":{\"poker\":[21,2,27,43,4],\"size\":6,\"win\":40}}}', '2018-10-15 15:47:47', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (57, NULL, 2, 1, '{\"banker_id\":132,\"banker_mul\":3,\"bet_mul\":{\"131\":10,\"133\":10,\"134\":20,\"130\":5},\"poker\":{\"130\":{\"poker\":[18,27,50,5,49],\"size\":0,\"win\":-15},\"131\":{\"poker\":[32,6,17,8,46],\"size\":9,\"win\":-60},\"132\":{\"poker\":[19,26,37,36,28],\"size\":10,\"win\":165},\"133\":{\"poker\":[51,12,24,13,22],\"size\":1,\"win\":-30},\"134\":{\"poker\":[40,16,31,0,34],\"size\":3,\"win\":-60}}}', '2018-10-15 15:48:27', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (58, NULL, 2, 1, '{\"banker_id\":131,\"banker_mul\":4,\"bet_mul\":{\"132\":15,\"133\":5,\"134\":5,\"130\":5},\"poker\":{\"130\":{\"poker\":[36,37,35,6,33],\"size\":10,\"win\":60},\"131\":{\"poker\":[43,17,27,51,25],\"size\":0,\"win\":-80},\"132\":{\"poker\":[11,22,7,44,40],\"size\":0,\"win\":-60},\"133\":{\"poker\":[34,41,29,8,32],\"size\":9,\"win\":40},\"134\":{\"poker\":[13,20,50,49,31],\"size\":8,\"win\":40}}}', '2018-10-15 15:49:07', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (59, NULL, 2, 1, '{\"banker_id\":132,\"banker_mul\":3,\"bet_mul\":{\"133\":10,\"131\":5,\"134\":5,\"130\":5},\"poker\":{\"130\":{\"poker\":[9,23,31,27,15],\"size\":0,\"win\":-15},\"131\":{\"poker\":[28,17,45,14,2],\"size\":8,\"win\":30},\"132\":{\"poker\":[49,11,34,12,25],\"size\":3,\"win\":30},\"133\":{\"poker\":[4,22,43,24,35],\"size\":0,\"win\":-30},\"134\":{\"poker\":[50,7,39,38,44],\"size\":2,\"win\":-15}}}', '2018-10-15 15:49:47', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (60, NULL, 2, 1, '{\"banker_id\":134,\"banker_mul\":3,\"bet_mul\":{\"133\":10,\"132\":20,\"131\":20,\"130\":5},\"poker\":{\"130\":{\"poker\":[5,0,27,11,29],\"size\":1,\"win\":-15},\"131\":{\"poker\":[13,22,30,40,51],\"size\":8,\"win\":120},\"132\":{\"poker\":[10,43,7,35,28],\"size\":2,\"win\":-60},\"133\":{\"poker\":[12,8,36,21,38],\"size\":3,\"win\":30},\"134\":{\"poker\":[2,18,34,20,4],\"size\":3,\"win\":-75}}}', '2018-10-15 15:50:28', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (61, NULL, 2, 1, '{\"banker_id\":134,\"banker_mul\":2,\"bet_mul\":{\"131\":20,\"133\":5,\"132\":5,\"130\":5},\"poker\":{\"130\":{\"poker\":[50,41,16,6,26],\"size\":0,\"win\":10},\"131\":{\"poker\":[31,18,3,8,22],\"size\":3,\"win\":40},\"132\":{\"poker\":[42,29,38,30,24],\"size\":0,\"win\":-10},\"133\":{\"poker\":[17,51,44,35,15],\"size\":0,\"win\":10},\"134\":{\"poker\":[48,27,1,25,14],\"size\":0,\"win\":-50}}}', '2018-10-15 15:51:08', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (62, NULL, 2, 1, '{\"banker_id\":134,\"banker_mul\":3,\"bet_mul\":{\"133\":20,\"131\":15,\"132\":5,\"130\":5},\"poker\":{\"130\":{\"poker\":[26,49,38,12,18],\"size\":0,\"win\":15},\"131\":{\"poker\":[44,45,0,47,14],\"size\":5,\"win\":45},\"132\":{\"poker\":[32,50,48,51,3],\"size\":10,\"win\":45},\"133\":{\"poker\":[21,8,35,16,39],\"size\":3,\"win\":60},\"134\":{\"poker\":[42,33,46,19,4],\"size\":0,\"win\":-165}}}', '2018-10-15 15:51:48', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (63, NULL, 2, 1, '{\"banker_id\":134,\"banker_mul\":2,\"bet_mul\":{\"133\":20,\"131\":10,\"132\":10,\"130\":5},\"poker\":{\"130\":{\"poker\":[46,20,30,50,47],\"size\":4,\"win\":-10},\"131\":{\"poker\":[51,39,9,31,16],\"size\":0,\"win\":-20},\"132\":{\"poker\":[38,0,15,7,10],\"size\":0,\"win\":-20},\"133\":{\"poker\":[11,4,43,13,25],\"size\":6,\"win\":-80},\"134\":{\"poker\":[14,19,23,35,18],\"size\":9,\"win\":130}}}', '2018-10-15 15:52:28', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (64, NULL, 2, 1, '{\"banker_id\":132,\"banker_mul\":4,\"bet_mul\":{\"131\":20,\"133\":5,\"134\":10,\"130\":5},\"poker\":{\"130\":{\"poker\":[4,16,25,14,2],\"size\":9,\"win\":40},\"131\":{\"poker\":[13,19,32,5,50],\"size\":0,\"win\":80},\"132\":{\"poker\":[28,46,34,35,38],\"size\":0,\"win\":-220},\"133\":{\"poker\":[51,33,45,40,0],\"size\":10,\"win\":60},\"134\":{\"poker\":[17,24,37,15,48],\"size\":0,\"win\":40}}}', '2018-10-15 15:53:08', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (65, NULL, 2, 1, '{\"banker_id\":134,\"banker_mul\":3,\"bet_mul\":{\"133\":15,\"131\":5,\"132\":5,\"130\":5},\"poker\":{\"130\":{\"poker\":[50,24,15,49,39],\"size\":1,\"win\":15},\"131\":{\"poker\":[6,27,19,25,33],\"size\":0,\"win\":-15},\"132\":{\"poker\":[26,11,2,21,46],\"size\":7,\"win\":30},\"133\":{\"poker\":[31,36,35,14,32],\"size\":0,\"win\":-45},\"134\":{\"poker\":[1,44,8,7,18],\"size\":1,\"win\":15}}}', '2018-10-15 15:53:48', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (66, NULL, 2, 1, '{\"banker_id\":133,\"banker_mul\":2,\"bet_mul\":{\"134\":15,\"131\":10,\"132\":15,\"130\":5},\"poker\":{\"130\":{\"poker\":[8,30,28,5,42],\"size\":1,\"win\":10},\"131\":{\"poker\":[7,51,34,15,41],\"size\":0,\"win\":20},\"132\":{\"poker\":[0,6,49,43,11],\"size\":0,\"win\":30},\"133\":{\"poker\":[20,21,37,4,19],\"size\":0,\"win\":-120},\"134\":{\"poker\":[16,26,44,29,33],\"size\":9,\"win\":60}}}', '2018-10-15 15:54:28', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (67, NULL, 2, 1, '{\"banker_id\":134,\"banker_mul\":4,\"bet_mul\":{\"131\":15,\"132\":20,\"133\":5,\"130\":5},\"poker\":{\"130\":{\"poker\":[49,28,4,8,35],\"size\":2,\"win\":-20},\"131\":{\"poker\":[37,21,13,50,19],\"size\":5,\"win\":-60},\"132\":{\"poker\":[0,16,9,46,26],\"size\":6,\"win\":-160},\"133\":{\"poker\":[1,38,12,47,33],\"size\":4,\"win\":-20},\"134\":{\"poker\":[48,10,23,39,43],\"size\":9,\"win\":260}}}', '2018-10-15 15:55:08', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (68, NULL, 2, 1, '{\"banker_id\":131,\"banker_mul\":4,\"bet_mul\":{\"132\":20,\"133\":15,\"134\":15,\"130\":5},\"poker\":{\"130\":{\"poker\":[7,20,9,31,8],\"size\":0,\"win\":-20},\"131\":{\"poker\":[17,15,48,5,6],\"size\":0,\"win\":-140},\"132\":{\"poker\":[29,46,43,50,47],\"size\":8,\"win\":160},\"133\":{\"poker\":[45,23,36,28,25],\"size\":0,\"win\":-60},\"134\":{\"poker\":[42,13,49,34,44],\"size\":3,\"win\":60}}}', '2018-10-15 15:55:48', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (69, NULL, 2, 1, '{\"banker_id\":131,\"banker_mul\":2,\"bet_mul\":{\"132\":5,\"134\":20,\"133\":5,\"130\":5},\"poker\":{\"130\":{\"poker\":[39,14,47,7,15],\"size\":10,\"win\":30},\"131\":{\"poker\":[2,41,0,28,3],\"size\":1,\"win\":-70},\"132\":{\"poker\":[25,22,16,24,27],\"size\":2,\"win\":10},\"133\":{\"poker\":[50,32,31,33,40],\"size\":0,\"win\":-10},\"134\":{\"poker\":[1,9,21,13,46],\"size\":4,\"win\":40}}}', '2018-10-15 15:56:28', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (70, NULL, 2, 1, '{\"banker_id\":131,\"banker_mul\":2,\"bet_mul\":{\"130\":15,\"133\":15,\"134\":5,\"132\":5},\"poker\":{\"130\":{\"poker\":[11,30,34,23,36],\"size\":6,\"win\":60},\"131\":{\"poker\":[9,2,42,48,12],\"size\":0,\"win\":-120},\"134\":{\"poker\":[0,50,26,39,31],\"size\":0,\"win\":10},\"132\":{\"poker\":[45,15,18,35,3],\"size\":9,\"win\":20},\"133\":{\"poker\":[33,4,16,49,41],\"size\":0,\"win\":30}}}', '2018-10-15 15:57:23', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (71, NULL, 2, 1, '{\"banker_id\":133,\"banker_mul\":1,\"bet_mul\":{\"132\":15,\"134\":20,\"131\":5,\"130\":10},\"poker\":{\"130\":{\"poker\":[25,20,2,12,24],\"size\":5,\"win\":10},\"133\":{\"poker\":[47,50,39,7,51],\"size\":2,\"win\":-30},\"131\":{\"poker\":[0,45,11,18,41],\"size\":0,\"win\":-5},\"132\":{\"poker\":[48,8,34,4,27],\"size\":1,\"win\":-15},\"134\":{\"poker\":[36,31,5,3,17],\"size\":6,\"win\":40}}}', '2018-10-15 15:58:28', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (72, NULL, 2, 1, '{\"banker_id\":131,\"banker_mul\":3,\"bet_mul\":{\"133\":15,\"132\":15,\"134\":10,\"130\":10},\"poker\":{\"130\":{\"poker\":[43,21,29,31,35],\"size\":0,\"win\":-30},\"131\":{\"poker\":[20,2,14,40,10],\"size\":4,\"win\":-255},\"132\":{\"poker\":[11,26,23,3,7],\"size\":9,\"win\":90},\"133\":{\"poker\":[18,4,28,37,16],\"size\":10,\"win\":135},\"134\":{\"poker\":[41,9,46,44,8],\"size\":6,\"win\":60}}}', '2018-10-15 15:59:36', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (73, NULL, 2, 1, '{\"banker_id\":131,\"banker_mul\":4,\"bet_mul\":{\"133\":5,\"134\":10,\"132\":20,\"130\":5},\"poker\":{\"130\":{\"poker\":[47,0,26,13,37],\"size\":0,\"win\":-20},\"131\":{\"poker\":[28,27,2,10,19],\"size\":4,\"win\":-160},\"132\":{\"poker\":[24,42,30,32,8],\"size\":7,\"win\":160},\"133\":{\"poker\":[39,18,4,50,15],\"size\":0,\"win\":-20},\"134\":{\"poker\":[44,51,6,45,9],\"size\":5,\"win\":40}}}', '2018-10-15 16:00:09', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (74, NULL, 2, 1, '{\"banker_id\":131,\"banker_mul\":3,\"bet_mul\":{\"133\":20,\"132\":20,\"134\":10,\"130\":5},\"poker\":{\"130\":{\"poker\":[3,51,20,34,2],\"size\":7,\"win\":30},\"131\":{\"poker\":[24,50,41,8,21],\"size\":6,\"win\":120},\"132\":{\"poker\":[7,30,5,35,37],\"size\":1,\"win\":-60},\"133\":{\"poker\":[46,42,29,17,13],\"size\":0,\"win\":-60},\"134\":{\"poker\":[38,31,36,28,1],\"size\":0,\"win\":-30}}}', '2018-10-15 16:00:49', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (75, NULL, 2, 1, '{\"banker_id\":134,\"banker_mul\":2,\"bet_mul\":{\"131\":5,\"133\":15,\"132\":15,\"130\":5},\"poker\":{\"130\":{\"poker\":[16,43,48,51,20],\"size\":1,\"win\":-10},\"131\":{\"poker\":[4,26,44,5,28],\"size\":9,\"win\":-20},\"132\":{\"poker\":[38,47,42,45,49],\"size\":10,\"win\":-90},\"133\":{\"poker\":[37,22,9,12,8],\"size\":6,\"win\":-60},\"134\":{\"poker\":[50,33,30,39,11],\"size\":10,\"win\":180}}}', '2018-10-15 16:01:29', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (76, NULL, 2, 1, '{\"banker_id\":133,\"banker_mul\":3,\"bet_mul\":{\"131\":5,\"132\":10,\"134\":5,\"130\":5},\"poker\":{\"130\":{\"poker\":[35,41,19,43,45],\"size\":4,\"win\":15},\"131\":{\"poker\":[50,6,27,36,11],\"size\":2,\"win\":15},\"132\":{\"poker\":[16,1,14,34,10],\"size\":2,\"win\":-30},\"133\":{\"poker\":[37,46,42,2,0],\"size\":2,\"win\":-15},\"134\":{\"poker\":[26,20,47,25,9],\"size\":3,\"win\":15}}}', '2018-10-15 16:02:10', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (77, NULL, 2, 1, '{\"banker_id\":134,\"banker_mul\":2,\"bet_mul\":{\"132\":5,\"133\":10,\"131\":10,\"130\":5},\"poker\":{\"130\":{\"poker\":[19,25,42,43,9],\"size\":5,\"win\":-10},\"131\":{\"poker\":[16,37,50,30,7],\"size\":5,\"win\":-20},\"132\":{\"poker\":[2,33,4,1,46],\"size\":3,\"win\":-10},\"133\":{\"poker\":[10,28,17,31,41],\"size\":0,\"win\":-20},\"134\":{\"poker\":[11,24,40,0,35],\"size\":10,\"win\":60}}}', '2018-10-15 16:02:50', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (78, NULL, 2, 1, '{\"banker_id\":132,\"banker_mul\":4,\"bet_mul\":{\"131\":10,\"133\":20,\"134\":20,\"130\":5},\"poker\":{\"130\":{\"poker\":[16,34,28,40,24],\"size\":9,\"win\":40},\"131\":{\"poker\":[4,51,3,23,29],\"size\":7,\"win\":80},\"132\":{\"poker\":[8,44,42,33,19],\"size\":0,\"win\":-360},\"133\":{\"poker\":[36,30,13,45,25],\"size\":0,\"win\":80},\"134\":{\"poker\":[10,9,14,12,18],\"size\":9,\"win\":160}}}', '2018-10-15 16:03:30', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (79, NULL, 2, 1, '{\"banker_id\":131,\"banker_mul\":4,\"bet_mul\":{\"133\":10,\"132\":5,\"134\":20,\"130\":5},\"poker\":{\"130\":{\"poker\":[18,41,24,31,45],\"size\":10,\"win\":60},\"131\":{\"poker\":[28,37,5,1,36],\"size\":1,\"win\":-80},\"132\":{\"poker\":[3,21,11,48,2],\"size\":1,\"win\":20},\"133\":{\"poker\":[32,26,47,14,25],\"size\":7,\"win\":80},\"134\":{\"poker\":[49,38,13,30,27],\"size\":0,\"win\":-80}}}', '2018-10-15 16:04:10', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (80, NULL, 2, 1, '{\"banker_id\":131,\"banker_mul\":3,\"bet_mul\":{\"132\":15,\"133\":20,\"134\":20,\"130\":5},\"poker\":{\"130\":{\"poker\":[41,37,17,48,44],\"size\":5,\"win\":-15},\"131\":{\"poker\":[35,38,16,22,29],\"size\":8,\"win\":240},\"132\":{\"poker\":[47,18,10,21,27],\"size\":1,\"win\":-45},\"133\":{\"poker\":[45,32,39,20,2],\"size\":6,\"win\":-120},\"134\":{\"poker\":[51,24,43,40,30],\"size\":5,\"win\":-60}}}', '2018-10-15 16:04:50', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (81, NULL, 2, 1, '{\"banker_id\":133,\"banker_mul\":4,\"bet_mul\":{\"132\":5,\"134\":15,\"131\":20,\"130\":5},\"poker\":{\"130\":{\"poker\":[6,14,39,42,19],\"size\":0,\"win\":-20},\"131\":{\"poker\":[48,35,15,34,0],\"size\":3,\"win\":80},\"132\":{\"poker\":[20,43,2,45,22],\"size\":0,\"win\":-20},\"133\":{\"poker\":[31,29,47,23,36],\"size\":0,\"win\":-100},\"134\":{\"poker\":[33,40,12,8,21],\"size\":2,\"win\":60}}}', '2018-10-15 16:05:30', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (82, NULL, 2, 1, '{\"banker_id\":131,\"banker_mul\":4,\"bet_mul\":{\"133\":10,\"134\":15,\"132\":20,\"130\":5},\"poker\":{\"130\":{\"poker\":[21,18,0,2,35],\"size\":2,\"win\":-20},\"131\":{\"poker\":[45,47,13,6,37],\"size\":6,\"win\":100},\"132\":{\"poker\":[26,39,16,9,33],\"size\":4,\"win\":-80},\"133\":{\"poker\":[15,12,40,38,4],\"size\":10,\"win\":120},\"134\":{\"poker\":[11,20,42,24,46],\"size\":6,\"win\":-120}}}', '2018-10-15 16:06:10', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (83, NULL, 2, 1, '{\"banker_id\":132,\"banker_mul\":4,\"bet_mul\":{\"131\":20,\"134\":15,\"133\":5,\"130\":5},\"poker\":{\"130\":{\"poker\":[18,34,23,1,33],\"size\":10,\"win\":60},\"131\":{\"poker\":[44,35,31,2,42],\"size\":8,\"win\":160},\"132\":{\"poker\":[26,48,7,43,19],\"size\":0,\"win\":-320},\"133\":{\"poker\":[32,11,25,41,24],\"size\":6,\"win\":40},\"134\":{\"poker\":[45,16,50,5,21],\"size\":0,\"win\":60}}}', '2018-10-15 16:06:50', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (84, NULL, 2, 1, '{\"banker_id\":134,\"banker_mul\":2,\"bet_mul\":{\"131\":10,\"133\":10,\"132\":15,\"130\":5},\"poker\":{\"130\":{\"poker\":[15,7,30,11,22],\"size\":0,\"win\":-10},\"131\":{\"poker\":[13,27,46,9,10],\"size\":7,\"win\":40},\"132\":{\"poker\":[3,12,41,19,32],\"size\":9,\"win\":60},\"133\":{\"poker\":[0,29,17,18,48],\"size\":9,\"win\":40},\"134\":{\"poker\":[14,24,39,26,49],\"size\":0,\"win\":-130}}}', '2018-10-15 16:07:30', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (85, NULL, 2, 1, '{\"banker_id\":134,\"banker_mul\":4,\"bet_mul\":{\"133\":5,\"131\":10,\"132\":10,\"130\":5},\"poker\":{\"130\":{\"poker\":[19,34,38,17,7],\"size\":1,\"win\":20},\"131\":{\"poker\":[14,47,39,23,16],\"size\":5,\"win\":40},\"132\":{\"poker\":[0,25,10,2,33],\"size\":0,\"win\":-40},\"133\":{\"poker\":[9,8,30,32,31],\"size\":1,\"win\":20},\"134\":{\"poker\":[40,42,20,24,4],\"size\":0,\"win\":-40}}}', '2018-10-15 16:08:10', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (86, NULL, 2, 1, '{\"banker_id\":134,\"banker_mul\":2,\"bet_mul\":{\"133\":15,\"131\":5,\"132\":15,\"130\":5},\"poker\":{\"130\":{\"poker\":[9,43,25,50,5],\"size\":2,\"win\":-10},\"131\":{\"poker\":[24,40,18,34,22],\"size\":7,\"win\":20},\"132\":{\"poker\":[45,42,3,12,20],\"size\":1,\"win\":-30},\"133\":{\"poker\":[48,26,36,27,19],\"size\":0,\"win\":-30},\"134\":{\"poker\":[49,7,8,33,1],\"size\":5,\"win\":50}}}', '2018-10-15 16:08:50', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (87, NULL, 2, 1, '{\"banker_id\":131,\"banker_mul\":4,\"bet_mul\":{\"132\":15,\"133\":10,\"134\":15,\"130\":5},\"poker\":{\"130\":{\"poker\":[4,40,11,21,22],\"size\":0,\"win\":-20},\"131\":{\"poker\":[42,32,24,6,16],\"size\":0,\"win\":-260},\"132\":{\"poker\":[39,48,19,17,36],\"size\":10,\"win\":180},\"133\":{\"poker\":[34,5,26,23,46],\"size\":0,\"win\":40},\"134\":{\"poker\":[37,51,43,47,7],\"size\":2,\"win\":60}}}', '2018-10-15 16:09:30', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (88, NULL, 2, 1, '{\"banker_id\":132,\"banker_mul\":3,\"bet_mul\":{\"133\":5,\"134\":5,\"131\":20,\"130\":5},\"poker\":{\"130\":{\"poker\":[28,9,49,7,16],\"size\":8,\"win\":30},\"131\":{\"poker\":[22,45,21,18,50],\"size\":0,\"win\":-60},\"132\":{\"poker\":[42,35,8,11,1],\"size\":6,\"win\":15},\"133\":{\"poker\":[27,5,2,20,48],\"size\":6,\"win\":30},\"134\":{\"poker\":[33,15,4,40,34],\"size\":4,\"win\":-15}}}', '2018-10-15 16:10:10', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (89, NULL, 2, 1, '{\"banker_id\":131,\"banker_mul\":4,\"bet_mul\":{\"130\":10,\"132\":10,\"133\":10,\"134\":20},\"poker\":{\"130\":{\"poker\":[34,32,47,35,10],\"size\":0,\"win\":-40},\"131\":{\"poker\":[6,26,49,39,5],\"size\":0,\"win\":-280},\"132\":{\"poker\":[45,44,40,11,14],\"size\":7,\"win\":80},\"133\":{\"poker\":[3,31,12,42,23],\"size\":9,\"win\":80},\"134\":{\"poker\":[30,21,27,51,24],\"size\":8,\"win\":160}}}', '2018-10-15 16:11:20', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (90, NULL, 2, 1, '{\"banker_id\":132,\"banker_mul\":3,\"bet_mul\":{\"131\":10,\"133\":5,\"134\":20,\"130\":5},\"poker\":{\"130\":{\"poker\":[49,11,2,12,8],\"size\":1,\"win\":-15},\"131\":{\"poker\":[15,43,23,37,31],\"size\":8,\"win\":-60},\"132\":{\"poker\":[32,35,39,25,13],\"size\":9,\"win\":150},\"133\":{\"poker\":[14,20,29,40,26],\"size\":5,\"win\":-15},\"134\":{\"poker\":[41,38,1,21,24],\"size\":0,\"win\":-60}}}', '2018-10-15 16:11:53', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (91, NULL, 2, 1, '{\"banker_id\":134,\"banker_mul\":1,\"bet_mul\":{\"131\":10,\"133\":10,\"132\":20,\"130\":5},\"poker\":{\"130\":{\"poker\":[33,3,17,15,46],\"size\":9,\"win\":10},\"134\":{\"poker\":[28,27,47,41,40],\"size\":5,\"win\":-30},\"131\":{\"poker\":[44,20,16,19,31],\"size\":4,\"win\":-10},\"132\":{\"poker\":[0,35,45,22,2],\"size\":7,\"win\":40},\"133\":{\"poker\":[10,4,38,34,14],\"size\":0,\"win\":-10}}}', '2018-10-15 16:13:20', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (92, NULL, 2, 1, '{\"banker_id\":134,\"banker_mul\":3,\"bet_mul\":{\"131\":10,\"132\":20,\"133\":10,\"130\":5},\"poker\":{\"130\":{\"poker\":[41,31,46,35,3],\"size\":8,\"win\":30},\"134\":{\"poker\":[8,47,30,34,12],\"size\":4,\"win\":-30},\"131\":{\"poker\":[48,50,45,17,16],\"size\":10,\"win\":90},\"132\":{\"poker\":[49,21,24,20,5],\"size\":0,\"win\":-60},\"133\":{\"poker\":[6,10,42,4,23],\"size\":3,\"win\":-30}}}', '2018-10-15 16:14:00', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (93, NULL, 2, 1, '{\"banker_id\":131,\"banker_mul\":3,\"bet_mul\":{\"132\":5,\"134\":20,\"133\":20,\"130\":5},\"poker\":{\"130\":{\"poker\":[23,22,43,47,26],\"size\":0,\"win\":-15},\"134\":{\"poker\":[1,37,20,29,6],\"size\":7,\"win\":-120},\"131\":{\"poker\":[3,41,24,11,33],\"size\":10,\"win\":210},\"132\":{\"poker\":[34,32,9,38,40],\"size\":0,\"win\":-15},\"133\":{\"poker\":[31,39,19,28,14],\"size\":5,\"win\":-60}}}', '2018-10-15 16:14:40', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (94, NULL, 2, 1, '{\"banker_id\":131,\"banker_mul\":4,\"bet_mul\":{\"132\":5,\"134\":15,\"133\":10,\"130\":5},\"poker\":{\"130\":{\"poker\":[3,9,14,20,44],\"size\":4,\"win\":-20},\"134\":{\"poker\":[11,2,4,38,49],\"size\":0,\"win\":-60},\"131\":{\"poker\":[47,27,10,32,42],\"size\":9,\"win\":-20},\"132\":{\"poker\":[17,31,7,36,33],\"size\":4,\"win\":-20},\"133\":{\"poker\":[29,13,8,23,34],\"size\":10,\"win\":120}}}', '2018-10-15 16:15:20', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (95, NULL, 2, 1, '{\"banker_id\":132,\"banker_mul\":1,\"bet_mul\":{\"131\":20,\"134\":5,\"133\":5,\"130\":5},\"poker\":{\"130\":{\"poker\":[19,50,0,32,51],\"size\":5,\"win\":5},\"134\":{\"poker\":[29,44,4,6,8],\"size\":5,\"win\":5},\"131\":{\"poker\":[2,42,36,15,12],\"size\":0,\"win\":-20},\"132\":{\"poker\":[9,18,3,30,49],\"size\":0,\"win\":0},\"133\":{\"poker\":[17,43,1,31,14],\"size\":8,\"win\":10}}}', '2018-10-15 16:16:00', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (96, NULL, 2, 1, '{\"banker_id\":132,\"banker_mul\":4,\"bet_mul\":{\"134\":10,\"131\":5,\"133\":20,\"130\":5},\"poker\":{\"130\":{\"poker\":[32,47,24,29,8],\"size\":7,\"win\":40},\"134\":{\"poker\":[31,36,1,48,12],\"size\":0,\"win\":-40},\"131\":{\"poker\":[26,41,45,11,28],\"size\":8,\"win\":40},\"132\":{\"poker\":[19,9,50,40,3],\"size\":0,\"win\":40},\"133\":{\"poker\":[5,34,43,16,13],\"size\":0,\"win\":-80}}}', '2018-10-15 16:16:40', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (97, NULL, 2, 1, '{\"banker_id\":134,\"banker_mul\":4,\"bet_mul\":{\"131\":10,\"132\":20,\"133\":5,\"130\":5},\"poker\":{\"130\":{\"poker\":[6,50,19,44,39],\"size\":7,\"win\":40},\"134\":{\"poker\":[2,20,15,13,37],\"size\":5,\"win\":-140},\"131\":{\"poker\":[45,36,24,27,51],\"size\":4,\"win\":-40},\"132\":{\"poker\":[8,17,12,18,4],\"size\":9,\"win\":160},\"133\":{\"poker\":[16,46,7,3,43],\"size\":0,\"win\":-20}}}', '2018-10-15 16:17:20', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (98, NULL, 2, 1, '{\"banker_id\":133,\"banker_mul\":3,\"bet_mul\":{\"134\":10,\"132\":10,\"131\":20,\"130\":5},\"poker\":{\"130\":{\"poker\":[25,29,39,17,0],\"size\":1,\"win\":-15},\"134\":{\"poker\":[45,6,36,10,1],\"size\":0,\"win\":-30},\"131\":{\"poker\":[21,3,37,13,40],\"size\":1,\"win\":-60},\"132\":{\"poker\":[51,47,38,12,50],\"size\":4,\"win\":-30},\"133\":{\"poker\":[30,34,11,20,9],\"size\":9,\"win\":135}}}', '2018-10-15 16:18:00', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (99, NULL, 2, 1, '{\"banker_id\":132,\"banker_mul\":3,\"bet_mul\":{\"134\":10,\"131\":15,\"133\":5,\"130\":5},\"poker\":{\"130\":{\"poker\":[12,10,36,35,15],\"size\":0,\"win\":-15},\"134\":{\"poker\":[21,42,27,31,40],\"size\":0,\"win\":-30},\"131\":{\"poker\":[24,23,13,14,32],\"size\":10,\"win\":135},\"132\":{\"poker\":[49,29,20,19,30],\"size\":0,\"win\":-75},\"133\":{\"poker\":[0,22,44,5,18],\"size\":0,\"win\":-15}}}', '2018-10-15 16:18:40', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (100, NULL, 2, 1, '{\"banker_id\":134,\"banker_mul\":4,\"bet_mul\":{\"131\":15,\"133\":15,\"132\":5,\"130\":5},\"poker\":{\"130\":{\"poker\":[42,16,41,12,48],\"size\":9,\"win\":40},\"134\":{\"poker\":[13,35,14,10,8],\"size\":3,\"win\":-140},\"131\":{\"poker\":[39,37,30,15,23],\"size\":8,\"win\":120},\"132\":{\"poker\":[24,36,20,4,6],\"size\":7,\"win\":40},\"133\":{\"poker\":[7,2,43,31,3],\"size\":2,\"win\":-60}}}', '2018-10-15 16:19:20', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (101, NULL, 2, 1, '{\"banker_id\":132,\"banker_mul\":4,\"bet_mul\":{\"134\":15,\"131\":20,\"133\":5,\"130\":5},\"poker\":{\"130\":{\"poker\":[43,47,14,27,44],\"size\":1,\"win\":20},\"134\":{\"poker\":[33,12,31,51,25],\"size\":8,\"win\":120},\"131\":{\"poker\":[46,26,5,32,11],\"size\":1,\"win\":80},\"132\":{\"poker\":[28,50,40,10,15],\"size\":0,\"win\":-260},\"133\":{\"poker\":[4,19,29,35,8],\"size\":7,\"win\":40}}}', '2018-10-15 16:20:00', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (102, NULL, 2, 1, '{\"banker_id\":132,\"banker_mul\":4,\"bet_mul\":{\"134\":10,\"133\":20,\"131\":20,\"130\":5},\"poker\":{\"130\":{\"poker\":[31,45,16,39,50],\"size\":3,\"win\":-20},\"134\":{\"poker\":[28,37,47,13,14],\"size\":0,\"win\":-40},\"131\":{\"poker\":[0,40,32,12,35],\"size\":3,\"win\":-80},\"132\":{\"poker\":[25,19,48,38,9],\"size\":5,\"win\":220},\"133\":{\"poker\":[18,41,20,43,11],\"size\":0,\"win\":-80}}}', '2018-10-15 16:20:40', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (103, NULL, 2, 1, '{\"banker_id\":134,\"banker_mul\":3,\"bet_mul\":{\"132\":10,\"133\":10,\"131\":20,\"130\":5},\"poker\":{\"130\":{\"poker\":[1,17,22,0,13],\"size\":7,\"win\":30},\"134\":{\"poker\":[27,4,49,36,26],\"size\":0,\"win\":-210},\"131\":{\"poker\":[21,2,5,11,14],\"size\":6,\"win\":120},\"132\":{\"poker\":[29,34,24,23,9],\"size\":3,\"win\":30},\"133\":{\"poker\":[33,42,43,40,15],\"size\":3,\"win\":30}}}', '2018-10-15 16:21:20', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (104, NULL, 2, 1, '{\"banker_id\":132,\"banker_mul\":4,\"bet_mul\":{\"134\":5,\"131\":20,\"133\":20,\"130\":5},\"poker\":{\"130\":{\"poker\":[48,39,46,7,28],\"size\":10,\"win\":60},\"134\":{\"poker\":[26,43,1,30,47],\"size\":0,\"win\":-20},\"131\":{\"poker\":[51,41,35,6,25],\"size\":0,\"win\":-80},\"132\":{\"poker\":[19,31,44,23,20],\"size\":5,\"win\":120},\"133\":{\"poker\":[40,11,50,8,9],\"size\":0,\"win\":-80}}}', '2018-10-15 16:22:00', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (105, NULL, 2, 1, '{\"banker_id\":132,\"banker_mul\":4,\"bet_mul\":{\"131\":15,\"134\":5,\"133\":10,\"130\":5},\"poker\":{\"130\":{\"poker\":[44,12,5,45,16],\"size\":0,\"win\":-20},\"134\":{\"poker\":[4,30,9,17,40],\"size\":8,\"win\":40},\"131\":{\"poker\":[42,51,34,18,25],\"size\":0,\"win\":-60},\"132\":{\"poker\":[27,24,46,48,8],\"size\":7,\"win\":80},\"133\":{\"poker\":[29,36,50,33,28],\"size\":0,\"win\":-40}}}', '2018-10-15 16:22:40', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (106, NULL, 2, 1, '{\"banker_id\":132,\"banker_mul\":2,\"bet_mul\":{\"134\":10,\"131\":15,\"133\":5,\"130\":5},\"poker\":{\"130\":{\"poker\":[42,50,32,13,9],\"size\":0,\"win\":-10},\"134\":{\"poker\":[17,15,3,14,40],\"size\":4,\"win\":20},\"131\":{\"poker\":[18,34,25,1,36],\"size\":2,\"win\":-30},\"132\":{\"poker\":[39,24,43,37,16],\"size\":2,\"win\":10},\"133\":{\"poker\":[11,12,38,20,5],\"size\":5,\"win\":10}}}', '2018-10-15 16:23:20', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (107, NULL, 2, 1, '{\"banker_id\":132,\"banker_mul\":4,\"bet_mul\":{\"133\":20,\"134\":5,\"131\":15,\"130\":5},\"poker\":{\"130\":{\"poker\":[45,50,13,35,48],\"size\":3,\"win\":20},\"134\":{\"poker\":[47,19,44,40,20],\"size\":1,\"win\":20},\"131\":{\"poker\":[4,31,33,12,9],\"size\":6,\"win\":120},\"132\":{\"poker\":[30,2,42,15,26],\"size\":0,\"win\":-240},\"133\":{\"poker\":[39,27,1,0,7],\"size\":1,\"win\":80}}}', '2018-10-15 16:24:00', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (108, NULL, 2, 1, '{\"banker_id\":134,\"banker_mul\":3,\"bet_mul\":{\"131\":5,\"133\":20,\"132\":15,\"130\":5},\"poker\":{\"130\":{\"poker\":[18,15,31,9,2],\"size\":1,\"win\":-15},\"134\":{\"poker\":[12,47,24,8,1],\"size\":5,\"win\":-45},\"131\":{\"poker\":[35,38,29,11,16],\"size\":5,\"win\":-15},\"132\":{\"poker\":[41,20,42,7,22],\"size\":0,\"win\":-45},\"133\":{\"poker\":[30,3,39,19,17],\"size\":9,\"win\":120}}}', '2018-10-15 16:24:40', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (109, NULL, 2, 1, '{\"banker_id\":131,\"banker_mul\":4,\"bet_mul\":{\"133\":10,\"134\":5,\"132\":10,\"130\":5},\"poker\":{\"130\":{\"poker\":[46,4,36,10,26],\"size\":2,\"win\":-20},\"134\":{\"poker\":[41,32,44,47,8],\"size\":2,\"win\":-20},\"131\":{\"poker\":[3,17,24,30,5],\"size\":3,\"win\":-80},\"132\":{\"poker\":[15,11,40,22,13],\"size\":7,\"win\":80},\"133\":{\"poker\":[1,21,19,34,7],\"size\":3,\"win\":40}}}', '2018-10-15 16:25:20', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (110, NULL, 2, 1, '{\"banker_id\":134,\"banker_mul\":3,\"bet_mul\":{\"131\":5,\"133\":10,\"132\":10,\"130\":5},\"poker\":{\"130\":{\"poker\":[11,23,42,22,31],\"size\":3,\"win\":15},\"134\":{\"poker\":[47,10,17,33,16],\"size\":2,\"win\":-60},\"131\":{\"poker\":[12,48,15,1,19],\"size\":4,\"win\":15},\"132\":{\"poker\":[40,6,51,2,30],\"size\":1,\"win\":-30},\"133\":{\"poker\":[41,13,46,24,21],\"size\":7,\"win\":60}}}', '2018-10-15 16:26:00', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (111, NULL, 2, 1, '{\"banker_id\":133,\"banker_mul\":4,\"bet_mul\":{\"132\":5,\"134\":5,\"131\":20,\"130\":5},\"poker\":{\"130\":{\"poker\":[14,34,31,47,50],\"size\":0,\"win\":-20},\"134\":{\"poker\":[24,26,43,37,19],\"size\":0,\"win\":-20},\"131\":{\"poker\":[30,11,35,20,22],\"size\":2,\"win\":-80},\"132\":{\"poker\":[25,17,2,36,3],\"size\":0,\"win\":-20},\"133\":{\"poker\":[42,12,4,39,49],\"size\":6,\"win\":140}}}', '2018-10-15 16:26:40', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (112, NULL, 2, 1, '{\"banker_id\":133,\"banker_mul\":4,\"bet_mul\":{\"134\":5,\"132\":20,\"131\":15,\"130\":5},\"poker\":{\"130\":{\"poker\":[40,30,23,18,12],\"size\":3,\"win\":20},\"134\":{\"poker\":[26,14,1,15,2],\"size\":0,\"win\":-20},\"131\":{\"poker\":[31,39,25,37,51],\"size\":5,\"win\":60},\"132\":{\"poker\":[9,0,33,5,32],\"size\":4,\"win\":80},\"133\":{\"poker\":[6,24,43,22,35],\"size\":0,\"win\":-140}}}', '2018-10-15 16:27:20', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (113, NULL, 2, 1, '{\"banker_id\":133,\"banker_mul\":3,\"bet_mul\":{\"132\":10,\"134\":5,\"131\":20,\"130\":5},\"poker\":{\"130\":{\"poker\":[44,8,24,48,33],\"size\":9,\"win\":30},\"134\":{\"poker\":[15,14,45,19,27],\"size\":0,\"win\":-15},\"131\":{\"poker\":[13,18,40,31,2],\"size\":8,\"win\":120},\"132\":{\"poker\":[46,50,39,0,29],\"size\":9,\"win\":60},\"133\":{\"poker\":[35,12,21,30,17],\"size\":2,\"win\":-195}}}', '2018-10-15 16:28:00', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (114, NULL, 2, 1, '{\"banker_id\":134,\"banker_mul\":3,\"bet_mul\":{\"131\":5,\"132\":20,\"133\":20,\"130\":5},\"poker\":{\"130\":{\"poker\":[2,48,24,16,37],\"size\":0,\"win\":15},\"134\":{\"poker\":[34,7,30,3,29],\"size\":0,\"win\":-225},\"131\":{\"poker\":[15,35,10,1,46],\"size\":7,\"win\":30},\"132\":{\"poker\":[14,39,43,9,21],\"size\":3,\"win\":60},\"133\":{\"poker\":[33,18,19,42,26],\"size\":6,\"win\":120}}}', '2018-10-15 16:28:40', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (115, NULL, 2, 1, '{\"banker_id\":131,\"banker_mul\":4,\"bet_mul\":{\"134\":10,\"133\":15,\"132\":15,\"130\":5},\"poker\":{\"130\":{\"poker\":[27,6,30,16,2],\"size\":3,\"win\":-20},\"134\":{\"poker\":[43,19,49,12,24],\"size\":0,\"win\":-40},\"131\":{\"poker\":[20,1,41,50,42],\"size\":7,\"win\":-60},\"132\":{\"poker\":[37,14,31,47,28],\"size\":10,\"win\":180},\"133\":{\"poker\":[26,36,22,21,23],\"size\":0,\"win\":-60}}}', '2018-10-15 16:29:20', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (116, NULL, 2, 1, '{\"banker_id\":134,\"banker_mul\":4,\"bet_mul\":{\"131\":5,\"133\":15,\"132\":5,\"130\":5},\"poker\":{\"130\":{\"poker\":[25,48,23,19,6],\"size\":0,\"win\":-20},\"134\":{\"poker\":[0,33,1,50,10],\"size\":4,\"win\":60},\"131\":{\"poker\":[37,39,40,21,24],\"size\":3,\"win\":-20},\"132\":{\"poker\":[16,42,44,45,8],\"size\":8,\"win\":40},\"133\":{\"poker\":[26,28,27,18,22],\"size\":3,\"win\":-60}}}', '2018-10-15 16:30:00', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (117, NULL, 2, 1, '{\"banker_id\":132,\"banker_mul\":4,\"bet_mul\":{\"134\":20,\"133\":20,\"131\":15,\"130\":5},\"poker\":{\"130\":{\"poker\":[2,7,17,43,50],\"size\":0,\"win\":20},\"134\":{\"poker\":[10,46,32,1,38],\"size\":3,\"win\":80},\"131\":{\"poker\":[26,45,42,29,31],\"size\":0,\"win\":60},\"132\":{\"poker\":[25,44,24,37,3],\"size\":0,\"win\":-80},\"133\":{\"poker\":[35,33,39,41,8],\"size\":0,\"win\":-80}}}', '2018-10-15 16:30:40', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (118, NULL, 2, 1, '{\"banker_id\":134,\"banker_mul\":4,\"bet_mul\":{\"132\":20,\"131\":15,\"133\":15,\"130\":5},\"poker\":{\"130\":{\"poker\":[15,34,12,42,31],\"size\":0,\"win\":-20},\"134\":{\"poker\":[10,38,35,18,28],\"size\":5,\"win\":-20},\"131\":{\"poker\":[48,6,46,4,5],\"size\":0,\"win\":-60},\"132\":{\"poker\":[40,24,20,43,51],\"size\":3,\"win\":-80},\"133\":{\"poker\":[32,3,7,44,29],\"size\":10,\"win\":180}}}', '2018-10-15 16:31:20', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (119, NULL, 2, 1, '{\"banker_id\":133,\"banker_mul\":3,\"bet_mul\":{\"131\":20,\"134\":5,\"132\":20,\"130\":5},\"poker\":{\"130\":{\"poker\":[3,37,36,1,18],\"size\":0,\"win\":-15},\"134\":{\"poker\":[0,17,32,27,23],\"size\":8,\"win\":30},\"131\":{\"poker\":[48,22,15,19,47],\"size\":5,\"win\":60},\"132\":{\"poker\":[51,28,20,16,41],\"size\":0,\"win\":-60},\"133\":{\"poker\":[35,13,40,43,50],\"size\":3,\"win\":-15}}}', '2018-10-15 16:32:00', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (120, NULL, 2, 1, '{\"banker_id\":131,\"banker_mul\":3,\"bet_mul\":{\"134\":20,\"133\":15,\"132\":5},\"poker\":{\"131\":{\"poker\":[26,39,2,10,15],\"size\":5,\"win\":-105},\"132\":{\"poker\":[4,31,6,42,22],\"size\":8,\"win\":30},\"133\":{\"poker\":[35,48,29,37,9],\"size\":10,\"win\":135},\"134\":{\"poker\":[25,18,44,45,12],\"size\":0,\"win\":-60}}}', '2018-10-15 16:32:46', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (121, NULL, 2, 1, '{\"banker_id\":131,\"banker_mul\":2,\"bet_mul\":{\"134\":15,\"132\":10,\"133\":20,\"130\":5},\"poker\":{\"130\":{\"poker\":[9,50,20,40,35],\"size\":0,\"win\":-10},\"131\":{\"poker\":[33,5,1,45,3],\"size\":3,\"win\":60},\"133\":{\"poker\":[19,36,6,18,48],\"size\":2,\"win\":-40},\"134\":{\"poker\":[23,28,51,29,34],\"size\":0,\"win\":-30},\"132\":{\"poker\":[2,22,37,12,10],\"size\":4,\"win\":20}}}', '2018-10-15 16:33:49', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (122, NULL, 2, 1, '{\"banker_id\":133,\"banker_mul\":4,\"bet_mul\":{\"134\":20,\"131\":15,\"132\":20,\"130\":5},\"poker\":{\"130\":{\"poker\":[42,23,38,37,32],\"size\":5,\"win\":20},\"131\":{\"poker\":[4,43,34,26,2],\"size\":9,\"win\":120},\"133\":{\"poker\":[33,9,10,7,25],\"size\":0,\"win\":-380},\"134\":{\"poker\":[27,8,29,11,17],\"size\":6,\"win\":160},\"132\":{\"poker\":[3,6,35,5,48],\"size\":4,\"win\":80}}}', '2018-10-15 16:34:29', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (123, NULL, 2, 1, '{\"banker_id\":131,\"banker_mul\":3,\"bet_mul\":{\"132\":20,\"134\":15,\"133\":20,\"130\":5},\"poker\":{\"130\":{\"poker\":[1,29,9,43,11],\"size\":0,\"win\":-15},\"131\":{\"poker\":[17,22,2,51,26],\"size\":0,\"win\":-75},\"133\":{\"poker\":[30,12,19,40,33],\"size\":0,\"win\":-60},\"134\":{\"poker\":[45,21,46,42,4],\"size\":8,\"win\":90},\"132\":{\"poker\":[25,37,3,23,27],\"size\":1,\"win\":60}}}', '2018-10-15 16:35:09', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (124, NULL, 2, 1, '{\"banker_id\":131,\"banker_mul\":3,\"bet_mul\":{\"133\":5,\"132\":20,\"134\":20,\"130\":5},\"poker\":{\"130\":{\"poker\":[46,40,24,4,22],\"size\":0,\"win\":-15},\"131\":{\"poker\":[11,42,2,49,16],\"size\":0,\"win\":30},\"133\":{\"poker\":[23,37,25,3,30],\"size\":0,\"win\":-15},\"134\":{\"poker\":[15,10,47,13,7],\"size\":3,\"win\":60},\"132\":{\"poker\":[48,6,43,0,1],\"size\":0,\"win\":-60}}}', '2018-10-15 16:35:49', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (125, NULL, 2, 1, '{\"banker_id\":131,\"banker_mul\":4,\"bet_mul\":{\"134\":20,\"133\":10,\"132\":15,\"130\":5},\"poker\":{\"130\":{\"poker\":[24,46,3,47,30],\"size\":0,\"win\":-20},\"131\":{\"poker\":[28,37,45,42,2],\"size\":9,\"win\":200},\"133\":{\"poker\":[0,13,31,12,50],\"size\":0,\"win\":-40},\"134\":{\"poker\":[49,22,38,11,32],\"size\":0,\"win\":-80},\"132\":{\"poker\":[23,10,14,1,41],\"size\":4,\"win\":-60}}}', '2018-10-15 16:36:29', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (126, NULL, 2, 1, '{\"banker_id\":134,\"banker_mul\":4,\"bet_mul\":{\"131\":15,\"133\":5,\"132\":10,\"130\":5},\"poker\":{\"130\":{\"poker\":[21,10,1,31,39],\"size\":8,\"win\":40},\"131\":{\"poker\":[24,47,9,28,25],\"size\":5,\"win\":60},\"133\":{\"poker\":[20,49,11,50,14],\"size\":3,\"win\":20},\"134\":{\"poker\":[30,34,45,35,23],\"size\":0,\"win\":-160},\"132\":{\"poker\":[42,7,41,37,46],\"size\":2,\"win\":40}}}', '2018-10-15 16:37:09', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (127, NULL, 2, 1, '{\"banker_id\":132,\"banker_mul\":3,\"bet_mul\":{\"133\":15,\"134\":5,\"131\":10,\"130\":5},\"poker\":{\"130\":{\"poker\":[39,5,6,32,44],\"size\":0,\"win\":-15},\"132\":{\"poker\":[17,7,24,31,37],\"size\":2,\"win\":45},\"133\":{\"poker\":[9,45,16,10,40],\"size\":0,\"win\":-45},\"134\":{\"poker\":[15,8,20,13,28],\"size\":0,\"win\":-15},\"131\":{\"poker\":[3,33,43,35,23],\"size\":5,\"win\":30}}}', '2018-10-15 16:38:28', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (128, NULL, 2, 1, '{\"banker_id\":134,\"banker_mul\":4,\"bet_mul\":{\"133\":20,\"132\":5,\"131\":5,\"130\":5},\"poker\":{\"130\":{\"poker\":[24,6,21,27,22],\"size\":8,\"win\":40},\"132\":{\"poker\":[41,14,5,7,28],\"size\":6,\"win\":40},\"133\":{\"poker\":[38,42,20,44,30],\"size\":4,\"win\":-80},\"134\":{\"poker\":[16,4,47,39,29],\"size\":5,\"win\":20},\"131\":{\"poker\":[35,40,36,25,17],\"size\":0,\"win\":-20}}}', '2018-10-15 16:39:08', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (129, NULL, 2, 1, '{\"banker_id\":132,\"banker_mul\":3,\"bet_mul\":{\"133\":5,\"134\":5,\"131\":15,\"130\":5},\"poker\":{\"130\":{\"poker\":[41,9,49,14,17],\"size\":0,\"win\":-15},\"132\":{\"poker\":[21,18,10,40,2],\"size\":5,\"win\":45},\"133\":{\"poker\":[51,37,13,4,47],\"size\":6,\"win\":30},\"134\":{\"poker\":[24,45,16,42,44],\"size\":2,\"win\":-15},\"131\":{\"poker\":[46,28,15,33,6],\"size\":3,\"win\":-45}}}', '2018-10-15 16:39:48', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (130, NULL, 2, 1, '{\"banker_id\":134,\"banker_mul\":1,\"bet_mul\":{\"132\":5,\"133\":10,\"131\":15,\"130\":5},\"poker\":{\"130\":{\"poker\":[25,42,14,5,46],\"size\":0,\"win\":-5},\"134\":{\"poker\":[18,20,47,30,35],\"size\":8,\"win\":35},\"131\":{\"poker\":[32,51,28,0,24],\"size\":5,\"win\":-15},\"132\":{\"poker\":[43,48,19,9,23],\"size\":0,\"win\":-5},\"133\":{\"poker\":[10,4,36,37,49],\"size\":5,\"win\":-10}}}', '2018-10-15 16:43:14', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (131, NULL, 2, 1, '{\"banker_id\":132,\"banker_mul\":4,\"bet_mul\":{\"134\":20,\"133\":15,\"131\":10,\"130\":5},\"poker\":{\"130\":{\"poker\":[10,4,13,40,43],\"size\":0,\"win\":-20},\"132\":{\"poker\":[11,24,49,8,50],\"size\":3,\"win\":-240},\"133\":{\"poker\":[23,9,2,34,17],\"size\":4,\"win\":60},\"131\":{\"poker\":[20,47,25,36,42],\"size\":3,\"win\":-40},\"134\":{\"poker\":[35,6,5,21,3],\"size\":10,\"win\":240}}}', '2018-10-15 16:44:36', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (132, NULL, 2, 1, '{\"banker_id\":132,\"banker_mul\":1,\"bet_mul\":{\"131\":15,\"133\":5,\"134\":5,\"130\":5},\"poker\":{\"130\":{\"poker\":[28,1,32,22,12],\"size\":0,\"win\":-5},\"132\":{\"poker\":[20,3,43,50,33],\"size\":6,\"win\":30},\"131\":{\"poker\":[10,16,35,39,41],\"size\":0,\"win\":-15},\"133\":{\"poker\":[17,34,9,45,25],\"size\":4,\"win\":-5},\"134\":{\"poker\":[40,44,0,7,21],\"size\":0,\"win\":-5}}}', '2018-10-15 16:46:56', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (133, NULL, 2, 1, '{\"banker_id\":131,\"banker_mul\":4,\"bet_mul\":{\"133\":10,\"134\":20,\"132\":10,\"130\":5},\"poker\":{\"130\":{\"poker\":[30,1,14,47,41],\"size\":0,\"win\":20},\"132\":{\"poker\":[36,8,4,22,31],\"size\":9,\"win\":80},\"131\":{\"poker\":[10,11,17,35,24],\"size\":0,\"win\":-300},\"133\":{\"poker\":[33,37,16,23,38],\"size\":10,\"win\":120},\"134\":{\"poker\":[20,18,26,29,34],\"size\":5,\"win\":80}}}', '2018-10-15 16:47:36', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (134, NULL, 2, 1, '{\"banker_id\":132,\"banker_mul\":1,\"bet_mul\":{\"134\":20,\"133\":5,\"131\":20,\"130\":5},\"poker\":{\"130\":{\"poker\":[35,16,21,34,46],\"size\":9,\"win\":10},\"132\":{\"poker\":[29,25,17,1,43],\"size\":1,\"win\":-95},\"133\":{\"poker\":[30,15,28,45,13],\"size\":4,\"win\":5},\"131\":{\"poker\":[23,27,6,4,0],\"size\":8,\"win\":40},\"134\":{\"poker\":[50,18,37,3,49],\"size\":6,\"win\":40}}}', '2018-10-15 16:48:35', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (135, NULL, 2, 1, '{\"banker_id\":132,\"banker_mul\":3,\"bet_mul\":{\"131\":10,\"133\":15,\"134\":5,\"130\":5},\"poker\":{\"130\":{\"poker\":[48,0,13,19,23],\"size\":6,\"win\":30},\"132\":{\"poker\":[16,51,43,47,49],\"size\":5,\"win\":60},\"133\":{\"poker\":[21,40,37,28,34],\"size\":0,\"win\":-45},\"131\":{\"poker\":[41,30,24,5,25],\"size\":4,\"win\":-30},\"134\":{\"poker\":[50,11,20,33,7],\"size\":0,\"win\":-15}}}', '2018-10-15 16:49:15', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (136, NULL, 2, 1, '{\"banker_id\":133,\"banker_mul\":1,\"bet_mul\":{\"132\":10,\"131\":20,\"134\":15,\"130\":5},\"poker\":{\"130\":{\"poker\":[28,22,6,42,10],\"size\":9,\"win\":10},\"132\":{\"poker\":[7,16,3,15,46],\"size\":2,\"win\":10},\"133\":{\"poker\":[9,23,14,20,4],\"size\":0,\"win\":-90},\"131\":{\"poker\":[36,34,0,26,2],\"size\":8,\"win\":40},\"134\":{\"poker\":[33,44,50,24,43],\"size\":6,\"win\":30}}}', '2018-10-15 16:49:55', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (137, NULL, 2, 1, '{\"banker_id\":133,\"banker_mul\":4,\"bet_mul\":{\"132\":5,\"131\":10,\"134\":15,\"130\":5},\"poker\":{\"130\":{\"poker\":[15,39,41,3,13],\"size\":0,\"win\":-20},\"132\":{\"poker\":[43,26,22,7,30],\"size\":3,\"win\":-20},\"133\":{\"poker\":[14,25,9,4,32],\"size\":5,\"win\":20},\"131\":{\"poker\":[1,23,34,2,44],\"size\":7,\"win\":80},\"134\":{\"poker\":[10,51,50,0,35],\"size\":3,\"win\":-60}}}', '2018-10-15 16:50:35', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (138, NULL, 2, 1, '{\"banker_id\":133,\"banker_mul\":1,\"bet_mul\":{\"131\":20,\"132\":10,\"134\":20,\"130\":5},\"poker\":{\"130\":{\"poker\":[17,28,15,45,40],\"size\":0,\"win\":-5},\"132\":{\"poker\":[18,20,8,22,2],\"size\":1,\"win\":-10},\"133\":{\"poker\":[4,32,34,35,42],\"size\":9,\"win\":-5},\"131\":{\"poker\":[38,48,37,9,11],\"size\":6,\"win\":-40},\"134\":{\"poker\":[14,47,31,30,46],\"size\":10,\"win\":60}}}', '2018-10-15 16:51:15', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (139, NULL, 2, 1, '{\"banker_id\":131,\"banker_mul\":4,\"bet_mul\":{\"133\":5,\"132\":10,\"134\":20,\"130\":5},\"poker\":{\"130\":{\"poker\":[29,3,34,35,7],\"size\":9,\"win\":-40},\"132\":{\"poker\":[39,30,25,14,49],\"size\":0,\"win\":-40},\"133\":{\"poker\":[40,15,43,5,32],\"size\":0,\"win\":-20},\"131\":{\"poker\":[36,48,46,21,9],\"size\":9,\"win\":260},\"134\":{\"poker\":[8,1,12,17,18],\"size\":8,\"win\":-160}}}', '2018-10-15 16:51:55', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (140, NULL, 2, 1, '{\"banker_id\":134,\"banker_mul\":4,\"bet_mul\":{\"133\":20,\"132\":15,\"131\":10,\"130\":5},\"poker\":{\"130\":{\"poker\":[12,17,41,21,5],\"size\":7,\"win\":40},\"132\":{\"poker\":[38,20,33,42,15],\"size\":9,\"win\":120},\"133\":{\"poker\":[36,14,27,10,44],\"size\":4,\"win\":-80},\"131\":{\"poker\":[2,23,26,40,8],\"size\":7,\"win\":80},\"134\":{\"poker\":[4,1,31,18,51],\"size\":6,\"win\":-160}}}', '2018-10-15 16:52:35', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (141, NULL, 2, 1, '{\"banker_id\":134,\"banker_mul\":4,\"bet_mul\":{\"132\":10,\"133\":20,\"131\":15,\"130\":5},\"poker\":{\"130\":{\"poker\":[39,10,48,7,21],\"size\":0,\"win\":-20},\"132\":{\"poker\":[6,41,24,22,38],\"size\":0,\"win\":-40},\"133\":{\"poker\":[13,14,4,36,26],\"size\":7,\"win\":160},\"131\":{\"poker\":[37,16,8,18,31],\"size\":1,\"win\":-60},\"134\":{\"poker\":[28,23,25,49,5],\"size\":3,\"win\":-40}}}', '2018-10-15 16:53:15', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (142, NULL, 2, 1, '{\"banker_id\":134,\"banker_mul\":4,\"bet_mul\":{\"132\":20,\"133\":15,\"131\":5,\"130\":5},\"poker\":{\"130\":{\"poker\":[18,6,42,31,20],\"size\":1,\"win\":-20},\"132\":{\"poker\":[1,14,19,37,3],\"size\":1,\"win\":-80},\"133\":{\"poker\":[29,8,50,44,25],\"size\":8,\"win\":-120},\"131\":{\"poker\":[47,33,7,13,4],\"size\":0,\"win\":-20},\"134\":{\"poker\":[9,11,35,46,15],\"size\":9,\"win\":240}}}', '2018-10-15 16:53:56', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (143, NULL, 2, 1, '{\"banker_id\":130,\"banker_mul\":2,\"bet_mul\":{\"134\":20},\"poker\":{\"130\":{\"poker\":[23,16,44,37,46],\"size\":1,\"win\":-40},\"134\":{\"poker\":[43,1,34,31,25],\"size\":5,\"win\":40}}}', '2018-10-15 16:55:23', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (144, NULL, 2, 1, '{\"banker_id\":134,\"banker_mul\":4,\"bet_mul\":{\"131\":20,\"132\":20,\"133\":20,\"130\":5},\"poker\":{\"130\":{\"poker\":[11,22,25,23,21],\"size\":0,\"win\":-20},\"134\":{\"poker\":[15,26,36,33,35],\"size\":9,\"win\":420},\"131\":{\"poker\":[51,43,45,38,24],\"size\":7,\"win\":-160},\"132\":{\"poker\":[2,12,16,14,6],\"size\":6,\"win\":-160},\"133\":{\"poker\":[5,4,8,19,42],\"size\":2,\"win\":-80}}}', '2018-10-15 16:55:45', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (145, NULL, 2, 1, '{\"banker_id\":131,\"banker_mul\":4,\"bet_mul\":{\"134\":20,\"132\":20,\"133\":10,\"130\":5},\"poker\":{\"130\":{\"poker\":[44,27,0,35,15],\"size\":1,\"win\":-20},\"134\":{\"poker\":[37,6,1,33,28],\"size\":10,\"win\":240},\"131\":{\"poker\":[36,40,45,19,49],\"size\":5,\"win\":-100},\"132\":{\"poker\":[48,18,16,43,9],\"size\":3,\"win\":-80},\"133\":{\"poker\":[41,25,50,38,17],\"size\":2,\"win\":-40}}}', '2018-10-15 16:56:25', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (146, NULL, 2, 1, '{\"banker_id\":131,\"banker_mul\":4,\"bet_mul\":{\"132\":5,\"133\":10,\"134\":10,\"130\":5},\"poker\":{\"130\":{\"poker\":[19,33,45,41,8],\"size\":0,\"win\":-20},\"134\":{\"poker\":[42,25,43,48,49],\"size\":7,\"win\":-80},\"131\":{\"poker\":[39,31,36,37,51],\"size\":8,\"win\":220},\"132\":{\"poker\":[12,40,9,23,18],\"size\":8,\"win\":-40},\"133\":{\"poker\":[21,3,32,4,47],\"size\":8,\"win\":-80}}}', '2018-10-15 16:57:05', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (147, NULL, 2, 1, '{\"banker_id\":132,\"banker_mul\":4,\"bet_mul\":{\"133\":5,\"131\":15,\"134\":15,\"130\":5},\"poker\":{\"130\":{\"poker\":[12,32,40,13,41],\"size\":0,\"win\":-20},\"134\":{\"poker\":[18,46,23,43,17],\"size\":6,\"win\":120},\"131\":{\"poker\":[7,48,14,16,27],\"size\":0,\"win\":-60},\"132\":{\"poker\":[28,38,9,5,47],\"size\":3,\"win\":-100},\"133\":{\"poker\":[15,8,6,11,29],\"size\":10,\"win\":60}}}', '2018-10-15 16:57:45', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (148, NULL, 2, 1, '{\"banker_id\":133,\"banker_mul\":4,\"bet_mul\":{\"134\":15,\"131\":15,\"132\":15,\"130\":5},\"poker\":{\"130\":{\"poker\":[33,5,26,2,13],\"size\":3,\"win\":-20},\"134\":{\"poker\":[29,45,48,42,32],\"size\":7,\"win\":-120},\"131\":{\"poker\":[16,17,1,19,18],\"size\":12,\"win\":300},\"132\":{\"poker\":[34,10,47,41,15],\"size\":0,\"win\":-60},\"133\":{\"poker\":[7,14,46,36,12],\"size\":10,\"win\":-100}}}', '2018-10-15 16:58:25', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (149, NULL, 2, 1, '{\"banker_id\":133,\"banker_mul\":1,\"bet_mul\":{\"134\":15,\"131\":20,\"132\":10,\"130\":5},\"poker\":{\"130\":{\"poker\":[24,0,49,11,4],\"size\":3,\"win\":5},\"134\":{\"poker\":[51,1,30,19,21],\"size\":0,\"win\":15},\"131\":{\"poker\":[27,16,17,44,45],\"size\":7,\"win\":40},\"132\":{\"poker\":[47,18,5,9,12],\"size\":4,\"win\":10},\"133\":{\"poker\":[33,20,36,23,6],\"size\":0,\"win\":-70}}}', '2018-10-15 16:59:05', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (150, NULL, 2, 1, '{\"banker_id\":131,\"banker_mul\":3,\"bet_mul\":{\"134\":5,\"133\":10,\"132\":15,\"130\":5},\"poker\":{\"130\":{\"poker\":[48,25,51,42,32],\"size\":6,\"win\":30},\"134\":{\"poker\":[28,12,17,38,36],\"size\":0,\"win\":-15},\"131\":{\"poker\":[19,15,27,21,35],\"size\":1,\"win\":-180},\"132\":{\"poker\":[41,45,4,29,37],\"size\":10,\"win\":135},\"133\":{\"poker\":[33,0,14,24,5],\"size\":3,\"win\":30}}}', '2018-10-15 16:59:45', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (151, NULL, 2, 1, '{\"banker_id\":133,\"banker_mul\":4,\"bet_mul\":{\"134\":5,\"131\":20,\"132\":10,\"130\":5},\"poker\":{\"130\":{\"poker\":[32,7,48,8,2],\"size\":5,\"win\":-20},\"134\":{\"poker\":[44,31,50,11,12],\"size\":0,\"win\":-20},\"131\":{\"poker\":[17,34,43,33,40],\"size\":0,\"win\":-80},\"132\":{\"poker\":[9,47,6,18,36],\"size\":10,\"win\":120},\"133\":{\"poker\":[35,27,4,29,3],\"size\":7,\"win\":0}}}', '2018-10-15 17:00:25', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (152, NULL, 2, 1, '{\"banker_id\":133,\"banker_mul\":3,\"bet_mul\":{\"134\":20,\"131\":15,\"132\":20,\"130\":5},\"poker\":{\"130\":{\"poker\":[34,29,37,28,25],\"size\":0,\"win\":-15},\"134\":{\"poker\":[12,36,43,46,19],\"size\":9,\"win\":-120},\"131\":{\"poker\":[23,38,45,14,44],\"size\":10,\"win\":135},\"132\":{\"poker\":[3,11,6,49,27],\"size\":3,\"win\":-60},\"133\":{\"poker\":[5,21,31,15,41],\"size\":10,\"win\":60}}}', '2018-10-15 17:01:05', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (153, NULL, 2, 1, '{\"banker_id\":131,\"banker_mul\":3,\"bet_mul\":{\"133\":15,\"134\":10,\"132\":5,\"130\":5},\"poker\":{\"130\":{\"poker\":[33,44,47,23,18],\"size\":10,\"win\":45},\"134\":{\"poker\":[28,1,10,34,3],\"size\":2,\"win\":-30},\"131\":{\"poker\":[50,45,12,36,11],\"size\":7,\"win\":90},\"132\":{\"poker\":[39,9,35,42,32],\"size\":0,\"win\":-15},\"133\":{\"poker\":[6,4,20,21,48],\"size\":6,\"win\":-90}}}', '2018-10-15 17:01:45', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (154, NULL, 2, 1, '{\"banker_id\":131,\"banker_mul\":4,\"bet_mul\":{\"132\":15,\"134\":5,\"133\":10,\"130\":5},\"poker\":{\"130\":{\"poker\":[43,6,50,29,0],\"size\":1,\"win\":20},\"134\":{\"poker\":[51,9,33,32,49],\"size\":0,\"win\":20},\"131\":{\"poker\":[39,7,11,46,34],\"size\":0,\"win\":-180},\"132\":{\"poker\":[10,38,15,40,26],\"size\":4,\"win\":60},\"133\":{\"poker\":[30,44,13,21,36],\"size\":8,\"win\":80}}}', '2018-10-15 17:02:25', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (155, NULL, 2, 1, '{\"banker_id\":133,\"banker_mul\":3,\"bet_mul\":{\"132\":20,\"134\":15,\"131\":10,\"130\":5},\"poker\":{\"130\":{\"poker\":[40,21,38,44,11],\"size\":9,\"win\":-30},\"134\":{\"poker\":[17,43,12,1,3],\"size\":1,\"win\":-45},\"131\":{\"poker\":[48,24,20,41,9],\"size\":6,\"win\":-60},\"132\":{\"poker\":[25,2,42,50,14],\"size\":0,\"win\":-60},\"133\":{\"poker\":[39,33,37,18,23],\"size\":10,\"win\":195}}}', '2018-10-15 17:03:05', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (156, NULL, 2, 1, '{\"banker_id\":132,\"banker_mul\":2,\"bet_mul\":{\"134\":20,\"133\":20,\"131\":5,\"130\":5},\"poker\":{\"130\":{\"poker\":[7,29,32,18,17],\"size\":0,\"win\":-10},\"134\":{\"poker\":[19,43,40,21,36],\"size\":1,\"win\":-40},\"131\":{\"poker\":[34,28,27,24,35],\"size\":0,\"win\":-10},\"132\":{\"poker\":[12,30,5,45,20],\"size\":10,\"win\":100},\"133\":{\"poker\":[2,4,46,37,10],\"size\":0,\"win\":-40}}}', '2018-10-15 17:03:45', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (157, NULL, 2, 1, '{\"banker_id\":131,\"banker_mul\":4,\"bet_mul\":{\"134\":10,\"132\":15,\"133\":10,\"130\":5},\"poker\":{\"130\":{\"poker\":[41,18,28,25,12],\"size\":4,\"win\":20},\"134\":{\"poker\":[38,34,42,24,19],\"size\":0,\"win\":-40},\"131\":{\"poker\":[22,1,39,6,5],\"size\":1,\"win\":-120},\"132\":{\"poker\":[0,35,32,4,47],\"size\":1,\"win\":60},\"133\":{\"poker\":[2,43,46,16,51],\"size\":6,\"win\":80}}}', '2018-10-15 17:04:25', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (158, NULL, 2, 1, '{\"banker_id\":134,\"banker_mul\":4,\"bet_mul\":{\"131\":20,\"132\":15,\"133\":15,\"130\":5},\"poker\":{\"130\":{\"poker\":[11,35,4,44,28],\"size\":2,\"win\":-20},\"134\":{\"poker\":[13,16,32,6,21],\"size\":6,\"win\":220},\"131\":{\"poker\":[19,31,49,8,14],\"size\":0,\"win\":-80},\"132\":{\"poker\":[37,2,20,45,25],\"size\":0,\"win\":-60},\"133\":{\"poker\":[10,22,5,42,1],\"size\":2,\"win\":-60}}}', '2018-10-15 17:05:06', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (159, NULL, 2, 1, '{\"banker_id\":131,\"banker_mul\":3,\"bet_mul\":{\"134\":20,\"132\":10,\"133\":15,\"130\":5},\"poker\":{\"130\":{\"poker\":[0,29,13,31,28],\"size\":9,\"win\":30},\"134\":{\"poker\":[15,40,16,39,22],\"size\":5,\"win\":-60},\"131\":{\"poker\":[35,5,41,32,20],\"size\":6,\"win\":-30},\"132\":{\"poker\":[50,12,9,38,7],\"size\":0,\"win\":-30},\"133\":{\"poker\":[27,14,49,42,21],\"size\":7,\"win\":90}}}', '2018-10-15 17:05:46', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (160, NULL, 2, 1, '{\"banker_id\":134,\"banker_mul\":2,\"bet_mul\":{\"131\":5,\"133\":5,\"132\":5,\"130\":5},\"poker\":{\"130\":{\"poker\":[24,43,32,25,40],\"size\":0,\"win\":-10},\"134\":{\"poker\":[37,26,10,30,23],\"size\":4,\"win\":10},\"131\":{\"poker\":[11,36,9,22,4],\"size\":0,\"win\":-10},\"132\":{\"poker\":[31,3,2,7,14],\"size\":6,\"win\":20},\"133\":{\"poker\":[41,35,15,42,5],\"size\":0,\"win\":-10}}}', '2018-10-15 17:06:26', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (161, NULL, 2, 1, '{\"banker_id\":133,\"banker_mul\":3,\"bet_mul\":{\"131\":20,\"134\":5,\"132\":5,\"130\":5},\"poker\":{\"130\":{\"poker\":[0,1,4,25,24],\"size\":8,\"win\":30},\"134\":{\"poker\":[12,31,17,34,37],\"size\":0,\"win\":-15},\"131\":{\"poker\":[7,11,36,32,49],\"size\":0,\"win\":-60},\"132\":{\"poker\":[13,10,42,15,51],\"size\":0,\"win\":15},\"133\":{\"poker\":[23,6,21,50,18],\"size\":0,\"win\":30}}}', '2018-10-15 17:07:06', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (162, NULL, 2, 1, '{\"banker_id\":133,\"banker_mul\":3,\"bet_mul\":{\"131\":15,\"132\":20,\"134\":10,\"130\":5},\"poker\":{\"130\":{\"poker\":[3,50,37,10,49],\"size\":4,\"win\":15},\"134\":{\"poker\":[4,1,2,51,21],\"size\":0,\"win\":-30},\"131\":{\"poker\":[43,5,33,28,32],\"size\":8,\"win\":90},\"132\":{\"poker\":[36,31,41,48,16],\"size\":3,\"win\":60},\"133\":{\"poker\":[11,27,20,17,6],\"size\":3,\"win\":-135}}}', '2018-10-15 17:07:46', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (163, NULL, 2, 1, '{\"banker_id\":131,\"banker_mul\":1,\"bet_mul\":{\"134\":5,\"132\":10,\"133\":20,\"130\":5},\"poker\":{\"130\":{\"poker\":[1,42,3,47,18],\"size\":0,\"win\":5},\"134\":{\"poker\":[9,10,21,22,7],\"size\":0,\"win\":-5},\"131\":{\"poker\":[19,8,14,36,41],\"size\":0,\"win\":-40},\"132\":{\"poker\":[45,32,37,27,38],\"size\":6,\"win\":20},\"133\":{\"poker\":[11,33,40,43,48],\"size\":2,\"win\":20}}}', '2018-10-15 17:08:26', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (164, NULL, 2, 1, '{\"banker_id\":134,\"banker_mul\":2,\"bet_mul\":{\"132\":10,\"131\":10,\"133\":10,\"130\":5},\"poker\":{\"130\":{\"poker\":[19,8,44,45,3],\"size\":0,\"win\":-10},\"134\":{\"poker\":[32,48,31,22,4],\"size\":5,\"win\":-50},\"131\":{\"poker\":[51,25,20,11,2],\"size\":7,\"win\":40},\"132\":{\"poker\":[41,1,33,23,38],\"size\":6,\"win\":40},\"133\":{\"poker\":[40,24,34,29,36],\"size\":0,\"win\":-20}}}', '2018-10-15 17:09:06', '0000-00-00 00:00:00');
INSERT INTO `game_play_log` VALUES (165, NULL, 2, 1, '{\"banker_id\":131,\"banker_mul\":4,\"bet_mul\":{\"133\":10,\"132\":10,\"134\":10,\"130\":5},\"poker\":{\"130\":{\"poker\":[5,32,50,19,20],\"size\":2,\"win\":-20},\"134\":{\"poker\":[30,28,29,18,23],\"size\":0,\"win\":-40},\"131\":{\"poker\":[43,33,34,39,1],\"size\":9,\"win\":20},\"132\":{\"poker\":[12,48,14,49,8],\"size\":0,\"win\":-40},\"133\":{\"poker\":[42,46,51,16,13],\"size\":9,\"win\":80}}}', '2018-10-15 17:09:46', '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for game_room
-- ----------------------------
DROP TABLE IF EXISTS `game_room`;
CREATE TABLE `game_room`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `game_id` int(11) NULL DEFAULT 0,
  `level` int(11) UNSIGNED NULL DEFAULT 0,
  `bot` int(20) UNSIGNED NULL DEFAULT NULL COMMENT '游戏房间配置',
  `stint` int(20) UNSIGNED NULL DEFAULT NULL COMMENT '入场限制',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of game_room
-- ----------------------------
INSERT INTO `game_room` VALUES (1, 1, 1, 20, 20);
INSERT INTO `game_room` VALUES (2, 2, 0, 2, 30);
INSERT INTO `game_room` VALUES (3, 3, 2, 30, 10);
INSERT INTO `game_room` VALUES (4, 4, 1, 15, 20);

-- ----------------------------
-- Table structure for ip_segment
-- ----------------------------
DROP TABLE IF EXISTS `ip_segment`;
CREATE TABLE `ip_segment`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ip_start` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ip_end` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ip_whitelist
-- ----------------------------
DROP TABLE IF EXISTS `ip_whitelist`;
CREATE TABLE `ip_whitelist`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ip` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ip地址',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `own` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属人',
  `add_person` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '添加人',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '生成时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for login_log
-- ----------------------------
DROP TABLE IF EXISTS `login_log`;
CREATE TABLE `login_log`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '登陆日志' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of login_log
-- ----------------------------
INSERT INTO `login_log` VALUES (1, 213, '127.0.0.1', 1544254930);
INSERT INTO `login_log` VALUES (2, 213, '127.0.0.1', 1544579925);
INSERT INTO `login_log` VALUES (3, 215, '127.0.0.1', 1544579958);

-- ----------------------------
-- Table structure for lottery
-- ----------------------------
DROP TABLE IF EXISTS `lottery`;
CREATE TABLE `lottery`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `prize` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `num` int(10) UNSIGNED NULL DEFAULT NULL,
  `prize_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pro` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lottery
-- ----------------------------
INSERT INTO `lottery` VALUES (1, '5', 232, '2131', '25');
INSERT INTO `lottery` VALUES (2, '4', 123, '123', '12');
INSERT INTO `lottery` VALUES (3, '3', 123, '123', '12');
INSERT INTO `lottery` VALUES (4, '2', 123, '123', '23');
INSERT INTO `lottery` VALUES (5, '1', 123, '123', '12');
INSERT INTO `lottery` VALUES (6, '0', 123, '123', '10');

-- ----------------------------
-- Table structure for lottery_cate
-- ----------------------------
DROP TABLE IF EXISTS `lottery_cate`;
CREATE TABLE `lottery_cate`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `lottery_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `req_exp` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pro` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lottery_cate
-- ----------------------------
INSERT INTO `lottery_cate` VALUES (1, '白金', '1000', '1', '1');

-- ----------------------------
-- Table structure for lottery_high
-- ----------------------------
DROP TABLE IF EXISTS `lottery_high`;
CREATE TABLE `lottery_high`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `prize` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `num` int(10) UNSIGNED NULL DEFAULT NULL,
  `prize_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pro` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lottery_high
-- ----------------------------
INSERT INTO `lottery_high` VALUES (1, '0', 1, '123', '15');
INSERT INTO `lottery_high` VALUES (2, '1', 2, '2', '15');
INSERT INTO `lottery_high` VALUES (3, '2', 3, '2', '15');
INSERT INTO `lottery_high` VALUES (4, '3', 2, '2', '15');
INSERT INTO `lottery_high` VALUES (5, '4', 2, '2', '15');
INSERT INTO `lottery_high` VALUES (6, '5', 12, '12', '15');

-- ----------------------------
-- Table structure for lottery_middle
-- ----------------------------
DROP TABLE IF EXISTS `lottery_middle`;
CREATE TABLE `lottery_middle`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `prize` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `num` int(10) UNSIGNED NULL DEFAULT NULL,
  `prize_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pro` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lottery_middle
-- ----------------------------
INSERT INTO `lottery_middle` VALUES (1, '0', 2323, '电风扇', '25');
INSERT INTO `lottery_middle` VALUES (2, '1', 123, '手机', '25');
INSERT INTO `lottery_middle` VALUES (3, '2', 123, '闹闹', '26');
INSERT INTO `lottery_middle` VALUES (4, '3', 123, '毛毛虫', '25');
INSERT INTO `lottery_middle` VALUES (5, '4', 123, '123', '25');
INSERT INTO `lottery_middle` VALUES (6, '5', 2131, '小猫', '21');

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `menu_tree` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `update_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES (1, '[{\"title\":\"权限配置\",\"nav\":[{\"title\":\"用户组管理\",\"url\":\"/admin/user_admin\"},{\"title\":\"规则管理\",\"url\":\"/admin/user_admin/add\"}]},{\"title\":\"管理员管理\",\"nav\":[{\"title\":\"管理员列表\",\"url\":\"/admin/detail_log/index\"},{\"title\":\"管理员登录日志\",\"url\":\"/admin/user/\"}]},{\"title\":\"文章管理\",\"nav\":[{\"title\":\"文章列表\",\"url\":\"/admin/agent/index\"},{\"title\":\"分类列表\",\"url\":\"/admin/agent/add\"}]},{\"title\":\"用户管理\",\"nav\":[{\"title\":\"代理\",\"url\":\"/admin/group/index\"},{\"title\":\"用户列表\",\"url\":\"/admin/group/add\"},{\"title\":\"登陆日志\",\"url\":\"/admin/agent/add\"},{\"title\":\"代理统计\",\"url\":\"/admin/agent/add\"}]},{\"title\":\"客服系统\",\"nav\":[{\"title\":\"反馈列表\",\"url\":\"/admin/order/index\"}]},{\"title\":\"发送邮件\",\"nav\":[{\"title\":\"通道列表\",\"url\":\"/admin/alipay_list/index\"}]},{\"title\":\"菜单栏目\",\"nav\":[{\"title\":\"栏目配置\",\"url\":\"/admin/menu\"}]},{\"title\":\"网站配置\",\"nav\":[{\"title\":\"配置中心\",\"url\":\"/admin/config/index\"}]}]', NULL);

-- ----------------------------
-- Table structure for order_log
-- ----------------------------
DROP TABLE IF EXISTS `order_log`;
CREATE TABLE `order_log`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `trade_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 32 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_log
-- ----------------------------
INSERT INTO `order_log` VALUES (14, '2018120614150796928', 211, '2018-12-06 14:15:07');
INSERT INTO `order_log` VALUES (15, '2018120616170587920', 211, '2018-12-06 16:17:05');
INSERT INTO `order_log` VALUES (16, '2018120616174435137', 211, '2018-12-06 16:17:44');
INSERT INTO `order_log` VALUES (17, '2018120616204571464', 211, '2018-12-06 16:20:45');
INSERT INTO `order_log` VALUES (18, '2018120616222582695', 211, '2018-12-06 16:22:25');
INSERT INTO `order_log` VALUES (19, '2018120616424170039', 211, '2018-12-06 16:42:41');
INSERT INTO `order_log` VALUES (20, '2018120617412655182', 211, '2018-12-06 17:41:26');
INSERT INTO `order_log` VALUES (21, '2018120617532399240', 211, '2018-12-06 17:53:23');
INSERT INTO `order_log` VALUES (22, '2018120618102635249', 211, '2018-12-06 18:10:26');
INSERT INTO `order_log` VALUES (23, '2018120708553335826', 211, '2018-12-07 08:55:33');
INSERT INTO `order_log` VALUES (24, '2018120709074233815', 211, '2018-12-07 09:07:42');
INSERT INTO `order_log` VALUES (25, '2018120709574213988', 211, '2018-12-07 09:57:42');
INSERT INTO `order_log` VALUES (26, '2018120709583283630', 211, '2018-12-07 09:58:32');
INSERT INTO `order_log` VALUES (27, '2018120810141959054', 230, '2018-12-08 10:14:19');
INSERT INTO `order_log` VALUES (28, '2018120810164315622', 230, '2018-12-08 10:16:43');
INSERT INTO `order_log` VALUES (29, '2018120813452638019', 230, '2018-12-08 13:45:26');
INSERT INTO `order_log` VALUES (30, '2018120815224238837', 230, '2018-12-08 15:22:42');
INSERT INTO `order_log` VALUES (31, '2018120815255341970', 230, '2018-12-08 15:25:53');

-- ----------------------------
-- Table structure for setting
-- ----------------------------
DROP TABLE IF EXISTS `setting`;
CREATE TABLE `setting`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `value` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `site_id` int(11) NULL DEFAULT 0 COMMENT '网站id',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` int(11) NULL DEFAULT 0,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 54 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of setting
-- ----------------------------
INSERT INTO `setting` VALUES (1, 'game_name', '龙城', 0, '游戏', 0, NULL);
INSERT INTO `setting` VALUES (2, 'coin_name', '余额', 0, '货币', 0, NULL);
INSERT INTO `setting` VALUES (3, 'pagesize', '10', 0, '每页显示条数', 0, NULL);
INSERT INTO `setting` VALUES (4, 'menu_tree', '[{\"title\":\"权限配置\",\"nav\":[{\"title\":\"用户组管理\",\"url\":\"/admin.php/admin/group/index\"},{\"title\":\"规则管理\",\"url\":\"/admin.php/admin/rule/index\"}]},{\"title\":\"管理员管理\",\"nav\":[{\"title\":\"管理员列表\",\"url\":\"/admin.php/admin/admin/index\"},{\"title\":\"管理员登录日志\",\"url\":\"/admin.php/admin/admin/loginlog\"}]},{\"title\":\"用户管理\",\"nav\":[{\"title\":\"代理管理\",\"url\":\"/admin.php/admin/user/index\"},{\"title\":\"用户列表\",\"url\":\"/admin.php/admin/user/user_list\"},{\"title\":\"登陆日志\",\"url\":\"/admin.php/admin/login_log/index\"},{\"title\":\"代理统计\",\"url\":\"/admin.php/admin/agent/agentStatistics\"}]},{\"title\":\"文章管理\",\"nav\":[{\"title\":\"文章列表\",\"url\":\"/admin.php/admin/article/index\"},{\"title\":\"分类列表\",\"url\":\"/admin.php/admin/cate/index\"}]},{\"title\":\"客服系统\",\"nav\":[{\"title\":\"反馈列表\",\"url\":\"/admin.php/admin/suggest/index\"},{\"title\":\"发送邮件\",\"url\":\"/admin.php/admin/email/index\"}]},{\"title\":\"资金明细\",\"nav\":[{\"title\":\"资金明细\",\"url\":\"/admin.php/admin/detail/index\"}]},{\"title\":\"游戏列表\",\"nav\":[{\"title\":\"百人牛牛\",\"url\":\"/admin.php/admin/game_room/one_hundred\"},{\"title\":\"抢庄牛牛\",\"url\":\"/admin.php/admin/game_room/grab_the_cattle\"},{\"title\":\"炸金花\",\"url\":\"/admin.php/admin/game_room/fried_golden_flower\"},{\"title\":\"德州扑克\",\"url\":\"/admin.php/admin/game_room/texas_playing_card\"}]},{\"title\":\"机器人列表\",\"nav\":[{\"title\":\"机器人列表\",\"url\":\"/admin.php/admin/user/robot\"},{\"title\":\"输赢统计\",\"url\":\"/admin.php/admin/user/robotWinOrLose\"}]},{\"title\":\"顶部消息\",\"nav\":[{\"title\":\"顶部消息列表\",\"url\":\"/admin.php/admin/top_info/index\"}]},{\"title\":\"大转盘\",\"nav\":[{\"title\":\"大转盘列表\",\"url\":\"/admin.php/admin/lottery/cate\"},{\"title\":\"设置\",\"url\":\"/admin.php/admin/lottery/setting\"}]}]', 0, '菜单', 0, '2019-06-12 16:45:18');

-- ----------------------------
-- Table structure for suggest
-- ----------------------------
DROP TABLE IF EXISTS `suggest`;
CREATE TABLE `suggest`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(11) NULL DEFAULT 0 COMMENT '用户id',
  `status` int(11) NULL DEFAULT 0 COMMENT '0未读 1已读',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户反馈' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of suggest
-- ----------------------------
INSERT INTO `suggest` VALUES (1, '123456', '2018-11-16 14:43:31', 192, 0);

-- ----------------------------
-- Table structure for top_info
-- ----------------------------
DROP TABLE IF EXISTS `top_info`;
CREATE TABLE `top_info`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `information` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '系统消息',
  `type` tinyint(1) UNSIGNED NOT NULL COMMENT '0:系统消息 , 1:动态推送',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of top_info
-- ----------------------------
INSERT INTO `top_info` VALUES (9, '阿达撒打算', 1);
INSERT INTO `top_info` VALUES (14, '我是一赔浪', 0);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '账号',
  `sex` tinyint(255) UNSIGNED NULL DEFAULT 0,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `coin` decimal(11, 2) NULL DEFAULT 0.00 COMMENT '金币',
  `bank` decimal(11, 2) UNSIGNED NULL DEFAULT 0.00 COMMENT '银行余额',
  `node_status` int(255) UNSIGNED NULL DEFAULT 0 COMMENT '0=男，1=女',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机',
  `bank_card` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '卡号',
  `auto` int(2) UNSIGNED NULL DEFAULT 1 COMMENT '自动充值状态',
  `photo` int(11) NULL DEFAULT 1 COMMENT '头像',
  `vip_exp` int(11) NULL DEFAULT 0 COMMENT 'vip经验',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '注册时间',
  `last_time` timestamp NULL DEFAULT NULL COMMENT '上次登录时间',
  `active_time` timestamp NULL DEFAULT NULL COMMENT '最新活跃时间',
  `active_ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活跃IP',
  `create_ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '注册ip',
  `lft` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '左节点',
  `rgt` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '右节点',
  `status` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '0游客，1正式， 2机器人',
  `lock` int(11) NULL DEFAULT 0 COMMENT '是否锁定，锁定后会员将无法登陆',
  `parent_id` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '父级id',
  `alipay_user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `agent` tinyint(2) UNSIGNED NULL DEFAULT 1 COMMENT '代理0，用户1',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 100004 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (231, '啊是哒是哒撒打算', 'user1234566', 0, 'e10adc3949ba59abbe56e057f20f883e', 0.00, 0.00, 0, '13800000000', NULL, 1, 1, 0, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 10, 11, 1, 0, 215, NULL, 1);
INSERT INTO `user` VALUES (232, '代理一号额', 'asdas', 0, 'e10adc3949ba59abbe56e057f20f883e', 0.00, 0.00, 0, '13800000000', NULL, 1, 1, 0, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 15, 16, 1, 0, 216, NULL, 1);
INSERT INTO `user` VALUES (233, '啊是哒是哒撒', 'asdasdasjk', 0, 'e10adc3949ba59abbe56e057f20f883e', 0.00, 0.00, 0, '13800000000', NULL, 1, 1, 0, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 13, 14, 1, 0, 216, NULL, 1);
INSERT INTO `user` VALUES (234, '啊是哒是哒撒图', 'asdklklk', 0, 'e10adc3949ba59abbe56e057f20f883e', 0.00, 0.00, 0, '13800000000', NULL, 1, 1, 0, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 2, 3, 1, 0, 217, NULL, 1);
INSERT INTO `user` VALUES (100003, '觇标改', 'abc123', 0, 'e10adc3949ba59abbe56e057f20f883e', 0.00, 0.00, 0, NULL, NULL, 1, 1, 0, '2018-12-22 09:05:38', NULL, NULL, NULL, '192.168.4.123', NULL, NULL, 0, 0, 0, NULL, 1);

SET FOREIGN_KEY_CHECKS = 1;
