-- --------------------------------------------------------
-- 主机:                           localhost
-- 服务器版本:                        8.0.27 - MySQL Community Server - GPL
-- 服务器操作系统:                      Win64
-- HeidiSQL 版本:                  12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- 导出  表 supply_shop.gen_table 结构
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE IF NOT EXISTS `gen_table` (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0',
  `gen_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '/',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='代码生成业务表';

-- 正在导出表  supply_shop.gen_table 的数据：~15 rows (大约)
DELETE FROM `gen_table`;
INSERT INTO `gen_table` (`table_id`, `table_name`, `table_comment`, `sub_table_name`, `sub_table_fk_name`, `class_name`, `tpl_category`, `package_name`, `module_name`, `business_name`, `function_name`, `function_author`, `gen_type`, `gen_path`, `options`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
	(1, 'store_goods_cate', '商城商品分类', NULL, NULL, 'StoreGoodsCate', 'tree', 'com.ruoyi.shop', 'shop', 'cate', '商城商品分类', 'hupeng', '0', '/', '{"treeName":"cate_title","treeParentCode":"pid","treeCode":"id"}', 'admin', '2019-08-22 09:59:25', '', '2019-08-22 11:04:52', ''),
	(2, 'store_goods_brand', '产品品牌', NULL, NULL, 'StoreGoodsBrand', 'crud', 'com.ruoyi.shop', 'shop', 'brand', '产品品牌', 'hupeng', '0', '/', '{"treeName":"","treeParentCode":"","treeCode":""}', 'admin', '2019-08-23 18:21:24', '', '2019-08-23 18:24:11', ''),
	(3, 'store_goods_type', '商品类型(商品模型)表', NULL, NULL, 'StoreGoodsType', 'crud', 'com.ruoyi.shop', 'shop', 'type', '商品类型(商品模型)', 'hupeng', '0', '/', '{"treeName":"","treeParentCode":"","treeCode":""}', 'admin', '2019-08-24 14:16:00', '', '2019-08-24 14:16:23', ''),
	(4, 'store_goods_attribute', '商品的属性表(独立)', NULL, NULL, 'StoreGoodsAttribute', 'crud', 'com.ruoyi.shop', 'shop', 'attribute', '商品的属性(独立)', 'hupeng', '0', '/', '{"treeName":"","treeParentCode":"","treeCode":""}', 'admin', '2019-08-24 14:44:41', '', '2019-08-24 14:47:04', ''),
	(5, 'store_spec', '商品规格表(独立)', NULL, NULL, 'StoreSpec', 'crud', 'com.ruoyi.shop', 'shop', 'spec', '商品规格(独立)', 'hupeng', '0', '/', '{"treeName":"","treeParentCode":"","treeCode":""}', 'admin', '2019-08-25 09:40:12', '', '2019-08-25 09:45:36', ''),
	(6, 'store_spec_goods_price', '商品规格关联价格表', NULL, NULL, 'StoreSpecGoodsPrice', 'crud', 'com.ruoyi.shop', 'shop', 'price', '商品规格关联价格', 'hupeng', '0', '/', NULL, 'admin', '2019-08-25 09:40:12', '', NULL, NULL),
	(7, 'store_spec_item', '规格项', NULL, NULL, 'StoreSpecItem', 'crud', 'com.ruoyi.shop', 'shop', 'item', '规格项', 'hupeng', '0', '/', NULL, 'admin', '2019-08-25 09:40:12', '', NULL, NULL),
	(8, 'store_goods', '商品主表', NULL, NULL, 'StoreGoods', 'crud', 'com.ruoyi.shop', 'shop', 'goods', '商品主', 'hupeng', '0', '/', '{"treeName":"","treeParentCode":"","treeCode":""}', 'admin', '2019-08-25 14:00:14', '', '2019-08-25 14:14:00', ''),
	(9, 'store_goods_attr', '商品关联的属性表(与商品相关)', NULL, NULL, 'StoreGoodsAttr', 'crud', 'com.ruoyi.shop', 'shop', 'attr', '商品关联的属性(与商品相关)', 'hupeng', '0', '/', NULL, 'admin', '2019-08-26 13:38:54', '', NULL, NULL),
	(10, 'store_coupon', '优惠券主表', NULL, NULL, 'StoreCoupon', 'crud', 'com.ruoyi.shop', 'shop', 'coupon', '优惠券主', 'hupeng', '0', '/', '{"treeName":"","treeParentCode":"","treeCode":""}', 'admin', '2019-08-29 19:16:19', '', '2019-08-29 19:22:06', ''),
	(11, 'store_coupon_list', '优惠券记录表', NULL, NULL, 'StoreCouponList', 'crud', 'com.ruoyi.shop', 'shop', 'list', '优惠券记录', 'hupeng', '0', '/', NULL, 'admin', '2019-08-29 19:16:19', '', NULL, NULL),
	(12, 'store_order', '订单主表', NULL, NULL, 'StoreOrder', 'crud', 'com.ruoyi.shop', 'shop', 'order', '订单主', 'hupeng', '0', '/', '{"treeName":"","treeParentCode":"","treeCode":""}', 'admin', '2019-08-29 19:45:09', '', '2019-08-29 19:53:53', ''),
	(13, 'store_order_goods', '订单商品表与订单主表关联', NULL, NULL, 'StoreOrderGoods', 'crud', 'com.ruoyi.shop', 'shop', 'goods', '订单商品与订单主关联', 'hupeng', '0', '/', NULL, 'admin', '2019-08-29 19:45:10', '', NULL, NULL),
	(14, 'store_order_goods_remark', '订单商品备注表', NULL, NULL, 'StoreOrderGoodsRemark', 'crud', 'com.ruoyi.shop', 'shop', 'remark', '订单商品备注', 'hupeng', '0', '/', NULL, 'admin', '2019-08-29 19:45:10', '', NULL, NULL),
	(15, 'store_member', '商城会员信息', NULL, NULL, 'StoreMember', 'crud', 'com.ruoyi.shop', 'shop', 'member', '商城会员信息', 'hupeng', '0', '/', '{"treeName":"","treeParentCode":"","treeCode":""}', 'admin', '2019-08-30 13:40:31', '', '2019-08-30 13:44:56', '');

-- 导出  表 supply_shop.gen_table_column 结构
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE IF NOT EXISTS `gen_table_column` (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典类型',
  `sort` int DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=223 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='代码生成业务表字段';

-- 正在导出表  supply_shop.gen_table_column 的数据：~222 rows (大约)
DELETE FROM `gen_table_column`;
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`, `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`, `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES
	(1, '1', 'id', 'null', 'bigint(20) unsigned', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2019-08-22 09:59:25', NULL, '2019-08-22 11:04:52'),
	(2, '1', 'pid', '上级分类编号', 'bigint(20) unsigned', 'Long', 'pid', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2019-08-22 09:59:25', NULL, '2019-08-22 11:04:52'),
	(3, '1', 'brand_id', '品牌ID', 'bigint(20)', 'Long', 'brandId', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 3, 'admin', '2019-08-22 09:59:25', NULL, '2019-08-22 11:04:52'),
	(4, '1', 'cate_title', '商品分类名称', 'varchar(255)', 'String', 'cateTitle', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2019-08-22 09:59:25', NULL, '2019-08-22 11:04:52'),
	(5, '1', 'cate_desc', '商品描述', 'text', 'String', 'cateDesc', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 5, 'admin', '2019-08-22 09:59:25', NULL, '2019-08-22 11:04:52'),
	(6, '1', 'img_url', '缩略图url', 'varchar(200)', 'String', 'imgUrl', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 6, 'admin', '2019-08-22 09:59:25', NULL, '2019-08-22 11:04:52'),
	(7, '1', 'sort', '商品分类排序', 'bigint(20) unsigned', 'Long', 'sort', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 7, 'admin', '2019-08-22 09:59:25', NULL, '2019-08-22 11:04:52'),
	(8, '1', 'status', '分类状态', 'bigint(1) unsigned', 'Integer', 'status', '0', '0', NULL, NULL, NULL, '1', NULL, 'EQ', 'radio', '', 8, 'admin', '2019-08-22 09:59:25', NULL, '2019-08-22 11:04:52'),
	(9, '1', 'is_deleted', '删除状态(1删除,0未删除)', 'bigint(1) unsigned', 'Integer', 'isDeleted', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 9, 'admin', '2019-08-22 09:59:25', NULL, '2019-08-22 11:04:52'),
	(10, '1', 'create_at', '创建时间', 'timestamp', 'Date', 'createAt', '0', '0', NULL, NULL, NULL, '1', NULL, 'EQ', 'datetime', '', 10, 'admin', '2019-08-22 09:59:25', NULL, '2019-08-22 11:04:52'),
	(11, '2', 'id', 'null', 'int(11) unsigned', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2019-08-23 18:21:25', NULL, '2019-08-23 18:24:11'),
	(12, '2', 'brand_logo', '品牌logo', 'varchar(1024)', 'String', 'brandLogo', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'textarea', '', 2, 'admin', '2019-08-23 18:21:25', NULL, '2019-08-23 18:24:11'),
	(13, '2', 'brand_cover', '品牌封面', 'varchar(1024)', 'String', 'brandCover', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'textarea', '', 3, 'admin', '2019-08-23 18:21:25', NULL, '2019-08-23 18:24:11'),
	(14, '2', 'brand_title', '商品品牌名称', 'varchar(255)', 'String', 'brandTitle', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2019-08-23 18:21:25', NULL, '2019-08-23 18:24:11'),
	(15, '2', 'brand_desc', '商品品牌描述', 'text', 'String', 'brandDesc', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 5, 'admin', '2019-08-23 18:21:25', NULL, '2019-08-23 18:24:11'),
	(16, '2', 'brand_detail', '品牌图文信息', 'text', 'String', 'brandDetail', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 6, 'admin', '2019-08-23 18:21:25', NULL, '2019-08-23 18:24:11'),
	(17, '2', 'sort', '商品分类排序', 'int(11) unsigned', 'Long', 'sort', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 7, 'admin', '2019-08-23 18:21:25', NULL, '2019-08-23 18:24:11'),
	(18, '2', 'status', '商品状态', 'tinyint(1) unsigned', 'Integer', 'status', '0', '0', NULL, NULL, NULL, '1', NULL, 'EQ', 'radio', '', 8, 'admin', '2019-08-23 18:21:25', NULL, '2019-08-23 18:24:11'),
	(19, '2', 'is_deleted', '删除状态(1删除,0未删除)', 'tinyint(1) unsigned', 'Integer', 'isDeleted', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 9, 'admin', '2019-08-23 18:21:25', NULL, '2019-08-23 18:24:11'),
	(20, '2', 'create_at', '创建时间', 'timestamp', 'Date', 'createAt', '0', '0', NULL, NULL, NULL, '1', NULL, 'EQ', 'datetime', '', 10, 'admin', '2019-08-23 18:21:25', NULL, '2019-08-23 18:24:11'),
	(21, '3', 'id', 'id自增', 'smallint(5) unsigned', 'Integer', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2019-08-24 14:16:00', NULL, '2019-08-24 14:16:23'),
	(22, '3', 'name', '类型名称', 'varchar(60)', 'String', 'name', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2019-08-24 14:16:00', NULL, '2019-08-24 14:16:23'),
	(23, '4', 'attr_id', '属性id', 'int(11) unsigned', 'Long', 'attrId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2019-08-24 14:44:41', NULL, '2019-08-24 14:47:04'),
	(24, '4', 'attr_name', '属性名称', 'varchar(60)', 'String', 'attrName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2019-08-24 14:44:41', NULL, '2019-08-24 14:47:04'),
	(25, '4', 'type_id', '属性分类id(商品模型id)', 'smallint(5) unsigned', 'Integer', 'typeId', '0', '0', '1', '1', '1', '1', NULL, 'EQ', 'input', '', 3, 'admin', '2019-08-24 14:44:41', NULL, '2019-08-24 14:47:04'),
	(26, '4', 'attr_index', '0不需要检索 1关键字检索 2范围检索', 'tinyint(1) unsigned', 'Integer', 'attrIndex', '0', '0', '1', NULL, NULL, NULL, NULL, 'EQ', 'input', '', 4, 'admin', '2019-08-24 14:44:41', NULL, '2019-08-24 14:47:04'),
	(27, '4', 'attr_type', '0唯一属性 1单选属性 2复选属性', 'tinyint(1) unsigned', 'Integer', 'attrType', '0', '0', '1', NULL, NULL, NULL, NULL, 'EQ', 'select', '', 5, 'admin', '2019-08-24 14:44:41', NULL, '2019-08-24 14:47:04'),
	(28, '4', 'attr_input_type', '0 手工录入 1从列表中选择 2多行文本框', 'tinyint(1) unsigned', 'Integer', 'attrInputType', '0', '0', '1', NULL, NULL, NULL, NULL, 'EQ', 'select', '', 6, 'admin', '2019-08-24 14:44:41', NULL, '2019-08-24 14:47:04'),
	(29, '4', 'attr_values', '可选值列表', 'text', 'String', 'attrValues', '0', '0', '1', NULL, NULL, NULL, NULL, 'EQ', 'input', '', 7, 'admin', '2019-08-24 14:44:41', NULL, '2019-08-24 14:47:04'),
	(30, '4', 'sort', '属性排序', 'tinyint(3) unsigned', 'Integer', 'sort', '0', '0', '1', NULL, NULL, NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2019-08-24 14:44:41', NULL, '2019-08-24 14:47:04'),
	(31, '5', 'id', '规格表', 'int(11)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2019-08-25 09:40:12', NULL, '2019-08-25 09:45:36'),
	(32, '5', 'type_id', '规格类型', 'int(11)', 'Long', 'typeId', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'select', '', 2, 'admin', '2019-08-25 09:40:12', NULL, '2019-08-25 09:45:36'),
	(33, '5', 'name', '规格名称', 'varchar(55)', 'String', 'name', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2019-08-25 09:40:12', NULL, '2019-08-25 09:45:36'),
	(34, '5', 'sort', '排序', 'int(11)', 'Long', 'sort', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 4, 'admin', '2019-08-25 09:40:12', NULL, '2019-08-25 09:45:36'),
	(35, '5', 'search_index', '是否需要检索：1是，0否', 'tinyint(1)', 'Integer', 'searchIndex', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 5, 'admin', '2019-08-25 09:40:12', NULL, '2019-08-25 09:45:36'),
	(36, '6', 'item_id', '规格商品id', 'bigint(20) unsigned', 'Long', 'itemId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2019-08-25 09:40:12', '', NULL),
	(37, '6', 'goods_id', '商品id', 'int(11)', 'Long', 'goodsId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2019-08-25 09:40:12', '', NULL),
	(38, '6', 'key', '规格键名', 'varchar(255)', 'String', 'key', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2019-08-25 09:40:12', '', NULL),
	(39, '6', 'key_name', '规格键名中文', 'varchar(255)', 'String', 'keyName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 4, 'admin', '2019-08-25 09:40:12', '', NULL),
	(40, '6', 'price', '价格(供货价格)', 'decimal(10,2)', 'Double', 'price', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2019-08-25 09:40:12', '', NULL),
	(41, '6', 'market_price', '零售价格', 'double(10,2) unsigned', 'Double', 'marketPrice', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2019-08-25 09:40:12', '', NULL),
	(42, '6', 'store_count', '库存数量', 'int(11) unsigned', 'Long', 'storeCount', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2019-08-25 09:40:12', '', NULL),
	(43, '6', 'bar_code', '商品条形码', 'varchar(32)', 'String', 'barCode', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2019-08-25 09:40:12', '', NULL),
	(44, '6', 'sku', 'SKU', 'varchar(128)', 'String', 'sku', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2019-08-25 09:40:12', '', NULL),
	(45, '6', 'spec_img', '规格商品主图', 'varchar(255)', 'String', 'specImg', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2019-08-25 09:40:12', '', NULL),
	(46, '6', 'prom_id', '活动id', 'int(10)', 'Integer', 'promId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2019-08-25 09:40:12', '', NULL),
	(47, '6', 'prom_type', '参加活动类型', 'tinyint(2)', 'Integer', 'promType', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 12, 'admin', '2019-08-25 09:40:12', '', NULL),
	(48, '7', 'id', '规格项id', 'int(11)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2019-08-25 09:40:12', '', NULL),
	(49, '7', 'spec_id', '规格id', 'int(11)', 'Long', 'specId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2019-08-25 09:40:12', '', NULL),
	(50, '7', 'item', '规格项', 'varchar(54)', 'String', 'item', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2019-08-25 09:40:12', '', NULL),
	(51, '8', 'goods_id', '商品id', 'mediumint(8) unsigned', 'Integer', 'goodsId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2019-08-25 14:00:15', NULL, '2019-08-25 14:14:00'),
	(52, '8', 'cate_id', '分类id', 'int(11) unsigned', 'Long', 'cateId', '0', '0', '1', '1', '1', '1', NULL, 'EQ', 'select', '', 2, 'admin', '2019-08-25 14:00:15', NULL, '2019-08-25 14:14:00'),
	(53, '8', 'extend_cat_id', '扩展分类id', 'int(11)', 'Long', 'extendCatId', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 3, 'admin', '2019-08-25 14:00:15', NULL, '2019-08-25 14:14:00'),
	(54, '8', 'goods_sn', '商品编号', 'varchar(60)', 'String', 'goodsSn', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2019-08-25 14:00:15', NULL, '2019-08-25 14:14:00'),
	(55, '8', 'goods_name', '商品名称', 'varchar(120)', 'String', 'goodsName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 5, 'admin', '2019-08-25 14:00:15', NULL, '2019-08-25 14:14:00'),
	(56, '8', 'click_count', '点击数', 'int(10) unsigned', 'Integer', 'clickCount', '0', '0', '1', NULL, NULL, NULL, NULL, 'EQ', 'input', '', 6, 'admin', '2019-08-25 14:00:15', NULL, '2019-08-25 14:14:00'),
	(57, '8', 'brand_id', '品牌id', 'smallint(5) unsigned', 'Integer', 'brandId', '0', '0', '1', '1', '1', '1', NULL, 'EQ', 'select', '', 7, 'admin', '2019-08-25 14:00:15', NULL, '2019-08-25 14:14:00'),
	(58, '8', 'store_count', '库存数量', 'smallint(5)', 'Integer', 'storeCount', '0', '0', '1', NULL, NULL, '1', NULL, 'EQ', 'input', '', 8, 'admin', '2019-08-25 14:00:15', NULL, '2019-08-25 14:14:00'),
	(59, '8', 'comment_count', '商品评论数', 'smallint(5)', 'Integer', 'commentCount', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 9, 'admin', '2019-08-25 14:00:15', NULL, '2019-08-25 14:14:00'),
	(60, '8', 'weight', '商品重量克为单位', 'int(11) unsigned', 'Long', 'weight', '0', '0', '1', NULL, NULL, NULL, NULL, 'EQ', 'input', '', 10, 'admin', '2019-08-25 14:00:15', NULL, '2019-08-25 14:14:00'),
	(61, '8', 'volume', '商品体积。单位立方米', 'double(10,4) unsigned', 'Double', 'volume', '0', '0', '1', NULL, NULL, NULL, NULL, 'EQ', 'input', '', 11, 'admin', '2019-08-25 14:00:15', NULL, '2019-08-25 14:14:00'),
	(62, '8', 'market_price', '市场价(零售价)', 'decimal(10,2) unsigned', 'Double', 'marketPrice', '0', '0', '1', '1', '1', '1', NULL, 'EQ', 'input', '', 12, 'admin', '2019-08-25 14:00:15', NULL, '2019-08-25 14:14:00'),
	(63, '8', 'shop_price', '本店价(供货价)', 'decimal(10,2) unsigned', 'Double', 'shopPrice', '0', '0', '1', '1', '1', '1', NULL, 'EQ', 'input', '', 13, 'admin', '2019-08-25 14:00:15', NULL, '2019-08-25 14:14:00'),
	(64, '8', 'cost_price', '商品成本价', 'decimal(10,2)', 'Double', 'costPrice', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 14, 'admin', '2019-08-25 14:00:15', NULL, '2019-08-25 14:14:00'),
	(65, '8', 'price_ladder', '价格阶梯', 'text', 'String', 'priceLadder', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 15, 'admin', '2019-08-25 14:00:15', NULL, '2019-08-25 14:14:00'),
	(66, '8', 'keywords', '商品关键词', 'varchar(255)', 'String', 'keywords', '0', '0', '1', '1', '1', NULL, NULL, 'EQ', 'input', '', 16, 'admin', '2019-08-25 14:00:15', NULL, '2019-08-25 14:14:00'),
	(67, '8', 'goods_remark', '商品简单描述', 'varchar(255)', 'String', 'goodsRemark', '0', '0', '1', '1', '1', NULL, NULL, 'EQ', 'textarea', '', 17, 'admin', '2019-08-25 14:00:15', NULL, '2019-08-25 14:14:00'),
	(68, '8', 'goods_content', '商品详细描述', 'text', 'String', 'goodsContent', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'textarea', '', 18, 'admin', '2019-08-25 14:00:15', NULL, '2019-08-25 14:14:00'),
	(69, '8', 'mobile_content', '手机端商品详情', 'text', 'String', 'mobileContent', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 19, 'admin', '2019-08-25 14:00:15', NULL, '2019-08-25 14:14:00'),
	(70, '8', 'goods_logo', '商品上传原始图(主图)', 'varchar(255)', 'String', 'goodsLogo', '0', '0', '1', '1', '1', NULL, NULL, 'EQ', 'input', '', 20, 'admin', '2019-08-25 14:00:15', NULL, '2019-08-25 14:14:00'),
	(71, '8', 'is_virtual', '是否为虚拟商品 1是，0否', 'tinyint(3) unsigned', 'Integer', 'isVirtual', '0', '0', '1', NULL, NULL, NULL, NULL, 'EQ', 'input', '', 21, 'admin', '2019-08-25 14:00:15', NULL, '2019-08-25 14:14:00'),
	(72, '8', 'virtual_indate', '虚拟商品有效期', 'int(11)', 'Long', 'virtualIndate', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 22, 'admin', '2019-08-25 14:00:15', NULL, '2019-08-25 14:14:00'),
	(73, '8', 'virtual_limit', '虚拟商品购买上限', 'smallint(6)', 'Integer', 'virtualLimit', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 23, 'admin', '2019-08-25 14:00:15', NULL, '2019-08-25 14:14:00'),
	(74, '8', 'virtual_refund', '是否允许过期退款， 1是，0否', 'tinyint(1)', 'Integer', 'virtualRefund', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 24, 'admin', '2019-08-25 14:00:15', NULL, '2019-08-25 14:14:00'),
	(75, '8', 'is_on_sale', '是否上架 0-未上架 1-销售中', 'tinyint(1) unsigned', 'Integer', 'isOnSale', '0', '0', '1', NULL, NULL, '1', NULL, 'EQ', 'input', '', 25, 'admin', '2019-08-25 14:00:15', NULL, '2019-08-25 14:14:00'),
	(76, '8', 'is_free_shipping', '是否包邮0否1是', 'tinyint(1) unsigned', 'Integer', 'isFreeShipping', '0', '0', '1', NULL, NULL, NULL, NULL, 'EQ', 'input', '', 26, 'admin', '2019-08-25 14:00:15', NULL, '2019-08-25 14:14:00'),
	(77, '8', 'on_time', '商品上架时间', 'int(10) unsigned', 'Integer', 'onTime', '0', '0', '1', NULL, NULL, NULL, NULL, 'EQ', 'input', '', 27, 'admin', '2019-08-25 14:00:15', NULL, '2019-08-25 14:14:00'),
	(78, '8', 'sort', '商品排序', 'smallint(4) unsigned', 'Integer', 'sort', '0', '0', '1', '1', '1', '1', NULL, 'EQ', 'input', '', 28, 'admin', '2019-08-25 14:00:15', NULL, '2019-08-25 14:14:00'),
	(79, '8', 'is_recommend', '是否推荐0-未推荐 1-已推荐', 'tinyint(1) unsigned', 'Integer', 'isRecommend', '0', '0', '1', NULL, NULL, '1', NULL, 'EQ', 'input', '', 29, 'admin', '2019-08-25 14:00:15', NULL, '2019-08-25 14:14:00'),
	(80, '8', 'is_new', '是否新品0-不是 1-是', 'tinyint(1) unsigned', 'Integer', 'isNew', '0', '0', '1', NULL, NULL, '1', NULL, 'EQ', 'input', '', 30, 'admin', '2019-08-25 14:00:15', NULL, '2019-08-25 14:14:00'),
	(81, '8', 'is_hot', '是否热卖', 'tinyint(1)', 'Integer', 'isHot', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 31, 'admin', '2019-08-25 14:00:15', NULL, '2019-08-25 14:14:00'),
	(82, '8', 'last_update', '最后更新时间', 'int(10) unsigned', 'Integer', 'lastUpdate', '0', '0', '1', NULL, NULL, NULL, NULL, 'EQ', 'input', '', 32, 'admin', '2019-08-25 14:00:15', NULL, '2019-08-25 14:14:00'),
	(83, '8', 'goods_type', '商品所属类型id，取值表goods_type的id', 'smallint(5) unsigned', 'Integer', 'goodsType', '0', '0', '1', NULL, NULL, NULL, NULL, 'EQ', 'select', '', 33, 'admin', '2019-08-25 14:00:15', NULL, '2019-08-25 14:14:00'),
	(84, '8', 'spec_type', '商品规格类型，取值表goods_type的id', 'smallint(5)', 'Integer', 'specType', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'select', '', 34, 'admin', '2019-08-25 14:00:15', NULL, '2019-08-25 14:14:00'),
	(85, '8', 'give_integral', '购买商品赠送积分', 'mediumint(8) unsigned', 'Integer', 'giveIntegral', '0', '0', '1', NULL, NULL, NULL, NULL, 'EQ', 'input', '', 35, 'admin', '2019-08-25 14:00:15', NULL, '2019-08-25 14:14:00'),
	(86, '8', 'exchange_integral', '积分兑换：0不参与积分兑换，积分和现金的兑换比例见后台配置', 'int(10)', 'Integer', 'exchangeIntegral', '0', '0', '1', NULL, NULL, NULL, NULL, 'EQ', 'input', '', 36, 'admin', '2019-08-25 14:00:15', NULL, '2019-08-25 14:14:00'),
	(87, '8', 'suppliers_id', '供货商ID', 'smallint(5) unsigned', 'Integer', 'suppliersId', '0', '0', '1', NULL, NULL, NULL, NULL, 'EQ', 'input', '', 37, 'admin', '2019-08-25 14:00:15', NULL, '2019-08-25 14:14:00'),
	(88, '8', 'sales_sum', '商品销量', 'int(11)', 'Long', 'salesSum', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 38, 'admin', '2019-08-25 14:00:15', NULL, '2019-08-25 14:14:00'),
	(89, '8', 'prom_type', '0默认1抢购2团购3优惠促销4预售5虚拟(5其实没用)6拼团', 'tinyint(1)', 'Integer', 'promType', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'select', '', 39, 'admin', '2019-08-25 14:00:15', NULL, '2019-08-25 14:14:00'),
	(90, '8', 'prom_id', '优惠活动id', 'int(11)', 'Long', 'promId', '0', '0', '1', NULL, NULL, NULL, NULL, 'EQ', 'input', '', 40, 'admin', '2019-08-25 14:00:15', NULL, '2019-08-25 14:14:00'),
	(91, '8', 'commission', '佣金用于分销分成', 'decimal(10,2)', 'Double', 'commission', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 41, 'admin', '2019-08-25 14:00:15', NULL, '2019-08-25 14:14:00'),
	(92, '8', 'spu', 'SPU', 'varchar(128)', 'String', 'spu', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 42, 'admin', '2019-08-25 14:00:15', NULL, '2019-08-25 14:14:00'),
	(93, '8', 'sku', 'SKU', 'varchar(128)', 'String', 'sku', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 43, 'admin', '2019-08-25 14:00:15', NULL, '2019-08-25 14:14:00'),
	(94, '8', 'template_id', '运费模板ID', 'int(11) unsigned', 'Long', 'templateId', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 44, 'admin', '2019-08-25 14:00:15', NULL, '2019-08-25 14:14:00'),
	(95, '8', 'goods_video', '视频', 'varchar(255)', 'String', 'goodsVideo', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 45, 'admin', '2019-08-25 14:00:15', NULL, '2019-08-25 14:14:00'),
	(96, '9', 'goods_attr_id', '商品属性id自增', 'int(10) unsigned', 'Integer', 'goodsAttrId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2019-08-26 13:38:54', '', NULL),
	(97, '9', 'goods_id', '商品id', 'mediumint(8) unsigned', 'Integer', 'goodsId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2019-08-26 13:38:54', '', NULL),
	(98, '9', 'attr_id', '属性id', 'smallint(5) unsigned', 'Integer', 'attrId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2019-08-26 13:38:54', '', NULL),
	(99, '9', 'attr_value', '属性值', 'text', 'String', 'attrValue', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2019-08-26 13:38:54', '', NULL),
	(100, '9', 'attr_price', '属性价格', 'varchar(255)', 'String', 'attrPrice', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2019-08-26 13:38:54', '', NULL),
	(101, '10', 'id', '表id', 'int(8)', 'Integer', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2019-08-29 19:16:19', NULL, '2019-08-29 19:22:06'),
	(102, '10', 'name', '优惠券名字', 'varchar(50)', 'String', 'name', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2019-08-29 19:16:19', NULL, '2019-08-29 19:22:06'),
	(103, '10', 'type', '发放类型 0下单赠送1 指定发放 2 免费领取 3线下发放', 'tinyint(1) unsigned', 'Integer', 'type', '0', '0', '1', NULL, NULL, NULL, NULL, 'EQ', 'select', '', 3, 'admin', '2019-08-29 19:16:19', NULL, '2019-08-29 19:22:06'),
	(104, '10', 'money', '优惠券金额', 'decimal(10,2)', 'Double', 'money', '0', '0', '1', '1', '1', '1', NULL, 'EQ', 'input', '', 4, 'admin', '2019-08-29 19:16:19', NULL, '2019-08-29 19:22:06'),
	(105, '10', 'condition', '使用条件，满多少金额', 'decimal(10,2)', 'Double', 'condition', '0', '0', '1', '1', '1', '1', NULL, 'EQ', 'input', '', 5, 'admin', '2019-08-29 19:16:19', NULL, '2019-08-29 19:22:06'),
	(106, '10', 'createnum', '发放数量', 'int(11)', 'Long', 'createnum', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 6, 'admin', '2019-08-29 19:16:19', NULL, '2019-08-29 19:22:06'),
	(107, '10', 'send_num', '已领取数量', 'int(11)', 'Long', 'sendNum', '0', '0', NULL, NULL, NULL, '1', NULL, 'EQ', 'input', '', 7, 'admin', '2019-08-29 19:16:19', NULL, '2019-08-29 19:22:06'),
	(108, '10', 'use_num', '已使用数量', 'int(11)', 'Long', 'useNum', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2019-08-29 19:16:19', NULL, '2019-08-29 19:22:06'),
	(109, '10', 'send_start_time', '发放开始时间', 'int(11)', 'Long', 'sendStartTime', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 9, 'admin', '2019-08-29 19:16:19', NULL, '2019-08-29 19:22:06'),
	(110, '10', 'send_end_time', '发放结束时间', 'int(11)', 'Long', 'sendEndTime', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 10, 'admin', '2019-08-29 19:16:19', NULL, '2019-08-29 19:22:06'),
	(111, '10', 'use_start_time', '使用开始时间', 'int(11)', 'Long', 'useStartTime', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'datetime', '', 11, 'admin', '2019-08-29 19:16:19', NULL, '2019-08-29 19:22:06'),
	(112, '10', 'use_end_time', '使用结束时间', 'int(11)', 'Long', 'useEndTime', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'datetime', '', 12, 'admin', '2019-08-29 19:16:19', NULL, '2019-08-29 19:22:06'),
	(113, '10', 'add_time', '添加时间', 'int(11)', 'Long', 'addTime', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 13, 'admin', '2019-08-29 19:16:19', NULL, '2019-08-29 19:22:06'),
	(114, '10', 'status', '状态：1有效,2无效', 'int(2)', 'Integer', 'status', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'radio', '', 14, 'admin', '2019-08-29 19:16:19', NULL, '2019-08-29 19:22:06'),
	(115, '10', 'use_type', '使用范围：0全店通用1指定商品可用2指定分类商品可用', 'tinyint(1)', 'Integer', 'useType', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'select', '', 15, 'admin', '2019-08-29 19:16:19', NULL, '2019-08-29 19:22:06'),
	(116, '11', 'id', '表id', 'int(8)', 'Integer', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2019-08-29 19:16:19', '', NULL),
	(117, '11', 'cid', '优惠券 对应coupon表id', 'int(8)', 'Integer', 'cid', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2019-08-29 19:16:19', '', NULL),
	(118, '11', 'type', '发放类型 1 按订单发放 2 注册 3 邀请 4 按用户发放', 'tinyint(1) unsigned', 'Integer', 'type', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', '', 3, 'admin', '2019-08-29 19:16:19', '', NULL),
	(119, '11', 'uid', '用户id', 'int(8)', 'Integer', 'uid', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2019-08-29 19:16:19', '', NULL),
	(120, '11', 'order_id', '订单id', 'int(8)', 'Integer', 'orderId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2019-08-29 19:16:19', '', NULL),
	(121, '11', 'get_order_id', '优惠券来自订单ID', 'int(11)', 'Long', 'getOrderId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2019-08-29 19:16:19', '', NULL),
	(122, '11', 'use_time', '使用时间', 'int(11)', 'Long', 'useTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2019-08-29 19:16:19', '', NULL),
	(123, '11', 'code', '优惠券兑换码', 'varchar(10)', 'String', 'code', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2019-08-29 19:16:19', '', NULL),
	(124, '11', 'send_time', '发放时间', 'int(11)', 'Long', 'sendTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2019-08-29 19:16:19', '', NULL),
	(125, '11', 'status', '0未使用1已使用2已过期', 'tinyint(1)', 'Integer', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 10, 'admin', '2019-08-29 19:16:19', '', NULL),
	(126, '12', 'order_id', '订单id', 'mediumint(8) unsigned', 'Integer', 'orderId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2019-08-29 19:45:09', NULL, '2019-08-29 19:53:53'),
	(127, '12', 'order_sn', '订单编号', 'varchar(20)', 'String', 'orderSn', '0', '0', '1', NULL, NULL, '1', '1', 'EQ', 'input', '', 2, 'admin', '2019-08-29 19:45:09', NULL, '2019-08-29 19:53:53'),
	(128, '12', 'user_id', '用户id', 'mediumint(8) unsigned', 'Integer', 'userId', '0', '0', '1', '1', '1', '1', NULL, 'EQ', 'input', '', 3, 'admin', '2019-08-29 19:45:09', NULL, '2019-08-29 19:53:53'),
	(129, '12', 'order_status', '订单状态 0-未确认 1-已确认(已收货） 2-已评价', 'tinyint(1) unsigned', 'Integer', 'orderStatus', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', '', 4, 'admin', '2019-08-29 19:45:10', NULL, '2019-08-29 19:53:53'),
	(130, '12', 'shipping_status', '发货状态 0-未发货 1-已发货 2-退货中 3-退货完成', 'tinyint(1) unsigned', 'Integer', 'shippingStatus', '0', '0', '1', '1', '1', '1', NULL, 'EQ', 'radio', '', 5, 'admin', '2019-08-29 19:45:10', NULL, '2019-08-29 19:53:53'),
	(131, '12', 'pay_status', '支付状态 0-未支付 1-已支付', 'tinyint(1) unsigned', 'Integer', 'payStatus', '0', '0', '1', '1', '1', '1', NULL, 'EQ', 'radio', '', 6, 'admin', '2019-08-29 19:45:10', NULL, '2019-08-29 19:53:53'),
	(132, '12', 'consignee', '收货人', 'varchar(60)', 'String', 'consignee', '0', '0', '1', '1', '1', '1', NULL, 'EQ', 'input', '', 7, 'admin', '2019-08-29 19:45:10', NULL, '2019-08-29 19:53:53'),
	(133, '12', 'country', '国家', 'int(11) unsigned', 'Long', 'country', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 8, 'admin', '2019-08-29 19:45:10', NULL, '2019-08-29 19:53:53'),
	(134, '12', 'province', '省份', 'int(11) unsigned', 'Long', 'province', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 9, 'admin', '2019-08-29 19:45:10', NULL, '2019-08-29 19:53:53'),
	(135, '12', 'city', '城市', 'int(11) unsigned', 'Long', 'city', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 10, 'admin', '2019-08-29 19:45:10', NULL, '2019-08-29 19:53:53'),
	(136, '12', 'district', '县区', 'int(11) unsigned', 'Long', 'district', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 11, 'admin', '2019-08-29 19:45:10', NULL, '2019-08-29 19:53:53'),
	(137, '12', 'twon', '乡镇', 'int(11)', 'Long', 'twon', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 12, 'admin', '2019-08-29 19:45:10', NULL, '2019-08-29 19:53:53'),
	(138, '12', 'city_info', '地区地址', 'varchar(200)', 'String', 'cityInfo', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 13, 'admin', '2019-08-29 19:45:10', NULL, '2019-08-29 19:53:53'),
	(139, '12', 'address', '地址详细地址', 'varchar(255)', 'String', 'address', '0', '0', '1', '1', '1', '1', NULL, 'EQ', 'input', '', 14, 'admin', '2019-08-29 19:45:10', NULL, '2019-08-29 19:53:53'),
	(140, '12', 'zipcode', '邮政编码', 'varchar(60)', 'String', 'zipcode', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 15, 'admin', '2019-08-29 19:45:10', NULL, '2019-08-29 19:53:53'),
	(141, '12', 'mobile', '手机', 'varchar(60)', 'String', 'mobile', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 16, 'admin', '2019-08-29 19:45:10', NULL, '2019-08-29 19:53:53'),
	(142, '12', 'email', '邮件', 'varchar(60)', 'String', 'email', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 17, 'admin', '2019-08-29 19:45:10', NULL, '2019-08-29 19:53:53'),
	(143, '12', 'receive_type', '收货方式 1-物流 2-快递 3-自取', 'tinyint(1) unsigned', 'Integer', 'receiveType', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'select', '', 18, 'admin', '2019-08-29 19:45:10', NULL, '2019-08-29 19:53:53'),
	(144, '12', 'shipping_code', '物流code 单号', 'varchar(32)', 'String', 'shippingCode', '0', '0', NULL, '1', '1', NULL, '1', 'EQ', 'input', '', 19, 'admin', '2019-08-29 19:45:10', NULL, '2019-08-29 19:53:53'),
	(145, '12', 'shipping_name', '物流名称', 'varchar(120)', 'String', 'shippingName', '0', '0', NULL, '1', '1', NULL, '1', 'LIKE', 'input', '', 20, 'admin', '2019-08-29 19:45:10', NULL, '2019-08-29 19:53:53'),
	(146, '12', 'pay_code', '支付code', 'varchar(32)', 'String', 'payCode', '0', '0', '1', NULL, NULL, NULL, NULL, 'EQ', 'input', '', 21, 'admin', '2019-08-29 19:45:10', NULL, '2019-08-29 19:53:53'),
	(147, '12', 'pay_method', '支付方式1-微信2-余额3-转账', 'tinyint(1) unsigned', 'Integer', 'payMethod', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 22, 'admin', '2019-08-29 19:45:10', NULL, '2019-08-29 19:53:53'),
	(148, '12', 'recharge_id', '支付方式为转账的转账id', 'int(10) unsigned', 'Integer', 'rechargeId', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 23, 'admin', '2019-08-29 19:45:10', NULL, '2019-08-29 19:53:53'),
	(149, '12', 'pay_name', '支付方式名称', 'varchar(120)', 'String', 'payName', '0', '0', '1', NULL, NULL, NULL, NULL, 'LIKE', 'input', '', 24, 'admin', '2019-08-29 19:45:10', NULL, '2019-08-29 19:53:53'),
	(150, '12', 'invoice_title', '发票抬头', 'varchar(256)', 'String', 'invoiceTitle', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 25, 'admin', '2019-08-29 19:45:10', NULL, '2019-08-29 19:53:53'),
	(151, '12', 'taxpayer', '纳税人识别号', 'varchar(30)', 'String', 'taxpayer', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 26, 'admin', '2019-08-29 19:45:10', NULL, '2019-08-29 19:53:53'),
	(152, '12', 'goods_price', '商品总价', 'decimal(10,2)', 'Double', 'goodsPrice', '0', '0', '1', '1', '1', '1', NULL, 'EQ', 'input', '', 27, 'admin', '2019-08-29 19:45:10', NULL, '2019-08-29 19:53:53'),
	(153, '12', 'shipping_price', '邮费', 'decimal(10,2)', 'Double', 'shippingPrice', '0', '0', '1', NULL, NULL, NULL, NULL, 'EQ', 'input', '', 28, 'admin', '2019-08-29 19:45:10', NULL, '2019-08-29 19:53:53'),
	(154, '12', 'user_money', '使用余额', 'decimal(10,2)', 'Double', 'userMoney', '0', '0', '1', NULL, NULL, NULL, NULL, 'EQ', 'input', '', 29, 'admin', '2019-08-29 19:45:10', NULL, '2019-08-29 19:53:53'),
	(155, '12', 'coupon_price', '优惠券抵扣', 'decimal(10,2)', 'Double', 'couponPrice', '0', '0', NULL, NULL, NULL, '1', '1', 'EQ', 'input', '', 30, 'admin', '2019-08-29 19:45:10', NULL, '2019-08-29 19:53:53'),
	(156, '12', 'integral', '使用积分', 'int(10) unsigned', 'Integer', 'integral', '0', '0', '1', NULL, NULL, NULL, NULL, 'EQ', 'input', '', 31, 'admin', '2019-08-29 19:45:10', NULL, '2019-08-29 19:53:53'),
	(157, '12', 'integral_money', '使用积分抵多少钱', 'decimal(10,2)', 'Double', 'integralMoney', '0', '0', '1', NULL, NULL, NULL, NULL, 'EQ', 'input', '', 32, 'admin', '2019-08-29 19:45:10', NULL, '2019-08-29 19:53:53'),
	(158, '12', 'order_amount', '应付款金额', 'decimal(10,2)', 'Double', 'orderAmount', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 33, 'admin', '2019-08-29 19:45:10', NULL, '2019-08-29 19:53:53'),
	(159, '12', 'total_amount', '订单总价', 'decimal(10,2)', 'Double', 'totalAmount', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 34, 'admin', '2019-08-29 19:45:10', NULL, '2019-08-29 19:53:53'),
	(160, '12', 'add_time', '下单时间', 'int(10) unsigned', 'Integer', 'addTime', '0', '0', '1', NULL, NULL, '1', NULL, 'EQ', 'input', '', 35, 'admin', '2019-08-29 19:45:10', NULL, '2019-08-29 19:53:53'),
	(161, '12', 'shipping_time', '最后新发货时间', 'int(11)', 'Long', 'shippingTime', '0', '0', NULL, NULL, NULL, '1', NULL, 'EQ', 'input', '', 36, 'admin', '2019-08-29 19:45:10', NULL, '2019-08-29 19:53:53'),
	(162, '12', 'confirm_time', '收货确认时间', 'int(10)', 'Integer', 'confirmTime', '0', '0', NULL, NULL, NULL, '1', NULL, 'EQ', 'input', '', 37, 'admin', '2019-08-29 19:45:10', NULL, '2019-08-29 19:53:53'),
	(163, '12', 'pay_time', '支付时间', 'int(10) unsigned', 'Integer', 'payTime', '0', '0', '1', NULL, NULL, '1', NULL, 'EQ', 'input', '', 38, 'admin', '2019-08-29 19:45:10', NULL, '2019-08-29 19:53:53'),
	(164, '12', 'transaction_id', '第三方平台交易流水号', 'varchar(255)', 'String', 'transactionId', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 39, 'admin', '2019-08-29 19:45:10', NULL, '2019-08-29 19:53:53'),
	(165, '12', 'prom_id', '活动ID', 'int(11) unsigned', 'Long', 'promId', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 40, 'admin', '2019-08-29 19:45:10', NULL, '2019-08-29 19:53:53'),
	(166, '12', 'prom_type', '订单类型：0普通订单4预售订单5虚拟订单6拼团订单', 'tinyint(4) unsigned', 'Integer', 'promType', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'select', '', 41, 'admin', '2019-08-29 19:45:10', NULL, '2019-08-29 19:53:53'),
	(167, '12', 'order_prom_id', '活动id', 'smallint(6)', 'Integer', 'orderPromId', '0', '0', '1', NULL, NULL, NULL, NULL, 'EQ', 'input', '', 42, 'admin', '2019-08-29 19:45:10', NULL, '2019-08-29 19:53:53'),
	(168, '12', 'order_prom_amount', '活动优惠金额', 'decimal(10,2)', 'Double', 'orderPromAmount', '0', '0', '1', NULL, NULL, NULL, NULL, 'EQ', 'input', '', 43, 'admin', '2019-08-29 19:45:10', NULL, '2019-08-29 19:53:53'),
	(169, '12', 'discount', '价格调整', 'decimal(10,2)', 'Double', 'discount', '0', '0', '1', '1', '1', NULL, NULL, 'EQ', 'input', '', 44, 'admin', '2019-08-29 19:45:10', NULL, '2019-08-29 19:53:53'),
	(170, '12', 'user_note', '用户备注', 'varchar(255)', 'String', 'userNote', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 45, 'admin', '2019-08-29 19:45:10', NULL, '2019-08-29 19:53:53'),
	(171, '12', 'admin_note', '管理员备注', 'varchar(255)', 'String', 'adminNote', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 46, 'admin', '2019-08-29 19:45:10', NULL, '2019-08-29 19:53:53'),
	(172, '12', 'parent_sn', '父单单号', 'varchar(100)', 'String', 'parentSn', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 47, 'admin', '2019-08-29 19:45:10', NULL, '2019-08-29 19:53:53'),
	(173, '12', 'is_distribut', '是否已分成0未分成1已分成', 'tinyint(1)', 'Integer', 'isDistribut', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 48, 'admin', '2019-08-29 19:45:10', NULL, '2019-08-29 19:53:53'),
	(174, '12', 'paid_money', '订金', 'decimal(10,2)', 'Double', 'paidMoney', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 49, 'admin', '2019-08-29 19:45:10', NULL, '2019-08-29 19:53:53'),
	(175, '12', 'deleted_time', '删除|取消时间', 'int(11) unsigned', 'Long', 'deletedTime', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 50, 'admin', '2019-08-29 19:45:10', NULL, '2019-08-29 19:53:53'),
	(176, '12', 'deleted', '用户假删除标识,1:删除,0未删除', 'tinyint(1)', 'Integer', 'deleted', '0', '0', '1', NULL, NULL, NULL, NULL, 'EQ', 'input', '', 51, 'admin', '2019-08-29 19:45:10', NULL, '2019-08-29 19:53:53'),
	(177, '12', 'edit_money', '管理后台修改变动的价格', 'varchar(50)', 'String', 'editMoney', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 52, 'admin', '2019-08-29 19:45:10', NULL, '2019-08-29 19:53:53'),
	(178, '13', 'rec_id', '表id自增', 'mediumint(8) unsigned', 'Integer', 'recId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2019-08-29 19:45:10', '', NULL),
	(179, '13', 'order_id', '订单id', 'mediumint(8) unsigned', 'Integer', 'orderId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2019-08-29 19:45:10', '', NULL),
	(180, '13', 'goods_id', '商品id', 'mediumint(8) unsigned', 'Integer', 'goodsId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2019-08-29 19:45:10', '', NULL),
	(181, '13', 'goods_name', '商品名称', 'varchar(120)', 'String', 'goodsName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 4, 'admin', '2019-08-29 19:45:10', '', NULL),
	(182, '13', 'goods_sn', '商品货号', 'varchar(60)', 'String', 'goodsSn', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2019-08-29 19:45:10', '', NULL),
	(183, '13', 'goods_num', '购买数量', 'smallint(5) unsigned', 'Integer', 'goodsNum', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2019-08-29 19:45:10', '', NULL),
	(184, '13', 'market_price', '市场价', 'decimal(10,2) unsigned', 'Double', 'marketPrice', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2019-08-29 19:45:10', '', NULL),
	(185, '13', 'goods_price', '本店价(供货价)', 'decimal(10,2) unsigned', 'Double', 'goodsPrice', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2019-08-29 19:45:10', '', NULL),
	(186, '13', 'cost_price', '商品成本价', 'decimal(10,2)', 'Double', 'costPrice', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2019-08-29 19:45:10', '', NULL),
	(187, '13', 'member_goods_price', '会员折扣价', 'decimal(10,2)', 'Double', 'memberGoodsPrice', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2019-08-29 19:45:10', '', NULL),
	(188, '13', 'give_integral', '购买商品赠送积分', 'mediumint(8) unsigned', 'Integer', 'giveIntegral', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2019-08-29 19:45:10', '', NULL),
	(189, '13', 'spec_key', '商品规格key', 'varchar(128)', 'String', 'specKey', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 12, 'admin', '2019-08-29 19:45:10', '', NULL),
	(190, '13', 'spec_key_name', '规格对应的中文名字', 'varchar(128)', 'String', 'specKeyName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 13, 'admin', '2019-08-29 19:45:10', '', NULL),
	(191, '13', 'bar_code', '条码', 'varchar(64)', 'String', 'barCode', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 14, 'admin', '2019-08-29 19:45:10', '', NULL),
	(192, '13', 'is_comment', '是否评价', 'tinyint(1)', 'Integer', 'isComment', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 15, 'admin', '2019-08-29 19:45:10', '', NULL),
	(193, '13', 'prom_type', '0 普通订单,1 限时抢购, 2 团购 , 3 促销优惠,4预售', 'tinyint(1) unsigned', 'Integer', 'promType', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 16, 'admin', '2019-08-29 19:45:10', '', NULL),
	(194, '13', 'prom_id', '活动id', 'int(11) unsigned', 'Long', 'promId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 17, 'admin', '2019-08-29 19:45:10', '', NULL),
	(195, '13', 'is_send', '0未发货，1已发货，2已换货，3已退货', 'tinyint(1)', 'Integer', 'isSend', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 18, 'admin', '2019-08-29 19:45:10', '', NULL),
	(196, '13', 'delivery_id', '发货单ID', 'int(11)', 'Long', 'deliveryId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 19, 'admin', '2019-08-29 19:45:10', '', NULL),
	(197, '13', 'sku', 'sku', 'varchar(128)', 'String', 'sku', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 20, 'admin', '2019-08-29 19:45:10', '', NULL),
	(198, '14', 'id', NULL, 'int(10) unsigned', 'Integer', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2019-08-29 19:45:10', '', NULL),
	(199, '14', 'order_id', '订单id', 'int(10) unsigned', 'Integer', 'orderId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2019-08-29 19:45:10', '', NULL),
	(200, '14', 'goods_id', '商品id', 'int(10) unsigned', 'Integer', 'goodsId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2019-08-29 19:45:10', '', NULL),
	(201, '14', 'remark', '商品备注', 'varchar(255)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 4, 'admin', '2019-08-29 19:45:10', '', NULL),
	(202, '15', 'id', 'null', 'bigint(20) unsigned', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2019-08-30 13:40:31', NULL, '2019-08-30 13:44:56'),
	(203, '15', 'vip_no', 'vip编号', 'varchar(10)', 'String', 'vipNo', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 2, 'admin', '2019-08-30 13:40:31', NULL, '2019-08-30 13:44:56'),
	(204, '15', 'openid', '会员微信OPENID', 'varchar(100)', 'String', 'openid', '0', '0', NULL, NULL, NULL, NULL, '1', 'EQ', 'input', '', 3, 'admin', '2019-08-30 13:40:31', NULL, '2019-08-30 13:44:56'),
	(205, '15', 'phone', '会员手机号', 'varchar(16)', 'String', 'phone', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2019-08-30 13:40:31', NULL, '2019-08-30 13:44:56'),
	(206, '15', 'password', '登录密码', 'varchar(64)', 'String', 'password', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 5, 'admin', '2019-08-30 13:40:31', NULL, '2019-08-30 13:44:56'),
	(207, '15', 'nickname', '会员昵称', 'varchar(20)', 'String', 'nickname', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 6, 'admin', '2019-08-30 13:40:31', NULL, '2019-08-30 13:44:56'),
	(208, '15', 'headimg', '会员头像', 'varchar(500)', 'String', 'headimg', '0', '0', NULL, NULL, NULL, '1', NULL, 'EQ', 'textarea', '', 7, 'admin', '2019-08-30 13:40:31', NULL, '2019-08-30 13:44:56'),
	(209, '15', 'sex', '性别', 'char(2)', 'String', 'sex', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'select', '', 8, 'admin', '2019-08-30 13:40:31', NULL, '2019-08-30 13:44:56'),
	(210, '15', 'level', '会员级别', 'tinyint(2) unsigned', 'Integer', 'level', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2019-08-30 13:40:31', NULL, '2019-08-30 13:44:56'),
	(211, '15', 'total_amount', '消费累计额度 用于用户等级', 'decimal(10,2) unsigned', 'Double', 'totalAmount', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 10, 'admin', '2019-08-30 13:40:31', NULL, '2019-08-30 13:44:56'),
	(212, '15', 'user_money', '用户金额', 'decimal(8,2)', 'Double', 'userMoney', '0', '0', NULL, NULL, NULL, '1', NULL, 'EQ', 'input', '', 11, 'admin', '2019-08-30 13:40:31', NULL, '2019-08-30 13:44:56'),
	(213, '15', 'distribut_money', '累积分佣金额', 'decimal(8,2) unsigned', 'Double', 'distributMoney', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 12, 'admin', '2019-08-30 13:40:31', NULL, '2019-08-30 13:44:56'),
	(214, '15', 'frozen_money', '冻结金额', 'double(8,2) unsigned', 'Double', 'frozenMoney', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 13, 'admin', '2019-08-30 13:40:31', NULL, '2019-08-30 13:44:56'),
	(215, '15', 'underling_number', '用户下线总数', 'int(5) unsigned', 'Integer', 'underlingNumber', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 14, 'admin', '2019-08-30 13:40:31', NULL, '2019-08-30 13:44:56'),
	(216, '15', 'pay_points', '消费积分', 'int(8) unsigned', 'Integer', 'payPoints', '0', '0', NULL, NULL, NULL, '1', NULL, 'EQ', 'input', '', 15, 'admin', '2019-08-30 13:40:31', NULL, '2019-08-30 13:44:56'),
	(217, '15', 'address_id', '默认收货地址', 'int(10) unsigned', 'Integer', 'addressId', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 16, 'admin', '2019-08-30 13:40:31', NULL, '2019-08-30 13:44:56'),
	(218, '15', 'remark', '会员个性签名', 'varchar(500)', 'String', 'remark', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'textarea', '', 17, 'admin', '2019-08-30 13:40:31', NULL, '2019-08-30 13:44:56'),
	(219, '15', 'status', '会员状态0待审核 1-已审核 2-已拒绝', 'tinyint(1) unsigned', 'Integer', 'status', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'radio', '', 18, 'admin', '2019-08-30 13:40:31', NULL, '2019-08-30 13:44:56'),
	(220, '15', 'create_time', 'null', 'bigint(20) unsigned', 'Long', 'createTime', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 19, 'admin', '2019-08-30 13:40:31', NULL, '2019-08-30 13:44:56'),
	(221, '15', 'create_at', '创建时间', 'timestamp', 'Date', 'createAt', '0', '0', NULL, NULL, NULL, '1', NULL, 'EQ', 'datetime', '', 20, 'admin', '2019-08-30 13:40:31', NULL, '2019-08-30 13:44:56'),
	(222, '15', 'status_time', '审核时间', 'bigint(20) unsigned', 'Long', 'statusTime', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 21, 'admin', '2019-08-30 13:40:31', NULL, '2019-08-30 13:44:56');

-- 导出  表 supply_shop.qrtz_blob_triggers 结构
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE IF NOT EXISTS `qrtz_blob_triggers` (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `blob_data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- 正在导出表  supply_shop.qrtz_blob_triggers 的数据：~0 rows (大约)
DELETE FROM `qrtz_blob_triggers`;

-- 导出  表 supply_shop.qrtz_calendars 结构
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE IF NOT EXISTS `qrtz_calendars` (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `calendar` blob NOT NULL,
  PRIMARY KEY (`sched_name`,`calendar_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- 正在导出表  supply_shop.qrtz_calendars 的数据：~0 rows (大约)
DELETE FROM `qrtz_calendars`;

-- 导出  表 supply_shop.qrtz_cron_triggers 结构
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE IF NOT EXISTS `qrtz_cron_triggers` (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `cron_expression` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `time_zone_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- 正在导出表  supply_shop.qrtz_cron_triggers 的数据：~3 rows (大约)
DELETE FROM `qrtz_cron_triggers`;
INSERT INTO `qrtz_cron_triggers` (`sched_name`, `trigger_name`, `trigger_group`, `cron_expression`, `time_zone_id`) VALUES
	('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', '0/10 * * * * ?', 'Asia/Shanghai'),
	('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', '0/15 * * * * ?', 'Asia/Shanghai'),
	('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', '0/20 * * * * ?', 'Asia/Shanghai');

-- 导出  表 supply_shop.qrtz_fired_triggers 结构
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE IF NOT EXISTS `qrtz_fired_triggers` (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `entry_id` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `fired_time` bigint NOT NULL,
  `sched_time` bigint NOT NULL,
  `priority` int NOT NULL,
  `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`entry_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- 正在导出表  supply_shop.qrtz_fired_triggers 的数据：~0 rows (大约)
DELETE FROM `qrtz_fired_triggers`;

-- 导出  表 supply_shop.qrtz_job_details 结构
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE IF NOT EXISTS `qrtz_job_details` (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `job_class_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_durable` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_update_data` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `job_data` blob,
  PRIMARY KEY (`sched_name`,`job_name`,`job_group`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- 正在导出表  supply_shop.qrtz_job_details 的数据：~2 rows (大约)
DELETE FROM `qrtz_job_details`;
INSERT INTO `qrtz_job_details` (`sched_name`, `job_name`, `job_group`, `description`, `job_class_name`, `is_durable`, `is_nonconcurrent`, `is_update_data`, `requests_recovery`, `job_data`) VALUES
	('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 'co.yixiang.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', _binary 0xaced0005737200156f72672e71756172747a2e4a6f62446174614d61709fb083e8bfa9b0cb020000787200266f72672e71756172747a2e7574696c732e537472696e674b65794469727479466c61674d61708208e8c3fbc55d280200015a0013616c6c6f77735472616e7369656e74446174617872001d6f72672e71756172747a2e7574696c732e4469727479466c61674d617013e62ead28760ace0200025a000564697274794c00036d617074000f4c6a6176612f7574696c2f4d61703b787001737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f4000000000000c7708000000100000000174000f5441534b5f50524f504552544945537372001f636f2e79697869616e672e71756172747a2e646f6d61696e2e5379734a6f6200000000000000010200084c000a636f6e63757272656e747400124c6a6176612f6c616e672f537472696e673b4c000e63726f6e45787072657373696f6e71007e00094c000c696e766f6b6554617267657471007e00094c00086a6f6247726f757071007e00094c00056a6f6249647400104c6a6176612f6c616e672f4c6f6e673b4c00076a6f624e616d6571007e00094c000d6d697366697265506f6c69637971007e00094c000673746174757371007e000978720028636f2e79697869616e672e636f6d6d6f6e2e636f72652e646f6d61696e2e42617365456e7469747900000000000000010200074c0008637265617465427971007e00094c000a63726561746554696d657400104c6a6176612f7574696c2f446174653b4c0006706172616d7371007e00034c000672656d61726b71007e00094c000b73656172636856616c756571007e00094c0008757064617465427971007e00094c000a75706461746554696d6571007e000c787074000561646d696e7372000e6a6176612e7574696c2e44617465686a81014b59741903000078707708000001622cde29e078707400007070707400013174000e302f3130202a202a202a202a203f74001172795461736b2e72794e6f506172616d7374000744454641554c547372000e6a6176612e6c616e672e4c6f6e673b8be490cc8f23df0200014a000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b02000078700000000000000001740018e7b3bbe7bb9fe9bb98e8aea4efbc88e697a0e58f82efbc8974000133740001317800),
	('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 'co.yixiang.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', _binary 0xaced0005737200156f72672e71756172747a2e4a6f62446174614d61709fb083e8bfa9b0cb020000787200266f72672e71756172747a2e7574696c732e537472696e674b65794469727479466c61674d61708208e8c3fbc55d280200015a0013616c6c6f77735472616e7369656e74446174617872001d6f72672e71756172747a2e7574696c732e4469727479466c61674d617013e62ead28760ace0200025a000564697274794c00036d617074000f4c6a6176612f7574696c2f4d61703b787001737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f4000000000000c7708000000100000000174000f5441534b5f50524f504552544945537372001f636f2e79697869616e672e71756172747a2e646f6d61696e2e5379734a6f6200000000000000010200084c000a636f6e63757272656e747400124c6a6176612f6c616e672f537472696e673b4c000e63726f6e45787072657373696f6e71007e00094c000c696e766f6b6554617267657471007e00094c00086a6f6247726f757071007e00094c00056a6f6249647400104c6a6176612f6c616e672f4c6f6e673b4c00076a6f624e616d6571007e00094c000d6d697366697265506f6c69637971007e00094c000673746174757371007e000978720028636f2e79697869616e672e636f6d6d6f6e2e636f72652e646f6d61696e2e42617365456e7469747900000000000000010200074c0008637265617465427971007e00094c000a63726561746554696d657400104c6a6176612f7574696c2f446174653b4c0006706172616d7371007e00034c000672656d61726b71007e00094c000b73656172636856616c756571007e00094c0008757064617465427971007e00094c000a75706461746554696d6571007e000c787074000561646d696e7372000e6a6176612e7574696c2e44617465686a81014b59741903000078707708000001622cde29e078707400007070707400013174000e302f3135202a202a202a202a203f74001572795461736b2e7279506172616d7328277279272974000744454641554c547372000e6a6176612e6c616e672e4c6f6e673b8be490cc8f23df0200014a000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b02000078700000000000000002740018e7b3bbe7bb9fe9bb98e8aea4efbc88e69c89e58f82efbc8974000133740001317800),
	('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 'co.yixiang.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', _binary 0xaced0005737200156f72672e71756172747a2e4a6f62446174614d61709fb083e8bfa9b0cb020000787200266f72672e71756172747a2e7574696c732e537472696e674b65794469727479466c61674d61708208e8c3fbc55d280200015a0013616c6c6f77735472616e7369656e74446174617872001d6f72672e71756172747a2e7574696c732e4469727479466c61674d617013e62ead28760ace0200025a000564697274794c00036d617074000f4c6a6176612f7574696c2f4d61703b787001737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f4000000000000c7708000000100000000174000f5441534b5f50524f504552544945537372001f636f2e79697869616e672e71756172747a2e646f6d61696e2e5379734a6f6200000000000000010200084c000a636f6e63757272656e747400124c6a6176612f6c616e672f537472696e673b4c000e63726f6e45787072657373696f6e71007e00094c000c696e766f6b6554617267657471007e00094c00086a6f6247726f757071007e00094c00056a6f6249647400104c6a6176612f6c616e672f4c6f6e673b4c00076a6f624e616d6571007e00094c000d6d697366697265506f6c69637971007e00094c000673746174757371007e000978720028636f2e79697869616e672e636f6d6d6f6e2e636f72652e646f6d61696e2e42617365456e7469747900000000000000010200074c0008637265617465427971007e00094c000a63726561746554696d657400104c6a6176612f7574696c2f446174653b4c0006706172616d7371007e00034c000672656d61726b71007e00094c000b73656172636856616c756571007e00094c0008757064617465427971007e00094c000a75706461746554696d6571007e000c787074000561646d696e7372000e6a6176612e7574696c2e44617465686a81014b59741903000078707708000001622cde29e078707400007070707400013174000e302f3230202a202a202a202a203f74003872795461736b2e72794d756c7469706c65506172616d7328277279272c20747275652c20323030304c2c203331362e3530442c203130302974000744454641554c547372000e6a6176612e6c616e672e4c6f6e673b8be490cc8f23df0200014a000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b02000078700000000000000003740018e7b3bbe7bb9fe9bb98e8aea4efbc88e5a49ae58f82efbc8974000133740001317800);

-- 导出  表 supply_shop.qrtz_locks 结构
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE IF NOT EXISTS `qrtz_locks` (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `lock_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`sched_name`,`lock_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- 正在导出表  supply_shop.qrtz_locks 的数据：~2 rows (大约)
DELETE FROM `qrtz_locks`;
INSERT INTO `qrtz_locks` (`sched_name`, `lock_name`) VALUES
	('RuoyiScheduler', 'STATE_ACCESS'),
	('RuoyiScheduler', 'TRIGGER_ACCESS');

-- 导出  表 supply_shop.qrtz_paused_trigger_grps 结构
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE IF NOT EXISTS `qrtz_paused_trigger_grps` (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`sched_name`,`trigger_group`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- 正在导出表  supply_shop.qrtz_paused_trigger_grps 的数据：~0 rows (大约)
DELETE FROM `qrtz_paused_trigger_grps`;

-- 导出  表 supply_shop.qrtz_scheduler_state 结构
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE IF NOT EXISTS `qrtz_scheduler_state` (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `last_checkin_time` bigint NOT NULL,
  `checkin_interval` bigint NOT NULL,
  PRIMARY KEY (`sched_name`,`instance_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- 正在导出表  supply_shop.qrtz_scheduler_state 的数据：~1 rows (大约)
DELETE FROM `qrtz_scheduler_state`;
INSERT INTO `qrtz_scheduler_state` (`sched_name`, `instance_name`, `last_checkin_time`, `checkin_interval`) VALUES
	('RuoyiScheduler', 'DESKTOP-5ANHFUB1677080860224', 1677081042925, 15000);

-- 导出  表 supply_shop.qrtz_simple_triggers 结构
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE IF NOT EXISTS `qrtz_simple_triggers` (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `repeat_count` bigint NOT NULL,
  `repeat_interval` bigint NOT NULL,
  `times_triggered` bigint NOT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- 正在导出表  supply_shop.qrtz_simple_triggers 的数据：~0 rows (大约)
DELETE FROM `qrtz_simple_triggers`;

-- 导出  表 supply_shop.qrtz_simprop_triggers 结构
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE IF NOT EXISTS `qrtz_simprop_triggers` (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `str_prop_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `str_prop_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `str_prop_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `int_prop_1` int DEFAULT NULL,
  `int_prop_2` int DEFAULT NULL,
  `long_prop_1` bigint DEFAULT NULL,
  `long_prop_2` bigint DEFAULT NULL,
  `dec_prop_1` decimal(13,4) DEFAULT NULL,
  `dec_prop_2` decimal(13,4) DEFAULT NULL,
  `bool_prop_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `bool_prop_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- 正在导出表  supply_shop.qrtz_simprop_triggers 的数据：~0 rows (大约)
DELETE FROM `qrtz_simprop_triggers`;

-- 导出  表 supply_shop.qrtz_triggers 结构
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE IF NOT EXISTS `qrtz_triggers` (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `next_fire_time` bigint DEFAULT NULL,
  `prev_fire_time` bigint DEFAULT NULL,
  `priority` int DEFAULT NULL,
  `trigger_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `start_time` bigint NOT NULL,
  `end_time` bigint DEFAULT NULL,
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `misfire_instr` smallint DEFAULT NULL,
  `job_data` blob,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE,
  KEY `sched_name` (`sched_name`,`job_name`,`job_group`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- 正在导出表  supply_shop.qrtz_triggers 的数据：~3 rows (大约)
DELETE FROM `qrtz_triggers`;
INSERT INTO `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`, `job_name`, `job_group`, `description`, `next_fire_time`, `prev_fire_time`, `priority`, `trigger_state`, `trigger_type`, `start_time`, `end_time`, `calendar_name`, `misfire_instr`, `job_data`) VALUES
	('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 1677080860000, -1, 5, 'PAUSED', 'CRON', 1677080860000, 0, NULL, 2, _binary ''),
	('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 1677080865000, -1, 5, 'PAUSED', 'CRON', 1677080860000, 0, NULL, 2, _binary ''),
	('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 1677080860000, -1, 5, 'PAUSED', 'CRON', 1677080860000, 0, NULL, 2, _binary '');

-- 导出  表 supply_shop.store_ads 结构
DROP TABLE IF EXISTS `store_ads`;
CREATE TABLE IF NOT EXISTS `store_ads` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `video_url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '视频url',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '轮播图片地址',
  `type` tinyint DEFAULT '1' COMMENT '类型1-视频 2-图片',
  `sort` smallint unsigned DEFAULT '0' COMMENT '序号',
  `create_time` bigint unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='首页轮播广告';

-- 正在导出表  supply_shop.store_ads 的数据：3 rows
DELETE FROM `store_ads`;
/*!40000 ALTER TABLE `store_ads` DISABLE KEYS */;
INSERT INTO `store_ads` (`id`, `video_url`, `url`, `type`, `sort`, `create_time`) VALUES
	(9, 'https://admin.mijia321.com/static/upload/e38690a86e1ef621/313ee2689043da13.mp4', 'https://wxapi.yixiang.co/api/file/pic/20210222213137611454.jpg', 1, 0, 0),
	(11, '', 'https://wxapi.yixiang.co/api/file/pic/20210222213116280067.jpeg', 2, 0, 1536502777),
	(12, '', 'https://wxapi.yixiang.co/api/file/pic/20210222213137611454.jpg', 2, 0, 1536503300);
/*!40000 ALTER TABLE `store_ads` ENABLE KEYS */;

-- 导出  表 supply_shop.store_cart 结构
DROP TABLE IF EXISTS `store_cart`;
CREATE TABLE IF NOT EXISTS `store_cart` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '购物车表',
  `user_id` mediumint unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `session_id` char(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT 'session',
  `goods_id` mediumint unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `goods_sn` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商品货号',
  `goods_logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '',
  `goods_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商品名称',
  `market_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '零售价',
  `goods_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '本店价(进货价)',
  `member_goods_price` decimal(10,2) DEFAULT '0.00' COMMENT '会员折扣价',
  `goods_num` smallint unsigned DEFAULT '0' COMMENT '购买数量',
  `spec_key` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '商品规格key 对应store_spec_goods_price 表',
  `spec_key_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '商品规格组合名称',
  `bar_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '商品条码',
  `selected` tinyint(1) DEFAULT '1' COMMENT '购物车选中状态',
  `add_time` datetime DEFAULT NULL COMMENT '加入购物车的时间',
  `prom_type` tinyint(1) DEFAULT '0' COMMENT '0 普通订单,1 限时抢购, 2 团购 , 3 促销优惠',
  `prom_id` int DEFAULT '0' COMMENT '活动id',
  `sku` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT 'sku',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `session_id` (`session_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `goods_id` (`goods_id`) USING BTREE,
  KEY `spec_key` (`spec_key`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='购物车表';

-- 正在导出表  supply_shop.store_cart 的数据：~2 rows (大约)
DELETE FROM `store_cart`;
INSERT INTO `store_cart` (`id`, `user_id`, `session_id`, `goods_id`, `goods_sn`, `goods_logo`, `goods_name`, `market_price`, `goods_price`, `member_goods_price`, `goods_num`, `spec_key`, `spec_key_name`, `bar_code`, `selected`, `add_time`, `prom_type`, `prom_id`, `sku`) VALUES
	(116, 13, '', 6, '#10010', 'https://app2.yixiang.co/file/pic/20210608113116814494.jpg', '小米6X', 0.00, 123.00, 0.00, 1, '6_10', '尺寸:150*120cm 颜色:红色', '', 1, '2022-12-04 16:03:41', 0, 0, '');

-- 导出  表 supply_shop.store_code 结构
DROP TABLE IF EXISTS `store_code`;
CREATE TABLE IF NOT EXISTS `store_code` (
  `code_id` int unsigned NOT NULL AUTO_INCREMENT,
  `phone` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '手机号',
  `code` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '验证码',
  `type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '注册类型 0：注册  1:密码找回 ',
  `create_time` int NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`code_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9949 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='手机验证码表';

-- 正在导出表  supply_shop.store_code 的数据：~16 rows (大约)
DELETE FROM `store_code`;
INSERT INTO `store_code` (`code_id`, `phone`, `code`, `type`, `create_time`) VALUES
	(9933, '15136175246', '250175', 1, 1532235215),
	(9934, '15136175246', '473170', 1, 1532237173),
	(9935, '15136175246', '630991', 1, 1532238675),
	(9936, '15601064107', '481368', 1, 1536414746),
	(9937, '15601064105', '707445', 1, 1536414778),
	(9938, '13131313131', '641772', 1, 1536415119),
	(9939, '15612121212', '556793', 1, 1536415160),
	(9940, '13131312020', '671335', 1, 1536415244),
	(9941, '15601064107', '886733', 1, 1536415783),
	(9942, '17610570135', '835969', 1, 1536416040),
	(9943, '17610570135', '232940', 1, 1536416707),
	(9944, '15601064107', '375484', 1, 1536416734),
	(9945, '18905970273', '506991', 1, 1537176135),
	(9946, '15136175246', '639663', 1, 1537271645),
	(9947, '18905970273', '861394', 1, 1537339855),
	(9948, '17610570135', '761656', 1, 1538032004);

-- 导出  表 supply_shop.store_comment 结构
DROP TABLE IF EXISTS `store_comment`;
CREATE TABLE IF NOT EXISTS `store_comment` (
  `comment_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '评论id',
  `goods_id` mediumint unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `email` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT 'email邮箱',
  `username` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '评论内容',
  `add_time` int unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `ip_address` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT 'ip地址',
  `is_show` tinyint unsigned DEFAULT '0' COMMENT '是否显示',
  `parent_id` int unsigned DEFAULT '0' COMMENT '父id',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '评论用户',
  `img` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '晒单图片',
  `order_id` mediumint DEFAULT '0' COMMENT '订单id',
  `deliver_rank` tinyint unsigned DEFAULT '0' COMMENT '物流评价等级',
  `goods_rank` tinyint(1) DEFAULT '0' COMMENT '商品评价等级',
  `service_rank` tinyint(1) DEFAULT '0' COMMENT '商家服务态度评价等级',
  `zan_num` int DEFAULT '0' COMMENT '被赞数',
  `zan_userid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '点赞用户id',
  `is_anonymous` tinyint(1) DEFAULT '0' COMMENT '是否匿名评价:0不是，1是',
  `rec_id` int DEFAULT NULL COMMENT '订单商品表ID',
  PRIMARY KEY (`comment_id`) USING BTREE,
  KEY `parent_id` (`parent_id`) USING BTREE,
  KEY `id_value` (`goods_id`) USING BTREE,
  KEY `order_id` (`order_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='商品评论表';

-- 正在导出表  supply_shop.store_comment 的数据：~10 rows (大约)
DELETE FROM `store_comment`;
INSERT INTO `store_comment` (`comment_id`, `goods_id`, `email`, `username`, `content`, `add_time`, `ip_address`, `is_show`, `parent_id`, `user_id`, `img`, `order_id`, `deliver_rank`, `goods_rank`, `service_rank`, `zan_num`, `zan_userid`, `is_anonymous`, `rec_id`) VALUES
	(1, 5, '', '胡鹏', 'haoping', 1533046281, '', 0, 0, 1, NULL, 1639, 0, 0, 0, 0, '', 0, NULL),
	(2, 5, '', '高晓松', '评价内容', 1539076970, '', 0, 0, 2, NULL, 4, 0, 0, 0, 0, '', 0, NULL),
	(3, 6, '', '高晓松', '评价内容', 1539076970, '', 0, 0, 2, NULL, 4, 0, 0, 0, 0, '', 0, NULL),
	(4, 4, '', '高晓松', '2222', 1539201129, '', 0, 0, 2, NULL, 1763, 0, 0, 0, 0, '', 0, NULL),
	(5, 5, '', '高晓松', '22222', 1539201363, '', 0, 0, 2, NULL, 1761, 0, 0, 0, 0, '', 0, NULL),
	(6, 5, '', '高晓松', '222', 1539201390, '', 0, 0, 2, NULL, 1759, 0, 0, 0, 0, '', 0, NULL),
	(7, 4, '', '林建宾', '', 1539226890, '', 0, 0, 7, NULL, 1764, 0, 0, 0, 0, '', 0, NULL),
	(8, 5, '', '林建宾', '啊啊啊啊啊', 1539240054, '', 0, 0, 7, NULL, 1700, 0, 0, 0, 0, '', 0, NULL),
	(9, 4, '', '林建宾', '肩胛骨寂寞', 1539240191, '', 0, 0, 7, NULL, 1695, 0, 0, 0, 0, '', 0, NULL),
	(10, 5, '', '林建宾', '', 1539243601, '', 0, 0, 7, NULL, 1849, 0, 0, 0, 0, '', 0, NULL);

-- 导出  表 supply_shop.store_coupon 结构
DROP TABLE IF EXISTS `store_coupon`;
CREATE TABLE IF NOT EXISTS `store_coupon` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '表id',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '优惠券名字',
  `type` tinyint unsigned NOT NULL DEFAULT '2' COMMENT '发放类型 0下单赠送1 指定发放 2 免费领取 3线下发放',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '优惠券金额',
  `condition` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '使用条件，满多少金额',
  `createnum` int DEFAULT '0' COMMENT '发放数量',
  `send_num` int DEFAULT '0' COMMENT '已领取数量',
  `use_num` int DEFAULT '0' COMMENT '已使用数量',
  `send_start_time` int DEFAULT NULL COMMENT '发放开始时间',
  `send_end_time` int DEFAULT NULL COMMENT '发放结束时间',
  `use_start_time` datetime DEFAULT NULL COMMENT '使用开始时间',
  `use_end_time` datetime DEFAULT NULL COMMENT '使用结束时间',
  `add_time` int DEFAULT NULL COMMENT '添加时间',
  `status` int DEFAULT NULL COMMENT '状态：1有效,2无效',
  `use_type` tinyint(1) DEFAULT '0' COMMENT '使用范围：0全店通用1指定商品可用2指定分类商品可用',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `use_end_time` (`use_end_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='优惠券主表';

-- 正在导出表  supply_shop.store_coupon 的数据：~3 rows (大约)
DELETE FROM `store_coupon`;
INSERT INTO `store_coupon` (`id`, `name`, `type`, `money`, `condition`, `createnum`, `send_num`, `use_num`, `send_start_time`, `send_end_time`, `use_start_time`, `use_end_time`, `add_time`, `status`, `use_type`) VALUES
	(21, '新客户优惠券', 2, 50.00, 300.00, 100, 1, 0, NULL, NULL, '2019-08-15 10:35:09', '2019-09-27 10:35:14', 1509008166, 1, 0),
	(22, '优惠券01', 2, 20.00, 200.00, 1000, 0, 4, NULL, NULL, '2019-08-08 10:35:17', '2019-09-10 10:35:21', 1533040174, NULL, 0),
	(23, '五一促销1', 2, 10.00, 100.00, 1000, 0, 0, NULL, NULL, '2019-08-21 00:00:00', '2019-09-30 00:00:00', NULL, NULL, 0);

-- 导出  表 supply_shop.store_coupon_list 结构
DROP TABLE IF EXISTS `store_coupon_list`;
CREATE TABLE IF NOT EXISTS `store_coupon_list` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '表id',
  `cid` int NOT NULL DEFAULT '0' COMMENT '优惠券 对应coupon表id',
  `type` tinyint unsigned NOT NULL DEFAULT '2' COMMENT '发放类型 1 按订单发放 2 注册 3 邀请 4 按用户发放',
  `uid` int NOT NULL DEFAULT '0' COMMENT '用户id',
  `order_id` int NOT NULL DEFAULT '0' COMMENT '订单id',
  `get_order_id` int DEFAULT '0' COMMENT '优惠券来自订单ID',
  `use_time` int NOT NULL DEFAULT '0' COMMENT '使用时间',
  `code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '优惠券兑换码',
  `send_time` int NOT NULL DEFAULT '0' COMMENT '发放时间',
  `status` tinyint(1) DEFAULT '0' COMMENT '0未使用1已使用2已过期',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `cid` (`cid`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE,
  KEY `code` (`code`) USING BTREE,
  KEY `order_id` (`order_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='优惠券记录表';

-- 正在导出表  supply_shop.store_coupon_list 的数据：~8 rows (大约)
DELETE FROM `store_coupon_list`;
INSERT INTO `store_coupon_list` (`id`, `cid`, `type`, `uid`, `order_id`, `get_order_id`, `use_time`, `code`, `send_time`, `status`) VALUES
	(193, 21, 2, 1, 0, 0, 0, '', 1532056369, 0),
	(194, 22, 4, 7, 0, 0, 1539050142, '', 1537436694, 0),
	(195, 22, 4, 3, 0, 0, 1539237126, '', 1537436694, 0),
	(196, 22, 4, 1, 0, 0, 0, '', 1537436694, 0),
	(197, 22, 4, 2, 0, 0, 1539021653, '', 1538037967, 0),
	(198, 21, 4, 2, 0, 0, 0, '', 1538037976, 0),
	(199, 21, 4, 3, 0, 0, 1568620478, '', 1538038018, 1),
	(200, 21, 4, 7, 0, 0, 0, '', 1539249927, 0);

-- 导出  表 supply_shop.store_express 结构
DROP TABLE IF EXISTS `store_express`;
CREATE TABLE IF NOT EXISTS `store_express` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `express_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '快递公司名称',
  `express_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '快递公司代码',
  `express_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '快递公司描述',
  `status` tinyint unsigned DEFAULT '1' COMMENT '状态(0.无效,1.有效)',
  `sort` bigint unsigned DEFAULT '0' COMMENT '排序',
  `is_deleted` tinyint unsigned DEFAULT '0' COMMENT '删除状态(1删除,0未删除)',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='商城快递配置';

-- 正在导出表  supply_shop.store_express 的数据：~90 rows (大约)
DELETE FROM `store_express`;
INSERT INTO `store_express` (`id`, `express_title`, `express_code`, `express_desc`, `status`, `sort`, `is_deleted`, `create_at`) VALUES
	(5, 'AAE全球专递', 'aae', '顺丰快递公司', 0, 0, 0, '2017-09-12 03:53:40'),
	(6, '安捷快递', 'anjie', '', 0, 0, 0, '2017-09-13 07:27:26'),
	(7, '安信达快递', 'anxindakuaixi', NULL, 0, 0, 0, '2017-09-13 08:05:19'),
	(8, '彪记快递', 'biaojikuaidi', NULL, 0, 0, 0, '2017-09-13 08:05:26'),
	(9, 'BHT', 'bht', '', 0, 0, 0, '2017-09-13 08:05:37'),
	(10, '百福东方国际物流', 'baifudongfang', NULL, 0, 0, 0, '2017-09-13 08:05:41'),
	(11, '中国东方（COE）', 'coe', NULL, 0, 0, 0, '2017-09-13 08:05:48'),
	(12, '长宇物流', 'changyuwuliu', NULL, 0, 0, 0, '2017-09-13 08:05:58'),
	(13, '大田物流', 'datianwuliu', NULL, 0, 0, 0, '2017-09-13 08:06:06'),
	(14, '德邦物流', 'debangwuliu', NULL, 1, 1, 0, '2017-09-13 08:06:14'),
	(15, 'DHL', 'dhl', NULL, 0, 0, 0, '2017-09-13 08:06:24'),
	(16, 'DPEX', 'dpex', NULL, 0, 0, 0, '2017-09-13 08:06:29'),
	(17, 'd速快递', 'dsukuaidi', NULL, 0, 0, 0, '2017-09-13 08:06:34'),
	(18, '递四方', 'disifang', NULL, 0, 0, 0, '2017-09-13 08:06:40'),
	(19, 'EMS快递', 'ems', '', 1, 0, 0, '2017-09-13 08:06:47'),
	(20, 'FEDEX（国外）', 'fedex', NULL, 0, 0, 0, '2017-09-13 08:06:56'),
	(21, '飞康达物流', 'feikangda', NULL, 0, 0, 0, '2017-09-13 08:07:03'),
	(22, '凤凰快递', 'fenghuangkuaidi', NULL, 0, 0, 0, '2017-09-13 08:07:10'),
	(23, '飞快达', 'feikuaida', NULL, 0, 0, 0, '2017-09-13 08:07:16'),
	(24, '国通快递', 'guotongkuaidi', NULL, 0, 0, 0, '2017-09-13 08:07:27'),
	(25, '港中能达物流', 'ganzhongnengda', NULL, 0, 0, 0, '2017-09-13 08:07:33'),
	(26, '广东邮政物流', 'guangdongyouzhengwuliu', NULL, 0, 0, 0, '2017-09-13 08:08:22'),
	(27, '共速达', 'gongsuda', NULL, 0, 0, 0, '2017-09-13 08:08:48'),
	(28, '汇通快运', 'huitongkuaidi', NULL, 0, 0, 0, '2017-09-13 08:08:56'),
	(29, '恒路物流', 'hengluwuliu', NULL, 0, 0, 0, '2017-09-13 08:09:02'),
	(30, '华夏龙物流', 'huaxialongwuliu', NULL, 0, 0, 0, '2017-09-13 08:09:12'),
	(31, '海红', 'haihongwangsong', NULL, 0, 0, 0, '2017-09-13 08:09:20'),
	(32, '海外环球', 'haiwaihuanqiu', NULL, 0, 0, 0, '2017-09-13 08:09:27'),
	(33, '佳怡物流', 'jiayiwuliu', NULL, 0, 0, 0, '2017-09-13 08:09:35'),
	(34, '京广速递', 'jinguangsudikuaijian', NULL, 0, 0, 0, '2017-09-13 08:09:42'),
	(35, '急先达', 'jixianda', NULL, 0, 0, 0, '2017-09-13 08:09:49'),
	(36, '佳吉物流', 'jjwl', NULL, 0, 0, 0, '2017-09-13 08:10:01'),
	(37, '加运美物流', 'jymwl', NULL, 0, 0, 0, '2017-09-13 08:10:13'),
	(38, '金大物流', 'jindawuliu', NULL, 0, 0, 0, '2017-09-13 08:10:22'),
	(39, '嘉里大通', 'jialidatong', NULL, 0, 0, 0, '2017-09-13 08:10:33'),
	(40, '晋越快递', 'jykd', NULL, 0, 0, 0, '2017-09-13 08:10:40'),
	(41, '快捷速递', 'kuaijiesudi', NULL, 0, 0, 0, '2017-09-13 08:10:49'),
	(42, '联邦快递（国内）', 'lianb', NULL, 0, 0, 0, '2017-09-13 08:10:58'),
	(43, '联昊通物流', 'lianhaowuliu', NULL, 0, 0, 0, '2017-09-13 08:11:07'),
	(44, '龙邦物流', 'longbanwuliu', NULL, 0, 0, 0, '2017-09-13 08:11:15'),
	(45, '立即送', 'lijisong', NULL, 0, 0, 0, '2017-09-13 08:11:25'),
	(46, '乐捷递', 'lejiedi', NULL, 0, 0, 0, '2017-09-13 08:11:36'),
	(47, '民航快递', 'minghangkuaidi', NULL, 0, 0, 0, '2017-09-13 08:11:45'),
	(48, '美国快递', 'meiguokuaidi', NULL, 0, 0, 0, '2017-09-13 08:11:53'),
	(49, '门对门', 'menduimen', NULL, 0, 0, 0, '2017-09-13 08:12:01'),
	(50, 'OCS', 'ocs', NULL, 0, 0, 0, '2017-09-13 08:12:10'),
	(51, '配思货运', 'peisihuoyunkuaidi', NULL, 0, 0, 0, '2017-09-13 08:12:18'),
	(52, '全晨快递', 'quanchenkuaidi', NULL, 0, 0, 0, '2017-09-13 08:12:26'),
	(53, '全峰快递', 'quanfengkuaidi', NULL, 0, 0, 0, '2017-09-13 08:12:34'),
	(54, '全际通物流', 'quanjitong', NULL, 0, 0, 0, '2017-09-13 08:12:41'),
	(55, '全日通快递', 'quanritongkuaidi', NULL, 0, 0, 0, '2017-09-13 08:12:49'),
	(56, '全一快递', 'quanyikuaidi', NULL, 0, 0, 0, '2017-09-13 08:12:56'),
	(57, '如风达', 'rufengda', NULL, 0, 0, 0, '2017-09-13 08:13:03'),
	(58, '三态速递', 'santaisudi', NULL, 0, 0, 0, '2017-09-13 08:13:15'),
	(59, '盛辉物流', 'shenghuiwuliu', NULL, 0, 0, 0, '2017-09-13 08:13:22'),
	(60, '申通', 'shentong', NULL, 0, 0, 0, '2017-09-13 08:13:34'),
	(61, '顺丰', 'shunfeng', '', 1, 0, 0, '2017-09-13 08:13:41'),
	(62, '速尔物流', 'sue', NULL, 0, 0, 0, '2017-09-13 08:13:48'),
	(63, '盛丰物流', 'shengfeng', NULL, 0, 0, 0, '2017-09-13 08:13:55'),
	(64, '赛澳递', 'saiaodi', NULL, 0, 0, 0, '2017-09-13 08:14:02'),
	(65, '天地华宇', 'tiandihuayu', NULL, 0, 0, 0, '2017-09-13 08:14:11'),
	(66, '天天快递', 'tiantian', NULL, 0, 0, 0, '2017-09-13 08:14:19'),
	(67, 'TNT', 'tnt', NULL, 0, 0, 0, '2017-09-13 08:14:26'),
	(68, 'UPS', 'ups', NULL, 0, 0, 0, '2017-09-13 08:14:29'),
	(69, '万家物流', 'wanjiawuliu', NULL, 0, 0, 0, '2017-09-13 08:14:37'),
	(70, '文捷航空速递', 'wenjiesudi', NULL, 0, 0, 0, '2017-09-13 08:14:46'),
	(71, '伍圆', 'wuyuan', NULL, 0, 0, 0, '2017-09-13 08:14:52'),
	(72, '万象物流', 'wxwl', NULL, 0, 0, 0, '2017-09-13 08:15:00'),
	(73, '新邦物流', 'xinbangwuliu', NULL, 0, 0, 0, '2017-09-13 08:15:06'),
	(74, '信丰物流', 'xinfengwuliu', NULL, 0, 0, 0, '2017-09-13 08:15:15'),
	(75, '亚风速递', 'yafengsudi', NULL, 0, 0, 0, '2017-09-13 08:15:23'),
	(76, '一邦速递', 'yibangwuliu', NULL, 0, 0, 0, '2017-09-13 08:15:30'),
	(77, '优速物流', 'youshuwuliu', NULL, 0, 0, 0, '2017-09-13 08:15:36'),
	(78, '邮政包裹挂号信', 'youzhengguonei', NULL, 0, 3, 0, '2017-09-13 08:15:44'),
	(79, '邮政国际包裹挂号信', 'youzhengguoji', NULL, 0, 2, 0, '2017-09-13 08:15:51'),
	(80, '远成物流', 'yuanchengwuliu', NULL, 0, 0, 0, '2017-09-13 08:15:57'),
	(81, '圆通速递', 'yuantong', NULL, 1, 1, 0, '2017-09-13 08:16:03'),
	(82, '源伟丰快递', 'yuanweifeng', NULL, 0, 0, 0, '2017-09-13 08:16:10'),
	(83, '元智捷诚快递', 'yuanzhijiecheng', NULL, 0, 0, 0, '2017-09-13 08:16:17'),
	(84, '韵达快运', 'yunda', NULL, 0, 0, 0, '2017-09-13 08:16:24'),
	(85, '运通快递', 'yuntongkuaidi', NULL, 0, 0, 0, '2017-09-13 08:16:33'),
	(86, '越丰物流', 'yuefengwuliu', NULL, 0, 0, 0, '2017-09-13 08:16:40'),
	(87, '源安达', 'yad', NULL, 0, 0, 0, '2017-09-13 08:16:47'),
	(88, '银捷速递', 'yinjiesudi', NULL, 0, 0, 0, '2017-09-13 08:16:56'),
	(89, '宅急送', 'zhaijisong', NULL, 0, 0, 0, '2017-09-13 08:17:03'),
	(90, '中铁快运', 'zhongtiekuaiyun', NULL, 0, 0, 0, '2017-09-13 08:17:10'),
	(91, '中通速递', 'zhongtong', '', 0, 0, 0, '2017-09-13 08:17:16'),
	(92, '中邮物流', 'zhongyouwuliu', NULL, 0, 0, 0, '2017-09-13 08:17:27'),
	(93, '忠信达', 'zhongxinda', NULL, 0, 0, 0, '2017-09-13 08:17:34'),
	(94, '芝麻开门', 'zhimakaimen', NULL, 0, 0, 0, '2017-09-13 08:17:41');

-- 导出  表 supply_shop.store_file_records 结构
DROP TABLE IF EXISTS `store_file_records`;
CREATE TABLE IF NOT EXISTS `store_file_records` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned DEFAULT '0' COMMENT '用户id',
  `file_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '文件名称',
  `file_size` int unsigned DEFAULT '0' COMMENT '文件大小',
  `create_time` int unsigned DEFAULT '0' COMMENT '上传时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='文件上传记录表';

-- 正在导出表  supply_shop.store_file_records 的数据：1 rows
DELETE FROM `store_file_records`;
/*!40000 ALTER TABLE `store_file_records` DISABLE KEYS */;
INSERT INTO `store_file_records` (`id`, `user_id`, `file_name`, `file_size`, `create_time`) VALUES
	(2, 1, '/e92e4a5ebf99ee25/6681a1abf9b674b2.xlsx', 9281, 1536992462);
/*!40000 ALTER TABLE `store_file_records` ENABLE KEYS */;

-- 导出  表 supply_shop.store_goods 结构
DROP TABLE IF EXISTS `store_goods`;
CREATE TABLE IF NOT EXISTS `store_goods` (
  `goods_id` mediumint unsigned NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `cate_id` int unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  `extend_cat_id` int DEFAULT '0' COMMENT '扩展分类id',
  `goods_sn` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商品编号',
  `goods_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商品名称',
  `click_count` int unsigned NOT NULL DEFAULT '0' COMMENT '点击数',
  `brand_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT '品牌id',
  `store_count` smallint NOT NULL DEFAULT '10' COMMENT '库存数量',
  `comment_count` smallint DEFAULT '0' COMMENT '商品评论数',
  `weight` int unsigned NOT NULL DEFAULT '0' COMMENT '商品重量克为单位',
  `volume` double(10,4) unsigned NOT NULL DEFAULT '0.0000' COMMENT '商品体积。单位立方米',
  `market_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '市场价(零售价)',
  `shop_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '本店价(供货价)',
  `cost_price` decimal(10,2) DEFAULT '0.00' COMMENT '商品成本价',
  `price_ladder` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '价格阶梯',
  `keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商品关键词',
  `goods_remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商品简单描述',
  `goods_content` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '商品详细描述',
  `mobile_content` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '手机端商品详情',
  `goods_logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商品上传原始图(主图)',
  `is_virtual` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否为虚拟商品 1是，0否',
  `virtual_indate` int DEFAULT '0' COMMENT '虚拟商品有效期',
  `virtual_limit` smallint DEFAULT '0' COMMENT '虚拟商品购买上限',
  `virtual_refund` tinyint(1) DEFAULT '1' COMMENT '是否允许过期退款， 1是，0否',
  `is_on_sale` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否上架 0-未上架 1-销售中',
  `is_free_shipping` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否包邮0否1是',
  `on_time` int unsigned NOT NULL DEFAULT '0' COMMENT '商品上架时间',
  `sort` smallint unsigned NOT NULL DEFAULT '50' COMMENT '商品排序',
  `is_recommend` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否推荐0-未推荐 1-已推荐',
  `is_new` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否新品0-不是 1-是',
  `is_hot` tinyint(1) DEFAULT '0' COMMENT '是否热卖',
  `last_update` int unsigned NOT NULL DEFAULT '0' COMMENT '最后更新时间',
  `goods_type` smallint unsigned NOT NULL DEFAULT '0' COMMENT '商品所属类型id，取值表goods_type的id',
  `spec_type` smallint DEFAULT '0' COMMENT '商品规格类型，取值表goods_type的id',
  `give_integral` mediumint unsigned NOT NULL DEFAULT '0' COMMENT '购买商品赠送积分',
  `exchange_integral` int NOT NULL DEFAULT '0' COMMENT '积分兑换：0不参与积分兑换，积分和现金的兑换比例见后台配置',
  `suppliers_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT '供货商ID',
  `sales_sum` int DEFAULT '0' COMMENT '商品销量',
  `prom_type` tinyint(1) DEFAULT '0' COMMENT '0默认1抢购2团购3优惠促销4预售5虚拟(5其实没用)6拼团',
  `prom_id` int NOT NULL DEFAULT '0' COMMENT '优惠活动id',
  `commission` decimal(10,2) DEFAULT '0.00' COMMENT '佣金用于分销分成',
  `spu` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT 'SPU',
  `sku` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT 'SKU',
  `template_id` int unsigned DEFAULT '0' COMMENT '运费模板ID',
  `goods_video` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '视频',
  PRIMARY KEY (`goods_id`) USING BTREE,
  KEY `goods_sn` (`goods_sn`) USING BTREE,
  KEY `cat_id` (`cate_id`) USING BTREE,
  KEY `last_update` (`last_update`) USING BTREE,
  KEY `brand_id` (`brand_id`) USING BTREE,
  KEY `goods_number` (`store_count`) USING BTREE,
  KEY `goods_weight` (`weight`) USING BTREE,
  KEY `sort_order` (`sort`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='商品主表';

-- 正在导出表  supply_shop.store_goods 的数据：~8 rows (大约)
DELETE FROM `store_goods`;
INSERT INTO `store_goods` (`goods_id`, `cate_id`, `extend_cat_id`, `goods_sn`, `goods_name`, `click_count`, `brand_id`, `store_count`, `comment_count`, `weight`, `volume`, `market_price`, `shop_price`, `cost_price`, `price_ladder`, `keywords`, `goods_remark`, `goods_content`, `mobile_content`, `goods_logo`, `is_virtual`, `virtual_indate`, `virtual_limit`, `virtual_refund`, `is_on_sale`, `is_free_shipping`, `on_time`, `sort`, `is_recommend`, `is_new`, `is_hot`, `last_update`, `goods_type`, `spec_type`, `give_integral`, `exchange_integral`, `suppliers_id`, `sales_sum`, `prom_type`, `prom_id`, `commission`, `spu`, `sku`, `template_id`, `goods_video`) VALUES
	(4, 5, 0, '#10078', '小米8青春', 0, 1, 77, 0, 0, 0.0000, 140.00, 100.00, 0.00, NULL, '布料', '布料描述，布料描述，布料描述', '<p><img border="0" src="https://admin.mijia321.com/static/upload/145bb741db89d1a0/b7fbb8665bd0b890.jpg" title="image" /></p>', NULL, 'https://app2.yixiang.co/file/pic/20210615153142207742.jpg', 0, 0, 0, 1, 1, 0, 0, 50, 1, 1, 0, 0, 39, 0, 10, 0, 0, 24, 0, 0, 0.00, '', '', 0, 'https://admin.mijia321.com/static/upload/e38690a86e1ef621/313ee2689043da13.mp4'),
	(5, 5, 0, '#10086', '苹果X', 0, 1, 172, 0, 0, 0.0000, 150.00, 100.00, 0.00, NULL, '枕芯', '枕芯这里是什么呢', '<p><img border="0" src="https://admin.mijia321.com/static/upload/5735b3971afb31b4/4056e87625d6308d.jpg" title="image" /></p>\r\n\r\n<p><img border="0" src="https://admin.mijia321.com/static/upload/2ca3e28f579f67bf/60adbbcf479f76a1.jpg" title="image" /></p>', NULL, 'https://app2.yixiang.co/file/pic/20210608163248869638.jpg', 0, 0, 0, 1, 1, 0, 0, 50, 0, 1, 0, 0, 39, 0, 20, 0, 0, 28, 0, 0, 0.00, '', '', 0, 'https://admin.mijia321.com/static/upload/e38690a86e1ef621/313ee2689043da13.mp4'),
	(6, 5, 0, '#10010', '小米6X', 0, 2, 19, 0, 0, 0.0000, 18.00, 22.00, 0.00, NULL, '123', '123123', '<p><img border="0" src="https://admin.mijia321.com/static/upload/90302f074f2f7060/17f5d62b05cccc78.jpg" title="image" /></p>', NULL, 'https://app2.yixiang.co/file/pic/20210608113116814494.jpg', 0, 0, 0, 1, 1, 0, 0, 50, 1, 0, 0, 0, 39, 0, 0, 0, 0, 3, 0, 0, 0.00, '', '', 0, ''),
	(7, 5, 0, '#45678', '红米6A', 0, 2, 12, 0, 0, 0.0000, 12.00, 22.00, 0.00, NULL, '12', '123123', '<p><img border="0" src="https://admin.mijia321.com/static/upload/1eaff416a8e9b845/ef5711e4c1995028.jpg" title="image" /></p>', NULL, 'http://localhost:8080/profile/upload/2022/10/11/a2474591-af2d-4482-8c42-2a236193cb66.jpg', 0, 0, 0, 1, 1, 0, 0, 50, 1, 1, 0, 0, 39, 0, 0, 0, 0, 0, 0, 0, 0.00, '', '', 0, ''),
	(8, 4, 0, '#10096', '小米平板', 0, 1, 10, 0, 0, 0.0000, 9888.00, 6888.00, 0.00, NULL, '小米', '123', '<p><img border="0" src="https://admin.mijia321.com/static/upload/bbed0eba70c2018c/5b22ac2638e18245.jpg" title="image" /><img border="0" src="https://admin.mijia321.com/static/upload/137478132b12081d/8f46351f022872b4.jpg" title="image" /><img border="0" src="https://admin.mijia321.com/static/upload/0a78b71aebb5a39e/b64ce1f2ee6ac447.jpg" title="image" /><img border="0" src="https://admin.mijia321.com/static/upload/b9d6ba99c4c6c55b/f4ed701f2ae71653.jpg" title="image" /></p>', NULL, 'https://app2.yixiang.co/file/pic/20210608113116504118.jpg', 0, 0, 0, 1, 1, 0, 0, 50, 1, 1, 0, 0, 39, 0, 0, 0, 0, 0, 0, 0, 0.00, '', '', 0, ''),
	(9, 11, 0, '#1008611', '测试商品规格', 0, 1, 10, 0, 0, 0.0000, 100.00, 20.00, 0.00, NULL, '复印', '描述', NULL, NULL, '', 0, 0, 0, 1, 1, 0, 0, 1, 0, 0, 0, 0, 39, 0, 0, 0, 0, 0, 0, 0, 0.00, '', '', 0, ''),
	(10, 14, 0, '#102222', '戴尔笔记本', 0, 4, 10, 0, 0, 0.0000, 19884.00, 11111.00, 0.00, NULL, '游戏本', '发发发', NULL, NULL, 'http://localhost:8080/profile/upload/2022/10/11/e7a8c16f-ecc9-4ebe-88ae-d3bf12ee751e.jpg', 0, 0, 0, 1, 1, 0, 0, 2, 1, 1, 0, 0, 41, 0, 0, 0, 0, 0, 0, 0, 0.00, '', '', 0, ''),
	(11, 13, 0, '#102233', '戴尔笔记本', 0, 4, 10, 0, 0, 0.0000, 11.00, 12.00, 0.00, NULL, '带带我多', '单位', NULL, NULL, '', 0, 0, 0, 1, 1, 0, 0, 3, 1, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 0, 0.00, '', '', 0, '');

-- 导出  表 supply_shop.store_goods_activity 结构
DROP TABLE IF EXISTS `store_goods_activity`;
CREATE TABLE IF NOT EXISTS `store_goods_activity` (
  `act_id` mediumint unsigned NOT NULL AUTO_INCREMENT COMMENT '活动ID',
  `act_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '活动名称',
  `act_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动描述',
  `act_type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '活动类型:1预售2拼团',
  `goods_id` mediumint unsigned NOT NULL DEFAULT '0' COMMENT '参加活动商品ID',
  `spec_id` mediumint unsigned NOT NULL DEFAULT '0' COMMENT '商品规格ID',
  `goods_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商品名称',
  `start_time` int unsigned NOT NULL COMMENT '活动开始时间',
  `end_time` int unsigned NOT NULL COMMENT '活动结束时间',
  `is_finished` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否已结束:0,正常；1,成功结束；2，失败结束。',
  `ext_info` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动扩展配置',
  `act_count` mediumint NOT NULL DEFAULT '0' COMMENT '商品购买数',
  PRIMARY KEY (`act_id`) USING BTREE,
  KEY `act_name` (`act_name`,`act_type`,`goods_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- 正在导出表  supply_shop.store_goods_activity 的数据：0 rows
DELETE FROM `store_goods_activity`;
/*!40000 ALTER TABLE `store_goods_activity` DISABLE KEYS */;
/*!40000 ALTER TABLE `store_goods_activity` ENABLE KEYS */;

-- 导出  表 supply_shop.store_goods_attr 结构
DROP TABLE IF EXISTS `store_goods_attr`;
CREATE TABLE IF NOT EXISTS `store_goods_attr` (
  `goods_attr_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '商品属性id自增',
  `goods_id` mediumint unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `attr_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT '属性id',
  `attr_value` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '属性值',
  `attr_price` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '属性价格',
  PRIMARY KEY (`goods_attr_id`) USING BTREE,
  KEY `goods_id` (`goods_id`) USING BTREE,
  KEY `attr_id` (`attr_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='商品关联的属性表(与商品相关)';

-- 正在导出表  supply_shop.store_goods_attr 的数据：~13 rows (大约)
DELETE FROM `store_goods_attr`;
INSERT INTO `store_goods_attr` (`goods_attr_id`, `goods_id`, `attr_id`, `attr_value`, `attr_price`) VALUES
	(2, 1, 330, '12*15*18', '0'),
	(9, 5, 329, '3D立体', ''),
	(10, 5, 330, '100%纯棉', ''),
	(11, 4, 329, '纯手工2', ''),
	(12, 4, 330, '100%纯棉2', ''),
	(13, 6, 329, '123', ''),
	(14, 6, 330, '456', ''),
	(17, 8, 329, '电镀', ''),
	(18, 8, 330, '金属', ''),
	(19, 7, 329, '123', ''),
	(20, 7, 330, '123', ''),
	(25, 9, 330, '材质', ''),
	(26, 9, 329, '工艺9', ''),
	(27, 10, 332, '无', ''),
	(28, 11, 332, '无', '');

-- 导出  表 supply_shop.store_goods_attribute 结构
DROP TABLE IF EXISTS `store_goods_attribute`;
CREATE TABLE IF NOT EXISTS `store_goods_attribute` (
  `attr_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '属性id',
  `attr_name` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '属性名称',
  `type_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT '属性分类id(商品模型id)',
  `attr_index` tinyint unsigned DEFAULT '0' COMMENT '0不需要检索 1关键字检索 2范围检索',
  `attr_type` tinyint unsigned DEFAULT '0' COMMENT '0唯一属性 1单选属性 2复选属性',
  `attr_input_type` tinyint unsigned DEFAULT '0' COMMENT ' 0 手工录入 1从列表中选择 2多行文本框',
  `attr_values` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '可选值列表',
  `sort` tinyint unsigned NOT NULL DEFAULT '50' COMMENT '属性排序',
  PRIMARY KEY (`attr_id`) USING BTREE,
  KEY `cat_id` (`type_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=333 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='商品的属性表(独立)';

-- 正在导出表  supply_shop.store_goods_attribute 的数据：~3 rows (大约)
DELETE FROM `store_goods_attribute`;
INSERT INTO `store_goods_attribute` (`attr_id`, `attr_name`, `type_id`, `attr_index`, `attr_type`, `attr_input_type`, `attr_values`, `sort`) VALUES
	(329, '工艺', 39, 0, 0, 0, '', 50),
	(330, '材质', 39, 0, 0, 0, '', 50),
	(331, '内存', 40, 0, 0, 0, NULL, 50),
	(332, '电脑', 41, 0, 0, 0, NULL, 50);

-- 导出  表 supply_shop.store_goods_brand 结构
DROP TABLE IF EXISTS `store_goods_brand`;
CREATE TABLE IF NOT EXISTS `store_goods_brand` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `brand_logo` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '品牌logo',
  `brand_cover` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '品牌封面',
  `brand_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '商品品牌名称',
  `brand_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '商品品牌描述',
  `brand_detail` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '品牌图文信息',
  `sort` int unsigned DEFAULT '0' COMMENT '商品分类排序',
  `status` tinyint unsigned DEFAULT '1' COMMENT '商品状态(1有效,0无效)',
  `is_deleted` tinyint unsigned DEFAULT '0' COMMENT '删除状态(1删除,0未删除)',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='产品品牌';

-- 正在导出表  supply_shop.store_goods_brand 的数据：~3 rows (大约)
DELETE FROM `store_goods_brand`;
INSERT INTO `store_goods_brand` (`id`, `brand_logo`, `brand_cover`, `brand_title`, `brand_desc`, `brand_detail`, `sort`, `status`, `is_deleted`, `create_at`) VALUES
	(1, 'http://www.testxcx.com/static/upload/fec82092cb3405cc/cefd3bfb70a3c080.png', 'http://www.testxcx.com/static/upload/a1b7f6d005e2c1b2/9729f24657ecbf46.png', '蚂蚁供货', '蚂蚁供货蚂蚁供货', '<p>蚂蚁供货蚂蚁供货</p>', 0, 1, 0, '2018-07-09 12:59:50'),
	(2, 'https://admin.mijia321.com/static/upload/145bb741db89d1a0/b7fbb8665bd0b890.jpg', 'https://admin.mijia321.com/static/upload/1a0b9aa9269e885f/691c8476f18c158b.jpg', '星仔', '自营', '<p>自营品牌</p>', 0, 1, 0, '2018-08-08 01:11:49'),
	(3, 'http://127.0.0.1:8080/profile/upload/2019/08/23/079702428f13f5c9b5acb1c5cec16b9d.jpeg', '', 'logo', NULL, NULL, 0, 1, 0, '2019-08-23 10:37:19'),
	(4, 'http://localhost:8080/profile/upload/2022/10/11/f89561c9-52b4-42ba-ba92-596d705dbb54.jpg', '', '戴尔', '电脑供货', NULL, 0, 1, 0, '2022-10-11 14:27:49');

-- 导出  表 supply_shop.store_goods_cate 结构
DROP TABLE IF EXISTS `store_goods_cate`;
CREATE TABLE IF NOT EXISTS `store_goods_cate` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `pid` bigint unsigned DEFAULT '0' COMMENT '上级分类编号',
  `brand_id` bigint DEFAULT '0' COMMENT '品牌ID',
  `cate_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '商品分类名称',
  `cate_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '商品分类',
  `img_url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '缩略图url',
  `sort` bigint unsigned DEFAULT '0' COMMENT '商品分类排序',
  `status` bigint unsigned DEFAULT '1' COMMENT '商品状态(1有效,0无效)',
  `is_deleted` bigint unsigned DEFAULT '0' COMMENT '删除状态(1删除,0未删除)',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='商城商品分类';

-- 正在导出表  supply_shop.store_goods_cate 的数据：~10 rows (大约)
DELETE FROM `store_goods_cate`;
INSERT INTO `store_goods_cate` (`id`, `pid`, `brand_id`, `cate_title`, `cate_desc`, `img_url`, `sort`, `status`, `is_deleted`, `create_at`) VALUES
	(3, 0, 0, '套件', '套件', NULL, 0, 1, 0, '2018-07-09 13:01:36'),
	(4, 0, 0, '布料', '布料', NULL, 0, 1, 0, '2018-07-09 13:01:51'),
	(5, 4, 0, '布料子类', '吞吞吐吐', 'https://admin.mijia321.com/static/upload/f1a360f04248ba32/02e06403821912f2.png', 0, 1, 0, '2018-07-11 03:31:51'),
	(6, 2, 0, '枕芯子类', '', 'https://admin.mijia321.com/static/upload/fec82092cb3405cc/cefd3bfb70a3c080.png', 0, 1, 0, '2018-09-17 07:29:38'),
	(7, 3, 0, '套件子类', '', 'https://admin.mijia321.com/static/upload/62a4f8f956822c5b/2e6251636de8bbd5.png', 0, 1, 0, '2018-09-17 07:30:59'),
	(8, 1, 0, '被芯子类', '', 'https://admin.mijia321.com/static/upload/f1ae4b809166c2ba/58c3fdcfceea8aa6.png', 0, 1, 0, '2018-09-17 07:31:22'),
	(9, 4, 0, '二类', '2222', 'https://admin.mijia321.com/static/upload/d481af1cce3bc3db/874b64a4b4c1710c.png', 0, 1, 0, '2018-09-18 06:38:33'),
	(10, 4, 0, '三类', '333', 'https://admin.mijia321.com/static/upload/3dd5c60c944e82c5/144b2d281abaf5ee.png', 0, 1, 0, '2018-09-18 06:38:54'),
	(11, 4, 0, '四类', '444', 'https://admin.mijia321.com/static/upload/254d163d8b3b6396/eda3a76294b250fe.png', 0, 1, 0, '2018-09-18 06:39:30'),
	(12, 1, 0, '背心', '44', 'http://127.0.0.1:8080/profile/upload/2019/08/23/2e593ef4098a5c1758c11e2539f5962b.png', 0, 1, 0, '2019-08-23 09:44:50'),
	(13, 0, 0, '电脑', NULL, '', 0, 1, 0, '2022-10-11 14:29:21'),
	(14, 13, 0, '戴尔', NULL, '', 0, 1, 0, '2022-10-12 15:21:08');

-- 导出  表 supply_shop.store_goods_collect 结构
DROP TABLE IF EXISTS `store_goods_collect`;
CREATE TABLE IF NOT EXISTS `store_goods_collect` (
  `collect_id` mediumint unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `user_id` mediumint unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `goods_id` mediumint unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `add_time` datetime DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`collect_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `goods_id` (`goods_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=422 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='商品收藏表';

-- 正在导出表  supply_shop.store_goods_collect 的数据：~10 rows (大约)
DELETE FROM `store_goods_collect`;
INSERT INTO `store_goods_collect` (`collect_id`, `user_id`, `goods_id`, `add_time`) VALUES
	(342, 3, 6, '0000-00-00 00:00:00'),
	(352, 2, 5, '0000-00-00 00:00:00'),
	(361, 5, 4, '0000-00-00 00:00:00'),
	(398, 3, 5, '0000-00-00 00:00:00'),
	(406, 2, 4, '0000-00-00 00:00:00'),
	(410, 7, 4, '0000-00-00 00:00:00'),
	(412, 7, 5, '0000-00-00 00:00:00'),
	(414, 7, 6, '0000-00-00 00:00:00'),
	(415, 7, 7, '0000-00-00 00:00:00'),
	(420, 3, 4, '2019-09-10 07:06:18'),
	(421, 3, 7, '2022-10-11 15:33:33');

-- 导出  表 supply_shop.store_goods_consult 结构
DROP TABLE IF EXISTS `store_goods_consult`;
CREATE TABLE IF NOT EXISTS `store_goods_consult` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '商品咨询id',
  `goods_id` int DEFAULT '0' COMMENT '商品id',
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '网名',
  `add_time` int DEFAULT '0' COMMENT '咨询时间',
  `consult_type` tinyint(1) DEFAULT '1' COMMENT '1 商品咨询 2 支付咨询 3 配送 4 售后',
  `content` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '咨询内容',
  `parent_id` int DEFAULT '0' COMMENT '父id 用于管理员回复',
  `is_show` tinyint(1) DEFAULT '0' COMMENT '是否显示',
  `status` tinyint(1) DEFAULT '0' COMMENT '管理员回复状态，0未回复，1已回复',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC COMMENT='商品咨询表';

-- 正在导出表  supply_shop.store_goods_consult 的数据：~0 rows (大约)
DELETE FROM `store_goods_consult`;

-- 导出  表 supply_shop.store_goods_coupon 结构
DROP TABLE IF EXISTS `store_goods_coupon`;
CREATE TABLE IF NOT EXISTS `store_goods_coupon` (
  `coupon_id` int NOT NULL COMMENT '优惠券id',
  `goods_id` int NOT NULL DEFAULT '0' COMMENT '指定的商品id：为零表示不指定商品',
  `goods_category_id` smallint NOT NULL DEFAULT '0' COMMENT '指定的商品分类：为零表示不指定分类',
  PRIMARY KEY (`coupon_id`,`goods_id`,`goods_category_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC COMMENT='优惠券与商品关联表';

-- 正在导出表  supply_shop.store_goods_coupon 的数据：~0 rows (大约)
DELETE FROM `store_goods_coupon`;

-- 导出  表 supply_shop.store_goods_images 结构
DROP TABLE IF EXISTS `store_goods_images`;
CREATE TABLE IF NOT EXISTS `store_goods_images` (
  `img_id` mediumint unsigned NOT NULL AUTO_INCREMENT COMMENT '图片id 自增',
  `goods_id` mediumint unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `image_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '图片地址',
  PRIMARY KEY (`img_id`) USING BTREE,
  KEY `goods_id` (`goods_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=552 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='商品相册';

-- 正在导出表  supply_shop.store_goods_images 的数据：~2 rows (大约)
DELETE FROM `store_goods_images`;
INSERT INTO `store_goods_images` (`img_id`, `goods_id`, `image_url`) VALUES
	(550, 4, 'http://www.testxcx.com/static/upload/be60005fd9d0feec/4b2fd19ee6688227.png'),
	(551, 5, 'http://www.testxcx.com/static/upload/0b65e460d8f9328c/dc837982e81cec43.png');

-- 导出  表 supply_shop.store_goods_type 结构
DROP TABLE IF EXISTS `store_goods_type`;
CREATE TABLE IF NOT EXISTS `store_goods_type` (
  `id` smallint unsigned NOT NULL AUTO_INCREMENT COMMENT 'id自增',
  `name` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '类型名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='商品类型(商品模型)表';

-- 正在导出表  supply_shop.store_goods_type 的数据：~4 rows (大约)
DELETE FROM `store_goods_type`;
INSERT INTO `store_goods_type` (`id`, `name`) VALUES
	(37, '被芯'),
	(38, '套件'),
	(39, '大豆'),
	(40, '手机'),
	(41, '电脑');

-- 导出  表 supply_shop.store_goods_visit 结构
DROP TABLE IF EXISTS `store_goods_visit`;
CREATE TABLE IF NOT EXISTS `store_goods_visit` (
  `visit_id` int NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `goods_id` int NOT NULL COMMENT '商品ID',
  `user_id` int NOT NULL COMMENT '会员ID',
  `visittime` int NOT NULL COMMENT '浏览时间',
  `cat_id` int NOT NULL COMMENT '商品分类ID',
  `extend_cat_id` int NOT NULL COMMENT '商品扩展分类ID',
  PRIMARY KEY (`goods_id`,`user_id`,`visit_id`) USING BTREE,
  KEY `visit_id` (`visit_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=747 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED COMMENT='商品浏览历史表';

-- 正在导出表  supply_shop.store_goods_visit 的数据：0 rows
DELETE FROM `store_goods_visit`;
/*!40000 ALTER TABLE `store_goods_visit` DISABLE KEYS */;
/*!40000 ALTER TABLE `store_goods_visit` ENABLE KEYS */;

-- 导出  表 supply_shop.store_member 结构
DROP TABLE IF EXISTS `store_member`;
CREATE TABLE IF NOT EXISTS `store_member` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `vip_no` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT 'vip编号',
  `openid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '会员微信OPENID',
  `phone` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '会员手机号',
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '登录密码',
  `nickname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '会员昵称',
  `headimg` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '会员头像',
  `sex` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '性别',
  `level` tinyint unsigned DEFAULT '1' COMMENT '会员级别',
  `total_amount` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '消费累计额度 用于用户等级',
  `user_money` decimal(8,2) DEFAULT '0.00' COMMENT '用户金额',
  `distribut_money` decimal(8,2) unsigned DEFAULT '0.00' COMMENT '累积分佣金额',
  `frozen_money` double(8,2) unsigned DEFAULT '0.00' COMMENT '冻结金额',
  `underling_number` int unsigned DEFAULT '0' COMMENT '用户下线总数',
  `pay_points` int unsigned DEFAULT '0' COMMENT '消费积分',
  `address_id` int unsigned DEFAULT '0' COMMENT '默认收货地址',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '会员个性签名',
  `status` tinyint unsigned DEFAULT '0' COMMENT '会员状态0待审核 1-已审核 2-已拒绝',
  `create_time` datetime DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `status_time` bigint unsigned DEFAULT '0' COMMENT '审核时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `index_store_member_openid` (`openid`) USING BTREE,
  KEY `index_store_member_phone` (`phone`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='商城会员信息';

-- 正在导出表  supply_shop.store_member 的数据：~9 rows (大约)
DELETE FROM `store_member`;
INSERT INTO `store_member` (`id`, `vip_no`, `openid`, `phone`, `password`, `nickname`, `headimg`, `sex`, `level`, `total_amount`, `user_money`, `distribut_money`, `frozen_money`, `underling_number`, `pay_points`, `address_id`, `remark`, `status`, `create_time`, `create_at`, `status_time`) VALUES
	(1, NULL, '888787', '15601064107', 'e10adc3949ba59abbe56e057f20f883e', '高', 'tt', '1', 6, 0.00, 93.60, 0.00, 0.00, 0, 0, 0, '333', 1, '0000-00-00 00:00:00', '2018-05-23 06:42:25', 0),
	(2, '', 'orIMY4ykNo4p1k5fiHcVYd2GLdO8', '17610570135', 'e10adc3949ba59abbe56e057f20f883e', '高晓松', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIzjkjtD1YuSoGz5EFV80luIywsVch8cx4Dgrc3rM6vWkFRaNBJ7QjoQ4ibyPZar8oL4U4YMG1E1xg/132', '1', 1, 0.00, 7920.00, 0.00, 0.00, 0, 0, 0, '', 1, '0000-00-00 00:00:00', '2018-09-16 13:22:29', 0),
	(3, '', 'orIMY4xGhMmipwFZoSL1vOhUNFZ0', '15136175246', 'e10adc3949ba59abbe56e057f20f883e', '胡鹏', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83erkH5E5lvlWSAaoT1icTe79tGnKXtqicTUC2cOibOqJOIm4s7aKN4kXvxTAMb6pqoOSoVrJtfic1UDUFg/132', '1', 1, 0.00, 18947.00, 0.00, 0.00, 0, 0, 0, '', 1, '0000-00-00 00:00:00', '2018-09-17 07:16:34', 0),
	(4, '', 'orIMY47plZ1wxgJKkgme2Kp0dSGs', '', 'e10adc3949ba59abbe56e057f20f883e', '哈哈sjs', 'https://wx.qlogo.cn/mmopen/vi_32/vplr46pWKGgjozY7OkWFNPbZ1TaPOoFJphUictCKSPZL19VGrkyAGsk9AU4VZwGUU0FNzHZEJY9U7LbYAVwVXKQ/132', '0', 1, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, '', 2, '0000-00-00 00:00:00', '2018-09-17 07:54:42', 0),
	(5, '', 'orIMY4z3mBo7ybJ4l0MbjSkd1KMs', '', 'e10adc3949ba59abbe56e057f20f883e', '阿星xlh(十分之九)', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eqp5Fqia2pfV0Gh4Sf6jL2n0JGhxKiaiaRkSXg52RvStkfhxXUCAkud4lNRx2Mv6XSjZw6CMHIzDcicRg/132', '1', 1, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, '', 0, '0000-00-00 00:00:00', '2018-09-17 08:14:19', 0),
	(6, '', 'orIMY4-Mz71H4437G_kwUP5OteQc', '', 'e10adc3949ba59abbe56e057f20f883e', '隐形少女', 'https://wx.qlogo.cn/mmopen/vi_32/DVCIYncKXic6BAf4KL7ewRVxeKwUyeC7yqPnMWLYib7tX1kzxMgac7ib261RqibshfELUyicgEuh8FEDCEBkS5HXU6w/132', '0', 1, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, '', 0, '0000-00-00 00:00:00', '2018-09-17 08:28:09', 0),
	(7, '', 'orIMY48OXLkkc2SGs--N0A9tfDKM', '18905970273', 'e10adc3949ba59abbe56e057f20f883e', '林建宾', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eqgqwibl6cHtTbibl5M7xFQw1nd7ab6OfNg7iaRZYshmLVXNsbvx55JaMlicyJspybAqrFFghhNA2hDSw/132', '1', 5, 0.00, 8749.90, 0.00, 0.00, 0, 0, 0, '', 1, '0000-00-00 00:00:00', '2018-09-17 08:50:23', 0),
	(13, '', 'oCT7L6VPpm1-Of_zMFbz8hnDM7iY', '', '', 'Tian', 'https://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTL7Er3y3iarLhBc5eKnWy7ulB1V30wPGlIOibXL5r7scmzsynKbyz7DicCHwed5tdJ0MbwtacuiaMZC1w/132', '0', 1, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, '', 0, '2022-12-04 15:41:42', '2022-12-04 15:41:42', 0);

-- 导出  表 supply_shop.store_member_address 结构
DROP TABLE IF EXISTS `store_member_address`;
CREATE TABLE IF NOT EXISTS `store_member_address` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `mid` bigint unsigned DEFAULT '0' COMMENT '会员ID',
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '收货人姓名',
  `phone` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '收货手机号',
  `province` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '收货地址省份',
  `city` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '收货地址城市',
  `area` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '收货地址区域',
  `city_info` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '城市信息',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '收货详细地址',
  `status` tinyint unsigned DEFAULT '1' COMMENT '状态(0无效, 1新快递)',
  `is_default` tinyint unsigned DEFAULT '1' COMMENT '默认收货地址',
  `is_deleted` bigint unsigned DEFAULT '0' COMMENT '删除状态(1删除,0未删除)',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='商城会员收货地址';

-- 正在导出表  supply_shop.store_member_address 的数据：~6 rows (大约)
DELETE FROM `store_member_address`;
INSERT INTO `store_member_address` (`id`, `mid`, `username`, `phone`, `province`, `city`, `area`, `city_info`, `address`, `status`, `is_default`, `is_deleted`, `create_at`) VALUES
	(4, 1, 'hupeng', '15136175847', '', '', '', '河南郑州', '工商', 1, 1, 0, '2018-09-09 06:13:18'),
	(5, 2, 'asdsdsd', '15601064107', '', '', '', '北京市市辖区东城区', '12121212', 1, 1, 0, '2018-09-16 14:29:48'),
	(7, 7, '煎饼', '18905970273', '', '', '', '北京市市辖区东城区', '11号', 1, 1, 0, '2018-09-17 09:23:27'),
	(8, 3, '胡鹏', '15136175246', '', '', '', '北京市市辖区东城区', '75', 1, 1, 0, '2018-09-18 11:32:55'),
	(9, 2, '122', '15601064107', '', '', '', '北京市市辖区东城区', '1', 1, 1, 0, '2018-10-08 14:47:11'),
	(10, 3, 'hupeng233', '15136175247', '', '', '', '河南郑州', '77号', 1, 0, 0, '2019-09-15 09:56:30'),
	(11, 13, '田正旺', '17764590774', '', '', '', '陕西省西安市市辖区', '巴厘公馆', 1, 1, 0, '2022-12-04 16:04:47');

-- 导出  表 supply_shop.store_order 结构
DROP TABLE IF EXISTS `store_order`;
CREATE TABLE IF NOT EXISTS `store_order` (
  `order_id` mediumint unsigned NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `order_sn` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '订单编号',
  `user_id` mediumint unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `order_status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '订单状态 0-未确认 1-已确认(已收货） 2-已评价',
  `shipping_status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '发货状态 0-未发货 1-已发货 2-退货中 3-退货完成',
  `pay_status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '支付状态 0-未支付 1-已支付',
  `consignee` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '收货人',
  `country` int unsigned DEFAULT '0' COMMENT '国家',
  `province` int unsigned DEFAULT '0' COMMENT '省份',
  `city` int unsigned DEFAULT '0' COMMENT '城市',
  `district` int unsigned DEFAULT '0' COMMENT '县区',
  `twon` int DEFAULT '0' COMMENT '乡镇',
  `city_info` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '地区地址',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '地址详细地址',
  `zipcode` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '邮政编码',
  `mobile` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '手机',
  `email` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '邮件',
  `receive_type` tinyint unsigned DEFAULT '1' COMMENT '收货方式 1-物流 2-快递 3-自取',
  `shipping_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '物流code 单号',
  `shipping_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '物流名称',
  `pay_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '支付code',
  `pay_method` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '支付方式1-微信2-余额3-转账',
  `recharge_id` int unsigned DEFAULT '0' COMMENT '支付方式为转账的转账id',
  `pay_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '支付方式名称',
  `invoice_title` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '发票抬头',
  `taxpayer` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '纳税人识别号',
  `goods_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品总价',
  `shipping_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '邮费',
  `user_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '使用余额',
  `coupon_price` decimal(10,2) DEFAULT '0.00' COMMENT '优惠券抵扣',
  `integral` int unsigned NOT NULL DEFAULT '0' COMMENT '使用积分',
  `integral_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '使用积分抵多少钱',
  `order_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '应付款金额',
  `total_amount` decimal(10,2) DEFAULT '0.00' COMMENT '订单总价',
  `add_time` datetime NOT NULL COMMENT '下单时间',
  `shipping_time` int DEFAULT '0' COMMENT '最后新发货时间',
  `confirm_time` int DEFAULT '0' COMMENT '收货确认时间',
  `pay_time` int unsigned NOT NULL DEFAULT '0' COMMENT '支付时间',
  `transaction_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '第三方平台交易流水号',
  `prom_id` int unsigned DEFAULT '0' COMMENT '活动ID',
  `prom_type` tinyint unsigned DEFAULT '0' COMMENT '订单类型：0普通订单4预售订单5虚拟订单6拼团订单',
  `order_prom_id` smallint NOT NULL DEFAULT '0' COMMENT '活动id',
  `order_prom_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '活动优惠金额',
  `discount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '价格调整',
  `user_note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '用户备注',
  `admin_note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '管理员备注',
  `parent_sn` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '父单单号',
  `is_distribut` tinyint(1) DEFAULT '0' COMMENT '是否已分成0未分成1已分成',
  `paid_money` decimal(10,2) DEFAULT '0.00' COMMENT '订金',
  `deleted_time` int unsigned DEFAULT '0' COMMENT '删除|取消时间',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户假删除标识,1:删除,0未删除',
  `edit_money` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '0.00' COMMENT '管理后台修改变动的价格',
  PRIMARY KEY (`order_id`) USING BTREE,
  UNIQUE KEY `order_sn` (`order_sn`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `add_time` (`add_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1873 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='订单主表';

-- 正在导出表  supply_shop.store_order 的数据：~5 rows (大约)
DELETE FROM `store_order`;
INSERT INTO `store_order` (`order_id`, `order_sn`, `user_id`, `order_status`, `shipping_status`, `pay_status`, `consignee`, `country`, `province`, `city`, `district`, `twon`, `city_info`, `address`, `zipcode`, `mobile`, `email`, `receive_type`, `shipping_code`, `shipping_name`, `pay_code`, `pay_method`, `recharge_id`, `pay_name`, `invoice_title`, `taxpayer`, `goods_price`, `shipping_price`, `user_money`, `coupon_price`, `integral`, `integral_money`, `order_amount`, `total_amount`, `add_time`, `shipping_time`, `confirm_time`, `pay_time`, `transaction_id`, `prom_id`, `prom_type`, `order_prom_id`, `order_prom_amount`, `discount`, `user_note`, `admin_note`, `parent_sn`, `is_distribut`, `paid_money`, `deleted_time`, `deleted`, `edit_money`) VALUES
	(1865, '20190914144718326', 3, 0, 0, 0, 'hupeng', 0, 0, 0, 0, 0, '河南郑州', '工商', '', '15136175847', '', 2, '', '', '', 0, 0, '', '', '', 430.00, 0.00, 0.00, 0.00, 0, 0.00, 430.00, 430.00, '2019-09-14 06:47:18', 0, 0, 0, NULL, 0, 0, 0, 0.00, 0.00, '', '', NULL, 0, 0.00, 1568622248, 1, '0.00'),
	(1866, '20190914145142303', 3, 0, 0, 0, 'hupeng', 0, 0, 0, 0, 0, '河南郑州', '工商', '', '15136175847', '', 2, '', '', '', 0, 0, '', '', '', 430.00, 0.00, 0.00, 50.00, 0, 0.00, 380.00, 430.00, '2019-09-14 06:51:42', 0, 0, 0, NULL, 0, 0, 0, 0.00, 0.00, '', '', NULL, 0, 0.00, 1665498108, 1, '0.00'),
	(1867, '20190916155320142', 3, 0, 0, 0, 'hupeng', 0, 0, 0, 0, 0, '河南郑州', '工商', '', '15136175847', '', 2, '', '', '', 0, 0, '', '', '', 430.00, 0.00, 0.00, 50.00, 0, 0.00, 380.00, 430.00, '2019-09-16 07:53:20', 0, 0, 0, NULL, 0, 0, 0, 0.00, 0.00, '', '', NULL, 0, 0.00, 1665498112, 1, '0.00'),
	(1868, '20190916155438712', 3, 0, 0, 0, 'hupeng', 0, 0, 0, 0, 0, '河南郑州', '工商', '', '15136175847', '', 2, '', '', '', 0, 0, '', '', '', 430.00, 0.00, 0.00, 50.00, 0, 0.00, 380.00, 430.00, '2019-09-16 07:54:39', 0, 0, 0, NULL, 0, 0, 0, 0.00, 0.00, '', '', NULL, 0, 0.00, 1665498115, 1, '0.00'),
	(1869, '20210618155907483', 3, 0, 0, 0, '胡鹏', 0, 0, 0, 0, 0, '北京市市辖区东城区', '75', '', '15136175246', '', 2, '', '', '', 0, 0, '', '', '', 88.00, 0.00, 0.00, 0.00, 0, 0.00, 88.00, 88.00, '2021-06-18 07:59:08', 0, 0, 0, NULL, 0, 0, 0, 0.00, 0.00, '', '', NULL, 0, 0.00, 1665498118, 1, '0.00'),
	(1870, '20221120014219642', 3, 0, 0, 1, 'hupeng233', 0, 0, 0, 0, 0, '河南郑州', '77号', '', '15136175247', '', 2, '', '', '', 2, 0, '', '', '', 88.00, 0.00, 88.00, 0.00, 0, 0.00, 88.00, 88.00, '2022-11-19 17:42:20', 0, 0, 1668879746, NULL, 0, 0, 0, 0.00, 0.00, '', '', NULL, 0, 0.00, 0, 0, '0.00'),
	(1871, '20221205000529687', 13, 0, 0, 0, '田正旺', 0, 0, 0, 0, 0, '陕西省西安市市辖区', '巴厘公馆', '', '17764590774', '', 2, '', '', '', 0, 0, '', '', '', 33.00, 0.00, 0.00, 0.00, 0, 0.00, 33.00, 33.00, '2022-12-04 16:05:30', 0, 0, 0, NULL, 0, 0, 0, 0.00, 0.00, '', '', NULL, 0, 0.00, 0, 0, '0.00'),
	(1872, '20230107192443848', 13, 0, 0, 0, '田正旺', 0, 0, 0, 0, 0, '陕西省西安市市辖区', '巴厘公馆', '', '17764590774', '', 2, '', '', '', 0, 0, '', '', '', 80.00, 0.00, 0.00, 0.00, 0, 0.00, 80.00, 80.00, '2023-01-07 11:24:44', 0, 0, 0, NULL, 0, 0, 0, 0.00, 0.00, '', '', NULL, 0, 0.00, 0, 0, '0.00');

-- 导出  表 supply_shop.store_order_action 结构
DROP TABLE IF EXISTS `store_order_action`;
CREATE TABLE IF NOT EXISTS `store_order_action` (
  `action_id` mediumint unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `order_id` mediumint unsigned NOT NULL DEFAULT '0' COMMENT '订单ID',
  `action_user` int DEFAULT '0' COMMENT '操作人 0 为用户操作，其他为管理员id',
  `order_status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '订单状态',
  `shipping_status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '配送状态',
  `pay_status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '支付状态',
  `action_note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '操作备注',
  `log_time` int unsigned NOT NULL DEFAULT '0' COMMENT '操作时间',
  `status_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '状态描述',
  PRIMARY KEY (`action_id`) USING BTREE,
  KEY `order_id` (`order_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2532 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='订单日志表';

-- 正在导出表  supply_shop.store_order_action 的数据：~133 rows (大约)
DELETE FROM `store_order_action`;
INSERT INTO `store_order_action` (`action_id`, `order_id`, `action_user`, `order_status`, `shipping_status`, `pay_status`, `action_note`, `log_time`, `status_desc`) VALUES
	(2399, 1639, 0, 0, 0, 0, '提交订单', 1532162093, '提交订单'),
	(2400, 1640, 0, 0, 0, 0, '提交订单', 1532162249, '提交订单'),
	(2401, 1644, 0, 0, 0, 0, '提交订单', 1532164170, '提交订单'),
	(2402, 1654, 0, 0, 0, 0, '提交订单', 1532167441, '提交订单'),
	(2403, 1645, 0, 0, 0, 0, '提交订单', 1533385350, '提交订单'),
	(2404, 1646, 0, 0, 0, 0, '提交订单', 1534403096, '提交订单'),
	(2405, 1647, 0, 0, 0, 0, '提交订单', 1534403121, '提交订单'),
	(2406, 1648, 0, 0, 0, 0, '提交订单', 1535834099, '提交订单'),
	(2407, 1649, 0, 0, 0, 0, '提交订单', 1535834159, '提交订单'),
	(2408, 1650, 0, 0, 0, 0, '提交订单', 1535837956, '提交订单'),
	(2409, 1651, 0, 0, 0, 0, '提交订单', 1535844518, '提交订单'),
	(2410, 1652, 0, 0, 0, 0, '提交订单', 1535844596, '提交订单'),
	(2411, 1653, 0, 0, 0, 0, '提交订单', 1535844646, '提交订单'),
	(2412, 1654, 0, 0, 0, 0, '提交订单', 1536823694, '提交订单'),
	(2413, 1655, 0, 0, 0, 0, '提交订单', 1536824019, '提交订单'),
	(2414, 1656, 0, 0, 0, 0, '提交订单', 1536824097, '提交订单'),
	(2415, 1657, 0, 0, 0, 0, '提交订单', 1536824141, '提交订单'),
	(2416, 1658, 0, 0, 0, 0, '提交订单', 1536824194, '提交订单'),
	(2417, 1659, 0, 0, 0, 0, '提交订单', 1537030930, '提交订单'),
	(2418, 1660, 0, 0, 0, 0, '提交订单', 1537030934, '提交订单'),
	(2419, 1661, 0, 0, 0, 0, '提交订单', 1537031075, '提交订单'),
	(2420, 1662, 0, 0, 0, 0, '提交订单', 1537031219, '提交订单'),
	(2421, 1677, 0, 0, 0, 0, '提交订单', 1537108423, '提交订单'),
	(2422, 1678, 0, 0, 0, 0, '提交订单', 1537108524, '提交订单'),
	(2423, 1679, 0, 0, 0, 0, '提交订单', 1537108576, '提交订单'),
	(2424, 1684, 0, 0, 0, 0, '提交订单', 1537109116, '提交订单'),
	(2425, 1693, 0, 0, 0, 0, '提交订单', 1537161179, '提交订单'),
	(2426, 1694, 0, 0, 0, 0, '提交订单', 1537162922, '提交订单'),
	(2427, 1695, 0, 0, 0, 0, '提交订单', 1537239234, '提交订单'),
	(2428, 1696, 0, 0, 0, 0, '提交订单', 1537257195, '提交订单'),
	(2429, 1697, 0, 0, 0, 0, '提交订单', 1537257199, '提交订单'),
	(2430, 1698, 0, 0, 0, 0, '提交订单', 1537257498, '提交订单'),
	(2431, 1699, 0, 0, 0, 0, '提交订单', 1537257887, '提交订单'),
	(2432, 1700, 0, 0, 0, 0, '提交订单', 1537262124, '提交订单'),
	(2433, 1701, 0, 0, 0, 0, '提交订单', 1537263206, '提交订单'),
	(2434, 1702, 0, 0, 0, 0, '提交订单', 1537263210, '提交订单'),
	(2435, 1703, 0, 0, 0, 0, '提交订单', 1537263211, '提交订单'),
	(2436, 1704, 0, 0, 0, 0, '提交订单', 1537263214, '提交订单'),
	(2437, 1705, 0, 0, 0, 0, '提交订单', 1537263219, '提交订单'),
	(2438, 1706, 0, 0, 0, 0, '提交订单', 1537270871, '提交订单'),
	(2439, 1707, 0, 0, 0, 0, '提交订单', 1537270886, '提交订单'),
	(2440, 1708, 0, 0, 0, 0, '提交订单', 1537270925, '提交订单'),
	(2441, 1709, 0, 0, 0, 0, '提交订单', 1537270979, '提交订单'),
	(2442, 1710, 0, 0, 0, 0, '提交订单', 1537270988, '提交订单'),
	(2443, 1711, 0, 0, 0, 0, '提交订单', 1537271353, '提交订单'),
	(2444, 1712, 0, 0, 0, 0, '提交订单', 1537272869, '提交订单'),
	(2445, 1713, 0, 0, 0, 0, '提交订单', 1537319156, '提交订单'),
	(2446, 1714, 0, 0, 0, 0, '提交订单', 1537324464, '提交订单'),
	(2447, 1715, 0, 0, 0, 0, '提交订单', 1537324508, '提交订单'),
	(2448, 1716, 0, 0, 0, 0, '提交订单', 1537428026, '提交订单'),
	(2449, 1717, 0, 0, 0, 0, '提交订单', 1537781187, '提交订单'),
	(2450, 1718, 0, 0, 0, 0, '提交订单', 1537781440, '提交订单'),
	(2451, 1719, 0, 0, 0, 0, '提交订单', 1537781644, '提交订单'),
	(2452, 1720, 0, 0, 0, 0, '提交订单', 1537781707, '提交订单'),
	(2453, 1721, 0, 0, 0, 0, '提交订单', 1537781743, '提交订单'),
	(2454, 1722, 0, 0, 0, 0, '提交订单', 1537781830, '提交订单'),
	(2455, 1723, 0, 0, 0, 0, '提交订单', 1537782033, '提交订单'),
	(2456, 1724, 0, 0, 0, 0, '提交订单', 1537782097, '提交订单'),
	(2457, 1725, 0, 0, 0, 0, '提交订单', 1537782123, '提交订单'),
	(2458, 1726, 0, 0, 0, 0, '提交订单', 1537782501, '提交订单'),
	(2459, 1727, 0, 0, 0, 0, '提交订单', 1537782856, '提交订单'),
	(2460, 1728, 0, 0, 0, 0, '提交订单', 1537783035, '提交订单'),
	(2461, 1729, 0, 0, 0, 0, '提交订单', 1537783179, '提交订单'),
	(2462, 1730, 0, 0, 0, 0, '提交订单', 1537783250, '提交订单'),
	(2463, 1731, 0, 0, 0, 0, '提交订单', 1537783316, '提交订单'),
	(2464, 1732, 0, 0, 0, 0, '提交订单', 1537783357, '提交订单'),
	(2465, 1733, 0, 0, 0, 0, '提交订单', 1537793998, '提交订单'),
	(2466, 1734, 0, 0, 0, 0, '提交订单', 1537794348, '提交订单'),
	(2467, 1735, 0, 0, 0, 0, '提交订单', 1537794481, '提交订单'),
	(2468, 1736, 0, 0, 0, 0, '提交订单', 1537794594, '提交订单'),
	(2469, 1737, 0, 0, 0, 0, '提交订单', 1537794695, '提交订单'),
	(2470, 1738, 0, 0, 0, 0, '提交订单', 1537857037, '提交订单'),
	(2471, 1739, 0, 0, 0, 0, '提交订单', 1537857049, '提交订单'),
	(2472, 1740, 0, 0, 0, 0, '提交订单', 1537857255, '提交订单'),
	(2473, 1741, 0, 0, 0, 0, '提交订单', 1537858164, '提交订单'),
	(2474, 1742, 0, 0, 0, 0, '提交订单', 1537858183, '提交订单'),
	(2475, 1743, 0, 0, 0, 0, '提交订单', 1537859564, '提交订单'),
	(2476, 1744, 0, 0, 0, 0, '提交订单', 1537984972, '提交订单'),
	(2477, 1745, 0, 0, 0, 0, '提交订单', 1537985784, '提交订单'),
	(2478, 1746, 0, 0, 0, 0, '提交订单', 1537985891, '提交订单'),
	(2479, 1747, 0, 0, 0, 0, '提交订单', 1537986005, '提交订单'),
	(2480, 1748, 0, 0, 0, 0, '提交订单', 1537986071, '提交订单'),
	(2481, 1749, 0, 0, 0, 0, '提交订单', 1537986166, '提交订单'),
	(2482, 1750, 0, 0, 0, 0, '提交订单', 1537986239, '提交订单'),
	(2483, 1751, 0, 0, 0, 0, '提交订单', 1538017689, '提交订单'),
	(2484, 1752, 0, 0, 0, 0, '提交订单', 1538020131, '提交订单'),
	(2485, 1753, 0, 0, 0, 0, '提交订单', 1538028524, '提交订单'),
	(2486, 1754, 0, 0, 0, 0, '提交订单', 1538029012, '提交订单'),
	(2487, 1755, 0, 0, 0, 0, '提交订单', 1538029150, '提交订单'),
	(2488, 1756, 0, 0, 0, 0, '提交订单', 1538029324, '提交订单'),
	(2489, 1757, 0, 0, 0, 0, '提交订单', 1538029374, '提交订单'),
	(2490, 1759, 0, 0, 0, 0, '提交订单', 1538029913, '提交订单'),
	(2491, 1760, 0, 0, 0, 0, '提交订单', 1538030053, '提交订单'),
	(2492, 1761, 0, 0, 0, 0, '提交订单', 1538030112, '提交订单'),
	(2493, 1762, 0, 0, 0, 0, '提交订单', 1538031214, '提交订单'),
	(2494, 1763, 0, 0, 0, 0, '提交订单', 1538032281, '提交订单'),
	(2495, 1764, 0, 0, 0, 0, '提交订单', 1538118400, '提交订单'),
	(2496, 1765, 0, 0, 0, 0, '提交订单', 1539021632, '提交订单'),
	(2497, 1766, 0, 0, 0, 0, '提交订单', 1539021653, '提交订单'),
	(2498, 1807, 0, 0, 0, 0, '提交订单', 1539050142, '提交订单'),
	(2499, 1824, 0, 0, 0, 0, '提交订单', 1539070576, '提交订单'),
	(2500, 1825, 0, 0, 0, 0, '提交订单', 1539085347, '提交订单'),
	(2501, 1826, 0, 0, 0, 0, '提交订单', 1539202763, '提交订单'),
	(2502, 1827, 0, 0, 0, 0, '提交订单', 1539202903, '提交订单'),
	(2503, 1828, 0, 0, 0, 0, '提交订单', 1539203031, '提交订单'),
	(2504, 1829, 0, 0, 0, 0, '提交订单', 1539203175, '提交订单'),
	(2505, 1830, 0, 0, 0, 0, '提交订单', 1539221033, '提交订单'),
	(2506, 1831, 0, 0, 0, 0, '提交订单', 1539221242, '提交订单'),
	(2507, 1832, 0, 0, 0, 0, '提交订单', 1539221608, '提交订单'),
	(2508, 1833, 0, 0, 0, 0, '提交订单', 1539221713, '提交订单'),
	(2509, 1834, 0, 0, 0, 0, '提交订单', 1539222188, '提交订单'),
	(2510, 1835, 0, 0, 0, 0, '提交订单', 1539226781, '提交订单'),
	(2511, 1836, 0, 0, 0, 0, '提交订单', 1539227751, '提交订单'),
	(2512, 1837, 0, 0, 0, 0, '提交订单', 1539227776, '提交订单'),
	(2513, 1838, 0, 0, 0, 0, '提交订单', 1539227883, '提交订单'),
	(2514, 1839, 0, 0, 0, 0, '提交订单', 1539229117, '提交订单'),
	(2515, 1840, 0, 0, 0, 0, '提交订单', 1539229166, '提交订单'),
	(2516, 1841, 0, 0, 0, 0, '提交订单', 1539236921, '提交订单'),
	(2517, 1842, 0, 0, 0, 0, '提交订单', 1539237126, '提交订单'),
	(2518, 1843, 0, 0, 0, 0, '提交订单', 1539237440, '提交订单'),
	(2519, 1844, 0, 0, 0, 0, '提交订单', 1539239633, '提交订单'),
	(2520, 1845, 0, 0, 0, 0, '提交订单', 1539240265, '提交订单'),
	(2521, 1846, 0, 0, 0, 0, '提交订单', 1539243144, '提交订单'),
	(2522, 1847, 0, 0, 0, 0, '提交订单', 1539243174, '提交订单'),
	(2523, 1848, 0, 0, 0, 0, '提交订单', 1539243178, '提交订单'),
	(2524, 1849, 0, 0, 0, 0, '提交订单', 1539243185, '提交订单'),
	(2525, 1850, 0, 0, 0, 0, '提交订单', 1539243850, '提交订单'),
	(2526, 1851, 0, 0, 0, 0, '提交订单', 1539243886, '提交订单'),
	(2527, 1852, 0, 0, 0, 0, '提交订单', 1539243926, '提交订单'),
	(2528, 1853, 0, 0, 0, 0, '提交订单', 1539244179, '提交订单'),
	(2529, 1854, 0, 0, 0, 0, '提交订单', 1539244316, '提交订单'),
	(2530, 1855, 0, 0, 0, 0, '提交订单', 1539351145, '提交订单'),
	(2531, 1856, 0, 0, 0, 0, '提交订单', 1540269401, '提交订单');

-- 导出  表 supply_shop.store_order_express 结构
DROP TABLE IF EXISTS `store_order_express`;
CREATE TABLE IF NOT EXISTS `store_order_express` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `mid` bigint unsigned DEFAULT '0' COMMENT '会员ID',
  `type` tinyint unsigned DEFAULT '0' COMMENT '快递类型(0.订单快递,1.退货快递)',
  `order_no` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '订单编号',
  `company_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '物流公司名称',
  `company_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '物流公司编码',
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '收货人姓名',
  `phone` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '收货手机号',
  `province` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '收货地址省份',
  `city` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '收货地址城市',
  `area` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '收货地址区域',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '收货详细地址',
  `send_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '实际物流公司单号',
  `send_company_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '实际发货快递公司',
  `send_company_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '实际发货快递代码',
  `send_username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '寄件人名称',
  `send_phone` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '寄件人手机号',
  `send_province` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '寄件人地址省份',
  `send_city` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '寄件人地址城市',
  `send_area` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '寄件人地址区域',
  `send_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '寄件人详细地址',
  `send_at` datetime DEFAULT NULL COMMENT '快递发货时间',
  `desc` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '发货描述',
  `status` tinyint unsigned DEFAULT '1' COMMENT '状态(0.无效,1.新快递,2.已签收,3.签收失败)',
  `is_deleted` bigint unsigned DEFAULT '0' COMMENT '删除状态(1删除,0未删除)',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='商城订单快递';

-- 正在导出表  supply_shop.store_order_express 的数据：~0 rows (大约)
DELETE FROM `store_order_express`;

-- 导出  表 supply_shop.store_order_goods 结构
DROP TABLE IF EXISTS `store_order_goods`;
CREATE TABLE IF NOT EXISTS `store_order_goods` (
  `rec_id` mediumint unsigned NOT NULL AUTO_INCREMENT COMMENT '表id自增',
  `order_id` mediumint unsigned NOT NULL DEFAULT '0' COMMENT '订单id',
  `goods_id` mediumint unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `goods_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商品名称',
  `goods_logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '',
  `goods_sn` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商品货号',
  `goods_num` smallint unsigned NOT NULL DEFAULT '1' COMMENT '购买数量',
  `market_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '市场价',
  `goods_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '本店价(供货价)',
  `cost_price` decimal(10,2) DEFAULT '0.00' COMMENT '商品成本价',
  `member_goods_price` decimal(10,2) DEFAULT '0.00' COMMENT '会员折扣价',
  `give_integral` mediumint unsigned DEFAULT '0' COMMENT '购买商品赠送积分',
  `spec_key` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '商品规格key',
  `spec_key_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '规格对应的中文名字',
  `bar_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '条码',
  `is_comment` tinyint(1) DEFAULT '0' COMMENT '是否评价',
  `prom_type` tinyint unsigned DEFAULT '0' COMMENT '0 普通订单,1 限时抢购, 2 团购 , 3 促销优惠,4预售',
  `prom_id` int unsigned DEFAULT '0' COMMENT '活动id',
  `is_send` tinyint(1) DEFAULT '0' COMMENT '0未发货，1已发货，2已换货，3已退货',
  `delivery_id` int DEFAULT '0' COMMENT '发货单ID',
  `sku` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT 'sku',
  PRIMARY KEY (`rec_id`) USING BTREE,
  KEY `order_id` (`order_id`) USING BTREE,
  KEY `goods_id` (`goods_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2182 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='订单商品表与订单主表关联';

-- 正在导出表  supply_shop.store_order_goods 的数据：~9 rows (大约)
DELETE FROM `store_order_goods`;
INSERT INTO `store_order_goods` (`rec_id`, `order_id`, `goods_id`, `goods_name`, `goods_logo`, `goods_sn`, `goods_num`, `market_price`, `goods_price`, `cost_price`, `member_goods_price`, `give_integral`, `spec_key`, `spec_key_name`, `bar_code`, `is_comment`, `prom_type`, `prom_id`, `is_send`, `delivery_id`, `sku`) VALUES
	(2170, 1865, 4, '小米8青春', '', '#10078', 2, 0.00, 80.00, 0.00, 0.00, 0, '8_11', '尺寸:300*500cm 颜色:黑色', '', 0, 0, 0, 0, 0, ''),
	(2171, 1865, 4, '小米8青春', '', '#10078', 3, 0.00, 90.00, 0.00, 0.00, 0, '8_12', '尺寸:300*500cm 颜色:紫色', '', 0, 0, 0, 0, 0, ''),
	(2172, 1866, 4, '小米8青春', '', '#10078', 2, 0.00, 80.00, 0.00, 0.00, 0, '8_11', '尺寸:300*500cm 颜色:黑色', '', 0, 0, 0, 0, 0, ''),
	(2173, 1866, 4, '小米8青春', '', '#10078', 3, 0.00, 90.00, 0.00, 0.00, 0, '8_12', '尺寸:300*500cm 颜色:紫色', '', 0, 0, 0, 0, 0, ''),
	(2174, 1867, 4, '小米8青春', 'https://admin.mijia321.com/static/upload/5941400cd87c37bb/c838a50cd6e02bc9.jpg', '#10078', 2, 0.00, 80.00, 0.00, 0.00, 0, '8_11', '尺寸:300*500cm 颜色:黑色', '', 0, 0, 0, 0, 0, ''),
	(2175, 1867, 4, '小米8青春', 'https://admin.mijia321.com/static/upload/5941400cd87c37bb/c838a50cd6e02bc9.jpg', '#10078', 3, 0.00, 90.00, 0.00, 0.00, 0, '8_12', '尺寸:300*500cm 颜色:紫色', '', 0, 0, 0, 0, 0, ''),
	(2176, 1868, 4, '小米8青春', 'https://admin.mijia321.com/static/upload/5941400cd87c37bb/c838a50cd6e02bc9.jpg', '#10078', 2, 0.00, 80.00, 0.00, 0.00, 0, '8_11', '尺寸:300*500cm 颜色:黑色', '', 0, 0, 0, 0, 0, ''),
	(2177, 1868, 4, '小米8青春', 'https://admin.mijia321.com/static/upload/5941400cd87c37bb/c838a50cd6e02bc9.jpg', '#10078', 3, 0.00, 90.00, 0.00, 0.00, 0, '8_12', '尺寸:300*500cm 颜色:紫色', '', 0, 0, 0, 0, 0, ''),
	(2178, 1869, 4, '小米8青春', 'https://app2.yixiang.co/file/pic/20210615153142207742.jpg', '#10078', 1, 888.00, 88.00, 0.00, 0.00, 0, '8_10', '尺寸:300*500cm,颜色:红色', '', 0, 0, 0, 0, 0, ''),
	(2179, 1870, 4, '小米8青春', 'https://app2.yixiang.co/file/pic/20210615153142207742.jpg', '#10078', 1, 888.00, 88.00, 0.00, 0.00, 0, '8_10', '尺寸:300*500cm,颜色:红色', '', 0, 0, 0, 0, 0, ''),
	(2180, 1871, 7, '红米6A', 'http://localhost:8080/profile/upload/2022/10/11/a2474591-af2d-4482-8c42-2a236193cb66.jpg', '#45678', 1, 0.00, 33.00, 0.00, 0.00, 0, '7', '尺寸:200*230cm', '', 0, 0, 0, 0, 0, ''),
	(2181, 1872, 4, '小米8青春', 'https://app2.yixiang.co/file/pic/20210615153142207742.jpg', '#10078', 1, 0.00, 80.00, 0.00, 0.00, 0, '8_11', '尺寸:300*500cm,颜色:黑色', '', 0, 0, 0, 0, 0, '');

-- 导出  表 supply_shop.store_order_goods_remark 结构
DROP TABLE IF EXISTS `store_order_goods_remark`;
CREATE TABLE IF NOT EXISTS `store_order_goods_remark` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int unsigned DEFAULT '0' COMMENT '订单id',
  `goods_id` int unsigned DEFAULT '0' COMMENT '商品id',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '商品备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='订单商品备注表';

-- 正在导出表  supply_shop.store_order_goods_remark 的数据：~11 rows (大约)
DELETE FROM `store_order_goods_remark`;
INSERT INTO `store_order_goods_remark` (`id`, `order_id`, `goods_id`, `remark`) VALUES
	(1, 1654, 5, '备注1111'),
	(2, 1654, 6, '备注1111'),
	(3, 1693, 4, '这是备注这是备注'),
	(4, 1712, 4, '这是备注这是备注'),
	(5, 1742, 4, '这是备注这是备注'),
	(6, 1759, 5, '2222'),
	(7, 1760, 5, '222'),
	(8, 1761, 5, '2222'),
	(9, 1762, 4, '测试数据'),
	(10, 1763, 4, '222'),
	(11, 1824, 4, '11');

-- 导出  表 supply_shop.store_payment 结构
DROP TABLE IF EXISTS `store_payment`;
CREATE TABLE IF NOT EXISTS `store_payment` (
  `pay_id` tinyint unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `pay_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '支付code',
  `pay_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '支付方式名称',
  `pay_fee` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '手续费',
  `pay_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '描述',
  `pay_order` tinyint unsigned NOT NULL DEFAULT '0' COMMENT 'pay_coder',
  `pay_config` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '配置',
  `enabled` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '开启',
  `is_cod` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否货到付款',
  `is_online` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否在线支付',
  PRIMARY KEY (`pay_id`) USING BTREE,
  UNIQUE KEY `pay_code` (`pay_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='支付方式表';

-- 正在导出表  supply_shop.store_payment 的数据：~0 rows (大约)
DELETE FROM `store_payment`;

-- 导出  表 supply_shop.store_points_money_log 结构
DROP TABLE IF EXISTS `store_points_money_log`;
CREATE TABLE IF NOT EXISTS `store_points_money_log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '日志id',
  `order_id` int unsigned DEFAULT '0' COMMENT '关联的订单id 充值d订单或者消费订单',
  `user_id` int NOT NULL DEFAULT '0' COMMENT '所有者的用户id',
  `title` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '积分或者红包日志标题',
  `points_number` int NOT NULL DEFAULT '0' COMMENT '积分变动数量，亿级',
  `money_number` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '红包变动数量，亿级',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '会员红包或者积分变动类型：1支入，2-支出',
  `create_time` int NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='积分/余额日志(流水)表';

-- 正在导出表  supply_shop.store_points_money_log 的数据：~49 rows (大约)
DELETE FROM `store_points_money_log`;
INSERT INTO `store_points_money_log` (`id`, `order_id`, `user_id`, `title`, `points_number`, `money_number`, `type`, `create_time`) VALUES
	(50, 141, 1, '现金充值', 0, 1000.00, 1, 1533130821),
	(51, 0, 1, '进货支出', 0, 836.00, 2, 1533389358),
	(52, 0, 1, '进货支出', 0, 70.40, 2, 1536831708),
	(53, 170, 7, '现金充值', 0, 55.00, 1, 1537262933),
	(54, 171, 7, '现金充值', 0, 555.00, 1, 1537262992),
	(55, 0, 7, '管理员调整金额', 0, 100.00, 1, 1537319509),
	(56, 199, 3, '现金充值', 0, 200.00, 1, 1537424017),
	(57, 0, 2, '进货支出', 0, 110.00, 2, 1537794698),
	(58, 202, 2, '现金充值', 0, 100.00, 1, 1537797272),
	(59, 0, 3, '管理员调整金额', 0, 20000.00, 1, 1537857224),
	(60, 0, 3, '进货支出', 0, 0.00, 2, 1537857258),
	(61, 0, 3, '进货支出', 0, 233.00, 2, 1537859567),
	(62, 0, 2, '进货支出', 0, 110.00, 2, 1537985787),
	(63, 0, 2, '进货支出', 0, 110.00, 2, 1537985893),
	(64, 0, 2, '进货支出', 0, 110.00, 2, 1537986007),
	(65, 0, 2, '进货支出', 0, 110.00, 2, 1537986073),
	(66, 0, 2, '进货支出', 0, 110.00, 2, 1537986169),
	(67, 0, 2, '进货支出', 0, 110.00, 2, 1537986241),
	(68, 0, 3, '进货支出', 0, 211.00, 2, 1538017693),
	(69, 0, 3, '进货支出', 0, 80.00, 2, 1538020135),
	(70, 0, 2, '进货支出', 0, 110.00, 2, 1538028526),
	(71, 0, 2, '进货支出', 0, 110.00, 2, 1538029015),
	(72, 0, 2, '进货支出', 0, 110.00, 2, 1538029152),
	(73, 0, 2, '进货支出', 0, 110.00, 2, 1538029326),
	(74, 0, 2, '进货支出', 0, 110.00, 2, 1538029376),
	(75, 0, 2, '进货支出', 0, 110.00, 2, 1538029916),
	(76, 0, 2, '进货支出', 0, 110.00, 2, 1538030055),
	(77, 0, 2, '进货支出', 0, 110.00, 2, 1538030114),
	(78, 0, 3, '进货支出', 0, 80.00, 2, 1538031217),
	(79, 0, 2, '进货支出', 0, 80.00, 2, 1538032284),
	(80, 0, 7, '进货支出', 0, 170.00, 2, 1538040934),
	(81, 0, 7, '进货支出', 0, 52.00, 2, 1538118403),
	(82, 0, 7, '进货支出', 0, 430.00, 2, 1538119947),
	(83, 0, 7, '管理员调整金额', 0, 10000.00, 1, 1538120985),
	(84, 0, 7, '进货支出', 0, 330.00, 2, 1538121207),
	(85, 0, 2, '进货支出', 0, 240.00, 2, 1539076535),
	(86, 0, 2, '进货支出', 0, 100.00, 2, 1539078194),
	(87, 0, 3, '进货支出', 0, 100.00, 2, 1539220807),
	(88, 0, 3, '进货支出', 0, 80.00, 2, 1539221246),
	(89, 0, 2, '进货支出', 0, 110.00, 2, 1539222400),
	(90, 0, 3, '进货支出', 0, 80.00, 2, 1539227807),
	(91, 0, 3, '进货支出', 0, 301.00, 2, 1539237129),
	(92, 0, 7, '进货支出', 0, 196.00, 2, 1539240016),
	(93, 0, 7, '进货支出', 0, 90.90, 2, 1539243164),
	(94, 0, 7, '进货支出', 0, 90.90, 2, 1539243181),
	(95, 0, 7, '进货支出', 0, 90.90, 2, 1539243187),
	(96, 0, 7, '进货支出', 0, 110.70, 2, 1539243862),
	(97, 0, 7, '进货支出', 0, 110.70, 2, 1539243889),
	(98, 0, 7, '进货支出', 0, 288.00, 2, 1539244318),
	(99, 0, 3, '购买商品', 0, 88.00, 2, 1668879746);

-- 导出  表 supply_shop.store_recharge 结构
DROP TABLE IF EXISTS `store_recharge`;
CREATE TABLE IF NOT EXISTS `store_recharge` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `from_type` tinyint unsigned DEFAULT '1' COMMENT '充值转账来源1-充值 2-转账',
  `method_id` int unsigned DEFAULT '0' COMMENT '充值方式id',
  `user_id` bigint NOT NULL DEFAULT '0' COMMENT '会员ID',
  `order_sn` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '充值单号',
  `screen_pic` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '转账截图',
  `account` decimal(10,2) DEFAULT '0.00' COMMENT '充值金额',
  `status_time` int unsigned DEFAULT '0' COMMENT '审核日期',
  `ctime` int DEFAULT NULL COMMENT '充值时间',
  `status` tinyint(1) DEFAULT '0' COMMENT '充值状态0:审核中 1:审核成功 2-审核失败',
  `remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=283 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='充值或转账订单记录表';

-- 正在导出表  supply_shop.store_recharge 的数据：~142 rows (大约)
DELETE FROM `store_recharge`;
INSERT INTO `store_recharge` (`id`, `from_type`, `method_id`, `user_id`, `order_sn`, `screen_pic`, `account`, `status_time`, `ctime`, `status`, `remark`) VALUES
	(141, 1, 1, 1, '2018072521201787160', 'http://www.testxcx.com/static/upload/a1b7f6d005e2c1b2/9729f24657ecbf46.png', 1000.00, 1533130821, 1532524817, 1, ''),
	(142, 2, 1, 1, '2018072521562425007', 'http://www.testxcx.com/static/upload/a1b7f6d005e2c1b2/9729f24657ecbf46.png', 1000.00, 1533203680, 1532526984, 1, ''),
	(143, 2, 1, 1, '22222222', 'http://www.testxcx.com/static/upload/a1b7f6d005e2c1b2/9729f24657ecbf46.png', 210.00, 1533217816, 1532524817, 1, ''),
	(144, 1, 1, 1, '2018091116242898946', '44444', 20.00, 0, 1536654268, 0, ''),
	(145, 1, 1, 1, '2018091216463054486', 'http://tmp/wx7716525cc7f1f490.o6zAJs19nsgod_IKqSrtW8bTgtw8.pL7yPXjn09HO1913000c96bffd795d7168711de47390.jpg', 222.00, 0, 1536741990, 0, ''),
	(146, 1, 1, 1, '2018091216520591714', 'http://tmp/wx7716525cc7f1f490.o6zAJs19nsgod_IKqSrtW8bTgtw8.kO9rTfHcIPvl1913000c96bffd795d7168711de47390.jpg', 20.00, 0, 1536742325, 0, ''),
	(147, 1, 1, 1, '2018091217024053205', 'http://tmp/wx7716525cc7f1f490.o6zAJs19nsgod_IKqSrtW8bTgtw8.TIsEKvKob8ow1913000c96bffd795d7168711de47390.jpg', 222.00, 0, 1536742960, 0, ''),
	(148, 2, 1, 1, '2018091416571541000', 'http://tmp/wx7716525cc7f1f490.o6zAJs19nsgod_IKqSrtW8bTgtw8.fbiUd38daQFf1913000c96bffd795d7168711de47390.jpg', 54552.00, 0, 1536915435, 0, ''),
	(149, 2, 1, 1, '2018091417002144757', 'http://tmp/wx7716525cc7f1f490.o6zAJs19nsgod_IKqSrtW8bTgtw8.QRDta7fyNB8U1913000c96bffd795d7168711de47390.jpg', 100.00, 0, 1536915621, 0, ''),
	(150, 1, 1, 1, '2018091417013329502', 'http://tmp/wx7716525cc7f1f490.o6zAJs19nsgod_IKqSrtW8bTgtw8.CilfRtadn4cb1913000c96bffd795d7168711de47390.jpg', 1.00, 0, 1536915693, 0, ''),
	(151, 2, 1, 1, '2018091417025096546', 'http://tmp/wx7716525cc7f1f490.o6zAJs19nsgod_IKqSrtW8bTgtw8.tMJCI9srzrl71913000c96bffd795d7168711de47390.jpg', 20.00, 0, 1536915770, 0, ''),
	(152, 2, 1, 1, '2018091417041260095', 'http://tmp/wx7716525cc7f1f490.o6zAJs19nsgod_IKqSrtW8bTgtw8.NU523ND6kIsd1913000c96bffd795d7168711de47390.jpg', 1.00, 0, 1536915852, 0, ''),
	(153, 2, 1, 1, '2018091417045742350', 'http://tmp/wx7716525cc7f1f490.o6zAJs19nsgod_IKqSrtW8bTgtw8.YFAWQrkrKp8i1913000c96bffd795d7168711de47390.jpg', 12.00, 0, 1536915897, 0, ''),
	(154, 2, 1, 1, '2018091417055015996', 'http://tmp/wx7716525cc7f1f490.o6zAJs19nsgod_IKqSrtW8bTgtw8.r8r7aJf6GG7o1913000c96bffd795d7168711de47390.jpg', 1.00, 0, 1536915950, 0, ''),
	(155, 2, 1, 1, '2018091417063832184', 'http://tmp/wx7716525cc7f1f490.o6zAJs19nsgod_IKqSrtW8bTgtw8.1p03bCF15H9H1913000c96bffd795d7168711de47390.jpg', 1.00, 0, 1536915998, 0, ''),
	(156, 2, 1, 1, '2018091417104693413', 'http://tmp/wx7716525cc7f1f490.o6zAJs19nsgod_IKqSrtW8bTgtw8.UOeCnQ6E3utj1913000c96bffd795d7168711de47390.jpg', 12.00, 0, 1536916246, 0, ''),
	(157, 2, 1, 1, '2018091601070954685', 'http://tmp/wx7716525cc7f1f490.o6zAJs19nsgod_IKqSrtW8bTgtw8.8SyF62MEwCA6bd0c4d9c4d21e67a4186bff85361a1bd.png', 2222.00, 0, 1537031229, 0, ''),
	(158, 2, 1, 1, '2018091601114382039', 'http://tmp/wx7716525cc7f1f490.o6zAJs19nsgod_IKqSrtW8bTgtw8.zdyyN6BF5GYgbd0c4d9c4d21e67a4186bff85361a1bd.png', 1111.00, 0, 1537031503, 0, ''),
	(159, 2, 1, 7, '2018091811090198115', 'wxfile://tmp_ab866540729f591c2c8a0ea2c59ddddd.jpg', 666.00, 0, 1537240141, 0, ''),
	(160, 2, 1, 7, '2018091811090461091', 'wxfile://tmp_ab866540729f591c2c8a0ea2c59ddddd.jpg', 666.00, 0, 1537240144, 0, ''),
	(161, 2, 1, 7, '2018091811090526094', 'wxfile://tmp_ab866540729f591c2c8a0ea2c59ddddd.jpg', 666.00, 0, 1537240145, 0, ''),
	(162, 2, 1, 7, '2018091811090540420', 'wxfile://tmp_ab866540729f591c2c8a0ea2c59ddddd.jpg', 666.00, 0, 1537240145, 0, ''),
	(163, 2, 1, 7, '2018091811090632015', 'wxfile://tmp_ab866540729f591c2c8a0ea2c59ddddd.jpg', 666.00, 0, 1537240146, 0, ''),
	(164, 2, 1, 7, '2018091811090683373', 'wxfile://tmp_ab866540729f591c2c8a0ea2c59ddddd.jpg', 666.00, 0, 1537240146, 0, ''),
	(165, 2, 3, 7, '2018091815595949122', 'wxfile://tmp_2b93bb4edc3cb181b5326858046ee8ef.jpg', 55.00, 0, 1537257599, 0, ''),
	(166, 2, 3, 7, '2018091816000095059', 'wxfile://tmp_2b93bb4edc3cb181b5326858046ee8ef.jpg', 55.00, 0, 1537257600, 0, ''),
	(167, 2, 3, 7, '2018091816000021704', 'wxfile://tmp_2b93bb4edc3cb181b5326858046ee8ef.jpg', 55.00, 0, 1537257600, 0, ''),
	(168, 2, 3, 7, '2018091816000058740', 'wxfile://tmp_2b93bb4edc3cb181b5326858046ee8ef.jpg', 55.00, 0, 1537257600, 0, ''),
	(169, 2, 3, 7, '2018091816000193312', 'wxfile://tmp_2b93bb4edc3cb181b5326858046ee8ef.jpg', 55.00, 0, 1537257601, 0, ''),
	(170, 1, 3, 7, '2018091817284050141', 'wxfile://tmp_7d9046993b3ce5874a97d7181f32edbc.jpg', 55.00, 1537262933, 1537262920, 1, ''),
	(171, 1, 3, 7, '2018091817293620480', 'wxfile://tmp_7d9046993b3ce5874a97d7181f32edbc.jpg', 555.00, 1537262992, 1537262976, 1, ''),
	(172, 2, 1, 3, '2018091819433560933', 'wxfile://tmp_81bbdc3837e3710feac533b44b3c484ec08c8dc2355b666e.jpg', 200.00, 0, 1537271015, 0, ''),
	(173, 2, 1, 3, '2018091819433762951', 'wxfile://tmp_81bbdc3837e3710feac533b44b3c484ec08c8dc2355b666e.jpg', 200.00, 0, 1537271017, 0, ''),
	(174, 2, 1, 3, '2018091819433916792', 'wxfile://tmp_81bbdc3837e3710feac533b44b3c484ec08c8dc2355b666e.jpg', 200.00, 0, 1537271019, 0, ''),
	(175, 2, 1, 7, '2018091910352320633', 'wxfile://tmp_0c2443bd8d4269fef8efce03fe112623.jpg', 666.00, 0, 1537324523, 0, ''),
	(176, 2, 1, 7, '2018091910352478213', 'wxfile://tmp_0c2443bd8d4269fef8efce03fe112623.jpg', 666.00, 0, 1537324524, 0, ''),
	(177, 2, 1, 7, '2018091910354337896', 'wxfile://tmp_0c2443bd8d4269fef8efce03fe112623.jpg', 666.00, 0, 1537324543, 0, ''),
	(178, 2, 1, 7, '2018091910354417138', 'wxfile://tmp_0c2443bd8d4269fef8efce03fe112623.jpg', 666.00, 0, 1537324544, 0, ''),
	(179, 2, 1, 7, '2018091910354440991', 'wxfile://tmp_0c2443bd8d4269fef8efce03fe112623.jpg', 666.00, 0, 1537324544, 0, ''),
	(180, 2, 1, 7, '2018091910354458125', 'wxfile://tmp_0c2443bd8d4269fef8efce03fe112623.jpg', 666.00, 0, 1537324544, 0, ''),
	(181, 2, 1, 7, '2018091910354515121', 'wxfile://tmp_0c2443bd8d4269fef8efce03fe112623.jpg', 666.00, 0, 1537324545, 0, ''),
	(182, 2, 1, 7, '2018091910354694576', 'wxfile://tmp_0c2443bd8d4269fef8efce03fe112623.jpg', 666.00, 0, 1537324546, 0, ''),
	(183, 2, 1, 7, '2018091910354645975', 'wxfile://tmp_0c2443bd8d4269fef8efce03fe112623.jpg', 666.00, 0, 1537324546, 0, ''),
	(184, 2, 1, 7, '2018091910354624038', 'wxfile://tmp_0c2443bd8d4269fef8efce03fe112623.jpg', 666.00, 0, 1537324546, 0, ''),
	(185, 2, 1, 7, '2018091910354756245', 'wxfile://tmp_0c2443bd8d4269fef8efce03fe112623.jpg', 666.00, 0, 1537324547, 0, ''),
	(186, 2, 1, 7, '2018091910354753836', 'wxfile://tmp_0c2443bd8d4269fef8efce03fe112623.jpg', 666.00, 0, 1537324547, 0, ''),
	(187, 2, 1, 7, '2018091910354797918', 'wxfile://tmp_0c2443bd8d4269fef8efce03fe112623.jpg', 666.00, 0, 1537324547, 0, ''),
	(188, 2, 1, 7, '2018091910354862558', 'wxfile://tmp_0c2443bd8d4269fef8efce03fe112623.jpg', 666.00, 0, 1537324548, 0, ''),
	(189, 2, 1, 7, '2018091910354858551', 'wxfile://tmp_0c2443bd8d4269fef8efce03fe112623.jpg', 666.00, 0, 1537324548, 0, ''),
	(190, 2, 1, 7, '2018091910354836930', 'wxfile://tmp_0c2443bd8d4269fef8efce03fe112623.jpg', 666.00, 0, 1537324548, 0, ''),
	(191, 2, 1, 7, '2018091910354886718', 'wxfile://tmp_0c2443bd8d4269fef8efce03fe112623.jpg', 666.00, 0, 1537324548, 0, ''),
	(192, 2, 1, 7, '2018091910354852293', 'wxfile://tmp_0c2443bd8d4269fef8efce03fe112623.jpg', 666.00, 0, 1537324548, 0, ''),
	(193, 2, 1, 7, '2018091910354981091', 'wxfile://tmp_0c2443bd8d4269fef8efce03fe112623.jpg', 666.00, 0, 1537324549, 0, ''),
	(194, 2, 1, 7, '2018091910354920179', 'wxfile://tmp_0c2443bd8d4269fef8efce03fe112623.jpg', 666.00, 0, 1537324549, 0, ''),
	(195, 2, 1, 7, '2018091910354910503', 'wxfile://tmp_0c2443bd8d4269fef8efce03fe112623.jpg', 666.00, 0, 1537324549, 0, ''),
	(196, 2, 1, 7, '2018091910354948435', 'wxfile://tmp_0c2443bd8d4269fef8efce03fe112623.jpg', 666.00, 0, 1537324549, 0, ''),
	(197, 2, 1, 7, '2018091910355058665', 'wxfile://tmp_0c2443bd8d4269fef8efce03fe112623.jpg', 666.00, 0, 1537324550, 0, ''),
	(198, 2, 1, 7, '2018091910355022090', 'wxfile://tmp_0c2443bd8d4269fef8efce03fe112623.jpg', 666.00, 0, 1537324550, 0, ''),
	(199, 1, 1, 3, '2018092014131652263', 'wxfile://tmp_43e33c30d149550ed5de63ad4021c5643f4ade437e967e06.jpg', 200.00, 1537424017, 1537423996, 1, ''),
	(200, 2, 1, 2, '2018092418040868449', 'http://tmp/wx604d2ea4702620d2.o6zAJs19nsgod_IKqSrtW8bTgtw8.IpSybR8XmbX806d108d22f54a74f8a7f31a359784ca9.jpg', 11.00, 0, 1537783448, 0, ''),
	(201, 1, 1, 2, '2018092419193225934', 'http://tmp/wx604d2ea4702620d2.o6zAJs19nsgod_IKqSrtW8bTgtw8.fC5ZI3UTk2Bj19ad9ba730dbce751d507d3a627e8ae0.png', 22.00, 0, 1537787972, 0, ''),
	(202, 1, 1, 2, '2018092421540638918', 'http://tmp/wx604d2ea4702620d2.o6zAJs19nsgod_IKqSrtW8bTgtw8.hH2jV5YjIhUf2b4faea670d34bc792cf6a3a09b9dbfb.png', 100.00, 1537797272, 1537797246, 1, ''),
	(203, 2, 1, 3, '2018092514310798536', 'wxfile://tmp_ef99c8a4572b71f7b3db37f710e9b6cad858a187aaa185e2.jpg', 1120.00, 0, 1537857067, 0, ''),
	(204, 2, 1, 2, '2018092702030377276', 'http://tmp/wx604d2ea4702620d2.o6zAJs19nsgod_IKqSrtW8bTgtw8.VRdMca2odWSw527fe3b6065e6df0365d48cf7bafe4d8.png', 3333.00, 0, 1537984983, 0, ''),
	(205, 2, 1, 2, '2018092702071856939', 'http://tmp/wx604d2ea4702620d2.o6zAJs19nsgod_IKqSrtW8bTgtw8.ljEjABH8u7AD527fe3b6065e6df0365d48cf7bafe4d8.png', 22222.00, 0, 1537985238, 0, ''),
	(206, 2, 1, 7, '2018092811341366563', 'wxfile://tmp_7118cb2c25239a724d75b520af60aabb.jpg', 666.00, 0, 1538105653, 0, ''),
	(207, 2, 1, 7, '2018092811341415350', 'wxfile://tmp_7118cb2c25239a724d75b520af60aabb.jpg', 666.00, 0, 1538105654, 0, ''),
	(208, 1, 1, 7, '2018092816034758417', 'wxfile://tmp_6a59d2ba85aa3f88e8d366bcb57b0bae.jpg', 222.00, 0, 1538121827, 0, ''),
	(209, 1, 2, 7, '2018092816040142732', 'wxfile://tmp_6a59d2ba85aa3f88e8d366bcb57b0bae.jpg', 222.00, 0, 1538121841, 0, ''),
	(210, 1, 3, 7, '2018092816040755867', 'wxfile://tmp_6a59d2ba85aa3f88e8d366bcb57b0bae.jpg', 222.00, 0, 1538121847, 0, ''),
	(211, 1, 3, 7, '2018092816042611995', 'wxfile://tmp_6a59d2ba85aa3f88e8d366bcb57b0bae.jpg', 222.00, 0, 1538121866, 0, ''),
	(212, 1, 1, 7, '2018092816054139928', 'wxfile://tmp_6a59d2ba85aa3f88e8d366bcb57b0bae.jpg', 222.00, 0, 1538121941, 0, ''),
	(213, 1, 1, 7, '2018092816060244967', 'wxfile://tmp_6a59d2ba85aa3f88e8d366bcb57b0bae.jpg', 222.00, 0, 1538121962, 0, ''),
	(214, 2, 1, 3, '2018092816275232663', 'wxfile://tmp_e0d7c38ffb15b3362b8bf81de96901b8ba39f9e8e0c13d64.jpg', 100.00, 0, 1538123272, 0, ''),
	(215, 2, 1, 3, '2018092816275472798', 'wxfile://tmp_e0d7c38ffb15b3362b8bf81de96901b8ba39f9e8e0c13d64.jpg', 100.00, 0, 1538123274, 0, ''),
	(216, 2, 1, 3, '2018092816275475098', 'wxfile://tmp_e0d7c38ffb15b3362b8bf81de96901b8ba39f9e8e0c13d64.jpg', 100.00, 0, 1538123274, 0, ''),
	(217, 2, 1, 3, '2018092816275530451', 'wxfile://tmp_e0d7c38ffb15b3362b8bf81de96901b8ba39f9e8e0c13d64.jpg', 100.00, 0, 1538123275, 0, ''),
	(218, 2, 1, 3, '2018092816275562259', 'wxfile://tmp_e0d7c38ffb15b3362b8bf81de96901b8ba39f9e8e0c13d64.jpg', 100.00, 0, 1538123275, 0, ''),
	(219, 2, 1, 3, '2018092816275589187', 'wxfile://tmp_e0d7c38ffb15b3362b8bf81de96901b8ba39f9e8e0c13d64.jpg', 100.00, 0, 1538123275, 0, ''),
	(220, 2, 1, 3, '2018092816275640327', 'wxfile://tmp_e0d7c38ffb15b3362b8bf81de96901b8ba39f9e8e0c13d64.jpg', 100.00, 0, 1538123276, 0, ''),
	(221, 2, 1, 3, '2018092816275687067', 'wxfile://tmp_e0d7c38ffb15b3362b8bf81de96901b8ba39f9e8e0c13d64.jpg', 100.00, 0, 1538123276, 0, ''),
	(222, 2, 1, 3, '2018092816275689683', 'wxfile://tmp_e0d7c38ffb15b3362b8bf81de96901b8ba39f9e8e0c13d64.jpg', 100.00, 0, 1538123276, 0, ''),
	(223, 2, 1, 3, '2018092816275687932', 'wxfile://tmp_e0d7c38ffb15b3362b8bf81de96901b8ba39f9e8e0c13d64.jpg', 100.00, 0, 1538123276, 0, ''),
	(224, 2, 1, 3, '2018092816275675178', 'wxfile://tmp_e0d7c38ffb15b3362b8bf81de96901b8ba39f9e8e0c13d64.jpg', 100.00, 0, 1538123276, 0, ''),
	(225, 2, 1, 3, '2018092816275662263', 'wxfile://tmp_e0d7c38ffb15b3362b8bf81de96901b8ba39f9e8e0c13d64.jpg', 100.00, 0, 1538123276, 0, ''),
	(226, 2, 1, 3, '2018092816275714010', 'wxfile://tmp_e0d7c38ffb15b3362b8bf81de96901b8ba39f9e8e0c13d64.jpg', 100.00, 0, 1538123277, 0, ''),
	(227, 2, 1, 3, '2018092816275778584', 'wxfile://tmp_e0d7c38ffb15b3362b8bf81de96901b8ba39f9e8e0c13d64.jpg', 100.00, 0, 1538123277, 0, ''),
	(228, 2, 1, 3, '2018092816275785596', 'wxfile://tmp_e0d7c38ffb15b3362b8bf81de96901b8ba39f9e8e0c13d64.jpg', 100.00, 0, 1538123277, 0, ''),
	(229, 2, 1, 3, '2018092816275752403', 'wxfile://tmp_e0d7c38ffb15b3362b8bf81de96901b8ba39f9e8e0c13d64.jpg', 100.00, 0, 1538123277, 0, ''),
	(230, 2, 1, 3, '2018092816275713791', 'wxfile://tmp_e0d7c38ffb15b3362b8bf81de96901b8ba39f9e8e0c13d64.jpg', 100.00, 0, 1538123277, 0, ''),
	(231, 2, 1, 3, '2018092816275770307', 'wxfile://tmp_e0d7c38ffb15b3362b8bf81de96901b8ba39f9e8e0c13d64.jpg', 100.00, 0, 1538123277, 0, ''),
	(232, 2, 2, 3, '2018100919402528154', 'wxfile://tmp_cbb6231ff3721dd8c28af3b8da9f3524065374a6aaffbd44.jpg', 100.00, 0, 1539085225, 0, ''),
	(233, 2, 2, 3, '2018100919403715213', 'wxfile://tmp_cbb6231ff3721dd8c28af3b8da9f3524065374a6aaffbd44.jpg', 100.00, 0, 1539085237, 0, ''),
	(234, 2, 2, 3, '2018100919404026051', 'wxfile://tmp_cbb6231ff3721dd8c28af3b8da9f3524065374a6aaffbd44.jpg', 100.00, 0, 1539085240, 0, ''),
	(235, 2, 2, 3, '2018100919404057366', 'wxfile://tmp_cbb6231ff3721dd8c28af3b8da9f3524065374a6aaffbd44.jpg', 100.00, 0, 1539085240, 0, ''),
	(236, 2, 2, 3, '2018100919404121955', 'wxfile://tmp_cbb6231ff3721dd8c28af3b8da9f3524065374a6aaffbd44.jpg', 100.00, 0, 1539085241, 0, ''),
	(237, 2, 2, 3, '2018100919404127052', 'wxfile://tmp_cbb6231ff3721dd8c28af3b8da9f3524065374a6aaffbd44.jpg', 100.00, 0, 1539085241, 0, ''),
	(238, 2, 2, 3, '2018100919404171424', 'wxfile://tmp_cbb6231ff3721dd8c28af3b8da9f3524065374a6aaffbd44.jpg', 100.00, 0, 1539085241, 0, ''),
	(239, 2, 2, 3, '2018100919404184409', 'wxfile://tmp_cbb6231ff3721dd8c28af3b8da9f3524065374a6aaffbd44.jpg', 100.00, 0, 1539085241, 0, ''),
	(240, 2, 2, 3, '2018100919404289690', 'wxfile://tmp_cbb6231ff3721dd8c28af3b8da9f3524065374a6aaffbd44.jpg', 100.00, 0, 1539085242, 0, ''),
	(241, 2, 2, 3, '2018100919404286650', 'wxfile://tmp_cbb6231ff3721dd8c28af3b8da9f3524065374a6aaffbd44.jpg', 100.00, 0, 1539085242, 0, ''),
	(242, 2, 2, 3, '2018100919404241653', 'wxfile://tmp_cbb6231ff3721dd8c28af3b8da9f3524065374a6aaffbd44.jpg', 100.00, 0, 1539085242, 0, ''),
	(243, 2, 2, 3, '2018100919404297411', 'wxfile://tmp_cbb6231ff3721dd8c28af3b8da9f3524065374a6aaffbd44.jpg', 100.00, 0, 1539085242, 0, ''),
	(244, 2, 1, 3, '2018100919424459376', 'wxfile://tmp_43aed6f9e080a8efa37daf3613ab242ab2bd98dccfa7efca.jpg', 100.00, 0, 1539085364, 0, ''),
	(245, 2, 2, 2, '2018101104193786384', 'http://tmp/wx604d2ea4702620d2.o6zAJs19nsgod_IKqSrtW8bTgtw8.hQsEN5EicO0Rfe4792d482196a50cf9ae0d9d90b6493.ico', 200.00, 0, 1539202777, 0, ''),
	(246, 2, 2, 2, '2018101104215353900', 'http://tmp/wx604d2ea4702620d2.o6zAJs19nsgod_IKqSrtW8bTgtw8.FrKMFGUV8tBNfe4792d482196a50cf9ae0d9d90b6493.ico', 200.00, 0, 1539202913, 0, ''),
	(247, 1, 2, 2, '2018101104233254722', 'http://tmp/wx604d2ea4702620d2.o6zAJs19nsgod_IKqSrtW8bTgtw8.lveB2YGeTShcfe4792d482196a50cf9ae0d9d90b6493.ico', 2000.00, 0, 1539203012, 0, ''),
	(248, 2, 2, 2, '2018101104235786730', 'http://tmp/wx604d2ea4702620d2.o6zAJs19nsgod_IKqSrtW8bTgtw8.lveB2YGeTShcfe4792d482196a50cf9ae0d9d90b6493.ico', 2000.00, 0, 1539203037, 0, ''),
	(249, 2, 2, 2, '2018101104262648793', 'http://tmp/wx604d2ea4702620d2.o6zAJs19nsgod_IKqSrtW8bTgtw8.A2NKpwiPeiuIfe4792d482196a50cf9ae0d9d90b6493.ico', 200.00, 0, 1539203186, 0, ''),
	(250, 2, 1, 3, '2018101109221826699', 'wxfile://tmp_e8e57d308070e9468cae6ebfd89089e3b0ac8d5c84d99f8d.jpg', 100.00, 0, 1539220938, 0, ''),
	(251, 2, 1, 3, '2018101109222330837', 'wxfile://tmp_e8e57d308070e9468cae6ebfd89089e3b0ac8d5c84d99f8d.jpg', 100.00, 0, 1539220943, 0, ''),
	(252, 2, 1, 3, '2018101109222577741', 'wxfile://tmp_e8e57d308070e9468cae6ebfd89089e3b0ac8d5c84d99f8d.jpg', 100.00, 0, 1539220945, 0, ''),
	(253, 2, 1, 3, '2018101109222675100', 'wxfile://tmp_e8e57d308070e9468cae6ebfd89089e3b0ac8d5c84d99f8d.jpg', 100.00, 0, 1539220946, 0, ''),
	(254, 2, 1, 3, '2018101109222666466', 'wxfile://tmp_e8e57d308070e9468cae6ebfd89089e3b0ac8d5c84d99f8d.jpg', 100.00, 0, 1539220946, 0, ''),
	(255, 2, 1, 3, '2018101109222676622', 'wxfile://tmp_e8e57d308070e9468cae6ebfd89089e3b0ac8d5c84d99f8d.jpg', 100.00, 0, 1539220946, 0, ''),
	(256, 2, 1, 3, '2018101109222670569', 'wxfile://tmp_e8e57d308070e9468cae6ebfd89089e3b0ac8d5c84d99f8d.jpg', 100.00, 0, 1539220946, 0, ''),
	(257, 2, 1, 3, '2018101109222718116', 'wxfile://tmp_e8e57d308070e9468cae6ebfd89089e3b0ac8d5c84d99f8d.jpg', 100.00, 0, 1539220947, 0, ''),
	(258, 2, 1, 3, '2018101109222739735', 'wxfile://tmp_e8e57d308070e9468cae6ebfd89089e3b0ac8d5c84d99f8d.jpg', 100.00, 0, 1539220947, 0, ''),
	(259, 2, 1, 3, '2018101109222734686', 'wxfile://tmp_e8e57d308070e9468cae6ebfd89089e3b0ac8d5c84d99f8d.jpg', 100.00, 0, 1539220947, 0, ''),
	(260, 2, 1, 3, '2018101109222794435', 'wxfile://tmp_e8e57d308070e9468cae6ebfd89089e3b0ac8d5c84d99f8d.jpg', 100.00, 0, 1539220947, 0, ''),
	(261, 2, 1, 3, '2018101109240884756', 'wxfile://tmp_180f832c87fa49bab5eee3df7c0db97f07575970d6a23477.jpg', 200.00, 0, 1539221048, 0, ''),
	(262, 2, 1, 3, '2018101109252410942', 'wxfile://tmp_180f832c87fa49bab5eee3df7c0db97f07575970d6a23477.jpg', 200.00, 0, 1539221124, 0, ''),
	(263, 2, 1, 3, '2018101109252665649', 'wxfile://tmp_180f832c87fa49bab5eee3df7c0db97f07575970d6a23477.jpg', 200.00, 0, 1539221126, 0, ''),
	(264, 2, 1, 3, '2018101109432450346', 'wxfile://tmp_2ddb35191019a2efb82d7be7c800f9022f5158fb35dc3526.jpg', 200.00, 0, 1539222204, 0, ''),
	(265, 2, 1, 3, '2018101109433522041', 'wxfile://tmp_2ddb35191019a2efb82d7be7c800f9022f5158fb35dc3526.jpg', 200.00, 0, 1539222215, 0, ''),
	(266, 2, 2, 2, '2018101109473840491', 'http://tmp/wx604d2ea4702620d2.o6zAJs19nsgod_IKqSrtW8bTgtw8.bQaBw9jeLjr3fe4792d482196a50cf9ae0d9d90b6493.ico', 100.00, 0, 1539222458, 0, ''),
	(267, 2, 2, 2, '2018101109500574646', 'http://tmp/wx604d2ea4702620d2.o6zAJs19nsgod_IKqSrtW8bTgtw8.Dl5RO1o7Zi14fe4792d482196a50cf9ae0d9d90b6493.ico', 200.00, 0, 1539222605, 0, ''),
	(268, 2, 2, 2, '2018101109513264321', 'http://tmp/wx604d2ea4702620d2.o6zAJs19nsgod_IKqSrtW8bTgtw8.FT01v5KJVG5cfe4792d482196a50cf9ae0d9d90b6493.ico', 200.00, 0, 1539222692, 0, ''),
	(269, 2, 2, 2, '2018101109571376297', 'http://tmp/wx604d2ea4702620d2.o6zAJs19nsgod_IKqSrtW8bTgtw8.7OZ8hlTHRpIWfe4792d482196a50cf9ae0d9d90b6493.ico', 200.00, 0, 1539223033, 0, ''),
	(270, 2, 2, 2, '2018101110272715026', 'http://tmp/wx604d2ea4702620d2.o6zAJs19nsgod_IKqSrtW8bTgtw8.DhHrw8Q5jmdlfe4792d482196a50cf9ae0d9d90b6493.ico', 200.00, 0, 1539224847, 0, ''),
	(271, 2, 2, 2, '2018101110315084145', 'http://tmp/wx604d2ea4702620d2.o6zAJs19nsgod_IKqSrtW8bTgtw8.ILwktDCpuUNHfe4792d482196a50cf9ae0d9d90b6493.ico', 200.00, 0, 1539225110, 0, ''),
	(272, 2, 2, 2, '2018101110390243643', 'http://tmp/wx604d2ea4702620d2.o6zAJs19nsgod_IKqSrtW8bTgtw8.C21xvgjqcA3bfe4792d482196a50cf9ae0d9d90b6493.ico', 200.00, 0, 1539225542, 0, ''),
	(273, 2, 3, 7, '2018101111010016227', 'wxfile://tmp_ade18cc26090c39548e7bcbc3a39c89c.jpg', 666.00, 0, 1539226860, 0, ''),
	(274, 2, 1, 3, '2018101111150483281', 'wxfile://tmp_97985a29deb8d8a90061828cf0f4e0357b0fa56ca9f67e0f.jpg', 100.00, 0, 1539227704, 0, ''),
	(275, 2, 2, 2, '2018101111154857359', 'http://tmp/wx604d2ea4702620d2.o6zAJs19nsgod_IKqSrtW8bTgtw8.C21xvgjqcA3bfe4792d482196a50cf9ae0d9d90b6493.ico', 200.00, 0, 1539227748, 0, ''),
	(276, 2, 2, 2, '2018101111155177215', 'http://tmp/wx604d2ea4702620d2.o6zAJs19nsgod_IKqSrtW8bTgtw8.C21xvgjqcA3bfe4792d482196a50cf9ae0d9d90b6493.ico', 200.00, 0, 1539227751, 0, ''),
	(277, 2, 2, 2, '2018101111222854904', 'http://tmp/wx604d2ea4702620d2.o6zAJs19nsgod_IKqSrtW8bTgtw8.Ibep4iVgLUw3fe4792d482196a50cf9ae0d9d90b6493.ico', 11.00, 0, 1539228148, 0, ''),
	(278, 2, 2, 2, '2018101111234447257', 'http://tmp/wx604d2ea4702620d2.o6zAJs19nsgod_IKqSrtW8bTgtw8.n7P3GpiuLTQLfe4792d482196a50cf9ae0d9d90b6493.ico', 2222.00, 0, 1539228224, 0, ''),
	(279, 2, 2, 2, '2018101111284767607', 'http://tmp/wx604d2ea4702620d2.o6zAJs19nsgod_IKqSrtW8bTgtw8.ZOqeojEMs9kxfe4792d482196a50cf9ae0d9d90b6493.ico', 200.00, 0, 1539228527, 0, ''),
	(280, 2, 2, 2, '2018101111301854933', 'wxfile://tmp_47519b5898c16810f8e745df1779208d.jpg', 200.00, 0, 1539228618, 0, ''),
	(281, 2, 2, 7, '2018101117001959485', 'wxfile://tmp_bdc4fd6dd37c23886b5bfa4579bc6206.jpg', 222.00, 0, 1539248419, 0, ''),
	(282, 2, 2, 2, '2018101221330092747', 'wxfile://tmp_79861cf3349cc300460ed02318a258f2.jpg', 188.00, 0, 1539351180, 0, '');

-- 导出  表 supply_shop.store_recharge_methods 结构
DROP TABLE IF EXISTS `store_recharge_methods`;
CREATE TABLE IF NOT EXISTS `store_recharge_methods` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '充值方式名称',
  `icon` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '图标',
  `bank_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '银行名称，type=1才有',
  `type` tinyint unsigned DEFAULT '1' COMMENT '充值类型1-银行 2微信 3-支付宝',
  `true_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '开户行/微信/支付账户用户姓名',
  `account` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '银行账户/微信号/支付宝账户',
  `qrcode` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '二维码图片，微信与支付宝才有',
  `sort` smallint unsigned DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='充值或转账方式表';

-- 正在导出表  supply_shop.store_recharge_methods 的数据：3 rows
DELETE FROM `store_recharge_methods`;
/*!40000 ALTER TABLE `store_recharge_methods` DISABLE KEYS */;
INSERT INTO `store_recharge_methods` (`id`, `name`, `icon`, `bank_name`, `type`, `true_name`, `account`, `qrcode`, `sort`) VALUES
	(1, '银行卡', 'https://admin.mijia321.com/static/upload/a7545c0e82713c9b/77136c9c6e7464bc.png', '中国工商银行', 1, '胡鹏', '6222020410017823379', 'http://www.testxcx.com/static/upload/68476a9723d274fa/c269c33cb50405d1.png', 0),
	(2, '支付宝', 'https://admin.mijia321.com/static/upload/116fcd8be57b654f/819fa27f2783c6bb.png', '', 3, '胡鹏', 'zhofubao7@qq.com', 'https://admin.mijia321.com/static/upload/f83ef57b64d3144f/4a99cd286d19bc68.png', 2),
	(3, '微信', 'https://admin.mijia321.com/static/upload/441cd27dca6547bd/050b68878260fdfd.jpg', '', 2, '胡鹏', '7878wxid_2131231123', 'https://admin.mijia321.com/static/upload/1cc26f0c2b994cbc/3ef1392c3e67ad24.png', 3);
/*!40000 ALTER TABLE `store_recharge_methods` ENABLE KEYS */;

-- 导出  表 supply_shop.store_spec 结构
DROP TABLE IF EXISTS `store_spec`;
CREATE TABLE IF NOT EXISTS `store_spec` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '规格表',
  `type_id` int DEFAULT '0' COMMENT '规格类型',
  `name` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '规格名称',
  `sort` int DEFAULT '50' COMMENT '排序',
  `search_index` tinyint(1) DEFAULT '1' COMMENT '是否需要检索：1是，0否',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='商品规格表(独立)';

-- 正在导出表  supply_shop.store_spec 的数据：~3 rows (大约)
DELETE FROM `store_spec`;
INSERT INTO `store_spec` (`id`, `type_id`, `name`, `sort`, `search_index`) VALUES
	(3, 39, '尺寸', 50, 1),
	(4, 39, '颜色', 50, 1),
	(5, 40, '内存', 50, 1),
	(6, 41, '笔记本', 50, 1),
	(7, 41, '笔记本内存', 50, 1);

-- 导出  表 supply_shop.store_spec_goods_price 结构
DROP TABLE IF EXISTS `store_spec_goods_price`;
CREATE TABLE IF NOT EXISTS `store_spec_goods_price` (
  `item_id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '规格商品id',
  `goods_id` int DEFAULT '0' COMMENT '商品id',
  `key` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '规格键名',
  `key_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '规格键名中文',
  `price` decimal(10,2) DEFAULT '0.00' COMMENT '价格(供货价格)',
  `market_price` double(10,2) unsigned DEFAULT '0.00' COMMENT '零售价格',
  `store_count` int unsigned DEFAULT '10' COMMENT '库存数量',
  `bar_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '商品条形码',
  `sku` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT 'SKU',
  `spec_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '规格商品主图',
  `prom_id` int DEFAULT '0' COMMENT '活动id',
  `prom_type` tinyint DEFAULT '0' COMMENT '参加活动类型',
  PRIMARY KEY (`item_id`) USING BTREE,
  KEY `key` (`key`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='商品规格关联价格表';

-- 正在导出表  supply_shop.store_spec_goods_price 的数据：~30 rows (大约)
DELETE FROM `store_spec_goods_price`;
INSERT INTO `store_spec_goods_price` (`item_id`, `goods_id`, `key`, `key_name`, `price`, `market_price`, `store_count`, `bar_code`, `sku`, `spec_img`, `prom_id`, `prom_type`) VALUES
	(12, 5, '6_10', '尺寸:150*120cm 颜色:红色', 110.00, 0.00, 0, '', '', NULL, 0, 0),
	(13, 5, '6_11', '尺寸:150*120cm 颜色:黑色', 120.00, 0.00, 29, '', '', NULL, 0, 0),
	(14, 5, '7_10', '尺寸:200*230cm 颜色:红色', 101.00, 0.00, 54, '', '', NULL, 0, 0),
	(15, 5, '7_11', '尺寸:200*230cm 颜色:黑色', 99.00, 0.00, 98, '', '', NULL, 0, 0),
	(16, 5, '6_10', '尺寸:150*120cm 颜色:红色', 110.00, 0.00, 0, '', '', NULL, 0, 0),
	(17, 5, '6_11', '尺寸:150*120cm 颜色:黑色', 120.00, 0.00, 29, '', '', NULL, 0, 0),
	(18, 5, '7_10', '尺寸:200*230cm 颜色:红色', 101.00, 0.00, 54, '', '', NULL, 0, 0),
	(19, 5, '7_11', '尺寸:200*230cm 颜色:黑色', 99.00, 0.00, 98, '', '', NULL, 0, 0),
	(20, 5, '6_10', '尺寸:150*120cm 颜色:红色', 110.00, 0.00, 0, '', '', NULL, 0, 0),
	(21, 5, '6_11', '尺寸:150*120cm 颜色:黑色', 120.00, 0.00, 29, '', '', NULL, 0, 0),
	(22, 5, '7_10', '尺寸:200*230cm 颜色:红色', 101.00, 0.00, 54, '', '', NULL, 0, 0),
	(23, 5, '7_11', '尺寸:200*230cm 颜色:黑色', 99.00, 0.00, 98, '', '', NULL, 0, 0),
	(26, 6, '6_9', '尺寸:150*120cm 颜色:白色', 123.00, 0.00, 0, '', '', NULL, 0, 0),
	(27, 6, '6_10', '尺寸:150*120cm 颜色:红色', 123.00, 0.00, 0, '', '', NULL, 0, 0),
	(28, 7, '6', '尺寸:150*120cm', 33.00, 0.00, 1, '', '', NULL, 0, 0),
	(29, 7, '7', '尺寸:200*230cm', 33.00, 0.00, 2, '', '', NULL, 0, 0),
	(30, 8, '6_10', '尺寸:150*120cm 颜色:红色', 111.00, 0.00, 6, '', '', NULL, 0, 0),
	(31, 8, '6_11', '尺寸:150*120cm 颜色:黑色', 222.00, 0.00, 7, '', '', NULL, 0, 0),
	(32, 8, '7_10', '尺寸:200*230cm 颜色:红色', 333.00, 0.00, 8, '', '', NULL, 0, 0),
	(33, 8, '7_11', '尺寸:200*230cm 颜色:黑色', 444.00, 0.00, 9, '', '', NULL, 0, 0),
	(39, 9, '6_9', '尺寸:150*120cm,颜色:白色', 99.00, 0.00, 999, '', '', NULL, 0, 0),
	(40, 9, '6_10', '尺寸:150*120cm,颜色:红色', 99.00, 0.00, 99, '', '', NULL, 0, 0),
	(42, 4, '8_10', '尺寸:300*500cm,颜色:红色', 88.00, 888.00, 8887, '', '', NULL, 0, 0),
	(43, 4, '8_11', '尺寸:300*500cm,颜色:黑色', 80.00, 0.00, 790, '', '', NULL, 0, 0),
	(50, 10, '17_21', '笔记本:游戏本,笔记本内存:3g', 2.00, 2.00, 1, '', '', NULL, 0, 0),
	(51, 10, '18_21', '笔记本:轻薄本,笔记本内存:3g', 2.00, 3.00, 1, '', '', NULL, 0, 0),
	(52, 10, '17_20', '笔记本:游戏本,笔记本内存:2g', 3.00, 4.00, 1, '', '', NULL, 0, 0),
	(53, 10, '18_20', '笔记本:轻薄本,笔记本内存:2g', 2.00, 2.00, 1, '', '', NULL, 0, 0),
	(54, 10, '17_19', '笔记本:游戏本,笔记本内存:1g', 2.00, 3.00, 1, '', '', NULL, 0, 0),
	(55, 10, '18_19', '笔记本:轻薄本,笔记本内存:1g', 2.00, 2.00, 1, '', '', NULL, 0, 0),
	(56, 11, '18_21', '笔记本:轻薄本,笔记本内存:3g', 22.00, 33.00, 111, '', '', NULL, 0, 0),
	(57, 11, '18_20', '笔记本:轻薄本,笔记本内存:2g', 22.00, 33.00, 111, '', '', NULL, 0, 0);

-- 导出  表 supply_shop.store_spec_image 结构
DROP TABLE IF EXISTS `store_spec_image`;
CREATE TABLE IF NOT EXISTS `store_spec_image` (
  `goods_id` int DEFAULT '0' COMMENT '商品规格图片表id',
  `spec_image_id` int DEFAULT '0' COMMENT '规格项id',
  `src` varchar(512) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '商品规格图片路径'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- 正在导出表  supply_shop.store_spec_image 的数据：0 rows
DELETE FROM `store_spec_image`;
/*!40000 ALTER TABLE `store_spec_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `store_spec_image` ENABLE KEYS */;

-- 导出  表 supply_shop.store_spec_item 结构
DROP TABLE IF EXISTS `store_spec_item`;
CREATE TABLE IF NOT EXISTS `store_spec_item` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '规格项id',
  `spec_id` int DEFAULT NULL COMMENT '规格id',
  `item` varchar(54) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '规格项',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='规格项';

-- 正在导出表  supply_shop.store_spec_item 的数据：~16 rows (大约)
DELETE FROM `store_spec_item`;
INSERT INTO `store_spec_item` (`id`, `spec_id`, `item`) VALUES
	(6, 3, '150*120cm'),
	(7, 3, '200*230cm'),
	(8, 3, '300*500cm'),
	(9, 4, '白色'),
	(10, 4, '红色'),
	(11, 4, '黑色'),
	(12, 4, '紫色'),
	(13, 5, '1G'),
	(14, 5, '4G'),
	(15, 5, '8G'),
	(16, 5, '12G'),
	(17, 6, '游戏本'),
	(18, 6, '轻薄本'),
	(19, 7, '1g'),
	(20, 7, '2g'),
	(21, 7, '3g');

-- 导出  表 supply_shop.store_substitute 结构
DROP TABLE IF EXISTS `store_substitute`;
CREATE TABLE IF NOT EXISTS `store_substitute` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `username` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '收货人姓名',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货手机号',
  `city_info` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '城市信息',
  `address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '收货详细地址',
  `product_info` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '产品明细',
  `create_time` int unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='代发货表';

-- 正在导出表  supply_shop.store_substitute 的数据：7 rows
DELETE FROM `store_substitute`;
/*!40000 ALTER TABLE `store_substitute` DISABLE KEYS */;
INSERT INTO `store_substitute` (`id`, `user_id`, `username`, `phone`, `city_info`, `address`, `product_info`, `create_time`, `updated_at`) VALUES
	(27, 3, '胡鹏1', '15136175246', '北京市市辖区东城区', '回来了', '啊KKK', 1538033518, NULL),
	(28, 3, '胡鹏02', '15136175246', '北京市市辖区东城区', '777', '脾气PSPPS4死g7是', 1538039362, NULL),
	(18, 1, '陈星宇01', '15136175249', '河南郑州', '长椿路78号', '777橙色 100*200cm *2', 1536992462, NULL),
	(17, 1, '陈星宇', '15136175248', '河南郑州', '长椿路78号', '777橙色 100*200cm *2', 1536992462, NULL),
	(16, 1, 'sssss', '15601064107', '北京市市辖区东城区', 'ssd', 'sss', 1536916579, NULL),
	(15, 1, '洒水多', '15601064107', '北京市市辖区东城区', '撒大声地所', '所得到的多', 1536916284, NULL),
	(58, 7, '经喇嘛', '18818818811', '北京市市辖区东城区', '凝聚力啊', '的，亏你哦', 1539239505, NULL);
/*!40000 ALTER TABLE `store_substitute` ENABLE KEYS */;

-- 导出  表 supply_shop.store_substitute_order 结构
DROP TABLE IF EXISTS `store_substitute_order`;
CREATE TABLE IF NOT EXISTS `store_substitute_order` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL DEFAULT '0' COMMENT '用户id',
  `sub_ids` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '代发商品关联id 逗号隔开',
  `order_sn` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单号',
  `shipping_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '物流名称',
  `shipping_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '物流code 单号',
  `shipping_price` decimal(6,2) unsigned DEFAULT '0.00' COMMENT '物流费',
  `product_price` decimal(8,2) unsigned DEFAULT '0.00' COMMENT '产品总价格',
  `order_price` decimal(8,2) unsigned DEFAULT '0.00' COMMENT '订单总价格',
  `order_status` tinyint unsigned DEFAULT '0' COMMENT '订单状态0-待确认 1-已确认',
  `pay_method` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '支付方式1-微信2-余额3-转账',
  `recharge_id` int unsigned DEFAULT '0' COMMENT '支付方式为转账的转账id',
  `pay_status` tinyint unsigned DEFAULT '0' COMMENT '支付状态 0-待付款 1-已付款',
  `shipping_status` tinyint unsigned DEFAULT '0' COMMENT '发货状态 0-未发货 1-已发货 2-已收货',
  `create_time` int unsigned DEFAULT '0' COMMENT '创建时间',
  `pay_time` int unsigned DEFAULT '0' COMMENT '支付时间',
  `shipping_time` int unsigned DEFAULT '0' COMMENT '发货时间',
  `is_deleted` tinyint unsigned DEFAULT '0' COMMENT '1:删除,0未删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='代发订单';

-- 正在导出表  supply_shop.store_substitute_order 的数据：32 rows
DELETE FROM `store_substitute_order`;
/*!40000 ALTER TABLE `store_substitute_order` DISABLE KEYS */;
INSERT INTO `store_substitute_order` (`id`, `user_id`, `sub_ids`, `order_sn`, `shipping_name`, `shipping_code`, `shipping_price`, `product_price`, `order_price`, `order_status`, `pay_method`, `recharge_id`, `pay_status`, `shipping_status`, `create_time`, `pay_time`, `shipping_time`, `is_deleted`) VALUES
	(2, 1, '4,5', '2018072912103852362', '百世快递', '778512356', 10.00, 200.00, 210.00, 1, 3, 143, 1, 2, 1532837438, 1532837438, 1533217816, 0),
	(3, 1, '14,13,12,11,10,9,8,7,6', '2018091321552194262', '', '', 10.00, 100.00, 110.00, 1, 0, 0, 0, 0, 1536846921, 0, 0, 0),
	(4, 7, '21,20,19', '2018091810490577910', '', '', 20.00, 666.00, 686.00, 1, 0, 0, 0, 0, 1537238945, 0, 0, 0),
	(5, 3, '22', '2018092014411541512', '', '', 10.00, 100.00, 110.00, 1, 3, 274, 1, 0, 1537425675, 1539227704, 0, 0),
	(6, 2, '23', '2018092411084283075', '', '', 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 1537758522, 0, 0, 0),
	(7, 2, '24', '2018092411100467284', '', '', 0.00, 100.00, 100.00, 1, 3, 275, 1, 0, 1537758604, 1539227748, 0, 0),
	(8, 3, '26', '2018092715313531353', '', '', 0.00, 100.00, 100.00, 1, 2, 0, 1, 0, 1538033495, 1539220807, 0, 0),
	(9, 7, '30,29', '2018092816340841424', '', '', 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 1538123648, 0, 0, 0),
	(10, 2, '32,25', '2018100822495787026', '顺丰', '11111111', 0.00, 100.00, 100.00, 1, 2, 0, 1, 1, 1539010197, 1539078194, 1539078236, 0),
	(11, 2, '33', '2018101109432466008', '', '', 0.00, 10.00, 100.00, 1, 3, 272, 1, 0, 1539222204, 1539225542, 0, 0),
	(12, 2, '36,35,34', '2018101109452787500', '', '', 0.00, 10.00, 10.00, 1, 3, 271, 1, 0, 1539222327, 1539225110, 0, 0),
	(13, 2, '37', '2018101109453488107', '', '', 10.00, 100.00, 110.00, 1, 2, 0, 1, 0, 1539222334, 1539222400, 0, 0),
	(14, 2, '38', '2018101109454090587', '', '', 0.00, 100.00, 100.00, 1, 3, 270, 1, 0, 1539222340, 1539224847, 0, 0),
	(15, 2, '39', '2018101109454856876', '', '', 0.00, 100.00, 100.00, 1, 3, 269, 1, 0, 1539222348, 1539223033, 0, 0),
	(16, 2, '40', '2018101109455516933', '', '', 0.00, 100.00, 100.00, 1, 3, 268, 1, 0, 1539222355, 1539222693, 0, 0),
	(17, 2, '41', '2018101111173056123', '', '', 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 1539227850, 0, 0, 0),
	(18, 2, '42', '2018101111173945932', '', '', 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 1539227859, 0, 0, 0),
	(19, 2, '43', '2018101111174868230', '', '', 0.00, 100.00, 100.00, 1, 3, 278, 1, 0, 1539227868, 1539228225, 0, 0),
	(20, 2, '44', '2018101111190744708', '', '', 0.00, 100.00, 100.00, 1, 3, 277, 1, 0, 1539227947, 1539228148, 0, 0),
	(21, 2, '45', '2018101111260892418', '', '', 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 1539228368, 0, 0, 0),
	(22, 2, '46', '2018101111261418841', '', '', 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 1539228374, 0, 0, 0),
	(23, 2, '47', '2018101111262114139', '', '', 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 1539228381, 0, 0, 0),
	(24, 2, '48', '2018101111262721285', '', '', 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 1539228387, 0, 0, 0),
	(25, 2, '49', '2018101111263239606', '', '', 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 1539228392, 0, 0, 0),
	(26, 2, '50', '2018101111263996688', '', '', 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 1539228399, 0, 0, 0),
	(27, 2, '51', '2018101111264613029', '', '', 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 1539228406, 0, 0, 0),
	(28, 2, '52', '2018101111265289070', '', '', 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 1539228412, 0, 0, 0),
	(29, 2, '53', '2018101111265824902', '', '', 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 1539228418, 0, 0, 0),
	(30, 2, '54', '2018101111270333844', '', '', 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 1539228423, 0, 0, 0),
	(31, 2, '55', '2018101111270934101', '', '', 0.00, 100.00, 100.00, 1, 0, 0, 0, 0, 1539228429, 0, 0, 0),
	(32, 2, '56', '2018101111271497542', '', '', 0.00, 100.00, 100.00, 1, 3, 280, 1, 0, 1539228434, 1539228618, 0, 0),
	(33, 2, '57', '2018101111271978033', '', '', 0.00, 100.00, 100.00, 1, 3, 279, 1, 0, 1539228439, 1539228527, 0, 0);
/*!40000 ALTER TABLE `store_substitute_order` ENABLE KEYS */;

-- 导出  表 supply_shop.store_substitute_order_goods 结构
DROP TABLE IF EXISTS `store_substitute_order_goods`;
CREATE TABLE IF NOT EXISTS `store_substitute_order_goods` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int unsigned NOT NULL DEFAULT '0' COMMENT '订单id',
  `username` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '收货人姓名',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货手机号',
  `city_info` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '城市信息',
  `address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '收货详细地址',
  `product_info` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '产品明细',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='代发订单货物表';

-- 正在导出表  supply_shop.store_substitute_order_goods 的数据：47 rows
DELETE FROM `store_substitute_order_goods`;
/*!40000 ALTER TABLE `store_substitute_order_goods` DISABLE KEYS */;
INSERT INTO `store_substitute_order_goods` (`id`, `order_id`, `username`, `phone`, `city_info`, `address`, `product_info`) VALUES
	(4, 2, 'hupeng012', '15136175246', '河南省郑州市', '78Hao ', '777橙色 100*200cm *2'),
	(5, 2, 'hupeng0123', '15136175246', '河南省郑州市', '78Hao ', '777橙色 100*200cm *2'),
	(6, 3, '陈星宇', '15136175248', '河南郑州', '长椿路78号', '777橙色 100*200cm *2'),
	(7, 3, 'hupeng01234', '15136175246', '河南省郑州市', '78Hao ', '777橙色 100*200cm *2'),
	(8, 3, '陈星宇', '15136175248', '河南郑州', '长椿路78号', '777橙色 100*200cm *2'),
	(9, 3, 'hupeng', '15136175847', '河南郑州', '工商', '产品'),
	(10, 3, '111', '15601064107', '北京市市辖区东城区', '洒水多所', '岁数大'),
	(11, 3, '111', '15601064107', '北京市市辖区东城区', '洒水多所', '岁数大'),
	(12, 3, '111', '15601064107', '北京市市辖区东城区', '洒水多所', '岁数大'),
	(13, 3, '111', '15601064107', '北京市市辖区东城区', '洒水多所', '岁数大'),
	(14, 3, '测试1', '15601010101', '北京市市辖区东城区', 'add1', '#1234 蓝色 180*220cm *1'),
	(15, 4, '林呵呵', '18888888888', '河北省县延庆县', '11', '13'),
	(16, 4, '林呵呵', '18888888888', '河北省县延庆县', '11', '12'),
	(17, 4, '林呵呵', '18888888888', '河北省县延庆县', '11', '11'),
	(18, 5, '胡鹏', '15136175246', '北京市市辖区东城区', '44号', '产品'),
	(19, 6, 'gao', '15601064107', '北京市市辖区东城区', '1111', '111'),
	(20, 7, '1222', '15601064107', '北京市市辖区东城区', '12', '1222'),
	(21, 8, '胡鹏', '15136175246', '北京市市辖区东城区', '回来了', '啊KKK'),
	(22, 9, '来来来', '18888888888', '北京市市辖区东城区', '健健康康快乐', '阿丽坤'),
	(23, 9, '来来来', '18888888885', '北京市市辖区东城区', '健健康康快乐', '阿丽坤'),
	(24, 10, '1', '15601064107', '北京市市辖区东城区', '1', '1'),
	(25, 10, '我的名字', '15601064107', '北京市市辖区东城区', '岁数大', '123'),
	(26, 11, '11111111', '15601064107', '北京市市辖区东城区', 'q', 'w'),
	(27, 12, '11111111', '15601064107', '北京市市辖区东城区', 'q', 'w'),
	(28, 12, '11111111', '15601064107', '北京市市辖区东城区', 'q', 'w'),
	(29, 12, '11111111', '15601064107', '北京市市辖区东城区', 'q', 'w'),
	(30, 13, '11111111', '15601064107', '北京市市辖区东城区', 'q', 'w'),
	(31, 14, '11111111', '15601064107', '北京市市辖区东城区', 'q', 'w'),
	(32, 15, '11111111', '15601064107', '北京市市辖区东城区', 'q', 'w'),
	(33, 16, '11111111', '15601064107', '北京市市辖区东城区', 'q', 'w'),
	(34, 17, '1', '15601064107', '北京市市辖区东城区', '2222', 'qqww'),
	(35, 18, '1', '15601064107', '北京市市辖区东城区', '2222', 'qqww'),
	(36, 19, '1', '15601064107', '北京市市辖区东城区', '2222', 'qqww'),
	(37, 20, '1', '15601064107', '北京市市辖区东城区', '2222', 'qqww'),
	(38, 21, '1', '15601010101', '北京市市辖区东城区', '222', '222'),
	(39, 22, '1', '15601010101', '北京市市辖区东城区', '222', '222'),
	(40, 23, '1', '15601010101', '北京市市辖区东城区', '222', '222'),
	(41, 24, '1', '15601010101', '北京市市辖区东城区', '222', '222'),
	(42, 25, '1', '15601010101', '北京市市辖区东城区', '222', '222'),
	(43, 26, '1', '15601010101', '北京市市辖区东城区', '222', '222'),
	(44, 27, '1', '15601010101', '北京市市辖区东城区', '222', '222'),
	(45, 28, '1', '15601010101', '北京市市辖区东城区', '222', '222'),
	(46, 29, '1', '15601010101', '北京市市辖区东城区', '222', '222'),
	(47, 30, '1', '15601010101', '北京市市辖区东城区', '222', '222'),
	(48, 31, '1', '15601010101', '北京市市辖区东城区', '222', '222'),
	(49, 32, '1', '15601010101', '北京市市辖区东城区', '222', '222'),
	(50, 33, '1', '15601010101', '北京市市辖区东城区', '222', '222');
/*!40000 ALTER TABLE `store_substitute_order_goods` ENABLE KEYS */;

-- 导出  表 supply_shop.store_user_level 结构
DROP TABLE IF EXISTS `store_user_level`;
CREATE TABLE IF NOT EXISTS `store_user_level` (
  `level_id` smallint unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `level_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '头衔名称',
  `amount` decimal(10,2) DEFAULT NULL COMMENT '等级必要金额',
  `discount` smallint DEFAULT '0' COMMENT '折扣',
  `describe` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '头街 描述',
  PRIMARY KEY (`level_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='用户等级表';

-- 正在导出表  supply_shop.store_user_level 的数据：6 rows
DELETE FROM `store_user_level`;
/*!40000 ALTER TABLE `store_user_level` DISABLE KEYS */;
INSERT INTO `store_user_level` (`level_id`, `level_name`, `amount`, `discount`, `describe`) VALUES
	(1, '注册会员', 100.00, 0, '注册会员'),
	(2, '铜牌会员', 1000.00, 98, '铜牌会员'),
	(3, '白银会员', 3000.00, 95, '白银会员'),
	(4, '黄金会员', 5000.00, 92, '黄金会员'),
	(5, '钻石会员', 10000.00, 90, '钻石会员'),
	(6, '超级VIP', 20000.00, 88, '超级VIP');
/*!40000 ALTER TABLE `store_user_level` ENABLE KEYS */;

-- 导出  表 supply_shop.sys_config 结构
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE IF NOT EXISTS `sys_config` (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='参数配置表';

-- 正在导出表  supply_shop.sys_config 的数据：~3 rows (大约)
DELETE FROM `sys_config`;
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
	(1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow'),
	(2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '初始化密码 123456'),
	(3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '深色主题theme-dark，浅色主题theme-light');

-- 导出  表 supply_shop.sys_dept 结构
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE IF NOT EXISTS `sys_dept` (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '部门名称',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='部门表';

-- 正在导出表  supply_shop.sys_dept 的数据：~10 rows (大约)
DELETE FROM `sys_dept`;
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES
	(100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00'),
	(101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00'),
	(102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00'),
	(103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00'),
	(104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00'),
	(105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00'),
	(106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00'),
	(107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00'),
	(108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00'),
	(109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');

-- 导出  表 supply_shop.sys_dict_data 结构
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE IF NOT EXISTS `sys_dict_data` (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='字典数据表';

-- 正在导出表  supply_shop.sys_dict_data 的数据：~28 rows (大约)
DELETE FROM `sys_dict_data`;
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
	(1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别男'),
	(2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别女'),
	(3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别未知'),
	(4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '显示菜单'),
	(5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '隐藏菜单'),
	(6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态'),
	(7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态'),
	(8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态'),
	(9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态'),
	(10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '默认分组'),
	(11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统分组'),
	(12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统默认是'),
	(13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统默认否'),
	(14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知'),
	(15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '公告'),
	(16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态'),
	(17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '关闭状态'),
	(18, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '新增操作'),
	(19, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '修改操作'),
	(20, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '删除操作'),
	(21, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '授权操作'),
	(22, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '导出操作'),
	(23, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '导入操作'),
	(24, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '强退操作'),
	(25, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '生成操作'),
	(26, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '清空操作'),
	(27, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态'),
	(28, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');

-- 导出  表 supply_shop.sys_dict_type 结构
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE IF NOT EXISTS `sys_dict_type` (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE KEY `dict_type` (`dict_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='字典类型表';

-- 正在导出表  supply_shop.sys_dict_type 的数据：~10 rows (大约)
DELETE FROM `sys_dict_type`;
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
	(1, '用户性别', 'sys_user_sex', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '用户性别列表'),
	(2, '菜单状态', 'sys_show_hide', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '菜单状态列表'),
	(3, '系统开关', 'sys_normal_disable', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统开关列表'),
	(4, '任务状态', 'sys_job_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '任务状态列表'),
	(5, '任务分组', 'sys_job_group', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '任务分组列表'),
	(6, '系统是否', 'sys_yes_no', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统是否列表'),
	(7, '通知类型', 'sys_notice_type', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知类型列表'),
	(8, '通知状态', 'sys_notice_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知状态列表'),
	(9, '操作类型', 'sys_oper_type', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '操作类型列表'),
	(10, '系统状态', 'sys_common_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '登录状态列表');

-- 导出  表 supply_shop.sys_job 结构
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE IF NOT EXISTS `sys_job` (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='定时任务调度表';

-- 正在导出表  supply_shop.sys_job 的数据：~3 rows (大约)
DELETE FROM `sys_job`;
INSERT INTO `sys_job` (`job_id`, `job_name`, `job_group`, `invoke_target`, `cron_expression`, `misfire_policy`, `concurrent`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
	(1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');

-- 导出  表 supply_shop.sys_job_log 结构
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE IF NOT EXISTS `sys_job_log` (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='定时任务调度日志表';

-- 正在导出表  supply_shop.sys_job_log 的数据：~0 rows (大约)
DELETE FROM `sys_job_log`;

-- 导出  表 supply_shop.sys_logininfor 结构
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE IF NOT EXISTS `sys_logininfor` (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `login_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '登录账号',
  `ipaddr` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=488 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='系统访问记录';

-- 正在导出表  supply_shop.sys_logininfor 的数据：~346 rows (大约)
DELETE FROM `sys_logininfor`;
INSERT INTO `sys_logininfor` (`info_id`, `login_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES
	(100, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-08-14 17:13:14'),
	(101, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-08-14 17:13:41'),
	(102, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-14 17:14:00'),
	(103, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-08-21 16:33:26'),
	(104, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-21 16:33:40'),
	(105, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-22 09:46:17'),
	(106, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-22 10:04:10'),
	(107, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-08-22 10:28:28'),
	(108, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-08-22 10:34:50'),
	(109, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-22 10:36:54'),
	(110, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-22 11:09:08'),
	(111, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-23 16:39:39'),
	(112, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-23 16:46:01'),
	(113, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-23 16:48:12'),
	(114, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-23 16:49:02'),
	(115, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-23 16:51:46'),
	(116, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-23 16:57:52'),
	(117, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-23 16:59:05'),
	(118, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-23 17:02:10'),
	(119, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-23 17:05:35'),
	(120, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-23 17:16:43'),
	(121, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-23 17:24:14'),
	(122, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-23 17:28:18'),
	(123, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-23 17:34:45'),
	(124, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-23 17:37:02'),
	(125, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-23 17:38:43'),
	(126, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-23 17:44:06'),
	(127, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-23 17:48:07'),
	(128, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-23 17:50:10'),
	(129, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-23 18:02:44'),
	(130, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-23 18:06:07'),
	(131, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-23 18:08:27'),
	(132, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-23 18:14:50'),
	(133, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-23 18:17:26'),
	(134, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-23 18:19:01'),
	(135, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-23 18:30:58'),
	(136, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-23 18:33:00'),
	(137, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-23 18:37:00'),
	(138, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-23 18:38:21'),
	(139, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-23 18:40:17'),
	(140, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-24 14:13:59'),
	(141, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-24 14:27:37'),
	(142, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-24 14:38:47'),
	(143, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-24 14:58:38'),
	(144, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-24 15:25:41'),
	(145, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-24 15:28:39'),
	(146, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-24 15:33:25'),
	(147, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-24 15:45:45'),
	(148, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-24 15:47:30'),
	(149, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-24 15:48:33'),
	(150, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-24 15:59:34'),
	(151, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-24 16:00:18'),
	(152, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-24 16:02:08'),
	(153, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-24 16:03:29'),
	(154, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-24 16:10:32'),
	(155, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-24 17:25:45'),
	(156, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-24 17:27:50'),
	(157, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-24 17:30:28'),
	(158, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-24 17:33:20'),
	(159, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-24 17:35:17'),
	(160, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-24 17:46:51'),
	(161, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-25 09:33:47'),
	(162, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-25 10:03:45'),
	(163, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-25 11:01:14'),
	(164, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-25 11:39:54'),
	(165, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-25 11:46:33'),
	(166, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-25 11:50:42'),
	(167, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-25 11:54:42'),
	(168, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-25 12:02:58'),
	(169, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-25 12:09:03'),
	(170, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-25 13:58:11'),
	(171, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-25 14:21:19'),
	(172, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-25 15:01:53'),
	(173, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-25 15:09:03'),
	(174, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-25 15:15:16'),
	(175, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-25 15:20:48'),
	(176, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-25 15:21:36'),
	(177, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-25 15:23:46'),
	(178, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-25 15:24:36'),
	(179, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-25 15:32:13'),
	(180, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-25 15:34:06'),
	(181, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-25 15:38:59'),
	(182, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-25 15:45:51'),
	(183, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-25 15:51:54'),
	(184, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-25 15:56:23'),
	(185, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-25 16:00:45'),
	(186, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-25 16:04:21'),
	(187, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-25 16:24:20'),
	(188, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-25 16:26:10'),
	(189, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-25 16:32:44'),
	(190, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-25 16:33:58'),
	(191, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-25 16:39:07'),
	(192, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-25 16:42:52'),
	(193, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-25 16:48:50'),
	(194, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-25 16:50:35'),
	(195, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-25 17:27:43'),
	(196, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-25 17:29:08'),
	(197, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-25 17:38:47'),
	(198, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-25 17:47:03'),
	(199, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-25 17:48:45'),
	(200, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-25 18:06:09'),
	(201, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-25 18:08:38'),
	(202, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-26 13:23:58'),
	(203, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-26 14:16:05'),
	(204, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-26 14:18:42'),
	(205, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-26 14:25:06'),
	(206, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-26 14:49:59'),
	(207, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-26 14:53:36'),
	(208, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-26 14:55:10'),
	(209, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-26 14:59:00'),
	(210, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-26 15:02:23'),
	(211, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-26 15:04:02'),
	(212, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-26 16:26:50'),
	(213, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-26 16:30:02'),
	(214, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-26 16:33:20'),
	(215, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-26 16:49:02'),
	(216, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-26 16:57:10'),
	(217, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-26 17:00:49'),
	(218, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-26 17:02:04'),
	(219, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-26 17:03:30'),
	(220, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-26 17:07:37'),
	(221, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-26 17:19:45'),
	(222, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-26 17:21:43'),
	(223, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-26 17:25:40'),
	(224, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-26 17:31:16'),
	(225, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-26 17:43:55'),
	(226, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-26 17:46:31'),
	(227, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-26 17:51:56'),
	(228, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-26 17:56:47'),
	(229, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-26 17:59:41'),
	(230, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-26 18:01:03'),
	(231, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-26 18:08:17'),
	(232, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-26 18:09:19'),
	(233, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-26 18:11:28'),
	(234, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-26 18:14:08'),
	(235, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-26 18:16:14'),
	(236, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-26 19:28:06'),
	(237, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-26 19:41:15'),
	(238, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-26 19:46:39'),
	(239, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-26 19:53:00'),
	(240, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-26 20:01:05'),
	(241, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-26 20:04:07'),
	(242, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-26 20:05:20'),
	(243, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-27 14:18:31'),
	(244, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-27 15:34:17'),
	(245, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-27 15:45:25'),
	(246, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-27 15:48:31'),
	(247, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-27 16:02:46'),
	(248, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-27 16:04:55'),
	(249, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-27 16:18:21'),
	(250, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-27 16:22:28'),
	(251, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-27 16:24:15'),
	(252, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-27 17:02:57'),
	(253, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-27 17:04:35'),
	(254, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-27 17:09:59'),
	(255, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-27 17:11:10'),
	(256, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-27 17:14:31'),
	(257, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-27 17:16:28'),
	(258, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-27 17:21:27'),
	(259, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-27 17:29:55'),
	(260, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-27 17:39:23'),
	(261, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-27 17:46:53'),
	(262, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-27 17:49:12'),
	(263, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-27 17:52:16'),
	(264, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-27 17:52:20'),
	(265, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-27 17:54:51'),
	(266, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-27 18:08:39'),
	(267, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-27 18:20:10'),
	(268, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-27 18:24:54'),
	(269, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-27 18:29:25'),
	(270, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-27 18:40:53'),
	(271, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-27 18:42:38'),
	(272, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-27 18:44:42'),
	(273, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-27 18:46:45'),
	(274, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-27 18:49:02'),
	(275, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-27 18:51:15'),
	(276, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-27 19:04:08'),
	(277, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-27 19:06:16'),
	(278, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-27 19:12:54'),
	(279, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-27 19:19:40'),
	(280, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-27 19:28:28'),
	(281, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-27 19:33:31'),
	(282, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-27 19:36:03'),
	(283, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-27 19:36:56'),
	(284, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-28 09:21:45'),
	(285, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-28 09:29:18'),
	(286, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-28 09:33:18'),
	(287, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-28 09:43:07'),
	(288, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-28 09:47:20'),
	(289, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-28 10:40:22'),
	(290, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-28 10:56:56'),
	(291, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-28 11:00:35'),
	(292, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-28 11:14:35'),
	(293, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-28 11:16:42'),
	(294, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-28 11:20:37'),
	(295, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-28 11:28:45'),
	(296, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-28 11:29:32'),
	(297, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-28 14:15:41'),
	(298, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-28 14:57:22'),
	(299, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-28 15:22:48'),
	(300, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-28 15:26:30'),
	(301, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-28 15:27:23'),
	(302, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-28 16:03:29'),
	(303, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-28 16:16:39'),
	(304, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-28 16:21:48'),
	(305, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-28 16:23:24'),
	(306, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-28 16:26:18'),
	(307, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-28 16:28:48'),
	(308, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-28 16:45:43'),
	(309, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-28 16:47:18'),
	(310, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-28 16:53:36'),
	(311, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-28 16:56:04'),
	(312, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-28 16:59:32'),
	(313, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-28 17:02:16'),
	(314, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-28 17:05:20'),
	(315, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-28 17:13:56'),
	(316, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-28 17:17:43'),
	(317, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-28 17:21:47'),
	(318, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-28 17:25:37'),
	(319, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-28 17:39:19'),
	(320, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-28 17:46:57'),
	(321, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-28 18:02:50'),
	(322, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-28 18:06:20'),
	(323, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-28 18:07:54'),
	(324, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-28 18:11:20'),
	(325, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-28 18:20:27'),
	(326, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-28 18:23:56'),
	(327, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-28 18:37:18'),
	(328, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-28 18:43:37'),
	(329, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-28 18:57:43'),
	(330, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-28 19:00:59'),
	(331, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-28 19:03:56'),
	(332, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-28 19:10:52'),
	(333, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-28 19:12:34'),
	(334, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-28 19:29:36'),
	(335, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-28 19:33:33'),
	(336, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-28 19:36:30'),
	(337, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-28 19:38:26'),
	(338, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-28 19:40:29'),
	(339, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-28 19:42:58'),
	(340, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-28 19:46:48'),
	(341, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-28 19:49:54'),
	(342, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-28 19:51:44'),
	(343, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-28 19:53:24'),
	(344, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-28 19:56:01'),
	(345, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-28 19:57:28'),
	(346, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-28 19:59:02'),
	(347, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-28 20:00:04'),
	(348, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-28 20:02:11'),
	(349, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-28 20:02:52'),
	(350, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-28 20:04:18'),
	(351, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-28 20:05:21'),
	(352, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-28 20:06:45'),
	(353, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-28 20:07:54'),
	(354, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-28 20:08:55'),
	(355, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-28 20:09:49'),
	(356, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-28 20:10:45'),
	(357, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-29 14:51:31'),
	(358, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-29 15:07:31'),
	(359, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-29 15:12:32'),
	(360, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-29 15:14:43'),
	(361, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-29 15:17:50'),
	(362, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-29 15:20:46'),
	(363, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-29 15:40:27'),
	(364, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-29 16:06:46'),
	(365, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-29 16:13:53'),
	(366, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-29 16:16:20'),
	(367, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-29 16:24:59'),
	(368, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-29 16:29:03'),
	(369, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-29 16:34:56'),
	(370, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-29 16:40:13'),
	(371, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-29 16:45:58'),
	(372, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-29 16:52:40'),
	(373, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-29 17:05:42'),
	(374, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-29 17:06:57'),
	(375, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-29 17:23:34'),
	(376, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-29 17:44:43'),
	(377, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-29 17:49:39'),
	(378, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-29 18:10:24'),
	(379, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-29 18:19:19'),
	(380, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-29 18:21:10'),
	(381, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-29 19:04:57'),
	(382, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-29 19:08:30'),
	(383, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-29 19:12:14'),
	(384, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-29 19:15:06'),
	(385, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-29 19:34:39'),
	(386, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-29 19:38:36'),
	(387, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-29 19:44:15'),
	(388, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-29 19:58:35'),
	(389, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-30 09:36:11'),
	(390, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-30 09:48:29'),
	(391, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-30 09:53:47'),
	(392, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-30 09:56:21'),
	(393, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-30 10:17:56'),
	(394, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-30 10:25:02'),
	(395, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-30 10:34:29'),
	(396, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-30 10:36:18'),
	(397, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-30 10:41:54'),
	(398, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-30 11:33:26'),
	(399, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-30 13:23:29'),
	(400, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-30 13:27:28'),
	(401, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-30 13:30:33'),
	(402, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-30 13:32:15'),
	(403, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-30 13:35:21'),
	(404, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-30 13:38:12'),
	(405, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-30 14:16:57'),
	(406, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-30 14:19:46'),
	(407, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-30 14:21:34'),
	(408, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-30 14:24:10'),
	(409, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-30 14:24:57'),
	(410, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-30 14:26:07'),
	(411, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-30 14:38:03'),
	(412, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-30 14:45:50'),
	(413, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-30 14:54:01'),
	(414, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-30 14:59:55'),
	(415, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-30 15:45:12'),
	(416, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-30 15:47:37'),
	(417, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-30 16:01:00'),
	(418, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-30 16:02:22'),
	(419, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-30 16:08:35'),
	(420, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-30 16:13:20'),
	(421, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-30 16:14:50'),
	(422, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-30 16:18:13'),
	(423, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-30 16:30:59'),
	(424, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-30 16:32:07'),
	(425, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-08-30 17:21:30'),
	(426, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-16 17:22:52'),
	(427, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-16 17:25:37'),
	(428, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-16 17:27:33'),
	(429, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-23 15:41:59'),
	(430, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-23 15:45:33'),
	(431, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-23 15:56:35'),
	(432, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-09-23 16:47:42'),
	(433, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2021-06-07 15:11:05'),
	(434, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2021-06-07 15:14:26'),
	(435, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2021-06-07 15:14:31'),
	(436, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2021-06-07 15:14:36'),
	(437, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-06-07 15:14:40'),
	(438, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-06-18 15:09:24'),
	(439, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2021-06-18 16:53:15'),
	(440, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-06-18 16:53:20'),
	(441, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2021-06-18 16:55:13'),
	(442, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2021-06-18 16:55:19'),
	(443, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-06-18 16:55:24'),
	(444, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-06-18 16:58:46'),
	(445, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2021-06-18 17:06:15'),
	(446, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-10 23:35:25'),
	(447, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-11 19:41:58'),
	(448, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-11 22:23:11'),
	(449, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-10-11 23:23:17'),
	(450, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-11 23:23:22'),
	(451, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-12 23:12:33'),
	(452, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-17 21:51:05'),
	(453, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-11-02 00:21:32'),
	(454, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-05 00:10:13'),
	(455, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-07 19:22:14'),
	(456, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-01-07 19:26:43'),
	(457, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-07 19:28:56'),
	(458, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-01-07 19:29:43'),
	(459, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-17 22:45:30'),
	(460, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-02-17 22:45:39'),
	(461, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-17 22:45:55'),
	(462, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-02-17 22:46:53'),
	(463, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-17 22:47:25'),
	(464, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-02-17 22:47:37'),
	(465, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-17 23:47:04'),
	(466, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-02-17 23:47:07'),
	(467, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-18 00:13:28'),
	(468, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-02-18 00:13:38'),
	(469, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-20 23:03:12'),
	(470, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-02-20 23:03:14'),
	(471, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-02-20 23:25:44'),
	(472, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-02-20 23:25:48'),
	(473, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-20 23:25:52'),
	(474, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-02-20 23:29:55'),
	(475, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-02-20 23:30:00'),
	(476, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-20 23:30:05'),
	(477, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', '0', '登录成功', '2023-02-22 23:08:54'),
	(478, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', '0', '退出成功', '2023-02-22 23:13:27'),
	(479, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', '0', '登录成功', '2023-02-22 23:13:30'),
	(480, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-02-22 23:18:50'),
	(481, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-22 23:18:53'),
	(482, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-02-22 23:29:59'),
	(483, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', '0', '登录成功', '2023-02-22 23:30:04'),
	(484, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', '0', '登录成功', '2023-02-22 23:33:34'),
	(485, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', '0', '登录成功', '2023-02-22 23:40:23'),
	(486, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', '0', '登录成功', '2023-02-22 23:41:37'),
	(487, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', '0', '登录成功', '2023-02-22 23:50:11');

-- 导出  表 supply_shop.sys_menu 结构
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE IF NOT EXISTS `sys_menu` (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '#' COMMENT '请求地址',
  `target` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '打开方式（menuItem页签 menuBlank新窗口）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `is_refresh` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '1',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1107 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='菜单权限表';

-- 正在导出表  supply_shop.sys_menu 的数据：~128 rows (大约)
DELETE FROM `sys_menu`;
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `target`, `menu_type`, `visible`, `is_refresh`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
	(1, '系统管理', 0, 1, '#', '', 'M', '0', '1', '', 'fa fa-gear', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统管理目录'),
	(2, '系统监控', 0, 2, '#', '', 'M', '0', '1', '', 'fa fa-video-camera', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统监控目录'),
	(3, '系统工具', 0, 3, '#', '', 'M', '0', '1', '', 'fa fa-bars', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统工具目录'),
	(100, '用户管理', 1, 1, '/system/user', '', 'C', '0', '1', 'system:user:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '用户管理菜单'),
	(101, '角色管理', 1, 2, '/system/role', '', 'C', '0', '1', 'system:role:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '角色管理菜单'),
	(102, '菜单管理', 1, 3, '/system/menu', '', 'C', '0', '1', 'system:menu:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '菜单管理菜单'),
	(103, '部门管理', 1, 4, '/system/dept', '', 'C', '0', '1', 'system:dept:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '部门管理菜单'),
	(104, '岗位管理', 1, 5, '/system/post', '', 'C', '0', '1', 'system:post:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '岗位管理菜单'),
	(105, '字典管理', 1, 6, '/system/dict', '', 'C', '0', '1', 'system:dict:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '字典管理菜单'),
	(106, '参数设置', 1, 7, '/system/config', '', 'C', '0', '1', 'system:config:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '参数设置菜单'),
	(107, '通知公告', 1, 8, '/system/notice', '', 'C', '0', '1', 'system:notice:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知公告菜单'),
	(108, '日志管理', 1, 9, '#', '', 'M', '0', '1', '', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '日志管理菜单'),
	(109, '在线用户', 2, 1, '/monitor/online', '', 'C', '0', '1', 'monitor:online:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '在线用户菜单'),
	(110, '定时任务', 2, 2, '/monitor/job', '', 'C', '0', '1', 'monitor:job:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '定时任务菜单'),
	(111, '数据监控', 2, 3, '/monitor/data', '', 'C', '0', '1', 'monitor:data:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '数据监控菜单'),
	(112, '服务监控', 2, 3, '/monitor/server', '', 'C', '0', '1', 'monitor:server:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '服务监控菜单'),
	(113, '表单构建', 3, 1, '/tool/build', '', 'C', '0', '1', 'tool:build:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '表单构建菜单'),
	(114, '代码生成', 3, 2, '/tool/gen', '', 'C', '0', '1', 'tool:gen:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '代码生成菜单'),
	(115, '系统接口', 3, 3, '/tool/swagger', '', 'C', '0', '1', 'tool:swagger:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统接口菜单'),
	(500, '操作日志', 108, 1, '/monitor/operlog', '', 'C', '0', '1', 'monitor:operlog:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '操作日志菜单'),
	(501, '登录日志', 108, 2, '/monitor/logininfor', '', 'C', '0', '1', 'monitor:logininfor:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '登录日志菜单'),
	(1000, '用户查询', 100, 1, '#', '', 'F', '0', '1', 'system:user:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1001, '用户新增', 100, 2, '#', '', 'F', '0', '1', 'system:user:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1002, '用户修改', 100, 3, '#', '', 'F', '0', '1', 'system:user:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1003, '用户删除', 100, 4, '#', '', 'F', '0', '1', 'system:user:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1004, '用户导出', 100, 5, '#', '', 'F', '0', '1', 'system:user:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1005, '用户导入', 100, 6, '#', '', 'F', '0', '1', 'system:user:import', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1006, '重置密码', 100, 7, '#', '', 'F', '0', '1', 'system:user:resetPwd', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1007, '角色查询', 101, 1, '#', '', 'F', '0', '1', 'system:role:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1008, '角色新增', 101, 2, '#', '', 'F', '0', '1', 'system:role:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1009, '角色修改', 101, 3, '#', '', 'F', '0', '1', 'system:role:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1010, '角色删除', 101, 4, '#', '', 'F', '0', '1', 'system:role:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1011, '角色导出', 101, 5, '#', '', 'F', '0', '1', 'system:role:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1012, '菜单查询', 102, 1, '#', '', 'F', '0', '1', 'system:menu:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1013, '菜单新增', 102, 2, '#', '', 'F', '0', '1', 'system:menu:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1014, '菜单修改', 102, 3, '#', '', 'F', '0', '1', 'system:menu:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1015, '菜单删除', 102, 4, '#', '', 'F', '0', '1', 'system:menu:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1016, '部门查询', 103, 1, '#', '', 'F', '0', '1', 'system:dept:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1017, '部门新增', 103, 2, '#', '', 'F', '0', '1', 'system:dept:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1018, '部门修改', 103, 3, '#', '', 'F', '0', '1', 'system:dept:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1019, '部门删除', 103, 4, '#', '', 'F', '0', '1', 'system:dept:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1020, '岗位查询', 104, 1, '#', '', 'F', '0', '1', 'system:post:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1021, '岗位新增', 104, 2, '#', '', 'F', '0', '1', 'system:post:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1022, '岗位修改', 104, 3, '#', '', 'F', '0', '1', 'system:post:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1023, '岗位删除', 104, 4, '#', '', 'F', '0', '1', 'system:post:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1024, '岗位导出', 104, 5, '#', '', 'F', '0', '1', 'system:post:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1025, '字典查询', 105, 1, '#', '', 'F', '0', '1', 'system:dict:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1026, '字典新增', 105, 2, '#', '', 'F', '0', '1', 'system:dict:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1027, '字典修改', 105, 3, '#', '', 'F', '0', '1', 'system:dict:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1028, '字典删除', 105, 4, '#', '', 'F', '0', '1', 'system:dict:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1029, '字典导出', 105, 5, '#', '', 'F', '0', '1', 'system:dict:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1030, '参数查询', 106, 1, '#', '', 'F', '0', '1', 'system:config:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1031, '参数新增', 106, 2, '#', '', 'F', '0', '1', 'system:config:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1032, '参数修改', 106, 3, '#', '', 'F', '0', '1', 'system:config:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1033, '参数删除', 106, 4, '#', '', 'F', '0', '1', 'system:config:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1034, '参数导出', 106, 5, '#', '', 'F', '0', '1', 'system:config:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1035, '公告查询', 107, 1, '#', '', 'F', '0', '1', 'system:notice:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1036, '公告新增', 107, 2, '#', '', 'F', '0', '1', 'system:notice:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1037, '公告修改', 107, 3, '#', '', 'F', '0', '1', 'system:notice:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1038, '公告删除', 107, 4, '#', '', 'F', '0', '1', 'system:notice:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1039, '操作查询', 500, 1, '#', '', 'F', '0', '1', 'monitor:operlog:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1040, '操作删除', 500, 2, '#', '', 'F', '0', '1', 'monitor:operlog:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1041, '详细信息', 500, 3, '#', '', 'F', '0', '1', 'monitor:operlog:detail', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1042, '日志导出', 500, 4, '#', '', 'F', '0', '1', 'monitor:operlog:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1043, '登录查询', 501, 1, '#', '', 'F', '0', '1', 'monitor:logininfor:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1044, '登录删除', 501, 2, '#', '', 'F', '0', '1', 'monitor:logininfor:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1045, '日志导出', 501, 3, '#', '', 'F', '0', '1', 'monitor:logininfor:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1046, '在线查询', 109, 1, '#', '', 'F', '0', '1', 'monitor:online:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1047, '批量强退', 109, 2, '#', '', 'F', '0', '1', 'monitor:online:batchForceLogout', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1048, '单条强退', 109, 3, '#', '', 'F', '0', '1', 'monitor:online:forceLogout', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1049, '任务查询', 110, 1, '#', '', 'F', '0', '1', 'monitor:job:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1050, '任务新增', 110, 2, '#', '', 'F', '0', '1', 'monitor:job:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1051, '任务修改', 110, 3, '#', '', 'F', '0', '1', 'monitor:job:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1052, '任务删除', 110, 4, '#', '', 'F', '0', '1', 'monitor:job:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1053, '状态修改', 110, 5, '#', '', 'F', '0', '1', 'monitor:job:changeStatus', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1054, '任务详细', 110, 6, '#', '', 'F', '0', '1', 'monitor:job:detail', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1055, '任务导出', 110, 7, '#', '', 'F', '0', '1', 'monitor:job:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1056, '生成查询', 114, 1, '#', '', 'F', '0', '1', 'tool:gen:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1057, '生成修改', 114, 2, '#', '', 'F', '0', '1', 'tool:gen:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1058, '生成删除', 114, 3, '#', '', 'F', '0', '1', 'tool:gen:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1059, '预览代码', 114, 4, '#', '', 'F', '0', '1', 'tool:gen:preview', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1060, '生成代码', 114, 5, '#', '', 'F', '0', '1', 'tool:gen:code', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(1061, '商城管理', 0, 0, '#', 'menuItem', 'M', '0', '1', '', 'fa fa-shopping-cart', 'admin', '2019-08-22 10:14:45', 'admin', '2021-06-18 17:00:18', ''),
	(1062, '商城商品分类', 1061, 1, '/shop/cate', '', 'C', '0', '1', 'shop:cate:view', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '商城商品分类菜单'),
	(1063, '商城商品分类查询', 1062, 1, '#', '', 'F', '0', '1', 'shop:cate:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
	(1064, '商城商品分类新增', 1062, 2, '#', '', 'F', '0', '1', 'shop:cate:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
	(1065, '商城商品分类修改', 1062, 3, '#', '', 'F', '0', '1', 'shop:cate:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
	(1066, '商城商品分类删除', 1062, 4, '#', '', 'F', '0', '1', 'shop:cate:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
	(1067, '产品品牌', 1061, 1, '/shop/brand', '', 'C', '0', '1', 'shop:brand:view', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '产品品牌菜单'),
	(1068, '产品品牌查询', 1067, 1, '#', '', 'F', '0', '1', 'shop:brand:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
	(1069, '产品品牌新增', 1067, 2, '#', '', 'F', '0', '1', 'shop:brand:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
	(1070, '产品品牌修改', 1067, 3, '#', '', 'F', '0', '1', 'shop:brand:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
	(1071, '产品品牌删除', 1067, 4, '#', '', 'F', '0', '1', 'shop:brand:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
	(1072, '商品类型(商品模型)', 1061, 1, '/shop/type', '', 'C', '0', '1', 'shop:type:view', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '商品类型(商品模型)菜单'),
	(1073, '商品类型(商品模型)查询', 1072, 1, '#', '', 'F', '0', '1', 'shop:type:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
	(1074, '商品类型(商品模型)新增', 1072, 2, '#', '', 'F', '0', '1', 'shop:type:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
	(1075, '商品类型(商品模型)修改', 1072, 3, '#', '', 'F', '0', '1', 'shop:type:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
	(1076, '商品类型(商品模型)删除', 1072, 4, '#', '', 'F', '0', '1', 'shop:type:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
	(1077, '商品的属性', 1061, 1, '/shop/attribute', '', 'C', '0', '1', 'shop:attribute:view', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '商品的属性(独立)菜单'),
	(1078, '商品的属性查询', 1077, 1, '#', '', 'F', '0', '1', 'shop:attribute:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
	(1079, '商品的属性新增', 1077, 2, '#', '', 'F', '0', '1', 'shop:attribute:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
	(1080, '商品的属性修改', 1077, 3, '#', '', 'F', '0', '1', 'shop:attribute:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
	(1081, '商品的属性删除', 1077, 4, '#', '', 'F', '0', '1', 'shop:attribute:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
	(1082, '商品规格', 1061, 1, '/shop/spec', '', 'C', '0', '1', 'shop:spec:view', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '商品规格(独立)菜单'),
	(1083, '商品规格查询', 1082, 1, '#', '', 'F', '0', '1', 'shop:spec:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
	(1084, '商品规格新增', 1082, 2, '#', '', 'F', '0', '1', 'shop:spec:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
	(1085, '商品规格修改', 1082, 3, '#', '', 'F', '0', '1', 'shop:spec:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
	(1086, '商品规格删除', 1082, 4, '#', '', 'F', '0', '1', 'shop:spec:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
	(1087, '商品管理', 1061, 1, '/shop/goods', '', 'C', '0', '1', 'shop:goods:view', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '商品主菜单'),
	(1088, '商品查询', 1087, 1, '#', '', 'F', '0', '1', 'shop:goods:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
	(1089, '商品新增', 1087, 2, '#', '', 'F', '0', '1', 'shop:goods:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
	(1090, '商品修改', 1087, 3, '#', '', 'F', '0', '1', 'shop:goods:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
	(1091, '商品删除', 1087, 4, '#', '', 'F', '0', '1', 'shop:goods:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
	(1092, '优惠券', 1061, 1, '/shop/coupon', '', 'C', '0', '1', 'shop:coupon:view', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '优惠券主菜单'),
	(1093, '优惠券查询', 1092, 1, '#', '', 'F', '0', '1', 'shop:coupon:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
	(1094, '优惠券新增', 1092, 2, '#', '', 'F', '0', '1', 'shop:coupon:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
	(1095, '优惠券修改', 1092, 3, '#', '', 'F', '0', '1', 'shop:coupon:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
	(1096, '优惠券删除', 1092, 4, '#', '', 'F', '0', '1', 'shop:coupon:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
	(1097, '订单管理', 1061, 1, '/shop/order', '', 'C', '0', '1', 'shop:order:view', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '订单主菜单'),
	(1098, '订单查询', 1097, 1, '#', '', 'F', '0', '1', 'shop:order:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
	(1099, '订单新增', 1097, 2, '#', '', 'F', '0', '1', 'shop:order:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
	(1100, '订单修改', 1097, 3, '#', '', 'F', '0', '1', 'shop:order:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
	(1101, '订单删除', 1097, 4, '#', '', 'F', '0', '1', 'shop:order:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
	(1102, '会员信息', 1061, 1, '/shop/member', '', 'C', '0', '1', 'shop:member:view', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '商城会员信息菜单'),
	(1103, '会员信息查询', 1102, 1, '#', '', 'F', '0', '1', 'shop:member:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
	(1104, '会员信息新增', 1102, 2, '#', '', 'F', '0', '1', 'shop:member:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
	(1105, '会员信息修改', 1102, 3, '#', '', 'F', '0', '1', 'shop:member:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
	(1106, '会员信息删除', 1102, 4, '#', '', 'F', '0', '1', 'shop:member:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');

-- 导出  表 supply_shop.sys_notice 结构
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE IF NOT EXISTS `sys_notice` (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='通知公告表';

-- 正在导出表  supply_shop.sys_notice 的数据：~2 rows (大约)
DELETE FROM `sys_notice`;
INSERT INTO `sys_notice` (`notice_id`, `notice_title`, `notice_type`, `notice_content`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
	(1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', '新版本内容', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '管理员'),
	(2, '维护通知：2018-07-01 若依系统凌晨维护', '1', '维护内容', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '管理员');

-- 导出  表 supply_shop.sys_oper_log 结构
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE IF NOT EXISTS `sys_oper_log` (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '模块标题',
  `business_type` int DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '',
  `operator_type` int DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '请求参数',
  `status` int DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '返回参数',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='操作日志记录';

-- 正在导出表  supply_shop.sys_oper_log 的数据：~66 rows (大约)
DELETE FROM `sys_oper_log`;
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `status`, `error_msg`, `oper_time`, `json_result`) VALUES
	(1, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', '', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\r\n  "tables" : [ "store_goods_cate" ]\r\n}', 0, NULL, '2019-08-22 09:59:25', NULL),
	(2, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.genCode()', '', 1, 'admin', '研发部门', '/tool/gen/genCode/store_goods_cate', '127.0.0.1', '内网IP', '{ }', 0, NULL, '2019-08-22 10:00:12', NULL),
	(3, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.genCode()', '', 1, 'admin', '研发部门', '/tool/gen/genCode/store_goods_cate', '127.0.0.1', '内网IP', '{ }', 0, NULL, '2019-08-22 10:00:43', NULL),
	(4, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', '', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\r\n  "tableId" : [ "1" ],\r\n  "tableName" : [ "store_goods_cate" ],\r\n  "tableComment" : [ "商城商品分类" ],\r\n  "className" : [ "StoreGoodsCate" ],\r\n  "functionAuthor" : [ "hupeng" ],\r\n  "remark" : [ "" ],\r\n  "columns[0].columnId" : [ "1" ],\r\n  "columns[0].sort" : [ "1" ],\r\n  "columns[0].columnComment" : [ "null" ],\r\n  "columns[0].javaType" : [ "Long" ],\r\n  "columns[0].javaField" : [ "id" ],\r\n  "columns[0].isInsert" : [ "1" ],\r\n  "columns[0].queryType" : [ "EQ" ],\r\n  "columns[0].htmlType" : [ "input" ],\r\n  "columns[0].dictType" : [ "" ],\r\n  "columns[1].columnId" : [ "2" ],\r\n  "columns[1].sort" : [ "2" ],\r\n  "columns[1].columnComment" : [ "上级分类编号" ],\r\n  "columns[1].javaType" : [ "Long" ],\r\n  "columns[1].javaField" : [ "pid" ],\r\n  "columns[1].isInsert" : [ "1" ],\r\n  "columns[1].isEdit" : [ "1" ],\r\n  "columns[1].isList" : [ "1" ],\r\n  "columns[1].isQuery" : [ "1" ],\r\n  "columns[1].queryType" : [ "EQ" ],\r\n  "columns[1].htmlType" : [ "input" ],\r\n  "columns[1].dictType" : [ "" ],\r\n  "columns[2].columnId" : [ "3" ],\r\n  "columns[2].sort" : [ "3" ],\r\n  "columns[2].columnComment" : [ "品牌ID" ],\r\n  "columns[2].javaType" : [ "Long" ],\r\n  "columns[2].javaField" : [ "brandId" ],\r\n  "columns[2].isInsert" : [ "1" ],\r\n  "columns[2].isEdit" : [ "1" ],\r\n  "columns[2].isList" : [ "1" ],\r\n  "columns[2].isQuery" : [ "1" ],\r\n  "columns[2].queryType" : [ "EQ" ],\r\n  "columns[2].htmlType" : [ "input" ],\r\n  "columns[2].dictType" : [ "" ],\r\n  "columns[3].columnId" : [ "4" ],\r\n  "columns[3].sort" : [ "4" ],\r\n  "columns[3].columnComment" : [ "商品分类名称" ],\r\n  "columns[3].javaType" : [ "String" ],\r\n  "columns[3].javaField" : [ "cateTitle" ],\r\n  "columns[3].isInsert" : [ "1" ],\r\n  "columns[3].isEdit" : [ "1" ],\r\n  "columns[3].isList" : [ "1" ],\r\n  "columns[3].isQuery" : [ "1" ],\r\n  "columns[3].queryType" : [ "EQ" ],\r\n  "columns[3].htmlType" : [ "input" ],\r\n  "columns[3].dictType" : [ "" ],\r\n  "columns[4].columnId" : [ "5" ],\r\n  "columns[4].sort" : [ "5" ],\r\n  "columns[4].columnComment" : [ "商品分类" ],\r\n  "column', 0, NULL, '2019-08-22 10:05:28', NULL),
	(5, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.genCode()', '', 1, 'admin', '研发部门', '/tool/gen/genCode/store_goods_cate', '127.0.0.1', '内网IP', '{ }', 0, NULL, '2019-08-22 10:05:35', NULL),
	(6, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', '', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\r\n  "parentId" : [ "0" ],\r\n  "menuType" : [ "M" ],\r\n  "menuName" : [ "商城管理" ],\r\n  "url" : [ "" ],\r\n  "target" : [ "menuItem" ],\r\n  "perms" : [ "" ],\r\n  "orderNum" : [ "4" ],\r\n  "icon" : [ "fa fa-shopping-cart" ],\r\n  "visible" : [ "0" ]\r\n}', 0, NULL, '2019-08-22 10:14:45', NULL),
	(7, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', '', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\r\n  "tableId" : [ "1" ],\r\n  "tableName" : [ "store_goods_cate" ],\r\n  "tableComment" : [ "商城商品分类" ],\r\n  "className" : [ "StoreGoodsCate" ],\r\n  "functionAuthor" : [ "hupeng" ],\r\n  "remark" : [ "" ],\r\n  "columns[0].columnId" : [ "1" ],\r\n  "columns[0].sort" : [ "1" ],\r\n  "columns[0].columnComment" : [ "null" ],\r\n  "columns[0].javaType" : [ "Long" ],\r\n  "columns[0].javaField" : [ "id" ],\r\n  "columns[0].isInsert" : [ "1" ],\r\n  "columns[0].queryType" : [ "EQ" ],\r\n  "columns[0].htmlType" : [ "input" ],\r\n  "columns[0].dictType" : [ "" ],\r\n  "columns[1].columnId" : [ "2" ],\r\n  "columns[1].sort" : [ "2" ],\r\n  "columns[1].columnComment" : [ "上级分类编号" ],\r\n  "columns[1].javaType" : [ "Long" ],\r\n  "columns[1].javaField" : [ "pid" ],\r\n  "columns[1].isInsert" : [ "1" ],\r\n  "columns[1].isEdit" : [ "1" ],\r\n  "columns[1].isList" : [ "1" ],\r\n  "columns[1].isQuery" : [ "1" ],\r\n  "columns[1].queryType" : [ "EQ" ],\r\n  "columns[1].htmlType" : [ "input" ],\r\n  "columns[1].dictType" : [ "" ],\r\n  "columns[2].columnId" : [ "3" ],\r\n  "columns[2].sort" : [ "3" ],\r\n  "columns[2].columnComment" : [ "品牌ID" ],\r\n  "columns[2].javaType" : [ "Long" ],\r\n  "columns[2].javaField" : [ "brandId" ],\r\n  "columns[2].isInsert" : [ "1" ],\r\n  "columns[2].isEdit" : [ "1" ],\r\n  "columns[2].isList" : [ "1" ],\r\n  "columns[2].isQuery" : [ "1" ],\r\n  "columns[2].queryType" : [ "EQ" ],\r\n  "columns[2].htmlType" : [ "input" ],\r\n  "columns[2].dictType" : [ "" ],\r\n  "columns[3].columnId" : [ "4" ],\r\n  "columns[3].sort" : [ "4" ],\r\n  "columns[3].columnComment" : [ "商品分类名称" ],\r\n  "columns[3].javaType" : [ "String" ],\r\n  "columns[3].javaField" : [ "cateTitle" ],\r\n  "columns[3].isInsert" : [ "1" ],\r\n  "columns[3].isEdit" : [ "1" ],\r\n  "columns[3].isList" : [ "1" ],\r\n  "columns[3].isQuery" : [ "1" ],\r\n  "columns[3].queryType" : [ "EQ" ],\r\n  "columns[3].htmlType" : [ "input" ],\r\n  "columns[3].dictType" : [ "" ],\r\n  "columns[4].columnId" : [ "5" ],\r\n  "columns[4].sort" : [ "5" ],\r\n  "columns[4].columnComment" : [ "商品分类" ],\r\n  "column', 0, NULL, '2019-08-22 10:17:16', NULL),
	(8, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', '', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\r\n  "tableId" : [ "1" ],\r\n  "tableName" : [ "store_goods_cate" ],\r\n  "tableComment" : [ "商城商品分类" ],\r\n  "className" : [ "StoreGoodsCate" ],\r\n  "functionAuthor" : [ "hupeng" ],\r\n  "remark" : [ "" ],\r\n  "columns[0].columnId" : [ "1" ],\r\n  "columns[0].sort" : [ "1" ],\r\n  "columns[0].columnComment" : [ "null" ],\r\n  "columns[0].javaType" : [ "Long" ],\r\n  "columns[0].javaField" : [ "id" ],\r\n  "columns[0].isInsert" : [ "1" ],\r\n  "columns[0].queryType" : [ "EQ" ],\r\n  "columns[0].htmlType" : [ "input" ],\r\n  "columns[0].dictType" : [ "" ],\r\n  "columns[1].columnId" : [ "2" ],\r\n  "columns[1].sort" : [ "2" ],\r\n  "columns[1].columnComment" : [ "上级分类编号" ],\r\n  "columns[1].javaType" : [ "Long" ],\r\n  "columns[1].javaField" : [ "pid" ],\r\n  "columns[1].isInsert" : [ "1" ],\r\n  "columns[1].isEdit" : [ "1" ],\r\n  "columns[1].isList" : [ "1" ],\r\n  "columns[1].isQuery" : [ "1" ],\r\n  "columns[1].queryType" : [ "EQ" ],\r\n  "columns[1].htmlType" : [ "input" ],\r\n  "columns[1].dictType" : [ "" ],\r\n  "columns[2].columnId" : [ "3" ],\r\n  "columns[2].sort" : [ "3" ],\r\n  "columns[2].columnComment" : [ "品牌ID" ],\r\n  "columns[2].javaType" : [ "Long" ],\r\n  "columns[2].javaField" : [ "brandId" ],\r\n  "columns[2].isInsert" : [ "1" ],\r\n  "columns[2].isEdit" : [ "1" ],\r\n  "columns[2].isList" : [ "1" ],\r\n  "columns[2].isQuery" : [ "1" ],\r\n  "columns[2].queryType" : [ "EQ" ],\r\n  "columns[2].htmlType" : [ "input" ],\r\n  "columns[2].dictType" : [ "" ],\r\n  "columns[3].columnId" : [ "4" ],\r\n  "columns[3].sort" : [ "4" ],\r\n  "columns[3].columnComment" : [ "商品分类名称" ],\r\n  "columns[3].javaType" : [ "String" ],\r\n  "columns[3].javaField" : [ "cateTitle" ],\r\n  "columns[3].isInsert" : [ "1" ],\r\n  "columns[3].isEdit" : [ "1" ],\r\n  "columns[3].isList" : [ "1" ],\r\n  "columns[3].isQuery" : [ "1" ],\r\n  "columns[3].queryType" : [ "EQ" ],\r\n  "columns[3].htmlType" : [ "input" ],\r\n  "columns[3].dictType" : [ "" ],\r\n  "columns[4].columnId" : [ "5" ],\r\n  "columns[4].sort" : [ "5" ],\r\n  "columns[4].columnComment" : [ "商品分类" ],\r\n  "column', 0, NULL, '2019-08-22 10:19:09', NULL),
	(9, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.genCode()', '', 1, 'admin', '研发部门', '/tool/gen/genCode/store_goods_cate', '127.0.0.1', '内网IP', '{ }', 0, NULL, '2019-08-22 10:20:33', NULL),
	(10, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', '', 1, 'admin', NULL, '/tool/gen/edit', '127.0.0.1', '内网IP', '{\r\n  "tableId" : [ "1" ],\r\n  "tableName" : [ "store_goods_cate" ],\r\n  "tableComment" : [ "商城商品分类" ],\r\n  "className" : [ "StoreGoodsCate" ],\r\n  "functionAuthor" : [ "hupeng" ],\r\n  "remark" : [ "" ],\r\n  "columns[0].columnId" : [ "1" ],\r\n  "columns[0].sort" : [ "1" ],\r\n  "columns[0].columnComment" : [ "null" ],\r\n  "columns[0].javaType" : [ "Long" ],\r\n  "columns[0].javaField" : [ "id" ],\r\n  "columns[0].isInsert" : [ "1" ],\r\n  "columns[0].queryType" : [ "EQ" ],\r\n  "columns[0].htmlType" : [ "input" ],\r\n  "columns[0].dictType" : [ "" ],\r\n  "columns[1].columnId" : [ "2" ],\r\n  "columns[1].sort" : [ "2" ],\r\n  "columns[1].columnComment" : [ "上级分类编号" ],\r\n  "columns[1].javaType" : [ "Long" ],\r\n  "columns[1].javaField" : [ "pid" ],\r\n  "columns[1].isInsert" : [ "1" ],\r\n  "columns[1].isEdit" : [ "1" ],\r\n  "columns[1].isList" : [ "1" ],\r\n  "columns[1].isQuery" : [ "1" ],\r\n  "columns[1].queryType" : [ "EQ" ],\r\n  "columns[1].htmlType" : [ "input" ],\r\n  "columns[1].dictType" : [ "" ],\r\n  "columns[2].columnId" : [ "3" ],\r\n  "columns[2].sort" : [ "3" ],\r\n  "columns[2].columnComment" : [ "品牌ID" ],\r\n  "columns[2].javaType" : [ "Long" ],\r\n  "columns[2].javaField" : [ "brandId" ],\r\n  "columns[2].isInsert" : [ "1" ],\r\n  "columns[2].isEdit" : [ "1" ],\r\n  "columns[2].isList" : [ "1" ],\r\n  "columns[2].isQuery" : [ "1" ],\r\n  "columns[2].queryType" : [ "EQ" ],\r\n  "columns[2].htmlType" : [ "input" ],\r\n  "columns[2].dictType" : [ "" ],\r\n  "columns[3].columnId" : [ "4" ],\r\n  "columns[3].sort" : [ "4" ],\r\n  "columns[3].columnComment" : [ "商品分类名称" ],\r\n  "columns[3].javaType" : [ "String" ],\r\n  "columns[3].javaField" : [ "cateTitle" ],\r\n  "columns[3].isInsert" : [ "1" ],\r\n  "columns[3].isEdit" : [ "1" ],\r\n  "columns[3].isList" : [ "1" ],\r\n  "columns[3].isQuery" : [ "1" ],\r\n  "columns[3].queryType" : [ "EQ" ],\r\n  "columns[3].htmlType" : [ "input" ],\r\n  "columns[3].dictType" : [ "" ],\r\n  "columns[4].columnId" : [ "5" ],\r\n  "columns[4].sort" : [ "5" ],\r\n  "columns[4].columnComment" : [ "商品分类" ],\r\n  "column', 0, NULL, '2019-08-22 10:55:55', NULL),
	(11, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', '', 1, 'admin', NULL, '/tool/gen/edit', '127.0.0.1', '内网IP', '{\r\n  "tableId" : [ "1" ],\r\n  "tableName" : [ "store_goods_cate" ],\r\n  "tableComment" : [ "商城商品分类" ],\r\n  "className" : [ "StoreGoodsCate" ],\r\n  "functionAuthor" : [ "hupeng" ],\r\n  "remark" : [ "" ],\r\n  "columns[0].columnId" : [ "1" ],\r\n  "columns[0].sort" : [ "1" ],\r\n  "columns[0].columnComment" : [ "null" ],\r\n  "columns[0].javaType" : [ "Long" ],\r\n  "columns[0].javaField" : [ "id" ],\r\n  "columns[0].isInsert" : [ "1" ],\r\n  "columns[0].queryType" : [ "EQ" ],\r\n  "columns[0].htmlType" : [ "input" ],\r\n  "columns[0].dictType" : [ "" ],\r\n  "columns[1].columnId" : [ "2" ],\r\n  "columns[1].sort" : [ "2" ],\r\n  "columns[1].columnComment" : [ "上级分类编号" ],\r\n  "columns[1].javaType" : [ "Long" ],\r\n  "columns[1].javaField" : [ "pid" ],\r\n  "columns[1].isInsert" : [ "1" ],\r\n  "columns[1].isEdit" : [ "1" ],\r\n  "columns[1].isList" : [ "1" ],\r\n  "columns[1].isQuery" : [ "1" ],\r\n  "columns[1].queryType" : [ "EQ" ],\r\n  "columns[1].htmlType" : [ "input" ],\r\n  "columns[1].dictType" : [ "" ],\r\n  "columns[2].columnId" : [ "3" ],\r\n  "columns[2].sort" : [ "3" ],\r\n  "columns[2].columnComment" : [ "品牌ID" ],\r\n  "columns[2].javaType" : [ "Long" ],\r\n  "columns[2].javaField" : [ "brandId" ],\r\n  "columns[2].queryType" : [ "EQ" ],\r\n  "columns[2].htmlType" : [ "input" ],\r\n  "columns[2].dictType" : [ "" ],\r\n  "columns[3].columnId" : [ "4" ],\r\n  "columns[3].sort" : [ "4" ],\r\n  "columns[3].columnComment" : [ "商品分类名称" ],\r\n  "columns[3].javaType" : [ "String" ],\r\n  "columns[3].javaField" : [ "cateTitle" ],\r\n  "columns[3].isInsert" : [ "1" ],\r\n  "columns[3].isEdit" : [ "1" ],\r\n  "columns[3].isList" : [ "1" ],\r\n  "columns[3].isQuery" : [ "1" ],\r\n  "columns[3].queryType" : [ "EQ" ],\r\n  "columns[3].htmlType" : [ "input" ],\r\n  "columns[3].dictType" : [ "" ],\r\n  "columns[4].columnId" : [ "5" ],\r\n  "columns[4].sort" : [ "5" ],\r\n  "columns[4].columnComment" : [ "商品描述" ],\r\n  "columns[4].javaType" : [ "String" ],\r\n  "columns[4].javaField" : [ "cateDesc" ],\r\n  "columns[4].isInsert" : [ "1" ],\r\n  "columns[4].isEdit" : [ "', 0, NULL, '2019-08-22 11:03:23', NULL),
	(12, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', '', 1, 'admin', NULL, '/tool/gen/edit', '127.0.0.1', '内网IP', '{\r\n  "tableId" : [ "1" ],\r\n  "tableName" : [ "store_goods_cate" ],\r\n  "tableComment" : [ "商城商品分类" ],\r\n  "className" : [ "StoreGoodsCate" ],\r\n  "functionAuthor" : [ "hupeng" ],\r\n  "remark" : [ "" ],\r\n  "columns[0].columnId" : [ "1" ],\r\n  "columns[0].sort" : [ "1" ],\r\n  "columns[0].columnComment" : [ "null" ],\r\n  "columns[0].javaType" : [ "Long" ],\r\n  "columns[0].javaField" : [ "id" ],\r\n  "columns[0].isInsert" : [ "1" ],\r\n  "columns[0].queryType" : [ "EQ" ],\r\n  "columns[0].htmlType" : [ "input" ],\r\n  "columns[0].dictType" : [ "" ],\r\n  "columns[1].columnId" : [ "2" ],\r\n  "columns[1].sort" : [ "2" ],\r\n  "columns[1].columnComment" : [ "上级分类编号" ],\r\n  "columns[1].javaType" : [ "Long" ],\r\n  "columns[1].javaField" : [ "pid" ],\r\n  "columns[1].isInsert" : [ "1" ],\r\n  "columns[1].isEdit" : [ "1" ],\r\n  "columns[1].isList" : [ "1" ],\r\n  "columns[1].isQuery" : [ "1" ],\r\n  "columns[1].queryType" : [ "EQ" ],\r\n  "columns[1].htmlType" : [ "input" ],\r\n  "columns[1].dictType" : [ "" ],\r\n  "columns[2].columnId" : [ "3" ],\r\n  "columns[2].sort" : [ "3" ],\r\n  "columns[2].columnComment" : [ "品牌ID" ],\r\n  "columns[2].javaType" : [ "Long" ],\r\n  "columns[2].javaField" : [ "brandId" ],\r\n  "columns[2].queryType" : [ "EQ" ],\r\n  "columns[2].htmlType" : [ "input" ],\r\n  "columns[2].dictType" : [ "" ],\r\n  "columns[3].columnId" : [ "4" ],\r\n  "columns[3].sort" : [ "4" ],\r\n  "columns[3].columnComment" : [ "商品分类名称" ],\r\n  "columns[3].javaType" : [ "String" ],\r\n  "columns[3].javaField" : [ "cateTitle" ],\r\n  "columns[3].isInsert" : [ "1" ],\r\n  "columns[3].isEdit" : [ "1" ],\r\n  "columns[3].isList" : [ "1" ],\r\n  "columns[3].isQuery" : [ "1" ],\r\n  "columns[3].queryType" : [ "EQ" ],\r\n  "columns[3].htmlType" : [ "input" ],\r\n  "columns[3].dictType" : [ "" ],\r\n  "columns[4].columnId" : [ "5" ],\r\n  "columns[4].sort" : [ "5" ],\r\n  "columns[4].columnComment" : [ "商品描述" ],\r\n  "columns[4].javaType" : [ "String" ],\r\n  "columns[4].javaField" : [ "cateDesc" ],\r\n  "columns[4].isInsert" : [ "1" ],\r\n  "columns[4].isEdit" : [ "', 0, NULL, '2019-08-22 11:04:52', NULL),
	(13, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.genCode()', '', 1, 'admin', NULL, '/tool/gen/genCode/store_goods_cate', '127.0.0.1', '内网IP', '{ }', 0, NULL, '2019-08-22 11:05:41', NULL),
	(14, '商城商品分类', 1, 'com.ruoyi.web.controller.shop.StoreGoodsCateController.addSave()', '', 1, 'admin', '研发部门', '/shop/cate/add', '127.0.0.1', '内网IP', '{\r\n  "pid" : [ "1" ],\r\n  "cateTitle" : [ "背心" ],\r\n  "cateDesc" : [ "44" ],\r\n  "imgUrl" : [ "http://127.0.0.1:8080/profile/upload/2019/08/23/2e593ef4098a5c1758c11e2539f5962b.png" ],\r\n  "sort" : [ "" ]\r\n}', 0, NULL, '2019-08-23 17:44:50', NULL),
	(15, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', '', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\r\n  "tables" : [ "store_goods_brand" ]\r\n}', 0, NULL, '2019-08-23 18:21:25', NULL),
	(16, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', '', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\r\n  "tableId" : [ "2" ],\r\n  "tableName" : [ "store_goods_brand" ],\r\n  "tableComment" : [ "产品品牌" ],\r\n  "className" : [ "StoreGoodsBrand" ],\r\n  "functionAuthor" : [ "hupeng" ],\r\n  "remark" : [ "" ],\r\n  "columns[0].columnId" : [ "11" ],\r\n  "columns[0].sort" : [ "1" ],\r\n  "columns[0].columnComment" : [ "null" ],\r\n  "columns[0].javaType" : [ "Long" ],\r\n  "columns[0].javaField" : [ "id" ],\r\n  "columns[0].isInsert" : [ "1" ],\r\n  "columns[0].queryType" : [ "EQ" ],\r\n  "columns[0].htmlType" : [ "input" ],\r\n  "columns[0].dictType" : [ "" ],\r\n  "columns[1].columnId" : [ "12" ],\r\n  "columns[1].sort" : [ "2" ],\r\n  "columns[1].columnComment" : [ "品牌logo" ],\r\n  "columns[1].javaType" : [ "String" ],\r\n  "columns[1].javaField" : [ "brandLogo" ],\r\n  "columns[1].isInsert" : [ "1" ],\r\n  "columns[1].isEdit" : [ "1" ],\r\n  "columns[1].queryType" : [ "EQ" ],\r\n  "columns[1].htmlType" : [ "textarea" ],\r\n  "columns[1].dictType" : [ "" ],\r\n  "columns[2].columnId" : [ "13" ],\r\n  "columns[2].sort" : [ "3" ],\r\n  "columns[2].columnComment" : [ "品牌封面" ],\r\n  "columns[2].javaType" : [ "String" ],\r\n  "columns[2].javaField" : [ "brandCover" ],\r\n  "columns[2].queryType" : [ "EQ" ],\r\n  "columns[2].htmlType" : [ "textarea" ],\r\n  "columns[2].dictType" : [ "" ],\r\n  "columns[3].columnId" : [ "14" ],\r\n  "columns[3].sort" : [ "4" ],\r\n  "columns[3].columnComment" : [ "商品品牌名称" ],\r\n  "columns[3].javaType" : [ "String" ],\r\n  "columns[3].javaField" : [ "brandTitle" ],\r\n  "columns[3].isInsert" : [ "1" ],\r\n  "columns[3].isEdit" : [ "1" ],\r\n  "columns[3].isList" : [ "1" ],\r\n  "columns[3].isQuery" : [ "1" ],\r\n  "columns[3].queryType" : [ "EQ" ],\r\n  "columns[3].htmlType" : [ "input" ],\r\n  "columns[3].dictType" : [ "" ],\r\n  "columns[4].columnId" : [ "15" ],\r\n  "columns[4].sort" : [ "5" ],\r\n  "columns[4].columnComment" : [ "商品品牌描述" ],\r\n  "columns[4].javaType" : [ "String" ],\r\n  "columns[4].javaField" : [ "brandDesc" ],\r\n  "columns[4].isInsert" : [ "1" ],\r\n  "columns[4].isEdit" : [ "1" ],\r\n  "columns[4].queryType" : [ "EQ" ', 0, NULL, '2019-08-23 18:24:11', NULL),
	(17, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.genCode()', '', 1, 'admin', '研发部门', '/tool/gen/genCode/store_goods_brand', '127.0.0.1', '内网IP', '{ }', 0, NULL, '2019-08-23 18:24:56', NULL),
	(18, '产品品牌', 1, 'com.ruoyi.web.controller.shop.StoreGoodsBrandController.addSave()', '', 1, 'admin', '研发部门', '/shop/brand/add', '127.0.0.1', '内网IP', '{\r\n  "brandLogo" : [ "http://127.0.0.1:8080/profile/upload/2019/08/23/079702428f13f5c9b5acb1c5cec16b9d.jpeg" ],\r\n  "brandTitle" : [ "logo" ],\r\n  "brandDesc" : [ "" ]\r\n}', 0, NULL, '2019-08-23 18:37:20', NULL),
	(19, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', '', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\r\n  "tables" : [ "store_goods_type" ]\r\n}', 0, NULL, '2019-08-24 14:16:00', NULL),
	(20, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', '', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\r\n  "tableId" : [ "3" ],\r\n  "tableName" : [ "store_goods_type" ],\r\n  "tableComment" : [ "商品类型(商品模型)表" ],\r\n  "className" : [ "StoreGoodsType" ],\r\n  "functionAuthor" : [ "hupeng" ],\r\n  "remark" : [ "" ],\r\n  "columns[0].columnId" : [ "21" ],\r\n  "columns[0].sort" : [ "1" ],\r\n  "columns[0].columnComment" : [ "id自增" ],\r\n  "columns[0].javaType" : [ "Integer" ],\r\n  "columns[0].javaField" : [ "id" ],\r\n  "columns[0].isInsert" : [ "1" ],\r\n  "columns[0].queryType" : [ "EQ" ],\r\n  "columns[0].htmlType" : [ "input" ],\r\n  "columns[0].dictType" : [ "" ],\r\n  "columns[1].columnId" : [ "22" ],\r\n  "columns[1].sort" : [ "2" ],\r\n  "columns[1].columnComment" : [ "类型名称" ],\r\n  "columns[1].javaType" : [ "String" ],\r\n  "columns[1].javaField" : [ "name" ],\r\n  "columns[1].isInsert" : [ "1" ],\r\n  "columns[1].isEdit" : [ "1" ],\r\n  "columns[1].isList" : [ "1" ],\r\n  "columns[1].isQuery" : [ "1" ],\r\n  "columns[1].queryType" : [ "LIKE" ],\r\n  "columns[1].isRequired" : [ "1" ],\r\n  "columns[1].htmlType" : [ "input" ],\r\n  "columns[1].dictType" : [ "" ],\r\n  "tplCategory" : [ "crud" ],\r\n  "packageName" : [ "com.ruoyi.shop" ],\r\n  "moduleName" : [ "shop" ],\r\n  "businessName" : [ "type" ],\r\n  "functionName" : [ "商品类型(商品模型)" ],\r\n  "params[treeCode]" : [ "" ],\r\n  "params[treeParentCode]" : [ "" ],\r\n  "params[treeName]" : [ "" ]\r\n}', 0, NULL, '2019-08-24 14:16:23', NULL),
	(21, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.genCode()', '', 1, 'admin', '研发部门', '/tool/gen/genCode/store_goods_type', '127.0.0.1', '内网IP', '{ }', 0, NULL, '2019-08-24 14:16:29', NULL),
	(22, '商品类型(商品模型)', 1, 'com.ruoyi.web.controller.shop.StoreGoodsTypeController.addSave()', '', 1, 'admin', '研发部门', '/shop/type/add', '127.0.0.1', '内网IP', '{\r\n  "name" : [ "手机" ]\r\n}', 0, NULL, '2019-08-24 14:39:12', NULL),
	(23, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', '', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\r\n  "tables" : [ "store_goods_attribute" ]\r\n}', 0, NULL, '2019-08-24 14:44:41', NULL),
	(24, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', '', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\r\n  "tableId" : [ "4" ],\r\n  "tableName" : [ "store_goods_attribute" ],\r\n  "tableComment" : [ "商品的属性表(独立)" ],\r\n  "className" : [ "StoreGoodsAttribute" ],\r\n  "functionAuthor" : [ "hupeng" ],\r\n  "remark" : [ "" ],\r\n  "columns[0].columnId" : [ "23" ],\r\n  "columns[0].sort" : [ "1" ],\r\n  "columns[0].columnComment" : [ "属性id" ],\r\n  "columns[0].javaType" : [ "Long" ],\r\n  "columns[0].javaField" : [ "attrId" ],\r\n  "columns[0].isInsert" : [ "1" ],\r\n  "columns[0].queryType" : [ "EQ" ],\r\n  "columns[0].htmlType" : [ "input" ],\r\n  "columns[0].dictType" : [ "" ],\r\n  "columns[1].columnId" : [ "24" ],\r\n  "columns[1].sort" : [ "2" ],\r\n  "columns[1].columnComment" : [ "属性名称" ],\r\n  "columns[1].javaType" : [ "String" ],\r\n  "columns[1].javaField" : [ "attrName" ],\r\n  "columns[1].isInsert" : [ "1" ],\r\n  "columns[1].isEdit" : [ "1" ],\r\n  "columns[1].isList" : [ "1" ],\r\n  "columns[1].isQuery" : [ "1" ],\r\n  "columns[1].queryType" : [ "LIKE" ],\r\n  "columns[1].isRequired" : [ "1" ],\r\n  "columns[1].htmlType" : [ "input" ],\r\n  "columns[1].dictType" : [ "" ],\r\n  "columns[2].columnId" : [ "25" ],\r\n  "columns[2].sort" : [ "3" ],\r\n  "columns[2].columnComment" : [ "属性分类id(商品模型id)" ],\r\n  "columns[2].javaType" : [ "Integer" ],\r\n  "columns[2].javaField" : [ "typeId" ],\r\n  "columns[2].isInsert" : [ "1" ],\r\n  "columns[2].isEdit" : [ "1" ],\r\n  "columns[2].isList" : [ "1" ],\r\n  "columns[2].queryType" : [ "EQ" ],\r\n  "columns[2].isRequired" : [ "1" ],\r\n  "columns[2].htmlType" : [ "input" ],\r\n  "columns[2].dictType" : [ "" ],\r\n  "columns[3].columnId" : [ "26" ],\r\n  "columns[3].sort" : [ "4" ],\r\n  "columns[3].columnComment" : [ "0不需要检索 1关键字检索 2范围检索" ],\r\n  "columns[3].javaType" : [ "Integer" ],\r\n  "columns[3].javaField" : [ "attrIndex" ],\r\n  "columns[3].queryType" : [ "EQ" ],\r\n  "columns[3].isRequired" : [ "1" ],\r\n  "columns[3].htmlType" : [ "input" ],\r\n  "columns[3].dictType" : [ "" ],\r\n  "columns[4].columnId" : [ "27" ],\r\n  "columns[4].sort" : [ "5" ],\r\n  "columns[4].columnComment" : [ "0唯一属性 1单选属性 2复选属性" ],\r\n', 0, NULL, '2019-08-24 14:47:04', NULL),
	(25, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.genCode()', '', 1, 'admin', '研发部门', '/tool/gen/genCode/store_goods_attribute', '127.0.0.1', '内网IP', '{ }', 0, NULL, '2019-08-24 14:48:38', NULL),
	(26, '商品的属性(独立)', 1, 'com.ruoyi.web.controller.shop.StoreGoodsAttributeController.addSave()', '', 1, 'admin', '研发部门', '/shop/attribute/add', '127.0.0.1', '内网IP', '{\r\n  "attrName" : [ "内存" ],\r\n  "typeId" : [ "40" ]\r\n}', 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'attr_values\' doesn\'t have a default value\r\n### The error may involve com.ruoyi.shop.mapper.StoreGoodsAttributeMapper.insertStoreGoodsAttribute-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into store_goods_attribute          ( attr_name,             type_id )           values ( ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'attr_values\' doesn\'t have a default value\n; Field \'attr_values\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'attr_values\' doesn\'t have a default value', '2019-08-24 16:03:59', NULL),
	(27, '商品的属性(独立)', 1, 'com.ruoyi.web.controller.shop.StoreGoodsAttributeController.addSave()', '', 1, 'admin', '研发部门', '/shop/attribute/add', '127.0.0.1', '内网IP', '{\r\n  "attrName" : [ "内存" ],\r\n  "typeId" : [ "40" ]\r\n}', 0, NULL, '2019-08-24 16:05:02', NULL),
	(28, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', '', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\r\n  "tables" : [ "store_spec_item,store_spec_goods_price,store_spec" ]\r\n}', 0, NULL, '2019-08-25 09:40:12', NULL),
	(29, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', '', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\r\n  "tableId" : [ "5" ],\r\n  "tableName" : [ "store_spec" ],\r\n  "tableComment" : [ "商品规格表(独立)" ],\r\n  "className" : [ "StoreSpec" ],\r\n  "functionAuthor" : [ "hupeng" ],\r\n  "remark" : [ "" ],\r\n  "columns[0].columnId" : [ "31" ],\r\n  "columns[0].sort" : [ "1" ],\r\n  "columns[0].columnComment" : [ "规格表" ],\r\n  "columns[0].javaType" : [ "Long" ],\r\n  "columns[0].javaField" : [ "id" ],\r\n  "columns[0].isInsert" : [ "1" ],\r\n  "columns[0].queryType" : [ "EQ" ],\r\n  "columns[0].htmlType" : [ "input" ],\r\n  "columns[0].dictType" : [ "" ],\r\n  "columns[1].columnId" : [ "32" ],\r\n  "columns[1].sort" : [ "2" ],\r\n  "columns[1].columnComment" : [ "规格类型" ],\r\n  "columns[1].javaType" : [ "Long" ],\r\n  "columns[1].javaField" : [ "typeId" ],\r\n  "columns[1].isInsert" : [ "1" ],\r\n  "columns[1].isEdit" : [ "1" ],\r\n  "columns[1].isList" : [ "1" ],\r\n  "columns[1].queryType" : [ "EQ" ],\r\n  "columns[1].htmlType" : [ "select" ],\r\n  "columns[1].dictType" : [ "" ],\r\n  "columns[2].columnId" : [ "33" ],\r\n  "columns[2].sort" : [ "3" ],\r\n  "columns[2].columnComment" : [ "规格名称" ],\r\n  "columns[2].javaType" : [ "String" ],\r\n  "columns[2].javaField" : [ "name" ],\r\n  "columns[2].isInsert" : [ "1" ],\r\n  "columns[2].isEdit" : [ "1" ],\r\n  "columns[2].isList" : [ "1" ],\r\n  "columns[2].isQuery" : [ "1" ],\r\n  "columns[2].queryType" : [ "LIKE" ],\r\n  "columns[2].htmlType" : [ "input" ],\r\n  "columns[2].dictType" : [ "" ],\r\n  "columns[3].columnId" : [ "34" ],\r\n  "columns[3].sort" : [ "4" ],\r\n  "columns[3].columnComment" : [ "排序" ],\r\n  "columns[3].javaType" : [ "Long" ],\r\n  "columns[3].javaField" : [ "sort" ],\r\n  "columns[3].queryType" : [ "EQ" ],\r\n  "columns[3].htmlType" : [ "input" ],\r\n  "columns[3].dictType" : [ "" ],\r\n  "columns[4].columnId" : [ "35" ],\r\n  "columns[4].sort" : [ "5" ],\r\n  "columns[4].columnComment" : [ "是否需要检索：1是，0否" ],\r\n  "columns[4].javaType" : [ "Integer" ],\r\n  "columns[4].javaField" : [ "searchIndex" ],\r\n  "columns[4].queryType" : [ "EQ" ],\r\n  "columns[4].htmlType" : [ "input" ],\r\n  "columns[4].dictTy', 0, NULL, '2019-08-25 09:45:36', NULL),
	(30, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.genCode()', '', 1, 'admin', '研发部门', '/tool/gen/genCode/store_spec', '127.0.0.1', '内网IP', '{ }', 0, NULL, '2019-08-25 09:45:42', NULL),
	(31, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.genCode()', '', 1, 'admin', '研发部门', '/tool/gen/genCode/store_spec_item', '127.0.0.1', '内网IP', '{ }', 0, NULL, '2019-08-25 10:07:15', NULL),
	(32, '商品规格(独立)', 1, 'com.ruoyi.web.controller.shop.StoreSpecController.addSave()', '', 1, 'admin', '研发部门', '/shop/spec/add', '127.0.0.1', '内网IP', '{\r\n  "typeId" : [ "40" ],\r\n  "name" : [ "内存" ],\r\n  "specItem" : [ "1G\\r\\n4G\\r\\n8G" ]\r\n}', 0, NULL, '2019-08-25 11:01:53', NULL),
	(33, '商品规格(独立)', 2, 'com.ruoyi.web.controller.shop.StoreSpecController.editSave()', '', 1, 'admin', '研发部门', '/shop/spec/edit', '127.0.0.1', '内网IP', '{\r\n  "id" : [ "5" ],\r\n  "typeId" : [ "40" ],\r\n  "name" : [ "内存" ],\r\n  "specItem" : [ "1G\\r\\n4G\\r\\n8G\\r\\n12G" ]\r\n}', 0, NULL, '2019-08-25 12:09:26', NULL),
	(34, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', '', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\r\n  "tables" : [ "store_goods" ]\r\n}', 0, NULL, '2019-08-25 14:00:15', NULL),
	(35, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', '', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\r\n  "tableId" : [ "8" ],\r\n  "tableName" : [ "store_goods" ],\r\n  "tableComment" : [ "商品主表" ],\r\n  "className" : [ "StoreGoods" ],\r\n  "functionAuthor" : [ "hupeng" ],\r\n  "remark" : [ "" ],\r\n  "columns[0].columnId" : [ "51" ],\r\n  "columns[0].sort" : [ "1" ],\r\n  "columns[0].columnComment" : [ "商品id" ],\r\n  "columns[0].javaType" : [ "Integer" ],\r\n  "columns[0].javaField" : [ "goodsId" ],\r\n  "columns[0].isInsert" : [ "1" ],\r\n  "columns[0].queryType" : [ "EQ" ],\r\n  "columns[0].htmlType" : [ "input" ],\r\n  "columns[0].dictType" : [ "" ],\r\n  "columns[1].columnId" : [ "52" ],\r\n  "columns[1].sort" : [ "2" ],\r\n  "columns[1].columnComment" : [ "分类id" ],\r\n  "columns[1].javaType" : [ "Long" ],\r\n  "columns[1].javaField" : [ "cateId" ],\r\n  "columns[1].isInsert" : [ "1" ],\r\n  "columns[1].isEdit" : [ "1" ],\r\n  "columns[1].isList" : [ "1" ],\r\n  "columns[1].queryType" : [ "EQ" ],\r\n  "columns[1].isRequired" : [ "1" ],\r\n  "columns[1].htmlType" : [ "select" ],\r\n  "columns[1].dictType" : [ "" ],\r\n  "columns[2].columnId" : [ "53" ],\r\n  "columns[2].sort" : [ "3" ],\r\n  "columns[2].columnComment" : [ "扩展分类id" ],\r\n  "columns[2].javaType" : [ "Long" ],\r\n  "columns[2].javaField" : [ "extendCatId" ],\r\n  "columns[2].queryType" : [ "EQ" ],\r\n  "columns[2].htmlType" : [ "input" ],\r\n  "columns[2].dictType" : [ "" ],\r\n  "columns[3].columnId" : [ "54" ],\r\n  "columns[3].sort" : [ "4" ],\r\n  "columns[3].columnComment" : [ "商品编号" ],\r\n  "columns[3].javaType" : [ "String" ],\r\n  "columns[3].javaField" : [ "goodsSn" ],\r\n  "columns[3].isInsert" : [ "1" ],\r\n  "columns[3].isEdit" : [ "1" ],\r\n  "columns[3].isList" : [ "1" ],\r\n  "columns[3].isQuery" : [ "1" ],\r\n  "columns[3].queryType" : [ "EQ" ],\r\n  "columns[3].isRequired" : [ "1" ],\r\n  "columns[3].htmlType" : [ "input" ],\r\n  "columns[3].dictType" : [ "" ],\r\n  "columns[4].columnId" : [ "55" ],\r\n  "columns[4].sort" : [ "5" ],\r\n  "columns[4].columnComment" : [ "商品名称" ],\r\n  "columns[4].javaType" : [ "String" ],\r\n  "columns[4].javaField" : [ "goodsName" ],\r\n  "columns[4].i', 0, NULL, '2019-08-25 14:14:00', NULL),
	(36, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.genCode()', '', 1, 'admin', '研发部门', '/tool/gen/genCode/store_goods', '127.0.0.1', '内网IP', '{ }', 0, NULL, '2019-08-25 14:14:06', NULL),
	(37, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', '', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\r\n  "tables" : [ "store_spec_goods_price,store_spec_item" ]\r\n}', 0, NULL, '2019-08-26 13:32:47', NULL),
	(38, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', '', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\r\n  "tables" : [ "store_goods_attr" ]\r\n}', 0, NULL, '2019-08-26 13:38:55', NULL),
	(39, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.genCode()', '', 1, 'admin', '研发部门', '/tool/gen/genCode/store_goods_attr', '127.0.0.1', '内网IP', '{ }', 0, NULL, '2019-08-26 13:39:30', NULL),
	(40, '商品主', 1, 'com.ruoyi.web.controller.shop.StoreGoodsController.addSave()', '', 1, 'admin', '研发部门', '/shop/goods/add', '127.0.0.1', '内网IP', '{\r\n  "cateId" : [ "11" ],\r\n  "brandId" : [ "1" ],\r\n  "goodsSn" : [ "#1008611" ],\r\n  "goodsName" : [ "测试商品规格" ],\r\n  "goodsLogo" : [ "" ],\r\n  "marketPrice" : [ "100" ],\r\n  "shopPrice" : [ "20" ],\r\n  "keywords" : [ "复印" ],\r\n  "goodsRemark" : [ "描述" ],\r\n  "goodsContent" : [ "" ],\r\n  "sort" : [ "1" ]\r\n}', 0, NULL, '2019-08-28 17:11:19', NULL),
	(41, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.authDataScopeSave()', '', 1, 'admin', '研发部门', '/system/role/authDataScope', '127.0.0.1', '内网IP', '{\r\n  "roleId" : [ "2" ],\r\n  "roleName" : [ "普通角色" ],\r\n  "roleKey" : [ "common" ],\r\n  "dataScope" : [ "2" ],\r\n  "deptIds" : [ "100,101,105" ]\r\n}', 0, NULL, '2019-08-28 18:28:27', NULL),
	(42, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.authDataScopeSave()', '', 1, 'admin', '研发部门', '/system/role/authDataScope', '127.0.0.1', '内网IP', '{\r\n  "roleId" : [ "2" ],\r\n  "roleName" : [ "普通角色" ],\r\n  "roleKey" : [ "common" ],\r\n  "dataScope" : [ "2" ],\r\n  "deptIds" : [ "100,101,103,104,105,102,108,109" ]\r\n}', 0, NULL, '2019-08-28 18:29:39', NULL),
	(43, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', '', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\r\n  "tables" : [ "store_coupon_list,store_coupon" ]\r\n}', 0, NULL, '2019-08-29 19:16:19', NULL),
	(44, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', '', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\r\n  "tableId" : [ "10" ],\r\n  "tableName" : [ "store_coupon" ],\r\n  "tableComment" : [ "优惠券主表" ],\r\n  "className" : [ "StoreCoupon" ],\r\n  "functionAuthor" : [ "hupeng" ],\r\n  "remark" : [ "" ],\r\n  "columns[0].columnId" : [ "101" ],\r\n  "columns[0].sort" : [ "1" ],\r\n  "columns[0].columnComment" : [ "表id" ],\r\n  "columns[0].javaType" : [ "Integer" ],\r\n  "columns[0].javaField" : [ "id" ],\r\n  "columns[0].isInsert" : [ "1" ],\r\n  "columns[0].queryType" : [ "EQ" ],\r\n  "columns[0].htmlType" : [ "input" ],\r\n  "columns[0].dictType" : [ "" ],\r\n  "columns[1].columnId" : [ "102" ],\r\n  "columns[1].sort" : [ "2" ],\r\n  "columns[1].columnComment" : [ "优惠券名字" ],\r\n  "columns[1].javaType" : [ "String" ],\r\n  "columns[1].javaField" : [ "name" ],\r\n  "columns[1].isInsert" : [ "1" ],\r\n  "columns[1].isEdit" : [ "1" ],\r\n  "columns[1].isList" : [ "1" ],\r\n  "columns[1].isQuery" : [ "1" ],\r\n  "columns[1].queryType" : [ "LIKE" ],\r\n  "columns[1].isRequired" : [ "1" ],\r\n  "columns[1].htmlType" : [ "input" ],\r\n  "columns[1].dictType" : [ "" ],\r\n  "columns[2].columnId" : [ "103" ],\r\n  "columns[2].sort" : [ "3" ],\r\n  "columns[2].columnComment" : [ "发放类型 0下单赠送1 指定发放 2 免费领取 3线下发放" ],\r\n  "columns[2].javaType" : [ "Integer" ],\r\n  "columns[2].javaField" : [ "type" ],\r\n  "columns[2].queryType" : [ "EQ" ],\r\n  "columns[2].isRequired" : [ "1" ],\r\n  "columns[2].htmlType" : [ "select" ],\r\n  "columns[2].dictType" : [ "" ],\r\n  "columns[3].columnId" : [ "104" ],\r\n  "columns[3].sort" : [ "4" ],\r\n  "columns[3].columnComment" : [ "优惠券金额" ],\r\n  "columns[3].javaType" : [ "Double" ],\r\n  "columns[3].javaField" : [ "money" ],\r\n  "columns[3].isInsert" : [ "1" ],\r\n  "columns[3].isEdit" : [ "1" ],\r\n  "columns[3].isList" : [ "1" ],\r\n  "columns[3].queryType" : [ "EQ" ],\r\n  "columns[3].isRequired" : [ "1" ],\r\n  "columns[3].htmlType" : [ "input" ],\r\n  "columns[3].dictType" : [ "" ],\r\n  "columns[4].columnId" : [ "105" ],\r\n  "columns[4].sort" : [ "5" ],\r\n  "columns[4].columnComment" : [ "使用条件，满多少金额" ],\r\n  "columns[4].javaType" : [ "Doub', 0, NULL, '2019-08-29 19:22:06', NULL),
	(45, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', '', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\r\n  "tables" : [ "store_coupon,store_coupon_list" ]\r\n}', 0, NULL, '2019-08-29 19:22:15', NULL),
	(46, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', '', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\r\n  "tables" : [ "store_order_goods_remark,store_order_goods,store_order" ]\r\n}', 0, NULL, '2019-08-29 19:45:10', NULL),
	(47, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', '', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\r\n  "tableId" : [ "12" ],\r\n  "tableName" : [ "store_order" ],\r\n  "tableComment" : [ "订单主表" ],\r\n  "className" : [ "StoreOrder" ],\r\n  "functionAuthor" : [ "hupeng" ],\r\n  "remark" : [ "" ],\r\n  "columns[0].columnId" : [ "126" ],\r\n  "columns[0].sort" : [ "1" ],\r\n  "columns[0].columnComment" : [ "订单id" ],\r\n  "columns[0].javaType" : [ "Integer" ],\r\n  "columns[0].javaField" : [ "orderId" ],\r\n  "columns[0].isInsert" : [ "1" ],\r\n  "columns[0].queryType" : [ "EQ" ],\r\n  "columns[0].htmlType" : [ "input" ],\r\n  "columns[0].dictType" : [ "" ],\r\n  "columns[1].columnId" : [ "127" ],\r\n  "columns[1].sort" : [ "2" ],\r\n  "columns[1].columnComment" : [ "订单编号" ],\r\n  "columns[1].javaType" : [ "String" ],\r\n  "columns[1].javaField" : [ "orderSn" ],\r\n  "columns[1].isList" : [ "1" ],\r\n  "columns[1].isQuery" : [ "1" ],\r\n  "columns[1].queryType" : [ "EQ" ],\r\n  "columns[1].isRequired" : [ "1" ],\r\n  "columns[1].htmlType" : [ "input" ],\r\n  "columns[1].dictType" : [ "" ],\r\n  "columns[2].columnId" : [ "128" ],\r\n  "columns[2].sort" : [ "3" ],\r\n  "columns[2].columnComment" : [ "用户id" ],\r\n  "columns[2].javaType" : [ "Integer" ],\r\n  "columns[2].javaField" : [ "userId" ],\r\n  "columns[2].isInsert" : [ "1" ],\r\n  "columns[2].isEdit" : [ "1" ],\r\n  "columns[2].isList" : [ "1" ],\r\n  "columns[2].queryType" : [ "EQ" ],\r\n  "columns[2].isRequired" : [ "1" ],\r\n  "columns[2].htmlType" : [ "input" ],\r\n  "columns[2].dictType" : [ "" ],\r\n  "columns[3].columnId" : [ "129" ],\r\n  "columns[3].sort" : [ "4" ],\r\n  "columns[3].columnComment" : [ "订单状态 0-未确认 1-已确认(已收货） 2-已评价" ],\r\n  "columns[3].javaType" : [ "Integer" ],\r\n  "columns[3].javaField" : [ "orderStatus" ],\r\n  "columns[3].isInsert" : [ "1" ],\r\n  "columns[3].isEdit" : [ "1" ],\r\n  "columns[3].isList" : [ "1" ],\r\n  "columns[3].isQuery" : [ "1" ],\r\n  "columns[3].queryType" : [ "EQ" ],\r\n  "columns[3].isRequired" : [ "1" ],\r\n  "columns[3].htmlType" : [ "radio" ],\r\n  "columns[3].dictType" : [ "" ],\r\n  "columns[4].columnId" : [ "130" ],\r\n  "columns[4].sort" : [ "5" ],\r\n  "col', 0, NULL, '2019-08-29 19:53:53', NULL),
	(48, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', '', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\r\n  "tables" : [ "store_order_goods,store_order_goods_remark,store_order" ]\r\n}', 0, NULL, '2019-08-29 19:54:10', NULL),
	(49, '优惠券主', 1, 'com.ruoyi.web.controller.shop.StoreCouponController.addSave()', '', 1, 'admin', '研发部门', '/shop/coupon/add', '127.0.0.1', '内网IP', '{\r\n  "name" : [ "五一促销1" ],\r\n  "money" : [ "10.00" ],\r\n  "condition" : [ "100.00" ],\r\n  "createnum" : [ "1000" ],\r\n  "useStartTime" : [ "2019-08-21" ],\r\n  "useEndTime" : [ "2019-09-04" ]\r\n}', 0, NULL, '2019-08-30 10:36:43', NULL),
	(50, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', '', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\r\n  "tables" : [ "store_member" ]\r\n}', 0, NULL, '2019-08-30 13:40:31', NULL),
	(51, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', '', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\r\n  "tableId" : [ "15" ],\r\n  "tableName" : [ "store_member" ],\r\n  "tableComment" : [ "商城会员信息" ],\r\n  "className" : [ "StoreMember" ],\r\n  "functionAuthor" : [ "hupeng" ],\r\n  "remark" : [ "" ],\r\n  "columns[0].columnId" : [ "202" ],\r\n  "columns[0].sort" : [ "1" ],\r\n  "columns[0].columnComment" : [ "null" ],\r\n  "columns[0].javaType" : [ "Long" ],\r\n  "columns[0].javaField" : [ "id" ],\r\n  "columns[0].isInsert" : [ "1" ],\r\n  "columns[0].queryType" : [ "EQ" ],\r\n  "columns[0].htmlType" : [ "input" ],\r\n  "columns[0].dictType" : [ "" ],\r\n  "columns[1].columnId" : [ "203" ],\r\n  "columns[1].sort" : [ "2" ],\r\n  "columns[1].columnComment" : [ "vip编号" ],\r\n  "columns[1].javaType" : [ "String" ],\r\n  "columns[1].javaField" : [ "vipNo" ],\r\n  "columns[1].queryType" : [ "EQ" ],\r\n  "columns[1].htmlType" : [ "input" ],\r\n  "columns[1].dictType" : [ "" ],\r\n  "columns[2].columnId" : [ "204" ],\r\n  "columns[2].sort" : [ "3" ],\r\n  "columns[2].columnComment" : [ "会员微信OPENID" ],\r\n  "columns[2].javaType" : [ "String" ],\r\n  "columns[2].javaField" : [ "openid" ],\r\n  "columns[2].isQuery" : [ "1" ],\r\n  "columns[2].queryType" : [ "EQ" ],\r\n  "columns[2].htmlType" : [ "input" ],\r\n  "columns[2].dictType" : [ "" ],\r\n  "columns[3].columnId" : [ "205" ],\r\n  "columns[3].sort" : [ "4" ],\r\n  "columns[3].columnComment" : [ "会员手机号" ],\r\n  "columns[3].javaType" : [ "String" ],\r\n  "columns[3].javaField" : [ "phone" ],\r\n  "columns[3].isInsert" : [ "1" ],\r\n  "columns[3].isEdit" : [ "1" ],\r\n  "columns[3].isList" : [ "1" ],\r\n  "columns[3].isQuery" : [ "1" ],\r\n  "columns[3].queryType" : [ "EQ" ],\r\n  "columns[3].htmlType" : [ "input" ],\r\n  "columns[3].dictType" : [ "" ],\r\n  "columns[4].columnId" : [ "206" ],\r\n  "columns[4].sort" : [ "5" ],\r\n  "columns[4].columnComment" : [ "登录密码" ],\r\n  "columns[4].javaType" : [ "String" ],\r\n  "columns[4].javaField" : [ "password" ],\r\n  "columns[4].queryType" : [ "EQ" ],\r\n  "columns[4].htmlType" : [ "input" ],\r\n  "columns[4].dictType" : [ "" ],\r\n  "columns[5].columnId" : [ "207" ],\r\n  "colu', 0, NULL, '2019-08-30 13:44:56', NULL),
	(52, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.genCode()', '', 1, 'admin', '研发部门', '/tool/gen/genCode/store_member', '127.0.0.1', '内网IP', '{ }', 0, NULL, '2019-08-30 13:45:19', NULL),
	(53, '订单主', 3, 'com.ruoyi.web.controller.shop.StoreOrderController.remove()', '', 1, 'admin', '研发部门', '/shop/order/remove', '127.0.0.1', '内网IP', '{\r\n  "ids" : [ "1639" ]\r\n}', 0, NULL, '2019-08-30 14:54:48', NULL),
	(54, '订单主', 2, 'com.ruoyi.web.controller.shop.StoreOrderController.editSave()', '', 1, 'admin', '研发部门', '/shop/order/edit', '127.0.0.1', '内网IP', '{\r\n  "orderId" : [ "1639" ],\r\n  "shippingCode" : [ "778845475" ],\r\n  "shippingName" : [ "顺丰1" ]\r\n}', 0, NULL, '2019-08-30 15:47:51', NULL),
	(55, '商城商品分类', 3, 'com.ruoyi.web.controller.shop.StoreGoodsCateController.remove()', '', 1, 'admin', '研发部门', '/shop/cate/remove/1', '127.0.0.1', '内网IP', '{ }', 0, NULL, '2019-09-23 15:45:39', NULL),
	(56, '商城商品分类', 3, 'com.ruoyi.web.controller.shop.StoreGoodsCateController.remove()', '', 1, 'admin', '研发部门', '/shop/cate/remove/2', '127.0.0.1', '内网IP', '{ }', 0, NULL, '2019-09-23 15:46:09', NULL),
	(57, '商城商品分类', 3, 'com.ruoyi.web.controller.shop.StoreGoodsCateController.remove()', '', 1, 'admin', '研发部门', '/shop/cate/remove/3', '127.0.0.1', '内网IP', '{ }', 1, '请先删除子分类', '2019-09-23 15:56:43', NULL),
	(58, '商城商品分类', 3, 'com.ruoyi.web.controller.shop.StoreGoodsCateController.remove()', '', 1, 'admin', '研发部门', '/shop/cate/remove/3', '127.0.0.1', '内网IP', '{ }', 1, '请先删除子分类', '2019-09-23 15:56:49', NULL),
	(59, '个人信息', 2, 'co.yixiang.mobile.controller.MobileController.updateProfile()', 'PUT', 1, 'admin', '研发部门', '/mobile/user/profile', '127.0.0.1', '内网IP', '{"admin":true,"createTime":1521171180000,"delFlag":"0","dept":{"deptId":103,"deptName":"研发部门","leader":"若依","orderNum":"1","params":{},"parentId":101,"status":"0"},"email":"ry@163.com1","loginDate":1677078810000,"loginIp":"127.0.0.1","loginName":"admin","params":{},"phonenumber":"15888888888","remark":"管理员","roles":[],"salt":"111111","sex":"0","status":"0","updateBy":"admin","userId":1,"userName":"供货商城","userType":"00"}', 0, NULL, '2023-02-22 23:24:25', '{\r\n  "msg" : "操作成功",\r\n  "code" : 0\r\n}'),
	(60, '个人信息', 2, 'co.yixiang.mobile.controller.MobileController.updateProfile()', 'PUT', 1, 'admin', '研发部门', '/mobile/user/profile', '127.0.0.1', '内网IP', '{"admin":true,"createTime":1521171180000,"delFlag":"0","dept":{"deptId":103,"deptName":"研发部门","leader":"若依","orderNum":"1","params":{},"parentId":101,"status":"0"},"email":"ry@163.com","loginDate":1677078810000,"loginIp":"127.0.0.1","loginName":"admin","params":{},"phonenumber":"15888888888","remark":"管理员","roles":[],"salt":"111111","sex":"1","status":"0","updateBy":"admin","userId":1,"userName":"供货商城","userType":"00"}', 0, NULL, '2023-02-22 23:25:01', '{\r\n  "msg" : "操作成功",\r\n  "code" : 0\r\n}'),
	(61, '个人信息', 2, 'co.yixiang.mobile.controller.MobileController.updateProfile()', 'PUT', 1, 'admin', '研发部门', '/mobile/user/profile', '127.0.0.1', '内网IP', '{"admin":true,"createTime":1521171180000,"delFlag":"0","dept":{"deptId":103,"deptName":"研发部门","leader":"若依","orderNum":"1","params":{},"parentId":101,"status":"0"},"email":"ry@163.com1","loginDate":1677078810000,"loginIp":"127.0.0.1","loginName":"admin","params":{},"phonenumber":"15888888888","remark":"管理员","roles":[],"salt":"111111","sex":"0","status":"0","updateBy":"admin","userId":1,"userName":"供货商城","userType":"00"}', 0, NULL, '2023-02-22 23:26:56', '{\r\n  "msg" : "操作成功",\r\n  "code" : 0\r\n}'),
	(62, '用户管理', 2, 'co.yixiang.web.controller.system.SysUserController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/user/edit', '127.0.0.1', '内网IP', '{"userId":["1"],"deptId":["103"],"userName":["供货商城"],"dept.deptName":["研发部门"],"phonenumber":["15888888888"],"email":["ry@163.com1"],"loginName":["admin"],"sex":["0"],"role":["1"],"remark":["管理员"],"status":["0"],"roleIds":["1"],"postIds":["1"]}', 1, '不允许操作超级管理员用户', '2023-02-22 23:28:33', NULL),
	(63, '用户管理', 2, 'co.yixiang.web.controller.system.SysUserController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/user/edit', '127.0.0.1', '内网IP', '{"userId":["1"],"deptId":["103"],"userName":["供货商城"],"dept.deptName":["研发部门"],"phonenumber":["15888888888"],"email":["ry@163.com1"],"loginName":["admin"],"sex":["0"],"remark":["管理员"],"status":["0"],"roleIds":[""],"postIds":["1"]}', 1, '不允许操作超级管理员用户', '2023-02-22 23:28:41', NULL),
	(64, '用户管理', 2, 'co.yixiang.web.controller.system.SysUserController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/user/edit', '127.0.0.1', '内网IP', '{"userId":["2"],"deptId":["105"],"userName":["若依"],"dept.deptName":["测试部门"],"phonenumber":["15666666666"],"email":["ry@qq.com"],"loginName":["ry"],"sex":["1"],"role":["2"],"remark":["测试员"],"status":["0"],"roleIds":["2"],"postIds":["2"]}', 0, NULL, '2023-02-22 23:28:53', '{\r\n  "msg" : "操作成功",\r\n  "code" : 0\r\n}'),
	(65, '个人信息', 2, 'co.yixiang.mobile.controller.MobileController.updateProfile()', 'PUT', 1, 'admin', '研发部门', '/mobile/user/profile', '127.0.0.1', '内网IP', '{"admin":true,"createTime":1521171180000,"delFlag":"0","dept":{"deptId":103,"deptName":"研发部门","leader":"若依","orderNum":"1","params":{},"parentId":101,"status":"0"},"email":"ry@163.com","loginDate":1677079804000,"loginIp":"127.0.0.1","loginName":"admin","params":{},"phonenumber":"15888888888","remark":"管理员","roles":[],"salt":"111111","sex":"1","status":"0","updateBy":"admin","userId":1,"userName":"供货商城","userType":"00"}', 0, NULL, '2023-02-22 23:30:10', '{\r\n  "msg" : "操作成功",\r\n  "code" : 0\r\n}'),
	(66, '个人信息', 2, 'co.yixiang.mobile.controller.MobileController.updateProfile()', 'PUT', 1, 'admin', '研发部门', '/mobile/user/profile', '127.0.0.1', '内网IP', '{"admin":true,"createTime":1521171180000,"delFlag":"0","dept":{"deptId":103,"deptName":"研发部门","leader":"若依","orderNum":"1","params":{},"parentId":101,"status":"0"},"email":"ry@163.com","loginDate":1677080014000,"loginIp":"127.0.0.1","loginName":"admin","params":{},"phonenumber":"15888888888","remark":"管理员","roles":[],"salt":"111111","sex":"0","status":"0","updateBy":"admin","userId":1,"userName":"供货商城","userType":"00"}', 0, NULL, '2023-02-22 23:33:48', '{\r\n  "msg" : "操作成功",\r\n  "code" : 0\r\n}'),
	(67, '个人信息', 2, 'co.yixiang.mobile.controller.MobileController.updateProfile()', 'PUT', 1, 'admin', '研发部门', '/mobile/user/profile', '127.0.0.1', '内网IP', '{"admin":true,"createTime":1521171180000,"delFlag":"0","dept":{"deptId":103,"deptName":"研发部门","leader":"若依","orderNum":"1","params":{},"parentId":101,"status":"0"},"email":"ry@163.com","loginDate":1677080423000,"loginIp":"127.0.0.1","loginName":"admin","params":{},"phonenumber":"15888888888","remark":"管理员","roles":[],"salt":"111111","sex":"1","status":"0","updateBy":"admin","userId":1,"userName":"供货商城","userType":"00"}', 0, NULL, '2023-02-22 23:40:31', '{\r\n  "msg" : "操作成功",\r\n  "code" : 0\r\n}'),
	(68, '个人信息', 2, 'co.yixiang.mobile.controller.MobileController.updateProfile()', 'PUT', 1, 'admin', '研发部门', '/mobile/user/profile', '127.0.0.1', '内网IP', '{"admin":true,"createTime":1521171180000,"delFlag":"0","dept":{"deptId":103,"deptName":"研发部门","leader":"若依","orderNum":"1","params":{},"parentId":101,"status":"0"},"email":"ry@163.com","loginDate":1677080423000,"loginIp":"127.0.0.1","loginName":"admin","params":{},"phonenumber":"15888888888","remark":"管理员","roles":[],"salt":"111111","sex":"1","status":"0","updateBy":"admin","userId":1,"userName":"供货商城","userType":"00"}', 0, NULL, '2023-02-22 23:40:45', '{\r\n  "msg" : "操作成功",\r\n  "code" : 0\r\n}'),
	(69, '个人信息', 2, 'co.yixiang.mobile.controller.MobileController.updateProfile()', 'PUT', 1, 'admin', '研发部门', '/mobile/user/profile', '127.0.0.1', '内网IP', '{"admin":true,"createTime":1521171180000,"delFlag":"0","dept":{"deptId":103,"deptName":"研发部门","leader":"若依","orderNum":"1","params":{},"parentId":101,"status":"0"},"email":"ry@163.com","loginDate":1677080423000,"loginIp":"127.0.0.1","loginName":"admin","params":{},"phonenumber":"15888888888","remark":"管理员","roles":[],"salt":"111111","sex":"1","status":"0","updateBy":"admin","userId":1,"userName":"供货商城","userType":"00"}', 0, NULL, '2023-02-22 23:41:24', '{\r\n  "msg" : "操作成功",\r\n  "code" : 0\r\n}'),
	(70, '个人信息', 2, 'co.yixiang.mobile.controller.MobileController.updateProfile()', 'PUT', 1, 'admin', '研发部门', '/mobile/user/profile', '127.0.0.1', '内网IP', '{"admin":true,"createTime":1521171180000,"delFlag":"0","dept":{"deptId":103,"deptName":"研发部门","leader":"若依","orderNum":"1","params":{},"parentId":101,"status":"0"},"email":"ry@163.com1","loginDate":1677080497000,"loginIp":"127.0.0.1","loginName":"admin","params":{},"phonenumber":"15888888888","remark":"管理员","roles":[],"salt":"111111","sex":"0","status":"0","updateBy":"admin","userId":1,"userName":"供货商城","userType":"00"}', 0, NULL, '2023-02-22 23:43:37', '{\r\n  "msg" : "操作成功",\r\n  "code" : 0\r\n}'),
	(71, '个人信息', 2, 'co.yixiang.mobile.controller.MobileController.updateProfile()', 'PUT', 1, 'admin', '研发部门', '/mobile/user/profile', '127.0.0.1', '内网IP', '{"admin":true,"createTime":1521171180000,"delFlag":"0","dept":{"deptId":103,"deptName":"研发部门","leader":"若依","orderNum":"1","params":{},"parentId":101,"status":"0"},"email":"ry@163.com","loginDate":1677081011000,"loginIp":"127.0.0.1","loginName":"admin","params":{},"phonenumber":"15888888888","remark":"管理员","roles":[],"salt":"111111","sex":"1","status":"0","updateBy":"admin","userId":1,"userName":"供货商城","userType":"00"}', 0, NULL, '2023-02-22 23:50:16', '{\r\n  "msg" : "操作成功",\r\n  "code" : 0\r\n}'),
	(72, '个人信息', 2, 'co.yixiang.mobile.controller.MobileController.updateProfile()', 'PUT', 1, 'admin', '研发部门', '/mobile/user/profile', '127.0.0.1', '内网IP', '{"admin":true,"createTime":1521171180000,"delFlag":"0","dept":{"deptId":103,"deptName":"研发部门","leader":"若依","orderNum":"1","params":{},"parentId":101,"status":"0"},"email":"ry@163.com1","loginDate":1677081011000,"loginIp":"127.0.0.1","loginName":"admin","params":{},"phonenumber":"15888888888","remark":"管理员","roles":[],"salt":"111111","sex":"1","status":"0","updateBy":"admin","userId":1,"userName":"供货商城","userType":"00"}', 0, NULL, '2023-02-22 23:50:26', '{\r\n  "msg" : "操作成功",\r\n  "code" : 0\r\n}'),
	(73, '个人信息', 2, 'co.yixiang.mobile.controller.MobileController.updateProfile()', 'PUT', 1, 'admin', '研发部门', '/mobile/user/profile', '127.0.0.1', '内网IP', '{"admin":true,"createTime":1521171180000,"delFlag":"0","dept":{"deptId":103,"deptName":"研发部门","leader":"若依","orderNum":"1","params":{},"parentId":101,"status":"0"},"email":"ry@163.com","loginDate":1677081011000,"loginIp":"127.0.0.1","loginName":"admin","params":{},"phonenumber":"15888888888","remark":"管理员","roles":[],"salt":"111111","sex":"1","status":"0","updateBy":"admin","userId":1,"userName":"供货商城","userType":"00"}', 0, NULL, '2023-02-22 23:50:32', '{\r\n  "msg" : "操作成功",\r\n  "code" : 0\r\n}');

-- 导出  表 supply_shop.sys_post 结构
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE IF NOT EXISTS `sys_post` (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='岗位信息表';

-- 正在导出表  supply_shop.sys_post 的数据：~4 rows (大约)
DELETE FROM `sys_post`;
INSERT INTO `sys_post` (`post_id`, `post_code`, `post_name`, `post_sort`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
	(1, 'ceo', '董事长', 1, '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(2, 'se', '项目经理', 2, '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(3, 'hr', '人力资源', 3, '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(4, 'user', '普通员工', 4, '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');

-- 导出  表 supply_shop.sys_role 结构
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE IF NOT EXISTS `sys_role` (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='角色信息表';

-- 正在导出表  supply_shop.sys_role 的数据：~2 rows (大约)
DELETE FROM `sys_role`;
INSERT INTO `sys_role` (`role_id`, `role_name`, `role_key`, `role_sort`, `data_scope`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
	(1, '管理员', 'admin', 1, '1', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '管理员'),
	(2, '普通角色', 'common', 2, '2', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2019-08-28 18:29:38', '普通角色');

-- 导出  表 supply_shop.sys_role_dept 结构
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE IF NOT EXISTS `sys_role_dept` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='角色和部门关联表';

-- 正在导出表  supply_shop.sys_role_dept 的数据：~8 rows (大约)
DELETE FROM `sys_role_dept`;
INSERT INTO `sys_role_dept` (`role_id`, `dept_id`) VALUES
	(2, 100),
	(2, 101),
	(2, 102),
	(2, 103),
	(2, 104),
	(2, 105),
	(2, 108),
	(2, 109);

-- 导出  表 supply_shop.sys_role_menu 结构
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE IF NOT EXISTS `sys_role_menu` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='角色和菜单关联表';

-- 正在导出表  supply_shop.sys_role_menu 的数据：~82 rows (大约)
DELETE FROM `sys_role_menu`;
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES
	(2, 1),
	(2, 2),
	(2, 3),
	(2, 100),
	(2, 101),
	(2, 102),
	(2, 103),
	(2, 104),
	(2, 105),
	(2, 106),
	(2, 107),
	(2, 108),
	(2, 109),
	(2, 110),
	(2, 111),
	(2, 112),
	(2, 113),
	(2, 114),
	(2, 115),
	(2, 500),
	(2, 501),
	(2, 1000),
	(2, 1001),
	(2, 1002),
	(2, 1003),
	(2, 1004),
	(2, 1005),
	(2, 1006),
	(2, 1007),
	(2, 1008),
	(2, 1009),
	(2, 1010),
	(2, 1011),
	(2, 1012),
	(2, 1013),
	(2, 1014),
	(2, 1015),
	(2, 1016),
	(2, 1017),
	(2, 1018),
	(2, 1019),
	(2, 1020),
	(2, 1021),
	(2, 1022),
	(2, 1023),
	(2, 1024),
	(2, 1025),
	(2, 1026),
	(2, 1027),
	(2, 1028),
	(2, 1029),
	(2, 1030),
	(2, 1031),
	(2, 1032),
	(2, 1033),
	(2, 1034),
	(2, 1035),
	(2, 1036),
	(2, 1037),
	(2, 1038),
	(2, 1039),
	(2, 1040),
	(2, 1041),
	(2, 1042),
	(2, 1043),
	(2, 1044),
	(2, 1045),
	(2, 1046),
	(2, 1047),
	(2, 1048),
	(2, 1049),
	(2, 1050),
	(2, 1051),
	(2, 1052),
	(2, 1053),
	(2, 1054),
	(2, 1055),
	(2, 1056),
	(2, 1057),
	(2, 1058),
	(2, 1059),
	(2, 1060);

-- 导出  表 supply_shop.sys_user 结构
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE IF NOT EXISTS `sys_user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  `login_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '登录账号',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '头像路径',
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '密码',
  `salt` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '盐加密',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '最后登陆IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `pwd_update_date` datetime DEFAULT NULL,
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='用户信息表';

-- 正在导出表  supply_shop.sys_user 的数据：~2 rows (大约)
DELETE FROM `sys_user`;
INSERT INTO `sys_user` (`user_id`, `dept_id`, `login_name`, `user_name`, `user_type`, `email`, `phonenumber`, `sex`, `avatar`, `password`, `salt`, `status`, `del_flag`, `login_ip`, `login_date`, `pwd_update_date`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
	(1, 103, 'admin', '供货商城', '00', 'ry@163.com', '15888888888', '1', '', '29c67a30398638269fe600f73a054934', '111111', '0', '0', '127.0.0.1', '2023-02-22 23:50:11', NULL, 'admin', '2018-03-16 11:33:00', 'admin', '2023-02-22 23:50:32', '管理员'),
	(2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '8e6d98b90472783cc73c17047ddccf36', '222222', '0', '0', '127.0.0.1', '2018-03-16 11:33:00', NULL, 'admin', '2018-03-16 11:33:00', 'admin', '2023-02-22 23:28:53', '测试员');

-- 导出  表 supply_shop.sys_user_online 结构
DROP TABLE IF EXISTS `sys_user_online`;
CREATE TABLE IF NOT EXISTS `sys_user_online` (
  `sessionId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户会话id',
  `login_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '登录账号',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '部门名称',
  `ipaddr` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '操作系统',
  `status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '在线状态on_line在线off_line离线',
  `start_timestamp` datetime DEFAULT NULL COMMENT 'session创建时间',
  `last_access_time` datetime DEFAULT NULL COMMENT 'session最后访问时间',
  `expire_time` int DEFAULT '0' COMMENT '超时时间，单位为分钟',
  PRIMARY KEY (`sessionId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='在线用户记录';

-- 正在导出表  supply_shop.sys_user_online 的数据：~1 rows (大约)
DELETE FROM `sys_user_online`;
INSERT INTO `sys_user_online` (`sessionId`, `login_name`, `dept_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `start_timestamp`, `last_access_time`, `expire_time`) VALUES
	('bbe78b7f-38ca-4bb8-af26-f11f8a00cec6', 'admin', '研发部门', '127.0.0.1', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', 'on_line', '2023-02-22 23:50:11', '2023-02-22 23:50:13', 1800000);

-- 导出  表 supply_shop.sys_user_post 结构
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE IF NOT EXISTS `sys_user_post` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='用户与岗位关联表';

-- 正在导出表  supply_shop.sys_user_post 的数据：~0 rows (大约)
DELETE FROM `sys_user_post`;
INSERT INTO `sys_user_post` (`user_id`, `post_id`) VALUES
	(2, 2);

-- 导出  表 supply_shop.sys_user_role 结构
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE IF NOT EXISTS `sys_user_role` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='用户和角色关联表';

-- 正在导出表  supply_shop.sys_user_role 的数据：~0 rows (大约)
DELETE FROM `sys_user_role`;
INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES
	(2, 2);

-- 导出  表 supply_shop.wechat_fans 结构
DROP TABLE IF EXISTS `wechat_fans`;
CREATE TABLE IF NOT EXISTS `wechat_fans` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `appid` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '公众号Appid',
  `unionid` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT 'unionid',
  `openid` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '用户的标识,对当前公众号唯一',
  `spread_openid` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '推荐人OPENID',
  `spread_at` datetime DEFAULT NULL COMMENT '推荐时间',
  `tagid_list` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '标签id',
  `is_black` tinyint unsigned DEFAULT '0' COMMENT '是否为黑名单用户',
  `subscribe` tinyint unsigned DEFAULT '0' COMMENT '用户是否关注该公众号(0:未关注, 1:已关注)',
  `nickname` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '用户的昵称',
  `sex` tinyint unsigned DEFAULT NULL COMMENT '用户的性别,值为1时是男性,值为2时是女性,值为0时是未知',
  `country` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '用户所在国家',
  `province` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '用户所在省份',
  `city` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '用户所在城市',
  `language` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '用户的语言,简体中文为zh_CN',
  `headimgurl` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '用户头像',
  `subscribe_time` bigint unsigned DEFAULT '0' COMMENT '用户关注时间',
  `subscribe_at` datetime DEFAULT NULL COMMENT '关注时间',
  `remark` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '备注',
  `expires_in` bigint unsigned DEFAULT '0' COMMENT '有效时间',
  `refresh_token` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '刷新token',
  `access_token` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '访问token',
  `subscribe_scene` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '扫码关注场景',
  `qr_scene` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '二维码场景值',
  `qr_scene_str` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '二维码场景内容',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_wechat_fans_spread_openid` (`spread_openid`) USING BTREE,
  KEY `index_wechat_fans_openid` (`openid`) USING BTREE,
  KEY `index_wechat_fans_unionid` (`unionid`) USING BTREE,
  KEY `index_wechat_fans_is_back` (`is_black`) USING BTREE,
  KEY `index_wechat_fans_subscribe` (`subscribe`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='微信粉丝';

-- 正在导出表  supply_shop.wechat_fans 的数据：~0 rows (大约)
DELETE FROM `wechat_fans`;

-- 导出  表 supply_shop.wechat_fans_tags 结构
DROP TABLE IF EXISTS `wechat_fans_tags`;
CREATE TABLE IF NOT EXISTS `wechat_fans_tags` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '标签ID',
  `appid` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '公众号APPID',
  `name` varchar(35) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '标签名称',
  `count` int unsigned DEFAULT NULL COMMENT '总数',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  KEY `index_wechat_fans_tags_id` (`id`) USING BTREE,
  KEY `index_wechat_fans_tags_appid` (`appid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='微信会员标签';

-- 正在导出表  supply_shop.wechat_fans_tags 的数据：~0 rows (大约)
DELETE FROM `wechat_fans_tags`;

-- 导出  表 supply_shop.wechat_keys 结构
DROP TABLE IF EXISTS `wechat_keys`;
CREATE TABLE IF NOT EXISTS `wechat_keys` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `appid` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '公众号APPID',
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '类型，text 文件消息，image 图片消息，news 图文消息',
  `keys` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '关键字',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '文本内容',
  `image_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '图片链接',
  `voice_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '语音链接',
  `music_title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '音乐标题',
  `music_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '音乐链接',
  `music_image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '音乐缩略图链接',
  `music_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '音乐描述',
  `video_title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '视频标题',
  `video_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '视频URL',
  `video_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '视频描述',
  `news_id` bigint unsigned DEFAULT NULL COMMENT '图文ID',
  `sort` bigint unsigned DEFAULT '0' COMMENT '排序字段',
  `status` tinyint unsigned DEFAULT '1' COMMENT '0 禁用，1 启用',
  `create_by` bigint unsigned DEFAULT NULL COMMENT '创建人',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_wechat_keys_appid` (`appid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='微信关键字';

-- 正在导出表  supply_shop.wechat_keys 的数据：~0 rows (大约)
DELETE FROM `wechat_keys`;

-- 导出  表 supply_shop.wechat_menu 结构
DROP TABLE IF EXISTS `wechat_menu`;
CREATE TABLE IF NOT EXISTS `wechat_menu` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `index` bigint DEFAULT NULL,
  `pindex` bigint unsigned NOT NULL DEFAULT '0' COMMENT '父id',
  `type` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '菜单类型 null主菜单 link链接 keys关键字',
  `name` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '菜单名称',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文字内容',
  `sort` bigint unsigned DEFAULT '0' COMMENT '排序',
  `status` tinyint unsigned DEFAULT '1' COMMENT '状态(0禁用1启用)',
  `create_by` bigint unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_wechat_menu_pindex` (`pindex`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='微信菜单配置';

-- 正在导出表  supply_shop.wechat_menu 的数据：~0 rows (大约)
DELETE FROM `wechat_menu`;

-- 导出  表 supply_shop.wechat_news 结构
DROP TABLE IF EXISTS `wechat_news`;
CREATE TABLE IF NOT EXISTS `wechat_news` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `media_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '永久素材MediaID',
  `local_url` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '永久素材显示URL',
  `article_id` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '关联图文ID，用，号做分割',
  `is_deleted` tinyint unsigned DEFAULT '0' COMMENT '是否删除',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_wechat_news_artcle_id` (`article_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='微信图文表';

-- 正在导出表  supply_shop.wechat_news 的数据：~3 rows (大约)
DELETE FROM `wechat_news`;
INSERT INTO `wechat_news` (`id`, `media_id`, `local_url`, `article_id`, `is_deleted`, `create_at`, `create_by`) VALUES
	(1, '', '', '1', 0, '2018-07-15 13:36:33', 10000),
	(2, '', '', '2', 0, '2018-09-19 02:04:02', 10000),
	(3, '', '', '4', 1, '2018-09-20 08:29:47', 10000);

-- 导出  表 supply_shop.wechat_news_article 结构
DROP TABLE IF EXISTS `wechat_news_article`;
CREATE TABLE IF NOT EXISTS `wechat_news_article` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '素材标题',
  `local_url` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '永久素材显示URL',
  `show_cover_pic` tinyint unsigned DEFAULT '0' COMMENT '是否显示封面 0不显示，1 显示',
  `author` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '作者',
  `digest` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '摘要内容',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '图文内容',
  `content_source_url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '图文消息原文地址',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='微信素材表';

-- 正在导出表  supply_shop.wechat_news_article 的数据：~2 rows (大约)
DELETE FROM `wechat_news_article`;
INSERT INTO `wechat_news_article` (`id`, `title`, `local_url`, `show_cover_pic`, `author`, `digest`, `content`, `content_source_url`, `create_at`, `create_by`) VALUES
	(1, '夏至将来凉席哦', 'https://admin.mijia321.com/static/upload/bcfec6027befdc6f/56297a17c45b6fef.png', 0, 'hupeng', '规格摘要规格摘要规格摘要规格摘要规格摘要规格摘要规格摘要规格摘要', '<p><img border="0" src="https://admin.mijia321.com/static/upload/81cc8fd6910a96cd/732053d3fd6861a9.jpg" title="image" /><img border="0" src="https://admin.mijia321.com/static/upload/70d0d9e9a1283aa7/14df0de195ef7888.jpg" title="image" /><img border="0" src="https://admin.mijia321.com/static/upload/4dff377f971f3d71/0137663c4d74beba.jpg" title="image" /></p>', '', '2018-09-28 06:28:23', 10000),
	(2, '这里是标题', 'https://admin.mijia321.com/static/upload/593fab60868bfd61/3e6219d4ad6fe91a.jpg', 1, '作者', '我是摘要', '<p><img border="0" src="https://admin.mijia321.com/static/upload/70d0d9e9a1283aa7/14df0de195ef7888.jpg" title="image" /><img border="0" src="https://admin.mijia321.com/static/upload/4dff377f971f3d71/0137663c4d74beba.jpg" title="image" /></p>', '', '2018-09-28 08:40:49', 10000);

-- 导出  表 supply_shop.wechat_news_image 结构
DROP TABLE IF EXISTS `wechat_news_image`;
CREATE TABLE IF NOT EXISTS `wechat_news_image` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '文件md5',
  `local_url` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '本地文件链接',
  `media_url` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '远程图片链接',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_wechat_news_image_md5` (`md5`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='微信服务器图片';

-- 正在导出表  supply_shop.wechat_news_image 的数据：~0 rows (大约)
DELETE FROM `wechat_news_image`;

-- 导出  表 supply_shop.wechat_news_media 结构
DROP TABLE IF EXISTS `wechat_news_media`;
CREATE TABLE IF NOT EXISTS `wechat_news_media` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `appid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '公众号ID',
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '文件md5',
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '媒体类型',
  `media_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '永久素材MediaID',
  `local_url` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '本地文件链接',
  `media_url` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '远程图片链接',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='微信素材表';

-- 正在导出表  supply_shop.wechat_news_media 的数据：~0 rows (大约)
DELETE FROM `wechat_news_media`;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
