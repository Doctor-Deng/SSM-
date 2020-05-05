/*
 Navicat MySQL Data Transfer

 Source Server         : MySpringDB
 Source Server Type    : MySQL
 Source Server Version : 50724
 Source Host           : localhost:3306
 Source Schema         : spring_ssm

 Target Server Type    : MySQL
 Target Server Version : 50724
 File Encoding         : 65001

 Date: 05/05/2020 15:01:34
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for member
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `NAME` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nickname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phoneNum` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES ('E61D65F673D54F68B0861025C69773DB', '张三', '小三', '18888888888', 'zs@163.com');

-- ----------------------------
-- Table structure for order_traveller
-- ----------------------------
DROP TABLE IF EXISTS `order_traveller`;
CREATE TABLE `order_traveller`  (
  `orderId` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `travellerId` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`orderId`, `travellerId`) USING BTREE,
  INDEX `travellerId`(`travellerId`) USING BTREE,
  CONSTRAINT `order_traveller_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `order_traveller_ibfk_2` FOREIGN KEY (`travellerId`) REFERENCES `traveller` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_traveller
-- ----------------------------
INSERT INTO `order_traveller` VALUES ('0E7231DC797C486290E8713CA3C6ECCC', '3FE27DF2A4E44A6DBC5D0FE4651D3D3E');
INSERT INTO `order_traveller` VALUES ('2FF351C4AC744E2092DCF08CFD314420', '3FE27DF2A4E44A6DBC5D0FE4651D3D3E');
INSERT INTO `order_traveller` VALUES ('5DC6A48DD4E94592AE904930EA866AFA', '3FE27DF2A4E44A6DBC5D0FE4651D3D3E');
INSERT INTO `order_traveller` VALUES ('A0657832D93E4B10AE88A2D4B70B1A28', '3FE27DF2A4E44A6DBC5D0FE4651D3D3E');
INSERT INTO `order_traveller` VALUES ('55F9AF582D5A4DB28FB4EC3199385762', 'EE7A71FB6945483FBF91543DBE851960');
INSERT INTO `order_traveller` VALUES ('96CC8BD43C734CC2ACBFF09501B4DD5D', 'EE7A71FB6945483FBF91543DBE851960');
INSERT INTO `order_traveller` VALUES ('CA005CF1BE3C4EF68F88ABC7DF30E976', 'EE7A71FB6945483FBF91543DBE851960');
INSERT INTO `order_traveller` VALUES ('E4DD4C45EED84870ABA83574A801083E', 'EE7A71FB6945483FBF91543DBE851960');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `orderNum` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `orderTime` timestamp(0) NULL DEFAULT NULL,
  `peopleCount` int(11) NULL DEFAULT NULL,
  `orderDesc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `payType` int(11) NULL DEFAULT NULL,
  `orderStatus` int(11) NULL DEFAULT NULL,
  `productId` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `memberId` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `orderNum`(`orderNum`) USING BTREE,
  INDEX `productId`(`productId`) USING BTREE,
  INDEX `memberId`(`memberId`) USING BTREE,
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`memberId`) REFERENCES `member` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('0E7231DC797C486290E8713CA3C6ECCC', '12345', '2019-06-28 15:22:22', 2, '没什么', 0, 1, '12B7ABF2A4C544568B0A7C69F36BF8B7', 'E61D65F673D54F68B0861025C69773DB');
INSERT INTO `orders` VALUES ('2FF351C4AC744E2092DCF08CFD314420', '67890', '2019-06-28 15:22:22', 2, '没什么', 0, 1, '12B7ABF2A4C544568B0A7C69F36BF8B7', 'E61D65F673D54F68B0861025C69773DB');
INSERT INTO `orders` VALUES ('55F9AF582D5A4DB28FB4EC3199385762', '33333', '2019-06-28 15:22:22', 2, '没什么', 0, 1, '676C5BD1D35E429A8C2E114939C5685A', 'E61D65F673D54F68B0861025C69773DB');
INSERT INTO `orders` VALUES ('5DC6A48DD4E94592AE904930EA866AFA', '54321', '2019-06-28 15:22:22', 2, '没什么', 0, 1, '676C5BD1D35E429A8C2E114939C5685A', 'E61D65F673D54F68B0861025C69773DB');
INSERT INTO `orders` VALUES ('96CC8BD43C734CC2ACBFF09501B4DD5D', '22222', '2019-06-28 15:22:22', 2, '没什么', 0, 1, '676C5BD1D35E429A8C2E114939C5685A', 'E61D65F673D54F68B0861025C69773DB');
INSERT INTO `orders` VALUES ('A0657832D93E4B10AE88A2D4B70B1A28', '98765', '2019-06-28 15:22:22', 2, '没什么', 0, 1, '9F71F01CB448476DAFB309AA6DF9497F', 'E61D65F673D54F68B0861025C69773DB');
INSERT INTO `orders` VALUES ('CA005CF1BE3C4EF68F88ABC7DF30E976', '44444', '2019-06-28 15:22:22', 2, '没什么', 0, 1, '9F71F01CB448476DAFB309AA6DF9497F', 'E61D65F673D54F68B0861025C69773DB');
INSERT INTO `orders` VALUES ('E4DD4C45EED84870ABA83574A801083E', '11111', '2019-06-28 15:22:22', 2, '没什么', 0, 1, '9F71F01CB448476DAFB309AA6DF9497F', 'E61D65F673D54F68B0861025C69773DB');

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `permissionName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('05f89a92df07486c8cea7b09327f1552', '产品管理', '/product');
INSERT INTO `permission` VALUES ('1744b7bbd80d44e588b3be6c9c765b45', '查看日志', '/sysLog/findAll.do');
INSERT INTO `permission` VALUES ('250a243982934c8c90b12a8da7a32f62', '测试权限', '/permission');
INSERT INTO `permission` VALUES ('32e064086dba437bab3545439a1d7503', '订单管理', '/orders');
INSERT INTO `permission` VALUES ('7ee36ff41d1448dd802b62ba8ef92ca2', '用户管理', '/user');
INSERT INTO `permission` VALUES ('9a824062f6304aeda8fa12205537e8db', '角色管理', '/role');
INSERT INTO `permission` VALUES ('9c15518d7f07411289766436b9874e30', '添加用户', '/user/save.do');
INSERT INTO `permission` VALUES ('d383dc4d8d9c4329ada83d1b4e4d1828', '添加角色', '/role/save.do');
INSERT INTO `permission` VALUES ('e0a365e4929c471795c49b030bb17a3b', '添加订单', '/orders/save.do');
INSERT INTO `permission` VALUES ('ed1e3f06673248679130e006a2baa916', '添加产品', '/product/save.do');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `productNum` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `productName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cityName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DepartureTime` timestamp(0) NULL DEFAULT NULL,
  `productPrice` decimal(10, 0) NULL DEFAULT NULL,
  `productDesc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `productStatus` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('12B7ABF2A4C544568B0A7C69F36BF8B7', 'itcast-003', '上海五日游', '上海', '2019-07-28 15:22:22', 1800, '魔都我来了', 0);
INSERT INTO `product` VALUES ('676C5BD1D35E429A8C2E114939C5685A', 'itcast-002', '北京三日游', '北京', '2019-06-28 15:22:22', 1200, '不错的旅行', 1);
INSERT INTO `product` VALUES ('9F71F01CB448476DAFB309AA6DF9497F', 'itcast-001', '北京三日游', '北京', '2019-08-28 15:22:22', 1200, '不错的旅行', 1);
INSERT INTO `product` VALUES ('b3ac5d7c57604a31a0159b6ed6a24c89', 'asdasd', '武汉一日游', '北京', '2020-03-09 22:20:00', 9999, '', 1);
INSERT INTO `product` VALUES ('c2ae310f5b67491eaa0dc1093f20258d', '123', '北京一日游', '北京', '2020-03-07 01:35:00', 9999, '无', 1);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `roleName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `roleDesc` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', 'ADMIN', '最高管理员');
INSERT INTO `role` VALUES ('2', 'SYSTEM', '系统管理员');
INSERT INTO `role` VALUES ('3', 'BUSINESS', '业务管理员');
INSERT INTO `role` VALUES ('7a1341cacd3b44c397b67a55f926a2a1', '大佬', '很牛逼的');
INSERT INTO `role` VALUES ('fa381d508e79474a838ba0536a6ebfa9', '大佬2号', '测试第二次');

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission`  (
  `permissionId` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `roleId` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`permissionId`, `roleId`) USING BTREE,
  INDEX `roleId`(`roleId`) USING BTREE,
  CONSTRAINT `role_permission_ibfk_1` FOREIGN KEY (`permissionId`) REFERENCES `permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `role_permission_ibfk_2` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_permission
-- ----------------------------
INSERT INTO `role_permission` VALUES ('05f89a92df07486c8cea7b09327f1552', '1');
INSERT INTO `role_permission` VALUES ('1744b7bbd80d44e588b3be6c9c765b45', '1');
INSERT INTO `role_permission` VALUES ('32e064086dba437bab3545439a1d7503', '1');
INSERT INTO `role_permission` VALUES ('7ee36ff41d1448dd802b62ba8ef92ca2', '1');
INSERT INTO `role_permission` VALUES ('9a824062f6304aeda8fa12205537e8db', '1');
INSERT INTO `role_permission` VALUES ('9c15518d7f07411289766436b9874e30', '1');
INSERT INTO `role_permission` VALUES ('d383dc4d8d9c4329ada83d1b4e4d1828', '1');
INSERT INTO `role_permission` VALUES ('e0a365e4929c471795c49b030bb17a3b', '1');
INSERT INTO `role_permission` VALUES ('ed1e3f06673248679130e006a2baa916', '1');
INSERT INTO `role_permission` VALUES ('1744b7bbd80d44e588b3be6c9c765b45', '2');
INSERT INTO `role_permission` VALUES ('7ee36ff41d1448dd802b62ba8ef92ca2', '2');
INSERT INTO `role_permission` VALUES ('9a824062f6304aeda8fa12205537e8db', '2');
INSERT INTO `role_permission` VALUES ('9c15518d7f07411289766436b9874e30', '2');
INSERT INTO `role_permission` VALUES ('d383dc4d8d9c4329ada83d1b4e4d1828', '2');
INSERT INTO `role_permission` VALUES ('05f89a92df07486c8cea7b09327f1552', '3');
INSERT INTO `role_permission` VALUES ('32e064086dba437bab3545439a1d7503', '3');
INSERT INTO `role_permission` VALUES ('e0a365e4929c471795c49b030bb17a3b', '3');
INSERT INTO `role_permission` VALUES ('ed1e3f06673248679130e006a2baa916', '3');
INSERT INTO `role_permission` VALUES ('32e064086dba437bab3545439a1d7503', '7a1341cacd3b44c397b67a55f926a2a1');
INSERT INTO `role_permission` VALUES ('e0a365e4929c471795c49b030bb17a3b', '7a1341cacd3b44c397b67a55f926a2a1');
INSERT INTO `role_permission` VALUES ('32e064086dba437bab3545439a1d7503', 'fa381d508e79474a838ba0536a6ebfa9');
INSERT INTO `role_permission` VALUES ('ed1e3f06673248679130e006a2baa916', 'fa381d508e79474a838ba0536a6ebfa9');

-- ----------------------------
-- Table structure for syslog
-- ----------------------------
DROP TABLE IF EXISTS `syslog`;
CREATE TABLE `syslog`  (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `visitTime` timestamp(0) NULL DEFAULT NULL,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ip` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `executionTime` int(11) NULL DEFAULT NULL,
  `method` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 471 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of syslog
-- ----------------------------
INSERT INTO `syslog` VALUES (43, '2020-04-22 18:14:57', 'dsx', '0:0:0:0:0:0:0:1', '/product/findAll.do', 67, '[类名]com.ssm.controller.ProductController方法名findAll');
INSERT INTO `syslog` VALUES (44, '2020-04-22 18:15:08', 'dsx', '0:0:0:0:0:0:0:1', '/userfindAll.do', 14, '[类名]com.ssm.controller.UserController方法名findAll');
INSERT INTO `syslog` VALUES (45, '2020-04-22 18:15:57', 'dsx', '0:0:0:0:0:0:0:1', '/userfindAll.do', 7, '[类名]com.ssm.controller.UserController方法名findAll');
INSERT INTO `syslog` VALUES (46, '2020-04-22 18:16:07', 'dsx', '0:0:0:0:0:0:0:1', '/role/findAll.do', 19, '[类名]com.ssm.controller.RoleController方法名findAll');
INSERT INTO `syslog` VALUES (47, '2020-04-22 18:16:53', 'dsx', '0:0:0:0:0:0:0:1', '/user/findAll.do', 106, '[类名]com.ssm.controller.UserController方法名findAll');
INSERT INTO `syslog` VALUES (74, '2020-04-22 21:35:45', 'dsx', '0:0:0:0:0:0:0:1', '/user/findAll.do', 58, '[类名]com.ssm.controller.UserController方法名findAll');
INSERT INTO `syslog` VALUES (75, '2020-04-22 21:35:47', 'dsx', '0:0:0:0:0:0:0:1', '/role/findAll.do', 14, '[类名]com.ssm.controller.RoleController方法名findAll');
INSERT INTO `syslog` VALUES (76, '2020-04-22 21:35:53', 'dsx', '0:0:0:0:0:0:0:1', '/product/findAll.do', 15, '[类名]com.ssm.controller.ProductController方法名findAll');
INSERT INTO `syslog` VALUES (77, '2020-04-22 21:35:56', 'dsx', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 13, '[类名]com.ssm.controller.SysLogController方法名findAll');
INSERT INTO `syslog` VALUES (78, '2020-04-22 21:35:59', 'dsx', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 8, '[类名]com.ssm.controller.SysLogController方法名findAll');
INSERT INTO `syslog` VALUES (79, '2020-04-22 21:36:01', 'dsx', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 11, '[类名]com.ssm.controller.SysLogController方法名findAll');
INSERT INTO `syslog` VALUES (80, '2020-04-22 21:37:01', 'dsx', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 7, '[类名]com.ssm.controller.SysLogController方法名findAll');
INSERT INTO `syslog` VALUES (81, '2020-04-22 21:43:29', 'dsx', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 64, '[类名]com.ssm.controller.SysLogController方法名findAll');
INSERT INTO `syslog` VALUES (82, '2020-04-22 21:43:31', 'dsx', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 10, '[类名]com.ssm.controller.SysLogController方法名findAll');
INSERT INTO `syslog` VALUES (83, '2020-04-22 21:43:32', 'dsx', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 6, '[类名]com.ssm.controller.SysLogController方法名findAll');
INSERT INTO `syslog` VALUES (84, '2020-04-22 13:48:20', 'dsx', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 70, '[类名] com.itheima.ssm.controller.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES (85, '2020-04-22 13:48:22', 'dsx', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 12, '[类名] com.itheima.ssm.controller.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES (86, '2020-04-22 13:48:31', 'dsx', '0:0:0:0:0:0:0:1', '/role/findAll.do', 17, '[类名] com.itheima.ssm.controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES (87, '2020-04-22 13:48:37', 'dsx', '0:0:0:0:0:0:0:1', '/user/findAll.do', 15, '[类名] com.itheima.ssm.controller.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES (88, '2020-04-22 13:48:41', 'dsx', '0:0:0:0:0:0:0:1', '/role/findAll.do', 6, '[类名] com.itheima.ssm.controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES (89, '2020-04-22 13:48:43', 'dsx', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 11, '[类名] com.itheima.ssm.controller.PermissionController[方法名] findAll');
INSERT INTO `syslog` VALUES (90, '2020-04-22 13:48:47', 'dsx', '0:0:0:0:0:0:0:1', '/product/findAll.do', 15, '[类名] com.itheima.ssm.controller.ProductController[方法名] findAll');
INSERT INTO `syslog` VALUES (91, '2020-04-22 13:49:05', 'dsx', '0:0:0:0:0:0:0:1', '/product/findAll.do', 8, '[类名] com.itheima.ssm.controller.ProductController[方法名] findAll');
INSERT INTO `syslog` VALUES (92, '2020-04-22 13:49:11', 'dsx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 71, '[类名] com.itheima.ssm.controller.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES (93, '2020-04-22 13:49:22', 'dsx', '0:0:0:0:0:0:0:1', '/product/findAll.do', 6, '[类名] com.itheima.ssm.controller.ProductController[方法名] findAll');
INSERT INTO `syslog` VALUES (94, '2020-04-22 13:49:28', 'dsx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 14, '[类名] com.itheima.ssm.controller.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES (95, '2020-04-22 13:49:36', 'dsx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 6, '[类名] com.itheima.ssm.controller.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES (96, '2020-04-22 13:49:38', 'dsx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 11, '[类名] com.itheima.ssm.controller.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES (97, '2020-04-22 13:50:14', 'dsx', '0:0:0:0:0:0:0:1', '/orders/findById.do', 63, '[类名] com.itheima.ssm.controller.OrdersController[方法名] findById');
INSERT INTO `syslog` VALUES (98, '2020-04-22 13:50:17', 'dsx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 12, '[类名] com.itheima.ssm.controller.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES (99, '2020-04-24 10:08:14', 'dsx', '0:0:0:0:0:0:0:1', '/user/findAll.do', 101, '[类名]com.ssm.controller.UserController方法名findAll');
INSERT INTO `syslog` VALUES (100, '2020-04-24 10:11:24', 'dsx', '0:0:0:0:0:0:0:1', '/user/findAll.do', 10, '[类名]com.ssm.controller.UserController方法名findAll');
INSERT INTO `syslog` VALUES (101, '2020-04-24 10:11:29', 'dsx', '0:0:0:0:0:0:0:1', '/user/findAll.do', 11, '[类名]com.ssm.controller.UserController方法名findAll');
INSERT INTO `syslog` VALUES (102, '2020-04-24 10:12:42', 'dsx', '0:0:0:0:0:0:0:1', '/user/findAll.do', 10, '[类名]com.ssm.controller.UserController方法名findAll');
INSERT INTO `syslog` VALUES (103, '2020-04-24 10:13:24', 'dsx', '0:0:0:0:0:0:0:1', '/role/findAll.do', 14, '[类名]com.ssm.controller.RoleController方法名findAll');
INSERT INTO `syslog` VALUES (104, '2020-04-24 10:13:26', 'dsx', '0:0:0:0:0:0:0:1', '/product/findAll.do', 15, '[类名]com.ssm.controller.ProductController方法名findAll');
INSERT INTO `syslog` VALUES (105, '2020-04-24 10:13:28', 'dsx', '0:0:0:0:0:0:0:1', '/product/findAll.do', 6, '[类名]com.ssm.controller.ProductController方法名findAll');
INSERT INTO `syslog` VALUES (106, '2020-04-24 10:13:29', 'dsx', '0:0:0:0:0:0:0:1', '/product/findAll.do', 9, '[类名]com.ssm.controller.ProductController方法名findAll');
INSERT INTO `syslog` VALUES (107, '2020-04-24 10:13:31', 'dsx', '0:0:0:0:0:0:0:1', '/product/findAll.do', 16, '[类名]com.ssm.controller.ProductController方法名findAll');
INSERT INTO `syslog` VALUES (108, '2020-04-24 10:14:33', 'dsx', '0:0:0:0:0:0:0:1', '/user/findAll.do', 6, '[类名]com.ssm.controller.UserController方法名findAll');
INSERT INTO `syslog` VALUES (109, '2020-04-24 10:16:05', 'dsx', '0:0:0:0:0:0:0:1', '/user/findAll.do', 6, '[类名]com.ssm.controller.UserController方法名findAll');
INSERT INTO `syslog` VALUES (110, '2020-04-24 10:16:06', 'dsx', '0:0:0:0:0:0:0:1', '/user/findAll.do', 4, '[类名]com.ssm.controller.UserController方法名findAll');
INSERT INTO `syslog` VALUES (111, '2020-04-24 10:16:11', 'dsx', '0:0:0:0:0:0:0:1', '/user/findUserByIdAndAllRole.do', 53, '[类名]com.ssm.controller.UserController方法名findUserByIdAndAllRole');
INSERT INTO `syslog` VALUES (112, '2020-04-24 10:16:13', 'dsx', '0:0:0:0:0:0:0:1', '/user/findAll.do', 8, '[类名]com.ssm.controller.UserController方法名findAll');
INSERT INTO `syslog` VALUES (113, '2020-04-24 10:16:15', 'dsx', '0:0:0:0:0:0:0:1', '/user/findById.do', 9, '[类名]com.ssm.controller.UserController方法名findById');
INSERT INTO `syslog` VALUES (114, '2020-04-24 10:16:27', 'dsx', '0:0:0:0:0:0:0:1', '/user/findAll.do', 6, '[类名]com.ssm.controller.UserController方法名findAll');
INSERT INTO `syslog` VALUES (115, '2020-04-24 10:16:28', 'dsx', '0:0:0:0:0:0:0:1', '/user/findAll.do', 7, '[类名]com.ssm.controller.UserController方法名findAll');
INSERT INTO `syslog` VALUES (116, '2020-04-24 10:16:34', 'dsx', '0:0:0:0:0:0:0:1', '/user/findById.do', 9, '[类名]com.ssm.controller.UserController方法名findById');
INSERT INTO `syslog` VALUES (117, '2020-04-24 10:17:30', 'dsx', '0:0:0:0:0:0:0:1', '/user/findAll.do', 7, '[类名]com.ssm.controller.UserController方法名findAll');
INSERT INTO `syslog` VALUES (118, '2020-04-24 10:17:37', 'dsx', '0:0:0:0:0:0:0:1', '/user/findAll.do', 6, '[类名]com.ssm.controller.UserController方法名findAll');
INSERT INTO `syslog` VALUES (119, '2020-04-24 10:31:07', 'dsx', '0:0:0:0:0:0:0:1', '/user/findAll.do', 66, '[类名]com.ssm.controller.UserController方法名findAll');
INSERT INTO `syslog` VALUES (120, '2020-04-24 10:31:32', 'dsx', '0:0:0:0:0:0:0:1', '/user/findAll.do', 6, '[类名]com.ssm.controller.UserController方法名findAll');
INSERT INTO `syslog` VALUES (121, '2020-04-24 10:31:51', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 8, '[类名]com.ssm.controller.UserController方法名findAll');
INSERT INTO `syslog` VALUES (122, '2020-04-24 10:32:15', 'admin', '0:0:0:0:0:0:0:1', '/user/save.do', 143, '[类名]com.ssm.controller.UserController方法名save');
INSERT INTO `syslog` VALUES (123, '2020-04-24 10:32:16', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 17, '[类名]com.ssm.controller.UserController方法名findAll');
INSERT INTO `syslog` VALUES (124, '2020-04-24 10:32:18', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 5, '[类名]com.ssm.controller.UserController方法名findAll');
INSERT INTO `syslog` VALUES (125, '2020-04-24 10:34:12', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 71, '[类名]com.ssm.controller.UserController方法名findAll');
INSERT INTO `syslog` VALUES (126, '2020-04-24 10:36:13', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 67, '[类名]com.ssm.controller.UserController方法名findAll');
INSERT INTO `syslog` VALUES (127, '2020-04-24 10:36:16', 'admin', '0:0:0:0:0:0:0:1', '/user/delUser.do', 74, '[类名]com.ssm.controller.UserController方法名delUser');
INSERT INTO `syslog` VALUES (128, '2020-04-24 10:38:57', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 71, '[类名]com.ssm.controller.UserController方法名findAll');
INSERT INTO `syslog` VALUES (129, '2020-04-24 10:39:22', 'admin', '0:0:0:0:0:0:0:1', '/user/save.do', 215, '[类名]com.ssm.controller.UserController方法名save');
INSERT INTO `syslog` VALUES (130, '2020-04-24 10:39:23', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 8, '[类名]com.ssm.controller.UserController方法名findAll');
INSERT INTO `syslog` VALUES (131, '2020-04-24 10:39:57', 'admin', '0:0:0:0:0:0:0:1', '/user/save.do', 414, '[类名]com.ssm.controller.UserController方法名save');
INSERT INTO `syslog` VALUES (132, '2020-04-24 10:39:57', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 9, '[类名]com.ssm.controller.UserController方法名findAll');
INSERT INTO `syslog` VALUES (133, '2020-04-24 10:39:59', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 13, '[类名]com.ssm.controller.UserController方法名findAll');
INSERT INTO `syslog` VALUES (134, '2020-04-24 10:40:05', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 8, '[类名]com.ssm.controller.UserController方法名findAll');
INSERT INTO `syslog` VALUES (135, '2020-04-24 10:40:06', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 8, '[类名]com.ssm.controller.UserController方法名findAll');
INSERT INTO `syslog` VALUES (136, '2020-04-24 10:40:08', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 7, '[类名]com.ssm.controller.UserController方法名findAll');
INSERT INTO `syslog` VALUES (137, '2020-04-24 10:40:09', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 8, '[类名]com.ssm.controller.UserController方法名findAll');
INSERT INTO `syslog` VALUES (138, '2020-04-24 10:40:13', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 6, '[类名]com.ssm.controller.UserController方法名findAll');
INSERT INTO `syslog` VALUES (139, '2020-04-24 10:40:19', 'admin', '0:0:0:0:0:0:0:1', '/user/delUser.do', 60, '[类名]com.ssm.controller.UserController方法名delUser');
INSERT INTO `syslog` VALUES (140, '2020-04-24 10:40:19', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 6, '[类名]com.ssm.controller.UserController方法名findAll');
INSERT INTO `syslog` VALUES (141, '2020-04-24 10:40:21', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 7, '[类名]com.ssm.controller.UserController方法名findAll');
INSERT INTO `syslog` VALUES (142, '2020-04-24 10:40:22', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 6, '[类名]com.ssm.controller.UserController方法名findAll');
INSERT INTO `syslog` VALUES (143, '2020-04-24 10:40:33', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 16, '[类名]com.ssm.controller.RoleController方法名findAll');
INSERT INTO `syslog` VALUES (144, '2020-04-24 10:40:40', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 13, '[类名]com.ssm.controller.PermissionController方法名findAll');
INSERT INTO `syslog` VALUES (145, '2020-04-24 10:40:43', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 5, '[类名]com.ssm.controller.PermissionController方法名findAll');
INSERT INTO `syslog` VALUES (146, '2020-04-24 10:40:45', 'admin', '0:0:0:0:0:0:0:1', '/user/findUserByIdAndAllRole.do', 10, '[类名]com.ssm.controller.UserController方法名findUserByIdAndAllRole');
INSERT INTO `syslog` VALUES (147, '2020-04-24 10:40:47', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 6, '[类名]com.ssm.controller.PermissionController方法名findAll');
INSERT INTO `syslog` VALUES (148, '2020-04-24 10:40:50', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 6, '[类名]com.ssm.controller.UserController方法名findAll');
INSERT INTO `syslog` VALUES (149, '2020-04-24 10:40:56', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 7, '[类名]com.ssm.controller.PermissionController方法名findAll');
INSERT INTO `syslog` VALUES (150, '2020-04-24 10:40:58', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 232, '[类名]com.ssm.controller.RoleController方法名findAll');
INSERT INTO `syslog` VALUES (151, '2020-04-24 10:41:02', 'admin', '0:0:0:0:0:0:0:1', '/role/findRoleByIdAndAllPermission.do', 13, '[类名]com.ssm.controller.RoleController方法名findRoleByIdAndAllPermission');
INSERT INTO `syslog` VALUES (152, '2020-04-24 10:41:07', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 3, '[类名]com.ssm.controller.RoleController方法名findAll');
INSERT INTO `syslog` VALUES (153, '2020-04-24 10:41:09', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 7, '[类名]com.ssm.controller.RoleController方法名findAll');
INSERT INTO `syslog` VALUES (154, '2020-04-24 10:41:12', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 4, '[类名]com.ssm.controller.PermissionController方法名findAll');
INSERT INTO `syslog` VALUES (155, '2020-04-24 10:41:13', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 4, '[类名]com.ssm.controller.UserController方法名findAll');
INSERT INTO `syslog` VALUES (156, '2020-04-24 10:41:17', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 5, '[类名]com.ssm.controller.RoleController方法名findAll');
INSERT INTO `syslog` VALUES (157, '2020-04-24 10:41:26', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 5, '[类名]com.ssm.controller.RoleController方法名findAll');
INSERT INTO `syslog` VALUES (158, '2020-04-24 10:41:28', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 5, '[类名]com.ssm.controller.PermissionController方法名findAll');
INSERT INTO `syslog` VALUES (159, '2020-04-24 10:41:36', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 5, '[类名]com.ssm.controller.UserController方法名findAll');
INSERT INTO `syslog` VALUES (160, '2020-04-24 10:41:40', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 6, '[类名]com.ssm.controller.RoleController方法名findAll');
INSERT INTO `syslog` VALUES (161, '2020-04-24 10:41:43', 'admin', '0:0:0:0:0:0:0:1', '/role/findRoleByIdAndAllPermission.do', 10, '[类名]com.ssm.controller.RoleController方法名findRoleByIdAndAllPermission');
INSERT INTO `syslog` VALUES (162, '2020-04-24 10:41:51', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 3, '[类名]com.ssm.controller.RoleController方法名findAll');
INSERT INTO `syslog` VALUES (163, '2020-04-24 10:41:57', 'admin', '0:0:0:0:0:0:0:1', '/role/findRoleByIdAndAllPermission.do', 9, '[类名]com.ssm.controller.RoleController方法名findRoleByIdAndAllPermission');
INSERT INTO `syslog` VALUES (164, '2020-04-24 10:42:06', 'admin', '0:0:0:0:0:0:0:1', '/role/addPermissionToRole.do', 68, '[类名]com.ssm.controller.RoleController方法名addPermissionToRole');
INSERT INTO `syslog` VALUES (165, '2020-04-24 10:42:06', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 4, '[类名]com.ssm.controller.RoleController方法名findAll');
INSERT INTO `syslog` VALUES (166, '2020-04-24 10:42:09', 'admin', '0:0:0:0:0:0:0:1', '/role/findById.do', 6, '[类名]com.ssm.controller.RoleController方法名findById');
INSERT INTO `syslog` VALUES (167, '2020-04-24 10:42:14', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 5, '[类名]com.ssm.controller.UserController方法名findAll');
INSERT INTO `syslog` VALUES (168, '2020-04-24 10:42:32', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 6, '[类名]com.ssm.controller.RoleController方法名findAll');
INSERT INTO `syslog` VALUES (169, '2020-04-24 10:42:36', 'admin', '0:0:0:0:0:0:0:1', '/role/findRoleByIdAndAllPermission.do', 8, '[类名]com.ssm.controller.RoleController方法名findRoleByIdAndAllPermission');
INSERT INTO `syslog` VALUES (170, '2020-04-24 10:42:39', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 7, '[类名]com.ssm.controller.RoleController方法名findAll');
INSERT INTO `syslog` VALUES (171, '2020-04-24 10:42:40', 'admin', '0:0:0:0:0:0:0:1', '/role/findRoleByIdAndAllPermission.do', 8, '[类名]com.ssm.controller.RoleController方法名findRoleByIdAndAllPermission');
INSERT INTO `syslog` VALUES (172, '2020-04-24 10:42:45', 'admin', '0:0:0:0:0:0:0:1', '/role/addPermissionToRole.do', 62, '[类名]com.ssm.controller.RoleController方法名addPermissionToRole');
INSERT INTO `syslog` VALUES (173, '2020-04-24 10:42:45', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 4, '[类名]com.ssm.controller.RoleController方法名findAll');
INSERT INTO `syslog` VALUES (174, '2020-04-24 10:42:46', 'admin', '0:0:0:0:0:0:0:1', '/role/findById.do', 4, '[类名]com.ssm.controller.RoleController方法名findById');
INSERT INTO `syslog` VALUES (175, '2020-04-24 10:42:55', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 7, '[类名]com.ssm.controller.UserController方法名findAll');
INSERT INTO `syslog` VALUES (176, '2020-04-24 10:43:04', 'admin', '0:0:0:0:0:0:0:1', '/user/findById.do', 11, '[类名]com.ssm.controller.UserController方法名findById');
INSERT INTO `syslog` VALUES (177, '2020-04-24 10:43:12', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 4, '[类名]com.ssm.controller.UserController方法名findAll');
INSERT INTO `syslog` VALUES (178, '2020-04-24 10:43:19', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 5, '[类名]com.ssm.controller.UserController方法名findAll');
INSERT INTO `syslog` VALUES (179, '2020-04-24 10:43:21', 'admin', '0:0:0:0:0:0:0:1', '/user/findUserByIdAndAllRole.do', 8, '[类名]com.ssm.controller.UserController方法名findUserByIdAndAllRole');
INSERT INTO `syslog` VALUES (180, '2020-04-24 10:43:25', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 6, '[类名]com.ssm.controller.UserController方法名findAll');
INSERT INTO `syslog` VALUES (181, '2020-04-24 10:43:27', 'admin', '0:0:0:0:0:0:0:1', '/user/findUserByIdAndAllRole.do', 7, '[类名]com.ssm.controller.UserController方法名findUserByIdAndAllRole');
INSERT INTO `syslog` VALUES (182, '2020-04-24 10:43:29', 'admin', '0:0:0:0:0:0:0:1', '/user/addRoleToUser.do', 72, '[类名]com.ssm.controller.UserController方法名addRoleToUser');
INSERT INTO `syslog` VALUES (183, '2020-04-24 10:43:29', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 5, '[类名]com.ssm.controller.UserController方法名findAll');
INSERT INTO `syslog` VALUES (184, '2020-04-24 10:43:31', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 7, '[类名]com.ssm.controller.RoleController方法名findAll');
INSERT INTO `syslog` VALUES (185, '2020-04-24 10:44:38', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 4, '[类名]com.ssm.controller.RoleController方法名findAll');
INSERT INTO `syslog` VALUES (186, '2020-04-24 10:44:44', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 4, '[类名]com.ssm.controller.UserController方法名findAll');
INSERT INTO `syslog` VALUES (187, '2020-04-24 10:45:11', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 4, '[类名]com.ssm.controller.UserController方法名findAll');
INSERT INTO `syslog` VALUES (188, '2020-04-24 10:45:13', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 6, '[类名]com.ssm.controller.UserController方法名findAll');
INSERT INTO `syslog` VALUES (189, '2020-04-24 10:45:20', 'admin', '0:0:0:0:0:0:0:1', '/user/findById.do', 7, '[类名]com.ssm.controller.UserController方法名findById');
INSERT INTO `syslog` VALUES (190, '2020-04-24 10:45:29', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 4, '[类名]com.ssm.controller.RoleController方法名findAll');
INSERT INTO `syslog` VALUES (191, '2020-04-24 10:45:32', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 4, '[类名]com.ssm.controller.PermissionController方法名findAll');
INSERT INTO `syslog` VALUES (192, '2020-04-24 10:46:06', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 5, '[类名]com.ssm.controller.PermissionController方法名findAll');
INSERT INTO `syslog` VALUES (193, '2020-04-24 10:46:08', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 4, '[类名]com.ssm.controller.PermissionController方法名findAll');
INSERT INTO `syslog` VALUES (194, '2020-04-24 10:46:15', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 5, '[类名]com.ssm.controller.RoleController方法名findAll');
INSERT INTO `syslog` VALUES (195, '2020-04-24 10:46:22', 'admin', '0:0:0:0:0:0:0:1', '/role/findRoleByIdAndAllPermission.do', 9, '[类名]com.ssm.controller.RoleController方法名findRoleByIdAndAllPermission');
INSERT INTO `syslog` VALUES (196, '2020-04-24 10:46:24', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 6, '[类名]com.ssm.controller.RoleController方法名findAll');
INSERT INTO `syslog` VALUES (197, '2020-04-24 10:46:27', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 4, '[类名]com.ssm.controller.PermissionController方法名findAll');
INSERT INTO `syslog` VALUES (198, '2020-04-24 10:46:30', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 4, '[类名]com.ssm.controller.UserController方法名findAll');
INSERT INTO `syslog` VALUES (199, '2020-04-24 10:46:32', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 5, '[类名]com.ssm.controller.RoleController方法名findAll');
INSERT INTO `syslog` VALUES (200, '2020-04-24 10:46:35', 'admin', '0:0:0:0:0:0:0:1', '/role/findRoleByIdAndAllPermission.do', 8, '[类名]com.ssm.controller.RoleController方法名findRoleByIdAndAllPermission');
INSERT INTO `syslog` VALUES (201, '2020-04-24 10:46:36', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 4, '[类名]com.ssm.controller.RoleController方法名findAll');
INSERT INTO `syslog` VALUES (202, '2020-04-24 10:46:38', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 14, '[类名]com.ssm.controller.SysLogController方法名findAll');
INSERT INTO `syslog` VALUES (203, '2020-04-24 10:47:56', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 7, '[类名]com.ssm.controller.SysLogController方法名findAll');
INSERT INTO `syslog` VALUES (204, '2020-04-24 10:48:07', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 5, '[类名]com.ssm.controller.UserController方法名findAll');
INSERT INTO `syslog` VALUES (205, '2020-04-24 10:48:14', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 7, '[类名]com.ssm.controller.UserController方法名findAll');
INSERT INTO `syslog` VALUES (206, '2020-04-24 10:48:19', 'admin', '0:0:0:0:0:0:0:1', '/user/findUserByIdAndAllRole.do', 10, '[类名]com.ssm.controller.UserController方法名findUserByIdAndAllRole');
INSERT INTO `syslog` VALUES (207, '2020-04-24 10:48:24', 'admin', '0:0:0:0:0:0:0:1', '/user/addRoleToUser.do', 89, '[类名]com.ssm.controller.UserController方法名addRoleToUser');
INSERT INTO `syslog` VALUES (208, '2020-04-24 10:48:25', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 6, '[类名]com.ssm.controller.UserController方法名findAll');
INSERT INTO `syslog` VALUES (209, '2020-04-24 10:48:29', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 7, '[类名]com.ssm.controller.UserController方法名findAll');
INSERT INTO `syslog` VALUES (210, '2020-04-24 10:48:33', 'admin', '0:0:0:0:0:0:0:1', '/user/findById.do', 6, '[类名]com.ssm.controller.UserController方法名findById');
INSERT INTO `syslog` VALUES (211, '2020-04-24 10:48:44', 'testDelUserHasRoleAndPermission', '0:0:0:0:0:0:0:1', '/product/findAll.do', 12, '[类名]com.ssm.controller.ProductController方法名findAll');
INSERT INTO `syslog` VALUES (212, '2020-04-24 10:48:50', 'testDelUserHasRoleAndPermission', '0:0:0:0:0:0:0:1', '/product/findAll.do', 7, '[类名]com.ssm.controller.ProductController方法名findAll');
INSERT INTO `syslog` VALUES (213, '2020-04-24 10:48:52', 'testDelUserHasRoleAndPermission', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 0, '[类名]com.ssm.controller.OrdersController方法名findAll');
INSERT INTO `syslog` VALUES (214, '2020-04-24 10:48:58', 'testDelUserHasRoleAndPermission', '0:0:0:0:0:0:0:1', '/product/findAll.do', 4, '[类名]com.ssm.controller.ProductController方法名findAll');
INSERT INTO `syslog` VALUES (215, '2020-04-24 10:48:59', 'testDelUserHasRoleAndPermission', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 0, '[类名]com.ssm.controller.OrdersController方法名findAll');
INSERT INTO `syslog` VALUES (216, '2020-04-24 10:52:03', 'testDelUserHasRoleAndPermission', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 74, '[类名]com.ssm.controller.OrdersController方法名findAll');
INSERT INTO `syslog` VALUES (217, '2020-04-24 10:52:06', 'testDelUserHasRoleAndPermission', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 14, '[类名]com.ssm.controller.OrdersController方法名findAll');
INSERT INTO `syslog` VALUES (218, '2020-04-24 10:52:08', 'testDelUserHasRoleAndPermission', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 10, '[类名]com.ssm.controller.OrdersController方法名findAll');
INSERT INTO `syslog` VALUES (219, '2020-04-24 10:52:09', 'testDelUserHasRoleAndPermission', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 15, '[类名]com.ssm.controller.OrdersController方法名findAll');
INSERT INTO `syslog` VALUES (220, '2020-04-24 10:52:11', 'testDelUserHasRoleAndPermission', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 12, '[类名]com.ssm.controller.OrdersController方法名findAll');
INSERT INTO `syslog` VALUES (221, '2020-04-24 10:52:11', 'testDelUserHasRoleAndPermission', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 8, '[类名]com.ssm.controller.OrdersController方法名findAll');
INSERT INTO `syslog` VALUES (222, '2020-04-24 10:53:02', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 14, '[类名]com.ssm.controller.UserController方法名findAll');
INSERT INTO `syslog` VALUES (223, '2020-04-24 10:53:05', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 6, '[类名]com.ssm.controller.UserController方法名findAll');
INSERT INTO `syslog` VALUES (224, '2020-04-24 10:53:07', 'admin', '0:0:0:0:0:0:0:1', '/user/delUser.do', 399, '[类名]com.ssm.controller.UserController方法名delUser');
INSERT INTO `syslog` VALUES (225, '2020-04-24 11:09:42', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 68, '[类名]com.ssm.controller.UserController方法名findAll');
INSERT INTO `syslog` VALUES (226, '2020-04-24 11:09:45', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 7, '[类名]com.ssm.controller.UserController方法名findAll');
INSERT INTO `syslog` VALUES (227, '2020-04-24 11:20:54', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 79, '[类名]com.ssm.controller.UserController方法名findAll');
INSERT INTO `syslog` VALUES (228, '2020-04-24 11:20:56', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 6, '[类名]com.ssm.controller.UserController方法名findAll');
INSERT INTO `syslog` VALUES (229, '2020-04-24 11:20:57', 'admin', '0:0:0:0:0:0:0:1', '/user/delUser.do', 107, '[类名]com.ssm.controller.UserController方法名delUser');
INSERT INTO `syslog` VALUES (230, '2020-04-24 11:22:55', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 78, '[类名]com.ssm.controller.UserController方法名findAll');
INSERT INTO `syslog` VALUES (231, '2020-04-24 11:22:57', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 8, '[类名]com.ssm.controller.UserController方法名findAll');
INSERT INTO `syslog` VALUES (232, '2020-04-24 11:22:58', 'admin', '0:0:0:0:0:0:0:1', '/user/delUser.do', 124, '[类名]com.ssm.controller.UserController方法名delUser');
INSERT INTO `syslog` VALUES (233, '2020-04-24 16:36:53', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 78, '[类名]com.ssm.controller.UserController方法名findAll');
INSERT INTO `syslog` VALUES (234, '2020-04-24 16:37:05', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 17, '[类名]com.ssm.controller.RoleController方法名findAll');
INSERT INTO `syslog` VALUES (235, '2020-04-24 16:37:09', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 6, '[类名]com.ssm.controller.UserController方法名findAll');
INSERT INTO `syslog` VALUES (236, '2020-04-24 16:37:10', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 6, '[类名]com.ssm.controller.RoleController方法名findAll');
INSERT INTO `syslog` VALUES (237, '2020-04-24 16:41:50', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 7, '[类名]com.ssm.controller.RoleController方法名findAll');
INSERT INTO `syslog` VALUES (238, '2020-04-24 16:41:52', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 7, '[类名]com.ssm.controller.RoleController方法名findAll');
INSERT INTO `syslog` VALUES (239, '2020-04-24 16:41:53', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 5, '[类名]com.ssm.controller.RoleController方法名findAll');
INSERT INTO `syslog` VALUES (240, '2020-04-24 16:41:57', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 15, '[类名]com.ssm.controller.PermissionController方法名findAll');
INSERT INTO `syslog` VALUES (241, '2020-04-24 16:42:00', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 9, '[类名]com.ssm.controller.PermissionController方法名findAll');
INSERT INTO `syslog` VALUES (242, '2020-04-24 16:42:02', 'admin', '0:0:0:0:0:0:0:1', '/role/findById.do', 3, '[类名]com.ssm.controller.RoleController方法名findById');
INSERT INTO `syslog` VALUES (243, '2020-04-24 16:42:14', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 8, '[类名]com.ssm.controller.UserController方法名findAll');
INSERT INTO `syslog` VALUES (244, '2020-04-24 16:42:17', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 7, '[类名]com.ssm.controller.PermissionController方法名findAll');
INSERT INTO `syslog` VALUES (245, '2020-04-24 16:42:19', 'admin', '0:0:0:0:0:0:0:1', '/role/findById.do', 4, '[类名]com.ssm.controller.RoleController方法名findById');
INSERT INTO `syslog` VALUES (246, '2020-04-24 16:42:35', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 5, '[类名]com.ssm.controller.PermissionController方法名findAll');
INSERT INTO `syslog` VALUES (247, '2020-04-24 16:42:38', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 5, '[类名]com.ssm.controller.RoleController方法名findAll');
INSERT INTO `syslog` VALUES (248, '2020-04-24 16:42:40', 'admin', '0:0:0:0:0:0:0:1', '/role/findById.do', 7, '[类名]com.ssm.controller.RoleController方法名findById');
INSERT INTO `syslog` VALUES (249, '2020-04-24 16:42:48', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 7, '[类名]com.ssm.controller.RoleController方法名findAll');
INSERT INTO `syslog` VALUES (250, '2020-04-24 16:42:51', 'admin', '0:0:0:0:0:0:0:1', '/role/findById.do', 8, '[类名]com.ssm.controller.RoleController方法名findById');
INSERT INTO `syslog` VALUES (251, '2020-04-24 16:49:59', 'admin', '0:0:0:0:0:0:0:1', '/role/findById.do', 7, '[类名]com.ssm.controller.RoleController方法名findById');
INSERT INTO `syslog` VALUES (252, '2020-04-24 16:50:03', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 5, '[类名]com.ssm.controller.RoleController方法名findAll');
INSERT INTO `syslog` VALUES (253, '2020-04-24 16:50:05', 'admin', '0:0:0:0:0:0:0:1', '/role/findById.do', 6, '[类名]com.ssm.controller.RoleController方法名findById');
INSERT INTO `syslog` VALUES (254, '2020-04-24 16:50:18', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 7, '[类名]com.ssm.controller.RoleController方法名findAll');
INSERT INTO `syslog` VALUES (255, '2020-04-24 16:50:20', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 4, '[类名]com.ssm.controller.RoleController方法名findAll');
INSERT INTO `syslog` VALUES (256, '2020-04-24 16:50:23', 'admin', '0:0:0:0:0:0:0:1', '/role/findById.do', 4, '[类名]com.ssm.controller.RoleController方法名findById');
INSERT INTO `syslog` VALUES (257, '2020-04-24 16:51:11', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 5, '[类名]com.ssm.controller.RoleController方法名findAll');
INSERT INTO `syslog` VALUES (258, '2020-04-24 16:51:16', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 4, '[类名]com.ssm.controller.RoleController方法名findAll');
INSERT INTO `syslog` VALUES (259, '2020-04-24 16:51:57', 'admin', '0:0:0:0:0:0:0:1', '/role/save.do', 68, '[类名]com.ssm.controller.RoleController方法名save');
INSERT INTO `syslog` VALUES (260, '2020-04-24 16:51:57', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 4, '[类名]com.ssm.controller.RoleController方法名findAll');
INSERT INTO `syslog` VALUES (261, '2020-04-24 16:51:59', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 5, '[类名]com.ssm.controller.RoleController方法名findAll');
INSERT INTO `syslog` VALUES (262, '2020-04-24 16:52:01', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 6, '[类名]com.ssm.controller.RoleController方法名findAll');
INSERT INTO `syslog` VALUES (263, '2020-04-24 16:52:02', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 5, '[类名]com.ssm.controller.RoleController方法名findAll');
INSERT INTO `syslog` VALUES (264, '2020-04-24 16:52:40', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 6, '[类名]com.ssm.controller.RoleController方法名findAll');
INSERT INTO `syslog` VALUES (265, '2020-04-24 16:53:36', 'admin', '0:0:0:0:0:0:0:1', '/role/findById.do', 6, '[类名]com.ssm.controller.RoleController方法名findById');
INSERT INTO `syslog` VALUES (266, '2020-04-24 16:53:38', 'admin', '0:0:0:0:0:0:0:1', '/role/findById.do', 6, '[类名]com.ssm.controller.RoleController方法名findById');
INSERT INTO `syslog` VALUES (267, '2020-04-24 16:54:11', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 6, '[类名]com.ssm.controller.RoleController方法名findAll');
INSERT INTO `syslog` VALUES (268, '2020-04-24 16:54:14', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 18, '[类名]com.ssm.controller.OrdersController方法名findAll');
INSERT INTO `syslog` VALUES (269, '2020-04-24 16:54:17', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 7, '[类名]com.ssm.controller.OrdersController方法名findAll');
INSERT INTO `syslog` VALUES (270, '2020-04-24 16:54:18', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 10, '[类名]com.ssm.controller.OrdersController方法名findAll');
INSERT INTO `syslog` VALUES (271, '2020-04-24 16:54:20', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 5, '[类名]com.ssm.controller.OrdersController方法名findAll');
INSERT INTO `syslog` VALUES (272, '2020-04-24 16:54:25', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 4, '[类名]com.ssm.controller.UserController方法名findAll');
INSERT INTO `syslog` VALUES (273, '2020-04-24 16:54:27', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 5, '[类名]com.ssm.controller.RoleController方法名findAll');
INSERT INTO `syslog` VALUES (274, '2020-04-24 16:54:29', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 7, '[类名]com.ssm.controller.OrdersController方法名findAll');
INSERT INTO `syslog` VALUES (275, '2020-04-24 16:54:33', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 5, '[类名]com.ssm.controller.RoleController方法名findAll');
INSERT INTO `syslog` VALUES (276, '2020-04-24 16:54:35', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 6, '[类名]com.ssm.controller.OrdersController方法名findAll');
INSERT INTO `syslog` VALUES (277, '2020-04-24 16:54:44', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 5, '[类名]com.ssm.controller.RoleController方法名findAll');
INSERT INTO `syslog` VALUES (278, '2020-04-24 16:55:15', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 4, '[类名]com.ssm.controller.RoleController方法名findAll');
INSERT INTO `syslog` VALUES (279, '2020-04-24 16:55:17', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 5, '[类名]com.ssm.controller.RoleController方法名findAll');
INSERT INTO `syslog` VALUES (280, '2020-04-24 16:55:18', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 4, '[类名]com.ssm.controller.RoleController方法名findAll');
INSERT INTO `syslog` VALUES (281, '2020-04-24 16:55:20', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 4, '[类名]com.ssm.controller.RoleController方法名findAll');
INSERT INTO `syslog` VALUES (282, '2020-04-24 16:55:27', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 6, '[类名]com.ssm.controller.RoleController方法名findAll');
INSERT INTO `syslog` VALUES (283, '2020-04-24 16:55:31', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 6, '[类名]com.ssm.controller.PermissionController方法名findAll');
INSERT INTO `syslog` VALUES (284, '2020-04-24 16:55:34', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 5, '[类名]com.ssm.controller.PermissionController方法名findAll');
INSERT INTO `syslog` VALUES (285, '2020-04-24 16:55:37', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 9, '[类名]com.ssm.controller.SysLogController方法名findAll');
INSERT INTO `syslog` VALUES (286, '2020-04-24 16:55:48', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 11, '[类名]com.ssm.controller.SysLogController方法名findAll');
INSERT INTO `syslog` VALUES (287, '2020-04-24 16:56:52', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 8, '[类名]com.ssm.controller.SysLogController方法名findAll');
INSERT INTO `syslog` VALUES (288, '2020-04-24 16:56:53', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 5, '[类名]com.ssm.controller.SysLogController方法名findAll');
INSERT INTO `syslog` VALUES (289, '2020-04-24 16:56:55', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 10, '[类名]com.ssm.controller.ProductController方法名findAll');
INSERT INTO `syslog` VALUES (290, '2020-04-24 16:56:57', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 11, '[类名]com.ssm.controller.ProductController方法名findAll');
INSERT INTO `syslog` VALUES (291, '2020-04-24 16:56:59', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 7, '[类名]com.ssm.controller.OrdersController方法名findAll');
INSERT INTO `syslog` VALUES (292, '2020-04-24 16:57:34', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 8, '[类名]com.ssm.controller.OrdersController方法名findAll');
INSERT INTO `syslog` VALUES (293, '2020-04-24 16:57:39', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 6, '[类名]com.ssm.controller.OrdersController方法名findAll');
INSERT INTO `syslog` VALUES (294, '2020-04-24 16:57:48', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 4, '[类名]com.ssm.controller.ProductController方法名findAll');
INSERT INTO `syslog` VALUES (295, '2020-04-24 16:57:52', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 6, '[类名]com.ssm.controller.OrdersController方法名findAll');
INSERT INTO `syslog` VALUES (296, '2020-04-24 17:02:54', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 76, '[类名]com.ssm.controller.OrdersController方法名findAll');
INSERT INTO `syslog` VALUES (297, '2020-04-24 17:02:56', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 8, '[类名]com.ssm.controller.OrdersController方法名findAll');
INSERT INTO `syslog` VALUES (298, '2020-04-24 17:05:34', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 12, '[类名]com.ssm.controller.OrdersController方法名findAll');
INSERT INTO `syslog` VALUES (299, '2020-04-24 17:05:38', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 11, '[类名]com.ssm.controller.OrdersController方法名findAll');
INSERT INTO `syslog` VALUES (300, '2020-04-24 17:05:40', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 18, '[类名]com.ssm.controller.OrdersController方法名findAll');
INSERT INTO `syslog` VALUES (301, '2020-04-24 17:07:11', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 9, '[类名]com.ssm.controller.OrdersController方法名findAll');
INSERT INTO `syslog` VALUES (302, '2020-04-24 17:07:12', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 10, '[类名]com.ssm.controller.OrdersController方法名findAll');
INSERT INTO `syslog` VALUES (303, '2020-04-24 17:07:13', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 10, '[类名]com.ssm.controller.OrdersController方法名findAll');
INSERT INTO `syslog` VALUES (304, '2020-04-24 17:07:15', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 10, '[类名]com.ssm.controller.OrdersController方法名findAll');
INSERT INTO `syslog` VALUES (305, '2020-04-24 17:07:16', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 9, '[类名]com.ssm.controller.OrdersController方法名findAll');
INSERT INTO `syslog` VALUES (306, '2020-04-24 17:07:17', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 8, '[类名]com.ssm.controller.OrdersController方法名findAll');
INSERT INTO `syslog` VALUES (307, '2020-04-24 17:07:18', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 7, '[类名]com.ssm.controller.OrdersController方法名findAll');
INSERT INTO `syslog` VALUES (308, '2020-04-24 17:07:38', 'admin', '0:0:0:0:0:0:0:1', '/orders/findById.do', 11, '[类名]com.ssm.controller.OrdersController方法名findById');
INSERT INTO `syslog` VALUES (309, '2020-04-24 17:08:19', 'admin', '0:0:0:0:0:0:0:1', '/orders/findById.do', 8, '[类名]com.ssm.controller.OrdersController方法名findById');
INSERT INTO `syslog` VALUES (310, '2020-04-24 17:10:04', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 14, '[类名]com.ssm.controller.UserController方法名findAll');
INSERT INTO `syslog` VALUES (311, '2020-04-24 17:10:07', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 6, '[类名]com.ssm.controller.UserController方法名findAll');
INSERT INTO `syslog` VALUES (312, '2020-04-24 17:10:08', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 6, '[类名]com.ssm.controller.UserController方法名findAll');
INSERT INTO `syslog` VALUES (313, '2020-04-24 17:11:34', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 6, '[类名]com.ssm.controller.UserController方法名findAll');
INSERT INTO `syslog` VALUES (314, '2020-04-24 17:11:36', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 12, '[类名]com.ssm.controller.ProductController方法名findAll');
INSERT INTO `syslog` VALUES (315, '2020-04-24 17:11:41', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 5, '[类名]com.ssm.controller.ProductController方法名findAll');
INSERT INTO `syslog` VALUES (316, '2020-04-24 17:11:42', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 8, '[类名]com.ssm.controller.OrdersController方法名findAll');
INSERT INTO `syslog` VALUES (317, '2020-04-24 17:11:46', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 4, '[类名]com.ssm.controller.ProductController方法名findAll');
INSERT INTO `syslog` VALUES (318, '2020-04-24 17:11:54', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 8, '[类名]com.ssm.controller.OrdersController方法名findAll');
INSERT INTO `syslog` VALUES (319, '2020-04-24 17:12:02', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 7, '[类名]com.ssm.controller.OrdersController方法名findAll');
INSERT INTO `syslog` VALUES (320, '2020-04-24 17:12:32', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 4, '[类名]com.ssm.controller.ProductController方法名findAll');
INSERT INTO `syslog` VALUES (321, '2020-04-24 17:12:36', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 6, '[类名]com.ssm.controller.OrdersController方法名findAll');
INSERT INTO `syslog` VALUES (322, '2020-04-24 17:13:23', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 4, '[类名]com.ssm.controller.ProductController方法名findAll');
INSERT INTO `syslog` VALUES (323, '2020-04-24 17:13:28', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 8, '[类名]com.ssm.controller.OrdersController方法名findAll');
INSERT INTO `syslog` VALUES (324, '2020-04-24 17:13:32', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 6, '[类名]com.ssm.controller.ProductController方法名findAll');
INSERT INTO `syslog` VALUES (325, '2020-04-24 17:13:33', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 7, '[类名]com.ssm.controller.OrdersController方法名findAll');
INSERT INTO `syslog` VALUES (326, '2020-04-24 17:14:00', 'admin', '0:0:0:0:0:0:0:1', '/orders/findById.do', 7, '[类名]com.ssm.controller.OrdersController方法名findById');
INSERT INTO `syslog` VALUES (327, '2020-04-24 17:14:03', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 6, '[类名]com.ssm.controller.OrdersController方法名findAll');
INSERT INTO `syslog` VALUES (328, '2020-04-24 17:16:18', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 8, '[类名]com.ssm.controller.OrdersController方法名findAll');
INSERT INTO `syslog` VALUES (329, '2020-04-24 17:16:21', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 6, '[类名]com.ssm.controller.OrdersController方法名findAll');
INSERT INTO `syslog` VALUES (330, '2020-04-24 17:16:44', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 5, '[类名]com.ssm.controller.ProductController方法名findAll');
INSERT INTO `syslog` VALUES (331, '2020-04-24 17:16:46', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 4, '[类名]com.ssm.controller.ProductController方法名findAll');
INSERT INTO `syslog` VALUES (332, '2020-04-26 14:43:30', 'dsx', '0:0:0:0:0:0:0:1', '/product/findAll.do', 88, '[类名] com.itheima.ssm.controller.ProductController[方法名] findAll');
INSERT INTO `syslog` VALUES (333, '2020-04-26 14:43:33', 'dsx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 86, '[类名] com.itheima.ssm.controller.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES (334, '2020-04-26 14:43:37', 'dsx', '0:0:0:0:0:0:0:1', '/orders/findById.do', 95, '[类名] com.itheima.ssm.controller.OrdersController[方法名] findById');
INSERT INTO `syslog` VALUES (335, '2020-04-26 14:43:40', 'dsx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 11, '[类名] com.itheima.ssm.controller.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES (336, '2020-04-26 14:43:46', 'dsx', '0:0:0:0:0:0:0:1', '/product/findAll.do', 15, '[类名] com.itheima.ssm.controller.ProductController[方法名] findAll');
INSERT INTO `syslog` VALUES (337, '2020-04-26 14:43:55', 'dsx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 9, '[类名] com.itheima.ssm.controller.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES (338, '2020-04-26 14:43:56', 'dsx', '0:0:0:0:0:0:0:1', '/orders/findById.do', 8, '[类名] com.itheima.ssm.controller.OrdersController[方法名] findById');
INSERT INTO `syslog` VALUES (339, '2020-04-26 14:44:19', 'dsx', '0:0:0:0:0:0:0:1', '/user/findAll.do', 16, '[类名] com.itheima.ssm.controller.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES (340, '2020-04-26 14:44:21', 'dsx', '0:0:0:0:0:0:0:1', '/user/findAll.do', 5, '[类名] com.itheima.ssm.controller.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES (341, '2020-04-26 14:44:22', 'dsx', '0:0:0:0:0:0:0:1', '/role/findAll.do', 15, '[类名] com.itheima.ssm.controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES (342, '2020-04-26 14:44:24', 'dsx', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 14, '[类名] com.itheima.ssm.controller.PermissionController[方法名] findAll');
INSERT INTO `syslog` VALUES (343, '2020-04-26 14:44:26', 'dsx', '0:0:0:0:0:0:0:1', '/role/findAll.do', 5, '[类名] com.itheima.ssm.controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES (344, '2020-04-26 23:04:33', 'dsx', '0:0:0:0:0:0:0:1', '/role/findAll.do', 68, '[类名]com.ssm.controller.RoleController方法名findAll');
INSERT INTO `syslog` VALUES (345, '2020-04-26 23:07:02', 'dsx', '0:0:0:0:0:0:0:1', '/role/findAll.do', 68, '[类名]com.ssm.controller.RoleController方法名findAll');
INSERT INTO `syslog` VALUES (346, '2020-04-26 23:07:08', 'dsx', '0:0:0:0:0:0:0:1', '/role/findRoleByIdAndAllPermission.do', 26, '[类名]com.ssm.controller.RoleController方法名findRoleByIdAndAllPermission');
INSERT INTO `syslog` VALUES (347, '2020-04-26 23:07:09', 'dsx', '0:0:0:0:0:0:0:1', '/role/findAll.do', 9, '[类名]com.ssm.controller.RoleController方法名findAll');
INSERT INTO `syslog` VALUES (348, '2020-04-26 23:07:17', 'dsx', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 22, '[类名]com.ssm.controller.PermissionController方法名findAll');
INSERT INTO `syslog` VALUES (349, '2020-04-26 23:07:20', 'dsx', '0:0:0:0:0:0:0:1', '/user/findUserByIdAndAllRole.do', 31, '[类名]com.ssm.controller.UserController方法名findUserByIdAndAllRole');
INSERT INTO `syslog` VALUES (350, '2020-04-26 23:07:21', 'dsx', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 8, '[类名]com.ssm.controller.PermissionController方法名findAll');
INSERT INTO `syslog` VALUES (351, '2020-04-26 23:07:23', 'dsx', '0:0:0:0:0:0:0:1', '/role/findAll.do', 9, '[类名]com.ssm.controller.RoleController方法名findAll');
INSERT INTO `syslog` VALUES (352, '2020-04-26 23:07:46', 'dsx', '0:0:0:0:0:0:0:1', '/role/save.do', 73, '[类名]com.ssm.controller.RoleController方法名save');
INSERT INTO `syslog` VALUES (353, '2020-04-26 23:07:46', 'dsx', '0:0:0:0:0:0:0:1', '/role/findAll.do', 20, '[类名]com.ssm.controller.RoleController方法名findAll');
INSERT INTO `syslog` VALUES (354, '2020-04-26 23:07:51', 'dsx', '0:0:0:0:0:0:0:1', '/role/findAll.do', 10, '[类名]com.ssm.controller.RoleController方法名findAll');
INSERT INTO `syslog` VALUES (355, '2020-04-26 23:07:54', 'dsx', '0:0:0:0:0:0:0:1', '/role/findAll.do', 3, '[类名]com.ssm.controller.RoleController方法名findAll');
INSERT INTO `syslog` VALUES (356, '2020-04-26 23:07:56', 'dsx', '0:0:0:0:0:0:0:1', '/role/deleteRole.do', 321, '[类名]com.ssm.controller.RoleController方法名deleteRole');
INSERT INTO `syslog` VALUES (357, '2020-04-26 23:15:48', 'dsx', '0:0:0:0:0:0:0:1', '/role/findAll.do', 68, '[类名]com.ssm.controller.RoleController方法名findAll');
INSERT INTO `syslog` VALUES (358, '2020-04-26 23:15:52', 'dsx', '0:0:0:0:0:0:0:1', '/role/deleteRole.do', 47, '[类名]com.ssm.controller.RoleController方法名deleteRole');
INSERT INTO `syslog` VALUES (359, '2020-04-26 23:15:52', 'dsx', '0:0:0:0:0:0:0:1', '/role/findAll.do', 7, '[类名]com.ssm.controller.RoleController方法名findAll');
INSERT INTO `syslog` VALUES (360, '2020-04-26 23:16:00', 'dsx', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 19, '[类名]com.ssm.controller.PermissionController方法名findAll');
INSERT INTO `syslog` VALUES (361, '2020-04-26 23:16:03', 'dsx', '0:0:0:0:0:0:0:1', '/user/findAll.do', 22, '[类名]com.ssm.controller.UserController方法名findAll');
INSERT INTO `syslog` VALUES (362, '2020-04-26 23:16:08', 'dsx', '0:0:0:0:0:0:0:1', '/user/findAll.do', 6, '[类名]com.ssm.controller.UserController方法名findAll');
INSERT INTO `syslog` VALUES (363, '2020-04-26 23:16:08', 'dsx', '0:0:0:0:0:0:0:1', '/user/findUserByIdAndAllRole.do', 20, '[类名]com.ssm.controller.UserController方法名findUserByIdAndAllRole');
INSERT INTO `syslog` VALUES (364, '2020-04-26 23:16:10', 'dsx', '0:0:0:0:0:0:0:1', '/user/findAll.do', 6, '[类名]com.ssm.controller.UserController方法名findAll');
INSERT INTO `syslog` VALUES (365, '2020-04-26 23:16:21', 'dsx', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 6, '[类名]com.ssm.controller.PermissionController方法名findAll');
INSERT INTO `syslog` VALUES (366, '2020-04-26 23:16:57', 'dsx', '0:0:0:0:0:0:0:1', '/role/findAll.do', 7, '[类名]com.ssm.controller.RoleController方法名findAll');
INSERT INTO `syslog` VALUES (367, '2020-04-28 13:37:21', 'dsx', '0:0:0:0:0:0:0:1', '/product/findAll.do', 74, '[类名]com.ssm.controller.ProductController方法名findAll');
INSERT INTO `syslog` VALUES (368, '2020-04-28 13:37:26', 'dsx', '0:0:0:0:0:0:0:1', '/product/findAll.do', 6, '[类名]com.ssm.controller.ProductController方法名findAll');
INSERT INTO `syslog` VALUES (369, '2020-04-28 13:37:36', 'dsx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 68, '[类名]com.ssm.controller.OrdersController方法名findAll');
INSERT INTO `syslog` VALUES (370, '2020-04-28 13:37:42', 'dsx', '0:0:0:0:0:0:0:1', '/product/findAll.do', 10, '[类名]com.ssm.controller.ProductController方法名findAll');
INSERT INTO `syslog` VALUES (371, '2020-04-28 14:05:47', 'dsx', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 115, '[类名]com.ssm.controller.SysLogController方法名findAll');
INSERT INTO `syslog` VALUES (372, '2020-04-28 14:05:52', 'dsx', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 14, '[类名]com.ssm.controller.SysLogController方法名findAll');
INSERT INTO `syslog` VALUES (373, '2020-04-28 14:05:56', 'dsx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 20, '[类名]com.ssm.controller.OrdersController方法名findAll');
INSERT INTO `syslog` VALUES (374, '2020-04-28 14:06:00', 'dsx', '0:0:0:0:0:0:0:1', '/product/findAll.do', 22, '[类名]com.ssm.controller.ProductController方法名findAll');
INSERT INTO `syslog` VALUES (375, '2020-04-28 14:06:08', 'dsx', '0:0:0:0:0:0:0:1', '/product/findAll.do', 8, '[类名]com.ssm.controller.ProductController方法名findAll');
INSERT INTO `syslog` VALUES (376, '2020-04-28 14:06:11', 'dsx', '0:0:0:0:0:0:0:1', '/product/findAll.do', 4, '[类名]com.ssm.controller.ProductController方法名findAll');
INSERT INTO `syslog` VALUES (377, '2020-04-28 14:06:13', 'dsx', '0:0:0:0:0:0:0:1', '/product/findAll.do', 9, '[类名]com.ssm.controller.ProductController方法名findAll');
INSERT INTO `syslog` VALUES (378, '2020-04-28 14:06:15', 'dsx', '0:0:0:0:0:0:0:1', '/product/delete.do', 113, '[类名]com.ssm.controller.ProductController方法名deleteProduct');
INSERT INTO `syslog` VALUES (379, '2020-04-28 14:06:15', 'dsx', '0:0:0:0:0:0:0:1', '/product/findAll.do', 5, '[类名]com.ssm.controller.ProductController方法名findAll');
INSERT INTO `syslog` VALUES (380, '2020-04-28 14:06:17', 'dsx', '0:0:0:0:0:0:0:1', '/product/findAll.do', 5, '[类名]com.ssm.controller.ProductController方法名findAll');
INSERT INTO `syslog` VALUES (381, '2020-04-28 14:06:19', 'dsx', '0:0:0:0:0:0:0:1', '/product/findAll.do', 6, '[类名]com.ssm.controller.ProductController方法名findAll');
INSERT INTO `syslog` VALUES (382, '2020-04-28 14:06:35', 'dsx', '0:0:0:0:0:0:0:1', '/product/findAll.do', 6, '[类名]com.ssm.controller.ProductController方法名findAll');
INSERT INTO `syslog` VALUES (383, '2020-04-28 14:06:49', 'dsx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 9, '[类名]com.ssm.controller.OrdersController方法名findAll');
INSERT INTO `syslog` VALUES (384, '2020-04-28 14:06:54', 'dsx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 7, '[类名]com.ssm.controller.OrdersController方法名findAll');
INSERT INTO `syslog` VALUES (385, '2020-04-28 14:07:00', 'dsx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 11, '[类名]com.ssm.controller.OrdersController方法名findAll');
INSERT INTO `syslog` VALUES (386, '2020-04-28 14:07:02', 'dsx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 8, '[类名]com.ssm.controller.OrdersController方法名findAll');
INSERT INTO `syslog` VALUES (387, '2020-04-28 14:07:04', 'dsx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 9, '[类名]com.ssm.controller.OrdersController方法名findAll');
INSERT INTO `syslog` VALUES (388, '2020-04-28 14:07:10', 'dsx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 7, '[类名]com.ssm.controller.OrdersController方法名findAll');
INSERT INTO `syslog` VALUES (389, '2020-04-28 14:07:16', 'dsx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 7, '[类名]com.ssm.controller.OrdersController方法名findAll');
INSERT INTO `syslog` VALUES (390, '2020-04-28 14:22:18', 'dsx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 96, '[类名]com.ssm.controller.OrdersController方法名findAll');
INSERT INTO `syslog` VALUES (391, '2020-04-28 14:25:26', 'dsx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 69, '[类名]com.ssm.controller.OrdersController方法名findAll');
INSERT INTO `syslog` VALUES (392, '2020-04-28 14:25:29', 'dsx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 13, '[类名]com.ssm.controller.OrdersController方法名findAll');
INSERT INTO `syslog` VALUES (393, '2020-04-28 14:25:30', 'dsx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 11, '[类名]com.ssm.controller.OrdersController方法名findAll');
INSERT INTO `syslog` VALUES (394, '2020-04-28 14:25:32', 'dsx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 11, '[类名]com.ssm.controller.OrdersController方法名findAll');
INSERT INTO `syslog` VALUES (395, '2020-04-28 14:25:37', 'dsx', '0:0:0:0:0:0:0:1', '/orders/findById.do', 90, '[类名]com.ssm.controller.OrdersController方法名findById');
INSERT INTO `syslog` VALUES (396, '2020-04-28 14:25:39', 'dsx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 10, '[类名]com.ssm.controller.OrdersController方法名findAll');
INSERT INTO `syslog` VALUES (397, '2020-04-28 14:25:52', 'dsx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 8, '[类名]com.ssm.controller.OrdersController方法名findAll');
INSERT INTO `syslog` VALUES (398, '2020-04-28 14:26:04', 'dsx', '0:0:0:0:0:0:0:1', '/orders/delete.do', 231, '[类名]com.ssm.controller.OrdersController方法名deleteOrder');
INSERT INTO `syslog` VALUES (399, '2020-04-28 15:05:22', 'dsx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 10, '[类名]com.ssm.controller.OrdersController方法名findAll');
INSERT INTO `syslog` VALUES (400, '2020-04-28 15:05:25', 'dsx', '0:0:0:0:0:0:0:1', '/orders/delete.do', 67, '[类名]com.ssm.controller.OrdersController方法名deleteOrder');
INSERT INTO `syslog` VALUES (401, '2020-04-28 15:10:52', 'dsx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 87, '[类名]com.ssm.controller.OrdersController方法名findAll');
INSERT INTO `syslog` VALUES (402, '2020-04-28 15:10:55', 'dsx', '0:0:0:0:0:0:0:1', '/orders/delete.do', 112, '[类名]com.ssm.controller.OrdersController方法名deleteOrder');
INSERT INTO `syslog` VALUES (403, '2020-04-28 15:10:55', 'dsx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 13, '[类名]com.ssm.controller.OrdersController方法名findAll');
INSERT INTO `syslog` VALUES (404, '2020-04-28 15:10:58', 'dsx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 14, '[类名]com.ssm.controller.OrdersController方法名findAll');
INSERT INTO `syslog` VALUES (405, '2020-04-28 15:10:59', 'dsx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 20, '[类名]com.ssm.controller.OrdersController方法名findAll');
INSERT INTO `syslog` VALUES (406, '2020-04-28 15:11:17', 'dsx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 9, '[类名]com.ssm.controller.OrdersController方法名findAll');
INSERT INTO `syslog` VALUES (407, '2020-04-28 15:30:01', 'dsx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 69, '[类名]com.ssm.controller.OrdersController方法名findAll');
INSERT INTO `syslog` VALUES (408, '2020-04-28 15:30:04', 'dsx', '0:0:0:0:0:0:0:1', '/orders/delete.do', 215, '[类名]com.ssm.controller.OrdersController方法名deleteOrder');
INSERT INTO `syslog` VALUES (409, '2020-04-28 15:30:32', 'dsx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 69, '[类名]com.ssm.controller.OrdersController方法名findAll');
INSERT INTO `syslog` VALUES (410, '2020-04-28 15:30:34', 'dsx', '0:0:0:0:0:0:0:1', '/orders/delete.do', 127, '[类名]com.ssm.controller.OrdersController方法名deleteOrder');
INSERT INTO `syslog` VALUES (411, '2020-04-28 15:31:18', 'dsx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 90, '[类名]com.ssm.controller.OrdersController方法名findAll');
INSERT INTO `syslog` VALUES (412, '2020-04-28 15:31:20', 'dsx', '0:0:0:0:0:0:0:1', '/orders/delete.do', 70, '[类名]com.ssm.controller.OrdersController方法名deleteOrder');
INSERT INTO `syslog` VALUES (413, '2020-04-28 15:31:21', 'dsx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 18, '[类名]com.ssm.controller.OrdersController方法名findAll');
INSERT INTO `syslog` VALUES (414, '2020-04-28 16:55:38', 'dsx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 67, '[类名]com.ssm.controller.OrdersController方法名findAll');
INSERT INTO `syslog` VALUES (415, '2020-04-28 16:55:41', 'dsx', '0:0:0:0:0:0:0:1', '/user/findAll.do', 16, '[类名]com.ssm.controller.UserController方法名findAll');
INSERT INTO `syslog` VALUES (416, '2020-04-28 16:55:46', 'dsx', '0:0:0:0:0:0:0:1', '/user/findAll.do', 7, '[类名]com.ssm.controller.UserController方法名findAll');
INSERT INTO `syslog` VALUES (417, '2020-04-28 16:55:47', 'dsx', '0:0:0:0:0:0:0:1', '/user/findAll.do', 6, '[类名]com.ssm.controller.UserController方法名findAll');
INSERT INTO `syslog` VALUES (418, '2020-04-28 16:55:49', 'dsx', '0:0:0:0:0:0:0:1', '/user/findAll.do', 43, '[类名]com.ssm.controller.UserController方法名findAll');
INSERT INTO `syslog` VALUES (419, '2020-04-28 16:55:51', 'dsx', '0:0:0:0:0:0:0:1', '/role/findAll.do', 12, '[类名]com.ssm.controller.RoleController方法名findAll');
INSERT INTO `syslog` VALUES (420, '2020-04-28 16:55:52', 'dsx', '0:0:0:0:0:0:0:1', '/user/findAll.do', 8, '[类名]com.ssm.controller.UserController方法名findAll');
INSERT INTO `syslog` VALUES (421, '2020-04-28 16:55:55', 'dsx', '0:0:0:0:0:0:0:1', '/role/findAll.do', 8, '[类名]com.ssm.controller.RoleController方法名findAll');
INSERT INTO `syslog` VALUES (422, '2020-04-28 16:55:57', 'dsx', '0:0:0:0:0:0:0:1', '/user/findAll.do', 6, '[类名]com.ssm.controller.UserController方法名findAll');
INSERT INTO `syslog` VALUES (423, '2020-04-28 16:56:04', 'dsx', '0:0:0:0:0:0:0:1', '/user/delUser.do', 86, '[类名]com.ssm.controller.UserController方法名delUser');
INSERT INTO `syslog` VALUES (424, '2020-04-28 17:00:52', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 69, '[类名]com.ssm.controller.UserController方法名findAll');
INSERT INTO `syslog` VALUES (425, '2020-04-28 17:00:56', 'admin', '0:0:0:0:0:0:0:1', '/user/delUser.do', 85, '[类名]com.ssm.controller.UserController方法名delUser');
INSERT INTO `syslog` VALUES (426, '2020-04-28 17:05:01', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 65, '[类名]com.ssm.controller.UserController方法名findAll');
INSERT INTO `syslog` VALUES (427, '2020-04-28 17:05:04', 'admin', '0:0:0:0:0:0:0:1', '/user/delUser.do', 63, '[类名]com.ssm.controller.UserController方法名delUser');
INSERT INTO `syslog` VALUES (428, '2020-04-28 17:05:04', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 6, '[类名]com.ssm.controller.UserController方法名findAll');
INSERT INTO `syslog` VALUES (429, '2020-04-28 17:05:06', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 8, '[类名]com.ssm.controller.UserController方法名findAll');
INSERT INTO `syslog` VALUES (430, '2020-04-28 17:06:52', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 21, '[类名]com.ssm.controller.RoleController方法名findAll');
INSERT INTO `syslog` VALUES (431, '2020-04-28 17:06:55', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 11, '[类名]com.ssm.controller.PermissionController方法名findAll');
INSERT INTO `syslog` VALUES (432, '2020-04-28 17:06:58', 'admin', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 18, '[类名]com.ssm.controller.SysLogController方法名findAll');
INSERT INTO `syslog` VALUES (433, '2020-04-28 17:07:01', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 13, '[类名]com.ssm.controller.ProductController方法名findAll');
INSERT INTO `syslog` VALUES (434, '2020-04-28 17:07:04', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 18, '[类名]com.ssm.controller.OrdersController方法名findAll');
INSERT INTO `syslog` VALUES (435, '2020-04-28 17:07:06', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 8, '[类名]com.ssm.controller.ProductController方法名findAll');
INSERT INTO `syslog` VALUES (436, '2020-04-28 17:07:10', 'admin', '0:0:0:0:0:0:0:1', '/product/delete.do', 117, '[类名]com.ssm.controller.ProductController方法名deleteProduct');
INSERT INTO `syslog` VALUES (437, '2020-04-28 17:07:10', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 9, '[类名]com.ssm.controller.ProductController方法名findAll');
INSERT INTO `syslog` VALUES (438, '2020-04-28 17:07:12', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 8, '[类名]com.ssm.controller.ProductController方法名findAll');
INSERT INTO `syslog` VALUES (439, '2020-04-28 17:07:17', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 5, '[类名]com.ssm.controller.ProductController方法名findAll');
INSERT INTO `syslog` VALUES (440, '2020-04-28 17:07:19', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 9, '[类名]com.ssm.controller.OrdersController方法名findAll');
INSERT INTO `syslog` VALUES (441, '2020-04-28 17:07:20', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 12, '[类名]com.ssm.controller.OrdersController方法名findAll');
INSERT INTO `syslog` VALUES (442, '2020-04-28 17:07:22', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 254, '[类名]com.ssm.controller.OrdersController方法名findAll');
INSERT INTO `syslog` VALUES (443, '2020-04-28 17:07:24', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 8, '[类名]com.ssm.controller.UserController方法名findAll');
INSERT INTO `syslog` VALUES (444, '2020-04-28 17:07:25', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 5, '[类名]com.ssm.controller.UserController方法名findAll');
INSERT INTO `syslog` VALUES (445, '2020-04-28 17:07:26', 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', 5, '[类名]com.ssm.controller.RoleController方法名findAll');
INSERT INTO `syslog` VALUES (446, '2020-04-28 17:36:52', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 68, '[类名]com.ssm.controller.PermissionController方法名findAll');
INSERT INTO `syslog` VALUES (447, '2020-04-28 17:36:55', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 9, '[类名]com.ssm.controller.PermissionController方法名findAll');
INSERT INTO `syslog` VALUES (448, '2020-04-28 17:36:56', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 6, '[类名]com.ssm.controller.PermissionController方法名findAll');
INSERT INTO `syslog` VALUES (449, '2020-04-28 17:36:58', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 6, '[类名]com.ssm.controller.PermissionController方法名findAll');
INSERT INTO `syslog` VALUES (450, '2020-04-28 17:37:00', 'admin', '0:0:0:0:0:0:0:1', '/permission/delPermissionById.do', 58, '[类名]com.ssm.controller.PermissionController方法名delPermissionById');
INSERT INTO `syslog` VALUES (451, '2020-04-28 17:37:00', 'admin', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 11, '[类名]com.ssm.controller.PermissionController方法名findAll');
INSERT INTO `syslog` VALUES (452, '2020-04-28 17:39:34', 'dsx', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 71, '[类名]com.ssm.controller.PermissionController方法名findAll');
INSERT INTO `syslog` VALUES (453, '2020-04-28 17:39:37', 'dsx', '0:0:0:0:0:0:0:1', '/permission/delPermissionById.do', 158, '[类名]com.ssm.controller.PermissionController方法名delPermissionById');
INSERT INTO `syslog` VALUES (454, '2020-04-28 17:41:04', 'dsx', '0:0:0:0:0:0:0:1', '/product/findAll.do', 121, '[类名]com.ssm.controller.ProductController方法名findAll');
INSERT INTO `syslog` VALUES (455, '2020-04-28 17:41:21', 'dsx', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 29, '[类名]com.ssm.controller.PermissionController方法名findAll');
INSERT INTO `syslog` VALUES (456, '2020-04-28 17:41:23', 'dsx', '0:0:0:0:0:0:0:1', '/permission/delPermissionById.do', 59, '[类名]com.ssm.controller.PermissionController方法名delPermissionById');
INSERT INTO `syslog` VALUES (457, '2020-04-28 17:41:24', 'dsx', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 24, '[类名]com.ssm.controller.PermissionController方法名findAll');
INSERT INTO `syslog` VALUES (458, '2020-04-29 09:49:21', 'dsx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 77, '[类名]com.ssm.controller.OrdersController方法名findAll');
INSERT INTO `syslog` VALUES (459, '2020-04-29 09:49:26', 'dsx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 14, '[类名]com.ssm.controller.OrdersController方法名findAll');
INSERT INTO `syslog` VALUES (460, '2020-04-29 09:56:57', 'dsx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 15, '[类名]com.ssm.controller.OrdersController方法名findAll');
INSERT INTO `syslog` VALUES (461, '2020-04-29 09:56:59', 'dsx', '0:0:0:0:0:0:0:1', '/product/findAll.do', 16, '[类名]com.ssm.controller.ProductController方法名findAll');
INSERT INTO `syslog` VALUES (462, '2020-04-29 09:57:02', 'dsx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 18, '[类名]com.ssm.controller.OrdersController方法名findAll');
INSERT INTO `syslog` VALUES (463, '2020-04-29 09:57:03', 'dsx', '0:0:0:0:0:0:0:1', '/product/findAll.do', 8, '[类名]com.ssm.controller.ProductController方法名findAll');
INSERT INTO `syslog` VALUES (464, '2020-04-29 09:57:05', 'dsx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 8, '[类名]com.ssm.controller.OrdersController方法名findAll');
INSERT INTO `syslog` VALUES (465, '2020-04-29 09:57:25', 'dsx', '0:0:0:0:0:0:0:1', '/user/findAll.do', 16, '[类名]com.ssm.controller.UserController方法名findAll');
INSERT INTO `syslog` VALUES (466, '2020-04-29 09:57:32', 'dsx', '0:0:0:0:0:0:0:1', '/role/findAll.do', 13, '[类名]com.ssm.controller.RoleController方法名findAll');
INSERT INTO `syslog` VALUES (467, '2020-04-29 09:57:35', 'dsx', '0:0:0:0:0:0:0:1', '/permission/findAll.do', 13, '[类名]com.ssm.controller.PermissionController方法名findAll');
INSERT INTO `syslog` VALUES (468, '2020-04-29 10:01:23', 'dsx', '0:0:0:0:0:0:0:1', '/user/findAll.do', 6, '[类名]com.ssm.controller.UserController方法名findAll');
INSERT INTO `syslog` VALUES (469, '2020-04-29 10:01:26', 'dsx', '0:0:0:0:0:0:0:1', '/user/findAll.do', 8, '[类名]com.ssm.controller.UserController方法名findAll');
INSERT INTO `syslog` VALUES (470, '2020-04-29 10:01:34', 'dsx', '0:0:0:0:0:0:0:1', '/role/findAll.do', 6, '[类名]com.ssm.controller.RoleController方法名findAll');

-- ----------------------------
-- Table structure for traveller
-- ----------------------------
DROP TABLE IF EXISTS `traveller`;
CREATE TABLE `traveller`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `NAME` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phoneNum` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `credentialsType` int(11) NULL DEFAULT NULL,
  `credentialsNum` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `travellerType` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of traveller
-- ----------------------------
INSERT INTO `traveller` VALUES ('3FE27DF2A4E44A6DBC5D0FE4651D3D3E', '张龙', '男', '13333333333', 0, '123456789009876543', 0);
INSERT INTO `traveller` VALUES ('EE7A71FB6945483FBF91543DBE851960', '张小龙', '男', '15555555555', 0, '987654321123456789', 1);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PASSWORD` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phoneNum` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STATUS` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `email`(`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'admin@123.com', 'admin', '$2a$10$vi4Pj.6IH8p8In7vO.Dxo.kUSYd037XNJRq2NYxpfk./ntShcX3me', '18888888888', 1);
INSERT INTO `users` VALUES ('2', 'dsx@qq.com', 'dsx', '$2a$10$GQArsGbIkIkTV.y5vG3EqeV41KFLGRBJNWd5tb/j4BK98VoB10w0e', '132222222222', 1);
INSERT INTO `users` VALUES ('934f51170ed4443aab4521c6bfe5b095', 'black.19@foxmail.com', 'test', '$2a$10$K.3nVlOU2iosyVw7GCIgOOfy.lnS6Knm67xRmDeyRCaduhZFU8kM6', '1181147', 1);
INSERT INTO `users` VALUES ('9a30379f75cc4de7ac655f9e7be25b88', 'business@123.com', 'business', '$2a$10$kHcVIIDY0UksxgBq2UaE2.awIuc1kFhGq3pbywR7oRpeAwSGrG4.a', '17777777777', 1);
INSERT INTO `users` VALUES ('9dcb93d9ff7d41a382eb6795f2b58be5', 'system@123.com', 'system', '$2a$10$ysdSJx6aKUVubfUmIf1FkO/R7de/VyIHzBFHXFbtqYg/cWwFiaGtG', '155555555555', 1);
INSERT INTO `users` VALUES ('9fbf1f73ba174ed2a461694a276a9063', '020dsasrd208820@gamil.com', 'testDelUserHasRoleAndPermission', '$2a$10$6mK9z5zdrxnJ1wETrDQ6Zu3O0WmlI5AWPa1GWKpxmKcyTXvzTAaDa', '4564564', 1);

-- ----------------------------
-- Table structure for users_role
-- ----------------------------
DROP TABLE IF EXISTS `users_role`;
CREATE TABLE `users_role`  (
  `userId` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `roleId` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`userId`, `roleId`) USING BTREE,
  INDEX `roleId`(`roleId`) USING BTREE,
  CONSTRAINT `users_role_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `users_role_ibfk_2` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users_role
-- ----------------------------
INSERT INTO `users_role` VALUES ('1', '1');
INSERT INTO `users_role` VALUES ('2', '1');
INSERT INTO `users_role` VALUES ('1', '2');
INSERT INTO `users_role` VALUES ('2', '2');
INSERT INTO `users_role` VALUES ('9dcb93d9ff7d41a382eb6795f2b58be5', '2');
INSERT INTO `users_role` VALUES ('1', '3');
INSERT INTO `users_role` VALUES ('2', '3');
INSERT INTO `users_role` VALUES ('9a30379f75cc4de7ac655f9e7be25b88', '3');
INSERT INTO `users_role` VALUES ('9fbf1f73ba174ed2a461694a276a9063', '3');
INSERT INTO `users_role` VALUES ('9fbf1f73ba174ed2a461694a276a9063', 'fa381d508e79474a838ba0536a6ebfa9');

SET FOREIGN_KEY_CHECKS = 1;
