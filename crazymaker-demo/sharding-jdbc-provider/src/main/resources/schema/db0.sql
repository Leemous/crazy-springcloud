DROP TABLE IF EXISTS `t_order_0`;
DROP TABLE IF EXISTS `t_order_1`;
DROP TABLE IF EXISTS `t_order_2`;
DROP TABLE IF EXISTS `t_order_3`;

DROP TABLE IF EXISTS `t_config`;
CREATE TABLE `t_order_0` (`order_id` bigInt NOT NULL, `user_id` INT NOT NULL, `status` VARCHAR(45) NULL, PRIMARY KEY (`order_id`));
CREATE TABLE `t_order_1` (`order_id` bigInt NOT NULL, `user_id` INT NOT NULL, `status` VARCHAR(45) NULL, PRIMARY KEY (`order_id`));
CREATE TABLE `t_order_2` (`order_id` bigInt NOT NULL, `user_id` INT NOT NULL, `status` VARCHAR(45) NULL, PRIMARY KEY (`order_id`));
CREATE TABLE `t_order_3` (`order_id` bigInt NOT NULL, `user_id` INT NOT NULL, `status` VARCHAR(45) NULL, PRIMARY KEY (`order_id`));
CREATE TABLE `t_config` (`id` bigInt NOT NULL, `status` VARCHAR(45) NULL, PRIMARY KEY (`id`));

DROP TABLE IF EXISTS `t_order_item_0`;
DROP TABLE IF EXISTS `t_order_item_1`;
DROP TABLE IF EXISTS `t_order_item_2`;
DROP TABLE IF EXISTS `t_order_item_3`;
CREATE TABLE `t_order_item_0` (`order_item_id` INT NOT NULL, `order_id` INT NOT NULL, `user_id` INT NOT NULL, `status` VARCHAR(45) NULL, PRIMARY KEY (`order_item_id`));
CREATE TABLE `t_order_item_1` (`order_item_id` INT NOT NULL, `order_id` INT NOT NULL, `user_id` INT NOT NULL, `status` VARCHAR(45) NULL, PRIMARY KEY (`order_item_id`));
CREATE TABLE `t_order_item_2` (`order_item_id` INT NOT NULL, `order_id` INT NOT NULL, `user_id` INT NOT NULL, `status` VARCHAR(45) NULL, PRIMARY KEY (`order_item_id`));
CREATE TABLE `t_order_item_3` (`order_item_id` INT NOT NULL, `order_id` INT NOT NULL, `user_id` INT NOT NULL, `status` VARCHAR(45) NULL, PRIMARY KEY (`order_item_id`));


INSERT INTO `t_config` VALUES (1, 'config_key', 'config_value');

INSERT INTO `t_order_0` VALUES (1000, 10, 'INIT');
INSERT INTO `t_order_0` VALUES (1002, 10, 'INIT');
INSERT INTO `t_order_0` VALUES (1004, 10, 'INIT');
INSERT INTO `t_order_0` VALUES (1006, 10, 'INIT');
INSERT INTO `t_order_0` VALUES (1008, 10, 'INIT');
INSERT INTO `t_order_item_0` VALUES (100001, 1000, 10);
INSERT INTO `t_order_item_0` VALUES (100201, 1002, 10);
INSERT INTO `t_order_item_0` VALUES (100401, 1004, 10);
INSERT INTO `t_order_item_0` VALUES (100601, 1006, 10);
INSERT INTO `t_order_item_0` VALUES (100801, 1008, 10);

INSERT INTO `t_order_1` VALUES (1001, 10, 'INIT');
INSERT INTO `t_order_1` VALUES (1003, 10, 'INIT');
INSERT INTO `t_order_1` VALUES (1005, 10, 'INIT');
INSERT INTO `t_order_1` VALUES (1007, 10, 'INIT');
INSERT INTO `t_order_1` VALUES (1009, 10, 'INIT');
INSERT INTO `t_order_item_1` VALUES (100101, 1001, 10);
INSERT INTO `t_order_item_1` VALUES (100301, 1003, 10);
INSERT INTO `t_order_item_1` VALUES (100501, 1005, 10);
INSERT INTO `t_order_item_1` VALUES (100701, 1007, 10);
INSERT INTO `t_order_item_1` VALUES (100901, 1009, 10);