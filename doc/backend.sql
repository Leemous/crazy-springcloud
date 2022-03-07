/*
 Navicat Premium Data Transfer

 Source Server         : cdh1 mysql
 Source Server Type    : MySQL
 Source Server Version : 50732
 Source Host           : cdh1:3306
 Source Schema         : store

 Target Server Type    : MySQL
 Target Server Version : 50732
 File Encoding         : 65001

 Date: 19/01/2021 17:57:48
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for foundation_msg_subscribe
-- ----------------------------
DROP TABLE IF EXISTS `foundation_msg_subscribe`;
CREATE TABLE `foundation_msg_subscribe`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bean_class` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `method_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `msg_group` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `msg_topic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `prj_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `spring_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `subscribe_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of foundation_msg_subscribe
-- ----------------------------
INSERT INTO `foundation_msg_subscribe` VALUES (1, NULL, NULL, NULL, NULL, 'test', 'test1', 'kafka-provider', NULL, '1', NULL, NULL);

-- ----------------------------
-- Table structure for mq_confirm
-- ----------------------------
DROP TABLE IF EXISTS `mq_confirm`;
CREATE TABLE `mq_confirm`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `consume_count` int(11) NULL DEFAULT NULL,
  `consumer_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `created_time` datetime(0) NULL DEFAULT NULL,
  `message_id` bigint(20) NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `version` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mq_consumer
-- ----------------------------
DROP TABLE IF EXISTS `mq_consumer`;
CREATE TABLE `mq_consumer`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `consumer_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `consumer_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `consumer_remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `consumer_status` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mq_group
-- ----------------------------
DROP TABLE IF EXISTS `mq_group`;
CREATE TABLE `mq_group`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `created_time` datetime(0) NULL DEFAULT NULL,
  `group_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `group_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `group_remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `group_status` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mq_message
-- ----------------------------
DROP TABLE IF EXISTS `mq_message`;
CREATE TABLE `mq_message`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `created_time` datetime(0) NULL DEFAULT NULL,
  `delay_level` int(11) NULL DEFAULT NULL,
  `message_body` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `message_status` int(11) NULL DEFAULT NULL,
  `message_topic` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `order_type` int(11) NULL DEFAULT NULL,
  `producer_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `resend_times` int(11) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `version` int(11) NULL DEFAULT NULL,
  `yn` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mq_producer
-- ----------------------------
DROP TABLE IF EXISTS `mq_producer`;
CREATE TABLE `mq_producer`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `producer_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `producer_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `producer_remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `producer_status` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mq_subscribe_rule
-- ----------------------------
DROP TABLE IF EXISTS `mq_subscribe_rule`;
CREATE TABLE `mq_subscribe_rule`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `created_time` datetime(0) NULL DEFAULT NULL,
  `group_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `rule_remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `rule_status` int(11) NULL DEFAULT NULL,
  `subscribe_rule_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `topic_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mq_subscribe_rule
-- ----------------------------
INSERT INTO `mq_subscribe_rule` VALUES ('1', NULL, 'group.seckill.order', NULL, NULL, NULL, 'topic.seckill');

-- ----------------------------
-- Table structure for mq_topic
-- ----------------------------
DROP TABLE IF EXISTS `mq_topic`;
CREATE TABLE `mq_topic`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `created_time` datetime(0) NULL DEFAULT NULL,
  `mq_type` int(11) NULL DEFAULT NULL,
  `msg_type` int(11) NULL DEFAULT NULL,
  `topic_remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `topic_status` int(11) NULL DEFAULT NULL,
  `topic_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `topic_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for oauth_client_details
-- ----------------------------
DROP TABLE IF EXISTS `oauth_client_details`;
CREATE TABLE `oauth_client_details`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `client_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '应用标识',
  `resource_ids` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源限定串(逗号分割)',
  `client_secret` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '应用密钥(bcyt) 加密',
  `client_secret_str` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '应用密钥(明文)',
  `scope` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '范围',
  `authorized_grant_types` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '5种oauth授权方式(authorization_code,password,refresh_token,client_credentials)',
  `web_server_redirect_uri` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回调地址 ',
  `authorities` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限',
  `access_token_validity` int(11) NULL DEFAULT NULL COMMENT 'access_token有效期',
  `refresh_token_validity` int(11) NULL DEFAULT NULL COMMENT 'refresh_token有效期',
  `additional_information` varchar(4096) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '{}' COMMENT '{}',
  `autoapprove` char(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'true' COMMENT '是否自动授权 是-true',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `client_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '应用名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oauth_client_details
-- ----------------------------
INSERT INTO `oauth_client_details` VALUES (1, 'webApp', NULL, '$2a$10$06msMGYRH8nrm4iVnKFNKOoddB8wOwymVhbUzw/d3ZixD7Nq8ot72', 'webApp', 'app', 'authorization_code,password,refresh_token,client_credentials', NULL, NULL, 3600, NULL, '{}', 'true', NULL, NULL, 'pc端');
INSERT INTO `oauth_client_details` VALUES (2, 'app', NULL, '$2a$10$i3F515wEDiB4Gvj9ym9Prui0dasRttEUQ9ink4Wpgb4zEDCAlV8zO', 'app', 'app', 'password,refresh_token', NULL, NULL, 3600, NULL, '{}', 'true', NULL, NULL, '移动端');
INSERT INTO `oauth_client_details` VALUES (3, 'zlt', NULL, '$2a$10$/o.wuORzVcXaezmYVzwYMuoY7qeWXBALwQmkskXD/7C6rqfCyPrna', 'zlt', 'all', 'authorization_code,password,refresh_token,client_credentials', 'http://127.0.0.1:8080/singleLogin', NULL, 3600, 28800, '{}', 'true', '2018-12-27 00:50:30', '2018-12-27 00:50:30', '第三方应用');

-- ----------------------------
-- Table structure for sample
-- ----------------------------
DROP TABLE IF EXISTS `sample`;
CREATE TABLE `sample`  (
  `id` int(11) NOT NULL COMMENT '主键',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '标题',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for seckill_sku
-- ----------------------------
DROP TABLE IF EXISTS `seckill_sku`;
CREATE TABLE `seckill_sku`  (
  `sku_id` bigint(20) NOT NULL,
  `cost_price` decimal(19, 2) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `end_time` datetime(0) NULL DEFAULT NULL,
  `sku_image` varchar(400) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `sku_price` decimal(19, 2) NULL DEFAULT NULL,
  `start_time` datetime(0) NULL DEFAULT NULL,
  `stock_count` bigint(20) NULL DEFAULT NULL,
  `sku_title` varchar(400) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `raw_stock` bigint(20) NULL DEFAULT NULL COMMENT '原始库存',
  PRIMARY KEY (`sku_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of seckill_sku
-- ----------------------------
INSERT INTO `seckill_sku` VALUES (1, 1.00, '2019-09-08 00:03:29', '2019-10-26 00:03:29', NULL, 10.00, '2019-08-08 00:03:29', 17, 'test', 20);
INSERT INTO `seckill_sku` VALUES (2, 1.00, '2019-09-05 11:24:27', '2019-10-26 11:24:19', NULL, 10.00, '2019-02-01 11:24:06', 10000, 'test2', NULL);
INSERT INTO `seckill_sku` VALUES (745622247921783808, 1.00, '2019-10-26 09:47:51', '2019-11-26 09:47:51', NULL, 11.00, '2019-09-26 09:47:51', 100, 'apple', NULL);
INSERT INTO `seckill_sku` VALUES (745650086154966016, 1.00, '2019-10-26 11:13:37', '2019-11-26 11:13:37', NULL, 11.00, '2019-09-26 11:13:37', 100, 'apple', NULL);

-- ----------------------------
-- Table structure for seckill_order
-- ----------------------------
DROP TABLE IF EXISTS `seckill_order`;
CREATE TABLE `seckill_order`  (
  `order_id` bigint(20) NOT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `sku_id` bigint(20) NULL DEFAULT NULL,
  `pay_money` decimal(19, 2) NULL DEFAULT NULL,
  `pay_time` datetime(0) NULL DEFAULT NULL,
  `status` smallint(6) NULL DEFAULT NULL,
  `user_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`order_id`) USING BTREE,
  UNIQUE INDEX `order_index_1`(`sku_id`, `user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `url` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `path` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `path_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `css` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sort` int(11) NOT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `type` tinyint(1) NOT NULL,
  `hidden` tinyint(1) NOT NULL DEFAULT 0,
  `tenant_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`menu_id`) USING BTREE,
  INDEX `idx_parent_id`(`parent_id`) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 85 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (2, 12, '用户管理', '#!user', 'system/user.html', NULL, 'layui-icon-friends', 2, '2017-11-17 16:56:59', '2018-09-19 11:26:14', 1, 0, 'webApp');
INSERT INTO `sys_menu` VALUES (3, 12, '角色管理', '#!role', 'system/role.html', NULL, 'layui-icon-user', 3, '2017-11-17 16:56:59', '2019-01-14 15:34:40', 1, 0, 'webApp');
INSERT INTO `sys_menu` VALUES (4, 12, '菜单管理', '#!menus', 'system/menus.html', NULL, 'layui-icon-menu-fill', 4, '2017-11-17 16:56:59', '2018-09-03 02:23:47', 1, 0, 'webApp');
INSERT INTO `sys_menu` VALUES (9, 37, '文件中心', '#!files', 'files/files.html', NULL, 'layui-icon-file', 3, '2017-11-17 16:56:59', '2019-01-17 20:18:44', 1, 0, 'webApp');
INSERT INTO `sys_menu` VALUES (10, 37, '文档中心', '#!swagger', 'http://127.0.0.1:9900/swagger-ui.html', NULL, 'layui-icon-app', 4, '2017-11-17 16:56:59', '2019-01-17 20:18:48', 1, 0, 'webApp');
INSERT INTO `sys_menu` VALUES (11, 12, '我的信息', '#!myInfo', 'system/myInfo.html', NULL, 'layui-icon-login-qq', 10, '2017-11-17 16:56:59', '2018-09-02 06:12:24', 1, 0, 'webApp');
INSERT INTO `sys_menu` VALUES (12, -1, '认证管理', 'javascript:;', '', NULL, 'layui-icon-set', 1, '2017-11-17 16:56:59', '2018-12-13 15:02:49', 1, 0, 'webApp');
INSERT INTO `sys_menu` VALUES (35, 12, '应用管理', '#!app', 'attestation/app.html', NULL, 'layui-icon-link', 5, '2017-11-17 16:56:59', '2019-01-14 15:35:15', 1, 0, 'webApp');
INSERT INTO `sys_menu` VALUES (37, -1, '系统管理', 'javascript:;', '', NULL, 'layui-icon-set', 2, '2018-08-25 10:41:58', '2019-01-23 14:01:58', 1, 0, 'webApp');
INSERT INTO `sys_menu` VALUES (62, 63, '应用监控', '#!admin', 'http://127.0.0.1:6500/#/wallboard', NULL, 'layui-icon-chart-screen', 3, '2019-01-08 15:32:19', '2019-01-17 20:22:44', 1, 0, 'webApp');
INSERT INTO `sys_menu` VALUES (63, -1, '系统监控', 'javascript:;', '', NULL, 'layui-icon-set', 2, '2019-01-10 18:35:05', '2019-01-10 18:35:05', 1, 0, 'webApp');
INSERT INTO `sys_menu` VALUES (64, 63, '系统日志', '#!sysLog', 'log/sysLog.html', NULL, 'layui-icon-file-b', 1, '2019-01-10 18:35:55', '2019-01-12 00:27:20', 1, 0, 'webApp');
INSERT INTO `sys_menu` VALUES (65, 37, '代码生成器', '#!generator', 'generator/list.html', NULL, 'layui-icon-template', 2, '2019-01-14 00:47:36', '2019-01-23 14:06:31', 1, 0, 'webApp');
INSERT INTO `sys_menu` VALUES (66, 63, '慢查询SQL', '#!slowQueryLog', 'log/slowQueryLog.html', NULL, 'layui-icon-snowflake', 2, '2019-01-16 12:00:27', '2019-01-16 15:32:31', 1, 0, 'webApp');
INSERT INTO `sys_menu` VALUES (67, -1, '任务管理', '#!job', 'http://127.0.0.1:8081/', NULL, 'layui-icon-date', 3, '2019-01-17 20:18:22', '2019-01-23 14:01:53', 1, 0, 'webApp');
INSERT INTO `sys_menu` VALUES (68, 63, '应用吞吐量监控', '#!sentinel', 'http://127.0.0.1:6999', NULL, 'layui-icon-chart', 4, '2019-01-22 16:31:55', '2019-01-22 16:34:03', 1, 0, 'webApp');
INSERT INTO `sys_menu` VALUES (69, 37, '配置中心', '#!nacos', 'http://127.0.0.1:8848/nacos', NULL, 'layui-icon-tabs', 1, '2019-01-23 14:06:10', '2019-01-23 14:06:10', 1, 0, 'webApp');
INSERT INTO `sys_menu` VALUES (70, 63, 'APM监控', '#!apm', 'http://127.0.0.1:8080', NULL, 'layui-icon-engine', 5, '2019-02-27 10:31:55', '2019-02-27 10:31:55', 1, 0, 'webApp');
INSERT INTO `sys_menu` VALUES (71, -1, '搜索管理', 'javascript:;', '', NULL, 'layui-icon-set', 3, '2018-08-25 10:41:58', '2019-01-23 15:07:07', 1, 0, 'webApp');
INSERT INTO `sys_menu` VALUES (72, 71, '索引管理', '#!index', 'search/index_manager.html', NULL, 'layui-icon-template', 1, '2019-01-10 18:35:55', '2019-01-12 00:27:20', 1, 0, 'webApp');
INSERT INTO `sys_menu` VALUES (73, 71, '用户搜索', '#!userSearch', 'search/user_search.html', NULL, 'layui-icon-user', 2, '2019-01-10 18:35:55', '2019-01-12 00:27:20', 1, 0, 'webApp');
INSERT INTO `sys_menu` VALUES (74, 12, 'Token管理', '#!tokens', 'system/tokens.html', NULL, 'layui-icon-unlink', 6, '2019-07-11 16:56:59', '2019-07-11 16:56:59', 1, 0, 'webApp');
INSERT INTO `sys_menu` VALUES (75, 2, '用户列表', '/backend-provider/users', 'user-list', 'GET', NULL, 1, '2019-07-29 16:56:59', '2019-07-29 16:56:59', 2, 0, 'webApp');
INSERT INTO `sys_menu` VALUES (76, 2, '查询用户角色', '/backend-provider/roles', 'user-roles', 'GET', NULL, 2, '2019-07-29 16:56:59', '2019-07-29 16:56:59', 2, 0, 'webApp');
INSERT INTO `sys_menu` VALUES (77, 2, '用户添加', '/backend-provider/users/saveOrUpdate', 'user-btn-add', 'POST', NULL, 3, '2019-07-29 16:56:59', '2019-07-29 16:56:59', 2, 0, 'webApp');
INSERT INTO `sys_menu` VALUES (78, 2, '用户导出', '/backend-provider/users/export', 'user-btn-export', 'POST', NULL, 4, '2019-07-29 16:56:59', '2019-07-29 16:56:59', 2, 0, 'webApp');
INSERT INTO `sys_menu` VALUES (79, 2, '用户导入', '/backend-provider/users/import', 'user-btn-import', 'POST', NULL, 5, '2019-07-29 16:56:59', '2019-07-29 16:56:59', 2, 0, 'webApp');
INSERT INTO `sys_menu` VALUES (80, -1, '用户管理', '#!user', '', NULL, NULL, 1, '2019-08-06 20:02:13', '2019-08-06 20:02:13', 1, 0, 'zlt');
INSERT INTO `sys_menu` VALUES (81, -1, '商品管理', '#!product', '', NULL, NULL, 2, '2019-08-06 20:02:13', '2019-08-06 20:02:13', 1, 0, 'zlt');
INSERT INTO `sys_menu` VALUES (82, -1, '支付管理', '#!pay', '', NULL, NULL, 3, '2019-08-06 20:02:13', '2019-08-06 20:02:13', 1, 0, 'zlt');
INSERT INTO `sys_menu` VALUES (83, -1, '交易管理', '#!trading', '', NULL, NULL, 4, '2019-08-06 20:02:13', '2019-08-06 20:02:13', 1, 0, 'zlt');
INSERT INTO `sys_menu` VALUES (84, -1, '系统管理', '#!system', '', NULL, NULL, 1, '2019-08-06 20:02:13', '2019-08-06 20:02:13', 1, 0, 'app');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色code',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `tenant_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`role_id`) USING BTREE,
  INDEX `idx_code`(`code`) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, 'ADMIN', '管理员', '2017-11-17 16:56:59', '2018-09-19 09:39:10', 'webApp');
INSERT INTO `sys_role` VALUES (2, 'test', '测试', '2018-09-17 10:15:51', '2018-11-15 01:49:14', 'webApp');
INSERT INTO `sys_role` VALUES (3, '11', '11', '2018-11-15 01:49:19', '2018-11-15 01:49:19', 'webApp');
INSERT INTO `sys_role` VALUES (4, 'shop_admin', '商城管理员', '2019-08-06 20:02:13', '2019-08-06 20:02:13', 'zlt');
INSERT INTO `sys_role` VALUES (5, 'app_admin', '移动管理员', '2019-08-06 20:02:13', '2019-08-06 20:02:13', 'app');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (1, 1, 2);
INSERT INTO `sys_role_menu` VALUES (2, 1, 3);
INSERT INTO `sys_role_menu` VALUES (3, 1, 4);
INSERT INTO `sys_role_menu` VALUES (4, 1, 9);
INSERT INTO `sys_role_menu` VALUES (5, 1, 10);
INSERT INTO `sys_role_menu` VALUES (6, 1, 11);
INSERT INTO `sys_role_menu` VALUES (7, 1, 12);
INSERT INTO `sys_role_menu` VALUES (8, 1, 35);
INSERT INTO `sys_role_menu` VALUES (9, 1, 37);
INSERT INTO `sys_role_menu` VALUES (10, 1, 62);
INSERT INTO `sys_role_menu` VALUES (11, 1, 63);
INSERT INTO `sys_role_menu` VALUES (12, 1, 64);
INSERT INTO `sys_role_menu` VALUES (13, 1, 65);
INSERT INTO `sys_role_menu` VALUES (14, 1, 66);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nick_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `head_img_url` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `mobile` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sex` tinyint(1) NULL DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `company` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `open_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_del` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`user_id`) USING BTREE,
  INDEX `idx_username`(`user_name`) USING BTREE,
  INDEX `idx_mobile`(`mobile`) USING BTREE,
  INDEX `idx_open_id`(`open_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', '$2a$10$TJkwVdlpbHKnV45.nBxbgeFHmQRmyWlshg94lFu2rKxVtT2OMniDO', '管理员', 'http://pkqtmn0p1.bkt.clouddn.com/头像.png', '18888888888', 0, 1, 'APP', '2017-11-17 16:56:59', '2019-01-08 17:05:47', 'ENGJ', '123', 0);
INSERT INTO `sys_user` VALUES (2, 'user', '$2a$10$OhfZv4VQJiqMEukpf1qXA.V7UMiHjr86g6lJqPvKUoHwrPk35steG', '体验用户', 'http://payo7kq4i.bkt.clouddn.com/QQ%E5%9B%BE%E7%89%8720180819191900.jpg', '18888888887', 1, 0, 'APP', '2017-11-17 16:56:59', '2019-12-22 10:56:11', 'ENGJ', NULL, 0);
INSERT INTO `sys_user` VALUES (3, 'test', '$2a$10$RD18sHNphJMmcuLuUX/Np.IV/7Ngbjd3Jtj3maFLpwaA6KaHVqPtq', '测试账户', 'http://payo7kq4i.bkt.clouddn.com/QQ%E5%9B%BE%E7%89%8720180819191900.jpg', '13851539156', 0, 0, 'APP', '2017-11-17 16:56:59', '2018-09-07 03:27:40', 'ENGJ', NULL, 0);
INSERT INTO `sys_user` VALUES (4, '1', '$2a$10$9vLdwXBZaAPy/hmzEDf.M.YbrsKWGG21nqWq17/EwWPBi65GDivLa', '11', NULL, '13530151800', 1, 1, 'APP', '2018-09-07 14:20:51', '2018-11-15 01:45:36', 'YCC', NULL, 0);
INSERT INTO `sys_user` VALUES (5, '12', '$2a$10$cgRGZ0uuIAoKuwBoTWmz7eJzP4RUEr688VlnpZ4BTCz2RZEt0jrIe', '12', NULL, '17587132062', 0, 1, 'APP', '2018-09-08 04:52:25', '2018-09-16 01:48:00', 'YCC', NULL, 0);
INSERT INTO `sys_user` VALUES (6, 'abc1', '$2a$10$pzvn4TfBh2oFZJbtagovFe56ZTUlTaawPnx0Yz2PeqGex0xbddAGu', 'abc', NULL, '12345678901', 0, 1, 'APP', '2018-09-11 08:02:25', '2018-09-14 06:49:54', 'YCC', NULL, 0);
INSERT INTO `sys_user` VALUES (7, '234', '$2a$10$FxFvGGSi2RCe4lm5V.G0Feq6szh5ArMz.8Mzm08zQlkA.VgE9GFbm', 'ddd', NULL, '13245678906', 0, 1, 'APP', '2018-09-19 01:33:54', '2018-09-19 01:33:54', 'JFSC', NULL, 1);
INSERT INTO `sys_user` VALUES (8, 'tester', '$2a$10$VUfknatgKIoZJYDLIesrrO5Vg8Djw5ON2oDWeXyC24TZ6Ca/TWiye', 'tester', NULL, '12345678901', 0, 1, 'APP', '2018-09-19 04:52:01', '2018-11-16 22:12:04', 'JFSC', NULL, 1);
INSERT INTO `sys_user` VALUES (9, '11111111111111111111', '$2a$10$DNaUDpCHKZI0V9w.R3wBaeD/gGOQDYjgC5fhju7bQLfIkqsZV61pi', 'cute', 'http://payo7kq4i.bkt.clouddn.com/C:\\Users\\GAOY91\\Pictures\\79f0f736afc37931a921fd59e3c4b74543a91170.jpg', '15599999991', 1, 1, 'APP', '2018-09-19 04:57:39', NULL, 'JFSC', NULL, 1);
INSERT INTO `sys_user` VALUES (10, 'test001', '123456', 'test001', NULL, '11111111', 0, 1, 'BACKEND', '2018-09-12 13:50:57', '2019-01-07 13:04:18', NULL, NULL, 1);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2, 1);
INSERT INTO `sys_user_role` VALUES (3, 3, 1);
INSERT INTO `sys_user_role` VALUES (4, 4, 1);
INSERT INTO `sys_user_role` VALUES (5, 5, 1);
INSERT INTO `sys_user_role` VALUES (6, 6, 1);
INSERT INTO `sys_user_role` VALUES (7, 7, 2);
INSERT INTO `sys_user_role` VALUES (8, 8, 2);

-- ----------------------------
-- Table structure for test2
-- ----------------------------
DROP TABLE IF EXISTS `test2`;
CREATE TABLE `test2`  (
  `GetDataByTime` varchar(21844) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info`  (
  `login_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `enabled` bit(1) NULL DEFAULT NULL,
  `head_img_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_del` bit(1) NULL DEFAULT NULL,
  `mobile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nick_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `open_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` int(11) NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `user_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES ('test', '$2a$10$AsCxXPI8B/JDzKK56ZACjuH9Pi2TuT6LLC0Nwh8Qt3a2eFp04gziy', 1, NULL, NULL, NULL, NULL, NULL, '测试用户1', NULL, NULL, NULL, NULL, 'test');
INSERT INTO `user_info` VALUES ('test2', '$2a$10$AsCxXPI8B/JDzKK56ZACjuH9Pi2TuT6LLC0Nwh8Qt3a2eFp04gziy', 2, NULL, NULL, NULL, NULL, NULL, '测试用户2', NULL, NULL, NULL, NULL, 'test2');

SET FOREIGN_KEY_CHECKS = 1;
