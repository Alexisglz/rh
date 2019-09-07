/*
 Navicat Premium Data Transfer

 Source Server         : Local
 Source Server Type    : MariaDB
 Source Server Version : 100317
 Source Host           : localhost:3306
 Source Schema         : rh

 Target Server Type    : MariaDB
 Target Server Version : 100317
 File Encoding         : 65001

 Date: 07/09/2019 12:40:25
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ajustes_sueldos
-- ----------------------------
DROP TABLE IF EXISTS `ajustes_sueldos`;
CREATE TABLE `ajustes_sueldos`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_empleado` int(10) UNSIGNED NOT NULL,
  `ro` int(10) UNSIGNED NOT NULL,
  `usuario_auth` int(10) UNSIGNED NULL DEFAULT NULL,
  `usuario_cancel` int(10) UNSIGNED NULL DEFAULT NULL,
  `fecha_validacion` datetime(0) NULL DEFAULT NULL,
  `num_empleado` int(11) NOT NULL,
  `tradicional` double(8, 2) NOT NULL DEFAULT 0.00,
  `asimilado` double(8, 2) NOT NULL DEFAULT 0.00,
  `estatus` enum('solicitado','autorizado','rechazado','enviado','cancelado') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'solicitado',
  `observaciones` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `url` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `url_envio` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `fecha_inicio` date NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ajustes_sueldos
-- ----------------------------
INSERT INTO `ajustes_sueldos` VALUES (3, 1885, 52421, NULL, NULL, NULL, 50370, 5000.00, 10000.00, 'solicitado', 'Solicitud del cliente', 'ajustes/3_50370/3_50370_20190903.xlsx', NULL, '2019-09-03 18:14:53', '2019-09-03 18:14:53', NULL);

-- ----------------------------
-- Table structure for baja_comentarios
-- ----------------------------
DROP TABLE IF EXISTS `baja_comentarios`;
CREATE TABLE `baja_comentarios`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_baja` int(10) UNSIGNED NOT NULL,
  `area` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `adeudo` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `retraso` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `observaciones` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for bitacoras
-- ----------------------------
DROP TABLE IF EXISTS `bitacoras`;
CREATE TABLE `bitacoras`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tipo` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id_tabla` int(11) NULL DEFAULT NULL,
  `id_usuario_login` int(11) NULL DEFAULT NULL,
  `id_empleado` int(11) NULL DEFAULT NULL,
  `mensaje` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fecha` date NULL DEFAULT NULL,
  `hora` time(0) NULL DEFAULT NULL,
  `status` tinyint(4) NULL DEFAULT 1,
  `status_auth` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 585 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bitacoras
-- ----------------------------
INSERT INTO `bitacoras` VALUES (1, 'solicitud_alta', 1, 81, 0, 'Registro de solicitud', '2019-07-09', '12:59:37', 1, 'alta', '2019-07-09 12:59:37', '2019-07-09 12:59:37');
INSERT INTO `bitacoras` VALUES (2, 'solicitud_alta', 2, 448, 0, 'Registro de solicitud', '2019-07-10', '16:30:05', 1, 'alta', '2019-07-10 16:30:05', '2019-07-10 16:30:05');
INSERT INTO `bitacoras` VALUES (3, 'solicitud_alta', 3, 45, 0, 'Registro de solicitud', '2019-07-12', '09:07:58', 1, 'alta', '2019-07-12 09:07:58', '2019-07-12 09:07:58');
INSERT INTO `bitacoras` VALUES (4, 'solicitud_alta', 4, 45, 0, 'Registro de solicitud', '2019-07-12', '09:15:05', 1, 'alta', '2019-07-12 09:15:05', '2019-07-12 09:15:05');
INSERT INTO `bitacoras` VALUES (5, 'solicitud_alta', 1, 117, 0, 'Autorizar Solicitud', '2019-07-12', '10:12:51', 1, 'Autorizar solicitud por Direccion', '2019-07-12 10:12:51', '2019-07-12 10:12:51');
INSERT INTO `bitacoras` VALUES (6, 'solicitud_alta', 1, 517, 0, 'Agendar cita de firma', '2019-07-12', '10:59:42', 1, 'CITA FIRMA', '2019-07-12 10:59:42', '2019-07-12 10:59:42');
INSERT INTO `bitacoras` VALUES (7, 'solicitud_alta', 3, 86, 0, 'Autorizar Solicitud', '2019-07-15', '16:35:55', 1, 'Autorizar solicitud', '2019-07-15 16:35:55', '2019-07-15 16:35:55');
INSERT INTO `bitacoras` VALUES (8, 'solicitud_alta', 3, 719, 0, 'Agendar cita de firma', '2019-07-15', '16:44:50', 1, 'CITA FIRMA', '2019-07-15 16:44:50', '2019-07-15 16:44:50');
INSERT INTO `bitacoras` VALUES (9, 'solicitud_alta', 5, 799, 0, 'Registro de solicitud', '2019-07-15', '16:45:16', 1, 'alta', '2019-07-15 16:45:16', '2019-07-15 16:45:16');
INSERT INTO `bitacoras` VALUES (10, 'solicitud_alta', 6, 799, 0, 'Registro de solicitud', '2019-07-15', '16:55:54', 1, 'alta', '2019-07-15 16:55:54', '2019-07-15 16:55:54');
INSERT INTO `bitacoras` VALUES (11, 'solicitud_alta', 7, 799, 0, 'Registro de solicitud', '2019-07-15', '17:13:17', 1, 'alta', '2019-07-15 17:13:17', '2019-07-15 17:13:17');
INSERT INTO `bitacoras` VALUES (12, 'solicitud_alta', 6, 117, 0, 'Autorizar Solicitud', '2019-07-15', '17:13:42', 1, 'Autorizar solicitud por Direccion', '2019-07-15 17:13:42', '2019-07-15 17:13:42');
INSERT INTO `bitacoras` VALUES (13, 'solicitud_alta', 8, 799, 0, 'Registro de solicitud', '2019-07-15', '17:21:41', 1, 'alta', '2019-07-15 17:21:41', '2019-07-15 17:21:41');
INSERT INTO `bitacoras` VALUES (14, 'solicitud_alta', 9, 799, 0, 'Registro de solicitud', '2019-07-15', '17:31:55', 1, 'alta', '2019-07-15 17:31:55', '2019-07-15 17:31:55');
INSERT INTO `bitacoras` VALUES (15, 'solicitud_alta', 10, 799, 0, 'Registro de solicitud', '2019-07-15', '17:59:08', 1, 'alta', '2019-07-15 17:59:08', '2019-07-15 17:59:08');
INSERT INTO `bitacoras` VALUES (16, 'solicitud_alta', 11, 799, 0, 'Registro de solicitud', '2019-07-15', '18:02:20', 1, 'alta', '2019-07-15 18:02:20', '2019-07-15 18:02:20');
INSERT INTO `bitacoras` VALUES (17, 'solicitud_alta', 5, 86, 0, 'Autorizar Solicitud', '2019-07-15', '18:34:41', 1, 'Autorizar solicitud', '2019-07-15 18:34:41', '2019-07-15 18:34:41');
INSERT INTO `bitacoras` VALUES (18, 'solicitud_alta', 11, 86, 0, 'Autorizar Solicitud', '2019-07-15', '18:36:50', 1, 'Autorizar solicitud', '2019-07-15 18:36:50', '2019-07-15 18:36:50');
INSERT INTO `bitacoras` VALUES (19, 'solicitud_alta', 10, 86, 0, 'Autorizar Solicitud', '2019-07-15', '18:37:04', 1, 'Autorizar solicitud', '2019-07-15 18:37:04', '2019-07-15 18:37:04');
INSERT INTO `bitacoras` VALUES (20, 'solicitud_alta', 9, 86, 0, 'Autorizar Solicitud', '2019-07-15', '18:37:08', 1, 'Autorizar solicitud', '2019-07-15 18:37:08', '2019-07-15 18:37:08');
INSERT INTO `bitacoras` VALUES (21, 'solicitud_alta', 8, 86, 0, 'Autorizar Solicitud', '2019-07-15', '18:37:32', 1, 'Autorizar solicitud', '2019-07-15 18:37:32', '2019-07-15 18:37:32');
INSERT INTO `bitacoras` VALUES (22, 'solicitud_alta', 7, 86, 0, 'Autorizar Solicitud', '2019-07-15', '18:38:18', 1, 'Autorizar solicitud', '2019-07-15 18:38:18', '2019-07-15 18:38:18');
INSERT INTO `bitacoras` VALUES (23, 'solicitud_alta', 5, 719, 0, 'Agendar cita de firma', '2019-07-15', '18:38:46', 1, 'CITA FIRMA', '2019-07-15 18:38:46', '2019-07-15 18:38:46');
INSERT INTO `bitacoras` VALUES (24, 'solicitud_alta', 11, 719, 0, 'Agendar cita de firma', '2019-07-16', '13:17:31', 1, 'CITA FIRMA', '2019-07-16 13:17:31', '2019-07-16 13:17:31');
INSERT INTO `bitacoras` VALUES (25, 'solicitud_alta', 10, 719, 0, 'Agendar cita de firma', '2019-07-16', '13:18:49', 1, 'CITA FIRMA', '2019-07-16 13:18:49', '2019-07-16 13:18:49');
INSERT INTO `bitacoras` VALUES (26, 'solicitud_alta', 9, 719, 0, 'Agendar cita de firma', '2019-07-16', '13:21:46', 1, 'CITA FIRMA', '2019-07-16 13:21:46', '2019-07-16 13:21:46');
INSERT INTO `bitacoras` VALUES (27, 'solicitud_alta', 8, 719, 0, 'Agendar cita de firma', '2019-07-16', '13:22:52', 1, 'CITA FIRMA', '2019-07-16 13:22:52', '2019-07-16 13:22:52');
INSERT INTO `bitacoras` VALUES (28, 'solicitud_alta', 7, 719, 0, 'Agendar cita de firma', '2019-07-16', '13:24:47', 1, 'CITA FIRMA', '2019-07-16 13:24:47', '2019-07-16 13:24:47');
INSERT INTO `bitacoras` VALUES (29, 'solicitud_alta', 6, 719, 0, 'Agendar cita de firma', '2019-07-16', '13:25:54', 1, 'CITA FIRMA', '2019-07-16 13:25:54', '2019-07-16 13:25:54');
INSERT INTO `bitacoras` VALUES (30, 'solicitud_alta', 5, 536, 0, 'Autorizar Solicitud', '2019-07-16', '16:34:42', 1, 'Autorizar computadora', '2019-07-16 16:34:42', '2019-07-16 16:34:42');
INSERT INTO `bitacoras` VALUES (31, 'solicitud_alta', 1, 487, 0, 'Autorizar Solicitud', '2019-07-16', '17:03:11', 1, 'Autorizar computadora', '2019-07-16 17:03:11', '2019-07-16 17:03:11');
INSERT INTO `bitacoras` VALUES (32, 'solicitud_alta', 1, 711, 0, 'Autorizar Solicitud', '2019-07-16', '17:04:13', 1, 'Autorizar celular', '2019-07-16 17:04:13', '2019-07-16 17:04:13');
INSERT INTO `bitacoras` VALUES (33, 'solicitud_alta', 11, 744, 0, 'Autorizar Solicitud', '2019-07-17', '16:31:29', 1, 'Autorizar celular', '2019-07-17 16:31:29', '2019-07-17 16:31:29');
INSERT INTO `bitacoras` VALUES (34, 'solicitud_alta', 10, 744, 0, 'Autorizar Solicitud', '2019-07-17', '16:31:58', 1, 'Autorizar celular', '2019-07-17 16:31:58', '2019-07-17 16:31:58');
INSERT INTO `bitacoras` VALUES (35, 'solicitud_alta', 7, 744, 0, 'Autorizar Solicitud', '2019-07-17', '16:32:44', 1, 'Autorizar celular', '2019-07-17 16:32:44', '2019-07-17 16:32:44');
INSERT INTO `bitacoras` VALUES (36, 'solicitud_alta', 6, 744, 0, 'Autorizar Solicitud', '2019-07-18', '09:32:07', 1, 'Autorizar celular', '2019-07-18 09:32:07', '2019-07-18 09:32:07');
INSERT INTO `bitacoras` VALUES (37, 'solicitud_alta', 6, 744, 0, 'Autorizar Solicitud', '2019-07-18', '09:32:07', 1, 'Autorizar celular', '2019-07-18 09:32:07', '2019-07-18 09:32:07');
INSERT INTO `bitacoras` VALUES (41, 'solicitud_alta', 8, 744, 0, 'Autorizar Solicitud', '2019-07-18', '09:34:24', 1, 'Autorizar celular', '2019-07-18 09:34:24', '2019-07-18 09:34:24');
INSERT INTO `bitacoras` VALUES (42, 'solicitud_alta', 9, 744, 0, 'Autorizar Solicitud', '2019-07-18', '09:34:36', 1, 'Autorizar celular', '2019-07-18 09:34:36', '2019-07-18 09:34:36');
INSERT INTO `bitacoras` VALUES (43, 'solicitud_alta', 12, 476, 0, 'Registro de solicitud', '2019-07-19', '09:56:54', 1, 'alta', '2019-07-19 09:56:54', '2019-07-19 09:56:54');
INSERT INTO `bitacoras` VALUES (44, 'solicitud_alta', 13, 2, 0, 'Registro de solicitud', '2019-07-19', '10:18:30', 1, 'alta', '2019-07-19 10:18:30', '2019-07-19 10:18:30');
INSERT INTO `bitacoras` VALUES (45, 'solicitud_alta', 13, 706, 0, 'Autorizar Solicitud', '2019-07-19', '10:20:00', 1, 'Autorizar solicitud', '2019-07-19 10:20:00', '2019-07-19 10:20:00');
INSERT INTO `bitacoras` VALUES (46, 'solicitud_alta', 5, 711, 0, 'Autorizar Solicitud', '2019-07-19', '11:07:42', 1, 'Autorizar celular', '2019-07-19 11:07:42', '2019-07-19 11:07:42');
INSERT INTO `bitacoras` VALUES (47, 'solicitud_alta', 14, 799, 0, 'Registro de solicitud', '2019-07-19', '14:05:10', 1, 'alta', '2019-07-19 14:05:10', '2019-07-19 14:05:10');
INSERT INTO `bitacoras` VALUES (48, 'solicitud_alta', 15, 799, 0, 'Registro de solicitud', '2019-07-19', '14:09:12', 1, 'alta', '2019-07-19 14:09:12', '2019-07-19 14:09:12');
INSERT INTO `bitacoras` VALUES (49, 'solicitud_alta', 16, 799, 0, 'Registro de solicitud', '2019-07-19', '14:14:08', 1, 'alta', '2019-07-19 14:14:08', '2019-07-19 14:14:08');
INSERT INTO `bitacoras` VALUES (50, 'solicitud_alta', 17, 799, 0, 'Registro de solicitud', '2019-07-19', '14:17:20', 1, 'alta', '2019-07-19 14:17:20', '2019-07-19 14:17:20');
INSERT INTO `bitacoras` VALUES (51, 'solicitud_alta', 13, 448, 0, 'Agendar cita de firma', '2019-07-19', '14:33:22', 1, 'CITA FIRMA', '2019-07-19 14:33:22', '2019-07-19 14:33:22');
INSERT INTO `bitacoras` VALUES (52, 'solicitud_alta', 18, 799, 0, 'Registro de solicitud', '2019-07-19', '14:55:18', 1, 'alta', '2019-07-19 14:55:18', '2019-07-19 14:55:18');
INSERT INTO `bitacoras` VALUES (53, 'solicitud_alta', 17, 86, 0, 'Autorizar Solicitud', '2019-07-19', '15:09:54', 1, 'Autorizar solicitud', '2019-07-19 15:09:54', '2019-07-19 15:09:54');
INSERT INTO `bitacoras` VALUES (54, 'solicitud_alta', 16, 86, 0, 'Autorizar Solicitud', '2019-07-19', '15:10:08', 1, 'Autorizar solicitud', '2019-07-19 15:10:08', '2019-07-19 15:10:08');
INSERT INTO `bitacoras` VALUES (55, 'solicitud_alta', 15, 86, 0, 'Autorizar Solicitud', '2019-07-19', '15:10:18', 1, 'Autorizar solicitud', '2019-07-19 15:10:18', '2019-07-19 15:10:18');
INSERT INTO `bitacoras` VALUES (56, 'solicitud_alta', 14, 86, 0, 'Autorizar Solicitud', '2019-07-19', '15:10:34', 1, 'Autorizar solicitud', '2019-07-19 15:10:34', '2019-07-19 15:10:34');
INSERT INTO `bitacoras` VALUES (57, 'solicitud_alta', 18, 86, 0, 'Autorizar Solicitud', '2019-07-19', '15:13:06', 1, 'Autorizar solicitud', '2019-07-19 15:13:06', '2019-07-19 15:13:06');
INSERT INTO `bitacoras` VALUES (58, 'solicitud_alta', 14, 719, 0, 'Agendar cita de firma', '2019-07-19', '17:18:57', 1, 'CITA FIRMA', '2019-07-19 17:18:57', '2019-07-19 17:18:57');
INSERT INTO `bitacoras` VALUES (59, 'solicitud_alta', 15, 719, 0, 'Agendar cita de firma', '2019-07-19', '17:22:39', 1, 'CITA FIRMA', '2019-07-19 17:22:39', '2019-07-19 17:22:39');
INSERT INTO `bitacoras` VALUES (60, 'solicitud_alta', 16, 719, 0, 'Agendar cita de firma', '2019-07-19', '17:24:10', 1, 'CITA FIRMA', '2019-07-19 17:24:10', '2019-07-19 17:24:10');
INSERT INTO `bitacoras` VALUES (61, 'solicitud_alta', 17, 719, 0, 'Agendar cita de firma', '2019-07-19', '17:25:44', 1, 'CITA FIRMA', '2019-07-19 17:25:44', '2019-07-19 17:25:44');
INSERT INTO `bitacoras` VALUES (62, 'solicitud_alta', 18, 719, 0, 'Agendar cita de firma', '2019-07-19', '17:29:44', 1, 'CITA FIRMA', '2019-07-19 17:29:44', '2019-07-19 17:29:44');
INSERT INTO `bitacoras` VALUES (63, 'solicitud_alta', 12, 117, 0, 'Autorizar Solicitud', '2019-07-19', '17:45:41', 1, 'Autorizar solicitud', '2019-07-19 17:45:41', '2019-07-19 17:45:41');
INSERT INTO `bitacoras` VALUES (64, 'solicitud_alta', 12, 517, 0, 'Agendar cita de firma', '2019-07-19', '18:23:07', 1, 'CITA FIRMA', '2019-07-19 18:23:07', '2019-07-19 18:23:07');
INSERT INTO `bitacoras` VALUES (65, 'solicitud_alta', 13, 487, 0, 'Autorizar Solicitud', '2019-07-22', '12:55:38', 1, 'Autorizar computadora', '2019-07-22 12:55:38', '2019-07-22 12:55:38');
INSERT INTO `bitacoras` VALUES (66, 'solicitud_alta', 11, 492, 0, 'Autorizar Solicitud', '2019-07-22', '17:30:06', 1, 'Autorizar computadora', '2019-07-22 17:30:06', '2019-07-22 17:30:06');
INSERT INTO `bitacoras` VALUES (67, 'solicitud_alta', 10, 492, 0, 'Autorizar Solicitud', '2019-07-22', '17:30:33', 1, 'Autorizar computadora', '2019-07-22 17:30:33', '2019-07-22 17:30:33');
INSERT INTO `bitacoras` VALUES (68, 'solicitud_alta', 9, 492, 0, 'Autorizar Solicitud', '2019-07-22', '17:31:07', 1, 'Autorizar computadora', '2019-07-22 17:31:07', '2019-07-22 17:31:07');
INSERT INTO `bitacoras` VALUES (69, 'solicitud_alta', 8, 492, 0, 'Autorizar Solicitud', '2019-07-22', '17:31:53', 1, 'Autorizar computadora', '2019-07-22 17:31:53', '2019-07-22 17:31:53');
INSERT INTO `bitacoras` VALUES (70, 'solicitud_alta', 7, 492, 0, 'Autorizar Solicitud', '2019-07-22', '17:32:40', 1, 'Autorizar computadora', '2019-07-22 17:32:40', '2019-07-22 17:32:40');
INSERT INTO `bitacoras` VALUES (71, 'solicitud_alta', 18, 794, 0, 'Autorizar Solicitud', '2019-07-24', '10:05:53', 1, 'Autorizar firmado', '2019-07-24 10:05:53', '2019-07-24 10:05:53');
INSERT INTO `bitacoras` VALUES (72, 'solicitud_alta', 17, 794, 0, 'Autorizar Solicitud', '2019-07-24', '10:06:11', 1, 'Autorizar firmado', '2019-07-24 10:06:11', '2019-07-24 10:06:11');
INSERT INTO `bitacoras` VALUES (73, 'solicitud_alta', 19, 119, 0, 'Registro de solicitud', '2019-07-26', '13:02:32', 1, 'alta', '2019-07-26 13:02:33', '2019-07-26 13:02:33');
INSERT INTO `bitacoras` VALUES (74, 'solicitud_alta', 19, 232, 0, 'Autorizar Solicitud', '2019-07-26', '15:45:48', 1, 'Autorizar solicitud', '2019-07-26 15:45:48', '2019-07-26 15:45:48');
INSERT INTO `bitacoras` VALUES (75, 'solicitud_alta', 19, 719, 0, 'Agendar cita de firma', '2019-07-26', '16:23:54', 1, 'CITA FIRMA', '2019-07-26 16:23:54', '2019-07-26 16:23:54');
INSERT INTO `bitacoras` VALUES (76, 'solicitud_alta', 2, 117, 0, 'Autorizar Solicitud', '2019-07-29', '10:36:52', 1, 'Autorizar solicitud', '2019-07-29 10:36:52', '2019-07-29 10:36:52');
INSERT INTO `bitacoras` VALUES (77, 'solicitud_alta', 19, 711, 0, 'Autorizar Solicitud', '2019-07-29', '11:14:12', 1, 'Autorizar celular', '2019-07-29 11:14:12', '2019-07-29 11:14:12');
INSERT INTO `bitacoras` VALUES (78, 'solicitud_alta', 2, 448, 0, 'Agendar cita de firma', '2019-07-29', '12:31:40', 1, 'CITA FIRMA', '2019-07-29 12:31:40', '2019-07-29 12:31:40');
INSERT INTO `bitacoras` VALUES (79, 'solicitud_alta', 2, 711, 0, 'Autorizar Solicitud', '2019-07-29', '12:33:47', 1, 'Autorizar celular', '2019-07-29 12:33:47', '2019-07-29 12:33:47');
INSERT INTO `bitacoras` VALUES (80, 'solicitud_alta', 20, 799, 0, 'Registro de solicitud', '2019-07-30', '08:53:42', 1, 'alta', '2019-07-30 08:53:42', '2019-07-30 08:53:42');
INSERT INTO `bitacoras` VALUES (81, 'solicitud_alta', 21, 799, 0, 'Registro de solicitud', '2019-07-30', '10:15:11', 1, 'alta', '2019-07-30 10:15:11', '2019-07-30 10:15:11');
INSERT INTO `bitacoras` VALUES (82, 'solicitud_alta', 20, 86, 0, 'Autorizar Solicitud', '2019-07-30', '11:24:00', 1, 'Autorizar solicitud', '2019-07-30 11:24:00', '2019-07-30 11:24:00');
INSERT INTO `bitacoras` VALUES (83, 'solicitud_alta', 20, 719, 0, 'Agendar cita de firma', '2019-07-30', '11:35:23', 1, 'CITA FIRMA', '2019-07-30 11:35:23', '2019-07-30 11:35:23');
INSERT INTO `bitacoras` VALUES (84, 'solicitud_alta', 22, 799, 0, 'Registro de solicitud', '2019-07-30', '13:10:03', 1, 'alta', '2019-07-30 13:10:03', '2019-07-30 13:10:03');
INSERT INTO `bitacoras` VALUES (85, 'solicitud_alta', 21, 232, 0, 'Autorizar Solicitud', '2019-07-30', '18:12:03', 1, 'Autorizar solicitud', '2019-07-30 18:12:03', '2019-07-30 18:12:03');
INSERT INTO `bitacoras` VALUES (86, 'solicitud_alta', 21, 719, 0, 'Agendar cita de firma', '2019-07-30', '18:15:41', 1, 'CITA FIRMA', '2019-07-30 18:15:41', '2019-07-30 18:15:41');
INSERT INTO `bitacoras` VALUES (87, 'solicitud_alta', 22, 117, 0, 'Autorizar Solicitud', '2019-07-31', '10:38:32', 1, 'Autorizar solicitud', '2019-07-31 10:38:32', '2019-07-31 10:38:32');
INSERT INTO `bitacoras` VALUES (88, 'solicitud_alta', 23, 761, 0, 'Registro de solicitud', '2019-07-31', '11:13:05', 1, 'alta', '2019-07-31 11:13:05', '2019-07-31 11:13:05');
INSERT INTO `bitacoras` VALUES (89, 'solicitud_alta', 23, 232, 0, 'Autorizar Solicitud', '2019-07-31', '14:31:40', 1, 'Autorizar solicitud', '2019-07-31 14:31:40', '2019-07-31 14:31:40');
INSERT INTO `bitacoras` VALUES (90, 'solicitud_alta', 24, 81, 0, 'Registro de solicitud', '2019-07-31', '17:03:12', 1, 'alta', '2019-07-31 17:03:12', '2019-07-31 17:03:12');
INSERT INTO `bitacoras` VALUES (91, 'solicitud_alta', 22, 719, 0, 'Agendar cita de firma', '2019-07-31', '17:51:25', 1, 'CITA FIRMA', '2019-07-31 17:51:25', '2019-07-31 17:51:25');
INSERT INTO `bitacoras` VALUES (92, 'solicitud_alta', 25, 799, 0, 'Registro de solicitud', '2019-07-31', '18:54:49', 1, 'alta', '2019-07-31 18:54:49', '2019-07-31 18:54:49');
INSERT INTO `bitacoras` VALUES (93, 'solicitud_alta', 24, 117, 0, 'Autorizar Solicitud', '2019-07-31', '19:01:07', 1, 'Autorizar solicitud', '2019-07-31 19:01:07', '2019-07-31 19:01:07');
INSERT INTO `bitacoras` VALUES (94, 'solicitud_alta', 26, 799, 0, 'Registro de solicitud', '2019-07-31', '19:04:45', 1, 'alta', '2019-07-31 19:04:45', '2019-07-31 19:04:45');
INSERT INTO `bitacoras` VALUES (95, 'solicitud_alta', 27, 799, 0, 'Registro de solicitud', '2019-07-31', '19:13:40', 1, 'alta', '2019-07-31 19:13:40', '2019-07-31 19:13:40');
INSERT INTO `bitacoras` VALUES (96, 'solicitud_alta', 27, 86, 0, 'Autorizar Solicitud', '2019-07-31', '20:20:07', 1, 'Autorizar solicitud por Direccion', '2019-07-31 20:20:07', '2019-07-31 20:20:07');
INSERT INTO `bitacoras` VALUES (97, 'solicitud_alta', 26, 86, 0, 'Autorizar Solicitud', '2019-07-31', '20:20:36', 1, 'Autorizar solicitud por Direccion', '2019-07-31 20:20:36', '2019-07-31 20:20:36');
INSERT INTO `bitacoras` VALUES (98, 'solicitud_alta', 25, 86, 0, 'Autorizar Solicitud', '2019-07-31', '20:21:09', 1, 'Autorizar solicitud por Direccion', '2019-07-31 20:21:09', '2019-07-31 20:21:09');
INSERT INTO `bitacoras` VALUES (99, 'solicitud_alta', 26, 719, 0, 'Agendar cita de firma', '2019-08-01', '08:53:59', 1, 'CITA FIRMA', '2019-08-01 08:53:59', '2019-08-01 08:53:59');
INSERT INTO `bitacoras` VALUES (100, 'solicitud_alta', 27, 719, 0, 'Agendar cita de firma', '2019-08-01', '08:55:15', 1, 'CITA FIRMA', '2019-08-01 08:55:15', '2019-08-01 08:55:15');
INSERT INTO `bitacoras` VALUES (101, 'solicitud_alta', 25, 719, 0, 'Agendar cita de firma', '2019-08-01', '08:56:43', 1, 'CITA FIRMA', '2019-08-01 08:56:43', '2019-08-01 08:56:43');
INSERT INTO `bitacoras` VALUES (102, 'solicitud_alta', 24, 517, 0, 'Agendar cita de firma', '2019-08-01', '09:13:59', 1, 'CITA FIRMA', '2019-08-01 09:13:59', '2019-08-01 09:13:59');
INSERT INTO `bitacoras` VALUES (103, 'solicitud_alta', 28, 799, 0, 'Registro de solicitud', '2019-08-01', '18:55:01', 1, 'alta', '2019-08-01 18:55:01', '2019-08-01 18:55:01');
INSERT INTO `bitacoras` VALUES (104, 'solicitud_alta', 29, 799, 0, 'Registro de solicitud', '2019-08-01', '18:59:20', 1, 'alta', '2019-08-01 18:59:20', '2019-08-01 18:59:20');
INSERT INTO `bitacoras` VALUES (105, 'solicitud_alta', 23, 719, 0, 'Agendar cita de firma', '2019-08-02', '11:54:36', 1, 'CITA FIRMA', '2019-08-02 11:54:36', '2019-08-02 11:54:36');
INSERT INTO `bitacoras` VALUES (106, 'solicitud_alta', 27, 744, 0, 'Autorizar Solicitud', '2019-08-02', '11:59:13', 1, 'Autorizar celular', '2019-08-02 11:59:13', '2019-08-02 11:59:13');
INSERT INTO `bitacoras` VALUES (107, 'solicitud_alta', 26, 744, 0, 'Autorizar Solicitud', '2019-08-02', '11:59:36', 1, 'Autorizar celular', '2019-08-02 11:59:36', '2019-08-02 11:59:36');
INSERT INTO `bitacoras` VALUES (108, 'solicitud_alta', 29, 799, 0, 'Editar Solicitud', '2019-08-03', '09:56:08', 1, 'EDITAR', '2019-08-03 09:56:08', '2019-08-03 09:56:08');
INSERT INTO `bitacoras` VALUES (109, 'solicitud_alta', 28, 799, 0, 'Editar Solicitud', '2019-08-03', '09:57:31', 1, 'EDITAR', '2019-08-03 09:57:31', '2019-08-03 09:57:31');
INSERT INTO `bitacoras` VALUES (110, 'solicitud_alta', 28, 799, 0, 'Editar Solicitud', '2019-08-03', '09:57:49', 1, 'EDITAR', '2019-08-03 09:57:49', '2019-08-03 09:57:49');
INSERT INTO `bitacoras` VALUES (111, 'solicitud_alta', 30, 799, 0, 'Registro de solicitud', '2019-08-03', '10:00:35', 1, 'alta', '2019-08-03 10:00:35', '2019-08-03 10:00:35');
INSERT INTO `bitacoras` VALUES (112, 'solicitud_alta', 23, 744, 0, 'Autorizar Solicitud', '2019-08-05', '09:10:26', 1, 'Autorizar celular', '2019-08-05 09:10:26', '2019-08-05 09:10:26');
INSERT INTO `bitacoras` VALUES (113, 'solicitud_alta', 30, 86, 0, 'Autorizar Solicitud', '2019-08-05', '09:17:39', 1, 'Autorizar solicitud por Direccion', '2019-08-05 09:17:39', '2019-08-05 09:17:39');
INSERT INTO `bitacoras` VALUES (114, 'solicitud_alta', 29, 86, 0, 'Autorizar Solicitud', '2019-08-05', '09:18:10', 1, 'Autorizar solicitud por Direccion', '2019-08-05 09:18:10', '2019-08-05 09:18:10');
INSERT INTO `bitacoras` VALUES (115, 'solicitud_alta', 28, 86, 0, 'Autorizar Solicitud', '2019-08-05', '09:18:42', 1, 'Autorizar solicitud por Direccion', '2019-08-05 09:18:42', '2019-08-05 09:18:42');
INSERT INTO `bitacoras` VALUES (116, 'solicitud_alta', 29, 719, 0, 'Agendar cita de firma', '2019-08-05', '09:20:56', 1, 'CITA FIRMA', '2019-08-05 09:20:56', '2019-08-05 09:20:56');
INSERT INTO `bitacoras` VALUES (117, 'solicitud_alta', 30, 719, 0, 'Agendar cita de firma', '2019-08-05', '09:21:49', 1, 'CITA FIRMA', '2019-08-05 09:21:49', '2019-08-05 09:21:49');
INSERT INTO `bitacoras` VALUES (118, 'solicitud_alta', 28, 719, 0, 'Agendar cita de firma', '2019-08-05', '09:22:38', 1, 'CITA FIRMA', '2019-08-05 09:22:38', '2019-08-05 09:22:38');
INSERT INTO `bitacoras` VALUES (119, 'solicitud_alta', 30, 744, 0, 'Autorizar Solicitud', '2019-08-05', '11:30:17', 1, 'Autorizar celular', '2019-08-05 11:30:17', '2019-08-05 11:30:17');
INSERT INTO `bitacoras` VALUES (120, 'solicitud_alta', 29, 744, 0, 'Autorizar Solicitud', '2019-08-05', '11:33:26', 1, 'Autorizar celular', '2019-08-05 11:33:26', '2019-08-05 11:33:26');
INSERT INTO `bitacoras` VALUES (121, 'solicitud_alta', 31, 44, 0, 'Registro de solicitud', '2019-08-05', '11:47:54', 1, 'alta', '2019-08-05 11:47:54', '2019-08-05 11:47:54');
INSERT INTO `bitacoras` VALUES (122, 'solicitud_alta', 31, 117, 0, 'Autorizar Solicitud', '2019-08-05', '12:27:29', 1, 'Autorizar solicitud por Direccion', '2019-08-05 12:27:29', '2019-08-05 12:27:29');
INSERT INTO `bitacoras` VALUES (123, 'solicitud_alta', 31, 517, 0, 'Agendar cita de firma', '2019-08-05', '12:38:02', 1, 'CITA FIRMA', '2019-08-05 12:38:02', '2019-08-05 12:38:02');
INSERT INTO `bitacoras` VALUES (124, 'solicitud_alta', 27, 492, 0, 'Autorizar Solicitud', '2019-08-05', '14:07:28', 1, 'Autorizar computadora', '2019-08-05 14:07:28', '2019-08-05 14:07:28');
INSERT INTO `bitacoras` VALUES (125, 'solicitud_alta', 25, 744, 0, 'Autorizar Solicitud', '2019-08-06', '12:39:31', 1, 'Autorizar celular', '2019-08-06 12:39:31', '2019-08-06 12:39:31');
INSERT INTO `bitacoras` VALUES (126, 'solicitud_alta', 26, 492, 0, 'Autorizar Solicitud', '2019-08-06', '18:21:44', 1, 'Autorizar computadora', '2019-08-06 18:21:44', '2019-08-06 18:21:44');
INSERT INTO `bitacoras` VALUES (127, 'solicitud_alta', 28, 492, 0, 'Autorizar Solicitud', '2019-08-06', '18:22:20', 1, 'Autorizar computadora', '2019-08-06 18:22:20', '2019-08-06 18:22:20');
INSERT INTO `bitacoras` VALUES (128, 'solicitud_alta', 29, 492, 0, 'Autorizar Solicitud', '2019-08-06', '18:22:57', 1, 'Autorizar computadora', '2019-08-06 18:22:57', '2019-08-06 18:22:57');
INSERT INTO `bitacoras` VALUES (129, 'solicitud_alta', 30, 492, 0, 'Autorizar Solicitud', '2019-08-06', '18:23:38', 1, 'Autorizar computadora', '2019-08-06 18:23:39', '2019-08-06 18:23:39');
INSERT INTO `bitacoras` VALUES (130, 'solicitud_alta', 32, 799, 0, 'Registro de solicitud', '2019-08-07', '09:48:52', 1, 'alta', '2019-08-07 09:48:52', '2019-08-07 09:48:52');
INSERT INTO `bitacoras` VALUES (131, 'solicitud_alta', 33, 799, 0, 'Registro de solicitud', '2019-08-07', '09:56:51', 1, 'alta', '2019-08-07 09:56:51', '2019-08-07 09:56:51');
INSERT INTO `bitacoras` VALUES (132, 'solicitud_alta', 34, 799, 0, 'Registro de solicitud', '2019-08-07', '09:59:12', 1, 'alta', '2019-08-07 09:59:12', '2019-08-07 09:59:12');
INSERT INTO `bitacoras` VALUES (133, 'solicitud_alta', 32, 117, 0, 'Autorizar Solicitud', '2019-08-07', '13:45:22', 1, 'Autorizar solicitud por Direccion', '2019-08-07 13:45:22', '2019-08-07 13:45:22');
INSERT INTO `bitacoras` VALUES (134, 'solicitud_alta', 33, 117, 0, 'Autorizar Solicitud', '2019-08-07', '13:45:55', 1, 'Autorizar solicitud', '2019-08-07 13:45:55', '2019-08-07 13:45:55');
INSERT INTO `bitacoras` VALUES (135, 'solicitud_alta', 34, 117, 0, 'Autorizar Solicitud', '2019-08-07', '13:46:00', 1, 'Autorizar solicitud', '2019-08-07 13:46:00', '2019-08-07 13:46:00');
INSERT INTO `bitacoras` VALUES (136, 'solicitud_alta', 35, 761, 0, 'Registro de solicitud', '2019-08-07', '13:58:57', 1, 'alta', '2019-08-07 13:58:57', '2019-08-07 13:58:57');
INSERT INTO `bitacoras` VALUES (137, 'solicitud_alta', 36, 761, 0, 'Registro de solicitud', '2019-08-07', '13:58:58', 1, 'alta', '2019-08-07 13:58:58', '2019-08-07 13:58:58');
INSERT INTO `bitacoras` VALUES (138, 'solicitud_alta', 37, 761, 0, 'Registro de solicitud', '2019-08-07', '13:59:01', 1, 'alta', '2019-08-07 13:59:01', '2019-08-07 13:59:01');
INSERT INTO `bitacoras` VALUES (139, 'solicitud_alta', 37, 232, 0, 'Autorizar Solicitud', '2019-08-07', '14:32:14', 1, 'Autorizar solicitud', '2019-08-07 14:32:14', '2019-08-07 14:32:14');
INSERT INTO `bitacoras` VALUES (140, 'solicitud_alta', 37, 517, 0, 'Agendar cita de firma', '2019-08-07', '14:41:46', 1, 'CITA FIRMA', '2019-08-07 14:41:46', '2019-08-07 14:41:46');
INSERT INTO `bitacoras` VALUES (141, 'solicitud_alta', 31, 744, 0, 'Autorizar Solicitud', '2019-08-08', '09:53:37', 1, 'Autorizar celular', '2019-08-08 09:53:37', '2019-08-08 09:53:37');
INSERT INTO `bitacoras` VALUES (142, 'solicitud_alta', 38, 81, 0, 'Registro de solicitud', '2019-08-08', '16:37:40', 1, 'alta', '2019-08-08 16:37:40', '2019-08-08 16:37:40');
INSERT INTO `bitacoras` VALUES (143, 'solicitud_alta', 28, 744, 0, 'Autorizar Solicitud', '2019-08-08', '17:04:54', 1, 'Autorizar celular', '2019-08-08 17:04:54', '2019-08-08 17:04:54');
INSERT INTO `bitacoras` VALUES (144, 'solicitud_alta', 24, 744, 0, 'Autorizar Solicitud', '2019-08-08', '17:06:20', 1, 'Autorizar celular', '2019-08-08 17:06:20', '2019-08-08 17:06:20');
INSERT INTO `bitacoras` VALUES (145, 'solicitud_alta', 32, 719, 0, 'Agendar cita de firma', '2019-08-08', '19:00:11', 1, 'CITA FIRMA', '2019-08-08 19:00:11', '2019-08-08 19:00:11');
INSERT INTO `bitacoras` VALUES (146, 'solicitud_alta', 34, 719, 0, 'Agendar cita de firma', '2019-08-08', '19:00:43', 1, 'CITA FIRMA', '2019-08-08 19:00:43', '2019-08-08 19:00:43');
INSERT INTO `bitacoras` VALUES (147, 'solicitud_alta', 39, 2, 0, 'Registro de solicitud', '2019-08-09', '09:47:56', 1, 'alta', '2019-08-09 09:47:56', '2019-08-09 09:47:56');
INSERT INTO `bitacoras` VALUES (148, 'solicitud_alta', 39, 706, 0, 'Autorizar Solicitud', '2019-08-09', '09:48:53', 1, 'Autorizar solicitud por Direccion', '2019-08-09 09:48:53', '2019-08-09 09:48:53');
INSERT INTO `bitacoras` VALUES (149, 'solicitud_alta', 39, 706, 0, 'Autorizar Solicitud', '2019-08-09', '09:48:54', 1, 'Autorizar solicitud por Direccion', '2019-08-09 09:48:54', '2019-08-09 09:48:54');
INSERT INTO `bitacoras` VALUES (150, 'solicitud_alta', 37, 744, 0, 'Autorizar Solicitud', '2019-08-09', '10:07:35', 1, 'Autorizar celular', '2019-08-09 10:07:35', '2019-08-09 10:07:35');
INSERT INTO `bitacoras` VALUES (151, 'solicitud_alta', 38, 117, 0, 'Autorizar Solicitud', '2019-08-09', '11:45:17', 1, 'Autorizar solicitud por Direccion', '2019-08-09 11:45:17', '2019-08-09 11:45:17');
INSERT INTO `bitacoras` VALUES (152, 'solicitud_alta', 38, 517, 0, 'Agendar cita de firma', '2019-08-09', '12:19:32', 1, 'CITA FIRMA', '2019-08-09 12:19:32', '2019-08-09 12:19:32');
INSERT INTO `bitacoras` VALUES (153, 'solicitud_alta', 40, 799, 0, 'Registro de solicitud', '2019-08-09', '13:33:13', 1, 'alta', '2019-08-09 13:33:13', '2019-08-09 13:33:13');
INSERT INTO `bitacoras` VALUES (154, 'solicitud_alta', 41, 44, 0, 'Registro de solicitud', '2019-08-12', '11:23:15', 1, 'alta', '2019-08-12 11:23:15', '2019-08-12 11:23:15');
INSERT INTO `bitacoras` VALUES (155, 'solicitud_alta', 42, 799, 0, 'Registro de solicitud', '2019-08-12', '11:24:17', 1, 'alta', '2019-08-12 11:24:17', '2019-08-12 11:24:17');
INSERT INTO `bitacoras` VALUES (156, 'solicitud_alta', 41, 86, 0, 'Autorizar Solicitud', '2019-08-12', '11:45:03', 1, 'Autorizar solicitud', '2019-08-12 11:45:03', '2019-08-12 11:45:03');
INSERT INTO `bitacoras` VALUES (157, 'solicitud_alta', 41, 517, 0, 'Agendar cita de firma', '2019-08-12', '11:48:39', 1, 'CITA FIRMA', '2019-08-12 11:48:39', '2019-08-12 11:48:39');
INSERT INTO `bitacoras` VALUES (158, 'solicitud_alta', 43, 476, 0, 'Registro de solicitud', '2019-08-12', '13:27:03', 1, 'alta', '2019-08-12 13:27:03', '2019-08-12 13:27:03');
INSERT INTO `bitacoras` VALUES (159, 'solicitud_alta', 41, 744, 0, 'Autorizar Solicitud', '2019-08-12', '14:05:21', 1, 'Autorizar celular', '2019-08-12 14:05:21', '2019-08-12 14:05:21');
INSERT INTO `bitacoras` VALUES (160, 'solicitud_alta', 38, 744, 0, 'Autorizar Solicitud', '2019-08-12', '16:56:45', 1, 'Autorizar celular', '2019-08-12 16:56:45', '2019-08-12 16:56:45');
INSERT INTO `bitacoras` VALUES (161, 'solicitud_alta', 38, 536, 0, 'Autorizar Solicitud', '2019-08-12', '18:56:16', 1, 'Autorizar computadora', '2019-08-12 18:56:16', '2019-08-12 18:56:16');
INSERT INTO `bitacoras` VALUES (162, 'solicitud_alta', 42, 86, 0, 'Autorizar Solicitud', '2019-08-12', '19:30:27', 1, 'Autorizar solicitud', '2019-08-12 19:30:27', '2019-08-12 19:30:27');
INSERT INTO `bitacoras` VALUES (163, 'solicitud_alta', 42, 719, 0, 'Agendar cita de firma', '2019-08-13', '11:29:19', 1, 'CITA FIRMA', '2019-08-13 11:29:19', '2019-08-13 11:29:19');
INSERT INTO `bitacoras` VALUES (164, 'incidencia', 1, 45, 1240, 'Se ha creado una incidencia', '2019-08-13', '13:50:51', 1, 'Creacion de incidencia', '2019-08-13 13:50:51', '2019-08-13 13:50:51');
INSERT INTO `bitacoras` VALUES (165, 'incidencia', 2, 45, 2308, 'Se ha creado una incidencia', '2019-08-13', '13:56:21', 1, 'Creacion de incidencia', '2019-08-13 13:56:21', '2019-08-13 13:56:21');
INSERT INTO `bitacoras` VALUES (166, 'incidencia', 3, 45, 1337, 'Se ha creado una incidencia', '2019-08-13', '13:57:22', 1, 'Creacion de incidencia', '2019-08-13 13:57:22', '2019-08-13 13:57:22');
INSERT INTO `bitacoras` VALUES (167, 'incidencia', 4, 45, 1524, 'Se ha creado una incidencia', '2019-08-13', '13:58:46', 1, 'Creacion de incidencia', '2019-08-13 13:58:46', '2019-08-13 13:58:46');
INSERT INTO `bitacoras` VALUES (168, 'incidencia', 5, 45, 850, 'Se ha creado una incidencia', '2019-08-13', '13:59:27', 1, 'Creacion de incidencia', '2019-08-13 13:59:27', '2019-08-13 13:59:27');
INSERT INTO `bitacoras` VALUES (169, 'incidencia', 6, 45, 2177, 'Se ha creado una incidencia', '2019-08-13', '14:00:42', 1, 'Creacion de incidencia', '2019-08-13 14:00:42', '2019-08-13 14:00:42');
INSERT INTO `bitacoras` VALUES (170, 'incidencia', 7, 45, 1570, 'Se ha creado una incidencia', '2019-08-13', '14:01:22', 1, 'Creacion de incidencia', '2019-08-13 14:01:22', '2019-08-13 14:01:22');
INSERT INTO `bitacoras` VALUES (171, 'incidencia', 8, 45, 936, 'Se ha creado una incidencia', '2019-08-13', '14:03:52', 1, 'Creacion de incidencia', '2019-08-13 14:03:52', '2019-08-13 14:03:52');
INSERT INTO `bitacoras` VALUES (172, 'incidencia', 9, 45, 1167, 'Se ha creado una incidencia', '2019-08-13', '14:04:21', 1, 'Creacion de incidencia', '2019-08-13 14:04:21', '2019-08-13 14:04:21');
INSERT INTO `bitacoras` VALUES (173, 'incidencia', 10, 45, 1279, 'Se ha creado una incidencia', '2019-08-13', '14:05:19', 1, 'Creacion de incidencia', '2019-08-13 14:05:19', '2019-08-13 14:05:19');
INSERT INTO `bitacoras` VALUES (174, 'incidencia', 11, 764, 2181, 'Se ha creado una incidencia', '2019-08-13', '17:18:36', 1, 'Creacion de incidencia', '2019-08-13 17:18:36', '2019-08-13 17:18:36');
INSERT INTO `bitacoras` VALUES (175, 'incidencia', 12, 764, 2060, 'Se ha creado una incidencia', '2019-08-13', '17:21:26', 1, 'Creacion de incidencia', '2019-08-13 17:21:26', '2019-08-13 17:21:26');
INSERT INTO `bitacoras` VALUES (176, 'incidencia', 13, 764, 2181, 'Se ha creado una incidencia', '2019-08-13', '17:23:54', 1, 'Creacion de incidencia', '2019-08-13 17:23:54', '2019-08-13 17:23:54');
INSERT INTO `bitacoras` VALUES (177, 'incidencia', 14, 764, 1959, 'Se ha creado una incidencia', '2019-08-13', '17:32:58', 1, 'Creacion de incidencia', '2019-08-13 17:32:58', '2019-08-13 17:32:58');
INSERT INTO `bitacoras` VALUES (178, 'incidencia', 15, 45, 1946, 'Se ha creado una incidencia', '2019-08-13', '17:47:05', 1, 'Creacion de incidencia', '2019-08-13 17:47:05', '2019-08-13 17:47:05');
INSERT INTO `bitacoras` VALUES (179, 'incidencia', 16, 45, 1843, 'Se ha creado una incidencia', '2019-08-13', '17:48:14', 1, 'Creacion de incidencia', '2019-08-13 17:48:14', '2019-08-13 17:48:14');
INSERT INTO `bitacoras` VALUES (180, 'incidencia', 17, 45, 1880, 'Se ha creado una incidencia', '2019-08-13', '17:55:37', 1, 'Creacion de incidencia', '2019-08-13 17:55:37', '2019-08-13 17:55:37');
INSERT INTO `bitacoras` VALUES (181, 'incidencia', 18, 45, 2287, 'Se ha creado una incidencia', '2019-08-13', '17:56:36', 1, 'Creacion de incidencia', '2019-08-13 17:56:36', '2019-08-13 17:56:36');
INSERT INTO `bitacoras` VALUES (182, 'incidencia', 19, 45, 2260, 'Se ha creado una incidencia', '2019-08-13', '17:57:26', 1, 'Creacion de incidencia', '2019-08-13 17:57:26', '2019-08-13 17:57:26');
INSERT INTO `bitacoras` VALUES (183, 'incidencia', 20, 45, 2134, 'Se ha creado una incidencia', '2019-08-13', '17:58:23', 1, 'Creacion de incidencia', '2019-08-13 17:58:23', '2019-08-13 17:58:23');
INSERT INTO `bitacoras` VALUES (184, 'incidencia', 21, 45, 1778, 'Se ha creado una incidencia', '2019-08-13', '17:59:29', 1, 'Creacion de incidencia', '2019-08-13 17:59:29', '2019-08-13 17:59:29');
INSERT INTO `bitacoras` VALUES (185, 'incidencia', 22, 45, 2156, 'Se ha creado una incidencia', '2019-08-13', '18:00:14', 1, 'Creacion de incidencia', '2019-08-13 18:00:14', '2019-08-13 18:00:14');
INSERT INTO `bitacoras` VALUES (186, 'incidencia', 23, 45, 1836, 'Se ha creado una incidencia', '2019-08-13', '18:01:06', 1, 'Creacion de incidencia', '2019-08-13 18:01:06', '2019-08-13 18:01:06');
INSERT INTO `bitacoras` VALUES (187, 'incidencia', 24, 45, 2074, 'Se ha creado una incidencia', '2019-08-13', '18:02:58', 1, 'Creacion de incidencia', '2019-08-13 18:02:58', '2019-08-13 18:02:58');
INSERT INTO `bitacoras` VALUES (188, 'incidencia', 25, 45, 2153, 'Se ha creado una incidencia', '2019-08-13', '18:31:42', 1, 'Creacion de incidencia', '2019-08-13 18:31:42', '2019-08-13 18:31:42');
INSERT INTO `bitacoras` VALUES (189, 'incidencia', 26, 45, 1837, 'Se ha creado una incidencia', '2019-08-13', '18:34:25', 1, 'Creacion de incidencia', '2019-08-13 18:34:25', '2019-08-13 18:34:25');
INSERT INTO `bitacoras` VALUES (190, 'incidencia', 27, 764, 2041, 'Se ha creado una incidencia', '2019-08-13', '18:34:52', 1, 'Creacion de incidencia', '2019-08-13 18:34:52', '2019-08-13 18:34:52');
INSERT INTO `bitacoras` VALUES (191, 'incidencia', 28, 45, 1841, 'Se ha creado una incidencia', '2019-08-13', '18:35:47', 1, 'Creacion de incidencia', '2019-08-13 18:35:47', '2019-08-13 18:35:47');
INSERT INTO `bitacoras` VALUES (192, 'incidencia', 29, 764, 1883, 'Se ha creado una incidencia', '2019-08-13', '18:36:47', 1, 'Creacion de incidencia', '2019-08-13 18:36:47', '2019-08-13 18:36:47');
INSERT INTO `bitacoras` VALUES (193, 'incidencia', 30, 45, 1711, 'Se ha creado una incidencia', '2019-08-13', '18:37:07', 1, 'Creacion de incidencia', '2019-08-13 18:37:07', '2019-08-13 18:37:07');
INSERT INTO `bitacoras` VALUES (194, 'incidencia', 31, 45, 2247, 'Se ha creado una incidencia', '2019-08-13', '18:40:23', 1, 'Creacion de incidencia', '2019-08-13 18:40:23', '2019-08-13 18:40:23');
INSERT INTO `bitacoras` VALUES (195, 'incidencia', 32, 45, 1784, 'Se ha creado una incidencia', '2019-08-13', '18:41:49', 1, 'Creacion de incidencia', '2019-08-13 18:41:49', '2019-08-13 18:41:49');
INSERT INTO `bitacoras` VALUES (196, 'incidencia', 33, 45, 1833, 'Se ha creado una incidencia', '2019-08-13', '18:43:29', 1, 'Creacion de incidencia', '2019-08-13 18:43:29', '2019-08-13 18:43:29');
INSERT INTO `bitacoras` VALUES (197, 'incidencia', 34, 45, 1735, 'Se ha creado una incidencia', '2019-08-13', '18:44:36', 1, 'Creacion de incidencia', '2019-08-13 18:44:36', '2019-08-13 18:44:36');
INSERT INTO `bitacoras` VALUES (198, 'incidencia', 35, 764, 2303, 'Se ha creado una incidencia', '2019-08-13', '18:45:39', 1, 'Creacion de incidencia', '2019-08-13 18:45:39', '2019-08-13 18:45:39');
INSERT INTO `bitacoras` VALUES (199, 'incidencia', 36, 45, 1901, 'Se ha creado una incidencia', '2019-08-13', '18:45:46', 1, 'Creacion de incidencia', '2019-08-13 18:45:46', '2019-08-13 18:45:46');
INSERT INTO `bitacoras` VALUES (200, 'incidencia', 37, 764, 2304, 'Se ha creado una incidencia', '2019-08-13', '18:48:40', 1, 'Creacion de incidencia', '2019-08-13 18:48:40', '2019-08-13 18:48:40');
INSERT INTO `bitacoras` VALUES (201, 'incidencia', 38, 764, 2305, 'Se ha creado una incidencia', '2019-08-13', '18:50:03', 1, 'Creacion de incidencia', '2019-08-13 18:50:03', '2019-08-13 18:50:03');
INSERT INTO `bitacoras` VALUES (202, 'incidencia', 39, 764, 2306, 'Se ha creado una incidencia', '2019-08-13', '18:51:35', 1, 'Creacion de incidencia', '2019-08-13 18:51:35', '2019-08-13 18:51:35');
INSERT INTO `bitacoras` VALUES (203, 'solicitud_alta', 43, 232, 0, 'Autorizar Solicitud', '2019-08-13', '18:52:15', 1, 'Autorizar solicitud', '2019-08-13 18:52:15', '2019-08-13 18:52:15');
INSERT INTO `bitacoras` VALUES (204, 'incidencia', 40, 764, 2307, 'Se ha creado una incidencia', '2019-08-13', '18:53:01', 1, 'Creacion de incidencia', '2019-08-13 18:53:01', '2019-08-13 18:53:01');
INSERT INTO `bitacoras` VALUES (205, 'incidencia', 41, 45, 776, 'Se ha creado una incidencia', '2019-08-13', '18:54:24', 1, 'Creacion de incidencia', '2019-08-13 18:54:24', '2019-08-13 18:54:24');
INSERT INTO `bitacoras` VALUES (206, 'incidencia', 42, 45, 1690, 'Se ha creado una incidencia', '2019-08-13', '18:56:40', 1, 'Creacion de incidencia', '2019-08-13 18:56:40', '2019-08-13 18:56:40');
INSERT INTO `bitacoras` VALUES (207, 'solicitud_alta', 43, 719, 0, 'Agendar cita de firma', '2019-08-13', '18:57:28', 1, 'CITA FIRMA', '2019-08-13 18:57:28', '2019-08-13 18:57:28');
INSERT INTO `bitacoras` VALUES (208, 'solicitud_alta', 44, 45, 0, 'Registro de solicitud', '2019-08-13', '19:05:25', 1, 'alta', '2019-08-13 19:05:25', '2019-08-13 19:05:25');
INSERT INTO `bitacoras` VALUES (209, 'incidencia', 43, 764, 2285, 'Se ha creado una incidencia', '2019-08-13', '20:10:48', 1, 'Creacion de incidencia', '2019-08-13 20:10:48', '2019-08-13 20:10:48');
INSERT INTO `bitacoras` VALUES (210, 'incidencia', 44, 764, 2286, 'Se ha creado una incidencia', '2019-08-13', '20:17:20', 1, 'Creacion de incidencia', '2019-08-13 20:17:20', '2019-08-13 20:17:20');
INSERT INTO `bitacoras` VALUES (211, 'incidencia', 45, 764, 1570, 'Se ha creado una incidencia', '2019-08-13', '20:22:58', 1, 'Creacion de incidencia', '2019-08-13 20:22:58', '2019-08-13 20:22:58');
INSERT INTO `bitacoras` VALUES (212, 'incidencia', 46, 764, 2144, 'Se ha creado una incidencia', '2019-08-13', '20:28:07', 1, 'Creacion de incidencia', '2019-08-13 20:28:07', '2019-08-13 20:28:07');
INSERT INTO `bitacoras` VALUES (213, 'incidencia', 47, 764, 1524, 'Se ha creado una incidencia', '2019-08-13', '20:30:02', 1, 'Creacion de incidencia', '2019-08-13 20:30:02', '2019-08-13 20:30:02');
INSERT INTO `bitacoras` VALUES (214, 'incidencia', 48, 764, 2047, 'Se ha creado una incidencia', '2019-08-13', '20:32:43', 1, 'Creacion de incidencia', '2019-08-13 20:32:43', '2019-08-13 20:32:43');
INSERT INTO `bitacoras` VALUES (215, 'incidencia', 49, 764, 1241, 'Se ha creado una incidencia', '2019-08-13', '20:34:46', 1, 'Creacion de incidencia', '2019-08-13 20:34:46', '2019-08-13 20:34:46');
INSERT INTO `bitacoras` VALUES (216, 'solicitud_alta', 44, 117, 0, 'Autorizar Solicitud', '2019-08-14', '14:11:47', 1, 'Autorizar solicitud', '2019-08-14 14:11:47', '2019-08-14 14:11:47');
INSERT INTO `bitacoras` VALUES (217, 'solicitud_alta', 44, 719, 0, 'Agendar cita de firma', '2019-08-14', '15:34:56', 1, 'CITA FIRMA', '2019-08-14 15:34:56', '2019-08-14 15:34:56');
INSERT INTO `bitacoras` VALUES (218, 'solicitud_alta', 43, 487, 0, 'Autorizar Solicitud', '2019-08-14', '16:44:46', 1, 'Autorizar computadora', '2019-08-14 16:44:46', '2019-08-14 16:44:46');
INSERT INTO `bitacoras` VALUES (219, 'solicitud_alta', 43, 744, 0, 'Autorizar Solicitud', '2019-08-14', '16:47:49', 1, 'Autorizar celular', '2019-08-14 16:47:49', '2019-08-14 16:47:49');
INSERT INTO `bitacoras` VALUES (220, 'incidencia', 50, 476, 2224, 'Se ha creado una incidencia', '2019-08-14', '18:10:56', 1, 'Creacion de incidencia', '2019-08-14 18:10:56', '2019-08-14 18:10:56');
INSERT INTO `bitacoras` VALUES (221, 'incidencia', 51, 476, 2219, 'Se ha creado una incidencia', '2019-08-14', '18:12:22', 1, 'Creacion de incidencia', '2019-08-14 18:12:22', '2019-08-14 18:12:22');
INSERT INTO `bitacoras` VALUES (222, 'incidencia', 52, 476, 2216, 'Se ha creado una incidencia', '2019-08-14', '18:13:04', 1, 'Creacion de incidencia', '2019-08-14 18:13:04', '2019-08-14 18:13:04');
INSERT INTO `bitacoras` VALUES (223, 'incidencia', 53, 476, 2218, 'Se ha creado una incidencia', '2019-08-14', '18:13:40', 1, 'Creacion de incidencia', '2019-08-14 18:13:40', '2019-08-14 18:13:40');
INSERT INTO `bitacoras` VALUES (224, 'incidencia', 54, 476, 2223, 'Se ha creado una incidencia', '2019-08-14', '18:14:16', 1, 'Creacion de incidencia', '2019-08-14 18:14:17', '2019-08-14 18:14:17');
INSERT INTO `bitacoras` VALUES (225, 'incidencia', 55, 476, 2234, 'Se ha creado una incidencia', '2019-08-14', '18:14:52', 1, 'Creacion de incidencia', '2019-08-14 18:14:52', '2019-08-14 18:14:52');
INSERT INTO `bitacoras` VALUES (226, 'incidencia', 56, 476, 2232, 'Se ha creado una incidencia', '2019-08-14', '18:15:45', 1, 'Creacion de incidencia', '2019-08-14 18:15:45', '2019-08-14 18:15:45');
INSERT INTO `bitacoras` VALUES (227, 'incidencia', 57, 476, 2226, 'Se ha creado una incidencia', '2019-08-14', '18:16:24', 1, 'Creacion de incidencia', '2019-08-14 18:16:24', '2019-08-14 18:16:24');
INSERT INTO `bitacoras` VALUES (228, 'incidencia', 58, 476, 2221, 'Se ha creado una incidencia', '2019-08-14', '18:17:44', 1, 'Creacion de incidencia', '2019-08-14 18:17:44', '2019-08-14 18:17:44');
INSERT INTO `bitacoras` VALUES (229, 'incidencia', 59, 476, 2217, 'Se ha creado una incidencia', '2019-08-14', '18:18:29', 1, 'Creacion de incidencia', '2019-08-14 18:18:29', '2019-08-14 18:18:29');
INSERT INTO `bitacoras` VALUES (230, 'incidencia', 60, 476, 2220, 'Se ha creado una incidencia', '2019-08-14', '18:19:03', 1, 'Creacion de incidencia', '2019-08-14 18:19:03', '2019-08-14 18:19:03');
INSERT INTO `bitacoras` VALUES (231, 'incidencia', 61, 476, 2233, 'Se ha creado una incidencia', '2019-08-14', '18:19:36', 1, 'Creacion de incidencia', '2019-08-14 18:19:36', '2019-08-14 18:19:36');
INSERT INTO `bitacoras` VALUES (232, 'solicitud_alta', 39, 448, 0, 'Agendar cita de firma', '2019-08-15', '09:43:25', 1, 'CITA FIRMA', '2019-08-15 09:43:25', '2019-08-15 09:43:25');
INSERT INTO `bitacoras` VALUES (233, 'solicitud_alta', 45, 761, 0, 'Registro de solicitud', '2019-08-15', '13:43:35', 1, 'alta', '2019-08-15 13:43:35', '2019-08-15 13:43:35');
INSERT INTO `bitacoras` VALUES (234, 'solicitud_alta', 45, 232, 0, 'Autorizar Solicitud', '2019-08-15', '13:47:45', 1, 'Autorizar solicitud', '2019-08-15 13:47:45', '2019-08-15 13:47:45');
INSERT INTO `bitacoras` VALUES (235, 'solicitud_alta', 46, 799, 0, 'Registro de solicitud', '2019-08-15', '14:46:31', 1, 'alta', '2019-08-15 14:46:31', '2019-08-15 14:46:31');
INSERT INTO `bitacoras` VALUES (236, 'solicitud_alta', 47, 799, 0, 'Registro de solicitud', '2019-08-15', '14:50:08', 1, 'alta', '2019-08-15 14:50:08', '2019-08-15 14:50:08');
INSERT INTO `bitacoras` VALUES (237, 'solicitud_alta', 48, 81, 0, 'Registro de solicitud', '2019-08-15', '17:56:58', 1, 'alta', '2019-08-15 17:56:58', '2019-08-15 17:56:58');
INSERT INTO `bitacoras` VALUES (238, 'solicitud_alta', 48, 117, 0, 'Autorizar Solicitud', '2019-08-15', '20:33:42', 1, 'Autorizar solicitud por Direccion', '2019-08-15 20:33:42', '2019-08-15 20:33:42');
INSERT INTO `bitacoras` VALUES (239, 'solicitud_alta', 39, 744, 0, 'Autorizar Solicitud', '2019-08-16', '11:23:57', 1, 'Autorizar celular', '2019-08-16 11:23:57', '2019-08-16 11:23:57');
INSERT INTO `bitacoras` VALUES (240, 'solicitud_alta', 44, 731, 0, 'Autorizar Solicitud', '2019-08-16', '11:45:36', 1, 'Autorizar computadora', '2019-08-16 11:45:36', '2019-08-16 11:45:36');
INSERT INTO `bitacoras` VALUES (241, 'solicitud_alta', 39, 731, 0, 'Autorizar Solicitud', '2019-08-16', '11:52:50', 1, 'Autorizar computadora', '2019-08-16 11:52:50', '2019-08-16 11:52:50');
INSERT INTO `bitacoras` VALUES (242, 'solicitud_alta', 48, 719, 0, 'Agendar cita de firma', '2019-08-16', '12:12:59', 1, 'CITA FIRMA', '2019-08-16 12:12:59', '2019-08-16 12:12:59');
INSERT INTO `bitacoras` VALUES (243, 'solicitud_alta', 48, 719, 0, 'Agendar cita de firma', '2019-08-16', '12:13:55', 1, 'CITA FIRMA', '2019-08-16 12:13:55', '2019-08-16 12:13:55');
INSERT INTO `bitacoras` VALUES (244, 'solicitud_alta', 37, 487, 0, 'Autorizar Solicitud', '2019-08-19', '10:52:50', 1, 'Autorizar computadora', '2019-08-19 10:52:50', '2019-08-19 10:52:50');
INSERT INTO `bitacoras` VALUES (245, 'solicitud_alta', 48, 744, 0, 'Autorizar Solicitud', '2019-08-19', '12:56:57', 1, 'Autorizar celular', '2019-08-19 12:56:57', '2019-08-19 12:56:57');
INSERT INTO `bitacoras` VALUES (246, 'incidencia', 62, 764, 2152, 'Se ha creado una incidencia', '2019-08-19', '14:53:32', 1, 'Creacion de incidencia', '2019-08-19 14:53:32', '2019-08-19 14:53:32');
INSERT INTO `bitacoras` VALUES (247, 'solicitud_alta', 49, 799, 0, 'Registro de solicitud', '2019-08-19', '15:55:10', 1, 'alta', '2019-08-19 15:55:10', '2019-08-19 15:55:10');
INSERT INTO `bitacoras` VALUES (248, 'incidencia', 63, 764, 2250, 'Se ha creado una incidencia', '2019-08-19', '16:11:38', 1, 'Creacion de incidencia', '2019-08-19 16:11:38', '2019-08-19 16:11:38');
INSERT INTO `bitacoras` VALUES (249, 'incidencia', 64, 764, 2250, 'Se ha creado una incidencia', '2019-08-19', '16:11:38', 1, 'Creacion de incidencia', '2019-08-19 16:11:38', '2019-08-19 16:11:38');
INSERT INTO `bitacoras` VALUES (250, 'incidencia', 65, 764, 2249, 'Se ha creado una incidencia', '2019-08-19', '16:13:26', 1, 'Creacion de incidencia', '2019-08-19 16:13:26', '2019-08-19 16:13:26');
INSERT INTO `bitacoras` VALUES (251, 'incidencia', 66, 764, 2252, 'Se ha creado una incidencia', '2019-08-19', '16:15:08', 1, 'Creacion de incidencia', '2019-08-19 16:15:08', '2019-08-19 16:15:08');
INSERT INTO `bitacoras` VALUES (252, 'incidencia', 67, 764, 505, 'Se ha creado una incidencia', '2019-08-19', '16:15:59', 1, 'Creacion de incidencia', '2019-08-19 16:15:59', '2019-08-19 16:15:59');
INSERT INTO `bitacoras` VALUES (253, 'incidencia', 68, 764, 2291, 'Se ha creado una incidencia', '2019-08-19', '16:17:12', 1, 'Creacion de incidencia', '2019-08-19 16:17:12', '2019-08-19 16:17:12');
INSERT INTO `bitacoras` VALUES (254, 'solicitud_alta', 50, 44, 0, 'Registro de solicitud', '2019-08-19', '18:22:56', 1, 'alta', '2019-08-19 18:22:56', '2019-08-19 18:22:56');
INSERT INTO `bitacoras` VALUES (255, 'solicitud_alta', 51, 44, 0, 'Registro de solicitud', '2019-08-19', '18:37:33', 1, 'alta', '2019-08-19 18:37:33', '2019-08-19 18:37:33');
INSERT INTO `bitacoras` VALUES (256, 'solicitud_alta', 46, 86, 0, 'Autorizar Solicitud', '2019-08-20', '11:05:37', 1, 'Autorizar solicitud', '2019-08-20 11:05:37', '2019-08-20 11:05:37');
INSERT INTO `bitacoras` VALUES (257, 'solicitud_alta', 47, 86, 0, 'Autorizar Solicitud', '2019-08-20', '11:05:58', 1, 'Autorizar solicitud', '2019-08-20 11:05:58', '2019-08-20 11:05:58');
INSERT INTO `bitacoras` VALUES (258, 'solicitud_alta', 49, 86, 0, 'Autorizar Solicitud', '2019-08-20', '11:06:18', 1, 'Autorizar solicitud', '2019-08-20 11:06:18', '2019-08-20 11:06:18');
INSERT INTO `bitacoras` VALUES (259, 'solicitud_alta', 50, 86, 0, 'Autorizar Solicitud', '2019-08-20', '11:06:50', 1, 'Autorizar solicitud', '2019-08-20 11:06:50', '2019-08-20 11:06:50');
INSERT INTO `bitacoras` VALUES (260, 'solicitud_alta', 51, 86, 0, 'Autorizar Solicitud', '2019-08-20', '11:07:05', 1, 'Autorizar solicitud', '2019-08-20 11:07:05', '2019-08-20 11:07:05');
INSERT INTO `bitacoras` VALUES (261, 'solicitud_alta', 50, 517, 0, 'Agendar cita de firma', '2019-08-20', '12:32:05', 1, 'CITA FIRMA', '2019-08-20 12:32:05', '2019-08-20 12:32:05');
INSERT INTO `bitacoras` VALUES (262, 'solicitud_alta', 48, 731, 0, 'Autorizar Solicitud', '2019-08-20', '12:49:29', 1, 'Autorizar computadora', '2019-08-20 12:49:29', '2019-08-20 12:49:29');
INSERT INTO `bitacoras` VALUES (263, 'solicitud_alta', 47, 719, 0, 'Agendar cita de firma', '2019-08-20', '13:02:07', 1, 'CITA FIRMA', '2019-08-20 13:02:07', '2019-08-20 13:02:07');
INSERT INTO `bitacoras` VALUES (264, 'solicitud_alta', 46, 719, 0, 'Agendar cita de firma', '2019-08-20', '13:02:49', 1, 'CITA FIRMA', '2019-08-20 13:02:49', '2019-08-20 13:02:49');
INSERT INTO `bitacoras` VALUES (265, 'solicitud_alta', 45, 517, 0, 'Agendar cita de firma', '2019-08-21', '09:41:40', 1, 'CITA FIRMA', '2019-08-21 09:41:40', '2019-08-21 09:41:40');
INSERT INTO `bitacoras` VALUES (266, 'solicitud_alta', 47, 794, 0, 'Autorizar Solicitud', '2019-08-21', '17:45:56', 1, 'Autorizar firmado', '2019-08-21 17:45:56', '2019-08-21 17:45:56');
INSERT INTO `bitacoras` VALUES (267, 'solicitud_alta', 46, 794, 0, 'Autorizar Solicitud', '2019-08-21', '17:46:31', 1, 'Autorizar firmado', '2019-08-21 17:46:31', '2019-08-21 17:46:31');
INSERT INTO `bitacoras` VALUES (268, 'solicitud_alta', 45, 744, 0, 'Autorizar Solicitud', '2019-08-21', '18:15:46', 1, 'Autorizar celular', '2019-08-21 18:15:46', '2019-08-21 18:15:46');
INSERT INTO `bitacoras` VALUES (269, 'solicitud_alta', 52, 44, 0, 'Registro de solicitud', '2019-08-22', '03:16:14', 1, 'alta', '2019-08-22 03:16:14', '2019-08-22 03:16:14');
INSERT INTO `bitacoras` VALUES (270, 'solicitud_alta', 52, 86, 0, 'Autorizar Solicitud', '2019-08-22', '09:47:17', 1, 'Autorizar solicitud por Direccion', '2019-08-22 09:47:17', '2019-08-22 09:47:17');
INSERT INTO `bitacoras` VALUES (271, 'solicitud_alta', 52, 517, 0, 'Agendar cita de firma', '2019-08-22', '09:48:57', 1, 'CITA FIRMA', '2019-08-22 09:48:57', '2019-08-22 09:48:57');
INSERT INTO `bitacoras` VALUES (272, 'solicitud_alta', 53, 761, 0, 'Registro de solicitud', '2019-08-22', '11:32:53', 1, 'alta', '2019-08-22 11:32:53', '2019-08-22 11:32:53');
INSERT INTO `bitacoras` VALUES (273, 'solicitud_alta', 53, 232, 0, 'Autorizar Solicitud', '2019-08-22', '11:33:51', 1, 'Autorizar solicitud', '2019-08-22 11:33:51', '2019-08-22 11:33:51');
INSERT INTO `bitacoras` VALUES (274, 'solicitud_alta', 54, 250, 0, 'Registro de solicitud', '2019-08-22', '14:23:58', 1, 'alta', '2019-08-22 14:23:58', '2019-08-22 14:23:58');
INSERT INTO `bitacoras` VALUES (275, 'solicitud_alta', 55, 448, 0, 'Registro de solicitud', '2019-08-22', '16:19:48', 1, 'alta', '2019-08-22 16:19:48', '2019-08-22 16:19:48');
INSERT INTO `bitacoras` VALUES (276, 'solicitud_alta', 55, 117, 0, 'Autorizar Solicitud', '2019-08-22', '16:22:38', 1, 'Autorizar solicitud', '2019-08-22 16:22:38', '2019-08-22 16:22:38');
INSERT INTO `bitacoras` VALUES (277, 'solicitud_alta', 49, 448, 0, 'Autorizar Solicitud', '2019-08-22', '16:43:58', 1, 'Cancelar solicitud por Direccion', '2019-08-22 16:43:58', '2019-08-22 16:43:58');
INSERT INTO `bitacoras` VALUES (278, 'solicitud_alta', 56, 81, 0, 'Registro de solicitud', '2019-08-22', '18:06:35', 1, 'alta', '2019-08-22 18:06:35', '2019-08-22 18:06:35');
INSERT INTO `bitacoras` VALUES (279, 'solicitud_alta', 40, 86, 0, 'Autorizar Solicitud', '2019-08-22', '18:10:38', 1, 'Autorizar solicitud', '2019-08-22 18:10:38', '2019-08-22 18:10:38');
INSERT INTO `bitacoras` VALUES (280, 'solicitud_alta', 55, 719, 0, 'Agendar cita de firma', '2019-08-22', '18:15:21', 1, 'CITA FIRMA', '2019-08-22 18:15:21', '2019-08-22 18:15:21');
INSERT INTO `bitacoras` VALUES (281, 'solicitud_alta', 40, 719, 0, 'Agendar cita de firma', '2019-08-22', '18:25:01', 1, 'CITA FIRMA', '2019-08-22 18:25:01', '2019-08-22 18:25:01');
INSERT INTO `bitacoras` VALUES (282, 'solicitud_alta', 56, 117, 0, 'Autorizar Solicitud', '2019-08-22', '18:31:07', 1, 'Autorizar solicitud por Direccion', '2019-08-22 18:31:07', '2019-08-22 18:31:07');
INSERT INTO `bitacoras` VALUES (283, 'solicitud_alta', 57, 44, 0, 'Registro de solicitud', '2019-08-22', '18:37:26', 1, 'alta', '2019-08-22 18:37:26', '2019-08-22 18:37:26');
INSERT INTO `bitacoras` VALUES (284, 'solicitud_alta', 57, 86, 0, 'Autorizar Solicitud', '2019-08-22', '18:37:54', 1, 'Autorizar solicitud', '2019-08-22 18:37:54', '2019-08-22 18:37:54');
INSERT INTO `bitacoras` VALUES (285, 'solicitud_alta', 58, 44, 0, 'Registro de solicitud', '2019-08-22', '18:40:30', 1, 'alta', '2019-08-22 18:40:30', '2019-08-22 18:40:30');
INSERT INTO `bitacoras` VALUES (286, 'solicitud_alta', 58, 86, 0, 'Autorizar Solicitud', '2019-08-22', '18:40:43', 1, 'Autorizar solicitud', '2019-08-22 18:40:43', '2019-08-22 18:40:43');
INSERT INTO `bitacoras` VALUES (287, 'solicitud_alta', 56, 517, 0, 'Agendar cita de firma', '2019-08-22', '18:54:32', 1, 'CITA FIRMA', '2019-08-22 18:54:32', '2019-08-22 18:54:32');
INSERT INTO `bitacoras` VALUES (288, 'solicitud_alta', 59, 761, 0, 'Registro de solicitud', '2019-08-23', '14:13:47', 1, 'alta', '2019-08-23 14:13:47', '2019-08-23 14:13:47');
INSERT INTO `bitacoras` VALUES (289, 'solicitud_alta', 53, 719, 0, 'Agendar cita de firma', '2019-08-23', '14:48:56', 1, 'CITA FIRMA', '2019-08-23 14:48:56', '2019-08-23 14:48:56');
INSERT INTO `bitacoras` VALUES (290, 'solicitud_alta', 58, 719, 0, 'Agendar cita de firma', '2019-08-23', '14:52:02', 1, 'CITA FIRMA', '2019-08-23 14:52:02', '2019-08-23 14:52:02');
INSERT INTO `bitacoras` VALUES (291, 'solicitud_alta', 57, 719, 0, 'Autorizar Solicitud', '2019-08-23', '14:52:17', 1, 'Cancelar solicitud por Direccion', '2019-08-23 14:52:17', '2019-08-23 14:52:17');
INSERT INTO `bitacoras` VALUES (292, 'solicitud_alta', 59, 232, 0, 'Autorizar Solicitud', '2019-08-23', '15:12:04', 1, 'Autorizar solicitud', '2019-08-23 15:12:04', '2019-08-23 15:12:04');
INSERT INTO `bitacoras` VALUES (293, 'solicitud_alta', 59, 719, 0, 'Agendar cita de firma', '2019-08-26', '10:25:48', 1, 'CITA FIRMA', '2019-08-26 10:25:48', '2019-08-26 10:25:48');
INSERT INTO `bitacoras` VALUES (294, 'solicitud_alta', 54, 117, 0, 'Autorizar Solicitud', '2019-08-26', '11:17:50', 1, 'Autorizar solicitud', '2019-08-26 11:17:50', '2019-08-26 11:17:50');
INSERT INTO `bitacoras` VALUES (295, 'solicitud_alta', 54, 719, 0, 'Agendar cita de firma', '2019-08-26', '11:21:16', 1, 'CITA FIRMA', '2019-08-26 11:21:16', '2019-08-26 11:21:16');
INSERT INTO `bitacoras` VALUES (296, 'solicitud_alta', 59, 536, 0, 'Autorizar Solicitud', '2019-08-26', '14:01:45', 1, 'Autorizar computadora', '2019-08-26 14:01:45', '2019-08-26 14:01:45');
INSERT INTO `bitacoras` VALUES (297, 'incidencia', 68, 750, 2291, 'La incidencia paso a ser: autorizar', '2019-08-27', '09:54:26', 1, 'autorizar', '2019-08-27 09:54:26', '2019-08-27 09:54:26');
INSERT INTO `bitacoras` VALUES (298, 'incidencia', 67, 750, 505, 'La incidencia paso a ser: autorizar', '2019-08-27', '09:54:27', 1, 'autorizar', '2019-08-27 09:54:27', '2019-08-27 09:54:27');
INSERT INTO `bitacoras` VALUES (299, 'incidencia', 66, 750, 2252, 'La incidencia paso a ser: autorizar', '2019-08-27', '09:54:27', 1, 'autorizar', '2019-08-27 09:54:27', '2019-08-27 09:54:27');
INSERT INTO `bitacoras` VALUES (300, 'incidencia', 65, 750, 2249, 'La incidencia paso a ser: autorizar', '2019-08-27', '09:54:27', 1, 'autorizar', '2019-08-27 09:54:27', '2019-08-27 09:54:27');
INSERT INTO `bitacoras` VALUES (301, 'incidencia', 63, 750, 2250, 'La incidencia paso a ser: autorizar', '2019-08-27', '09:54:27', 1, 'autorizar', '2019-08-27 09:54:27', '2019-08-27 09:54:27');
INSERT INTO `bitacoras` VALUES (302, 'incidencia', 62, 750, 2152, 'La incidencia paso a ser: autorizar', '2019-08-27', '09:54:27', 1, 'autorizar', '2019-08-27 09:54:27', '2019-08-27 09:54:27');
INSERT INTO `bitacoras` VALUES (303, 'incidencia', 61, 750, 2233, 'La incidencia paso a ser: autorizar', '2019-08-27', '09:54:27', 1, 'autorizar', '2019-08-27 09:54:27', '2019-08-27 09:54:27');
INSERT INTO `bitacoras` VALUES (304, 'incidencia', 60, 750, 2220, 'La incidencia paso a ser: autorizar', '2019-08-27', '09:54:27', 1, 'autorizar', '2019-08-27 09:54:27', '2019-08-27 09:54:27');
INSERT INTO `bitacoras` VALUES (305, 'incidencia', 59, 750, 2217, 'La incidencia paso a ser: autorizar', '2019-08-27', '09:54:27', 1, 'autorizar', '2019-08-27 09:54:27', '2019-08-27 09:54:27');
INSERT INTO `bitacoras` VALUES (306, 'incidencia', 58, 750, 2221, 'La incidencia paso a ser: autorizar', '2019-08-27', '09:54:28', 1, 'autorizar', '2019-08-27 09:54:28', '2019-08-27 09:54:28');
INSERT INTO `bitacoras` VALUES (307, 'incidencia', 57, 750, 2226, 'La incidencia paso a ser: autorizar', '2019-08-27', '09:54:28', 1, 'autorizar', '2019-08-27 09:54:28', '2019-08-27 09:54:28');
INSERT INTO `bitacoras` VALUES (308, 'incidencia', 56, 750, 2232, 'La incidencia paso a ser: autorizar', '2019-08-27', '09:54:28', 1, 'autorizar', '2019-08-27 09:54:28', '2019-08-27 09:54:28');
INSERT INTO `bitacoras` VALUES (309, 'incidencia', 55, 750, 2234, 'La incidencia paso a ser: autorizar', '2019-08-27', '09:54:28', 1, 'autorizar', '2019-08-27 09:54:28', '2019-08-27 09:54:28');
INSERT INTO `bitacoras` VALUES (310, 'incidencia', 54, 750, 2223, 'La incidencia paso a ser: autorizar', '2019-08-27', '09:54:28', 1, 'autorizar', '2019-08-27 09:54:28', '2019-08-27 09:54:28');
INSERT INTO `bitacoras` VALUES (311, 'incidencia', 53, 750, 2218, 'La incidencia paso a ser: autorizar', '2019-08-27', '09:54:28', 1, 'autorizar', '2019-08-27 09:54:28', '2019-08-27 09:54:28');
INSERT INTO `bitacoras` VALUES (312, 'incidencia', 52, 750, 2216, 'La incidencia paso a ser: autorizar', '2019-08-27', '09:54:28', 1, 'autorizar', '2019-08-27 09:54:28', '2019-08-27 09:54:28');
INSERT INTO `bitacoras` VALUES (313, 'incidencia', 51, 750, 2219, 'La incidencia paso a ser: autorizar', '2019-08-27', '09:54:28', 1, 'autorizar', '2019-08-27 09:54:28', '2019-08-27 09:54:28');
INSERT INTO `bitacoras` VALUES (314, 'incidencia', 50, 750, 2224, 'La incidencia paso a ser: autorizar', '2019-08-27', '09:54:29', 1, 'autorizar', '2019-08-27 09:54:29', '2019-08-27 09:54:29');
INSERT INTO `bitacoras` VALUES (315, 'incidencia', 49, 750, 1241, 'La incidencia paso a ser: autorizar', '2019-08-27', '09:54:29', 1, 'autorizar', '2019-08-27 09:54:29', '2019-08-27 09:54:29');
INSERT INTO `bitacoras` VALUES (316, 'incidencia', 48, 750, 2047, 'La incidencia paso a ser: autorizar', '2019-08-27', '09:54:29', 1, 'autorizar', '2019-08-27 09:54:29', '2019-08-27 09:54:29');
INSERT INTO `bitacoras` VALUES (317, 'incidencia', 47, 750, 1524, 'La incidencia paso a ser: autorizar', '2019-08-27', '09:54:29', 1, 'autorizar', '2019-08-27 09:54:29', '2019-08-27 09:54:29');
INSERT INTO `bitacoras` VALUES (318, 'incidencia', 46, 750, 2144, 'La incidencia paso a ser: autorizar', '2019-08-27', '09:54:29', 1, 'autorizar', '2019-08-27 09:54:29', '2019-08-27 09:54:29');
INSERT INTO `bitacoras` VALUES (319, 'incidencia', 45, 750, 1570, 'La incidencia paso a ser: autorizar', '2019-08-27', '09:54:29', 1, 'autorizar', '2019-08-27 09:54:29', '2019-08-27 09:54:29');
INSERT INTO `bitacoras` VALUES (320, 'incidencia', 44, 750, 2286, 'La incidencia paso a ser: autorizar', '2019-08-27', '09:54:29', 1, 'autorizar', '2019-08-27 09:54:29', '2019-08-27 09:54:29');
INSERT INTO `bitacoras` VALUES (321, 'incidencia', 43, 750, 2285, 'La incidencia paso a ser: autorizar', '2019-08-27', '09:54:29', 1, 'autorizar', '2019-08-27 09:54:29', '2019-08-27 09:54:29');
INSERT INTO `bitacoras` VALUES (322, 'incidencia', 42, 750, 1690, 'La incidencia paso a ser: autorizar', '2019-08-27', '09:54:29', 1, 'autorizar', '2019-08-27 09:54:29', '2019-08-27 09:54:29');
INSERT INTO `bitacoras` VALUES (323, 'incidencia', 41, 750, 776, 'La incidencia paso a ser: autorizar', '2019-08-27', '09:54:30', 1, 'autorizar', '2019-08-27 09:54:30', '2019-08-27 09:54:30');
INSERT INTO `bitacoras` VALUES (324, 'incidencia', 40, 750, 2307, 'La incidencia paso a ser: autorizar', '2019-08-27', '09:54:30', 1, 'autorizar', '2019-08-27 09:54:30', '2019-08-27 09:54:30');
INSERT INTO `bitacoras` VALUES (325, 'incidencia', 39, 750, 2306, 'La incidencia paso a ser: autorizar', '2019-08-27', '09:54:30', 1, 'autorizar', '2019-08-27 09:54:30', '2019-08-27 09:54:30');
INSERT INTO `bitacoras` VALUES (326, 'incidencia', 38, 750, 2305, 'La incidencia paso a ser: autorizar', '2019-08-27', '09:54:30', 1, 'autorizar', '2019-08-27 09:54:30', '2019-08-27 09:54:30');
INSERT INTO `bitacoras` VALUES (327, 'incidencia', 37, 750, 2304, 'La incidencia paso a ser: autorizar', '2019-08-27', '09:54:30', 1, 'autorizar', '2019-08-27 09:54:30', '2019-08-27 09:54:30');
INSERT INTO `bitacoras` VALUES (328, 'incidencia', 36, 750, 1901, 'La incidencia paso a ser: autorizar', '2019-08-27', '09:54:30', 1, 'autorizar', '2019-08-27 09:54:30', '2019-08-27 09:54:30');
INSERT INTO `bitacoras` VALUES (329, 'incidencia', 35, 750, 2303, 'La incidencia paso a ser: autorizar', '2019-08-27', '09:54:30', 1, 'autorizar', '2019-08-27 09:54:30', '2019-08-27 09:54:30');
INSERT INTO `bitacoras` VALUES (330, 'incidencia', 34, 750, 1735, 'La incidencia paso a ser: autorizar', '2019-08-27', '09:54:30', 1, 'autorizar', '2019-08-27 09:54:30', '2019-08-27 09:54:30');
INSERT INTO `bitacoras` VALUES (331, 'incidencia', 33, 750, 1833, 'La incidencia paso a ser: autorizar', '2019-08-27', '09:54:31', 1, 'autorizar', '2019-08-27 09:54:31', '2019-08-27 09:54:31');
INSERT INTO `bitacoras` VALUES (332, 'incidencia', 32, 750, 1784, 'La incidencia paso a ser: autorizar', '2019-08-27', '09:54:31', 1, 'autorizar', '2019-08-27 09:54:31', '2019-08-27 09:54:31');
INSERT INTO `bitacoras` VALUES (333, 'incidencia', 31, 750, 2247, 'La incidencia paso a ser: autorizar', '2019-08-27', '09:54:31', 1, 'autorizar', '2019-08-27 09:54:31', '2019-08-27 09:54:31');
INSERT INTO `bitacoras` VALUES (334, 'incidencia', 30, 750, 1711, 'La incidencia paso a ser: autorizar', '2019-08-27', '09:54:31', 1, 'autorizar', '2019-08-27 09:54:31', '2019-08-27 09:54:31');
INSERT INTO `bitacoras` VALUES (335, 'incidencia', 29, 750, 1883, 'La incidencia paso a ser: autorizar', '2019-08-27', '09:54:31', 1, 'autorizar', '2019-08-27 09:54:31', '2019-08-27 09:54:31');
INSERT INTO `bitacoras` VALUES (336, 'incidencia', 28, 750, 1841, 'La incidencia paso a ser: autorizar', '2019-08-27', '09:54:31', 1, 'autorizar', '2019-08-27 09:54:31', '2019-08-27 09:54:31');
INSERT INTO `bitacoras` VALUES (337, 'incidencia', 27, 750, 2041, 'La incidencia paso a ser: autorizar', '2019-08-27', '09:54:31', 1, 'autorizar', '2019-08-27 09:54:31', '2019-08-27 09:54:31');
INSERT INTO `bitacoras` VALUES (338, 'incidencia', 26, 750, 1837, 'La incidencia paso a ser: autorizar', '2019-08-27', '09:54:31', 1, 'autorizar', '2019-08-27 09:54:31', '2019-08-27 09:54:31');
INSERT INTO `bitacoras` VALUES (339, 'incidencia', 25, 750, 2153, 'La incidencia paso a ser: autorizar', '2019-08-27', '09:54:32', 1, 'autorizar', '2019-08-27 09:54:32', '2019-08-27 09:54:32');
INSERT INTO `bitacoras` VALUES (340, 'incidencia', 24, 750, 2074, 'La incidencia paso a ser: autorizar', '2019-08-27', '09:54:32', 1, 'autorizar', '2019-08-27 09:54:32', '2019-08-27 09:54:32');
INSERT INTO `bitacoras` VALUES (341, 'incidencia', 23, 750, 1836, 'La incidencia paso a ser: autorizar', '2019-08-27', '09:54:32', 1, 'autorizar', '2019-08-27 09:54:32', '2019-08-27 09:54:32');
INSERT INTO `bitacoras` VALUES (342, 'incidencia', 22, 750, 2156, 'La incidencia paso a ser: autorizar', '2019-08-27', '09:54:32', 1, 'autorizar', '2019-08-27 09:54:32', '2019-08-27 09:54:32');
INSERT INTO `bitacoras` VALUES (343, 'incidencia', 21, 750, 1778, 'La incidencia paso a ser: autorizar', '2019-08-27', '09:54:32', 1, 'autorizar', '2019-08-27 09:54:32', '2019-08-27 09:54:32');
INSERT INTO `bitacoras` VALUES (344, 'incidencia', 20, 750, 2134, 'La incidencia paso a ser: autorizar', '2019-08-27', '09:54:32', 1, 'autorizar', '2019-08-27 09:54:32', '2019-08-27 09:54:32');
INSERT INTO `bitacoras` VALUES (345, 'incidencia', 19, 750, 2260, 'La incidencia paso a ser: autorizar', '2019-08-27', '09:54:32', 1, 'autorizar', '2019-08-27 09:54:32', '2019-08-27 09:54:32');
INSERT INTO `bitacoras` VALUES (346, 'incidencia', 18, 750, 2287, 'La incidencia paso a ser: autorizar', '2019-08-27', '09:54:32', 1, 'autorizar', '2019-08-27 09:54:32', '2019-08-27 09:54:32');
INSERT INTO `bitacoras` VALUES (347, 'incidencia', 17, 750, 1880, 'La incidencia paso a ser: autorizar', '2019-08-27', '09:54:33', 1, 'autorizar', '2019-08-27 09:54:33', '2019-08-27 09:54:33');
INSERT INTO `bitacoras` VALUES (348, 'incidencia', 16, 750, 1843, 'La incidencia paso a ser: autorizar', '2019-08-27', '09:54:33', 1, 'autorizar', '2019-08-27 09:54:33', '2019-08-27 09:54:33');
INSERT INTO `bitacoras` VALUES (349, 'incidencia', 15, 750, 1946, 'La incidencia paso a ser: autorizar', '2019-08-27', '09:54:33', 1, 'autorizar', '2019-08-27 09:54:33', '2019-08-27 09:54:33');
INSERT INTO `bitacoras` VALUES (350, 'incidencia', 14, 750, 1959, 'La incidencia paso a ser: autorizar', '2019-08-27', '09:54:33', 1, 'autorizar', '2019-08-27 09:54:33', '2019-08-27 09:54:33');
INSERT INTO `bitacoras` VALUES (351, 'incidencia', 13, 750, 2181, 'La incidencia paso a ser: autorizar', '2019-08-27', '09:54:33', 1, 'autorizar', '2019-08-27 09:54:33', '2019-08-27 09:54:33');
INSERT INTO `bitacoras` VALUES (352, 'incidencia', 12, 750, 2060, 'La incidencia paso a ser: autorizar', '2019-08-27', '09:54:33', 1, 'autorizar', '2019-08-27 09:54:33', '2019-08-27 09:54:33');
INSERT INTO `bitacoras` VALUES (353, 'incidencia', 11, 750, 2181, 'La incidencia paso a ser: autorizar', '2019-08-27', '09:54:33', 1, 'autorizar', '2019-08-27 09:54:33', '2019-08-27 09:54:33');
INSERT INTO `bitacoras` VALUES (354, 'incidencia', 10, 750, 1279, 'La incidencia paso a ser: autorizar', '2019-08-27', '09:54:33', 1, 'autorizar', '2019-08-27 09:54:33', '2019-08-27 09:54:33');
INSERT INTO `bitacoras` VALUES (355, 'incidencia', 9, 750, 1167, 'La incidencia paso a ser: autorizar', '2019-08-27', '09:54:34', 1, 'autorizar', '2019-08-27 09:54:34', '2019-08-27 09:54:34');
INSERT INTO `bitacoras` VALUES (356, 'incidencia', 8, 750, 936, 'La incidencia paso a ser: autorizar', '2019-08-27', '09:54:34', 1, 'autorizar', '2019-08-27 09:54:34', '2019-08-27 09:54:34');
INSERT INTO `bitacoras` VALUES (357, 'incidencia', 7, 750, 1570, 'La incidencia paso a ser: autorizar', '2019-08-27', '09:54:34', 1, 'autorizar', '2019-08-27 09:54:34', '2019-08-27 09:54:34');
INSERT INTO `bitacoras` VALUES (358, 'incidencia', 6, 750, 2177, 'La incidencia paso a ser: autorizar', '2019-08-27', '09:54:34', 1, 'autorizar', '2019-08-27 09:54:34', '2019-08-27 09:54:34');
INSERT INTO `bitacoras` VALUES (359, 'incidencia', 5, 750, 850, 'La incidencia paso a ser: autorizar', '2019-08-27', '09:54:34', 1, 'autorizar', '2019-08-27 09:54:34', '2019-08-27 09:54:34');
INSERT INTO `bitacoras` VALUES (360, 'incidencia', 4, 750, 1524, 'La incidencia paso a ser: autorizar', '2019-08-27', '09:54:34', 1, 'autorizar', '2019-08-27 09:54:34', '2019-08-27 09:54:34');
INSERT INTO `bitacoras` VALUES (361, 'incidencia', 3, 750, 1337, 'La incidencia paso a ser: autorizar', '2019-08-27', '09:54:34', 1, 'autorizar', '2019-08-27 09:54:34', '2019-08-27 09:54:34');
INSERT INTO `bitacoras` VALUES (362, 'incidencia', 2, 750, 2308, 'La incidencia paso a ser: autorizar', '2019-08-27', '09:54:34', 1, 'autorizar', '2019-08-27 09:54:34', '2019-08-27 09:54:34');
INSERT INTO `bitacoras` VALUES (363, 'incidencia', 1, 750, 1240, 'La incidencia paso a ser: autorizar', '2019-08-27', '09:54:35', 1, 'autorizar', '2019-08-27 09:54:35', '2019-08-27 09:54:35');
INSERT INTO `bitacoras` VALUES (364, 'incidencia', 69, 764, 677, 'Se ha creado una incidencia', '2019-08-27', '12:31:13', 1, 'Creacion de incidencia', '2019-08-27 12:31:13', '2019-08-27 12:31:13');
INSERT INTO `bitacoras` VALUES (365, 'incidencia', 70, 764, 2335, 'Se ha creado una incidencia', '2019-08-27', '12:33:15', 1, 'Creacion de incidencia', '2019-08-27 12:33:15', '2019-08-27 12:33:15');
INSERT INTO `bitacoras` VALUES (366, 'incidencia', 71, 764, 576, 'Se ha creado una incidencia', '2019-08-27', '12:34:30', 1, 'Creacion de incidencia', '2019-08-27 12:34:30', '2019-08-27 12:34:30');
INSERT INTO `bitacoras` VALUES (367, 'incidencia', 72, 764, 1698, 'Se ha creado una incidencia', '2019-08-27', '12:36:37', 1, 'Creacion de incidencia', '2019-08-27 12:36:37', '2019-08-27 12:36:37');
INSERT INTO `bitacoras` VALUES (368, 'incidencia', 73, 764, 2041, 'Se ha creado una incidencia', '2019-08-27', '12:37:57', 1, 'Creacion de incidencia', '2019-08-27 12:37:57', '2019-08-27 12:37:57');
INSERT INTO `bitacoras` VALUES (369, 'incidencia', 74, 764, 1878, 'Se ha creado una incidencia', '2019-08-27', '12:38:58', 1, 'Creacion de incidencia', '2019-08-27 12:38:58', '2019-08-27 12:38:58');
INSERT INTO `bitacoras` VALUES (370, 'incidencia', 75, 764, 1822, 'Se ha creado una incidencia', '2019-08-27', '12:40:09', 1, 'Creacion de incidencia', '2019-08-27 12:40:09', '2019-08-27 12:40:09');
INSERT INTO `bitacoras` VALUES (371, 'incidencia', 76, 764, 1959, 'Se ha creado una incidencia', '2019-08-27', '12:44:28', 1, 'Creacion de incidencia', '2019-08-27 12:44:28', '2019-08-27 12:44:28');
INSERT INTO `bitacoras` VALUES (372, 'incidencia', 77, 764, 2153, 'Se ha creado una incidencia', '2019-08-27', '12:45:34', 1, 'Creacion de incidencia', '2019-08-27 12:45:34', '2019-08-27 12:45:34');
INSERT INTO `bitacoras` VALUES (373, 'solicitud_alta', 55, 744, 0, 'Autorizar Solicitud', '2019-08-27', '13:10:08', 1, 'Autorizar celular', '2019-08-27 13:10:08', '2019-08-27 13:10:08');
INSERT INTO `bitacoras` VALUES (374, 'solicitud_alta', 56, 487, 0, 'Autorizar Solicitud', '2019-08-27', '14:01:25', 1, 'Autorizar computadora', '2019-08-27 14:01:25', '2019-08-27 14:01:25');
INSERT INTO `bitacoras` VALUES (375, 'solicitud_alta', 56, 744, 0, 'Autorizar Solicitud', '2019-08-27', '14:09:54', 1, 'Autorizar celular', '2019-08-27 14:09:54', '2019-08-27 14:09:54');
INSERT INTO `bitacoras` VALUES (376, 'solicitud_alta', 54, 744, 0, 'Autorizar Solicitud', '2019-08-27', '16:35:01', 1, 'Autorizar celular', '2019-08-27 16:35:01', '2019-08-27 16:35:01');
INSERT INTO `bitacoras` VALUES (377, 'solicitud_alta', 54, 487, 0, 'Autorizar Solicitud', '2019-08-27', '16:50:46', 1, 'Autorizar computadora', '2019-08-27 16:50:46', '2019-08-27 16:50:46');
INSERT INTO `bitacoras` VALUES (378, 'solicitud_alta', 60, 799, 0, 'Registro de solicitud', '2019-08-29', '10:49:38', 1, 'alta', '2019-08-29 10:49:38', '2019-08-29 10:49:38');
INSERT INTO `bitacoras` VALUES (379, 'solicitud_alta', 60, 86, 0, 'Autorizar Solicitud', '2019-08-29', '18:05:54', 1, 'Autorizar solicitud', '2019-08-29 18:05:54', '2019-08-29 18:05:54');
INSERT INTO `bitacoras` VALUES (380, 'solicitud_alta', 60, 719, 0, 'Agendar cita de firma', '2019-08-29', '18:52:03', 1, 'CITA FIRMA', '2019-08-29 18:52:03', '2019-08-29 18:52:03');
INSERT INTO `bitacoras` VALUES (381, 'solicitud_alta', 61, 799, 0, 'Registro de solicitud', '2019-08-30', '10:13:44', 1, 'alta', '2019-08-30 10:13:44', '2019-08-30 10:13:44');
INSERT INTO `bitacoras` VALUES (382, 'solicitud_alta', 61, 799, 0, 'Editar Solicitud', '2019-08-30', '10:23:40', 1, 'EDITAR', '2019-08-30 10:23:40', '2019-08-30 10:23:40');
INSERT INTO `bitacoras` VALUES (383, 'solicitud_alta', 61, 799, 0, 'Editar Solicitud', '2019-08-30', '10:24:56', 1, 'EDITAR', '2019-08-30 10:24:56', '2019-08-30 10:24:56');
INSERT INTO `bitacoras` VALUES (384, 'solicitud_alta', 62, 761, 0, 'Registro de solicitud', '2019-08-30', '10:30:34', 1, 'alta', '2019-08-30 10:30:34', '2019-08-30 10:30:34');
INSERT INTO `bitacoras` VALUES (385, 'solicitud_alta', 62, 232, 0, 'Autorizar Solicitud', '2019-08-30', '10:40:56', 1, 'Autorizar solicitud', '2019-08-30 10:40:56', '2019-08-30 10:40:56');
INSERT INTO `bitacoras` VALUES (386, 'solicitud_alta', 61, 232, 0, 'Autorizar Solicitud', '2019-08-30', '10:41:02', 1, 'Autorizar solicitud', '2019-08-30 10:41:02', '2019-08-30 10:41:02');
INSERT INTO `bitacoras` VALUES (387, 'solicitud_alta', 62, 719, 0, 'Agendar cita de firma', '2019-08-30', '10:57:31', 1, 'CITA FIRMA', '2019-08-30 10:57:31', '2019-08-30 10:57:31');
INSERT INTO `bitacoras` VALUES (388, 'solicitud_alta', 53, 487, 0, 'Autorizar Solicitud', '2019-08-30', '14:53:13', 1, 'Autorizar computadora', '2019-08-30 14:53:13', '2019-08-30 14:53:13');
INSERT INTO `bitacoras` VALUES (389, 'solicitud_alta', 63, 44, 0, 'Registro de solicitud', '2019-09-01', '22:58:32', 1, 'alta', '2019-09-01 22:58:32', '2019-09-01 22:58:32');
INSERT INTO `bitacoras` VALUES (390, 'solicitud_alta', 64, 44, 0, 'Registro de solicitud', '2019-09-01', '23:07:50', 1, 'alta', '2019-09-01 23:07:50', '2019-09-01 23:07:50');
INSERT INTO `bitacoras` VALUES (391, 'solicitud_alta', 64, 86, 0, 'Autorizar Solicitud', '2019-09-02', '10:08:19', 1, 'Autorizar solicitud por Direccion', '2019-09-02 10:08:19', '2019-09-02 10:08:19');
INSERT INTO `bitacoras` VALUES (392, 'solicitud_alta', 63, 86, 0, 'Autorizar Solicitud', '2019-09-02', '10:08:51', 1, 'Autorizar solicitud por Direccion', '2019-09-02 10:08:51', '2019-09-02 10:08:51');
INSERT INTO `bitacoras` VALUES (393, 'solicitud_alta', 63, 719, 0, 'Agendar cita de firma', '2019-09-02', '11:13:11', 1, 'CITA FIRMA', '2019-09-02 11:13:11', '2019-09-02 11:13:11');
INSERT INTO `bitacoras` VALUES (394, 'solicitud_alta', 64, 517, 0, 'Agendar cita de firma', '2019-09-02', '11:33:41', 1, 'CITA FIRMA', '2019-09-02 11:33:41', '2019-09-02 11:33:41');
INSERT INTO `bitacoras` VALUES (395, 'solicitud_alta', 65, 81, 0, 'Registro de solicitud', '2019-09-02', '18:34:46', 1, 'alta', '2019-09-02 18:34:46', '2019-09-02 18:34:46');
INSERT INTO `bitacoras` VALUES (396, 'solicitud_alta', 66, 799, 0, 'Registro de solicitud', '2019-09-03', '09:02:39', 1, 'alta', '2019-09-03 09:02:39', '2019-09-03 09:02:39');
INSERT INTO `bitacoras` VALUES (397, 'solicitud_alta', 53, 744, 0, 'Autorizar Solicitud', '2019-09-03', '09:19:26', 1, 'Autorizar celular', '2019-09-03 09:19:26', '2019-09-03 09:19:26');
INSERT INTO `bitacoras` VALUES (398, 'solicitud_alta', 65, 232, 0, 'Autorizar Solicitud', '2019-09-03', '09:41:07', 1, 'Autorizar solicitud', '2019-09-03 09:41:07', '2019-09-03 09:41:07');
INSERT INTO `bitacoras` VALUES (399, 'solicitud_alta', 66, 232, 0, 'Autorizar Solicitud', '2019-09-03', '09:41:15', 1, 'Autorizar solicitud', '2019-09-03 09:41:15', '2019-09-03 09:41:15');
INSERT INTO `bitacoras` VALUES (400, 'solicitud_alta', 65, 517, 0, 'Agendar cita de firma', '2019-09-03', '09:48:49', 1, 'CITA FIRMA', '2019-09-03 09:48:49', '2019-09-03 09:48:49');
INSERT INTO `bitacoras` VALUES (401, 'solicitud_alta', 61, 719, 0, 'Agendar cita de firma', '2019-09-03', '10:21:30', 1, 'CITA FIRMA', '2019-09-03 10:21:30', '2019-09-03 10:21:30');
INSERT INTO `bitacoras` VALUES (402, 'solicitud_alta', 66, 719, 0, 'Agendar cita de firma', '2019-09-03', '10:25:19', 1, 'CITA FIRMA', '2019-09-03 10:25:19', '2019-09-03 10:25:19');
INSERT INTO `bitacoras` VALUES (403, 'solicitud_alta', 67, 799, 0, 'Registro de solicitud', '2019-09-03', '11:37:34', 1, 'alta', '2019-09-03 11:37:34', '2019-09-03 11:37:34');
INSERT INTO `bitacoras` VALUES (404, 'solicitud_alta', 67, 117, 0, 'Autorizar Solicitud', '2019-09-03', '11:50:34', 1, 'Autorizar solicitud por Direccion', '2019-09-03 11:50:34', '2019-09-03 11:50:34');
INSERT INTO `bitacoras` VALUES (405, 'incidencia', 78, 33, 2084, 'Se ha creado una incidencia', '2019-09-03', '12:05:44', 1, 'Creacion de incidencia', '2019-09-03 12:05:44', '2019-09-03 12:05:44');
INSERT INTO `bitacoras` VALUES (406, 'solicitud_alta', 65, 731, 0, 'Autorizar Solicitud', '2019-09-03', '16:57:26', 1, 'Autorizar computadora', '2019-09-03 16:57:26', '2019-09-03 16:57:26');
INSERT INTO `bitacoras` VALUES (407, 'solicitud_alta', 55, 731, 0, 'Autorizar Solicitud', '2019-09-03', '16:59:37', 1, 'Autorizar computadora', '2019-09-03 16:59:37', '2019-09-03 16:59:37');
INSERT INTO `bitacoras` VALUES (408, 'solicitud_alta', 45, 487, 0, 'Autorizar Solicitud', '2019-09-03', '17:15:08', 1, 'Autorizar computadora', '2019-09-03 17:15:08', '2019-09-03 17:15:08');
INSERT INTO `bitacoras` VALUES (409, 'solicitud_alta', 24, 487, 0, 'Autorizar Solicitud', '2019-09-03', '17:16:57', 1, 'Autorizar computadora', '2019-09-03 17:16:57', '2019-09-03 17:16:57');
INSERT INTO `bitacoras` VALUES (410, 'solicitud_alta', 61, 492, 0, 'Autorizar Solicitud', '2019-09-03', '18:04:09', 1, 'Autorizar computadora', '2019-09-03 18:04:09', '2019-09-03 18:04:09');
INSERT INTO `bitacoras` VALUES (411, 'solicitud_alta', 65, 744, 0, 'Autorizar Solicitud', '2019-09-03', '18:26:29', 1, 'Autorizar celular', '2019-09-03 18:26:29', '2019-09-03 18:26:29');
INSERT INTO `bitacoras` VALUES (412, 'solicitud_alta', 61, 744, 0, 'Autorizar Solicitud', '2019-09-03', '18:26:45', 1, 'Autorizar celular', '2019-09-03 18:26:45', '2019-09-03 18:26:45');
INSERT INTO `bitacoras` VALUES (413, 'solicitud_alta', 40, 744, 0, 'Autorizar Solicitud', '2019-09-03', '18:27:42', 1, 'Autorizar celular', '2019-09-03 18:27:42', '2019-09-03 18:27:42');
INSERT INTO `bitacoras` VALUES (414, 'solicitud_alta', 6, 492, 0, 'Autorizar Solicitud', '2019-09-04', '10:39:09', 1, 'Autorizar computadora', '2019-09-04 10:39:09', '2019-09-04 10:39:09');
INSERT INTO `bitacoras` VALUES (415, 'solicitud_alta', 40, 492, 0, 'Autorizar Solicitud', '2019-09-04', '10:58:06', 1, 'Autorizar computadora', '2019-09-04 10:58:06', '2019-09-04 10:58:06');
INSERT INTO `bitacoras` VALUES (416, 'incidencia', 79, 448, 1804, 'Se ha creado una incidencia', '2019-09-04', '11:46:04', 1, 'Creacion de incidencia', '2019-09-04 11:46:04', '2019-09-04 11:46:04');
INSERT INTO `bitacoras` VALUES (417, 'incidencia', 80, 448, 1804, 'Se ha creado una incidencia', '2019-09-04', '11:50:29', 1, 'Creacion de incidencia', '2019-09-04 11:50:29', '2019-09-04 11:50:29');
INSERT INTO `bitacoras` VALUES (418, 'incidencia', 81, 448, 2171, 'Se ha creado una incidencia', '2019-09-04', '11:56:32', 1, 'Creacion de incidencia', '2019-09-04 11:56:32', '2019-09-04 11:56:32');
INSERT INTO `bitacoras` VALUES (419, 'incidencia', 82, 448, 1778, 'Se ha creado una incidencia', '2019-09-04', '12:05:16', 1, 'Creacion de incidencia', '2019-09-04 12:05:16', '2019-09-04 12:05:16');
INSERT INTO `bitacoras` VALUES (420, 'incidencia', 83, 448, 1913, 'Se ha creado una incidencia', '2019-09-04', '12:10:17', 1, 'Creacion de incidencia', '2019-09-04 12:10:17', '2019-09-04 12:10:17');
INSERT INTO `bitacoras` VALUES (421, 'incidencia', 84, 448, 1878, 'Se ha creado una incidencia', '2019-09-04', '12:13:47', 1, 'Creacion de incidencia', '2019-09-04 12:13:47', '2019-09-04 12:13:47');
INSERT INTO `bitacoras` VALUES (422, 'incidencia', 85, 448, 1959, 'Se ha creado una incidencia', '2019-09-04', '12:18:37', 1, 'Creacion de incidencia', '2019-09-04 12:18:37', '2019-09-04 12:18:37');
INSERT INTO `bitacoras` VALUES (423, 'incidencia', 86, 448, 1735, 'Se ha creado una incidencia', '2019-09-04', '12:22:29', 1, 'Creacion de incidencia', '2019-09-04 12:22:29', '2019-09-04 12:22:29');
INSERT INTO `bitacoras` VALUES (424, 'incidencia', 87, 448, 1732, 'Se ha creado una incidencia', '2019-09-04', '12:30:32', 1, 'Creacion de incidencia', '2019-09-04 12:30:32', '2019-09-04 12:30:32');
INSERT INTO `bitacoras` VALUES (425, 'incidencia', 88, 448, 1811, 'Se ha creado una incidencia', '2019-09-04', '13:00:51', 1, 'Creacion de incidencia', '2019-09-04 13:00:51', '2019-09-04 13:00:51');
INSERT INTO `bitacoras` VALUES (426, 'incidencia', 89, 448, 2032, 'Se ha creado una incidencia', '2019-09-04', '13:15:49', 1, 'Creacion de incidencia', '2019-09-04 13:15:49', '2019-09-04 13:15:49');
INSERT INTO `bitacoras` VALUES (427, 'incidencia', 90, 448, 1878, 'Se ha creado una incidencia', '2019-09-04', '13:23:51', 1, 'Creacion de incidencia', '2019-09-04 13:23:51', '2019-09-04 13:23:51');
INSERT INTO `bitacoras` VALUES (428, 'incidencia', 91, 448, 1842, 'Se ha creado una incidencia', '2019-09-04', '13:26:16', 1, 'Creacion de incidencia', '2019-09-04 13:26:16', '2019-09-04 13:26:16');
INSERT INTO `bitacoras` VALUES (429, 'incidencia', 92, 448, 1837, 'Se ha creado una incidencia', '2019-09-04', '13:30:57', 1, 'Creacion de incidencia', '2019-09-04 13:30:57', '2019-09-04 13:30:57');
INSERT INTO `bitacoras` VALUES (430, 'incidencia', 93, 448, 1945, 'Se ha creado una incidencia', '2019-09-04', '13:32:38', 1, 'Creacion de incidencia', '2019-09-04 13:32:38', '2019-09-04 13:32:38');
INSERT INTO `bitacoras` VALUES (431, 'incidencia', 94, 448, 1843, 'Se ha creado una incidencia', '2019-09-04', '13:37:06', 1, 'Creacion de incidencia', '2019-09-04 13:37:06', '2019-09-04 13:37:06');
INSERT INTO `bitacoras` VALUES (432, 'incidencia', 95, 448, 1833, 'Se ha creado una incidencia', '2019-09-04', '13:40:12', 1, 'Creacion de incidencia', '2019-09-04 13:40:12', '2019-09-04 13:40:12');
INSERT INTO `bitacoras` VALUES (433, 'incidencia', 96, 448, 1703, 'Se ha creado una incidencia', '2019-09-04', '13:49:22', 1, 'Creacion de incidencia', '2019-09-04 13:49:22', '2019-09-04 13:49:22');
INSERT INTO `bitacoras` VALUES (434, 'incidencia', 97, 448, 2197, 'Se ha creado una incidencia', '2019-09-04', '13:51:03', 1, 'Creacion de incidencia', '2019-09-04 13:51:03', '2019-09-04 13:51:03');
INSERT INTO `bitacoras` VALUES (435, 'incidencia', 98, 448, 1778, 'Se ha creado una incidencia', '2019-09-04', '13:54:30', 1, 'Creacion de incidencia', '2019-09-04 13:54:30', '2019-09-04 13:54:30');
INSERT INTO `bitacoras` VALUES (436, 'incidencia', 99, 448, 1878, 'Se ha creado una incidencia', '2019-09-04', '13:56:40', 1, 'Creacion de incidencia', '2019-09-04 13:56:40', '2019-09-04 13:56:40');
INSERT INTO `bitacoras` VALUES (437, 'incidencia', 100, 448, 2060, 'Se ha creado una incidencia', '2019-09-04', '14:00:39', 1, 'Creacion de incidencia', '2019-09-04 14:00:39', '2019-09-04 14:00:39');
INSERT INTO `bitacoras` VALUES (438, 'incidencia', 101, 448, 2309, 'Se ha creado una incidencia', '2019-09-04', '14:04:25', 1, 'Creacion de incidencia', '2019-09-04 14:04:25', '2019-09-04 14:04:25');
INSERT INTO `bitacoras` VALUES (439, 'incidencia', 102, 448, 2181, 'Se ha creado una incidencia', '2019-09-04', '14:06:07', 1, 'Creacion de incidencia', '2019-09-04 14:06:07', '2019-09-04 14:06:07');
INSERT INTO `bitacoras` VALUES (440, 'incidencia', 103, 448, 2260, 'Se ha creado una incidencia', '2019-09-04', '14:09:25', 1, 'Creacion de incidencia', '2019-09-04 14:09:25', '2019-09-04 14:09:25');
INSERT INTO `bitacoras` VALUES (441, 'incidencia', 104, 764, 1570, 'Se ha creado una incidencia', '2019-09-04', '14:24:00', 1, 'Creacion de incidencia', '2019-09-04 14:24:00', '2019-09-04 14:24:00');
INSERT INTO `bitacoras` VALUES (442, 'incidencia', 105, 764, 2144, 'Se ha creado una incidencia', '2019-09-04', '14:25:30', 1, 'Creacion de incidencia', '2019-09-04 14:25:30', '2019-09-04 14:25:30');
INSERT INTO `bitacoras` VALUES (443, 'incidencia', 106, 764, 1524, 'Se ha creado una incidencia', '2019-09-04', '14:27:08', 1, 'Creacion de incidencia', '2019-09-04 14:27:08', '2019-09-04 14:27:08');
INSERT INTO `bitacoras` VALUES (444, 'incidencia', 107, 764, 2117, 'Se ha creado una incidencia', '2019-09-04', '14:28:07', 1, 'Creacion de incidencia', '2019-09-04 14:28:07', '2019-09-04 14:28:07');
INSERT INTO `bitacoras` VALUES (445, 'incidencia', 108, 764, 1241, 'Se ha creado una incidencia', '2019-09-04', '14:29:55', 1, 'Creacion de incidencia', '2019-09-04 14:29:55', '2019-09-04 14:29:55');
INSERT INTO `bitacoras` VALUES (446, 'incidencia', 109, 448, 1588, 'Se ha creado una incidencia', '2019-09-04', '14:42:29', 1, 'Creacion de incidencia', '2019-09-04 14:42:29', '2019-09-04 14:42:29');
INSERT INTO `bitacoras` VALUES (447, 'incidencia', 110, 448, 2152, 'Se ha creado una incidencia', '2019-09-04', '14:45:01', 1, 'Creacion de incidencia', '2019-09-04 14:45:01', '2019-09-04 14:45:01');
INSERT INTO `bitacoras` VALUES (448, 'incidencia', 111, 448, 2328, 'Se ha creado una incidencia', '2019-09-04', '14:48:45', 1, 'Creacion de incidencia', '2019-09-04 14:48:45', '2019-09-04 14:48:45');
INSERT INTO `bitacoras` VALUES (449, 'incidencia', 112, 448, 1822, 'Se ha creado una incidencia', '2019-09-04', '14:51:26', 1, 'Creacion de incidencia', '2019-09-04 14:51:26', '2019-09-04 14:51:26');
INSERT INTO `bitacoras` VALUES (450, 'incidencia', 113, 448, 1747, 'Se ha creado una incidencia', '2019-09-04', '14:54:05', 1, 'Creacion de incidencia', '2019-09-04 14:54:05', '2019-09-04 14:54:05');
INSERT INTO `bitacoras` VALUES (451, 'incidencia', 114, 448, 1997, 'Se ha creado una incidencia', '2019-09-04', '14:57:57', 1, 'Creacion de incidencia', '2019-09-04 14:57:57', '2019-09-04 14:57:57');
INSERT INTO `bitacoras` VALUES (452, 'incidencia', 115, 448, 2041, 'Se ha creado una incidencia', '2019-09-04', '15:00:17', 1, 'Creacion de incidencia', '2019-09-04 15:00:17', '2019-09-04 15:00:17');
INSERT INTO `bitacoras` VALUES (453, 'incidencia', 116, 448, 1883, 'Se ha creado una incidencia', '2019-09-04', '15:02:40', 1, 'Creacion de incidencia', '2019-09-04 15:02:40', '2019-09-04 15:02:40');
INSERT INTO `bitacoras` VALUES (454, 'incidencia', 117, 448, 1671, 'Se ha creado una incidencia', '2019-09-04', '15:05:46', 1, 'Creacion de incidencia', '2019-09-04 15:05:46', '2019-09-04 15:05:46');
INSERT INTO `bitacoras` VALUES (455, 'solicitud_alta', 62, 45, 0, 'Autorizar Solicitud', '2019-09-04', '16:41:15', 1, 'Cancelar solicitud por Direccion', '2019-09-04 16:41:15', '2019-09-04 16:41:15');
INSERT INTO `bitacoras` VALUES (456, 'solicitud_alta', 62, 744, 0, 'Autorizar Solicitud', '2019-09-04', '17:56:49', 1, 'Autorizar celular', '2019-09-04 17:56:49', '2019-09-04 17:56:49');
INSERT INTO `bitacoras` VALUES (457, 'solicitud_alta', 59, 744, 0, 'Autorizar Solicitud', '2019-09-04', '17:57:37', 1, 'Autorizar celular', '2019-09-04 17:57:37', '2019-09-04 17:57:37');
INSERT INTO `bitacoras` VALUES (458, 'incidencia', 118, 244, 776, 'Se ha creado una incidencia', '2019-09-04', '18:54:51', 1, 'Creacion de incidencia', '2019-09-04 18:54:51', '2019-09-04 18:54:51');
INSERT INTO `bitacoras` VALUES (459, 'solicitud_alta', 68, 761, 0, 'Registro de solicitud', '2019-09-04', '19:56:33', 1, 'alta', '2019-09-04 19:56:33', '2019-09-04 19:56:33');
INSERT INTO `bitacoras` VALUES (460, 'incidencia', 118, 82, 776, 'La incidencia paso a ser: autorizar', '2019-09-05', '16:17:23', 1, 'autorizar', '2019-09-05 16:17:23', '2019-09-05 16:17:23');
INSERT INTO `bitacoras` VALUES (461, 'incidencia', 117, 82, 1671, 'La incidencia paso a ser: autorizar', '2019-09-05', '16:17:23', 1, 'autorizar', '2019-09-05 16:17:23', '2019-09-05 16:17:23');
INSERT INTO `bitacoras` VALUES (462, 'incidencia', 116, 82, 1883, 'La incidencia paso a ser: autorizar', '2019-09-05', '16:17:23', 1, 'autorizar', '2019-09-05 16:17:23', '2019-09-05 16:17:23');
INSERT INTO `bitacoras` VALUES (463, 'incidencia', 115, 82, 2041, 'La incidencia paso a ser: autorizar', '2019-09-05', '16:17:23', 1, 'autorizar', '2019-09-05 16:17:23', '2019-09-05 16:17:23');
INSERT INTO `bitacoras` VALUES (464, 'incidencia', 114, 82, 1997, 'La incidencia paso a ser: autorizar', '2019-09-05', '16:17:23', 1, 'autorizar', '2019-09-05 16:17:23', '2019-09-05 16:17:23');
INSERT INTO `bitacoras` VALUES (465, 'incidencia', 113, 82, 1747, 'La incidencia paso a ser: autorizar', '2019-09-05', '16:17:23', 1, 'autorizar', '2019-09-05 16:17:23', '2019-09-05 16:17:23');
INSERT INTO `bitacoras` VALUES (466, 'incidencia', 112, 82, 1822, 'La incidencia paso a ser: autorizar', '2019-09-05', '16:17:23', 1, 'autorizar', '2019-09-05 16:17:23', '2019-09-05 16:17:23');
INSERT INTO `bitacoras` VALUES (467, 'incidencia', 111, 82, 2328, 'La incidencia paso a ser: autorizar', '2019-09-05', '16:17:23', 1, 'autorizar', '2019-09-05 16:17:23', '2019-09-05 16:17:23');
INSERT INTO `bitacoras` VALUES (468, 'incidencia', 110, 82, 2152, 'La incidencia paso a ser: autorizar', '2019-09-05', '16:17:23', 1, 'autorizar', '2019-09-05 16:17:23', '2019-09-05 16:17:23');
INSERT INTO `bitacoras` VALUES (469, 'incidencia', 109, 82, 1588, 'La incidencia paso a ser: autorizar', '2019-09-05', '16:17:23', 1, 'autorizar', '2019-09-05 16:17:23', '2019-09-05 16:17:23');
INSERT INTO `bitacoras` VALUES (470, 'incidencia', 108, 82, 1241, 'La incidencia paso a ser: autorizar', '2019-09-05', '16:17:23', 1, 'autorizar', '2019-09-05 16:17:23', '2019-09-05 16:17:23');
INSERT INTO `bitacoras` VALUES (471, 'incidencia', 107, 82, 2117, 'La incidencia paso a ser: autorizar', '2019-09-05', '16:17:23', 1, 'autorizar', '2019-09-05 16:17:23', '2019-09-05 16:17:23');
INSERT INTO `bitacoras` VALUES (472, 'incidencia', 106, 82, 1524, 'La incidencia paso a ser: autorizar', '2019-09-05', '16:17:23', 1, 'autorizar', '2019-09-05 16:17:23', '2019-09-05 16:17:23');
INSERT INTO `bitacoras` VALUES (473, 'incidencia', 105, 82, 2144, 'La incidencia paso a ser: autorizar', '2019-09-05', '16:17:23', 1, 'autorizar', '2019-09-05 16:17:23', '2019-09-05 16:17:23');
INSERT INTO `bitacoras` VALUES (474, 'incidencia', 104, 82, 1570, 'La incidencia paso a ser: autorizar', '2019-09-05', '16:17:23', 1, 'autorizar', '2019-09-05 16:17:23', '2019-09-05 16:17:23');
INSERT INTO `bitacoras` VALUES (475, 'incidencia', 103, 82, 2260, 'La incidencia paso a ser: autorizar', '2019-09-05', '16:17:24', 1, 'autorizar', '2019-09-05 16:17:24', '2019-09-05 16:17:24');
INSERT INTO `bitacoras` VALUES (476, 'incidencia', 102, 82, 2181, 'La incidencia paso a ser: autorizar', '2019-09-05', '16:17:24', 1, 'autorizar', '2019-09-05 16:17:24', '2019-09-05 16:17:24');
INSERT INTO `bitacoras` VALUES (477, 'incidencia', 101, 82, 2309, 'La incidencia paso a ser: autorizar', '2019-09-05', '16:17:24', 1, 'autorizar', '2019-09-05 16:17:24', '2019-09-05 16:17:24');
INSERT INTO `bitacoras` VALUES (478, 'incidencia', 100, 82, 2060, 'La incidencia paso a ser: autorizar', '2019-09-05', '16:17:24', 1, 'autorizar', '2019-09-05 16:17:24', '2019-09-05 16:17:24');
INSERT INTO `bitacoras` VALUES (479, 'incidencia', 99, 82, 1878, 'La incidencia paso a ser: autorizar', '2019-09-05', '16:17:24', 1, 'autorizar', '2019-09-05 16:17:24', '2019-09-05 16:17:24');
INSERT INTO `bitacoras` VALUES (480, 'incidencia', 98, 82, 1778, 'La incidencia paso a ser: autorizar', '2019-09-05', '16:17:24', 1, 'autorizar', '2019-09-05 16:17:24', '2019-09-05 16:17:24');
INSERT INTO `bitacoras` VALUES (481, 'incidencia', 97, 82, 2197, 'La incidencia paso a ser: autorizar', '2019-09-05', '16:17:24', 1, 'autorizar', '2019-09-05 16:17:24', '2019-09-05 16:17:24');
INSERT INTO `bitacoras` VALUES (482, 'incidencia', 96, 82, 1703, 'La incidencia paso a ser: autorizar', '2019-09-05', '16:17:24', 1, 'autorizar', '2019-09-05 16:17:24', '2019-09-05 16:17:24');
INSERT INTO `bitacoras` VALUES (483, 'incidencia', 95, 82, 1833, 'La incidencia paso a ser: autorizar', '2019-09-05', '16:17:24', 1, 'autorizar', '2019-09-05 16:17:24', '2019-09-05 16:17:24');
INSERT INTO `bitacoras` VALUES (484, 'incidencia', 94, 82, 1843, 'La incidencia paso a ser: autorizar', '2019-09-05', '16:17:24', 1, 'autorizar', '2019-09-05 16:17:24', '2019-09-05 16:17:24');
INSERT INTO `bitacoras` VALUES (485, 'incidencia', 93, 82, 1945, 'La incidencia paso a ser: autorizar', '2019-09-05', '16:17:24', 1, 'autorizar', '2019-09-05 16:17:24', '2019-09-05 16:17:24');
INSERT INTO `bitacoras` VALUES (486, 'incidencia', 92, 82, 1837, 'La incidencia paso a ser: autorizar', '2019-09-05', '16:17:24', 1, 'autorizar', '2019-09-05 16:17:24', '2019-09-05 16:17:24');
INSERT INTO `bitacoras` VALUES (487, 'incidencia', 91, 82, 1842, 'La incidencia paso a ser: autorizar', '2019-09-05', '16:17:24', 1, 'autorizar', '2019-09-05 16:17:24', '2019-09-05 16:17:24');
INSERT INTO `bitacoras` VALUES (488, 'incidencia', 90, 82, 1878, 'La incidencia paso a ser: autorizar', '2019-09-05', '16:17:24', 1, 'autorizar', '2019-09-05 16:17:24', '2019-09-05 16:17:24');
INSERT INTO `bitacoras` VALUES (489, 'incidencia', 89, 82, 2032, 'La incidencia paso a ser: autorizar', '2019-09-05', '16:17:24', 1, 'autorizar', '2019-09-05 16:17:24', '2019-09-05 16:17:24');
INSERT INTO `bitacoras` VALUES (490, 'incidencia', 88, 82, 1811, 'La incidencia paso a ser: autorizar', '2019-09-05', '16:17:24', 1, 'autorizar', '2019-09-05 16:17:24', '2019-09-05 16:17:24');
INSERT INTO `bitacoras` VALUES (491, 'incidencia', 87, 82, 1732, 'La incidencia paso a ser: autorizar', '2019-09-05', '16:17:24', 1, 'autorizar', '2019-09-05 16:17:24', '2019-09-05 16:17:24');
INSERT INTO `bitacoras` VALUES (492, 'incidencia', 86, 82, 1735, 'La incidencia paso a ser: autorizar', '2019-09-05', '16:17:24', 1, 'autorizar', '2019-09-05 16:17:24', '2019-09-05 16:17:24');
INSERT INTO `bitacoras` VALUES (493, 'incidencia', 85, 82, 1959, 'La incidencia paso a ser: autorizar', '2019-09-05', '16:17:24', 1, 'autorizar', '2019-09-05 16:17:24', '2019-09-05 16:17:24');
INSERT INTO `bitacoras` VALUES (494, 'incidencia', 84, 82, 1878, 'La incidencia paso a ser: autorizar', '2019-09-05', '16:17:24', 1, 'autorizar', '2019-09-05 16:17:24', '2019-09-05 16:17:24');
INSERT INTO `bitacoras` VALUES (495, 'incidencia', 83, 82, 1913, 'La incidencia paso a ser: autorizar', '2019-09-05', '16:17:24', 1, 'autorizar', '2019-09-05 16:17:24', '2019-09-05 16:17:24');
INSERT INTO `bitacoras` VALUES (496, 'incidencia', 82, 82, 1778, 'La incidencia paso a ser: autorizar', '2019-09-05', '16:17:24', 1, 'autorizar', '2019-09-05 16:17:24', '2019-09-05 16:17:24');
INSERT INTO `bitacoras` VALUES (497, 'incidencia', 81, 82, 2171, 'La incidencia paso a ser: autorizar', '2019-09-05', '16:17:24', 1, 'autorizar', '2019-09-05 16:17:24', '2019-09-05 16:17:24');
INSERT INTO `bitacoras` VALUES (498, 'incidencia', 80, 82, 1804, 'La incidencia paso a ser: autorizar', '2019-09-05', '16:17:24', 1, 'autorizar', '2019-09-05 16:17:24', '2019-09-05 16:17:24');
INSERT INTO `bitacoras` VALUES (499, 'incidencia', 77, 82, 2153, 'La incidencia paso a ser: autorizar', '2019-09-05', '16:17:24', 1, 'autorizar', '2019-09-05 16:17:24', '2019-09-05 16:17:24');
INSERT INTO `bitacoras` VALUES (500, 'incidencia', 76, 82, 1959, 'La incidencia paso a ser: autorizar', '2019-09-05', '16:17:24', 1, 'autorizar', '2019-09-05 16:17:24', '2019-09-05 16:17:24');
INSERT INTO `bitacoras` VALUES (501, 'incidencia', 75, 82, 1822, 'La incidencia paso a ser: autorizar', '2019-09-05', '16:17:24', 1, 'autorizar', '2019-09-05 16:17:24', '2019-09-05 16:17:24');
INSERT INTO `bitacoras` VALUES (502, 'incidencia', 74, 82, 1878, 'La incidencia paso a ser: autorizar', '2019-09-05', '16:17:24', 1, 'autorizar', '2019-09-05 16:17:24', '2019-09-05 16:17:24');
INSERT INTO `bitacoras` VALUES (503, 'incidencia', 73, 82, 2041, 'La incidencia paso a ser: autorizar', '2019-09-05', '16:17:24', 1, 'autorizar', '2019-09-05 16:17:24', '2019-09-05 16:17:24');
INSERT INTO `bitacoras` VALUES (504, 'incidencia', 72, 82, 1698, 'La incidencia paso a ser: autorizar', '2019-09-05', '16:17:24', 1, 'autorizar', '2019-09-05 16:17:24', '2019-09-05 16:17:24');
INSERT INTO `bitacoras` VALUES (505, 'incidencia', 71, 82, 576, 'La incidencia paso a ser: autorizar', '2019-09-05', '16:17:24', 1, 'autorizar', '2019-09-05 16:17:24', '2019-09-05 16:17:24');
INSERT INTO `bitacoras` VALUES (506, 'incidencia', 70, 82, 2335, 'La incidencia paso a ser: autorizar', '2019-09-05', '16:17:24', 1, 'autorizar', '2019-09-05 16:17:24', '2019-09-05 16:17:24');
INSERT INTO `bitacoras` VALUES (507, 'incidencia', 69, 82, 677, 'La incidencia paso a ser: autorizar', '2019-09-05', '16:17:24', 1, 'autorizar', '2019-09-05 16:17:24', '2019-09-05 16:17:24');
INSERT INTO `bitacoras` VALUES (508, 'incidencia', 68, 82, 2291, 'La incidencia paso a ser: autorizar', '2019-09-05', '16:17:24', 1, 'autorizar', '2019-09-05 16:17:24', '2019-09-05 16:17:24');
INSERT INTO `bitacoras` VALUES (509, 'incidencia', 67, 82, 505, 'La incidencia paso a ser: autorizar', '2019-09-05', '16:17:24', 1, 'autorizar', '2019-09-05 16:17:24', '2019-09-05 16:17:24');
INSERT INTO `bitacoras` VALUES (510, 'incidencia', 66, 82, 2252, 'La incidencia paso a ser: autorizar', '2019-09-05', '16:17:24', 1, 'autorizar', '2019-09-05 16:17:24', '2019-09-05 16:17:24');
INSERT INTO `bitacoras` VALUES (511, 'incidencia', 65, 82, 2249, 'La incidencia paso a ser: autorizar', '2019-09-05', '16:17:24', 1, 'autorizar', '2019-09-05 16:17:24', '2019-09-05 16:17:24');
INSERT INTO `bitacoras` VALUES (512, 'incidencia', 63, 82, 2250, 'La incidencia paso a ser: autorizar', '2019-09-05', '16:17:24', 1, 'autorizar', '2019-09-05 16:17:24', '2019-09-05 16:17:24');
INSERT INTO `bitacoras` VALUES (513, 'incidencia', 62, 82, 2152, 'La incidencia paso a ser: autorizar', '2019-09-05', '16:17:24', 1, 'autorizar', '2019-09-05 16:17:24', '2019-09-05 16:17:24');
INSERT INTO `bitacoras` VALUES (514, 'incidencia', 61, 82, 2233, 'La incidencia paso a ser: autorizar', '2019-09-05', '16:17:24', 1, 'autorizar', '2019-09-05 16:17:24', '2019-09-05 16:17:24');
INSERT INTO `bitacoras` VALUES (515, 'incidencia', 60, 82, 2220, 'La incidencia paso a ser: autorizar', '2019-09-05', '16:17:24', 1, 'autorizar', '2019-09-05 16:17:24', '2019-09-05 16:17:24');
INSERT INTO `bitacoras` VALUES (516, 'incidencia', 59, 82, 2217, 'La incidencia paso a ser: autorizar', '2019-09-05', '16:17:24', 1, 'autorizar', '2019-09-05 16:17:24', '2019-09-05 16:17:24');
INSERT INTO `bitacoras` VALUES (517, 'incidencia', 58, 82, 2221, 'La incidencia paso a ser: autorizar', '2019-09-05', '16:17:24', 1, 'autorizar', '2019-09-05 16:17:24', '2019-09-05 16:17:24');
INSERT INTO `bitacoras` VALUES (518, 'incidencia', 57, 82, 2226, 'La incidencia paso a ser: autorizar', '2019-09-05', '16:17:24', 1, 'autorizar', '2019-09-05 16:17:24', '2019-09-05 16:17:24');
INSERT INTO `bitacoras` VALUES (519, 'incidencia', 56, 82, 2232, 'La incidencia paso a ser: autorizar', '2019-09-05', '16:17:24', 1, 'autorizar', '2019-09-05 16:17:24', '2019-09-05 16:17:24');
INSERT INTO `bitacoras` VALUES (520, 'incidencia', 55, 82, 2234, 'La incidencia paso a ser: autorizar', '2019-09-05', '16:17:24', 1, 'autorizar', '2019-09-05 16:17:24', '2019-09-05 16:17:24');
INSERT INTO `bitacoras` VALUES (521, 'incidencia', 54, 82, 2223, 'La incidencia paso a ser: autorizar', '2019-09-05', '16:17:24', 1, 'autorizar', '2019-09-05 16:17:24', '2019-09-05 16:17:24');
INSERT INTO `bitacoras` VALUES (522, 'incidencia', 53, 82, 2218, 'La incidencia paso a ser: autorizar', '2019-09-05', '16:17:24', 1, 'autorizar', '2019-09-05 16:17:24', '2019-09-05 16:17:24');
INSERT INTO `bitacoras` VALUES (523, 'incidencia', 52, 82, 2216, 'La incidencia paso a ser: autorizar', '2019-09-05', '16:17:24', 1, 'autorizar', '2019-09-05 16:17:24', '2019-09-05 16:17:24');
INSERT INTO `bitacoras` VALUES (524, 'incidencia', 51, 82, 2219, 'La incidencia paso a ser: autorizar', '2019-09-05', '16:17:24', 1, 'autorizar', '2019-09-05 16:17:24', '2019-09-05 16:17:24');
INSERT INTO `bitacoras` VALUES (525, 'incidencia', 50, 82, 2224, 'La incidencia paso a ser: autorizar', '2019-09-05', '16:17:24', 1, 'autorizar', '2019-09-05 16:17:24', '2019-09-05 16:17:24');
INSERT INTO `bitacoras` VALUES (526, 'incidencia', 49, 82, 1241, 'La incidencia paso a ser: autorizar', '2019-09-05', '16:17:24', 1, 'autorizar', '2019-09-05 16:17:24', '2019-09-05 16:17:24');
INSERT INTO `bitacoras` VALUES (527, 'incidencia', 48, 82, 2047, 'La incidencia paso a ser: autorizar', '2019-09-05', '16:17:24', 1, 'autorizar', '2019-09-05 16:17:24', '2019-09-05 16:17:24');
INSERT INTO `bitacoras` VALUES (528, 'incidencia', 47, 82, 1524, 'La incidencia paso a ser: autorizar', '2019-09-05', '16:17:24', 1, 'autorizar', '2019-09-05 16:17:24', '2019-09-05 16:17:24');
INSERT INTO `bitacoras` VALUES (529, 'incidencia', 46, 82, 2144, 'La incidencia paso a ser: autorizar', '2019-09-05', '16:17:24', 1, 'autorizar', '2019-09-05 16:17:24', '2019-09-05 16:17:24');
INSERT INTO `bitacoras` VALUES (530, 'incidencia', 45, 82, 1570, 'La incidencia paso a ser: autorizar', '2019-09-05', '16:17:24', 1, 'autorizar', '2019-09-05 16:17:24', '2019-09-05 16:17:24');
INSERT INTO `bitacoras` VALUES (531, 'incidencia', 44, 82, 2286, 'La incidencia paso a ser: autorizar', '2019-09-05', '16:17:24', 1, 'autorizar', '2019-09-05 16:17:24', '2019-09-05 16:17:24');
INSERT INTO `bitacoras` VALUES (532, 'incidencia', 43, 82, 2285, 'La incidencia paso a ser: autorizar', '2019-09-05', '16:17:24', 1, 'autorizar', '2019-09-05 16:17:24', '2019-09-05 16:17:24');
INSERT INTO `bitacoras` VALUES (533, 'incidencia', 42, 82, 1690, 'La incidencia paso a ser: autorizar', '2019-09-05', '16:17:24', 1, 'autorizar', '2019-09-05 16:17:24', '2019-09-05 16:17:24');
INSERT INTO `bitacoras` VALUES (534, 'incidencia', 40, 82, 2307, 'La incidencia paso a ser: autorizar', '2019-09-05', '16:17:24', 1, 'autorizar', '2019-09-05 16:17:24', '2019-09-05 16:17:24');
INSERT INTO `bitacoras` VALUES (535, 'incidencia', 39, 82, 2306, 'La incidencia paso a ser: autorizar', '2019-09-05', '16:17:24', 1, 'autorizar', '2019-09-05 16:17:24', '2019-09-05 16:17:24');
INSERT INTO `bitacoras` VALUES (536, 'incidencia', 38, 82, 2305, 'La incidencia paso a ser: autorizar', '2019-09-05', '16:17:24', 1, 'autorizar', '2019-09-05 16:17:24', '2019-09-05 16:17:24');
INSERT INTO `bitacoras` VALUES (537, 'incidencia', 37, 82, 2304, 'La incidencia paso a ser: autorizar', '2019-09-05', '16:17:24', 1, 'autorizar', '2019-09-05 16:17:24', '2019-09-05 16:17:24');
INSERT INTO `bitacoras` VALUES (538, 'incidencia', 36, 82, 1901, 'La incidencia paso a ser: autorizar', '2019-09-05', '16:17:24', 1, 'autorizar', '2019-09-05 16:17:24', '2019-09-05 16:17:24');
INSERT INTO `bitacoras` VALUES (539, 'incidencia', 35, 82, 2303, 'La incidencia paso a ser: autorizar', '2019-09-05', '16:17:24', 1, 'autorizar', '2019-09-05 16:17:24', '2019-09-05 16:17:24');
INSERT INTO `bitacoras` VALUES (540, 'incidencia', 34, 82, 1735, 'La incidencia paso a ser: autorizar', '2019-09-05', '16:17:24', 1, 'autorizar', '2019-09-05 16:17:24', '2019-09-05 16:17:24');
INSERT INTO `bitacoras` VALUES (541, 'incidencia', 33, 82, 1833, 'La incidencia paso a ser: autorizar', '2019-09-05', '16:17:24', 1, 'autorizar', '2019-09-05 16:17:24', '2019-09-05 16:17:24');
INSERT INTO `bitacoras` VALUES (542, 'incidencia', 32, 82, 1784, 'La incidencia paso a ser: autorizar', '2019-09-05', '16:17:24', 1, 'autorizar', '2019-09-05 16:17:24', '2019-09-05 16:17:24');
INSERT INTO `bitacoras` VALUES (543, 'incidencia', 31, 82, 2247, 'La incidencia paso a ser: autorizar', '2019-09-05', '16:17:24', 1, 'autorizar', '2019-09-05 16:17:24', '2019-09-05 16:17:24');
INSERT INTO `bitacoras` VALUES (544, 'incidencia', 30, 82, 1711, 'La incidencia paso a ser: autorizar', '2019-09-05', '16:17:24', 1, 'autorizar', '2019-09-05 16:17:24', '2019-09-05 16:17:24');
INSERT INTO `bitacoras` VALUES (545, 'incidencia', 29, 82, 1883, 'La incidencia paso a ser: autorizar', '2019-09-05', '16:17:24', 1, 'autorizar', '2019-09-05 16:17:24', '2019-09-05 16:17:24');
INSERT INTO `bitacoras` VALUES (546, 'incidencia', 28, 82, 1841, 'La incidencia paso a ser: autorizar', '2019-09-05', '16:17:24', 1, 'autorizar', '2019-09-05 16:17:24', '2019-09-05 16:17:24');
INSERT INTO `bitacoras` VALUES (547, 'incidencia', 27, 82, 2041, 'La incidencia paso a ser: autorizar', '2019-09-05', '16:17:24', 1, 'autorizar', '2019-09-05 16:17:24', '2019-09-05 16:17:24');
INSERT INTO `bitacoras` VALUES (548, 'incidencia', 26, 82, 1837, 'La incidencia paso a ser: autorizar', '2019-09-05', '16:17:24', 1, 'autorizar', '2019-09-05 16:17:24', '2019-09-05 16:17:24');
INSERT INTO `bitacoras` VALUES (549, 'incidencia', 25, 82, 2153, 'La incidencia paso a ser: autorizar', '2019-09-05', '16:17:24', 1, 'autorizar', '2019-09-05 16:17:24', '2019-09-05 16:17:24');
INSERT INTO `bitacoras` VALUES (550, 'incidencia', 14, 82, 1959, 'La incidencia paso a ser: autorizar', '2019-09-05', '16:17:24', 1, 'autorizar', '2019-09-05 16:17:24', '2019-09-05 16:17:24');
INSERT INTO `bitacoras` VALUES (551, 'incidencia', 13, 82, 2181, 'La incidencia paso a ser: autorizar', '2019-09-05', '16:17:24', 1, 'autorizar', '2019-09-05 16:17:24', '2019-09-05 16:17:24');
INSERT INTO `bitacoras` VALUES (552, 'incidencia', 12, 82, 2060, 'La incidencia paso a ser: autorizar', '2019-09-05', '16:17:24', 1, 'autorizar', '2019-09-05 16:17:24', '2019-09-05 16:17:24');
INSERT INTO `bitacoras` VALUES (553, 'incidencia', 11, 82, 2181, 'La incidencia paso a ser: autorizar', '2019-09-05', '16:17:24', 1, 'autorizar', '2019-09-05 16:17:24', '2019-09-05 16:17:24');
INSERT INTO `bitacoras` VALUES (554, 'incidencia', 119, 750, 2350, 'Se ha creado una incidencia', '2019-09-06', '09:01:54', 1, 'Creacion de incidencia', '2019-09-06 09:01:54', '2019-09-06 09:01:54');
INSERT INTO `bitacoras` VALUES (555, 'incidencia', 120, 750, 2150, 'Se ha creado una incidencia', '2019-09-06', '09:05:44', 1, 'Creacion de incidencia', '2019-09-06 09:05:44', '2019-09-06 09:05:44');
INSERT INTO `bitacoras` VALUES (556, 'incidencia', 121, 750, 2150, 'SE HA CREADO UNA INCIDENCIA', '2019-09-07', '08:32:13', 1, 'SOLICITADO', '2019-09-07 08:32:13', '2019-09-07 08:32:13');
INSERT INTO `bitacoras` VALUES (557, 'incidencia', 122, 2, 2350, 'SE HA CREADO UNA INCIDENCIA', '2019-09-07', '08:50:14', 1, 'SOLICITADO', '2019-09-07 08:50:14', '2019-09-07 08:50:14');
INSERT INTO `bitacoras` VALUES (558, 'incidencia', 123, 2, 2311, 'SE HA CREADO UNA INCIDENCIA', '2019-09-07', '08:57:13', 1, 'SOLICITADO', '2019-09-07 08:57:13', '2019-09-07 08:57:13');
INSERT INTO `bitacoras` VALUES (559, 'incidencia', 124, 2, 2350, 'SE HA CREADO UNA INCIDENCIA', '2019-09-07', '08:59:47', 1, 'SOLICITADO', '2019-09-07 08:59:47', '2019-09-07 08:59:47');
INSERT INTO `bitacoras` VALUES (560, 'incidencia', 125, 2, 2350, 'SE HA CREADO UNA INCIDENCIA', '2019-09-07', '09:01:06', 1, 'SOLICITADO', '2019-09-07 09:01:06', '2019-09-07 09:01:06');
INSERT INTO `bitacoras` VALUES (561, 'incidencia', 126, 2, 2080, 'SE HA CREADO UNA INCIDENCIA', '2019-09-07', '09:02:12', 1, 'SOLICITADO', '2019-09-07 09:02:12', '2019-09-07 09:02:12');
INSERT INTO `bitacoras` VALUES (562, 'incidencia', 126, 638, 2080, 'LUZ ADRIANA RAMIREZ VALIDO', '2019-09-07', '09:11:49', 1, 'POR VALIDAR DIRECCION', '2019-09-07 09:11:49', '2019-09-07 09:11:49');
INSERT INTO `bitacoras` VALUES (563, 'incidencia', 124, 638, 2350, 'LUZ ADRIANA RAMIREZ VALIDO', '2019-09-07', '09:13:02', 1, 'CANCELAR', '2019-09-07 09:13:02', '2019-09-07 09:13:02');
INSERT INTO `bitacoras` VALUES (564, 'incidencia', 127, 750, 1336, 'SE HA CREADO UNA INCIDENCIA', '2019-09-07', '09:20:07', 1, 'SOLICITADO', '2019-09-07 09:20:07', '2019-09-07 09:20:07');
INSERT INTO `bitacoras` VALUES (565, 'incidencia', 128, 750, 2243, 'SE HA CREADO UNA INCIDENCIA', '2019-09-07', '09:33:46', 1, 'SOLICITADO', '2019-09-07 09:33:46', '2019-09-07 09:33:46');
INSERT INTO `bitacoras` VALUES (566, 'incidencia', 127, 707, 1336, 'MARCO ANTONIO ACOSTA VALIDO', '2019-09-07', '09:44:41', 1, 'POR VALIDAR DIRECCION', '2019-09-07 09:44:41', '2019-09-07 09:44:41');
INSERT INTO `bitacoras` VALUES (567, 'incidencia', 128, 777, 2243, 'RAUL VENTURA VALIDO', '2019-09-07', '09:44:57', 1, 'POR VALIDAR DIRECCION', '2019-09-07 09:44:57', '2019-09-07 09:44:57');
INSERT INTO `bitacoras` VALUES (568, 'incidencia', 121, 638, 2150, 'LUZ ADRIANA RAMIREZ VALIDO', '2019-09-07', '09:45:19', 1, 'POR VALIDAR DIRECCION', '2019-09-07 09:45:19', '2019-09-07 09:45:19');
INSERT INTO `bitacoras` VALUES (569, 'incidencia', 123, 638, 2311, 'LUZ ADRIANA RAMIREZ VALIDO', '2019-09-07', '09:45:22', 1, 'POR VALIDAR DIRECCION', '2019-09-07 09:45:22', '2019-09-07 09:45:22');
INSERT INTO `bitacoras` VALUES (570, 'incidencia', 129, 750, 776, 'SE HA CREADO UNA INCIDENCIA', '2019-09-07', '09:47:32', 1, 'SOLICITADO', '2019-09-07 09:47:32', '2019-09-07 09:47:32');
INSERT INTO `bitacoras` VALUES (571, 'incidencia', 130, 750, 776, 'SE HA CREADO UNA INCIDENCIA', '2019-09-07', '09:51:12', 1, 'SOLICITADO', '2019-09-07 09:51:12', '2019-09-07 09:51:12');
INSERT INTO `bitacoras` VALUES (572, 'incidencia', 130, 232, 776, 'ERICK PADILLA VALIDO', '2019-09-07', '11:05:47', 1, 'POR VALIDAR DIRECCION', '2019-09-07 11:05:47', '2019-09-07 11:05:47');
INSERT INTO `bitacoras` VALUES (573, 'incidencia', 120, 750, 2150, 'RODOLFO ROSAS VALIDO', '2019-09-07', '11:41:12', 1, 'POR VALIDAR DIRECCION', '2019-09-07 11:41:12', '2019-09-07 11:41:12');
INSERT INTO `bitacoras` VALUES (574, 'incidencia', 128, 117, 2243, 'La incidencia paso a ser: autorizar', '2019-09-07', '11:41:53', 1, 'autorizar', '2019-09-07 11:41:53', '2019-09-07 11:41:53');
INSERT INTO `bitacoras` VALUES (575, 'incidencia', 126, 117, 2080, 'La incidencia paso a ser: autorizar', '2019-09-07', '11:41:53', 1, 'autorizar', '2019-09-07 11:41:53', '2019-09-07 11:41:53');
INSERT INTO `bitacoras` VALUES (576, 'incidencia', 123, 117, 2311, 'La incidencia paso a ser: autorizar', '2019-09-07', '11:41:53', 1, 'autorizar', '2019-09-07 11:41:53', '2019-09-07 11:41:53');
INSERT INTO `bitacoras` VALUES (577, 'incidencia', 121, 117, 2150, 'La incidencia paso a ser: autorizar', '2019-09-07', '11:41:53', 1, 'autorizar', '2019-09-07 11:41:53', '2019-09-07 11:41:53');
INSERT INTO `bitacoras` VALUES (578, 'incidencia', 127, 45, 1336, 'La incidencia paso a ser: autorizar', '2019-09-07', '11:42:39', 1, 'autorizar', '2019-09-07 11:42:39', '2019-09-07 11:42:39');
INSERT INTO `bitacoras` VALUES (579, 'incidencia', 120, 45, 2150, 'La incidencia paso a ser: cancelar', '2019-09-07', '11:42:39', 1, 'cancelar', '2019-09-07 11:42:39', '2019-09-07 11:42:39');
INSERT INTO `bitacoras` VALUES (580, 'incidencia', 130, 82, 776, 'La incidencia paso a ser: autorizar', '2019-09-07', '11:43:09', 1, 'autorizar', '2019-09-07 11:43:09', '2019-09-07 11:43:09');
INSERT INTO `bitacoras` VALUES (581, 'incidencia', 129, 750, 776, 'RODOLFO ROSAS VALIDO', '2019-09-07', '12:14:11', 1, 'POR VALIDAR DIRECCION', '2019-09-07 12:14:11', '2019-09-07 12:14:11');
INSERT INTO `bitacoras` VALUES (582, 'incidencia', 125, 750, 2350, 'RODOLFO ROSAS VALIDO', '2019-09-07', '12:14:14', 1, 'POR VALIDAR DIRECCION', '2019-09-07 12:14:14', '2019-09-07 12:14:14');
INSERT INTO `bitacoras` VALUES (583, 'incidencia', 131, 750, 2150, 'SE HA CREADO UNA INCIDENCIA', '2019-09-07', '12:34:17', 1, 'SOLICITADO', '2019-09-07 12:34:17', '2019-09-07 12:34:17');
INSERT INTO `bitacoras` VALUES (584, 'incidencia', 131, 750, 2150, 'RODOLFO ROSAS VALIDO', '2019-09-07', '12:34:32', 1, 'POR VALIDAR DIRECCION', '2019-09-07 12:34:32', '2019-09-07 12:34:32');

-- ----------------------------
-- Table structure for catalogo_entidades_mexico
-- ----------------------------
DROP TABLE IF EXISTS `catalogo_entidades_mexico`;
CREATE TABLE `catalogo_entidades_mexico`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of catalogo_entidades_mexico
-- ----------------------------
INSERT INTO `catalogo_entidades_mexico` VALUES (1, 'AGUASCALIENTES');
INSERT INTO `catalogo_entidades_mexico` VALUES (2, 'BAJA CALIFORNIA');
INSERT INTO `catalogo_entidades_mexico` VALUES (3, 'BAJA CALIFORNIA SUR');
INSERT INTO `catalogo_entidades_mexico` VALUES (4, 'CAMPECHE');
INSERT INTO `catalogo_entidades_mexico` VALUES (5, 'COAHUILA');
INSERT INTO `catalogo_entidades_mexico` VALUES (6, 'COLIMA');
INSERT INTO `catalogo_entidades_mexico` VALUES (7, 'CHIAPAS');
INSERT INTO `catalogo_entidades_mexico` VALUES (8, 'CHIHUAHUA');
INSERT INTO `catalogo_entidades_mexico` VALUES (9, 'CIUDAD DE MÉXICO');
INSERT INTO `catalogo_entidades_mexico` VALUES (10, 'DURANGO');
INSERT INTO `catalogo_entidades_mexico` VALUES (11, 'GUANAJUATO');
INSERT INTO `catalogo_entidades_mexico` VALUES (12, 'GUERRERO');
INSERT INTO `catalogo_entidades_mexico` VALUES (13, 'HIDALGO');
INSERT INTO `catalogo_entidades_mexico` VALUES (14, 'JALISCO');
INSERT INTO `catalogo_entidades_mexico` VALUES (15, 'MÉXICO');
INSERT INTO `catalogo_entidades_mexico` VALUES (16, 'MICHOACÁN');
INSERT INTO `catalogo_entidades_mexico` VALUES (17, 'MORELOS');
INSERT INTO `catalogo_entidades_mexico` VALUES (18, 'NAYARIT');
INSERT INTO `catalogo_entidades_mexico` VALUES (19, 'NUEVO LEÓN');
INSERT INTO `catalogo_entidades_mexico` VALUES (20, 'OAXACA');
INSERT INTO `catalogo_entidades_mexico` VALUES (21, 'PUEBLA');
INSERT INTO `catalogo_entidades_mexico` VALUES (22, 'QUERÉTARO');
INSERT INTO `catalogo_entidades_mexico` VALUES (23, 'QUINTANA ROO');
INSERT INTO `catalogo_entidades_mexico` VALUES (24, 'SAN LUIS POTOSÍ');
INSERT INTO `catalogo_entidades_mexico` VALUES (25, 'SINALOA');
INSERT INTO `catalogo_entidades_mexico` VALUES (26, 'SONORA');
INSERT INTO `catalogo_entidades_mexico` VALUES (27, 'TABASCO');
INSERT INTO `catalogo_entidades_mexico` VALUES (28, 'TAMAULIPAS');
INSERT INTO `catalogo_entidades_mexico` VALUES (29, 'TLAXCALA');
INSERT INTO `catalogo_entidades_mexico` VALUES (30, 'VERACRUZ');
INSERT INTO `catalogo_entidades_mexico` VALUES (31, 'YUCATÁN');
INSERT INTO `catalogo_entidades_mexico` VALUES (32, 'ZACATECAS');

-- ----------------------------
-- Table structure for catalogo_planes_lineas
-- ----------------------------
DROP TABLE IF EXISTS `catalogo_planes_lineas`;
CREATE TABLE `catalogo_planes_lineas`  (
  `plan_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `plan_codigo` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `plan_nombre` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `plan_tipo` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `plan_descripcion` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `plan_costo` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `plan_precio` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `plan_empresa` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `plan_proveedor` enum('MOVISTAR','TELCEL','AT&T','IUSACELL') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'MOVISTAR',
  `activo` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  PRIMARY KEY (`plan_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 79 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of catalogo_planes_lineas
-- ----------------------------
INSERT INTO `catalogo_planes_lineas` VALUES (1, 'S200', 'SELECT 200', '0', '', 257.75, 810.00, 'TODOS', 'MOVISTAR', 0);
INSERT INTO `catalogo_planes_lineas` VALUES (2, 'S300', 'SELECT 300', 'CONTROLADO', NULL, 343.96, 1320.00, 'TODOS', 'MOVISTAR', 0);
INSERT INTO `catalogo_planes_lineas` VALUES (3, 'S300*', 'SELECT 300*', 'CONTROLADO', NULL, 343.96, 1750.00, 'ALCATEL', 'MOVISTAR', 0);
INSERT INTO `catalogo_planes_lineas` VALUES (4, 'S400', 'SELECT 400', 'CONTROLADO', NULL, 559.48, 2010.00, 'TODOS', 'MOVISTAR', 0);
INSERT INTO `catalogo_planes_lineas` VALUES (5, 'S400*', 'SELECT 400*', 'CONTROLADO', NULL, 559.48, 2500.00, 'ALCATEL', 'MOVISTAR', 0);
INSERT INTO `catalogo_planes_lineas` VALUES (6, 'INTERNET MOVIL', 'INTERNET MOVIL', 'CONTROLADO', NULL, 231.89, 960.00, 'TODOS', 'MOVISTAR', 0);
INSERT INTO `catalogo_planes_lineas` VALUES (7, 'ELITE', 'ELITE PLUS CTRL NEG 500', 'CONTROLADO', NULL, 511.00, 1640.00, 'TODOS', 'IUSACELL', 0);
INSERT INTO `catalogo_planes_lineas` VALUES (8, 'LIBERTAD', 'LIBERTAD 699 BB 1GB', 'CONTROLADO', NULL, 775.00, 1640.00, 'TODOS', 'IUSACELL', 0);
INSERT INTO `catalogo_planes_lineas` VALUES (9, 'S200*', 'SELECT 200*', 'CONTROLADO', NULL, 257.75, 1320.00, 'ALCATEL', 'MOVISTAR', 0);
INSERT INTO `catalogo_planes_lineas` VALUES (10, 'S400*', 'SELECT400*', 'CONTROLADO', NULL, 559.48, 1320.00, NULL, 'MOVISTAR', 0);
INSERT INTO `catalogo_planes_lineas` VALUES (11, 'S200*', 'SELECT 200*', 'CONTROLADO', NULL, 257.75, 2010.00, NULL, 'MOVISTAR', 0);
INSERT INTO `catalogo_planes_lineas` VALUES (12, 'S300*', 'SELECT 300*', 'CONTROLADO', NULL, 343.96, 2010.00, NULL, 'MOVISTAR', 0);
INSERT INTO `catalogo_planes_lineas` VALUES (13, 'S400*', 'SELECT 400*', 'CONTROLADO', NULL, 559.48, 1750.00, NULL, 'MOVISTAR', 0);
INSERT INTO `catalogo_planes_lineas` VALUES (14, 'LIBERTAD*', 'LIBERTAD 699 BB 1GB*', 'CONTROLADO', NULL, 775.00, 810.00, NULL, 'MOVISTAR', 0);
INSERT INTO `catalogo_planes_lineas` VALUES (15, 'LIBERTAD*', 'LIBERTAD 699 BB 1GB*', 'CONTROLADO', NULL, 775.00, 2010.00, NULL, 'MOVISTAR', 0);
INSERT INTO `catalogo_planes_lineas` VALUES (16, 'S300*', 'SELECT 300*', 'CONTROLADO', NULL, 343.96, 810.00, NULL, 'MOVISTAR', 0);
INSERT INTO `catalogo_planes_lineas` VALUES (17, 'S400*', 'SELECT 400*', 'CONTROLADO', NULL, 559.48, 810.00, NULL, 'MOVISTAR', 0);
INSERT INTO `catalogo_planes_lineas` VALUES (18, 'PRO 300', 'TELCEL  PRO CONTROL 300', 'CONTROLADO', '', 299.00, 810.00, '', 'TELCEL', 0);
INSERT INTO `catalogo_planes_lineas` VALUES (19, 'PRO 500', 'TELCEL  PRO CONTROL 500', 'CONTROLADO', '', 399.00, 1320.00, '', 'TELCEL', 0);
INSERT INTO `catalogo_planes_lineas` VALUES (20, 'PRO 1000', 'TELCEL  PRO CONTROL 1000', 'CONTROLADO', '', 699.00, 2010.00, '', 'TELCEL', 0);
INSERT INTO `catalogo_planes_lineas` VALUES (21, 'PRO 2000', 'TELCEL  PRO CONTROL 2000', 'CONTROLADO', '', 1249.00, 0.00, '', 'TELCEL', 0);
INSERT INTO `catalogo_planes_lineas` VALUES (22, 'PRO 500*', 'TELCEL PRO CONTROL 500*', NULL, NULL, 399.00, 2010.00, NULL, 'MOVISTAR', 0);
INSERT INTO `catalogo_planes_lineas` VALUES (23, 'UNIDOS 539', 'UNIDOS TODO 539 C RX', 'CONTROLADO', NULL, 599.00, 0.00, NULL, 'IUSACELL', 0);
INSERT INTO `catalogo_planes_lineas` VALUES (24, 'PRO TOTAL', 'TELCEL PRO TOTAL', 'CONTROLADO', NULL, 1999.00, 0.00, 'TELCEL', 'TELCEL', 0);
INSERT INTO `catalogo_planes_lineas` VALUES (25, 'UNIDOS 699', 'UNIDOS TODO NEG 699 C RX', 'CONTROLADO', NULL, 654.00, 0.00, NULL, 'IUSACELL', 0);
INSERT INTO `catalogo_planes_lineas` VALUES (26, 'UNIDOS 499', 'UNIDOS TODO NEG 499 C RX', 'CONTROLADO', NULL, 482.00, 0.00, NULL, 'IUSACELL', 0);
INSERT INTO `catalogo_planes_lineas` VALUES (27, 'TPRO EMP CC 300 CC24\r\n', 'TPRO EMP CC 300 CC24\r\n', 'CONTROLADO', 'Voz: 330 min Datos:1.8 gb Redes sociales: 500 mb\r\n', 299.00, 0.00, 'TODOS', 'TELCEL', 1);
INSERT INTO `catalogo_planes_lineas` VALUES (54, 'TPRO EMP CC 500 CC24', 'TPRO EMP CC 500 CC24', 'CONTROLADO', 'Voz: 550 min Datos:3.3 gb Redes sociales: 700 mb\r\n', 499.00, 0.00, 'TODOS', 'TELCEL', 1);
INSERT INTO `catalogo_planes_lineas` VALUES (55, 'TPRO EMP CC 1000CC24\r\n', 'TPRO EMP CC 1000CC24\r\n', 'CONTROLADO', 'Voz: 1100 min Datos:6.6 gb Redes sociales: 700 mb', 699.00, 0.00, 'TODOS', 'TELCEL', 1);
INSERT INTO `catalogo_planes_lineas` VALUES (56, 'TPRO EMP RI1200 CC24\r\n', 'TPRO EMP RI1200 CC24\r\n', 'ABIERTO', 'Voz: 2000 min Datos:13 gb Redes sociales: 3 gb', 1349.00, 0.00, 'TODOS', 'TELCEL', 1);
INSERT INTO `catalogo_planes_lineas` VALUES (57, 'TPRO EMP CC 2000CC24\r\n', 'TPRO EMP CC 2000CC24\r\n', 'CONTROLADO', 'Voz: 1500 min Datos: 10gb Redes Sociales: 2gb\r\n', 1248.98, 0.00, 'TODOS', 'TELCEL', 1);
INSERT INTO `catalogo_planes_lineas` VALUES (58, 'TPRO EMP TOTAL CC 24\r\n', 'TPRO EMP TOTAL CC 24\r\n', 'ABIERTO', 'Voz: ilimitados Datos: 12.0 gb Redes sociales: 1gb\r\n', 1999.00, 0.00, 'TODOS', 'TELCEL', 1);
INSERT INTO `catalogo_planes_lineas` VALUES (59, 'MAXSLE CC 2000CC4G24\r\n', 'MAXSLE CC 2000CC4G24\r\n', 'CONTROLADO', 'Voz: Ilimitado min Datos: 2.75gb Redes sociales: 1 gb\r\n', 319.00, 0.00, 'TODOS', 'TELCEL', 1);
INSERT INTO `catalogo_planes_lineas` VALUES (60, 'MAXSLE CC 3000CC4G24\r\n', 'MAXSLE CC 3000CC4G24\r\n', 'CONTROLADO', 'Voz: Ilimitado min Datos: 3.75gb Redes sociales: 1 gb\r\n', 424.00, 0.00, 'TODOS', 'TELCEL', 1);
INSERT INTO `catalogo_planes_lineas` VALUES (61, 'MAXSLE CC 5000CC4G24\r\n', 'MAXSLE CC 5000CC4G24\r\n', 'CONTROLADO', 'Voz: Ilimitado min Datos: 5.75gb Redes sociales: 1 gb\r\n', 549.00, 0.00, 'TODOS', 'TELCEL', 1);
INSERT INTO `catalogo_planes_lineas` VALUES (62, 'MAXSLE CC 6000CC4G24\r\n', 'MAXSLE CC 6000CC4G24\r\n', 'CONTROLADO', 'Voz: Ilimitado min Datos: 6.75gb Redes sociales: 1 gb\r\n', 649.00, 0.00, 'TODOS', 'TELCEL', 1);
INSERT INTO `catalogo_planes_lineas` VALUES (63, 'TMSLE CC 12000 CC 24\r\n', 'TMSLE CC 12000 CC 24\r\n', 'CONTROLADO', 'Voz: Ilimitado min Datos: 15.5gb Redes sociales: 1 gb\r\n', 1399.00, 0.00, 'TODOS', 'TELCEL', 1);
INSERT INTO `catalogo_planes_lineas` VALUES (64, 'ATT Con Todo NEG 499\r\n', 'ATT Con Todo NEG 499\r\n', 'CONTROLADO', 'Voz: Ilimitado min Datos: 4.6gb Redes sociales: ilimitadas\r\n', 430.17, 0.00, 'TODOS', 'AT&T', 1);
INSERT INTO `catalogo_planes_lineas` VALUES (65, 'ATT Con Todo NEG 649\r\n', 'ATT Con Todo NEG 649\r\n', 'CONTROLADO', 'Voz: Ilimitado min Datos: 6.6gb Redes sociales: ilimitadas\r\n', 559.48, 0.00, 'TODOS', 'AT&T', 1);
INSERT INTO `catalogo_planes_lineas` VALUES (66, 'VAS A VOLAR 2.0\r\n', 'VAS A VOLAR 2.0\r\n', 'CONTROLADO', 'Voz: Ilimitado min Datos: 7.0gb Redes sociales: 1 gb\r\n', 599.00, 0.00, 'TODOS', 'MOVISTAR', 1);
INSERT INTO `catalogo_planes_lineas` VALUES (67, 'VAS A VOLAR 3.5\r\n', 'VAS A VOLAR 3.5\r\n', 'CONTROLADO', 'Voz: Ilimitado min Datos: 12.0gb Redes sociales: 1 gb\r\n', 999.00, 0.00, 'TODOS', 'MOVISTAR', 1);
INSERT INTO `catalogo_planes_lineas` VALUES (68, 'INT MOV 3gb', 'INT MOV 3gb', 'CONTROLADO', 'Navegacion de datos: 3gb', 269.00, 0.00, 'TODOS', 'MOVISTAR', 1);
INSERT INTO `catalogo_planes_lineas` VALUES (69, 'INT 5GB CO 18M TB', 'INT 5GB CO 18M TB', 'CONTROLADO', 'Navegacion de datos: 5gb', 429.00, 0.00, 'TODOS', 'TELCEL', 1);
INSERT INTO `catalogo_planes_lineas` VALUES (70, 'UnidosTodo NEG 499 C\r\n', 'UnidosTodo NEG 499 C\r\n', 'CONTROLADO', 'Voz: Ilimitado min Datos: 4.6gb Redes sociales: ilimitadas\r\n', 430.17, 0.00, 'TODOS', 'AT&T', 1);
INSERT INTO `catalogo_planes_lineas` VALUES (71, 'UnidosTodo NEG 699 C\r\n', 'UnidosTodo NEG 699 C\r\n', 'CONTROLADO', 'Voz: Ilimitado min Datos: 6.6gb Redes sociales: ilimitadas\r\n', 559.48, 0.00, 'TODOS', 'AT&T', 1);
INSERT INTO `catalogo_planes_lineas` VALUES (72, 'INTERNET MIXTO 10 GB', 'INTERNET MIXTO 10 GB', 'CONTROLADO', 'Voz: 0 min Datos: 10.0gb Redes sociales: ilimitadas', 579.00, 0.00, 'TODOS', 'TELCEL', 1);
INSERT INTO `catalogo_planes_lineas` VALUES (73, 'ATT Todo 299 NEG C\r\n', 'ATT Todo 299 NEG C\r\n', 'CONTORLADO', 'Voz: Ilimitado min Datos: 15.0gb Redes sociales: ilimitadas\r\n', 450.00, 0.00, 'TODOS', 'AT&T', 0);
INSERT INTO `catalogo_planes_lineas` VALUES (74, 'INTERNET TELCEL EMPRESA 20000 ', 'INTERNET TELCEL EMPRESA 20000 ', 'CONTROLADO', NULL, 1199.00, 0.00, 'TELCEL', 'TELCEL', 1);
INSERT INTO `catalogo_planes_lineas` VALUES (78, 'Intesrnetfff', 'copisasfff', '', 'detsallesfff', 90.00, 70.00, 'TELCEL', 'TELCEL', 1);

-- ----------------------------
-- Table structure for catalogo_razon_capital
-- ----------------------------
DROP TABLE IF EXISTS `catalogo_razon_capital`;
CREATE TABLE `catalogo_razon_capital`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `estatus` enum('ACTIVO','INACTIVO') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 811 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of catalogo_razon_capital
-- ----------------------------
INSERT INTO `catalogo_razon_capital` VALUES (647, 'WORK CENTER HUMAN RESOURCES', 'ACTIVO');
INSERT INTO `catalogo_razon_capital` VALUES (648, 'SOLUCIONES INTEGRALES 10', 'ACTIVO');
INSERT INTO `catalogo_razon_capital` VALUES (655, 'CONSTRU10', 'ACTIVO');
INSERT INTO `catalogo_razon_capital` VALUES (657, 'KLEVER 10', 'ACTIVO');
INSERT INTO `catalogo_razon_capital` VALUES (659, 'HUMAN 10', 'ACTIVO');
INSERT INTO `catalogo_razon_capital` VALUES (660, 'EXCELLENT STAFF', 'ACTIVO');
INSERT INTO `catalogo_razon_capital` VALUES (669, 'FASE DIEZ', 'ACTIVO');
INSERT INTO `catalogo_razon_capital` VALUES (683, 'TECNOLOGIAS ASIMILABLES', 'ACTIVO');
INSERT INTO `catalogo_razon_capital` VALUES (698, 'A-KLEVER 10 SA DE CV', 'ACTIVO');
INSERT INTO `catalogo_razon_capital` VALUES (703, 'CALIDAD EMPRESARIAL APLICADA', 'ACTIVO');
INSERT INTO `catalogo_razon_capital` VALUES (711, 'GN COACH', 'ACTIVO');
INSERT INTO `catalogo_razon_capital` VALUES (718, 'A-SEC2 S.A DE C.V.', 'ACTIVO');
INSERT INTO `catalogo_razon_capital` VALUES (770, 'BUSINESS ECOSYSTEM', 'ACTIVO');
INSERT INTO `catalogo_razon_capital` VALUES (810, 'TAX STRUCTURE & LEGAL', 'ACTIVO');

-- ----------------------------
-- Table structure for catalogo_wbs
-- ----------------------------
DROP TABLE IF EXISTS `catalogo_wbs`;
CREATE TABLE `catalogo_wbs`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cliente` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `servicio` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `region` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `tecnologia` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `grupo` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `estatus` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `catalogo_wbs_cliente_foreign`(`cliente`) USING BTREE,
  INDEX `catalogo_wbs_servicio_foreign`(`servicio`) USING BTREE,
  INDEX `catalogo_wbs_region_foreign`(`region`) USING BTREE,
  INDEX `catalogo_wbs_tecnologia_foreign`(`tecnologia`) USING BTREE,
  INDEX `catalogo_wbs_grupo_foreign`(`grupo`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2160 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of catalogo_wbs
-- ----------------------------
INSERT INTO `catalogo_wbs` VALUES (1, 'IND', 'CORP', 'CUAU', 'NOC0', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (2, 'IND', 'CORP', 'CUAU', 'INCA', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (3, 'IND', 'CORP', 'CUAU', 'VACA', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (4, 'IND', 'CORP', 'CUAU', 'PECS', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (5, 'IND', 'CORP', 'CUAU', 'PESS', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (6, 'IND', 'CORP', 'CUAU', 'CAPA', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (7, 'IND', 'CORP', 'CUAU', 'FEST', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (8, 'IND', 'ADMO', 'CUAU', 'GRAL', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (9, 'IND', 'ADMO', 'CUAU', 'INCA', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (10, 'IND', 'ADMO', 'CUAU', 'VACA', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (11, 'IND', 'ADMO', 'CUAU', 'PECS', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (12, 'IND', 'ADMO', 'CUAU', 'PESS', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (13, 'IND', 'ADMO', 'CUAU', 'CAPA', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (14, 'IND', 'ADMO', 'CUAU', 'FEST', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (15, 'IND', 'ADMO', 'CUAU', 'ADMI', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (16, 'NOK', 'RCUA', 'METR', 'VDSL', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (17, 'NOK', 'RCUA', 'NORE', 'VDSL', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (18, 'NOK', 'RCUA', 'SURE', 'VDSL', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (19, 'NOK', 'RCUA', 'NOTE', 'VDSL', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (20, 'NOK', 'RCUA', 'TELN', 'VDSL', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (21, 'NOK', 'RCUA', 'METR', 'LADA', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (22, 'NOK', 'RCUA', 'NORE', 'LADA', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (23, 'NOK', 'RCUA', 'SURE', 'LADA', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (24, 'NOK', 'RCUA', 'NOTE', 'LADA', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (25, 'NOK', 'RCUA', 'TELN', 'LADA', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (26, 'NOK', 'RCUA', 'METR', 'RDA0', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (27, 'NOK', 'RCUA', 'NORE', 'RDA0', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (28, 'NOK', 'RCUA', 'SURE', 'RDA0', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (29, 'NOK', 'RCUA', 'NOTE', 'RDA0', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (30, 'NOK', 'RCUA', 'TELN', 'RDA0', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (31, 'NOK', 'RCUA', 'METR', 'CAET', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (32, 'NOK', 'RCUA', 'NORE', 'CAET', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (33, 'NOK', 'RCUA', 'SURE', 'CAET', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (34, 'NOK', 'RCUA', 'NOTE', 'CAET', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (35, 'NOK', 'RCUA', 'TELN', 'CAET', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (36, 'NOK', 'RCUA', 'METR', 'CLAS', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (37, 'NOK', 'RCUA', 'NORE', 'CLAS', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (38, 'NOK', 'RCUA', 'SURE', 'CLAS', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (39, 'NOK', 'RCUA', 'NOTE', 'CLAS', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (40, 'NOK', 'RCUA', 'TELN', 'CLAS', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (41, 'NOK', 'RSUP', 'METR', 'VDSL', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (42, 'NOK', 'RSUP', 'NORE', 'VDSL', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (43, 'NOK', 'RSUP', 'SURE', 'VDSL', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (44, 'NOK', 'RSUP', 'NOTE', 'VDSL', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (45, 'NOK', 'RSUP', 'TELN', 'VDSL', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (46, 'NOK', 'RSUP', 'METR', 'LADA', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (47, 'NOK', 'RSUP', 'NORE', 'LADA', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (48, 'NOK', 'RSUP', 'SURE', 'LADA', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (49, 'NOK', 'RSUP', 'NOTE', 'LADA', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (50, 'NOK', 'RSUP', 'TELN', 'LADA', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (51, 'NOK', 'RSUP', 'METR', 'RDA0', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (52, 'NOK', 'RSUP', 'NORE', 'RDA0', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (53, 'NOK', 'RSUP', 'SURE', 'RDA0', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (54, 'NOK', 'RSUP', 'NOTE', 'RDA0', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (55, 'NOK', 'RSUP', 'TELN', 'RDA0', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (56, 'NOK', 'RSUP', 'METR', 'CAET', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (57, 'NOK', 'RSUP', 'NORE', 'CAET', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (58, 'NOK', 'RSUP', 'SURE', 'CAET', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (59, 'NOK', 'RSUP', 'NOTE', 'CAET', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (60, 'NOK', 'RSUP', 'TELN', 'CAET', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (61, 'NOK', 'RSUP', 'METR', 'GPON', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (62, 'NOK', 'RSUP', 'NORE', 'GPON', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (63, 'NOK', 'RSUP', 'SURE', 'GPON', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (64, 'NOK', 'RSUP', 'NOTE', 'GPON', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (65, 'NOK', 'RSUP', 'TELN', 'GPON', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (66, 'NOK', 'RSUP', 'METR', 'CLAS', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (67, 'NOK', 'RSUP', 'NORE', 'CLAS', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (68, 'NOK', 'RSUP', 'SURE', 'CLAS', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (69, 'NOK', 'RSUP', 'NOTE', 'CLAS', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (70, 'NOK', 'RSUP', 'TELN', 'CLAS', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (71, 'NOK', 'RSUP', 'METR', 'TBAS', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (72, 'NOK', 'RSUP', 'NORE', 'TBAS', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (73, 'NOK', 'RSUP', 'SURE', 'TBAS', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (74, 'NOK', 'RSUP', 'NOTE', 'TBAS', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (75, 'NOK', 'RSUP', 'TELN', 'TBAS', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (76, 'NOK', 'RSUP', 'METR', 'ATRS', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (77, 'NOK', 'RSUP', 'NORE', 'ATRS', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (78, 'NOK', 'RSUP', 'SURE', 'ATRS', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (79, 'NOK', 'RSUP', 'NOTE', 'ATRS', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (80, 'NOK', 'RSUP', 'TELN', 'ATRS', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (81, 'NOK', 'RCOR', 'METR', 'VDSL', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (82, 'NOK', 'RCOR', 'NORE', 'VDSL', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (83, 'NOK', 'RCOR', 'SURE', 'VDSL', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (84, 'NOK', 'RCOR', 'NOTE', 'VDSL', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (85, 'NOK', 'RCOR', 'TELN', 'VDSL', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (86, 'NOK', 'RCOR', 'METR', 'LADA', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (87, 'NOK', 'RCOR', 'NORE', 'LADA', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (88, 'NOK', 'RCOR', 'SURE', 'LADA', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (89, 'NOK', 'RCOR', 'NOTE', 'LADA', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (90, 'NOK', 'RCOR', 'TELN', 'LADA', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (91, 'NOK', 'RCOR', 'METR', 'RDA0', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (92, 'NOK', 'RCOR', 'NORE', 'RDA0', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (93, 'NOK', 'RCOR', 'SURE', 'RDA0', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (94, 'NOK', 'RCOR', 'NOTE', 'RDA0', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (95, 'NOK', 'RCOR', 'TELN', 'RDA0', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (96, 'NOK', 'RCOR', 'METR', 'CAET', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (97, 'NOK', 'RCOR', 'NORE', 'CAET', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (98, 'NOK', 'RCOR', 'SURE', 'CAET', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (99, 'NOK', 'RCOR', 'NOTE', 'CAET', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (100, 'NOK', 'RCOR', 'TELN', 'CAET', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (101, 'NOK', 'RCOR', 'METR', 'GPON', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (102, 'NOK', 'RCOR', 'NORE', 'GPON', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (103, 'NOK', 'RCOR', 'SURE', 'GPON', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (104, 'NOK', 'RCOR', 'NOTE', 'GPON', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (105, 'NOK', 'RCOR', 'TELN', 'GPON', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (106, 'NOK', 'RCOR', 'METR', 'CLAS', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (107, 'NOK', 'RCOR', 'NORE', 'CLAS', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (108, 'NOK', 'RCOR', 'SURE', 'CLAS', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (109, 'NOK', 'RCOR', 'NOTE', 'CLAS', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (110, 'NOK', 'RCOR', 'TELN', 'CLAS', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (111, 'NOK', 'RCOR', 'METR', 'TBAS', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (112, 'NOK', 'RCOR', 'NORE', 'TBAS', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (113, 'NOK', 'RCOR', 'SURE', 'TBAS', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (114, 'NOK', 'RCOR', 'NOTE', 'TBAS', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (115, 'NOK', 'RCOR', 'TELN', 'TBAS', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (116, 'NOK', 'RCOR', 'METR', 'ATRS', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (117, 'NOK', 'RCOR', 'NORE', 'ATRS', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (118, 'NOK', 'RCOR', 'SURE', 'ATRS', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (119, 'NOK', 'RCOR', 'NOTE', 'ATRS', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (120, 'NOK', 'RCOR', 'TELN', 'ATRS', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (121, 'NOK', 'RPRO', 'METR', 'VDSL', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (122, 'NOK', 'RPRO', 'NORE', 'VDSL', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (123, 'NOK', 'RPRO', 'SURE', 'VDSL', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (124, 'NOK', 'RPRO', 'NOTE', 'VDSL', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (125, 'NOK', 'RPRO', 'TELN', 'VDSL', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (126, 'NOK', 'RPRO', 'METR', 'LADA', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (127, 'NOK', 'RPRO', 'NORE', 'LADA', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (128, 'NOK', 'RPRO', 'SURE', 'LADA', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (129, 'NOK', 'RPRO', 'NOTE', 'LADA', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (130, 'NOK', 'RPRO', 'TELN', 'LADA', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (131, 'NOK', 'RPRO', 'METR', 'RDA0', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (132, 'NOK', 'RPRO', 'NORE', 'RDA0', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (133, 'NOK', 'RPRO', 'SURE', 'RDA0', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (134, 'NOK', 'RPRO', 'NOTE', 'RDA0', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (135, 'NOK', 'RPRO', 'TELN', 'RDA0', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (136, 'NOK', 'RPRO', 'METR', 'CAET', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (137, 'NOK', 'RPRO', 'NORE', 'CAET', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (138, 'NOK', 'RPRO', 'SURE', 'CAET', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (139, 'NOK', 'RPRO', 'NOTE', 'CAET', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (140, 'NOK', 'RPRO', 'TELN', 'CAET', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (141, 'NOK', 'RPRO', 'METR', 'GPON', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (142, 'NOK', 'RPRO', 'NORE', 'GPON', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (143, 'NOK', 'RPRO', 'SURE', 'GPON', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (144, 'NOK', 'RPRO', 'NOTE', 'GPON', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (145, 'NOK', 'RPRO', 'TELN', 'GPON', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (146, 'NOK', 'RPRO', 'METR', 'CLAS', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (147, 'NOK', 'RPRO', 'NORE', 'CLAS', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (148, 'NOK', 'RPRO', 'SURE', 'CLAS', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (149, 'NOK', 'RPRO', 'NOTE', 'CLAS', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (150, 'NOK', 'RPRO', 'TELN', 'CLAS', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (151, 'NOK', 'RPRO', 'METR', 'TBAS', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (152, 'NOK', 'RPRO', 'NORE', 'TBAS', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (153, 'NOK', 'RPRO', 'SURE', 'TBAS', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (154, 'NOK', 'RPRO', 'NOTE', 'TBAS', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (155, 'NOK', 'RPRO', 'TELN', 'TBAS', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (156, 'NOK', 'RPRO', 'METR', 'ATRS', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (157, 'NOK', 'RPRO', 'NORE', 'ATRS', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (158, 'NOK', 'RPRO', 'SURE', 'ATRS', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (159, 'NOK', 'RPRO', 'NOTE', 'ATRS', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (160, 'NOK', 'RPRO', 'TELN', 'ATRS', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (161, 'NOK', 'RREC', 'NCNL', 'TAC0', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (162, 'NOK', 'RREC', 'GTML', 'TAC0', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (163, 'NOK', 'RREC', 'NCNL', 'ETRP', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (164, 'NOK', 'RREC', 'NCNL', 'NOC0', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (165, 'NOK', 'RREC', 'NCNL', 'PMIP', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (166, 'NOK', 'RREC', 'NCNL', 'PMRT', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (167, 'NOK', 'RREC', 'NCNL', 'PMFN', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (168, 'NOK', 'RREC', 'NCNL', 'PMO0', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (169, 'NOK', 'RREC', 'NCNL', 'FIFO', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (170, 'NOK', 'RREC', 'NCNL', 'AWTD', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (171, 'NOK', 'RREC', 'NCNL', 'NIPD', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (172, 'NOK', 'RREC', 'NCNL', 'PZTE', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (173, 'NOK', 'RREC', 'NCNL', 'WTMX', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (174, 'NOK', 'RREC', 'NCNL', 'NTIN', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (175, 'NOK', 'RREC', 'NCNL', 'DEOP', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (176, 'NOK', 'RREC', 'NCNL', 'COTE', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (177, 'NOK', 'RREC', 'NCNL', 'OTRS', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (178, 'NOK', 'RREC', 'NCNL', 'ATRS', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (179, 'NOK', 'RREC', 'NCNL', 'M641', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (180, 'NOK', 'RREC', 'NCNL', 'M626', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (181, 'NOK', 'RREC', 'NCNL', 'SRME', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (182, 'NOK', 'RREC', 'GTML', 'M641', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (183, 'NOK', 'INST', 'METR', 'VDSL', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (184, 'NOK', 'INST', 'NORE', 'VDSL', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (185, 'NOK', 'INST', 'SURE', 'VDSL', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (186, 'NOK', 'INST', 'NOTE', 'VDSL', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (187, 'NOK', 'INST', 'TELN', 'VDSL', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (188, 'NOK', 'INST', 'METR', 'TBAS', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (189, 'NOK', 'INST', 'NORE', 'TBAS', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (190, 'NOK', 'INST', 'SURE', 'TBAS', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (191, 'NOK', 'INST', 'NOTE', 'TBAS', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (192, 'NOK', 'INST', 'TELN', 'TBAS', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (193, 'NOK', 'INST', 'METR', 'TRAS', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (194, 'NOK', 'INST', 'NORE', 'TRAS', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (195, 'NOK', 'INST', 'SURE', 'TRAS', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (196, 'NOK', 'INST', 'NOTE', 'TRAS', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (197, 'NOK', 'INST', 'TELN', 'TRAS', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (198, 'NOK', 'INST', 'METR', 'LADA', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (199, 'NOK', 'INST', 'NORE', 'LADA', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (200, 'NOK', 'INST', 'SURE', 'LADA', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (201, 'NOK', 'INST', 'NOTE', 'LADA', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (202, 'NOK', 'INST', 'TELN', 'LADA', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (203, 'NOK', 'INST', 'METR', 'GPON', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (204, 'NOK', 'INST', 'NORE', 'GPON', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (205, 'NOK', 'INST', 'SURE', 'GPON', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (206, 'NOK', 'INST', 'NOTE', 'GPON', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (207, 'NOK', 'INST', 'TELN', 'GPON', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (208, 'NOK', 'INST', 'METR', 'MIWA', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (209, 'NOK', 'INST', 'NORE', 'MIWA', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (210, 'NOK', 'INST', 'SURE', 'MIWA', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (211, 'NOK', 'INST', 'NOTE', 'MIWA', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (212, 'NOK', 'INST', 'TELN', 'MIWA', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (213, 'NOK', 'INST', 'METR', 'RDA0', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (214, 'NOK', 'INST', 'NORE', 'RDA0', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (215, 'NOK', 'INST', 'SURE', 'RDA0', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (216, 'NOK', 'INST', 'NOTE', 'RDA0', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (217, 'NOK', 'INST', 'TELN', 'RDA0', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (218, 'NOK', 'INST', 'METR', 'CAET', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (219, 'NOK', 'INST', 'NORE', 'CAET', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (220, 'NOK', 'INST', 'SURE', 'CAET', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (221, 'NOK', 'INST', 'NOTE', 'CAET', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (222, 'NOK', 'INST', 'TELN', 'CAET', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (223, 'NOK', 'INST', 'METR', 'CLAS', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (224, 'NOK', 'INST', 'NORE', 'CLAS', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (225, 'NOK', 'INST', 'SURE', 'CLAS', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (226, 'NOK', 'INST', 'NOTE', 'CLAS', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (227, 'NOK', 'INST', 'TELN', 'CLAS', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (228, 'NOK', 'INST', 'NCNL', 'NATT', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (229, 'NOK', 'INST', 'NCNL', 'NALS', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (230, 'NOK', 'INST', 'NCNL', 'NTEL', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (231, 'NOK', 'INST', 'GTML', 'M641', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (232, 'NOK', 'INST', 'NCNL', 'SIAC', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (233, 'NOK', 'INST', 'NCNL', 'INCA', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (234, 'NOK', 'INST', 'NCNL', 'VACA', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (235, 'NOK', 'INST', 'NCNL', 'PECS', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (236, 'NOK', 'INST', 'NCNL', 'PESS', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (237, 'NOK', 'INST', 'NCNL', 'CAPA', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (238, 'NOK', 'INST', 'NCNL', 'FEST', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (239, 'NOK', 'INST', 'NCNL', 'SSF1', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (240, 'NOK', 'INST', 'NCNL', 'SSF2', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (241, 'NOK', 'INST', 'NCNL', 'SSLO', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (242, 'TIM', 'VARI', 'RE01', 'RAN0', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (243, 'TIM', 'VARI', 'RE02', 'RAN0', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (244, 'TIM', 'VARI', 'RE03', 'RAN0', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (245, 'TIM', 'VARI', 'RE04', 'RAN0', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (246, 'TIM', 'VARI', 'RE05', 'RAN0', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (247, 'TIM', 'VARI', 'RE06', 'RAN0', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (248, 'TIM', 'VARI', 'RE07', 'RAN0', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (249, 'TIM', 'VARI', 'RE08', 'RAN0', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (250, 'TIM', 'VARI', 'RE09', 'RAN0', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (251, 'TIM', 'VARI', 'NCNL', 'SIAC', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (252, 'TIM', 'VARI', 'NCNL', 'INCA', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (253, 'TIM', 'VARI', 'NCNL', 'VACA', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (254, 'TIM', 'VARI', 'NCNL', 'PECS', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (255, 'TIM', 'VARI', 'NCNL', 'PESS', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (256, 'TIM', 'VARI', 'NCNL', 'CAPA', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (257, 'TIM', 'VARI', 'NCNL', 'FEST', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (258, 'TIM', 'VARI', 'NCNL', 'ADMI', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (259, 'TIM', 'VARI', 'RE03', 'RAN0', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (260, 'TIM', 'VARI', 'NCNL', 'MATE', '102', 1);
INSERT INTO `catalogo_wbs` VALUES (261, 'TIM', 'VARI', 'RE03', 'RAN0', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (262, 'NCR', 'VARI', 'RE01', 'BNMX', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (263, 'NCR', 'VARI', 'RE02', 'BNMX', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (264, 'NCR', 'VARI', 'RE03', 'BNMX', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (265, 'NCR', 'VARI', 'RE04', 'BNMX', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (266, 'NCR', 'VARI', 'RE05', 'BNMX', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (267, 'NCR', 'VARI', 'RE06', 'BNMX', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (268, 'NCR', 'VARI', 'RE07', 'BNMX', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (269, 'NCR', 'VARI', 'RE08', 'BNMX', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (270, 'NCR', 'VARI', 'RE09', 'BNMX', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (271, 'NCR', 'VARI', 'NCNL', 'SIAC', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (272, 'NCR', 'VARI', 'NCNL', 'INCA', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (273, 'NCR', 'VARI', 'NCNL', 'VACA', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (274, 'NCR', 'VARI', 'NCNL', 'PECS', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (275, 'NCR', 'VARI', 'NCNL', 'PESS', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (276, 'NCR', 'VARI', 'NCNL', 'CAPA', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (277, 'NCR', 'VARI', 'NCNL', 'FEST', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (278, 'NCR', 'VARI', 'NCNL', 'ADMI', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (279, 'NCR', 'VARI', 'NCNL', 'MATE', '102', 1);
INSERT INTO `catalogo_wbs` VALUES (280, 'ALE', 'RREC', 'NCNL', 'ALE0', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (281, 'DHN', 'STF0', 'RE01', 'DEHN', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (282, 'DHN', 'STF0', 'RE02', 'DEHN', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (283, 'DHN', 'STF0', 'RE03', 'DEHN', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (284, 'DHN', 'STF0', 'RE04', 'DEHN', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (285, 'DHN', 'STF0', 'RE05', 'DEHN', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (286, 'DHN', 'STF0', 'RE06', 'DEHN', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (287, 'DHN', 'STF0', 'RE07', 'DEHN', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (288, 'DHN', 'STF0', 'RE08', 'DEHN', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (289, 'DHN', 'STF0', 'RE09', 'DEHN', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (290, 'DHN', 'STF0', 'NCNL', 'SIAC', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (291, 'DHN', 'STF0', 'NCNL', 'INCA', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (292, 'DHN', 'STF0', 'NCNL', 'VACA', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (293, 'DHN', 'STF0', 'NCNL', 'PECS', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (294, 'DHN', 'STF0', 'NCNL', 'PESS', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (295, 'DHN', 'STF0', 'NCNL', 'CAPA', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (296, 'DHN', 'STF0', 'NCNL', 'FEST', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (297, 'DHN', 'STF0', 'NCNL', 'ADMI', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (298, 'DHN', 'STF0', 'NCNL', 'MATE', '102', 1);
INSERT INTO `catalogo_wbs` VALUES (299, 'CIC', 'STF0', 'RE01', 'DEHN', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (300, 'CIC', 'STF0', 'RE02', 'DEHN', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (301, 'CIC', 'STF0', 'RE03', 'DEHN', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (302, 'CIC', 'STF0', 'RE04', 'DEHN', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (303, 'CIC', 'STF0', 'RE05', 'DEHN', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (304, 'CIC', 'STF0', 'RE06', 'DEHN', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (305, 'CIC', 'STF0', 'RE07', 'DEHN', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (306, 'CIC', 'STF0', 'RE08', 'DEHN', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (307, 'CIC', 'STF0', 'RE09', 'DEHN', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (308, 'CIC', 'STF0', 'NCNL', 'SIAC', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (309, 'CIC', 'STF0', 'NCNL', 'INCA', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (310, 'CIC', 'STF0', 'NCNL', 'VACA', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (311, 'CIC', 'STF0', 'NCNL', 'PECS', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (312, 'CIC', 'STF0', 'NCNL', 'PESS', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (313, 'CIC', 'STF0', 'NCNL', 'CAPA', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (314, 'CIC', 'STF0', 'NCNL', 'FEST', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (315, 'CIC', 'STF0', 'NCNL', 'ADMI', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (316, 'CIC', 'STF0', 'NCNL', 'MATE', '102', 1);
INSERT INTO `catalogo_wbs` VALUES (317, 'NFR', 'STF0', 'RE01', 'DEHN', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (318, 'NFR', 'STF0', 'RE02', 'DEHN', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (319, 'NFR', 'STF0', 'RE03', 'DEHN', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (320, 'NFR', 'STF0', 'RE04', 'DEHN', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (321, 'NFR', 'STF0', 'RE05', 'DEHN', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (322, 'NFR', 'STF0', 'RE06', 'DEHN', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (323, 'NFR', 'STF0', 'RE07', 'DEHN', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (324, 'NFR', 'STF0', 'RE08', 'DEHN', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (325, 'NFR', 'STF0', 'RE09', 'DEHN', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (326, 'NFR', 'STF0', 'NCNL', 'SIAC', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (327, 'NFR', 'STF0', 'NCNL', 'INCA', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (328, 'NFR', 'STF0', 'NCNL', 'VACA', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (329, 'NFR', 'STF0', 'NCNL', 'PECS', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (330, 'NFR', 'STF0', 'NCNL', 'PESS', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (331, 'NFR', 'STF0', 'NCNL', 'CAPA', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (332, 'NFR', 'STF0', 'NCNL', 'FEST', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (333, 'NFR', 'STF0', 'NCNL', 'ADMI', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (334, 'NFR', 'STF0', 'NCNL', 'MATE', '102', 1);
INSERT INTO `catalogo_wbs` VALUES (335, 'TRM', 'STF0', 'RE01', 'DEHN', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (336, 'TRM', 'STF0', 'RE02', 'DEHN', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (337, 'TRM', 'STF0', 'RE03', 'DEHN', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (338, 'TRM', 'STF0', 'RE04', 'DEHN', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (339, 'TRM', 'STF0', 'RE05', 'DEHN', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (340, 'TRM', 'STF0', 'RE06', 'DEHN', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (341, 'TRM', 'STF0', 'RE07', 'DEHN', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (342, 'TRM', 'STF0', 'RE08', 'DEHN', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (343, 'TRM', 'STF0', 'RE09', 'DEHN', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (344, 'TRM', 'STF0', 'NCNL', 'SIAC', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (345, 'TRM', 'STF0', 'NCNL', 'INCA', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (346, 'TRM', 'STF0', 'NCNL', 'VACA', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (347, 'TRM', 'STF0', 'NCNL', 'PECS', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (348, 'TRM', 'STF0', 'NCNL', 'PESS', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (349, 'TRM', 'STF0', 'NCNL', 'CAPA', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (350, 'TRM', 'STF0', 'NCNL', 'FEST', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (351, 'TRM', 'STF0', 'NCNL', 'ADMI', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (352, 'TRM', 'STF0', 'NCNL', 'MATE', '102', 1);
INSERT INTO `catalogo_wbs` VALUES (353, 'MXS', 'STF0', 'RE01', 'DEHN', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (354, 'MXS', 'STF0', 'RE02', 'DEHN', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (355, 'MXS', 'STF0', 'RE03', 'DEHN', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (356, 'MXS', 'STF0', 'RE04', 'DEHN', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (357, 'MXS', 'STF0', 'RE05', 'DEHN', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (358, 'MXS', 'STF0', 'RE06', 'DEHN', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (359, 'MXS', 'STF0', 'RE07', 'DEHN', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (360, 'MXS', 'STF0', 'RE08', 'DEHN', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (361, 'MXS', 'STF0', 'RE09', 'DEHN', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (362, 'MXS', 'STF0', 'NCNL', 'SIAC', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (363, 'MXS', 'STF0', 'NCNL', 'INCA', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (364, 'MXS', 'STF0', 'NCNL', 'VACA', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (365, 'MXS', 'STF0', 'NCNL', 'PECS', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (366, 'MXS', 'STF0', 'NCNL', 'PESS', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (367, 'MXS', 'STF0', 'NCNL', 'CAPA', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (368, 'MXS', 'STF0', 'NCNL', 'FEST', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (369, 'MXS', 'STF0', 'NCNL', 'ADMI', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (370, 'MXS', 'STF0', 'NCNL', 'MATE', '102', 1);
INSERT INTO `catalogo_wbs` VALUES (371, 'ATT', 'RREC', 'NCNL', 'PMNA', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (372, 'ATT', 'RREC', 'NCNL', 'PMNA', '300', 1);
INSERT INTO `catalogo_wbs` VALUES (373, 'GSB', 'VARI', 'METR', 'INTE', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (374, 'SEG', 'INST', 'RE01', 'SUAL', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (375, 'SEG', 'INST', 'RE02', 'SUAL', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (376, 'SEG', 'INST', 'RE03', 'SUAL', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (377, 'SEG', 'INST', 'RE04', 'SUAL', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (378, 'SEG', 'INST', 'RE05', 'SUAL', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (379, 'SEG', 'INST', 'RE06', 'SUAL', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (380, 'SEG', 'INST', 'RE07', 'SUAL', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (381, 'SEG', 'INST', 'RE08', 'SUAL', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (382, 'SEG', 'INST', 'RE09', 'SUAL', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (383, 'SEG', 'INST', 'NCNL', 'SIAC', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (384, 'SEG', 'INST', 'NCNL', 'INCA', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (385, 'SEG', 'INST', 'NCNL', 'VACA', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (386, 'SEG', 'INST', 'NCNL', 'PECS', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (387, 'SEG', 'INST', 'NCNL', 'PESS', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (388, 'SEG', 'INST', 'NCNL', 'CAPA', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (389, 'SEG', 'INST', 'NCNL', 'FEST', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (390, 'SEG', 'INST', 'NCNL', 'ADMI', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (391, 'SEG', 'INST', 'NCNL', 'MATE', '102', 1);
INSERT INTO `catalogo_wbs` VALUES (392, 'CIS', 'INST', 'RE01', 'MXCO', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (393, 'CIS', 'INST', 'RE02', 'MXCO', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (394, 'CIS', 'INST', 'RE03', 'MXCO', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (395, 'CIS', 'INST', 'RE04', 'MXCO', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (396, 'CIS', 'INST', 'RE05', 'MXCO', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (397, 'CIS', 'INST', 'RE06', 'MXCO', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (398, 'CIS', 'INST', 'RE07', 'MXCO', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (399, 'CIS', 'INST', 'RE08', 'MXCO', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (400, 'CIS', 'INST', 'RE09', 'MXCO', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (401, 'CIS', 'INST', 'RE01', 'RCDT', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (402, 'CIS', 'INST', 'RE02', 'RCDT', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (403, 'CIS', 'INST', 'RE03', 'RCDT', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (404, 'CIS', 'INST', 'RE04', 'RCDT', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (405, 'CIS', 'INST', 'RE05', 'RCDT', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (406, 'CIS', 'INST', 'RE06', 'RCDT', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (407, 'CIS', 'INST', 'RE07', 'RCDT', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (408, 'CIS', 'INST', 'RE08', 'RCDT', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (409, 'CIS', 'INST', 'RE09', 'RCDT', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (410, 'CIS', 'INST', 'NCNL', 'ADRC', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (411, 'ETP', 'RREC', 'METR', 'PMO0', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (412, 'HUW', 'INST', 'NCNL', 'PMO0', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (413, 'HUW', 'INST', 'NCNL', 'COOR', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (414, 'HUW', 'INST', 'NCNL', 'CAPA', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (415, 'HUW', 'INST', 'NCNL', 'SIAC', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (416, 'NAE', 'INST', 'NCNL', 'SISF', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (417, 'NAE', 'INST', 'NCNL', 'SMMO', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (418, 'NOK', 'GADI', 'NCNL', 'TACO', '101', 0);
INSERT INTO `catalogo_wbs` VALUES (419, 'NOK', 'GADI', 'NCNL', 'ETRP', '101', 0);
INSERT INTO `catalogo_wbs` VALUES (420, 'NOK', 'GADI', 'NCNL', 'NOC0', '101', 0);
INSERT INTO `catalogo_wbs` VALUES (421, 'NOK', 'GADI', 'NCNL', 'PMIP', '101', 0);
INSERT INTO `catalogo_wbs` VALUES (422, 'NOK', 'GADI', 'NCNL', 'PMRT', '101', 0);
INSERT INTO `catalogo_wbs` VALUES (423, 'NOK', 'GADI', 'NCNL', 'PMFN', '101', 0);
INSERT INTO `catalogo_wbs` VALUES (424, 'NOK', 'GADI', 'NCNL', 'PMO0', '101', 0);
INSERT INTO `catalogo_wbs` VALUES (425, 'NOK', 'GADI', 'NCNL', 'FIFO', '101', 0);
INSERT INTO `catalogo_wbs` VALUES (426, 'NOK', 'GADI', 'NCNL', 'AWTD', '101', 0);
INSERT INTO `catalogo_wbs` VALUES (427, 'NOK', 'GADI', 'NCNL', 'NIPD', '101', 0);
INSERT INTO `catalogo_wbs` VALUES (428, 'NOK', 'GADI', 'NCNL', 'PZTE', '101', 0);
INSERT INTO `catalogo_wbs` VALUES (429, 'NOK', 'GADI', 'NCNL', 'WTMX', '101', 0);
INSERT INTO `catalogo_wbs` VALUES (430, 'NOK', 'GADI', 'NCNL', 'NTIN', '101', 0);
INSERT INTO `catalogo_wbs` VALUES (431, 'NOK', 'GADI', 'NCNL', 'DEOP', '101', 0);
INSERT INTO `catalogo_wbs` VALUES (432, 'NOK', 'GADI', 'NCNL', 'COTE', '101', 0);
INSERT INTO `catalogo_wbs` VALUES (433, 'NOK', 'GADI', 'NCNL', 'OTRS', '101', 0);
INSERT INTO `catalogo_wbs` VALUES (434, 'NOK', 'GADI', 'NCNL', 'ATRS', '101', 0);
INSERT INTO `catalogo_wbs` VALUES (435, 'NOK', 'GADI', 'NCNL', 'M641', '101', 0);
INSERT INTO `catalogo_wbs` VALUES (436, 'NOK', 'GADI', 'NCNL', 'M626', '101', 0);
INSERT INTO `catalogo_wbs` VALUES (437, 'NOK', 'GADI', 'NCNL', 'SRME', '101', 0);
INSERT INTO `catalogo_wbs` VALUES (438, 'NOK', 'RSUP', 'METR', 'VDSL', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (439, 'NOK', 'RSUP', 'NORE', 'VDSL', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (440, 'NOK', 'RSUP', 'SURE', 'VDSL', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (441, 'NOK', 'RSUP', 'NOTE', 'VDSL', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (442, 'NOK', 'RSUP', 'TELN', 'VDSL', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (443, 'NOK', 'RSUP', 'METR', 'LADA', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (444, 'NOK', 'RSUP', 'NORE', 'LADA', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (445, 'NOK', 'RSUP', 'SURE', 'LADA', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (446, 'NOK', 'RSUP', 'NOTE', 'LADA', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (447, 'NOK', 'RSUP', 'TELN', 'LADA', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (448, 'NOK', 'RSUP', 'METR', 'RDA0', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (449, 'NOK', 'RSUP', 'NORE', 'RDA0', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (450, 'NOK', 'RSUP', 'SURE', 'RDA0', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (451, 'NOK', 'RSUP', 'NOTE', 'RDA0', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (452, 'NOK', 'RSUP', 'TELN', 'RDA0', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (453, 'NOK', 'RSUP', 'METR', 'CAET', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (454, 'NOK', 'RSUP', 'NORE', 'CAET', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (455, 'NOK', 'RSUP', 'SURE', 'CAET', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (456, 'NOK', 'RSUP', 'NOTE', 'CAET', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (457, 'NOK', 'RSUP', 'TELN', 'CAET', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (458, 'NOK', 'RSUP', 'METR', 'GPON', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (459, 'NOK', 'RSUP', 'NORE', 'GPON', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (460, 'NOK', 'RSUP', 'SURE', 'GPON', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (461, 'NOK', 'RSUP', 'NOTE', 'GPON', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (462, 'NOK', 'RSUP', 'TELN', 'GPON', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (463, 'NOK', 'RSUP', 'METR', 'CLAS', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (464, 'NOK', 'RSUP', 'NORE', 'CLAS', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (465, 'NOK', 'RSUP', 'SURE', 'CLAS', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (466, 'NOK', 'RSUP', 'NOTE', 'CLAS', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (467, 'NOK', 'RSUP', 'TELN', 'CLAS', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (468, 'NOK', 'RSUP', 'METR', 'TBAS', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (469, 'NOK', 'RSUP', 'NORE', 'TBAS', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (470, 'NOK', 'RSUP', 'SURE', 'TBAS', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (471, 'NOK', 'RSUP', 'NOTE', 'TBAS', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (472, 'NOK', 'RSUP', 'TELN', 'TBAS', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (473, 'NOK', 'RSUP', 'METR', 'ATRS', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (474, 'NOK', 'RSUP', 'NORE', 'ATRS', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (475, 'NOK', 'RSUP', 'SURE', 'ATRS', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (476, 'NOK', 'RSUP', 'NOTE', 'ATRS', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (477, 'NOK', 'RSUP', 'TELN', 'ATRS', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (478, 'NOK', 'RCOR', 'METR', 'VDSL', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (479, 'NOK', 'RCOR', 'NORE', 'VDSL', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (480, 'NOK', 'RCOR', 'SURE', 'VDSL', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (481, 'NOK', 'RCOR', 'NOTE', 'VDSL', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (482, 'NOK', 'RCOR', 'TELN', 'VDSL', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (483, 'NOK', 'RCOR', 'METR', 'LADA', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (484, 'NOK', 'RCOR', 'NORE', 'LADA', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (485, 'NOK', 'RCOR', 'SURE', 'LADA', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (486, 'NOK', 'RCOR', 'NOTE', 'LADA', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (487, 'NOK', 'RCOR', 'TELN', 'LADA', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (488, 'NOK', 'RCOR', 'METR', 'RDA0', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (489, 'NOK', 'RCOR', 'NORE', 'RDA0', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (490, 'NOK', 'RCOR', 'SURE', 'RDA0', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (491, 'NOK', 'RCOR', 'NOTE', 'RDA0', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (492, 'NOK', 'RCOR', 'TELN', 'RDA0', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (493, 'NOK', 'RCOR', 'METR', 'CAET', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (494, 'NOK', 'RCOR', 'NORE', 'CAET', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (495, 'NOK', 'RCOR', 'SURE', 'CAET', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (496, 'NOK', 'RCOR', 'NOTE', 'CAET', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (497, 'NOK', 'RCOR', 'TELN', 'CAET', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (498, 'NOK', 'RCOR', 'METR', 'GPON', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (499, 'NOK', 'RCOR', 'NORE', 'GPON', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (500, 'NOK', 'RCOR', 'SURE', 'GPON', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (501, 'NOK', 'RCOR', 'NOTE', 'GPON', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (502, 'NOK', 'RCOR', 'TELN', 'GPON', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (503, 'NOK', 'RCOR', 'METR', 'CLAS', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (504, 'NOK', 'RCOR', 'NORE', 'CLAS', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (505, 'NOK', 'RCOR', 'SURE', 'CLAS', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (506, 'NOK', 'RCOR', 'NOTE', 'CLAS', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (507, 'NOK', 'RCOR', 'TELN', 'CLAS', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (508, 'NOK', 'RCOR', 'METR', 'TBAS', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (509, 'NOK', 'RCOR', 'NORE', 'TBAS', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (510, 'NOK', 'RCOR', 'SURE', 'TBAS', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (511, 'NOK', 'RCOR', 'NOTE', 'TBAS', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (512, 'NOK', 'RCOR', 'TELN', 'TBAS', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (513, 'NOK', 'RCOR', 'METR', 'ATRS', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (514, 'NOK', 'RCOR', 'NORE', 'ATRS', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (515, 'NOK', 'RCOR', 'SURE', 'ATRS', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (516, 'NOK', 'RCOR', 'NOTE', 'ATRS', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (517, 'NOK', 'RCOR', 'TELN', 'ATRS', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (518, 'NOK', 'RPRO', 'METR', 'VDSL', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (519, 'NOK', 'RPRO', 'NORE', 'VDSL', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (520, 'NOK', 'RPRO', 'SURE', 'VDSL', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (521, 'NOK', 'RPRO', 'NOTE', 'VDSL', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (522, 'NOK', 'RPRO', 'TELN', 'VDSL', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (523, 'NOK', 'RPRO', 'METR', 'LADA', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (524, 'NOK', 'RPRO', 'NORE', 'LADA', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (525, 'NOK', 'RPRO', 'SURE', 'LADA', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (526, 'NOK', 'RPRO', 'NOTE', 'LADA', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (527, 'NOK', 'RPRO', 'TELN', 'LADA', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (528, 'NOK', 'RPRO', 'METR', 'RDA0', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (529, 'NOK', 'RPRO', 'NORE', 'RDA0', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (530, 'NOK', 'RPRO', 'SURE', 'RDA0', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (531, 'NOK', 'RPRO', 'NOTE', 'RDA0', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (532, 'NOK', 'RPRO', 'TELN', 'RDA0', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (533, 'NOK', 'RPRO', 'METR', 'CAET', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (534, 'NOK', 'RPRO', 'NORE', 'CAET', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (535, 'NOK', 'RPRO', 'SURE', 'CAET', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (536, 'NOK', 'RPRO', 'NOTE', 'CAET', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (537, 'NOK', 'RPRO', 'TELN', 'CAET', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (538, 'NOK', 'RPRO', 'METR', 'GPON', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (539, 'NOK', 'RPRO', 'NORE', 'GPON', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (540, 'NOK', 'RPRO', 'SURE', 'GPON', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (541, 'NOK', 'RPRO', 'NOTE', 'GPON', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (542, 'NOK', 'RPRO', 'TELN', 'GPON', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (543, 'NOK', 'RPRO', 'METR', 'CLAS', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (544, 'NOK', 'RPRO', 'NORE', 'CLAS', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (545, 'NOK', 'RPRO', 'SURE', 'CLAS', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (546, 'NOK', 'RPRO', 'NOTE', 'CLAS', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (547, 'NOK', 'RPRO', 'TELN', 'CLAS', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (548, 'NOK', 'RPRO', 'METR', 'TBAS', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (549, 'NOK', 'RPRO', 'NORE', 'TBAS', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (550, 'NOK', 'RPRO', 'SURE', 'TBAS', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (551, 'NOK', 'RPRO', 'NOTE', 'TBAS', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (552, 'NOK', 'RPRO', 'TELN', 'TBAS', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (553, 'NOK', 'RPRO', 'METR', 'ATRS', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (554, 'NOK', 'RPRO', 'NORE', 'ATRS', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (555, 'NOK', 'RPRO', 'SURE', 'ATRS', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (556, 'NOK', 'RPRO', 'NOTE', 'ATRS', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (557, 'NOK', 'RPRO', 'TELN', 'ATRS', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (558, 'NOK', 'INST', 'METR', 'VDSL', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (559, 'NOK', 'INST', 'NORE', 'VDSL', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (560, 'NOK', 'INST', 'SURE', 'VDSL', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (561, 'NOK', 'INST', 'NOTE', 'VDSL', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (562, 'NOK', 'INST', 'TELN', 'VDSL', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (563, 'NOK', 'INST', 'METR', 'TBAS', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (564, 'NOK', 'INST', 'NORE', 'TBAS', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (565, 'NOK', 'INST', 'SURE', 'TBAS', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (566, 'NOK', 'INST', 'NOTE', 'TBAS', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (567, 'NOK', 'INST', 'TELN', 'TBAS', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (568, 'NOK', 'INST', 'METR', 'TRAS', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (569, 'NOK', 'INST', 'NORE', 'TRAS', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (570, 'NOK', 'INST', 'SURE', 'TRAS', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (571, 'NOK', 'INST', 'NOTE', 'TRAS', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (572, 'NOK', 'INST', 'TELN', 'TRAS', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (573, 'NOK', 'INST', 'METR', 'LADA', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (574, 'NOK', 'INST', 'NORE', 'LADA', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (575, 'NOK', 'INST', 'SURE', 'LADA', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (576, 'NOK', 'INST', 'NOTE', 'LADA', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (577, 'NOK', 'INST', 'TELN', 'LADA', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (578, 'NOK', 'INST', 'METR', 'GPON', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (579, 'NOK', 'INST', 'NORE', 'GPON', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (580, 'NOK', 'INST', 'SURE', 'GPON', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (581, 'NOK', 'INST', 'NOTE', 'GPON', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (582, 'NOK', 'INST', 'TELN', 'GPON', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (583, 'NOK', 'INST', 'METR', 'MIWA', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (584, 'NOK', 'INST', 'NORE', 'MIWA', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (585, 'NOK', 'INST', 'SURE', 'MIWA', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (586, 'NOK', 'INST', 'NOTE', 'MIWA', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (587, 'NOK', 'INST', 'TELN', 'MIWA', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (588, 'NOK', 'INST', 'METR', 'RDA0', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (589, 'NOK', 'INST', 'NORE', 'RDA0', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (590, 'NOK', 'INST', 'SURE', 'RDA0', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (591, 'NOK', 'INST', 'NOTE', 'RDA0', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (592, 'NOK', 'INST', 'TELN', 'RDA0', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (593, 'NOK', 'INST', 'METR', 'CAET', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (594, 'NOK', 'INST', 'NORE', 'CAET', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (595, 'NOK', 'INST', 'SURE', 'CAET', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (596, 'NOK', 'INST', 'NOTE', 'CAET', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (597, 'NOK', 'INST', 'TELN', 'CAET', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (598, 'NOK', 'INST', 'METR', 'CLAS', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (599, 'NOK', 'INST', 'NORE', 'CLAS', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (600, 'NOK', 'INST', 'SURE', 'CLAS', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (601, 'NOK', 'INST', 'NOTE', 'CLAS', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (602, 'NOK', 'INST', 'TELN', 'CLAS', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (603, 'NOK', 'INST', 'NCNL', 'NATT', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (604, 'NOK', 'INST', 'NCNL', 'NALS', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (605, 'NOK', 'INST', 'NCNL', 'NTEL', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (606, 'NOK', 'INST', 'NCNL', 'SSF1', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (607, 'NOK', 'INST', 'NCNL', 'SSF2', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (608, 'NOK', 'INST', 'NCNL', 'SSLO', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (609, 'NAE', 'INST', 'NCNL', 'SERV', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (610, 'NOK', 'RCUA', 'METR', 'VDSL', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (611, 'NOK', 'RCUA', 'NORE', 'VDSL', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (612, 'NOK', 'RCUA', 'SURE', 'VDSL', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (613, 'NOK', 'RCUA', 'NOTE', 'VDSL', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (614, 'NOK', 'RCUA', 'TELN', 'VDSL', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (615, 'NOK', 'RCUA', 'METR', 'LADA', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (616, 'NOK', 'RCUA', 'NORE', 'LADA', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (617, 'NOK', 'RCUA', 'SURE', 'LADA', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (618, 'NOK', 'RCUA', 'NOTE', 'LADA', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (619, 'NOK', 'RCUA', 'TELN', 'LADA', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (620, 'NOK', 'RCUA', 'METR', 'RDA0', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (621, 'NOK', 'RCUA', 'NORE', 'RDA0', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (622, 'NOK', 'RCUA', 'SURE', 'RDA0', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (623, 'NOK', 'RCUA', 'NOTE', 'RDA0', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (624, 'NOK', 'RCUA', 'TELN', 'RDA0', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (625, 'NOK', 'RCUA', 'METR', 'CAET', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (626, 'NOK', 'RCUA', 'NORE', 'CAET', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (627, 'NOK', 'RCUA', 'SURE', 'CAET', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (628, 'NOK', 'RCUA', 'NOTE', 'CAET', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (629, 'NOK', 'RCUA', 'TELN', 'CAET', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (630, 'NOK', 'RCUA', 'METR', 'CLAS', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (631, 'NOK', 'RCUA', 'NORE', 'CLAS', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (632, 'NOK', 'RCUA', 'SURE', 'CLAS', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (633, 'NOK', 'RCUA', 'NOTE', 'CLAS', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (634, 'NOK', 'RCUA', 'TELN', 'CLAS', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (635, 'NOK', 'RSUP', 'METR', 'VDSL', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (636, 'NOK', 'RSUP', 'NORE', 'VDSL', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (637, 'NOK', 'RSUP', 'SURE', 'VDSL', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (638, 'NOK', 'RSUP', 'NOTE', 'VDSL', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (639, 'NOK', 'RSUP', 'TELN', 'VDSL', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (640, 'NOK', 'RSUP', 'METR', 'LADA', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (641, 'NOK', 'RSUP', 'NORE', 'LADA', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (642, 'NOK', 'RSUP', 'SURE', 'LADA', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (643, 'NOK', 'RSUP', 'NOTE', 'LADA', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (644, 'NOK', 'RSUP', 'TELN', 'LADA', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (645, 'NOK', 'RSUP', 'METR', 'RDA0', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (646, 'NOK', 'RSUP', 'NORE', 'RDA0', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (647, 'NOK', 'RSUP', 'SURE', 'RDA0', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (648, 'NOK', 'RSUP', 'NOTE', 'RDA0', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (649, 'NOK', 'RSUP', 'TELN', 'RDA0', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (650, 'NOK', 'RSUP', 'METR', 'CAET', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (651, 'NOK', 'RSUP', 'NORE', 'CAET', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (652, 'NOK', 'RSUP', 'SURE', 'CAET', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (653, 'NOK', 'RSUP', 'NOTE', 'CAET', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (654, 'NOK', 'RSUP', 'TELN', 'CAET', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (655, 'NOK', 'RSUP', 'METR', 'GPON', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (656, 'NOK', 'RSUP', 'NORE', 'GPON', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (657, 'NOK', 'RSUP', 'SURE', 'GPON', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (658, 'NOK', 'RSUP', 'NOTE', 'GPON', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (659, 'NOK', 'RSUP', 'TELN', 'GPON', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (660, 'NOK', 'RSUP', 'METR', 'CLAS', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (661, 'NOK', 'RSUP', 'NORE', 'CLAS', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (662, 'NOK', 'RSUP', 'SURE', 'CLAS', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (663, 'NOK', 'RSUP', 'NOTE', 'CLAS', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (664, 'NOK', 'RSUP', 'TELN', 'CLAS', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (665, 'NOK', 'RSUP', 'METR', 'TBAS', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (666, 'NOK', 'RSUP', 'NORE', 'TBAS', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (667, 'NOK', 'RSUP', 'SURE', 'TBAS', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (668, 'NOK', 'RSUP', 'NOTE', 'TBAS', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (669, 'NOK', 'RSUP', 'TELN', 'TBAS', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (670, 'NOK', 'RSUP', 'METR', 'ATRS', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (671, 'NOK', 'RSUP', 'NORE', 'ATRS', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (672, 'NOK', 'RSUP', 'SURE', 'ATRS', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (673, 'NOK', 'RSUP', 'NOTE', 'ATRS', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (674, 'NOK', 'RSUP', 'TELN', 'ATRS', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (675, 'NOK', 'RCOR', 'METR', 'VDSL', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (676, 'NOK', 'RCOR', 'NORE', 'VDSL', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (677, 'NOK', 'RCOR', 'SURE', 'VDSL', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (678, 'NOK', 'RCOR', 'NOTE', 'VDSL', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (679, 'NOK', 'RCOR', 'TELN', 'VDSL', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (680, 'NOK', 'RCOR', 'METR', 'LADA', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (681, 'NOK', 'RCOR', 'NORE', 'LADA', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (682, 'NOK', 'RCOR', 'SURE', 'LADA', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (683, 'NOK', 'RCOR', 'NOTE', 'LADA', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (684, 'NOK', 'RCOR', 'TELN', 'LADA', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (685, 'NOK', 'RCOR', 'METR', 'RDA0', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (686, 'NOK', 'RCOR', 'NORE', 'RDA0', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (687, 'NOK', 'RCOR', 'SURE', 'RDA0', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (688, 'NOK', 'RCOR', 'NOTE', 'RDA0', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (689, 'NOK', 'RCOR', 'TELN', 'RDA0', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (690, 'NOK', 'RCOR', 'METR', 'CAET', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (691, 'NOK', 'RCOR', 'NORE', 'CAET', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (692, 'NOK', 'RCOR', 'SURE', 'CAET', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (693, 'NOK', 'RCOR', 'NOTE', 'CAET', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (694, 'NOK', 'RCOR', 'TELN', 'CAET', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (695, 'NOK', 'RCOR', 'METR', 'GPON', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (696, 'NOK', 'RCOR', 'NORE', 'GPON', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (697, 'NOK', 'RCOR', 'SURE', 'GPON', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (698, 'NOK', 'RCOR', 'NOTE', 'GPON', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (699, 'NOK', 'RCOR', 'TELN', 'GPON', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (700, 'NOK', 'RCOR', 'METR', 'CLAS', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (701, 'NOK', 'RCOR', 'NORE', 'CLAS', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (702, 'NOK', 'RCOR', 'SURE', 'CLAS', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (703, 'NOK', 'RCOR', 'NOTE', 'CLAS', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (704, 'NOK', 'RCOR', 'TELN', 'CLAS', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (705, 'NOK', 'RCOR', 'METR', 'TBAS', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (706, 'NOK', 'RCOR', 'NORE', 'TBAS', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (707, 'NOK', 'RCOR', 'SURE', 'TBAS', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (708, 'NOK', 'RCOR', 'NOTE', 'TBAS', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (709, 'NOK', 'RCOR', 'TELN', 'TBAS', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (710, 'NOK', 'RCOR', 'METR', 'ATRS', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (711, 'NOK', 'RCOR', 'NORE', 'ATRS', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (712, 'NOK', 'RCOR', 'SURE', 'ATRS', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (713, 'NOK', 'RCOR', 'NOTE', 'ATRS', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (714, 'NOK', 'RCOR', 'TELN', 'ATRS', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (715, 'NOK', 'RPRO', 'METR', 'VDSL', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (716, 'NOK', 'RPRO', 'NORE', 'VDSL', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (717, 'NOK', 'RPRO', 'SURE', 'VDSL', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (718, 'NOK', 'RPRO', 'NOTE', 'VDSL', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (719, 'NOK', 'RPRO', 'TELN', 'VDSL', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (720, 'NOK', 'RPRO', 'METR', 'LADA', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (721, 'NOK', 'RPRO', 'NORE', 'LADA', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (722, 'NOK', 'RPRO', 'SURE', 'LADA', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (723, 'NOK', 'RPRO', 'NOTE', 'LADA', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (724, 'NOK', 'RPRO', 'TELN', 'LADA', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (725, 'NOK', 'RPRO', 'METR', 'RDA0', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (726, 'NOK', 'RPRO', 'NORE', 'RDA0', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (727, 'NOK', 'RPRO', 'SURE', 'RDA0', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (728, 'NOK', 'RPRO', 'NOTE', 'RDA0', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (729, 'NOK', 'RPRO', 'TELN', 'RDA0', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (730, 'NOK', 'RPRO', 'METR', 'CAET', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (731, 'NOK', 'RPRO', 'NORE', 'CAET', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (732, 'NOK', 'RPRO', 'SURE', 'CAET', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (733, 'NOK', 'RPRO', 'NOTE', 'CAET', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (734, 'NOK', 'RPRO', 'TELN', 'CAET', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (735, 'NOK', 'RPRO', 'METR', 'GPON', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (736, 'NOK', 'RPRO', 'NORE', 'GPON', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (737, 'NOK', 'RPRO', 'SURE', 'GPON', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (738, 'NOK', 'RPRO', 'NOTE', 'GPON', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (739, 'NOK', 'RPRO', 'TELN', 'GPON', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (740, 'NOK', 'RPRO', 'METR', 'CLAS', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (741, 'NOK', 'RPRO', 'NORE', 'CLAS', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (742, 'NOK', 'RPRO', 'SURE', 'CLAS', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (743, 'NOK', 'RPRO', 'NOTE', 'CLAS', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (744, 'NOK', 'RPRO', 'TELN', 'CLAS', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (745, 'NOK', 'RPRO', 'METR', 'TBAS', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (746, 'NOK', 'RPRO', 'NORE', 'TBAS', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (747, 'NOK', 'RPRO', 'SURE', 'TBAS', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (748, 'NOK', 'RPRO', 'NOTE', 'TBAS', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (749, 'NOK', 'RPRO', 'TELN', 'TBAS', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (750, 'NOK', 'RPRO', 'METR', 'ATRS', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (751, 'NOK', 'RPRO', 'NORE', 'ATRS', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (752, 'NOK', 'RPRO', 'SURE', 'ATRS', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (753, 'NOK', 'RPRO', 'NOTE', 'ATRS', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (754, 'NOK', 'RPRO', 'TELN', 'ATRS', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (755, 'NOK', 'INST', 'METR', 'VDSL', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (756, 'NOK', 'INST', 'NORE', 'VDSL', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (757, 'NOK', 'INST', 'SURE', 'VDSL', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (758, 'NOK', 'INST', 'NOTE', 'VDSL', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (759, 'NOK', 'INST', 'TELN', 'VDSL', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (760, 'NOK', 'INST', 'METR', 'TBAS', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (761, 'NOK', 'INST', 'NORE', 'TBAS', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (762, 'NOK', 'INST', 'SURE', 'TBAS', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (763, 'NOK', 'INST', 'NOTE', 'TBAS', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (764, 'NOK', 'INST', 'TELN', 'TBAS', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (765, 'NOK', 'INST', 'METR', 'TRAS', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (766, 'NOK', 'INST', 'NORE', 'TRAS', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (767, 'NOK', 'INST', 'SURE', 'TRAS', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (768, 'NOK', 'INST', 'NOTE', 'TRAS', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (769, 'NOK', 'INST', 'TELN', 'TRAS', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (770, 'NOK', 'INST', 'METR', 'LADA', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (771, 'NOK', 'INST', 'NORE', 'LADA', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (772, 'NOK', 'INST', 'SURE', 'LADA', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (773, 'NOK', 'INST', 'NOTE', 'LADA', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (774, 'NOK', 'INST', 'TELN', 'LADA', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (775, 'NOK', 'INST', 'METR', 'GPON', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (776, 'NOK', 'INST', 'NORE', 'GPON', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (777, 'NOK', 'INST', 'SURE', 'GPON', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (778, 'NOK', 'INST', 'NOTE', 'GPON', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (779, 'NOK', 'INST', 'TELN', 'GPON', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (780, 'NOK', 'INST', 'METR', 'MIWA', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (781, 'NOK', 'INST', 'NORE', 'MIWA', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (782, 'NOK', 'INST', 'SURE', 'MIWA', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (783, 'NOK', 'INST', 'NOTE', 'MIWA', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (784, 'NOK', 'INST', 'TELN', 'MIWA', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (785, 'NOK', 'INST', 'METR', 'RDA0', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (786, 'NOK', 'INST', 'NORE', 'RDA0', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (787, 'NOK', 'INST', 'SURE', 'RDA0', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (788, 'NOK', 'INST', 'NOTE', 'RDA0', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (789, 'NOK', 'INST', 'TELN', 'RDA0', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (790, 'NOK', 'INST', 'METR', 'CAET', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (791, 'NOK', 'INST', 'NORE', 'CAET', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (792, 'NOK', 'INST', 'SURE', 'CAET', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (793, 'NOK', 'INST', 'NOTE', 'CAET', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (794, 'NOK', 'INST', 'TELN', 'CAET', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (795, 'NOK', 'INST', 'METR', 'CLAS', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (796, 'NOK', 'INST', 'NORE', 'CLAS', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (797, 'NOK', 'INST', 'SURE', 'CLAS', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (798, 'NOK', 'INST', 'NOTE', 'CLAS', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (799, 'NOK', 'INST', 'TELN', 'CLAS', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (800, 'NOK', 'INST', 'NCNL', 'NATT', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (801, 'NOK', 'INST', 'NCNL', 'NALS', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (802, 'NOK', 'INST', 'NCNL', 'NTEL', '201', 1);
INSERT INTO `catalogo_wbs` VALUES (803, 'NOK', 'RCUA', 'METR', 'VDSL', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (804, 'NOK', 'RCUA', 'NORE', 'VDSL', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (805, 'NOK', 'RCUA', 'SURE', 'VDSL', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (806, 'NOK', 'RCUA', 'NOTE', 'VDSL', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (807, 'NOK', 'RCUA', 'TELN', 'VDSL', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (808, 'NOK', 'RCUA', 'METR', 'LADA', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (809, 'NOK', 'RCUA', 'NORE', 'LADA', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (810, 'NOK', 'RCUA', 'SURE', 'LADA', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (811, 'NOK', 'RCUA', 'NOTE', 'LADA', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (812, 'NOK', 'RCUA', 'TELN', 'LADA', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (813, 'NOK', 'RCUA', 'METR', 'RDA0', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (814, 'NOK', 'RCUA', 'NORE', 'RDA0', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (815, 'NOK', 'RCUA', 'SURE', 'RDA0', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (816, 'NOK', 'RCUA', 'NOTE', 'RDA0', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (817, 'NOK', 'RCUA', 'TELN', 'RDA0', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (818, 'NOK', 'RCUA', 'METR', 'CAET', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (819, 'NOK', 'RCUA', 'NORE', 'CAET', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (820, 'NOK', 'RCUA', 'SURE', 'CAET', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (821, 'NOK', 'RCUA', 'NOTE', 'CAET', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (822, 'NOK', 'RCUA', 'TELN', 'CAET', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (823, 'NOK', 'RCUA', 'METR', 'CLAS', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (824, 'NOK', 'RCUA', 'NORE', 'CLAS', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (825, 'NOK', 'RCUA', 'SURE', 'CLAS', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (826, 'NOK', 'RCUA', 'NOTE', 'CLAS', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (827, 'NOK', 'RCUA', 'TELN', 'CLAS', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (828, 'NOK', 'RSUP', 'METR', 'VDSL', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (829, 'NOK', 'RSUP', 'NORE', 'VDSL', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (830, 'NOK', 'RSUP', 'SURE', 'VDSL', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (831, 'NOK', 'RSUP', 'NOTE', 'VDSL', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (832, 'NOK', 'RSUP', 'TELN', 'VDSL', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (833, 'NOK', 'RSUP', 'METR', 'LADA', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (834, 'NOK', 'RSUP', 'NORE', 'LADA', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (835, 'NOK', 'RSUP', 'SURE', 'LADA', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (836, 'NOK', 'RSUP', 'NOTE', 'LADA', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (837, 'NOK', 'RSUP', 'TELN', 'LADA', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (838, 'NOK', 'RSUP', 'METR', 'RDA0', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (839, 'NOK', 'RSUP', 'NORE', 'RDA0', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (840, 'NOK', 'RSUP', 'SURE', 'RDA0', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (841, 'NOK', 'RSUP', 'NOTE', 'RDA0', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (842, 'NOK', 'RSUP', 'TELN', 'RDA0', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (843, 'NOK', 'RSUP', 'METR', 'CAET', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (844, 'NOK', 'RSUP', 'NORE', 'CAET', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (845, 'NOK', 'RSUP', 'SURE', 'CAET', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (846, 'NOK', 'RSUP', 'NOTE', 'CAET', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (847, 'NOK', 'RSUP', 'TELN', 'CAET', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (848, 'NOK', 'RSUP', 'METR', 'GPON', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (849, 'NOK', 'RSUP', 'NORE', 'GPON', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (850, 'NOK', 'RSUP', 'SURE', 'GPON', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (851, 'NOK', 'RSUP', 'NOTE', 'GPON', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (852, 'NOK', 'RSUP', 'TELN', 'GPON', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (853, 'NOK', 'RSUP', 'METR', 'CLAS', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (854, 'NOK', 'RSUP', 'NORE', 'CLAS', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (855, 'NOK', 'RSUP', 'SURE', 'CLAS', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (856, 'NOK', 'RSUP', 'NOTE', 'CLAS', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (857, 'NOK', 'RSUP', 'TELN', 'CLAS', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (858, 'NOK', 'RSUP', 'METR', 'TBAS', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (859, 'NOK', 'RSUP', 'NORE', 'TBAS', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (860, 'NOK', 'RSUP', 'SURE', 'TBAS', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (861, 'NOK', 'RSUP', 'NOTE', 'TBAS', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (862, 'NOK', 'RSUP', 'TELN', 'TBAS', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (863, 'NOK', 'RSUP', 'METR', 'ATRS', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (864, 'NOK', 'RSUP', 'NORE', 'ATRS', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (865, 'NOK', 'RSUP', 'SURE', 'ATRS', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (866, 'NOK', 'RSUP', 'NOTE', 'ATRS', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (867, 'NOK', 'RSUP', 'TELN', 'ATRS', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (868, 'NOK', 'RCOR', 'METR', 'VDSL', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (869, 'NOK', 'RCOR', 'NORE', 'VDSL', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (870, 'NOK', 'RCOR', 'SURE', 'VDSL', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (871, 'NOK', 'RCOR', 'NOTE', 'VDSL', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (872, 'NOK', 'RCOR', 'TELN', 'VDSL', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (873, 'NOK', 'RCOR', 'METR', 'LADA', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (874, 'NOK', 'RCOR', 'NORE', 'LADA', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (875, 'NOK', 'RCOR', 'SURE', 'LADA', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (876, 'NOK', 'RCOR', 'NOTE', 'LADA', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (877, 'NOK', 'RCOR', 'TELN', 'LADA', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (878, 'NOK', 'RCOR', 'METR', 'RDA0', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (879, 'NOK', 'RCOR', 'NORE', 'RDA0', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (880, 'NOK', 'RCOR', 'SURE', 'RDA0', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (881, 'NOK', 'RCOR', 'NOTE', 'RDA0', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (882, 'NOK', 'RCOR', 'TELN', 'RDA0', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (883, 'NOK', 'RCOR', 'METR', 'CAET', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (884, 'NOK', 'RCOR', 'NORE', 'CAET', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (885, 'NOK', 'RCOR', 'SURE', 'CAET', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (886, 'NOK', 'RCOR', 'NOTE', 'CAET', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (887, 'NOK', 'RCOR', 'TELN', 'CAET', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (888, 'NOK', 'RCOR', 'METR', 'GPON', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (889, 'NOK', 'RCOR', 'NORE', 'GPON', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (890, 'NOK', 'RCOR', 'SURE', 'GPON', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (891, 'NOK', 'RCOR', 'NOTE', 'GPON', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (892, 'NOK', 'RCOR', 'TELN', 'GPON', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (893, 'NOK', 'RCOR', 'METR', 'CLAS', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (894, 'NOK', 'RCOR', 'NORE', 'CLAS', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (895, 'NOK', 'RCOR', 'SURE', 'CLAS', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (896, 'NOK', 'RCOR', 'NOTE', 'CLAS', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (897, 'NOK', 'RCOR', 'TELN', 'CLAS', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (898, 'NOK', 'RCOR', 'METR', 'TBAS', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (899, 'NOK', 'RCOR', 'NORE', 'TBAS', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (900, 'NOK', 'RCOR', 'SURE', 'TBAS', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (901, 'NOK', 'RCOR', 'NOTE', 'TBAS', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (902, 'NOK', 'RCOR', 'TELN', 'TBAS', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (903, 'NOK', 'RCOR', 'METR', 'ATRS', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (904, 'NOK', 'RCOR', 'NORE', 'ATRS', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (905, 'NOK', 'RCOR', 'SURE', 'ATRS', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (906, 'NOK', 'RCOR', 'NOTE', 'ATRS', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (907, 'NOK', 'RCOR', 'TELN', 'ATRS', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (908, 'NOK', 'RPRO', 'METR', 'VDSL', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (909, 'NOK', 'RPRO', 'NORE', 'VDSL', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (910, 'NOK', 'RPRO', 'SURE', 'VDSL', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (911, 'NOK', 'RPRO', 'NOTE', 'VDSL', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (912, 'NOK', 'RPRO', 'TELN', 'VDSL', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (913, 'NOK', 'RPRO', 'METR', 'LADA', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (914, 'NOK', 'RPRO', 'NORE', 'LADA', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (915, 'NOK', 'RPRO', 'SURE', 'LADA', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (916, 'NOK', 'RPRO', 'NOTE', 'LADA', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (917, 'NOK', 'RPRO', 'TELN', 'LADA', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (918, 'NOK', 'RPRO', 'METR', 'RDA0', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (919, 'NOK', 'RPRO', 'NORE', 'RDA0', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (920, 'NOK', 'RPRO', 'SURE', 'RDA0', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (921, 'NOK', 'RPRO', 'NOTE', 'RDA0', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (922, 'NOK', 'RPRO', 'TELN', 'RDA0', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (923, 'NOK', 'RPRO', 'METR', 'CAET', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (924, 'NOK', 'RPRO', 'NORE', 'CAET', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (925, 'NOK', 'RPRO', 'SURE', 'CAET', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (926, 'NOK', 'RPRO', 'NOTE', 'CAET', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (927, 'NOK', 'RPRO', 'TELN', 'CAET', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (928, 'NOK', 'RPRO', 'METR', 'GPON', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (929, 'NOK', 'RPRO', 'NORE', 'GPON', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (930, 'NOK', 'RPRO', 'SURE', 'GPON', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (931, 'NOK', 'RPRO', 'NOTE', 'GPON', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (932, 'NOK', 'RPRO', 'TELN', 'GPON', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (933, 'NOK', 'RPRO', 'METR', 'CLAS', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (934, 'NOK', 'RPRO', 'NORE', 'CLAS', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (935, 'NOK', 'RPRO', 'SURE', 'CLAS', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (936, 'NOK', 'RPRO', 'NOTE', 'CLAS', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (937, 'NOK', 'RPRO', 'TELN', 'CLAS', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (938, 'NOK', 'RPRO', 'METR', 'TBAS', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (939, 'NOK', 'RPRO', 'NORE', 'TBAS', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (940, 'NOK', 'RPRO', 'SURE', 'TBAS', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (941, 'NOK', 'RPRO', 'NOTE', 'TBAS', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (942, 'NOK', 'RPRO', 'TELN', 'TBAS', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (943, 'NOK', 'RPRO', 'METR', 'ATRS', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (944, 'NOK', 'RPRO', 'NORE', 'ATRS', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (945, 'NOK', 'RPRO', 'SURE', 'ATRS', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (946, 'NOK', 'RPRO', 'NOTE', 'ATRS', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (947, 'NOK', 'RPRO', 'TELN', 'ATRS', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (948, 'NOK', 'INST', 'METR', 'VDSL', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (949, 'NOK', 'INST', 'NORE', 'VDSL', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (950, 'NOK', 'INST', 'SURE', 'VDSL', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (951, 'NOK', 'INST', 'NOTE', 'VDSL', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (952, 'NOK', 'INST', 'TELN', 'VDSL', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (953, 'NOK', 'INST', 'METR', 'TBAS', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (954, 'NOK', 'INST', 'NORE', 'TBAS', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (955, 'NOK', 'INST', 'SURE', 'TBAS', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (956, 'NOK', 'INST', 'NOTE', 'TBAS', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (957, 'NOK', 'INST', 'TELN', 'TBAS', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (958, 'NOK', 'INST', 'METR', 'TRAS', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (959, 'NOK', 'INST', 'NORE', 'TRAS', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (960, 'NOK', 'INST', 'SURE', 'TRAS', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (961, 'NOK', 'INST', 'NOTE', 'TRAS', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (962, 'NOK', 'INST', 'TELN', 'TRAS', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (963, 'NOK', 'INST', 'METR', 'LADA', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (964, 'NOK', 'INST', 'NORE', 'LADA', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (965, 'NOK', 'INST', 'SURE', 'LADA', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (966, 'NOK', 'INST', 'NOTE', 'LADA', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (967, 'NOK', 'INST', 'TELN', 'LADA', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (968, 'NOK', 'INST', 'METR', 'GPON', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (969, 'NOK', 'INST', 'NORE', 'GPON', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (970, 'NOK', 'INST', 'SURE', 'GPON', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (971, 'NOK', 'INST', 'NOTE', 'GPON', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (972, 'NOK', 'INST', 'TELN', 'GPON', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (973, 'NOK', 'INST', 'METR', 'MIWA', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (974, 'NOK', 'INST', 'NORE', 'MIWA', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (975, 'NOK', 'INST', 'SURE', 'MIWA', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (976, 'NOK', 'INST', 'NOTE', 'MIWA', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (977, 'NOK', 'INST', 'TELN', 'MIWA', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (978, 'NOK', 'INST', 'METR', 'RDA0', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (979, 'NOK', 'INST', 'NORE', 'RDA0', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (980, 'NOK', 'INST', 'SURE', 'RDA0', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (981, 'NOK', 'INST', 'NOTE', 'RDA0', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (982, 'NOK', 'INST', 'TELN', 'RDA0', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (983, 'NOK', 'INST', 'METR', 'CAET', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (984, 'NOK', 'INST', 'NORE', 'CAET', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (985, 'NOK', 'INST', 'SURE', 'CAET', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (986, 'NOK', 'INST', 'NOTE', 'CAET', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (987, 'NOK', 'INST', 'TELN', 'CAET', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (988, 'NOK', 'INST', 'METR', 'CLAS', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (989, 'NOK', 'INST', 'NORE', 'CLAS', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (990, 'NOK', 'INST', 'SURE', 'CLAS', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (991, 'NOK', 'INST', 'NOTE', 'CLAS', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (992, 'NOK', 'INST', 'TELN', 'CLAS', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (993, 'NOK', 'INST', 'NCNL', 'NATT', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (994, 'NOK', 'INST', 'NCNL', 'NALS', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (995, 'NOK', 'INST', 'NCNL', 'NTEL', '202', 1);
INSERT INTO `catalogo_wbs` VALUES (996, 'NOK', 'RCUA', 'METR', 'VDSL', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (997, 'NOK', 'RCUA', 'NORE', 'VDSL', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (998, 'NOK', 'RCUA', 'SURE', 'VDSL', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (999, 'NOK', 'RCUA', 'NOTE', 'VDSL', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1000, 'NOK', 'RCUA', 'TELN', 'VDSL', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1001, 'NOK', 'RCUA', 'METR', 'LADA', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1002, 'NOK', 'RCUA', 'NORE', 'LADA', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1003, 'NOK', 'RCUA', 'SURE', 'LADA', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1004, 'NOK', 'RCUA', 'NOTE', 'LADA', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1005, 'NOK', 'RCUA', 'TELN', 'LADA', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1006, 'NOK', 'RCUA', 'METR', 'RDA0', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1007, 'NOK', 'RCUA', 'NORE', 'RDA0', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1008, 'NOK', 'RCUA', 'SURE', 'RDA0', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1009, 'NOK', 'RCUA', 'NOTE', 'RDA0', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1010, 'NOK', 'RCUA', 'TELN', 'RDA0', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1011, 'NOK', 'RCUA', 'METR', 'CAET', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1012, 'NOK', 'RCUA', 'NORE', 'CAET', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1013, 'NOK', 'RCUA', 'SURE', 'CAET', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1014, 'NOK', 'RCUA', 'NOTE', 'CAET', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1015, 'NOK', 'RCUA', 'TELN', 'CAET', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1016, 'NOK', 'RCUA', 'METR', 'CLAS', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1017, 'NOK', 'RCUA', 'NORE', 'CLAS', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1018, 'NOK', 'RCUA', 'SURE', 'CLAS', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1019, 'NOK', 'RCUA', 'NOTE', 'CLAS', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1020, 'NOK', 'RCUA', 'TELN', 'CLAS', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1021, 'NOK', 'RSUP', 'METR', 'VDSL', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1022, 'NOK', 'RSUP', 'NORE', 'VDSL', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1023, 'NOK', 'RSUP', 'SURE', 'VDSL', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1024, 'NOK', 'RSUP', 'NOTE', 'VDSL', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1025, 'NOK', 'RSUP', 'TELN', 'VDSL', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1026, 'NOK', 'RSUP', 'METR', 'LADA', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1027, 'NOK', 'RSUP', 'NORE', 'LADA', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1028, 'NOK', 'RSUP', 'SURE', 'LADA', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1029, 'NOK', 'RSUP', 'NOTE', 'LADA', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1030, 'NOK', 'RSUP', 'TELN', 'LADA', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1031, 'NOK', 'RSUP', 'METR', 'RDA0', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1032, 'NOK', 'RSUP', 'NORE', 'RDA0', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1033, 'NOK', 'RSUP', 'SURE', 'RDA0', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1034, 'NOK', 'RSUP', 'NOTE', 'RDA0', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1035, 'NOK', 'RSUP', 'TELN', 'RDA0', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1036, 'NOK', 'RSUP', 'METR', 'CAET', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1037, 'NOK', 'RSUP', 'NORE', 'CAET', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1038, 'NOK', 'RSUP', 'SURE', 'CAET', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1039, 'NOK', 'RSUP', 'NOTE', 'CAET', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1040, 'NOK', 'RSUP', 'TELN', 'CAET', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1041, 'NOK', 'RSUP', 'METR', 'GPON', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1042, 'NOK', 'RSUP', 'NORE', 'GPON', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1043, 'NOK', 'RSUP', 'SURE', 'GPON', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1044, 'NOK', 'RSUP', 'NOTE', 'GPON', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1045, 'NOK', 'RSUP', 'TELN', 'GPON', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1046, 'NOK', 'RSUP', 'METR', 'CLAS', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1047, 'NOK', 'RSUP', 'NORE', 'CLAS', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1048, 'NOK', 'RSUP', 'SURE', 'CLAS', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1049, 'NOK', 'RSUP', 'NOTE', 'CLAS', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1050, 'NOK', 'RSUP', 'TELN', 'CLAS', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1051, 'NOK', 'RSUP', 'METR', 'TBAS', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1052, 'NOK', 'RSUP', 'NORE', 'TBAS', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1053, 'NOK', 'RSUP', 'SURE', 'TBAS', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1054, 'NOK', 'RSUP', 'NOTE', 'TBAS', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1055, 'NOK', 'RSUP', 'TELN', 'TBAS', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1056, 'NOK', 'RSUP', 'METR', 'ATRS', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1057, 'NOK', 'RSUP', 'NORE', 'ATRS', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1058, 'NOK', 'RSUP', 'SURE', 'ATRS', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1059, 'NOK', 'RSUP', 'NOTE', 'ATRS', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1060, 'NOK', 'RSUP', 'TELN', 'ATRS', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1061, 'NOK', 'RCOR', 'METR', 'VDSL', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1062, 'NOK', 'RCOR', 'NORE', 'VDSL', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1063, 'NOK', 'RCOR', 'SURE', 'VDSL', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1064, 'NOK', 'RCOR', 'NOTE', 'VDSL', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1065, 'NOK', 'RCOR', 'TELN', 'VDSL', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1066, 'NOK', 'RCOR', 'METR', 'LADA', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1067, 'NOK', 'RCOR', 'NORE', 'LADA', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1068, 'NOK', 'RCOR', 'SURE', 'LADA', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1069, 'NOK', 'RCOR', 'NOTE', 'LADA', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1070, 'NOK', 'RCOR', 'TELN', 'LADA', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1071, 'NOK', 'RCOR', 'METR', 'RDA0', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1072, 'NOK', 'RCOR', 'NORE', 'RDA0', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1073, 'NOK', 'RCOR', 'SURE', 'RDA0', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1074, 'NOK', 'RCOR', 'NOTE', 'RDA0', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1075, 'NOK', 'RCOR', 'TELN', 'RDA0', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1076, 'NOK', 'RCOR', 'METR', 'CAET', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1077, 'NOK', 'RCOR', 'NORE', 'CAET', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1078, 'NOK', 'RCOR', 'SURE', 'CAET', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1079, 'NOK', 'RCOR', 'NOTE', 'CAET', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1080, 'NOK', 'RCOR', 'TELN', 'CAET', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1081, 'NOK', 'RCOR', 'METR', 'GPON', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1082, 'NOK', 'RCOR', 'NORE', 'GPON', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1083, 'NOK', 'RCOR', 'SURE', 'GPON', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1084, 'NOK', 'RCOR', 'NOTE', 'GPON', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1085, 'NOK', 'RCOR', 'TELN', 'GPON', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1086, 'NOK', 'RCOR', 'METR', 'CLAS', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1087, 'NOK', 'RCOR', 'NORE', 'CLAS', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1088, 'NOK', 'RCOR', 'SURE', 'CLAS', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1089, 'NOK', 'RCOR', 'NOTE', 'CLAS', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1090, 'NOK', 'RCOR', 'TELN', 'CLAS', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1091, 'NOK', 'RCOR', 'METR', 'TBAS', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1092, 'NOK', 'RCOR', 'NORE', 'TBAS', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1093, 'NOK', 'RCOR', 'SURE', 'TBAS', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1094, 'NOK', 'RCOR', 'NOTE', 'TBAS', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1095, 'NOK', 'RCOR', 'TELN', 'TBAS', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1096, 'NOK', 'RCOR', 'METR', 'ATRS', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1097, 'NOK', 'RCOR', 'NORE', 'ATRS', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1098, 'NOK', 'RCOR', 'SURE', 'ATRS', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1099, 'NOK', 'RCOR', 'NOTE', 'ATRS', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1100, 'NOK', 'RCOR', 'TELN', 'ATRS', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1101, 'NOK', 'RPRO', 'METR', 'VDSL', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1102, 'NOK', 'RPRO', 'NORE', 'VDSL', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1103, 'NOK', 'RPRO', 'SURE', 'VDSL', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1104, 'NOK', 'RPRO', 'NOTE', 'VDSL', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1105, 'NOK', 'RPRO', 'TELN', 'VDSL', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1106, 'NOK', 'RPRO', 'METR', 'LADA', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1107, 'NOK', 'RPRO', 'NORE', 'LADA', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1108, 'NOK', 'RPRO', 'SURE', 'LADA', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1109, 'NOK', 'RPRO', 'NOTE', 'LADA', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1110, 'NOK', 'RPRO', 'TELN', 'LADA', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1111, 'NOK', 'RPRO', 'METR', 'RDA0', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1112, 'NOK', 'RPRO', 'NORE', 'RDA0', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1113, 'NOK', 'RPRO', 'SURE', 'RDA0', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1114, 'NOK', 'RPRO', 'NOTE', 'RDA0', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1115, 'NOK', 'RPRO', 'TELN', 'RDA0', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1116, 'NOK', 'RPRO', 'METR', 'CAET', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1117, 'NOK', 'RPRO', 'NORE', 'CAET', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1118, 'NOK', 'RPRO', 'SURE', 'CAET', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1119, 'NOK', 'RPRO', 'NOTE', 'CAET', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1120, 'NOK', 'RPRO', 'TELN', 'CAET', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1121, 'NOK', 'RPRO', 'METR', 'GPON', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1122, 'NOK', 'RPRO', 'NORE', 'GPON', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1123, 'NOK', 'RPRO', 'SURE', 'GPON', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1124, 'NOK', 'RPRO', 'NOTE', 'GPON', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1125, 'NOK', 'RPRO', 'TELN', 'GPON', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1126, 'NOK', 'RPRO', 'METR', 'CLAS', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1127, 'NOK', 'RPRO', 'NORE', 'CLAS', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1128, 'NOK', 'RPRO', 'SURE', 'CLAS', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1129, 'NOK', 'RPRO', 'NOTE', 'CLAS', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1130, 'NOK', 'RPRO', 'TELN', 'CLAS', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1131, 'NOK', 'RPRO', 'METR', 'TBAS', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1132, 'NOK', 'RPRO', 'NORE', 'TBAS', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1133, 'NOK', 'RPRO', 'SURE', 'TBAS', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1134, 'NOK', 'RPRO', 'NOTE', 'TBAS', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1135, 'NOK', 'RPRO', 'TELN', 'TBAS', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1136, 'NOK', 'RPRO', 'METR', 'ATRS', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1137, 'NOK', 'RPRO', 'NORE', 'ATRS', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1138, 'NOK', 'RPRO', 'SURE', 'ATRS', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1139, 'NOK', 'RPRO', 'NOTE', 'ATRS', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1140, 'NOK', 'RPRO', 'TELN', 'ATRS', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1141, 'NOK', 'INST', 'METR', 'VDSL', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1142, 'NOK', 'INST', 'NORE', 'VDSL', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1143, 'NOK', 'INST', 'SURE', 'VDSL', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1144, 'NOK', 'INST', 'NOTE', 'VDSL', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1145, 'NOK', 'INST', 'TELN', 'VDSL', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1146, 'NOK', 'INST', 'METR', 'TBAS', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1147, 'NOK', 'INST', 'NORE', 'TBAS', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1148, 'NOK', 'INST', 'SURE', 'TBAS', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1149, 'NOK', 'INST', 'NOTE', 'TBAS', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1150, 'NOK', 'INST', 'TELN', 'TBAS', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1151, 'NOK', 'INST', 'METR', 'TRAS', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1152, 'NOK', 'INST', 'NORE', 'TRAS', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1153, 'NOK', 'INST', 'SURE', 'TRAS', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1154, 'NOK', 'INST', 'NOTE', 'TRAS', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1155, 'NOK', 'INST', 'TELN', 'TRAS', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1156, 'NOK', 'INST', 'METR', 'LADA', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1157, 'NOK', 'INST', 'NORE', 'LADA', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1158, 'NOK', 'INST', 'SURE', 'LADA', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1159, 'NOK', 'INST', 'NOTE', 'LADA', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1160, 'NOK', 'INST', 'TELN', 'LADA', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1161, 'NOK', 'INST', 'METR', 'GPON', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1162, 'NOK', 'INST', 'NORE', 'GPON', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1163, 'NOK', 'INST', 'SURE', 'GPON', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1164, 'NOK', 'INST', 'NOTE', 'GPON', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1165, 'NOK', 'INST', 'TELN', 'GPON', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1166, 'NOK', 'INST', 'METR', 'MIWA', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1167, 'NOK', 'INST', 'NORE', 'MIWA', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1168, 'NOK', 'INST', 'SURE', 'MIWA', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1169, 'NOK', 'INST', 'NOTE', 'MIWA', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1170, 'NOK', 'INST', 'TELN', 'MIWA', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1171, 'NOK', 'INST', 'METR', 'RDA0', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1172, 'NOK', 'INST', 'NORE', 'RDA0', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1173, 'NOK', 'INST', 'SURE', 'RDA0', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1174, 'NOK', 'INST', 'NOTE', 'RDA0', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1175, 'NOK', 'INST', 'TELN', 'RDA0', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1176, 'NOK', 'INST', 'METR', 'CAET', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1177, 'NOK', 'INST', 'NORE', 'CAET', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1178, 'NOK', 'INST', 'SURE', 'CAET', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1179, 'NOK', 'INST', 'NOTE', 'CAET', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1180, 'NOK', 'INST', 'TELN', 'CAET', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1181, 'NOK', 'INST', 'METR', 'CLAS', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1182, 'NOK', 'INST', 'NORE', 'CLAS', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1183, 'NOK', 'INST', 'SURE', 'CLAS', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1184, 'NOK', 'INST', 'NOTE', 'CLAS', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1185, 'NOK', 'INST', 'TELN', 'CLAS', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1186, 'NOK', 'INST', 'NCNL', 'NATT', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1187, 'NOK', 'INST', 'NCNL', 'NALS', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1188, 'NOK', 'INST', 'NCNL', 'NTEL', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (1189, 'NOK', 'RCUA', 'METR', 'VDSL', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1190, 'NOK', 'RCUA', 'NORE', 'VDSL', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1191, 'NOK', 'RCUA', 'SURE', 'VDSL', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1192, 'NOK', 'RCUA', 'NOTE', 'VDSL', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1193, 'NOK', 'RCUA', 'TELN', 'VDSL', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1194, 'NOK', 'RCUA', 'METR', 'LADA', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1195, 'NOK', 'RCUA', 'NORE', 'LADA', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1196, 'NOK', 'RCUA', 'SURE', 'LADA', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1197, 'NOK', 'RCUA', 'NOTE', 'LADA', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1198, 'NOK', 'RCUA', 'TELN', 'LADA', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1199, 'NOK', 'RCUA', 'METR', 'RDA0', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1200, 'NOK', 'RCUA', 'NORE', 'RDA0', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1201, 'NOK', 'RCUA', 'SURE', 'RDA0', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1202, 'NOK', 'RCUA', 'NOTE', 'RDA0', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1203, 'NOK', 'RCUA', 'TELN', 'RDA0', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1204, 'NOK', 'RCUA', 'METR', 'CAET', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1205, 'NOK', 'RCUA', 'NORE', 'CAET', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1206, 'NOK', 'RCUA', 'SURE', 'CAET', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1207, 'NOK', 'RCUA', 'NOTE', 'CAET', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1208, 'NOK', 'RCUA', 'TELN', 'CAET', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1209, 'NOK', 'RCUA', 'METR', 'CLAS', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1210, 'NOK', 'RCUA', 'NORE', 'CLAS', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1211, 'NOK', 'RCUA', 'SURE', 'CLAS', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1212, 'NOK', 'RCUA', 'NOTE', 'CLAS', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1213, 'NOK', 'RCUA', 'TELN', 'CLAS', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1214, 'NOK', 'RSUP', 'METR', 'VDSL', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1215, 'NOK', 'RSUP', 'NORE', 'VDSL', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1216, 'NOK', 'RSUP', 'SURE', 'VDSL', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1217, 'NOK', 'RSUP', 'NOTE', 'VDSL', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1218, 'NOK', 'RSUP', 'TELN', 'VDSL', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1219, 'NOK', 'RSUP', 'METR', 'LADA', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1220, 'NOK', 'RSUP', 'NORE', 'LADA', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1221, 'NOK', 'RSUP', 'SURE', 'LADA', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1222, 'NOK', 'RSUP', 'NOTE', 'LADA', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1223, 'NOK', 'RSUP', 'TELN', 'LADA', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1224, 'NOK', 'RSUP', 'METR', 'RDA0', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1225, 'NOK', 'RSUP', 'NORE', 'RDA0', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1226, 'NOK', 'RSUP', 'SURE', 'RDA0', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1227, 'NOK', 'RSUP', 'NOTE', 'RDA0', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1228, 'NOK', 'RSUP', 'TELN', 'RDA0', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1229, 'NOK', 'RSUP', 'METR', 'CAET', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1230, 'NOK', 'RSUP', 'NORE', 'CAET', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1231, 'NOK', 'RSUP', 'SURE', 'CAET', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1232, 'NOK', 'RSUP', 'NOTE', 'CAET', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1233, 'NOK', 'RSUP', 'TELN', 'CAET', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1234, 'NOK', 'RSUP', 'METR', 'GPON', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1235, 'NOK', 'RSUP', 'NORE', 'GPON', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1236, 'NOK', 'RSUP', 'SURE', 'GPON', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1237, 'NOK', 'RSUP', 'NOTE', 'GPON', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1238, 'NOK', 'RSUP', 'TELN', 'GPON', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1239, 'NOK', 'RSUP', 'METR', 'CLAS', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1240, 'NOK', 'RSUP', 'NORE', 'CLAS', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1241, 'NOK', 'RSUP', 'SURE', 'CLAS', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1242, 'NOK', 'RSUP', 'NOTE', 'CLAS', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1243, 'NOK', 'RSUP', 'TELN', 'CLAS', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1244, 'NOK', 'RSUP', 'METR', 'TBAS', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1245, 'NOK', 'RSUP', 'NORE', 'TBAS', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1246, 'NOK', 'RSUP', 'SURE', 'TBAS', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1247, 'NOK', 'RSUP', 'NOTE', 'TBAS', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1248, 'NOK', 'RSUP', 'TELN', 'TBAS', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1249, 'NOK', 'RSUP', 'METR', 'ATRS', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1250, 'NOK', 'RSUP', 'NORE', 'ATRS', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1251, 'NOK', 'RSUP', 'SURE', 'ATRS', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1252, 'NOK', 'RSUP', 'NOTE', 'ATRS', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1253, 'NOK', 'RSUP', 'TELN', 'ATRS', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1254, 'NOK', 'RCOR', 'METR', 'VDSL', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1255, 'NOK', 'RCOR', 'NORE', 'VDSL', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1256, 'NOK', 'RCOR', 'SURE', 'VDSL', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1257, 'NOK', 'RCOR', 'NOTE', 'VDSL', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1258, 'NOK', 'RCOR', 'TELN', 'VDSL', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1259, 'NOK', 'RCOR', 'METR', 'LADA', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1260, 'NOK', 'RCOR', 'NORE', 'LADA', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1261, 'NOK', 'RCOR', 'SURE', 'LADA', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1262, 'NOK', 'RCOR', 'NOTE', 'LADA', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1263, 'NOK', 'RCOR', 'TELN', 'LADA', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1264, 'NOK', 'RCOR', 'METR', 'RDA0', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1265, 'NOK', 'RCOR', 'NORE', 'RDA0', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1266, 'NOK', 'RCOR', 'SURE', 'RDA0', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1267, 'NOK', 'RCOR', 'NOTE', 'RDA0', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1268, 'NOK', 'RCOR', 'TELN', 'RDA0', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1269, 'NOK', 'RCOR', 'METR', 'CAET', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1270, 'NOK', 'RCOR', 'NORE', 'CAET', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1271, 'NOK', 'RCOR', 'SURE', 'CAET', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1272, 'NOK', 'RCOR', 'NOTE', 'CAET', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1273, 'NOK', 'RCOR', 'TELN', 'CAET', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1274, 'NOK', 'RCOR', 'METR', 'GPON', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1275, 'NOK', 'RCOR', 'NORE', 'GPON', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1276, 'NOK', 'RCOR', 'SURE', 'GPON', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1277, 'NOK', 'RCOR', 'NOTE', 'GPON', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1278, 'NOK', 'RCOR', 'TELN', 'GPON', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1279, 'NOK', 'RCOR', 'METR', 'CLAS', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1280, 'NOK', 'RCOR', 'NORE', 'CLAS', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1281, 'NOK', 'RCOR', 'SURE', 'CLAS', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1282, 'NOK', 'RCOR', 'NOTE', 'CLAS', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1283, 'NOK', 'RCOR', 'TELN', 'CLAS', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1284, 'NOK', 'RCOR', 'METR', 'TBAS', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1285, 'NOK', 'RCOR', 'NORE', 'TBAS', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1286, 'NOK', 'RCOR', 'SURE', 'TBAS', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1287, 'NOK', 'RCOR', 'NOTE', 'TBAS', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1288, 'NOK', 'RCOR', 'TELN', 'TBAS', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1289, 'NOK', 'RCOR', 'METR', 'ATRS', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1290, 'NOK', 'RCOR', 'NORE', 'ATRS', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1291, 'NOK', 'RCOR', 'SURE', 'ATRS', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1292, 'NOK', 'RCOR', 'NOTE', 'ATRS', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1293, 'NOK', 'RCOR', 'TELN', 'ATRS', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1294, 'NOK', 'RPRO', 'METR', 'VDSL', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1295, 'NOK', 'RPRO', 'NORE', 'VDSL', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1296, 'NOK', 'RPRO', 'SURE', 'VDSL', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1297, 'NOK', 'RPRO', 'NOTE', 'VDSL', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1298, 'NOK', 'RPRO', 'TELN', 'VDSL', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1299, 'NOK', 'RPRO', 'METR', 'LADA', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1300, 'NOK', 'RPRO', 'NORE', 'LADA', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1301, 'NOK', 'RPRO', 'SURE', 'LADA', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1302, 'NOK', 'RPRO', 'NOTE', 'LADA', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1303, 'NOK', 'RPRO', 'TELN', 'LADA', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1304, 'NOK', 'RPRO', 'METR', 'RDA0', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1305, 'NOK', 'RPRO', 'NORE', 'RDA0', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1306, 'NOK', 'RPRO', 'SURE', 'RDA0', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1307, 'NOK', 'RPRO', 'NOTE', 'RDA0', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1308, 'NOK', 'RPRO', 'TELN', 'RDA0', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1309, 'NOK', 'RPRO', 'METR', 'CAET', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1310, 'NOK', 'RPRO', 'NORE', 'CAET', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1311, 'NOK', 'RPRO', 'SURE', 'CAET', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1312, 'NOK', 'RPRO', 'NOTE', 'CAET', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1313, 'NOK', 'RPRO', 'TELN', 'CAET', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1314, 'NOK', 'RPRO', 'METR', 'GPON', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1315, 'NOK', 'RPRO', 'NORE', 'GPON', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1316, 'NOK', 'RPRO', 'SURE', 'GPON', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1317, 'NOK', 'RPRO', 'NOTE', 'GPON', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1318, 'NOK', 'RPRO', 'TELN', 'GPON', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1319, 'NOK', 'RPRO', 'METR', 'CLAS', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1320, 'NOK', 'RPRO', 'NORE', 'CLAS', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1321, 'NOK', 'RPRO', 'SURE', 'CLAS', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1322, 'NOK', 'RPRO', 'NOTE', 'CLAS', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1323, 'NOK', 'RPRO', 'TELN', 'CLAS', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1324, 'NOK', 'RPRO', 'METR', 'TBAS', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1325, 'NOK', 'RPRO', 'NORE', 'TBAS', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1326, 'NOK', 'RPRO', 'SURE', 'TBAS', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1327, 'NOK', 'RPRO', 'NOTE', 'TBAS', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1328, 'NOK', 'RPRO', 'TELN', 'TBAS', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1329, 'NOK', 'RPRO', 'METR', 'ATRS', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1330, 'NOK', 'RPRO', 'NORE', 'ATRS', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1331, 'NOK', 'RPRO', 'SURE', 'ATRS', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1332, 'NOK', 'RPRO', 'NOTE', 'ATRS', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1333, 'NOK', 'RPRO', 'TELN', 'ATRS', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1334, 'NOK', 'INST', 'METR', 'VDSL', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1335, 'NOK', 'INST', 'NORE', 'VDSL', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1336, 'NOK', 'INST', 'SURE', 'VDSL', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1337, 'NOK', 'INST', 'NOTE', 'VDSL', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1338, 'NOK', 'INST', 'TELN', 'VDSL', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1339, 'NOK', 'INST', 'METR', 'TBAS', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1340, 'NOK', 'INST', 'NORE', 'TBAS', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1341, 'NOK', 'INST', 'SURE', 'TBAS', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1342, 'NOK', 'INST', 'NOTE', 'TBAS', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1343, 'NOK', 'INST', 'TELN', 'TBAS', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1344, 'NOK', 'INST', 'METR', 'TRAS', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1345, 'NOK', 'INST', 'NORE', 'TRAS', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1346, 'NOK', 'INST', 'SURE', 'TRAS', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1347, 'NOK', 'INST', 'NOTE', 'TRAS', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1348, 'NOK', 'INST', 'TELN', 'TRAS', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1349, 'NOK', 'INST', 'METR', 'LADA', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1350, 'NOK', 'INST', 'NORE', 'LADA', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1351, 'NOK', 'INST', 'SURE', 'LADA', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1352, 'NOK', 'INST', 'NOTE', 'LADA', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1353, 'NOK', 'INST', 'TELN', 'LADA', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1354, 'NOK', 'INST', 'METR', 'GPON', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1355, 'NOK', 'INST', 'NORE', 'GPON', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1356, 'NOK', 'INST', 'SURE', 'GPON', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1357, 'NOK', 'INST', 'NOTE', 'GPON', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1358, 'NOK', 'INST', 'TELN', 'GPON', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1359, 'NOK', 'INST', 'METR', 'MIWA', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1360, 'NOK', 'INST', 'NORE', 'MIWA', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1361, 'NOK', 'INST', 'SURE', 'MIWA', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1362, 'NOK', 'INST', 'NOTE', 'MIWA', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1363, 'NOK', 'INST', 'TELN', 'MIWA', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1364, 'NOK', 'INST', 'METR', 'RDA0', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1365, 'NOK', 'INST', 'NORE', 'RDA0', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1366, 'NOK', 'INST', 'SURE', 'RDA0', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1367, 'NOK', 'INST', 'NOTE', 'RDA0', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1368, 'NOK', 'INST', 'TELN', 'RDA0', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1369, 'NOK', 'INST', 'METR', 'CAET', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1370, 'NOK', 'INST', 'NORE', 'CAET', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1371, 'NOK', 'INST', 'SURE', 'CAET', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1372, 'NOK', 'INST', 'NOTE', 'CAET', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1373, 'NOK', 'INST', 'TELN', 'CAET', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1374, 'NOK', 'INST', 'METR', 'CLAS', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1375, 'NOK', 'INST', 'NORE', 'CLAS', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1376, 'NOK', 'INST', 'SURE', 'CLAS', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1377, 'NOK', 'INST', 'NOTE', 'CLAS', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1378, 'NOK', 'INST', 'TELN', 'CLAS', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1379, 'NOK', 'INST', 'NCNL', 'NATT', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1380, 'NOK', 'INST', 'NCNL', 'NALS', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1381, 'NOK', 'INST', 'NCNL', 'NTEL', '204', 1);
INSERT INTO `catalogo_wbs` VALUES (1382, 'NOK', 'RCUA', 'METR', 'VDSL', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1383, 'NOK', 'RCUA', 'NORE', 'VDSL', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1384, 'NOK', 'RCUA', 'SURE', 'VDSL', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1385, 'NOK', 'RCUA', 'NOTE', 'VDSL', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1386, 'NOK', 'RCUA', 'TELN', 'VDSL', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1387, 'NOK', 'RCUA', 'METR', 'LADA', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1388, 'NOK', 'RCUA', 'NORE', 'LADA', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1389, 'NOK', 'RCUA', 'SURE', 'LADA', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1390, 'NOK', 'RCUA', 'NOTE', 'LADA', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1391, 'NOK', 'RCUA', 'TELN', 'LADA', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1392, 'NOK', 'RCUA', 'METR', 'RDA0', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1393, 'NOK', 'RCUA', 'NORE', 'RDA0', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1394, 'NOK', 'RCUA', 'SURE', 'RDA0', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1395, 'NOK', 'RCUA', 'NOTE', 'RDA0', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1396, 'NOK', 'RCUA', 'TELN', 'RDA0', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1397, 'NOK', 'RCUA', 'METR', 'CAET', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1398, 'NOK', 'RCUA', 'NORE', 'CAET', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1399, 'NOK', 'RCUA', 'SURE', 'CAET', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1400, 'NOK', 'RCUA', 'NOTE', 'CAET', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1401, 'NOK', 'RCUA', 'TELN', 'CAET', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1402, 'NOK', 'RCUA', 'METR', 'CLAS', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1403, 'NOK', 'RCUA', 'NORE', 'CLAS', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1404, 'NOK', 'RCUA', 'SURE', 'CLAS', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1405, 'NOK', 'RCUA', 'NOTE', 'CLAS', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1406, 'NOK', 'RCUA', 'TELN', 'CLAS', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1407, 'NOK', 'RSUP', 'METR', 'VDSL', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1408, 'NOK', 'RSUP', 'NORE', 'VDSL', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1409, 'NOK', 'RSUP', 'SURE', 'VDSL', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1410, 'NOK', 'RSUP', 'NOTE', 'VDSL', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1411, 'NOK', 'RSUP', 'TELN', 'VDSL', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1412, 'NOK', 'RSUP', 'METR', 'LADA', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1413, 'NOK', 'RSUP', 'NORE', 'LADA', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1414, 'NOK', 'RSUP', 'SURE', 'LADA', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1415, 'NOK', 'RSUP', 'NOTE', 'LADA', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1416, 'NOK', 'RSUP', 'TELN', 'LADA', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1417, 'NOK', 'RSUP', 'METR', 'RDA0', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1418, 'NOK', 'RSUP', 'NORE', 'RDA0', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1419, 'NOK', 'RSUP', 'SURE', 'RDA0', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1420, 'NOK', 'RSUP', 'NOTE', 'RDA0', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1421, 'NOK', 'RSUP', 'TELN', 'RDA0', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1422, 'NOK', 'RSUP', 'METR', 'CAET', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1423, 'NOK', 'RSUP', 'NORE', 'CAET', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1424, 'NOK', 'RSUP', 'SURE', 'CAET', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1425, 'NOK', 'RSUP', 'NOTE', 'CAET', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1426, 'NOK', 'RSUP', 'TELN', 'CAET', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1427, 'NOK', 'RSUP', 'METR', 'GPON', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1428, 'NOK', 'RSUP', 'NORE', 'GPON', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1429, 'NOK', 'RSUP', 'SURE', 'GPON', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1430, 'NOK', 'RSUP', 'NOTE', 'GPON', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1431, 'NOK', 'RSUP', 'TELN', 'GPON', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1432, 'NOK', 'RSUP', 'METR', 'CLAS', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1433, 'NOK', 'RSUP', 'NORE', 'CLAS', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1434, 'NOK', 'RSUP', 'SURE', 'CLAS', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1435, 'NOK', 'RSUP', 'NOTE', 'CLAS', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1436, 'NOK', 'RSUP', 'TELN', 'CLAS', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1437, 'NOK', 'RSUP', 'METR', 'TBAS', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1438, 'NOK', 'RSUP', 'NORE', 'TBAS', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1439, 'NOK', 'RSUP', 'SURE', 'TBAS', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1440, 'NOK', 'RSUP', 'NOTE', 'TBAS', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1441, 'NOK', 'RSUP', 'TELN', 'TBAS', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1442, 'NOK', 'RSUP', 'METR', 'ATRS', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1443, 'NOK', 'RSUP', 'NORE', 'ATRS', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1444, 'NOK', 'RSUP', 'SURE', 'ATRS', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1445, 'NOK', 'RSUP', 'NOTE', 'ATRS', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1446, 'NOK', 'RSUP', 'TELN', 'ATRS', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1447, 'NOK', 'RCOR', 'METR', 'VDSL', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1448, 'NOK', 'RCOR', 'NORE', 'VDSL', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1449, 'NOK', 'RCOR', 'SURE', 'VDSL', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1450, 'NOK', 'RCOR', 'NOTE', 'VDSL', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1451, 'NOK', 'RCOR', 'TELN', 'VDSL', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1452, 'NOK', 'RCOR', 'METR', 'LADA', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1453, 'NOK', 'RCOR', 'NORE', 'LADA', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1454, 'NOK', 'RCOR', 'SURE', 'LADA', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1455, 'NOK', 'RCOR', 'NOTE', 'LADA', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1456, 'NOK', 'RCOR', 'TELN', 'LADA', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1457, 'NOK', 'RCOR', 'METR', 'RDA0', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1458, 'NOK', 'RCOR', 'NORE', 'RDA0', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1459, 'NOK', 'RCOR', 'SURE', 'RDA0', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1460, 'NOK', 'RCOR', 'NOTE', 'RDA0', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1461, 'NOK', 'RCOR', 'TELN', 'RDA0', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1462, 'NOK', 'RCOR', 'METR', 'CAET', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1463, 'NOK', 'RCOR', 'NORE', 'CAET', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1464, 'NOK', 'RCOR', 'SURE', 'CAET', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1465, 'NOK', 'RCOR', 'NOTE', 'CAET', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1466, 'NOK', 'RCOR', 'TELN', 'CAET', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1467, 'NOK', 'RCOR', 'METR', 'GPON', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1468, 'NOK', 'RCOR', 'NORE', 'GPON', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1469, 'NOK', 'RCOR', 'SURE', 'GPON', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1470, 'NOK', 'RCOR', 'NOTE', 'GPON', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1471, 'NOK', 'RCOR', 'TELN', 'GPON', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1472, 'NOK', 'RCOR', 'METR', 'CLAS', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1473, 'NOK', 'RCOR', 'NORE', 'CLAS', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1474, 'NOK', 'RCOR', 'SURE', 'CLAS', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1475, 'NOK', 'RCOR', 'NOTE', 'CLAS', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1476, 'NOK', 'RCOR', 'TELN', 'CLAS', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1477, 'NOK', 'RCOR', 'METR', 'TBAS', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1478, 'NOK', 'RCOR', 'NORE', 'TBAS', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1479, 'NOK', 'RCOR', 'SURE', 'TBAS', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1480, 'NOK', 'RCOR', 'NOTE', 'TBAS', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1481, 'NOK', 'RCOR', 'TELN', 'TBAS', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1482, 'NOK', 'RCOR', 'METR', 'ATRS', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1483, 'NOK', 'RCOR', 'NORE', 'ATRS', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1484, 'NOK', 'RCOR', 'SURE', 'ATRS', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1485, 'NOK', 'RCOR', 'NOTE', 'ATRS', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1486, 'NOK', 'RCOR', 'TELN', 'ATRS', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1487, 'NOK', 'RPRO', 'METR', 'VDSL', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1488, 'NOK', 'RPRO', 'NORE', 'VDSL', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1489, 'NOK', 'RPRO', 'SURE', 'VDSL', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1490, 'NOK', 'RPRO', 'NOTE', 'VDSL', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1491, 'NOK', 'RPRO', 'TELN', 'VDSL', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1492, 'NOK', 'RPRO', 'METR', 'LADA', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1493, 'NOK', 'RPRO', 'NORE', 'LADA', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1494, 'NOK', 'RPRO', 'SURE', 'LADA', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1495, 'NOK', 'RPRO', 'NOTE', 'LADA', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1496, 'NOK', 'RPRO', 'TELN', 'LADA', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1497, 'NOK', 'RPRO', 'METR', 'RDA0', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1498, 'NOK', 'RPRO', 'NORE', 'RDA0', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1499, 'NOK', 'RPRO', 'SURE', 'RDA0', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1500, 'NOK', 'RPRO', 'NOTE', 'RDA0', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1501, 'NOK', 'RPRO', 'TELN', 'RDA0', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1502, 'NOK', 'RPRO', 'METR', 'CAET', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1503, 'NOK', 'RPRO', 'NORE', 'CAET', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1504, 'NOK', 'RPRO', 'SURE', 'CAET', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1505, 'NOK', 'RPRO', 'NOTE', 'CAET', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1506, 'NOK', 'RPRO', 'TELN', 'CAET', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1507, 'NOK', 'RPRO', 'METR', 'GPON', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1508, 'NOK', 'RPRO', 'NORE', 'GPON', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1509, 'NOK', 'RPRO', 'SURE', 'GPON', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1510, 'NOK', 'RPRO', 'NOTE', 'GPON', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1511, 'NOK', 'RPRO', 'TELN', 'GPON', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1512, 'NOK', 'RPRO', 'METR', 'CLAS', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1513, 'NOK', 'RPRO', 'NORE', 'CLAS', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1514, 'NOK', 'RPRO', 'SURE', 'CLAS', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1515, 'NOK', 'RPRO', 'NOTE', 'CLAS', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1516, 'NOK', 'RPRO', 'TELN', 'CLAS', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1517, 'NOK', 'RPRO', 'METR', 'TBAS', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1518, 'NOK', 'RPRO', 'NORE', 'TBAS', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1519, 'NOK', 'RPRO', 'SURE', 'TBAS', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1520, 'NOK', 'RPRO', 'NOTE', 'TBAS', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1521, 'NOK', 'RPRO', 'TELN', 'TBAS', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1522, 'NOK', 'RPRO', 'METR', 'ATRS', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1523, 'NOK', 'RPRO', 'NORE', 'ATRS', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1524, 'NOK', 'RPRO', 'SURE', 'ATRS', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1525, 'NOK', 'RPRO', 'NOTE', 'ATRS', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1526, 'NOK', 'RPRO', 'TELN', 'ATRS', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1527, 'NOK', 'INST', 'METR', 'VDSL', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1528, 'NOK', 'INST', 'NORE', 'VDSL', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1529, 'NOK', 'INST', 'SURE', 'VDSL', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1530, 'NOK', 'INST', 'NOTE', 'VDSL', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1531, 'NOK', 'INST', 'TELN', 'VDSL', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1532, 'NOK', 'INST', 'METR', 'TBAS', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1533, 'NOK', 'INST', 'NORE', 'TBAS', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1534, 'NOK', 'INST', 'SURE', 'TBAS', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1535, 'NOK', 'INST', 'NOTE', 'TBAS', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1536, 'NOK', 'INST', 'TELN', 'TBAS', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1537, 'NOK', 'INST', 'METR', 'TRAS', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1538, 'NOK', 'INST', 'NORE', 'TRAS', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1539, 'NOK', 'INST', 'SURE', 'TRAS', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1540, 'NOK', 'INST', 'NOTE', 'TRAS', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1541, 'NOK', 'INST', 'TELN', 'TRAS', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1542, 'NOK', 'INST', 'METR', 'LADA', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1543, 'NOK', 'INST', 'NORE', 'LADA', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1544, 'NOK', 'INST', 'SURE', 'LADA', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1545, 'NOK', 'INST', 'NOTE', 'LADA', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1546, 'NOK', 'INST', 'TELN', 'LADA', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1547, 'NOK', 'INST', 'METR', 'GPON', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1548, 'NOK', 'INST', 'NORE', 'GPON', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1549, 'NOK', 'INST', 'SURE', 'GPON', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1550, 'NOK', 'INST', 'NOTE', 'GPON', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1551, 'NOK', 'INST', 'TELN', 'GPON', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1552, 'NOK', 'INST', 'METR', 'MIWA', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1553, 'NOK', 'INST', 'NORE', 'MIWA', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1554, 'NOK', 'INST', 'SURE', 'MIWA', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1555, 'NOK', 'INST', 'NOTE', 'MIWA', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1556, 'NOK', 'INST', 'TELN', 'MIWA', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1557, 'NOK', 'INST', 'METR', 'RDA0', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1558, 'NOK', 'INST', 'NORE', 'RDA0', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1559, 'NOK', 'INST', 'SURE', 'RDA0', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1560, 'NOK', 'INST', 'NOTE', 'RDA0', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1561, 'NOK', 'INST', 'TELN', 'RDA0', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1562, 'NOK', 'INST', 'METR', 'CAET', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1563, 'NOK', 'INST', 'NORE', 'CAET', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1564, 'NOK', 'INST', 'SURE', 'CAET', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1565, 'NOK', 'INST', 'NOTE', 'CAET', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1566, 'NOK', 'INST', 'TELN', 'CAET', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1567, 'NOK', 'INST', 'METR', 'CLAS', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1568, 'NOK', 'INST', 'NORE', 'CLAS', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1569, 'NOK', 'INST', 'SURE', 'CLAS', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1570, 'NOK', 'INST', 'NOTE', 'CLAS', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1571, 'NOK', 'INST', 'TELN', 'CLAS', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1572, 'NOK', 'INST', 'NCNL', 'NATT', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1573, 'NOK', 'INST', 'NCNL', 'NALS', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1574, 'NOK', 'INST', 'NCNL', 'NTEL', '205', 1);
INSERT INTO `catalogo_wbs` VALUES (1575, 'NOK', 'RCUA', 'METR', 'VDSL', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1576, 'NOK', 'RCUA', 'NORE', 'VDSL', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1577, 'NOK', 'RCUA', 'SURE', 'VDSL', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1578, 'NOK', 'RCUA', 'NOTE', 'VDSL', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1579, 'NOK', 'RCUA', 'TELN', 'VDSL', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1580, 'NOK', 'RCUA', 'METR', 'LADA', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1581, 'NOK', 'RCUA', 'NORE', 'LADA', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1582, 'NOK', 'RCUA', 'SURE', 'LADA', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1583, 'NOK', 'RCUA', 'NOTE', 'LADA', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1584, 'NOK', 'RCUA', 'TELN', 'LADA', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1585, 'NOK', 'RCUA', 'METR', 'RDA0', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1586, 'NOK', 'RCUA', 'NORE', 'RDA0', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1587, 'NOK', 'RCUA', 'SURE', 'RDA0', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1588, 'NOK', 'RCUA', 'NOTE', 'RDA0', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1589, 'NOK', 'RCUA', 'TELN', 'RDA0', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1590, 'NOK', 'RCUA', 'METR', 'CAET', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1591, 'NOK', 'RCUA', 'NORE', 'CAET', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1592, 'NOK', 'RCUA', 'SURE', 'CAET', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1593, 'NOK', 'RCUA', 'NOTE', 'CAET', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1594, 'NOK', 'RCUA', 'TELN', 'CAET', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1595, 'NOK', 'RCUA', 'METR', 'CLAS', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1596, 'NOK', 'RCUA', 'NORE', 'CLAS', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1597, 'NOK', 'RCUA', 'SURE', 'CLAS', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1598, 'NOK', 'RCUA', 'NOTE', 'CLAS', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1599, 'NOK', 'RCUA', 'TELN', 'CLAS', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1600, 'NOK', 'RSUP', 'METR', 'VDSL', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1601, 'NOK', 'RSUP', 'NORE', 'VDSL', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1602, 'NOK', 'RSUP', 'SURE', 'VDSL', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1603, 'NOK', 'RSUP', 'NOTE', 'VDSL', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1604, 'NOK', 'RSUP', 'TELN', 'VDSL', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1605, 'NOK', 'RSUP', 'METR', 'LADA', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1606, 'NOK', 'RSUP', 'NORE', 'LADA', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1607, 'NOK', 'RSUP', 'SURE', 'LADA', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1608, 'NOK', 'RSUP', 'NOTE', 'LADA', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1609, 'NOK', 'RSUP', 'TELN', 'LADA', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1610, 'NOK', 'RSUP', 'METR', 'RDA0', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1611, 'NOK', 'RSUP', 'NORE', 'RDA0', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1612, 'NOK', 'RSUP', 'SURE', 'RDA0', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1613, 'NOK', 'RSUP', 'NOTE', 'RDA0', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1614, 'NOK', 'RSUP', 'TELN', 'RDA0', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1615, 'NOK', 'RSUP', 'METR', 'CAET', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1616, 'NOK', 'RSUP', 'NORE', 'CAET', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1617, 'NOK', 'RSUP', 'SURE', 'CAET', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1618, 'NOK', 'RSUP', 'NOTE', 'CAET', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1619, 'NOK', 'RSUP', 'TELN', 'CAET', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1620, 'NOK', 'RSUP', 'METR', 'GPON', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1621, 'NOK', 'RSUP', 'NORE', 'GPON', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1622, 'NOK', 'RSUP', 'SURE', 'GPON', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1623, 'NOK', 'RSUP', 'NOTE', 'GPON', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1624, 'NOK', 'RSUP', 'TELN', 'GPON', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1625, 'NOK', 'RSUP', 'METR', 'CLAS', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1626, 'NOK', 'RSUP', 'NORE', 'CLAS', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1627, 'NOK', 'RSUP', 'SURE', 'CLAS', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1628, 'NOK', 'RSUP', 'NOTE', 'CLAS', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1629, 'NOK', 'RSUP', 'TELN', 'CLAS', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1630, 'NOK', 'RSUP', 'METR', 'TBAS', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1631, 'NOK', 'RSUP', 'NORE', 'TBAS', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1632, 'NOK', 'RSUP', 'SURE', 'TBAS', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1633, 'NOK', 'RSUP', 'NOTE', 'TBAS', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1634, 'NOK', 'RSUP', 'TELN', 'TBAS', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1635, 'NOK', 'RSUP', 'METR', 'ATRS', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1636, 'NOK', 'RSUP', 'NORE', 'ATRS', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1637, 'NOK', 'RSUP', 'SURE', 'ATRS', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1638, 'NOK', 'RSUP', 'NOTE', 'ATRS', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1639, 'NOK', 'RSUP', 'TELN', 'ATRS', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1640, 'NOK', 'RCOR', 'METR', 'VDSL', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1641, 'NOK', 'RCOR', 'NORE', 'VDSL', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1642, 'NOK', 'RCOR', 'SURE', 'VDSL', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1643, 'NOK', 'RCOR', 'NOTE', 'VDSL', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1644, 'NOK', 'RCOR', 'TELN', 'VDSL', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1645, 'NOK', 'RCOR', 'METR', 'LADA', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1646, 'NOK', 'RCOR', 'NORE', 'LADA', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1647, 'NOK', 'RCOR', 'SURE', 'LADA', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1648, 'NOK', 'RCOR', 'NOTE', 'LADA', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1649, 'NOK', 'RCOR', 'TELN', 'LADA', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1650, 'NOK', 'RCOR', 'METR', 'RDA0', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1651, 'NOK', 'RCOR', 'NORE', 'RDA0', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1652, 'NOK', 'RCOR', 'SURE', 'RDA0', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1653, 'NOK', 'RCOR', 'NOTE', 'RDA0', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1654, 'NOK', 'RCOR', 'TELN', 'RDA0', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1655, 'NOK', 'RCOR', 'METR', 'CAET', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1656, 'NOK', 'RCOR', 'NORE', 'CAET', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1657, 'NOK', 'RCOR', 'SURE', 'CAET', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1658, 'NOK', 'RCOR', 'NOTE', 'CAET', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1659, 'NOK', 'RCOR', 'TELN', 'CAET', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1660, 'NOK', 'RCOR', 'METR', 'GPON', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1661, 'NOK', 'RCOR', 'NORE', 'GPON', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1662, 'NOK', 'RCOR', 'SURE', 'GPON', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1663, 'NOK', 'RCOR', 'NOTE', 'GPON', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1664, 'NOK', 'RCOR', 'TELN', 'GPON', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1665, 'NOK', 'RCOR', 'METR', 'CLAS', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1666, 'NOK', 'RCOR', 'NORE', 'CLAS', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1667, 'NOK', 'RCOR', 'SURE', 'CLAS', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1668, 'NOK', 'RCOR', 'NOTE', 'CLAS', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1669, 'NOK', 'RCOR', 'TELN', 'CLAS', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1670, 'NOK', 'RCOR', 'METR', 'TBAS', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1671, 'NOK', 'RCOR', 'NORE', 'TBAS', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1672, 'NOK', 'RCOR', 'SURE', 'TBAS', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1673, 'NOK', 'RCOR', 'NOTE', 'TBAS', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1674, 'NOK', 'RCOR', 'TELN', 'TBAS', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1675, 'NOK', 'RCOR', 'METR', 'ATRS', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1676, 'NOK', 'RCOR', 'NORE', 'ATRS', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1677, 'NOK', 'RCOR', 'SURE', 'ATRS', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1678, 'NOK', 'RCOR', 'NOTE', 'ATRS', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1679, 'NOK', 'RCOR', 'TELN', 'ATRS', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1680, 'NOK', 'RPRO', 'METR', 'VDSL', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1681, 'NOK', 'RPRO', 'NORE', 'VDSL', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1682, 'NOK', 'RPRO', 'SURE', 'VDSL', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1683, 'NOK', 'RPRO', 'NOTE', 'VDSL', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1684, 'NOK', 'RPRO', 'TELN', 'VDSL', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1685, 'NOK', 'RPRO', 'METR', 'LADA', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1686, 'NOK', 'RPRO', 'NORE', 'LADA', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1687, 'NOK', 'RPRO', 'SURE', 'LADA', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1688, 'NOK', 'RPRO', 'NOTE', 'LADA', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1689, 'NOK', 'RPRO', 'TELN', 'LADA', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1690, 'NOK', 'RPRO', 'METR', 'RDA0', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1691, 'NOK', 'RPRO', 'NORE', 'RDA0', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1692, 'NOK', 'RPRO', 'SURE', 'RDA0', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1693, 'NOK', 'RPRO', 'NOTE', 'RDA0', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1694, 'NOK', 'RPRO', 'TELN', 'RDA0', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1695, 'NOK', 'RPRO', 'METR', 'CAET', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1696, 'NOK', 'RPRO', 'NORE', 'CAET', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1697, 'NOK', 'RPRO', 'SURE', 'CAET', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1698, 'NOK', 'RPRO', 'NOTE', 'CAET', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1699, 'NOK', 'RPRO', 'TELN', 'CAET', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1700, 'NOK', 'RPRO', 'METR', 'GPON', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1701, 'NOK', 'RPRO', 'NORE', 'GPON', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1702, 'NOK', 'RPRO', 'SURE', 'GPON', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1703, 'NOK', 'RPRO', 'NOTE', 'GPON', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1704, 'NOK', 'RPRO', 'TELN', 'GPON', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1705, 'NOK', 'RPRO', 'METR', 'CLAS', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1706, 'NOK', 'RPRO', 'NORE', 'CLAS', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1707, 'NOK', 'RPRO', 'SURE', 'CLAS', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1708, 'NOK', 'RPRO', 'NOTE', 'CLAS', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1709, 'NOK', 'RPRO', 'TELN', 'CLAS', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1710, 'NOK', 'RPRO', 'METR', 'TBAS', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1711, 'NOK', 'RPRO', 'NORE', 'TBAS', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1712, 'NOK', 'RPRO', 'SURE', 'TBAS', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1713, 'NOK', 'RPRO', 'NOTE', 'TBAS', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1714, 'NOK', 'RPRO', 'TELN', 'TBAS', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1715, 'NOK', 'RPRO', 'METR', 'ATRS', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1716, 'NOK', 'RPRO', 'NORE', 'ATRS', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1717, 'NOK', 'RPRO', 'SURE', 'ATRS', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1718, 'NOK', 'RPRO', 'NOTE', 'ATRS', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1719, 'NOK', 'RPRO', 'TELN', 'ATRS', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1720, 'NOK', 'INST', 'METR', 'VDSL', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1721, 'NOK', 'INST', 'NORE', 'VDSL', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1722, 'NOK', 'INST', 'SURE', 'VDSL', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1723, 'NOK', 'INST', 'NOTE', 'VDSL', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1724, 'NOK', 'INST', 'TELN', 'VDSL', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1725, 'NOK', 'INST', 'METR', 'TBAS', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1726, 'NOK', 'INST', 'NORE', 'TBAS', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1727, 'NOK', 'INST', 'SURE', 'TBAS', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1728, 'NOK', 'INST', 'NOTE', 'TBAS', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1729, 'NOK', 'INST', 'TELN', 'TBAS', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1730, 'NOK', 'INST', 'METR', 'TRAS', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1731, 'NOK', 'INST', 'NORE', 'TRAS', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1732, 'NOK', 'INST', 'SURE', 'TRAS', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1733, 'NOK', 'INST', 'NOTE', 'TRAS', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1734, 'NOK', 'INST', 'TELN', 'TRAS', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1735, 'NOK', 'INST', 'METR', 'LADA', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1736, 'NOK', 'INST', 'NORE', 'LADA', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1737, 'NOK', 'INST', 'SURE', 'LADA', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1738, 'NOK', 'INST', 'NOTE', 'LADA', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1739, 'NOK', 'INST', 'TELN', 'LADA', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1740, 'NOK', 'INST', 'METR', 'GPON', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1741, 'NOK', 'INST', 'NORE', 'GPON', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1742, 'NOK', 'INST', 'SURE', 'GPON', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1743, 'NOK', 'INST', 'NOTE', 'GPON', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1744, 'NOK', 'INST', 'TELN', 'GPON', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1745, 'NOK', 'INST', 'METR', 'MIWA', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1746, 'NOK', 'INST', 'NORE', 'MIWA', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1747, 'NOK', 'INST', 'SURE', 'MIWA', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1748, 'NOK', 'INST', 'NOTE', 'MIWA', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1749, 'NOK', 'INST', 'TELN', 'MIWA', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1750, 'NOK', 'INST', 'METR', 'RDA0', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1751, 'NOK', 'INST', 'NORE', 'RDA0', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1752, 'NOK', 'INST', 'SURE', 'RDA0', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1753, 'NOK', 'INST', 'NOTE', 'RDA0', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1754, 'NOK', 'INST', 'TELN', 'RDA0', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1755, 'NOK', 'INST', 'METR', 'CAET', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1756, 'NOK', 'INST', 'NORE', 'CAET', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1757, 'NOK', 'INST', 'SURE', 'CAET', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1758, 'NOK', 'INST', 'NOTE', 'CAET', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1759, 'NOK', 'INST', 'TELN', 'CAET', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1760, 'NOK', 'INST', 'METR', 'CLAS', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1761, 'NOK', 'INST', 'NORE', 'CLAS', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1762, 'NOK', 'INST', 'SURE', 'CLAS', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1763, 'NOK', 'INST', 'NOTE', 'CLAS', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1764, 'NOK', 'INST', 'TELN', 'CLAS', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1765, 'NOK', 'INST', 'NCNL', 'NATT', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1766, 'NOK', 'INST', 'NCNL', 'NALS', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1767, 'NOK', 'INST', 'NCNL', 'NTEL', '206', 1);
INSERT INTO `catalogo_wbs` VALUES (1768, 'HUW', 'INST', 'NCNL', 'PMO0', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (1769, 'HUW', 'INST', 'NCNL', 'COOR', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (1770, 'HUW', 'INST', 'RE01', 'DWDM', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (1771, 'HUW', 'INST', 'RE02', 'DWDM', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (1772, 'HUW', 'INST', 'RE03', 'DWDM', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (1773, 'HUW', 'INST', 'RE04', 'DWDM', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (1774, 'HUW', 'INST', 'RE05', 'DWDM', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (1775, 'HUW', 'INST', 'RE06', 'DWDM', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (1776, 'HUW', 'INST', 'RE07', 'DWDM', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (1777, 'HUW', 'INST', 'RE08', 'DWDM', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (1778, 'HUW', 'INST', 'RE09', 'DWDM', '101', 1);
INSERT INTO `catalogo_wbs` VALUES (1779, 'HUW', 'INST', 'RE01', 'DWDM', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (1780, 'HUW', 'INST', 'RE02', 'DWDM', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (1781, 'HUW', 'INST', 'RE03', 'DWDM', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (1782, 'HUW', 'INST', 'RE04', 'DWDM', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (1783, 'HUW', 'INST', 'RE05', 'DWDM', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (1784, 'HUW', 'INST', 'RE06', 'DWDM', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (1785, 'HUW', 'INST', 'RE07', 'DWDM', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (1786, 'HUW', 'INST', 'RE08', 'DWDM', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (1787, 'HUW', 'INST', 'RE09', 'DWDM', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (1788, 'CAS', 'INST', 'NCNL', 'ADMI', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (1789, 'CAS', 'INST', 'NCNL', 'CAPA', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (1790, 'CAS', 'INST', 'NCNL', 'FEST', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (1791, 'CAS', 'INST', 'NCNL', 'INCA', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (1792, 'CAS', 'INST', 'NCNL', 'MATE', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (1793, 'CAS', 'INST', 'NCNL', 'PECS', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (1794, 'CAS', 'INST', 'NCNL', 'PESS', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (1795, 'CAS', 'INST', 'NCNL', 'PMO0', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (1796, 'CAS', 'INST', 'NCNL', 'SIAC', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (1797, 'CAS', 'INST', 'NCNL', 'VACA', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (1798, 'CAS', 'INST', 'RE01', 'REMW', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (1799, 'CAS', 'INST', 'RE02', 'REMW', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (1800, 'CAS', 'INST', 'RE03', 'REMW', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (1801, 'CAS', 'INST', 'RE04', 'REMW', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (1802, 'CAS', 'INST', 'RE05', 'REMW', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (1803, 'CAS', 'INST', 'RE06', 'REMW', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (1804, 'CAS', 'INST', 'RE07', 'REMW', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (1805, 'CAS', 'INST', 'RE08', 'REMW', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (1806, 'CAS', 'INST', 'RE09', 'REMW', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (1807, 'ZME', 'VARI', 'NCNL', 'ADMI', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (1808, 'NAE', 'RREC', 'RE09', 'RDCO', '100', 0);
INSERT INTO `catalogo_wbs` VALUES (1809, 'NAE', 'INST', 'NCNL', 'EMSO', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (1810, 'GSB', 'INST', 'METR', 'MECO', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (1811, 'GSB', 'INST', 'METR', 'CABL', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (1812, 'IND', 'ADMO', 'CUAU', 'ADMI', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (1813, 'IND', 'IMPR', 'NCNL', 'NOK0', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (1814, 'IND', 'IMPR', 'NCNL', 'TIM0', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (1815, 'IND', 'IMPR', 'NCNL', 'CIC0', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (1816, 'IND', 'IMPR', 'NCNL', 'NCR0', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (1817, 'IND', 'IMPR', 'NCNL', 'NFR0', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (1818, 'IND', 'IMPR', 'NCNL', 'GSB0', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (1819, 'IND', 'IMPR', 'NCNL', 'HUW0', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (1820, 'IND', 'IMPR', 'NCNL', 'CAS0', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (1821, 'IND', 'IMPR', 'NCNL', 'CIS0', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (1822, 'IND', 'IMPR', 'NCNL', 'IND0', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (1823, 'ATT', 'RREC', 'NCNL', 'ADMI', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (1824, 'CIC', 'STF0', 'NCNL', 'ADMI', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (1825, 'CIS', 'INST', 'NCNL', 'ADMI', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (1826, 'ETP', 'RREC', 'NCNL', 'ADMI', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (1827, 'GSB', 'INST', 'NCNL', 'ADMI', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (1828, 'HUW', 'INST', 'NCNL', 'ADMI', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (1829, 'IND', 'ADMO', 'NCNL', 'ADMI', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (1830, 'NAE', 'INST', 'NCNL', 'ADMI', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (1831, 'NCR', 'VARI', 'NCNL', 'ADMI', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (1832, 'NOK', 'INST', 'NCNL', 'ADMI', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (1833, 'TIM', 'VARI', 'NCNL', 'ADMI', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (1834, 'NOK', 'RPRO', 'NCNL', 'ADMI', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (1835, 'NOK', 'RSUP', 'NCNL', 'ADMI', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (1836, 'IND', 'CORP', 'NCNL', 'ADMI', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (1837, 'CAS', 'INST', 'NCNL', 'ADMI', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (1838, 'NAE', 'RDCO', 'NCNL', 'PMO0', '100', 0);
INSERT INTO `catalogo_wbs` VALUES (1839, 'NAE', 'ETP0', 'NCNL', 'PMO0', '100', 0);
INSERT INTO `catalogo_wbs` VALUES (1840, 'CIS', 'INST', 'NCNL', 'SIAC', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (1841, 'GSB', 'INST', 'NCNL', 'SIAC', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (1842, 'IND', 'IMPR', 'NCNL', 'DHN0', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (1843, 'IND', 'IMPR', 'NCNL', 'TRM0', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (1844, 'IND', 'IMPR', 'NCNL', 'MXS0', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (1845, 'IND', 'IMPR', 'NCNL', 'SEG0', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (1846, 'GSB', 'VARI', 'NCNL', 'SIAC', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (1847, 'GSB', 'VARI', 'NCNL', 'INCA', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (1848, 'GSB', 'VARI', 'NCNL', 'VACA', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (1849, 'GSB', 'VARI', 'NCNL', 'PECS', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (1850, 'GSB', 'VARI', 'NCNL', 'PESS', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (1851, 'GSB', 'VARI', 'NCNL', 'CAPA', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (1852, 'GSB', 'VARI', 'NCNL', 'FEST', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (1853, 'CIS', 'INST', 'NCNL', 'PECS', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (1854, 'CIS', 'INST', 'NCNL', 'PESS', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (1855, 'CIS', 'INST', 'NCNL', 'VACA', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (1856, 'CIS', 'INST', 'NCNL', 'FEST', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (1857, 'CIS', 'INST', 'NCNL', 'INCA', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (1858, 'CIS', 'INST', 'NCNL', 'CAPA', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (1859, 'HUW', 'INST', 'NCNL', 'INCA', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (1860, 'HUW', 'INST', 'NCNL', 'VACA', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (1861, 'HUW', 'INST', 'NCNL', 'PECS', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (1862, 'HUW', 'INST', 'NCNL', 'PESS', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (1863, 'HUW', 'INST', 'NCNL', 'FEST', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (1864, 'NAE', 'SABA', 'NCNL', 'PMO0', '100', 0);
INSERT INTO `catalogo_wbs` VALUES (1865, 'NOK', 'RREC', 'NCNL', 'TAC2', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (1866, 'HUW', 'INST', 'RE01', 'TRAS', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (1867, 'HUW', 'INST', 'RE02', 'TRAS', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (1868, 'HUW', 'INST', 'RE03', 'TRAS', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (1869, 'HUW', 'INST', 'RE04', 'TRAS', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (1870, 'HUW', 'INST', 'RE05', 'TRAS', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (1871, 'HUW', 'INST', 'RE06', 'TRAS', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (1872, 'HUW', 'INST', 'RE07', 'TRAS', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (1873, 'HUW', 'INST', 'RE08', 'TRAS', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (1874, 'HUW', 'INST', 'RE09', 'TRAS', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (1875, 'NAE', 'RDCO', 'RE04', 'JEFR', '100', 0);
INSERT INTO `catalogo_wbs` VALUES (1876, 'NAE', 'RDCO', 'NCNL', 'ADMI', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (1877, 'NOK', 'INST', 'RE09', 'RDCO', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (1878, 'NOK', 'RREC', 'NCNL', 'MONW', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (1879, 'NAE', 'SABA', 'NCNL', 'PMO0', '300', 1);
INSERT INTO `catalogo_wbs` VALUES (1880, 'NAE', 'ETP0', 'NCNL', 'PMO0', '300', 1);
INSERT INTO `catalogo_wbs` VALUES (1881, 'NAE', 'ETP0', 'NCNL', 'SECO', '300', 1);
INSERT INTO `catalogo_wbs` VALUES (1882, 'NAE', 'RDCO', 'RE04', 'ADMO', '303', 1);
INSERT INTO `catalogo_wbs` VALUES (1883, 'NAE', 'RDCO', 'RE09', 'ADMO', '303', 1);
INSERT INTO `catalogo_wbs` VALUES (1884, 'NAE', 'RDCO', 'RE05', 'ADMO', '303', 1);
INSERT INTO `catalogo_wbs` VALUES (1885, 'CIS', 'INST', 'RE05', 'MXCO', '207', 1);
INSERT INTO `catalogo_wbs` VALUES (1886, 'CIS', 'INST', 'RE06', 'MXCO', '207', 1);
INSERT INTO `catalogo_wbs` VALUES (1887, 'CIS', 'INST', 'RE07', 'MXCO', '207', 1);
INSERT INTO `catalogo_wbs` VALUES (1888, 'CIS', 'INST', 'RE09', 'MXCO', '207', 1);
INSERT INTO `catalogo_wbs` VALUES (1889, 'CIS', 'INST', 'RE08', 'MXCO', '207', 1);
INSERT INTO `catalogo_wbs` VALUES (1890, 'NAE', 'RDCO', 'NCNL', 'PMO0', '300', 1);
INSERT INTO `catalogo_wbs` VALUES (1891, 'NAE', 'RDCO', 'NCNL', 'PMO0', '301', 1);
INSERT INTO `catalogo_wbs` VALUES (1892, 'NAE', 'RDCO', 'RE03', 'ADMO', '303', 1);
INSERT INTO `catalogo_wbs` VALUES (1893, 'NAE', 'RDCO', 'RE02', 'ADMO', '303', 1);
INSERT INTO `catalogo_wbs` VALUES (1894, 'NAE', 'RDCO', 'RE01', 'ADMO', '303', 1);
INSERT INTO `catalogo_wbs` VALUES (1895, 'NAE', 'RDCO', 'RE06', 'ADMO', '303', 1);
INSERT INTO `catalogo_wbs` VALUES (1896, 'NAE', 'RDCO', 'RE07', 'ADMO', '303', 1);
INSERT INTO `catalogo_wbs` VALUES (1897, 'NAE', 'RDCO', 'RE08', 'ADMO', '303', 1);
INSERT INTO `catalogo_wbs` VALUES (1898, 'NAE', 'RDCO', 'RE01', 'ADMO', '301', 1);
INSERT INTO `catalogo_wbs` VALUES (1899, 'NAE', 'RDCO', 'RE02', 'ADMO', '301', 1);
INSERT INTO `catalogo_wbs` VALUES (1900, 'NAE', 'RDCO', 'RE03', 'ADMO', '301', 1);
INSERT INTO `catalogo_wbs` VALUES (1901, 'NAE', 'RDCO', 'RE04', 'ADMO', '301', 1);
INSERT INTO `catalogo_wbs` VALUES (1902, 'NAE', 'RDCO', 'RE05', 'ADMO', '301', 1);
INSERT INTO `catalogo_wbs` VALUES (1903, 'NAE', 'RDCO', 'RE06', 'ADMO', '301', 1);
INSERT INTO `catalogo_wbs` VALUES (1904, 'NAE', 'RDCO', 'RE07', 'ADMO', '301', 1);
INSERT INTO `catalogo_wbs` VALUES (1905, 'NAE', 'RDCO', 'RE08', 'ADMO', '301', 1);
INSERT INTO `catalogo_wbs` VALUES (1906, 'NAE', 'RDCO', 'RE09', 'ADMO', '301', 1);
INSERT INTO `catalogo_wbs` VALUES (1907, 'NAE', 'RDCO', 'RE01', 'ADMO', '300', 1);
INSERT INTO `catalogo_wbs` VALUES (1908, 'NAE', 'RDCO', 'RE02', 'ADMO', '300', 1);
INSERT INTO `catalogo_wbs` VALUES (1909, 'NAE', 'RDCO', 'RE03', 'ADMO', '300', 1);
INSERT INTO `catalogo_wbs` VALUES (1910, 'NAE', 'RDCO', 'RE04', 'ADMO', '300', 1);
INSERT INTO `catalogo_wbs` VALUES (1911, 'NAE', 'RDCO', 'RE05', 'ADMO', '300', 1);
INSERT INTO `catalogo_wbs` VALUES (1912, 'NAE', 'RDCO', 'RE06', 'ADMO', '300', 1);
INSERT INTO `catalogo_wbs` VALUES (1913, 'NAE', 'RDCO', 'RE07', 'ADMO', '300', 1);
INSERT INTO `catalogo_wbs` VALUES (1914, 'NAE', 'RDCO', 'RE08', 'ADMO', '300', 1);
INSERT INTO `catalogo_wbs` VALUES (1915, 'NAE', 'RDCO', 'RE09', 'ADMO', '300', 1);
INSERT INTO `catalogo_wbs` VALUES (1916, 'NAE', 'RDCO', 'RE01', 'RSUP', '303', 1);
INSERT INTO `catalogo_wbs` VALUES (1917, 'NAE', 'RDCO', 'RE02', 'RSUP', '303', 1);
INSERT INTO `catalogo_wbs` VALUES (1918, 'NAE', 'RDCO', 'RE03', 'RSUP', '303', 1);
INSERT INTO `catalogo_wbs` VALUES (1919, 'NAE', 'RDCO', 'RE04', 'RSUP', '303', 1);
INSERT INTO `catalogo_wbs` VALUES (1920, 'NAE', 'RDCO', 'RE05', 'RSUP', '303', 1);
INSERT INTO `catalogo_wbs` VALUES (1921, 'NAE', 'RDCO', 'RE06', 'RSUP', '303', 1);
INSERT INTO `catalogo_wbs` VALUES (1922, 'NAE', 'RDCO', 'RE07', 'RSUP', '303', 1);
INSERT INTO `catalogo_wbs` VALUES (1923, 'NAE', 'RDCO', 'RE08', 'RSUP', '303', 1);
INSERT INTO `catalogo_wbs` VALUES (1924, 'NAE', 'RDCO', 'RE09', 'RSUP', '303', 1);
INSERT INTO `catalogo_wbs` VALUES (1925, 'NAE', 'RDCO', 'RE01', 'RSUP', '301', 1);
INSERT INTO `catalogo_wbs` VALUES (1926, 'NAE', 'RDCO', 'RE02', 'RSUP', '301', 1);
INSERT INTO `catalogo_wbs` VALUES (1927, 'NAE', 'RDCO', 'RE03', 'RSUP', '301', 1);
INSERT INTO `catalogo_wbs` VALUES (1928, 'NAE', 'RDCO', 'RE04', 'RSUP', '301', 1);
INSERT INTO `catalogo_wbs` VALUES (1929, 'NAE', 'RDCO', 'RE05', 'RSUP', '301', 1);
INSERT INTO `catalogo_wbs` VALUES (1930, 'NAE', 'RDCO', 'RE06', 'RSUP', '301', 1);
INSERT INTO `catalogo_wbs` VALUES (1931, 'NAE', 'RDCO', 'RE07', 'RSUP', '301', 1);
INSERT INTO `catalogo_wbs` VALUES (1932, 'NAE', 'RDCO', 'RE08', 'RSUP', '301', 1);
INSERT INTO `catalogo_wbs` VALUES (1933, 'NAE', 'RDCO', 'RE09', 'RSUP', '301', 1);
INSERT INTO `catalogo_wbs` VALUES (1934, 'NAE', 'RDCO', 'RE01', 'RSUP', '300', 1);
INSERT INTO `catalogo_wbs` VALUES (1935, 'NAE', 'RDCO', 'RE02', 'RSUP', '300', 1);
INSERT INTO `catalogo_wbs` VALUES (1936, 'NAE', 'RDCO', 'RE03', 'RSUP', '300', 1);
INSERT INTO `catalogo_wbs` VALUES (1937, 'NAE', 'RDCO', 'RE04', 'RSUP', '300', 1);
INSERT INTO `catalogo_wbs` VALUES (1938, 'NAE', 'RDCO', 'RE05', 'RSUP', '300', 1);
INSERT INTO `catalogo_wbs` VALUES (1939, 'NAE', 'RDCO', 'RE06', 'RSUP', '300', 1);
INSERT INTO `catalogo_wbs` VALUES (1940, 'NAE', 'RDCO', 'RE07', 'RSUP', '300', 1);
INSERT INTO `catalogo_wbs` VALUES (1941, 'NAE', 'RDCO', 'RE08', 'RSUP', '300', 1);
INSERT INTO `catalogo_wbs` VALUES (1942, 'NAE', 'RDCO', 'RE09', 'RSUP', '300', 1);
INSERT INTO `catalogo_wbs` VALUES (1943, 'NAE', 'RDCO', 'RE01', 'JEFR', '303', 1);
INSERT INTO `catalogo_wbs` VALUES (1944, 'NAE', 'RDCO', 'RE02', 'JEFR', '303', 1);
INSERT INTO `catalogo_wbs` VALUES (1945, 'NAE', 'RDCO', 'RE03', 'JEFR', '303', 1);
INSERT INTO `catalogo_wbs` VALUES (1946, 'NAE', 'RDCO', 'RE04', 'JEFR', '303', 1);
INSERT INTO `catalogo_wbs` VALUES (1947, 'NAE', 'RDCO', 'RE05', 'JEFR', '303', 1);
INSERT INTO `catalogo_wbs` VALUES (1948, 'NAE', 'RDCO', 'RE06', 'JEFR', '303', 1);
INSERT INTO `catalogo_wbs` VALUES (1949, 'NAE', 'RDCO', 'RE07', 'JEFR', '303', 1);
INSERT INTO `catalogo_wbs` VALUES (1950, 'NAE', 'RDCO', 'RE08', 'JEFR', '303', 1);
INSERT INTO `catalogo_wbs` VALUES (1951, 'NAE', 'RDCO', 'RE09', 'JEFR', '303', 1);
INSERT INTO `catalogo_wbs` VALUES (1952, 'NAE', 'RDCO', 'RE01', 'JEFR', '301', 1);
INSERT INTO `catalogo_wbs` VALUES (1953, 'NAE', 'RDCO', 'RE02', 'JEFR', '301', 1);
INSERT INTO `catalogo_wbs` VALUES (1954, 'NAE', 'RDCO', 'RE03', 'JEFR', '301', 1);
INSERT INTO `catalogo_wbs` VALUES (1955, 'NAE', 'RDCO', 'RE04', 'JEFR', '301', 1);
INSERT INTO `catalogo_wbs` VALUES (1956, 'NAE', 'RDCO', 'RE05', 'JEFR', '301', 1);
INSERT INTO `catalogo_wbs` VALUES (1957, 'NAE', 'RDCO', 'RE06', 'JEFR', '301', 1);
INSERT INTO `catalogo_wbs` VALUES (1958, 'NAE', 'RDCO', 'RE07', 'JEFR', '301', 1);
INSERT INTO `catalogo_wbs` VALUES (1959, 'NAE', 'RDCO', 'RE08', 'JEFR', '301', 1);
INSERT INTO `catalogo_wbs` VALUES (1960, 'NAE', 'RDCO', 'RE09', 'JEFR', '301', 1);
INSERT INTO `catalogo_wbs` VALUES (1961, 'NAE', 'RDCO', 'RE01', 'JEFR', '300', 1);
INSERT INTO `catalogo_wbs` VALUES (1962, 'NAE', 'RDCO', 'RE02', 'JEFR', '300', 1);
INSERT INTO `catalogo_wbs` VALUES (1963, 'NAE', 'RDCO', 'RE03', 'JEFR', '300', 1);
INSERT INTO `catalogo_wbs` VALUES (1964, 'NAE', 'RDCO', 'RE04', 'JEFR', '300', 1);
INSERT INTO `catalogo_wbs` VALUES (1965, 'NAE', 'RDCO', 'RE05', 'JEFR', '300', 1);
INSERT INTO `catalogo_wbs` VALUES (1966, 'NAE', 'RDCO', 'RE06', 'JEFR', '300', 1);
INSERT INTO `catalogo_wbs` VALUES (1967, 'NAE', 'RDCO', 'RE07', 'JEFR', '300', 1);
INSERT INTO `catalogo_wbs` VALUES (1968, 'NAE', 'RDCO', 'RE08', 'JEFR', '300', 1);
INSERT INTO `catalogo_wbs` VALUES (1969, 'NAE', 'RDCO', 'RE09', 'JEFR', '300', 1);
INSERT INTO `catalogo_wbs` VALUES (1970, 'NOK', 'INST', 'NOTE', 'CLAS', '208', 1);
INSERT INTO `catalogo_wbs` VALUES (1971, 'NOK', 'INST', 'SURE', 'CLAS', '208', 1);
INSERT INTO `catalogo_wbs` VALUES (1972, 'NOK', 'INST', 'NORE', 'CLAS', '208', 1);
INSERT INTO `catalogo_wbs` VALUES (1973, 'NOK', 'INST', 'TELN', 'CLAS', '208', 1);
INSERT INTO `catalogo_wbs` VALUES (1974, 'NOK', 'INST', 'METR', 'CLAS', '208', 1);
INSERT INTO `catalogo_wbs` VALUES (1975, 'NAE', 'RDCO', 'RE01', 'IMHW', '300', 1);
INSERT INTO `catalogo_wbs` VALUES (1976, 'NAE', 'RDCO', 'RE03', 'IMHW', '300', 1);
INSERT INTO `catalogo_wbs` VALUES (1977, 'NAE', 'RDCO', 'RE02', 'IMHW', '300', 1);
INSERT INTO `catalogo_wbs` VALUES (1978, 'NAE', 'RDCO', 'RE04', 'IMHW', '300', 1);
INSERT INTO `catalogo_wbs` VALUES (1979, 'NAE', 'RDCO', 'RE05', 'IMHW', '300', 1);
INSERT INTO `catalogo_wbs` VALUES (1980, 'NAE', 'RDCO', 'RE06', 'IMHW', '300', 1);
INSERT INTO `catalogo_wbs` VALUES (1981, 'NAE', 'RDCO', 'RE07', 'IMHW', '300', 1);
INSERT INTO `catalogo_wbs` VALUES (1982, 'NAE', 'RDCO', 'RE08', 'IMHW', '300', 1);
INSERT INTO `catalogo_wbs` VALUES (1983, 'NAE', 'RDCO', 'RE01', 'SPHW', '300', 1);
INSERT INTO `catalogo_wbs` VALUES (1984, 'NAE', 'RDCO', 'RE02', 'SPHW', '300', 1);
INSERT INTO `catalogo_wbs` VALUES (1985, 'NAE', 'RDCO', 'RE03', 'SPHW', '300', 1);
INSERT INTO `catalogo_wbs` VALUES (1986, 'NAE', 'RDCO', 'RE04', 'SPHW', '300', 1);
INSERT INTO `catalogo_wbs` VALUES (1987, 'NAE', 'RDCO', 'RE05', 'SPHW', '300', 1);
INSERT INTO `catalogo_wbs` VALUES (1988, 'NAE', 'RDCO', 'RE06', 'SPHW', '300', 1);
INSERT INTO `catalogo_wbs` VALUES (1989, 'NAE', 'RDCO', 'RE07', 'SPHW', '300', 1);
INSERT INTO `catalogo_wbs` VALUES (1990, 'NAE', 'RDCO', 'RE08', 'SPHW', '300', 1);
INSERT INTO `catalogo_wbs` VALUES (1991, 'NAE', 'RDCO', 'RE09', 'SPHW', '300', 1);
INSERT INTO `catalogo_wbs` VALUES (1992, 'NAE', 'RDCO', 'RE01', 'IMNK', '300', 1);
INSERT INTO `catalogo_wbs` VALUES (1993, 'NAE', 'RDCO', 'RE02', 'IMNK', '300', 1);
INSERT INTO `catalogo_wbs` VALUES (1994, 'NAE', 'RDCO', 'RE03', 'IMNK', '300', 1);
INSERT INTO `catalogo_wbs` VALUES (1995, 'NAE', 'RDCO', 'RE04', 'IMNK', '300', 1);
INSERT INTO `catalogo_wbs` VALUES (1996, 'NAE', 'RDCO', 'RE05', 'IMNK', '300', 1);
INSERT INTO `catalogo_wbs` VALUES (1997, 'NAE', 'RDCO', 'RE06', 'IMNK', '300', 1);
INSERT INTO `catalogo_wbs` VALUES (1998, 'NAE', 'RDCO', 'RE07', 'IMNK', '300', 1);
INSERT INTO `catalogo_wbs` VALUES (1999, 'NAE', 'RDCO', 'RE08', 'IMNK', '300', 1);
INSERT INTO `catalogo_wbs` VALUES (2000, 'NAE', 'RDCO', 'RE09', 'IMNK', '300', 1);
INSERT INTO `catalogo_wbs` VALUES (2001, 'NAE', 'RDCO', 'RE01', 'SPNK', '300', 1);
INSERT INTO `catalogo_wbs` VALUES (2002, 'NAE', 'RDCO', 'RE02', 'SPNK', '300', 1);
INSERT INTO `catalogo_wbs` VALUES (2003, 'NAE', 'RDCO', 'RE03', 'SPNK', '300', 1);
INSERT INTO `catalogo_wbs` VALUES (2004, 'NAE', 'RDCO', 'RE04', 'SPNK', '300', 1);
INSERT INTO `catalogo_wbs` VALUES (2005, 'NAE', 'RDCO', 'RE05', 'SPNK', '300', 1);
INSERT INTO `catalogo_wbs` VALUES (2006, 'NAE', 'RDCO', 'RE06', 'SPNK', '300', 1);
INSERT INTO `catalogo_wbs` VALUES (2007, 'NAE', 'RDCO', 'RE07', 'SPNK', '300', 1);
INSERT INTO `catalogo_wbs` VALUES (2008, 'NAE', 'RDCO', 'RE08', 'SPNK', '300', 1);
INSERT INTO `catalogo_wbs` VALUES (2009, 'NAE', 'RDCO', 'RE09', 'SPNK', '300', 1);
INSERT INTO `catalogo_wbs` VALUES (2010, 'NOK', 'RREC', 'NCNL', 'HOMO', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (2011, 'NAE', 'AT&T', 'NCNL', 'PMO0', '300', 1);
INSERT INTO `catalogo_wbs` VALUES (2012, 'NAE', 'AT&T', 'NCNL', 'MEDX', '300', 1);
INSERT INTO `catalogo_wbs` VALUES (2013, 'NAE', 'AT&T', 'ESPA', 'PMO0', '300', 1);
INSERT INTO `catalogo_wbs` VALUES (2014, 'NAE', 'AT&T', 'ESPA', 'MEDX', '302', 1);
INSERT INTO `catalogo_wbs` VALUES (2015, 'NAE', 'AT&T', 'ESPA', 'ADMO', '300', 1);
INSERT INTO `catalogo_wbs` VALUES (2016, 'NAE', 'ADMO', 'NCNL', 'ADMO', '300', 1);
INSERT INTO `catalogo_wbs` VALUES (2017, 'NAE', 'ADMO', 'ESPA', 'ADMO', '302', 1);
INSERT INTO `catalogo_wbs` VALUES (2018, 'NAE', 'RDCO', 'ESPA', 'PMO0', '300', 1);
INSERT INTO `catalogo_wbs` VALUES (2019, 'IND', 'ADMO', 'CUAU', 'SOPE', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (2020, 'NOK', 'RREC', 'NCNL', 'IPRN', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (2021, 'NOK', 'INST', 'METR', 'GPON', '208', 1);
INSERT INTO `catalogo_wbs` VALUES (2022, 'NOK', 'INST', 'SURE', 'GPON', '208', 1);
INSERT INTO `catalogo_wbs` VALUES (2023, 'NOK', 'INST', 'NOTE', 'GPON', '208', 1);
INSERT INTO `catalogo_wbs` VALUES (2024, 'NOK', 'INST', 'NORE', 'GPON', '208', 1);
INSERT INTO `catalogo_wbs` VALUES (2025, 'NOK', 'INST', 'TELN', 'GPON', '208', 1);
INSERT INTO `catalogo_wbs` VALUES (2026, 'NOK', 'RREC', 'CUAU', 'ADMO', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (2027, 'NOK', 'RREC', 'NCNL', 'CALI', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (2028, 'NAE', 'INST', 'NCNL', 'SISF', '208', 1);
INSERT INTO `catalogo_wbs` VALUES (2029, 'NAE', 'INST', 'NCNL', 'SISF', '203', 1);
INSERT INTO `catalogo_wbs` VALUES (2030, 'NAE', 'INST', 'NCNL', 'SMMO', '208', 1);
INSERT INTO `catalogo_wbs` VALUES (2031, 'NAE', 'RDCO', 'COMB', 'PMO0', '300', 1);
INSERT INTO `catalogo_wbs` VALUES (2032, 'NOK', 'ALTN', 'NCNL', 'NOCA', '213', 1);
INSERT INTO `catalogo_wbs` VALUES (2033, 'GSB', 'INST', 'NCNL', 'CAPA', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (2034, 'NOK', 'INST', 'NCNL', 'CAET', '102', 1);
INSERT INTO `catalogo_wbs` VALUES (2035, 'NOK', 'RREC', 'NCNL', 'AUCA', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (2036, 'NOK', 'RREC', 'NCNL', 'TACA', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (2037, 'NOK', 'RREC', 'NCNL', 'SPRO', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (2038, 'IND', 'ADMO', 'NCNL', 'COME', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (2039, 'IND', 'ADMO', 'NCNL', 'FINA', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (2040, 'NOK', 'RREC', 'NCNL', 'SANI', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (2041, 'NOK', 'ALTN', 'NCNL', 'NOCA', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (2042, 'NOK', 'ALTN', 'NCNL', 'INCA', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (2043, 'NOK', 'ALTN', 'NCNL', 'VACA', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (2044, 'NOK', 'ALTN', 'NCNL', 'PECS', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (2045, 'NOK', 'ALTN', 'NCNL', 'PESS', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (2046, 'NOK', 'ALTN', 'NCNL', 'CAPA', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (2047, 'NOK', 'ALTN', 'NCNL', 'FEST', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (2048, 'NOK', 'RREC', 'NCNL', 'NOCT', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (2049, 'NOK', 'INST', 'NORE', 'VDSL', '214', 1);
INSERT INTO `catalogo_wbs` VALUES (2050, 'NOK', 'RREC', 'NCNL', 'IMSM', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (2051, 'NOK', 'INST', 'NORE', 'TBAS', '214', 1);
INSERT INTO `catalogo_wbs` VALUES (2052, 'IND', 'ADMO', 'CUAU', 'DESA', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (2053, 'IND', 'ADMO', 'CUAU', 'SOTI', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (2054, 'IND', 'ADMO', 'CUAU', 'DIIT', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (2055, 'NOK', 'RREC', 'CUAU', 'SVEN', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (2056, 'NAE', 'SABA', 'ESPA', 'PMO0', '300', 1);
INSERT INTO `catalogo_wbs` VALUES (2057, 'NOK', 'ALTN', 'NCNL', 'ADMI', '100', 0);
INSERT INTO `catalogo_wbs` VALUES (2058, 'NOK', 'ALTN', 'NCNL', 'ADMI', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (2059, 'RAD', 'RREC', 'NCNL', 'GRAL', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (2060, 'NAE', 'RDCO', 'RE09', 'INST', '300', 0);
INSERT INTO `catalogo_wbs` VALUES (2061, 'NAE', 'MGCE', 'RE04', 'RSUP', '300', 0);
INSERT INTO `catalogo_wbs` VALUES (2062, 'NAE', 'MGCE', 'RE04', 'PMO0', '300', 1);
INSERT INTO `catalogo_wbs` VALUES (2063, 'GSB', 'INST', 'NCNL', 'PECS', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (2064, 'GSB', 'INST', 'NCNL', 'PESS', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (2065, 'GSB', 'INST', 'NCNL', 'VACA', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (2066, 'NAE', 'RDCO', 'RE09', 'INST', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (2067, 'NAE', 'MGCE', 'RE04', 'RSUP', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (2068, 'NAE', 'RCMX', 'NCNL', 'PILT', '300', 1);
INSERT INTO `catalogo_wbs` VALUES (2069, 'NAE', 'RDCO', 'RE04', 'INST', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (2070, 'NAE', 'RDCO', 'RE05', 'INST', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (2071, 'NOK', 'RREC', 'NCNL', 'ADMI', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (2072, 'NAE', 'RDCO', 'RE05', 'RSUP', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (2073, 'NAE', 'RDCO', 'RE04', 'RSUP', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (2074, 'GSB', 'INST', 'NCNL', 'INCA', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (2075, 'ETP', 'INST', 'NCNL', 'APRE', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (2076, 'NAE', 'ICA', 'NCNL', 'PMO0', '300', 1);
INSERT INTO `catalogo_wbs` VALUES (2077, 'NAE', 'RDCO', 'NCNL', 'TOLS', '300', 1);
INSERT INTO `catalogo_wbs` VALUES (2078, 'NOK', 'ALTN', 'NCNL', 'SIAC', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (2079, 'AYS', 'SADM', 'METR', 'TICS', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (2080, 'NOK', 'RREC', 'NCNL', 'SOTE', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (2081, 'NOK', 'TELE', 'NCNL', 'NOC1', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (2082, 'NOK', 'RREC', 'NCNL', 'POOL', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (2083, 'GSB', 'INST', 'NCNL', 'FEST', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (2084, 'BOS', 'CORP', 'NCNL', 'CORP', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (2085, 'NOK', 'RREC', 'NCNL', 'SOPV', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (2086, 'NOK', 'RREC', 'NCNL', 'SOPF', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (2087, 'NOK', 'ULTR', 'NCNL', 'RAMW', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (2088, 'NOK', 'INST', 'NORE', 'GPON', '214', 1);
INSERT INTO `catalogo_wbs` VALUES (2089, 'NOK', 'POOL', 'NCNL', 'POOL', '100', 0);
INSERT INTO `catalogo_wbs` VALUES (2090, 'IND', 'MECO', 'NCNL', 'ALTN', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (2091, 'BEST', 'INST', 'NCNL', 'CABL', '215', 1);
INSERT INTO `catalogo_wbs` VALUES (2092, 'AYS', 'SADM', 'METR', 'SIAC', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (2093, 'AYS', 'SADM', 'METR', 'ADMI', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (2094, 'AYS', 'SADM', 'METR', 'PECS', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (2095, 'AYS', 'SADM', 'METR', 'PESS', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (2096, 'AYS', 'SADM', 'METR', 'VACA', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (2097, 'AYS', 'SADM', 'METR', 'FEST', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (2098, 'ETP', 'INST', 'NCNL', 'MIWA', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (2099, 'BOS', 'RREC', 'NCNL', 'GNTE', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (2100, 'NOK', 'POOL', 'NCNL', 'ADMI', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (2101, 'NOK', 'INST', 'NCNL', 'ULTR', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (2102, 'ETP', 'INST', 'METR', 'MXCO', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (2103, 'ETP', 'INST', 'METR', 'IMPR', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (2104, 'ETP', 'INST', 'METR', 'PECS', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (2105, 'ETP', 'INST', 'METR', 'PESS', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (2106, 'ETP', 'INST', 'METR', 'SIAC', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (2107, 'ETP', 'INST', 'METR', 'ADMI', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (2108, 'ETP', 'INST', 'METR', 'VACA', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (2109, 'ETP', 'INST', 'METR', 'CAPA', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (2110, 'ETP', 'INST', 'METR', 'INCA', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (2111, 'ETP', 'INST', 'METR', 'FEST', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (2112, 'NOK', 'TELE', 'NCNL', 'ADMI', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (2113, 'IND', 'ADMO', 'NCNL', 'TEND', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (2114, 'IND', 'ADMO', 'NCNL', 'DOIT', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (2115, 'IND', 'ADMO', 'NCNL', 'RRHH', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (2116, 'NAE', 'MEDX', 'NCNL', 'SUPE', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (2117, 'GSB', 'INST', 'NCNL', 'NOC0', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (2118, 'GSB', 'INST', 'NCNL', 'C4ZA', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (2119, 'IND', 'CORP', 'NCNL', 'OTPR', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (2120, 'IND', 'CORP', 'LATA', 'DICO', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (2121, 'IND', 'CORP', 'NCNL', 'TLNK', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (2122, 'IND', 'CORP', 'NCNL', 'SOCO', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (2123, 'IND', 'ADMO', 'NCNL', 'SOCO', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (2124, 'IND', 'ADMO', 'NCNL', 'TLNK', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (2125, 'NOK', 'RREC', 'NCNL', 'ADMI', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (2126, 'IND', 'CORP', 'NCNL', 'TLNN', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (2127, 'NAE', 'MEDX', 'NCNL', 'ADMI', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (2128, 'NAE', 'MEDX', 'NCNL', 'SIAC', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (2129, 'NAE', 'MEDX', 'NCNL', 'PECS', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (2130, 'NAE', 'MEDX', 'NCNL', 'PESS', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (2131, 'NAE', 'MEDX', 'NCNL', 'VACA', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (2132, 'NAE', 'MEDX', 'NCNL', 'CAPA', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (2133, 'NOK', 'TELE', 'NCNL', 'SUPE', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (2134, 'NOK', 'TELE', 'NCNL', 'SIAC', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (2135, 'NOK', 'TELE', 'NCNL', 'PECS', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (2136, 'NOK', 'TELE', 'NCNL', 'PESS', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (2137, 'NOK', 'TELE', 'NCNL', 'VACA', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (2138, 'NOK', 'TELE', 'NCNL', 'CAPA', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (2139, 'BEST', 'INST', 'NCNL', 'ADMI', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (2140, 'CNK', 'LATM', 'INTE', 'COLO', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (2141, 'NOK', 'RREC', 'NCNL', 'NOC2', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (2142, 'NAE', 'MEDX', 'NCNL', 'FEST', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (2143, 'CNK', 'LATM', 'INTE', 'PERU', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (2144, 'NAE', 'ALT1', 'COMB', 'PMNA', '300', 1);
INSERT INTO `catalogo_wbs` VALUES (2145, 'BEST', 'INST', 'NCNL', 'WIRE', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (2146, 'NAE', 'ALT1', 'COMB', 'PMCS', '300', 1);
INSERT INTO `catalogo_wbs` VALUES (2147, 'NAE', 'ALT1', 'COMB', 'PMOM', '300', 1);
INSERT INTO `catalogo_wbs` VALUES (2148, 'NAE', 'ADMO', 'NCNL', 'RRHH', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (2149, 'NAE', 'ADMO', 'NCNL', 'FINA', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (2150, 'NAE', 'ADMO', 'NCNL', 'SOPE', '103', 1);
INSERT INTO `catalogo_wbs` VALUES (2151, 'NAE', 'ALT1', 'ESPA', 'PMCS', '300', 1);
INSERT INTO `catalogo_wbs` VALUES (2152, 'NAE', 'ALT1', 'ESPA', 'PMOM', '300', 1);
INSERT INTO `catalogo_wbs` VALUES (2153, 'NAE', 'ALT1', 'NCNL', 'PMCS', '300', 1);
INSERT INTO `catalogo_wbs` VALUES (2154, 'NAE', 'ALT1', 'NCNL', 'PMOM', '300', 1);
INSERT INTO `catalogo_wbs` VALUES (2155, 'NOK', 'RREC', 'NCNL', 'NOCA', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (2156, 'INE', 'RREC', 'NCNL', 'ADMO', '100', 1);
INSERT INTO `catalogo_wbs` VALUES (2159, 'NOK', 'AT&T', 'NCNL', 'ATRS', '100', 1);

-- ----------------------------
-- Table structure for directores_areas
-- ----------------------------
DROP TABLE IF EXISTS `directores_areas`;
CREATE TABLE `directores_areas`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_usuario` int(10) UNSIGNED NOT NULL,
  `cliente` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `servicio` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of directores_areas
-- ----------------------------
INSERT INTO `directores_areas` VALUES (1, 2, 'IND', 'DOIT', '2019-06-06 10:35:06', '2019-06-06 10:35:10');
INSERT INTO `directores_areas` VALUES (2, 750, 'IND', 'DOIT', '2019-06-06 10:35:06', '2019-06-06 10:35:10');
INSERT INTO `directores_areas` VALUES (3, 727, 'IND', 'COME', '2019-06-06 10:35:06', '2019-06-06 10:35:10');
INSERT INTO `directores_areas` VALUES (5, 638, 'IND', 'DOIT', '2019-06-06 10:35:06', '2019-06-06 10:35:10');
INSERT INTO `directores_areas` VALUES (6, 707, 'IND', 'ADFI', '2019-06-06 10:35:06', '2019-06-06 10:35:10');
INSERT INTO `directores_areas` VALUES (7, 507, 'IND', 'CALI', '2019-06-06 10:35:06', '2019-06-06 10:35:10');
INSERT INTO `directores_areas` VALUES (8, 117, 'IND', 'CORP', '2019-06-06 10:35:06', '2019-06-06 10:35:10');
INSERT INTO `directores_areas` VALUES (9, 232, 'IND', 'OPER', '2019-06-06 10:35:06', '2019-06-06 10:35:10');
INSERT INTO `directores_areas` VALUES (10, 777, 'RAD', 'VARI', '2019-06-06 10:35:06', '2019-06-06 10:35:10');
INSERT INTO `directores_areas` VALUES (11, 777, 'RAD', 'SERV', '2019-06-06 10:35:06', '2019-06-06 10:35:10');
INSERT INTO `directores_areas` VALUES (12, 86, 'NOK', 'SERV', '2019-06-06 10:35:06', '2019-06-06 10:35:06');
INSERT INTO `directores_areas` VALUES (13, 86, 'NOK', 'POLZ', '2019-06-06 10:35:06', '2019-06-06 10:35:06');
INSERT INTO `directores_areas` VALUES (14, 86, 'NOK', 'TKBS', '2019-06-06 10:35:06', '2019-06-06 10:35:06');
INSERT INTO `directores_areas` VALUES (15, 638, 'IND', 'ADFI', '2019-06-06 10:35:06', '2019-06-06 10:35:10');
INSERT INTO `directores_areas` VALUES (16, 232, 'NOK', 'VARI', '2019-06-06 10:35:06', '2019-06-06 10:35:06');

-- ----------------------------
-- Table structure for empleados
-- ----------------------------
DROP TABLE IF EXISTS `empleados`;
CREATE TABLE `empleados`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `empleado_num` int(11) NULL DEFAULT 0 COMMENT 'NUMERO DE EMPLEADO',
  `empleado_alcatel_id` int(4) NULL DEFAULT 0 COMMENT 'IND',
  `empleado_nombre` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `empleado_apaterno` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `empleado_amaterno` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `calle` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `num_exterior` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `num_interior` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `colonia` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `municipio` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cp` int(5) NULL DEFAULT NULL,
  `estado` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nss` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `curp` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `rfc` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mail` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `telefono2` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `telefono` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mail_indeplo` varchar(60) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `empleado_domicilio` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `empresa` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'INDEPLO',
  `empleado_grupo` enum('ALCATEL','ROADTRACK','DEHN','HELICOM','INDEPLO ADMIN') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'ALCATEL',
  `segmento` enum('ADMINISTRATIVO','OPERATIVO') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'OPERATIVO',
  `empleado_po` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'GENERA PO',
  `diario_nomina` decimal(10, 2) NULL DEFAULT NULL COMMENT 'NOMINA_DIARIO',
  `empleado_estatus` enum('ACTIVO','INACTIVO','BAJA') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'ACTIVO',
  `empleado_fecha_alta` date NULL DEFAULT NULL,
  `empleado_fecha_baja` date NULL DEFAULT NULL,
  `empleado_observaciones` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `viaticos_dia` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `baja_rh` date NULL DEFAULT NULL,
  `empleado_update` timestamp(0) NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP COMMENT 'ultima actualizacion del empleado',
  `viable` tinyint(1) UNSIGNED NULL DEFAULT NULL,
  `motivo` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bloqueo_viaticos` tinyint(1) NULL DEFAULT 0,
  `motivo_bloqueo` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `contratista` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `tipo_contrato` int(11) NOT NULL DEFAULT 1,
  `updated_at` date NULL DEFAULT NULL,
  `fecha_ingreso` date NULL DEFAULT NULL,
  `localidad` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `proveedor` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `razon_social` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `esquema_viaticos` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `num_monex` int(11) NULL DEFAULT NULL,
  `no_cuenta` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `clave_cuenta` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `banco` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id_solicitud` int(11) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `download_info` int(11) NULL DEFAULT 0,
  `empleadoscol` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `area` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `curp`(`curp`) USING BTREE,
  INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for incidencias
-- ----------------------------
DROP TABLE IF EXISTS `incidencias`;
CREATE TABLE `incidencias`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_empleado` int(10) UNSIGNED NOT NULL,
  `id_incidencia_tipo` int(11) NOT NULL,
  `fecha_solicitud` date NOT NULL,
  `fecha_inicio` date NULL DEFAULT NULL,
  `fecha_fin` date NULL DEFAULT NULL,
  `dias` int(11) NULL DEFAULT NULL,
  `monto` decimal(10, 3) NULL DEFAULT NULL,
  `motivo` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `id_solicitante` int(10) UNSIGNED NOT NULL,
  `id_lote` int(10) UNSIGNED NULL DEFAULT NULL,
  `auth_rh` date NULL DEFAULT NULL,
  `id_rh_auth` int(10) UNSIGNED NULL DEFAULT NULL,
  `auth_direccion` date NULL DEFAULT NULL,
  `id_direccion_auth` int(10) UNSIGNED NULL DEFAULT NULL,
  `id_auth_venta` int(10) UNSIGNED NULL DEFAULT NULL,
  `auth_venta` date NULL DEFAULT NULL,
  `auth_gerente` date NULL DEFAULT NULL,
  `id_gerente_auth` int(10) UNSIGNED NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  `status_auth` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `download_info` int(11) NULL DEFAULT 0,
  `area_cancelar` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `area_solicitante` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `vobo` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `vobo_final` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `id_proyecto` int(10) UNSIGNED NULL DEFAULT NULL,
  `id_periodo` int(10) UNSIGNED NULL DEFAULT NULL,
  `evidencia` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `incidencias_id_incidencia_tipo_foreign`(`id_incidencia_tipo`) USING BTREE,
  INDEX `incidencias_id_solicitante_foreign`(`id_solicitante`) USING BTREE,
  INDEX `incidencias_id_lote_foreign`(`id_lote`) USING BTREE,
  INDEX `incidencias_id_rh_auth_foreign`(`id_rh_auth`) USING BTREE,
  INDEX `incidencias_id_direccion_auth_foreign`(`id_direccion_auth`) USING BTREE,
  INDEX `incidencias_id_capital_auth_foreign`(`id_gerente_auth`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 132 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of incidencias
-- ----------------------------
INSERT INTO `incidencias` VALUES (1, 1240, 266, '2019-08-13', NULL, NULL, NULL, 750.000, 'FALTA COMPROBACIÓN VIÁTICOS', 45, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-13 13:50:51', '2019-08-27 09:54:35', NULL, NULL, 0, NULL, 'RH', NULL, NULL, NULL, 7, NULL);
INSERT INTO `incidencias` VALUES (2, 2308, 266, '2019-08-13', NULL, NULL, NULL, 3733.330, 'INGRESÓ 4 DÍAS DESPUÉS DE LA FECHA INDICADA EN INCORE', 45, NULL, '2019-08-27', 750, NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-13 13:56:21', '2019-08-27 09:54:34', NULL, 'POR ENVIAR', 0, NULL, 'RH', NULL, NULL, NULL, 7, NULL);
INSERT INTO `incidencias` VALUES (3, 1337, 266, '2019-08-13', NULL, NULL, NULL, 1308.500, 'PERCANCE AUTO', 45, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-13 13:57:22', '2019-08-27 09:54:34', NULL, NULL, 0, NULL, 'RH', NULL, NULL, NULL, 7, NULL);
INSERT INTO `incidencias` VALUES (4, 1524, 266, '2019-08-13', NULL, NULL, NULL, 583.330, 'DAÑO LAP', 45, NULL, '2019-08-27', 750, NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-13 13:58:46', '2019-08-27 09:54:34', NULL, 'POR ENVIAR', 0, NULL, 'RH', NULL, NULL, NULL, 7, NULL);
INSERT INTO `incidencias` VALUES (5, 850, 266, '2019-08-13', NULL, NULL, NULL, 280.000, 'TAPON AUTO', 45, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-13 13:59:27', '2019-08-27 09:54:34', NULL, NULL, 0, NULL, 'RH', NULL, NULL, NULL, 7, NULL);
INSERT INTO `incidencias` VALUES (6, 2177, 266, '2019-08-13', NULL, NULL, NULL, 891.000, 'PERCANCE AUTO', 45, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-13 14:00:42', '2019-08-27 09:54:34', NULL, NULL, 0, NULL, 'RH', NULL, NULL, NULL, 7, NULL);
INSERT INTO `incidencias` VALUES (7, 1570, 266, '2019-08-13', NULL, NULL, NULL, 58.000, 'EXTRAVÍO ACCESO CORPORATIVO', 45, NULL, '2019-08-27', 750, NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-13 14:01:22', '2019-08-27 09:54:34', NULL, 'POR ENVIAR', 0, NULL, 'RH', NULL, NULL, NULL, 7, NULL);
INSERT INTO `incidencias` VALUES (8, 936, 266, '2019-08-13', NULL, NULL, NULL, 58.000, 'EXTRAVÍO ACCESO CORPORATIVO', 45, NULL, '2019-08-27', 750, NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-13 14:03:52', '2019-08-27 09:54:34', NULL, 'POR ENVIAR', 0, NULL, 'RH', NULL, NULL, NULL, 7, NULL);
INSERT INTO `incidencias` VALUES (9, 1167, 266, '2019-08-13', NULL, NULL, NULL, 58.000, 'EXTRAVÍO ACCESO CORPORATIVO', 45, NULL, '2019-08-27', 750, NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-13 14:04:21', '2019-08-27 09:54:33', NULL, 'POR ENVIAR', 0, NULL, 'RH', NULL, NULL, NULL, 7, NULL);
INSERT INTO `incidencias` VALUES (10, 1279, 266, '2019-08-13', NULL, NULL, NULL, 500.000, 'FALTA COMPROBACIÓN VIÁTICOS', 45, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-13 14:05:19', '2019-08-27 09:54:33', NULL, NULL, 0, NULL, 'RH', NULL, NULL, NULL, 7, NULL);
INSERT INTO `incidencias` VALUES (11, 2181, 513, '2019-08-13', NULL, NULL, 5, NULL, 'COBERTURAS', 764, NULL, NULL, NULL, '2019-09-05', 82, NULL, NULL, NULL, NULL, '2019-08-13 17:18:36', '2019-09-05 16:17:24', NULL, 'POR ENVIAR', 0, NULL, 'COOR', 'incidencias/vobo_jefe_11/vobo_jefe_11.xlsx', NULL, 53029, 7, NULL);
INSERT INTO `incidencias` VALUES (12, 2060, 513, '2019-08-13', NULL, NULL, 1, NULL, 'COBERTURAS', 764, NULL, NULL, NULL, '2019-09-05', 82, NULL, NULL, NULL, NULL, '2019-08-13 17:21:26', '2019-09-05 16:17:24', NULL, 'POR ENVIAR', 0, NULL, 'COOR', 'incidencias/vobo_jefe_12/vobo_jefe_12.xlsx', NULL, 52533, 7, NULL);
INSERT INTO `incidencias` VALUES (13, 2181, 520, '2019-08-13', NULL, NULL, 1, NULL, 'COBERTURA', 764, NULL, NULL, NULL, '2019-09-05', 82, NULL, NULL, NULL, NULL, '2019-08-13 17:23:54', '2019-09-05 16:17:24', NULL, 'POR ENVIAR', 0, NULL, 'COOR', 'incidencias/vobo_jefe_13/vobo_jefe_13.xlsx', NULL, 53024, 7, NULL);
INSERT INTO `incidencias` VALUES (14, 1959, 513, '2019-08-13', NULL, NULL, 2, NULL, 'COBERTURAS', 764, NULL, NULL, NULL, '2019-09-05', 82, NULL, NULL, NULL, NULL, '2019-08-13 17:32:57', '2019-09-05 16:17:24', NULL, 'POR ENVIAR', 0, NULL, 'COOR', 'incidencias/vobo_jefe_14/vobo_jefe_14.xlsx', NULL, 52490, 7, NULL);
INSERT INTO `incidencias` VALUES (15, 1946, 710, '2019-08-13', '2019-07-05', NULL, 1, NULL, '05/07/2019', 45, NULL, '2019-08-27', 750, NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-13 17:47:05', '2019-08-27 09:54:33', NULL, 'POR ENVIAR', 0, NULL, 'RH', NULL, NULL, NULL, 7, NULL);
INSERT INTO `incidencias` VALUES (16, 1843, 710, '2019-08-13', '2019-07-07', NULL, 1, NULL, '07/07/2019', 45, NULL, '2019-08-27', 750, NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-13 17:48:14', '2019-08-27 09:54:33', NULL, 'POR ENVIAR', 0, NULL, 'RH', NULL, NULL, NULL, 7, NULL);
INSERT INTO `incidencias` VALUES (17, 1880, 710, '2019-08-13', '2019-07-09', NULL, 1, NULL, '09/07/2019', 45, NULL, '2019-08-27', 750, NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-13 17:55:37', '2019-08-27 09:54:33', NULL, 'POR ENVIAR', 0, NULL, 'RH', NULL, NULL, NULL, 7, NULL);
INSERT INTO `incidencias` VALUES (18, 2287, 710, '2019-08-13', '2019-07-11', NULL, 1, NULL, '11/07/2019', 45, NULL, '2019-08-27', 750, NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-13 17:56:36', '2019-08-27 09:54:32', NULL, 'POR ENVIAR', 0, NULL, 'RH', NULL, NULL, NULL, 7, NULL);
INSERT INTO `incidencias` VALUES (19, 2260, 710, '2019-08-13', '2019-07-15', NULL, 1, NULL, '15/07/2019', 45, NULL, '2019-08-27', 750, NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-13 17:57:26', '2019-08-27 09:54:32', NULL, 'POR ENVIAR', 0, NULL, 'RH', NULL, NULL, NULL, 7, NULL);
INSERT INTO `incidencias` VALUES (20, 2134, 710, '2019-08-13', '2019-07-18', NULL, 1, NULL, '18/07/2019', 45, NULL, '2019-08-27', 750, NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-13 17:58:23', '2019-08-27 09:54:32', NULL, 'POR ENVIAR', 0, NULL, 'RH', NULL, NULL, NULL, 7, NULL);
INSERT INTO `incidencias` VALUES (21, 1778, 710, '2019-08-13', '2019-07-22', NULL, 1, NULL, '22/07/2019', 45, NULL, '2019-08-27', 750, NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-13 17:59:29', '2019-08-27 09:54:32', NULL, 'POR ENVIAR', 0, NULL, 'RH', NULL, NULL, NULL, 7, NULL);
INSERT INTO `incidencias` VALUES (22, 2156, 710, '2019-08-13', '2019-07-30', NULL, 1, NULL, '30/07/2019', 45, NULL, '2019-08-27', 750, NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-13 18:00:14', '2019-08-27 09:54:32', NULL, 'POR ENVIAR', 0, NULL, 'RH', NULL, NULL, NULL, 7, NULL);
INSERT INTO `incidencias` VALUES (23, 1836, 710, '2019-08-13', '2019-07-01', NULL, 1, NULL, '29/07/2019', 45, NULL, '2019-08-27', 750, NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-13 18:01:06', '2019-08-27 09:54:32', NULL, 'POR ENVIAR', 0, NULL, 'RH', NULL, NULL, NULL, 7, NULL);
INSERT INTO `incidencias` VALUES (24, 2074, 266, '2019-08-13', NULL, NULL, NULL, 520.000, 'DOS DíAS QUE SE PAGA POR COBERTURA POR ERROR DE CLIENTE', 45, NULL, '2019-08-27', 750, NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-13 18:02:58', '2019-08-27 09:54:32', NULL, 'POR ENVIAR', 0, NULL, 'RH', NULL, NULL, NULL, 7, NULL);
INSERT INTO `incidencias` VALUES (25, 2153, 502, '2019-08-13', NULL, NULL, 3, NULL, '16, 17 y 18 de julio', 45, NULL, NULL, NULL, '2019-09-05', 82, NULL, NULL, NULL, NULL, '2019-08-13 18:31:42', '2019-09-05 16:17:24', NULL, 'POR ENVIAR', 0, NULL, 'RH', 'incidencias/vobo_jefe_25/vobo_jefe_25.html', NULL, 52814, 7, NULL);
INSERT INTO `incidencias` VALUES (26, 1837, 502, '2019-08-13', NULL, NULL, 1, NULL, '13 de julio', 45, NULL, NULL, NULL, '2019-09-05', 82, NULL, NULL, NULL, NULL, '2019-08-13 18:34:25', '2019-09-05 16:17:24', NULL, 'POR ENVIAR', 0, NULL, 'RH', 'incidencias/vobo_jefe_26/vobo_jefe_26.html', NULL, 52369, 7, NULL);
INSERT INTO `incidencias` VALUES (27, 2041, 513, '2019-08-13', NULL, NULL, 1, NULL, 'COBERTURAS', 764, NULL, NULL, NULL, '2019-09-05', 82, NULL, NULL, NULL, NULL, '2019-08-13 18:34:52', '2019-09-05 16:17:24', NULL, 'POR ENVIAR', 0, NULL, 'COOR', 'incidencias/vobo_jefe_27/vobo_jefe_27.xlsx', NULL, 52524, 7, NULL);
INSERT INTO `incidencias` VALUES (28, 1841, 502, '2019-08-13', NULL, NULL, 1, NULL, '14 de julio', 45, NULL, NULL, NULL, '2019-09-05', 82, NULL, NULL, NULL, NULL, '2019-08-13 18:35:47', '2019-09-05 16:17:24', NULL, 'POR ENVIAR', 0, NULL, 'RH', 'incidencias/vobo_jefe_28/vobo_jefe_28.html', NULL, 52375, 7, NULL);
INSERT INTO `incidencias` VALUES (29, 1883, 513, '2019-08-13', NULL, NULL, 2, NULL, 'COBERTURAS', 764, NULL, NULL, NULL, '2019-09-05', 82, NULL, NULL, NULL, NULL, '2019-08-13 18:36:47', '2019-09-05 16:17:24', NULL, 'POR ENVIAR', 0, NULL, 'COOR', 'incidencias/vobo_jefe_29/vobo_jefe_29.xlsx', NULL, 52417, 7, NULL);
INSERT INTO `incidencias` VALUES (30, 1711, 502, '2019-08-13', NULL, NULL, 2, NULL, '1 y 2 de agosto', 45, NULL, NULL, NULL, '2019-09-05', 82, NULL, NULL, NULL, NULL, '2019-08-13 18:37:07', '2019-09-05 16:17:24', NULL, 'POR ENVIAR', 0, NULL, 'RH', 'incidencias/vobo_jefe_30/vobo_jefe_30.html', NULL, 52215, 7, NULL);
INSERT INTO `incidencias` VALUES (31, 2247, 502, '2019-08-13', NULL, NULL, 2, NULL, '20 y 21 de julio', 45, NULL, NULL, NULL, '2019-09-05', 82, NULL, NULL, NULL, NULL, '2019-08-13 18:40:23', '2019-09-05 16:17:24', NULL, 'POR ENVIAR', 0, NULL, 'RH', 'incidencias/vobo_jefe_31/vobo_jefe_31.html', NULL, 53132, 7, NULL);
INSERT INTO `incidencias` VALUES (32, 1784, 502, '2019-08-13', NULL, NULL, 2, NULL, '19 y 22 de julio', 45, NULL, NULL, NULL, '2019-09-05', 82, NULL, NULL, NULL, NULL, '2019-08-13 18:41:49', '2019-09-05 16:17:24', NULL, 'POR ENVIAR', 0, NULL, 'RH', 'incidencias/vobo_jefe_32/vobo_jefe_32.html', NULL, 52314, 7, NULL);
INSERT INTO `incidencias` VALUES (33, 1833, 502, '2019-08-13', NULL, NULL, 1, NULL, '26 de julio', 45, NULL, NULL, NULL, '2019-09-05', 82, NULL, NULL, NULL, NULL, '2019-08-13 18:43:28', '2019-09-05 16:17:24', NULL, 'POR ENVIAR', 0, NULL, 'RH', 'incidencias/vobo_jefe_33/vobo_jefe_33.html', NULL, 52360, 7, NULL);
INSERT INTO `incidencias` VALUES (34, 1735, 502, '2019-08-13', NULL, NULL, 1, NULL, '28 de julio', 45, NULL, NULL, NULL, '2019-09-05', 82, NULL, NULL, NULL, NULL, '2019-08-13 18:44:36', '2019-09-05 16:17:24', NULL, 'POR ENVIAR', 0, NULL, 'RH', 'incidencias/vobo_jefe_34/vobo_jefe_34.html', NULL, 52251, 7, NULL);
INSERT INTO `incidencias` VALUES (35, 2303, 513, '2019-08-13', NULL, NULL, 1, NULL, 'EL PERSONAL SE DIO DE ALTA EL 17 DE JULIO PERO POR TRABAJOS DE URGENCIA LABORARON EL 16 DE JULIO, JESSICA RODRIGUEZ CONFIRMA QUE EL PERSONAL LABORÓ DICHO DÍA MISMO QUE SE VA A RECONOCER COMO VENTA Y SOLICITAN EL PAGO A LOS RECURSOS\r\n\r\n\r\n\r\n\r\n', 764, NULL, NULL, NULL, '2019-08-27', 750, 82, '2019-09-05', NULL, NULL, '2019-08-13 18:45:39', '2019-09-05 16:17:24', NULL, 'POR ENVIAR', 0, NULL, 'COOR', 'incidencias/vobo_jefe_35/vobo_jefe_35.msg', NULL, 53260, 7, NULL);
INSERT INTO `incidencias` VALUES (36, 1901, 502, '2019-08-13', NULL, NULL, 1, NULL, '26 de julio', 45, NULL, NULL, NULL, '2019-09-05', 82, NULL, NULL, NULL, NULL, '2019-08-13 18:45:45', '2019-09-05 16:17:24', NULL, 'POR ENVIAR', 0, NULL, 'RH', 'incidencias/vobo_jefe_36/vobo_jefe_36.html', NULL, 52435, 7, NULL);
INSERT INTO `incidencias` VALUES (37, 2304, 513, '2019-08-13', NULL, NULL, 1, NULL, 'EL PERSONAL SE DIO DE ALTA EL 17 DE JULIO PERO POR TRABAJOS DE URGENCIA LABORARON EL 16 DE JULIO, JESSICA RODRIGUEZ CONFIRMA QUE EL PERSONAL LABORÓ DICHO DÍA MISMO QUE SE VA A RECONOCER COMO VENTA Y SOLICITAN EL PAGO A LOS RECURSOS\r\n\r\n\r\n\r\n\r\n\r\n', 764, NULL, NULL, NULL, '2019-09-05', 82, NULL, NULL, NULL, NULL, '2019-08-13 18:48:40', '2019-09-05 16:17:24', NULL, 'POR ENVIAR', 0, NULL, 'COOR', 'incidencias/vobo_jefe_37/vobo_jefe_37.msg', NULL, 53261, 7, NULL);
INSERT INTO `incidencias` VALUES (38, 2305, 513, '2019-08-13', NULL, NULL, 1, NULL, 'EL PERSONAL SE DIO DE ALTA EL 17 DE JULIO PERO POR TRABAJOS DE URGENCIA LABORARON EL 16 DE JULIO, JESSICA RODRIGUEZ CONFIRMA QUE EL PERSONAL LABORÓ DICHO DÍA MISMO QUE SE VA A RECONOCER COMO VENTA Y SOLICITAN EL PAGO A LOS RECURSOS\r\n\r\n\r\n\r\n\r\n', 764, NULL, NULL, NULL, '2019-08-27', 750, 82, '2019-09-05', NULL, NULL, '2019-08-13 18:50:03', '2019-09-05 16:17:24', NULL, 'POR ENVIAR', 0, NULL, 'COOR', 'incidencias/vobo_jefe_38/vobo_jefe_38.msg', NULL, 53262, 7, NULL);
INSERT INTO `incidencias` VALUES (39, 2306, 513, '2019-08-13', NULL, NULL, 1, NULL, 'EL PERSONAL SE DIO DE ALTA EL 17 DE JULIO PERO POR TRABAJOS DE URGENCIA LABORARON EL 16 DE JULIO, JESSICA RODRIGUEZ CONFIRMA QUE EL PERSONAL LABORÓ DICHO DÍA MISMO QUE SE VA A RECONOCER COMO VENTA Y SOLICITAN EL PAGO A LOS RECURSOS\r\n\r\n\r\n\r\n\r\n', 764, NULL, NULL, NULL, '2019-09-05', 82, NULL, NULL, NULL, NULL, '2019-08-13 18:51:35', '2019-09-05 16:17:24', NULL, 'POR ENVIAR', 0, NULL, 'COOR', 'incidencias/vobo_jefe_39/vobo_jefe_39.msg', NULL, 53263, 7, NULL);
INSERT INTO `incidencias` VALUES (40, 2307, 513, '2019-08-13', NULL, NULL, 1, NULL, 'EL PERSONAL SE DIO DE ALTA EL 17 DE JULIO PERO POR TRABAJOS DE URGENCIA LABORARON EL 16 DE JULIO, JESSICA RODRIGUEZ CONFIRMA QUE EL PERSONAL LABORÓ DICHO DÍA MISMO QUE SE VA A RECONOCER COMO VENTA Y SOLICITAN EL PAGO A LOS RECURSOS\r\n\r\n\r\n\r\n\r\n', 764, NULL, NULL, NULL, '2019-09-05', 82, NULL, NULL, NULL, NULL, '2019-08-13 18:53:01', '2019-09-05 16:17:24', NULL, 'POR ENVIAR', 0, NULL, 'COOR', 'incidencias/vobo_jefe_40/vobo_jefe_40.msg', NULL, 53264, 7, NULL);
INSERT INTO `incidencias` VALUES (41, 776, 266, '2019-08-13', NULL, NULL, NULL, 469.650, 'DAñO AUTO', 45, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-13 18:54:24', '2019-08-27 09:54:30', NULL, NULL, 0, NULL, 'RH', NULL, NULL, NULL, 7, NULL);
INSERT INTO `incidencias` VALUES (42, 1690, 502, '2019-08-13', NULL, NULL, 2, NULL, '13 y 14 de julio', 45, NULL, NULL, NULL, '2019-09-05', 82, NULL, NULL, NULL, NULL, '2019-08-13 18:56:40', '2019-09-05 16:17:24', NULL, 'POR ENVIAR', 0, NULL, 'RH', 'incidencias/vobo_jefe_42/vobo_jefe_42.html', NULL, 52191, 7, NULL);
INSERT INTO `incidencias` VALUES (43, 2285, 208, '2019-08-13', NULL, NULL, NULL, 5000.000, 'BONO ACORDADO DESDE LA CONTRATACIÓN CON RAUL VENTURA\r\n', 764, NULL, NULL, NULL, '2019-09-05', 82, NULL, NULL, NULL, NULL, '2019-08-13 20:10:48', '2019-09-05 16:17:24', NULL, 'POR ENVIAR', 0, NULL, 'COOR', 'incidencias/vobo_jefe_43/vobo_jefe_43.msg', NULL, 51912, 7, NULL);
INSERT INTO `incidencias` VALUES (44, 2286, 208, '2019-08-13', NULL, NULL, NULL, 5000.000, 'BONO ACORDADO DESDE LA CONTRATACIÓN CON RAUL VENTURA\r\n', 764, NULL, NULL, NULL, '2019-09-05', 82, NULL, NULL, NULL, NULL, '2019-08-13 20:17:20', '2019-09-05 16:17:24', NULL, 'POR ENVIAR', 0, NULL, 'COOR', 'incidencias/vobo_jefe_44/vobo_jefe_44.msg', NULL, 51912, 7, NULL);
INSERT INTO `incidencias` VALUES (45, 1570, 208, '2019-08-13', NULL, NULL, NULL, 7600.000, 'PAGO GUARDIAS JULIO VIATICOS ', 764, NULL, NULL, NULL, '2019-09-05', 82, NULL, NULL, NULL, NULL, '2019-08-13 20:22:58', '2019-09-05 16:17:24', NULL, 'POR ENVIAR', 0, NULL, 'COOR', 'incidencias/vobo_jefe_45/vobo_jefe_45.xlsx', NULL, 51920, 7, NULL);
INSERT INTO `incidencias` VALUES (46, 2144, 208, '2019-08-13', NULL, NULL, NULL, 2250.000, 'GUARDIA GESTIÓN DE ACTIVOS DEL MES JULIO\r\n', 764, NULL, NULL, NULL, '2019-09-05', 82, NULL, NULL, NULL, NULL, '2019-08-13 20:28:07', '2019-09-05 16:17:24', NULL, 'POR ENVIAR', 0, NULL, 'COOR', 'incidencias/vobo_jefe_46/vobo_jefe_46.xlsx', NULL, 51920, 7, NULL);
INSERT INTO `incidencias` VALUES (47, 1524, 208, '2019-08-13', NULL, NULL, NULL, 1500.000, 'GUARDIA GESTIÓN DE ACTIVOS DEL MES JULIO\r\n', 764, NULL, NULL, NULL, '2019-09-05', 82, NULL, NULL, NULL, NULL, '2019-08-13 20:30:02', '2019-09-05 16:17:24', NULL, 'POR ENVIAR', 0, NULL, 'COOR', 'incidencias/vobo_jefe_47/vobo_jefe_47.xlsx', NULL, 51920, 7, NULL);
INSERT INTO `incidencias` VALUES (48, 2047, 208, '2019-08-13', NULL, NULL, NULL, 1750.000, 'GUARDIAS GESTION DE ACTIVOS JULIO ', 764, NULL, NULL, NULL, '2019-09-05', 82, NULL, NULL, NULL, NULL, '2019-08-13 20:32:43', '2019-09-05 16:17:24', NULL, 'POR ENVIAR', 0, NULL, 'COOR', 'incidencias/vobo_jefe_48/vobo_jefe_48.xlsx', NULL, 51920, 7, NULL);
INSERT INTO `incidencias` VALUES (49, 1241, 208, '2019-08-13', NULL, NULL, NULL, 2000.000, 'GUARDIA GESTIÓN DE ACTIVOS DEL MES JULIO\r\n', 764, NULL, NULL, NULL, '2019-09-05', 82, NULL, NULL, NULL, NULL, '2019-08-13 20:34:46', '2019-09-05 16:17:24', NULL, 'POR ENVIAR', 0, NULL, 'COOR', 'incidencias/vobo_jefe_49/vobo_jefe_49.xlsx', NULL, 51920, 7, NULL);
INSERT INTO `incidencias` VALUES (50, 2224, 208, '2019-08-14', NULL, NULL, NULL, 300.000, 'APOYO A INTERNET CORRESPONDIENTE A  EL MES DE AGOSTO', 476, NULL, NULL, NULL, NULL, NULL, 82, '2019-09-05', NULL, NULL, '2019-08-14 18:10:56', '2019-09-05 16:17:24', NULL, 'POR ENVIAR', 0, NULL, 'COOR', NULL, NULL, 51943, 7, NULL);
INSERT INTO `incidencias` VALUES (51, 2219, 208, '2019-08-14', NULL, NULL, NULL, 300.000, 'APOYO A INTERNET CORRESPONDIENTE A  EL MES DE AGOSTO', 476, NULL, NULL, NULL, NULL, NULL, 82, '2019-09-05', NULL, NULL, '2019-08-14 18:12:22', '2019-09-05 16:17:24', NULL, 'POR ENVIAR', 0, NULL, 'COOR', NULL, NULL, 51943, 7, NULL);
INSERT INTO `incidencias` VALUES (52, 2216, 208, '2019-08-14', NULL, NULL, NULL, 300.000, 'APOYO A INTERNET CORRESPONDIENTE A  EL MES DE AGOSTO', 476, NULL, NULL, NULL, NULL, NULL, 82, '2019-09-05', NULL, NULL, '2019-08-14 18:13:04', '2019-09-05 16:17:24', NULL, 'POR ENVIAR', 0, NULL, 'COOR', NULL, NULL, 51943, 7, NULL);
INSERT INTO `incidencias` VALUES (53, 2218, 208, '2019-08-14', NULL, NULL, NULL, 300.000, 'APOYO A INTERNET CORRESPONDIENTE A  EL MES DE AGOSTO', 476, NULL, NULL, NULL, NULL, NULL, 82, '2019-09-05', NULL, NULL, '2019-08-14 18:13:40', '2019-09-05 16:17:24', NULL, 'POR ENVIAR', 0, NULL, 'COOR', NULL, NULL, 51943, 7, NULL);
INSERT INTO `incidencias` VALUES (54, 2223, 208, '2019-08-14', NULL, NULL, NULL, 300.000, 'APOYO A INTERNET CORRESPONDIENTE A  EL MES DE AGOSTO', 476, NULL, NULL, NULL, NULL, NULL, 82, '2019-09-05', NULL, NULL, '2019-08-14 18:14:16', '2019-09-05 16:17:24', NULL, 'POR ENVIAR', 0, NULL, 'COOR', NULL, NULL, 51943, 7, NULL);
INSERT INTO `incidencias` VALUES (55, 2234, 208, '2019-08-14', NULL, NULL, NULL, 300.000, 'APOYO A INTERNET CORRESPONDIENTE A  EL MES DE AGOSTO', 476, NULL, NULL, NULL, NULL, NULL, 82, '2019-09-05', NULL, NULL, '2019-08-14 18:14:52', '2019-09-05 16:17:24', NULL, 'POR ENVIAR', 0, NULL, 'COOR', NULL, NULL, 51943, 7, NULL);
INSERT INTO `incidencias` VALUES (56, 2232, 208, '2019-08-14', NULL, NULL, NULL, 300.000, 'APOYO A INTERNET CORRESPONDIENTE A  EL MES DE AGOSTO', 476, NULL, NULL, NULL, NULL, NULL, 82, '2019-09-05', NULL, NULL, '2019-08-14 18:15:45', '2019-09-05 16:17:24', NULL, 'POR ENVIAR', 0, NULL, 'COOR', NULL, NULL, 51943, 7, NULL);
INSERT INTO `incidencias` VALUES (57, 2226, 208, '2019-08-14', NULL, NULL, NULL, 300.000, 'APOYO A INTERNET CORRESPONDIENTE A  EL MES DE AGOSTO', 476, NULL, NULL, NULL, NULL, NULL, 82, '2019-09-05', NULL, NULL, '2019-08-14 18:16:24', '2019-09-05 16:17:24', NULL, 'POR ENVIAR', 0, NULL, 'COOR', NULL, NULL, 51943, 7, NULL);
INSERT INTO `incidencias` VALUES (58, 2221, 208, '2019-08-14', NULL, NULL, NULL, 300.000, 'APOYO A INTERNET CORRESPONDIENTE A  EL MES DE AGOSTO', 476, NULL, NULL, NULL, NULL, NULL, 82, '2019-09-05', NULL, NULL, '2019-08-14 18:17:44', '2019-09-05 16:17:24', NULL, 'POR ENVIAR', 0, NULL, 'COOR', NULL, NULL, 51943, 7, NULL);
INSERT INTO `incidencias` VALUES (59, 2217, 208, '2019-08-14', NULL, NULL, NULL, 300.000, 'APOYO A INTERNET CORRESPONDIENTE A  EL MES DE AGOSTO', 476, NULL, NULL, NULL, NULL, NULL, 82, '2019-09-05', NULL, NULL, '2019-08-14 18:18:29', '2019-09-05 16:17:24', NULL, 'POR ENVIAR', 0, NULL, 'COOR', NULL, NULL, 51943, 7, NULL);
INSERT INTO `incidencias` VALUES (60, 2220, 208, '2019-08-14', NULL, NULL, NULL, 300.000, 'APOYO A INTERNET CORRESPONDIENTE A  EL MES DE AGOSTO', 476, NULL, NULL, NULL, NULL, NULL, 82, '2019-09-05', NULL, NULL, '2019-08-14 18:19:03', '2019-09-05 16:17:24', NULL, 'POR ENVIAR', 0, NULL, 'COOR', NULL, NULL, 51943, 7, NULL);
INSERT INTO `incidencias` VALUES (61, 2233, 208, '2019-08-14', NULL, NULL, NULL, 300.000, 'APOYO A INTERNET CORRESPONDIENTE A  EL MES DE AGOSTO', 476, NULL, NULL, NULL, NULL, NULL, 82, '2019-09-05', NULL, NULL, '2019-08-14 18:19:36', '2019-09-05 16:17:24', NULL, 'POR ENVIAR', 0, NULL, 'COOR', NULL, NULL, 51943, 7, NULL);
INSERT INTO `incidencias` VALUES (62, 2152, 513, '2019-08-19', NULL, NULL, 3, NULL, 'COBERTURA', 764, NULL, NULL, NULL, '2019-09-05', 82, NULL, NULL, NULL, NULL, '2019-08-19 14:53:32', '2019-09-05 16:17:24', NULL, 'POR ENVIAR', 0, NULL, 'COOR', 'incidencias/vobo_jefe_62/vobo_jefe_62.xlsx', NULL, 52792, 7, NULL);
INSERT INTO `incidencias` VALUES (63, 2250, 208, '2019-08-19', NULL, NULL, NULL, 1400.000, 'COMPENSACIÓN', 764, NULL, NULL, NULL, NULL, NULL, 82, '2019-09-05', NULL, NULL, '2019-08-19 16:11:38', '2019-09-05 16:17:24', NULL, 'POR ENVIAR', 0, NULL, 'COOR', NULL, NULL, 53419, 7, NULL);
INSERT INTO `incidencias` VALUES (65, 2249, 208, '2019-08-19', NULL, NULL, NULL, 1400.000, 'COMPENSACIÓN ', 764, NULL, NULL, NULL, NULL, NULL, 82, '2019-09-05', NULL, NULL, '2019-08-19 16:13:26', '2019-09-05 16:17:24', NULL, 'POR ENVIAR', 0, NULL, 'COOR', NULL, NULL, 53419, 7, NULL);
INSERT INTO `incidencias` VALUES (66, 2252, 208, '2019-08-19', NULL, NULL, NULL, 1225.000, 'COMPENSACIÓN', 764, NULL, NULL, NULL, NULL, NULL, 82, '2019-09-05', NULL, NULL, '2019-08-19 16:15:08', '2019-09-05 16:17:24', NULL, 'POR ENVIAR', 0, NULL, 'COOR', NULL, NULL, 53419, 7, NULL);
INSERT INTO `incidencias` VALUES (67, 505, 208, '2019-08-19', NULL, NULL, NULL, 1200.000, 'COMPENSACIÓN', 764, NULL, NULL, NULL, NULL, NULL, 82, '2019-09-05', NULL, NULL, '2019-08-19 16:15:59', '2019-09-05 16:17:24', NULL, 'POR ENVIAR', 0, NULL, 'COOR', NULL, NULL, 53419, 7, NULL);
INSERT INTO `incidencias` VALUES (68, 2291, 208, '2019-08-19', NULL, NULL, NULL, 1166.670, 'COMPENSACIÓN', 764, NULL, NULL, NULL, NULL, NULL, 82, '2019-09-05', NULL, NULL, '2019-08-19 16:17:12', '2019-09-05 16:17:24', NULL, 'POR ENVIAR', 0, NULL, 'COOR', NULL, NULL, 53419, 7, NULL);
INSERT INTO `incidencias` VALUES (69, 677, 208, '2019-08-27', NULL, NULL, NULL, 10000.000, 'SE LE OTORGARÁ DICHO BONO EN LA SEGUNDA QUINCENA DE CADA MES\r\n', 764, NULL, NULL, NULL, '2019-09-05', 82, NULL, NULL, NULL, NULL, '2019-08-27 12:31:13', '2019-09-05 16:17:24', NULL, 'POR ENVIAR', 0, NULL, 'COOR', 'incidencias/vobo_jefe_69/vobo_jefe_69.xlsx', NULL, 51929, 8, NULL);
INSERT INTO `incidencias` VALUES (70, 2335, 208, '2019-08-27', NULL, NULL, NULL, 83333.330, 'CORRESPONDEN DEL 11 DE JULIO AL 5 DE AGOSTO QUE ES LA FECHA DE INGRESO EN EL INCORE SE CUENTA CON LA PO QUE AMPARA ESTE COSTO\r\n', 764, NULL, NULL, NULL, NULL, NULL, 82, '2019-09-05', NULL, NULL, '2019-08-27 12:33:15', '2019-09-05 16:17:24', NULL, 'POR ENVIAR', 0, NULL, 'COOR', NULL, NULL, 53468, 8, NULL);
INSERT INTO `incidencias` VALUES (71, 576, 208, '2019-08-27', NULL, NULL, NULL, 1500.000, 'ÚLTIMO INCREMENTO DE 1,500 A SU SALARIO ACTUAL MEDIANTE BONO DURANTE 3 MESES DE PRUEBA \r\n', 764, NULL, NULL, NULL, '2019-09-05', 82, NULL, NULL, NULL, NULL, '2019-08-27 12:34:30', '2019-09-05 16:17:24', NULL, 'POR ENVIAR', 0, NULL, 'COOR', 'incidencias/vobo_jefe_71/vobo_jefe_71.xlsx', NULL, 51912, 8, NULL);
INSERT INTO `incidencias` VALUES (72, 1698, 208, '2019-08-27', NULL, NULL, NULL, 995.940, 'PAGO 2 DÍAS POR COBERTURA DE VACACIONES\r\n', 764, NULL, NULL, NULL, '2019-09-05', 82, NULL, NULL, NULL, NULL, '2019-08-27 12:36:37', '2019-09-05 16:17:24', NULL, 'POR ENVIAR', 0, NULL, 'COOR', 'incidencias/vobo_jefe_72/vobo_jefe_72.xlsx', NULL, 52203, 8, NULL);
INSERT INTO `incidencias` VALUES (73, 2041, 208, '2019-08-27', NULL, NULL, NULL, 743.800, 'PAGO 2 DIAS POR COBERTURA DE EMERGENCIA\r\n', 764, NULL, NULL, NULL, '2019-09-05', 82, NULL, NULL, NULL, NULL, '2019-08-27 12:37:57', '2019-09-05 16:17:24', NULL, 'POR ENVIAR', 0, NULL, 'COOR', 'incidencias/vobo_jefe_73/vobo_jefe_73.xlsx', NULL, 52524, 8, NULL);
INSERT INTO `incidencias` VALUES (74, 1878, 208, '2019-08-27', NULL, NULL, NULL, 371.900, 'PAGO 1 DÍA POR COBERTURA DE VACACIONES\r\n', 764, NULL, NULL, NULL, '2019-09-05', 82, NULL, NULL, NULL, NULL, '2019-08-27 12:38:58', '2019-09-05 16:17:24', NULL, 'POR ENVIAR', 0, NULL, 'COOR', 'incidencias/vobo_jefe_74/vobo_jefe_74.xlsx', NULL, 52411, 8, NULL);
INSERT INTO `incidencias` VALUES (75, 1822, 208, '2019-08-27', NULL, NULL, NULL, 497.970, 'PAGO 1 DIAS POR COBERTURA DE EMERGENCIA\r\n', 764, NULL, NULL, NULL, '2019-09-05', 82, NULL, NULL, NULL, NULL, '2019-08-27 12:40:09', '2019-09-05 16:17:24', NULL, 'POR ENVIAR', 0, NULL, 'COOR', 'incidencias/vobo_jefe_75/vobo_jefe_75.xlsx', NULL, 52348, 8, NULL);
INSERT INTO `incidencias` VALUES (76, 1959, 208, '2019-08-27', NULL, NULL, NULL, 624.040, 'PAGO 1 DIA POR COBERTURA DE VACACIONES\r\n', 764, NULL, NULL, NULL, '2019-09-05', 82, NULL, NULL, NULL, NULL, '2019-08-27 12:44:28', '2019-09-05 16:17:24', NULL, 'POR ENVIAR', 0, NULL, 'COOR', 'incidencias/vobo_jefe_76/vobo_jefe_76.xlsx', NULL, 52490, 8, NULL);
INSERT INTO `incidencias` VALUES (77, 2153, 208, '2019-08-27', NULL, NULL, NULL, 260.000, 'PAGO 1 DIA POR COBERTURA DE VACACIONES\r\n', 764, NULL, NULL, NULL, '2019-09-05', 82, NULL, NULL, NULL, NULL, '2019-08-27 12:45:34', '2019-09-05 16:17:24', NULL, 'POR ENVIAR', 0, NULL, 'COOR', 'incidencias/vobo_jefe_77/vobo_jefe_77.xlsx', NULL, 52813, 8, NULL);
INSERT INTO `incidencias` VALUES (80, 1804, 502, '2019-09-04', NULL, NULL, 2, NULL, 'DISFRUTO DE 2 DIAS DE VACACIONES 29 Y 30 DE AGOSTO 2019', 448, NULL, NULL, NULL, '2019-09-05', 82, NULL, NULL, NULL, NULL, '2019-09-04 11:50:29', '2019-09-05 16:17:24', NULL, 'POR ENVIAR', 0, NULL, 'RH', 'incidencias/vobo_jefe_80/vobo_jefe_80.JPG', NULL, 52324, 8, 'incidencias/evidencia_80/evidencia_80.JPG');
INSERT INTO `incidencias` VALUES (81, 2171, 208, '2019-09-04', NULL, NULL, NULL, 333.380, 'SE PIDE EL REEMBOLSO DE UNA FALTA QUE SE DESCONTO LA QUINCENA PASADA DEBIDO A QUE SE TOMARA COMO TIEMPO X TIEMPO DENTRO DE LA OPERACION', 448, NULL, NULL, NULL, '2019-09-05', 82, NULL, NULL, NULL, NULL, '2019-09-04 11:56:32', '2019-09-05 16:17:24', NULL, 'POR ENVIAR', 0, NULL, 'RH', 'incidencias/vobo_jefe_81/vobo_jefe_81.JPG', NULL, 52953, 8, 'incidencias/evidencia_81/evidencia_81.JPG');
INSERT INTO `incidencias` VALUES (82, 1778, 502, '2019-09-04', NULL, NULL, 1, NULL, 'DISFRUTO 1 DIA DE VACACIONES CORRESPONDIENTE AL 22 DE AGOSTO 2019', 448, NULL, NULL, NULL, '2019-09-05', 82, NULL, NULL, NULL, NULL, '2019-09-04 12:05:16', '2019-09-05 16:17:24', NULL, 'POR ENVIAR', 0, NULL, 'RH', 'incidencias/vobo_jefe_82/vobo_jefe_82.JPG', NULL, 52310, 8, 'incidencias/evidencia_82/evidencia_82.JPG');
INSERT INTO `incidencias` VALUES (83, 1913, 502, '2019-09-04', NULL, NULL, 2, NULL, 'DISFRUTO DE 2 DIAS DE VACACIONES CORRESPONDIENTES A 28 Y 31 DE AGOSTO 2019', 448, NULL, NULL, NULL, '2019-09-05', 82, NULL, NULL, NULL, NULL, '2019-09-04 12:10:16', '2019-09-05 16:17:24', NULL, 'POR ENVIAR', 0, NULL, 'RH', 'incidencias/vobo_jefe_83/vobo_jefe_83.JPG', NULL, 52469, 8, 'incidencias/evidencia_83/evidencia_83.pdf');
INSERT INTO `incidencias` VALUES (84, 1878, 502, '2019-09-04', NULL, NULL, 1, NULL, 'DISFRUTO 1 DIA DE VACACIONES CORRESPONDIENTE AL 24 DE AGOSTO 2019', 448, NULL, NULL, NULL, '2019-09-05', 82, NULL, NULL, NULL, NULL, '2019-09-04 12:13:47', '2019-09-05 16:17:24', NULL, 'POR ENVIAR', 0, NULL, 'RH', 'incidencias/vobo_jefe_84/vobo_jefe_84.JPG', NULL, 52412, 8, 'incidencias/evidencia_84/evidencia_84.JPG');
INSERT INTO `incidencias` VALUES (85, 1959, 502, '2019-09-04', NULL, NULL, 4, NULL, 'DISFRUTO DE 4 DIAS DE VACACIONES CORRESPONDIENTE AL 12,13,17,18 DE AGOSTO 2019', 448, NULL, NULL, NULL, '2019-09-05', 82, NULL, NULL, NULL, NULL, '2019-09-04 12:18:37', '2019-09-05 16:17:24', NULL, 'POR ENVIAR', 0, NULL, 'RH', 'incidencias/vobo_jefe_85/vobo_jefe_85.JPG', NULL, 52491, 8, 'incidencias/evidencia_85/evidencia_85.pdf');
INSERT INTO `incidencias` VALUES (86, 1735, 502, '2019-09-04', NULL, NULL, 1, NULL, 'DISFRUTO DE 1 DIA DE VACACIONES CORRESPONDIENTE 31 DE AGOSTO 2019', 448, NULL, NULL, NULL, '2019-09-05', 82, NULL, NULL, NULL, NULL, '2019-09-04 12:22:29', '2019-09-05 16:17:24', NULL, 'POR ENVIAR', 0, NULL, 'RH', 'incidencias/vobo_jefe_86/vobo_jefe_86.JPG', NULL, 52252, 8, 'incidencias/evidencia_86/evidencia_86.pdf');
INSERT INTO `incidencias` VALUES (87, 1732, 502, '2019-09-04', NULL, NULL, 2, NULL, 'DISFRUTO 2 DIAS DE VACACIONES CORRESPONDIENTES AL 14 Y 23 DE AGOSTO', 448, NULL, NULL, NULL, '2019-09-05', 82, NULL, NULL, NULL, NULL, '2019-09-04 12:30:32', '2019-09-05 16:17:24', NULL, 'POR ENVIAR', 0, NULL, 'RH', 'incidencias/vobo_jefe_87/vobo_jefe_87.JPG', NULL, 52246, 8, 'incidencias/evidencia_87/evidencia_87.JPG');
INSERT INTO `incidencias` VALUES (88, 1811, 208, '2019-09-04', NULL, NULL, NULL, 371.900, 'PAGO 1 DIA POR COBERTURA DE VACACIONES', 448, NULL, NULL, NULL, '2019-09-05', 82, NULL, NULL, NULL, NULL, '2019-09-04 13:00:51', '2019-09-05 16:17:24', NULL, 'POR ENVIAR', 0, NULL, 'RH', 'incidencias/vobo_jefe_88/vobo_jefe_88.JPG', NULL, 52340, 8, 'incidencias/evidencia_88/evidencia_88.JPG');
INSERT INTO `incidencias` VALUES (89, 2032, 208, '2019-09-04', NULL, NULL, NULL, 666.660, 'PAGO DE 1 DIA POR COBERTURA DE EMERGENCIA (3 AGOSTO 2019)', 448, NULL, NULL, NULL, '2019-09-05', 82, NULL, NULL, NULL, NULL, '2019-09-04 13:15:49', '2019-09-05 16:17:24', NULL, 'POR ENVIAR', 0, NULL, 'RH', 'incidencias/vobo_jefe_89/vobo_jefe_89.JPG', NULL, 52520, 8, 'incidencias/evidencia_89/evidencia_89.JPG');
INSERT INTO `incidencias` VALUES (90, 1878, 208, '2019-09-04', NULL, NULL, NULL, 1487.600, 'PAGO 4 DIAS POR COBERTURA DE VACACIONES', 448, NULL, NULL, NULL, '2019-09-05', 82, NULL, NULL, NULL, NULL, '2019-09-04 13:23:51', '2019-09-05 16:17:24', NULL, 'POR ENVIAR', 0, NULL, 'RH', 'incidencias/vobo_jefe_90/vobo_jefe_90.JPG', NULL, 52413, 8, 'incidencias/evidencia_90/evidencia_90.pdf');
INSERT INTO `incidencias` VALUES (91, 1842, 208, '2019-09-04', NULL, NULL, NULL, 371.900, 'PAGO POR 1 DIA POR COBERTURA DE VACACIONES', 448, NULL, NULL, NULL, '2019-09-05', 82, NULL, NULL, NULL, NULL, '2019-09-04 13:26:16', '2019-09-05 16:17:24', NULL, 'POR ENVIAR', 0, NULL, 'RH', 'incidencias/vobo_jefe_91/vobo_jefe_91.JPG', NULL, 52380, 8, 'incidencias/evidencia_91/evidencia_91.pdf');
INSERT INTO `incidencias` VALUES (92, 1837, 208, '2019-09-04', NULL, NULL, NULL, 422.320, 'PAGO 1 DIA POR COBERTURA DE VACACIONES', 448, NULL, NULL, NULL, '2019-09-05', 82, NULL, NULL, NULL, NULL, '2019-09-04 13:30:57', '2019-09-05 16:17:24', NULL, 'POR ENVIAR', 0, NULL, 'RH', 'incidencias/vobo_jefe_92/vobo_jefe_92.JPG', NULL, 52371, 8, 'incidencias/evidencia_92/evidencia_92.pdf');
INSERT INTO `incidencias` VALUES (93, 1945, 208, '2019-09-04', NULL, NULL, NULL, 371.900, 'PAGO 1 DIA POR COBERTURA DE VACACIONES', 448, NULL, NULL, NULL, '2019-09-05', 82, NULL, NULL, NULL, NULL, '2019-09-04 13:32:38', '2019-09-05 16:17:24', NULL, 'POR ENVIAR', 0, NULL, 'RH', 'incidencias/vobo_jefe_93/vobo_jefe_93.JPG', NULL, 52482, 8, 'incidencias/evidencia_93/evidencia_93.pdf');
INSERT INTO `incidencias` VALUES (94, 1843, 208, '2019-09-04', NULL, NULL, NULL, 422.320, 'PAGO 1 DIA POR COBERTURA DE VACACIONES', 448, NULL, NULL, NULL, '2019-09-05', 82, NULL, NULL, NULL, NULL, '2019-09-04 13:37:06', '2019-09-05 16:17:24', NULL, 'POR ENVIAR', 0, NULL, 'RH', 'incidencias/vobo_jefe_94/vobo_jefe_94.JPG', NULL, 52383, 8, 'incidencias/evidencia_94/evidencia_94.pdf');
INSERT INTO `incidencias` VALUES (95, 1833, 208, '2019-09-04', NULL, NULL, NULL, 2021.750, 'PAGO POR 3 DIAS POR COBERTURA DE VACACIONES', 448, NULL, NULL, NULL, '2019-09-05', 82, NULL, NULL, NULL, NULL, '2019-09-04 13:40:12', '2019-09-05 16:17:24', NULL, 'POR ENVIAR', 0, NULL, 'RH', 'incidencias/vobo_jefe_95/vobo_jefe_95.JPG', NULL, 52361, 8, 'incidencias/evidencia_95/evidencia_95.pdf');
INSERT INTO `incidencias` VALUES (96, 1703, 710, '2019-09-04', '2019-08-22', NULL, 1, NULL, 'FALTA INJUSTIFICADA', 448, NULL, '2019-09-05', 82, NULL, NULL, NULL, NULL, NULL, NULL, '2019-09-04 13:49:22', '2019-09-05 16:17:24', NULL, 'POR ENVIAR', 0, NULL, 'RH', NULL, NULL, NULL, 8, 'incidencias/evidencia_96/evidencia_96.JPG');
INSERT INTO `incidencias` VALUES (97, 2197, 710, '2019-09-04', '2019-08-23', NULL, 1, NULL, 'FALTA INJUSTIFICADA', 448, NULL, '2019-09-05', 82, NULL, NULL, NULL, NULL, NULL, NULL, '2019-09-04 13:51:03', '2019-09-05 16:17:24', NULL, 'POR ENVIAR', 0, NULL, 'RH', NULL, NULL, NULL, 8, 'incidencias/evidencia_97/evidencia_97.JPG');
INSERT INTO `incidencias` VALUES (98, 1778, 710, '2019-09-04', '2019-08-29', NULL, 1, NULL, 'FALTA INJUSTIFICADA', 448, NULL, '2019-09-05', 82, NULL, NULL, NULL, NULL, NULL, NULL, '2019-09-04 13:54:30', '2019-09-05 16:17:24', NULL, 'POR ENVIAR', 0, NULL, 'RH', NULL, NULL, NULL, 8, 'incidencias/evidencia_98/evidencia_98.JPG');
INSERT INTO `incidencias` VALUES (99, 1878, 710, '2019-09-04', '2019-08-30', NULL, 1, NULL, 'FALTA INJUSTIFICADA', 448, NULL, '2019-09-05', 82, NULL, NULL, NULL, NULL, NULL, NULL, '2019-09-04 13:56:40', '2019-09-05 16:17:24', NULL, 'POR ENVIAR', 0, NULL, 'RH', NULL, NULL, NULL, 8, 'incidencias/evidencia_99/evidencia_99.JPG');
INSERT INTO `incidencias` VALUES (100, 2060, 208, '2019-09-04', NULL, NULL, NULL, 666.660, 'COBERTURA POR EMERGENCIA PARA CAPACITACION', 448, NULL, NULL, NULL, '2019-09-05', 82, NULL, NULL, NULL, NULL, '2019-09-04 14:00:39', '2019-09-05 16:17:24', NULL, 'POR ENVIAR', 0, NULL, 'RH', 'incidencias/vobo_jefe_100/vobo_jefe_100.JPG', NULL, 52535, 8, 'incidencias/evidencia_100/evidencia_100.JPG');
INSERT INTO `incidencias` VALUES (101, 2309, 208, '2019-09-04', NULL, NULL, NULL, 520.000, 'PAGO DE 1 DIA POR COBERTURA DE EMERGENCIA', 448, NULL, NULL, NULL, NULL, NULL, 82, '2019-09-05', NULL, NULL, '2019-09-04 14:04:25', '2019-09-05 16:17:24', NULL, 'POR ENVIAR', 0, NULL, 'RH', NULL, NULL, 53267, 8, 'incidencias/evidencia_101/evidencia_101.JPG');
INSERT INTO `incidencias` VALUES (102, 2181, 520, '2019-09-04', NULL, NULL, 1, NULL, 'CORRESPONDIENTET AL 28 DE JULIO 2019', 448, NULL, NULL, NULL, '2019-09-05', 82, NULL, NULL, NULL, NULL, '2019-09-04 14:06:07', '2019-09-05 16:17:24', NULL, 'POR ENVIAR', 0, NULL, 'RH', 'incidencias/vobo_jefe_102/vobo_jefe_102.JPG', NULL, 53030, 8, 'incidencias/evidencia_102/evidencia_102.JPG');
INSERT INTO `incidencias` VALUES (103, 2260, 208, '2019-09-04', NULL, NULL, NULL, 520.000, 'PAGO 2 DIAS POR COBERTURA DE VACACIONES', 448, NULL, NULL, NULL, '2019-09-05', 82, NULL, NULL, NULL, NULL, '2019-09-04 14:09:25', '2019-09-05 16:17:24', NULL, 'POR ENVIAR', 0, NULL, 'RH', 'incidencias/vobo_jefe_103/vobo_jefe_103.JPG', NULL, 51992, 8, 'incidencias/evidencia_103/evidencia_103.JPG');
INSERT INTO `incidencias` VALUES (104, 1570, 208, '2019-09-04', NULL, NULL, NULL, 9000.000, 'GUARDIA VIÁTICOS DEL MES DE AGOSTO\r\n', 764, NULL, NULL, NULL, '2019-09-05', 82, NULL, NULL, NULL, NULL, '2019-09-04 14:24:00', '2019-09-05 16:17:23', NULL, 'POR ENVIAR', 0, NULL, 'COOR', 'incidencias/vobo_jefe_104/vobo_jefe_104.xlsx', NULL, 54202, 8, 'incidencias/evidencia_104/evidencia_104.xlsx');
INSERT INTO `incidencias` VALUES (105, 2144, 208, '2019-09-04', NULL, NULL, NULL, 2800.000, 'GUARDIA GESTIÓN DE ACTIVOS DEL MES AGOSTO\r\n', 764, NULL, NULL, NULL, '2019-09-05', 82, NULL, NULL, NULL, NULL, '2019-09-04 14:25:30', '2019-09-05 16:17:23', NULL, 'POR ENVIAR', 0, NULL, 'COOR', 'incidencias/vobo_jefe_105/vobo_jefe_105.xlsx', NULL, 54202, 8, 'incidencias/evidencia_105/evidencia_105.xlsx');
INSERT INTO `incidencias` VALUES (106, 1524, 208, '2019-09-04', NULL, NULL, NULL, 1750.000, 'GUARDIA GESTIÓN DE ACTIVOS DEL MES AGOSTO\r\n', 764, NULL, NULL, NULL, '2019-09-05', 82, NULL, NULL, NULL, NULL, '2019-09-04 14:27:08', '2019-09-05 16:17:23', NULL, 'POR ENVIAR', 0, NULL, 'COOR', 'incidencias/vobo_jefe_106/vobo_jefe_106.xlsx', NULL, 54202, 8, 'incidencias/evidencia_106/evidencia_106.xlsx');
INSERT INTO `incidencias` VALUES (107, 2117, 208, '2019-09-04', NULL, NULL, NULL, 2050.000, 'GUARDIA GESTIÓN DE ACTIVOS DEL MES AGOSTO\r\n', 764, NULL, NULL, NULL, '2019-09-05', 82, NULL, NULL, NULL, NULL, '2019-09-04 14:28:07', '2019-09-05 16:17:23', NULL, 'POR ENVIAR', 0, NULL, 'COOR', 'incidencias/vobo_jefe_107/vobo_jefe_107.xlsx', NULL, 54202, 8, 'incidencias/evidencia_107/evidencia_107.xlsx');
INSERT INTO `incidencias` VALUES (108, 1241, 208, '2019-09-04', NULL, NULL, NULL, 1150.000, 'GUARDIA GESTIÓN DE ACTIVOS DEL MES AGOSTO\r\n', 764, NULL, NULL, NULL, '2019-09-05', 82, NULL, NULL, NULL, NULL, '2019-09-04 14:29:54', '2019-09-05 16:17:23', NULL, 'POR ENVIAR', 0, NULL, 'COOR', 'incidencias/vobo_jefe_108/vobo_jefe_108.xlsx', NULL, 54202, 8, 'incidencias/evidencia_108/evidencia_108.xlsx');
INSERT INTO `incidencias` VALUES (109, 1588, 502, '2019-09-04', NULL, NULL, 2, NULL, 'DISFRUTO 2 DIAS DE VACACIONES CORRESPONDIENTES A 28 Y 29 DE AGOSTO', 448, NULL, NULL, NULL, '2019-09-05', 82, NULL, NULL, NULL, NULL, '2019-09-04 14:42:29', '2019-09-05 16:17:23', NULL, 'POR ENVIAR', 0, NULL, 'RH', 'incidencias/vobo_jefe_109/vobo_jefe_109.JPG', NULL, 52134, 8, 'incidencias/evidencia_109/evidencia_109.JPG');
INSERT INTO `incidencias` VALUES (110, 2152, 710, '2019-09-04', '2019-08-29', NULL, 1, NULL, 'FALTA INJUSTIFICADA', 448, NULL, '2019-09-05', 82, NULL, NULL, NULL, NULL, NULL, NULL, '2019-09-04 14:45:01', '2019-09-05 16:17:23', NULL, 'POR ENVIAR', 0, NULL, 'RH', NULL, NULL, NULL, 8, 'incidencias/evidencia_110/evidencia_110.JPG');
INSERT INTO `incidencias` VALUES (111, 2328, 208, '2019-09-04', NULL, NULL, NULL, 520.000, 'PAGO DE 1 DIA POR COBERTURA DE EMERGENCIA', 448, NULL, NULL, NULL, NULL, NULL, 82, '2019-09-05', NULL, NULL, '2019-09-04 14:48:45', '2019-09-05 16:17:23', NULL, 'POR ENVIAR', 0, NULL, 'RH', NULL, NULL, 55998, 8, 'incidencias/evidencia_111/evidencia_111.JPG');
INSERT INTO `incidencias` VALUES (112, 1822, 208, '2019-09-04', NULL, NULL, NULL, 497.970, 'PAGO DE 1 DIA PENDIENTE POR COBERTURA', 448, NULL, NULL, NULL, '2019-09-05', 82, NULL, NULL, NULL, NULL, '2019-09-04 14:51:26', '2019-09-05 16:17:23', NULL, 'POR ENVIAR', 0, NULL, 'RH', 'incidencias/vobo_jefe_112/vobo_jefe_112.JPG', NULL, 52350, 8, 'incidencias/evidencia_112/evidencia_112.JPG');
INSERT INTO `incidencias` VALUES (113, 1747, 208, '2019-09-04', NULL, NULL, NULL, 995.940, 'PAGO DE 1 POR COBERTURA DE EMERGENCIA ', 448, NULL, NULL, NULL, '2019-09-05', 82, NULL, NULL, NULL, NULL, '2019-09-04 14:54:05', '2019-09-05 16:17:23', NULL, 'POR ENVIAR', 0, NULL, 'RH', 'incidencias/vobo_jefe_113/vobo_jefe_113.JPG', NULL, 52262, 8, 'incidencias/evidencia_113/evidencia_113.JPG');
INSERT INTO `incidencias` VALUES (114, 1997, 208, '2019-09-04', NULL, NULL, NULL, 2208.780, 'PAGO DE 1 DIA POR COBERTURA DE EMERGENCIA', 448, NULL, NULL, NULL, '2019-09-05', 82, NULL, NULL, NULL, NULL, '2019-09-04 14:57:57', '2019-09-05 16:17:23', NULL, 'POR ENVIAR', 0, NULL, 'RH', 'incidencias/vobo_jefe_114/vobo_jefe_114.JPG', NULL, 52510, 8, 'incidencias/evidencia_114/evidencia_114.JPG');
INSERT INTO `incidencias` VALUES (115, 2041, 208, '2019-09-04', NULL, NULL, NULL, 371.900, 'PAGO DE 1 DIA PENDIENTE POR COBERTURA', 448, NULL, NULL, NULL, '2019-09-05', 82, NULL, NULL, NULL, NULL, '2019-09-04 15:00:16', '2019-09-05 16:17:23', NULL, 'POR ENVIAR', 0, NULL, 'RH', 'incidencias/vobo_jefe_115/vobo_jefe_115.JPG', NULL, 52525, 8, 'incidencias/evidencia_115/evidencia_115.JPG');
INSERT INTO `incidencias` VALUES (116, 1883, 208, '2019-09-04', NULL, NULL, NULL, 2987.830, 'PAGO DE 3 DIAS POR COBERTURA DE EMERGENCIA', 448, NULL, NULL, NULL, '2019-09-05', 82, NULL, NULL, NULL, NULL, '2019-09-04 15:02:40', '2019-09-05 16:17:23', NULL, 'POR ENVIAR', 0, NULL, 'RH', 'incidencias/vobo_jefe_116/vobo_jefe_116.JPG', NULL, 52419, 8, 'incidencias/evidencia_116/evidencia_116.JPG');
INSERT INTO `incidencias` VALUES (117, 1671, 208, '2019-09-04', NULL, NULL, NULL, 844.650, 'PAGO DE 1 DIA POR COBERTURA DE EMERGENCIA', 448, NULL, NULL, NULL, '2019-09-05', 82, NULL, NULL, NULL, NULL, '2019-09-04 15:05:46', '2019-09-05 16:17:23', NULL, 'POR ENVIAR', 0, NULL, 'RH', 'incidencias/vobo_jefe_117/vobo_jefe_117.JPG', NULL, 52186, 8, 'incidencias/evidencia_117/evidencia_117.JPG');
INSERT INTO `incidencias` VALUES (118, 776, 513, '2019-09-04', NULL, NULL, 3, NULL, 'ATENCIóN VENTANA DE MANTENIMIENTO DEL 29 AL 31 DE AGOSTO, MIGRACIONES ONTS EN LEóN GUANAJUATO.', 244, NULL, NULL, NULL, NULL, NULL, 82, '2019-09-05', NULL, NULL, '2019-09-04 18:54:51', '2019-09-05 16:17:23', NULL, NULL, 0, NULL, 'COOR', NULL, NULL, 54111, 8, 'incidencias/evidencia_118/evidencia_118.msg');
INSERT INTO `incidencias` VALUES (119, 2350, 208, '2019-09-06', NULL, NULL, NULL, 20000.000, 'OK', 750, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-09-06 09:01:54', '2019-09-06 09:01:54', NULL, NULL, 0, NULL, 'ADMIN', NULL, NULL, 54205, 9, 'incidencias/evidencia_119/evidencia_119.xlsx');
INSERT INTO `incidencias` VALUES (120, 2150, 710, '2019-09-06', '2019-09-06', NULL, 2, NULL, 'CUALQUIERA', 750, NULL, '2019-09-07', 45, NULL, NULL, NULL, NULL, '2019-09-07', 750, '2019-09-06 09:05:44', '2019-09-07 11:42:39', NULL, 'CANCELAR', 0, 'RH', 'ADMIN', NULL, NULL, NULL, 9, 'incidencias/evidencia_120/evidencia_120.xlsx');
INSERT INTO `incidencias` VALUES (121, 2150, 208, '2019-09-07', NULL, NULL, NULL, 20000.000, 'ASDSD', 750, NULL, NULL, NULL, '2019-09-07', 117, NULL, NULL, '2019-09-07', 638, '2019-09-07 08:32:13', '2019-09-07 11:41:53', NULL, 'POR ENVIAR', 0, NULL, 'ADMIN', NULL, NULL, 54205, 9, 'incidencias/evidencia_121/evidencia_121.xlsx');
INSERT INTO `incidencias` VALUES (122, 2350, 208, '2019-09-07', NULL, NULL, NULL, 20000.000, 'ASDSAD', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-09-07 08:50:14', '2019-09-07 08:50:14', NULL, 'SOLICITADO', 0, NULL, 'DIR', NULL, NULL, 54205, 9, 'incidencias/evidencia_122/evidencia_122.xlsx');
INSERT INTO `incidencias` VALUES (123, 2311, 512, '2019-09-07', NULL, NULL, 1, NULL, 'ASD', 2, NULL, NULL, NULL, '2019-09-07', 117, NULL, NULL, '2019-09-07', 638, '2019-09-07 08:57:13', '2019-09-07 11:41:53', NULL, 'POR ENVIAR', 0, NULL, 'ADMIN', NULL, NULL, 54205, 9, 'incidencias/evidencia_123/evidencia_123.xlsx');
INSERT INTO `incidencias` VALUES (124, 2350, 208, '2019-09-07', NULL, NULL, NULL, 20000.000, 'ASD', 2, NULL, '2019-09-07', NULL, NULL, NULL, NULL, NULL, NULL, 638, '2019-09-07 08:59:47', '2019-09-07 09:13:02', NULL, 'CANCELAR', 0, 'DIR', 'ADMIN', NULL, NULL, 54205, 9, 'incidencias/evidencia_124/evidencia_124.xlsx');
INSERT INTO `incidencias` VALUES (125, 2350, 208, '2019-09-07', NULL, NULL, NULL, 20000.000, 'ASD', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-09-07', 750, '2019-09-07 09:01:06', '2019-09-07 12:14:14', NULL, 'POR VALIDAR DIRECCION', 0, NULL, 'ADMIN', NULL, NULL, 54205, 9, 'incidencias/evidencia_125/evidencia_125.xlsx');
INSERT INTO `incidencias` VALUES (126, 2080, 208, '2019-09-07', NULL, NULL, NULL, 20000.000, 'ASD', 2, NULL, NULL, NULL, '2019-09-07', 117, NULL, NULL, '2019-09-07', 638, '2019-09-07 09:02:12', '2019-09-07 11:41:53', NULL, 'POR ENVIAR', 0, NULL, 'ADMIN', NULL, NULL, 54205, 9, 'incidencias/evidencia_126/evidencia_126.xlsx');
INSERT INTO `incidencias` VALUES (127, 1336, 710, '2019-09-07', '2019-09-07', NULL, 1, NULL, 'ASDASD', 750, NULL, '2019-09-07', 45, NULL, NULL, NULL, NULL, '2019-09-07', 707, '2019-09-07 09:20:07', '2019-09-07 11:42:39', NULL, 'POR ENVIAR', 0, NULL, 'ADMIN', NULL, NULL, NULL, 9, 'incidencias/evidencia_127/evidencia_127.xlsx');
INSERT INTO `incidencias` VALUES (128, 2243, 208, '2019-09-07', NULL, NULL, NULL, 20000.000, 'ASDASD', 750, NULL, NULL, NULL, '2019-09-07', 117, NULL, NULL, '2019-09-07', 777, '2019-09-07 09:33:46', '2019-09-07 11:41:53', NULL, 'POR ENVIAR', 0, NULL, 'ADMIN', NULL, NULL, 54194, 9, 'incidencias/evidencia_128/evidencia_128.xlsx');
INSERT INTO `incidencias` VALUES (129, 776, 208, '2019-09-07', NULL, NULL, NULL, 20000.000, 'SDA', 750, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-09-07', 750, '2019-09-07 09:47:32', '2019-09-07 12:14:11', NULL, 'POR VALIDAR DIRECCION', 0, NULL, 'ADMIN', NULL, NULL, 54111, 9, 'incidencias/evidencia_129/evidencia_129.xlsx');
INSERT INTO `incidencias` VALUES (130, 776, 208, '2019-09-07', NULL, NULL, NULL, 20000.000, 'ASDASD', 750, NULL, NULL, NULL, NULL, NULL, 82, '2019-09-07', '2019-09-07', 232, '2019-09-07 09:51:12', '2019-09-07 11:43:09', NULL, 'POR ENVIAR', 0, NULL, 'ADMIN', NULL, NULL, 54111, 9, 'incidencias/evidencia_130/evidencia_130.xlsx');
INSERT INTO `incidencias` VALUES (131, 2150, 710, '2019-09-07', '2019-09-07', NULL, 1, NULL, 'ASDSAD', 750, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-09-07', 750, '2019-09-07 12:34:17', '2019-09-07 12:34:32', NULL, 'POR VALIDAR DIRECCION', 0, NULL, 'ADMIN', NULL, NULL, NULL, 9, 'incidencias/evidencia_131/evidencia_131.xlsx');

-- ----------------------------
-- Table structure for incidencias_catalogo
-- ----------------------------
DROP TABLE IF EXISTS `incidencias_catalogo`;
CREATE TABLE `incidencias_catalogo`  (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `tipo` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `tratamiento` enum('MONTO','DIAS','LAPSO','OTRO') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'MONTO',
  `estatus` enum('ACTIVO','INACTIVO') CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT 'ACTIVO',
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of incidencias_catalogo
-- ----------------------------
INSERT INTO `incidencias_catalogo` VALUES (206, 'Bono Fijo Div', 'BONO FIJO', 'PERCEPCION', 'ASIMILADOS', 'MONTO', 'INACTIVO', NULL, NULL);
INSERT INTO `incidencias_catalogo` VALUES (207, 'Compensación Esp Div', 'COMPENSACIÓN ESP', 'PERCEPCION', 'ASIMILADOS', 'MONTO', 'INACTIVO', NULL, NULL);
INSERT INTO `incidencias_catalogo` VALUES (208, 'Compensación Div', 'BONO', 'PERCEPCION', 'ASIMILADOS', 'MONTO', 'ACTIVO', NULL, NULL);
INSERT INTO `incidencias_catalogo` VALUES (252, 'Falta Div', 'FALTA', 'DEDUCCION', 'ASIMILADOS', 'LAPSO', 'INACTIVO', NULL, NULL);
INSERT INTO `incidencias_catalogo` VALUES (266, 'Desc por Convenio Div', 'DESCUENTO POR CONVENIO O ADEUDO', 'DEDUCCION', 'ASIMILADOS', 'MONTO', 'ACTIVO', NULL, NULL);
INSERT INTO `incidencias_catalogo` VALUES (502, 'Vacaciones Disf', 'VACACIONES DISF', 'PERCEPCION', 'TRADICIONAL', 'DIAS', 'ACTIVO', NULL, NULL);
INSERT INTO `incidencias_catalogo` VALUES (503, 'Bono', 'BONO TRADICIONAL', 'PERCEPCION', 'TRADICIONAL', 'MONTO', 'INACTIVO', NULL, NULL);
INSERT INTO `incidencias_catalogo` VALUES (506, 'Compensación', 'BONO TRADICIONAL', 'PERCEPCION', 'TRADICIONAL', 'MONTO', 'INACTIVO', NULL, NULL);
INSERT INTO `incidencias_catalogo` VALUES (512, 'Festivo Trabajado', 'FESTIVO TRABAJADO', 'PERCEPCION', 'TRADICIONAL', 'DIAS', 'ACTIVO', NULL, NULL);
INSERT INTO `incidencias_catalogo` VALUES (513, 'Descanso Trabajado', 'DESCANSO TRABAJADO', 'PERCEPCION', 'TRADICIONAL', 'DIAS', 'ACTIVO', '2019-04-04 14:28:41', '2019-04-04 14:28:41');
INSERT INTO `incidencias_catalogo` VALUES (520, 'Prima Dominical', 'PRIMA DOMINICAL', 'PERCEPCION', 'TRADICIONAL', 'DIAS', 'ACTIVO', '2019-04-04 14:28:41', '2019-04-04 14:28:41');
INSERT INTO `incidencias_catalogo` VALUES (521, 'Prima Vacacional', 'PRIMA VACACIONAL', 'PERCEPCION', 'TRADICIONAL', 'DIAS', 'INACTIVO', '2019-04-04 14:28:41', '2019-04-04 14:28:41');
INSERT INTO `incidencias_catalogo` VALUES (700, 'Inc. Enfermedad General', 'INC. ENFERMEDAD GENERAL', 'DEDUCCION', 'TRADICIONAL', 'OTRO', 'INACTIVO', '2019-04-04 14:28:41', '2019-04-04 14:28:41');
INSERT INTO `incidencias_catalogo` VALUES (701, 'Inc. Maternidad', 'INC. MATERNIDAD', 'DEDUCCION', 'TRADICIONAL', 'OTRO', 'INACTIVO', '2019-04-04 14:28:41', '2019-04-04 14:28:41');
INSERT INTO `incidencias_catalogo` VALUES (702, 'Inc. por Accidente', 'INC. POR ACCIDENTE', 'DEDUCCION', 'TRADICIONAL', 'OTRO', 'INACTIVO', '2019-04-04 14:28:41', '2019-04-04 14:28:41');
INSERT INTO `incidencias_catalogo` VALUES (703, 'Inc. por Enlace', 'INC. POR ENLACE', 'DEDUCCION', 'TRADICIONAL', 'OTRO', 'INACTIVO', '2019-04-04 14:28:41', '2019-04-04 14:28:41');
INSERT INTO `incidencias_catalogo` VALUES (705, 'Permiso s/g Sueldo', 'PERMISO S/G SUELDO', 'DEDUCCION', 'TRADICIONAL', 'LAPSO', 'INACTIVO', '2019-04-04 14:28:41', '2019-04-04 14:28:41');
INSERT INTO `incidencias_catalogo` VALUES (708, 'Anticipo Nómina', 'ANTICIPO NÓMINA', 'DEDUCCION', 'TRADICIONAL', 'MONTO', 'INACTIVO', '2019-04-04 14:28:41', '2019-04-04 14:28:41');
INSERT INTO `incidencias_catalogo` VALUES (710, 'Faltas', 'FALTAS', 'DEDUCCION', 'TRADICIONAL', 'LAPSO', 'ACTIVO', '2019-04-04 14:28:41', '2019-04-04 14:28:41');
INSERT INTO `incidencias_catalogo` VALUES (801, 'Desc por Convenio', 'DESCUENTO POR CONVENIO', 'DEDUCCION', 'TRADICIONAL', 'MONTO', 'INACTIVO', '2019-04-04 14:28:41', '2019-04-04 14:28:41');
INSERT INTO `incidencias_catalogo` VALUES (802, 'Desc Adeudo Compañía', 'DESC ADEUDO COMPAÑIA', 'DEDUCCION', 'TRADICIONAL', 'MONTO', 'INACTIVO', '2019-04-04 14:28:41', '2019-04-04 14:28:41');

-- ----------------------------
-- Table structure for incidencias_lote
-- ----------------------------
DROP TABLE IF EXISTS `incidencias_lote`;
CREATE TABLE `incidencias_lote`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre_lote` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `id_lote` int(11) NULL DEFAULT 0,
  `proceso` int(11) NULL DEFAULT NULL,
  `fecha_envio` datetime(0) NULL DEFAULT NULL,
  `fecha_respuesta` datetime(0) NULL DEFAULT NULL,
  `estatus` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for incidencias_periodos
-- ----------------------------
DROP TABLE IF EXISTS `incidencias_periodos`;
CREATE TABLE `incidencias_periodos`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `periodo_nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `fecha_inicio` datetime(0) NOT NULL,
  `fecha_fin` datetime(0) NOT NULL,
  `fecha_envio` datetime(0) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of incidencias_periodos
-- ----------------------------
INSERT INTO `incidencias_periodos` VALUES (1, '2a Quincena mayo', '2019-05-16 00:00:00', '2019-05-29 23:59:00', '2019-05-30 23:59:00', NULL, NULL);
INSERT INTO `incidencias_periodos` VALUES (2, '1a Quincena mayo', '2019-05-21 14:26:16', '2019-06-07 23:59:00', '2019-06-07 23:59:00', NULL, NULL);
INSERT INTO `incidencias_periodos` VALUES (3, '1a Quincena Junio', '2019-06-08 00:00:00', '2019-06-21 23:59:00', '2019-06-30 23:59:00', NULL, NULL);
INSERT INTO `incidencias_periodos` VALUES (4, '2a Quincena de Junio', '2019-06-22 00:00:00', '2019-07-01 23:59:00', '2019-07-05 23:59:00', NULL, NULL);
INSERT INTO `incidencias_periodos` VALUES (5, '1a Quincena de Julio', '2019-06-06 00:00:00', '2019-07-17 23:59:00', '2019-07-23 23:59:00', NULL, NULL);
INSERT INTO `incidencias_periodos` VALUES (6, '2a Quincena de Julio', '2019-07-24 00:00:00', '2019-08-04 23:59:00', '2019-08-07 23:59:00', NULL, NULL);
INSERT INTO `incidencias_periodos` VALUES (7, '1a Quincena de Agosto', '2019-08-08 00:00:00', '2019-08-23 23:59:00', '2019-08-23 23:59:00', NULL, NULL);
INSERT INTO `incidencias_periodos` VALUES (8, '2a Quincena de Agosto', '2019-08-24 00:00:00', '2019-09-04 23:59:00', '2019-09-05 23:59:00', NULL, NULL);
INSERT INTO `incidencias_periodos` VALUES (9, '1a Quincena de Septiembre', '2019-09-06 00:00:00', '2019-09-19 23:59:00', '2019-09-23 23:59:00', NULL, NULL);
INSERT INTO `incidencias_periodos` VALUES (10, '2a Quincena de Septiembre', '2019-09-25 00:00:00', '2019-10-04 23:59:00', '2019-10-08 23:59:00', NULL, NULL);
INSERT INTO `incidencias_periodos` VALUES (11, '1a Quincena de Octubre', '2019-10-10 00:00:00', '2019-10-22 23:59:00', '2019-10-24 23:59:00', NULL, NULL);
INSERT INTO `incidencias_periodos` VALUES (12, '2a Quincena de Octubre', '2019-10-26 00:00:00', '2019-11-06 23:59:00', '2019-11-08 23:59:00', NULL, NULL);
INSERT INTO `incidencias_periodos` VALUES (13, '1a Quincena de Noviembre', '2019-11-09 00:00:00', '2019-11-20 23:59:00', '2019-11-22 23:59:00', NULL, NULL);
INSERT INTO `incidencias_periodos` VALUES (14, '2a Quincena de Noviembre', '2019-11-23 00:00:00', '2019-12-04 23:59:00', '2019-12-06 23:59:00', NULL, NULL);
INSERT INTO `incidencias_periodos` VALUES (15, '1a Quincena de Diciembre', '2019-12-07 00:00:00', '2019-12-19 23:59:00', '2019-12-23 23:59:00', NULL, NULL);

-- ----------------------------
-- Table structure for jobs
-- ----------------------------
DROP TABLE IF EXISTS `jobs`;
CREATE TABLE `jobs`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED NULL DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `jobs_queue_index`(`queue`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 511 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (3, '2018_05_15_161727_proyectosClientes', 1);
INSERT INTO `migrations` VALUES (4, '2018_05_15_163218_SolfDeletesUsuarios', 1);
INSERT INTO `migrations` VALUES (5, '2018_05_15_163431_ProyectosServicios', 1);
INSERT INTO `migrations` VALUES (6, '2018_05_15_180618_ProyectosRegiones', 1);
INSERT INTO `migrations` VALUES (7, '2018_05_15_180850_ProyectosTecnologias', 1);
INSERT INTO `migrations` VALUES (8, '2018_05_15_181303_ProyectosGrupos', 1);
INSERT INTO `migrations` VALUES (9, '2018_05_15_184135_CatalogoWBS', 1);
INSERT INTO `migrations` VALUES (10, '2018_05_16_232308_Incidencias', 1);
INSERT INTO `migrations` VALUES (11, '2018_05_18_162514_catalogoCodigos', 1);
INSERT INTO `migrations` VALUES (12, '2018_05_18_173014_softDeletesIncidencias', 1);
INSERT INTO `migrations` VALUES (13, '2018_05_18_182116_PlanesLineas', 1);
INSERT INTO `migrations` VALUES (14, '2018_05_18_194054_incidenciasAgregarMotivo', 1);
INSERT INTO `migrations` VALUES (15, '2018_05_22_164624_CatalogoCoordinadores', 1);
INSERT INTO `migrations` VALUES (16, '2018_05_22_172525_EntidadesMexico', 1);
INSERT INTO `migrations` VALUES (17, '2018_05_29_150235_vista_incidencias_principal', 2);
INSERT INTO `migrations` VALUES (19, '2018_06_13_233349_tabla_solicitudes', 3);
INSERT INTO `migrations` VALUES (20, '2019_05_16_095653_create_jobs_table', 4);
INSERT INTO `migrations` VALUES (21, '2019_05_27_122651_periodos_incidencias', 5);
INSERT INTO `migrations` VALUES (23, '2019_06_06_095159_directores_areas', 6);
INSERT INTO `migrations` VALUES (33, '2019_06_20_103228_ajustes_sueldos', 7);
INSERT INTO `migrations` VALUES (34, '2019_08_09_085517_solicitudes_bitacoras_bajas', 8);

-- ----------------------------
-- Table structure for notificaciones
-- ----------------------------
DROP TABLE IF EXISTS `notificaciones`;
CREATE TABLE `notificaciones`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `codigo` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nombre` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `descripcion` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tipo` enum('correo','push') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT 'correo',
  `estatus` enum('ACTIVO','INACTIVO') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT 'ACTIVO',
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of notificaciones
-- ----------------------------
INSERT INTO `notificaciones` VALUES (1, 'cont_admi', 'Contratacion Administracion', 'Notificacion de las contrataciones para el area de administracion', 'correo', 'ACTIVO', '2019-05-22 11:04:34', '2019-05-22 11:04:34');
INSERT INTO `notificaciones` VALUES (2, 'cont_cali', 'Contratacion Calidad', 'Notificacion de las contrataciones para el area de calidad', 'correo', 'ACTIVO', '2019-05-22 11:04:34', '2019-05-22 11:04:34');
INSERT INTO `notificaciones` VALUES (3, 'cont_comer', 'Contratacion Comercial', 'Notificacion de las contrataciones para el area comercial', 'correo', 'ACTIVO', '2019-05-22 11:04:34', '2019-05-22 11:04:34');
INSERT INTO `notificaciones` VALUES (4, 'cont_comp', 'Contratacion Compras', 'Notificacion de las contrataciones para el area de compras', 'correo', 'ACTIVO', '2019-05-22 11:04:34', '2019-05-22 11:04:34');
INSERT INTO `notificaciones` VALUES (5, 'cont_desa', 'Contratacion Desarrollo', 'Notificacion de las contrataciones para el area de desarrollo', 'correo', 'ACTIVO', '2019-05-22 11:04:34', '2019-05-22 11:04:34');
INSERT INTO `notificaciones` VALUES (6, 'cont_fina', 'Contratacion Finanzas', 'Notificacion de las contrataciones para el area de finanzas', 'correo', 'ACTIVO', '2019-05-22 11:04:34', '2019-05-22 11:04:34');
INSERT INTO `notificaciones` VALUES (7, 'cont_it', 'Contratacion IT', 'Notificacion de las contrataciones para el area de IT', 'correo', 'ACTIVO', '2019-05-22 11:04:34', '2019-05-22 11:04:34');
INSERT INTO `notificaciones` VALUES (8, 'cont_oper', 'Contratacion Operacion', 'Notificacion de las contrataciones para el area de operaciones', 'correo', 'ACTIVO', '2019-05-22 11:04:34', '2019-05-22 11:04:34');
INSERT INTO `notificaciones` VALUES (9, 'cont_rh', 'Contratacion RRHH', 'Notificacion de las contrataciones para el area de recursos humanos', 'correo', 'ACTIVO', '2019-05-22 11:04:34', '2019-05-22 11:04:34');
INSERT INTO `notificaciones` VALUES (10, 'cont_sopo', 'Contratacion Soporte', 'Notificacion de las contrataciones para el area de soporte a la operacion', 'correo', 'ACTIVO', '2019-05-22 11:04:34', '2019-05-22 11:04:34');
INSERT INTO `notificaciones` VALUES (11, 'cont_gene', 'Contratacion General', 'Notificacion general para todas las contrataciones', 'correo', 'ACTIVO', '2019-05-22 11:04:34', '2019-05-22 11:04:34');

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets`  (
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `password_resets_email_index`(`email`) USING BTREE,
  INDEX `password_resets_token_index`(`token`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of password_resets
-- ----------------------------
INSERT INTO `password_resets` VALUES ('sam.guzman140390@gmail.com', '$2y$10$rAVv09/eDyMxdx8x95Gnw.nR8m//YW2Za1aB.jMXPKnIJtZzwXCTm', '2019-01-07 06:08:35');
INSERT INTO `password_resets` VALUES ('ramon.delgado@indeplo.com', '$2y$10$YLe4XFm5XGAEjfTjvRRQF.QJh1V60YLskCGj28Y1eFaPYvapfC4y6', '2019-09-04 17:27:27');
INSERT INTO `password_resets` VALUES ('notificaciones@indeplo.com', '$2y$10$zl/PWjr5jZiMNFc16X3NleLg62ItdstTxwZ1b7qfnwpPjgMC0D6X.', '2019-09-04 17:45:24');

-- ----------------------------
-- Table structure for permisos
-- ----------------------------
DROP TABLE IF EXISTS `permisos`;
CREATE TABLE `permisos`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `codigo` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `descripcion` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `status` enum('1','2') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '1',
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `codigo`(`codigo`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 68 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permisos
-- ----------------------------
INSERT INTO `permisos` VALUES (1, 'Listado de Usuarios', 'listado_usuarios', 'Permiso para acceder al listado de usuarios.', '1', '2019-04-10 14:31:56', '2019-04-10 14:32:02');
INSERT INTO `permisos` VALUES (2, 'Crear Usuarios', 'crear_usuarios', 'Permiso para crear usuarios.', '1', '2019-04-10 17:43:25', '2019-04-10 17:43:28');
INSERT INTO `permisos` VALUES (3, 'Baja de Usuarios', 'baja_usuarios', 'Permiso para dar de baja usuarios.', '1', '2019-04-10 17:44:27', '2019-04-10 17:44:30');
INSERT INTO `permisos` VALUES (4, 'Editar Usuarios', 'editar_usuarios', 'Permiso para editar usuarios.', '1', '2019-04-10 17:45:12', '2019-04-10 17:45:15');
INSERT INTO `permisos` VALUES (5, 'Notificaciones de Usuarios', 'notificaciones_usuarios', 'Permiso para modificar las notificaciones de los usuarios.', '1', '2019-04-10 18:40:01', '2019-04-10 18:40:04');
INSERT INTO `permisos` VALUES (6, 'Modificar Permisos', 'modificar_permisos', 'Permiso para modificar los permisos de los usuarios.', '1', '2019-04-11 09:11:13', '2019-04-11 09:11:16');
INSERT INTO `permisos` VALUES (7, 'Listado de Catalogos', 'listado_catalogos', 'Permiso para acceder al listado de catalogos.', '1', '2019-04-11 10:52:29', '2019-04-11 10:52:33');
INSERT INTO `permisos` VALUES (8, 'Listado de Solicitudes', 'listado_solicitudes', 'Permiso para acceder al listado de solicitudes de altas.', '1', '2019-04-11 11:06:51', '2019-04-11 11:06:56');
INSERT INTO `permisos` VALUES (9, 'Crear Solicitudes', 'crear_solicitudes', 'Permiso para crear solicitudes de altas.', '1', '2019-04-11 11:08:44', '2019-04-11 11:08:47');
INSERT INTO `permisos` VALUES (10, 'Editar Solicitudes', 'editar_solicitudes', 'Permiso para editar las solicitudes de altas.', '1', '2019-04-11 11:45:36', '2019-04-11 11:45:39');
INSERT INTO `permisos` VALUES (11, 'Autorizar Solicitudes', 'autorizar_solicitudes', 'Permiso para autorizar solicitudes de altas.', '1', '2019-04-11 11:57:05', '2019-04-11 11:57:07');
INSERT INTO `permisos` VALUES (12, 'Autorizar Computadora', 'autorizar_computadora', 'Permiso para autorizar entrega de equipos de computo.', '1', '2019-04-11 12:04:45', '2019-04-11 12:04:48');
INSERT INTO `permisos` VALUES (13, 'Autorizar Coche', 'autorizar_coche', 'Permiso para autorizar entrega de coches.', '1', '2019-04-11 12:04:52', '2019-04-11 12:04:54');
INSERT INTO `permisos` VALUES (14, 'Autorizar Celular', 'autorizar_celular', 'Permiso para autorizar entrega de celularares.', '1', '2019-04-11 12:04:58', '2019-04-11 12:05:01');
INSERT INTO `permisos` VALUES (15, 'Autorizar Herramientas', 'autorizar_herramientas', 'Permiso para autorizar entrega de herramientas.', '1', '2019-04-11 12:05:04', '2019-04-11 12:05:07');
INSERT INTO `permisos` VALUES (16, 'Agendar Cita', 'agendar_cita', 'Permiso para agendar citas.', '1', '2019-04-11 12:07:14', '2019-04-11 12:07:16');
INSERT INTO `permisos` VALUES (17, 'Autorizar Empleado', 'autorizar_empleado', 'Permiso para autorizar empleados.', '1', '2019-04-11 12:17:34', '2019-04-11 12:17:36');
INSERT INTO `permisos` VALUES (18, 'Editar Empleado', 'editar_empleado', 'Permiso para editar empleados.', '1', '2019-04-11 12:38:06', '2019-04-11 12:38:10');
INSERT INTO `permisos` VALUES (19, 'Baja de Empleado', 'baja_empleado', 'Permiso para iniciar la baja empleados.', '1', '2019-04-11 12:41:44', '2019-04-11 12:41:48');
INSERT INTO `permisos` VALUES (20, 'Cancelar Bajas', 'cancelar_bajas', 'Permiso para cancelar la baja de empleados.', '1', '2019-04-11 12:57:43', '2019-04-11 12:57:46');
INSERT INTO `permisos` VALUES (21, 'Baja de Computo', 'baja_computo', 'Permiso para autorizar la baja de equipos de computo.', '1', '2019-04-11 13:02:35', '2019-04-11 13:02:39');
INSERT INTO `permisos` VALUES (22, 'Baja de Coche', 'baja_coche', 'Permiso para autorizar la baja de coches.', '1', '2019-04-11 13:03:06', '2019-04-11 13:03:09');
INSERT INTO `permisos` VALUES (23, 'Baja de Celular', 'baja_celular', 'Permiso para autorizar la baja de equipos celulares.', '1', '2019-04-11 13:03:31', '2019-04-11 13:03:35');
INSERT INTO `permisos` VALUES (24, 'Baja de Herramientas', 'baja_herramientas', 'Permiso para autorizar la baja de herramientas.', '1', '2019-04-11 13:03:58', '2019-04-11 13:04:00');
INSERT INTO `permisos` VALUES (25, 'Baja de RH', 'baja_rh', 'Permiso para dar la baja de por parte de rh.', '1', '2019-04-11 13:09:35', '2019-04-11 13:09:38');
INSERT INTO `permisos` VALUES (26, 'Baja Definitiva', 'baja_definitiva', 'Permiso para dar la baja definitiva.', '1', '2019-04-11 13:14:47', '2019-04-11 13:14:49');
INSERT INTO `permisos` VALUES (27, 'Listado de Empleados', 'listado_empleados', 'Permiso para acceder al listado de empleados.', '1', '2019-04-11 13:18:36', '2019-04-11 13:18:39');
INSERT INTO `permisos` VALUES (28, 'Listado de Bajas', 'listado_bajas', 'Permiso para acceder al listado de las bajas.', '1', '2019-04-11 13:21:54', '2019-04-11 13:21:57');
INSERT INTO `permisos` VALUES (29, 'Listado de Citas', 'listado_citas', 'Permiso para acceder al listado de las citas.', '1', '2019-04-11 13:42:48', '2019-04-11 13:42:51');
INSERT INTO `permisos` VALUES (30, 'Listado de Incidencias', 'listado_incidencias', 'Permiso para acceder al listado de las incidencias.', '1', '2019-04-11 13:56:22', '2019-04-11 13:56:24');
INSERT INTO `permisos` VALUES (31, 'Crear Incidencias', 'crear_incidencias', 'Permiso para crear incidencias.', '1', '2019-04-11 13:59:16', '2019-04-11 13:59:18');
INSERT INTO `permisos` VALUES (32, 'Listado Autorizar Incidencias', 'listado_autorizar', 'Permiso para acceder al listado de autorizar incidencias.', '1', '2019-04-11 14:03:58', '2019-04-11 14:04:01');
INSERT INTO `permisos` VALUES (33, 'Listado Lote Incidencias', 'listado_lote', 'Permiso para acceder al listado de envio de lotes de incidencias.', '1', '2019-04-11 14:27:36', '2019-04-11 14:27:39');
INSERT INTO `permisos` VALUES (34, 'Autorizar/Cancelar Incidencia', 'aut_cancel_incidencia', 'Permiso para autorizar o cancelar una incidencia.', '1', '2019-04-11 17:21:47', '2019-04-11 17:21:50');
INSERT INTO `permisos` VALUES (35, 'Exportar Usuarios', 'exportar_usuarios', 'Permiso para exportar usuarios.', '1', '2019-04-11 17:54:32', '2019-04-11 17:54:34');
INSERT INTO `permisos` VALUES (36, 'Exportar Solicitudes', 'exportar_solicitudes', 'Permiso para exportar solicitudes.', '1', '2019-04-11 17:54:32', '2019-04-11 17:54:34');
INSERT INTO `permisos` VALUES (37, 'Exportar Empleados', 'exportar_empleados', 'Permiso para exportar empleados.', '1', '2019-04-11 17:54:32', '2019-04-11 17:54:34');
INSERT INTO `permisos` VALUES (38, 'Exportar Incidencias', 'exportar_incidencias', 'Permiso para exportar incidencias.', '1', '2019-04-11 17:54:32', '2019-04-11 17:54:34');
INSERT INTO `permisos` VALUES (39, 'Exportar Lote de Incidencias', 'export_lote_incidencias', 'Permiso para exportar lote de incidencias.', '1', '2019-04-11 17:54:32', '2019-04-11 17:54:34');
INSERT INTO `permisos` VALUES (40, 'Enviar Lote de Incidencias', 'enviar_lote', 'Permiso para enviar el lote de incidencias.', '1', '2019-04-11 18:16:16', '2019-04-11 18:16:18');
INSERT INTO `permisos` VALUES (41, 'Ver Sueldo', 'ver_sueldo', 'Permiso para ver el sueldo del empleado', '1', '2019-04-17 14:25:43', '2019-04-17 14:25:45');
INSERT INTO `permisos` VALUES (42, 'Agendar Cita Baja', 'cita_baja', 'Permiso para agendar la cita para la baja', '1', '2019-04-23 12:06:18', '2019-04-23 12:06:18');
INSERT INTO `permisos` VALUES (43, 'Baja de la Credencial', 'baja_credencial', 'Permiso para autorizar la baja de la credencial', '1', '2019-04-23 12:06:18', '2019-04-23 12:06:18');
INSERT INTO `permisos` VALUES (44, 'Listar Todo', 'listar_todos', 'Permiso para ver todos los recursos, solicitudes, etc.', '1', '2019-05-13 09:45:09', '2019-05-13 09:45:09');
INSERT INTO `permisos` VALUES (45, 'Ver Asimilados Incidencias', 'ver_asimilados_inci', 'Permiso para ver el esquema asimilado en incidencias', '1', '2019-05-20 16:46:58', '2019-05-20 16:46:58');
INSERT INTO `permisos` VALUES (46, 'Ver Tradicionales Incidencias', 'ver_tradicional_inci', 'Permiso para ver el esquema tradicional en incidencias', '1', '2019-05-20 16:46:58', '2019-05-20 16:46:58');
INSERT INTO `permisos` VALUES (47, 'Ver Autorizaciones', 'ver_autorizaciones', 'Permiso para ver los checks de las autorizaciones', '1', '2019-05-21 11:27:33', '2019-05-21 11:27:33');
INSERT INTO `permisos` VALUES (48, 'Contrato Firmado', 'contrato_firmado', 'Permiso para validar que el contrato ya fue firmado', '1', '2019-04-11 12:04:45', '2019-04-11 12:04:48');
INSERT INTO `permisos` VALUES (50, 'Autorizar/Cancelar Incidencia C/V', 'aut_cancel_inci_c_v', 'Permiso para autorizar o cancelar una incidencia con venta.', '1', '2019-04-11 17:21:47', '2019-04-11 17:21:50');
INSERT INTO `permisos` VALUES (51, 'Autorizar/Cancelar Incidencia S/V', 'aut_cancel_inci_s_v', 'Permiso para autorizar o cancelar una incidencia sin venta.', '1', '2019-04-11 17:21:47', '2019-04-11 17:21:50');
INSERT INTO `permisos` VALUES (52, 'Autorizar/Cancelar Incidencia Dec', 'aut_cancel_inci_dec', 'Permiso para autorizar o cancelar una incidencia con deduccion.', '1', '2019-04-11 17:21:47', '2019-04-11 17:21:50');
INSERT INTO `permisos` VALUES (53, 'Listar Incidencias Finalizadas', 'listado_finalizadas', 'Permiso para acceder al listado de incidencias finalizadas', '1', '2019-04-11 17:21:47', '2019-04-11 17:21:50');
INSERT INTO `permisos` VALUES (55, 'Editar Incidencias Envio', 'editar_inci_env', 'Permiso para editar incidencias antes de ser enviadas', '1', '2019-04-11 17:21:47', '2019-04-11 17:21:47');
INSERT INTO `permisos` VALUES (56, 'Cambio de Proyecto', 'cambio_proyecto', 'Permiso para realizar el cambio de proyecto en los recursos', '1', '2019-04-11 17:21:47', '2019-04-11 17:21:47');
INSERT INTO `permisos` VALUES (57, 'Listado de Ajustes de Sueldo', 'listado_ajuste_s', 'Permiso para acceder al listado de ajustes de sueldo', '1', '2019-04-11 17:21:47', '2019-04-11 17:21:47');
INSERT INTO `permisos` VALUES (58, 'Editar Ajustes de Sueldo', 'editar_ajustes_s', 'Permiso para editar las solicitudes de ajuste de sueldo', '1', '2019-04-11 17:21:47', '2019-04-11 17:21:47');
INSERT INTO `permisos` VALUES (59, 'Solicitar Ajustes de Sueldo', 'nuevo_ajuste_s', 'Permiso para crear solicitudes de ajuste de sueldo', '1', '2019-04-11 17:21:47', '2019-04-11 17:21:47');
INSERT INTO `permisos` VALUES (60, 'Eliminar Ajustes de Sueldo', 'eliminar_ajuste_s', 'Permiso para eliminar solicitudes de ajuste de sueldo', '1', '2019-04-11 17:21:47', '2019-04-11 17:21:47');
INSERT INTO `permisos` VALUES (61, 'Enviar Ajustes de Sueldo', 'enviar_ajuste_s', 'Permiso para enviar las solicitudes de ajuste de sueldo', '1', '2019-04-11 17:21:47', '2019-04-11 17:21:47');
INSERT INTO `permisos` VALUES (62, 'Validar Ajustes de Sueldo', 'validar_ajuste_s', 'Permiso para validar las solicitudes de sueldo', '1', '2019-04-11 17:21:47', '2019-04-11 17:21:47');
INSERT INTO `permisos` VALUES (63, 'Ver como otro usuario', 'ver_como', 'Permiso para acceder a la funcionalidad de ver como otro usuario', '1', '2019-04-11 17:21:47', '2019-04-11 17:21:47');
INSERT INTO `permisos` VALUES (64, 'Cambiar la Viabilidad de los Empleados', 'cambio_viable', 'Permiso para cambiar la viabilidad de los empleados', '1', '2019-04-11 17:21:47', '2019-04-11 17:21:47');
INSERT INTO `permisos` VALUES (65, 'Editar Comentarios', 'editar_comentarios', 'Permiso para editar los comentarios', '1', '2019-04-11 17:21:47', '2019-04-11 17:21:47');
INSERT INTO `permisos` VALUES (66, 'Cancelar Solicitudes Alta', 'cancel_sol_alta', 'Permiso para cancelar las solicitudes de alta', '1', '2019-08-22 12:48:53', '2019-08-22 12:48:53');
INSERT INTO `permisos` VALUES (67, 'Listado Validar Incidencias', 'listado_validar_inci', 'Permiso para verl el listado de validacion de incidencias de los directores', '1', '2019-09-07 09:37:30', '2019-09-07 09:37:30');

-- ----------------------------
-- Table structure for proyectos_clientes
-- ----------------------------
DROP TABLE IF EXISTS `proyectos_clientes`;
CREATE TABLE `proyectos_clientes`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `activo` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  UNIQUE INDEX `proyectos_clientes_id_unique`(`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of proyectos_clientes
-- ----------------------------
INSERT INTO `proyectos_clientes` VALUES ('ALE', 'AL Enterprise', 0, NULL, NULL);
INSERT INTO `proyectos_clientes` VALUES ('ALU', 'ALCATEL-LUCENT', 0, NULL, NULL);
INSERT INTO `proyectos_clientes` VALUES ('ATT', 'AT&T', 0, NULL, NULL);
INSERT INTO `proyectos_clientes` VALUES ('AYS', 'AYSTEL', 1, NULL, NULL);
INSERT INTO `proyectos_clientes` VALUES ('BEST', 'BESTEL', 1, NULL, NULL);
INSERT INTO `proyectos_clientes` VALUES ('BOS', 'BOS-KE INTERIOR SUSTENTABLE S.A. ', 1, NULL, NULL);
INSERT INTO `proyectos_clientes` VALUES ('CAS', 'CASSIDIAN', 1, NULL, NULL);
INSERT INTO `proyectos_clientes` VALUES ('CIC', 'CCICSA', 1, NULL, NULL);
INSERT INTO `proyectos_clientes` VALUES ('CIS', 'CISCO', 1, NULL, NULL);
INSERT INTO `proyectos_clientes` VALUES ('CNK', 'CINKO LATINOAMERICA', 1, NULL, NULL);
INSERT INTO `proyectos_clientes` VALUES ('DHN', 'DEHN', 0, NULL, NULL);
INSERT INTO `proyectos_clientes` VALUES ('ETP', 'ENLACE TCP', 1, NULL, NULL);
INSERT INTO `proyectos_clientes` VALUES ('GSB', 'GESAB', 1, NULL, NULL);
INSERT INTO `proyectos_clientes` VALUES ('HO1', 'Ho1a', 0, NULL, NULL);
INSERT INTO `proyectos_clientes` VALUES ('HPE', 'HP', 0, NULL, NULL);
INSERT INTO `proyectos_clientes` VALUES ('HUW', 'HUAWEI', 1, NULL, NULL);
INSERT INTO `proyectos_clientes` VALUES ('IND', 'INDEPLO', 1, NULL, NULL);
INSERT INTO `proyectos_clientes` VALUES ('INE', 'IN ENERGY', 1, NULL, NULL);
INSERT INTO `proyectos_clientes` VALUES ('MXS', 'MEXSEMI', 0, NULL, NULL);
INSERT INTO `proyectos_clientes` VALUES ('NAE', 'NAE MEXICO', 1, NULL, NULL);
INSERT INTO `proyectos_clientes` VALUES ('NCR', 'NCR', 1, NULL, NULL);
INSERT INTO `proyectos_clientes` VALUES ('NFR', 'INFRACOMEX', 0, NULL, NULL);
INSERT INTO `proyectos_clientes` VALUES ('NOK', 'NOKIA', 1, NULL, NULL);
INSERT INTO `proyectos_clientes` VALUES ('RAD', 'RAD DATA COMUNICATIOS', 1, NULL, NULL);
INSERT INTO `proyectos_clientes` VALUES ('RTR', 'ROAD TRACK', 0, NULL, NULL);
INSERT INTO `proyectos_clientes` VALUES ('SEG', 'SEGURITECH', 0, NULL, NULL);
INSERT INTO `proyectos_clientes` VALUES ('TIM', 'ERICSSON', 1, NULL, NULL);
INSERT INTO `proyectos_clientes` VALUES ('TRM', 'TELORAM', 0, NULL, NULL);
INSERT INTO `proyectos_clientes` VALUES ('ZME', 'ZEQUENZE MEXICO', 0, NULL, NULL);

-- ----------------------------
-- Table structure for proyectos_grupos
-- ----------------------------
DROP TABLE IF EXISTS `proyectos_grupos`;
CREATE TABLE `proyectos_grupos`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `activo` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  UNIQUE INDEX `proyectos_grupos_id_unique`(`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of proyectos_grupos
-- ----------------------------
INSERT INTO `proyectos_grupos` VALUES ('100', 'INDEPLO', 1, NULL, NULL);
INSERT INTO `proyectos_grupos` VALUES ('101', 'Gastos Adicionales', 1, NULL, NULL);
INSERT INTO `proyectos_grupos` VALUES ('102', 'Materiales Adicionales', 1, NULL, NULL);
INSERT INTO `proyectos_grupos` VALUES ('103', 'GADIS QUE ABSORBE INDEPLO', 1, NULL, NULL);
INSERT INTO `proyectos_grupos` VALUES ('201', 'SOLAR & TELECOM SOLUTIONS', 1, NULL, NULL);
INSERT INTO `proyectos_grupos` VALUES ('202', 'RUANO', 1, NULL, NULL);
INSERT INTO `proyectos_grupos` VALUES ('203', 'BACANET', 1, NULL, NULL);
INSERT INTO `proyectos_grupos` VALUES ('204', 'MAXIMINO', 1, NULL, NULL);
INSERT INTO `proyectos_grupos` VALUES ('205', 'CORONADO', 1, NULL, NULL);
INSERT INTO `proyectos_grupos` VALUES ('206', 'EC TELECOM', 1, NULL, NULL);
INSERT INTO `proyectos_grupos` VALUES ('207', 'RICARDO LEAL', 1, NULL, NULL);
INSERT INTO `proyectos_grupos` VALUES ('208', 'EDER SALVATI PALESTINA', 1, NULL, NULL);
INSERT INTO `proyectos_grupos` VALUES ('209', 'CARLOS RODRIGUEZ MORAN', 1, NULL, NULL);
INSERT INTO `proyectos_grupos` VALUES ('210', 'JOSE DOLORES ZOZAYA CRUZ', 1, NULL, NULL);
INSERT INTO `proyectos_grupos` VALUES ('211', 'GABRIEL CASAS GONZALEZ', 1, NULL, NULL);
INSERT INTO `proyectos_grupos` VALUES ('212', 'ROBERTO HERNÁNDEZ PÉREZ', 1, NULL, NULL);
INSERT INTO `proyectos_grupos` VALUES ('213', 'GSAB (NOC RED700 NOKIA-ALTAN)', 1, NULL, NULL);
INSERT INTO `proyectos_grupos` VALUES ('214', 'JOSE MARTIN MATA TORRES', 1, NULL, NULL);
INSERT INTO `proyectos_grupos` VALUES ('215', 'LOZLA S.A. DE C.V.', 1, NULL, NULL);
INSERT INTO `proyectos_grupos` VALUES ('300', 'NAE', 1, NULL, NULL);
INSERT INTO `proyectos_grupos` VALUES ('301', 'Gastos adicionales (viáticos, Boletos, Administración, etc) NAE', 1, NULL, NULL);
INSERT INTO `proyectos_grupos` VALUES ('302', 'NAE-Banco Sabadell', 1, NULL, NULL);
INSERT INTO `proyectos_grupos` VALUES ('303', 'Gasto Administrativo NAE', 1, NULL, NULL);

-- ----------------------------
-- Table structure for proyectos_regiones
-- ----------------------------
DROP TABLE IF EXISTS `proyectos_regiones`;
CREATE TABLE `proyectos_regiones`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `activo` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  UNIQUE INDEX `proyectos_regiones_id_unique`(`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of proyectos_regiones
-- ----------------------------
INSERT INTO `proyectos_regiones` VALUES ('COMB', 'COLOMBIA', 1, NULL, NULL);
INSERT INTO `proyectos_regiones` VALUES ('CUAU', 'Cuautitlan', 1, NULL, NULL);
INSERT INTO `proyectos_regiones` VALUES ('ESPA', 'Español', 1, NULL, NULL);
INSERT INTO `proyectos_regiones` VALUES ('GTML', 'Guatemala', 1, NULL, NULL);
INSERT INTO `proyectos_regiones` VALUES ('INTE', 'INTERNACIONAL', 1, NULL, NULL);
INSERT INTO `proyectos_regiones` VALUES ('LATA', 'LATINO AMéRICA', 1, NULL, NULL);
INSERT INTO `proyectos_regiones` VALUES ('METR', 'Metro', 1, NULL, NULL);
INSERT INTO `proyectos_regiones` VALUES ('MEXI', 'MEXICO', 1, NULL, NULL);
INSERT INTO `proyectos_regiones` VALUES ('NCNL', 'Nacional', 1, NULL, NULL);
INSERT INTO `proyectos_regiones` VALUES ('NORE', 'Noreste', 1, NULL, NULL);
INSERT INTO `proyectos_regiones` VALUES ('NOTE', 'Norte', 1, NULL, NULL);
INSERT INTO `proyectos_regiones` VALUES ('RE01', 'R01', 1, NULL, NULL);
INSERT INTO `proyectos_regiones` VALUES ('RE02', 'R02', 1, NULL, NULL);
INSERT INTO `proyectos_regiones` VALUES ('RE03', 'R03', 1, NULL, NULL);
INSERT INTO `proyectos_regiones` VALUES ('RE04', 'R04', 1, NULL, NULL);
INSERT INTO `proyectos_regiones` VALUES ('RE05', 'R05', 1, NULL, NULL);
INSERT INTO `proyectos_regiones` VALUES ('RE06', 'R06', 1, NULL, NULL);
INSERT INTO `proyectos_regiones` VALUES ('RE07', 'R07', 1, NULL, NULL);
INSERT INTO `proyectos_regiones` VALUES ('RE08', 'R08', 1, NULL, NULL);
INSERT INTO `proyectos_regiones` VALUES ('RE09', 'R09', 1, NULL, NULL);
INSERT INTO `proyectos_regiones` VALUES ('SURE', 'Sureste', 1, NULL, NULL);
INSERT INTO `proyectos_regiones` VALUES ('TELN', 'Telnor', 1, NULL, NULL);

-- ----------------------------
-- Table structure for proyectos_servicios
-- ----------------------------
DROP TABLE IF EXISTS `proyectos_servicios`;
CREATE TABLE `proyectos_servicios`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `activo` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  UNIQUE INDEX `proyectos_servicios_id_unique`(`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of proyectos_servicios
-- ----------------------------
INSERT INTO `proyectos_servicios` VALUES ('ADMO', 'Administrativo', 1, NULL, NULL);
INSERT INTO `proyectos_servicios` VALUES ('ALT1', 'ALTAN PMOS', 1, NULL, NULL);
INSERT INTO `proyectos_servicios` VALUES ('ALTN', 'SERVICIO A ALTAN  (NOC-RED700) A TRAVÉS DE NOKIA', 1, NULL, NULL);
INSERT INTO `proyectos_servicios` VALUES ('AT&T', 'AT&T', 1, NULL, NULL);
INSERT INTO `proyectos_servicios` VALUES ('CONF', 'Configuración', 1, NULL, NULL);
INSERT INTO `proyectos_servicios` VALUES ('CORP', 'CORPORATIVO', 1, NULL, NULL);
INSERT INTO `proyectos_servicios` VALUES ('ETP0', 'Enlace TP', 1, NULL, NULL);
INSERT INTO `proyectos_servicios` VALUES ('GADI', 'Gastos Adicionales', 1, NULL, NULL);
INSERT INTO `proyectos_servicios` VALUES ('ICA', 'ICA FLUOR', 1, NULL, NULL);
INSERT INTO `proyectos_servicios` VALUES ('IMPR', 'Improductivo', 1, NULL, NULL);
INSERT INTO `proyectos_servicios` VALUES ('INST', 'Instalación', 1, NULL, NULL);
INSERT INTO `proyectos_servicios` VALUES ('LATM', 'LATINOAMERICA', 1, NULL, NULL);
INSERT INTO `proyectos_servicios` VALUES ('MECO', 'MESA DE CONTROL ', 1, NULL, NULL);
INSERT INTO `proyectos_servicios` VALUES ('MEDX', 'MEDUX', 1, NULL, NULL);
INSERT INTO `proyectos_servicios` VALUES ('MGCE', 'SUPERVISORES MEGACABLE', 1, NULL, NULL);
INSERT INTO `proyectos_servicios` VALUES ('POOL', 'ASISTENTES ADMINISTRATIVAS POOL NOKIA', 1, NULL, NULL);
INSERT INTO `proyectos_servicios` VALUES ('RCMX', 'RED COMPARTIDA MEDUX PILOTO. (ALTAN PILOTO MEDUX)', 1, NULL, NULL);
INSERT INTO `proyectos_servicios` VALUES ('RCOR', 'Renta de coordinador', 1, NULL, NULL);
INSERT INTO `proyectos_servicios` VALUES ('RCUA', 'Renta Cuadrilla', 1, NULL, NULL);
INSERT INTO `proyectos_servicios` VALUES ('RDCO', 'Red Compartida', 1, NULL, NULL);
INSERT INTO `proyectos_servicios` VALUES ('RPRO', 'Renta de probador', 1, NULL, NULL);
INSERT INTO `proyectos_servicios` VALUES ('RREC', 'Renta Recurso', 1, NULL, NULL);
INSERT INTO `proyectos_servicios` VALUES ('RSUP', 'Renta Supervisor', 1, NULL, NULL);
INSERT INTO `proyectos_servicios` VALUES ('SABA', 'Banco Sabadell', 1, NULL, NULL);
INSERT INTO `proyectos_servicios` VALUES ('SADM', 'SERVICIOS ADMINISTRADOS', 1, NULL, NULL);
INSERT INTO `proyectos_servicios` VALUES ('STF0', 'Sistema de Tierra Fisica', 1, NULL, NULL);
INSERT INTO `proyectos_servicios` VALUES ('TELE', 'TELEFONICA', 1, NULL, NULL);
INSERT INTO `proyectos_servicios` VALUES ('TRAN', 'Transporte', 1, NULL, NULL);
INSERT INTO `proyectos_servicios` VALUES ('ULTR', 'ULTRAVISIÓN', 1, NULL, NULL);
INSERT INTO `proyectos_servicios` VALUES ('VARI', 'Variable (Cotizacion)', 1, NULL, NULL);

-- ----------------------------
-- Table structure for proyectos_tecnologias
-- ----------------------------
DROP TABLE IF EXISTS `proyectos_tecnologias`;
CREATE TABLE `proyectos_tecnologias`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `activo` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  UNIQUE INDEX `proyectos_tecnologias_id_unique`(`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of proyectos_tecnologias
-- ----------------------------
INSERT INTO `proyectos_tecnologias` VALUES ('ADMI', 'Servicio de Administración/Coordinacion/Mesa de Soporte', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('ADMO', 'Administrativo', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('ADMX', 'Mesa de soporte de Mexico Conectado', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('ADRC', 'Mesa de soporte de RCDT', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('ALE0', 'AL Enterprise', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('ALTN', 'ALTAN', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('APRE', 'PROYECTO APRENDE DE ENLACE TP', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('ATRS', 'Administración Traspasos', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('AUCA', 'SERVICIO DE AUDITORIAS DE CALIDAD ', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('AWTD', 'ADMINISTRACION DE PROYECTO WTD', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('BNMX', 'BANAMEX', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('C4ZA', 'INSTALACIÓN DE CONSOLAS GSAB PARA EL C4 DE ZAPOPAN', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('CABL', 'Servicios de Cableado', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('CAET', 'CARRIER ETHERNET', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('CALI', 'CALIDAD', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('CAPA', 'capacitación', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('CAS0', 'CASSIDIAN', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('CEAL', 'CABLEADO ESTRUCTURADO Y DE ALIMENTACIÓN', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('CIC0', 'CICCSA', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('CIS0', 'CISCO', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('CLAS', 'CLIP CLASS', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('COLO', 'COLOMBIA', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('COME', 'COMERCIAL', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('CONF', 'Configuración', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('COOR', 'Coordinacion', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('CORP', 'CORPORATIVO', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('COTE', 'Core Team 1660, 1830', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('DEHN', 'DEHN', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('DEOP', 'Delivery Operation', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('DESA', 'Desarrollo', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('DHN0', 'Improductivo DEHN', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('DICO', 'DIRECCIóN COLOMBIA', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('DIIT', 'DIRECTOR IT', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('DOIT', 'DESARROLLO O TI', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('DWDM', 'Instalación y Comisionamiento', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('EMSO', 'Equipo MSO en AT&T', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('EQIP', 'INSTALACIÓN DE EQUIPOS IP', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('ETRP', 'ENTERPRISE', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('FEST', 'Días No Laborables por Ley', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('FIFO', 'FIELD FORCE', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('FINA', 'FINANZAS', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('GADI', 'Gastos Adicionales', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('GNTE', 'GERENTE', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('GPON', 'GPON', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('GPS0', 'Localización', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('GRAL', 'GENERAL', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('GSB0', 'GESAB', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('HOMO', 'HOMOLOGACIONES', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('HUW0', 'HUAWEI', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('IMHW', 'IMPLEMENTACION HUAWEI', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('IMNK', 'IMPLEMENTACION NOKIA', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('IMPR', 'IMPRODUCTIVO POR FALTA DE ACTIVIDAD DEL PROYECTO', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('IMSM', 'Recursos IMS Mobile Net (Marco Antonio Solis)', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('INCA', 'incapacidad (IMSS)', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('IND0', 'INDEPLO', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('INST', 'Instalación', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('INTE', 'Intendencia', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('IPBH', 'IP BACKHAUL', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('IPRA', 'IPRAN 7705', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('IPRN', 'SOPORTE TÉCNICO EN TECNOLOGÍA IPRAN', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('JEFR', 'Jefe Regional', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('LADA', 'LARGA DISTANCIA', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('LSTR', 'ALESTRA', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('M626', 'Migración 1626 LM', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('M641', 'SERVICIO DE MIGRACION 1641SX', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('MATE', 'Materiales', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('MECO', 'Mesa de Control', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('MEDX', 'Medux', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('MIWA', 'Microwaves', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('MONW', 'MOBILE NETWORKS', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('MXCO', 'México Conectado', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('MXS0', 'MXS0', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('NAE0', 'NAE Mexico', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('NALS', 'Instalación ALESTRA', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('NATT', 'Instalación AT&T', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('NCR0', 'NCR', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('NFR0', 'INFRACOMEX', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('NIPD', 'NI-IPD', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('NOC0', 'NOC', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('NOC1', 'NOC NOKIA PARA SU CLIENTE TELEFÓNICA', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('NOC2', 'NOC TELEFONICA', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('NOCA', 'NOC RED COMPARTIDA NOKIA - ALTAN', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('NOCO', 'Nomina Confidencial ', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('NOCT', 'NOCT SERVICO OPERACIÓN ASISTIDA NOC PARA SU CLIENTE AT&T', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('NOK0', 'Nokia', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('NTEL', 'Instalación TELEFONICA', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('NTIN', 'NI (Alejandro Arroyo)', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('OTPR', 'OTROS PROYECTOS', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('OTRS', 'OTROS', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('PECS', 'permiso con goce de sueldo', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('PERU', 'PERU', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('PESS', 'permiso sin goce de sueldo', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('PILT', 'RED COMPARTIDA MEDUX PILOTO. (ALTAN PILOTO MEDUX)', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('PMCS', 'PM CUSTOMER SERVICE', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('PMFN', 'PM Support FND', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('PMIP', 'PM Support IPRT', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('PMNA', 'PM NAE', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('PMO0', 'PMO', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('PMOM', 'PM OPERACION Y MTTO', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('PMRT', 'PM Support R&T', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('POOL', 'ASISTENTES ADMINISTRATIVOS POOL', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('PZTE', 'POLIZA ZTE', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('QLTY', 'QUALITY', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('RACC', 'Servicio de Renta de Accesorios inDeplo', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('RAMW', 'RAN & MICROWAVE', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('RAN0', 'RAN', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('RCDT', 'RCDT', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('RCOR', 'Renta de coordinador', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('RCUA', 'Renta Cuadrilla', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('RDA0', 'RDA', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('RDCO', 'Red Compartida', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('REMW', 'Radio Enlaces MW', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('RLCA', 'Renta de LapTop, Celular, Auto', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('RPRO', 'Renta de probador', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('RREC', 'Renta Recurso', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('RRHH', 'RECURSOS HUMANOS', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('RSHS', 'SUPERVISOR DE SEGURIDAD', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('RSQA', 'SUPERVISOR DE CALIDAD ', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('RSUP', 'Renta Supervisor', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('SANI', 'SOPORTE ADMINISTRACIÓN SYSTEM INTEGRATION ', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('SCAP', 'Servicio de Capacitación', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('SECO', 'Servicios de Consultoría Nacional para ETP', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('SEG0', 'SEG0', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('SERV', 'Servicios', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('SIAC', 'sin actividad asignada', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('SISF', 'Servicios de Instalacion de Sondas Fijas', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('SMMO', 'Servicio de Monitoreo Movil', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('SOCO', 'SOCIO CORPORATIVO', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('SOPE', 'soporte a la opreacion', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('SOPF', 'SOPORTE A FINANZAS', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('SOPV', 'SOPORTE A VENTAS ', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('SOTE', 'SOPORTE TECNICO OLEX S-12', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('SOTI', 'SOPORTE TI', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('SPHW', 'SUPERVISION HUAWEI', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('SPNK', 'SUPERVISION NOKIA', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('SPRO', 'SOPORTE A PROCUREMENT', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('SRME', 'Soporte Residente Mensual', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('SSF1', ' Site Survey Foraneo 1', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('SSF2', 'Site Survey Foraneo 2', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('SSLO', 'Site Survey Local', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('STF0', 'Sistema de Tierra Fisica', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('SUAL', 'Super Alarm', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('SUP0', 'Supervision', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('SUPE', 'supervision', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('SVEN', 'SOPORTE VENTAS', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('TAC0', 'Poliza TAC1', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('TAC2', 'Poliza TAC2', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('TACA', 'SRVICIO DE SOPORTE TAC PARA AT&T', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('TACO', 'TACO', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('TBAS', 'TBAS', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('TCTR', 'TIGER TEAM CENTRO', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('TEND', 'TENDER', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('TICS', 'TECNOLOGÍA DE LA INFORMACIÓN Y COMUNICACIÓN', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('TIM0', 'ERICSSON', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('TLNK', 'TELCO NOKIA', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('TLNN', 'TELCO NO NOKIA', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('TOLS', 'PERSONAL DE TI COMO APOYO A PROYECTO', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('TRAN', 'Transporte', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('TRAS', 'TRASPASOS', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('TRM0', 'TRM0', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('ULTR', 'ULTARAVISIÓN DE NOKIA', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('VACA', 'vacaciones autorizadas', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('VARI', 'Variable (Cotizacion)', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('VDSL', 'VDSL', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('WIRE', 'WIRELESS', 1, NULL, NULL);
INSERT INTO `proyectos_tecnologias` VALUES ('WTMX', 'Radio Telmex', 1, NULL, NULL);

-- ----------------------------
-- Table structure for solicitud_alta
-- ----------------------------
DROP TABLE IF EXISTS `solicitud_alta`;
CREATE TABLE `solicitud_alta`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cliente` varchar(5) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `servicio` varchar(5) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `region` varchar(5) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `tecnologia` varchar(5) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `grupo` varchar(5) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `nombre` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `apaterno` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `amaterno` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `ind` int(11) NULL DEFAULT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_alta` date NULL DEFAULT NULL,
  `puesto` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `codigo_sueldo` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `sueldo_venta` decimal(10, 2) NULL DEFAULT NULL,
  `esquema` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `riesgo` smallint(6) NOT NULL,
  `celular` smallint(6) NOT NULL DEFAULT 0,
  `codigo_celular` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `computadora` smallint(6) NOT NULL DEFAULT 0,
  `codigo_computadora` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `desc_computadora` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `auto` smallint(6) NOT NULL DEFAULT 0,
  `codigo_auto` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `bam` smallint(6) NOT NULL DEFAULT 0,
  `codigo_bam` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `software` smallint(6) NOT NULL DEFAULT 0,
  `codigo_software` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `desc_software` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `plan_linea` int(11) NULL DEFAULT NULL,
  `plan_linea_bam` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `botas` int(11) NOT NULL DEFAULT 0,
  `talla_botas` decimal(10, 2) NULL DEFAULT NULL,
  `playera` int(11) NOT NULL DEFAULT 0,
  `talla_playera` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `actividad` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `coordinador_id` int(11) NOT NULL,
  `pm` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `lugar_trabajo` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `venta` decimal(10, 2) NULL DEFAULT NULL,
  `costo` decimal(10, 2) NULL DEFAULT NULL,
  `margen` decimal(10, 2) NULL DEFAULT 0.00,
  `cotizacion_url` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `caso_negocio_url` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `vobo_url` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `curriculum_url` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `sueldo_imss` decimal(10, 2) NOT NULL,
  `sueldo_variable` decimal(10, 2) NOT NULL,
  `cita_herramienta` datetime(0) NULL DEFAULT NULL,
  `tipo_correo` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `motivo` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `tipo_proyecto` int(11) NOT NULL DEFAULT 1,
  `direccion` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `herramientas_detalles` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fecha_cita` date NULL DEFAULT NULL,
  `hora_cita` time(0) NULL DEFAULT NULL,
  `detalles_cita` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status_cita` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `correo_cita` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `solicitante` int(11) NULL DEFAULT NULL,
  `descargado` int(11) NULL DEFAULT 0,
  `area` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `id_empleado` int(10) UNSIGNED NULL DEFAULT NULL,
  `usuario_rechazar` int(10) UNSIGNED NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `temporalidad_contrato` int(255) NULL DEFAULT NULL,
  `correo` int(1) NULL DEFAULT 0,
  `codigo_poliza` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 69 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of solicitud_alta
-- ----------------------------
INSERT INTO `solicitud_alta` VALUES (1, 'NAE', 'REGI', 'RE08', 'RSUP', '100', 'OVERMAYER ISSEL', 'RODRIGUEZ', 'FIGUEROA', 0, '2019-07-15', '2019-07-09', '27', '0', 0.00, 'MIXTO', 5, 1, '0', 1, '0', '', 1, '0', 1, '0', 0, '0', NULL, 61, '74', 1, 9.00, 1, 'grande', 'SUPERVISAR LAS INSTALACIONES DE ACUERDO A LOS ESTÁNDARES DE CALIDAD DEL CLIENTE', 275, NULL, '31', 0.00, 0.00, 0.00, NULL, NULL, 'solicitudes/sol_1/vobo_sol_1.msg', NULL, 5000.00, 14000.00, NULL, 'NAE', 'INCORPORACIóN A PROYECTO POR BAJA VOLUNTARIA DE FABIAN SAUCEDA AGUILAR.', 1, 'OFICINAS CLIENTE', NULL, '2019-07-12', '09:30:00', 'Se presenta a firma de contrato en oficinas mundo e el 16/07/2019, considerada misma fecha de ingreso', 'EMPLEADO CREADO', 'Overmayer.figueroa@naemexico.com', 81, 0, 'OPERACIONES', 2300, NULL, '2019-07-09 12:59:37', '2019-07-12 11:25:02', 3, 0, NULL);
INSERT INTO `solicitud_alta` VALUES (2, 'CNK', 'TECH', 'RE09', 'DIRE', '103', 'DANIEL', 'MONTIEL', 'MUÑOZ', 0, '2019-07-13', '2019-07-10', '47', '0', 0.00, 'MIXTO', 2, 1, '0', 1, '0', '', 0, '0', 0, '0', 0, '0', NULL, 63, '27', 0, 0.00, 0, '0', '', 148, NULL, '15', 0.00, 0.00, 0.00, NULL, NULL, 'solicitudes/sol_2/vobo_sol_2.JPG', 'solicitudes/sol_2/cv_sol_2.pdf', 10000.00, 83000.00, NULL, 'INDEPLO', 'NUEVA CONTRATACION CIN KO TECH', 1, '', NULL, '2019-07-13', '09:00:00', 'YA FIRMO CONTRATO', 'EMPLEADO CREADO', 'daniel.montiel@indeplo.com', 448, 0, 'DESARROLLO', 2327, NULL, '2019-07-10 16:30:04', '2019-07-29 13:00:37', 3, 0, NULL);
INSERT INTO `solicitud_alta` VALUES (3, 'NOK', 'SERV', 'RE09', 'NOCT', '100', ' ISMAEL ', 'SANTIAGO ', 'RIVERA', 1272, '2019-07-15', '2019-07-12', '25', '0', 0.00, 'MIXTO', 2, 0, '0', 0, '0', NULL, 0, '0', 0, '0', 0, '0', NULL, 27, '27', 0, 0.00, 0, '0', 'SERVICE DESK', 226, NULL, '15', 0.00, 0.00, 0.00, 'solicitudes/sol_3/cotizacion_sol_3.msg', NULL, 'solicitudes/sol_3/vobo_sol_3.msg', NULL, 4200.00, 3600.00, NULL, NULL, 'EL LINE MANAGER OSCAR OLIVARES DE NOKIA SOLICITO LA CONTRATACIÓN DE ESTE SERVICIO', 3, 'NOKIA E INSTALACI', NULL, '2019-07-16', '09:00:00', 'Dar contrato con fecha efectiva de 16/07/2019', 'EMPLEADO CREADO', 'ismael.santiago@indeplo.com', 45, 0, 'ADMINISTRACION', 2301, NULL, '2019-07-12 09:07:58', '2019-07-16 11:38:31', 3, 0, NULL);
INSERT INTO `solicitud_alta` VALUES (4, 'NOK', 'SERV', 'RE09', 'NOCT', '100', 'HUGO', 'RAMIREZ', 'SANCHEZ', 1273, '2019-07-15', '2019-07-12', '37', '0', 0.00, 'MIXTO', 2, 0, '0', 0, '0', NULL, 0, '0', 0, '0', 0, '0', NULL, 27, '27', 0, 0.00, 0, '0', 'SOPORTE TÉCNICO NIVEL 2', 226, NULL, '15', 0.00, 0.00, 0.00, 'solicitudes/sol_4/cotizacion_sol_4.msg', NULL, 'solicitudes/sol_4/vobo_sol_4.msg', NULL, 4500.00, 8169.87, NULL, NULL, 'EL LINE MANAGER DE NOKIA OSCAR OLIVARES SOLICITA LA CONTRATACIÓN DE ESTE SERVICIO', 3, 'NOKIA E INSTALACIONES DEL CLIENTE', NULL, NULL, NULL, NULL, NULL, NULL, 45, 0, 'SOPORTE', NULL, NULL, '2019-07-12 09:15:05', '2019-07-12 09:15:05', 3, 0, NULL);
INSERT INTO `solicitud_alta` VALUES (5, 'NOK', 'TKBS', 'RE09', 'PMO0', '100', 'BRENDA', 'PEREA', 'SANCHEZ', 1274, '2019-07-16', '2019-07-15', '6', '0', 89781.00, 'MIXTO', 2, 1, '0', 1, '0', 'CON SOPORTE IMAGEN NOKIA', 0, '0', 0, '0', 0, '0', NULL, 61, '27', 0, 0.00, 0, '0', 'PM Support', 226, NULL, '15', 89781.00, 38764.50, 56.82, NULL, NULL, NULL, NULL, 8000.00, 19500.00, NULL, 'INDEPLO', 'MIGRACIÓN DE RECURSO DE OTRA EMPRESA A INDEPLO, YA QUE NOS ASIGNARON EL SID DE ADMON', 2, 'INSTALACIONES DEL CLIENTE', NULL, '2019-07-16', '11:00:00', 'Se presenta a firma de contrato en Nokia Izcalli\n', 'EMPLEADO CREADO', 'brenda.perea@indeplo.com', 799, 0, 'ADMINISTRACION', 2302, NULL, '2019-07-15 16:45:15', '2019-07-16 11:46:12', 3, 0, NULL);
INSERT INTO `solicitud_alta` VALUES (6, 'NOK', 'TKBS', 'RE09', 'PMO0', '100', 'GABRIELA', 'ALCANTARA', 'HERNANDEZ', 1275, '2019-07-16', '2019-07-15', '6', '0', 89781.00, 'MIXTO', 2, 1, '0', 1, '0', 'LAPTOP CON SOPORTE IMAGEN NOKIA', 0, '0', 0, '0', 0, '0', NULL, 60, '27', 0, 0.00, 0, '0', 'PM SUPPORT', 226, NULL, '15', 89781.00, 42644.60, 52.50, NULL, NULL, NULL, NULL, 20000.00, 8000.00, NULL, 'INDEPLO', 'MIGRACIÓN DE RECURSO DE OTRA EMPRESA A INDEPLO, YA QUE NOS ASIGNARON EL SID DE ADMON', 2, 'INSTALACIONES DEL CLIENTE\r\n', NULL, '2019-07-17', '11:00:00', 'La firma de contrató se realizará en NOKIA IZCALLI', 'EMPLEADO CREADO', 'gabriela.alcantara@indeplo.com', 799, 0, 'ADMINISTRACION', 2308, NULL, '2019-07-15 16:55:54', '2019-07-17 18:01:06', 3, 0, NULL);
INSERT INTO `solicitud_alta` VALUES (7, 'NOK', 'TKBS', 'RE09', 'FIFO', '100', 'LUIS DAVID', 'BARON', 'SANCHEZ', 1276, '2019-07-16', '2019-07-15', '26', '0', 69876.00, 'MIXTO', 2, 1, '0', 1, '0', 'LAPTOP CON SOPORTE IMAGEN NOKIA', 0, '0', 0, '0', 1, '0', 'AUTOCAD', 60, '27', 0, 0.00, 0, '0', 'Engineering & BOM\r\n', 226, NULL, '15', 69876.00, 39279.60, 43.79, NULL, NULL, NULL, NULL, 8000.00, 20000.00, NULL, '', 'MIGRACIÓN DE RECURSO DE OTRA EMPRESA A INDEPLO, YA QUE NOS ASIGNARON EL SID DE ADMON\r\n', 2, 'INSTALACIONES DEL CLIENTE\r\n', NULL, '2019-07-17', '11:00:00', 'La firma de contrato se realizará en NOKIA IZCALLI', 'EMPLEADO CREADO', 'david.baron@indeplo.com', 799, 0, 'OPERACIONES', 2303, NULL, '2019-07-15 17:13:17', '2019-07-17 13:09:02', 3, 0, NULL);
INSERT INTO `solicitud_alta` VALUES (8, 'NOK', 'TKBS', 'RE09', 'FIFO', '100', 'EFRAIN', 'NATIVITAS', 'ROJO', 1277, '2019-07-16', '2019-07-15', '26', '0', 69876.00, 'MIXTO', 2, 1, '0', 1, '0', 'LAPTOP CON SOPORTE IMAGEN NOKIA\r\n', 0, '0', 0, '0', 1, '0', 'AUTOCAD', 60, '27', 0, 0.00, 0, '0', 'Engineering & BOM\r\n', 226, NULL, '15', 69876.00, 34158.80, 51.12, NULL, NULL, NULL, NULL, 8000.00, 16000.00, NULL, '', 'MIGRACIÓN DE RECURSO DE OTRA EMPRESA A INDEPLO, YA QUE NOS ASIGNARON EL SID DE ADMON\r\n', 2, 'INSTALACIONES DEL CLIENTE', NULL, '2019-07-17', '11:00:00', 'La contratación se realizará en NOKIA IZCALLI', 'EMPLEADO CREADO', 'efrain.nativitas@indeplo.com', 799, 0, 'OPERACIONES', 2305, NULL, '2019-07-15 17:21:41', '2019-07-17 13:17:28', 3, 0, NULL);
INSERT INTO `solicitud_alta` VALUES (9, 'NOK', 'TKBS', 'RE09', 'FIFO', '100', 'JUAN CARLOS', 'GARDUÑO', 'HERNANDEZ', 1278, '2019-07-16', '2019-07-15', '26', '0', 69876.00, 'MIXTO', 2, 1, '0', 1, '0', 'LAPTOP CON SOPORTE IMAGEN NOKIA\r\n', 0, '0', 0, '0', 1, '0', 'AUTOCAD', 60, '27', 0, 0.00, 0, '0', 'Engineering & BOM\r\n', 226, NULL, '15', 69876.00, 27746.00, 60.29, NULL, NULL, NULL, NULL, 5000.00, 15000.00, NULL, '', 'MIGRACIÓN DE RECURSO DE OTRA EMPRESA A INDEPLO, YA QUE NOS ASIGNARON EL SID DE ADMON\r\n', 2, 'INSTALACIONES DEL CLIENTE', NULL, '2019-07-17', '11:00:00', 'La contratación sera en NOKIA IZCALLI', 'EMPLEADO CREADO', 'carlos.garduno@indeplo.com', 799, 0, 'OPERACIONES', 2307, NULL, '2019-07-15 17:31:55', '2019-07-17 13:26:00', 3, 0, NULL);
INSERT INTO `solicitud_alta` VALUES (10, 'NOK', 'TKBS', 'RE09', 'FIFO', '100', 'GUILLERMO', 'VARGAS', 'HERNANDEZ', 1279, '2019-07-16', '2019-07-15', '26', '0', 69876.00, 'MIXTO', 2, 1, '0', 1, '0', 'LAPTOP CON SOPORTE IMAGEN NOKIA\r\n', 0, '0', 0, '0', 1, '0', 'AUTOCAD', 60, '27', 0, 0.00, 0, '0', 'Engineering & BOM', 226, NULL, '15', 69876.00, 27746.00, 60.29, NULL, NULL, NULL, NULL, 5000.00, 15000.00, NULL, '', 'MIGRACIÓN DE RECURSO DE OTRA EMPRESA A INDEPLO, YA QUE NOS ASIGNARON EL SID DE ADMON\r\n', 2, 'INSTALACIONES DEL CLIENTE\r\n', NULL, '2019-07-17', '11:00:00', 'La firma de contrato se realizara en NOKIA IZCALLI', 'EMPLEADO CREADO', 'guillermo.vargas@indeplo.com', 799, 0, 'OPERACIONES', 2304, NULL, '2019-07-15 17:59:07', '2019-07-17 13:13:58', 3, 0, NULL);
INSERT INTO `solicitud_alta` VALUES (11, 'NOK', 'TKBS', 'RE09', 'FIFO', '100', 'ISAIAS ARTURO', 'GOMEZ', 'RAMIREZ', 1280, '2019-07-16', '2019-07-15', '26', '0', 69876.00, 'MIXTO', 2, 1, '0', 1, '0', 'LAPTOP CON SOPORTE IMAGEN NOKIA\r\n', 0, '0', 0, '0', 1, '0', 'AUTOCAD', 60, '27', 0, 0.00, 0, '0', 'Engineering & BOM\r\n', 226, NULL, '15', 69876.00, 37999.40, 45.62, NULL, NULL, NULL, NULL, 8000.00, 19000.00, NULL, '', 'MIGRACIÓN DE RECURSO DE OTRA EMPRESA A INDEPLO, YA QUE NOS ASIGNARON EL SID DE ADMON\r\n', 2, 'INSTALACIONES DEL CLIENTE', NULL, '2019-07-17', '11:00:00', 'Las contrataciones se realizaran en NOKIA IZCALLI', 'EMPLEADO CREADO', 'arturo.gomez@indeplo.com', 799, 0, 'OPERACIONES', 2306, NULL, '2019-07-15 18:02:20', '2019-07-17 13:22:23', 3, 0, NULL);
INSERT INTO `solicitud_alta` VALUES (12, 'ZTE', 'VARI', 'RE04', 'INST', '100', 'ISMAEL MARTIN ', 'SANTIAGUILLO ', 'RAMÍREZ', 0, '2019-07-19', '2019-07-19', '20', '0', 0.00, 'MIXTO', 2, 0, '0', 0, '0', NULL, 0, '0', 0, '0', 0, '0', NULL, 27, '27', 0, 0.00, 0, '0', 'Planificación, control, coordinación y seguimiento de trabajos a realizar por contratistas.\r\nSeguimiento y control de las actividades realizada y puntos de acción\r\nSeguimiento de instrucciones \r\nReporting oportuno de toda la actividad semanal, mensual, ', 214, NULL, '19', 0.00, 0.00, 0.00, NULL, NULL, 'solicitudes/sol_12/vobo_sol_12.pdf', 'solicitudes/sol_12/cv_sol_12.doc', 10000.00, 45000.00, NULL, 'INDEPLO', 'INICIO DE PROYECTO FTTH PARA ZTE, ZONA NUEVO LEON', 1, 'OFICINAS ZTE, OFICINAS TORIZ , OFICINAS DE SUPERVISION', NULL, '2019-07-19', '09:00:00', 'Se contratará vía remota en Mty., firma de contrato 19/07', 'EMPLEADO CREADO', 'ismael.santiaguillo@indeplo.com', 476, 0, 'OPERACIONES', 2325, NULL, '2019-07-19 09:56:54', '2019-07-24 14:20:20', 1, 0, NULL);
INSERT INTO `solicitud_alta` VALUES (13, 'IND', 'DOIT', 'RE09', 'DESA', '100', 'DAVID ALEXIS', 'GONZALEZ', 'GARCIA', 0, '2019-07-22', '2019-07-19', '22', '0', 0.00, 'MIXTO', 2, 0, '0', 1, '0', 'Core i5, 8GB RAM', 0, '0', 0, '0', 0, '0', NULL, 27, '27', 0, 0.00, 0, '0', 'PROGRAMAR', 104, NULL, '15', 0.00, 0.00, 0.00, NULL, NULL, NULL, 'solicitudes/sol_13/cv_sol_13.pdf', 5000.00, 9000.00, NULL, NULL, 'CUBRIR PUESTO VACANTE', 1, '', NULL, '2019-07-22', '09:00:00', 'Se presenta a firma de contrato en las oficinas de Once Corporativo', 'EMPLEADO CREADO', 'alexiscohen21@gmail.com', 2, 0, 'DESARROLLO', 2311, NULL, '2019-07-19 10:18:30', '2019-07-22 11:23:29', 3, 0, NULL);
INSERT INTO `solicitud_alta` VALUES (14, 'NOK', 'SERV', 'RE09', 'NOCT', '100', 'OMAR', 'PEREZ', 'PASCUAL', 1281, '2019-07-22', '2019-07-19', '25', 'NFF-SA-SM-T-002', 0.00, 'MIXTO', 2, 0, '0', 0, '0', NULL, 0, '0', 0, '0', 0, '0', NULL, 27, '27', 0, 0.00, 0, '0', 'NIVEL 0', 226, NULL, '15', 13200.00, 10911.00, 17.34, NULL, NULL, NULL, NULL, 4200.00, 3600.00, NULL, NULL, 'SOLICITADO POR OSCAR OLIVARES DEL NOC DE TELEFÓNICA', 3, 'NOC DE TELEFÓNICA', NULL, '2019-07-22', '09:00:00', 'Dar contrato con fecha de ingreso 22/07/2019. \nRequiere de carta para tramite cuenta de nómina.', 'EMPLEADO CREADO', 'omarocanlover04@gmail.com', 799, 0, 'ADMINISTRACION', 2312, NULL, '2019-07-19 14:05:10', '2019-07-22 11:54:51', 3, 0, NULL);
INSERT INTO `solicitud_alta` VALUES (15, 'NOK', 'SERV', 'RE09', 'NOCT', '100', 'ARELI YOSELIN', 'GARCIA', 'MEJIA', 1282, '2019-07-22', '2019-07-19', '25', 'NFF-SA-SM-T-002', 0.00, 'MIXTO', 2, 0, '0', 0, '0', NULL, 0, '0', 0, '0', 0, '0', NULL, 27, '27', 0, 0.00, 0, '0', 'NIVEL 0', 226, NULL, '15', 13200.00, 10911.00, 17.34, NULL, NULL, NULL, NULL, 4200.00, 3600.00, NULL, NULL, 'ÓSCAR OLIVARES DEL NOC DE TELEFÓNICA SOLICITÓ SU ALTA', 3, 'NOC DE TELEFONICA', NULL, '2019-07-22', '09:00:00', 'Dar contrato con fecha efectiva de 22 de Julio 2019', 'EMPLEADO CREADO', 'areliigarciia123@gmail.com', 799, 0, 'ADMINISTRACION', 2310, NULL, '2019-07-19 14:09:12', '2019-07-22 11:03:27', 3, 0, NULL);
INSERT INTO `solicitud_alta` VALUES (16, 'NOK', 'SERV', 'RE09', 'NOCT', '100', 'FRANCISCO DAVID', 'ROMERO', 'MONTIEL', 1283, '2019-07-22', '2019-07-19', '3', 'NFF-SA-SM-T-002', 0.00, 'MIXTO', 2, 0, '0', 0, '0', NULL, 0, '0', 0, '0', 0, '0', NULL, 27, '27', 0, 0.00, 0, '0', 'NIVEL 0', 226, NULL, '15', 13200.00, 10911.00, 17.34, NULL, NULL, NULL, NULL, 4200.00, 3600.00, NULL, NULL, 'ÓSCAR OLIVARES DEL NOC DE TELEFÓNICA SOLICITÓ SU ALTA', 3, 'NOC DE TELEFÓNICA ', NULL, '2019-07-22', '09:00:00', 'Dar contrato con fecha efectiva de 22 de Julio 2019', 'EMPLEADO CREADO', 'angeed.81@gmail.com', 799, 0, 'ADMINISTRACION', 2309, NULL, '2019-07-19 14:14:08', '2019-07-22 10:56:38', 3, 0, NULL);
INSERT INTO `solicitud_alta` VALUES (17, 'NOK', 'SERV', 'RE09', 'NOCT', '100', 'LAURA MARIANA', 'GARCIA', 'PEÑA', 1284, '2019-07-24', '2019-07-19', '25', 'NFF-SA-SM-T-007', 0.00, 'MIXTO', 2, 0, '0', 0, '0', NULL, 0, '0', 0, '0', 0, '0', NULL, 27, '27', 0, 0.00, 0, '0', 'NIVEL 1', 226, NULL, '15', 19050.00, 15742.21, 17.36, NULL, NULL, NULL, NULL, 5000.00, 6157.01, NULL, NULL, 'ÓSCAR OLIVARES DEL NOC DE TELEFÓNICA SOLICITÓ SU ALTA', 3, 'NOC DE TELEFÓNICA ', NULL, '2019-07-23', '09:00:00', 'Dar contrato con fecha efectiva de 23/07/2019', 'EMPLEADO CREADO', 'Lmgp0092@gmail.com', 799, 0, 'ADMINISTRACION', 1977, NULL, '2019-07-19 14:17:20', '2019-07-23 10:16:11', 3, 0, NULL);
INSERT INTO `solicitud_alta` VALUES (18, 'NOK', 'SERV', 'RE09', 'NOCT', '100', 'PERLA ITZEL', 'RAMIREZ', 'RUIZ', 1285, '2019-07-23', '2019-07-19', '25', NULL, 0.00, 'MIXTO', 2, 0, '0', 0, '0', NULL, 0, '0', 0, '0', 0, '0', NULL, 27, '27', 0, 0.00, 0, '0', 'NIVEL 0', 226, NULL, '15', 13172.56, 10911.00, 17.17, NULL, NULL, NULL, NULL, 4200.00, 3600.00, NULL, NULL, 'ÓSCAR OLIVARES DEL NOC DE TELEFÓNICA SOLICITO EL RECURSO.', 3, 'NOC DE TELEFÓNICA', NULL, '2019-07-23', '09:00:00', 'Dar congtrato con fecha efectiva de 23 de Julio 2019', 'EMPLEADO CREADO', 'iitzeel_ramirez13@outlook.es', 799, 0, 'ADMINISTRACION', 2161, NULL, '2019-07-19 14:55:18', '2019-07-23 10:18:42', 3, 0, NULL);
INSERT INTO `solicitud_alta` VALUES (19, 'NOK', 'VARI', 'RE09', 'INST', '100', 'DAVID', 'FONSECA', 'ARREDONDO', 0, '2019-07-29', '2019-07-26', '17', '0', 0.00, 'ASIMILADO', 4, 1, '0', 1, '0', '', 0, '0', 0, '0', 0, '0', NULL, 27, '27', 1, 26.00, 1, 'mediana', 'INSTALACION Y PUESTA EN SERVICIO DE EQUIPOS TECNOLOGIA NOKIA', 149, NULL, '15', 0.00, 0.00, 0.00, NULL, NULL, 'solicitudes/sol_19/vobo_sol_19.msg', 'solicitudes/sol_19/cv_sol_19.msg', 0.00, 9000.00, NULL, '', 'EN SUSTITUCION POR SANDY RAFAEL FLORES', 1, 'CENTRALES TELMEX, ATT, IZZI ETC', NULL, '2019-07-29', '09:00:00', 'dar contrato con fecha efectiva del 29 de julio 2019', 'EMPLEADO CREADO', 'davidfonseca.arredondo@gmail.com', 119, 0, 'OPERACIONES', 2326, NULL, '2019-07-26 13:02:32', '2019-07-29 10:14:59', 3, 0, NULL);
INSERT INTO `solicitud_alta` VALUES (20, 'NOK', 'SERV', 'RE09', 'NOCT', '100', 'ROBERTO CARLOS', 'HERNANDEZ', 'CORTES', 1287, '2019-07-30', '2019-07-30', '25', 'NFF-SA-SM-T-002', 0.00, 'MIXTO', 2, 0, '0', 0, '0', NULL, 0, '0', 0, '0', 0, '0', NULL, 27, '27', 0, 0.00, 0, '0', 'POSICION NIVEL 0', 226, NULL, '15', 13200.00, 10911.00, 17.34, NULL, NULL, NULL, NULL, 4200.00, 3600.00, NULL, NULL, 'SE SOLICITA EL ALTA POR PARTE DE OSCAR OLIVARES PARA TRABAJAR EN EL NOC DE TEELFONICA', 3, 'NOC DE TELEFONICA', NULL, '2019-07-30', '12:00:00', 'Dar contrato con fecha efectiva de 30/07/2019', 'EMPLEADO CREADO', 'roberto96.rc@gmail.com', 799, 0, 'ADMINISTRACION', 2328, NULL, '2019-07-30 08:53:42', '2019-07-30 13:07:05', 3, 0, NULL);
INSERT INTO `solicitud_alta` VALUES (21, 'NOK', 'POLZ', 'RE09', 'TAC0', '100', 'FERNANDO JESUS', 'PADILLA', 'SOTELO', 1288, '2019-07-30', '2019-07-30', '37', '0', 79068.08, 'MIXTO', 4, 0, '0', 0, '0', NULL, 0, '0', 0, '0', 0, '0', NULL, 27, '27', 0, 0.00, 0, '0', 'SOPORTE OPERATIVO', 203, NULL, '9', 79068.08, 16909.20, 78.61, NULL, NULL, NULL, NULL, 4200.00, 7800.00, NULL, NULL, 'EL CLIENTE QUIERE QUE PERMANEZCA EL RECURSO/SERVICIO', 6, 'CDMX', NULL, '2019-07-30', '11:14:00', 'firma de contrato con fecha de 30 Julio 2019', 'EMPLEADO CREADO', 'FHER12PADILLA@GMAIL.COM', 799, 0, 'SOPORTE', 1743, NULL, '2019-07-30 10:15:11', '2019-07-31 09:13:50', 1, 0, NULL);
INSERT INTO `solicitud_alta` VALUES (22, 'NOK', 'SERV', 'RE09', 'NOCT', '100', 'IVAN EDUARDO', 'ESCAMILLA ', 'AREVALO', 1289, '2019-08-01', '2019-07-30', '25', 'NFF-SA-SM-T-006', 0.00, 'MIXTO', 2, 0, '0', 0, '0', NULL, 0, '0', 0, '0', 0, '0', NULL, 27, '27', 0, 0.00, 0, '0', 'NIVEL 5', 226, NULL, '9', 18300.00, 10911.00, 40.38, NULL, NULL, NULL, 'solicitudes/sol_22/cv_sol_22.pdf', 4200.00, 3600.00, NULL, NULL, 'EL CLIENTE PIDE LA RE CONTRATACIÓN POR 3 MESES MAS DEL RECURSO.', 3, 'NOC DE TELEFÓNICA', NULL, '2019-08-01', '09:00:00', 'Dar contrato con fecha efectiva de 01 de agosto 2019', 'EMPLEADO CREADO', 'ivan.escamilla.arevalo@gmail.com', 799, 0, 'ADMINISTRACION', 1630, NULL, '2019-07-30 13:10:03', '2019-08-01 12:18:08', 3, 0, NULL);
INSERT INTO `solicitud_alta` VALUES (23, 'RAD', 'VARI', 'RE09', 'GEST', '103', 'ELIAS', 'CAMPOS', 'MIRANDA ', 0, '2019-07-31', '2019-08-14', '27', '0', 0.00, 'MIXTO', 4, 1, '0', 1, '0', '', 0, '0', 0, '0', 0, '0', NULL, 59, '27', 0, 0.00, 0, '0', 'Planificación, control, coordinación y seguimiento de trabajos a realizar por contratistas. Gestión de las comunicaciones con cliente directo (RAD) y cliente final (Telmex) ', 296, NULL, '15', 0.00, 0.00, 0.00, NULL, NULL, 'solicitudes/sol_23/vobo_sol_23.jpeg', 'solicitudes/sol_23/cv_sol_23.pdf', 5000.00, 12000.00, NULL, 'INDEPLO', 'Generar, implementar y coordinar el proceso de administración de proyectos ', 1, 'OFICINAS CORPORATIVAS', NULL, '2019-08-02', '12:00:00', 'dar contrato con fecha efectiva de día de 02/08/19', 'EMPLEADO CREADO', 'elias.campo@indeplo.com', 761, 0, 'OPERACIONES', 2245, NULL, '2019-07-31 11:13:04', '2019-08-14 10:14:31', 1, 0, NULL);
INSERT INTO `solicitud_alta` VALUES (24, 'NAE', 'REGI', 'RE01', 'CHOF', '100', 'SEBASTIAN ', 'ROCHA', 'HERMOSILLO', 0, '2019-08-01', '2019-07-31', '8', '0', 0.00, 'MIXTO', 2, 1, '0', 1, '0', '', 1, '0', 1, '0', 0, '0', NULL, 60, '74', 1, 9.00, 1, 'mediana', 'TRASLADO DE PERSONAL PARA REVISIÓN DE SITIOS Y APOYO EN CAMPO, ASÍ COMO TRASLADO DE ACTIVOS PARA SU CORRECTO DESEMPEÑO.', 283, NULL, '2', 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, 5000.00, 12000.00, NULL, 'NAE', 'APERTURA FASE II', 1, 'OFICINAS CLIENTE', NULL, '2019-08-01', '09:00:00', 'Firmará contrato vía remota en oficinas Tijuana, a las 9:00hrs, el 01 de agosto, considerada misma fecha de ingreso.', 'EMPLEADO CREADO', 'cbacks_92@hotmail.com', 81, 0, 'OPERACIONES', 2329, NULL, '2019-07-31 17:03:12', '2019-08-01 09:26:12', 3, 0, NULL);
INSERT INTO `solicitud_alta` VALUES (25, 'NOK', 'TKBS', 'RE09', 'POOL', '100', 'ROSARIO GUADALUPE', 'SANTOS', 'CONTRERAS', 1290, '2019-08-06', '2019-07-31', '25', '0', 45104.00, 'MIXTO', 2, 1, '0', 0, '0', NULL, 0, '0', 0, '0', 0, '0', NULL, 61, '27', 0, 0.00, 0, '0', 'ACCES MANAGEMENT SERVICE', 226, NULL, '15', 45104.00, 29743.20, 34.06, NULL, NULL, NULL, NULL, 8000.00, 13000.00, NULL, NULL, 'SU L.M. MARCO SANTOS SOLICITA QUE EL RECURSO PERMANEZCA CON EL. ', 2, 'INSTALACIONES DE INDEPLO EN CUAUTITLAN ', NULL, '2019-08-06', '09:00:00', 'Dar contrato con fecha efectiva de 06/0i8/2019', 'EMPLEADO CREADO', 'rosario.santos.ext@nokia.com', 799, 0, 'ADMINISTRACION', 2336, NULL, '2019-07-31 18:54:49', '2019-08-06 12:20:19', 3, 0, NULL);
INSERT INTO `solicitud_alta` VALUES (26, 'NOK', 'TKBS', 'RE09', 'POOL', '100', 'GERALDINE', 'DE LIRA', 'RAMIREZ', 1291, '2019-08-01', '2019-07-31', '25', '0', 59461.00, 'MIXTO', 2, 1, '0', 1, '0', 'SE NECESITA CON IMAGEN NOKIA', 0, '0', 0, '0', 0, '0', NULL, 61, '27', 0, 0.00, 0, '0', 'PM SUPPORT', 226, NULL, '15', 59461.00, 39410.64, 33.72, NULL, NULL, NULL, NULL, 8000.00, 20200.00, NULL, NULL, 'EL L.M. PABLO CARVAJAL SOLICITA QUE EL RECURSO SE QUEDE CON EL.', 2, 'INSTALACIONES DE INDEPLO EN CUAUTITLAN ', NULL, '2019-08-01', '13:00:00', 'Dar contrato por un mes', 'EMPLEADO CREADO', 'geraldine.de_lira_ramirez.ext@nokia.com', 799, 0, 'ADMINISTRACION', 2330, NULL, '2019-07-31 19:04:45', '2019-08-01 17:56:59', 1, 0, NULL);
INSERT INTO `solicitud_alta` VALUES (27, 'NOK', 'TKBS', 'RE09', 'POOL', '100', 'IRIS', 'ALVAREZ', 'LEON', 1292, '2019-08-01', '2019-07-31', '25', '0', 28850.00, 'MIXTO', 2, 1, '0', 1, '0', 'COMPUTADORA NORMAL.', 0, '0', 0, '0', 0, '0', NULL, 27, '27', 0, 0.00, 0, '0', 'ACCESS MANAGEMENT SERVICE', 226, NULL, '15', 28850.00, 20698.70, 28.25, NULL, NULL, NULL, NULL, 5000.00, 9500.00, NULL, NULL, 'SU L.M. FELIPE GONZALEZ SOLICITA QUE SE QUEDE EL RECURSO CON EL.', 2, 'INSTALACIONES DE INDEPLO CUAUTITLAN', NULL, '2019-08-01', '12:00:00', 'Dar contrato por un mes', 'EMPLEADO CREADO', 'irrix@hotmail.com', 799, 0, 'ADMINISTRACION', 2331, NULL, '2019-07-31 19:13:40', '2019-08-01 17:57:06', 1, 0, NULL);
INSERT INTO `solicitud_alta` VALUES (28, 'NOK', 'TKBS', 'RE09', 'POOL', '100', 'PABLO', 'SERRANO', 'RODRIGUEZ', 1293, '2019-08-05', '2019-08-03', '26', NULL, 48300.00, 'MIXTO', 4, 1, '0', 1, '0', '', 0, '0', 0, '0', 0, '0', NULL, 61, '27', 0, 0.00, 0, '0', 'ENGINEERING & BOM', 138, NULL, '15', 48300.00, 28221.00, 41.57, NULL, NULL, NULL, NULL, 5000.00, 15000.00, NULL, 'INDEPLO', 'EL L.M. DANIEL RORIGUEZ SOLICITO AL RECURSO', 2, 'INSTALACIONES DE INDEPLO', '', '2019-08-05', '11:21:00', 'dar contrato con fecha de hoy', 'EMPLEADO CREADO', 'pablo.ser@live.com', 799, 0, NULL, 2334, NULL, '2019-08-01 18:55:01', '2019-08-05 13:16:49', 1, 1, NULL);
INSERT INTO `solicitud_alta` VALUES (29, 'NOK', 'TKBS', 'RE09', 'POOL', '100', 'GERARDO', 'ALANIS', 'MORALES', 1294, '2019-08-05', '2019-08-03', '25', NULL, 44600.00, 'MIXTO', 4, 1, '0', 1, '0', '', 0, '0', 0, '0', 0, '0', NULL, 61, '27', 0, 0.00, 0, '0', 'PROJECT DOCUMENTATION F.F.', 226, NULL, '15', 44600.00, 25703.80, 42.37, NULL, NULL, NULL, NULL, 5000.00, 13000.00, NULL, 'INDEPLO', 'SU L.M. DAVID RODRIGUEZ SOLICITO EL RECURSO ', 2, 'INSTALACIONES DE INDEPLO CUAUTITLAN ', '', '2019-08-05', '09:19:00', 'Dar contrato con fecha efectiva del dia de hoy', 'EMPLEADO CREADO', 'gerardoalanis96@hotmail.com', 799, 0, NULL, 2332, NULL, '2019-08-01 18:59:20', '2019-08-05 10:40:14', 1, 1, NULL);
INSERT INTO `solicitud_alta` VALUES (30, 'NOK', 'TKBS', 'RE09', 'FIFO', '100', 'LUCIA', 'MORENO', 'PEREZ', 1295, '2019-08-05', '2019-08-03', '25', NULL, 44600.00, 'MIXTO', 4, 1, '0', 1, '0', '', 0, '0', 0, '0', 0, '0', NULL, 61, '27', 0, 0.00, 0, '0', 'PROJECT DOCUMENTATION F.F.', 226, NULL, '15', 44600.00, 25703.80, 42.37, NULL, NULL, NULL, NULL, 5000.00, 13000.00, NULL, 'INDEPLO', 'SU L.M. FELIX CARBAJAL ESTA SOLICITANDO QUE E RECURSO SE QUEDE CON ESAS ACTIVIDADES', 2, 'INSTALACIONES DE DE INDEPLO CUAUTITLAN', '', '2019-08-05', '09:21:00', 'dar contrato con fecha de hoy', 'EMPLEADO CREADO', 'LUCYMORENO16@HOTMAIL.COM', 799, 0, NULL, 2333, NULL, '2019-08-03 10:00:34', '2019-08-05 10:45:17', 1, 1, NULL);
INSERT INTO `solicitud_alta` VALUES (31, 'NOK', 'SERV', 'RE09', 'NOCA', '100', 'LUCAS', 'GERMAN', 'MOYANO', 1296, '2019-08-05', '2019-08-05', '3', 'NFF-SA-SM-T-008', 0.00, 'MIXTO', 2, 0, '0', 0, '0', NULL, 0, '0', 0, '0', 0, '0', NULL, 60, '27', 0, 0.00, 0, '0', 'GESTIÓN NOC', 226, NULL, '9', 19800.00, 110300.00, -457.07, NULL, NULL, 'solicitudes/sol_31/vobo_sol_31.html', 'solicitudes/sol_31/cv_sol_31.docx', 20000.00, 80000.00, NULL, NULL, 'SOLICITUD DEL CLIENTE ', 3, 'PUNTO POLANCO ', '', '2019-08-05', '09:00:00', 'Se presenta a firma de contrato en oficinas mundo e, a las 9:00 hrs., el 06 de Agosto 2019, considerada misma fecha de ingreso.', 'EMPLEADO CREADO', 'lmoyano@gmail.com', 44, 0, NULL, 2335, NULL, '2019-08-05 11:47:54', '2019-08-06 11:03:18', 3, 0, NULL);
INSERT INTO `solicitud_alta` VALUES (32, 'NOK', 'SERV', 'RE09', 'NOCT', '100', 'MANUEL', 'REYES', 'CRUZ', 1297, '2019-08-09', '2019-08-07', '37', 'NFF-SA-SM-T-002', 0.00, 'MIXTO', 2, 0, '0', 0, '0', NULL, 0, '0', 0, '0', 0, '0', NULL, 27, '27', 0, 0.00, 0, '0', 'NIVEL 0', 226, NULL, '15', 13200.00, 10911.00, 17.34, NULL, NULL, NULL, NULL, 4200.00, 3600.00, NULL, 'INDEPLO', 'OSCAR OLIVARES DEL NOC DE TELEFÓNICA SOLICITA SU CONTRATACIÓN', 3, 'NOC DE TELEFÓNICA CUAUTITLAN ', 'NO SE LE ENTREGA NI LAPTOP, NI CELULAR.', '2019-08-09', '09:00:00', 'dar contrato con fecha efectiva de 09/08/19', 'EMPLEADO CREADO', 'al2132001286@azc.uam.mx', 799, 0, NULL, 2338, NULL, '2019-08-07 09:48:52', '2019-08-09 10:07:31', 3, 1, NULL);
INSERT INTO `solicitud_alta` VALUES (33, 'NOK', 'SERV', 'RE09', 'NOCT', '100', 'KENIA', 'BAUTISTA', 'ANGELES', 1298, '2019-08-12', '2019-08-07', '37', 'NFF-SA-SM-T-002', 0.00, 'MIXTO', 2, 0, '0', 0, '0', NULL, 0, '0', 0, '0', 0, '0', NULL, 27, '27', 0, 0.00, 0, '0', 'NIVEL 0', 226, NULL, '15', 13200.00, 10911.00, 17.34, NULL, NULL, NULL, NULL, 4200.00, 3600.00, NULL, 'INDEPLO', 'OSCAR OLIVARES DEL NOS DE TELEFÓNICA SOLICITA LA CONTRATACIÓN DE ESTE RECURSO.', 3, 'NOC DE TELEFÓNICA CUAUTITLAN ', '', NULL, NULL, NULL, NULL, NULL, 799, 0, NULL, NULL, NULL, '2019-08-07 09:56:51', '2019-08-07 09:56:51', 3, 1, NULL);
INSERT INTO `solicitud_alta` VALUES (34, 'NOK', 'SERV', 'RE09', 'NOCT', '100', 'DIANA LAURA ', 'BONILLA', 'LAINE', 1299, '2019-08-12', '2019-08-07', '37', 'NFF-SA-SM-T-002', 0.00, 'MIXTO', 2, 0, '0', 0, '0', NULL, 0, '0', 0, '0', 0, '0', NULL, 27, '27', 0, 0.00, 0, '0', 'NIVEL 0', 226, NULL, '15', 13200.00, 10911.00, 17.34, NULL, NULL, NULL, NULL, 4200.00, 3600.00, NULL, 'INDEPLO', 'OSCAR OLIVARES DEL NOS DE TELEFÓNICA SOLICITA LA CONTRATACIÓN DE ESTE RECURSO. ', 3, 'NOC DE TELEFONISTA CUAUTITLAN. ', '', '2019-08-09', '09:00:00', 'dar contrato con fecha efectiva de 09/08/19', 'PENDIENTE', 'diana.laura_bonilla@hotmail.com', 799, 0, NULL, NULL, NULL, '2019-08-07 09:59:12', '2019-08-08 19:00:43', 3, 1, NULL);
INSERT INTO `solicitud_alta` VALUES (37, 'RAD', 'VARI', 'RE09', 'GEST', '103', 'MIGUEL FILIBERTO ', 'BANDA', 'VALDEZ', 0, '2019-08-08', '2019-08-07', '27', '0', 0.00, 'MIXTO', 4, 1, '0', 1, '0', '', 0, '0', 0, '0', 0, '0', NULL, 60, '27', 0, 0.00, 0, '0', 'Reuniones de seguimiento de proyecto (RAD) con Directores, Subdirectores, Gerentes, usuario final (TELMEX) y contratistas.\r\nControl de los equipos y materiales de instalación, que se asigna a cada contratista.\r\nSeguimiento de sitios terminados para su ', 296, NULL, '19', 0.00, 0.00, 0.00, NULL, NULL, 'solicitudes/sol_37/vobo_sol_37.pdf', 'solicitudes/sol_37/cv_sol_37.pdf', 5000.00, 13000.00, NULL, 'INDEPLO', 'Contacto constante y directo con ingeniería de TELMEX, Case TELMEX, para propiciar las asignaciones de servicios de demarcación con equipos RAD.\r\nResolución de incidentes y conflictos con ingeniería (Case TELMEX) ejecutadas por Indeplo. Deberá ser res', 1, 'MONTERREY', '', '2019-08-08', '09:00:00', 'Firma de contrato vía remota, a las 9:00hrs., el 08 de agosto 2019, considerada misma fecha de ingreso.', 'EMPLEADO CREADO', 'miguelbandapss@gmail.com', 761, 0, NULL, 2337, NULL, '2019-08-07 13:59:01', '2019-08-08 12:01:07', 3, 1, NULL);
INSERT INTO `solicitud_alta` VALUES (38, 'NAE', 'REGI', 'RE06', 'IMNM', '100', 'MARIA DEL ROCIO', 'MADRIGAL', 'ANDALUZ', 0, '2019-08-12', '2019-08-08', '53', '0', 0.00, 'MIXTO', 4, 1, '0', 1, '0', '', 0, '0', 1, '0', 0, '0', NULL, 61, '74', 1, 6.00, 0, '0', 'ADMINISTRACIóN DEL PROYECTO', 174, NULL, '11', 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, 8000.00, 22000.00, NULL, 'NAE', 'INCORPORACIóN AL PROYECTO POR BAJA VOLUNTARIA DE ALEJANDRA BERRIOS.', 1, 'OFICINA CLIENTE', '', '2019-08-12', '09:00:00', 'Se presenta a firma de contrato en oficinas mundo e, 9:00 hrs., el 12 de Agosto 2019, considerada misma fecha de ingreso', 'EMPLEADO CREADO', 'madrigal.andaluz@gmail.com', 81, 0, NULL, 2339, NULL, '2019-08-08 16:37:40', '2019-08-09 12:35:45', 3, 1, NULL);
INSERT INTO `solicitud_alta` VALUES (39, 'IND', 'DOIT', 'RE09', 'DESA', '100', 'Estephany Adriana', 'Sánchez', 'Sánchez', 0, '2019-08-16', '2019-08-16', '3', '0', 0.00, 'MIXTO', 2, 1, '0', 1, '0', 'Se traslada laptop de Isaac de la Cruz', 0, '0', 0, '0', 0, '0', NULL, 27, '27', 0, 0.00, 0, '0', 'DAR SOPORTE A LOS SISTEMAS INFORMÁTICOS DE LA COMPAñIA Y APOYO EN LA COSNULTORíA Y DESARROLLO DEL EQUIPO', 104, NULL, '15', 0.00, 0.00, 0.00, NULL, NULL, NULL, 'solicitudes/sol_39/cv_sol_39.docx', 5000.00, 6000.00, NULL, NULL, 'SUSTITUCIóN DE PUESTO.', 1, 'MUNDO E', 'Se traslada laptop Y TELÉFONO de Isaac de la Cruz', '2019-08-16', '09:00:00', 'Se presenta a firmar contrato en las Ofinicas Corporativas', 'EMPLEADO CREADO', 'adriana.sanchez.asn@gmail.com', 2, 0, NULL, 2350, NULL, '2019-08-09 09:47:56', '2019-08-16 11:10:04', 3, 0, NULL);
INSERT INTO `solicitud_alta` VALUES (40, 'NOK', 'TKBS', 'RE09', 'POOL', '100', 'IVAN ALFREDO', 'CASTAÑEDA', 'PRIETO', 1300, '2019-08-12', '2019-08-23', '26', NULL, 65000.00, 'MIXTO', 4, 1, '0', 1, '0', 'CON IMAGEN NOKIA', 0, '0', 0, '0', 0, '0', NULL, 61, '27', 0, 0.00, 0, '0', 'SID Trial & Small Project Coordination', 226, NULL, '15', 65000.00, 50529.00, 22.26, NULL, NULL, NULL, NULL, 10000.00, 24000.00, NULL, 'INDEPLO', 'SU L.M. ÁLVARO LEE SOLICITÓ SU CONTRATACIÓN. ', 2, 'INSTALACIONES DE INDEPLO CUAUTITLAN ', 'LAPTOP CON IMAGEN NOKIA', '2019-08-22', '17:23:00', 'DAR CONTRATO CON FECHA EFECTIVA DE 22 DE AGOSTO 2019', 'EMPLEADO CREADO', 'icastanedaprieto@gmail.com', 799, 0, NULL, 2355, NULL, '2019-08-09 13:33:13', '2019-08-23 09:18:05', 1, 1, NULL);
INSERT INTO `solicitud_alta` VALUES (41, 'NOK', 'SERV', 'RE09', 'NOCA', '100', 'Alma Elizabeth', 'Suarez ', 'Resendiz', 1301, '2019-08-12', '2019-08-12', '23', 'NOC-ALTN-RECP-01', 0.00, 'MIXTO', 2, 1, '549.00', 1, '1020.00 ', 'equipo estándar', 0, '0', 0, '0', 0, '0', NULL, 54, '27', 0, 0.00, 0, '0', 'ASISTENTE ADMINISTRATIVA Y RECEPCIÓN ', 226, NULL, '9', 34656.67, 21837.60, 36.99, 'solicitudes/sol_41/cotizacion_sol_41.pdf', NULL, NULL, 'solicitudes/sol_41/cv_sol_41.PDF', 5000.00, 11000.00, NULL, 'INDEPLO', '', 3, 'PUNTO POLANCO ', 'MOCHILA PARA EQUIPO', '2019-08-12', '11:30:00', 'Se presenta a firma de contrato en oficinas mundo e, 12 de agosto 2019, considerada misma fecha de ingreso', 'EMPLEADO CREADO', 'zmiling_bee@hotmail.com', 44, 0, NULL, 2172, NULL, '2019-08-12 11:23:15', '2019-08-12 13:48:13', 3, 1, NULL);
INSERT INTO `solicitud_alta` VALUES (42, 'NOK', 'SERV', 'RE09', 'NOCT', '100', 'MARIA FERNANDA', 'BAYARDI', 'FLORES', 1302, '2019-08-13', '2019-08-14', '25', 'NFF-SA-SM-T-002', 0.00, 'MIXTO', 2, 0, '0', 0, '0', NULL, 0, '0', 0, '0', 0, '0', NULL, 27, '27', 0, 0.00, 0, '0', 'NIVEL 0', 226, NULL, '15', 13200.00, 10911.00, 17.34, NULL, NULL, NULL, NULL, 4200.00, 3600.00, NULL, 'INDEPLO', 'SU L.M. OSCAR OLIVARES SOLICITA SU CONTRATACIÓN ', 3, 'NOC DE TELEFÓNICA CUAUTITLAN ', '', '2019-08-14', '09:00:00', 'Dar contrato con fecha efectiva de 14/08/19', 'EMPLEADO CREADO', 'fernanda_bayardi@hotmail.com', 799, 0, NULL, 2348, NULL, '2019-08-12 11:24:17', '2019-08-14 13:57:09', 3, 1, NULL);
INSERT INTO `solicitud_alta` VALUES (43, 'TEL', 'POLZ', 'RE09', 'INGP', '100', 'JOSE LUIS ', 'VERGARA ', 'BONILLA', 1303, '2019-08-15', '2019-08-14', '46', NULL, 0.00, 'MIXTO', 2, 1, '0', 1, '0', 'FAVOR DE ASIGNAR EL EQUIPO ENTREGADO POR RICARDO GALICIA ', 0, '0', 0, '0', 1, '0', 'VISIO, GSUITE, OFFICE ', 59, '27', 0, 0.00, 0, '0', 'Configuración  de MW banda Libre y Licenciada \r\nManejo y configuración de redes de transporte\r\nReporteo y seguimiento de enlaces\r\n1.	Configuración de Radios Tagged & Untagged para MW\r\n2.	Configuración de Q&Q en radio enlaces\r\n3.	Configuración de túneles ', 220, NULL, '15', 0.00, 19460.10, 0.00, 'solicitudes/sol_43/cotizacion_sol_43.pdf', 'solicitudes/sol_43/caso_negocio_sol_43.pdf', 'solicitudes/sol_43/vobo_sol_43.png', 'solicitudes/sol_43/cv_sol_43.doc', 5000.00, 8500.00, NULL, 'INDEPLO', 'REMPLAZO DE RECURSO RICARDO GALICIA', 6, '80% HOME OFFICE\r\n10% INDEPLO, CORPORATIVO ONCE \r\n10% TORRE TEMM, PASEO DE LA REFORMA ', 'SIN HERRAMIENTAS', '2019-08-14', '23:56:00', 'Dar contrato con fecha efectiva de 15/08/2019', 'EMPLEADO CREADO', 'joseluis-vergarab@hotmail.com', 476, 0, NULL, 2347, NULL, '2019-08-12 13:27:03', '2019-08-14 13:02:17', 1, 1, '9402386463');
INSERT INTO `solicitud_alta` VALUES (44, 'IND', 'ADFI', 'RE09', 'RRHH', '100', 'MARIA FERNANDA', 'GARCIA', 'PEREZ', 0, '2019-08-16', '2019-08-16', '12', '0', 0.00, 'MIXTO', 1, 0, '0', 1, '0', '', 0, '0', 0, '0', 0, '0', NULL, 27, '27', 0, 0.00, 0, '0', 'DESARROLLO ORGANIZACIONAL RRHH', 112, NULL, '15', 0.00, 0.00, 0.00, NULL, NULL, NULL, 'solicitudes/sol_44/cv_sol_44.docx', 4500.00, 7500.00, NULL, 'INDEPLO', 'REEMPLAZO POR BAJA', 1, 'CORPORATIVO 11', '', '2019-08-16', '09:00:00', 'Dar contrato con fecha efectiva de 16/08/2019', 'EMPLEADO CREADO', 'fer.gp0424@gmail.com', 45, 0, NULL, 2349, NULL, '2019-08-13 19:05:25', '2019-08-16 10:58:02', 3, 1, NULL);
INSERT INTO `solicitud_alta` VALUES (45, 'RAD', 'VARI', 'RE09', 'GEST', '103', 'JULIAN RUBEN ', 'CORONADO ', 'OLGUIN', 0, '2019-08-20', '2019-08-21', '27', '0', 0.00, 'MIXTO', 4, 1, '0', 1, '0', '', 0, '0', 0, '0', 0, '0', NULL, 59, '27', 0, 0.00, 0, '0', ' supervisar implica que tendrá que visitar sitios de ser necesario, aunque la mayor parte estará en oficinas Telmex coordinando el seguimiento y la atención de proyectos con los Contratistas. Así mismo, apoyara a actividades administrativas y de facT', 296, NULL, '26', 0.00, 0.00, 0.00, NULL, NULL, 'solicitudes/sol_45/vobo_sol_45.pdf', 'solicitudes/sol_45/cv_sol_45.doc', 5000.00, 13000.00, NULL, 'INDEPLO', 'Contacto constante y directo con ingeniería de TELMEX, Case TELMEX, para propiciar las asignaciones de servicios de demarcación con equipos RAD.', 1, 'Ciudad de Hermosillo, OFICINAS DEL CLIENTE', '', '2019-08-21', '11:00:00', 'Firma contrato vía remota, a las 11:00 hrs el 21 de agosto 2019, considerada misma fecha de ingreso', 'EMPLEADO CREADO', 'jrcorono@gmail.com', 761, 0, NULL, 2354, NULL, '2019-08-15 13:43:35', '2019-08-21 12:45:59', 3, 1, NULL);
INSERT INTO `solicitud_alta` VALUES (46, 'NOK', 'SERV', 'RE09', 'NOCT', '100', 'EDGAR GERARDO', 'RODRIGUEZ', 'DE PAZ', 1304, '2019-08-20', '2019-08-21', '25', 'NFF-SA-SM-T-002', 0.00, 'MIXTO', 2, 0, '0', 0, '0', NULL, 0, '0', 0, '0', 0, '0', NULL, 27, '27', 0, 0.00, 0, '0', 'NIVEL 0', 226, NULL, '15', 13200.00, 10911.00, 17.34, NULL, NULL, NULL, NULL, 4200.00, 3600.00, NULL, 'INDEPLO', 'SU P.M. OSCAR OLIVARES SOLICITO SU CONTRATACIÓN. ', 3, 'NOC DE TELEFÓNICA EN CUAUTITLAN ', '', '2019-08-21', '09:00:00', 'Dar contrato con fecha efectiva de 21/08/2019', 'EMPLEADO CREADO', 'xgsynyster@gmail.com', 799, 0, NULL, 2353, NULL, '2019-08-15 14:46:31', '2019-08-21 11:22:52', 3, 1, NULL);
INSERT INTO `solicitud_alta` VALUES (47, 'NOK', 'SERV', 'RE09', 'NOCT', '100', 'CESAR', 'CRUZ', 'SALAIS', 1305, '2019-08-20', '2019-08-21', '25', 'NFF-SA-SM-T-002', 0.00, 'MIXTO', 2, 0, '0', 0, '0', NULL, 0, '0', 0, '0', 0, '0', NULL, 27, '27', 0, 0.00, 0, '0', 'NIVEL 0', 226, NULL, '15', 13200.00, 10911.00, 17.34, NULL, NULL, NULL, NULL, 4200.00, 3600.00, NULL, 'INDEPLO', 'SU P.M. OSCAR OLIVARES SOLICITO LA CONTRATACIÓN. ', 3, 'NOC DE TELEFÓNICA CUAUTITLAN ', '', '2019-08-21', '09:00:00', 'Dar contrato con fecha efectiva de 21/08/2019', 'EMPLEADO CREADO', 'cesar_cs20@hotmail.com', 799, 0, NULL, 2352, NULL, '2019-08-15 14:50:08', '2019-08-21 10:44:45', 3, 1, NULL);
INSERT INTO `solicitud_alta` VALUES (48, 'NAE', 'REGI', 'RE04', 'ASIS', '100', 'ARLET', 'ALCOCER', 'HERRERA', 0, '2019-08-19', '2019-08-16', '6', '0', 0.00, 'MIXTO', 2, 1, '0', 1, '0', '', 0, '0', 1, '0', 0, '0', NULL, 60, '74', 0, 0.00, 0, '0', 'ADMINISTRAR LA INFORMACIÓN, EL DESARROLLO Y LAS EXPECTATIVAS DE CADA UNO DENTRO DEL ÁREA Y HACER LAS CORRECCIONES NECESARIAS PARA BENEFICIAR AL PROYECTO', 128, NULL, '19', 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, 5000.00, 7000.00, NULL, 'NAE', 'INCORPORACIóN A PROYECTO POR INCAPACIDAD POR MATERNIDAD DE ELDA ESMERALDA BANDALA OSORIO', 1, 'OFICINAS CLIENTE', '', '2019-08-19', '12:13:00', 'Dar contrato con fecha efectiva de 19/08/2019', 'EMPLEADO CREADO', 'arleth_ah@hotmail.com', 81, 0, NULL, 2351, NULL, '2019-08-15 17:56:57', '2019-08-16 13:37:04', 3, 1, NULL);
INSERT INTO `solicitud_alta` VALUES (49, 'NOK', 'SERV', 'RE09', 'NOCT', '100', 'MICHAEL ALEXANDER ', 'GAYTAN ', 'SIERRA', 1306, '2019-08-21', '2019-08-19', '25', 'NFF-SA-SM-T-002', 0.00, 'MIXTO', 2, 0, '0', 0, '0', NULL, 0, '0', 0, '0', 0, '0', NULL, 27, '27', 0, 0.00, 0, '0', 'NIVEL 0', 226, NULL, '15', 13200.00, 10911.00, 17.34, NULL, NULL, NULL, NULL, 4200.00, 3600.00, NULL, 'INDEPLO', 'SU L. M. OSCAR OLIVARES SOLICITO ESTA CONTRATACIÓN. ', 3, 'NOC TELEFÓNICA CUAUTITLAN ', '', NULL, NULL, NULL, NULL, NULL, 799, 0, NULL, NULL, 448, '2019-08-19 15:55:10', '2019-08-22 16:43:58', 3, 1, NULL);
INSERT INTO `solicitud_alta` VALUES (50, 'NOK', 'SERV', 'RE09', 'NOCA', '100', 'CRISTIAN B', 'MERCADO', 'VAZQUEZ', 1307, '2019-08-20', '2019-08-20', '40', 'NOC-ALTN-HELP-001', 0.00, 'MIXTO', 2, 0, '0', 0, '0', NULL, 0, '0', 0, '0', 0, '0', NULL, 27, '27', 0, 0.00, 0, '0', 'OPERADOR DE MESA DE AYUDA EN EL NOC DE ALTAN ', 226, NULL, '9', 21412.00, 16237.62, 24.17, NULL, NULL, 'solicitudes/sol_50/vobo_sol_50.pdf', NULL, 4200.00, 7500.00, NULL, 'INDEPLO', 'SOLICITUD DEL CLIENTE', 3, 'PUNTO POLANCO', 'CORREO ELECTRÓNICO , POR FAVOR QUE EL SERVICIO VAYA CON LA HERRAMIENTA COMPLETA', '2019-08-20', '09:30:00', 'Se presenta a contratación en oficinas mundo e, a las 9:30hrs el 20 de agosto, considerada misma fecha de ingreso', 'EMPLEADO CREADO', 'crissmerc@gmail.com', 44, 0, NULL, 1859, NULL, '2019-08-19 18:22:56', '2019-08-20 12:50:48', 3, 1, NULL);
INSERT INTO `solicitud_alta` VALUES (51, 'NOK', 'SERV', 'RE09', 'NOCA', '100', 'Uriel', 'Mendoza', 'Gonzalez', 1308, '2019-08-20', '2019-08-19', '40', 'NOC-ALTN-HELP-001', 0.00, 'MIXTO', 2, 0, '0', 0, '0', NULL, 0, '0', 0, '0', 0, '0', NULL, 27, '27', 0, 0.00, 0, '0', 'OPERADOR TELEFONICO ', 226, NULL, '9', 21412.00, 16237.62, 24.17, NULL, NULL, 'solicitudes/sol_51/vobo_sol_51.pdf', NULL, 4200.00, 7500.00, NULL, 'INDEPLO', 'SOLICITUD DEL CLIENTE ', 3, 'PUNTO POLANCO ', 'POR FAVOR ASEGURARSE DE QUE VAYA CON LA HERRAMIENTA COMPLETA', NULL, NULL, NULL, NULL, NULL, 44, 0, NULL, NULL, NULL, '2019-08-19 18:37:33', '2019-08-19 18:37:33', 3, 1, NULL);
INSERT INTO `solicitud_alta` VALUES (52, 'NOK', 'SERV', 'RE09', 'NOCA', '100', 'Ricardo', ' Aguilar ', 'RODRIGUEZ', 1309, '2019-08-22', '2019-08-22', '40', 'NOC-ALTN-HELP-001', 0.00, 'MIXTO', 2, 0, '0', 0, '0', NULL, 0, '0', 0, '0', 0, '0', NULL, 27, '27', 0, 0.00, 0, '0', 'OPERADOR TELEFÓNICO MESA DE AYUDA NOC ', 226, NULL, '9', 21412.00, 16273.62, 24.00, NULL, NULL, NULL, NULL, 4300.00, 7400.00, NULL, 'INDEPLO', 'SOLICITUD DEL CLIENTE', 3, 'PUNTO POLANCO', '', '2019-08-22', '09:30:00', 'Se presenta a firma de contrato en oficinas mundo e, a las 9:00hrs., e 22/08/2019 considerada misma fecha de ingreso', 'EMPLEADO CREADO', 'dracco52@hotmail.com', 44, 0, NULL, 1, NULL, '2019-08-22 03:16:14', '2019-08-22 12:40:37', 3, 1, NULL);
INSERT INTO `solicitud_alta` VALUES (53, 'RAD', 'VARI', 'RE09', 'GEST', '103', 'EVELYN ', 'GUERRERO', 'LOPEZ', 0, '2019-09-02', '2019-08-30', '20', '0', 0.00, 'MIXTO', 2, 1, '0', 1, '0', '', 0, '0', 0, '0', 0, '0', NULL, 60, '27', 0, 0.00, 0, '0', 'Planificación, control, coordinación y seguimiento de trabajos a realizar por contratistas.\r\nSeguimiento y control de las actividades realizada y puntos de acción\r\nGestión de las comunicaciones con cliente directo (RAD) y cliente final (Telmex) \r\nReport', 296, NULL, '15', 0.00, 0.00, 0.00, NULL, NULL, 'solicitudes/sol_53/vobo_sol_53.pdf', 'solicitudes/sol_53/cv_sol_53.pdf', 10000.00, 30000.00, NULL, 'INDEPLO', 'Generar, implementar y coordinar el proceso de administración de proyectos de sus proyectos asignados, mediante herramientas y procedimientos necesarios derivados de la detección de necesidades particulares del tipo de proyectos a ejecutar, de forma ', 1, 'OFICINAS CORPORATIVAS', '', '2019-09-02', '09:00:00', 'Dar contrato con fecha efectiva de 02/09/2019', 'EMPLEADO CREADO', 'eve_guerrero@hotmail.com', 761, 0, NULL, 2361, NULL, '2019-08-22 11:32:53', '2019-08-30 14:25:50', 3, 1, NULL);
INSERT INTO `solicitud_alta` VALUES (54, 'IND', 'ADFI', 'RE09', 'COMP', '100', 'LUIS ALBERTO', 'AQUINO', 'HERNANDEZ', 0, '2019-08-26', '2019-08-27', '6', '0', 0.00, 'MIXTO', 2, 1, '0', 1, '0', '', 0, '0', 0, '0', 0, '0', NULL, 27, '27', 0, 0.00, 0, '0', 'BUSQUEDA, NEGOCIACION Y EVALUACION DE PROVEEDORES Y CONTRATISTAS ', 231, NULL, '15', 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, 5000.00, 9000.00, NULL, 'INDEPLO', 'NECESIDAD DE APOYO EN EL AREA DE CONTRATISTAS', 1, 'ANTIGUO CAMINO A SANTA MONICA #11, JARDINES DE SANTA MONICA, TLALNEPANTLA DE BAZ, EDO DE MEXICO, 54050', '', '2019-08-26', '09:19:00', 'dar contrato con fecha efectiva 26/08/2019', 'EMPLEADO CREADO', 'luismu_4@hotmail.com', 250, 0, NULL, 2360, NULL, '2019-08-22 14:23:57', '2019-08-27 14:33:56', 3, 1, NULL);
INSERT INTO `solicitud_alta` VALUES (55, 'IND', 'ADFI', 'RE09', 'RRHH', '100', 'STEPHANIE NATALY', 'VAZQUEZ ', 'FLORES', 0, '2019-08-26', '2019-08-27', '3', '0', 0.00, 'MIXTO', 2, 1, '0', 1, '0', 'ASIGNAR MISMO EQUIPO DE COMPUTO DE MARIBEL ', 0, '0', 0, '0', 0, '0', NULL, 59, '27', 0, 0.00, 0, '0', 'RECURSOS HUMANOS', 112, NULL, '9', 0.00, 0.00, 0.00, NULL, NULL, 'solicitudes/sol_55/vobo_sol_55.JPG', 'solicitudes/sol_55/cv_sol_55.pdf', 4500.00, 3500.00, NULL, 'INDEPLO', 'REEMPLAZO MARIBEL RODRIGUEZ', 1, 'OFICINAS CORPORATIVAS', '', '2019-08-26', '09:00:00', 'DAR CONTRATO CON FECHA EFECTIVA DE FECHA EFECTIVA DE 26/08/2019', 'EMPLEADO CREADO', 'felix_ac2019@outlook.com', 448, 0, NULL, 2358, NULL, '2019-08-22 16:19:48', '2019-08-27 10:11:33', 3, 1, NULL);
INSERT INTO `solicitud_alta` VALUES (56, 'NAE', 'REGI', 'RE08', 'RSUP', '100', 'VALENTÍN', 'VÁSQUEZ', 'ARAGÓN', 0, '2019-08-27', '2019-08-23', '29', '0', 0.00, 'MIXTO', 5, 1, '0', 1, '0', '', 1, '0', 1, '0', 0, '0', NULL, 61, '74', 1, 6.00, 0, '0', 'GESTIÓN DE DESPLIEGUE DE RED', 275, NULL, '31', 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, 5000.00, 13000.00, NULL, 'NAE', 'INCORPORACIÓN A PROYECTO POR BAJA DE GERARDO FRANCISCO RUIZ SALAZAR', 1, 'OFICINA CLIENTE', '', '2019-08-27', '10:00:00', 'Se presenta a firma de contrato en oficinas mundo e, a las 10:hrs el 27 de agosto 2019, considerada misma fecha de ingreso', 'EMPLEADO CREADO', 'valentin190293@gmail.com', 81, 0, NULL, 2356, NULL, '2019-08-22 18:06:35', '2019-08-23 09:31:04', 3, 1, NULL);
INSERT INTO `solicitud_alta` VALUES (57, 'NOK', 'SERV', 'RE09', 'NOCT', '100', ' Felix', ' Arreola ', 'Cruz', 1310, '2019-08-23', '2019-08-22', '25', 'NOC-TELF-ADMI-001', 0.00, 'MIXTO', 2, 0, '0', 0, '0', NULL, 0, '0', 0, '0', 0, '0', NULL, 27, '27', 0, 0.00, 0, '0', 'SERVICE DESK', 226, NULL, '15', 13200.00, 6773.33, 48.69, NULL, NULL, 'solicitudes/sol_57/vobo_sol_57.pdf', 'solicitudes/sol_57/cv_sol_57.pdf', 4200.00, 3600.00, NULL, NULL, 'SOLICITUD DEL CLIENTE', 3, 'NOKIA CUAUTITLAN ', '', NULL, NULL, NULL, NULL, NULL, 44, 0, NULL, NULL, 719, '2019-08-22 18:37:26', '2019-08-23 14:52:17', 3, 0, NULL);
INSERT INTO `solicitud_alta` VALUES (58, 'NOK', 'SERV', 'RE09', 'NOCT', '100', ' KAREN SELENE', 'FRANCO', 'OCHOA ', 1311, '2019-08-27', '2019-08-27', '3', 'NOC-TELF-ADMI-001', 0.00, 'MIXTO', 2, 0, '0', 0, '0', NULL, 0, '0', 0, '0', 0, '0', NULL, 27, '27', 0, 0.00, 0, '0', 'SERVICE DESK', 226, NULL, '15', 13200.00, 10911.00, 17.34, NULL, NULL, 'solicitudes/sol_58/vobo_sol_58.pdf', 'solicitudes/sol_58/cv_sol_58.docx', 4200.00, 3600.00, NULL, NULL, 'SOLICITUD DEL CLIENTE', 3, 'NOKIA CUATITLAN ', '', '2019-08-27', '09:00:00', 'dar contrato con fecha efectiva de 27/08/2019', 'EMPLEADO CREADO', 'peggy.ksfo@outlook.es', 44, 0, NULL, 2359, NULL, '2019-08-22 18:40:30', '2019-08-27 10:20:38', 3, 0, NULL);
INSERT INTO `solicitud_alta` VALUES (59, 'PIL', 'VARI', 'RE09', 'FIOP', '103', 'JOSUE GABRIEL ', 'SOSA', 'CHAIRES', 0, '2019-08-26', '2019-08-26', '33', '0', 0.00, 'MIXTO', 4, 1, '0', 1, '0', '', 0, '0', 0, '0', 0, '0', NULL, 60, '27', 0, 0.00, 0, '0', 'Planificación, control, coordinación y seguimiento de trabajos a realizar por contratistas.\r\nSeguimiento y control de las actividades realizada y puntos de acción\r\nGestión de las comunicaciones con cliente directo y cliente final \r\nReporting oportuno', 214, NULL, '19', 0.00, 0.00, 0.00, NULL, NULL, 'solicitudes/sol_59/vobo_sol_59.pdf', 'solicitudes/sol_59/cv_sol_59.pdf', 10000.00, 25000.00, NULL, 'INDEPLO', 'ATRAER CLIENTES EN PROYECTOS DE FIBRA OPTICA Y PLANTA EXTERNA', 1, 'MONTERREY, N.L.', '', '2019-08-26', '12:24:00', 'DAR CONTRATO CON FECHA EFECTIVA DE 26/08/2019', 'EMPLEADO CREADO', 'josue.g.sosa@gmail.com', 761, 0, NULL, 2357, NULL, '2019-08-23 14:13:47', '2019-08-26 12:56:30', 3, 1, NULL);
INSERT INTO `solicitud_alta` VALUES (60, 'NOK', 'SERV', 'RE09', 'NOCT', '100', 'CECILIA ', 'HERNANDEZ ', 'SARABIA', 1312, '2019-09-02', '2019-09-02', '25', 'NFF-SA-SM-T-002', 0.00, 'MIXTO', 2, 0, '0', 0, '0', NULL, 0, '0', 0, '0', 0, '0', NULL, 27, '27', 0, 0.00, 0, '0', 'NIVEL 0', 226, NULL, '15', 13200.00, 10911.00, 17.34, NULL, NULL, NULL, NULL, 4200.00, 3600.00, NULL, 'INDEPLO', 'SOLICITÓ SU CONTRATACIÓN SU L.M. OSCAR OLIVARES', 3, 'NOC DE TELEFÓNICA CUAUTITLAN ', '', '2019-09-02', '09:00:00', 'Dar contrato con fecha efectiva de 02/09/2019', 'EMPLEADO CREADO', 'chsielectronica@gmail.com', 799, 0, NULL, 2362, NULL, '2019-08-29 10:49:38', '2019-09-02 11:24:41', 3, 1, NULL);
INSERT INTO `solicitud_alta` VALUES (61, 'NOK', 'TKBS', 'RE09', 'POOL', '100', 'MARIANA', 'MENDOZA', 'RAMIREZ', 1313, '2019-09-02', '2019-09-03', '25', NULL, 20200.00, 'MIXTO', 2, 1, '0', 1, '0', '', 0, '0', 0, '0', 0, '0', NULL, 60, '27', 0, 0.00, 0, '0', 'ADMINISTRACIO DEL ICEO', 226, NULL, '15', 20200.00, 12026.00, 40.47, NULL, NULL, NULL, NULL, 4200.00, 3800.00, NULL, 'INDEPLO', 'SU L.M. MOISES CRUZ SOLICITÓ SU CONTRATACIÓN', 2, 'EN TELCEL CARSO, POLANCO', '', '2019-09-03', '12:00:00', 'Dar contrato con fecha efectiva de 03/09/19', 'EMPLEADO CREADO', 'marianalpcc17@gmail.com', 799, 0, NULL, 2368, NULL, '2019-08-30 10:13:44', '2019-09-03 16:09:18', 3, 1, NULL);
INSERT INTO `solicitud_alta` VALUES (62, 'RAD', 'VARI', 'RE09', 'GEST', '103', 'Yuridia Lizbeht', ' Segundo ', 'Mendoza ', 0, '2019-09-02', '2019-08-30', '25', '0', 0.00, 'MIXTO', 1, 1, '0', 1, '0', '', 0, '0', 0, '0', 0, '0', NULL, 59, '27', 0, 0.00, 0, '0', 'Regularizar facturación y pago a contratistas\r\nConcentrar información de compras en seguimiento de pagos\r\nTrato con proveedores de diversos servicios relacionados con el área o bien la empresa\r\nCoordinar, controlar y capturar reportes de gastos.', 296, NULL, '15', 0.00, 0.00, 0.00, NULL, NULL, 'solicitudes/sol_62/vobo_sol_62.pdf', 'solicitudes/sol_62/cv_sol_62.pdf', 4200.00, 2800.00, NULL, 'INDEPLO', 'Realizar de manera oportuna y correcta el proceso de facturación y obtención de órdenes de compra específicamente para el proyecto RAD, proporcionando el seguimiento efectivo. Asegurando que los documentos y soportes vayan debidamente documentados. G', 1, 'OFICINAS ONCE CORPORATIVO ', '', '2019-09-02', '09:00:00', 'Dar contrato con fecha efectiva de 02 Sep 2019', 'PENDIENTE', 'yuridia.segundo@gmail.com', 761, 0, NULL, NULL, 45, '2019-08-30 10:30:34', '2019-09-04 16:41:15', 3, 1, NULL);
INSERT INTO `solicitud_alta` VALUES (63, 'ALT', 'SERV', 'RE09', 'NOCA', '100', 'Lesli Abril ', 'Martinez ', 'Perez', 1314, '2019-09-02', '2019-09-03', '40', 'ALT-SERV-HPDS-001', 0.00, 'MIXTO', 2, 0, '0', 0, '0', NULL, 0, '0', 0, '0', 0, '0', NULL, 27, '27', 0, 0.00, 0, '0', 'HELP DESK', 226, NULL, '9', 23386.63, 15284.60, 34.64, 'solicitudes/sol_63/cotizacion_sol_63.xlsx', NULL, 'solicitudes/sol_63/vobo_sol_63.pdf', 'solicitudes/sol_63/cv_sol_63.docx', 4000.00, 7000.00, NULL, 'INDEPLO', 'SOLICITUD DEL CLIENTE', 3, 'PUNTO POLANCO', '', '2019-09-02', '09:12:00', 'dar contrato con fecha efectiva 02/09/19', 'EMPLEADO CREADO', 'martinezabril21@outlook.com', 44, 0, NULL, 1900, NULL, '2019-09-01 22:58:32', '2019-09-03 12:09:16', 1, 1, NULL);
INSERT INTO `solicitud_alta` VALUES (64, 'ALT', 'SERV', 'RE09', 'NOCA', '100', 'HUGO ', 'CATAñEDA', '', 1315, '2019-09-02', '2019-09-03', '3', 'ALT-NOC-TIR2-001', 0.00, 'MIXTO', 2, 0, '0', 0, '0', NULL, 0, '0', 0, '0', 0, '0', NULL, 27, '27', 0, 0.00, 0, '0', 'TIER 2', 226, NULL, '9', 45616.94, 30724.40, 32.65, 'solicitudes/sol_64/cotizacion_sol_64.xlsx', NULL, 'solicitudes/sol_64/vobo_sol_64.pdf', 'solicitudes/sol_64/cv_sol_64.pdf', 8000.00, 14000.00, NULL, 'INDEPLO', 'SOLICITUD DEL CLIENTE', 3, 'PUNTO POLANCO', '', '2019-09-02', '09:00:00', 'Firma contrato en oficinas Punto Polanco a las 9:00hr., el 02 de septiembre, considerada misma fecha de ingreso.', 'EMPLEADO CREADO', 'castaha22@hotmail.com', 44, 0, NULL, 2367, NULL, '2019-09-01 23:07:49', '2019-09-03 12:24:48', 1, 1, NULL);
INSERT INTO `solicitud_alta` VALUES (65, 'NAE', 'REGI', 'RE09', 'RSUP', '100', 'JESUS', 'GARCIA', 'TREJO', 0, '2019-09-03', '2019-09-03', '29', '0', 0.00, 'MIXTO', 5, 1, '0', 1, '0', '', 1, '0', 1, '0', 0, '0', NULL, 61, '74', 1, 6.00, 0, '0', 'SUPERVISAR LAS INSTALACIONES DE ACUERDO A LOS ESTÁNDARES DE CALIDAD DEL CLIENTE', 215, NULL, '9', 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, 5000.00, 15000.00, NULL, 'NAE', 'INCORPORACIÓN A PROYECTO POR BAJA VOLUNTARIA DE IVAN CORTES PEREZ', 1, 'OFICINA CLIENTE', '', '2019-09-03', '09:00:00', 'Se presenta a firma de contrato en oficinas mundo e, a las 9:00 hrs., el 03 de septiembre 2019, considerada misma fecha de ingreso', 'EMPLEADO CREADO', 'jesus.garcia.yesi@gmail.com', 81, 0, NULL, 1452, NULL, '2019-09-02 18:34:46', '2019-09-03 10:41:10', 3, 1, NULL);
INSERT INTO `solicitud_alta` VALUES (66, 'NOK', 'SERV', 'RE09', 'NOCT', '100', 'Daniela Mayrin', 'Victoriano ', 'Hernandez', 1316, '2019-09-04', '2019-09-04', '25', 'NFF-SA-SM-T-002', 0.00, 'MIXTO', 2, 0, '0', 0, '0', NULL, 0, '0', 0, '0', 0, '0', NULL, 27, '27', 0, 0.00, 0, '0', 'NIVEL 0', 226, NULL, '15', 13200.00, 10911.00, 17.34, NULL, NULL, NULL, NULL, 4200.00, 3600.00, NULL, 'INDEPLO', 'SU L.M. OSCAR OLIVARES SOLICITA LA CONTRATACIÓN DE ESTE RECURSO.', 3, 'NOC DE TELEFÓNICA CUAUTITLAN ', '', '2019-09-04', '09:00:00', 'Dar contrato con fecha efectiva de 04/09/2019', 'EMPLEADO CREADO', 'mayrin_26-06@hotmail.com', 799, 0, NULL, 2369, NULL, '2019-09-03 09:02:39', '2019-09-04 12:33:17', 3, 1, NULL);
INSERT INTO `solicitud_alta` VALUES (67, 'NOK', 'SERV', 'RE09', 'NOCT', '100', 'ERICK ULISES ', 'CHAGOLLA ', 'VELAZQUEZ', 1317, '2019-09-09', '2019-09-03', '25', 'NFF-SA-SM-T-002', 0.00, 'MIXTO', 2, 0, '0', 0, '0', NULL, 0, '0', 0, '0', 0, '0', NULL, 27, '27', 0, 0.00, 0, '0', 'NIVEL 0', 226, NULL, '15', 13200.00, 10911.00, 17.34, NULL, NULL, NULL, NULL, 4200.00, 3600.00, NULL, 'INDEPLO', 'SU L.M. OSCAR OLIVARES SOLICITÓ SU CONTRATACIÓN ', 3, 'NOC DE TELEFÓNICA EN CUAUTITLAN ', '', NULL, NULL, NULL, NULL, NULL, 799, 0, NULL, NULL, NULL, '2019-09-03 11:37:34', '2019-09-03 11:37:34', 3, 1, NULL);
INSERT INTO `solicitud_alta` VALUES (68, 'RAD', 'VARI', 'RE09', 'GEST', '103', 'DIANA KAREN', 'MORALES', 'PÉREZ', 0, '2019-09-05', '2019-09-04', '3', '0', 0.00, 'MIXTO', 2, 1, '0', 1, '0', '', 0, '0', 0, '0', 0, '0', NULL, 59, '27', 0, 0.00, 0, '0', ' REVISION Y VALIDACION DE PAGO A CONTRATISTAS, REPORTE SEMANAL DE FACTURACION. CARGA DE INFORMACION FINANCIERA DE CADA SITIO EJECUTADO A LA HERRAMIENTA SUPERVISION REMOTA, CON JORNADA LABORAL DE 8 AM - 15 HRS', 296, NULL, '15', 0.00, 0.00, 0.00, NULL, NULL, 'solicitudes/sol_68/vobo_sol_68.pdf', 'solicitudes/sol_68/cv_sol_68.pdf', 4200.00, 2800.00, NULL, 'INDEPLO', 'APOYO ADMINISTRATIVO EN OBTENCION DE OC DEL CLIENTE, REVISION Y VALIDACION DE PAGO A CONTRATISTAS, REPORTE SEMANAL DE FACTURACION. CARGA DE INFORMACION FINANCIERA DE CADA SITIO EJECUTADO A LA HERRAMIENTA SUPERVISION REMOTA', 1, 'OFICINAS CORPORATIVAS ', '', NULL, NULL, NULL, NULL, NULL, 761, 0, NULL, NULL, NULL, '2019-09-04 19:56:33', '2019-09-04 19:56:33', 3, 1, NULL);

-- ----------------------------
-- Table structure for solicitud_alta_comentarios
-- ----------------------------
DROP TABLE IF EXISTS `solicitud_alta_comentarios`;
CREATE TABLE `solicitud_alta_comentarios`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_solicitud` int(10) NOT NULL,
  `tipo` enum('COMPUTO','AUTO','ALMACEN','HERRAMIENTA') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `comentario` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for solicitudes_altas_auth
-- ----------------------------
DROP TABLE IF EXISTS `solicitudes_altas_auth`;
CREATE TABLE `solicitudes_altas_auth`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_solicitud` int(11) NULL DEFAULT NULL,
  `auth_entregables` datetime(0) NULL DEFAULT NULL,
  `entregables_user_id` int(11) NULL DEFAULT NULL,
  `auth_direccion` datetime(0) NULL DEFAULT NULL,
  `id_dir_user` int(11) NULL DEFAULT NULL,
  `auth_rh` datetime(0) NULL DEFAULT NULL,
  `id_user_rh` int(11) NULL DEFAULT NULL,
  `contrato_firmado` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `alta` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `computadora` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'X',
  `coche` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'X',
  `celular` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'X',
  `herramientas_almacen` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'X',
  `solicitante` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `obs_compu` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `obs_auto` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `obs_herra` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email_nae` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `listo_cita` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `obs_celular` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 70 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of solicitudes_altas_auth
-- ----------------------------
INSERT INTO `solicitudes_altas_auth` VALUES (1, 1, '2019-07-12 10:12:51', NULL, '2019-07-12 10:12:51', 117, '2019-07-12 10:59:42', 517, NULL, 'OK', 'OK', 'X', 'OK', 'X', NULL, 'Se entrega equipo en perfecto estado y se sube responsiva a incore.', NULL, NULL, 'orodf@naemexico.com', 'ok', 'SE ASIGNA EQUIPO BAM,TAG,EFECTICARD,CELULAR', '2019-07-08 12:50:22', '2019-07-16 17:04:13');
INSERT INTO `solicitudes_altas_auth` VALUES (2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'X', 'X', 'X', 'X', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-07-09 12:59:37', '2019-07-09 12:59:37');
INSERT INTO `solicitudes_altas_auth` VALUES (3, 2, '2019-07-29 10:36:51', NULL, '2019-07-29 10:36:51', 117, '2019-07-29 12:31:40', 448, NULL, 'OK', 'X', 'X', 'OK', 'X', NULL, NULL, NULL, NULL, NULL, 'ok', '', '2019-07-10 16:30:04', '2019-07-29 13:00:37');
INSERT INTO `solicitudes_altas_auth` VALUES (4, 3, '2019-07-15 16:35:54', NULL, '2019-07-15 16:35:54', 86, '2019-07-15 16:44:50', 719, NULL, 'OK', 'X', 'X', 'X', 'X', NULL, NULL, NULL, NULL, NULL, 'ok', NULL, '2019-07-12 09:07:58', '2019-07-16 11:38:31');
INSERT INTO `solicitudes_altas_auth` VALUES (5, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'X', 'X', 'X', 'X', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-07-12 09:15:05', '2019-07-12 09:15:05');
INSERT INTO `solicitudes_altas_auth` VALUES (6, 5, '2019-07-15 18:34:40', NULL, '2019-07-15 18:34:40', 86, '2019-07-15 18:38:46', 719, NULL, 'OK', 'OK', 'X', 'OK', 'X', NULL, 'EQUIPO ENTREGADO 5CG7192GWS', NULL, NULL, 'NO TIENE CORREO INDEPLO', 'ok', '', '2019-07-15 16:45:16', '2019-07-19 11:07:42');
INSERT INTO `solicitudes_altas_auth` VALUES (7, 6, '2019-07-15 17:13:42', NULL, '2019-07-15 17:13:42', 117, '2019-07-16 13:25:54', 719, NULL, 'OK', 'OK', 'X', 'OK', 'X', NULL, 'se entrega equipo nuevo', NULL, NULL, 'gabriela.alcantara@indeplo.com', 'ok', 'Se entrega equipo nuevo', '2019-07-15 16:55:54', '2019-09-04 10:39:09');
INSERT INTO `solicitudes_altas_auth` VALUES (8, 7, '2019-07-15 18:38:18', NULL, '2019-07-15 18:38:18', 86, '2019-07-16 13:24:47', 719, NULL, 'OK', 'OK', 'X', 'OK', 'X', NULL, 'Se entrega equipo con capacidad imagen nokia', NULL, NULL, 'n/a', 'ok', 'Se entrega equipo de uso en buen estado', '2019-07-15 17:13:17', '2019-07-22 17:32:40');
INSERT INTO `solicitudes_altas_auth` VALUES (9, 8, '2019-07-15 18:37:31', NULL, '2019-07-15 18:37:31', 86, '2019-07-16 13:22:53', 719, NULL, 'OK', 'OK', 'X', 'OK', 'X', NULL, 'se entrega equipo nuevo con capacidad imagen Nokia', NULL, NULL, 'n/a', 'ok', 'Se asigna equipo de uso', '2019-07-15 17:21:41', '2019-07-22 17:31:53');
INSERT INTO `solicitudes_altas_auth` VALUES (10, 9, '2019-07-15 18:37:08', NULL, '2019-07-15 18:37:08', 86, '2019-07-16 13:21:46', 719, NULL, 'OK', 'OK', 'X', 'OK', 'X', NULL, 'se entrega equipo nuevo con soporte imagen nokia', NULL, NULL, 'n/a', 'ok', 'Se asigna equipo de uso', '2019-07-15 17:31:55', '2019-07-22 17:31:07');
INSERT INTO `solicitudes_altas_auth` VALUES (11, 10, '2019-07-15 18:37:03', NULL, '2019-07-15 18:37:03', 86, '2019-07-16 13:18:49', 719, NULL, 'OK', 'OK', 'X', 'OK', 'X', NULL, '', NULL, NULL, 'N/A', 'ok', 'Se entrega equipo nuevo.', '2019-07-15 17:59:08', '2019-07-22 17:30:33');
INSERT INTO `solicitudes_altas_auth` VALUES (12, 11, '2019-07-15 18:36:50', NULL, '2019-07-15 18:36:50', 86, '2019-07-16 13:17:31', 719, NULL, 'OK', 'OK', 'X', 'OK', 'X', NULL, 'se entrega equipo nuevo con soporte imagen nokia', NULL, NULL, 'no tiene correo indeplo', 'ok', 'Se entrega equipo nuevo.', '2019-07-15 18:02:20', '2019-07-22 17:30:06');
INSERT INTO `solicitudes_altas_auth` VALUES (13, 12, '2019-07-19 17:45:41', NULL, '2019-07-19 17:45:41', 117, '2019-07-19 18:23:07', 517, NULL, 'OK', 'X', 'X', 'X', 'X', NULL, NULL, NULL, NULL, NULL, 'ok', NULL, '2019-07-19 09:56:54', '2019-07-24 14:20:20');
INSERT INTO `solicitudes_altas_auth` VALUES (14, 13, '2019-07-19 10:20:00', NULL, '2019-07-19 10:20:00', 706, '2019-07-19 14:33:22', 448, NULL, 'OK', 'OK', 'X', 'X', 'X', NULL, 'Se entrega equipo de computo sin software, ya que todo el software sera cargado por parte del área de Desarrollo.', NULL, NULL, 'alexis.gonzalez@indeplo.com', 'ok', NULL, '2019-07-19 10:18:30', '2019-07-22 12:55:38');
INSERT INTO `solicitudes_altas_auth` VALUES (15, 14, '2019-07-19 15:10:34', NULL, '2019-07-19 15:10:34', 86, '2019-07-19 17:18:57', 719, NULL, 'OK', 'X', 'X', 'X', 'X', NULL, NULL, NULL, NULL, NULL, 'ok', NULL, '2019-07-19 14:05:10', '2019-07-22 11:54:51');
INSERT INTO `solicitudes_altas_auth` VALUES (16, 15, '2019-07-19 15:10:18', NULL, '2019-07-19 15:10:18', 86, '2019-07-19 17:22:40', 719, NULL, 'OK', 'X', 'X', 'X', 'X', NULL, NULL, NULL, NULL, NULL, 'ok', NULL, '2019-07-19 14:09:12', '2019-07-22 11:03:27');
INSERT INTO `solicitudes_altas_auth` VALUES (17, 16, '2019-07-19 15:10:08', NULL, '2019-07-19 15:10:08', 86, '2019-07-19 17:24:10', 719, NULL, 'OK', 'X', 'X', 'X', 'X', NULL, NULL, NULL, NULL, NULL, 'ok', NULL, '2019-07-19 14:14:08', '2019-07-22 10:56:38');
INSERT INTO `solicitudes_altas_auth` VALUES (18, 17, '2019-07-19 15:09:53', NULL, '2019-07-19 15:09:53', 86, '2019-07-19 17:25:44', 719, 'OK', 'OK', 'X', 'X', 'X', 'X', NULL, NULL, NULL, NULL, NULL, 'ok', NULL, '2019-07-19 14:17:20', '2019-07-24 10:06:11');
INSERT INTO `solicitudes_altas_auth` VALUES (19, 18, '2019-07-19 15:13:06', NULL, '2019-07-19 15:13:06', 86, '2019-07-19 17:29:44', 719, 'OK', 'OK', 'X', 'X', 'X', 'X', NULL, NULL, NULL, NULL, NULL, 'ok', NULL, '2019-07-19 14:55:18', '2019-07-24 10:05:53');
INSERT INTO `solicitudes_altas_auth` VALUES (20, 19, '2019-07-26 15:45:48', NULL, '2019-07-26 15:45:48', 232, '2019-07-26 16:23:54', 719, NULL, 'OK', 'X', 'X', 'OK', 'X', NULL, NULL, NULL, NULL, NULL, 'ok', '', '2019-07-26 13:02:32', '2019-07-29 11:14:12');
INSERT INTO `solicitudes_altas_auth` VALUES (21, 20, '2019-07-30 11:24:00', NULL, '2019-07-30 11:24:00', 86, '2019-07-30 11:35:23', 719, NULL, 'OK', 'X', 'X', 'X', 'X', NULL, NULL, NULL, NULL, NULL, 'ok', NULL, '2019-07-30 08:53:42', '2019-07-30 13:07:05');
INSERT INTO `solicitudes_altas_auth` VALUES (22, 21, '2019-07-30 18:12:03', NULL, '2019-07-30 18:12:03', 232, '2019-07-30 18:15:41', 719, NULL, 'OK', 'X', 'X', 'X', 'X', NULL, NULL, NULL, NULL, NULL, 'ok', NULL, '2019-07-30 10:15:11', '2019-07-31 09:13:50');
INSERT INTO `solicitudes_altas_auth` VALUES (23, 22, '2019-07-31 10:38:32', NULL, '2019-07-31 10:38:32', 117, '2019-07-31 17:51:26', 719, NULL, 'OK', 'X', 'X', 'X', 'X', NULL, NULL, NULL, NULL, NULL, 'ok', NULL, '2019-07-30 13:10:03', '2019-08-01 12:18:08');
INSERT INTO `solicitudes_altas_auth` VALUES (24, 23, '2019-07-31 14:31:40', NULL, '2019-07-31 14:31:40', 232, '2019-08-02 11:54:36', 719, NULL, 'OK', 'X', 'X', 'OK', 'X', NULL, NULL, NULL, NULL, NULL, 'ok', '', '2019-07-31 11:13:05', '2019-08-14 10:14:31');
INSERT INTO `solicitudes_altas_auth` VALUES (25, 24, '2019-07-31 19:01:06', NULL, '2019-07-31 19:01:06', 117, '2019-08-01 09:13:59', 517, NULL, 'OK', 'OK', 'X', 'OK', 'X', NULL, '', NULL, NULL, 'sebastian.rocha@naemexico.com', 'ok', 'Se entrega equipo', '2019-07-31 17:03:12', '2019-09-03 17:16:57');
INSERT INTO `solicitudes_altas_auth` VALUES (26, 25, '2019-07-31 20:21:08', NULL, '2019-07-31 20:21:08', 86, '2019-08-01 08:56:43', 719, NULL, 'OK', 'X', 'X', 'OK', 'X', NULL, NULL, NULL, NULL, NULL, 'ok', 'se asigna equipo', '2019-07-31 18:54:49', '2019-08-06 12:39:31');
INSERT INTO `solicitudes_altas_auth` VALUES (27, 26, '2019-07-31 20:20:36', NULL, '2019-07-31 20:20:36', 86, '2019-08-01 08:53:59', 719, NULL, 'OK', 'OK', 'X', 'OK', 'X', NULL, '', NULL, NULL, 'geraldine.delira@indeplo.com', 'ok', 'se asigna equipo', '2019-07-31 19:04:45', '2019-08-06 18:21:45');
INSERT INTO `solicitudes_altas_auth` VALUES (28, 27, '2019-07-31 20:20:07', NULL, '2019-07-31 20:20:07', 86, '2019-08-01 08:55:15', 719, NULL, 'OK', 'OK', 'X', 'OK', 'X', NULL, 'se entrega equipo normal ', NULL, NULL, 'iris.alvarez@indeplo.com', 'ok', 'se asigna equipo', '2019-07-31 19:13:40', '2019-08-05 14:07:28');
INSERT INTO `solicitudes_altas_auth` VALUES (29, 28, '2019-08-05 09:18:42', NULL, '2019-08-05 09:18:42', 86, '2019-08-05 09:22:38', 719, NULL, 'OK', 'OK', 'X', 'OK', 'X', NULL, '', NULL, NULL, 'pablo.serrano@indeplo.com', 'ok', 'SE ENTREGÓ EQUIPO', '2019-08-01 18:55:01', '2019-08-08 17:04:54');
INSERT INTO `solicitudes_altas_auth` VALUES (30, 29, '2019-08-05 09:18:09', NULL, '2019-08-05 09:18:09', 86, '2019-08-05 09:20:56', 719, NULL, 'OK', 'OK', 'X', 'OK', 'X', NULL, '', NULL, NULL, 'gerardo.alanis@indeplo.com', 'ok', 'se hace entrega de equipo', '2019-08-01 18:59:20', '2019-08-06 18:22:57');
INSERT INTO `solicitudes_altas_auth` VALUES (31, 30, '2019-08-05 09:17:39', NULL, '2019-08-05 09:17:39', 86, '2019-08-05 09:21:49', 719, NULL, 'OK', 'OK', 'X', 'OK', 'X', NULL, '', NULL, NULL, 'lucia.moreno@indeplo.com', 'ok', 'se hace entrega de equipo', '2019-08-03 10:00:34', '2019-08-06 18:23:39');
INSERT INTO `solicitudes_altas_auth` VALUES (32, 31, '2019-08-05 12:27:29', NULL, '2019-08-05 12:27:29', 117, '2019-08-05 12:38:02', 517, NULL, 'OK', 'X', 'X', 'OK', 'X', NULL, NULL, NULL, NULL, NULL, 'ok', 'no se entrega equipo', '2019-08-05 11:47:54', '2019-08-08 09:53:37');
INSERT INTO `solicitudes_altas_auth` VALUES (33, 32, '2019-08-07 13:45:22', NULL, '2019-08-07 13:45:22', 117, '2019-08-08 19:00:11', 719, NULL, 'OK', 'X', 'X', 'X', 'X', NULL, NULL, NULL, NULL, NULL, 'ok', NULL, '2019-08-07 09:48:52', '2019-08-09 10:07:31');
INSERT INTO `solicitudes_altas_auth` VALUES (34, 33, '2019-08-07 13:45:55', NULL, '2019-08-07 13:45:55', 117, NULL, NULL, NULL, NULL, 'X', 'X', 'X', 'X', NULL, NULL, NULL, NULL, NULL, 'cita', NULL, '2019-08-07 09:56:51', '2019-08-07 13:45:55');
INSERT INTO `solicitudes_altas_auth` VALUES (35, 34, '2019-08-07 13:46:00', NULL, '2019-08-07 13:46:00', 117, '2019-08-08 19:00:43', 719, NULL, NULL, 'X', 'X', 'X', 'X', NULL, NULL, NULL, NULL, NULL, 'ok', NULL, '2019-08-07 09:59:12', '2019-08-08 19:00:43');
INSERT INTO `solicitudes_altas_auth` VALUES (38, 37, '2019-08-07 14:32:14', NULL, '2019-08-07 14:32:14', 232, '2019-08-07 14:41:46', 517, NULL, 'OK', 'OK', 'X', 'OK', 'X', NULL, 'Se envía equipo por DHL con ayuda de raul nava, se sube hoja de envió a one drive.', NULL, NULL, 'miguel.banda@indeplo.com', 'ok', 'Se entrega equipo a Raul Nava para envió.', '2019-08-07 13:59:01', '2019-08-19 10:52:50');
INSERT INTO `solicitudes_altas_auth` VALUES (39, 38, '2019-08-09 11:45:17', NULL, '2019-08-09 11:45:17', 117, '2019-08-09 12:19:32', 517, NULL, 'OK', 'OK', 'X', 'OK', 'X', NULL, 'Tiene correo NAE, se entrega equipo con mochila', NULL, NULL, 'mmad1@naemexico.com', 'ok', 'Se entregan  BAM/Celular', '2019-08-08 16:37:40', '2019-08-12 18:56:16');
INSERT INTO `solicitudes_altas_auth` VALUES (40, 39, '2019-08-09 09:48:54', NULL, '2019-08-09 09:48:54', 706, '2019-08-15 09:43:25', 448, NULL, 'OK', 'OK', 'X', 'OK', 'X', NULL, 'Se entrega equipo anterior de Isaac', NULL, NULL, 'estephany.sanchez@indeplo.com', 'ok', 'se asigna equipo celular', '2019-08-09 09:47:56', '2019-08-16 11:52:50');
INSERT INTO `solicitudes_altas_auth` VALUES (41, 40, '2019-08-22 18:10:38', NULL, '2019-08-22 18:10:38', 86, '2019-08-22 18:25:01', 719, NULL, 'OK', 'OK', 'X', 'OK', 'X', NULL, '', NULL, NULL, 'ivan.prieto@indeplo.com', 'ok', 'se entrega equipo', '2019-08-09 13:33:13', '2019-09-04 10:58:06');
INSERT INTO `solicitudes_altas_auth` VALUES (42, 41, '2019-08-12 11:45:03', NULL, '2019-08-12 11:45:03', 86, '2019-08-12 11:48:40', 517, NULL, 'OK', 'X', 'X', 'OK', 'X', NULL, NULL, NULL, NULL, NULL, 'ok', 'Se asigna equipo', '2019-08-12 11:23:15', '2019-08-12 14:05:22');
INSERT INTO `solicitudes_altas_auth` VALUES (43, 42, '2019-08-12 19:30:26', NULL, '2019-08-12 19:30:26', 86, '2019-08-13 11:29:19', 719, NULL, 'OK', 'X', 'X', 'X', 'X', NULL, NULL, NULL, NULL, NULL, 'ok', NULL, '2019-08-12 11:24:17', '2019-08-14 13:57:09');
INSERT INTO `solicitudes_altas_auth` VALUES (44, 43, '2019-08-13 18:52:14', NULL, '2019-08-13 18:52:14', 232, '2019-08-13 18:57:28', 719, NULL, 'OK', 'OK', 'X', 'OK', 'X', NULL, '', NULL, NULL, 'jose.vergara@indeplo.com', 'ok', 'SE ENTREGA EQUIPO', '2019-08-12 13:27:03', '2019-08-14 16:47:49');
INSERT INTO `solicitudes_altas_auth` VALUES (45, 44, '2019-08-14 14:11:47', NULL, '2019-08-14 14:11:47', 117, '2019-08-14 15:34:56', 719, NULL, 'OK', 'OK', 'X', 'X', 'X', NULL, 'Se entrega laptop de Manuel.', NULL, NULL, 'mariaf.garcia@indeplo.com', 'ok', NULL, '2019-08-13 19:05:25', '2019-08-16 11:45:36');
INSERT INTO `solicitudes_altas_auth` VALUES (46, 45, '2019-08-15 13:47:45', NULL, '2019-08-15 13:47:45', 232, '2019-08-21 09:41:40', 517, NULL, 'OK', 'OK', 'X', 'OK', 'X', NULL, '', NULL, NULL, 'julian.coronado@indeplo.com', 'ok', 'se manda equipo por paqueteria.', '2019-08-15 13:43:35', '2019-09-03 17:15:08');
INSERT INTO `solicitudes_altas_auth` VALUES (47, 46, '2019-08-20 11:05:37', NULL, '2019-08-20 11:05:37', 86, '2019-08-20 13:02:49', 719, 'OK', 'OK', 'X', 'X', 'X', 'X', NULL, NULL, NULL, NULL, NULL, 'ok', NULL, '2019-08-15 14:46:31', '2019-08-21 17:46:31');
INSERT INTO `solicitudes_altas_auth` VALUES (48, 47, '2019-08-20 11:05:58', NULL, '2019-08-20 11:05:58', 86, '2019-08-20 13:02:07', 719, 'OK', 'OK', 'X', 'X', 'X', 'X', NULL, NULL, NULL, NULL, NULL, 'ok', NULL, '2019-08-15 14:50:08', '2019-08-21 17:45:56');
INSERT INTO `solicitudes_altas_auth` VALUES (49, 48, '2019-08-15 20:33:41', NULL, '2019-08-15 20:33:41', 117, '2019-08-16 12:13:55', 719, NULL, 'OK', 'OK', 'X', 'OK', 'X', NULL, 'Equipo asignado de forma correcta.', NULL, NULL, 'aalch@naemexico.com', 'ok', 'Se asignan BAM y Celular.', '2019-08-15 17:56:57', '2019-08-20 12:49:29');
INSERT INTO `solicitudes_altas_auth` VALUES (50, 49, '2019-08-22 16:43:58', NULL, '2019-08-22 16:43:58', 448, NULL, NULL, NULL, NULL, 'X', 'X', 'X', 'X', NULL, NULL, NULL, NULL, NULL, 'cita', NULL, '2019-08-19 15:55:10', '2019-08-22 16:43:58');
INSERT INTO `solicitudes_altas_auth` VALUES (51, 50, '2019-08-20 11:06:49', NULL, '2019-08-20 11:06:49', 86, '2019-08-20 12:32:05', 517, NULL, 'OK', 'X', 'X', 'X', 'X', NULL, NULL, NULL, NULL, NULL, 'ok', NULL, '2019-08-19 18:22:56', '2019-08-20 12:50:48');
INSERT INTO `solicitudes_altas_auth` VALUES (52, 51, '2019-08-20 11:07:05', NULL, '2019-08-20 11:07:05', 86, NULL, NULL, NULL, NULL, 'X', 'X', 'X', 'X', NULL, NULL, NULL, NULL, NULL, 'cita', NULL, '2019-08-19 18:37:33', '2019-08-20 11:07:05');
INSERT INTO `solicitudes_altas_auth` VALUES (53, 52, '2019-08-22 09:47:17', NULL, '2019-08-22 09:47:17', 86, '2019-08-22 09:48:57', 517, NULL, 'OK', 'X', 'X', 'X', 'X', NULL, NULL, NULL, NULL, NULL, 'ok', NULL, '2019-08-22 03:16:14', '2019-08-22 12:40:37');
INSERT INTO `solicitudes_altas_auth` VALUES (54, 53, '2019-08-22 11:33:50', NULL, '2019-08-22 11:33:50', 232, '2019-08-23 14:48:56', 719, NULL, 'OK', 'OK', 'X', 'OK', 'X', NULL, '', NULL, NULL, 'evelyn.guerrero@indeplo.com', 'ok', 'Se asigna equipo', '2019-08-22 11:32:53', '2019-09-03 09:19:26');
INSERT INTO `solicitudes_altas_auth` VALUES (55, 54, '2019-08-26 11:17:50', NULL, '2019-08-26 11:17:50', 117, '2019-08-26 11:21:16', 719, NULL, 'OK', 'OK', 'X', 'OK', 'X', NULL, '', NULL, NULL, 'luis.aquino@indeplo.com', 'ok', 'Se asigna herramienta', '2019-08-22 14:23:57', '2019-08-27 16:50:47');
INSERT INTO `solicitudes_altas_auth` VALUES (56, 55, '2019-08-22 16:22:37', NULL, '2019-08-22 16:22:37', 117, '2019-08-22 18:15:21', 719, NULL, 'OK', 'OK', 'X', 'OK', 'X', NULL, '', NULL, NULL, 'estephanie.vazquez@indeplo.com', 'ok', 'Se asigna equipo Temporal', '2019-08-22 16:19:48', '2019-09-03 16:59:37');
INSERT INTO `solicitudes_altas_auth` VALUES (57, 56, '2019-08-22 18:31:07', NULL, '2019-08-22 18:31:07', 117, '2019-08-22 18:54:32', 517, NULL, 'OK', 'OK', 'X', 'OK', 'X', NULL, '', NULL, NULL, 'valentin.vasquez@naemexico.com', 'ok', 'Se asignan herramientas', '2019-08-22 18:06:35', '2019-08-27 14:09:54');
INSERT INTO `solicitudes_altas_auth` VALUES (58, 57, '2019-08-23 14:52:16', NULL, '2019-08-23 14:52:16', 719, NULL, NULL, NULL, NULL, 'X', 'X', 'X', 'X', NULL, NULL, NULL, NULL, NULL, 'cita', NULL, '2019-08-22 18:37:26', '2019-08-23 14:52:17');
INSERT INTO `solicitudes_altas_auth` VALUES (59, 58, '2019-08-22 18:40:43', NULL, '2019-08-22 18:40:43', 86, '2019-08-23 14:52:02', 719, NULL, 'OK', 'X', 'X', 'X', 'X', NULL, NULL, NULL, NULL, NULL, 'ok', NULL, '2019-08-22 18:40:30', '2019-08-27 10:20:38');
INSERT INTO `solicitudes_altas_auth` VALUES (60, 59, '2019-08-23 15:12:04', NULL, '2019-08-23 15:12:04', 232, '2019-08-26 10:25:48', 719, NULL, 'OK', 'OK', 'X', 'OK', 'X', NULL, 'Equipo es entregado directamente en sitio, se manda responsiva a Mayra Jacinto de RH, en espera de firma', NULL, NULL, 'josue.sosa@indeplo.com', 'ok', 'se asigna equipo', '2019-08-23 14:13:47', '2019-09-04 17:57:37');
INSERT INTO `solicitudes_altas_auth` VALUES (61, 60, '2019-08-29 18:05:54', NULL, '2019-08-29 18:05:54', 86, '2019-08-29 18:52:03', 719, NULL, 'OK', 'X', 'X', 'X', 'X', NULL, NULL, NULL, NULL, NULL, 'ok', NULL, '2019-08-29 10:49:38', '2019-09-02 11:24:41');
INSERT INTO `solicitudes_altas_auth` VALUES (62, 61, '2019-08-30 10:41:02', NULL, '2019-08-30 10:41:02', 232, '2019-09-03 10:21:30', 719, NULL, 'OK', 'OK', 'X', 'OK', 'X', NULL, '', NULL, NULL, 'mariana.mendoza@indeplo.com', 'ok', 'Se asigna equipo', '2019-08-30 10:13:44', '2019-09-03 18:26:45');
INSERT INTO `solicitudes_altas_auth` VALUES (63, 62, '2019-09-04 16:41:15', NULL, '2019-09-04 16:41:15', 45, '2019-08-30 10:57:31', 719, NULL, NULL, 'X', 'X', 'OK', 'X', NULL, NULL, NULL, NULL, NULL, 'ok', 'se cancela alta', '2019-08-30 10:30:34', '2019-09-04 17:56:49');
INSERT INTO `solicitudes_altas_auth` VALUES (64, 63, '2019-09-02 10:08:50', NULL, '2019-09-02 10:08:50', 86, '2019-09-02 11:13:11', 719, NULL, 'OK', 'X', 'X', 'X', 'X', NULL, NULL, NULL, NULL, NULL, 'ok', NULL, '2019-09-01 22:58:32', '2019-09-03 12:09:16');
INSERT INTO `solicitudes_altas_auth` VALUES (65, 64, '2019-09-02 10:08:19', NULL, '2019-09-02 10:08:19', 86, '2019-09-02 11:33:41', 517, NULL, 'OK', 'X', 'X', 'X', 'X', NULL, NULL, NULL, NULL, NULL, 'ok', NULL, '2019-09-01 23:07:49', '2019-09-03 12:24:48');
INSERT INTO `solicitudes_altas_auth` VALUES (66, 65, '2019-09-03 09:41:07', NULL, '2019-09-03 09:41:07', 232, '2019-09-03 09:48:49', 517, NULL, 'OK', 'OK', 'X', 'OK', 'X', NULL, 'Ninguna', NULL, NULL, 'jegar@naemexico.com', 'ok', 'Se asignan equipos', '2019-09-02 18:34:46', '2019-09-03 18:26:29');
INSERT INTO `solicitudes_altas_auth` VALUES (67, 66, '2019-09-03 09:41:15', NULL, '2019-09-03 09:41:15', 232, '2019-09-03 10:25:19', 719, NULL, 'OK', 'X', 'X', 'X', 'X', NULL, NULL, NULL, NULL, NULL, 'ok', NULL, '2019-09-03 09:02:39', '2019-09-04 12:33:17');
INSERT INTO `solicitudes_altas_auth` VALUES (68, 67, '2019-09-03 11:50:34', NULL, '2019-09-03 11:50:34', 117, NULL, NULL, NULL, NULL, 'X', 'X', 'X', 'X', NULL, NULL, NULL, NULL, NULL, 'cita', NULL, '2019-09-03 11:37:34', '2019-09-03 11:50:34');
INSERT INTO `solicitudes_altas_auth` VALUES (69, 68, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'X', 'X', 'X', 'X', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-09-04 19:56:33', '2019-09-04 19:56:33');

-- ----------------------------
-- Table structure for solicitudes_baja_nomina
-- ----------------------------
DROP TABLE IF EXISTS `solicitudes_baja_nomina`;
CREATE TABLE `solicitudes_baja_nomina`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_empleado` int(11) NULL DEFAULT NULL,
  `fecha_baja_sol` date NULL DEFAULT NULL,
  `fecha_baja_nom` date NULL DEFAULT NULL,
  `fecha_cita` datetime(0) NULL DEFAULT NULL,
  `baja_computo` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `baja_auto` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `baja_almacen` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `baja_credencial` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `baja_celular` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pago_finiquito` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fecha_pago_fin` date NULL DEFAULT NULL,
  `baja_definitiva` date NULL DEFAULT NULL,
  `adeudos` varchar(405) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tiempo_herra` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` enum('EN PROCESO','FINALIZADO') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `incidencias` varchar(450) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `observaciones` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `motivo` varchar(450) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `conocimiento_baja` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vobo_jefe` varchar(405) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `solicitante` int(11) NULL DEFAULT NULL,
  `fecha_emision` timestamp(0) NULL DEFAULT NULL,
  `obs_cita` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `obs_baja_def` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  `obs_compu` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `obs_cel` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `obs_auto` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `obs_alma` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `obs_cred` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `adeudo_compu` float(10, 2) NULL DEFAULT 0.00,
  `adeudo_cel` float(10, 2) NULL DEFAULT 0.00,
  `adeudo_auto` float(10, 2) NULL DEFAULT 0.00,
  `adeudo_alma` float(10, 2) NULL DEFAULT 0.00,
  `adeudo_cred` float(10, 2) NULL DEFAULT 0.00,
  INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 88 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of solicitudes_baja_nomina
-- ----------------------------
INSERT INTO `solicitudes_baja_nomina` VALUES (1, 2251, '2019-07-09', '2019-07-10', '2019-07-10 10:00:00', NULL, NULL, 'true', NULL, 'true', NULL, NULL, NULL, NULL, NULL, NULL, 'ninguna', 'ninguna', 'DURACION DEL PROYECTO', 'NO', 'solicitudes_bajas/baja_1/baja_vobo_1.msg', 518, '2019-07-09 12:08:32', '', NULL, '2019-07-09 12:08:32', '2019-07-11 12:14:40', NULL, NULL, 'CELULAR MOTO G5  351887091016639 FECHA DE CITA DE ENTREGA NO SE PRESENTÓ ', NULL, 'DEBE EQUIPO DE PROTECCION', NULL, 0.00, 3500.00, 0.00, 12449.00, 0.00);
INSERT INTO `solicitudes_baja_nomina` VALUES (2, 1346, '2019-07-15', '2019-07-16', '2019-07-16 10:00:00', 'true', NULL, NULL, 'true', 'true', 'true', NULL, '2019-07-16', NULL, NULL, NULL, 'NINGUNA', 'NINGUNA', 'DURACION DEL PROYECTO', 'SI', 'solicitudes_bajas/baja_2/baja_vobo_2.msg', 726, '2019-07-15 09:09:39', '', 'BAJA CERRADA', '2019-07-15 09:09:40', '2019-09-03 12:05:47', NULL, 'El usuario no entrega mochila asignada con valor de 100.00 pesos.', 'Entrega de celular sin detalles ', NULL, NULL, 'ENTREGADA', 100.00, 0.00, 0.00, 0.00, 0.00);
INSERT INTO `solicitudes_baja_nomina` VALUES (3, 2261, '2019-07-15', '2019-07-10', '2019-07-22 22:00:00', NULL, NULL, NULL, NULL, NULL, 'true', NULL, NULL, NULL, NULL, NULL, 'NO hay pendientes', 'a partir del 10 de Julio se presenta su baja ', 'DURACION DEL PROYECTO', 'SI', 'solicitudes_bajas/baja_3/baja_vobo_3.pdf', 44, '2019-07-15 10:31:03', '', NULL, '2019-07-15 10:31:04', '2019-09-03 13:54:38', NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00);
INSERT INTO `solicitudes_baja_nomina` VALUES (4, 2257, '2019-07-15', '2019-07-13', '2019-07-17 23:00:00', NULL, NULL, NULL, 'true', NULL, NULL, NULL, '2019-07-16', NULL, NULL, NULL, 'Ninguna', 'Considerar como ultimo día laborado el 13 de Julio. Favor de descontar esos 2 días.', 'NO CUMPLE', 'NO', 'solicitudes_bajas/baja_4/baja_vobo_4.msg', 514, '2019-07-15 13:34:26', '', '', '2019-07-15 13:34:29', '2019-07-18 11:36:24', NULL, NULL, NULL, NULL, NULL, 'ENTREGADA', 0.00, 0.00, 0.00, 0.00, 0.00);
INSERT INTO `solicitudes_baja_nomina` VALUES (5, 2289, '2019-07-15', '2019-07-15', '2019-07-16 03:00:00', NULL, NULL, NULL, 'true', NULL, NULL, NULL, '2019-07-16', NULL, NULL, NULL, 'Ninguna', 'Renuncia Voluntaria', 'DURACION DEL PROYECTO', 'SI', 'solicitudes_bajas/baja_5/baja_vobo_5.msg', 514, '2019-07-15 16:31:49', '', '', '2019-07-15 16:31:51', '2019-07-18 11:36:01', NULL, NULL, NULL, NULL, NULL, 'ENTREGADA', 0.00, 0.00, 0.00, 0.00, 0.00);
INSERT INTO `solicitudes_baja_nomina` VALUES (6, 2193, '2019-07-15', '2019-07-12', '2019-07-16 16:00:00', NULL, NULL, NULL, 'true', NULL, NULL, NULL, '2019-07-16', NULL, NULL, NULL, 'Ninguna', 'Ultimo día laborado: 12 de Julio. Favor de descontar estos 3 días de su finiquito.', 'NO ASISTE', 'NO', 'solicitudes_bajas/baja_6/baja_vobo_6.msg', 514, '2019-07-15 16:56:32', '', 'BAJA CERRADA', '2019-07-15 16:56:35', '2019-07-18 11:39:32', NULL, NULL, NULL, NULL, NULL, 'ENTREGADA', 0.00, 0.00, 0.00, 0.00, 0.00);
INSERT INTO `solicitudes_baja_nomina` VALUES (7, 534, '2019-07-15', '2019-07-15', '2019-07-16 15:00:00', NULL, NULL, NULL, 'true', 'true', NULL, NULL, '2019-07-17', NULL, NULL, NULL, 'Ninguna', 'Ninguna', 'DURACION DEL PROYECTO', 'SI', 'solicitudes_bajas/baja_7/baja_vobo_7.PNG', 66, '2019-07-15 17:54:25', '', 'BAJA CERRADA', '2019-07-15 17:54:28', '2019-07-18 11:39:56', NULL, NULL, 'Entrega sin detalle.', NULL, NULL, 'ENTREGADA', 0.00, 0.00, 0.00, 0.00, 0.00);
INSERT INTO `solicitudes_baja_nomina` VALUES (8, 57, '2019-07-15', '2019-07-15', '2019-07-16 15:30:00', 'true', NULL, NULL, 'true', 'true', NULL, NULL, '2019-07-17', NULL, NULL, NULL, 'Ninguna', 'Ninguna', 'DURACION DEL PROYECTO', 'SI', 'solicitudes_bajas/baja_8/baja_vobo_8.PNG', 66, '2019-07-15 18:05:09', '', 'BAJA CERRADA', '2019-07-15 18:05:11', '2019-07-18 11:40:16', NULL, '', 'Entrega sin detalle.', NULL, NULL, 'ENTREGADA', 0.00, 0.00, 0.00, 0.00, 0.00);
INSERT INTO `solicitudes_baja_nomina` VALUES (9, 867, '2019-07-15', '2019-07-15', '2019-07-16 03:30:00', 'true', 'true', NULL, 'true', NULL, NULL, NULL, '2019-07-17', NULL, NULL, NULL, 'Ninguna', 'Ninguna', 'DURACION DEL PROYECTO', 'SI', 'solicitudes_bajas/baja_9/baja_vobo_9.PNG', 66, '2019-07-15 18:06:26', '', 'BAJA CERRADA', '2019-07-15 18:06:28', '2019-07-18 11:42:37', NULL, '', NULL, 'SIN ADEUDO', NULL, 'ENTREGADA', 0.00, 0.00, 0.00, 0.00, 0.00);
INSERT INTO `solicitudes_baja_nomina` VALUES (10, 415, '2019-07-15', '2019-07-15', '2019-07-16 03:30:00', 'true', 'true', NULL, 'true', NULL, NULL, NULL, '2019-07-17', NULL, NULL, NULL, 'Ninguna', 'Ninguna', 'DURACION DEL PROYECTO', 'SI', 'solicitudes_bajas/baja_10/baja_vobo_10.PNG', 66, '2019-07-15 18:07:45', '', 'BAJA CERRADA', '2019-07-15 18:07:47', '2019-07-18 11:42:13', NULL, '', NULL, 'SIN ADEUDO', NULL, 'ENTREGADA', 0.00, 0.00, 0.00, 0.00, 0.00);
INSERT INTO `solicitudes_baja_nomina` VALUES (11, 1410, '2019-07-15', '2019-07-15', '2019-07-16 12:30:00', NULL, NULL, NULL, 'true', 'true', NULL, NULL, '2019-07-17', NULL, NULL, NULL, 'Ninguna', 'Ninguna', 'DURACION DEL PROYECTO', 'SI', 'solicitudes_bajas/baja_11/baja_vobo_11.PNG', 66, '2019-07-16 11:32:49', '', 'BAJA CERRADA', '2019-07-16 11:32:50', '2019-07-18 11:43:01', NULL, NULL, 'Entrega sin detalle.', NULL, NULL, 'ENTREGADA', 0.00, 0.00, 0.00, 0.00, 0.00);
INSERT INTO `solicitudes_baja_nomina` VALUES (12, 1005, '2019-07-15', '2019-07-15', '2019-07-16 12:30:00', 'true', NULL, NULL, 'true', NULL, NULL, NULL, '2019-07-17', NULL, NULL, NULL, 'Ninguna', 'Ninguna', 'DURACION DEL PROYECTO', 'SI', 'solicitudes_bajas/baja_12/baja_vobo_12.PNG', 66, '2019-07-16 11:34:36', '', 'BAJA CERRADA', '2019-07-16 11:34:37', '2019-07-18 11:32:35', NULL, '', NULL, NULL, NULL, 'ENTREGADA', 0.00, 0.00, 0.00, 0.00, 0.00);
INSERT INTO `solicitudes_baja_nomina` VALUES (13, 116, '2019-07-15', '2019-07-15', '2019-07-16 12:30:00', NULL, NULL, NULL, 'true', 'true', NULL, NULL, '2019-07-17', NULL, NULL, NULL, 'Ninguna', 'Ninguna', 'DURACION DEL PROYECTO', 'SI', 'solicitudes_bajas/baja_13/baja_vobo_13.PNG', 66, '2019-07-16 11:35:36', '', 'BAJA CERRADA', '2019-07-16 11:35:37', '2019-07-18 11:32:09', NULL, NULL, 'Entrega sin detalle.', NULL, NULL, 'ENTREGADO', 0.00, 0.00, 0.00, 0.00, 0.00);
INSERT INTO `solicitudes_baja_nomina` VALUES (14, 1941, '2019-07-16', '2019-07-16', '2019-07-17 13:00:00', NULL, NULL, NULL, 'true', NULL, NULL, NULL, '2019-07-17', NULL, NULL, NULL, 'nunguna', 'Se encuentra en status improductivo', 'DURACION DEL PROYECTO', 'SI', 'solicitudes_bajas/baja_14/baja_vobo_14.msg', 517, '2019-07-16 12:30:51', '', 'BAJA CERRADA', '2019-07-16 12:30:51', '2019-07-18 11:28:13', NULL, NULL, NULL, NULL, NULL, 'entregada', 0.00, 0.00, 0.00, 0.00, 0.00);
INSERT INTO `solicitudes_baja_nomina` VALUES (15, 811, '2019-07-17', '2019-07-15', '2019-07-22 22:30:00', NULL, NULL, 'true', 'true', NULL, NULL, NULL, '2019-08-08', NULL, NULL, NULL, 'Sin incidencias', 'Cuenta con los siguientes activos asignados: Celular, Htas (lampara, caja herramienta, botiquin, casco, Guantes, mosqueton, arnes cruzado 5 puntos, sujetador de caida con mosqueton, mosqueton de auluminio, arnes backlight, punto fijo, arnes de posición, chaleco naranja y azul, lentes claro y oscuro)', 'DURACION DEL PROYECTO', 'SI', 'solicitudes_bajas/baja_15/baja_vobo_15.msg', 81, '2019-07-17 19:20:40', '', NULL, '2019-07-17 19:20:40', '2019-08-08 23:30:15', NULL, NULL, NULL, NULL, 'EQUIPO DE PROTECCION PERSONAL (TÉCNICO)', 'ENTREGADA', 0.00, 0.00, 0.00, 11764.73, 0.00);
INSERT INTO `solicitudes_baja_nomina` VALUES (16, 2169, '2019-07-19', '2019-07-19', '2019-07-23 22:00:00', NULL, NULL, NULL, NULL, NULL, 'true', NULL, NULL, NULL, NULL, NULL, 'sin incidencias. ', 'sin observaciones', 'DURACION DEL PROYECTO', 'SI', 'solicitudes_bajas/baja_16/baja_vobo_16.msg', 719, '2019-07-22 09:11:07', '', NULL, '2019-07-22 09:11:08', '2019-09-03 14:03:45', NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00);
INSERT INTO `solicitudes_baja_nomina` VALUES (17, 468, '2019-07-31', '2019-07-31', '2019-07-31 09:00:00', NULL, 'true', 'true', NULL, NULL, 'true', NULL, NULL, NULL, NULL, NULL, 'NINGUNA', 'NINGUNA', 'DURACION DEL PROYECTO', 'SI', 'solicitudes_bajas/baja_17/baja_vobo_17.msg', 726, '2019-07-22 16:43:55', '', NULL, '2019-07-22 16:43:56', '2019-08-01 16:27:27', NULL, NULL, NULL, 'SIN ADEUDO', 'NOS DEBE EN HERRAMINETA Y EQUIPO DE PROTECCION ', NULL, 0.00, 0.00, 0.00, 56337.18, 0.00);
INSERT INTO `solicitudes_baja_nomina` VALUES (18, 744, '2019-07-31', '2019-07-31', '2019-07-31 09:00:00', 'true', NULL, NULL, 'true', NULL, 'true', NULL, '2019-09-02', NULL, NULL, NULL, 'NINGUNA', 'NINGUNA', 'DURACION DEL PROYECTO', 'SI', 'solicitudes_bajas/baja_18/baja_vobo_18.msg', 726, '2019-07-22 16:45:31', '', NULL, '2019-07-22 16:45:32', '2019-09-02 23:30:03', NULL, '', NULL, NULL, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00);
INSERT INTO `solicitudes_baja_nomina` VALUES (19, 24, '2019-07-31', '2019-07-31', '2019-07-31 09:00:00', 'true', NULL, NULL, 'true', NULL, 'true', NULL, '2019-09-02', NULL, NULL, NULL, 'NINGUNA', 'NINGUNA', 'DURACION DEL PROYECTO', 'SI', 'solicitudes_bajas/baja_19/baja_vobo_19.msg', 726, '2019-07-22 16:46:25', '', NULL, '2019-07-22 16:46:26', '2019-09-02 23:30:03', NULL, 'ENTREGA EQUIPO EN BUEN ESTADO --> 30/07/2019', NULL, NULL, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00);
INSERT INTO `solicitudes_baja_nomina` VALUES (20, 50, '2019-07-31', '2019-07-31', '2019-07-31 09:00:00', NULL, NULL, 'true', 'true', NULL, 'true', NULL, '2019-09-02', NULL, NULL, NULL, 'NINGUNA', 'NINGUNA', 'DURACION DEL PROYECTO', 'SI', 'solicitudes_bajas/baja_20/baja_vobo_20.msg', 726, '2019-07-22 16:47:08', '', NULL, '2019-07-22 16:47:09', '2019-09-02 23:30:04', NULL, NULL, NULL, NULL, 'NOS DEBE POR CONCEPTO DE HERRAMIENTA Y EQUPO DE PROTECCION ', '', 0.00, 0.00, 0.00, 43334.51, 0.00);
INSERT INTO `solicitudes_baja_nomina` VALUES (21, 1922, '2019-07-31', '2019-07-31', '2019-07-31 09:00:00', NULL, NULL, NULL, NULL, NULL, 'true', NULL, NULL, NULL, NULL, NULL, 'NINGUNA', 'NINGUNA', 'DURACION DEL PROYECTO', 'SI', 'solicitudes_bajas/baja_21/baja_vobo_21.msg', 726, '2019-07-22 16:48:08', '', NULL, '2019-07-22 16:48:10', '2019-08-01 16:28:51', NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00);
INSERT INTO `solicitudes_baja_nomina` VALUES (22, 751, '2019-07-31', '2019-07-31', '2019-07-31 09:00:00', NULL, NULL, 'true', NULL, NULL, 'true', NULL, NULL, NULL, NULL, NULL, 'NINGUNA', 'NINGUNA', 'DURACION DEL PROYECTO', 'SI', 'solicitudes_bajas/baja_22/baja_vobo_22.msg', 726, '2019-07-22 16:50:58', '', NULL, '2019-07-22 16:51:00', '2019-08-01 12:17:41', NULL, NULL, NULL, NULL, 'no debe nada', NULL, 0.00, 0.00, 0.00, 12917.00, 0.00);
INSERT INTO `solicitudes_baja_nomina` VALUES (23, 469, '2019-07-31', '2019-07-31', '2019-07-31 09:00:00', 'true', NULL, NULL, 'true', NULL, 'true', NULL, '2019-08-08', NULL, NULL, NULL, 'NINGUNA', 'NINGUNA', 'DURACION DEL PROYECTO', 'SI', 'solicitudes_bajas/baja_23/baja_vobo_23.msg', 726, '2019-07-22 16:51:54', '', NULL, '2019-07-22 16:51:55', '2019-08-08 23:30:16', NULL, '', NULL, NULL, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00);
INSERT INTO `solicitudes_baja_nomina` VALUES (24, 1250, '2019-07-18', '2019-07-18', '2019-07-22 21:00:00', NULL, NULL, 'true', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NINGUNA ', 'NINGUNA ', 'DURACION DEL PROYECTO', 'NO', 'solicitudes_bajas/baja_24/baja_vobo_24.msg', 518, '2019-07-22 17:31:17', '', NULL, '2019-07-22 17:31:18', '2019-07-24 16:37:59', NULL, NULL, NULL, NULL, 'SIN ADEUDOS', NULL, 0.00, 0.00, 0.00, 358.81, 0.00);
INSERT INTO `solicitudes_baja_nomina` VALUES (25, 788, '2019-07-30', '2019-07-30', '2019-07-31 22:00:00', NULL, NULL, 'true', 'true', NULL, NULL, NULL, '2019-07-31', NULL, NULL, NULL, 'NINGUNA', 'BAJO RENDIMIENTO Y POR RECLAMOS DEL CLIENTE', 'NO CUMPLE', 'NO', 'solicitudes_bajas/baja_25/baja_vobo_25.msg', 119, '2019-07-23 13:44:40', '', '', '2019-07-23 13:44:40', '2019-08-05 11:43:43', NULL, NULL, NULL, NULL, 'DEBE AL AREA DE ALMACEN POR CONCEPTO DE HERRAMIENTA $141.68', 'entregada', 0.00, 0.00, 0.00, 32142.00, 0.00);
INSERT INTO `solicitudes_baja_nomina` VALUES (26, 1743, '2019-07-31', '2019-07-31', '2019-08-01 22:00:00', 'true', NULL, NULL, 'true', 'true', 'true', NULL, '2019-07-30', NULL, NULL, NULL, 'n/a', 'n/a', 'NO CUMPLE', 'NO', 'solicitudes_bajas/baja_26/baja_vobo_26.msg', 129, '2019-07-24 09:51:26', '', '', '2019-07-24 09:51:29', '2019-07-30 19:04:58', NULL, 'El equipo esta en perfectas condiciones como fue entregado.', '', NULL, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00);
INSERT INTO `solicitudes_baja_nomina` VALUES (27, 2245, '2019-07-31', '2019-07-31', '2019-07-31 22:00:00', 'true', NULL, NULL, 'true', 'true', 'true', NULL, '2019-08-08', NULL, NULL, NULL, 'Ninguna', 'Baja por Reestructura de Proyecto', 'TERMINO DE PROYECTO', 'NO', 'solicitudes_bajas/baja_27/baja_vobo_27.txt', 232, '2019-07-24 17:17:02', '', NULL, '2019-07-24 17:17:02', '2019-09-03 12:42:45', NULL, 'EQUIPO ENTREGADO A IT', '', NULL, NULL, '0', 0.00, 0.00, 0.00, 0.00, 0.00);
INSERT INTO `solicitudes_baja_nomina` VALUES (28, 1251, '2019-07-31', '2019-07-31', '2019-07-30 16:00:00', 'true', NULL, 'true', 'true', 'true', 'true', NULL, '2019-07-30', NULL, NULL, NULL, 'NINGUNA ', 'NINGUNA ', 'RENUNCIA VOLUNTARIA', 'SI', 'solicitudes_bajas/baja_28/baja_vobo_28.msg', 518, '2019-07-29 13:21:01', '', '', '2019-07-29 13:20:58', '2019-08-07 13:33:35', NULL, 'El equipo se entrega en buen estado fisico', 'No entrega equipo por extravió del mismo', NULL, 'DEBE HERRAMIENTA Y EQUIPO DE PROTECCION LA CANTIDAD DE $3278.10', 'entregada', 0.00, 4500.00, 0.00, 131155.80, 0.00);
INSERT INTO `solicitudes_baja_nomina` VALUES (29, 150, '2019-07-31', '2019-07-31', '2019-07-31 22:00:00', NULL, NULL, NULL, NULL, 'true', 'true', NULL, NULL, NULL, NULL, NULL, 'NINGUNA', 'NINGUNA', 'TERMINO DE PROYECTO', 'SI', 'solicitudes_bajas/baja_29/baja_vobo_29.msg', 726, '2019-07-29 17:41:24', '', NULL, '2019-07-29 17:41:26', '2019-09-03 13:47:47', NULL, NULL, 'sin adeudo', NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00);
INSERT INTO `solicitudes_baja_nomina` VALUES (30, 8, '2019-07-31', '2019-07-31', '2019-07-31 22:00:00', 'true', NULL, NULL, NULL, 'true', NULL, NULL, NULL, NULL, NULL, NULL, 'NINGUNA', 'NINGUNA', 'TERMINO DE PROYECTO', 'SI', 'solicitudes_bajas/baja_30/baja_vobo_30.msg', 726, '2019-07-29 17:42:08', '', NULL, '2019-07-29 17:42:09', '2019-08-06 18:18:15', NULL, 'Cargador de laptop entregado en mal estado y batería no retiene la carga', 'EQUIPO REPORTADO COMO ROBADO', 'adeudo daños de unidad $5340.00', NULL, NULL, 859.00, 0.00, 5340.00, 0.00, 0.00);
INSERT INTO `solicitudes_baja_nomina` VALUES (31, 1898, '2019-07-31', '2019-07-31', '2019-07-31 22:00:00', NULL, NULL, NULL, NULL, NULL, 'true', NULL, NULL, NULL, NULL, NULL, 'NINGUNA', 'NINGUNA', 'TERMINO DE PROYECTO', 'SI', 'solicitudes_bajas/baja_31/baja_vobo_31.msg', 726, '2019-07-29 17:44:58', '', NULL, '2019-07-29 17:45:00', '2019-09-03 13:49:52', NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00);
INSERT INTO `solicitudes_baja_nomina` VALUES (32, 1897, '2019-07-31', '2019-07-31', '2019-07-31 22:00:00', 'true', NULL, NULL, NULL, NULL, 'true', NULL, NULL, NULL, NULL, NULL, 'NINGUNA', 'NINGUNA', 'TERMINO DE PROYECTO', 'SI', 'solicitudes_bajas/baja_32/baja_vobo_32.msg', 726, '2019-07-29 17:48:11', '', NULL, '2019-07-29 17:48:13', '2019-08-15 18:19:45', NULL, 'EQUIPO Y CARGADOR EN BUEN ESTADO', NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00);
INSERT INTO `solicitudes_baja_nomina` VALUES (33, 1896, '2019-07-31', '2019-07-31', '2019-07-31 22:00:00', 'true', NULL, NULL, NULL, 'true', 'true', NULL, NULL, NULL, NULL, NULL, 'NINGUNA', 'NINGUNA', 'TERMINO DE PROYECTO', 'SI', 'solicitudes_bajas/baja_33/baja_vobo_33.msg', 726, '2019-07-29 17:48:55', '', NULL, '2019-07-29 17:48:57', '2019-08-15 18:20:40', NULL, 'Equipo con cargador en buen estado', 'ENTREGA EQUIPO', NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00);
INSERT INTO `solicitudes_baja_nomina` VALUES (34, 1926, '2019-07-31', '2019-07-31', '2019-07-31 22:00:00', NULL, NULL, NULL, NULL, NULL, 'true', NULL, NULL, NULL, NULL, NULL, 'NINGUNA', 'NINGUNA', 'TERMINO DE PROYECTO', 'SI', 'solicitudes_bajas/baja_34/baja_vobo_34.msg', 726, '2019-07-29 18:04:32', '', NULL, '2019-07-29 18:04:34', '2019-09-03 13:45:24', NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00);
INSERT INTO `solicitudes_baja_nomina` VALUES (35, 196, '2019-07-31', '2019-07-31', '2019-07-31 22:00:00', NULL, NULL, NULL, NULL, NULL, 'true', NULL, NULL, NULL, NULL, NULL, 'NINGUNA', 'NINGUNA', 'TERMINO DE PROYECTO', 'SI', 'solicitudes_bajas/baja_35/baja_vobo_35.msg', 726, '2019-07-29 18:05:04', '', NULL, '2019-07-29 18:05:06', '2019-09-03 13:49:17', NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00);
INSERT INTO `solicitudes_baja_nomina` VALUES (36, 796, '2019-07-31', '2019-07-31', '2019-07-31 22:00:00', 'true', NULL, NULL, NULL, NULL, 'true', NULL, NULL, NULL, NULL, NULL, 'NINGUNA', 'NINGUNA', 'TERMINO DE PROYECTO', 'SI', 'solicitudes_bajas/baja_36/baja_vobo_36.msg', 726, '2019-07-29 18:09:52', '', NULL, '2019-07-29 18:09:53', '2019-09-03 13:55:45', NULL, 'SE ENTREGA EQUIPO DE COMPUTO EN BUEN ESTADO', NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00);
INSERT INTO `solicitudes_baja_nomina` VALUES (37, 34, '2019-07-31', '2019-07-31', '2019-07-31 23:00:00', 'true', NULL, NULL, 'true', NULL, 'true', NULL, '2019-08-16', NULL, NULL, NULL, 'NINGUNA', 'NINGUNA', 'TERMINO DE PROYECTO', 'SI', 'solicitudes_bajas/baja_37/baja_vobo_37.msg', 726, '2019-07-29 18:10:38', '', NULL, '2019-07-29 18:10:40', '2019-09-03 13:51:01', NULL, 'SE ENTREGA EQUIPO EN BUEN ESTADO', NULL, NULL, NULL, 'entregado', 0.00, 0.00, 0.00, 0.00, 0.00);
INSERT INTO `solicitudes_baja_nomina` VALUES (38, 387, '2019-07-31', '2019-07-31', '2019-07-31 23:00:00', 'true', NULL, 'true', NULL, NULL, 'true', NULL, NULL, NULL, NULL, NULL, 'NINGUNA', 'NINGUNA', 'TERMINO DE PROYECTO', 'SI', 'solicitudes_bajas/baja_38/baja_vobo_38.msg', 726, '2019-07-29 18:11:13', '', NULL, '2019-07-29 18:11:15', '2019-09-03 13:55:20', NULL, 'se entrega equipo en buen estado ', '', NULL, 'SIN ADEUDO PORQUE NO SE CUENTA CON RESPONSIVA FIRMADA ADMINISTRACION DE JULIO VALDEZ', NULL, 0.00, 1000.00, 0.00, 23237.00, 0.00);
INSERT INTO `solicitudes_baja_nomina` VALUES (39, 2026, '2019-07-30', '2019-07-30', '2019-07-30 22:00:00', 'true', NULL, NULL, NULL, 'true', 'true', NULL, NULL, NULL, NULL, NULL, 'Sin incidencias', 'Cuenta con los siguientes activos asignados: laptop Dell + mochila, Celular samsung, BAM, chaleco azul con reflejantes, lentes claro y oscuro guantes ( aunque las ultimas 3 partidas son consumibles)', 'RENUNCIA VOLUNTARIA', 'SI', 'solicitudes_bajas/baja_39/baja_vobo_39.msg', 81, '2019-07-29 18:21:32', '', NULL, '2019-07-29 18:21:33', '2019-09-03 13:57:35', NULL, 'Realizar descuento por no entregar mochila, descuento de $300', 'CELULAR SAMSUNG  353771093409455 4500\nBAM 2000', NULL, NULL, NULL, 300.00, 0.00, 0.00, 0.00, 0.00);
INSERT INTO `solicitudes_baja_nomina` VALUES (40, 2130, '2019-07-30', '2019-07-30', '2019-07-31 22:00:00', NULL, NULL, NULL, 'true', NULL, 'true', NULL, '2019-08-08', NULL, NULL, NULL, 'Ninguna', 'Baja por mal manejo de información, favor de descontar 2 días de su finiquito', 'DESEMPEÑO RESICION', 'NO', 'solicitudes_bajas/baja_40/baja_vobo_40.msg', 514, '2019-07-30 09:10:55', '', NULL, '2019-07-30 09:10:56', '2019-09-03 14:03:07', NULL, NULL, NULL, NULL, NULL, 'entregada', 0.00, 0.00, 0.00, 0.00, 0.00);
INSERT INTO `solicitudes_baja_nomina` VALUES (41, 1780, '2019-07-30', '2019-07-30', '2019-07-30 23:30:00', NULL, NULL, NULL, 'true', NULL, 'true', NULL, '2019-09-02', NULL, NULL, NULL, 'Ninguna', 'Mala Actitud y bajo desempeño, favor de descontar 2 días de su finiquito', 'DESEMPEÑO RESICION', 'SI', 'solicitudes_bajas/baja_41/baja_vobo_41.msg', 514, '2019-07-30 09:14:43', '', NULL, '2019-07-30 09:14:44', '2019-09-02 23:30:05', NULL, NULL, NULL, NULL, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00);
INSERT INTO `solicitudes_baja_nomina` VALUES (42, 2075, '2019-08-01', '2019-08-01', '2019-08-01 22:00:00', NULL, 'true', 'true', NULL, NULL, 'true', NULL, NULL, NULL, NULL, NULL, 'Sin incidencias', 'Cuenta con los siguientes activos asignados: Laptop VOSTRO 14-3468 + MOCHILA NEGRA, celular SAMSUNG SM-J600G/DS, BAM, Automóvil asignado con National Car, herramientas (LAMPARA LAMPARA DE MINERO, CAJA MOCHILA PARA HERRAMIENTA, CASCO DE SEGURIDAD COLORES, ARNÉS CHALECO NARANJA CON REFLEJANTES, GUANTE MECÁNICO NEGRO C/AMARILLO, LENTE MICA CLARA Y GRIS)', 'TERMINO DE PROYECTO', 'SI', 'solicitudes_bajas/baja_42/baja_vobo_42.msg', 81, '2019-07-30 09:49:44', '', NULL, '2019-07-30 09:49:44', '2019-09-03 13:50:20', NULL, NULL, NULL, 'SIN ADEUDO , LA UNIDAD FUE REASIGNADA AL USUARIO Roger Pastor Perera Uribe CON PLACAS: UUB071E', 'debe en herramineta  1209.11', NULL, 0.00, 0.00, 0.00, 1209.11, 0.00);
INSERT INTO `solicitudes_baja_nomina` VALUES (43, 926, '2019-08-15', '2019-08-15', '2019-08-15 22:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ninguna', 'ninguna', 'CAMBIO DE VENDOR', 'SI', 'solicitudes_bajas/baja_43/baja_vobo_43.msg', 93, '2019-07-30 13:19:36', '', NULL, '2019-07-30 13:19:38', '2019-07-30 14:55:53', '2019-08-14 19:11:50', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00);
INSERT INTO `solicitudes_baja_nomina` VALUES (44, 1639, '2019-08-15', '2019-08-15', '2019-08-15 22:00:00', 'true', NULL, NULL, NULL, NULL, 'true', NULL, NULL, NULL, NULL, NULL, 'ninguna', 'ninguna', 'CAMBIO DE VENDOR', 'SI', 'solicitudes_bajas/baja_44/baja_vobo_44.msg', 93, '2019-07-30 13:21:16', 'Hola, la fecha de baja es 31 de Julio', NULL, '2019-07-30 13:21:16', '2019-09-03 13:58:03', NULL, 'equipo en buen estado.', '', NULL, NULL, NULL, 0.00, 1000.00, 0.00, 0.00, 0.00);
INSERT INTO `solicitudes_baja_nomina` VALUES (45, 2254, '2019-07-31', '2019-07-31', '2019-07-31 12:00:00', 'true', NULL, NULL, 'true', NULL, 'true', NULL, '2019-08-08', NULL, NULL, NULL, 'ninguna', 'ninguna', 'RENUNCIA VOLUNTARIA', 'SI', 'solicitudes_bajas/baja_45/baja_vobo_45.msg', 93, '2019-07-30 13:29:04', 'SE PRESENTA EL DÍA 1/8/2019 A LAS 4:00PM EN LAS INSTALACIONES DE MUNDO E PARA ENTREGA DE HERRAMIENTA Y FIRMA DE FINIQUITO.', NULL, '2019-07-30 13:29:04', '2019-08-08 23:30:19', NULL, 'EQUIPO NO ENTREGADO A IT, SE ENTREGA AMARCO SANTOS Y ALEJANDRO BARRIOS, SIGUE PENDIENTE ENTREGA A IT. SE ENVIA RESPONSIVA TEMPORAL A MARCO RAMIREZ COMO RESPONSABLE DE EQUIPO HASTA DEVOLUCION A IT', NULL, NULL, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00);
INSERT INTO `solicitudes_baja_nomina` VALUES (46, 69, '2019-07-31', '2019-07-31', '2019-07-31 12:00:00', NULL, NULL, NULL, 'true', NULL, 'true', NULL, '2019-09-02', NULL, NULL, NULL, 'Ninguna', 'Ninguna', 'TERMINO DE PROYECTO', 'SI', 'solicitudes_bajas/baja_46/baja_vobo_46.PNG', 66, '2019-07-30 18:26:27', '', NULL, '2019-07-30 18:26:29', '2019-09-02 23:30:06', NULL, NULL, NULL, NULL, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00);
INSERT INTO `solicitudes_baja_nomina` VALUES (47, 513, '2019-07-31', '2019-07-31', '2019-08-01 00:00:00', 'true', NULL, NULL, NULL, NULL, 'true', NULL, NULL, NULL, NULL, NULL, 'NINGUNA', 'NINGUNA', 'TERMINO DE PROYECTO', 'SI', 'solicitudes_bajas/baja_47/baja_vobo_47.msg', 726, '2019-07-31 09:20:24', '', NULL, '2019-07-31 09:20:29', '2019-09-03 13:48:41', NULL, 'entrega equipo en buen estado', NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00);
INSERT INTO `solicitudes_baja_nomina` VALUES (48, 615, '2019-08-15', '2019-08-15', '2019-08-15 22:30:00', NULL, NULL, 'true', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Ninguna', 'Ninguna', 'TERMINO DE PROYECTO', 'NO', 'solicitudes_bajas/baja_48/baja_vobo_48.PNG', 66, '2019-07-31 09:20:45', '', NULL, '2019-07-31 09:20:48', '2019-07-31 12:22:46', '2019-08-14 19:03:31', NULL, NULL, NULL, 'NOS DEBE EN HERRAMINETA $9000 , RESPONSIVA NO FIRMADA YA QUE ES DE LA ADMINISTRACION DE JULIO VALDEZ  AÑO 2015', NULL, 0.00, 0.00, 0.00, 9000.00, 0.00);
INSERT INTO `solicitudes_baja_nomina` VALUES (49, 1046, '2019-08-15', '2019-08-15', '2019-08-15 22:00:00', NULL, NULL, 'true', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Ninguna', 'Ninguna', 'TERMINO DE PROYECTO', 'NO', 'solicitudes_bajas/baja_49/baja_vobo_49.PNG', 66, '2019-07-31 09:22:29', '', NULL, '2019-07-31 09:22:32', '2019-08-06 16:31:01', '2019-08-14 19:01:24', NULL, NULL, NULL, 'nos debe en herramienta 55663', NULL, 0.00, 0.00, 0.00, 55663.00, 0.00);
INSERT INTO `solicitudes_baja_nomina` VALUES (50, 185, '2019-08-15', '2019-08-15', '2019-08-15 22:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NINGUNA', 'NINGUNA', 'TERMINO DE PROYECTO', 'SI', 'solicitudes_bajas/baja_50/baja_vobo_50.msg', 726, '2019-07-31 09:25:32', '', NULL, '2019-07-31 09:25:36', '2019-08-12 11:14:08', '2019-08-14 19:05:11', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00);
INSERT INTO `solicitudes_baja_nomina` VALUES (51, 835, '2019-07-31', '2019-07-31', '2019-07-31 14:00:00', 'true', NULL, NULL, NULL, 'true', NULL, NULL, NULL, NULL, NULL, NULL, 'NINGUNA', 'NINGUNA', 'TERMINO DE PROYECTO', 'SI', 'solicitudes_bajas/baja_51/baja_vobo_51.msg', 726, '2019-07-31 10:27:05', '', NULL, '2019-07-31 10:27:10', '2019-08-08 12:44:30', NULL, 'Baja de equipo correcta, sin descuentos.', '', NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00);
INSERT INTO `solicitudes_baja_nomina` VALUES (52, 115, '2019-07-31', '2019-07-31', '2019-08-01 13:00:00', 'true', NULL, NULL, NULL, NULL, 'true', NULL, NULL, NULL, NULL, NULL, 'NINGUNA', 'NINGUNA', 'TERMINO DE PROYECTO', 'SI', 'solicitudes_bajas/baja_52/baja_vobo_52.msg', 726, '2019-07-31 10:54:37', '', NULL, '2019-07-31 10:54:41', '2019-09-03 13:53:13', NULL, 'equipo en buen estado y entrega accesorios.', NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00);
INSERT INTO `solicitudes_baja_nomina` VALUES (53, 2328, '2019-07-31', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Ninguna', 'Ultimo día laborado: 29 de Julio. Favor de descontar 2 días de su finiquito', 'RENUNCIA VOLUNTARIA', 'SI', 'solicitudes_bajas/baja_53/baja_vobo_53.msg', 514, '2019-07-31 18:42:38', NULL, NULL, '2019-07-31 18:42:40', '2019-08-01 09:58:48', '2019-08-01 09:58:48', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00);
INSERT INTO `solicitudes_baja_nomina` VALUES (54, 1787, '2019-08-01', '2019-07-29', '2019-08-02 22:00:00', NULL, NULL, NULL, NULL, NULL, 'true', NULL, NULL, NULL, NULL, NULL, 'Ninguna', 'Fecha de ultimo día laborado: 29 de Julio, favor de descontar 2 días de su finiquito.', 'RENUNCIA VOLUNTARIA', 'SI', 'solicitudes_bajas/baja_54/baja_vobo_54.msg', 514, '2019-08-01 10:03:15', '', NULL, '2019-08-01 10:03:17', '2019-08-05 16:42:46', NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00);
INSERT INTO `solicitudes_baja_nomina` VALUES (55, 1690, '2019-08-02', '2019-08-02', '2019-08-02 22:30:00', 'true', NULL, NULL, 'true', 'true', 'true', NULL, '2019-09-02', NULL, NULL, NULL, 'NINGUNA', 'NINGUNA', 'RENUNCIA VOLUNTARIA', 'SI', 'solicitudes_bajas/baja_55/baja_vobo_55.eml', 110, '2019-08-02 09:22:41', '', NULL, '2019-08-02 09:22:43', '2019-09-03 13:58:20', NULL, 'Realizar descuento de de 400 pesos por entregar cargador dañado.', 'Se retira equipo en excelentes condiciones', NULL, NULL, '', 400.00, 0.00, 0.00, 0.00, 0.00);
INSERT INTO `solicitudes_baja_nomina` VALUES (56, 368, '2019-08-15', '2019-08-15', '2019-08-15 22:00:00', NULL, NULL, NULL, 'true', NULL, 'true', NULL, '2019-08-16', NULL, NULL, NULL, 'NINGUNA', 'NINGUNA', 'TERMINO DE PROYECTO', 'SI', 'solicitudes_bajas/baja_56/baja_vobo_56.msg', 726, '2019-08-06 14:34:06', '', NULL, '2019-08-06 14:34:08', '2019-08-21 17:53:52', NULL, NULL, NULL, NULL, NULL, 'entregada', 0.00, 0.00, 0.00, 0.00, 0.00);
INSERT INTO `solicitudes_baja_nomina` VALUES (57, 824, '2019-08-15', '2019-08-15', '2019-08-15 22:00:00', NULL, NULL, NULL, 'true', NULL, 'true', NULL, '2019-08-16', NULL, NULL, NULL, 'NINGUNA', 'NINGUNA', 'TERMINO DE PROYECTO', 'SI', 'solicitudes_bajas/baja_57/baja_vobo_57.msg', 726, '2019-08-06 14:36:53', '', NULL, '2019-08-06 14:36:56', '2019-08-21 17:54:29', NULL, NULL, NULL, NULL, NULL, 'entregada', 0.00, 0.00, 0.00, 0.00, 0.00);
INSERT INTO `solicitudes_baja_nomina` VALUES (58, 61, '2019-08-15', '2019-08-15', '2019-08-15 22:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NINGUNA', 'NINGUNA', 'TERMINO DE PROYECTO', 'SI', 'solicitudes_bajas/baja_58/baja_vobo_58.msg', 726, '2019-08-06 17:10:41', '', NULL, '2019-08-06 17:10:46', '2019-08-12 11:13:34', '2019-08-12 11:13:34', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00);
INSERT INTO `solicitudes_baja_nomina` VALUES (59, 1619, '2019-08-07', '2019-08-07', '2019-08-07 10:00:00', 'true', NULL, NULL, 'true', 'true', 'true', NULL, '2019-09-02', NULL, NULL, NULL, 'no hay pendientes', 'absoluta discreción en su baja, gracias', 'DESEMPEÑO RESICION', 'NO', 'solicitudes_bajas/baja_59/baja_vobo_59.pdf', 44, '2019-08-06 17:57:31', '', NULL, '2019-08-06 17:57:31', '2019-09-03 13:57:08', NULL, 'Todo esta en orden, se realiza baja.', 'ENTREGA EQUIPO EN BUENAS CONDICIONES', NULL, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00);
INSERT INTO `solicitudes_baja_nomina` VALUES (60, 1497, '2019-08-08', '2019-08-07', '2019-08-08 17:00:00', 'true', NULL, NULL, NULL, 'true', NULL, NULL, NULL, NULL, NULL, NULL, 'Ninguna', 'Ninguna', 'TERMINO DE PROYECTO', 'NO', 'solicitudes_bajas/baja_60/baja_vobo_60.PNG', 66, '2019-08-07 10:29:08', '', NULL, '2019-08-07 10:29:09', '2019-08-09 12:07:04', NULL, 'ENTREGO EQUIPO Y MOCHILA EN BUEN ESTADO ', 'ENTREGA EQUIPO EN BUENAS CONDICIONES', NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00);
INSERT INTO `solicitudes_baja_nomina` VALUES (61, 1043, '2019-08-09', '2019-08-09', '2019-08-09 23:00:00', 'true', NULL, NULL, 'true', 'true', NULL, NULL, '2019-09-02', NULL, NULL, NULL, 'Ninguna', 'n/a', 'TERMINO DE PROYECTO', 'NO', 'solicitudes_bajas/baja_61/baja_vobo_61.msg', 129, '2019-08-07 11:05:37', '', NULL, '2019-08-07 11:05:43', '2019-09-02 23:32:42', NULL, 'Entrega equipo en buen estado.', 'ENTREGA EQUIPO EN BUENAS CONDICIONES', NULL, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00);
INSERT INTO `solicitudes_baja_nomina` VALUES (62, 2334, '2019-08-07', '2019-08-07', '2019-08-08 22:00:00', 'true', NULL, NULL, 'true', 'true', 'true', NULL, '2019-09-02', NULL, NULL, NULL, 'NINGUNA', 'EL RECURSO NO PERTENECE AL SID.', 'CAMBIO DE VENDOR', 'SI', 'solicitudes_bajas/baja_62/baja_vobo_62.msg', 726, '2019-08-07 11:08:16', '', NULL, '2019-08-07 11:08:19', '2019-09-03 13:54:01', NULL, 'ENTREGA EQUIPO DE COMPUTO Y MOCHILA EN BUEN ESTADO', 'OK', NULL, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00);
INSERT INTO `solicitudes_baja_nomina` VALUES (63, 2222, '2019-08-08', '2019-08-08', '2019-08-08 16:00:00', NULL, NULL, NULL, 'true', 'true', NULL, NULL, '2019-08-12', NULL, NULL, NULL, 'Sin Incidencia', 'Ya entrego informacion a TEMM', 'MEJOR OFERTA LABORAL', 'SI', 'solicitudes_bajas/baja_63/baja_vobo_63.pdf', 476, '2019-08-08 12:20:58', '', NULL, '2019-08-08 12:20:57', '2019-08-12 23:30:14', NULL, 'Entrega equipo en perfecto estado, no se realiza ningún descuento.', 'Equipo entregado en buen estado', NULL, NULL, 'ENTREGADA', 0.00, 0.00, 0.00, 0.00, 0.00);
INSERT INTO `solicitudes_baja_nomina` VALUES (64, 1977, '2019-08-09', '2019-08-09', '2019-08-12 23:00:00', NULL, NULL, NULL, 'true', NULL, 'true', NULL, '2019-09-02', NULL, NULL, NULL, 'Ninguna', 'Favor de descontar $250.00 de su finiquito con concepto de deposito de linea telefonica', 'RENUNCIA VOLUNTARIA', 'SI', 'solicitudes_bajas/baja_64/baja_vobo_64.msg', 514, '2019-08-08 14:22:07', '', NULL, '2019-08-08 14:22:08', '2019-09-02 23:34:26', NULL, NULL, NULL, NULL, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00);
INSERT INTO `solicitudes_baja_nomina` VALUES (65, 1418, '2019-08-15', '2019-08-15', '2019-08-15 22:00:00', 'true', NULL, NULL, 'true', NULL, 'true', NULL, '2019-09-02', NULL, NULL, NULL, 'NA', 'NA', 'RENUNCIA VOLUNTARIA', 'SI', 'solicitudes_bajas/baja_65/baja_vobo_65.pdf', 2, '2019-08-09 09:46:28', '', NULL, '2019-08-09 09:46:30', '2019-09-02 23:35:18', NULL, 'entrega equipo y accesorios en buen estado.', NULL, NULL, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00);
INSERT INTO `solicitudes_baja_nomina` VALUES (66, 2338, '2019-08-12', '2019-08-09', '2019-08-13 15:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Ninguna', 'Unico día laborado 09 08 2019. Favor de solo considerar ese día.', 'RENUNCIA VOLUNTARIA', 'SI', 'solicitudes_bajas/baja_66/baja_vobo_66.msg', 514, '2019-08-12 09:21:31', '', NULL, '2019-08-12 09:21:33', '2019-08-12 10:16:41', NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00);
INSERT INTO `solicitudes_baja_nomina` VALUES (67, 1730, '2019-08-14', '2019-08-14', '2019-08-15 21:00:00', NULL, NULL, NULL, 'true', NULL, 'true', NULL, '2019-09-02', NULL, NULL, NULL, 'Ninguna', 'Ultimo día laborado: Entra el miercoles 14 a las 7:00pm y sale de turno el jueves 15 a las 7:00am', 'RENUNCIA VOLUNTARIA', 'SI', 'solicitudes_bajas/baja_67/baja_vobo_67.msg', 514, '2019-08-12 10:41:40', '', NULL, '2019-08-12 10:41:42', '2019-09-02 23:35:19', NULL, NULL, NULL, NULL, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00);
INSERT INTO `solicitudes_baja_nomina` VALUES (68, 1764, '2019-08-13', '2019-08-13', '2019-08-14 15:00:00', NULL, NULL, NULL, NULL, NULL, 'true', NULL, NULL, NULL, NULL, NULL, 'Ninguna', 'Hoy se encuentra en turno, siendo su ultimo día laborado. Favor de descontar $250.00 por concepto de deposito de linea telefónica', 'RENUNCIA VOLUNTARIA', 'SI', 'solicitudes_bajas/baja_68/baja_vobo_68.msg', 514, '2019-08-13 09:53:37', '', NULL, '2019-08-13 09:53:39', '2019-08-15 17:49:35', NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00);
INSERT INTO `solicitudes_baja_nomina` VALUES (69, 1752, '2019-08-15', '2019-08-15', '2019-08-16 23:00:00', 'true', NULL, NULL, 'true', NULL, 'true', NULL, '2019-08-16', NULL, NULL, NULL, 'ninguna', 'Tiene herramienta asignada', 'RENUNCIA VOLUNTARIA', 'SI', 'solicitudes_bajas/baja_69/baja_vobo_69.html', 44, '2019-08-13 19:12:35', '', NULL, '2019-08-13 19:12:35', '2019-09-03 13:51:28', NULL, 'Sin problema en baja de equipo.', NULL, NULL, NULL, 'entregada', 0.00, 0.00, 0.00, 0.00, 0.00);
INSERT INTO `solicitudes_baja_nomina` VALUES (70, 1770, '2019-08-15', '2019-08-15', '2019-08-16 14:00:00', NULL, NULL, NULL, 'true', NULL, 'true', NULL, '2019-08-28', NULL, NULL, NULL, 'Ninguna', 'Ultimo día laborado 15 de Agosto. Favor de descontar $250.00 de su finiquito por concepto de deposito de linea telefonica', 'DESEMPEÑO RESICION', 'SI', 'solicitudes_bajas/baja_70/baja_vobo_70.msg', 514, '2019-08-15 17:54:49', '', NULL, '2019-08-15 17:54:50', '2019-09-03 13:45:45', NULL, NULL, NULL, NULL, NULL, 'entregado', 0.00, 0.00, 0.00, 0.00, 0.00);
INSERT INTO `solicitudes_baja_nomina` VALUES (71, 1753, '2019-08-30', '2019-08-30', '2019-08-30 21:00:00', NULL, NULL, NULL, 'true', 'true', 'true', NULL, '2019-08-31', NULL, NULL, NULL, 'No hay incidencia', 'Cuenta con herramienta', 'RENUNCIA VOLUNTARIA', 'SI', 'solicitudes_bajas/baja_71/baja_vobo_71.pdf', 44, '2019-08-19 10:14:57', '', NULL, '2019-08-19 10:14:57', '2019-09-03 12:40:22', NULL, NULL, 'Entrega equipo en buenas condiciones', NULL, NULL, 'ENTREGADA', 0.00, 0.00, 0.00, 0.00, 0.00);
INSERT INTO `solicitudes_baja_nomina` VALUES (72, 1826, '2019-08-23', '2019-08-22', '2019-08-23 23:00:00', 'true', NULL, NULL, 'true', NULL, 'true', NULL, '2019-08-23', NULL, NULL, NULL, 'Sin incidencias ', 'cuenta con herramienta', 'RENUNCIA VOLUNTARIA', 'SI', 'solicitudes_bajas/baja_72/baja_vobo_72.pdf', 44, '2019-08-19 10:35:32', '', NULL, '2019-08-19 10:35:31', '2019-09-03 13:46:06', NULL, 'no tienes descuento', NULL, NULL, NULL, 'ENTREGADA', 0.00, 0.00, 0.00, 0.00, 0.00);
INSERT INTO `solicitudes_baja_nomina` VALUES (73, 2213, '2019-08-20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Cuenta con un fondo de Emergencia de $ 5,000.00', 'La baja tiene que ser a partir del 18 de Agosto', 'MEJOR OFERTA LABORAL', 'SI', 'solicitudes_bajas/baja_73/baja_vobo_73.msg', 129, '2019-08-20 09:59:15', NULL, NULL, '2019-08-20 09:59:26', '2019-08-20 10:21:19', '2019-08-20 10:21:19', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00);
INSERT INTO `solicitudes_baja_nomina` VALUES (74, 1105, '2019-08-20', '2019-08-18', '2019-08-20 17:00:00', 'true', NULL, 'true', 'true', 'true', 'true', NULL, '2019-08-23', NULL, NULL, NULL, 'Cuenta con un fondo de emergencia de $ 5,000.00', 'La baja tiene que ser a partir del 18 de agosto ', 'MEJOR OFERTA LABORAL', 'SI', 'solicitudes_bajas/baja_74/baja_vobo_74.msg', 129, '2019-08-20 10:03:43', '', NULL, '2019-08-20 10:03:51', '2019-09-03 13:46:39', NULL, 'entrega equipo de computo en buen estado junto con accesorios ', 'ENTREGA EQUIPO', NULL, 'NOS DEBE EN HERRAMIENTA  18160', 'ENTREGADA', 0.00, 0.00, 0.00, 18160.00, 0.00);
INSERT INTO `solicitudes_baja_nomina` VALUES (75, 2043, '2019-08-21', '2019-08-21', '2019-08-22 16:00:00', NULL, NULL, NULL, 'true', NULL, 'true', NULL, '2019-09-02', NULL, NULL, NULL, 'Ninguna', 'El 21 es su ultimo día trabajado', 'RENUNCIA VOLUNTARIA', 'SI', 'solicitudes_bajas/baja_75/baja_vobo_75.msg', 514, '2019-08-20 22:20:51', '', NULL, '2019-08-20 22:20:52', '2019-09-03 12:41:16', NULL, NULL, NULL, NULL, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00);
INSERT INTO `solicitudes_baja_nomina` VALUES (76, 2156, '2019-08-22', '2019-08-21', '2019-08-22 23:00:00', NULL, NULL, NULL, 'true', NULL, 'true', NULL, '2019-09-02', NULL, NULL, NULL, 'Favor de descontar 1 día de su finiquito', 'Fecha efectiva de baja: 21 de Agosto', 'ABANDONO DE TRABAJO/AUSENTISMO', 'NO', 'solicitudes_bajas/baja_76/baja_vobo_76.msg', 514, '2019-08-22 13:41:23', '', NULL, '2019-08-22 13:41:23', '2019-09-03 13:47:12', NULL, NULL, NULL, NULL, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00);
INSERT INTO `solicitudes_baja_nomina` VALUES (77, 1233, '2019-08-31', '2019-08-31', '2019-09-02 23:00:00', NULL, NULL, NULL, 'true', 'true', 'true', NULL, '2019-09-02', NULL, NULL, NULL, 'ninguna', 'ninguna', 'CAMBIO DE VENDOR', 'SI', 'solicitudes_bajas/baja_77/baja_vobo_77.msg', 93, '2019-08-22 16:12:33', '', NULL, '2019-08-22 16:12:34', '2019-09-03 12:39:28', NULL, NULL, 'Entrega equipo en funcionamiento', NULL, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00);
INSERT INTO `solicitudes_baja_nomina` VALUES (78, 1990, '2019-08-28', '2019-08-28', '2019-08-29 23:00:00', 'true', NULL, NULL, 'true', 'true', 'true', NULL, '2019-09-02', NULL, NULL, NULL, 'no', 'herramienta asignada ', 'ABANDONO DE TRABAJO/AUSENTISMO', 'SI', 'solicitudes_bajas/baja_78/baja_vobo_78.pdf', 44, '2019-08-27 17:03:31', '', NULL, '2019-08-27 17:03:32', '2019-09-03 12:43:27', NULL, 'Equipo en buen estado.', 'Entrega equipo en buenas condiciones', NULL, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00);
INSERT INTO `solicitudes_baja_nomina` VALUES (79, 1368, '2019-08-22', '2019-08-22', '2019-08-22 14:00:00', NULL, NULL, NULL, 'true', NULL, 'true', NULL, '2019-09-02', NULL, NULL, NULL, 'NINGUNA ', 'NINGUNA', 'RENUNCIA VOLUNTARIA', 'SI', 'solicitudes_bajas/baja_79/baja_vobo_79.msg', 518, '2019-08-28 10:35:51', '', NULL, '2019-08-28 10:35:50', '2019-09-03 14:04:13', NULL, NULL, NULL, NULL, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00);
INSERT INTO `solicitudes_baja_nomina` VALUES (80, 2072, '2019-08-30', '2019-08-30', '2019-08-30 12:00:00', NULL, NULL, 'true', NULL, NULL, 'true', NULL, NULL, NULL, NULL, NULL, 'Sin incidencias', 'Cuenta con los siguientes activos asignados: Equipo de cómputo 2WT2BL2 VOSTRO 14-3468, Celular SAMSUNG SM-J600G, BAM M4 HS-1 FREEDOM, camioneta placas JV47437Htas (BRUJULA GEO SURV NAE, FRENO ANTICAIDAS PARA CABLE DE 5/16\" Y 3/8 MOD. 51638 CON ABSORVEDOR, DESARMADOR PLANO DE 1/4 9604 NAE, DESARMADOR CRUZ 2 X 4 1/4 9684 NAE, EXTENSION BARRA MULTICONTACTOS 6 ENTRADAS NAE, EXTENSION DE USO RUDO 5 MTS NAE, FLEXOMETRO 5M MAGNETICO PRO NAE, LAMPARA MINERO 7 LEDS, MULTIMETRO DIGITAL ERGONOMICO NAE, NAVAJA CUTTER TRABAJO PESADO NAE, NIVEL TORPEDO ALTO IMPACTO, CAJA MOCHILA PARA HERRAMIENTA NAE GRIS, TRANSPORTADOR MAGNETICO 360GD NAE, BOTIQUIN PRIMEROS AUXILIOS BOTIQUIN COMPLETO, CASCO CASCO ROCK STAR DEHN, GUANTES GUANTE MECANICO NEGRO C/AMARILLO DEHN, BOTAS VANVIEN MOD. BLUE NEGRO SUELA AZUL T27, ARNES MOSQUETON DE ACERO TIPO D 50KN ERICSSON, ARNES ARNES CRUZADO DE SEGURIDAD 5 PUNTOS DEHN, ARNES MOSQUETON ALUMINIO OVAL C/SEG 25KM, ARNES CABLE C/C 2 BZOA. BACKLIGHT, ARNES CABLE DE POSICION NYLON TUBULAR 1.40-2.20 MTS DEHN, CHALECO MR SUPER AJUSTABLE SR 1034 NARANJA, CHALECO AZUL CON REFLEJANTES, LENTES LENTE SENADOR DE POLICARBONATO MICA CLARA, LENTES LENTE SENADOR DE POLICARBONATO MICA GRIS, EFECTICARD # 603825, TAG IMDM24959150)', 'TERMINO DE PROYECTO', 'NO', 'solicitudes_bajas/baja_80/baja_vobo_80.msg', 81, '2019-08-28 11:44:19', '', NULL, '2019-08-28 11:44:19', '2019-09-03 12:35:53', NULL, NULL, NULL, NULL, 'NOS DEBE EN EQUIPO DE PROTECCION Y HERRAMIENTA\n', NULL, 0.00, 0.00, 0.00, 19678.00, 0.00);
INSERT INTO `solicitudes_baja_nomina` VALUES (81, 2245, '2019-08-28', '2019-08-28', '2019-08-30 23:00:00', NULL, NULL, NULL, 'true', NULL, 'true', NULL, '2019-09-02', NULL, NULL, NULL, 'Se paso a personal improductivo para que recibiera capacitación pero no se presento a evaluación y al curso del 14 de julio', 'No se ha encontrado un proyecto en el cual incorporar a Elias por lo cual se opta por la baja', 'TERMINO DE PROYECTO', 'NO', 'solicitudes_bajas/baja_81/baja_vobo_81.pdf', 507, '2019-08-28 12:31:27', '', NULL, '2019-08-28 12:31:25', '2019-09-03 12:42:16', NULL, NULL, NULL, NULL, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00);
INSERT INTO `solicitudes_baja_nomina` VALUES (82, 1337, '2019-08-31', '2019-08-31', '2019-09-02 12:00:00', NULL, NULL, 'true', NULL, 'true', NULL, NULL, NULL, NULL, NULL, NULL, 'Sin incidencias ', 'EQUIPO DE COMPUTO # Serie H1687F2, VOSTRO 14-3468, CELULAR MOTOROLA MOTO G5 XT1671, BAM  M4 HS-1 FREEDOM, NU4802-A RAM 700, CANDADO STEREN, MALETIN NEGRO USADO, MOCHILA NEGRA, BRUJULA GEO SURV NAE, FRENO ANTICAIDAS PARA CABLE DE 5/16\" Y 3/8 MOD. 51638 CON ABSORVEDOR, DESARMADOR PLANO DE 1/4 9604 NAE, DESARMADOR CRUZ 2 X 4 1/4 9684 NAE, FLEXOMETRO 5M MAGNETICO PRO NAE, LAMPARA LAMPARA DE MINERO 28 LEDS 3 INTENS SEGURITECH, MULTIMETRO DIGITAL ERGONOMICO NAE, NAVAJA CUTTER TRABAJO PESADO NAE, NIVEL TORPEDO ALTO IMPACTO NAE, CAJA MOCHILA P/HERRAMIENTA 16 PLG. STANLEY AMARILLA, CAJA MOCHILA PARA HERRAMIENTA NAE GRIS, TRANSPORTADOR MAGNETICO 360GD NAE, CANDADO DE SEGURIDAD CON CABLE TY235, BOTIQUIN PRIMEROS AUXILIOS BOTIQUIN COMPLETO, CASCO CASCO ROCK STAR ERICSSON, GUANTES GUANTE MECANICO NEGRO C/AMARILLO DEHN, ARNES MOSQUETON DE ACERO TIPO D 50KN ERICSSON, ARNES ARNES CRUZADO DE SEGURIDAD 5 PUNTOS DEHN, ARNES MOSQUETON ALUMINIO OVAL C/SEG 25KM, ARNES CABLE C/C 2 BZOA. BACKLIGHT, ARNES CABLE DE POSICION NYLON TUBULAR 1.40-2.20 MTS DEHN, CHALECO MR SUPER AJUSTABLE SR 1034 NARANJA, CHALECO AZUL CON REFLEJANTES, LENTES LENTE SENADOR DE POLICARBONATO MICA CLARA, LENTES LENTE SENADOR DE POLICARBONATO MICA GRIS.,   $3925.50 pendiente de descuento por accidente vehicular.', 'RENUNCIA VOLUNTARIA', 'SI', 'solicitudes_bajas/baja_82/baja_vobo_82.msg', 81, '2019-08-28 13:00:56', '', NULL, '2019-08-28 13:00:56', '2019-09-02 12:54:42', NULL, NULL, 'Entrega celular en buenas condiciones y funcional, Bam entregada no funciona', NULL, 'NOS DEBE EQUIPO DE PROTECCION Y HERRAMIENTA ', NULL, 0.00, 1200.00, 0.00, 20036.60, 0.00);
INSERT INTO `solicitudes_baja_nomina` VALUES (83, 502, '2019-08-30', '2019-08-30', '2019-09-03 22:00:00', 'true', NULL, NULL, NULL, 'true', NULL, NULL, NULL, NULL, NULL, NULL, 'Ninguna', 'Ninguna', 'TERMINO DE PROYECTO', 'SI', 'solicitudes_bajas/baja_83/baja_vobo_83.msg', 726, '2019-08-30 10:35:01', '', NULL, '2019-08-30 10:35:11', '2019-09-04 11:31:30', NULL, 'equipo en buen estado', 'entrega equipo', NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00);
INSERT INTO `solicitudes_baja_nomina` VALUES (84, 2243, '2019-08-30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Ninguna', 'Renuncia Voluntaria', 'RENUNCIA VOLUNTARIA', 'SI', 'solicitudes_bajas/baja_84/baja_vobo_84.pdf', 232, '2019-08-30 13:02:39', NULL, NULL, '2019-08-30 13:02:39', '2019-08-30 14:31:52', '2019-08-30 14:31:52', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00);
INSERT INTO `solicitudes_baja_nomina` VALUES (85, 2263, '2019-08-30', '2019-08-30', '2019-09-02 14:00:00', NULL, NULL, NULL, 'true', NULL, 'true', NULL, '2019-09-02', NULL, NULL, NULL, 'Ninguna', 'Faltas constantes que afectan la operación', 'DESEMPEÑO RESICION', 'NO', 'solicitudes_bajas/baja_85/baja_vobo_85.msg', 514, '2019-08-30 13:49:45', '', NULL, '2019-08-30 13:49:47', '2019-09-03 12:37:52', NULL, NULL, NULL, NULL, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00);
INSERT INTO `solicitudes_baja_nomina` VALUES (86, 1761, '2019-08-30', '2019-08-30', '2019-08-30 14:30:00', NULL, NULL, NULL, 'true', NULL, NULL, NULL, '2019-08-31', NULL, NULL, NULL, 'Ninguna', 'Ninguna', 'DESEMPEÑO RESICION', 'SI', 'solicitudes_bajas/baja_86/baja_vobo_86.html', 45, '2019-08-30 13:51:18', '', NULL, '2019-08-30 13:51:17', '2019-08-31 23:30:07', NULL, NULL, NULL, NULL, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00);
INSERT INTO `solicitudes_baja_nomina` VALUES (87, 2262, '2019-09-03', '2019-09-03', '2019-09-03 18:30:00', NULL, NULL, NULL, 'true', NULL, 'true', NULL, '2019-09-04', NULL, NULL, NULL, 'Ninguna', 'Contemplar el pago de los 3 días trabajados en Septiembre', 'RENUNCIA VOLUNTARIA', 'SI', 'solicitudes_bajas/baja_87/baja_vobo_87.msg', 514, '2019-09-03 09:21:20', '', NULL, '2019-09-03 09:21:24', '2019-09-04 23:30:02', NULL, NULL, NULL, NULL, NULL, '', 0.00, 0.00, 0.00, 0.00, 0.00);

-- ----------------------------
-- Table structure for solicitudes_bitacora_bajas
-- ----------------------------
DROP TABLE IF EXISTS `solicitudes_bitacora_bajas`;
CREATE TABLE `solicitudes_bitacora_bajas`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `solicitud_id` int(10) UNSIGNED NOT NULL,
  `comentario` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `user_log` int(10) UNSIGNED NOT NULL,
  `log` datetime(0) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 72 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of solicitudes_bitacora_bajas
-- ----------------------------
INSERT INTO `solicitudes_bitacora_bajas` VALUES (1, 61, 'ENTREGA EQUIPO EN BUENAS CONDICIONES', 744, '2019-08-09 11:00:21', NULL, NULL);
INSERT INTO `solicitudes_bitacora_bajas` VALUES (2, 61, 'Entrega equipo en buen estado.', 487, '2019-08-09 11:02:27', NULL, NULL);
INSERT INTO `solicitudes_bitacora_bajas` VALUES (3, 60, 'ENTREGO EQUIPO Y MOCHILA EN BUEN ESTADO ', 492, '2019-08-09 11:56:32', NULL, NULL);
INSERT INTO `solicitudes_bitacora_bajas` VALUES (4, 60, 'ENTREGA EQUIPO EN BUENAS CONDICIONES', 744, '2019-08-09 12:07:04', NULL, NULL);
INSERT INTO `solicitudes_bitacora_bajas` VALUES (5, 43, 'Se cancela baja', 93, '2019-08-09 13:13:51', NULL, NULL);
INSERT INTO `solicitudes_bitacora_bajas` VALUES (6, 63, 'ENTREGADA', 518, '2019-08-12 11:53:45', NULL, NULL);
INSERT INTO `solicitudes_bitacora_bajas` VALUES (7, 27, 'EQUIPO ENTREGADO A IT', 536, '2019-08-13 11:22:47', NULL, NULL);
INSERT INTO `solicitudes_bitacora_bajas` VALUES (8, 52, 'equipo en buen estado y entrega accesorios.', 487, '2019-08-13 16:41:57', NULL, NULL);
INSERT INTO `solicitudes_bitacora_bajas` VALUES (9, 47, 'entrega equipo en buen estado', 492, '2019-08-13 18:30:48', NULL, NULL);
INSERT INTO `solicitudes_bitacora_bajas` VALUES (10, 69, 'se presenta a firma de finiquito el día viernes 16-08-19 a las 11:00am en las oficinas de mundo E', 518, '2019-08-14 10:59:01', NULL, NULL);
INSERT INTO `solicitudes_bitacora_bajas` VALUES (11, 65, 'entrega equipo y accesorios en buen estado.', 487, '2019-08-14 19:11:25', NULL, NULL);
INSERT INTO `solicitudes_bitacora_bajas` VALUES (12, 56, 'Considerar pago de Bono por $ 2,500.00 dentro de finiquito', 110, '2019-08-15 18:30:42', NULL, NULL);
INSERT INTO `solicitudes_bitacora_bajas` VALUES (13, 69, 'Sin problema en baja de equipo.', 731, '2019-08-16 11:05:01', NULL, NULL);
INSERT INTO `solicitudes_bitacora_bajas` VALUES (14, 57, 'entregada', 518, '2019-08-16 11:45:23', NULL, NULL);
INSERT INTO `solicitudes_bitacora_bajas` VALUES (15, 56, 'entregada', 518, '2019-08-16 11:45:55', NULL, NULL);
INSERT INTO `solicitudes_bitacora_bajas` VALUES (16, 37, 'entregado', 518, '2019-08-16 11:46:52', NULL, NULL);
INSERT INTO `solicitudes_bitacora_bajas` VALUES (17, 69, 'entregada', 518, '2019-08-16 11:49:24', NULL, NULL);
INSERT INTO `solicitudes_bitacora_bajas` VALUES (18, 74, 'El recurso cuenta con un fondo de emergencias de $ 5,000.00 favor de solicitalo.', 129, '2019-08-20 14:13:15', NULL, NULL);
INSERT INTO `solicitudes_bitacora_bajas` VALUES (19, 74, 'NOS DEBE EN HERRAMIENTA  18160', 34, '2019-08-20 16:46:57', NULL, NULL);
INSERT INTO `solicitudes_bitacora_bajas` VALUES (20, 74, 'entrega equipo de computo en buen estado junto con accesorios ', 492, '2019-08-21 09:16:39', NULL, NULL);
INSERT INTO `solicitudes_bitacora_bajas` VALUES (21, 74, 'ENTREGA EQUIPO', 744, '2019-08-21 16:33:24', NULL, NULL);
INSERT INTO `solicitudes_bitacora_bajas` VALUES (22, 76, 'DESCONTAR 1 DÍA CORRESPONDIENTE A LA FALTA DEL 20 DE AGOSTO ', 448, '2019-08-22 13:49:24', NULL, NULL);
INSERT INTO `solicitudes_bitacora_bajas` VALUES (23, 72, 'no tienes descuento', 487, '2019-08-23 11:46:59', NULL, NULL);
INSERT INTO `solicitudes_bitacora_bajas` VALUES (24, 74, 'ENTREGADA', 518, '2019-08-23 12:10:30', NULL, NULL);
INSERT INTO `solicitudes_bitacora_bajas` VALUES (25, 72, 'ENTREGADA', 518, '2019-08-23 12:10:45', NULL, NULL);
INSERT INTO `solicitudes_bitacora_bajas` VALUES (26, 29, 'sin adeudo', 744, '2019-08-26 11:03:26', NULL, NULL);
INSERT INTO `solicitudes_bitacora_bajas` VALUES (27, 70, 'entregado', 518, '2019-08-28 09:43:56', NULL, NULL);
INSERT INTO `solicitudes_bitacora_bajas` VALUES (28, 81, 'Favor de descontarle 3 días', 45, '2019-08-28 18:49:04', NULL, NULL);
INSERT INTO `solicitudes_bitacora_bajas` VALUES (29, 75, 'Se presenta a firma de finiquito el día 30/08/2019 en las oficinas de mundo E a las 10:00am', 518, '2019-08-29 09:20:35', NULL, NULL);
INSERT INTO `solicitudes_bitacora_bajas` VALUES (30, 78, 'Entrega equipo en buenas condiciones', 744, '2019-08-29 11:19:14', NULL, NULL);
INSERT INTO `solicitudes_bitacora_bajas` VALUES (31, 78, 'Equipo en buen estado.', 487, '2019-08-29 11:50:21', NULL, NULL);
INSERT INTO `solicitudes_bitacora_bajas` VALUES (32, 80, 'NOS DEBE EN EQUIPO DE PROTECCION Y HERRAMIENTA\n', 34, '2019-08-29 17:02:46', NULL, NULL);
INSERT INTO `solicitudes_bitacora_bajas` VALUES (33, 82, 'NOS DEBE EQUIPO DE PROTECCION Y HERRAMIENTA ', 34, '2019-08-29 17:05:39', NULL, NULL);
INSERT INTO `solicitudes_bitacora_bajas` VALUES (34, 71, 'ENTREGADA', 518, '2019-08-30 09:44:27', NULL, NULL);
INSERT INTO `solicitudes_bitacora_bajas` VALUES (35, 71, 'Entrega equipo en buenas condiciones', 744, '2019-08-30 09:48:27', NULL, NULL);
INSERT INTO `solicitudes_bitacora_bajas` VALUES (36, 85, 'Favor de descontar 2 días de incidencias por faltas el 23/08/2019 y 30/08/2019.', 514, '2019-08-30 13:51:58', NULL, NULL);
INSERT INTO `solicitudes_bitacora_bajas` VALUES (37, 85, '', 514, '2019-08-30 13:52:03', NULL, NULL);
INSERT INTO `solicitudes_bitacora_bajas` VALUES (38, 86, '', 448, '2019-08-30 14:20:53', NULL, NULL);
INSERT INTO `solicitudes_bitacora_bajas` VALUES (39, 83, 'Cita el Martes 03 de Septiembre de 2019 a las 10:00 am', 1066, '2019-09-02 10:24:29', NULL, NULL);
INSERT INTO `solicitudes_bitacora_bajas` VALUES (40, 79, '', 1066, '2019-09-02 10:29:16', NULL, NULL);
INSERT INTO `solicitudes_bitacora_bajas` VALUES (41, 81, '', 1066, '2019-09-02 10:36:45', NULL, NULL);
INSERT INTO `solicitudes_bitacora_bajas` VALUES (42, 75, '', 1066, '2019-09-02 10:37:27', NULL, NULL);
INSERT INTO `solicitudes_bitacora_bajas` VALUES (43, 82, 'Entrega celular en buenas condiciones y funcional, Bam entregada no funciona', 744, '2019-09-02 12:54:42', NULL, NULL);
INSERT INTO `solicitudes_bitacora_bajas` VALUES (44, 85, '', 1066, '2019-09-02 13:10:20', NULL, NULL);
INSERT INTO `solicitudes_bitacora_bajas` VALUES (45, 78, '', 1066, '2019-09-02 14:16:03', NULL, NULL);
INSERT INTO `solicitudes_bitacora_bajas` VALUES (46, 55, '', 1066, '2019-09-02 14:26:41', NULL, NULL);
INSERT INTO `solicitudes_bitacora_bajas` VALUES (47, 76, '', 1066, '2019-09-02 14:27:02', NULL, NULL);
INSERT INTO `solicitudes_bitacora_bajas` VALUES (48, 67, '', 1066, '2019-09-02 14:27:23', NULL, NULL);
INSERT INTO `solicitudes_bitacora_bajas` VALUES (49, 64, '', 1066, '2019-09-02 14:28:10', NULL, NULL);
INSERT INTO `solicitudes_bitacora_bajas` VALUES (50, 18, '', 1066, '2019-09-02 14:29:22', NULL, NULL);
INSERT INTO `solicitudes_bitacora_bajas` VALUES (51, 41, '', 1066, '2019-09-02 14:31:39', NULL, NULL);
INSERT INTO `solicitudes_bitacora_bajas` VALUES (52, 20, '', 1066, '2019-09-02 14:32:33', NULL, NULL);
INSERT INTO `solicitudes_bitacora_bajas` VALUES (53, 19, '', 1066, '2019-09-02 14:33:35', NULL, NULL);
INSERT INTO `solicitudes_bitacora_bajas` VALUES (54, 46, '', 1066, '2019-09-02 14:34:07', NULL, NULL);
INSERT INTO `solicitudes_bitacora_bajas` VALUES (55, 65, '', 1066, '2019-09-02 14:37:30', NULL, NULL);
INSERT INTO `solicitudes_bitacora_bajas` VALUES (56, 61, '', 1066, '2019-09-02 16:03:55', NULL, NULL);
INSERT INTO `solicitudes_bitacora_bajas` VALUES (57, 62, '', 1066, '2019-09-02 16:05:30', NULL, NULL);
INSERT INTO `solicitudes_bitacora_bajas` VALUES (58, 59, '', 1066, '2019-09-02 16:05:53', NULL, NULL);
INSERT INTO `solicitudes_bitacora_bajas` VALUES (59, 77, '', 1066, '2019-09-02 16:26:38', NULL, NULL);
INSERT INTO `solicitudes_bitacora_bajas` VALUES (60, 77, 'Entrega equipo en funcionamiento', 744, '2019-09-02 16:38:46', NULL, NULL);
INSERT INTO `solicitudes_bitacora_bajas` VALUES (61, 77, 'Se adeuda la cantidad de $10,000.00 por concepto de bono.', 1066, '2019-09-02 16:50:38', NULL, NULL);
INSERT INTO `solicitudes_bitacora_bajas` VALUES (62, 82, 'SIN ADEUDOS DE HERRAMIENTAS Y EQUIPO DE PROTECCION', 251, '2019-09-02 18:32:42', NULL, NULL);
INSERT INTO `solicitudes_bitacora_bajas` VALUES (63, 83, 'Cita el Miércoles 04 de Septiembre de 2019 a las 09:30 am', 1066, '2019-09-03 10:33:42', NULL, NULL);
INSERT INTO `solicitudes_bitacora_bajas` VALUES (64, 18, 'APELLIDO ERRONEO ES OMAR RAMOS JARAMILLO', 794, '2019-09-03 12:11:58', NULL, NULL);
INSERT INTO `solicitudes_bitacora_bajas` VALUES (65, 82, 'Se contacto a la persona y quedo en devolver la llamada para coordinar cita.', 1066, '2019-09-03 13:09:55', NULL, NULL);
INSERT INTO `solicitudes_bitacora_bajas` VALUES (66, 82, 'Acude a firma el día Jueves 05 de Agosto de 2019 a las 5:30 de la tarde', 1066, '2019-09-03 17:36:13', NULL, NULL);
INSERT INTO `solicitudes_bitacora_bajas` VALUES (67, 87, '', 1066, '2019-09-03 18:25:34', NULL, NULL);
INSERT INTO `solicitudes_bitacora_bajas` VALUES (68, 83, 'Se le llamo y por problemas personales recorrió la cita para Miércoles 04 de Septiembre de 2019 a las 10:30 am', 1066, '2019-09-04 09:36:15', NULL, NULL);
INSERT INTO `solicitudes_bitacora_bajas` VALUES (69, 83, 'equipo en buen estado', 487, '2019-09-04 11:27:47', NULL, NULL);
INSERT INTO `solicitudes_bitacora_bajas` VALUES (70, 83, 'entrega equipo', 744, '2019-09-04 11:31:30', NULL, NULL);
INSERT INTO `solicitudes_bitacora_bajas` VALUES (71, 82, 'Acudió a firma el día Miércoles 04 de Septiembre de 2019 a las 13:00 horas', 1066, '2019-09-04 16:21:40', NULL, NULL);

-- ----------------------------
-- Table structure for usuario_permisos
-- ----------------------------
DROP TABLE IF EXISTS `usuario_permisos`;
CREATE TABLE `usuario_permisos`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_permiso` int(255) UNSIGNED NOT NULL,
  `id_usuario` int(255) UNSIGNED NOT NULL,
  `descripcion` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`, `id_permiso`, `id_usuario`) USING BTREE,
  INDEX `permisos`(`id_permiso`) USING BTREE,
  INDEX `usuarios`(`id_usuario`) USING BTREE,
  CONSTRAINT `permisos` FOREIGN KEY (`id_permiso`) REFERENCES `permisos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `usuarios` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 2247 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of usuario_permisos
-- ----------------------------
INSERT INTO `usuario_permisos` VALUES (1, 1, 750, '', '2019-04-11 13:38:23', '2019-04-11 13:38:23');
INSERT INTO `usuario_permisos` VALUES (2, 2, 750, '', '2019-04-11 13:38:23', '2019-04-11 13:38:23');
INSERT INTO `usuario_permisos` VALUES (3, 3, 750, '', '2019-04-11 13:38:23', '2019-04-11 13:38:23');
INSERT INTO `usuario_permisos` VALUES (4, 4, 750, '', '2019-04-11 13:38:23', '2019-04-11 13:38:23');
INSERT INTO `usuario_permisos` VALUES (5, 5, 750, '', '2019-04-11 13:38:23', '2019-04-11 13:38:23');
INSERT INTO `usuario_permisos` VALUES (6, 6, 750, '', '2019-04-11 13:38:23', '2019-04-11 13:38:23');
INSERT INTO `usuario_permisos` VALUES (7, 7, 750, '', '2019-04-11 13:38:23', '2019-04-11 13:38:23');
INSERT INTO `usuario_permisos` VALUES (8, 8, 750, '', '2019-04-11 13:38:23', '2019-04-11 13:38:23');
INSERT INTO `usuario_permisos` VALUES (9, 9, 750, '', '2019-04-11 13:38:23', '2019-04-11 13:38:23');
INSERT INTO `usuario_permisos` VALUES (10, 10, 750, '', '2019-04-11 13:38:23', '2019-04-11 13:38:23');
INSERT INTO `usuario_permisos` VALUES (11, 11, 750, '', '2019-04-11 13:38:23', '2019-04-11 13:38:23');
INSERT INTO `usuario_permisos` VALUES (12, 12, 750, '', '2019-04-11 13:38:23', '2019-04-11 13:38:23');
INSERT INTO `usuario_permisos` VALUES (13, 13, 750, '', '2019-04-11 13:38:23', '2019-04-11 13:38:23');
INSERT INTO `usuario_permisos` VALUES (14, 14, 750, '', '2019-04-11 13:38:23', '2019-04-11 13:38:23');
INSERT INTO `usuario_permisos` VALUES (15, 15, 750, '', '2019-04-11 13:38:23', '2019-04-11 13:38:23');
INSERT INTO `usuario_permisos` VALUES (16, 16, 750, '', '2019-04-11 13:38:23', '2019-04-11 13:38:23');
INSERT INTO `usuario_permisos` VALUES (17, 17, 750, '', '2019-04-11 13:38:23', '2019-04-11 13:38:23');
INSERT INTO `usuario_permisos` VALUES (18, 18, 750, '', '2019-04-11 13:38:23', '2019-04-11 13:38:23');
INSERT INTO `usuario_permisos` VALUES (19, 19, 750, '', '2019-04-11 13:38:23', '2019-04-11 13:38:23');
INSERT INTO `usuario_permisos` VALUES (20, 20, 750, '', '2019-04-11 13:38:23', '2019-04-11 13:38:23');
INSERT INTO `usuario_permisos` VALUES (21, 21, 750, '', '2019-04-11 13:38:23', '2019-04-11 13:38:23');
INSERT INTO `usuario_permisos` VALUES (22, 22, 750, '', '2019-04-11 13:38:23', '2019-04-11 13:38:23');
INSERT INTO `usuario_permisos` VALUES (23, 23, 750, '', '2019-04-11 13:38:23', '2019-04-11 13:38:23');
INSERT INTO `usuario_permisos` VALUES (24, 24, 750, '', '2019-04-11 13:38:23', '2019-04-11 13:38:23');
INSERT INTO `usuario_permisos` VALUES (25, 25, 750, '', '2019-04-11 13:38:23', '2019-04-11 13:38:23');
INSERT INTO `usuario_permisos` VALUES (26, 26, 750, '', '2019-04-11 13:38:23', '2019-04-11 13:38:23');
INSERT INTO `usuario_permisos` VALUES (27, 27, 750, '', '2019-04-11 13:38:23', '2019-04-11 13:38:23');
INSERT INTO `usuario_permisos` VALUES (28, 28, 750, '', '2019-04-11 13:38:23', '2019-04-11 13:38:23');
INSERT INTO `usuario_permisos` VALUES (29, 29, 750, '', '2019-04-11 13:43:09', '2019-04-11 13:43:11');
INSERT INTO `usuario_permisos` VALUES (30, 30, 750, '', '2019-04-11 13:57:57', '2019-04-11 13:58:00');
INSERT INTO `usuario_permisos` VALUES (31, 31, 750, '', '2019-04-11 14:01:04', '2019-04-11 14:01:07');
INSERT INTO `usuario_permisos` VALUES (32, 32, 750, '', '2019-04-11 14:11:01', '2019-04-11 14:11:03');
INSERT INTO `usuario_permisos` VALUES (33, 33, 750, '', '2019-04-11 14:29:27', '2019-04-11 14:29:29');
INSERT INTO `usuario_permisos` VALUES (34, 34, 750, '', '2019-04-11 17:35:17', '2019-04-11 17:35:19');
INSERT INTO `usuario_permisos` VALUES (35, 35, 750, '', '2019-04-11 18:07:14', '2019-04-11 18:07:14');
INSERT INTO `usuario_permisos` VALUES (36, 36, 750, '', '2019-04-11 18:07:14', '2019-04-11 18:07:14');
INSERT INTO `usuario_permisos` VALUES (37, 37, 750, '', '2019-04-11 18:07:14', '2019-04-11 18:07:14');
INSERT INTO `usuario_permisos` VALUES (38, 38, 750, '', '2019-04-11 18:07:14', '2019-04-11 18:07:14');
INSERT INTO `usuario_permisos` VALUES (39, 39, 750, '', '2019-04-11 18:07:14', '2019-04-11 18:07:14');
INSERT INTO `usuario_permisos` VALUES (40, 40, 750, '', '2019-04-11 18:19:57', '2019-04-11 18:19:59');
INSERT INTO `usuario_permisos` VALUES (41, 41, 750, '', '2019-04-17 14:26:12', '2019-04-17 14:26:14');
INSERT INTO `usuario_permisos` VALUES (42, 42, 750, '', '2019-04-23 12:01:34', '2019-04-23 12:01:36');
INSERT INTO `usuario_permisos` VALUES (43, 43, 750, '', '2019-04-23 12:01:34', '2019-04-23 12:01:34');
INSERT INTO `usuario_permisos` VALUES (44, 1, 750, '', '2019-04-11 13:38:23', '2019-04-11 13:38:23');
INSERT INTO `usuario_permisos` VALUES (45, 2, 750, '', '2019-04-11 13:38:23', '2019-04-11 13:38:23');
INSERT INTO `usuario_permisos` VALUES (46, 3, 750, '', '2019-04-11 13:38:23', '2019-04-11 13:38:23');
INSERT INTO `usuario_permisos` VALUES (47, 4, 750, '', '2019-04-11 13:38:23', '2019-04-11 13:38:23');
INSERT INTO `usuario_permisos` VALUES (48, 5, 750, '', '2019-04-11 13:38:23', '2019-04-11 13:38:23');
INSERT INTO `usuario_permisos` VALUES (49, 6, 750, '', '2019-04-11 13:38:23', '2019-04-11 13:38:23');
INSERT INTO `usuario_permisos` VALUES (50, 7, 750, '', '2019-04-11 13:38:23', '2019-04-11 13:38:23');
INSERT INTO `usuario_permisos` VALUES (51, 8, 750, '', '2019-04-11 13:38:23', '2019-04-11 13:38:23');
INSERT INTO `usuario_permisos` VALUES (52, 9, 750, '', '2019-04-11 13:38:23', '2019-04-11 13:38:23');
INSERT INTO `usuario_permisos` VALUES (53, 10, 750, '', '2019-04-11 13:38:23', '2019-04-11 13:38:23');
INSERT INTO `usuario_permisos` VALUES (54, 11, 750, '', '2019-04-11 13:38:23', '2019-04-11 13:38:23');
INSERT INTO `usuario_permisos` VALUES (55, 12, 750, '', '2019-04-11 13:38:23', '2019-04-11 13:38:23');
INSERT INTO `usuario_permisos` VALUES (56, 13, 750, '', '2019-04-11 13:38:23', '2019-04-11 13:38:23');
INSERT INTO `usuario_permisos` VALUES (57, 14, 750, '', '2019-04-11 13:38:23', '2019-04-11 13:38:23');
INSERT INTO `usuario_permisos` VALUES (58, 15, 750, '', '2019-04-11 13:38:23', '2019-04-11 13:38:23');
INSERT INTO `usuario_permisos` VALUES (59, 16, 750, '', '2019-04-11 13:38:23', '2019-04-11 13:38:23');
INSERT INTO `usuario_permisos` VALUES (60, 17, 750, '', '2019-04-11 13:38:23', '2019-04-11 13:38:23');
INSERT INTO `usuario_permisos` VALUES (61, 18, 750, '', '2019-04-11 13:38:23', '2019-04-11 13:38:23');
INSERT INTO `usuario_permisos` VALUES (62, 19, 750, '', '2019-04-11 13:38:23', '2019-04-11 13:38:23');
INSERT INTO `usuario_permisos` VALUES (63, 20, 750, '', '2019-04-11 13:38:23', '2019-04-11 13:38:23');
INSERT INTO `usuario_permisos` VALUES (64, 21, 750, '', '2019-04-11 13:38:23', '2019-04-11 13:38:23');
INSERT INTO `usuario_permisos` VALUES (65, 22, 750, '', '2019-04-11 13:38:23', '2019-04-11 13:38:23');
INSERT INTO `usuario_permisos` VALUES (66, 23, 750, '', '2019-04-11 13:38:23', '2019-04-11 13:38:23');
INSERT INTO `usuario_permisos` VALUES (67, 24, 750, '', '2019-04-11 13:38:23', '2019-04-11 13:38:23');
INSERT INTO `usuario_permisos` VALUES (68, 25, 750, '', '2019-04-11 13:38:23', '2019-04-11 13:38:23');
INSERT INTO `usuario_permisos` VALUES (69, 26, 750, '', '2019-04-11 13:38:23', '2019-04-11 13:38:23');
INSERT INTO `usuario_permisos` VALUES (70, 27, 750, '', '2019-04-11 13:38:23', '2019-04-11 13:38:23');
INSERT INTO `usuario_permisos` VALUES (71, 28, 750, '', '2019-04-11 13:38:23', '2019-04-11 13:38:23');
INSERT INTO `usuario_permisos` VALUES (72, 29, 750, '', '2019-04-11 13:43:09', '2019-04-11 13:43:11');
INSERT INTO `usuario_permisos` VALUES (73, 30, 750, '', '2019-04-11 13:57:57', '2019-04-11 13:58:00');
INSERT INTO `usuario_permisos` VALUES (74, 31, 750, '', '2019-04-11 14:01:04', '2019-04-11 14:01:07');
INSERT INTO `usuario_permisos` VALUES (75, 32, 750, '', '2019-04-11 14:11:01', '2019-04-11 14:11:03');
INSERT INTO `usuario_permisos` VALUES (76, 33, 750, '', '2019-04-11 14:29:27', '2019-04-11 14:29:29');
INSERT INTO `usuario_permisos` VALUES (77, 34, 750, '', '2019-04-11 17:35:17', '2019-04-11 17:35:19');
INSERT INTO `usuario_permisos` VALUES (78, 35, 750, '', '2019-04-11 18:07:14', '2019-04-11 18:07:14');
INSERT INTO `usuario_permisos` VALUES (79, 36, 750, '', '2019-04-11 18:07:14', '2019-04-11 18:07:14');
INSERT INTO `usuario_permisos` VALUES (80, 37, 750, '', '2019-04-11 18:07:14', '2019-04-11 18:07:14');
INSERT INTO `usuario_permisos` VALUES (81, 38, 750, '', '2019-04-11 18:07:14', '2019-04-11 18:07:14');
INSERT INTO `usuario_permisos` VALUES (82, 39, 750, '', '2019-04-11 18:07:14', '2019-04-11 18:07:14');
INSERT INTO `usuario_permisos` VALUES (83, 40, 750, '', '2019-04-11 18:19:57', '2019-04-11 18:19:59');
INSERT INTO `usuario_permisos` VALUES (84, 41, 750, '', '2019-04-17 14:26:12', '2019-04-17 14:26:14');
INSERT INTO `usuario_permisos` VALUES (85, 42, 750, '', '2019-04-23 12:01:34', '2019-04-23 12:01:36');
INSERT INTO `usuario_permisos` VALUES (86, 43, 750, '', '2019-04-23 12:01:34', '2019-04-23 12:01:34');
INSERT INTO `usuario_permisos` VALUES (301, 44, 750, NULL, '2019-05-13 09:45:47', '2019-05-13 09:45:47');
INSERT INTO `usuario_permisos` VALUES (469, 47, 750, NULL, '2019-05-22 12:05:18', '2019-05-22 12:05:18');
INSERT INTO `usuario_permisos` VALUES (470, 48, 750, NULL, '2019-05-23 10:31:59', '2019-05-23 10:31:59');
INSERT INTO `usuario_permisos` VALUES (471, 52, 750, NULL, '2019-05-23 13:56:07', '2019-05-23 13:56:07');
INSERT INTO `usuario_permisos` VALUES (472, 50, 750, NULL, '2019-05-23 13:56:54', '2019-05-23 13:56:54');
INSERT INTO `usuario_permisos` VALUES (473, 51, 750, NULL, '2019-05-23 13:56:54', '2019-05-23 13:56:54');
INSERT INTO `usuario_permisos` VALUES (550, 53, 750, NULL, '2019-05-27 13:27:18', '2019-05-27 13:27:18');
INSERT INTO `usuario_permisos` VALUES (605, 45, 750, NULL, '2019-05-29 09:34:11', '2019-05-29 09:34:11');
INSERT INTO `usuario_permisos` VALUES (606, 46, 750, NULL, '2019-05-29 09:41:15', '2019-05-29 09:41:15');
INSERT INTO `usuario_permisos` VALUES (607, 55, 750, NULL, '2019-05-29 12:24:02', '2019-05-29 12:24:02');
INSERT INTO `usuario_permisos` VALUES (923, 57, 750, NULL, '2019-06-21 13:28:21', '2019-06-21 13:28:21');
INSERT INTO `usuario_permisos` VALUES (924, 59, 750, NULL, '2019-06-21 13:33:52', '2019-06-21 13:33:52');
INSERT INTO `usuario_permisos` VALUES (925, 61, 750, NULL, '2019-06-21 13:37:13', '2019-06-21 13:37:13');
INSERT INTO `usuario_permisos` VALUES (927, 60, 750, NULL, '2019-06-21 13:40:45', '2019-06-21 13:40:45');
INSERT INTO `usuario_permisos` VALUES (928, 58, 750, NULL, '2019-06-21 13:40:57', '2019-06-21 13:40:57');
INSERT INTO `usuario_permisos` VALUES (929, 62, 750, NULL, '2019-06-24 18:56:40', '2019-06-24 18:56:40');
INSERT INTO `usuario_permisos` VALUES (953, 8, 536, NULL, '2019-07-01 11:31:03', '2019-07-01 11:31:03');
INSERT INTO `usuario_permisos` VALUES (954, 27, 536, NULL, '2019-07-01 11:31:03', '2019-07-01 11:31:03');
INSERT INTO `usuario_permisos` VALUES (955, 30, 536, NULL, '2019-07-01 11:31:03', '2019-07-01 11:31:03');
INSERT INTO `usuario_permisos` VALUES (956, 31, 536, NULL, '2019-07-01 11:31:03', '2019-07-01 11:31:03');
INSERT INTO `usuario_permisos` VALUES (957, 9, 536, NULL, '2019-07-01 11:31:03', '2019-07-01 11:31:03');
INSERT INTO `usuario_permisos` VALUES (958, 45, 536, NULL, '2019-07-01 11:31:03', '2019-07-01 11:31:03');
INSERT INTO `usuario_permisos` VALUES (959, 46, 536, NULL, '2019-07-01 11:31:03', '2019-07-01 11:31:03');
INSERT INTO `usuario_permisos` VALUES (960, 63, 750, NULL, '2019-07-01 11:39:28', '2019-07-01 11:39:28');
INSERT INTO `usuario_permisos` VALUES (961, 1, 732, NULL, '2019-07-01 11:45:34', '2019-07-01 11:45:34');
INSERT INTO `usuario_permisos` VALUES (962, 2, 732, NULL, '2019-07-01 11:45:34', '2019-07-01 11:45:34');
INSERT INTO `usuario_permisos` VALUES (963, 3, 732, NULL, '2019-07-01 11:45:34', '2019-07-01 11:45:34');
INSERT INTO `usuario_permisos` VALUES (964, 4, 732, NULL, '2019-07-01 11:45:34', '2019-07-01 11:45:34');
INSERT INTO `usuario_permisos` VALUES (965, 5, 732, NULL, '2019-07-01 11:45:35', '2019-07-01 11:45:35');
INSERT INTO `usuario_permisos` VALUES (966, 6, 732, NULL, '2019-07-01 11:45:35', '2019-07-01 11:45:35');
INSERT INTO `usuario_permisos` VALUES (967, 7, 732, NULL, '2019-07-01 11:45:35', '2019-07-01 11:45:35');
INSERT INTO `usuario_permisos` VALUES (968, 8, 732, NULL, '2019-07-01 11:45:35', '2019-07-01 11:45:35');
INSERT INTO `usuario_permisos` VALUES (969, 9, 732, NULL, '2019-07-01 11:45:35', '2019-07-01 11:45:35');
INSERT INTO `usuario_permisos` VALUES (970, 10, 732, NULL, '2019-07-01 11:45:35', '2019-07-01 11:45:35');
INSERT INTO `usuario_permisos` VALUES (971, 11, 732, NULL, '2019-07-01 11:45:35', '2019-07-01 11:45:35');
INSERT INTO `usuario_permisos` VALUES (972, 12, 732, NULL, '2019-07-01 11:45:35', '2019-07-01 11:45:35');
INSERT INTO `usuario_permisos` VALUES (973, 13, 732, NULL, '2019-07-01 11:45:35', '2019-07-01 11:45:35');
INSERT INTO `usuario_permisos` VALUES (974, 14, 732, NULL, '2019-07-01 11:45:35', '2019-07-01 11:45:35');
INSERT INTO `usuario_permisos` VALUES (975, 15, 732, NULL, '2019-07-01 11:45:35', '2019-07-01 11:45:35');
INSERT INTO `usuario_permisos` VALUES (976, 16, 732, NULL, '2019-07-01 11:45:35', '2019-07-01 11:45:35');
INSERT INTO `usuario_permisos` VALUES (977, 17, 732, NULL, '2019-07-01 11:45:35', '2019-07-01 11:45:35');
INSERT INTO `usuario_permisos` VALUES (978, 18, 732, NULL, '2019-07-01 11:45:35', '2019-07-01 11:45:35');
INSERT INTO `usuario_permisos` VALUES (979, 19, 732, NULL, '2019-07-01 11:45:35', '2019-07-01 11:45:35');
INSERT INTO `usuario_permisos` VALUES (980, 20, 732, NULL, '2019-07-01 11:45:35', '2019-07-01 11:45:35');
INSERT INTO `usuario_permisos` VALUES (981, 21, 732, NULL, '2019-07-01 11:45:35', '2019-07-01 11:45:35');
INSERT INTO `usuario_permisos` VALUES (982, 22, 732, NULL, '2019-07-01 11:45:35', '2019-07-01 11:45:35');
INSERT INTO `usuario_permisos` VALUES (983, 23, 732, NULL, '2019-07-01 11:45:35', '2019-07-01 11:45:35');
INSERT INTO `usuario_permisos` VALUES (984, 24, 732, NULL, '2019-07-01 11:45:35', '2019-07-01 11:45:35');
INSERT INTO `usuario_permisos` VALUES (985, 25, 732, NULL, '2019-07-01 11:45:35', '2019-07-01 11:45:35');
INSERT INTO `usuario_permisos` VALUES (986, 26, 732, NULL, '2019-07-01 11:45:35', '2019-07-01 11:45:35');
INSERT INTO `usuario_permisos` VALUES (987, 27, 732, NULL, '2019-07-01 11:45:35', '2019-07-01 11:45:35');
INSERT INTO `usuario_permisos` VALUES (988, 28, 732, NULL, '2019-07-01 11:45:35', '2019-07-01 11:45:35');
INSERT INTO `usuario_permisos` VALUES (989, 29, 732, NULL, '2019-07-01 11:45:35', '2019-07-01 11:45:35');
INSERT INTO `usuario_permisos` VALUES (990, 30, 732, NULL, '2019-07-01 11:45:35', '2019-07-01 11:45:35');
INSERT INTO `usuario_permisos` VALUES (991, 31, 732, NULL, '2019-07-01 11:45:35', '2019-07-01 11:45:35');
INSERT INTO `usuario_permisos` VALUES (992, 32, 732, NULL, '2019-07-01 11:45:35', '2019-07-01 11:45:35');
INSERT INTO `usuario_permisos` VALUES (993, 33, 732, NULL, '2019-07-01 11:45:35', '2019-07-01 11:45:35');
INSERT INTO `usuario_permisos` VALUES (994, 34, 732, NULL, '2019-07-01 11:45:35', '2019-07-01 11:45:35');
INSERT INTO `usuario_permisos` VALUES (995, 35, 732, NULL, '2019-07-01 11:45:35', '2019-07-01 11:45:35');
INSERT INTO `usuario_permisos` VALUES (996, 36, 732, NULL, '2019-07-01 11:45:35', '2019-07-01 11:45:35');
INSERT INTO `usuario_permisos` VALUES (997, 37, 732, NULL, '2019-07-01 11:45:35', '2019-07-01 11:45:35');
INSERT INTO `usuario_permisos` VALUES (998, 38, 732, NULL, '2019-07-01 11:45:35', '2019-07-01 11:45:35');
INSERT INTO `usuario_permisos` VALUES (999, 39, 732, NULL, '2019-07-01 11:45:35', '2019-07-01 11:45:35');
INSERT INTO `usuario_permisos` VALUES (1000, 40, 732, NULL, '2019-07-01 11:45:35', '2019-07-01 11:45:35');
INSERT INTO `usuario_permisos` VALUES (1001, 41, 732, NULL, '2019-07-01 11:45:35', '2019-07-01 11:45:35');
INSERT INTO `usuario_permisos` VALUES (1002, 42, 732, NULL, '2019-07-01 11:45:35', '2019-07-01 11:45:35');
INSERT INTO `usuario_permisos` VALUES (1003, 43, 732, NULL, '2019-07-01 11:45:35', '2019-07-01 11:45:35');
INSERT INTO `usuario_permisos` VALUES (1004, 44, 732, NULL, '2019-07-01 11:45:35', '2019-07-01 11:45:35');
INSERT INTO `usuario_permisos` VALUES (1005, 45, 732, NULL, '2019-07-01 11:45:35', '2019-07-01 11:45:35');
INSERT INTO `usuario_permisos` VALUES (1006, 46, 732, NULL, '2019-07-01 11:45:35', '2019-07-01 11:45:35');
INSERT INTO `usuario_permisos` VALUES (1007, 47, 732, NULL, '2019-07-01 11:45:35', '2019-07-01 11:45:35');
INSERT INTO `usuario_permisos` VALUES (1008, 48, 732, NULL, '2019-07-01 11:45:36', '2019-07-01 11:45:36');
INSERT INTO `usuario_permisos` VALUES (1009, 50, 732, NULL, '2019-07-01 11:45:36', '2019-07-01 11:45:36');
INSERT INTO `usuario_permisos` VALUES (1010, 51, 732, NULL, '2019-07-01 11:45:36', '2019-07-01 11:45:36');
INSERT INTO `usuario_permisos` VALUES (1011, 52, 732, NULL, '2019-07-01 11:45:36', '2019-07-01 11:45:36');
INSERT INTO `usuario_permisos` VALUES (1012, 53, 732, NULL, '2019-07-01 11:45:36', '2019-07-01 11:45:36');
INSERT INTO `usuario_permisos` VALUES (1013, 55, 732, NULL, '2019-07-01 11:45:36', '2019-07-01 11:45:36');
INSERT INTO `usuario_permisos` VALUES (1014, 56, 732, NULL, '2019-07-01 11:45:36', '2019-07-01 11:45:36');
INSERT INTO `usuario_permisos` VALUES (1015, 57, 732, NULL, '2019-07-01 11:45:36', '2019-07-01 11:45:36');
INSERT INTO `usuario_permisos` VALUES (1016, 58, 732, NULL, '2019-07-01 11:45:36', '2019-07-01 11:45:36');
INSERT INTO `usuario_permisos` VALUES (1017, 59, 732, NULL, '2019-07-01 11:45:36', '2019-07-01 11:45:36');
INSERT INTO `usuario_permisos` VALUES (1018, 60, 732, NULL, '2019-07-01 11:45:36', '2019-07-01 11:45:36');
INSERT INTO `usuario_permisos` VALUES (1019, 61, 732, NULL, '2019-07-01 11:45:36', '2019-07-01 11:45:36');
INSERT INTO `usuario_permisos` VALUES (1020, 62, 732, NULL, '2019-07-01 11:45:36', '2019-07-01 11:45:36');
INSERT INTO `usuario_permisos` VALUES (1021, 63, 732, NULL, '2019-07-01 11:45:36', '2019-07-01 11:45:36');
INSERT INTO `usuario_permisos` VALUES (1022, 12, 536, NULL, '2019-07-01 16:46:52', '2019-07-01 16:46:52');
INSERT INTO `usuario_permisos` VALUES (1023, 21, 536, NULL, '2019-07-01 16:46:52', '2019-07-01 16:46:52');
INSERT INTO `usuario_permisos` VALUES (1025, 8, 789, NULL, '2019-07-02 09:40:05', '2019-07-02 09:40:05');
INSERT INTO `usuario_permisos` VALUES (1029, 8, 791, NULL, '2019-07-02 10:03:48', '2019-07-02 10:03:48');
INSERT INTO `usuario_permisos` VALUES (1030, 27, 791, NULL, '2019-07-02 10:03:48', '2019-07-02 10:03:48');
INSERT INTO `usuario_permisos` VALUES (1031, 30, 791, NULL, '2019-07-02 10:03:48', '2019-07-02 10:03:48');
INSERT INTO `usuario_permisos` VALUES (1032, 31, 791, NULL, '2019-07-02 10:03:48', '2019-07-02 10:03:48');
INSERT INTO `usuario_permisos` VALUES (1033, 8, 778, NULL, '2019-07-02 10:12:48', '2019-07-02 10:12:48');
INSERT INTO `usuario_permisos` VALUES (1034, 27, 778, NULL, '2019-07-02 10:12:49', '2019-07-02 10:12:49');
INSERT INTO `usuario_permisos` VALUES (1035, 30, 778, NULL, '2019-07-02 10:12:49', '2019-07-02 10:12:49');
INSERT INTO `usuario_permisos` VALUES (1036, 31, 778, NULL, '2019-07-02 10:12:49', '2019-07-02 10:12:49');
INSERT INTO `usuario_permisos` VALUES (1037, 8, 483, NULL, '2019-07-02 10:29:18', '2019-07-02 10:29:18');
INSERT INTO `usuario_permisos` VALUES (1038, 27, 483, NULL, '2019-07-02 10:29:18', '2019-07-02 10:29:18');
INSERT INTO `usuario_permisos` VALUES (1039, 30, 483, NULL, '2019-07-02 10:29:18', '2019-07-02 10:29:18');
INSERT INTO `usuario_permisos` VALUES (1040, 31, 483, NULL, '2019-07-02 10:29:18', '2019-07-02 10:29:18');
INSERT INTO `usuario_permisos` VALUES (1041, 8, 448, NULL, '2019-07-02 17:23:42', '2019-07-02 17:23:42');
INSERT INTO `usuario_permisos` VALUES (1042, 9, 448, NULL, '2019-07-02 17:23:42', '2019-07-02 17:23:42');
INSERT INTO `usuario_permisos` VALUES (1043, 10, 448, NULL, '2019-07-02 17:23:42', '2019-07-02 17:23:42');
INSERT INTO `usuario_permisos` VALUES (1044, 16, 448, NULL, '2019-07-02 17:23:42', '2019-07-02 17:23:42');
INSERT INTO `usuario_permisos` VALUES (1045, 17, 448, NULL, '2019-07-02 17:23:42', '2019-07-02 17:23:42');
INSERT INTO `usuario_permisos` VALUES (1046, 18, 448, NULL, '2019-07-02 17:23:42', '2019-07-02 17:23:42');
INSERT INTO `usuario_permisos` VALUES (1047, 19, 448, NULL, '2019-07-02 17:23:42', '2019-07-02 17:23:42');
INSERT INTO `usuario_permisos` VALUES (1048, 20, 448, NULL, '2019-07-02 17:23:42', '2019-07-02 17:23:42');
INSERT INTO `usuario_permisos` VALUES (1049, 25, 448, NULL, '2019-07-02 17:23:42', '2019-07-02 17:23:42');
INSERT INTO `usuario_permisos` VALUES (1050, 26, 448, NULL, '2019-07-02 17:23:42', '2019-07-02 17:23:42');
INSERT INTO `usuario_permisos` VALUES (1051, 27, 448, NULL, '2019-07-02 17:23:42', '2019-07-02 17:23:42');
INSERT INTO `usuario_permisos` VALUES (1052, 28, 448, NULL, '2019-07-02 17:23:42', '2019-07-02 17:23:42');
INSERT INTO `usuario_permisos` VALUES (1053, 29, 448, NULL, '2019-07-02 17:23:42', '2019-07-02 17:23:42');
INSERT INTO `usuario_permisos` VALUES (1054, 30, 448, NULL, '2019-07-02 17:23:42', '2019-07-02 17:23:42');
INSERT INTO `usuario_permisos` VALUES (1055, 31, 448, NULL, '2019-07-02 17:23:43', '2019-07-02 17:23:43');
INSERT INTO `usuario_permisos` VALUES (1057, 34, 448, NULL, '2019-07-02 17:23:43', '2019-07-02 17:23:43');
INSERT INTO `usuario_permisos` VALUES (1058, 36, 448, NULL, '2019-07-02 17:23:43', '2019-07-02 17:23:43');
INSERT INTO `usuario_permisos` VALUES (1059, 37, 448, NULL, '2019-07-02 17:23:43', '2019-07-02 17:23:43');
INSERT INTO `usuario_permisos` VALUES (1060, 38, 448, NULL, '2019-07-02 17:23:43', '2019-07-02 17:23:43');
INSERT INTO `usuario_permisos` VALUES (1061, 41, 448, NULL, '2019-07-02 17:23:43', '2019-07-02 17:23:43');
INSERT INTO `usuario_permisos` VALUES (1062, 42, 448, NULL, '2019-07-02 17:23:43', '2019-07-02 17:23:43');
INSERT INTO `usuario_permisos` VALUES (1063, 43, 448, NULL, '2019-07-02 17:23:43', '2019-07-02 17:23:43');
INSERT INTO `usuario_permisos` VALUES (1064, 44, 448, NULL, '2019-07-02 17:23:43', '2019-07-02 17:23:43');
INSERT INTO `usuario_permisos` VALUES (1065, 45, 448, NULL, '2019-07-02 17:23:43', '2019-07-02 17:23:43');
INSERT INTO `usuario_permisos` VALUES (1066, 46, 448, NULL, '2019-07-02 17:23:43', '2019-07-02 17:23:43');
INSERT INTO `usuario_permisos` VALUES (1067, 53, 448, NULL, '2019-07-02 17:24:24', '2019-07-02 17:24:24');
INSERT INTO `usuario_permisos` VALUES (1068, 8, 719, NULL, '2019-07-02 17:26:58', '2019-07-02 17:26:58');
INSERT INTO `usuario_permisos` VALUES (1069, 9, 719, NULL, '2019-07-02 17:26:59', '2019-07-02 17:26:59');
INSERT INTO `usuario_permisos` VALUES (1070, 10, 719, NULL, '2019-07-02 17:26:59', '2019-07-02 17:26:59');
INSERT INTO `usuario_permisos` VALUES (1071, 16, 719, NULL, '2019-07-02 17:26:59', '2019-07-02 17:26:59');
INSERT INTO `usuario_permisos` VALUES (1072, 17, 719, NULL, '2019-07-02 17:26:59', '2019-07-02 17:26:59');
INSERT INTO `usuario_permisos` VALUES (1073, 18, 719, NULL, '2019-07-02 17:26:59', '2019-07-02 17:26:59');
INSERT INTO `usuario_permisos` VALUES (1074, 19, 719, NULL, '2019-07-02 17:26:59', '2019-07-02 17:26:59');
INSERT INTO `usuario_permisos` VALUES (1075, 20, 719, NULL, '2019-07-02 17:26:59', '2019-07-02 17:26:59');
INSERT INTO `usuario_permisos` VALUES (1076, 25, 719, NULL, '2019-07-02 17:26:59', '2019-07-02 17:26:59');
INSERT INTO `usuario_permisos` VALUES (1077, 26, 719, NULL, '2019-07-02 17:26:59', '2019-07-02 17:26:59');
INSERT INTO `usuario_permisos` VALUES (1078, 27, 719, NULL, '2019-07-02 17:26:59', '2019-07-02 17:26:59');
INSERT INTO `usuario_permisos` VALUES (1079, 28, 719, NULL, '2019-07-02 17:26:59', '2019-07-02 17:26:59');
INSERT INTO `usuario_permisos` VALUES (1080, 29, 719, NULL, '2019-07-02 17:26:59', '2019-07-02 17:26:59');
INSERT INTO `usuario_permisos` VALUES (1081, 30, 719, NULL, '2019-07-02 17:26:59', '2019-07-02 17:26:59');
INSERT INTO `usuario_permisos` VALUES (1082, 31, 719, NULL, '2019-07-02 17:26:59', '2019-07-02 17:26:59');
INSERT INTO `usuario_permisos` VALUES (1085, 36, 719, NULL, '2019-07-02 17:26:59', '2019-07-02 17:26:59');
INSERT INTO `usuario_permisos` VALUES (1086, 37, 719, NULL, '2019-07-02 17:26:59', '2019-07-02 17:26:59');
INSERT INTO `usuario_permisos` VALUES (1087, 38, 719, NULL, '2019-07-02 17:26:59', '2019-07-02 17:26:59');
INSERT INTO `usuario_permisos` VALUES (1088, 41, 719, NULL, '2019-07-02 17:26:59', '2019-07-02 17:26:59');
INSERT INTO `usuario_permisos` VALUES (1089, 42, 719, NULL, '2019-07-02 17:27:00', '2019-07-02 17:27:00');
INSERT INTO `usuario_permisos` VALUES (1090, 43, 719, NULL, '2019-07-02 17:27:00', '2019-07-02 17:27:00');
INSERT INTO `usuario_permisos` VALUES (1091, 44, 719, NULL, '2019-07-02 17:27:00', '2019-07-02 17:27:00');
INSERT INTO `usuario_permisos` VALUES (1092, 45, 719, NULL, '2019-07-02 17:27:00', '2019-07-02 17:27:00');
INSERT INTO `usuario_permisos` VALUES (1093, 46, 719, NULL, '2019-07-02 17:27:00', '2019-07-02 17:27:00');
INSERT INTO `usuario_permisos` VALUES (1094, 53, 719, NULL, '2019-07-02 17:27:39', '2019-07-02 17:27:39');
INSERT INTO `usuario_permisos` VALUES (1095, 8, 518, NULL, '2019-07-02 17:29:31', '2019-07-02 17:29:31');
INSERT INTO `usuario_permisos` VALUES (1096, 9, 518, NULL, '2019-07-02 17:29:31', '2019-07-02 17:29:31');
INSERT INTO `usuario_permisos` VALUES (1097, 10, 518, NULL, '2019-07-02 17:29:31', '2019-07-02 17:29:31');
INSERT INTO `usuario_permisos` VALUES (1098, 16, 518, NULL, '2019-07-02 17:29:32', '2019-07-02 17:29:32');
INSERT INTO `usuario_permisos` VALUES (1099, 17, 518, NULL, '2019-07-02 17:29:32', '2019-07-02 17:29:32');
INSERT INTO `usuario_permisos` VALUES (1100, 18, 518, NULL, '2019-07-02 17:29:32', '2019-07-02 17:29:32');
INSERT INTO `usuario_permisos` VALUES (1101, 19, 518, NULL, '2019-07-02 17:29:32', '2019-07-02 17:29:32');
INSERT INTO `usuario_permisos` VALUES (1102, 20, 518, NULL, '2019-07-02 17:29:32', '2019-07-02 17:29:32');
INSERT INTO `usuario_permisos` VALUES (1103, 25, 518, NULL, '2019-07-02 17:29:32', '2019-07-02 17:29:32');
INSERT INTO `usuario_permisos` VALUES (1104, 26, 518, NULL, '2019-07-02 17:29:32', '2019-07-02 17:29:32');
INSERT INTO `usuario_permisos` VALUES (1105, 27, 518, NULL, '2019-07-02 17:29:32', '2019-07-02 17:29:32');
INSERT INTO `usuario_permisos` VALUES (1106, 28, 518, NULL, '2019-07-02 17:29:32', '2019-07-02 17:29:32');
INSERT INTO `usuario_permisos` VALUES (1107, 29, 518, NULL, '2019-07-02 17:29:32', '2019-07-02 17:29:32');
INSERT INTO `usuario_permisos` VALUES (1108, 30, 518, NULL, '2019-07-02 17:29:32', '2019-07-02 17:29:32');
INSERT INTO `usuario_permisos` VALUES (1109, 31, 518, NULL, '2019-07-02 17:29:32', '2019-07-02 17:29:32');
INSERT INTO `usuario_permisos` VALUES (1112, 36, 518, NULL, '2019-07-02 17:29:32', '2019-07-02 17:29:32');
INSERT INTO `usuario_permisos` VALUES (1113, 37, 518, NULL, '2019-07-02 17:29:32', '2019-07-02 17:29:32');
INSERT INTO `usuario_permisos` VALUES (1114, 38, 518, NULL, '2019-07-02 17:29:32', '2019-07-02 17:29:32');
INSERT INTO `usuario_permisos` VALUES (1115, 41, 518, NULL, '2019-07-02 17:29:32', '2019-07-02 17:29:32');
INSERT INTO `usuario_permisos` VALUES (1116, 42, 518, NULL, '2019-07-02 17:29:32', '2019-07-02 17:29:32');
INSERT INTO `usuario_permisos` VALUES (1117, 43, 518, NULL, '2019-07-02 17:29:32', '2019-07-02 17:29:32');
INSERT INTO `usuario_permisos` VALUES (1118, 44, 518, NULL, '2019-07-02 17:29:32', '2019-07-02 17:29:32');
INSERT INTO `usuario_permisos` VALUES (1119, 45, 518, NULL, '2019-07-02 17:29:33', '2019-07-02 17:29:33');
INSERT INTO `usuario_permisos` VALUES (1120, 46, 518, NULL, '2019-07-02 17:29:33', '2019-07-02 17:29:33');
INSERT INTO `usuario_permisos` VALUES (1121, 53, 518, NULL, '2019-07-02 17:30:09', '2019-07-02 17:30:09');
INSERT INTO `usuario_permisos` VALUES (1122, 8, 517, NULL, '2019-07-02 17:31:29', '2019-07-02 17:31:29');
INSERT INTO `usuario_permisos` VALUES (1123, 9, 517, NULL, '2019-07-02 17:31:29', '2019-07-02 17:31:29');
INSERT INTO `usuario_permisos` VALUES (1124, 10, 517, NULL, '2019-07-02 17:31:29', '2019-07-02 17:31:29');
INSERT INTO `usuario_permisos` VALUES (1125, 16, 517, NULL, '2019-07-02 17:31:29', '2019-07-02 17:31:29');
INSERT INTO `usuario_permisos` VALUES (1126, 17, 517, NULL, '2019-07-02 17:31:29', '2019-07-02 17:31:29');
INSERT INTO `usuario_permisos` VALUES (1127, 18, 517, NULL, '2019-07-02 17:31:29', '2019-07-02 17:31:29');
INSERT INTO `usuario_permisos` VALUES (1128, 19, 517, NULL, '2019-07-02 17:31:29', '2019-07-02 17:31:29');
INSERT INTO `usuario_permisos` VALUES (1129, 20, 517, NULL, '2019-07-02 17:31:29', '2019-07-02 17:31:29');
INSERT INTO `usuario_permisos` VALUES (1130, 25, 517, NULL, '2019-07-02 17:31:29', '2019-07-02 17:31:29');
INSERT INTO `usuario_permisos` VALUES (1131, 26, 517, NULL, '2019-07-02 17:31:29', '2019-07-02 17:31:29');
INSERT INTO `usuario_permisos` VALUES (1132, 27, 517, NULL, '2019-07-02 17:31:29', '2019-07-02 17:31:29');
INSERT INTO `usuario_permisos` VALUES (1133, 28, 517, NULL, '2019-07-02 17:31:29', '2019-07-02 17:31:29');
INSERT INTO `usuario_permisos` VALUES (1134, 29, 517, NULL, '2019-07-02 17:31:29', '2019-07-02 17:31:29');
INSERT INTO `usuario_permisos` VALUES (1135, 30, 517, NULL, '2019-07-02 17:31:29', '2019-07-02 17:31:29');
INSERT INTO `usuario_permisos` VALUES (1136, 31, 517, NULL, '2019-07-02 17:31:29', '2019-07-02 17:31:29');
INSERT INTO `usuario_permisos` VALUES (1139, 36, 517, NULL, '2019-07-02 17:31:30', '2019-07-02 17:31:30');
INSERT INTO `usuario_permisos` VALUES (1140, 37, 517, NULL, '2019-07-02 17:31:30', '2019-07-02 17:31:30');
INSERT INTO `usuario_permisos` VALUES (1141, 38, 517, NULL, '2019-07-02 17:31:30', '2019-07-02 17:31:30');
INSERT INTO `usuario_permisos` VALUES (1142, 41, 517, NULL, '2019-07-02 17:31:30', '2019-07-02 17:31:30');
INSERT INTO `usuario_permisos` VALUES (1143, 42, 517, NULL, '2019-07-02 17:31:30', '2019-07-02 17:31:30');
INSERT INTO `usuario_permisos` VALUES (1144, 43, 517, NULL, '2019-07-02 17:31:30', '2019-07-02 17:31:30');
INSERT INTO `usuario_permisos` VALUES (1145, 44, 517, NULL, '2019-07-02 17:31:30', '2019-07-02 17:31:30');
INSERT INTO `usuario_permisos` VALUES (1146, 45, 517, NULL, '2019-07-02 17:31:30', '2019-07-02 17:31:30');
INSERT INTO `usuario_permisos` VALUES (1147, 46, 517, NULL, '2019-07-02 17:31:30', '2019-07-02 17:31:30');
INSERT INTO `usuario_permisos` VALUES (1148, 53, 517, NULL, '2019-07-02 17:31:44', '2019-07-02 17:31:44');
INSERT INTO `usuario_permisos` VALUES (1149, 8, 45, NULL, '2019-07-02 17:33:37', '2019-07-02 17:33:37');
INSERT INTO `usuario_permisos` VALUES (1150, 9, 45, NULL, '2019-07-02 17:33:37', '2019-07-02 17:33:37');
INSERT INTO `usuario_permisos` VALUES (1151, 10, 45, NULL, '2019-07-02 17:33:37', '2019-07-02 17:33:37');
INSERT INTO `usuario_permisos` VALUES (1152, 16, 45, NULL, '2019-07-02 17:33:37', '2019-07-02 17:33:37');
INSERT INTO `usuario_permisos` VALUES (1153, 17, 45, NULL, '2019-07-02 17:33:37', '2019-07-02 17:33:37');
INSERT INTO `usuario_permisos` VALUES (1154, 18, 45, NULL, '2019-07-02 17:33:37', '2019-07-02 17:33:37');
INSERT INTO `usuario_permisos` VALUES (1155, 19, 45, NULL, '2019-07-02 17:33:37', '2019-07-02 17:33:37');
INSERT INTO `usuario_permisos` VALUES (1156, 20, 45, NULL, '2019-07-02 17:33:37', '2019-07-02 17:33:37');
INSERT INTO `usuario_permisos` VALUES (1157, 25, 45, NULL, '2019-07-02 17:33:37', '2019-07-02 17:33:37');
INSERT INTO `usuario_permisos` VALUES (1158, 26, 45, NULL, '2019-07-02 17:33:37', '2019-07-02 17:33:37');
INSERT INTO `usuario_permisos` VALUES (1159, 27, 45, NULL, '2019-07-02 17:33:37', '2019-07-02 17:33:37');
INSERT INTO `usuario_permisos` VALUES (1160, 28, 45, NULL, '2019-07-02 17:33:37', '2019-07-02 17:33:37');
INSERT INTO `usuario_permisos` VALUES (1161, 29, 45, NULL, '2019-07-02 17:33:37', '2019-07-02 17:33:37');
INSERT INTO `usuario_permisos` VALUES (1162, 30, 45, NULL, '2019-07-02 17:33:37', '2019-07-02 17:33:37');
INSERT INTO `usuario_permisos` VALUES (1163, 31, 45, NULL, '2019-07-02 17:33:37', '2019-07-02 17:33:37');
INSERT INTO `usuario_permisos` VALUES (1164, 32, 45, NULL, '2019-07-02 17:33:37', '2019-07-02 17:33:37');
INSERT INTO `usuario_permisos` VALUES (1165, 34, 45, NULL, '2019-07-02 17:33:37', '2019-07-02 17:33:37');
INSERT INTO `usuario_permisos` VALUES (1166, 36, 45, NULL, '2019-07-02 17:33:37', '2019-07-02 17:33:37');
INSERT INTO `usuario_permisos` VALUES (1167, 37, 45, NULL, '2019-07-02 17:33:38', '2019-07-02 17:33:38');
INSERT INTO `usuario_permisos` VALUES (1168, 38, 45, NULL, '2019-07-02 17:33:38', '2019-07-02 17:33:38');
INSERT INTO `usuario_permisos` VALUES (1169, 41, 45, NULL, '2019-07-02 17:33:38', '2019-07-02 17:33:38');
INSERT INTO `usuario_permisos` VALUES (1170, 42, 45, NULL, '2019-07-02 17:33:38', '2019-07-02 17:33:38');
INSERT INTO `usuario_permisos` VALUES (1171, 43, 45, NULL, '2019-07-02 17:33:38', '2019-07-02 17:33:38');
INSERT INTO `usuario_permisos` VALUES (1172, 44, 45, NULL, '2019-07-02 17:33:38', '2019-07-02 17:33:38');
INSERT INTO `usuario_permisos` VALUES (1173, 45, 45, NULL, '2019-07-02 17:33:38', '2019-07-02 17:33:38');
INSERT INTO `usuario_permisos` VALUES (1174, 46, 45, NULL, '2019-07-02 17:33:38', '2019-07-02 17:33:38');
INSERT INTO `usuario_permisos` VALUES (1175, 52, 45, NULL, '2019-07-02 17:34:32', '2019-07-02 17:34:32');
INSERT INTO `usuario_permisos` VALUES (1176, 53, 45, NULL, '2019-07-02 17:34:32', '2019-07-02 17:34:32');
INSERT INTO `usuario_permisos` VALUES (1177, 57, 45, NULL, '2019-07-02 17:34:32', '2019-07-02 17:34:32');
INSERT INTO `usuario_permisos` VALUES (1178, 58, 45, NULL, '2019-07-02 17:34:32', '2019-07-02 17:34:32');
INSERT INTO `usuario_permisos` VALUES (1179, 59, 45, NULL, '2019-07-02 17:34:33', '2019-07-02 17:34:33');
INSERT INTO `usuario_permisos` VALUES (1180, 60, 45, NULL, '2019-07-02 17:34:33', '2019-07-02 17:34:33');
INSERT INTO `usuario_permisos` VALUES (1181, 61, 45, NULL, '2019-07-02 17:34:33', '2019-07-02 17:34:33');
INSERT INTO `usuario_permisos` VALUES (1182, 8, 793, NULL, '2019-07-03 09:14:52', '2019-07-03 09:14:52');
INSERT INTO `usuario_permisos` VALUES (1183, 9, 793, NULL, '2019-07-03 09:14:52', '2019-07-03 09:14:52');
INSERT INTO `usuario_permisos` VALUES (1184, 10, 793, NULL, '2019-07-03 09:14:52', '2019-07-03 09:14:52');
INSERT INTO `usuario_permisos` VALUES (1188, 18, 793, NULL, '2019-07-03 09:14:53', '2019-07-03 09:14:53');
INSERT INTO `usuario_permisos` VALUES (1189, 19, 793, NULL, '2019-07-03 09:14:53', '2019-07-03 09:14:53');
INSERT INTO `usuario_permisos` VALUES (1190, 20, 793, NULL, '2019-07-03 09:14:53', '2019-07-03 09:14:53');
INSERT INTO `usuario_permisos` VALUES (1191, 26, 793, NULL, '2019-07-03 09:14:53', '2019-07-03 09:14:53');
INSERT INTO `usuario_permisos` VALUES (1192, 27, 793, NULL, '2019-07-03 09:14:53', '2019-07-03 09:14:53');
INSERT INTO `usuario_permisos` VALUES (1193, 28, 793, NULL, '2019-07-03 09:14:53', '2019-07-03 09:14:53');
INSERT INTO `usuario_permisos` VALUES (1194, 29, 793, NULL, '2019-07-03 09:14:53', '2019-07-03 09:14:53');
INSERT INTO `usuario_permisos` VALUES (1195, 30, 793, NULL, '2019-07-03 09:14:53', '2019-07-03 09:14:53');
INSERT INTO `usuario_permisos` VALUES (1196, 31, 793, NULL, '2019-07-03 09:14:53', '2019-07-03 09:14:53');
INSERT INTO `usuario_permisos` VALUES (1197, 32, 793, NULL, '2019-07-03 09:14:53', '2019-07-03 09:14:53');
INSERT INTO `usuario_permisos` VALUES (1198, 33, 793, NULL, '2019-07-03 09:14:53', '2019-07-03 09:14:53');
INSERT INTO `usuario_permisos` VALUES (1199, 34, 793, NULL, '2019-07-03 09:14:53', '2019-07-03 09:14:53');
INSERT INTO `usuario_permisos` VALUES (1200, 36, 793, NULL, '2019-07-03 09:14:53', '2019-07-03 09:14:53');
INSERT INTO `usuario_permisos` VALUES (1201, 37, 793, NULL, '2019-07-03 09:14:53', '2019-07-03 09:14:53');
INSERT INTO `usuario_permisos` VALUES (1202, 38, 793, NULL, '2019-07-03 09:14:53', '2019-07-03 09:14:53');
INSERT INTO `usuario_permisos` VALUES (1203, 39, 793, NULL, '2019-07-03 09:14:53', '2019-07-03 09:14:53');
INSERT INTO `usuario_permisos` VALUES (1204, 40, 793, NULL, '2019-07-03 09:14:53', '2019-07-03 09:14:53');
INSERT INTO `usuario_permisos` VALUES (1205, 42, 793, NULL, '2019-07-03 09:14:53', '2019-07-03 09:14:53');
INSERT INTO `usuario_permisos` VALUES (1206, 43, 793, NULL, '2019-07-03 09:14:54', '2019-07-03 09:14:54');
INSERT INTO `usuario_permisos` VALUES (1207, 41, 793, NULL, '2019-07-03 09:14:54', '2019-07-03 09:14:54');
INSERT INTO `usuario_permisos` VALUES (1208, 45, 793, NULL, '2019-07-03 09:16:37', '2019-07-03 09:16:37');
INSERT INTO `usuario_permisos` VALUES (1209, 46, 793, NULL, '2019-07-03 09:16:37', '2019-07-03 09:16:37');
INSERT INTO `usuario_permisos` VALUES (1210, 47, 793, NULL, '2019-07-03 09:16:37', '2019-07-03 09:16:37');
INSERT INTO `usuario_permisos` VALUES (1211, 48, 793, NULL, '2019-07-03 09:16:37', '2019-07-03 09:16:37');
INSERT INTO `usuario_permisos` VALUES (1212, 50, 793, NULL, '2019-07-03 09:16:37', '2019-07-03 09:16:37');
INSERT INTO `usuario_permisos` VALUES (1213, 51, 793, NULL, '2019-07-03 09:16:37', '2019-07-03 09:16:37');
INSERT INTO `usuario_permisos` VALUES (1214, 52, 793, NULL, '2019-07-03 09:16:37', '2019-07-03 09:16:37');
INSERT INTO `usuario_permisos` VALUES (1215, 53, 793, NULL, '2019-07-03 09:16:37', '2019-07-03 09:16:37');
INSERT INTO `usuario_permisos` VALUES (1216, 55, 793, NULL, '2019-07-03 09:16:38', '2019-07-03 09:16:38');
INSERT INTO `usuario_permisos` VALUES (1217, 57, 793, NULL, '2019-07-03 09:16:38', '2019-07-03 09:16:38');
INSERT INTO `usuario_permisos` VALUES (1218, 58, 793, NULL, '2019-07-03 09:16:38', '2019-07-03 09:16:38');
INSERT INTO `usuario_permisos` VALUES (1219, 59, 793, NULL, '2019-07-03 09:16:38', '2019-07-03 09:16:38');
INSERT INTO `usuario_permisos` VALUES (1220, 60, 793, NULL, '2019-07-03 09:16:38', '2019-07-03 09:16:38');
INSERT INTO `usuario_permisos` VALUES (1221, 62, 793, NULL, '2019-07-03 09:16:38', '2019-07-03 09:16:38');
INSERT INTO `usuario_permisos` VALUES (1222, 44, 793, NULL, '2019-07-03 09:17:41', '2019-07-03 09:17:41');
INSERT INTO `usuario_permisos` VALUES (1223, 8, 236, NULL, '2019-07-03 09:43:27', '2019-07-03 09:43:27');
INSERT INTO `usuario_permisos` VALUES (1228, 17, 236, NULL, '2019-07-03 09:43:27', '2019-07-03 09:43:27');
INSERT INTO `usuario_permisos` VALUES (1229, 18, 236, NULL, '2019-07-03 09:43:27', '2019-07-03 09:43:27');
INSERT INTO `usuario_permisos` VALUES (1233, 27, 236, NULL, '2019-07-03 09:43:27', '2019-07-03 09:43:27');
INSERT INTO `usuario_permisos` VALUES (1234, 28, 236, NULL, '2019-07-03 09:43:27', '2019-07-03 09:43:27');
INSERT INTO `usuario_permisos` VALUES (1235, 29, 236, NULL, '2019-07-03 09:43:27', '2019-07-03 09:43:27');
INSERT INTO `usuario_permisos` VALUES (1241, 36, 236, NULL, '2019-07-03 09:43:27', '2019-07-03 09:43:27');
INSERT INTO `usuario_permisos` VALUES (1242, 37, 236, NULL, '2019-07-03 09:43:27', '2019-07-03 09:43:27');
INSERT INTO `usuario_permisos` VALUES (1243, 38, 236, NULL, '2019-07-03 09:43:28', '2019-07-03 09:43:28');
INSERT INTO `usuario_permisos` VALUES (1244, 39, 236, NULL, '2019-07-03 09:43:28', '2019-07-03 09:43:28');
INSERT INTO `usuario_permisos` VALUES (1245, 40, 236, NULL, '2019-07-03 09:43:28', '2019-07-03 09:43:28');
INSERT INTO `usuario_permisos` VALUES (1246, 42, 236, NULL, '2019-07-03 09:43:28', '2019-07-03 09:43:28');
INSERT INTO `usuario_permisos` VALUES (1248, 41, 236, NULL, '2019-07-03 09:43:28', '2019-07-03 09:43:28');
INSERT INTO `usuario_permisos` VALUES (1249, 25, 236, NULL, '2019-07-03 09:45:50', '2019-07-03 09:45:50');
INSERT INTO `usuario_permisos` VALUES (1250, 44, 236, NULL, '2019-07-03 09:45:51', '2019-07-03 09:45:51');
INSERT INTO `usuario_permisos` VALUES (1251, 1, 2, NULL, '2019-07-03 09:56:31', '2019-07-03 09:56:31');
INSERT INTO `usuario_permisos` VALUES (1252, 2, 2, NULL, '2019-07-03 09:56:31', '2019-07-03 09:56:31');
INSERT INTO `usuario_permisos` VALUES (1253, 3, 2, NULL, '2019-07-03 09:56:31', '2019-07-03 09:56:31');
INSERT INTO `usuario_permisos` VALUES (1254, 4, 2, NULL, '2019-07-03 09:56:31', '2019-07-03 09:56:31');
INSERT INTO `usuario_permisos` VALUES (1255, 5, 2, NULL, '2019-07-03 09:56:31', '2019-07-03 09:56:31');
INSERT INTO `usuario_permisos` VALUES (1256, 6, 2, NULL, '2019-07-03 09:56:31', '2019-07-03 09:56:31');
INSERT INTO `usuario_permisos` VALUES (1257, 7, 2, NULL, '2019-07-03 09:56:31', '2019-07-03 09:56:31');
INSERT INTO `usuario_permisos` VALUES (1258, 8, 2, NULL, '2019-07-03 09:56:32', '2019-07-03 09:56:32');
INSERT INTO `usuario_permisos` VALUES (1259, 9, 2, NULL, '2019-07-03 09:56:32', '2019-07-03 09:56:32');
INSERT INTO `usuario_permisos` VALUES (1260, 10, 2, NULL, '2019-07-03 09:56:32', '2019-07-03 09:56:32');
INSERT INTO `usuario_permisos` VALUES (1261, 11, 2, NULL, '2019-07-03 09:56:32', '2019-07-03 09:56:32');
INSERT INTO `usuario_permisos` VALUES (1262, 12, 2, NULL, '2019-07-03 09:56:32', '2019-07-03 09:56:32');
INSERT INTO `usuario_permisos` VALUES (1263, 13, 2, NULL, '2019-07-03 09:56:32', '2019-07-03 09:56:32');
INSERT INTO `usuario_permisos` VALUES (1264, 14, 2, NULL, '2019-07-03 09:56:32', '2019-07-03 09:56:32');
INSERT INTO `usuario_permisos` VALUES (1265, 15, 2, NULL, '2019-07-03 09:56:32', '2019-07-03 09:56:32');
INSERT INTO `usuario_permisos` VALUES (1266, 16, 2, NULL, '2019-07-03 09:56:32', '2019-07-03 09:56:32');
INSERT INTO `usuario_permisos` VALUES (1267, 17, 2, NULL, '2019-07-03 09:56:32', '2019-07-03 09:56:32');
INSERT INTO `usuario_permisos` VALUES (1268, 18, 2, NULL, '2019-07-03 09:56:32', '2019-07-03 09:56:32');
INSERT INTO `usuario_permisos` VALUES (1269, 19, 2, NULL, '2019-07-03 09:56:32', '2019-07-03 09:56:32');
INSERT INTO `usuario_permisos` VALUES (1270, 20, 2, NULL, '2019-07-03 09:56:32', '2019-07-03 09:56:32');
INSERT INTO `usuario_permisos` VALUES (1271, 21, 2, NULL, '2019-07-03 09:56:32', '2019-07-03 09:56:32');
INSERT INTO `usuario_permisos` VALUES (1272, 22, 2, NULL, '2019-07-03 09:56:32', '2019-07-03 09:56:32');
INSERT INTO `usuario_permisos` VALUES (1273, 23, 2, NULL, '2019-07-03 09:56:32', '2019-07-03 09:56:32');
INSERT INTO `usuario_permisos` VALUES (1274, 24, 2, NULL, '2019-07-03 09:56:32', '2019-07-03 09:56:32');
INSERT INTO `usuario_permisos` VALUES (1275, 25, 2, NULL, '2019-07-03 09:56:32', '2019-07-03 09:56:32');
INSERT INTO `usuario_permisos` VALUES (1276, 26, 2, NULL, '2019-07-03 09:56:32', '2019-07-03 09:56:32');
INSERT INTO `usuario_permisos` VALUES (1277, 27, 2, NULL, '2019-07-03 09:56:32', '2019-07-03 09:56:32');
INSERT INTO `usuario_permisos` VALUES (1278, 28, 2, NULL, '2019-07-03 09:56:32', '2019-07-03 09:56:32');
INSERT INTO `usuario_permisos` VALUES (1279, 29, 2, NULL, '2019-07-03 09:56:32', '2019-07-03 09:56:32');
INSERT INTO `usuario_permisos` VALUES (1280, 30, 2, NULL, '2019-07-03 09:56:32', '2019-07-03 09:56:32');
INSERT INTO `usuario_permisos` VALUES (1281, 31, 2, NULL, '2019-07-03 09:56:32', '2019-07-03 09:56:32');
INSERT INTO `usuario_permisos` VALUES (1282, 32, 2, NULL, '2019-07-03 09:56:32', '2019-07-03 09:56:32');
INSERT INTO `usuario_permisos` VALUES (1283, 33, 2, NULL, '2019-07-03 09:56:32', '2019-07-03 09:56:32');
INSERT INTO `usuario_permisos` VALUES (1284, 34, 2, NULL, '2019-07-03 09:56:32', '2019-07-03 09:56:32');
INSERT INTO `usuario_permisos` VALUES (1285, 35, 2, NULL, '2019-07-03 09:56:32', '2019-07-03 09:56:32');
INSERT INTO `usuario_permisos` VALUES (1286, 36, 2, NULL, '2019-07-03 09:56:32', '2019-07-03 09:56:32');
INSERT INTO `usuario_permisos` VALUES (1287, 37, 2, NULL, '2019-07-03 09:56:32', '2019-07-03 09:56:32');
INSERT INTO `usuario_permisos` VALUES (1288, 38, 2, NULL, '2019-07-03 09:56:32', '2019-07-03 09:56:32');
INSERT INTO `usuario_permisos` VALUES (1289, 39, 2, NULL, '2019-07-03 09:56:32', '2019-07-03 09:56:32');
INSERT INTO `usuario_permisos` VALUES (1290, 40, 2, NULL, '2019-07-03 09:56:32', '2019-07-03 09:56:32');
INSERT INTO `usuario_permisos` VALUES (1291, 41, 2, NULL, '2019-07-03 09:56:32', '2019-07-03 09:56:32');
INSERT INTO `usuario_permisos` VALUES (1292, 42, 2, NULL, '2019-07-03 09:56:32', '2019-07-03 09:56:32');
INSERT INTO `usuario_permisos` VALUES (1293, 43, 2, NULL, '2019-07-03 09:56:32', '2019-07-03 09:56:32');
INSERT INTO `usuario_permisos` VALUES (1294, 44, 2, NULL, '2019-07-03 09:56:32', '2019-07-03 09:56:32');
INSERT INTO `usuario_permisos` VALUES (1295, 45, 2, NULL, '2019-07-03 09:56:32', '2019-07-03 09:56:32');
INSERT INTO `usuario_permisos` VALUES (1296, 46, 2, NULL, '2019-07-03 09:56:32', '2019-07-03 09:56:32');
INSERT INTO `usuario_permisos` VALUES (1297, 47, 2, NULL, '2019-07-03 09:56:32', '2019-07-03 09:56:32');
INSERT INTO `usuario_permisos` VALUES (1298, 48, 2, NULL, '2019-07-03 09:56:33', '2019-07-03 09:56:33');
INSERT INTO `usuario_permisos` VALUES (1299, 50, 2, NULL, '2019-07-03 09:56:33', '2019-07-03 09:56:33');
INSERT INTO `usuario_permisos` VALUES (1300, 51, 2, NULL, '2019-07-03 09:56:33', '2019-07-03 09:56:33');
INSERT INTO `usuario_permisos` VALUES (1301, 52, 2, NULL, '2019-07-03 09:56:33', '2019-07-03 09:56:33');
INSERT INTO `usuario_permisos` VALUES (1302, 53, 2, NULL, '2019-07-03 09:56:33', '2019-07-03 09:56:33');
INSERT INTO `usuario_permisos` VALUES (1303, 55, 2, NULL, '2019-07-03 09:56:33', '2019-07-03 09:56:33');
INSERT INTO `usuario_permisos` VALUES (1304, 56, 2, NULL, '2019-07-03 09:56:33', '2019-07-03 09:56:33');
INSERT INTO `usuario_permisos` VALUES (1305, 57, 2, NULL, '2019-07-03 09:56:33', '2019-07-03 09:56:33');
INSERT INTO `usuario_permisos` VALUES (1306, 58, 2, NULL, '2019-07-03 09:56:33', '2019-07-03 09:56:33');
INSERT INTO `usuario_permisos` VALUES (1307, 59, 2, NULL, '2019-07-03 09:56:33', '2019-07-03 09:56:33');
INSERT INTO `usuario_permisos` VALUES (1308, 60, 2, NULL, '2019-07-03 09:56:33', '2019-07-03 09:56:33');
INSERT INTO `usuario_permisos` VALUES (1309, 61, 2, NULL, '2019-07-03 09:56:33', '2019-07-03 09:56:33');
INSERT INTO `usuario_permisos` VALUES (1310, 62, 2, NULL, '2019-07-03 09:56:33', '2019-07-03 09:56:33');
INSERT INTO `usuario_permisos` VALUES (1311, 63, 2, NULL, '2019-07-03 09:56:33', '2019-07-03 09:56:33');
INSERT INTO `usuario_permisos` VALUES (1312, 8, 250, NULL, '2019-07-03 09:58:46', '2019-07-03 09:58:46');
INSERT INTO `usuario_permisos` VALUES (1313, 27, 250, NULL, '2019-07-03 09:58:46', '2019-07-03 09:58:46');
INSERT INTO `usuario_permisos` VALUES (1314, 30, 250, NULL, '2019-07-03 09:58:46', '2019-07-03 09:58:46');
INSERT INTO `usuario_permisos` VALUES (1315, 31, 250, NULL, '2019-07-03 09:58:46', '2019-07-03 09:58:46');
INSERT INTO `usuario_permisos` VALUES (1316, 9, 250, NULL, '2019-07-03 09:58:46', '2019-07-03 09:58:46');
INSERT INTO `usuario_permisos` VALUES (1317, 45, 250, NULL, '2019-07-03 09:58:46', '2019-07-03 09:58:46');
INSERT INTO `usuario_permisos` VALUES (1318, 46, 250, NULL, '2019-07-03 09:58:46', '2019-07-03 09:58:46');
INSERT INTO `usuario_permisos` VALUES (1319, 8, 515, NULL, '2019-07-03 10:06:19', '2019-07-03 10:06:19');
INSERT INTO `usuario_permisos` VALUES (1320, 27, 515, NULL, '2019-07-03 10:06:19', '2019-07-03 10:06:19');
INSERT INTO `usuario_permisos` VALUES (1323, 9, 515, NULL, '2019-07-03 10:06:19', '2019-07-03 10:06:19');
INSERT INTO `usuario_permisos` VALUES (1326, 28, 515, NULL, '2019-07-03 10:12:57', '2019-07-03 10:12:57');
INSERT INTO `usuario_permisos` VALUES (1327, 8, 706, NULL, '2019-07-03 10:13:42', '2019-07-03 10:13:42');
INSERT INTO `usuario_permisos` VALUES (1328, 9, 706, NULL, '2019-07-03 10:13:42', '2019-07-03 10:13:42');
INSERT INTO `usuario_permisos` VALUES (1329, 10, 706, NULL, '2019-07-03 10:13:42', '2019-07-03 10:13:42');
INSERT INTO `usuario_permisos` VALUES (1330, 11, 706, NULL, '2019-07-03 10:13:42', '2019-07-03 10:13:42');
INSERT INTO `usuario_permisos` VALUES (1331, 18, 706, NULL, '2019-07-03 10:13:42', '2019-07-03 10:13:42');
INSERT INTO `usuario_permisos` VALUES (1332, 19, 706, NULL, '2019-07-03 10:13:42', '2019-07-03 10:13:42');
INSERT INTO `usuario_permisos` VALUES (1333, 20, 706, NULL, '2019-07-03 10:13:42', '2019-07-03 10:13:42');
INSERT INTO `usuario_permisos` VALUES (1334, 26, 706, NULL, '2019-07-03 10:13:42', '2019-07-03 10:13:42');
INSERT INTO `usuario_permisos` VALUES (1335, 27, 706, NULL, '2019-07-03 10:13:42', '2019-07-03 10:13:42');
INSERT INTO `usuario_permisos` VALUES (1336, 28, 706, NULL, '2019-07-03 10:13:42', '2019-07-03 10:13:42');
INSERT INTO `usuario_permisos` VALUES (1337, 29, 706, NULL, '2019-07-03 10:13:42', '2019-07-03 10:13:42');
INSERT INTO `usuario_permisos` VALUES (1338, 30, 706, NULL, '2019-07-03 10:13:42', '2019-07-03 10:13:42');
INSERT INTO `usuario_permisos` VALUES (1339, 31, 706, NULL, '2019-07-03 10:13:42', '2019-07-03 10:13:42');
INSERT INTO `usuario_permisos` VALUES (1340, 32, 706, NULL, '2019-07-03 10:13:42', '2019-07-03 10:13:42');
INSERT INTO `usuario_permisos` VALUES (1341, 36, 706, NULL, '2019-07-03 10:13:42', '2019-07-03 10:13:42');
INSERT INTO `usuario_permisos` VALUES (1342, 37, 706, NULL, '2019-07-03 10:13:42', '2019-07-03 10:13:42');
INSERT INTO `usuario_permisos` VALUES (1343, 38, 706, NULL, '2019-07-03 10:13:42', '2019-07-03 10:13:42');
INSERT INTO `usuario_permisos` VALUES (1345, 45, 706, NULL, '2019-07-03 10:13:42', '2019-07-03 10:13:42');
INSERT INTO `usuario_permisos` VALUES (1346, 46, 706, NULL, '2019-07-03 10:13:42', '2019-07-03 10:13:42');
INSERT INTO `usuario_permisos` VALUES (1347, 8, 761, NULL, '2019-07-03 10:36:20', '2019-07-03 10:36:20');
INSERT INTO `usuario_permisos` VALUES (1348, 27, 761, NULL, '2019-07-03 10:36:20', '2019-07-03 10:36:20');
INSERT INTO `usuario_permisos` VALUES (1349, 30, 761, NULL, '2019-07-03 10:36:20', '2019-07-03 10:36:20');
INSERT INTO `usuario_permisos` VALUES (1350, 31, 761, NULL, '2019-07-03 10:36:20', '2019-07-03 10:36:20');
INSERT INTO `usuario_permisos` VALUES (1351, 9, 761, NULL, '2019-07-03 10:36:20', '2019-07-03 10:36:20');
INSERT INTO `usuario_permisos` VALUES (1352, 45, 761, NULL, '2019-07-03 10:36:20', '2019-07-03 10:36:20');
INSERT INTO `usuario_permisos` VALUES (1353, 46, 761, NULL, '2019-07-03 10:36:21', '2019-07-03 10:36:21');
INSERT INTO `usuario_permisos` VALUES (1354, 28, 761, NULL, '2019-07-03 10:36:21', '2019-07-03 10:36:21');
INSERT INTO `usuario_permisos` VALUES (1355, 8, 741, NULL, '2019-07-03 10:38:05', '2019-07-03 10:38:05');
INSERT INTO `usuario_permisos` VALUES (1356, 27, 741, NULL, '2019-07-03 10:38:05', '2019-07-03 10:38:05');
INSERT INTO `usuario_permisos` VALUES (1357, 30, 741, NULL, '2019-07-03 10:38:05', '2019-07-03 10:38:05');
INSERT INTO `usuario_permisos` VALUES (1358, 31, 741, NULL, '2019-07-03 10:38:05', '2019-07-03 10:38:05');
INSERT INTO `usuario_permisos` VALUES (1359, 9, 741, NULL, '2019-07-03 10:38:05', '2019-07-03 10:38:05');
INSERT INTO `usuario_permisos` VALUES (1360, 45, 741, NULL, '2019-07-03 10:38:05', '2019-07-03 10:38:05');
INSERT INTO `usuario_permisos` VALUES (1361, 46, 741, NULL, '2019-07-03 10:38:05', '2019-07-03 10:38:05');
INSERT INTO `usuario_permisos` VALUES (1362, 28, 741, NULL, '2019-07-03 10:38:05', '2019-07-03 10:38:05');
INSERT INTO `usuario_permisos` VALUES (1363, 8, 81, NULL, '2019-07-03 10:38:55', '2019-07-03 10:38:55');
INSERT INTO `usuario_permisos` VALUES (1364, 27, 81, NULL, '2019-07-03 10:38:55', '2019-07-03 10:38:55');
INSERT INTO `usuario_permisos` VALUES (1365, 30, 81, NULL, '2019-07-03 10:38:55', '2019-07-03 10:38:55');
INSERT INTO `usuario_permisos` VALUES (1366, 31, 81, NULL, '2019-07-03 10:38:55', '2019-07-03 10:38:55');
INSERT INTO `usuario_permisos` VALUES (1367, 9, 81, NULL, '2019-07-03 10:38:55', '2019-07-03 10:38:55');
INSERT INTO `usuario_permisos` VALUES (1368, 45, 81, NULL, '2019-07-03 10:38:55', '2019-07-03 10:38:55');
INSERT INTO `usuario_permisos` VALUES (1369, 46, 81, NULL, '2019-07-03 10:38:55', '2019-07-03 10:38:55');
INSERT INTO `usuario_permisos` VALUES (1370, 28, 81, NULL, '2019-07-03 10:38:55', '2019-07-03 10:38:55');
INSERT INTO `usuario_permisos` VALUES (1371, 8, 507, NULL, '2019-07-03 10:40:03', '2019-07-03 10:40:03');
INSERT INTO `usuario_permisos` VALUES (1372, 27, 507, NULL, '2019-07-03 10:40:03', '2019-07-03 10:40:03');
INSERT INTO `usuario_permisos` VALUES (1373, 30, 507, NULL, '2019-07-03 10:40:03', '2019-07-03 10:40:03');
INSERT INTO `usuario_permisos` VALUES (1374, 31, 507, NULL, '2019-07-03 10:40:03', '2019-07-03 10:40:03');
INSERT INTO `usuario_permisos` VALUES (1375, 9, 507, NULL, '2019-07-03 10:40:03', '2019-07-03 10:40:03');
INSERT INTO `usuario_permisos` VALUES (1376, 45, 507, NULL, '2019-07-03 10:40:03', '2019-07-03 10:40:03');
INSERT INTO `usuario_permisos` VALUES (1377, 46, 507, NULL, '2019-07-03 10:40:03', '2019-07-03 10:40:03');
INSERT INTO `usuario_permisos` VALUES (1378, 28, 507, NULL, '2019-07-03 10:40:03', '2019-07-03 10:40:03');
INSERT INTO `usuario_permisos` VALUES (1379, 8, 74, NULL, '2019-07-03 10:40:21', '2019-07-03 10:40:21');
INSERT INTO `usuario_permisos` VALUES (1380, 27, 74, NULL, '2019-07-03 10:40:21', '2019-07-03 10:40:21');
INSERT INTO `usuario_permisos` VALUES (1381, 30, 74, NULL, '2019-07-03 10:40:21', '2019-07-03 10:40:21');
INSERT INTO `usuario_permisos` VALUES (1382, 31, 74, NULL, '2019-07-03 10:40:21', '2019-07-03 10:40:21');
INSERT INTO `usuario_permisos` VALUES (1383, 9, 74, NULL, '2019-07-03 10:40:21', '2019-07-03 10:40:21');
INSERT INTO `usuario_permisos` VALUES (1384, 45, 74, NULL, '2019-07-03 10:40:21', '2019-07-03 10:40:21');
INSERT INTO `usuario_permisos` VALUES (1385, 46, 74, NULL, '2019-07-03 10:40:21', '2019-07-03 10:40:21');
INSERT INTO `usuario_permisos` VALUES (1386, 28, 74, NULL, '2019-07-03 10:40:21', '2019-07-03 10:40:21');
INSERT INTO `usuario_permisos` VALUES (1387, 8, 707, NULL, '2019-07-03 10:41:02', '2019-07-03 10:41:02');
INSERT INTO `usuario_permisos` VALUES (1388, 9, 707, NULL, '2019-07-03 10:41:02', '2019-07-03 10:41:02');
INSERT INTO `usuario_permisos` VALUES (1389, 10, 707, NULL, '2019-07-03 10:41:02', '2019-07-03 10:41:02');
INSERT INTO `usuario_permisos` VALUES (1390, 11, 707, NULL, '2019-07-03 10:41:02', '2019-07-03 10:41:02');
INSERT INTO `usuario_permisos` VALUES (1391, 18, 707, NULL, '2019-07-03 10:41:02', '2019-07-03 10:41:02');
INSERT INTO `usuario_permisos` VALUES (1392, 19, 707, NULL, '2019-07-03 10:41:02', '2019-07-03 10:41:02');
INSERT INTO `usuario_permisos` VALUES (1393, 20, 707, NULL, '2019-07-03 10:41:02', '2019-07-03 10:41:02');
INSERT INTO `usuario_permisos` VALUES (1394, 26, 707, NULL, '2019-07-03 10:41:02', '2019-07-03 10:41:02');
INSERT INTO `usuario_permisos` VALUES (1395, 27, 707, NULL, '2019-07-03 10:41:02', '2019-07-03 10:41:02');
INSERT INTO `usuario_permisos` VALUES (1396, 28, 707, NULL, '2019-07-03 10:41:02', '2019-07-03 10:41:02');
INSERT INTO `usuario_permisos` VALUES (1397, 29, 707, NULL, '2019-07-03 10:41:02', '2019-07-03 10:41:02');
INSERT INTO `usuario_permisos` VALUES (1398, 30, 707, NULL, '2019-07-03 10:41:02', '2019-07-03 10:41:02');
INSERT INTO `usuario_permisos` VALUES (1399, 31, 707, NULL, '2019-07-03 10:41:02', '2019-07-03 10:41:02');
INSERT INTO `usuario_permisos` VALUES (1401, 36, 707, NULL, '2019-07-03 10:41:02', '2019-07-03 10:41:02');
INSERT INTO `usuario_permisos` VALUES (1402, 37, 707, NULL, '2019-07-03 10:41:02', '2019-07-03 10:41:02');
INSERT INTO `usuario_permisos` VALUES (1403, 38, 707, NULL, '2019-07-03 10:41:02', '2019-07-03 10:41:02');
INSERT INTO `usuario_permisos` VALUES (1404, 42, 707, NULL, '2019-07-03 10:41:03', '2019-07-03 10:41:03');
INSERT INTO `usuario_permisos` VALUES (1405, 45, 707, NULL, '2019-07-03 10:41:03', '2019-07-03 10:41:03');
INSERT INTO `usuario_permisos` VALUES (1406, 46, 707, NULL, '2019-07-03 10:41:03', '2019-07-03 10:41:03');
INSERT INTO `usuario_permisos` VALUES (1407, 8, 232, NULL, '2019-07-03 10:41:29', '2019-07-03 10:41:29');
INSERT INTO `usuario_permisos` VALUES (1408, 27, 232, NULL, '2019-07-03 10:41:29', '2019-07-03 10:41:29');
INSERT INTO `usuario_permisos` VALUES (1409, 30, 232, NULL, '2019-07-03 10:41:29', '2019-07-03 10:41:29');
INSERT INTO `usuario_permisos` VALUES (1410, 31, 232, NULL, '2019-07-03 10:41:29', '2019-07-03 10:41:29');
INSERT INTO `usuario_permisos` VALUES (1411, 9, 232, NULL, '2019-07-03 10:41:29', '2019-07-03 10:41:29');
INSERT INTO `usuario_permisos` VALUES (1412, 45, 232, NULL, '2019-07-03 10:41:29', '2019-07-03 10:41:29');
INSERT INTO `usuario_permisos` VALUES (1413, 46, 232, NULL, '2019-07-03 10:41:29', '2019-07-03 10:41:29');
INSERT INTO `usuario_permisos` VALUES (1414, 28, 232, NULL, '2019-07-03 10:41:29', '2019-07-03 10:41:29');
INSERT INTO `usuario_permisos` VALUES (1415, 8, 33, NULL, '2019-07-03 10:41:49', '2019-07-03 10:41:49');
INSERT INTO `usuario_permisos` VALUES (1416, 27, 33, NULL, '2019-07-03 10:41:49', '2019-07-03 10:41:49');
INSERT INTO `usuario_permisos` VALUES (1417, 30, 33, NULL, '2019-07-03 10:41:49', '2019-07-03 10:41:49');
INSERT INTO `usuario_permisos` VALUES (1418, 31, 33, NULL, '2019-07-03 10:41:49', '2019-07-03 10:41:49');
INSERT INTO `usuario_permisos` VALUES (1419, 9, 33, NULL, '2019-07-03 10:41:49', '2019-07-03 10:41:49');
INSERT INTO `usuario_permisos` VALUES (1420, 45, 33, NULL, '2019-07-03 10:41:49', '2019-07-03 10:41:49');
INSERT INTO `usuario_permisos` VALUES (1421, 46, 33, NULL, '2019-07-03 10:41:49', '2019-07-03 10:41:49');
INSERT INTO `usuario_permisos` VALUES (1422, 28, 33, NULL, '2019-07-03 10:41:49', '2019-07-03 10:41:49');
INSERT INTO `usuario_permisos` VALUES (1443, 8, 102, NULL, '2019-07-03 10:46:11', '2019-07-03 10:46:11');
INSERT INTO `usuario_permisos` VALUES (1444, 27, 102, NULL, '2019-07-03 10:46:11', '2019-07-03 10:46:11');
INSERT INTO `usuario_permisos` VALUES (1445, 30, 102, NULL, '2019-07-03 10:46:11', '2019-07-03 10:46:11');
INSERT INTO `usuario_permisos` VALUES (1446, 31, 102, NULL, '2019-07-03 10:46:11', '2019-07-03 10:46:11');
INSERT INTO `usuario_permisos` VALUES (1447, 9, 102, NULL, '2019-07-03 10:46:11', '2019-07-03 10:46:11');
INSERT INTO `usuario_permisos` VALUES (1448, 45, 102, NULL, '2019-07-03 10:46:11', '2019-07-03 10:46:11');
INSERT INTO `usuario_permisos` VALUES (1449, 46, 102, NULL, '2019-07-03 10:46:11', '2019-07-03 10:46:11');
INSERT INTO `usuario_permisos` VALUES (1450, 28, 102, NULL, '2019-07-03 10:46:11', '2019-07-03 10:46:11');
INSERT INTO `usuario_permisos` VALUES (1451, 8, 476, NULL, '2019-07-03 10:46:49', '2019-07-03 10:46:49');
INSERT INTO `usuario_permisos` VALUES (1452, 27, 476, NULL, '2019-07-03 10:46:49', '2019-07-03 10:46:49');
INSERT INTO `usuario_permisos` VALUES (1453, 30, 476, NULL, '2019-07-03 10:46:49', '2019-07-03 10:46:49');
INSERT INTO `usuario_permisos` VALUES (1454, 31, 476, NULL, '2019-07-03 10:46:49', '2019-07-03 10:46:49');
INSERT INTO `usuario_permisos` VALUES (1455, 9, 476, NULL, '2019-07-03 10:46:49', '2019-07-03 10:46:49');
INSERT INTO `usuario_permisos` VALUES (1456, 45, 476, NULL, '2019-07-03 10:46:49', '2019-07-03 10:46:49');
INSERT INTO `usuario_permisos` VALUES (1457, 46, 476, NULL, '2019-07-03 10:46:49', '2019-07-03 10:46:49');
INSERT INTO `usuario_permisos` VALUES (1458, 28, 476, NULL, '2019-07-03 10:46:49', '2019-07-03 10:46:49');
INSERT INTO `usuario_permisos` VALUES (1459, 8, 777, NULL, '2019-07-03 10:47:37', '2019-07-03 10:47:37');
INSERT INTO `usuario_permisos` VALUES (1460, 27, 777, NULL, '2019-07-03 10:47:37', '2019-07-03 10:47:37');
INSERT INTO `usuario_permisos` VALUES (1461, 30, 777, NULL, '2019-07-03 10:47:37', '2019-07-03 10:47:37');
INSERT INTO `usuario_permisos` VALUES (1462, 31, 777, NULL, '2019-07-03 10:47:37', '2019-07-03 10:47:37');
INSERT INTO `usuario_permisos` VALUES (1463, 9, 777, NULL, '2019-07-03 10:47:37', '2019-07-03 10:47:37');
INSERT INTO `usuario_permisos` VALUES (1464, 45, 777, NULL, '2019-07-03 10:47:37', '2019-07-03 10:47:37');
INSERT INTO `usuario_permisos` VALUES (1465, 46, 777, NULL, '2019-07-03 10:47:37', '2019-07-03 10:47:37');
INSERT INTO `usuario_permisos` VALUES (1466, 28, 777, NULL, '2019-07-03 10:47:37', '2019-07-03 10:47:37');
INSERT INTO `usuario_permisos` VALUES (1467, 8, 794, NULL, '2019-07-03 11:54:00', '2019-07-03 11:54:00');
INSERT INTO `usuario_permisos` VALUES (1472, 17, 794, NULL, '2019-07-03 11:54:00', '2019-07-03 11:54:00');
INSERT INTO `usuario_permisos` VALUES (1473, 18, 794, NULL, '2019-07-03 11:54:00', '2019-07-03 11:54:00');
INSERT INTO `usuario_permisos` VALUES (1477, 27, 794, NULL, '2019-07-03 11:54:00', '2019-07-03 11:54:00');
INSERT INTO `usuario_permisos` VALUES (1478, 28, 794, NULL, '2019-07-03 11:54:00', '2019-07-03 11:54:00');
INSERT INTO `usuario_permisos` VALUES (1479, 29, 794, NULL, '2019-07-03 11:54:01', '2019-07-03 11:54:01');
INSERT INTO `usuario_permisos` VALUES (1480, 30, 794, NULL, '2019-07-03 11:54:01', '2019-07-03 11:54:01');
INSERT INTO `usuario_permisos` VALUES (1481, 31, 794, NULL, '2019-07-03 11:54:01', '2019-07-03 11:54:01');
INSERT INTO `usuario_permisos` VALUES (1483, 33, 794, NULL, '2019-07-03 11:54:01', '2019-07-03 11:54:01');
INSERT INTO `usuario_permisos` VALUES (1485, 36, 794, NULL, '2019-07-03 11:54:01', '2019-07-03 11:54:01');
INSERT INTO `usuario_permisos` VALUES (1486, 37, 794, NULL, '2019-07-03 11:54:01', '2019-07-03 11:54:01');
INSERT INTO `usuario_permisos` VALUES (1487, 38, 794, NULL, '2019-07-03 11:54:01', '2019-07-03 11:54:01');
INSERT INTO `usuario_permisos` VALUES (1488, 39, 794, NULL, '2019-07-03 11:54:01', '2019-07-03 11:54:01');
INSERT INTO `usuario_permisos` VALUES (1489, 40, 794, NULL, '2019-07-03 11:54:01', '2019-07-03 11:54:01');
INSERT INTO `usuario_permisos` VALUES (1490, 42, 794, NULL, '2019-07-03 11:54:01', '2019-07-03 11:54:01');
INSERT INTO `usuario_permisos` VALUES (1492, 8, 795, NULL, '2019-07-03 11:58:22', '2019-07-03 11:58:22');
INSERT INTO `usuario_permisos` VALUES (1497, 17, 795, NULL, '2019-07-03 11:58:22', '2019-07-03 11:58:22');
INSERT INTO `usuario_permisos` VALUES (1498, 18, 795, NULL, '2019-07-03 11:58:22', '2019-07-03 11:58:22');
INSERT INTO `usuario_permisos` VALUES (1502, 27, 795, NULL, '2019-07-03 11:58:23', '2019-07-03 11:58:23');
INSERT INTO `usuario_permisos` VALUES (1503, 28, 795, NULL, '2019-07-03 11:58:23', '2019-07-03 11:58:23');
INSERT INTO `usuario_permisos` VALUES (1504, 29, 795, NULL, '2019-07-03 11:58:23', '2019-07-03 11:58:23');
INSERT INTO `usuario_permisos` VALUES (1510, 36, 795, NULL, '2019-07-03 11:58:23', '2019-07-03 11:58:23');
INSERT INTO `usuario_permisos` VALUES (1511, 37, 795, NULL, '2019-07-03 11:58:23', '2019-07-03 11:58:23');
INSERT INTO `usuario_permisos` VALUES (1517, 25, 794, NULL, '2019-07-03 12:10:32', '2019-07-03 12:10:32');
INSERT INTO `usuario_permisos` VALUES (1518, 44, 794, NULL, '2019-07-03 12:10:33', '2019-07-03 12:10:33');
INSERT INTO `usuario_permisos` VALUES (1519, 45, 794, NULL, '2019-07-03 12:11:26', '2019-07-03 12:11:26');
INSERT INTO `usuario_permisos` VALUES (1520, 46, 794, NULL, '2019-07-03 12:11:26', '2019-07-03 12:11:26');
INSERT INTO `usuario_permisos` VALUES (1521, 53, 794, NULL, '2019-07-03 12:11:26', '2019-07-03 12:11:26');
INSERT INTO `usuario_permisos` VALUES (1522, 41, 795, NULL, '2019-07-03 12:22:56', '2019-07-03 12:22:56');
INSERT INTO `usuario_permisos` VALUES (1523, 8, 487, NULL, '2019-07-03 12:32:08', '2019-07-03 12:32:08');
INSERT INTO `usuario_permisos` VALUES (1524, 27, 487, NULL, '2019-07-03 12:32:08', '2019-07-03 12:32:08');
INSERT INTO `usuario_permisos` VALUES (1526, 12, 487, NULL, '2019-07-03 12:32:08', '2019-07-03 12:32:08');
INSERT INTO `usuario_permisos` VALUES (1527, 21, 487, NULL, '2019-07-03 12:32:08', '2019-07-03 12:32:08');
INSERT INTO `usuario_permisos` VALUES (1528, 36, 487, NULL, '2019-07-03 12:32:08', '2019-07-03 12:32:08');
INSERT INTO `usuario_permisos` VALUES (1529, 37, 487, NULL, '2019-07-03 12:32:08', '2019-07-03 12:32:08');
INSERT INTO `usuario_permisos` VALUES (1530, 44, 487, NULL, '2019-07-03 12:34:08', '2019-07-03 12:34:08');
INSERT INTO `usuario_permisos` VALUES (1531, 28, 487, NULL, '2019-07-03 12:37:08', '2019-07-03 12:37:08');
INSERT INTO `usuario_permisos` VALUES (1532, 8, 731, NULL, '2019-07-03 12:38:56', '2019-07-03 12:38:56');
INSERT INTO `usuario_permisos` VALUES (1533, 27, 731, NULL, '2019-07-03 12:38:56', '2019-07-03 12:38:56');
INSERT INTO `usuario_permisos` VALUES (1534, 12, 731, NULL, '2019-07-03 12:38:56', '2019-07-03 12:38:56');
INSERT INTO `usuario_permisos` VALUES (1535, 21, 731, NULL, '2019-07-03 12:38:56', '2019-07-03 12:38:56');
INSERT INTO `usuario_permisos` VALUES (1536, 36, 731, NULL, '2019-07-03 12:38:56', '2019-07-03 12:38:56');
INSERT INTO `usuario_permisos` VALUES (1537, 37, 731, NULL, '2019-07-03 12:38:56', '2019-07-03 12:38:56');
INSERT INTO `usuario_permisos` VALUES (1538, 28, 731, NULL, '2019-07-03 12:38:56', '2019-07-03 12:38:56');
INSERT INTO `usuario_permisos` VALUES (1539, 8, 82, NULL, '2019-07-03 12:40:29', '2019-07-03 12:40:29');
INSERT INTO `usuario_permisos` VALUES (1540, 27, 82, NULL, '2019-07-03 12:40:29', '2019-07-03 12:40:29');
INSERT INTO `usuario_permisos` VALUES (1541, 30, 82, NULL, '2019-07-03 12:40:29', '2019-07-03 12:40:29');
INSERT INTO `usuario_permisos` VALUES (1542, 31, 82, NULL, '2019-07-03 12:40:29', '2019-07-03 12:40:29');
INSERT INTO `usuario_permisos` VALUES (1543, 9, 82, NULL, '2019-07-03 12:40:29', '2019-07-03 12:40:29');
INSERT INTO `usuario_permisos` VALUES (1544, 45, 82, NULL, '2019-07-03 12:40:29', '2019-07-03 12:40:29');
INSERT INTO `usuario_permisos` VALUES (1545, 46, 82, NULL, '2019-07-03 12:40:29', '2019-07-03 12:40:29');
INSERT INTO `usuario_permisos` VALUES (1546, 28, 82, NULL, '2019-07-03 12:40:29', '2019-07-03 12:40:29');
INSERT INTO `usuario_permisos` VALUES (1547, 32, 82, NULL, '2019-07-03 12:41:22', '2019-07-03 12:41:22');
INSERT INTO `usuario_permisos` VALUES (1548, 34, 82, NULL, '2019-07-03 12:41:22', '2019-07-03 12:41:22');
INSERT INTO `usuario_permisos` VALUES (1549, 37, 82, NULL, '2019-07-03 12:41:22', '2019-07-03 12:41:22');
INSERT INTO `usuario_permisos` VALUES (1550, 39, 82, NULL, '2019-07-03 12:41:22', '2019-07-03 12:41:22');
INSERT INTO `usuario_permisos` VALUES (1551, 44, 82, NULL, '2019-07-03 12:41:22', '2019-07-03 12:41:22');
INSERT INTO `usuario_permisos` VALUES (1552, 50, 82, NULL, '2019-07-03 12:41:22', '2019-07-03 12:41:22');
INSERT INTO `usuario_permisos` VALUES (1555, 53, 82, NULL, '2019-07-03 12:41:22', '2019-07-03 12:41:22');
INSERT INTO `usuario_permisos` VALUES (1556, 8, 749, NULL, '2019-07-03 13:05:01', '2019-07-03 13:05:01');
INSERT INTO `usuario_permisos` VALUES (1557, 27, 749, NULL, '2019-07-03 13:05:01', '2019-07-03 13:05:01');
INSERT INTO `usuario_permisos` VALUES (1558, 13, 749, NULL, '2019-07-03 13:05:01', '2019-07-03 13:05:01');
INSERT INTO `usuario_permisos` VALUES (1559, 22, 749, NULL, '2019-07-03 13:05:01', '2019-07-03 13:05:01');
INSERT INTO `usuario_permisos` VALUES (1560, 36, 749, NULL, '2019-07-03 13:05:01', '2019-07-03 13:05:01');
INSERT INTO `usuario_permisos` VALUES (1561, 37, 749, NULL, '2019-07-03 13:05:01', '2019-07-03 13:05:01');
INSERT INTO `usuario_permisos` VALUES (1562, 28, 749, NULL, '2019-07-03 13:05:01', '2019-07-03 13:05:01');
INSERT INTO `usuario_permisos` VALUES (1563, 8, 251, NULL, '2019-07-03 13:07:04', '2019-07-03 13:07:04');
INSERT INTO `usuario_permisos` VALUES (1564, 27, 251, NULL, '2019-07-03 13:07:04', '2019-07-03 13:07:04');
INSERT INTO `usuario_permisos` VALUES (1565, 15, 251, NULL, '2019-07-03 13:07:04', '2019-07-03 13:07:04');
INSERT INTO `usuario_permisos` VALUES (1566, 24, 251, NULL, '2019-07-03 13:07:04', '2019-07-03 13:07:04');
INSERT INTO `usuario_permisos` VALUES (1567, 36, 251, NULL, '2019-07-03 13:07:05', '2019-07-03 13:07:05');
INSERT INTO `usuario_permisos` VALUES (1568, 37, 251, NULL, '2019-07-03 13:07:05', '2019-07-03 13:07:05');
INSERT INTO `usuario_permisos` VALUES (1569, 28, 251, NULL, '2019-07-03 13:07:05', '2019-07-03 13:07:05');
INSERT INTO `usuario_permisos` VALUES (1570, 8, 744, NULL, '2019-07-03 13:12:55', '2019-07-03 13:12:55');
INSERT INTO `usuario_permisos` VALUES (1571, 27, 744, NULL, '2019-07-03 13:12:55', '2019-07-03 13:12:55');
INSERT INTO `usuario_permisos` VALUES (1572, 13, 744, NULL, '2019-07-03 13:12:55', '2019-07-03 13:12:55');
INSERT INTO `usuario_permisos` VALUES (1573, 22, 744, NULL, '2019-07-03 13:12:55', '2019-07-03 13:12:55');
INSERT INTO `usuario_permisos` VALUES (1574, 36, 744, NULL, '2019-07-03 13:12:55', '2019-07-03 13:12:55');
INSERT INTO `usuario_permisos` VALUES (1575, 37, 744, NULL, '2019-07-03 13:12:55', '2019-07-03 13:12:55');
INSERT INTO `usuario_permisos` VALUES (1576, 28, 744, NULL, '2019-07-03 13:12:55', '2019-07-03 13:12:55');
INSERT INTO `usuario_permisos` VALUES (1577, 8, 711, NULL, '2019-07-03 13:14:50', '2019-07-03 13:14:50');
INSERT INTO `usuario_permisos` VALUES (1578, 27, 711, NULL, '2019-07-03 13:14:50', '2019-07-03 13:14:50');
INSERT INTO `usuario_permisos` VALUES (1579, 14, 711, NULL, '2019-07-03 13:14:50', '2019-07-03 13:14:50');
INSERT INTO `usuario_permisos` VALUES (1580, 23, 711, NULL, '2019-07-03 13:14:50', '2019-07-03 13:14:50');
INSERT INTO `usuario_permisos` VALUES (1581, 36, 711, NULL, '2019-07-03 13:14:50', '2019-07-03 13:14:50');
INSERT INTO `usuario_permisos` VALUES (1582, 37, 711, NULL, '2019-07-03 13:14:50', '2019-07-03 13:14:50');
INSERT INTO `usuario_permisos` VALUES (1583, 28, 711, NULL, '2019-07-03 13:14:50', '2019-07-03 13:14:50');
INSERT INTO `usuario_permisos` VALUES (1586, 19, 250, NULL, '2019-07-03 17:32:18', '2019-07-03 17:32:18');
INSERT INTO `usuario_permisos` VALUES (1587, 19, 515, NULL, '2019-07-03 17:32:35', '2019-07-03 17:32:35');
INSERT INTO `usuario_permisos` VALUES (1588, 19, 761, NULL, '2019-07-03 17:33:05', '2019-07-03 17:33:05');
INSERT INTO `usuario_permisos` VALUES (1589, 19, 33, NULL, '2019-07-03 17:33:30', '2019-07-03 17:33:30');
INSERT INTO `usuario_permisos` VALUES (1590, 19, 81, NULL, '2019-07-03 17:33:50', '2019-07-03 17:33:50');
INSERT INTO `usuario_permisos` VALUES (1591, 19, 507, NULL, '2019-07-03 17:34:08', '2019-07-03 17:34:08');
INSERT INTO `usuario_permisos` VALUES (1592, 19, 74, NULL, '2019-07-03 17:34:34', '2019-07-03 17:34:34');
INSERT INTO `usuario_permisos` VALUES (1593, 19, 741, NULL, '2019-07-03 17:34:59', '2019-07-03 17:34:59');
INSERT INTO `usuario_permisos` VALUES (1594, 19, 232, NULL, '2019-07-03 17:35:31', '2019-07-03 17:35:31');
INSERT INTO `usuario_permisos` VALUES (1595, 19, 251, NULL, '2019-07-03 17:36:19', '2019-07-03 17:36:19');
INSERT INTO `usuario_permisos` VALUES (1596, 19, 102, NULL, '2019-07-03 17:37:23', '2019-07-03 17:37:23');
INSERT INTO `usuario_permisos` VALUES (1597, 19, 476, NULL, '2019-07-03 17:37:46', '2019-07-03 17:37:46');
INSERT INTO `usuario_permisos` VALUES (1598, 19, 777, NULL, '2019-07-03 17:38:00', '2019-07-03 17:38:00');
INSERT INTO `usuario_permisos` VALUES (1599, 19, 536, NULL, '2019-07-03 17:40:15', '2019-07-03 17:40:15');
INSERT INTO `usuario_permisos` VALUES (1600, 8, 244, NULL, '2019-07-04 09:06:45', '2019-07-04 09:06:45');
INSERT INTO `usuario_permisos` VALUES (1601, 27, 244, NULL, '2019-07-04 09:06:45', '2019-07-04 09:06:45');
INSERT INTO `usuario_permisos` VALUES (1602, 30, 244, NULL, '2019-07-04 09:06:45', '2019-07-04 09:06:45');
INSERT INTO `usuario_permisos` VALUES (1603, 31, 244, NULL, '2019-07-04 09:06:45', '2019-07-04 09:06:45');
INSERT INTO `usuario_permisos` VALUES (1604, 9, 244, NULL, '2019-07-04 09:06:45', '2019-07-04 09:06:45');
INSERT INTO `usuario_permisos` VALUES (1605, 45, 244, NULL, '2019-07-04 09:06:45', '2019-07-04 09:06:45');
INSERT INTO `usuario_permisos` VALUES (1606, 46, 244, NULL, '2019-07-04 09:06:45', '2019-07-04 09:06:45');
INSERT INTO `usuario_permisos` VALUES (1607, 28, 244, NULL, '2019-07-04 09:06:45', '2019-07-04 09:06:45');
INSERT INTO `usuario_permisos` VALUES (1608, 19, 244, NULL, '2019-07-04 09:06:45', '2019-07-04 09:06:45');
INSERT INTO `usuario_permisos` VALUES (1609, 8, 119, NULL, '2019-07-04 09:07:23', '2019-07-04 09:07:23');
INSERT INTO `usuario_permisos` VALUES (1610, 27, 119, NULL, '2019-07-04 09:07:23', '2019-07-04 09:07:23');
INSERT INTO `usuario_permisos` VALUES (1611, 30, 119, NULL, '2019-07-04 09:07:23', '2019-07-04 09:07:23');
INSERT INTO `usuario_permisos` VALUES (1612, 31, 119, NULL, '2019-07-04 09:07:23', '2019-07-04 09:07:23');
INSERT INTO `usuario_permisos` VALUES (1613, 9, 119, NULL, '2019-07-04 09:07:23', '2019-07-04 09:07:23');
INSERT INTO `usuario_permisos` VALUES (1614, 45, 119, NULL, '2019-07-04 09:07:23', '2019-07-04 09:07:23');
INSERT INTO `usuario_permisos` VALUES (1615, 46, 119, NULL, '2019-07-04 09:07:23', '2019-07-04 09:07:23');
INSERT INTO `usuario_permisos` VALUES (1616, 28, 119, NULL, '2019-07-04 09:07:23', '2019-07-04 09:07:23');
INSERT INTO `usuario_permisos` VALUES (1617, 19, 119, NULL, '2019-07-04 09:07:23', '2019-07-04 09:07:23');
INSERT INTO `usuario_permisos` VALUES (1618, 8, 69, NULL, '2019-07-04 09:08:16', '2019-07-04 09:08:16');
INSERT INTO `usuario_permisos` VALUES (1619, 27, 69, NULL, '2019-07-04 09:08:16', '2019-07-04 09:08:16');
INSERT INTO `usuario_permisos` VALUES (1620, 30, 69, NULL, '2019-07-04 09:08:16', '2019-07-04 09:08:16');
INSERT INTO `usuario_permisos` VALUES (1621, 31, 69, NULL, '2019-07-04 09:08:16', '2019-07-04 09:08:16');
INSERT INTO `usuario_permisos` VALUES (1622, 9, 69, NULL, '2019-07-04 09:08:16', '2019-07-04 09:08:16');
INSERT INTO `usuario_permisos` VALUES (1623, 45, 69, NULL, '2019-07-04 09:08:16', '2019-07-04 09:08:16');
INSERT INTO `usuario_permisos` VALUES (1624, 46, 69, NULL, '2019-07-04 09:08:16', '2019-07-04 09:08:16');
INSERT INTO `usuario_permisos` VALUES (1625, 28, 69, NULL, '2019-07-04 09:08:16', '2019-07-04 09:08:16');
INSERT INTO `usuario_permisos` VALUES (1626, 19, 69, NULL, '2019-07-04 09:08:16', '2019-07-04 09:08:16');
INSERT INTO `usuario_permisos` VALUES (1627, 8, 110, NULL, '2019-07-04 09:08:44', '2019-07-04 09:08:44');
INSERT INTO `usuario_permisos` VALUES (1628, 27, 110, NULL, '2019-07-04 09:08:44', '2019-07-04 09:08:44');
INSERT INTO `usuario_permisos` VALUES (1629, 30, 110, NULL, '2019-07-04 09:08:44', '2019-07-04 09:08:44');
INSERT INTO `usuario_permisos` VALUES (1630, 31, 110, NULL, '2019-07-04 09:08:44', '2019-07-04 09:08:44');
INSERT INTO `usuario_permisos` VALUES (1631, 9, 110, NULL, '2019-07-04 09:08:44', '2019-07-04 09:08:44');
INSERT INTO `usuario_permisos` VALUES (1632, 45, 110, NULL, '2019-07-04 09:08:44', '2019-07-04 09:08:44');
INSERT INTO `usuario_permisos` VALUES (1633, 46, 110, NULL, '2019-07-04 09:08:44', '2019-07-04 09:08:44');
INSERT INTO `usuario_permisos` VALUES (1634, 28, 110, NULL, '2019-07-04 09:08:44', '2019-07-04 09:08:44');
INSERT INTO `usuario_permisos` VALUES (1635, 19, 110, NULL, '2019-07-04 09:08:44', '2019-07-04 09:08:44');
INSERT INTO `usuario_permisos` VALUES (1636, 8, 85, NULL, '2019-07-04 09:10:10', '2019-07-04 09:10:10');
INSERT INTO `usuario_permisos` VALUES (1637, 27, 85, NULL, '2019-07-04 09:10:10', '2019-07-04 09:10:10');
INSERT INTO `usuario_permisos` VALUES (1638, 30, 85, NULL, '2019-07-04 09:10:10', '2019-07-04 09:10:10');
INSERT INTO `usuario_permisos` VALUES (1639, 31, 85, NULL, '2019-07-04 09:10:10', '2019-07-04 09:10:10');
INSERT INTO `usuario_permisos` VALUES (1640, 9, 85, NULL, '2019-07-04 09:10:10', '2019-07-04 09:10:10');
INSERT INTO `usuario_permisos` VALUES (1641, 45, 85, NULL, '2019-07-04 09:10:10', '2019-07-04 09:10:10');
INSERT INTO `usuario_permisos` VALUES (1642, 46, 85, NULL, '2019-07-04 09:10:11', '2019-07-04 09:10:11');
INSERT INTO `usuario_permisos` VALUES (1643, 28, 85, NULL, '2019-07-04 09:10:11', '2019-07-04 09:10:11');
INSERT INTO `usuario_permisos` VALUES (1644, 19, 85, NULL, '2019-07-04 09:10:11', '2019-07-04 09:10:11');
INSERT INTO `usuario_permisos` VALUES (1645, 8, 93, NULL, '2019-07-04 09:10:34', '2019-07-04 09:10:34');
INSERT INTO `usuario_permisos` VALUES (1646, 27, 93, NULL, '2019-07-04 09:10:34', '2019-07-04 09:10:34');
INSERT INTO `usuario_permisos` VALUES (1649, 9, 93, NULL, '2019-07-04 09:10:34', '2019-07-04 09:10:34');
INSERT INTO `usuario_permisos` VALUES (1652, 28, 93, NULL, '2019-07-04 09:10:34', '2019-07-04 09:10:34');
INSERT INTO `usuario_permisos` VALUES (1653, 19, 93, NULL, '2019-07-04 09:10:34', '2019-07-04 09:10:34');
INSERT INTO `usuario_permisos` VALUES (1654, 8, 726, NULL, '2019-07-04 09:11:02', '2019-07-04 09:11:02');
INSERT INTO `usuario_permisos` VALUES (1655, 27, 726, NULL, '2019-07-04 09:11:02', '2019-07-04 09:11:02');
INSERT INTO `usuario_permisos` VALUES (1656, 30, 726, NULL, '2019-07-04 09:11:02', '2019-07-04 09:11:02');
INSERT INTO `usuario_permisos` VALUES (1657, 31, 726, NULL, '2019-07-04 09:11:02', '2019-07-04 09:11:02');
INSERT INTO `usuario_permisos` VALUES (1658, 9, 726, NULL, '2019-07-04 09:11:02', '2019-07-04 09:11:02');
INSERT INTO `usuario_permisos` VALUES (1659, 45, 726, NULL, '2019-07-04 09:11:02', '2019-07-04 09:11:02');
INSERT INTO `usuario_permisos` VALUES (1660, 46, 726, NULL, '2019-07-04 09:11:03', '2019-07-04 09:11:03');
INSERT INTO `usuario_permisos` VALUES (1661, 28, 726, NULL, '2019-07-04 09:11:03', '2019-07-04 09:11:03');
INSERT INTO `usuario_permisos` VALUES (1662, 19, 726, NULL, '2019-07-04 09:11:03', '2019-07-04 09:11:03');
INSERT INTO `usuario_permisos` VALUES (1663, 8, 478, NULL, '2019-07-04 09:11:28', '2019-07-04 09:11:28');
INSERT INTO `usuario_permisos` VALUES (1664, 27, 478, NULL, '2019-07-04 09:11:28', '2019-07-04 09:11:28');
INSERT INTO `usuario_permisos` VALUES (1665, 30, 478, NULL, '2019-07-04 09:11:28', '2019-07-04 09:11:28');
INSERT INTO `usuario_permisos` VALUES (1666, 31, 478, NULL, '2019-07-04 09:11:28', '2019-07-04 09:11:28');
INSERT INTO `usuario_permisos` VALUES (1667, 9, 478, NULL, '2019-07-04 09:11:28', '2019-07-04 09:11:28');
INSERT INTO `usuario_permisos` VALUES (1668, 45, 478, NULL, '2019-07-04 09:11:28', '2019-07-04 09:11:28');
INSERT INTO `usuario_permisos` VALUES (1669, 46, 478, NULL, '2019-07-04 09:11:28', '2019-07-04 09:11:28');
INSERT INTO `usuario_permisos` VALUES (1670, 28, 478, NULL, '2019-07-04 09:11:28', '2019-07-04 09:11:28');
INSERT INTO `usuario_permisos` VALUES (1671, 19, 478, NULL, '2019-07-04 09:11:28', '2019-07-04 09:11:28');
INSERT INTO `usuario_permisos` VALUES (1672, 8, 129, NULL, '2019-07-04 09:11:54', '2019-07-04 09:11:54');
INSERT INTO `usuario_permisos` VALUES (1673, 27, 129, NULL, '2019-07-04 09:11:54', '2019-07-04 09:11:54');
INSERT INTO `usuario_permisos` VALUES (1674, 30, 129, NULL, '2019-07-04 09:11:54', '2019-07-04 09:11:54');
INSERT INTO `usuario_permisos` VALUES (1675, 31, 129, NULL, '2019-07-04 09:11:54', '2019-07-04 09:11:54');
INSERT INTO `usuario_permisos` VALUES (1676, 9, 129, NULL, '2019-07-04 09:11:54', '2019-07-04 09:11:54');
INSERT INTO `usuario_permisos` VALUES (1677, 45, 129, NULL, '2019-07-04 09:11:54', '2019-07-04 09:11:54');
INSERT INTO `usuario_permisos` VALUES (1678, 46, 129, NULL, '2019-07-04 09:11:54', '2019-07-04 09:11:54');
INSERT INTO `usuario_permisos` VALUES (1679, 28, 129, NULL, '2019-07-04 09:11:54', '2019-07-04 09:11:54');
INSERT INTO `usuario_permisos` VALUES (1680, 19, 129, NULL, '2019-07-04 09:11:54', '2019-07-04 09:11:54');
INSERT INTO `usuario_permisos` VALUES (1681, 8, 66, NULL, '2019-07-04 09:12:08', '2019-07-04 09:12:08');
INSERT INTO `usuario_permisos` VALUES (1682, 27, 66, NULL, '2019-07-04 09:12:08', '2019-07-04 09:12:08');
INSERT INTO `usuario_permisos` VALUES (1683, 30, 66, NULL, '2019-07-04 09:12:08', '2019-07-04 09:12:08');
INSERT INTO `usuario_permisos` VALUES (1684, 31, 66, NULL, '2019-07-04 09:12:08', '2019-07-04 09:12:08');
INSERT INTO `usuario_permisos` VALUES (1685, 9, 66, NULL, '2019-07-04 09:12:08', '2019-07-04 09:12:08');
INSERT INTO `usuario_permisos` VALUES (1686, 45, 66, NULL, '2019-07-04 09:12:08', '2019-07-04 09:12:08');
INSERT INTO `usuario_permisos` VALUES (1687, 46, 66, NULL, '2019-07-04 09:12:08', '2019-07-04 09:12:08');
INSERT INTO `usuario_permisos` VALUES (1688, 28, 66, NULL, '2019-07-04 09:12:08', '2019-07-04 09:12:08');
INSERT INTO `usuario_permisos` VALUES (1689, 19, 66, NULL, '2019-07-04 09:12:08', '2019-07-04 09:12:08');
INSERT INTO `usuario_permisos` VALUES (1691, 27, 238, NULL, '2019-07-04 09:14:44', '2019-07-04 09:14:44');
INSERT INTO `usuario_permisos` VALUES (1697, 28, 238, NULL, '2019-07-04 09:14:44', '2019-07-04 09:14:44');
INSERT INTO `usuario_permisos` VALUES (1698, 19, 238, NULL, '2019-07-04 09:14:44', '2019-07-04 09:14:44');
INSERT INTO `usuario_permisos` VALUES (1700, 27, 721, NULL, '2019-07-04 09:15:21', '2019-07-04 09:15:21');
INSERT INTO `usuario_permisos` VALUES (1706, 28, 721, NULL, '2019-07-04 09:15:22', '2019-07-04 09:15:22');
INSERT INTO `usuario_permisos` VALUES (1707, 19, 721, NULL, '2019-07-04 09:15:22', '2019-07-04 09:15:22');
INSERT INTO `usuario_permisos` VALUES (1709, 27, 239, NULL, '2019-07-04 09:18:28', '2019-07-04 09:18:28');
INSERT INTO `usuario_permisos` VALUES (1715, 28, 239, NULL, '2019-07-04 09:18:29', '2019-07-04 09:18:29');
INSERT INTO `usuario_permisos` VALUES (1716, 19, 239, NULL, '2019-07-04 09:18:29', '2019-07-04 09:18:29');
INSERT INTO `usuario_permisos` VALUES (1717, 8, 463, NULL, '2019-07-04 09:19:58', '2019-07-04 09:19:58');
INSERT INTO `usuario_permisos` VALUES (1718, 27, 463, NULL, '2019-07-04 09:19:58', '2019-07-04 09:19:58');
INSERT INTO `usuario_permisos` VALUES (1719, 30, 463, NULL, '2019-07-04 09:19:58', '2019-07-04 09:19:58');
INSERT INTO `usuario_permisos` VALUES (1720, 31, 463, NULL, '2019-07-04 09:19:58', '2019-07-04 09:19:58');
INSERT INTO `usuario_permisos` VALUES (1721, 9, 463, NULL, '2019-07-04 09:19:58', '2019-07-04 09:19:58');
INSERT INTO `usuario_permisos` VALUES (1722, 45, 463, NULL, '2019-07-04 09:19:58', '2019-07-04 09:19:58');
INSERT INTO `usuario_permisos` VALUES (1723, 46, 463, NULL, '2019-07-04 09:19:58', '2019-07-04 09:19:58');
INSERT INTO `usuario_permisos` VALUES (1724, 28, 463, NULL, '2019-07-04 09:19:59', '2019-07-04 09:19:59');
INSERT INTO `usuario_permisos` VALUES (1725, 19, 463, NULL, '2019-07-04 09:19:59', '2019-07-04 09:19:59');
INSERT INTO `usuario_permisos` VALUES (1726, 28, 536, NULL, '2019-07-04 09:20:30', '2019-07-04 09:20:30');
INSERT INTO `usuario_permisos` VALUES (1727, 9, 251, NULL, '2019-07-04 09:24:33', '2019-07-04 09:24:33');
INSERT INTO `usuario_permisos` VALUES (1728, 8, 117, NULL, '2019-07-04 10:36:49', '2019-07-04 10:36:49');
INSERT INTO `usuario_permisos` VALUES (1729, 9, 117, NULL, '2019-07-04 10:36:49', '2019-07-04 10:36:49');
INSERT INTO `usuario_permisos` VALUES (1730, 10, 117, NULL, '2019-07-04 10:36:49', '2019-07-04 10:36:49');
INSERT INTO `usuario_permisos` VALUES (1731, 11, 117, NULL, '2019-07-04 10:36:49', '2019-07-04 10:36:49');
INSERT INTO `usuario_permisos` VALUES (1732, 18, 117, NULL, '2019-07-04 10:36:49', '2019-07-04 10:36:49');
INSERT INTO `usuario_permisos` VALUES (1736, 27, 117, NULL, '2019-07-04 10:36:50', '2019-07-04 10:36:50');
INSERT INTO `usuario_permisos` VALUES (1737, 28, 117, NULL, '2019-07-04 10:36:50', '2019-07-04 10:36:50');
INSERT INTO `usuario_permisos` VALUES (1739, 30, 117, NULL, '2019-07-04 10:36:50', '2019-07-04 10:36:50');
INSERT INTO `usuario_permisos` VALUES (1740, 31, 117, NULL, '2019-07-04 10:36:50', '2019-07-04 10:36:50');
INSERT INTO `usuario_permisos` VALUES (1741, 32, 117, NULL, '2019-07-04 10:36:50', '2019-07-04 10:36:50');
INSERT INTO `usuario_permisos` VALUES (1742, 36, 117, NULL, '2019-07-04 10:36:50', '2019-07-04 10:36:50');
INSERT INTO `usuario_permisos` VALUES (1743, 37, 117, NULL, '2019-07-04 10:36:50', '2019-07-04 10:36:50');
INSERT INTO `usuario_permisos` VALUES (1744, 38, 117, NULL, '2019-07-04 10:36:50', '2019-07-04 10:36:50');
INSERT INTO `usuario_permisos` VALUES (1745, 42, 117, NULL, '2019-07-04 10:36:50', '2019-07-04 10:36:50');
INSERT INTO `usuario_permisos` VALUES (1746, 45, 117, NULL, '2019-07-04 10:36:50', '2019-07-04 10:36:50');
INSERT INTO `usuario_permisos` VALUES (1747, 46, 117, NULL, '2019-07-04 10:36:50', '2019-07-04 10:36:50');
INSERT INTO `usuario_permisos` VALUES (1749, 47, 117, NULL, '2019-07-04 10:37:50', '2019-07-04 10:37:50');
INSERT INTO `usuario_permisos` VALUES (1751, 53, 117, NULL, '2019-07-04 10:37:50', '2019-07-04 10:37:50');
INSERT INTO `usuario_permisos` VALUES (1753, 44, 117, NULL, '2019-07-04 10:39:11', '2019-07-04 10:39:11');
INSERT INTO `usuario_permisos` VALUES (1754, 8, 492, NULL, '2019-07-04 16:32:03', '2019-07-04 16:32:03');
INSERT INTO `usuario_permisos` VALUES (1755, 27, 492, NULL, '2019-07-04 16:32:03', '2019-07-04 16:32:03');
INSERT INTO `usuario_permisos` VALUES (1756, 12, 492, NULL, '2019-07-04 16:32:03', '2019-07-04 16:32:03');
INSERT INTO `usuario_permisos` VALUES (1757, 21, 492, NULL, '2019-07-04 16:32:03', '2019-07-04 16:32:03');
INSERT INTO `usuario_permisos` VALUES (1758, 36, 492, NULL, '2019-07-04 16:32:03', '2019-07-04 16:32:03');
INSERT INTO `usuario_permisos` VALUES (1759, 37, 492, NULL, '2019-07-04 16:32:03', '2019-07-04 16:32:03');
INSERT INTO `usuario_permisos` VALUES (1760, 28, 492, NULL, '2019-07-04 16:32:03', '2019-07-04 16:32:03');
INSERT INTO `usuario_permisos` VALUES (1761, 57, 117, NULL, '2019-07-05 11:00:42', '2019-07-05 11:00:42');
INSERT INTO `usuario_permisos` VALUES (1769, 8, 44, NULL, '2019-07-08 12:39:02', '2019-07-08 12:39:02');
INSERT INTO `usuario_permisos` VALUES (1770, 27, 44, NULL, '2019-07-08 12:39:02', '2019-07-08 12:39:02');
INSERT INTO `usuario_permisos` VALUES (1771, 30, 44, NULL, '2019-07-08 12:39:02', '2019-07-08 12:39:02');
INSERT INTO `usuario_permisos` VALUES (1772, 31, 44, NULL, '2019-07-08 12:39:02', '2019-07-08 12:39:02');
INSERT INTO `usuario_permisos` VALUES (1773, 9, 44, NULL, '2019-07-08 12:39:02', '2019-07-08 12:39:02');
INSERT INTO `usuario_permisos` VALUES (1774, 45, 44, NULL, '2019-07-08 12:39:02', '2019-07-08 12:39:02');
INSERT INTO `usuario_permisos` VALUES (1775, 46, 44, NULL, '2019-07-08 12:39:02', '2019-07-08 12:39:02');
INSERT INTO `usuario_permisos` VALUES (1776, 28, 44, NULL, '2019-07-08 12:39:02', '2019-07-08 12:39:02');
INSERT INTO `usuario_permisos` VALUES (1777, 19, 44, NULL, '2019-07-08 12:39:02', '2019-07-08 12:39:02');
INSERT INTO `usuario_permisos` VALUES (1779, 8, 727, NULL, '2019-07-09 11:41:02', '2019-07-09 11:41:02');
INSERT INTO `usuario_permisos` VALUES (1780, 9, 727, NULL, '2019-07-09 11:41:02', '2019-07-09 11:41:02');
INSERT INTO `usuario_permisos` VALUES (1781, 10, 727, NULL, '2019-07-09 11:41:02', '2019-07-09 11:41:02');
INSERT INTO `usuario_permisos` VALUES (1782, 11, 727, NULL, '2019-07-09 11:41:02', '2019-07-09 11:41:02');
INSERT INTO `usuario_permisos` VALUES (1783, 18, 727, NULL, '2019-07-09 11:41:02', '2019-07-09 11:41:02');
INSERT INTO `usuario_permisos` VALUES (1784, 19, 727, NULL, '2019-07-09 11:41:02', '2019-07-09 11:41:02');
INSERT INTO `usuario_permisos` VALUES (1785, 20, 727, NULL, '2019-07-09 11:41:02', '2019-07-09 11:41:02');
INSERT INTO `usuario_permisos` VALUES (1786, 26, 727, NULL, '2019-07-09 11:41:02', '2019-07-09 11:41:02');
INSERT INTO `usuario_permisos` VALUES (1787, 27, 727, NULL, '2019-07-09 11:41:02', '2019-07-09 11:41:02');
INSERT INTO `usuario_permisos` VALUES (1788, 28, 727, NULL, '2019-07-09 11:41:02', '2019-07-09 11:41:02');
INSERT INTO `usuario_permisos` VALUES (1789, 29, 727, NULL, '2019-07-09 11:41:02', '2019-07-09 11:41:02');
INSERT INTO `usuario_permisos` VALUES (1790, 30, 727, NULL, '2019-07-09 11:41:02', '2019-07-09 11:41:02');
INSERT INTO `usuario_permisos` VALUES (1791, 31, 727, NULL, '2019-07-09 11:41:02', '2019-07-09 11:41:02');
INSERT INTO `usuario_permisos` VALUES (1792, 32, 727, NULL, '2019-07-09 11:41:02', '2019-07-09 11:41:02');
INSERT INTO `usuario_permisos` VALUES (1793, 36, 727, NULL, '2019-07-09 11:41:03', '2019-07-09 11:41:03');
INSERT INTO `usuario_permisos` VALUES (1794, 37, 727, NULL, '2019-07-09 11:41:03', '2019-07-09 11:41:03');
INSERT INTO `usuario_permisos` VALUES (1795, 38, 727, NULL, '2019-07-09 11:41:03', '2019-07-09 11:41:03');
INSERT INTO `usuario_permisos` VALUES (1796, 42, 727, NULL, '2019-07-09 11:41:03', '2019-07-09 11:41:03');
INSERT INTO `usuario_permisos` VALUES (1797, 45, 727, NULL, '2019-07-09 11:41:03', '2019-07-09 11:41:03');
INSERT INTO `usuario_permisos` VALUES (1798, 46, 727, NULL, '2019-07-09 11:41:03', '2019-07-09 11:41:03');
INSERT INTO `usuario_permisos` VALUES (1799, 14, 744, NULL, '2019-07-09 14:03:24', '2019-07-09 14:03:24');
INSERT INTO `usuario_permisos` VALUES (1800, 23, 744, NULL, '2019-07-09 14:03:24', '2019-07-09 14:03:24');
INSERT INTO `usuario_permisos` VALUES (1801, 44, 731, NULL, '2019-07-09 15:04:27', '2019-07-09 15:04:27');
INSERT INTO `usuario_permisos` VALUES (1802, 44, 711, NULL, '2019-07-09 15:05:12', '2019-07-09 15:05:12');
INSERT INTO `usuario_permisos` VALUES (1803, 44, 536, NULL, '2019-07-09 15:05:27', '2019-07-09 15:05:27');
INSERT INTO `usuario_permisos` VALUES (1804, 44, 749, NULL, '2019-07-09 15:05:53', '2019-07-09 15:05:53');
INSERT INTO `usuario_permisos` VALUES (1805, 44, 744, NULL, '2019-07-09 15:06:25', '2019-07-09 15:06:25');
INSERT INTO `usuario_permisos` VALUES (1806, 44, 251, NULL, '2019-07-09 15:06:46', '2019-07-09 15:06:46');
INSERT INTO `usuario_permisos` VALUES (1807, 11, 777, NULL, '2019-07-09 16:06:53', '2019-07-09 16:06:53');
INSERT INTO `usuario_permisos` VALUES (1808, 11, 232, NULL, '2019-07-09 16:07:05', '2019-07-09 16:07:05');
INSERT INTO `usuario_permisos` VALUES (1809, 11, 507, NULL, '2019-07-09 16:07:24', '2019-07-09 16:07:24');
INSERT INTO `usuario_permisos` VALUES (1810, 1, 459, NULL, '2019-07-10 11:57:05', '2019-07-10 11:57:05');
INSERT INTO `usuario_permisos` VALUES (1811, 2, 459, NULL, '2019-07-10 11:57:05', '2019-07-10 11:57:05');
INSERT INTO `usuario_permisos` VALUES (1812, 3, 459, NULL, '2019-07-10 11:57:05', '2019-07-10 11:57:05');
INSERT INTO `usuario_permisos` VALUES (1813, 4, 459, NULL, '2019-07-10 11:57:05', '2019-07-10 11:57:05');
INSERT INTO `usuario_permisos` VALUES (1814, 5, 459, NULL, '2019-07-10 11:57:05', '2019-07-10 11:57:05');
INSERT INTO `usuario_permisos` VALUES (1815, 6, 459, NULL, '2019-07-10 11:57:05', '2019-07-10 11:57:05');
INSERT INTO `usuario_permisos` VALUES (1816, 7, 459, NULL, '2019-07-10 11:57:05', '2019-07-10 11:57:05');
INSERT INTO `usuario_permisos` VALUES (1817, 8, 459, NULL, '2019-07-10 11:57:05', '2019-07-10 11:57:05');
INSERT INTO `usuario_permisos` VALUES (1818, 9, 459, NULL, '2019-07-10 11:57:05', '2019-07-10 11:57:05');
INSERT INTO `usuario_permisos` VALUES (1819, 10, 459, NULL, '2019-07-10 11:57:05', '2019-07-10 11:57:05');
INSERT INTO `usuario_permisos` VALUES (1820, 11, 459, NULL, '2019-07-10 11:57:05', '2019-07-10 11:57:05');
INSERT INTO `usuario_permisos` VALUES (1821, 12, 459, NULL, '2019-07-10 11:57:05', '2019-07-10 11:57:05');
INSERT INTO `usuario_permisos` VALUES (1822, 13, 459, NULL, '2019-07-10 11:57:05', '2019-07-10 11:57:05');
INSERT INTO `usuario_permisos` VALUES (1823, 14, 459, NULL, '2019-07-10 11:57:05', '2019-07-10 11:57:05');
INSERT INTO `usuario_permisos` VALUES (1824, 15, 459, NULL, '2019-07-10 11:57:05', '2019-07-10 11:57:05');
INSERT INTO `usuario_permisos` VALUES (1825, 16, 459, NULL, '2019-07-10 11:57:05', '2019-07-10 11:57:05');
INSERT INTO `usuario_permisos` VALUES (1826, 17, 459, NULL, '2019-07-10 11:57:05', '2019-07-10 11:57:05');
INSERT INTO `usuario_permisos` VALUES (1827, 18, 459, NULL, '2019-07-10 11:57:05', '2019-07-10 11:57:05');
INSERT INTO `usuario_permisos` VALUES (1828, 19, 459, NULL, '2019-07-10 11:57:06', '2019-07-10 11:57:06');
INSERT INTO `usuario_permisos` VALUES (1829, 20, 459, NULL, '2019-07-10 11:57:06', '2019-07-10 11:57:06');
INSERT INTO `usuario_permisos` VALUES (1830, 21, 459, NULL, '2019-07-10 11:57:06', '2019-07-10 11:57:06');
INSERT INTO `usuario_permisos` VALUES (1831, 22, 459, NULL, '2019-07-10 11:57:06', '2019-07-10 11:57:06');
INSERT INTO `usuario_permisos` VALUES (1832, 23, 459, NULL, '2019-07-10 11:57:06', '2019-07-10 11:57:06');
INSERT INTO `usuario_permisos` VALUES (1833, 24, 459, NULL, '2019-07-10 11:57:06', '2019-07-10 11:57:06');
INSERT INTO `usuario_permisos` VALUES (1834, 25, 459, NULL, '2019-07-10 11:57:06', '2019-07-10 11:57:06');
INSERT INTO `usuario_permisos` VALUES (1835, 26, 459, NULL, '2019-07-10 11:57:06', '2019-07-10 11:57:06');
INSERT INTO `usuario_permisos` VALUES (1836, 27, 459, NULL, '2019-07-10 11:57:06', '2019-07-10 11:57:06');
INSERT INTO `usuario_permisos` VALUES (1837, 28, 459, NULL, '2019-07-10 11:57:06', '2019-07-10 11:57:06');
INSERT INTO `usuario_permisos` VALUES (1838, 29, 459, NULL, '2019-07-10 11:57:06', '2019-07-10 11:57:06');
INSERT INTO `usuario_permisos` VALUES (1839, 30, 459, NULL, '2019-07-10 11:57:06', '2019-07-10 11:57:06');
INSERT INTO `usuario_permisos` VALUES (1840, 31, 459, NULL, '2019-07-10 11:57:06', '2019-07-10 11:57:06');
INSERT INTO `usuario_permisos` VALUES (1841, 32, 459, NULL, '2019-07-10 11:57:06', '2019-07-10 11:57:06');
INSERT INTO `usuario_permisos` VALUES (1842, 33, 459, NULL, '2019-07-10 11:57:06', '2019-07-10 11:57:06');
INSERT INTO `usuario_permisos` VALUES (1843, 34, 459, NULL, '2019-07-10 11:57:06', '2019-07-10 11:57:06');
INSERT INTO `usuario_permisos` VALUES (1844, 35, 459, NULL, '2019-07-10 11:57:06', '2019-07-10 11:57:06');
INSERT INTO `usuario_permisos` VALUES (1845, 36, 459, NULL, '2019-07-10 11:57:06', '2019-07-10 11:57:06');
INSERT INTO `usuario_permisos` VALUES (1846, 37, 459, NULL, '2019-07-10 11:57:06', '2019-07-10 11:57:06');
INSERT INTO `usuario_permisos` VALUES (1847, 38, 459, NULL, '2019-07-10 11:57:06', '2019-07-10 11:57:06');
INSERT INTO `usuario_permisos` VALUES (1848, 39, 459, NULL, '2019-07-10 11:57:06', '2019-07-10 11:57:06');
INSERT INTO `usuario_permisos` VALUES (1849, 40, 459, NULL, '2019-07-10 11:57:06', '2019-07-10 11:57:06');
INSERT INTO `usuario_permisos` VALUES (1850, 41, 459, NULL, '2019-07-10 11:57:06', '2019-07-10 11:57:06');
INSERT INTO `usuario_permisos` VALUES (1851, 42, 459, NULL, '2019-07-10 11:57:06', '2019-07-10 11:57:06');
INSERT INTO `usuario_permisos` VALUES (1852, 43, 459, NULL, '2019-07-10 11:57:06', '2019-07-10 11:57:06');
INSERT INTO `usuario_permisos` VALUES (1853, 44, 459, NULL, '2019-07-10 11:57:06', '2019-07-10 11:57:06');
INSERT INTO `usuario_permisos` VALUES (1854, 45, 459, NULL, '2019-07-10 11:57:06', '2019-07-10 11:57:06');
INSERT INTO `usuario_permisos` VALUES (1855, 46, 459, NULL, '2019-07-10 11:57:06', '2019-07-10 11:57:06');
INSERT INTO `usuario_permisos` VALUES (1856, 47, 459, NULL, '2019-07-10 11:57:06', '2019-07-10 11:57:06');
INSERT INTO `usuario_permisos` VALUES (1857, 48, 459, NULL, '2019-07-10 11:57:06', '2019-07-10 11:57:06');
INSERT INTO `usuario_permisos` VALUES (1858, 50, 459, NULL, '2019-07-10 11:57:06', '2019-07-10 11:57:06');
INSERT INTO `usuario_permisos` VALUES (1859, 51, 459, NULL, '2019-07-10 11:57:06', '2019-07-10 11:57:06');
INSERT INTO `usuario_permisos` VALUES (1860, 52, 459, NULL, '2019-07-10 11:57:06', '2019-07-10 11:57:06');
INSERT INTO `usuario_permisos` VALUES (1861, 53, 459, NULL, '2019-07-10 11:57:06', '2019-07-10 11:57:06');
INSERT INTO `usuario_permisos` VALUES (1862, 55, 459, NULL, '2019-07-10 11:57:06', '2019-07-10 11:57:06');
INSERT INTO `usuario_permisos` VALUES (1863, 56, 459, NULL, '2019-07-10 11:57:06', '2019-07-10 11:57:06');
INSERT INTO `usuario_permisos` VALUES (1864, 57, 459, NULL, '2019-07-10 11:57:06', '2019-07-10 11:57:06');
INSERT INTO `usuario_permisos` VALUES (1865, 58, 459, NULL, '2019-07-10 11:57:07', '2019-07-10 11:57:07');
INSERT INTO `usuario_permisos` VALUES (1866, 59, 459, NULL, '2019-07-10 11:57:07', '2019-07-10 11:57:07');
INSERT INTO `usuario_permisos` VALUES (1867, 60, 459, NULL, '2019-07-10 11:57:07', '2019-07-10 11:57:07');
INSERT INTO `usuario_permisos` VALUES (1868, 61, 459, NULL, '2019-07-10 11:57:07', '2019-07-10 11:57:07');
INSERT INTO `usuario_permisos` VALUES (1869, 62, 459, NULL, '2019-07-10 11:57:07', '2019-07-10 11:57:07');
INSERT INTO `usuario_permisos` VALUES (1870, 63, 459, NULL, '2019-07-10 11:57:07', '2019-07-10 11:57:07');
INSERT INTO `usuario_permisos` VALUES (1871, 8, 34, NULL, '2019-07-10 11:58:16', '2019-07-10 11:58:16');
INSERT INTO `usuario_permisos` VALUES (1872, 27, 34, NULL, '2019-07-10 11:58:17', '2019-07-10 11:58:17');
INSERT INTO `usuario_permisos` VALUES (1878, 28, 34, NULL, '2019-07-10 11:58:17', '2019-07-10 11:58:17');
INSERT INTO `usuario_permisos` VALUES (1880, 44, 34, NULL, '2019-07-10 11:59:27', '2019-07-10 11:59:27');
INSERT INTO `usuario_permisos` VALUES (1881, 8, 799, NULL, '2019-07-12 14:47:47', '2019-07-12 14:47:47');
INSERT INTO `usuario_permisos` VALUES (1882, 27, 799, NULL, '2019-07-12 14:47:47', '2019-07-12 14:47:47');
INSERT INTO `usuario_permisos` VALUES (1885, 9, 799, NULL, '2019-07-12 14:47:47', '2019-07-12 14:47:47');
INSERT INTO `usuario_permisos` VALUES (1888, 28, 799, NULL, '2019-07-12 14:47:47', '2019-07-12 14:47:47');
INSERT INTO `usuario_permisos` VALUES (1890, 8, 514, NULL, '2019-07-15 12:56:08', '2019-07-15 12:56:08');
INSERT INTO `usuario_permisos` VALUES (1891, 27, 514, NULL, '2019-07-15 12:56:08', '2019-07-15 12:56:08');
INSERT INTO `usuario_permisos` VALUES (1892, 30, 514, NULL, '2019-07-15 12:56:08', '2019-07-15 12:56:08');
INSERT INTO `usuario_permisos` VALUES (1893, 31, 514, NULL, '2019-07-15 12:56:09', '2019-07-15 12:56:09');
INSERT INTO `usuario_permisos` VALUES (1894, 9, 514, NULL, '2019-07-15 12:56:09', '2019-07-15 12:56:09');
INSERT INTO `usuario_permisos` VALUES (1895, 45, 514, NULL, '2019-07-15 12:56:09', '2019-07-15 12:56:09');
INSERT INTO `usuario_permisos` VALUES (1896, 46, 514, NULL, '2019-07-15 12:56:09', '2019-07-15 12:56:09');
INSERT INTO `usuario_permisos` VALUES (1897, 28, 514, NULL, '2019-07-15 12:56:09', '2019-07-15 12:56:09');
INSERT INTO `usuario_permisos` VALUES (1898, 19, 514, NULL, '2019-07-15 12:56:09', '2019-07-15 12:56:09');
INSERT INTO `usuario_permisos` VALUES (1899, 8, 20, NULL, '2019-07-15 13:28:36', '2019-07-15 13:28:36');
INSERT INTO `usuario_permisos` VALUES (1900, 27, 20, NULL, '2019-07-15 13:28:36', '2019-07-15 13:28:36');
INSERT INTO `usuario_permisos` VALUES (1901, 30, 20, NULL, '2019-07-15 13:28:36', '2019-07-15 13:28:36');
INSERT INTO `usuario_permisos` VALUES (1902, 31, 20, NULL, '2019-07-15 13:28:36', '2019-07-15 13:28:36');
INSERT INTO `usuario_permisos` VALUES (1903, 9, 20, NULL, '2019-07-15 13:28:36', '2019-07-15 13:28:36');
INSERT INTO `usuario_permisos` VALUES (1904, 45, 20, NULL, '2019-07-15 13:28:36', '2019-07-15 13:28:36');
INSERT INTO `usuario_permisos` VALUES (1905, 46, 20, NULL, '2019-07-15 13:28:36', '2019-07-15 13:28:36');
INSERT INTO `usuario_permisos` VALUES (1906, 28, 20, NULL, '2019-07-15 13:28:36', '2019-07-15 13:28:36');
INSERT INTO `usuario_permisos` VALUES (1907, 19, 20, NULL, '2019-07-15 13:28:36', '2019-07-15 13:28:36');
INSERT INTO `usuario_permisos` VALUES (1908, 8, 86, NULL, '2019-07-15 16:14:16', '2019-07-15 16:14:16');
INSERT INTO `usuario_permisos` VALUES (1909, 9, 86, NULL, '2019-07-15 16:14:16', '2019-07-15 16:14:16');
INSERT INTO `usuario_permisos` VALUES (1910, 10, 86, NULL, '2019-07-15 16:14:16', '2019-07-15 16:14:16');
INSERT INTO `usuario_permisos` VALUES (1911, 11, 86, NULL, '2019-07-15 16:14:16', '2019-07-15 16:14:16');
INSERT INTO `usuario_permisos` VALUES (1912, 18, 86, NULL, '2019-07-15 16:14:16', '2019-07-15 16:14:16');
INSERT INTO `usuario_permisos` VALUES (1913, 19, 86, NULL, '2019-07-15 16:14:16', '2019-07-15 16:14:16');
INSERT INTO `usuario_permisos` VALUES (1916, 27, 86, NULL, '2019-07-15 16:14:16', '2019-07-15 16:14:16');
INSERT INTO `usuario_permisos` VALUES (1917, 28, 86, NULL, '2019-07-15 16:14:16', '2019-07-15 16:14:16');
INSERT INTO `usuario_permisos` VALUES (1918, 29, 86, NULL, '2019-07-15 16:14:16', '2019-07-15 16:14:16');
INSERT INTO `usuario_permisos` VALUES (1919, 30, 86, NULL, '2019-07-15 16:14:16', '2019-07-15 16:14:16');
INSERT INTO `usuario_permisos` VALUES (1920, 31, 86, NULL, '2019-07-15 16:14:16', '2019-07-15 16:14:16');
INSERT INTO `usuario_permisos` VALUES (1922, 36, 86, NULL, '2019-07-15 16:14:16', '2019-07-15 16:14:16');
INSERT INTO `usuario_permisos` VALUES (1923, 37, 86, NULL, '2019-07-15 16:14:16', '2019-07-15 16:14:16');
INSERT INTO `usuario_permisos` VALUES (1924, 38, 86, NULL, '2019-07-15 16:14:16', '2019-07-15 16:14:16');
INSERT INTO `usuario_permisos` VALUES (1925, 42, 86, NULL, '2019-07-15 16:14:16', '2019-07-15 16:14:16');
INSERT INTO `usuario_permisos` VALUES (1926, 45, 86, NULL, '2019-07-15 16:14:17', '2019-07-15 16:14:17');
INSERT INTO `usuario_permisos` VALUES (1927, 46, 86, NULL, '2019-07-15 16:14:17', '2019-07-15 16:14:17');
INSERT INTO `usuario_permisos` VALUES (1928, 44, 86, NULL, '2019-07-15 16:14:51', '2019-07-15 16:14:51');
INSERT INTO `usuario_permisos` VALUES (1929, 44, 492, NULL, '2019-07-16 09:19:04', '2019-07-16 09:19:04');
INSERT INTO `usuario_permisos` VALUES (1930, 41, 794, NULL, '2019-07-16 09:46:55', '2019-07-16 09:46:55');
INSERT INTO `usuario_permisos` VALUES (1932, 64, 750, NULL, '2019-07-17 13:01:58', '2019-07-17 13:01:58');
INSERT INTO `usuario_permisos` VALUES (1933, 64, 518, NULL, '2019-07-17 13:02:19', '2019-07-17 13:02:19');
INSERT INTO `usuario_permisos` VALUES (1934, 64, 45, NULL, '2019-07-17 13:02:32', '2019-07-17 13:02:32');
INSERT INTO `usuario_permisos` VALUES (1935, 64, 517, NULL, '2019-07-17 13:02:54', '2019-07-17 13:02:54');
INSERT INTO `usuario_permisos` VALUES (1936, 64, 448, NULL, '2019-07-17 13:03:32', '2019-07-17 13:03:32');
INSERT INTO `usuario_permisos` VALUES (1937, 64, 719, NULL, '2019-07-17 13:03:44', '2019-07-17 13:03:44');
INSERT INTO `usuario_permisos` VALUES (1938, 48, 794, NULL, '2019-07-18 10:50:15', '2019-07-18 10:50:15');
INSERT INTO `usuario_permisos` VALUES (1939, 44, 795, NULL, '2019-07-18 11:05:06', '2019-07-18 11:05:06');
INSERT INTO `usuario_permisos` VALUES (1940, 48, 795, NULL, '2019-07-18 11:05:06', '2019-07-18 11:05:06');
INSERT INTO `usuario_permisos` VALUES (1941, 15, 34, NULL, '2019-07-19 14:25:06', '2019-07-19 14:25:06');
INSERT INTO `usuario_permisos` VALUES (1942, 24, 34, NULL, '2019-07-19 14:25:06', '2019-07-19 14:25:06');
INSERT INTO `usuario_permisos` VALUES (1943, 1, 1058, NULL, '2019-07-22 17:10:17', '2019-07-22 17:10:17');
INSERT INTO `usuario_permisos` VALUES (1944, 2, 1058, NULL, '2019-07-22 17:10:17', '2019-07-22 17:10:17');
INSERT INTO `usuario_permisos` VALUES (1945, 3, 1058, NULL, '2019-07-22 17:10:17', '2019-07-22 17:10:17');
INSERT INTO `usuario_permisos` VALUES (1946, 4, 1058, NULL, '2019-07-22 17:10:17', '2019-07-22 17:10:17');
INSERT INTO `usuario_permisos` VALUES (1947, 5, 1058, NULL, '2019-07-22 17:10:17', '2019-07-22 17:10:17');
INSERT INTO `usuario_permisos` VALUES (1948, 6, 1058, NULL, '2019-07-22 17:10:17', '2019-07-22 17:10:17');
INSERT INTO `usuario_permisos` VALUES (1949, 7, 1058, NULL, '2019-07-22 17:10:17', '2019-07-22 17:10:17');
INSERT INTO `usuario_permisos` VALUES (1950, 8, 1058, NULL, '2019-07-22 17:10:17', '2019-07-22 17:10:17');
INSERT INTO `usuario_permisos` VALUES (1951, 9, 1058, NULL, '2019-07-22 17:10:17', '2019-07-22 17:10:17');
INSERT INTO `usuario_permisos` VALUES (1952, 10, 1058, NULL, '2019-07-22 17:10:17', '2019-07-22 17:10:17');
INSERT INTO `usuario_permisos` VALUES (1953, 11, 1058, NULL, '2019-07-22 17:10:17', '2019-07-22 17:10:17');
INSERT INTO `usuario_permisos` VALUES (1954, 12, 1058, NULL, '2019-07-22 17:10:17', '2019-07-22 17:10:17');
INSERT INTO `usuario_permisos` VALUES (1955, 13, 1058, NULL, '2019-07-22 17:10:17', '2019-07-22 17:10:17');
INSERT INTO `usuario_permisos` VALUES (1956, 14, 1058, NULL, '2019-07-22 17:10:18', '2019-07-22 17:10:18');
INSERT INTO `usuario_permisos` VALUES (1957, 15, 1058, NULL, '2019-07-22 17:10:18', '2019-07-22 17:10:18');
INSERT INTO `usuario_permisos` VALUES (1958, 16, 1058, NULL, '2019-07-22 17:10:18', '2019-07-22 17:10:18');
INSERT INTO `usuario_permisos` VALUES (1959, 17, 1058, NULL, '2019-07-22 17:10:18', '2019-07-22 17:10:18');
INSERT INTO `usuario_permisos` VALUES (1960, 18, 1058, NULL, '2019-07-22 17:10:18', '2019-07-22 17:10:18');
INSERT INTO `usuario_permisos` VALUES (1961, 19, 1058, NULL, '2019-07-22 17:10:18', '2019-07-22 17:10:18');
INSERT INTO `usuario_permisos` VALUES (1962, 20, 1058, NULL, '2019-07-22 17:10:18', '2019-07-22 17:10:18');
INSERT INTO `usuario_permisos` VALUES (1963, 21, 1058, NULL, '2019-07-22 17:10:18', '2019-07-22 17:10:18');
INSERT INTO `usuario_permisos` VALUES (1964, 22, 1058, NULL, '2019-07-22 17:10:18', '2019-07-22 17:10:18');
INSERT INTO `usuario_permisos` VALUES (1965, 23, 1058, NULL, '2019-07-22 17:10:18', '2019-07-22 17:10:18');
INSERT INTO `usuario_permisos` VALUES (1966, 24, 1058, NULL, '2019-07-22 17:10:18', '2019-07-22 17:10:18');
INSERT INTO `usuario_permisos` VALUES (1967, 25, 1058, NULL, '2019-07-22 17:10:18', '2019-07-22 17:10:18');
INSERT INTO `usuario_permisos` VALUES (1968, 26, 1058, NULL, '2019-07-22 17:10:18', '2019-07-22 17:10:18');
INSERT INTO `usuario_permisos` VALUES (1969, 27, 1058, NULL, '2019-07-22 17:10:18', '2019-07-22 17:10:18');
INSERT INTO `usuario_permisos` VALUES (1970, 28, 1058, NULL, '2019-07-22 17:10:18', '2019-07-22 17:10:18');
INSERT INTO `usuario_permisos` VALUES (1971, 29, 1058, NULL, '2019-07-22 17:10:18', '2019-07-22 17:10:18');
INSERT INTO `usuario_permisos` VALUES (1972, 30, 1058, NULL, '2019-07-22 17:10:18', '2019-07-22 17:10:18');
INSERT INTO `usuario_permisos` VALUES (1973, 31, 1058, NULL, '2019-07-22 17:10:18', '2019-07-22 17:10:18');
INSERT INTO `usuario_permisos` VALUES (1974, 32, 1058, NULL, '2019-07-22 17:10:18', '2019-07-22 17:10:18');
INSERT INTO `usuario_permisos` VALUES (1975, 33, 1058, NULL, '2019-07-22 17:10:18', '2019-07-22 17:10:18');
INSERT INTO `usuario_permisos` VALUES (1976, 34, 1058, NULL, '2019-07-22 17:10:18', '2019-07-22 17:10:18');
INSERT INTO `usuario_permisos` VALUES (1977, 35, 1058, NULL, '2019-07-22 17:10:18', '2019-07-22 17:10:18');
INSERT INTO `usuario_permisos` VALUES (1978, 36, 1058, NULL, '2019-07-22 17:10:18', '2019-07-22 17:10:18');
INSERT INTO `usuario_permisos` VALUES (1979, 37, 1058, NULL, '2019-07-22 17:10:18', '2019-07-22 17:10:18');
INSERT INTO `usuario_permisos` VALUES (1980, 38, 1058, NULL, '2019-07-22 17:10:18', '2019-07-22 17:10:18');
INSERT INTO `usuario_permisos` VALUES (1981, 39, 1058, NULL, '2019-07-22 17:10:18', '2019-07-22 17:10:18');
INSERT INTO `usuario_permisos` VALUES (1982, 40, 1058, NULL, '2019-07-22 17:10:18', '2019-07-22 17:10:18');
INSERT INTO `usuario_permisos` VALUES (1984, 42, 1058, NULL, '2019-07-22 17:10:18', '2019-07-22 17:10:18');
INSERT INTO `usuario_permisos` VALUES (1985, 43, 1058, NULL, '2019-07-22 17:10:18', '2019-07-22 17:10:18');
INSERT INTO `usuario_permisos` VALUES (1986, 44, 1058, NULL, '2019-07-22 17:10:18', '2019-07-22 17:10:18');
INSERT INTO `usuario_permisos` VALUES (1987, 45, 1058, NULL, '2019-07-22 17:10:18', '2019-07-22 17:10:18');
INSERT INTO `usuario_permisos` VALUES (1988, 46, 1058, NULL, '2019-07-22 17:10:18', '2019-07-22 17:10:18');
INSERT INTO `usuario_permisos` VALUES (1989, 47, 1058, NULL, '2019-07-22 17:10:18', '2019-07-22 17:10:18');
INSERT INTO `usuario_permisos` VALUES (1990, 48, 1058, NULL, '2019-07-22 17:10:18', '2019-07-22 17:10:18');
INSERT INTO `usuario_permisos` VALUES (1991, 50, 1058, NULL, '2019-07-22 17:10:18', '2019-07-22 17:10:18');
INSERT INTO `usuario_permisos` VALUES (1992, 51, 1058, NULL, '2019-07-22 17:10:18', '2019-07-22 17:10:18');
INSERT INTO `usuario_permisos` VALUES (1993, 52, 1058, NULL, '2019-07-22 17:10:18', '2019-07-22 17:10:18');
INSERT INTO `usuario_permisos` VALUES (1994, 53, 1058, NULL, '2019-07-22 17:10:18', '2019-07-22 17:10:18');
INSERT INTO `usuario_permisos` VALUES (1995, 55, 1058, NULL, '2019-07-22 17:10:18', '2019-07-22 17:10:18');
INSERT INTO `usuario_permisos` VALUES (1996, 56, 1058, NULL, '2019-07-22 17:10:18', '2019-07-22 17:10:18');
INSERT INTO `usuario_permisos` VALUES (1997, 57, 1058, NULL, '2019-07-22 17:10:19', '2019-07-22 17:10:19');
INSERT INTO `usuario_permisos` VALUES (1998, 58, 1058, NULL, '2019-07-22 17:10:19', '2019-07-22 17:10:19');
INSERT INTO `usuario_permisos` VALUES (1999, 59, 1058, NULL, '2019-07-22 17:10:19', '2019-07-22 17:10:19');
INSERT INTO `usuario_permisos` VALUES (2000, 60, 1058, NULL, '2019-07-22 17:10:19', '2019-07-22 17:10:19');
INSERT INTO `usuario_permisos` VALUES (2001, 61, 1058, NULL, '2019-07-22 17:10:19', '2019-07-22 17:10:19');
INSERT INTO `usuario_permisos` VALUES (2002, 62, 1058, NULL, '2019-07-22 17:10:19', '2019-07-22 17:10:19');
INSERT INTO `usuario_permisos` VALUES (2003, 63, 1058, NULL, '2019-07-22 17:10:19', '2019-07-22 17:10:19');
INSERT INTO `usuario_permisos` VALUES (2004, 64, 1058, NULL, '2019-07-22 17:10:19', '2019-07-22 17:10:19');
INSERT INTO `usuario_permisos` VALUES (2005, 65, 1058, NULL, '2019-07-22 17:10:19', '2019-07-22 17:10:19');
INSERT INTO `usuario_permisos` VALUES (2006, 44, 232, NULL, '2019-07-24 17:00:22', '2019-07-24 17:00:22');
INSERT INTO `usuario_permisos` VALUES (2007, 10, 799, NULL, '2019-08-01 14:21:37', '2019-08-01 14:21:37');
INSERT INTO `usuario_permisos` VALUES (2008, 10, 794, NULL, '2019-08-02 12:01:34', '2019-08-02 12:01:34');
INSERT INTO `usuario_permisos` VALUES (2009, 8, 764, NULL, '2019-08-13 13:47:21', '2019-08-13 13:47:21');
INSERT INTO `usuario_permisos` VALUES (2010, 27, 764, NULL, '2019-08-13 13:47:21', '2019-08-13 13:47:21');
INSERT INTO `usuario_permisos` VALUES (2011, 30, 764, NULL, '2019-08-13 13:47:21', '2019-08-13 13:47:21');
INSERT INTO `usuario_permisos` VALUES (2012, 31, 764, NULL, '2019-08-13 13:47:21', '2019-08-13 13:47:21');
INSERT INTO `usuario_permisos` VALUES (2013, 9, 764, NULL, '2019-08-13 13:47:21', '2019-08-13 13:47:21');
INSERT INTO `usuario_permisos` VALUES (2014, 45, 764, NULL, '2019-08-13 13:47:21', '2019-08-13 13:47:21');
INSERT INTO `usuario_permisos` VALUES (2015, 46, 764, NULL, '2019-08-13 13:47:21', '2019-08-13 13:47:21');
INSERT INTO `usuario_permisos` VALUES (2016, 28, 764, NULL, '2019-08-13 13:47:21', '2019-08-13 13:47:21');
INSERT INTO `usuario_permisos` VALUES (2018, 44, 764, NULL, '2019-08-13 13:48:55', '2019-08-13 13:48:55');
INSERT INTO `usuario_permisos` VALUES (2019, 53, 764, NULL, '2019-08-13 13:48:55', '2019-08-13 13:48:55');
INSERT INTO `usuario_permisos` VALUES (2020, 1, 1063, NULL, '2019-08-16 14:22:12', '2019-08-16 14:22:12');
INSERT INTO `usuario_permisos` VALUES (2021, 2, 1063, NULL, '2019-08-16 14:22:12', '2019-08-16 14:22:12');
INSERT INTO `usuario_permisos` VALUES (2022, 3, 1063, NULL, '2019-08-16 14:22:12', '2019-08-16 14:22:12');
INSERT INTO `usuario_permisos` VALUES (2023, 4, 1063, NULL, '2019-08-16 14:22:12', '2019-08-16 14:22:12');
INSERT INTO `usuario_permisos` VALUES (2024, 5, 1063, NULL, '2019-08-16 14:22:12', '2019-08-16 14:22:12');
INSERT INTO `usuario_permisos` VALUES (2025, 6, 1063, NULL, '2019-08-16 14:22:12', '2019-08-16 14:22:12');
INSERT INTO `usuario_permisos` VALUES (2026, 7, 1063, NULL, '2019-08-16 14:22:13', '2019-08-16 14:22:13');
INSERT INTO `usuario_permisos` VALUES (2027, 8, 1063, NULL, '2019-08-16 14:22:13', '2019-08-16 14:22:13');
INSERT INTO `usuario_permisos` VALUES (2028, 9, 1063, NULL, '2019-08-16 14:22:13', '2019-08-16 14:22:13');
INSERT INTO `usuario_permisos` VALUES (2029, 10, 1063, NULL, '2019-08-16 14:22:13', '2019-08-16 14:22:13');
INSERT INTO `usuario_permisos` VALUES (2030, 11, 1063, NULL, '2019-08-16 14:22:13', '2019-08-16 14:22:13');
INSERT INTO `usuario_permisos` VALUES (2031, 12, 1063, NULL, '2019-08-16 14:22:13', '2019-08-16 14:22:13');
INSERT INTO `usuario_permisos` VALUES (2032, 13, 1063, NULL, '2019-08-16 14:22:13', '2019-08-16 14:22:13');
INSERT INTO `usuario_permisos` VALUES (2033, 14, 1063, NULL, '2019-08-16 14:22:13', '2019-08-16 14:22:13');
INSERT INTO `usuario_permisos` VALUES (2034, 15, 1063, NULL, '2019-08-16 14:22:13', '2019-08-16 14:22:13');
INSERT INTO `usuario_permisos` VALUES (2035, 16, 1063, NULL, '2019-08-16 14:22:13', '2019-08-16 14:22:13');
INSERT INTO `usuario_permisos` VALUES (2036, 17, 1063, NULL, '2019-08-16 14:22:13', '2019-08-16 14:22:13');
INSERT INTO `usuario_permisos` VALUES (2037, 18, 1063, NULL, '2019-08-16 14:22:13', '2019-08-16 14:22:13');
INSERT INTO `usuario_permisos` VALUES (2038, 19, 1063, NULL, '2019-08-16 14:22:13', '2019-08-16 14:22:13');
INSERT INTO `usuario_permisos` VALUES (2039, 20, 1063, NULL, '2019-08-16 14:22:13', '2019-08-16 14:22:13');
INSERT INTO `usuario_permisos` VALUES (2040, 21, 1063, NULL, '2019-08-16 14:22:13', '2019-08-16 14:22:13');
INSERT INTO `usuario_permisos` VALUES (2041, 22, 1063, NULL, '2019-08-16 14:22:13', '2019-08-16 14:22:13');
INSERT INTO `usuario_permisos` VALUES (2042, 23, 1063, NULL, '2019-08-16 14:22:13', '2019-08-16 14:22:13');
INSERT INTO `usuario_permisos` VALUES (2043, 24, 1063, NULL, '2019-08-16 14:22:13', '2019-08-16 14:22:13');
INSERT INTO `usuario_permisos` VALUES (2044, 25, 1063, NULL, '2019-08-16 14:22:13', '2019-08-16 14:22:13');
INSERT INTO `usuario_permisos` VALUES (2045, 26, 1063, NULL, '2019-08-16 14:22:13', '2019-08-16 14:22:13');
INSERT INTO `usuario_permisos` VALUES (2046, 27, 1063, NULL, '2019-08-16 14:22:13', '2019-08-16 14:22:13');
INSERT INTO `usuario_permisos` VALUES (2047, 28, 1063, NULL, '2019-08-16 14:22:13', '2019-08-16 14:22:13');
INSERT INTO `usuario_permisos` VALUES (2048, 29, 1063, NULL, '2019-08-16 14:22:13', '2019-08-16 14:22:13');
INSERT INTO `usuario_permisos` VALUES (2049, 30, 1063, NULL, '2019-08-16 14:22:13', '2019-08-16 14:22:13');
INSERT INTO `usuario_permisos` VALUES (2050, 31, 1063, NULL, '2019-08-16 14:22:13', '2019-08-16 14:22:13');
INSERT INTO `usuario_permisos` VALUES (2051, 32, 1063, NULL, '2019-08-16 14:22:13', '2019-08-16 14:22:13');
INSERT INTO `usuario_permisos` VALUES (2052, 33, 1063, NULL, '2019-08-16 14:22:13', '2019-08-16 14:22:13');
INSERT INTO `usuario_permisos` VALUES (2053, 34, 1063, NULL, '2019-08-16 14:22:13', '2019-08-16 14:22:13');
INSERT INTO `usuario_permisos` VALUES (2054, 35, 1063, NULL, '2019-08-16 14:22:13', '2019-08-16 14:22:13');
INSERT INTO `usuario_permisos` VALUES (2055, 36, 1063, NULL, '2019-08-16 14:22:13', '2019-08-16 14:22:13');
INSERT INTO `usuario_permisos` VALUES (2056, 37, 1063, NULL, '2019-08-16 14:22:13', '2019-08-16 14:22:13');
INSERT INTO `usuario_permisos` VALUES (2057, 38, 1063, NULL, '2019-08-16 14:22:13', '2019-08-16 14:22:13');
INSERT INTO `usuario_permisos` VALUES (2058, 39, 1063, NULL, '2019-08-16 14:22:13', '2019-08-16 14:22:13');
INSERT INTO `usuario_permisos` VALUES (2059, 40, 1063, NULL, '2019-08-16 14:22:13', '2019-08-16 14:22:13');
INSERT INTO `usuario_permisos` VALUES (2061, 42, 1063, NULL, '2019-08-16 14:22:13', '2019-08-16 14:22:13');
INSERT INTO `usuario_permisos` VALUES (2062, 43, 1063, NULL, '2019-08-16 14:22:13', '2019-08-16 14:22:13');
INSERT INTO `usuario_permisos` VALUES (2063, 44, 1063, NULL, '2019-08-16 14:22:13', '2019-08-16 14:22:13');
INSERT INTO `usuario_permisos` VALUES (2064, 45, 1063, NULL, '2019-08-16 14:22:13', '2019-08-16 14:22:13');
INSERT INTO `usuario_permisos` VALUES (2065, 46, 1063, NULL, '2019-08-16 14:22:13', '2019-08-16 14:22:13');
INSERT INTO `usuario_permisos` VALUES (2066, 47, 1063, NULL, '2019-08-16 14:22:13', '2019-08-16 14:22:13');
INSERT INTO `usuario_permisos` VALUES (2067, 48, 1063, NULL, '2019-08-16 14:22:13', '2019-08-16 14:22:13');
INSERT INTO `usuario_permisos` VALUES (2068, 50, 1063, NULL, '2019-08-16 14:22:13', '2019-08-16 14:22:13');
INSERT INTO `usuario_permisos` VALUES (2069, 51, 1063, NULL, '2019-08-16 14:22:14', '2019-08-16 14:22:14');
INSERT INTO `usuario_permisos` VALUES (2070, 52, 1063, NULL, '2019-08-16 14:22:14', '2019-08-16 14:22:14');
INSERT INTO `usuario_permisos` VALUES (2071, 53, 1063, NULL, '2019-08-16 14:22:14', '2019-08-16 14:22:14');
INSERT INTO `usuario_permisos` VALUES (2072, 55, 1063, NULL, '2019-08-16 14:22:14', '2019-08-16 14:22:14');
INSERT INTO `usuario_permisos` VALUES (2073, 56, 1063, NULL, '2019-08-16 14:22:14', '2019-08-16 14:22:14');
INSERT INTO `usuario_permisos` VALUES (2074, 57, 1063, NULL, '2019-08-16 14:22:14', '2019-08-16 14:22:14');
INSERT INTO `usuario_permisos` VALUES (2075, 58, 1063, NULL, '2019-08-16 14:22:14', '2019-08-16 14:22:14');
INSERT INTO `usuario_permisos` VALUES (2076, 59, 1063, NULL, '2019-08-16 14:22:14', '2019-08-16 14:22:14');
INSERT INTO `usuario_permisos` VALUES (2077, 60, 1063, NULL, '2019-08-16 14:22:14', '2019-08-16 14:22:14');
INSERT INTO `usuario_permisos` VALUES (2078, 61, 1063, NULL, '2019-08-16 14:22:14', '2019-08-16 14:22:14');
INSERT INTO `usuario_permisos` VALUES (2079, 62, 1063, NULL, '2019-08-16 14:22:14', '2019-08-16 14:22:14');
INSERT INTO `usuario_permisos` VALUES (2080, 63, 1063, NULL, '2019-08-16 14:22:14', '2019-08-16 14:22:14');
INSERT INTO `usuario_permisos` VALUES (2081, 64, 1063, NULL, '2019-08-16 14:22:14', '2019-08-16 14:22:14');
INSERT INTO `usuario_permisos` VALUES (2082, 65, 1063, NULL, '2019-08-16 14:22:14', '2019-08-16 14:22:14');
INSERT INTO `usuario_permisos` VALUES (2087, 8, 802, NULL, '2019-08-20 17:34:29', '2019-08-20 17:34:29');
INSERT INTO `usuario_permisos` VALUES (2088, 27, 802, NULL, '2019-08-20 17:34:29', '2019-08-20 17:34:29');
INSERT INTO `usuario_permisos` VALUES (2089, 30, 802, NULL, '2019-08-20 17:34:29', '2019-08-20 17:34:29');
INSERT INTO `usuario_permisos` VALUES (2090, 31, 802, NULL, '2019-08-20 17:34:29', '2019-08-20 17:34:29');
INSERT INTO `usuario_permisos` VALUES (2091, 9, 802, NULL, '2019-08-20 17:34:29', '2019-08-20 17:34:29');
INSERT INTO `usuario_permisos` VALUES (2092, 45, 802, NULL, '2019-08-20 17:34:29', '2019-08-20 17:34:29');
INSERT INTO `usuario_permisos` VALUES (2093, 46, 802, NULL, '2019-08-20 17:34:29', '2019-08-20 17:34:29');
INSERT INTO `usuario_permisos` VALUES (2094, 28, 802, NULL, '2019-08-20 17:34:29', '2019-08-20 17:34:29');
INSERT INTO `usuario_permisos` VALUES (2095, 19, 802, NULL, '2019-08-20 17:34:29', '2019-08-20 17:34:29');
INSERT INTO `usuario_permisos` VALUES (2097, 27, 1065, NULL, '2019-08-21 10:44:41', '2019-08-21 10:44:41');
INSERT INTO `usuario_permisos` VALUES (2103, 28, 1065, NULL, '2019-08-21 10:44:42', '2019-08-21 10:44:42');
INSERT INTO `usuario_permisos` VALUES (2104, 19, 1065, NULL, '2019-08-21 10:44:42', '2019-08-21 10:44:42');
INSERT INTO `usuario_permisos` VALUES (2139, 8, 1064, NULL, '2019-08-22 11:08:07', '2019-08-22 11:08:07');
INSERT INTO `usuario_permisos` VALUES (2140, 9, 1064, NULL, '2019-08-22 11:08:07', '2019-08-22 11:08:07');
INSERT INTO `usuario_permisos` VALUES (2141, 10, 1064, NULL, '2019-08-22 11:08:08', '2019-08-22 11:08:08');
INSERT INTO `usuario_permisos` VALUES (2142, 16, 1064, NULL, '2019-08-22 11:08:08', '2019-08-22 11:08:08');
INSERT INTO `usuario_permisos` VALUES (2143, 17, 1064, NULL, '2019-08-22 11:08:08', '2019-08-22 11:08:08');
INSERT INTO `usuario_permisos` VALUES (2144, 18, 1064, NULL, '2019-08-22 11:08:08', '2019-08-22 11:08:08');
INSERT INTO `usuario_permisos` VALUES (2145, 19, 1064, NULL, '2019-08-22 11:08:08', '2019-08-22 11:08:08');
INSERT INTO `usuario_permisos` VALUES (2146, 20, 1064, NULL, '2019-08-22 11:08:08', '2019-08-22 11:08:08');
INSERT INTO `usuario_permisos` VALUES (2147, 25, 1064, NULL, '2019-08-22 11:08:08', '2019-08-22 11:08:08');
INSERT INTO `usuario_permisos` VALUES (2148, 26, 1064, NULL, '2019-08-22 11:08:08', '2019-08-22 11:08:08');
INSERT INTO `usuario_permisos` VALUES (2149, 27, 1064, NULL, '2019-08-22 11:08:08', '2019-08-22 11:08:08');
INSERT INTO `usuario_permisos` VALUES (2150, 28, 1064, NULL, '2019-08-22 11:08:08', '2019-08-22 11:08:08');
INSERT INTO `usuario_permisos` VALUES (2151, 29, 1064, NULL, '2019-08-22 11:08:08', '2019-08-22 11:08:08');
INSERT INTO `usuario_permisos` VALUES (2152, 30, 1064, NULL, '2019-08-22 11:08:08', '2019-08-22 11:08:08');
INSERT INTO `usuario_permisos` VALUES (2153, 31, 1064, NULL, '2019-08-22 11:08:08', '2019-08-22 11:08:08');
INSERT INTO `usuario_permisos` VALUES (2154, 32, 1064, NULL, '2019-08-22 11:08:08', '2019-08-22 11:08:08');
INSERT INTO `usuario_permisos` VALUES (2155, 34, 1064, NULL, '2019-08-22 11:08:08', '2019-08-22 11:08:08');
INSERT INTO `usuario_permisos` VALUES (2156, 36, 1064, NULL, '2019-08-22 11:08:08', '2019-08-22 11:08:08');
INSERT INTO `usuario_permisos` VALUES (2157, 37, 1064, NULL, '2019-08-22 11:08:08', '2019-08-22 11:08:08');
INSERT INTO `usuario_permisos` VALUES (2158, 38, 1064, NULL, '2019-08-22 11:08:08', '2019-08-22 11:08:08');
INSERT INTO `usuario_permisos` VALUES (2159, 41, 1064, NULL, '2019-08-22 11:08:08', '2019-08-22 11:08:08');
INSERT INTO `usuario_permisos` VALUES (2160, 42, 1064, NULL, '2019-08-22 11:08:08', '2019-08-22 11:08:08');
INSERT INTO `usuario_permisos` VALUES (2161, 43, 1064, NULL, '2019-08-22 11:08:08', '2019-08-22 11:08:08');
INSERT INTO `usuario_permisos` VALUES (2162, 44, 1064, NULL, '2019-08-22 11:08:09', '2019-08-22 11:08:09');
INSERT INTO `usuario_permisos` VALUES (2163, 45, 1064, NULL, '2019-08-22 11:08:09', '2019-08-22 11:08:09');
INSERT INTO `usuario_permisos` VALUES (2164, 46, 1064, NULL, '2019-08-22 11:08:09', '2019-08-22 11:08:09');
INSERT INTO `usuario_permisos` VALUES (2165, 64, 1064, NULL, '2019-08-22 11:08:09', '2019-08-22 11:08:09');
INSERT INTO `usuario_permisos` VALUES (2166, 66, 750, NULL, '2019-08-22 12:49:16', '2019-08-22 12:49:16');
INSERT INTO `usuario_permisos` VALUES (2167, 66, 448, NULL, '2019-08-22 12:50:29', '2019-08-22 12:50:29');
INSERT INTO `usuario_permisos` VALUES (2168, 66, 517, NULL, '2019-08-22 12:51:01', '2019-08-22 12:51:01');
INSERT INTO `usuario_permisos` VALUES (2169, 66, 719, NULL, '2019-08-22 12:51:15', '2019-08-22 12:51:15');
INSERT INTO `usuario_permisos` VALUES (2170, 66, 518, NULL, '2019-08-22 12:51:31', '2019-08-22 12:51:31');
INSERT INTO `usuario_permisos` VALUES (2171, 66, 1064, NULL, '2019-08-22 12:51:58', '2019-08-22 12:51:58');
INSERT INTO `usuario_permisos` VALUES (2172, 66, 45, NULL, '2019-08-22 12:52:13', '2019-08-22 12:52:13');
INSERT INTO `usuario_permisos` VALUES (2173, 51, 117, NULL, '2019-08-26 11:03:53', '2019-08-26 11:03:53');
INSERT INTO `usuario_permisos` VALUES (2174, 8, 1066, NULL, '2019-08-29 14:55:17', '2019-08-29 14:55:17');
INSERT INTO `usuario_permisos` VALUES (2175, 9, 1066, NULL, '2019-08-29 14:55:17', '2019-08-29 14:55:17');
INSERT INTO `usuario_permisos` VALUES (2176, 10, 1066, NULL, '2019-08-29 14:55:17', '2019-08-29 14:55:17');
INSERT INTO `usuario_permisos` VALUES (2177, 16, 1066, NULL, '2019-08-29 14:55:17', '2019-08-29 14:55:17');
INSERT INTO `usuario_permisos` VALUES (2178, 17, 1066, NULL, '2019-08-29 14:55:17', '2019-08-29 14:55:17');
INSERT INTO `usuario_permisos` VALUES (2179, 18, 1066, NULL, '2019-08-29 14:55:17', '2019-08-29 14:55:17');
INSERT INTO `usuario_permisos` VALUES (2180, 19, 1066, NULL, '2019-08-29 14:55:17', '2019-08-29 14:55:17');
INSERT INTO `usuario_permisos` VALUES (2181, 20, 1066, NULL, '2019-08-29 14:55:17', '2019-08-29 14:55:17');
INSERT INTO `usuario_permisos` VALUES (2182, 25, 1066, NULL, '2019-08-29 14:55:17', '2019-08-29 14:55:17');
INSERT INTO `usuario_permisos` VALUES (2183, 26, 1066, NULL, '2019-08-29 14:55:17', '2019-08-29 14:55:17');
INSERT INTO `usuario_permisos` VALUES (2184, 27, 1066, NULL, '2019-08-29 14:55:17', '2019-08-29 14:55:17');
INSERT INTO `usuario_permisos` VALUES (2185, 28, 1066, NULL, '2019-08-29 14:55:17', '2019-08-29 14:55:17');
INSERT INTO `usuario_permisos` VALUES (2186, 29, 1066, NULL, '2019-08-29 14:55:17', '2019-08-29 14:55:17');
INSERT INTO `usuario_permisos` VALUES (2187, 30, 1066, NULL, '2019-08-29 14:55:17', '2019-08-29 14:55:17');
INSERT INTO `usuario_permisos` VALUES (2188, 31, 1066, NULL, '2019-08-29 14:55:17', '2019-08-29 14:55:17');
INSERT INTO `usuario_permisos` VALUES (2189, 32, 1066, NULL, '2019-08-29 14:55:17', '2019-08-29 14:55:17');
INSERT INTO `usuario_permisos` VALUES (2190, 34, 1066, NULL, '2019-08-29 14:55:17', '2019-08-29 14:55:17');
INSERT INTO `usuario_permisos` VALUES (2191, 36, 1066, NULL, '2019-08-29 14:55:17', '2019-08-29 14:55:17');
INSERT INTO `usuario_permisos` VALUES (2192, 37, 1066, NULL, '2019-08-29 14:55:17', '2019-08-29 14:55:17');
INSERT INTO `usuario_permisos` VALUES (2193, 38, 1066, NULL, '2019-08-29 14:55:18', '2019-08-29 14:55:18');
INSERT INTO `usuario_permisos` VALUES (2194, 41, 1066, NULL, '2019-08-29 14:55:18', '2019-08-29 14:55:18');
INSERT INTO `usuario_permisos` VALUES (2195, 42, 1066, NULL, '2019-08-29 14:55:18', '2019-08-29 14:55:18');
INSERT INTO `usuario_permisos` VALUES (2196, 43, 1066, NULL, '2019-08-29 14:55:18', '2019-08-29 14:55:18');
INSERT INTO `usuario_permisos` VALUES (2197, 44, 1066, NULL, '2019-08-29 14:55:18', '2019-08-29 14:55:18');
INSERT INTO `usuario_permisos` VALUES (2198, 45, 1066, NULL, '2019-08-29 14:55:18', '2019-08-29 14:55:18');
INSERT INTO `usuario_permisos` VALUES (2199, 46, 1066, NULL, '2019-08-29 14:55:18', '2019-08-29 14:55:18');
INSERT INTO `usuario_permisos` VALUES (2200, 64, 1066, NULL, '2019-08-29 14:55:18', '2019-08-29 14:55:18');
INSERT INTO `usuario_permisos` VALUES (2201, 66, 1066, NULL, '2019-08-29 14:55:18', '2019-08-29 14:55:18');
INSERT INTO `usuario_permisos` VALUES (2202, 8, 1067, NULL, '2019-09-02 18:11:13', '2019-09-02 18:11:13');
INSERT INTO `usuario_permisos` VALUES (2203, 27, 1067, NULL, '2019-09-02 18:11:13', '2019-09-02 18:11:13');
INSERT INTO `usuario_permisos` VALUES (2204, 30, 1067, NULL, '2019-09-02 18:11:13', '2019-09-02 18:11:13');
INSERT INTO `usuario_permisos` VALUES (2205, 31, 1067, NULL, '2019-09-02 18:11:13', '2019-09-02 18:11:13');
INSERT INTO `usuario_permisos` VALUES (2206, 9, 1067, NULL, '2019-09-02 18:11:13', '2019-09-02 18:11:13');
INSERT INTO `usuario_permisos` VALUES (2207, 45, 1067, NULL, '2019-09-02 18:11:13', '2019-09-02 18:11:13');
INSERT INTO `usuario_permisos` VALUES (2208, 46, 1067, NULL, '2019-09-02 18:11:13', '2019-09-02 18:11:13');
INSERT INTO `usuario_permisos` VALUES (2209, 28, 1067, NULL, '2019-09-02 18:11:13', '2019-09-02 18:11:13');
INSERT INTO `usuario_permisos` VALUES (2210, 19, 1067, NULL, '2019-09-02 18:11:13', '2019-09-02 18:11:13');
INSERT INTO `usuario_permisos` VALUES (2211, 57, 44, NULL, '2019-09-03 18:11:21', '2019-09-03 18:11:21');
INSERT INTO `usuario_permisos` VALUES (2212, 59, 44, NULL, '2019-09-03 18:11:21', '2019-09-03 18:11:21');
INSERT INTO `usuario_permisos` VALUES (2214, 64, 2, NULL, '2019-09-07 08:49:16', '2019-09-07 08:49:16');
INSERT INTO `usuario_permisos` VALUES (2215, 65, 2, NULL, '2019-09-07 08:49:16', '2019-09-07 08:49:16');
INSERT INTO `usuario_permisos` VALUES (2216, 66, 2, NULL, '2019-09-07 08:49:16', '2019-09-07 08:49:16');
INSERT INTO `usuario_permisos` VALUES (2217, 8, 638, NULL, '2019-09-07 09:05:19', '2019-09-07 09:05:19');
INSERT INTO `usuario_permisos` VALUES (2218, 9, 638, NULL, '2019-09-07 09:05:19', '2019-09-07 09:05:19');
INSERT INTO `usuario_permisos` VALUES (2219, 10, 638, NULL, '2019-09-07 09:05:19', '2019-09-07 09:05:19');
INSERT INTO `usuario_permisos` VALUES (2220, 11, 638, NULL, '2019-09-07 09:05:19', '2019-09-07 09:05:19');
INSERT INTO `usuario_permisos` VALUES (2221, 18, 638, NULL, '2019-09-07 09:05:19', '2019-09-07 09:05:19');
INSERT INTO `usuario_permisos` VALUES (2222, 19, 638, NULL, '2019-09-07 09:05:19', '2019-09-07 09:05:19');
INSERT INTO `usuario_permisos` VALUES (2223, 20, 638, NULL, '2019-09-07 09:05:19', '2019-09-07 09:05:19');
INSERT INTO `usuario_permisos` VALUES (2224, 26, 638, NULL, '2019-09-07 09:05:19', '2019-09-07 09:05:19');
INSERT INTO `usuario_permisos` VALUES (2225, 27, 638, NULL, '2019-09-07 09:05:19', '2019-09-07 09:05:19');
INSERT INTO `usuario_permisos` VALUES (2226, 28, 638, NULL, '2019-09-07 09:05:19', '2019-09-07 09:05:19');
INSERT INTO `usuario_permisos` VALUES (2227, 29, 638, NULL, '2019-09-07 09:05:19', '2019-09-07 09:05:19');
INSERT INTO `usuario_permisos` VALUES (2228, 30, 638, NULL, '2019-09-07 09:05:19', '2019-09-07 09:05:19');
INSERT INTO `usuario_permisos` VALUES (2229, 31, 638, NULL, '2019-09-07 09:05:19', '2019-09-07 09:05:19');
INSERT INTO `usuario_permisos` VALUES (2231, 36, 638, NULL, '2019-09-07 09:05:19', '2019-09-07 09:05:19');
INSERT INTO `usuario_permisos` VALUES (2232, 37, 638, NULL, '2019-09-07 09:05:19', '2019-09-07 09:05:19');
INSERT INTO `usuario_permisos` VALUES (2233, 38, 638, NULL, '2019-09-07 09:05:19', '2019-09-07 09:05:19');
INSERT INTO `usuario_permisos` VALUES (2234, 42, 638, NULL, '2019-09-07 09:05:19', '2019-09-07 09:05:19');
INSERT INTO `usuario_permisos` VALUES (2235, 45, 638, NULL, '2019-09-07 09:05:19', '2019-09-07 09:05:19');
INSERT INTO `usuario_permisos` VALUES (2236, 46, 638, NULL, '2019-09-07 09:05:19', '2019-09-07 09:05:19');
INSERT INTO `usuario_permisos` VALUES (2237, 34, 638, NULL, '2019-09-07 09:05:45', '2019-09-07 09:05:45');
INSERT INTO `usuario_permisos` VALUES (2238, 34, 707, NULL, '2019-09-07 09:20:57', '2019-09-07 09:20:57');
INSERT INTO `usuario_permisos` VALUES (2240, 34, 777, NULL, '2019-09-07 09:35:22', '2019-09-07 09:35:22');
INSERT INTO `usuario_permisos` VALUES (2241, 67, 777, NULL, '2019-09-07 09:39:42', '2019-09-07 09:39:42');
INSERT INTO `usuario_permisos` VALUES (2242, 67, 638, NULL, '2019-09-07 09:41:51', '2019-09-07 09:41:51');
INSERT INTO `usuario_permisos` VALUES (2243, 67, 707, NULL, '2019-09-07 09:42:55', '2019-09-07 09:42:55');
INSERT INTO `usuario_permisos` VALUES (2244, 67, 750, NULL, '2019-09-07 09:48:01', '2019-09-07 09:48:01');
INSERT INTO `usuario_permisos` VALUES (2245, 34, 232, NULL, '2019-09-07 09:51:45', '2019-09-07 09:51:45');
INSERT INTO `usuario_permisos` VALUES (2246, 67, 232, NULL, '2019-09-07 09:51:45', '2019-09-07 09:51:45');

-- ----------------------------
-- Table structure for usuarios
-- ----------------------------
DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios`  (
  `id_usuario` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `apellido` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `usuario` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `perfil` enum('ADMIN','STAFF') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `area` enum('RH','DESARROLLO') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `correo` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `empleado_id` int(11) NULL DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id_usuario`) USING BTREE,
  UNIQUE INDEX `usuarios_usuario_unique`(`usuario`) USING BTREE,
  UNIQUE INDEX `usuarios_password_unique`(`password`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for usuarios_notificaciones
-- ----------------------------
DROP TABLE IF EXISTS `usuarios_notificaciones`;
CREATE TABLE `usuarios_notificaciones`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_usuario` int(10) UNSIGNED NOT NULL,
  `id_notificacion` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`, `id_usuario`, `id_notificacion`) USING BTREE,
  INDEX `usuario`(`id_usuario`) USING BTREE,
  INDEX `notifiacion`(`id_notificacion`) USING BTREE,
  CONSTRAINT `notificacion` FOREIGN KEY (`id_notificacion`) REFERENCES `notificaciones` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of usuarios_notificaciones
-- ----------------------------
INSERT INTO `usuarios_notificaciones` VALUES (1, 750, 11, '2019-05-22 11:22:08', '2019-05-22 11:22:12');

-- ----------------------------
-- Table structure for usuarios_roles
-- ----------------------------
DROP TABLE IF EXISTS `usuarios_roles`;
CREATE TABLE `usuarios_roles`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Rol` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Descripcion` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Created_at` datetime(0) NULL DEFAULT NULL,
  `Update_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of usuarios_roles
-- ----------------------------
INSERT INTO `usuarios_roles` VALUES (1, 'RH', 'Recursos Humanos', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `usuarios_roles` VALUES (2, 'DIR', 'Direccion', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `usuarios_roles` VALUES (3, 'COOR', 'Coordinador', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `usuarios_roles` VALUES (4, 'ENTR', 'Proveedor', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `usuarios_roles` VALUES (5, 'ADMIN', 'ADMINISTRADOR', '2018-01-01 00:00:00', '2018-01-01 00:00:00');
INSERT INTO `usuarios_roles` VALUES (6, 'PM', 'PM', '2018-01-01 00:00:00', '2018-01-01 00:00:00');
INSERT INTO `usuarios_roles` VALUES (7, 'STI', 'Soporte IT', '2018-01-01 00:00:00', '2018-01-01 00:00:00');
INSERT INTO `usuarios_roles` VALUES (8, 'SAUTO', 'Soporte Auto', '2018-12-17 00:00:00', '2018-12-17 00:00:00');
INSERT INTO `usuarios_roles` VALUES (9, 'SCEL', 'Soporte Celular', '2018-12-17 00:00:00', '2018-12-17 00:00:00');
INSERT INTO `usuarios_roles` VALUES (10, 'SALMA', 'Soporte Almacen', '2018-12-17 00:00:00', '2018-12-17 00:00:00');
INSERT INTO `usuarios_roles` VALUES (11, 'ESP', 'Especial', '2019-04-05 08:58:49', '2019-04-05 08:58:54');

-- ----------------------------
-- View structure for vista_ajuste_sueldos
-- ----------------------------
DROP VIEW IF EXISTS `vista_ajuste_sueldos`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vista_ajuste_sueldos` AS select `ajs`.`id` AS `id`,`ajs`.`id_empleado` AS `id_empleado`,`pi`.`id` AS `id_ro`,`pi`.`pedido` AS `pedido`,`pi`.`monto_venta` AS `monto`,`ajs`.`usuario_auth` AS `usuario_auth`,`ajs`.`usuario_cancel` AS `usuario_cancel`,`ajs`.`fecha_validacion` AS `fecha_validacion`,`ajs`.`num_empleado` AS `num_empleado`,concat(`emp`.`empleado_nombre`,' ',`emp`.`empleado_apaterno`,' ',`emp`.`empleado_amaterno`) AS `nombre`,`ajs`.`tradicional` AS `tradicional`,`ajs`.`asimilado` AS `asimilado`,ifnull(`ajs`.`estatus`,'NO') AS `estatus`,`ajs`.`observaciones` AS `observaciones`,`ajs`.`created_at` AS `fecha`,`ajs`.`url` AS `url`,`ajs`.`fecha_inicio` AS `fecha_inicio` from ((`rh`.`ajustes_sueldos` `ajs` join `incore`.`empleados` `emp` on(`emp`.`empleado_id` = `ajs`.`id_empleado`)) left join `incore`.`proyectos_indeplo` `pi` on(`pi`.`id` = `ajs`.`ro`));

-- ----------------------------
-- View structure for vista_bitacora_general
-- ----------------------------
DROP VIEW IF EXISTS `vista_bitacora_general`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vista_bitacora_general` AS (select `bi`.`id` AS `CLAVE`,`bi`.`tipo` AS `TIPO`,`bi`.`id_tabla` AS `REGISTRO`,`us`.`nombre` AS `USUARIO`,concat_ws(' ',`em`.`empleado_nombre`,`em`.`empleado_apaterno`,`em`.`empleado_amaterno`) AS `EMPLEADO`,`bi`.`mensaje` AS `DETALLES`,`bi`.`fecha` AS `FECHA`,`bi`.`hora` AS `HORA`,`bi`.`status` AS `ESTADO` from ((`rh`.`bitacoras` `bi` left join `incore`.`usuarios` `us` on(`us`.`id_usuario` = `bi`.`id_usuario_login`)) left join `rh`.`empleados` `em` on(`em`.`id` = `bi`.`id_empleado`)));

-- ----------------------------
-- View structure for vista_citas
-- ----------------------------
DROP VIEW IF EXISTS `vista_citas`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vista_citas` AS (select `sa`.`id` AS `id`,concat_ws('-',`sa`.`cliente`,`sa`.`servicio`,`sa`.`region`,`sa`.`tecnologia`,`sa`.`grupo`) AS `WBS`,concat_ws(' ',`sa`.`nombre`,`sa`.`apaterno`,`sa`.`amaterno`) AS `Nombre`,concat_ws(' ',`co`.`nombre`,`co`.`apellido`) AS `coordinador`,concat_ws(' x ',`sla`.`auth_entregables`,`usentre`.`nombre`) AS `Auth_entregables`,concat_ws(' x ',`sla`.`auth_direccion`,`usdir`.`nombre`) AS `Auth_direccion`,concat_ws(' x ',`sla`.`auth_rh`,`usrh`.`nombre`) AS `Auth_RH`,`sa`.`fecha_cita` AS `fecha_cita`,`sa`.`hora_cita` AS `hora_cita`,`sa`.`detalles_cita` AS `detalles_cita`,`sa`.`status_cita` AS `status_cita`,`sa`.`correo_cita` AS `correo_cita` from (((((`rh`.`solicitud_alta` `sa` left join `rh`.`catalogo_coordinadores` `co` on(`co`.`id` = `sa`.`coordinador_id`)) left join `rh`.`solicitudes_altas_auth` `sla` on(`sla`.`id_solicitud` = `sa`.`id`)) left join `incore`.`usuarios` `usrh` on(`usrh`.`id_usuario` = `sla`.`id_user_rh`)) left join `incore`.`usuarios` `usdir` on(`usdir`.`id_usuario` = `sla`.`id_dir_user`)) left join `incore`.`usuarios` `usentre` on(`usentre`.`id_usuario` = `sla`.`entregables_user_id`)) where `sa`.`status_cita` is not null group by `sa`.`id`);

-- ----------------------------
-- View structure for vista_citas_firma
-- ----------------------------
DROP VIEW IF EXISTS `vista_citas_firma`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vista_citas_firma` AS select `sa`.`id` AS `id`,concat_ws('-',`sa`.`cliente`,`sa`.`servicio`,`sa`.`region`,`sa`.`tecnologia`,`sa`.`grupo`) AS `WBS`,concat_ws(' ',`sa`.`nombre`,`sa`.`apaterno`,`sa`.`amaterno`) AS `Nombre`,concat_ws(' ',`co`.`nombre`,`co`.`apellido`) AS `coordinador`,`sa`.`coordinador_id` AS `coordinador_id`,concat_ws(' x ',`sla`.`auth_entregables`,`usentre`.`nombre`) AS `Auth_entregables`,concat_ws(' x ',`sla`.`auth_direccion`,`usdir`.`nombre`) AS `Auth_direccion`,concat_ws(' x ',`sla`.`auth_rh`,`usrh`.`nombre`) AS `Auth_RH`,`sa`.`fecha_cita` AS `fecha_cita`,`sa`.`hora_cita` AS `hora_cita`,`sa`.`detalles_cita` AS `detalles_cita`,`sa`.`status_cita` AS `status_cita`,`sa`.`correo_cita` AS `correo_cita`,`sa`.`cliente` AS `cliente` from (((((`rh`.`solicitud_alta` `sa` left join `rh`.`catalogo_coordinadores` `co` on(`co`.`id` = `sa`.`coordinador_id`)) left join `rh`.`solicitudes_altas_auth` `sla` on(`sla`.`id_solicitud` = `sa`.`id`)) left join `incore`.`usuarios` `usrh` on(`usrh`.`id_usuario` = `sla`.`id_user_rh`)) left join `incore`.`usuarios` `usdir` on(`usdir`.`id_usuario` = `sla`.`id_dir_user`)) left join `incore`.`usuarios` `usentre` on(`usentre`.`id_usuario` = `sla`.`entregables_user_id`)) where `sa`.`status_cita` is not null or `sa`.`status_cita` = '' group by `sa`.`id`;

-- ----------------------------
-- View structure for vista_codigos
-- ----------------------------
DROP VIEW IF EXISTS `vista_codigos`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vista_codigos` AS (select `rh`.`catalogo_codigos`.`id` AS `id`,`rh`.`catalogo_codigos`.`codigo` AS `codigo`,`rh`.`catalogo_codigos`.`concepto` AS `concepto`,`rh`.`catalogo_codigos`.`precio` AS `precio`,`rh`.`catalogo_codigos`.`costo` AS `costo`,`rh`.`catalogo_codigos`.`incluye` AS `incluye`,`rh`.`catalogo_codigos`.`tipo` AS `tipo`,`rh`.`catalogo_codigos`.`diario` AS `diario`,`rh`.`catalogo_codigos`.`pd` AS `pd`,`rh`.`catalogo_codigos`.`diario_gasolina` AS `diario_gasolina`,`rh`.`catalogo_codigos`.`monto_viatico` AS `monto_viatico`,`rh`.`catalogo_codigos`.`incluye_viaticos` AS `incluye_viaticos`,`rh`.`catalogo_codigos`.`incluye_equipo` AS `incluye_equipo`,`rh`.`catalogo_codigos`.`descripcion` AS `descripcion`,`rh`.`catalogo_codigos`.`horas` AS `horas`,`rh`.`catalogo_codigos`.`caduca` AS `caduca` from `catalogo_codigos`);

-- ----------------------------
-- View structure for vista_coordinadores
-- ----------------------------
DROP VIEW IF EXISTS `vista_coordinadores`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vista_coordinadores` AS select `rh`.`catalogo_coordinadores`.`id` AS `id`,`rh`.`catalogo_coordinadores`.`nombre` AS `nombre`,`rh`.`catalogo_coordinadores`.`apellido` AS `apellido`,`rh`.`catalogo_coordinadores`.`correo` AS `correo`,`rh`.`catalogo_coordinadores`.`user_id` AS `user_id`,`rh`.`catalogo_coordinadores`.`estatus` AS `estatus`,`rh`.`catalogo_coordinadores`.`user_log` AS `user_log` from `catalogo_coordinadores` order by `rh`.`catalogo_coordinadores`.`nombre`;

-- ----------------------------
-- View structure for vista_empleados
-- ----------------------------
DROP VIEW IF EXISTS `vista_empleados`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vista_empleados` AS (select `em`.`download_info` AS `descarga`,`em`.`id` AS `id`,`em`.`empleado_num` AS `empleado_num`,`em`.`empleado_alcatel_id` AS `empleado_alcatel_id`,`em`.`empleado_nombre` AS `empleado_nombre`,`em`.`empleado_apaterno` AS `empleado_apaterno`,`em`.`empleado_amaterno` AS `empleado_amaterno`,`em`.`calle` AS `calle`,`em`.`num_exterior` AS `num_exterior`,`em`.`num_interior` AS `num_interior`,`em`.`colonia` AS `colonia`,`em`.`municipio` AS `municipio`,`em`.`cp` AS `cp`,`em`.`estado` AS `estado`,`em`.`nss` AS `nss`,`em`.`curp` AS `curp`,`em`.`rfc` AS `rfc`,`em`.`mail` AS `mail`,`em`.`telefono2` AS `telefono2`,`em`.`telefono` AS `telefono`,`em`.`mail_indeplo` AS `mail_indeplo`,`em`.`empleado_domicilio` AS `empleado_domicilio`,`em`.`empresa` AS `empresa`,`em`.`empleado_grupo` AS `empleado_grupo`,`em`.`segmento` AS `segmento`,`em`.`empleado_po` AS `empleado_po`,`em`.`diario_nomina` AS `diario_nomina`,`em`.`empleado_estatus` AS `empleado_estatus`,`em`.`empleado_fecha_alta` AS `empleado_fecha_alta`,`em`.`empleado_fecha_baja` AS `empleado_fecha_baja`,`em`.`empleado_observaciones` AS `empleado_observaciones`,`em`.`viaticos_dia` AS `viaticos_dia`,`em`.`baja_rh` AS `baja_rh`,`em`.`empleado_update` AS `empleado_update`,`em`.`viable` AS `viable`,`em`.`motivo` AS `motivo`,`em`.`bloqueo_viaticos` AS `bloqueo_viaticos`,`em`.`motivo_bloqueo` AS `motivo_bloqueo`,`em`.`contratista` AS `contratista`,`em`.`tipo_contrato` AS `tipo_contrato`,`em`.`updated_at` AS `updated_at`,`em`.`fecha_ingreso` AS `fecha_ingreso`,`em`.`localidad` AS `localidad`,`em`.`proveedor` AS `proveedor`,`em`.`razon_social` AS `razon_social`,`em`.`esquema_viaticos` AS `esquema_viaticos`,`em`.`num_monex` AS `num_monex`,`em`.`no_cuenta` AS `no_cuenta`,`em`.`clave_cuenta` AS `clave_cuenta`,`em`.`banco` AS `banco`,`em`.`id_solicitud` AS `id_solicitud`,`em`.`created_at` AS `created_at`,(select if(`auth`.`computadora` = 'OK','ASIGNADA',(select if(concat_ws('',(select if(`sa`.`computadora` <> 0,'SI','NO')),(select if(`sa`.`software` <> 0,'SI','NO'))) <> 'NONO','SOLICITADA','NO SOLICITADA')))) AS `opc_computadora`,(select if(`auth`.`coche` = 'OK','ASIGNADA',(select if((select if(`sa`.`auto` <> 0,'SI','NO') <> 'NO'),'SOLICITADA','NO SOLICITADA')))) AS `opc_auto`,(select if(`auth`.`celular` = 'OK','ASIGNADA',(select if(concat_ws('',(select if(`sa`.`celular` <> 0,'SI','NO')),(select if(`sa`.`plan_linea` <> 27,'SI','NO')),(select if(`sa`.`plan_linea_bam` <> 27,'SI','NO'))) <> 'NONONO','SOLICITADA','NO SOLICITADA')))) AS `opc_celular`,(select if(`auth`.`herramientas_almacen` = 'OK','ASIGNADA',(select if(concat_ws('',(select if(`sa`.`playera` <> 0,'SI','NO')),(select if(`sa`.`botas` <> 0,'SI','NO'))) <> 'NONO','SOLICITADA','NO SOLICITADA')))) AS `opc_herramientas` from ((`empleados` `em` join `solicitud_alta` `sa` on(`sa`.`id` = `em`.`id_solicitud`)) join `solicitudes_altas_auth` `auth` on(`auth`.`id_solicitud` = `sa`.`id`)));

-- ----------------------------
-- View structure for vista_empleados_activos
-- ----------------------------
DROP VIEW IF EXISTS `vista_empleados_activos`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vista_empleados_activos` AS select `em`.`empleado_id` AS `id`,`em`.`empleado_num` AS `empleado_num`,`em`.`empleado_alcatel_id` AS `empleado_alcatel_id`,`em`.`empleado_nombre` AS `empleado_nombre`,`em`.`empleado_apaterno` AS `empleado_apaterno`,`em`.`empleado_amaterno` AS `empleado_amaterno`,concat(`em`.`empleado_nombre`,' ',`em`.`empleado_apaterno`,' ',`em`.`empleado_amaterno`) AS `nombre_completo`,`em`.`calle` AS `calle`,`em`.`num_exterior` AS `num_exterior`,`em`.`num_interior` AS `num_interior`,`em`.`colonia` AS `colonia`,`em`.`municipio` AS `municipio`,`em`.`cp` AS `cp`,`em`.`estado` AS `estado`,`em`.`nss` AS `nss`,`em`.`curp` AS `curp`,`em`.`rfc` AS `rfc`,`em`.`mail` AS `mail`,`em`.`telefono2` AS `telefono2`,`em`.`telefono` AS `telefono`,`em`.`mail_indeplo` AS `mail_indeplo`,`em`.`empleado_domicilio` AS `empleado_domicilio`,`em`.`empresa` AS `empresa`,`em`.`empleado_grupo` AS `empleado_grupo`,`em`.`segmento` AS `segmento`,`em`.`empleado_po` AS `empleado_po`,`em`.`diario_nomina` AS `diario_nomina`,`em`.`empleado_estatus` AS `empleado_estatus`,`em`.`empleado_fecha_alta` AS `empleado_fecha_alta`,`em`.`empleado_fecha_baja` AS `empleado_fecha_baja`,`em`.`empleado_observaciones` AS `empleado_observaciones`,`em`.`viaticos_dia` AS `viaticos_dia`,`em`.`baja_rh` AS `baja_rh`,`em`.`empleado_update` AS `empleado_update`,`em`.`viable` AS `viable`,`em`.`motivo` AS `motivo`,`em`.`bloqueo_viaticos` AS `bloqueo_viaticos`,`em`.`motivo_bloqueo` AS `motivo_bloqueo`,`em`.`contratista` AS `contratista`,`em`.`tipo_contrato` AS `tipo_contrato`,`em`.`updated_at` AS `updated_at`,`em`.`empleado_fecha_alta` AS `fecha_ingreso`,`em`.`id_solicitud` AS `id_solicitud`,`em`.`created_at` AS `created_at`,`mr`.`id` AS `movimiento_recurso_id`,`mr`.`viaticos` AS `viaticos`,`mr`.`razon_rh` AS `razon`,`mr`.`nomina` AS `nomina`,`mr`.`esquema` AS `esquema`,`mr`.`monex` AS `monex`,`mr`.`num_cuenta` AS `num_cuenta`,`mr`.`clabe` AS `clabe`,`mr`.`banco` AS `banco`,`mr`.`localidad` AS `localidad`,`mr`.`esquema_viaticos` AS `esquema_viaticos`,`mpr`.`id` AS `movimiento_proyecto_id`,`mpr`.`cliente` AS `cliente`,`mpr`.`servicio` AS `servicio`,`mpr`.`region` AS `region`,`mpr`.`tecnologia` AS `tecnologia`,`mpr`.`grupo` AS `grupo`,concat_ws('-',`mpr`.`cliente`,`mpr`.`servicio`,`mpr`.`region`,`mpr`.`tecnologia`,`mpr`.`grupo`) AS `proyecto`,concat_ws('-',`mpr`.`cliente`,`mpr`.`servicio`) AS `pd`,`mpr`.`tipo_proyecto` AS `tipo_proyecto`,`mc`.`id` AS `movimiento_coordinador_id`,`mc`.`coordinador_id` AS `coordinador_id`,`mc`.`nombre` AS `coordinador`,`ms`.`id` AS `movimiento_sueldo_id`,`ms`.`sueldo_imss` AS `sueldo_imss`,`ms`.`sueldo_alternativo` AS `sueldo_alternativo`,`ms`.`sueldo_asimilado` AS `sueldo_asimilado`,`ms`.`sueldo_imss_bruto` AS `sueldo_imss_bruto`,`ms`.`sueldo_alternativo_bruto` AS `sueldo_alternativo_bruto`,`ms`.`sueldo_imss` + `ms`.`sueldo_asimilado` AS `sueldo_mensual_neto`,`ms`.`sueldo_mensual` AS `sueldo_neto`,`mpu`.`id` AS `movimiento_puesto_id`,`mpu`.`puesto` AS `id_puesto`,`mpu`.`nombre_puesto` AS `puesto`,`crc`.`id` AS `id_razon_capital`,`crc`.`descripcion` AS `descripcion_razon` from (((((((`incore`.`empleados` `em` join `incore`.`movimientos_recurso` `mr` on(`mr`.`id` = (select `incore`.`movimientos_recurso`.`id` from `incore`.`movimientos_recurso` where `incore`.`movimientos_recurso`.`empleado_id` = `em`.`empleado_id` order by `incore`.`movimientos_recurso`.`id` desc limit 0,1))) left join `incore`.`movimientos_proyectos` `mpr` on(`mpr`.`id` = (select `incore`.`movimientos_proyectos`.`id` from `incore`.`movimientos_proyectos` where `incore`.`movimientos_proyectos`.`empleado_id` = `em`.`empleado_id` order by `incore`.`movimientos_proyectos`.`id` desc limit 0,1))) left join (select `m_c`.`id` AS `id`,`m_c`.`coordinador_id` AS `coordinador_id`,`m_c`.`empleado_id` AS `empleado_id`,`m_c`.`fecha_inicio` AS `fecha_inicio`,`m_c`.`fecha_fin` AS `fecha_fin`,`m_c`.`user_log` AS `user_log`,`m_c`.`fecha_log` AS `fecha_log`,`m_c`.`caduca` AS `caduca`,`cc`.`nombre` AS `nombre` from (`incore`.`movimientos_coordinador` `m_c` join `incore`.`catalogo_coordinadores` `cc` on(`cc`.`id` = `m_c`.`coordinador_id`))) `mc` on(`mc`.`id` = (select `incore`.`movimientos_coordinador`.`id` from `incore`.`movimientos_coordinador` where `incore`.`movimientos_coordinador`.`empleado_id` = `em`.`empleado_id` order by `incore`.`movimientos_coordinador`.`id` desc limit 0,1))) left join `incore`.`movimientos_sueldo` `ms` on(`ms`.`id` = (select `incore`.`movimientos_sueldo`.`id` from `incore`.`movimientos_sueldo` where `incore`.`movimientos_sueldo`.`empleado_id` = `em`.`empleado_id` order by `incore`.`movimientos_sueldo`.`id` desc limit 0,1))) left join (select `m_p`.`id` AS `id`,`m_p`.`empleado_id` AS `empleado_id`,`m_p`.`puesto` AS `puesto`,`m_p`.`fecha_inicio` AS `fecha_inicio`,`m_p`.`fecha_fin` AS `fecha_fin`,`m_p`.`user_log` AS `user_log`,`m_p`.`fecha_log` AS `fecha_log`,`m_p`.`observaciones` AS `observaciones`,`c_p`.`nombre_puesto` AS `nombre_puesto` from (`incore`.`movimientos_puestos` `m_p` join `incore`.`catalogo_puesto` `c_p` on(`m_p`.`puesto` = `c_p`.`id`))) `mpu` on(`mpu`.`id` = (select `incore`.`movimientos_puestos`.`id` from `incore`.`movimientos_puestos` where `incore`.`movimientos_puestos`.`empleado_id` = `em`.`empleado_id` order by `incore`.`movimientos_puestos`.`id` desc limit 0,1))) left join `incore`.`catalogo_razonrh` `crr` on(`crr`.`razon_id` = `mr`.`razon_rh`)) left join `incore`.`catalogo_razon_capital` `crc` on(`crc`.`id` = `crr`.`id_razon_capital`)) where `em`.`empleado_estatus` = 'ACTIVO' and `em`.`baja_rh` is null;

-- ----------------------------
-- View structure for vista_empleados_baja
-- ----------------------------
DROP VIEW IF EXISTS `vista_empleados_baja`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vista_empleados_baja` AS (select `empleados`.`id` AS `id`,`empleados`.`empleado_nombre` AS `empleado_nombre`,`empleados`.`empleado_apaterno` AS `empleado_apaterno`,`empleados`.`empleado_amaterno` AS `empleado_amaterno`,`empleados`.`calle` AS `calle`,`empleados`.`num_exterior` AS `num_exterior`,`empleados`.`num_interior` AS `num_interior`,`empleados`.`colonia` AS `colonia`,`empleados`.`municipio` AS `municipio`,`empleados`.`cp` AS `cp`,`empleados`.`estado` AS `estado`,`empleados`.`nss` AS `nss`,`empleados`.`curp` AS `curp`,`empleados`.`rfc` AS `rfc`,`empleados`.`id_solicitud` AS `id_solicitud` from `empleados` where `empleados`.`empleado_estatus` = 'BAJA');

-- ----------------------------
-- View structure for vista_empleados_excel
-- ----------------------------
DROP VIEW IF EXISTS `vista_empleados_excel`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vista_empleados_excel` AS (select `incore`.`empleados`.`empleado_id` AS `id`,`incore`.`empleados`.`created_at` AS `fecha`,`incore`.`empleados`.`empresa` AS `empresa`,`incore`.`empleados`.`empleado_apaterno` AS `empleado_apaterno`,`incore`.`empleados`.`empleado_amaterno` AS `empleado_amaterno`,`incore`.`empleados`.`empleado_nombre` AS `empleado_nombre`,`incore`.`empleados`.`municipio` AS `municipio`,`incore`.`empleados`.`curp` AS `curp`,`incore`.`empleados`.`rfc` AS `rfc`,`incore`.`empleados`.`calle` AS `calle`,`incore`.`empleados`.`num_exterior` AS `num_exterior`,`incore`.`empleados`.`num_interior` AS `num_interior`,`incore`.`empleados`.`cp` AS `cp`,`incore`.`empleados`.`colonia` AS `colonia`,`incore`.`empleados`.`municipio` AS `mun`,`incore`.`empleados`.`estado` AS `estado`,`incore`.`empleados`.`telefono` AS `telefono`,`incore`.`empleados`.`telefono2` AS `telefono2`,`incore`.`empleados`.`mail` AS `mail`,`incore`.`empleados`.`nss` AS `nss`,`incore`.`empleados`.`empleado_fecha_alta` AS `fecha_ingreso`,NULL AS `zona`,`incore`.`empleados`.`tipo_contrato` AS `tipo_contrato`,`sa`.`puesto` AS `puesto`,`incore`.`empleados`.`area` AS `area` from (`incore`.`empleados` left join `rh`.`solicitud_alta` `sa` on(`sa`.`id` = `incore`.`empleados`.`id_solicitud`)));

-- ----------------------------
-- View structure for vista_empleados_nomina
-- ----------------------------
DROP VIEW IF EXISTS `vista_empleados_nomina`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vista_empleados_nomina` AS select `crc`.`id` AS `id`,`crc`.`descripcion` AS `descripcion`,`rn`.`num_empleado` AS `num_empleado`,`emp`.`empleado_id` AS `empleado_id`,`emp`.`empleado_num` AS `empleado_num`,`emp`.`empleado_alcatel_id` AS `empleado_alcatel_id`,`emp`.`empleado_nombre` AS `empleado_nombre`,`emp`.`empleado_apaterno` AS `empleado_apaterno`,`emp`.`empleado_amaterno` AS `empleado_amaterno`,`emp`.`calle` AS `calle`,`emp`.`num_exterior` AS `num_exterior`,`emp`.`num_interior` AS `num_interior`,`emp`.`colonia` AS `colonia`,`emp`.`municipio` AS `municipio`,`emp`.`cp` AS `cp`,`emp`.`estado` AS `estado`,`emp`.`nss` AS `nss`,`emp`.`curp` AS `curp`,`emp`.`rfc` AS `rfc`,`emp`.`mail` AS `mail`,`emp`.`telefono2` AS `telefono2`,`emp`.`telefono` AS `telefono`,`emp`.`mail_indeplo` AS `mail_indeplo`,`emp`.`empleado_domicilio` AS `empleado_domicilio`,`emp`.`empresa` AS `empresa`,`emp`.`empleado_grupo` AS `empleado_grupo`,`emp`.`segmento` AS `segmento`,`emp`.`empleado_po` AS `empleado_po`,`emp`.`diario_nomina` AS `diario_nomina`,`emp`.`empleado_estatus` AS `empleado_estatus`,`emp`.`empleado_fecha_alta` AS `empleado_fecha_alta`,`emp`.`empleado_fecha_baja` AS `empleado_fecha_baja`,`emp`.`empleado_observaciones` AS `empleado_observaciones`,`emp`.`viaticos_dia` AS `viaticos_dia`,`emp`.`baja_rh` AS `baja_rh`,`emp`.`empleado_update` AS `empleado_update`,`emp`.`viable` AS `viable`,`emp`.`motivo` AS `motivo`,`emp`.`bloqueo_viaticos` AS `bloqueo_viaticos`,`emp`.`motivo_bloqueo` AS `motivo_bloqueo`,`emp`.`contratista` AS `contratista`,`emp`.`tipo_contrato` AS `tipo_contrato`,`emp`.`created_at` AS `created_at`,`emp`.`updated_at` AS `updated_at`,`emp`.`area` AS `area`,`emp`.`id_solicitud` AS `id_solicitud`,`emp`.`actualizado` AS `actualizado` from ((((`incore`.`empleados` `emp` left join `incore`.`recursos_nomina` `rn` on(`emp`.`empleado_id` = `rn`.`empleado_id`)) join `incore`.`movimientos_recurso` `mr` on(`mr`.`empleado_id` = `emp`.`empleado_id`)) join `incore`.`catalogo_razonrh` `crh` on(`crh`.`razon_id` = `mr`.`razon_rh`)) join `incore`.`catalogo_razon_capital` `crc` on(`crh`.`id_razon_capital` = `crc`.`id`)) where `emp`.`empleado_fecha_baja` is null and `rn`.`num_empleado` <> 0 and `mr`.`fecha_baja` is null group by `emp`.`empleado_id` order by `emp`.`empleado_id`;

-- ----------------------------
-- View structure for vista_empleado_capital
-- ----------------------------
DROP VIEW IF EXISTS `vista_empleado_capital`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vista_empleado_capital` AS select `crc`.`id` AS `id`,`crc`.`descripcion` AS `descripcion`,`emp`.`empleado_id` AS `empleado_id`,`emp`.`empleado_num` AS `empleado_num`,`emp`.`empleado_alcatel_id` AS `empleado_alcatel_id`,`emp`.`empleado_nombre` AS `empleado_nombre`,`emp`.`empleado_apaterno` AS `empleado_apaterno`,`emp`.`empleado_amaterno` AS `empleado_amaterno`,`emp`.`calle` AS `calle`,`emp`.`num_exterior` AS `num_exterior`,`emp`.`num_interior` AS `num_interior`,`emp`.`colonia` AS `colonia`,`emp`.`municipio` AS `municipio`,`emp`.`cp` AS `cp`,`emp`.`estado` AS `estado`,`emp`.`nss` AS `nss`,`emp`.`curp` AS `curp`,`emp`.`rfc` AS `rfc`,`emp`.`mail` AS `mail`,`emp`.`telefono2` AS `telefono2`,`emp`.`telefono` AS `telefono`,`emp`.`mail_indeplo` AS `mail_indeplo`,`emp`.`empleado_domicilio` AS `empleado_domicilio`,`emp`.`empresa` AS `empresa`,`emp`.`empleado_grupo` AS `empleado_grupo`,`emp`.`segmento` AS `segmento`,`emp`.`empleado_po` AS `empleado_po`,`emp`.`diario_nomina` AS `diario_nomina`,`emp`.`empleado_estatus` AS `empleado_estatus`,`emp`.`empleado_fecha_alta` AS `empleado_fecha_alta`,`emp`.`empleado_fecha_baja` AS `empleado_fecha_baja`,`emp`.`empleado_observaciones` AS `empleado_observaciones`,`emp`.`viaticos_dia` AS `viaticos_dia`,`emp`.`baja_rh` AS `baja_rh`,`emp`.`empleado_update` AS `empleado_update`,`emp`.`viable` AS `viable`,`emp`.`motivo` AS `motivo`,`emp`.`bloqueo_viaticos` AS `bloqueo_viaticos`,`emp`.`motivo_bloqueo` AS `motivo_bloqueo`,`emp`.`contratista` AS `contratista`,`emp`.`tipo_contrato` AS `tipo_contrato`,`emp`.`created_at` AS `created_at`,`emp`.`updated_at` AS `updated_at`,`emp`.`area` AS `area`,`emp`.`id_solicitud` AS `id_solicitud`,`emp`.`actualizado` AS `actualizado` from (((`incore`.`empleados` `emp` join `incore`.`movimientos_recurso` `mr` on(`mr`.`empleado_id` = `emp`.`empleado_id`)) join `incore`.`catalogo_razonrh` `crh` on(`mr`.`razon_rh` = `crh`.`razon_id`)) join `incore`.`catalogo_razon_capital` `crc` on(`crh`.`id_razon_capital` = `crc`.`id`)) where `emp`.`empleado_fecha_baja` is null and `emp`.`curp` is not null and `mr`.`fecha_baja` is null order by `emp`.`empleado_id`;

-- ----------------------------
-- View structure for vista_herramienta_empleado
-- ----------------------------
DROP VIEW IF EXISTS `vista_herramienta_empleado`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vista_herramienta_empleado` AS select concat_ws(' ',`tp`.`nombre`,`ar`.`caracteristicas`) AS `articulo`,`hr`.`no_parte_indeplo` AS `no_parte_indeplo`,sum((case `fd`.`id_tipo_documento` when 6 then 1 when 4 then -1 end) * `hr`.`cantidad`) AS `stock`,group_concat(`hr`.`folio` separator ',') AS `folios`,`ef`.`empleado_id` AS `empleado_id` from ((((`incore`.`herramienta` `hr` join `incore`.`empleado_folio` `ef` on(`hr`.`folio` = `ef`.`folio`)) join `incore`.`folio_documento` `fd` on(`hr`.`folio` = `fd`.`folio`)) join `incore`.`articulos` `ar` on(`hr`.`grupo` = `ar`.`grupo` and `hr`.`tipo` = `ar`.`tipo` and `hr`.`consecutivo` = `ar`.`consecutivo`)) join `incore`.`articulos_tipo` `tp` on(`hr`.`grupo` = `tp`.`id_articulos_grupo` and `hr`.`tipo` = `tp`.`id`)) where `hr`.`grupo` <> 6 and `hr`.`tipo` <> 6 group by `ef`.`empleado_id`,`hr`.`grupo`,`hr`.`tipo`,`hr`.`consecutivo` having `stock` > 0;

-- ----------------------------
-- View structure for vista_incidencias
-- ----------------------------
DROP VIEW IF EXISTS `vista_incidencias`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vista_incidencias` AS (select `i`.`id` AS `id`,`crc`.`capital_id` AS `capital_id`,`crc`.`descripcion` AS `descripcion_razon`,`e_asign`.`empleado_id` AS `id_empleado`,concat_ws(' ',`e_asign`.`empleado_nombre`,`e_asign`.`empleado_apaterno`,`e_asign`.`empleado_amaterno`) AS `empleado`,`e_asign`.`empleado_num` AS `emp_id`,`pi`.`proyecto_nombre` AS `proyecto`,`pi`.`pedido` AS `pedido`,ifnull(`pi`.`costo_viaticos`,0) AS `costo_viaticos`,ifnull(`pi`.`costo_nomina`,0) AS `costo_nomina`,ifnull(`pi`.`costo_herramienta`,0) AS `costo_herramienta`,ifnull(`pi`.`monto_venta`,0) AS `venta`,`cat`.`alias` AS `incidencia`,`cat`.`tipo` AS `tipo_incidencia`,`cat`.`tratamiento` AS `tratamiento`,`i`.`fecha_solicitud` AS `fecha_solicitud`,`i`.`fecha_inicio` AS `fecha_inicio`,`i`.`fecha_fin` AS `fecha_fin`,`i`.`dias` AS `duracion`,`i`.`monto` AS `monto`,`i`.`motivo` AS `motivo`,concat(`u1`.`nombre`,' ',`u1`.`apellido`) AS `solicitante`,`u1`.`id_usuario` AS `id_solicitante`,`i`.`id_rh_auth` AS `id_rh_auth`,`i`.`auth_rh` AS `Autorizado_RH`,concat(`urh`.`nombre`,' ',`urh`.`apellido`) AS `usuario_rh`,`i`.`id_direccion_auth` AS `id_direccion_auth`,`i`.`auth_direccion` AS `Autorizado_DIR`,concat(`udir`.`nombre`,' ',`udir`.`apellido`) AS `usuario_dir`,`i`.`id_gerente_auth` AS `id_gerente_auth`,`i`.`auth_gerente` AS `Autorizado_Gerente`,concat(`uger`.`nombre`,' ',`uger`.`apellido`) AS `usuario_ger`,`i`.`id_auth_venta` AS `id_auth_venta`,`i`.`auth_venta` AS `auth_venta`,concat(`uven`.`nombre`,' ',`uven`.`apellido`) AS `usuario_ven`,`i`.`id_lote` AS `id_lote`,`i`.`download_info` AS `descargado`,`i`.`status_auth` AS `estatus`,`i`.`area_cancelar` AS `cancelado`,`i`.`id_incidencia_tipo` AS `id_tipo`,`i`.`area_solicitante` AS `area_solicitante`,`i`.`vobo` AS `vobo`,`i`.`vobo_final` AS `vobo_final`,`i`.`evidencia` AS `evidencia`,`mc`.`coordinador_id` AS `coordinador_id`,`ip`.`id` AS `id_periodo`,`ip`.`periodo_nombre` AS `periodo_nombre`,`mp`.`id` AS `id_proyecto_recurso`,`mp`.`cliente` AS `cliente_recurso`,`mp`.`servicio` AS `servicio_recurso`,concat(`mp`.`cliente`,'-',`mp`.`servicio`) AS `pd_recurso` from ((((((((((((`rh`.`incidencias` `i` join `rh`.`incidencias_catalogo` `cat` on(`cat`.`id` = `i`.`id_incidencia_tipo`)) left join `incore`.`empleados` `e_asign` on(`e_asign`.`empleado_id` = `i`.`id_empleado`)) left join `incore`.`usuarios` `u1` on(`u1`.`id_usuario` = `i`.`id_solicitante`)) left join (select `m_c`.`id` AS `id`,`m_c`.`coordinador_id` AS `coordinador_id`,`m_c`.`empleado_id` AS `empleado_id`,`m_c`.`fecha_inicio` AS `fecha_inicio`,`m_c`.`fecha_fin` AS `fecha_fin`,`m_c`.`user_log` AS `user_log`,`m_c`.`fecha_log` AS `fecha_log`,`m_c`.`caduca` AS `caduca`,`cc`.`nombre` AS `nombre` from (`incore`.`movimientos_coordinador` `m_c` join `incore`.`catalogo_coordinadores` `cc` on(`cc`.`id` = `m_c`.`coordinador_id`))) `mc` on(`mc`.`id` = (select `incore`.`movimientos_coordinador`.`id` from `incore`.`movimientos_coordinador` where `incore`.`movimientos_coordinador`.`empleado_id` = `e_asign`.`empleado_id` order by `incore`.`movimientos_coordinador`.`id` desc limit 0,1))) left join `incore`.`proyectos_indeplo` `pi` on(`pi`.`id` = `i`.`id_proyecto`)) left join (select `emp`.`empleado_id` AS `empleado_id`,`emp`.`empleado_nombre` AS `empleado_nombre`,`emp`.`empleado_apaterno` AS `empleado_apaterno`,`crp`.`id` AS `capital_id`,`crh`.`razon_nombre` AS `razon_nombre`,`crp`.`descripcion` AS `descripcion` from (((`incore`.`empleados` `emp` join `incore`.`movimientos_recurso` `mr` on(`emp`.`empleado_id` = `mr`.`empleado_id`)) join `incore`.`catalogo_razonrh` `crh` on(`crh`.`razon_id` = `mr`.`razon_rh`)) join `rh`.`catalogo_razon_capital` `crp` on(`crh`.`id_razon_capital` = `crp`.`id`)) where `emp`.`empleado_fecha_baja` is null and `mr`.`fecha_baja` is null order by `emp`.`empleado_id`) `crc` on(`crc`.`empleado_id` = `i`.`id_empleado`)) left join `rh`.`incidencias_periodos` `ip` on(`i`.`id_periodo` = `ip`.`id`)) left join `incore`.`usuarios` `urh` on(`urh`.`id_usuario` = `i`.`id_rh_auth`)) left join `incore`.`usuarios` `udir` on(`udir`.`id_usuario` = `i`.`id_direccion_auth`)) left join `incore`.`usuarios` `uger` on(`uger`.`id_usuario` = `i`.`id_gerente_auth`)) left join `incore`.`usuarios` `uven` on(`uven`.`id_usuario` = `i`.`id_auth_venta`)) left join `incore`.`movimientos_proyectos` `mp` on(`mp`.`id` = (select `incore`.`movimientos_proyectos`.`id` from `incore`.`movimientos_proyectos` where `incore`.`movimientos_proyectos`.`empleado_id` = `e_asign`.`empleado_id` order by `incore`.`movimientos_proyectos`.`id` desc limit 0,1))) group by `i`.`id` order by `i`.`id`);

-- ----------------------------
-- View structure for vista_incidencias_lote
-- ----------------------------
DROP VIEW IF EXISTS `vista_incidencias_lote`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vista_incidencias_lote` AS (select `i`.`id` AS `id`,`e_asign`.`empleado_id` AS `id_empleado`,concat_ws(' ',`e_asign`.`empleado_nombre`,`e_asign`.`empleado_apaterno`,`e_asign`.`empleado_amaterno`) AS `empleado`,`cat`.`nombre` AS `tipo_incidencia`,`i`.`fecha_solicitud` AS `fecha_solicitud`,`i`.`fecha_inicio` AS `fecha_inicio`,`i`.`fecha_fin` AS `fecha_fin`,`i`.`dias` AS `duracion`,`i`.`monto` AS `monto`,`i`.`motivo` AS `motivo`,`u1`.`nombre` AS `solicitante`,`i`.`auth_rh` AS `Autorizado_RH`,`i`.`auth_direccion` AS `Autorizado_DIR`,`i`.`auth_gerente` AS `Autorizado_Gerente`,`i`.`id_lote` AS `id_lote`,`i`.`download_info` AS `descargado` from (((`rh`.`incidencias` `i` join `rh`.`incidencias_catalogo` `cat` on(`cat`.`id` = `i`.`id_incidencia_tipo`)) left join `incore`.`empleados` `e_asign` on(`e_asign`.`empleado_id` = `i`.`id_empleado`)) left join `incore`.`usuarios` `u1` on(`u1`.`id_usuario` = `i`.`id_solicitante`)) where `i`.`download_info` = 0 and `i`.`id_lote` is not null);

-- ----------------------------
-- View structure for vista_incidencias_periodo
-- ----------------------------
DROP VIEW IF EXISTS `vista_incidencias_periodo`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vista_incidencias_periodo` AS (select `i`.`id` AS `id`,`crc`.`capital_id` AS `capital_id`,concat_ws(' ',`e_asign`.`empleado_nombre`,`e_asign`.`empleado_apaterno`,`e_asign`.`empleado_amaterno`) AS `empleado`,`e_asign`.`empleado_num` AS `emp_id`,`cat`.`nombre` AS `incidencia`,`cat`.`tipo` AS `tipo_incidencia`,`cat`.`tratamiento` AS `tratamiento`,`i`.`fecha_solicitud` AS `fecha_solicitud`,`i`.`fecha_inicio` AS `fecha_inicio`,`i`.`fecha_fin` AS `fecha_fin`,`i`.`dias` AS `duracion`,`i`.`monto` AS `monto`,`i`.`motivo` AS `motivo`,`u1`.`nombre` AS `solicitante`,`u1`.`id_usuario` AS `id_solicitante`,`i`.`auth_rh` AS `Autorizado_RH`,`i`.`auth_direccion` AS `Autorizado_DIR`,`i`.`auth_gerente` AS `Autorizado_Capital`,`i`.`id_lote` AS `id_lote`,`i`.`download_info` AS `descargado`,`i`.`status_auth` AS `estatus`,`i`.`area_cancelar` AS `cancelado`,`i`.`id_incidencia_tipo` AS `id_tipo`,`i`.`area_solicitante` AS `area_solicitante`,`i`.`vobo` AS `vobo`,`i`.`vobo_final` AS `vobo_final`,`i`.`id_auth_venta` AS `id_auth_venta`,`i`.`auth_venta` AS `auth_venta`,`mc`.`coordinador_id` AS `coordinador_id` from ((((((`rh`.`incidencias` `i` join `rh`.`incidencias_catalogo` `cat` on(`cat`.`id` = `i`.`id_incidencia_tipo`)) left join `incore`.`empleados` `e_asign` on(`e_asign`.`empleado_id` = `i`.`id_empleado`)) left join `incore`.`usuarios` `u1` on(`u1`.`id_usuario` = `i`.`id_solicitante`)) left join (select `m_c`.`id` AS `id`,`m_c`.`coordinador_id` AS `coordinador_id`,`m_c`.`empleado_id` AS `empleado_id`,`m_c`.`fecha_inicio` AS `fecha_inicio`,`m_c`.`fecha_fin` AS `fecha_fin`,`m_c`.`user_log` AS `user_log`,`m_c`.`fecha_log` AS `fecha_log`,`m_c`.`caduca` AS `caduca`,`cc`.`nombre` AS `nombre` from (`incore`.`movimientos_coordinador` `m_c` join `incore`.`catalogo_coordinadores` `cc` on(`cc`.`id` = `m_c`.`coordinador_id`))) `mc` on(`mc`.`id` = (select `incore`.`movimientos_coordinador`.`id` from `incore`.`movimientos_coordinador` where `incore`.`movimientos_coordinador`.`empleado_id` = `e_asign`.`empleado_id` order by `incore`.`movimientos_coordinador`.`id` desc limit 0,1))) left join (select `emp`.`empleado_id` AS `empleado_id`,`emp`.`empleado_nombre` AS `empleado_nombre`,`emp`.`empleado_apaterno` AS `empleado_apaterno`,`crp`.`id` AS `capital_id`,`crh`.`razon_nombre` AS `razon_nombre` from (((`incore`.`empleados` `emp` join `incore`.`movimientos_recurso` `mr` on(`emp`.`empleado_id` = `mr`.`empleado_id`)) join `incore`.`catalogo_razonrh` `crh` on(`crh`.`razon_id` = `mr`.`razon_rh`)) join `rh`.`catalogo_razon_capital` `crp` on(`crh`.`id_razon_capital` = `crp`.`id`)) where `emp`.`empleado_fecha_baja` is null and `mr`.`fecha_baja` is null order by `emp`.`empleado_id`) `crc` on(`crc`.`empleado_id` = `i`.`id_empleado`)) join `rh`.`incidencias_periodos` `ip` on(`i`.`fecha_solicitud` between `ip`.`fecha_inicio` and `ip`.`fecha_envio` and curdate() between `ip`.`fecha_inicio` and `ip`.`fecha_envio`)) where `i`.`status_auth` = 'POR ENVIAR' and `crc`.`capital_id` is not null group by `i`.`id` order by `i`.`id`);

-- ----------------------------
-- View structure for vista_incidencias_sin_lote
-- ----------------------------
DROP VIEW IF EXISTS `vista_incidencias_sin_lote`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vista_incidencias_sin_lote` AS (select `i`.`id` AS `id`,`crc`.`capital_id` AS `capital_id`,`crc`.`descripcion` AS `descripcion_razon`,`e_asign`.`empleado_id` AS `id_empleado`,concat_ws(' ',`e_asign`.`empleado_nombre`,`e_asign`.`empleado_apaterno`,`e_asign`.`empleado_amaterno`) AS `empleado`,`e_asign`.`empleado_num` AS `emp_id`,`pi`.`proyecto_nombre` AS `proyecto`,`pi`.`pedido` AS `pedido`,ifnull(`pi`.`monto_venta`,0) AS `venta`,`cat`.`alias` AS `incidencia`,`cat`.`tipo` AS `tipo_incidencia`,`cat`.`tratamiento` AS `tratamiento`,`i`.`fecha_solicitud` AS `fecha_solicitud`,`i`.`fecha_inicio` AS `fecha_inicio`,`i`.`fecha_fin` AS `fecha_fin`,`i`.`dias` AS `duracion`,`i`.`monto` AS `monto`,`i`.`motivo` AS `motivo`,concat(`u1`.`nombre`,' ',`u1`.`apellido`) AS `solicitante`,`u1`.`id_usuario` AS `id_solicitante`,`i`.`auth_rh` AS `Autorizado_RH`,`i`.`auth_direccion` AS `Autorizado_DIR`,`i`.`auth_capital` AS `Autorizado_Capital`,`i`.`id_lote` AS `id_lote`,`i`.`download_info` AS `descargado`,`i`.`status_auth` AS `estatus`,`i`.`area_cancelar` AS `cancelado`,`i`.`id_incidencia_tipo` AS `id_tipo`,`i`.`area_solicitante` AS `area_solicitante`,`i`.`vobo` AS `vobo`,`i`.`vobo_final` AS `vobo_final`,`i`.`id_auth_venta` AS `id_auth_venta`,`i`.`auth_venta` AS `auth_venta`,`i`.`evidencia` AS `evidencia`,`mc`.`coordinador_id` AS `coordinador_id`,`ip`.`id` AS `id_periodo`,`ip`.`periodo_nombre` AS `periodo_nombre` from (((((((`rh`.`incidencias` `i` join `rh`.`incidencias_catalogo` `cat` on(`cat`.`id` = `i`.`id_incidencia_tipo`)) left join `incore`.`empleados` `e_asign` on(`e_asign`.`empleado_id` = `i`.`id_empleado`)) left join `incore`.`usuarios` `u1` on(`u1`.`id_usuario` = `i`.`id_solicitante`)) left join (select `m_c`.`id` AS `id`,`m_c`.`coordinador_id` AS `coordinador_id`,`m_c`.`empleado_id` AS `empleado_id`,`m_c`.`fecha_inicio` AS `fecha_inicio`,`m_c`.`fecha_fin` AS `fecha_fin`,`m_c`.`user_log` AS `user_log`,`m_c`.`fecha_log` AS `fecha_log`,`m_c`.`caduca` AS `caduca`,`cc`.`nombre` AS `nombre` from (`incore`.`movimientos_coordinador` `m_c` join `incore`.`catalogo_coordinadores` `cc` on(`cc`.`id` = `m_c`.`coordinador_id`))) `mc` on(`mc`.`id` = (select `incore`.`movimientos_coordinador`.`id` from `incore`.`movimientos_coordinador` where `incore`.`movimientos_coordinador`.`empleado_id` = `e_asign`.`empleado_id` order by `incore`.`movimientos_coordinador`.`id` desc limit 0,1))) left join `incore`.`proyectos_indeplo` `pi` on(`pi`.`id` = `i`.`id_proyecto`)) left join (select `emp`.`empleado_id` AS `empleado_id`,`emp`.`empleado_nombre` AS `empleado_nombre`,`emp`.`empleado_apaterno` AS `empleado_apaterno`,`crp`.`id` AS `capital_id`,`crh`.`razon_nombre` AS `razon_nombre`,`crp`.`descripcion` AS `descripcion` from (((`incore`.`empleados` `emp` join `incore`.`movimientos_recurso` `mr` on(`emp`.`empleado_id` = `mr`.`empleado_id`)) join `incore`.`catalogo_razonrh` `crh` on(`crh`.`razon_id` = `mr`.`razon_rh`)) join `rh`.`catalogo_razon_capital` `crp` on(`crh`.`id_razon_capital` = `crp`.`id`)) where `emp`.`empleado_fecha_baja` is null and `mr`.`fecha_baja` is null order by `emp`.`empleado_id`) `crc` on(`crc`.`empleado_id` = `i`.`id_empleado`)) left join `rh`.`incidencias_periodos` `ip` on(`i`.`id_periodo` = `ip`.`id`)) group by `i`.`id` order by `i`.`id`);

-- ----------------------------
-- View structure for vista_permisos_empleados
-- ----------------------------
DROP VIEW IF EXISTS `vista_permisos_empleados`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vista_permisos_empleados` AS select `pe`.`id` AS `id_permiso`,`up`.`id_usuario` AS `id_usuario`,`us`.`nombre` AS `name`,`pe`.`codigo` AS `codigo`,`pe`.`nombre` AS `nombre`,`us`.`correo` AS `email`,`ur`.`Rol` AS `area` from (((`rh`.`usuario_permisos` `up` join `incore`.`usuarios` `us` on(`us`.`id_usuario` = `up`.`id_usuario`)) join `rh`.`usuarios_roles` `ur` on(`ur`.`id` = `us`.`id_area`)) join `rh`.`permisos` `pe` on(`up`.`id_permiso` = `pe`.`id`));

-- ----------------------------
-- View structure for vista_solicitudes
-- ----------------------------
DROP VIEW IF EXISTS `vista_solicitudes`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vista_solicitudes` AS (select `sa`.`id` AS `id`,`sa`.`descargado` AS `descargado`,concat_ws('-',`sa`.`cliente`,`sa`.`servicio`,`sa`.`region`,`sa`.`tecnologia`,`sa`.`grupo`) AS `WBS`,concat_ws(' ',`sa`.`nombre`,`sa`.`apaterno`,`sa`.`amaterno`) AS `Nombre`,`sa`.`created_at` AS `fecha_solicitud`,`sa`.`created_at` AS `fecha creacion de solicitud`,concat_ws(' ',`co`.`nombre`,`co`.`apellido`) AS `coordinador`,'coordinadornokia' AS `coordinadornokia`,`sa`.`pm` AS `pm`,'solicitante definir' AS `solicitante definir`,`sa`.`sueldo_imss` AS `imss`,`sa`.`sueldo_variable` AS `variable`,'asimilado' AS `asimilado`,`sa`.`costo` AS `costo`,`sa`.`venta` AS `venta`,'0' AS `margen`,if(concat_ws(' x ',`sla`.`auth_entregables`,`usentre`.`nombre`) <> '',concat_ws(' x ',`sla`.`auth_entregables`,`usentre`.`nombre`),'x') AS `Auth entregables`,if(concat_ws(' x ',`sla`.`auth_direccion`,`usdir`.`nombre`) <> '',concat_ws(' x ',`sla`.`auth_direccion`,`usdir`.`nombre`),'x') AS `Auth direccion`,if(concat_ws(' x ',`sla`.`auth_rh`,`usrh`.`nombre`) <> '',concat_ws(' x ',`sla`.`auth_rh`,`usrh`.`nombre`),'x') AS `Auth RH`,`sla`.`contrato_firmado` AS `Contrato firmado`,`sla`.`alta` AS `alta`,`sla`.`computadora` AS `computadoras`,(select if(`sla`.`computadora` = 'OK','ASIGNADA',(select if(concat_ws('',(select if(`sa`.`computadora` <> 0,'SI','NO')),(select if(`sa`.`software` <> 0,'SI','NO'))) <> 'NONO','SOLICITADO','NO SOLICITADO')))) AS `Computadora`,(select if(`sla`.`coche` = 'OK','ASIGNADA',(select if((select if(`sa`.`auto` <> 0,'SI','NO') <> 'NO'),'SOLICITADO','NO SOLICITADO')))) AS `Coche`,(select if(`sla`.`celular` = 'OK','ASIGNADA',(select if(concat_ws('',(select if(`sa`.`celular` <> 0,'SI','NO')),(select if(`sa`.`plan_linea` <> 27,'SI','NO')),(select if(`sa`.`plan_linea_bam` <> 27,'SI','NO'))) <> 'NONONO','SOLICITADO','NO SOLICITADO')))) AS `Celular`,(select if(`sla`.`herramientas_almacen` = 'OK','ASIGNADA',(select if(concat_ws('',(select if(`sa`.`playera` <> 0,'SI','NO')),(select if(`sa`.`botas` <> 0,'SI','NO'))) <> 'NONO','SOLICITADO','NO SOLICITADO')))) AS `Herramientas`,`usr`.`nombre` AS `Solicitante`,`sla`.`listo_cita` AS `cita`,NULL AS `deleted_at` from ((((((`rh`.`solicitud_alta` `sa` left join `rh`.`catalogo_coordinadores` `co` on(`co`.`id` = `sa`.`coordinador_id`)) left join `rh`.`solicitudes_altas_auth` `sla` on(`sla`.`id_solicitud` = `sa`.`id`)) left join `incore`.`usuarios` `usrh` on(`usrh`.`id_usuario` = `sla`.`id_user_rh`)) left join `incore`.`usuarios` `usdir` on(`usdir`.`id_usuario` = `sla`.`id_dir_user`)) left join `incore`.`usuarios` `usentre` on(`usentre`.`id_usuario` = `sla`.`entregables_user_id`)) left join `incore`.`usuarios` `usr` on(`usr`.`id_usuario` = `sa`.`solicitante`)));

-- ----------------------------
-- View structure for vista_solicitudes_alta
-- ----------------------------
DROP VIEW IF EXISTS `vista_solicitudes_alta`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vista_solicitudes_alta` AS select `sa`.`id` AS `id`,`sa`.`descargado` AS `descargado`,concat_ws('-',`sa`.`cliente`,`sa`.`servicio`,`sa`.`region`,`sa`.`tecnologia`,`sa`.`grupo`) AS `WBS`,concat_ws(' ',`sa`.`nombre`,`sa`.`apaterno`,`sa`.`amaterno`) AS `Nombre`,`sa`.`fecha_inicio` AS `fecha solicitud`,`sa`.`created_at` AS `fecha creacion de solicitud`,`co`.`id` AS `coordinador_id`,concat_ws(' ',`co`.`nombre`,`co`.`apellido`) AS `coordinador`,'coordinadornokia' AS `coordinadornokia`,`sa`.`pm` AS `pm`,`sa`.`sueldo_imss` AS `imss`,`sa`.`sueldo_variable` AS `variable`,`sa`.`costo` AS `costo`,`sa`.`status_cita` AS `status_cita`,`sa`.`venta` AS `venta`,`sa`.`margen` AS `margen`,concat('Riesgo',' ',`sa`.`riesgo`) AS `riesgo`,concat(`sa`.`temporalidad_contrato`,' ','Meses') AS `temporalidad_contrato`,concat(`sa`.`fecha_cita`,' ',`sa`.`hora_cita`) AS `fecha_cita`,if(concat_ws(' x ',`sla`.`auth_entregables`,`usentre`.`nombre`) <> '',concat_ws(' x ',`sla`.`auth_entregables`,`usentre`.`nombre`),'x') AS `Auth entregables`,if(concat_ws(' x ',`sla`.`auth_direccion`,`usdir`.`nombre`) <> '',concat_ws(' x ',`sla`.`auth_direccion`,`usdir`.`nombre`),'x') AS `Auth direccion`,if(concat_ws(' x ',`sla`.`auth_rh`,`usrh`.`nombre`) <> '',concat_ws(' x ',`sla`.`auth_rh`,`usrh`.`nombre`),'x') AS `Auth RH`,`sla`.`contrato_firmado` AS `Contrato firmado`,`sla`.`alta` AS `alta`,(select if(`sla`.`computadora` = 'OK','ASIGNADA',(select if(concat_ws('',(select if(`sa`.`computadora` <> 0,'SI','NO')),(select if(`sa`.`software` <> 0,'SI','NO'))) <> 'NONO','SOLICITADO','NO SOLICITADO')))) AS `Computadora`,(select if(`sla`.`coche` = 'OK','ASIGNADA',(select if((select if(`sa`.`auto` <> 0,'SI','NO') <> 'NO'),'SOLICITADO','NO SOLICITADO')))) AS `Coche`,(select if(`sla`.`celular` = 'OK','ASIGNADA',(select if(concat_ws('',(select if(`sa`.`celular` <> 0,'SI','NO')),(select if(`sa`.`plan_linea` <> 27,'SI','NO')),(select if(`sa`.`plan_linea_bam` <> 27,'SI','NO'))) <> 'NONONO','SOLICITADO','NO SOLICITADO')))) AS `Celular`,(select if(`sla`.`herramientas_almacen` = 'OK','ASIGNADA',(select if(concat_ws('',(select if(`sa`.`playera` <> 0,'SI','NO')),(select if(`sa`.`botas` <> 0,'SI','NO'))) <> 'NONO','SOLICITADO','NO SOLICITADO')))) AS `Herramientas`,`usr`.`id_usuario` AS `id_solicitante`,concat(`usr`.`nombre`,' ',`usr`.`apellido`) AS `Solicitante`,`sla`.`listo_cita` AS `cita`,`sla`.`computadora` AS `computadora_check`,`sla`.`celular` AS `celular_check`,`sla`.`coche` AS `coche_check`,`sla`.`herramientas_almacen` AS `herramientas_check`,`sa`.`cotizacion_url` AS `cotizacion_url`,`sa`.`caso_negocio_url` AS `caso_negocio_url`,`sa`.`vobo_url` AS `vobo_url`,`sa`.`curriculum_url` AS `curriculum_url`,`sa`.`cliente` AS `cliente`,`sa`.`servicio` AS `servicio`,`sa`.`region` AS `region`,`sa`.`tecnologia` AS `tecnologia`,`sa`.`grupo` AS `grupo`,`sa`.`motivo` AS `motivo`,`sa`.`puesto` AS `id_puesto`,`cp`.`nombre_puesto` AS `puesto`,`sa`.`lugar_trabajo` AS `lugar_trabajo`,`sa`.`usuario_rechazar` AS `id_rechazo` from (((((((`rh`.`solicitud_alta` `sa` left join `incore`.`catalogo_coordinadores` `co` on(`co`.`id` = `sa`.`coordinador_id`)) left join `rh`.`solicitudes_altas_auth` `sla` on(`sla`.`id_solicitud` = `sa`.`id`)) left join `incore`.`usuarios` `usrh` on(`usrh`.`id_usuario` = `sla`.`id_user_rh`)) left join `incore`.`usuarios` `usdir` on(`usdir`.`id_usuario` = `sla`.`id_dir_user`)) left join `incore`.`usuarios` `usentre` on(`usentre`.`id_usuario` = `sla`.`entregables_user_id`)) left join `incore`.`usuarios` `usr` on(`usr`.`id_usuario` = `sa`.`solicitante`)) left join `incore`.`catalogo_puesto` `cp` on(`sa`.`puesto` = `cp`.`id`)) group by `sa`.`id`;

-- ----------------------------
-- View structure for vista_solicitudes_baja_nom
-- ----------------------------
DROP VIEW IF EXISTS `vista_solicitudes_baja_nom`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vista_solicitudes_baja_nom` AS select `sbn`.`id` AS `id`,`emp`.`empleado_id` AS `empleado_id`,concat(`emp`.`empleado_nombre`,' ',`emp`.`empleado_apaterno`,' ',`emp`.`empleado_amaterno`) AS `Recurso`,concat(`mpr`.`cliente`,' ',`mpr`.`servicio`,' ',`mpr`.`region`,' ',`mpr`.`tecnologia`,' ',`mpr`.`grupo`) AS `WBS`,concat(`mpr`.`cliente`,'-',`mpr`.`servicio`) AS `pd`,`mc`.`nombre` AS `coordinador`,`mc`.`coordinador_id` AS `coordinador_id`,'' AS `coordinador nokia`,concat(`us`.`nombre`,' ',`us`.`apellido`) AS `solicitante`,`sbn`.`conocimiento_baja` AS `conocimiento_baja`,`sbn`.`motivo` AS `motivo`,`sbn`.`observaciones` AS `observaciones_solicitante`,`sbn`.`fecha_emision` AS `fecha_emision`,`sbn`.`fecha_baja_sol` AS `fecha_baja_sol`,`sbn`.`fecha_baja_nom` AS `fecha_baja_nom`,`sbn`.`fecha_cita` AS `fecha_cita`,`sbn`.`obs_cita` AS `observaciones_cita`,`sbn`.`adeudo_compu` AS `deuda_compu`,`sbn`.`adeudo_cel` AS `deuda_cel`,`sbn`.`adeudo_auto` AS `deuda_auto`,`sbn`.`adeudo_alma` AS `deuda_alma`,`sbn`.`adeudo_cred` AS `deuda_cred`,if(`sbn`.`baja_computo` = 'true' or `as_comp`.`asign_id` is null and `as_acc`.`asign_id` is null,'OK','NO') AS `baja_computo`,if(`sbn`.`baja_auto` = 'true' or `as_auto`.`asign_id` is null,'OK','NO') AS `baja_auto`,if(`sbn`.`baja_celular` = 'true' or `as_cel`.`asign_id` is null and `as_lin`.`asign_id` is null,'OK','NO') AS `baja_celular`,if(`sbn`.`baja_almacen` = 'true' or `vhe`.`articulo` is null,'OK','NO') AS `baja_almacen`,if(`sbn`.`baja_credencial` = 'true','OK','NO') AS `baja_credencial`,if(`sbn`.`pago_finiquito` = 'true','OK','NO') AS `pago_finiquito`,if(`sbn`.`baja_definitiva` is null,'PENDIENTE','COMPLETADO') AS `baja_definitiva`,`sbn`.`adeudos` AS `adeudos`,`sbn`.`tiempo_herra` AS `tiempo_retraso_her`,`sbn`.`vobo_jefe` AS `vobo`,if(`as_comp`.`asign_id` is not null,'SI','NO') AS `adeudo_compu`,if(`as_acc`.`asign_id` is not null,'SI','NO') AS `adeudo_accesorios`,if(`as_cel`.`asign_id` is not null,'SI','NO') AS `adeudo_celular`,if(`as_lin`.`asign_id` is not null,'SI','NO') AS `adeudo_lin`,if(`as_auto`.`asign_id` is not null,'SI','NO') AS `adeudo_auto`,if(`vhe`.`articulo` is not null,'SI','NO') AS `adeudo_herra`,`sbn`.`obs_compu` AS `obs_compu`,`sbn`.`obs_cel` AS `obs_cel`,`sbn`.`obs_auto` AS `obs_auto`,`sbn`.`obs_alma` AS `obs_alma`,`sbn`.`obs_cred` AS `obs_cred` from (((((((((((`rh`.`solicitudes_baja_nomina` `sbn` join `incore`.`empleados` `emp` on(`emp`.`empleado_id` = `sbn`.`id_empleado`)) left join `incore`.`movimientos_proyectos` `mpr` on(`mpr`.`id` = (select `incore`.`movimientos_proyectos`.`id` from `incore`.`movimientos_proyectos` where `incore`.`movimientos_proyectos`.`empleado_id` = `emp`.`empleado_id` order by `incore`.`movimientos_proyectos`.`id` desc limit 0,1))) left join (select `m_c`.`id` AS `id`,`m_c`.`coordinador_id` AS `coordinador_id`,`cc`.`nombre` AS `nombre` from (`incore`.`movimientos_coordinador` `m_c` join `incore`.`catalogo_coordinadores` `cc` on(`cc`.`id` = `m_c`.`coordinador_id`))) `mc` on(`mc`.`id` = (select `incore`.`movimientos_coordinador`.`id` from `incore`.`movimientos_coordinador` where `incore`.`movimientos_coordinador`.`empleado_id` = `emp`.`empleado_id` order by `incore`.`movimientos_coordinador`.`id` desc limit 0,1))) join `incore`.`usuarios` `us` on(`us`.`id_usuario` = `sbn`.`solicitante`)) left join `rh`.`solicitud_alta` `sa` on(`sa`.`id_empleado` = (select `rh`.`solicitud_alta`.`id_empleado` from `rh`.`solicitud_alta` where `rh`.`solicitud_alta`.`id_empleado` = `emp`.`empleado_id` order by `rh`.`solicitud_alta`.`id` desc limit 0,1))) left join `incore`.`asignaciones_computo` `as_comp` on(`as_comp`.`asign_empleado_id` = (select `incore`.`empleados`.`empleado_id` from (((`incore`.`asignaciones_computo` join `incore`.`computo` on(`incore`.`computo`.`equipo_id` = `incore`.`asignaciones_computo`.`asign_tool_id`)) join `incore`.`empleados` on(`incore`.`asignaciones_computo`.`asign_empleado_id` = `incore`.`empleados`.`empleado_id`)) left join `incore`.`baja_computo` on(`incore`.`baja_computo`.`baja_asign_id` = `incore`.`asignaciones_computo`.`asign_id`)) where `incore`.`asignaciones_computo`.`asign_empleado_id` = `emp`.`empleado_id` and `incore`.`baja_computo`.`baja_fecha` is null order by `incore`.`baja_computo`.`baja_asign_id` limit 0,1))) left join `incore`.`asignaciones_accesorios` `as_acc` on(`as_acc`.`asign_empleado_id` = (select `ac`.`asign_empleado_id` AS `empleado_id` from (`incore`.`asignaciones_accesorios` `ac` left join `incore`.`baja_accesorios` `bc` on(`bc`.`baja_asign_id` = `ac`.`asign_id`)) where `ac`.`asign_empleado_id` = `emp`.`empleado_id` and `bc`.`baja_id` is null limit 0,1))) left join `incore`.`asignaciones_celulares` `as_cel` on(`as_cel`.`asign_empleado_id` = (select `incore`.`asignaciones_celulares`.`asign_empleado_id` from (`incore`.`asignaciones_celulares` left join `incore`.`baja_celular` on(`incore`.`baja_celular`.`baja_asign_id` = `incore`.`asignaciones_celulares`.`asign_id`)) where `incore`.`baja_celular`.`baja_fecha` is null and `incore`.`asignaciones_celulares`.`asign_empleado_id` = `emp`.`empleado_id` limit 0,1))) left join `incore`.`asignaciones_lineas` `as_lin` on(`as_lin`.`asign_empleado_id` = (select `incore`.`asignaciones_lineas`.`asign_empleado_id` from (`incore`.`asignaciones_lineas` left join `incore`.`baja_linea` on(`incore`.`baja_linea`.`baja_asign_id` = `incore`.`asignaciones_lineas`.`asign_id`)) where `incore`.`baja_linea`.`baja_fecha` is null and `incore`.`asignaciones_lineas`.`asign_empleado_id` = `emp`.`empleado_id` limit 0,1))) left join `incore`.`asignaciones_autos` `as_auto` on(`as_auto`.`asign_empleado_id` = (select `incore`.`asignaciones_autos`.`asign_empleado_id` from (`incore`.`asignaciones_autos` left join `incore`.`baja_auto` on(`incore`.`baja_auto`.`baja_asign_id` = `incore`.`asignaciones_autos`.`asign_id`)) where `incore`.`asignaciones_autos`.`asign_empleado_id` = `emp`.`empleado_id` and `incore`.`baja_auto`.`baja_id` is null limit 0,1))) left join `rh`.`vista_herramienta_empleado` `vhe` on(`emp`.`empleado_id` = (select `vista_herramienta_empleado`.`empleado_id` from `rh`.`vista_herramienta_empleado` where `vista_herramienta_empleado`.`empleado_id` = `emp`.`empleado_id` group by `vista_herramienta_empleado`.`empleado_id`))) where `sbn`.`deleted_at` is null group by `sbn`.`id` order by `sbn`.`id`;

-- ----------------------------
-- View structure for vista_usuarios
-- ----------------------------
DROP VIEW IF EXISTS `vista_usuarios`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vista_usuarios` AS (select `u`.`id_usuario` AS `id`,`u`.`nombre` AS `nombre`,`u`.`apellido` AS `apellido`,concat(`u`.`nombre`,' ',`u`.`apellido`) AS `nombre_completo`,`u`.`usuario` AS `usuario`,`u`.`correo` AS `correo`,`u`.`area` AS `area`,`u`.`perfil` AS `perfil`,`ur`.`Descripcion` AS `rol_rh`,`u`.`estatus` AS `estatus`,`u`.`created_at` AS `fecha_creacion` from (`incore`.`usuarios` `u` left join `rh`.`usuarios_roles` `ur` on(`ur`.`id` = `u`.`id_area`)) order by `u`.`id_usuario`);

-- ----------------------------
-- View structure for vista_usuarios_notificaciones
-- ----------------------------
DROP VIEW IF EXISTS `vista_usuarios_notificaciones`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vista_usuarios_notificaciones` AS select `us`.`id_usuario` AS `id_usuario`,concat(`us`.`nombre`,' ',`us`.`apellido`) AS `usuario_nombre`,`us`.`usuario` AS `usuario`,`us`.`correo` AS `correo`,`noti`.`id` AS `id_noti`,`noti`.`codigo` AS `codigo`,`noti`.`nombre` AS `permiso_nombre`,`noti`.`tipo` AS `tipo_permiso`,`noti`.`estatus` AS `estatus` from ((`incore`.`usuarios` `us` join `rh`.`usuarios_notificaciones` `un` on(`un`.`id_usuario` = `us`.`id_usuario`)) join `rh`.`notificaciones` `noti` on(`noti`.`id` = `un`.`id_notificacion`)) where `us`.`estatus` = 'ACTIVO' and `us`.`correo` is not null;

-- ----------------------------
-- Procedure structure for log
-- ----------------------------
DROP PROCEDURE IF EXISTS `log`;
delimiter ;;
CREATE PROCEDURE `log`()
BEGIN
 DECLARE finished BOOL DEFAULT FALSE;
   DECLARE VV_TmpEmail varchar(250) default '';
-- declare cursor for employee email
DEClARE inc_cursor CURSOR FOR 
select id from 
incidencias
where 
auth_rh is not null and 
auth_direccion is not null and 
auth_capital is not null
limit 10;

DECLARE CONTINUE HANDLER 
FOR NOT FOUND 
SET finished = false;

 OPEN inc_cursor;
   Recorre_Cursor: LOOP
        FETCH inc_cursor INTO VV_TmpEmail;
 IF finished THEN
 select VV_TmpEmail;
            LEAVE Recorre_Cursor;
             
        END IF;
       

    END LOOP;
  CLOSE inc_cursor;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for Sp_Actualizar_Autorizaciones_incidencias
-- ----------------------------
DROP PROCEDURE IF EXISTS `Sp_Actualizar_Autorizaciones_incidencias`;
delimiter ;;
CREATE PROCEDURE `Sp_Actualizar_Autorizaciones_incidencias`(`usuario` INT, `id_incidencia` INT, `opcion` NVARCHAR(10))
BEGIN
 -- DECLARE IdUsuario int DEFAULT 'bob';
DECLARE IdUsuario int;
DECLARE RolUsuario varchar(10);
DECLARE MENSAJE varchar(100);

set idUsuario=((select u.id from 
users u
inner join usuarios_roles ur on ur.id=u.id_area
where u.id =usuario) );

set RolUsuario=((select ur.rol from 
users u
inner join usuarios_roles ur on ur.id=u.id_area
where u.id =usuario) );
-- select idUsuario,idUsuario;


CASE  opcion
WHEN 'AUTORIZAR'
THEN
CASE RolUsuario

      WHEN 'RH' THEN 
				 UPDATE incidencias SET auth_rh=NOW(), id_rh_auth=idUsuario
                
                 where id=id_incidencia;
                 SET MENSAJE='SE A AUTORIZADO CON RH';
      WHEN 'COOR' THEN 
				UPDATE incidencias SET auth_capital=NOW(), id_capital_auth=idUsuario
               
                 where id=id_incidencia;
                 SET MENSAJE='SE A AUTORIZADO CON COORD';
       WHEN 'DIR' THEN 
				UPDATE incidencias SET auth_direccion=NOW(), id_direccion_auth=idUsuario
               
                 where id=id_incidencia;
                 SET MENSAJE='SE A AUTORIZADO CON DIR';
	    WHEN 'PRO' THEN
					SET MENSAJE='NO HAY DATOS QUE  MOSTRAR';
      ELSE
        BEGIN
        END;
    END CASE;
WHEN 'CANCELAR'
THEN
CASE RolUsuario

      WHEN 'RH' THEN 
				 UPDATE incidencias 
                 SET auth_rh=NOW(),
                 id_rh_auth=idUsuario,
                 status_auth=opcion,
								 area_cancelar = RolUsuario
                 where id=id_incidencia;
                 SET MENSAJE='SE A CANCELADO CON RH';
      WHEN 'COOR' THEN 
				UPDATE incidencias SET auth_capital=NOW(), id_capital_auth=idUsuario,
                status_auth=opcion,
								area_cancelar = RolUsuario
                 where id=id_incidencia;
                 SET MENSAJE='SE A CANCELADO CON COOR';
       WHEN 'DIR' THEN 
				UPDATE incidencias SET auth_direccion=NOW(), id_direccion_auth=idUsuario,
                status_auth=opcion,
								area_cancelar = RolUsuario
                 where id=id_incidencia;
                 SET MENSAJE='SE A CANCELADO CON DIR';
	    WHEN 'PRO' THEN
					SET MENSAJE='NO HAY DATOS QUE  MOSTRAR';
      ELSE
        BEGIN
        END;
    END CASE;
ELSE
        BEGIN
        END;
    END CASE;


   SELECT MENSAJE;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for Sp_Auth_solicitudes
-- ----------------------------
DROP PROCEDURE IF EXISTS `Sp_Auth_solicitudes`;
delimiter ;;
CREATE PROCEDURE `Sp_Auth_solicitudes`(`usuario` INT, `idRegistro` INT, `Opciones` VARCHAR(100), `VALOR` VARCHAR(100), `obs` NVARCHAR(250), `email` VARCHAR(45))
BEGIN

 -- DECLARE IdUsuario int DEFAULT 'bob';
DECLARE IdUsuario int;
DECLARE RolUsuario varchar(10);
DECLARE MENSAJE varchar(100);

set idUsuario=((select u.id from 
users u
inner join usuarios_roles ur on ur.id=u.id_area
where u.id =usuario) );

set RolUsuario=((select ur.rol from 
users u
inner join usuarios_roles ur on ur.id=u.id_area
where u.id =usuario) );
-- select idUsuario,idUsuario;
CASE RolUsuario
      WHEN 'ENTR' THEN 
				 UPDATE solicitudes_altas_auth SET auth_entregables=NOW(),
                 entregables_user_id=idUsuario
                 where id_solicitud=idRegistro ;               
                 SET MENSAJE='SE A AUTORIZADO CON ENTREGABLES';
       WHEN 'DIR' THEN 
				
                UPDATE solicitudes_altas_auth 
                     SET auth_direccion=NOW(),
                 id_dir_user=idUsuario
                 where id_solicitud=idRegistro;
                SET MENSAJE='SE A AUTORIZADO CON DIR';
		WHEN 'RH' THEN
                    
                     UPDATE solicitudes_altas_auth 
                     SET auth_rh=NOW(),
                 id_user_rh=idUsuario
                 where id_solicitud=idRegistro ;
                 SET MENSAJE='SE A AUTORIZADO CON RH';        
      ELSE
        BEGIN
        END;
    END CASE;
    
    
    
    
case Opciones -- COMPUTADORA, AUTO , 
when 'contrato'
then
 UPDATE solicitudes_altas_auth 
                SET contrato_firmado=VALOR
                 where id_solicitud=idRegistro ;
                 SET MENSAJE='SE ACTUALIZO CONTRATO: '; 

when 'alta'
then


UPDATE solicitudes_altas_auth 
                SET ALTA=VALOR
                 where id_solicitud=idRegistro;
                 SET MENSAJE='SE ACTUALIZO ALTA: '; 

when 'computadora'
then

UPDATE solicitudes_altas_auth 
                SET computadora=VALOR,
                obs_compu=''+OBS+'',
                email_nae=''+email+''
                
                 where 
                 id_solicitud=idRegistro
                 ;
                 SET MENSAJE='SE ACTUALIZO COMPUTADORA'; 
when 'coche'
then
UPDATE solicitudes_altas_auth 
                SET coche=VALOR,
                 obs_auto=obs
                 where id_solicitud=idRegistro;
                 SET MENSAJE='SE ACTUALIZO COCHE';
when 'celular'
then
UPDATE solicitudes_altas_auth 
                SET celular=VALOR,
                 obs_celular=obs
                 where id_solicitud=idRegistro;
                 SET MENSAJE='SE ACTUALIZO CELULAR';    
                 
                 
when 'herramientas'
then
UPDATE solicitudes_altas_auth 
                SET herramientas_almacen=VALOR,
                obs_herra=obs
                 where id_solicitud=idRegistro;
                 SET MENSAJE='SE ACTUALIZO HERRAMIENTAS ALMACEN'; 
when 'solicitante'
then

UPDATE solicitudes_altas_auth 
                SET solicitante=VALOR
                 where id_solicitud=idRegistro;
                 SET MENSAJE='SE ACTUALIZO SOLICITANTE'; 
else 
begin
end;
end case;
   SELECT MENSAJE;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_bitacoras_sistema
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_bitacoras_sistema`;
delimiter ;;
CREATE PROCEDURE `sp_bitacoras_sistema`(`registro` INT, `tiporeg` VARCHAR(30))
BEGIN
select 
bi.id 'CLAVE',
bi.tipo 'TIPO',
bi.id_tabla 'REGISTRO' ,
us.name 'USUARIO',
CONCAT_WS(' ',em.empleado_nombre,em.empleado_apaterno,em.empleado_amaterno) 'EMPLEADO',
bi.mensaje 'DETALLES',
bi.fecha 'FECHA',
bi.hora 'HORA',
bi.status_auth 'ESTADO' 
from 
rh.bitacoras bi
left join users us on us.id=bi.id_usuario_login
left join empleados em on em.id=bi.id_empleado
where bi.id_tabla=registro and bi.tipo=tiporeg ;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_BuscarCodigos.
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_BuscarCodigos.`;
delimiter ;;
CREATE PROCEDURE `sp_BuscarCodigos.`(`codigo` VARCHAR(50), `tipo` VARCHAR(50))
BEGIN
SELECT id,codigo FROM rh.catalogo_codigos
where codigo=codigo and 
tipo=tipo and caduca is null
limit 1;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_busca_empleado_criteria
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_busca_empleado_criteria`;
delimiter ;;
CREATE PROCEDURE `sp_busca_empleado_criteria`(`criteria` VARCHAR(50))
BEGIN
SELECT 
id,
empleado_nombre,
empleado_apaterno,
empleado_amaterno,
calle,
num_exterior,
num_interior,
colonia,
municipio,
cp,
estado,
nss,
curp,
rfc
FROM rh.empleados
where 
nss  = criteria
or curp = criteria
or rfc = criteria
and empleado_estatus = 'BAJA';
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_catalogos_crud
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_catalogos_crud`;
delimiter ;;
CREATE PROCEDURE `sp_catalogos_crud`(`_Catalogo` VARCHAR(30), `_Opcion` VARCHAR(30), `_idCoordinador` INT, `_Nombre` VARCHAR(50), `_Apellido` VARCHAR(50), `_Correo` VARCHAR(50), `_plan_id` INT, `_plan_codigo` VARCHAR(30), `_plan_nombre` VARCHAR(30), `_plan_tipo` VARCHAR(30), `_plan_descripcion` NVARCHAR(50), `_plan_costo` DOUBLE, `_plan_precio` DOUBLE, `_plan_empresa` VARCHAR(30), `_plan_proveedor` VARCHAR(30), `_idwbs` INT, `_cliente` VARCHAR(30), `_servicio` VARCHAR(30), `_region` VARCHAR(30), `_tecnologia` VARCHAR(30), `_grupo` INT)
BEGIN

case _Catalogo
 when  'coordinador'
 then
        
	if(_Opcion=0)
        then 
					select * from 
					catalogo_coordinadores
                    where id=_idCoordinador;
        elseif(_Opcion=1)
        then 
					update 
					catalogo_coordinadores
					set 
					nombre=_nombre,
					apellido=_apellido,
					correo=_correo
					where id=_idCoordinador;
Select 'ACTUALIZACION CORRECTA DEL COORDINADOR' as MENSAJE;
        elseif(_Opcion=2)
        then
					delete from 
					catalogo_coordinadores
					where id=_idCoordinador;
                      Select 'SE HA ELIMINADO CORRECTAMENTE EL COORDINADOR' as MENSAJE;
                    
		elseif(_Opcion=3)
        then
				insert into
				catalogo_coordinadores
                (nombre,
                 apellido,
                 correo)
                values
                 (_Nombre,
                 _Apellido,
                 _Correo);
                  Select 'SE HA INSERTADO CORRECTAMENTE EL COORDINADOR' as MENSAJE;
	end if;

    
	when  'plan'
	then
    
    
    if(_Opcion=0)
        then 
			select * from 
			catalogo_planes_lineas
			where plan_id=_plan_id;

                    
                    
        elseif(_Opcion=1)
        then 
				update 
				catalogo_planes_lineas
				set 
				plan_codigo=_plan_codigo,
				plan_nombre=_plan_nombre,
				plan_tipo=_plan_tipo,
				plan_descripcion=_plan_descripcion,
				plan_costo=_plan_costo,
				plan_precio=_plan_precio,
				plan_empresa=_plan_empresa,
				plan_proveedor=_plan_proveedor
				where plan_id=_plan_id;

Select 'ACTUALIZACION CORRECTA DEL PLAN' as MENSAJE;

        elseif(_Opcion=2)
        then
					delete from 
					catalogo_planes_lineas
					where plan_id=_plan_id;
  Select 'SE HA ELIMINADO CORRECTAMENTE EL PLAN' as MENSAJE;

           elseif(_Opcion=3)
        then         
                    
       

insert into
catalogo_planes_lineas
(
plan_codigo,
plan_nombre,
plan_tipo,
plan_descripcion,
plan_costo,
plan_precio,
plan_empresa,
plan_proveedor
)
values
(
_plan_codigo,
_plan_nombre,
_plan_tipo,
_plan_descripcion,
_plan_costo,
_plan_precio,
_plan_empresa,
_plan_proveedor
);
 Select 'SE HA INSERTADO CORRECTAMENTE EL PLAN' as MENSAJE;

	end if;


when  'wbs'
	then
    
        if(_Opcion=0)
        then 
			select * from 
			catalogo_wbs
			where id=_idwbs;

                    
                    
        elseif(_Opcion=1)
        then 
				update 
				catalogo_wbs
				set 
					cliente=_cliente,
					servicio=_servicio,
					region=_region, 
					tecnologia=_tecnologia, 
					grupo=_grupo
					where id=_idwbs;
                    
                    Select 'ACTUALIZACION CORRECTA EL WBS' as MENSAJE;


        elseif(_Opcion=2)
        then
					delete from 
					catalogo_wbs
				where id=_idwbs;
                
                 Select 'SE HA ELIMINADO CORRECTAMENTE EL WBS' as MENSAJE;

           elseif(_Opcion=3)
        then         
				insert into
				catalogo_wbs
				(
				cliente,
				servicio,
				region, 
				tecnologia, 
				grupo
				)
				values
				(
				_cliente,
				_servicio,
				_region, 
				_tecnologia, 
				_grupo
				);
                 Select 'SE HA INSERTADO CORRECTAMENTE EL WBS' as MENSAJE;

	end if;
    
    
    
    
    
end case;
 
 





END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_Catalogos_Opciones
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_Catalogos_Opciones`;
delimiter ;;
CREATE PROCEDURE `sp_Catalogos_Opciones`(`opcion` INT, `_id` INT, `_codigo` VARCHAR(100), `_concepto` VARCHAR(100), `_precio` DOUBLE, `_costo` DOUBLE, `_incluye` VARCHAR(100), `_tipo` VARCHAR(100), `_diario` INT, `_pd` VARCHAR(50), `_diario_gasolina` DOUBLE, `_monto_viatico` DOUBLE, `_incluye_viaticos` INT, `_incluye_equipo` INT, `_descripcion` NVARCHAR(150), `_horas` VARCHAR(50), `_caduca` DATE)
BEGIN


if (opcion =0)  -- ACTUALIZAR CATALOGO
then

Update 
rh.catalogo_codigos
set  
codigo=_codigo,
concepto=_concepto, 
precio=_precio,
costo=_costo,
incluye=_incluye,
tipo=_tipo, 
diario=_diario,
pd=_pd,
diario_gasolina=_diario_gasolina,
monto_viatico=_monto_viatico,
incluye_viaticos=_incluye_viaticos,
incluye_equipo=_incluye_equipo,
descripcion=_descripcion,
horas=_horas,
caduca=_caduca
where id=_id;

SELECT 'El codigo se a actualizado' AS MENSAJE;



  elseif(opcion =1) -- ELIMINAR UN REGISTRO DE  LA TABLA DE BASE DE DATOS
then

DELETE from  rh.catalogo_codigos
where id=_id;

SELECT 'El codigo se a Eliminado' AS MENSAJE;

elseif(opcion =2) -- Selecionar registro
then
SELECT id, codigo, concepto, precio,
 costo, incluye, tipo, diario, pd,
 diario_gasolina, monto_viatico, 
 incluye_viaticos, incluye_equipo, 
 descripcion, horas, caduca
 FROM rh.catalogo_codigos
 where id=_id
 order by id;
 
 
  elseif(opcion =3) -- ELIMINAR UN REGISTRO DE  LA TABLA DE BASE DE DATOS
then
insert into rh.catalogo_codigos
(
codigo,
concepto, 
precio,
costo,
incluye,
tipo, 
diario,
pd,
diario_gasolina,
monto_viatico,
incluye_viaticos,
incluye_equipo,
descripcion,
horas,
caduca
)
values
(
_codigo,
_concepto, 
_precio,
_costo,
_incluye,
_tipo, 
_diario,
_pd,
_diario_gasolina,
_monto_viatico,
_incluye_viaticos,
_incluye_equipo,
_descripcion,
_horas,
_caduca);
SELECT 'Codigo Insertado' AS MENSAJE;
 
 
end if;
end
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_empleado_herramientas
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_empleado_herramientas`;
delimiter ;;
CREATE PROCEDURE `sp_empleado_herramientas`(`Par_empleado` INT)
BEGIN
SELECT sl.celular celular,sl.plan_linea pan,
sl.computadora, sl.desc_computadora,
sl.software, sl.desc_software, sl.tipo_correo,
 sl.bam,sl.plan_linea_bam, sl.auto,
 sl.botas,
 sl.playera,
 sl.herramientas_detalles
 FROM  solicitud_alta sl 
where  sl.id=Par_empleado;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_GetUsers_Rol
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_GetUsers_Rol`;
delimiter ;;
CREATE PROCEDURE `sp_GetUsers_Rol`()
BEGIN
select  u.id,u.name,u.email,ur.descripcion,u.fecha_creacion from rh.users u
inner join  usuarios_roles ur on ur.id=u.id_area
order by u.name;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SP_INCIDENCIAS_SLOTE
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_INCIDENCIAS_SLOTE`;
delimiter ;;
CREATE PROCEDURE `SP_INCIDENCIAS_SLOTE`(IN `dato` INT(50))
BEGIN
select 
i.id AS ID,
CONCAT_WS(' ',em.empleado_nombre,em.empleado_apaterno,em.empleado_amaterno) AS EMPLEADO,
em.id AS idEmpleado,
upper(ic.nombre) 'TIPO',
i.fecha_solicitud  'FECHA SOLICITUD',
i.fecha_inicio  'FECHA INICIO',
i.fecha_fin  'FECHA FIN',
i.dias  'DURACION',
i.monto 'MONTO',
us.name 'SOLICITANTE'
from 
rh.incidencias i 
LEFT join empleados em on em.empleado_id=i.id_empleado
LEFT join incidencias_catalogo ic on ic.id=i.id_incidencia_tipo
LEFT join users  us on us.id=i.id_solicitante
WHERE I.ID_LOTE IS NULL;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_insert_Auth_solicitudes
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_insert_Auth_solicitudes`;
delimiter ;;
CREATE PROCEDURE `sp_insert_Auth_solicitudes`(`id` INT)
BEGIN

insert into
solicitudes_altas_auth
(
id_solicitud
)
values
(
id
);

select 'SE INSERTO CORRECTAMENTE ' AS MENSAJE;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_insert_bitacora
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_insert_bitacora`;
delimiter ;;
CREATE PROCEDURE `sp_insert_bitacora`(`tipo` VARCHAR(30), `id_reg` INT, `usuario` INT, `empl` INT, `mensaje` NVARCHAR(500), `opcion` NVARCHAR(50))
BEGIN
INSERT INTO `rh`.`bitacoras`
(
`tipo`,
`id_tabla`,
`id_usuario_login`,
`id_empleado`,
`mensaje`,
`fecha`,
`hora`,
status_auth)
VALUES
(
tipo,
id_reg,
usuario,
empl,
mensaje,
CURDATE(),
curTime(),
opcion);
SELECT 'SE HA INCERTADO CORRECTAMENTE' MENSAJE;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_lista_codigos
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_lista_codigos`;
delimiter ;;
CREATE PROCEDURE `sp_lista_codigos`()
BEGIN
SELECT id, codigo, concepto, precio, costo, incluye, tipo, diario, pd, diario_gasolina, monto_viatico, incluye_viaticos, incluye_equipo, descripcion, horas, caduca
 FROM rh.catalogo_codigos;


END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_Lista_Usuarios
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_Lista_Usuarios`;
delimiter ;;
CREATE PROCEDURE `sp_Lista_Usuarios`(`dato` NVARCHAR(50))
BEGIN

-- CREATE TEMPORARY TABLE UsuariosTemp (Nombre varchar(50), id int);
--  Insert into UsuariosTemp
-- select concat_ws(empleado_nombre, empleado_apaterno, empleado_amaterno) AS nombre  ,id as id
-- from empleados ;
  
-- Insert into UsuariosTemp  
-- select nombre, user_id as id 
-- from catalogo_coordinadores;

-- select * from  UsuariosTemp
 -- where Nombre like dato;
-- drop table UsuariosTemp;

select concat_ws(' ',empleado_nombre, empleado_apaterno, empleado_amaterno) AS Nombre  ,id as id
from empleados ;



END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_notificaciones
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_notificaciones`;
delimiter ;;
CREATE PROCEDURE `sp_notificaciones`(`seccion` NVARCHAR(10))
BEGIN



CASE seccion
      WHEN 'uscrear' THEN 
				
			select us.name Nombre,us.email Correo,r.rol Rol,Descripcion,
uscrear, useliminar, usedit, SolAlta, 
SolCrear, SolBaja, EmpleadoActualizar,
 EmpleadoBaja, InciCrear, inciAuth, inciLote from 
users us join
usuarios_roles r on r.id=us.id_area
join user_notificaciones  noti on noti.user_id=us.id
where uscrear='true';

             
                
                
                
       WHEN 'useliminar' THEN 
					select us.name Nombre,us.email Correo,r.rol Rol,Descripcion,
uscrear, useliminar, usedit, SolAlta, 
SolCrear, SolBaja, EmpleadoActualizar,
 EmpleadoBaja, InciCrear, inciAuth, inciLote from 
users us join
usuarios_roles r on r.id=us.id_area
join user_notificaciones  noti on noti.user_id=us.id
where useliminar='true';


           
		WHEN 'usedit' THEN
        	select us.name Nombre,us.email Correo,r.rol Rol,Descripcion,
uscrear, useliminar, usedit, SolAlta, 
SolCrear, SolBaja, EmpleadoActualizar,
 EmpleadoBaja, InciCrear, inciAuth, inciLote from 
users us join
usuarios_roles r on r.id=us.id_area
join user_notificaciones  noti on noti.user_id=us.id
where usedit='true';

             WHEN 'SolAlta' THEN 
             	select us.name Nombre,us.email Correo,r.rol Rol,Descripcion,
uscrear, useliminar, usedit, SolAlta, 
SolCrear, SolBaja, EmpleadoActualizar,
 EmpleadoBaja, InciCrear, inciAuth, inciLote from 
users us join
usuarios_roles r on r.id=us.id_area
join user_notificaciones  noti on noti.user_id=us.id
where SolAlta='true';


				
           
		WHEN 'SolCrear' THEN
        	select us.name Nombre,us.email Correo,r.rol Rol,Descripcion,
uscrear, useliminar, usedit, SolAlta, 
SolCrear, SolBaja, EmpleadoActualizar,
 EmpleadoBaja, InciCrear, inciAuth, inciLote from 
users us join
usuarios_roles r on r.id=us.id_area
join user_notificaciones  noti on noti.user_id=us.id
where SolCrear='true';


             WHEN 'SolBaja' THEN 
             	select us.name Nombre,us.email Correo,r.rol Rol,Descripcion,
uscrear, useliminar, usedit, SolAlta, 
SolCrear, SolBaja, EmpleadoActualizar,
 EmpleadoBaja, InciCrear, inciAuth, inciLote from 
users us join
usuarios_roles r on r.id=us.id_area
join user_notificaciones  noti on noti.user_id=us.id
where SolBaja='true';

				
           
		WHEN 'EmpleadoActualizar' THEN
        	select us.name Nombre,us.email Correo,r.rol Rol,Descripcion,
uscrear, useliminar, usedit, SolAlta, 
SolCrear, SolBaja, EmpleadoActualizar,
 EmpleadoBaja, InciCrear, inciAuth, inciLote from 
users us join
usuarios_roles r on r.id=us.id_area
join user_notificaciones  noti on noti.user_id=us.id
where EmpleadoActualizar='true';

            WHEN 'EmpleadoBaja' THEN 
             	select us.name Nombre,us.email Correo,r.rol Rol,Descripcion,
uscrear, useliminar, usedit, SolAlta, 
SolCrear, SolBaja, EmpleadoActualizar,
 EmpleadoBaja, InciCrear, inciAuth, inciLote from 
users us join
usuarios_roles r on r.id=us.id_area
join user_notificaciones  noti on noti.user_id=us.id
where EmpleadoBaja='true';

				
           
		WHEN 'InciCrear' THEN
        	select us.name Nombre,us.email Correo,r.rol Rol,Descripcion,
uscrear, useliminar, usedit, SolAlta, 
SolCrear, SolBaja, EmpleadoActualizar,
 EmpleadoBaja, InciCrear, inciAuth, inciLote from 
users us join
usuarios_roles r on r.id=us.id_area
join user_notificaciones  noti on noti.user_id=us.id
where InciCrear='true';


             WHEN 'inciAuth' THEN 
             	select us.name Nombre,us.email Correo,r.rol Rol,Descripcion,
uscrear, useliminar, usedit, SolAlta, 
SolCrear, SolBaja, EmpleadoActualizar,
 EmpleadoBaja, InciCrear, inciAuth, inciLote from 
users us join
usuarios_roles r on r.id=us.id_area
join user_notificaciones  noti on noti.user_id=us.id
where inciAuth='true';


				
           
		WHEN 'inciLote' THEN
        	select us.name Nombre,us.email Correo,r.rol Rol,Descripcion,
uscrear, useliminar, usedit, SolAlta, 
SolCrear, SolBaja, EmpleadoActualizar,
 EmpleadoBaja, InciCrear, inciAuth, inciLote from 
users us join
usuarios_roles r on r.id=us.id_area
join user_notificaciones  noti on noti.user_id=us.id
where inciLote='true';



                    
                
      ELSE
        BEGIN
        END;
    END CASE;







END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_optener_correos
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_optener_correos`;
delimiter ;;
CREATE PROCEDURE `sp_optener_correos`(`rol` VARCHAR(10))
BEGIN
select us.name Nombre,us.email Correo,r.rol Rol,Descripcion from 
users us join
usuarios_roles r on r.id=us.id_area
where r.rol like Upper(rol)
and r.rol<>'ADMIN';

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_proyectos_wbs
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_proyectos_wbs`;
delimiter ;;
CREATE PROCEDURE `sp_proyectos_wbs`(`wbs` VARCHAR(30), `opcion` INT, `_id` VARCHAR(10), `_nombre` NVARCHAR(50), `_activo` INT)
BEGIN

case wbs
WHEN 'clientes'
then
				case opcion 
						when 0
						then
								select id, nombre, activo from  
								proyectos_clientes
                                where  id=_id;
                                
						when 1
						then 
								update proyectos_clientes
								set   nombre=_nombre, 
									  activo=_activo
								 where  id=_id;
                                 
                                 select 'Correcto!!' as MENSAJE;
					when 2
						then
								delete from 
								proyectos_clientes
								 where  id=_id  COLLATE utf8_unicode_ci;
                                 select 'Correcto!!' as MENSAJE;
						when 3
						then 
								insert into proyectos_clientes
								(id,nombre,activo) values (_id,_nombre,_activo);   
                                select 'Correcto!!' as MENSAJE;
				end case;
when 'grupos'
then
				case opcion 
						when 0
						then
								select id, nombre, activo from  
								proyectos_grupos
								 where  id=_id;
						when 1
						then 
								update proyectos_grupos
								set   nombre=_nombre, 
									  activo=_activo
								 where  id=_id;
                                 select 'Correcto!!' as MENSAJE;
						when 2
						then
								delete from 
								proyectos_grupos
								 where  id=_id;
                                 select 'Correcto!!' as MENSAJE;
						when 3
						then 
								insert into proyectos_grupos
									(id,nombre,activo) values (_id,_nombre,_activo);   
                                select 'Correcto!!' as MENSAJE;
				end case;
when 'regiones'
then 

                case opcion 
						when 0
						then
								select id, nombre, activo from  
								proyectos_regiones
                                    where  id=_id;
						when 1
						then 
								update proyectos_regiones
								set   nombre=_nombre, 
									  activo=_activo
								 where  id=_id;
                                 select 'Correcto!!' as MENSAJE;
						when 2
						then
								delete from 
								proyectos_regiones
								 where  id=_id;
                                 select 'Correcto!!' as MENSAJE;
						when 3
						then 
								insert into proyectos_regiones
								(id,nombre,activo) values (_id,_nombre,_activo);      
                                select 'Correcto!!' as MENSAJE;
				end case;
    
when 'servicios'
then 


			case opcion 
						when 0
						then
								select id, nombre, activo from  
								proyectos_servicios
                                    where  id=_id;
                                    
						when 1
						then 
								update proyectos_servicios
								set   nombre=_nombre, 
									  activo=_activo
								 where  id=_id;
                                 select 'Correcto!!' as MENSAJE;
						when 2
						then
								delete from 
								proyectos_servicios
								 where  id=_id;
                                 select 'Correcto!!' as MENSAJE;
						when 3
						then 
								insert into proyectos_servicios
								(id,nombre,activo) values (_id,_nombre,_activo);    
                                select 'Correcto!!' as MENSAJE;
				end case;

when 'tecnologias'
then 
				case opcion 
						when 0
						then
								select id, nombre, activo from  
								proyectos_tecnologias
                                    where  id=_id;
						when 1
						then 
								update proyectos_tecnologias
								set   nombre=_nombre, 
									  activo=_activo
								 where  id=_id;
                                 select 'Correcto!!' as MENSAJE;
						when 2
						then
								delete from 
								proyectos_tecnologias
								 where  id=_id;
                                 select 'Correcto!!' as MENSAJE;
						when 3
						then 
								insert into proyectos_tecnologias
								(id,nombre,activo) values (_id,_nombre,_activo);   
                                select 'Correcto!!' as MENSAJE;
				end case;

end case;
		











END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_restaurar_auth
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_restaurar_auth`;
delimiter ;;
CREATE PROCEDURE `sp_restaurar_auth`(`_id` INT)
BEGIN
update 
solicitudes_altas_auth
set herramientas_almacen= null,
celular=null,
coche=null
where id_solicitud=_id;

select 'SE HAN RESTAURADO LOS DATOS' AS MENSAJE;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_select_catalogos
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_select_catalogos`;
delimiter ;;
CREATE PROCEDURE `sp_select_catalogos`(`ops` INT)
BEGIN
if (ops=0)
then

SELECT id,nombre,apellido,correo FROM rh.catalogo_coordinadores;

elseif(ops=1)
then


select 
plan_id, plan_codigo, plan_nombre, plan_tipo, 
            plan_descripcion, plan_costo, plan_precio, plan_empresa, plan_proveedor
            from  rh.catalogo_planes_lineas;
            
elseif(ops=2)
then


select * from catalogo_wbs;

end if;


END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_select_citas
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_select_citas`;
delimiter ;;
CREATE PROCEDURE `sp_select_citas`()
BEGIN
SELECT 
        `sa`.`id` AS `id`,
        CONCAT_WS('-',
                `sa`.`cliente`,
                `sa`.`servicio`,
                `sa`.`region`,
                `sa`.`tecnologia`,
                `sa`.`grupo`) AS `WBS`,
        CONCAT_WS(' ',
                `sa`.`nombre`,
                `sa`.`apaterno`,
                `sa`.`amaterno`) AS `Nombre`,
        CONCAT_WS(' ', `co`.`nombre`, `co`.`apellido`) AS `coordinador`,
        CONCAT_WS(' x ',
                `sla`.`auth_entregables`,
                `usentre`.`name`) AS `Auth_entregables`,
        CONCAT_WS(' x ',
                `sla`.`auth_direccion`,
                `usdir`.`name`) AS `Auth_direccion`,
        CONCAT_WS(' x ', `sla`.`auth_rh`, `usrh`.`name`) AS `Auth_RH`,
        `sa`.`fecha_cita` AS `fecha_cita`,
        `sa`.`hora_cita` AS `hora_cita`,
        `sa`.`detalles_cita` AS `detalles_cita`,
        `sa`.`status_cita` AS `status_cita`,
        `sa`.`correo_cita` AS `correo_cita`
    FROM
        (((((`solicitud_alta` `sa`
        LEFT JOIN `catalogo_coordinadores` `co` ON ((`co`.`id` = `sa`.`coordinador_id`)))
        LEFT JOIN `solicitudes_altas_auth` `sla` ON ((`sla`.`id_solicitud` = `sa`.`id`)))
        LEFT JOIN `users` `usrh` ON ((`usrh`.`id` = `sla`.`id_user_rh`)))
        LEFT JOIN `users` `usdir` ON ((`usdir`.`id` = `sla`.`id_dir_user`)))
        LEFT JOIN `users` `usentre` ON ((`usentre`.`id` = `sla`.`entregables_user_id`)))
    WHERE
        (`sa`.`status_cita` IS NOT NULL or `sa`.`status_cita`='' )
    GROUP BY `sa`.`id`;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_solicitudes_alta
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_solicitudes_alta`;
delimiter ;;
CREATE PROCEDURE `sp_solicitudes_alta`()
BEGIN



SELECT 
sa.id as id,
sa.descargado as 'descargado',
CONCAT_WS('-',sa.cliente,sa.servicio,sa.region,sa.tecnologia, sa.grupo) as WBS,
CONCAT_WS(' ',sa.nombre,sa.apaterno,sa.amaterno) as  Nombre,
sa.created_at 'fecha solicitud',
sa.created_at 'fecha creacion de solicitud',
CONCAT_WS(' ',co.nombre,co.apellido) as  'coordinador',
'coordinadornokia',
sa.pm,
'solicitante definir',
sa.sueldo_imss 'imss',
sa.sueldo_variable 'variable' ,
'asimilado',
sa.costo,
sa.status_cita,
sa.venta,
'0' margen, 
IF(
CONCAT_WS(' x ',sla.auth_entregables,usentre.name)<>'',
CONCAT_WS(' x ',sla.auth_entregables,usentre.name),
'x') 'Auth entregables',

IF(
CONCAT_WS(' x ',sla.auth_direccion,usdir.name)<>'',
CONCAT_WS(' x ',sla.auth_direccion,usdir.name),
'x') 'Auth direccion',


IF(
CONCAT_WS(' x ',sla.auth_rh,usrh.name)<>'',
CONCAT_WS(' x ',sla.auth_rh,usrh.name),
'x') 'Auth RH',

sla.contrato_firmado 'Contrato firmado',
sla.alta 'alta',
sla.computadora 'computadora',

  (SELECT 
                IF((`sla`.`computadora` = 'OK'),
                        'ASIGNADA',
                        (SELECT 
                                IF((CONCAT_WS('',
                                                (SELECT 
                                                        IF((`sa`.`computadora` <> 0),
                                                                'SI',
                                                                'NO')
                                                    ),
                                                (SELECT IF((`sa`.`software` <> 0), 'SI', 'NO'))) <> 'NONO'),
                                        'SOLICITADO',
                                        'NO SOLICITADO')
                            ))
            ) AS `Computadora`,





        (SELECT 
                IF((`sla`.`coche` = 'OK'),
                        'ASIGNADA',
                        (SELECT 
                                IF((SELECT (IF((`sa`.`auto` <> 0), 'SI', 'NO') <> 'NO')),
                                        'SOLICITADO',
                                        'NO SOLICITADO')
                            ))
            ) AS `Coche`,
            
        (SELECT 
                IF((`sla`.`celular` = 'OK'),
                        'ASIGNADA',
                        (SELECT 
                                IF((CONCAT_WS('',
                                                (SELECT IF((`sa`.`celular` <> 0), 'SI', 'NO')),
                                                (SELECT 
                                                        IF((`sa`.`plan_linea` <> 27),
                                                                'SI',
                                                                'NO')
                                                    ),
                                                (SELECT 
                                                        IF((`sa`.`plan_linea_bam` <> 27),
                                                                'SI',
                                                                'NO')
                                                    )) <> 'NONONO'),
                                        'SOLICITADO',
                                        'NO SOLICITADO')
                            ))
            ) AS `Celular`,
   (SELECT 
                IF((`sla`.`herramientas_almacen` = 'OK'),
                        'ASIGNADA',
                        (SELECT 
                                IF((CONCAT_WS('',
                                                (SELECT IF((`sa`.`playera` <> 0), 'SI', 'NO')),
                                                (SELECT IF((`sa`.`botas` <> 0), 'SI', 'NO'))) <> 'NONO'),
                                        'SOLICITADO',
                                        'NO SOLICITADO')
                            ))
            ) AS `Herramientas`,
            
            
            
usr.name 'Solicitante',
sla.listo_cita 'cita',
sla.computadora 'computadora',
sla.celular 'celular',
sla.coche 'coche',
sla.herramientas_almacen 'herramientas'
FROM rh.solicitud_alta sa
left join catalogo_coordinadores co on co.id=sa.coordinador_id
left join solicitudes_altas_auth sla on sla.id_solicitud=sa.id
left join users usrh on usrh.id=sla.id_user_rh
left join users usdir on usdir.id=sla.id_dir_user
left join users usentre on usentre.id=sla.entregables_user_id
left join users usr on usr.id=sa.solicitante
 where 1
group by sa.id ;


                                             


END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_solicitudes_baja_nom
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_solicitudes_baja_nom`;
delimiter ;;
CREATE PROCEDURE `sp_solicitudes_baja_nom`()
BEGIN
select 
sbn.id 'id',
concat_ws(' ',em.empleado_nombre,em.empleado_apaterno,em.empleado_amaterno) 'Recurso',
CONCAT_WS('-',
                `sa`.`cliente`,
                `sa`.`servicio`,
                `sa`.`region`,
                `sa`.`tecnologia`,
                `sa`.`grupo`) AS `WBS`, 
cc.nombre as coordinador,
'coordinador nokia',
us.name 'solicitante',
sbn.fecha_emision 'fecha_emision',
sbn.fecha_baja_sol 'fecha_baja_sol',
sbn.fecha_baja_nom 'fecha_baja_nom',
sbn.fecha_cita 'fecha_cita',

(if(sbn.baja_computo='true','YA SE DIO DE BAJA','NO SE HA DADO DE BAJA' )) 'baja_computo',

(if(sbn.baja_auto='true','YA SE DIO DE BAJA','NO SE HA DADO DE BAJA' ))'baja_auto',

(if(sbn.baja_celular='true','YA SE DIO DE BAJA','NO SE HA DADO DE BAJA' ))'baja_celular',

(if(sbn.baja_almacen='true','YA SE DIO DE BAJA','NO SE HA DADO DE BAJA' )) 'baja_almacen',


(if(sbn.baja_credencial='true','YA SE DIO DE BAJA','NO SE HA DADO DE BAJA' ))  'baja_credencial',

(if(sbn.pago_finiquito='true','YA SE PAGO','NO SE HA PAGADO' )) 'pago_finiquito',


(if(sbn.baja_definitiva is null ,'PENDIENTE','COMPLETADO' ))  'baja_definitiva',

sbn.adeudos 'adeudos',
sbn.tiempo_herra 'tiempo_retraso_her'
from 
empleados em
inner join  solicitudes_baja_nomina sbn 
on sbn.id_empleado= em.id
inner join users us on us.id=sbn.solicitante
inner join solicitud_alta sa on sa.id=em.id_solicitud
inner join catalogo_coordinadores cc on cc.id=sa.coordinador_id;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_solicitudes_excell
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_solicitudes_excell`;
delimiter ;;
CREATE PROCEDURE `sp_solicitudes_excell`()
BEGIN
SELECT sa.id as id,
CONCAT_WS('-',sa.cliente,sa.servicio,sa.region,sa.tecnologia, sa.grupo) as WBS,
CONCAT_WS(' ',sa.nombre,sa.apaterno,sa.amaterno) as  Nombre,
sa.created_at 'fecha_solicitud',
sa.created_at 'fecha_creacion_de_solicitud',
CONCAT_WS(' ',co.nombre,co.apellido) as  'coordinador',
'coordinadornokia',
sa.pm,
'solicitante_definir',
sa.sueldo_imss 'imss',
sa.sueldo_variable 'variable' ,
'asimilado',
sa.costo,
sa.venta,
'0' margen, 
IF(
CONCAT_WS(' x ',sla.auth_entregables,usentre.name)<>'',
CONCAT_WS(' x ',sla.auth_entregables,usentre.name),
'x') 'Auth_entregables',

IF(
CONCAT_WS(' x ',sla.auth_direccion,usdir.name)<>'',
CONCAT_WS(' x ',sla.auth_direccion,usdir.name),
'x') 'Auth_direccion',


IF(
CONCAT_WS(' x ',sla.auth_rh,usrh.name)<>'',
CONCAT_WS(' x ',sla.auth_rh,usrh.name),
'x') 'Auth_RH',

sla.contrato_firmado 'Contrato_firmado',
sla.alta 'alta',
sla.computadora 'computadora',

  (SELECT 
                IF((`sla`.`computadora` = 'OK'),
                        'ASIGNADA',
                        (SELECT 
                                IF((CONCAT_WS('',
                                                (SELECT 
                                                        IF((`sa`.`computadora` <> 0),
                                                                'SI',
                                                                'NO')
                                                    ),
                                                (SELECT IF((`sa`.`software` <> 0), 'SI', 'NO'))) <> 'NONO'),
                                        'SOLICITADO',
                                        'NO_SOLICITADO')
                            ))
            ) AS `Computadora`,





        (SELECT 
                IF((`sla`.`coche` = 'OK'),
                        'ASIGNADA',
                        (SELECT 
                                IF((SELECT (IF((`sa`.`auto` <> 0), 'SI', 'NO') <> 'NO')),
                                        'SOLICITADO',
                                        'NO_SOLICITADO')
                            ))
            ) AS `Coche`,
            
        (SELECT 
                IF((`sla`.`celular` = 'OK'),
                        'ASIGNADA',
                        (SELECT 
                                IF((CONCAT_WS('',
                                                (SELECT IF((`sa`.`celular` <> 0), 'SI', 'NO')),
                                                (SELECT 
                                                        IF((`sa`.`plan_linea` <> 27),
                                                                'SI',
                                                                'NO')
                                                    ),
                                                (SELECT 
                                                        IF((`sa`.`plan_linea_bam` <> 27),
                                                                'SI',
                                                                'NO')
                                                    )) <> 'NONONO'),
                                        'SOLICITADO',
                                        'NO_SOLICITADO')
                            ))
            ) AS `Celular`,
   (SELECT 
                IF((`sla`.`herramientas_almacen` = 'OK'),
                        'ASIGNADA',
                        (SELECT 
                                IF((CONCAT_WS('',
                                                (SELECT IF((`sa`.`playera` <> 0), 'SI', 'NO')),
                                                (SELECT IF((`sa`.`botas` <> 0), 'SI', 'NO'))) <> 'NONO'),
                                        'SOLICITADO',
                                        'NO_SOLICITADO')
                            ))
            ) AS `Herramientas`,
usr.name 'Solicitante',
sla.listo_cita 'cita'
FROM rh.solicitud_alta sa
left join catalogo_coordinadores co on co.id=sa.coordinador_id
left join solicitudes_altas_auth sla on sla.id_solicitud=sa.id
left join users usrh on usrh.id=sla.id_user_rh
left join users usdir on usdir.id=sla.id_dir_user
left join users usentre on usentre.id=sla.entregables_user_id

left join users usr on usr.id=sa.solicitante
 where sa.status_cita is  null
group by sa.id ;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_sol_baja_nomina
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_sol_baja_nomina`;
delimiter ;;
CREATE PROCEDURE `sp_sol_baja_nomina`(`idempleado` INT, `fecha_baja` DATETIME, `incidencia` NVARCHAR(500), `obs` NVARCHAR(500), `motivo` VARCHAR(30), `con_baja` VARCHAR(10), `vobo_jefe` VARCHAR(500))
BEGIN


INSERT INTO `rh`.`solicitudes_baja_nomina`
(
`id_empleado`,
`fecha_baja_sol`,
`incidencias`,
`observaciones`,
`motivo`,
`conocimiento_baja`,
vobo_jefe
)
VALUES
(
idempleado,
fecha_baja,
incidencia,
obs,
motivo,
con_baja,
vobo_jefe);

SELECT 'INSERTADO CORRECTAMENTE'  AS MENSAJE;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_todos_proyectos
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_todos_proyectos`;
delimiter ;;
CREATE PROCEDURE `sp_todos_proyectos`()
BEGIN
(select 'clientes' as 'proyecto', id, nombre, activo from  
proyectos_clientes)
union
(select 'grupos' as 'proyecto', id, nombre, activo  from 
proyectos_grupos)
union
(select 'regiones' as 'proyecto', id, nombre, activo  from 
proyectos_regiones)
union
(select 'servicios' as 'proyecto', id, nombre, activo  from 
proyectos_servicios)
union
(select 'tecnologias' as 'proyecto', id, nombre, activo  from 
proyectos_tecnologias);
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for Update_lotes_Incidencias
-- ----------------------------
DROP PROCEDURE IF EXISTS `Update_lotes_Incidencias`;
delimiter ;;
CREATE PROCEDURE `Update_lotes_Incidencias`(`lote` INT, `id_incidencia` INT)
BEGIN
update 
incidencias
set id_lote=lote,
status_auth='ENVIADO'
where id=id_incidencia;
select 'OK' MENSAJE;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
