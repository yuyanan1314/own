/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50640
Source Host           : localhost:3306
Source Database       : yyn

Target Server Type    : MYSQL
Target Server Version : 50640
File Encoding         : 65001

Date: 2018-09-19 00:20:08
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `id` varchar(36) CHARACTER SET utf8mb4 NOT NULL COMMENT 'id',
  `k` varchar(100) DEFAULT NULL COMMENT '键',
  `v` varchar(1000) DEFAULT NULL COMMENT '值',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `kv_type` int(11) DEFAULT NULL COMMENT '类型编码',
  `create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) NOT NULL DEFAULT '2' COMMENT '是否删除 1是 2否',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '版本号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统配置表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('10', 'mediumint', 'Integer', '代码生成器配置', '4400', null, null, '2', '1');
INSERT INTO `sys_config` VALUES ('11', 'int', 'Integer', '代码生成器配置', '4400', null, null, '2', '1');
INSERT INTO `sys_config` VALUES ('12', 'integer', 'Integer', '代码生成器配置', '4400', null, null, '2', '1');
INSERT INTO `sys_config` VALUES ('13', 'bigint', 'Long', '代码生成器配置', '4400', null, null, '2', '1');
INSERT INTO `sys_config` VALUES ('14', 'float', 'Float', '代码生成器配置', '4400', null, null, '2', '1');
INSERT INTO `sys_config` VALUES ('15', 'double', 'Double', '代码生成器配置', '4400', null, null, '2', '1');
INSERT INTO `sys_config` VALUES ('16', 'decimal', 'BigDecimal', '代码生成器配置', '4400', null, null, '2', '1');
INSERT INTO `sys_config` VALUES ('17', 'bit', 'Boolean', '代码生成器配置', '4400', null, null, '2', '1');
INSERT INTO `sys_config` VALUES ('18', 'char', 'String', '代码生成器配置', '4400', null, null, '2', '1');
INSERT INTO `sys_config` VALUES ('19', 'varchar', 'String', '代码生成器配置', '4400', null, null, '2', '1');
INSERT INTO `sys_config` VALUES ('2', 'oss_qiniu', '{\"AccessKey\" : \"8-HMj9EgGNIP-xuOCpSzTn-OMyGOFtR3TxLdn4Uu\",\"SecretKey\" : \"SjpGg3V6PsMdJgn42PeEd5Ik-6aNyuwdqV5CPM6A\",\"bucket\" : \"ifast\",\"AccessUrl\" : \"http://p6r7ke2jc.bkt.clouddn.com/\"}', '七牛对象存储配置', '4300', null, null, '2', '1');
INSERT INTO `sys_config` VALUES ('20', 'tinytext', 'String', '代码生成器配置', '4400', null, null, '2', '1');
INSERT INTO `sys_config` VALUES ('21', 'text', 'String', '代码生成器配置', '4400', null, null, '2', '1');
INSERT INTO `sys_config` VALUES ('22', 'mediumtext', 'String', '代码生成器配置', '4400', null, null, '2', '1');
INSERT INTO `sys_config` VALUES ('23', 'longtext', 'String', '代码生成器配置', '4400', null, null, '2', '1');
INSERT INTO `sys_config` VALUES ('24', 'date', 'Date', '代码生成器配置', '4400', null, null, '2', '1');
INSERT INTO `sys_config` VALUES ('25', 'datetime', 'Date', '代码生成器配置', '4400', null, null, '2', '1');
INSERT INTO `sys_config` VALUES ('26', 'timestamp', 'Date', '代码生成器配置', '4400', null, null, '2', '1');
INSERT INTO `sys_config` VALUES ('3', 'author', 'yuyanan', '代码生成器配置', '4401', null, null, '2', '1');
INSERT INTO `sys_config` VALUES ('4', 'email', '575873200@qq.com', '代码生成器配置', '4401', null, null, '2', '1');
INSERT INTO `sys_config` VALUES ('5', 'package', 'com.yyn', '代码生成器配置', '4401', null, null, '2', '1');
INSERT INTO `sys_config` VALUES ('6', 'autoRemovePre', 'true', '代码生成器配置', '4401', null, null, '2', '1');
INSERT INTO `sys_config` VALUES ('7', 'tablePrefix', 'app', '代码生成器配置', '4401', null, null, '2', '1');
INSERT INTO `sys_config` VALUES ('8', 'tinyint', 'Integer', '代码生成器配置', '4400', null, null, '2', '1');
INSERT INTO `sys_config` VALUES ('9', 'smallint', 'Integer', '代码生成器配置', '4400', null, null, '2', '1');

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `id` varchar(36) CHARACTER SET utf8mb4 NOT NULL COMMENT '编号',
  `name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '标签名',
  `value` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '数据值',
  `type` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '类型',
  `description` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '描述',
  `sort` int(10) DEFAULT '100' COMMENT '排序（升序）',
  `parent_id` varchar(36) COLLATE utf8_bin DEFAULT '0' COMMENT '父级编号',
  `create_user_id` int(64) DEFAULT NULL COMMENT '创建者',
  `update_user_id` bigint(64) DEFAULT NULL COMMENT '更新者',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) NOT NULL DEFAULT '2' COMMENT '是否删除 1是 2否',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '版本号',
  PRIMARY KEY (`id`),
  KEY `sys_dict_value` (`value`),
  KEY `sys_dict_label` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='字典表';

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES ('1', '正常', '0', 'del_flag', '删除标记', '10', '0', '1', '1', null, null, null, '2', '1');
INSERT INTO `sys_dict` VALUES ('10', '黄色', 'yellow', 'color', '颜色值', '40', '0', '1', '1', null, null, null, '2', '1');
INSERT INTO `sys_dict` VALUES ('100', 'Date', 'java.util.Date', 'gen_java_type', 'Java类型', '50', '0', '1', '1', null, null, null, '2', '1');
INSERT INTO `sys_dict` VALUES ('104', 'Custom', 'Custom', 'gen_java_type', 'Java类型', '90', '0', '1', '1', null, null, null, '2', '1');
INSERT INTO `sys_dict` VALUES ('105', '会议通告', '1', 'oa_notify_type', '通知通告类型', '10', '0', '1', '1', null, null, null, '2', '1');
INSERT INTO `sys_dict` VALUES ('106', '奖惩通告', '2', 'oa_notify_type', '通知通告类型', '20', '0', '1', '1', null, null, null, '2', '1');
INSERT INTO `sys_dict` VALUES ('107', '活动通告', '3', 'oa_notify_type', '通知通告类型', '30', '0', '1', '1', null, null, null, '2', '1');
INSERT INTO `sys_dict` VALUES ('108', '草稿', '0', 'oa_notify_status', '通知通告状态', '10', '0', '1', '1', null, null, null, '2', '1');
INSERT INTO `sys_dict` VALUES ('109', '发布', '1', 'oa_notify_status', '通知通告状态', '20', '0', '1', '1', null, null, null, '2', '1');
INSERT INTO `sys_dict` VALUES ('11', '橙色', 'orange', 'color', '颜色值', '50', '0', '1', '1', null, null, null, '2', '1');
INSERT INTO `sys_dict` VALUES ('110', '未读', '0', 'oa_notify_read', '通知通告状态', '10', '0', '1', '1', null, null, null, '2', '1');
INSERT INTO `sys_dict` VALUES ('111', '已读', '1', 'oa_notify_read', '通知通告状态', '20', '0', '1', '1', null, null, null, '2', '1');
INSERT INTO `sys_dict` VALUES ('112', '草稿', '0', 'oa_notify_status', '通知通告状态', '10', '0', '1', '1', '', null, null, '2', '1');
INSERT INTO `sys_dict` VALUES ('113', '删除', '0', 'del_flag', '删除标记', null, null, null, null, '', null, null, '2', '1');
INSERT INTO `sys_dict` VALUES ('118', '关于', 'about', 'blog_type', '博客类型', null, null, null, null, '全url是:/blog/open/page/about', null, null, '2', '1');
INSERT INTO `sys_dict` VALUES ('119', '交流', 'communication', 'blog_type', '博客类型', null, null, null, null, '', null, null, '2', '1');
INSERT INTO `sys_dict` VALUES ('12', '默认主题', 'default', 'theme', '主题方案', '10', '0', '1', '1', null, null, null, '2', '1');
INSERT INTO `sys_dict` VALUES ('120', '文章', 'article', 'blog_type', '博客类型', null, null, null, null, '', null, null, '2', '1');
INSERT INTO `sys_dict` VALUES ('13', '天蓝主题', 'cerulean', 'theme', '主题方案', '20', '0', '1', '1', null, null, null, '2', '1');
INSERT INTO `sys_dict` VALUES ('14', '橙色主题', 'readable', 'theme', '主题方案', '30', '0', '1', '1', null, null, null, '2', '1');
INSERT INTO `sys_dict` VALUES ('15', '红色主题', 'united', 'theme', '主题方案', '40', '0', '1', '1', null, null, null, '2', '1');
INSERT INTO `sys_dict` VALUES ('16', 'Flat主题', 'flat', 'theme', '主题方案', '60', '0', '1', '1', null, null, null, '2', '1');
INSERT INTO `sys_dict` VALUES ('17', '国家', '1', 'sys_area_type', '区域类型', '10', '0', '1', '1', null, null, null, '2', '1');
INSERT INTO `sys_dict` VALUES ('18', '省份、直辖市', '2', 'sys_area_type', '区域类型', '20', '0', '1', '1', null, null, null, '2', '1');
INSERT INTO `sys_dict` VALUES ('19', '地市', '3', 'sys_area_type', '区域类型', '30', '0', '1', '1', null, null, null, '2', '1');
INSERT INTO `sys_dict` VALUES ('20', '区县', '4', 'sys_area_type', '区域类型', '40', '0', '1', '1', null, null, null, '2', '1');
INSERT INTO `sys_dict` VALUES ('21', '公司', '1', 'sys_office_type', '机构类型', '60', '0', '1', '1', null, null, null, '2', '1');
INSERT INTO `sys_dict` VALUES ('22', '部门', '2', 'sys_office_type', '机构类型', '70', '0', '1', '1', null, null, null, '2', '1');
INSERT INTO `sys_dict` VALUES ('23', '小组', '3', 'sys_office_type', '机构类型', '80', '0', '1', '1', null, null, null, '2', '1');
INSERT INTO `sys_dict` VALUES ('24', '其它', '4', 'sys_office_type', '机构类型', '90', '0', '1', '1', null, null, null, '2', '1');
INSERT INTO `sys_dict` VALUES ('25', '综合部', '1', 'sys_office_common', '快捷通用部门', '30', '0', '1', '1', null, null, null, '2', '1');
INSERT INTO `sys_dict` VALUES ('26', '开发部', '2', 'sys_office_common', '快捷通用部门', '40', '0', '1', '1', null, null, null, '2', '1');
INSERT INTO `sys_dict` VALUES ('27', '人力部', '3', 'sys_office_common', '快捷通用部门', '50', '0', '1', '1', null, null, null, '2', '1');
INSERT INTO `sys_dict` VALUES ('28', '一级', '1', 'sys_office_grade', '机构等级', '10', '0', '1', '1', null, null, null, '2', '1');
INSERT INTO `sys_dict` VALUES ('29', '二级', '2', 'sys_office_grade', '机构等级', '20', '0', '1', '1', null, null, null, '2', '1');
INSERT INTO `sys_dict` VALUES ('3', '显示', '1', 'show_hide', '显示/隐藏', '10', '0', '1', '1', null, null, null, '2', '1');
INSERT INTO `sys_dict` VALUES ('30', '三级', '3', 'sys_office_grade', '机构等级', '30', '0', '1', '1', null, null, null, '2', '1');
INSERT INTO `sys_dict` VALUES ('31', '四级', '4', 'sys_office_grade', '机构等级', '40', '0', '1', '1', null, null, null, '2', '1');
INSERT INTO `sys_dict` VALUES ('32', '所有数据', '1', 'sys_data_scope', '数据范围', '10', '0', '1', '1', null, null, null, '2', '1');
INSERT INTO `sys_dict` VALUES ('33', '所在公司及以下数据', '2', 'sys_data_scope', '数据范围', '20', '0', '1', '1', null, null, null, '2', '1');
INSERT INTO `sys_dict` VALUES ('34', '所在公司数据', '3', 'sys_data_scope', '数据范围', '30', '0', '1', '1', null, null, null, '2', '1');
INSERT INTO `sys_dict` VALUES ('35', '所在部门及以下数据', '4', 'sys_data_scope', '数据范围', '40', '0', '1', '1', null, null, null, '2', '1');
INSERT INTO `sys_dict` VALUES ('36', '所在部门数据', '5', 'sys_data_scope', '数据范围', '50', '0', '1', '1', null, null, null, '2', '1');
INSERT INTO `sys_dict` VALUES ('37', '仅本人数据', '8', 'sys_data_scope', '数据范围', '90', '0', '1', '1', null, null, null, '2', '1');
INSERT INTO `sys_dict` VALUES ('38', '按明细设置', '9', 'sys_data_scope', '数据范围', '100', '0', '1', '1', null, null, null, '2', '1');
INSERT INTO `sys_dict` VALUES ('39', '系统管理', '1', 'sys_user_type', '用户类型', '10', '0', '1', '1', null, null, null, '2', '1');
INSERT INTO `sys_dict` VALUES ('4', '隐藏', '0', 'show_hide', '显示/隐藏', '20', '0', '1', '1', null, null, null, '2', '1');
INSERT INTO `sys_dict` VALUES ('40', '部门经理', '2', 'sys_user_type', '用户类型', '20', '0', '1', '1', null, null, null, '2', '1');
INSERT INTO `sys_dict` VALUES ('41', '普通用户', '3', 'sys_user_type', '用户类型', '30', '0', '1', '1', null, null, null, '2', '1');
INSERT INTO `sys_dict` VALUES ('42', '基础主题', 'basic', 'cms_theme', '站点主题', '10', '0', '1', '1', null, null, null, '2', '1');
INSERT INTO `sys_dict` VALUES ('43', '蓝色主题', 'blue', 'cms_theme', '站点主题', '20', '0', '1', '1', null, null, null, '2', '1');
INSERT INTO `sys_dict` VALUES ('44', '红色主题', 'red', 'cms_theme', '站点主题', '30', '0', '1', '1', null, null, null, '2', '1');
INSERT INTO `sys_dict` VALUES ('45', '文章模型', 'article', 'cms_module', '栏目模型', '10', '0', '1', '1', null, null, null, '2', '1');
INSERT INTO `sys_dict` VALUES ('46', '图片模型', 'picture', 'cms_module', '栏目模型', '20', '0', '1', '1', null, null, null, '2', '1');
INSERT INTO `sys_dict` VALUES ('47', '下载模型', 'download', 'cms_module', '栏目模型', '30', '0', '1', '1', null, null, null, '2', '1');
INSERT INTO `sys_dict` VALUES ('48', '链接模型', 'link', 'cms_module', '栏目模型', '40', '0', '1', '1', null, null, null, '2', '1');
INSERT INTO `sys_dict` VALUES ('49', '专题模型', 'special', 'cms_module', '栏目模型', '50', '0', '1', '1', null, null, null, '2', '1');
INSERT INTO `sys_dict` VALUES ('5', '是', '1', 'yes_no', '是/否', '10', '0', '1', '1', null, null, null, '2', '1');
INSERT INTO `sys_dict` VALUES ('50', '默认展现方式', '0', 'cms_show_modes', '展现方式', '10', '0', '1', '1', null, null, null, '2', '1');
INSERT INTO `sys_dict` VALUES ('51', '首栏目内容列表', '1', 'cms_show_modes', '展现方式', '20', '0', '1', '1', null, null, null, '2', '1');
INSERT INTO `sys_dict` VALUES ('52', '栏目第一条内容', '2', 'cms_show_modes', '展现方式', '30', '0', '1', '1', null, null, null, '2', '1');
INSERT INTO `sys_dict` VALUES ('53', '发布', '0', 'cms_del_flag', '内容状态', '10', '0', '1', '1', null, null, null, '2', '1');
INSERT INTO `sys_dict` VALUES ('54', '删除', '1', 'cms_del_flag', '内容状态', '20', '0', '1', '1', null, null, null, '2', '1');
INSERT INTO `sys_dict` VALUES ('55', '审核', '2', 'cms_del_flag', '内容状态', '15', '0', '1', '1', null, null, null, '2', '1');
INSERT INTO `sys_dict` VALUES ('56', '首页焦点图', '1', 'cms_posid', '推荐位', '10', '0', '1', '1', null, null, null, '2', '1');
INSERT INTO `sys_dict` VALUES ('57', '栏目页文章推荐', '2', 'cms_posid', '推荐位', '20', '0', '1', '1', null, null, null, '2', '1');
INSERT INTO `sys_dict` VALUES ('58', '咨询', '1', 'cms_guestbook', '留言板分类', '10', '0', '1', '1', null, null, null, '2', '1');
INSERT INTO `sys_dict` VALUES ('59', '建议', '2', 'cms_guestbook', '留言板分类', '20', '0', '1', '1', null, null, null, '2', '1');
INSERT INTO `sys_dict` VALUES ('6', '否', '0', 'yes_no', '是/否', '20', '0', '1', '1', null, null, null, '2', '1');
INSERT INTO `sys_dict` VALUES ('60', '投诉', '3', 'cms_guestbook', '留言板分类', '30', '0', '1', '1', null, null, null, '2', '1');
INSERT INTO `sys_dict` VALUES ('61', '其它', '4', 'cms_guestbook', '留言板分类', '40', '0', '1', '1', null, null, null, '2', '1');
INSERT INTO `sys_dict` VALUES ('62', '公休', '1', 'oa_leave_type', '请假类型', '10', '0', '1', '1', null, null, null, '2', '1');
INSERT INTO `sys_dict` VALUES ('63', '病假', '2', 'oa_leave_type', '请假类型', '20', '0', '1', '1', null, null, null, '2', '1');
INSERT INTO `sys_dict` VALUES ('64', '事假', '3', 'oa_leave_type', '请假类型', '30', '0', '1', '1', null, null, null, '2', '1');
INSERT INTO `sys_dict` VALUES ('65', '调休', '4', 'oa_leave_type', '请假类型', '40', '0', '1', '1', null, null, null, '2', '1');
INSERT INTO `sys_dict` VALUES ('66', '婚假', '5', 'oa_leave_type', '请假类型', '60', '0', '1', '1', null, null, null, '2', '1');
INSERT INTO `sys_dict` VALUES ('67', '接入日志', '1', 'sys_log_type', '日志类型', '30', '0', '1', '1', null, null, null, '2', '1');
INSERT INTO `sys_dict` VALUES ('68', '异常日志', '2', 'sys_log_type', '日志类型', '40', '0', '1', '1', null, null, null, '2', '1');
INSERT INTO `sys_dict` VALUES ('69', '请假流程', 'leave', 'act_type', '流程类型', '10', '0', '1', '1', null, null, null, '2', '1');
INSERT INTO `sys_dict` VALUES ('7', '红色', 'red', 'color', '颜色值', '10', '0', '1', '1', null, null, null, '2', '1');
INSERT INTO `sys_dict` VALUES ('70', '审批测试流程', 'test_audit', 'act_type', '流程类型', '20', '0', '1', '1', null, null, null, '2', '1');
INSERT INTO `sys_dict` VALUES ('71', '分类1', '1', 'act_category', '流程分类', '10', '0', '1', '1', null, null, null, '2', '1');
INSERT INTO `sys_dict` VALUES ('72', '分类2', '2', 'act_category', '流程分类', '20', '0', '1', '1', null, null, null, '2', '1');
INSERT INTO `sys_dict` VALUES ('73', '增删改查', 'crud', 'gen_category', '代码生成分类', '10', '0', '1', '1', null, null, null, '2', '1');
INSERT INTO `sys_dict` VALUES ('74', '增删改查（包含从表）', 'crud_many', 'gen_category', '代码生成分类', '20', '0', '1', '1', null, null, null, '2', '1');
INSERT INTO `sys_dict` VALUES ('75', '树结构', 'tree', 'gen_category', '代码生成分类', '30', '0', '1', '1', null, null, null, '2', '1');
INSERT INTO `sys_dict` VALUES ('76', '=', '=', 'gen_query_type', '查询方式', '10', '0', '1', '1', null, null, null, '2', '1');
INSERT INTO `sys_dict` VALUES ('77', '!=', '!=', 'gen_query_type', '查询方式', '20', '0', '1', '1', null, null, null, '2', '1');
INSERT INTO `sys_dict` VALUES ('78', '&gt;', '&gt;', 'gen_query_type', '查询方式', '30', '0', '1', '1', null, null, null, '2', '1');
INSERT INTO `sys_dict` VALUES ('79', '&lt;', '&lt;', 'gen_query_type', '查询方式', '40', '0', '1', '1', null, null, null, '2', '1');
INSERT INTO `sys_dict` VALUES ('8', '绿色', 'green', 'color', '颜色值', '20', '0', '1', '1', null, null, null, '2', '1');
INSERT INTO `sys_dict` VALUES ('80', 'Between', 'between', 'gen_query_type', '查询方式', '50', '0', '1', '1', null, null, null, '2', '1');
INSERT INTO `sys_dict` VALUES ('81', 'Like', 'like', 'gen_query_type', '查询方式', '60', '0', '1', '1', null, null, null, '2', '1');
INSERT INTO `sys_dict` VALUES ('82', 'Left Like', 'left_like', 'gen_query_type', '查询方式', '70', '0', '1', '1', null, null, null, '2', '1');
INSERT INTO `sys_dict` VALUES ('83', 'Right Like', 'right_like', 'gen_query_type', '查询方式', '80', '0', '1', '1', null, null, null, '2', '1');
INSERT INTO `sys_dict` VALUES ('84', '文本框', 'input', 'gen_show_type', '字段生成方案', '10', '0', '1', '1', null, null, null, '2', '1');
INSERT INTO `sys_dict` VALUES ('85', '文本域', 'textarea', 'gen_show_type', '字段生成方案', '20', '0', '1', '1', null, null, null, '2', '1');
INSERT INTO `sys_dict` VALUES ('86', '下拉框', 'select', 'gen_show_type', '字段生成方案', '30', '0', '1', '1', null, null, null, '2', '1');
INSERT INTO `sys_dict` VALUES ('87', '复选框', 'checkbox', 'gen_show_type', '字段生成方案', '40', '0', '1', '1', null, null, null, '2', '1');
INSERT INTO `sys_dict` VALUES ('88', '单选框', 'radiobox', 'gen_show_type', '字段生成方案', '50', '0', '1', '1', null, null, null, '2', '1');
INSERT INTO `sys_dict` VALUES ('89', '日期选择', 'dateselect', 'gen_show_type', '字段生成方案', '60', '0', '1', '1', null, null, null, '2', '1');
INSERT INTO `sys_dict` VALUES ('9', '蓝色', 'blue', 'color', '颜色值', '30', '0', '1', '1', null, null, null, '2', '1');
INSERT INTO `sys_dict` VALUES ('90', '人员选择', 'userselect', 'gen_show_type', '字段生成方案', '70', '0', '1', '1', null, null, null, '2', '1');
INSERT INTO `sys_dict` VALUES ('91', '部门选择', 'officeselect', 'gen_show_type', '字段生成方案', '80', '0', '1', '1', null, null, null, '2', '1');
INSERT INTO `sys_dict` VALUES ('92', '区域选择', 'areaselect', 'gen_show_type', '字段生成方案', '90', '0', '1', '1', null, null, null, '2', '1');
INSERT INTO `sys_dict` VALUES ('93', 'String', 'String', 'gen_java_type', 'Java类型', '10', '0', '1', '1', null, null, null, '2', '1');
INSERT INTO `sys_dict` VALUES ('94', 'Long', 'Long', 'gen_java_type', 'Java类型', '20', '0', '1', '1', null, null, null, '2', '1');
INSERT INTO `sys_dict` VALUES ('95', '仅持久层', 'dao', 'gen_category', '代码生成分类\0\0', '40', '0', '1', '1', null, null, null, '2', '1');
INSERT INTO `sys_dict` VALUES ('96', '男', '1', 'sex', '性别', '10', '0', '1', '1', null, null, null, '2', '1');
INSERT INTO `sys_dict` VALUES ('97', '女', '2', 'sex', '性别', '20', '0', '1', '1', null, null, null, '2', '1');
INSERT INTO `sys_dict` VALUES ('98', 'Integer', 'Integer', 'gen_java_type', 'Java类型', '30', '0', '1', '1', null, null, null, '2', '1');
INSERT INTO `sys_dict` VALUES ('99', 'Double', 'Double', 'gen_java_type', 'Java类型', '40', '0', '1', '1', null, null, null, '2', '1');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` varchar(36) CHARACTER SET utf8mb4 NOT NULL,
  `user_id` varchar(36) DEFAULT NULL COMMENT '用户id',
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) DEFAULT NULL COMMENT '用户操作',
  `time` int(11) DEFAULT NULL COMMENT '响应时间',
  `method` varchar(200) DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) DEFAULT NULL COMMENT '请求参数',
  `ip` varchar(64) DEFAULT NULL COMMENT 'IP地址',
  `create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) NOT NULL DEFAULT '2' COMMENT '是否删除 1是 2否',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '版本号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统日志';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('008d85f67ccd45c8a179aeaf9d883afc', null, null, '用户列表', '5', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('0094dab8ef52486c8d7eaf43c171ba3c', null, null, '用户列表', '6', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-17 23:00:01', null, '2', '1');
INSERT INTO `sys_log` VALUES ('00efe95af40e43e283517c1a760c351b', null, null, '登录', '374', 'com.fast.admin.web.LoginController.login()', null, '127.0.0.1', '2018-09-18 22:17:49', null, '2', '1');
INSERT INTO `sys_log` VALUES ('0101f359b283481da5ec7afd770f24ab', null, null, '用户id删除', '3', 'com.fast.admin.web.SysUserController.del()', null, '127.0.0.1', '2018-09-17 02:12:07', null, '2', '1');
INSERT INTO `sys_log` VALUES ('014977e330ea4a8bb45546c2483aae4d', null, null, '用户列表', '6', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('014cabc831ca4852b362661fd1621272', null, null, '用户列表', '6', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('0165e8f5e0724607a3758384382f9dd2', null, null, '用户添加', '14', 'com.fast.admin.web.SysUserController.add()', null, '127.0.0.1', '2018-09-18 22:23:53', null, '2', '1');
INSERT INTO `sys_log` VALUES ('0170794720fd4bce8748f485d57a14d2', null, null, '获取登录信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('017f8c61fffe4280ba5c169c7988cda3', null, null, '用户列表', '8', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-18 02:09:57', null, '2', '1');
INSERT INTO `sys_log` VALUES ('0208b47ca5554eb48516f8f7834ad877', null, null, '修改性别', '12', 'com.fast.admin.web.SysUserController.status()', null, '127.0.0.1', '2018-09-17 22:55:15', null, '2', '1');
INSERT INTO `sys_log` VALUES ('02168bcc1abd481cbcb8a72c532b9573', null, null, '用户列表', '7', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('02482b3695df4933bd6c64ccf695a071', null, null, '用户列表', '6', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-17 02:25:46', null, '2', '1');
INSERT INTO `sys_log` VALUES ('02bc3dbe34384c5aba2db18c1c33ed3c', null, null, '用户列表', '5', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('02e4558a38e34817ae84a25e6632af53', null, null, '用户列表', '12', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-17 01:40:56', null, '2', '1');
INSERT INTO `sys_log` VALUES ('03c3931b2764465aa3350d4ae5101f9d', null, null, '登录', '176', 'com.fast.admin.web.LoginController.login()', null, '127.0.0.1', '2018-09-19 00:02:39', null, '2', '1');
INSERT INTO `sys_log` VALUES ('0462effb7f9244e597ea475112ff07f3', null, null, '获取登录信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('04c90be6fc5b4eabb59a0a365ae8ba23', null, null, '用户列表', '8', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-17 02:10:40', null, '2', '1');
INSERT INTO `sys_log` VALUES ('04ca0dfa826c42e7b2cb40af3fa25231', null, null, '用户列表', '5', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('056d0688622a4545b8f6586d250bd6f9', null, null, '用户列表', '7', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('05831a4641924c4a8e1bf1ba0a166fe9', null, null, '用户列表', '6', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-18 02:10:05', null, '2', '1');
INSERT INTO `sys_log` VALUES ('05accaf35c794cb7b3006eb1c508e355', null, null, '获取登录信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('0701b8525b6b4dc5b68f6d789ec75b28', null, null, '用户添加', '7', 'com.fast.admin.web.SysUserController.add()', null, '127.0.0.1', '2018-09-15 21:07:09', null, '2', '1');
INSERT INTO `sys_log` VALUES ('07feb9b402044b85a7489f37d9e5bf13', null, null, '用户列表', '363', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-18 22:48:39', null, '2', '1');
INSERT INTO `sys_log` VALUES ('0807c57681174abb87d70e70ff88cfa4', null, null, '修改性别', '9', 'com.fast.admin.web.SysUserController.status()', null, '127.0.0.1', '2018-09-17 22:59:43', null, '2', '1');
INSERT INTO `sys_log` VALUES ('081332f51a6d41e1a384b28e35adad7e', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-17 00:55:05', null, '2', '1');
INSERT INTO `sys_log` VALUES ('0821f6ba7f8d44c7aec5ab070e2f4337', null, null, '用户列表', '10', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('08802d6010764341bc8fe804c1315a45', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-17 22:26:28', null, '2', '1');
INSERT INTO `sys_log` VALUES ('093f5548297b4f0db70531dfd90be8a0', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-17 02:09:49', null, '2', '1');
INSERT INTO `sys_log` VALUES ('0965abb41b8d401881bd2dafb91af78f', null, null, '获取登录信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('09dd646affad46a6a2826b4cae565826', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-17 02:10:03', null, '2', '1');
INSERT INTO `sys_log` VALUES ('0ac58d932be24ad09ed55773fe682217', null, null, '用户列表', '7', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-18 00:55:01', null, '2', '1');
INSERT INTO `sys_log` VALUES ('0acdf5a16bee467e99c5ba0ee8695389', null, null, '获取登录信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('0b5212aa4f8b4e459d02fa0d9b6b8904', null, null, '获取登录信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('0bb20e5e5a6549ba9081a97806abf49c', null, null, '修改性别', '9', 'com.fast.admin.web.SysUserController.sex()', null, '127.0.0.1', '2018-09-17 22:39:43', null, '2', '1');
INSERT INTO `sys_log` VALUES ('0c37dfd6fd0a42f4b120d4f45cb6f2b7', null, null, '根据id查询', '5', 'com.fast.admin.web.SysUserController.get()', null, '127.0.0.1', '2018-09-17 22:26:11', null, '2', '1');
INSERT INTO `sys_log` VALUES ('0c41bdee2af744988c95cfbf4eb93dfe', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-18 01:14:10', null, '2', '1');
INSERT INTO `sys_log` VALUES ('0c64ad835b854e89a4e50442e1b6e39b', null, null, '用户列表', '14', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-18 00:54:54', null, '2', '1');
INSERT INTO `sys_log` VALUES ('0ca1dd663d8d49358ff24f2a649e6661', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-18 22:19:53', null, '2', '1');
INSERT INTO `sys_log` VALUES ('0ce68b85eaaa4f11bdee929d992da818', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-17 23:07:42', null, '2', '1');
INSERT INTO `sys_log` VALUES ('0d342b9fecf847aabe3c13bda6961bb2', null, null, '用户列表', '7', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-18 01:19:39', null, '2', '1');
INSERT INTO `sys_log` VALUES ('0d4ade9ff7544ce5997b0fafc0fd9197', null, null, '获取登录信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('0ec29b0d189a4d0782957c9ba670647e', null, null, '用户列表', '9', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-17 01:55:08', null, '2', '1');
INSERT INTO `sys_log` VALUES ('0f2d74e9349d4a35b3447835ec1c51a4', null, null, '获取登录信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('0f36a7cd951147a197bfde8a55c05fac', null, null, '根据id查询', '3', 'com.fast.admin.web.SysUserController.get()', null, '127.0.0.1', '2018-09-17 23:03:45', null, '2', '1');
INSERT INTO `sys_log` VALUES ('0f85d5f4462a43289182f17aaf6091d4', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-18 00:54:29', null, '2', '1');
INSERT INTO `sys_log` VALUES ('0fc4f0a22f52469aa3b949a83244d41b', null, null, '用户列表', '6', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-17 23:00:16', null, '2', '1');
INSERT INTO `sys_log` VALUES ('101e0e43990e48cd8ca05082a556b20d', null, null, '用户列表', '4', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('1063ff920a994b5790c39dd1e6d6e113', null, null, '修改性别', '10', 'com.fast.admin.web.SysUserController.status()', null, '127.0.0.1', '2018-09-18 00:54:52', null, '2', '1');
INSERT INTO `sys_log` VALUES ('117af7fd915e4be3904928b05b41dbc4', null, null, '用户列表', '5', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-17 02:12:13', null, '2', '1');
INSERT INTO `sys_log` VALUES ('1261eea6aaaf4b3fbf9411a7f9e0f186', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-17 22:37:19', null, '2', '1');
INSERT INTO `sys_log` VALUES ('1326e623c9d340f89a711de85eeb8ff3', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-17 23:03:45', null, '2', '1');
INSERT INTO `sys_log` VALUES ('132881a06f784383b134dcf947bbd05f', null, null, '登录', '17508', 'com.fast.admin.web.LoginController.login()', null, '127.0.0.1', '2018-09-17 00:52:09', null, '2', '1');
INSERT INTO `sys_log` VALUES ('14437454d0e24d13ab13c7e5f2f6b7c5', null, null, '获取登录信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('1551284191094e4e8a3e876252362af6', null, null, '登录', '405', 'com.fast.admin.web.LoginController.login()', null, '127.0.0.1', '2018-09-18 00:46:47', null, '2', '1');
INSERT INTO `sys_log` VALUES ('15835829e9164ca191ff1912bb28b4c1', null, null, '角色列表', '6', 'com.fast.admin.web.SysRoleController.page()', null, '127.0.0.1', '2018-09-18 02:10:06', null, '2', '1');
INSERT INTO `sys_log` VALUES ('158a98e8355a4e30b9adbe6f1a43af13', null, null, '用户列表', '7', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('15c2aeff0add40bd9287d7b7d708fef3', null, null, '用户列表', '7', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('170d3df370044cb4abd32f489ee5cd93', null, null, '修改性别', '11', 'com.fast.admin.web.SysUserController.status()', null, '127.0.0.1', '2018-09-18 00:54:52', null, '2', '1');
INSERT INTO `sys_log` VALUES ('181d358e6774464e81b7328e9fac588b', null, null, '用户列表', '7', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-17 02:17:30', null, '2', '1');
INSERT INTO `sys_log` VALUES ('1824440ab5fe468fa550bfd4990b8ca3', null, null, '用户列表', '6', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-18 00:55:04', null, '2', '1');
INSERT INTO `sys_log` VALUES ('18358bba018643b18bde63d63564f1cc', null, null, '登录', '28', 'com.fast.admin.web.LoginController.login()', null, '127.0.0.1', '2018-09-18 01:08:34', null, '2', '1');
INSERT INTO `sys_log` VALUES ('184b54a676b04d0e99a565ce7bee6b04', null, null, '获取登录信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('1892bbdf001e45ccb14ad87c56501b71', null, null, '获取登录信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('197d9f413c6b4b97a28fb747137a3407', null, null, '修改性别', '8', 'com.fast.admin.web.SysUserController.sex()', null, '127.0.0.1', '2018-09-17 22:39:47', null, '2', '1');
INSERT INTO `sys_log` VALUES ('19912049ecaa461aac3a8913acf33865', null, null, '修改性别', '7', 'com.fast.admin.web.SysUserController.sex()', null, '127.0.0.1', '2018-09-17 22:39:43', null, '2', '1');
INSERT INTO `sys_log` VALUES ('1a16501932b74e7ab6951c3e68ba61df', null, null, '获取登录信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('1b0cf78f815049a8a20faa8b3cfd510b', null, null, '登录', '39', 'com.fast.admin.web.LoginController.login()', null, '127.0.0.1', '2018-09-17 02:03:39', null, '2', '1');
INSERT INTO `sys_log` VALUES ('1bccf6dbee594d60b59fa19556ced34d', null, null, '用户列表', '8', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-17 01:06:07', null, '2', '1');
INSERT INTO `sys_log` VALUES ('1c764f0721354606be6c1734e8d67e6f', null, null, '修改性别', '9', 'com.fast.admin.web.SysUserController.sex()', null, '127.0.0.1', '2018-09-17 22:39:51', null, '2', '1');
INSERT INTO `sys_log` VALUES ('1c88b402edb44edea27afb2457ae6647', null, null, '登录', '28', 'com.fast.admin.web.LoginController.login()', null, '127.0.0.1', '2018-09-18 22:55:54', null, '2', '1');
INSERT INTO `sys_log` VALUES ('1cdb891288cd40c1a7fed916bc94430e', null, null, '登录', '2409', 'com.fast.admin.web.LoginController.login()', null, '127.0.0.1', '2018-09-17 00:53:34', null, '2', '1');
INSERT INTO `sys_log` VALUES ('1d6e29648e2e4eea93fb53a08a1674ba', null, null, '用户列表', '5', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('1d7df8f5d2a1438c997045a586590981', null, null, '用户列表', '278629', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-17 22:53:05', null, '2', '1');
INSERT INTO `sys_log` VALUES ('1dba6e4fdb964560a3d987de1f3adfbb', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-17 01:41:37', null, '2', '1');
INSERT INTO `sys_log` VALUES ('1e90b9f6bc7f4e4cb690925f1a425df8', null, null, '获取登录信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('1ebc91e4cca8432ea0c9a4f8292af649', null, null, '角色列表', '5', 'com.fast.admin.web.SysRoleController.page()', null, '127.0.0.1', '2018-09-18 02:12:56', null, '2', '1');
INSERT INTO `sys_log` VALUES ('1f06146bd3f844abbd2b50c906cc842e', null, null, '登录', '158', 'com.fast.admin.web.LoginController.login()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('1f1713b4826d4dba8e8765b674330974', null, null, '角色列表', '5', 'com.fast.admin.web.SysRoleController.page()', null, '127.0.0.1', '2018-09-18 02:14:03', null, '2', '1');
INSERT INTO `sys_log` VALUES ('1f624402b5be492c83020d9bbf77c60c', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-18 00:52:12', null, '2', '1');
INSERT INTO `sys_log` VALUES ('207457dc32044664b26d5735db395746', null, null, '用户列表', '7', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-17 23:00:06', null, '2', '1');
INSERT INTO `sys_log` VALUES ('209a9ddd2472493eb1d50cdf40860ce9', null, null, '用户列表', '63', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-18 22:19:53', null, '2', '1');
INSERT INTO `sys_log` VALUES ('2147c155adce4cc3a8888eddab8f656f', null, null, '登录', '377', 'com.fast.admin.web.LoginController.login()', null, '127.0.0.1', '2018-09-18 22:46:28', null, '2', '1');
INSERT INTO `sys_log` VALUES ('2173011c18a6442484b9666f72bd0519', null, null, '用户列表', '8', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('220ced0809744b6d8af73fafaffd443d', null, null, '修改性别', '8', 'com.fast.admin.web.SysUserController.sex()', null, '127.0.0.1', '2018-09-17 22:39:43', null, '2', '1');
INSERT INTO `sys_log` VALUES ('22906518cf7844b68eca3ae4926edf2c', null, null, '修改性别', '7', 'com.fast.admin.web.SysUserController.sex()', null, '127.0.0.1', '2018-09-17 22:39:46', null, '2', '1');
INSERT INTO `sys_log` VALUES ('22cb75e6f1484b9fbf27522ef6360fd4', null, null, '用户添加', '6', 'com.fast.admin.web.SysUserController.add()', null, '127.0.0.1', '2018-09-17 22:27:34', null, '2', '1');
INSERT INTO `sys_log` VALUES ('23021851c05a4d96ad0c9270a92b35df', null, null, '获取登录信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('23b9c024d5b14582b158d4c2caae2b73', null, null, '用户删除', '5', 'com.fast.admin.web.SysUserController.add()', null, '127.0.0.1', '2018-09-15 21:15:18', null, '2', '1');
INSERT INTO `sys_log` VALUES ('241fd3fc20c34bdcbf7bf7da51e1a8af', null, null, '登录', '162', 'com.fast.admin.web.LoginController.login()', null, '127.0.0.1', '2018-09-17 01:38:05', null, '2', '1');
INSERT INTO `sys_log` VALUES ('2447ea7d2e64427db9943e007c1a2388', null, null, '修改性别', '18', 'com.fast.admin.web.SysUserController.sex()', null, '127.0.0.1', '2018-09-18 02:13:55', null, '2', '1');
INSERT INTO `sys_log` VALUES ('2511586df5704930a5c109db8942f8bd', null, null, '获取登录信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('25444f3f2bb24140aa3711fe18ebcd89', null, null, '获取登录信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('25580626e77449b2997c3111919fd491', null, null, '修改性别', '7', 'com.fast.admin.web.SysUserController.sex()', null, '127.0.0.1', '2018-09-17 22:27:49', null, '2', '1');
INSERT INTO `sys_log` VALUES ('25ac3fd7119d42c2b4349229908d4234', null, null, '根据id查询', '3', 'com.fast.admin.web.SysUserController.get()', null, '127.0.0.1', '2018-09-17 23:02:30', null, '2', '1');
INSERT INTO `sys_log` VALUES ('25b4ab0e90234a189d119bc4c7473857', null, null, '获取登录信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('26034a6b5e6d454795060234295c2c7b', null, null, '用户列表', '6', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-18 01:21:26', null, '2', '1');
INSERT INTO `sys_log` VALUES ('26c0d27e4cd940b9bd3793c85ecb22c2', null, null, '用户列表', '9', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('288464fc889445699f2bcd3cf55a0688', null, null, '根据id查询', '5', 'com.fast.admin.web.SysUserController.get()', null, '127.0.0.1', '2018-09-18 00:52:22', null, '2', '1');
INSERT INTO `sys_log` VALUES ('289e1ae030504668835aec856ada92df', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-17 02:26:57', null, '2', '1');
INSERT INTO `sys_log` VALUES ('2929d78b6865419cbda25331cc89aaaf', null, null, '角色列表', '4', 'com.fast.admin.web.SysRoleController.page()', null, '127.0.0.1', '2018-09-18 02:14:16', null, '2', '1');
INSERT INTO `sys_log` VALUES ('2948843251bf4f71b90439e8a08e1906', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-17 01:40:56', null, '2', '1');
INSERT INTO `sys_log` VALUES ('294b1a9e3b9e48fc8a1956f1cf72a106', null, null, '获取登录信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('29ab4431e5df4b788bdad95af70f1110', null, null, '登录', '184', 'com.fast.admin.web.LoginController.login()', null, '127.0.0.1', '2018-09-18 00:51:01', null, '2', '1');
INSERT INTO `sys_log` VALUES ('2a2dbba43e7a49ccbc720e163dd0ad83', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-17 02:12:15', null, '2', '1');
INSERT INTO `sys_log` VALUES ('2abbbef949e74798982bc4f2f72c265d', null, null, '用户列表', '7', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-18 00:55:00', null, '2', '1');
INSERT INTO `sys_log` VALUES ('2b62e28cf61f4ff887b64c4b35ab0f0b', null, null, '用户列表', '11', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('2be5eb90447a4791b75bb3f4ef2dc15f', null, null, '用户列表', '64', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-18 22:14:28', null, '2', '1');
INSERT INTO `sys_log` VALUES ('2c2da6370d2f4202bfaedca658c5a9d2', null, null, '用户列表', '7', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-17 22:31:51', null, '2', '1');
INSERT INTO `sys_log` VALUES ('2c36d2cb295f4e5ca021d4a93ee2b6fc', null, null, '登录', '464', 'com.fast.admin.web.LoginController.login()', null, '127.0.0.1', '2018-09-17 01:52:54', null, '2', '1');
INSERT INTO `sys_log` VALUES ('2c612e12836e4184bc309e4e03a47b17', null, null, '用户列表', '8', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-15 21:07:23', null, '2', '1');
INSERT INTO `sys_log` VALUES ('2caf97ca954242c0bd0a006218fd078c', null, null, '用户列表', '9', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-19 00:08:03', null, '2', '1');
INSERT INTO `sys_log` VALUES ('2cc8107d682d48eca72765503c02dfc1', null, null, '获取登录信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('2ddb1bdd17104f3ba4042a84a057bf84', null, null, '角色批量删除', '13', 'com.fast.admin.web.SysRoleController.dels()', null, '127.0.0.1', '2018-09-18 02:05:15', null, '2', '1');
INSERT INTO `sys_log` VALUES ('2ea26c21ab384d9383702ac562c0aa47', null, null, '修改性别', '9', 'com.fast.admin.web.SysUserController.sex()', null, '127.0.0.1', '2018-09-18 02:13:55', null, '2', '1');
INSERT INTO `sys_log` VALUES ('2f67c1bbb8c14f56b7c7c746d56bb4ab', null, null, '登录', '27', 'com.fast.admin.web.LoginController.login()', null, '127.0.0.1', '2018-09-17 01:13:42', null, '2', '1');
INSERT INTO `sys_log` VALUES ('2f93c7e7ccd9485a805755674e1bf3e9', null, null, '用户列表', '5', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-17 22:42:35', null, '2', '1');
INSERT INTO `sys_log` VALUES ('31b07d4e670345f2bce6384a5012e5d4', null, null, '登录', '156', 'com.fast.admin.web.LoginController.login()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('32d3ab5dc590495485ff3ddb4912928f', null, null, '获取登录信息', '1', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('336f8fdf57d94f7e8f95712228ccf94c', null, null, '修改性别', '8', 'com.fast.admin.web.SysUserController.sex()', null, '127.0.0.1', '2018-09-17 22:56:55', null, '2', '1');
INSERT INTO `sys_log` VALUES ('33bf196b91fd4bb0b13acf4e2ed76619', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-17 22:27:07', null, '2', '1');
INSERT INTO `sys_log` VALUES ('341b8a43ccc44f84b41581e28da12c72', null, null, '角色列表', '5', 'com.fast.admin.web.SysRoleController.page()', null, '127.0.0.1', '2018-09-18 02:14:11', null, '2', '1');
INSERT INTO `sys_log` VALUES ('345b1406c25c41799b0fae756ba5a6cd', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-17 02:10:54', null, '2', '1');
INSERT INTO `sys_log` VALUES ('35f871384cc84de49f6f8c3395929716', null, null, '修改性别', '7', 'com.fast.admin.web.SysUserController.sex()', null, '127.0.0.1', '2018-09-17 22:39:46', null, '2', '1');
INSERT INTO `sys_log` VALUES ('361015d8b2014a25ac03c0eb6e2f838c', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-17 02:16:55', null, '2', '1');
INSERT INTO `sys_log` VALUES ('366cabd4aaaf4da581d71d1dc8e3b2cd', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-18 22:14:12', null, '2', '1');
INSERT INTO `sys_log` VALUES ('3685f404f1ac4887bb946ac880c03d2e', null, null, '角色列表', '6', 'com.fast.admin.web.SysRoleController.page()', null, '127.0.0.1', '2018-09-18 02:05:46', null, '2', '1');
INSERT INTO `sys_log` VALUES ('373ceaad994847e58e1aba3eaa995781', null, null, '登录', '1767', 'com.fast.admin.web.LoginController.login()', null, '127.0.0.1', '2018-09-17 00:54:17', null, '2', '1');
INSERT INTO `sys_log` VALUES ('375766d2e80549f19b497e072737304e', null, null, '用户列表', '8', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-18 01:20:14', null, '2', '1');
INSERT INTO `sys_log` VALUES ('3760c3a30a2f4d8da1fbf22a6518a90f', null, null, '根据id查询', '16', 'com.fast.admin.web.SysRoleController.get()', null, '127.0.0.1', '2018-09-18 22:46:31', null, '2', '1');
INSERT INTO `sys_log` VALUES ('3769f4b332f84b25af77c89265b06287', null, null, '修改性别', '9', 'com.fast.admin.web.SysUserController.sex()', null, '127.0.0.1', '2018-09-17 22:27:51', null, '2', '1');
INSERT INTO `sys_log` VALUES ('37a777bb5de040b68f4afa30c52e62a7', null, null, '用户列表', '19', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('380f80f872564e85bcadd96b00ce2261', null, null, '修改性别', '10', 'com.fast.admin.web.SysUserController.status()', null, '127.0.0.1', '2018-09-18 00:53:49', null, '2', '1');
INSERT INTO `sys_log` VALUES ('38480624430d48f58a3ee6c62ca9fa01', null, null, '修改性别', '11', 'com.fast.admin.web.SysUserController.status()', null, '127.0.0.1', '2018-09-17 22:56:02', null, '2', '1');
INSERT INTO `sys_log` VALUES ('384fd33c140e4b9b8d549122926704dc', null, null, '用户添加', '13', 'com.fast.admin.web.SysUserController.add()', null, '127.0.0.1', '2018-09-17 02:08:17', null, '2', '1');
INSERT INTO `sys_log` VALUES ('39468b63ea83403fa062d2e7242fbc17', null, null, '用户列表', '7', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('39c8e63216594b13901956e3c1ab0635', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-17 01:40:45', null, '2', '1');
INSERT INTO `sys_log` VALUES ('3bf62f7aceee4062bd86947c0399d8a5', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-17 01:41:13', null, '2', '1');
INSERT INTO `sys_log` VALUES ('3bfec357532948eda13405b8e499c9d7', null, null, '获取登录信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('3c4eb46f5a7949b4ad14ec6dc6301c91', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-17 22:31:51', null, '2', '1');
INSERT INTO `sys_log` VALUES ('3c7054293bff496ca829838cd6eb6b1a', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-17 02:17:09', null, '2', '1');
INSERT INTO `sys_log` VALUES ('3cdb4a8d06b34b159469f2457bfe8342', null, null, '用户列表', '63', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-18 22:17:50', null, '2', '1');
INSERT INTO `sys_log` VALUES ('3d0d21a7825c4fd09b4f0a922e903e63', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-17 22:55:57', null, '2', '1');
INSERT INTO `sys_log` VALUES ('3d92e81d1c2047208a6ac8107c3019be', null, null, '根据id查询', '4', 'com.fast.admin.web.SysUserController.get()', null, '127.0.0.1', '2018-09-17 23:01:05', null, '2', '1');
INSERT INTO `sys_log` VALUES ('3d9d000dca004800aa35705de7ed1b18', null, null, '用户列表', '6', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-18 02:10:11', null, '2', '1');
INSERT INTO `sys_log` VALUES ('3dea8404499d4a9b828a46820c6e4204', null, null, '用户列表', '5', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-18 01:21:47', null, '2', '1');
INSERT INTO `sys_log` VALUES ('3e1cbbbe346242a4909499d144ec28ff', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-18 01:43:43', null, '2', '1');
INSERT INTO `sys_log` VALUES ('3e2397de4bff443e9c3cc5c71c0b20e2', null, null, '用户列表', '7', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-18 00:55:03', null, '2', '1');
INSERT INTO `sys_log` VALUES ('3e42d4930abf4d8b9f00ad430933e2c6', null, null, '用户列表', '6', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-18 00:55:09', null, '2', '1');
INSERT INTO `sys_log` VALUES ('3e86e4fbc8f64f39b49137a62b4517b0', null, null, '根据id查询', '2', 'com.fast.admin.web.SysUserController.get()', null, '127.0.0.1', '2018-09-17 23:03:22', null, '2', '1');
INSERT INTO `sys_log` VALUES ('3e8a54dce48c48b8b8fb92e02f1dd6ce', null, null, '用户列表', '10', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-17 22:55:57', null, '2', '1');
INSERT INTO `sys_log` VALUES ('3f3ac785c0e643e5bab919ceafb590ed', null, null, '角色列表', '8', 'com.fast.admin.web.SysRoleController.page()', null, '127.0.0.1', '2018-09-18 02:04:26', null, '2', '1');
INSERT INTO `sys_log` VALUES ('3f77321dc9e54037ab31e57d43d0c02d', null, null, '用户列表', '7', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('3fb75fe898c34fbcbdb0e2002d89fbdc', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-17 01:54:40', null, '2', '1');
INSERT INTO `sys_log` VALUES ('3ffbb434617345c689d6dd1e2c0a7ccd', null, null, '用户列表', '7', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-17 23:00:14', null, '2', '1');
INSERT INTO `sys_log` VALUES ('405e5e699fe7491cb352a6a9b06ce81b', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-18 00:54:50', null, '2', '1');
INSERT INTO `sys_log` VALUES ('406775db697c47a58a456533f75aea73', null, null, '获取登录信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('40bf78f736d64c4aa6f0330bd876d290', null, null, '用户列表', '7', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('40e9a800b1ae465699fa1ffd2354b087', null, null, '用户列表', '6', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('4122f7e22fd14c0c885c455229377c45', null, null, '用户列表', '5', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-17 22:37:19', null, '2', '1');
INSERT INTO `sys_log` VALUES ('41c5becd45d445efb4077a67dfcc0c09', null, null, '用户列表', '7', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('41f58a2e6ff64752beb6f26ad048d1f4', null, null, '登录', '161', 'com.fast.admin.web.LoginController.login()', null, '127.0.0.1', '2018-09-15 21:06:27', null, '2', '1');
INSERT INTO `sys_log` VALUES ('4219058c3bd64a0e971007abe178fb28', null, null, '获取登录信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('4230b2d69fdf4c36a2a9040790dc5b6a', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-19 00:03:21', null, '2', '1');
INSERT INTO `sys_log` VALUES ('4282054685fc4a50bd2c2a9e5e7b03fd', null, null, '角色列表', '5', 'com.fast.admin.web.SysRoleController.page()', null, '127.0.0.1', '2018-09-18 02:12:46', null, '2', '1');
INSERT INTO `sys_log` VALUES ('429c2d7a0dea4b918d68996e2e3033da', null, null, '用户列表', '7', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('42b6aa7c44a44daf872651776dacee02', null, null, '修改性别', '6', 'com.fast.admin.web.SysUserController.sex()', null, '127.0.0.1', '2018-09-17 22:39:45', null, '2', '1');
INSERT INTO `sys_log` VALUES ('43af947109a6489f867268ebbe4443d5', null, null, '获取登录信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('43ebd5a5f215489cb3676db2203c347f', null, null, '获取登录信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('44170caa239c4fa98065558f3804fed4', null, null, '角色列表', '6', 'com.fast.admin.web.SysRoleController.page()', null, '127.0.0.1', '2018-09-18 02:09:57', null, '2', '1');
INSERT INTO `sys_log` VALUES ('45dbc3552cf340cd8f0cb395ca91ba52', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-17 01:39:11', null, '2', '1');
INSERT INTO `sys_log` VALUES ('467c3254c0734551810981bef5af839e', null, null, '用户列表', '6', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('4692d7ddc47c41089e2e0532d1f53dd0', null, null, '修改性别', '7', 'com.fast.admin.web.SysUserController.sex()', null, '127.0.0.1', '2018-09-17 22:39:44', null, '2', '1');
INSERT INTO `sys_log` VALUES ('46bf063e6ddd43c1a0665c6edef734cf', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-18 02:09:56', null, '2', '1');
INSERT INTO `sys_log` VALUES ('46cece14cc754c3d909510ac49a7e809', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-18 00:51:02', null, '2', '1');
INSERT INTO `sys_log` VALUES ('471e519a236140139beafb088b69828f', null, null, '用户列表', '6', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-17 02:25:30', null, '2', '1');
INSERT INTO `sys_log` VALUES ('473e4e454cc6459580fc3200138c2245', null, null, '角色列表', '11', 'com.fast.admin.web.SysRoleController.page()', null, '127.0.0.1', '2018-09-19 00:08:04', null, '2', '1');
INSERT INTO `sys_log` VALUES ('476ebbe8e07d452e956268a4209201fd', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-18 22:46:29', null, '2', '1');
INSERT INTO `sys_log` VALUES ('47b238f6827b4229aca930c072ef34a4', null, null, '用户列表', '10', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('47cdf4ec72514bf0a2306850b635aa12', null, null, '登录', '4508', 'com.fast.admin.web.LoginController.login()', null, '127.0.0.1', '2018-09-17 00:55:08', null, '2', '1');
INSERT INTO `sys_log` VALUES ('482bef2a65e44dcfa5b3491625d35af2', null, null, '角色列表', '9', 'com.fast.admin.web.SysRoleController.page()', null, '127.0.0.1', '2018-09-18 02:04:32', null, '2', '1');
INSERT INTO `sys_log` VALUES ('48852eaaa52e4ad7a5505ee693284fba', null, null, '用户列表', '9', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-17 01:59:04', null, '2', '1');
INSERT INTO `sys_log` VALUES ('4889aecd7fe1499b9fb559e9c1c413e7', null, null, '获取登录信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('48a64b60f3c243208e879f333c9919af', null, null, '获取登录信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('48c90dee82de425abf91f657a9b72ae3', null, null, '用户列表', '7', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-18 02:14:05', null, '2', '1');
INSERT INTO `sys_log` VALUES ('4961230d4f8d4def85ebc51f8f7e7086', null, null, '登录', '162', 'com.fast.admin.web.LoginController.login()', null, '127.0.0.1', '2018-09-18 22:14:11', null, '2', '1');
INSERT INTO `sys_log` VALUES ('49620147d8514e4999c4e55987bb6329', null, null, '用户列表', '65', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-18 22:46:29', null, '2', '1');
INSERT INTO `sys_log` VALUES ('49dce4d2349244cfb2a4910ee3a2432b', null, null, '获取登录信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('4a8456d6739a428abfed4189e9e40877', null, null, '获取登录信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('4aaaad4a76ff47cbb511ad807cb7c88c', null, null, '登录', '23', 'com.fast.admin.web.LoginController.login()', null, '127.0.0.1', '2018-09-17 22:26:06', null, '2', '1');
INSERT INTO `sys_log` VALUES ('4ac0b4a17209437e8313d048625873a6', null, null, '获取登录信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('4b604289d3054957a72504b9df9f2f36', null, null, '用户列表', '7', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('4bbcedc832994f148009bc42b94862ab', null, null, '用户列表', '6', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-17 02:25:06', null, '2', '1');
INSERT INTO `sys_log` VALUES ('4bd8949342cc4618bbb56139b81d422f', null, null, '用户列表', '6', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-17 23:00:17', null, '2', '1');
INSERT INTO `sys_log` VALUES ('4c1586234e6847f6805a8674a004d590', null, null, '用户列表', '7', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-17 02:03:42', null, '2', '1');
INSERT INTO `sys_log` VALUES ('4c3432c051e54ceba361cf5e67d419dc', null, null, '修改性别', '8', 'com.fast.admin.web.SysUserController.sex()', null, '127.0.0.1', '2018-09-17 22:39:52', null, '2', '1');
INSERT INTO `sys_log` VALUES ('4c9116e7951c4d64b7adf74d278ff56a', null, null, '用户列表', '5', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-18 00:55:08', null, '2', '1');
INSERT INTO `sys_log` VALUES ('4d3d7a59c91d44b789a015e86217cd73', null, null, '根据id查询', '2', 'com.fast.admin.web.SysUserController.get()', null, '127.0.0.1', '2018-09-17 23:01:50', null, '2', '1');
INSERT INTO `sys_log` VALUES ('4d7509d518294c9e8acccc5cf34ebe71', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-18 00:46:47', null, '2', '1');
INSERT INTO `sys_log` VALUES ('4e0e833c978b4542b57f5f09feb1c672', null, null, '用户列表', '9', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-18 02:10:01', null, '2', '1');
INSERT INTO `sys_log` VALUES ('4e350ba2dcef4855bb9418afa00b137b', null, null, '获取登录信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('4e6b664a92a64c43ad6471ad961b0673', null, null, '根据id查询', '6', 'com.fast.admin.web.SysUserController.get()', null, '127.0.0.1', '2018-09-19 00:03:26', null, '2', '1');
INSERT INTO `sys_log` VALUES ('4f1cdd93ee874d14ac826f80c5dd8b8f', null, null, '用户列表', '8', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-17 02:08:17', null, '2', '1');
INSERT INTO `sys_log` VALUES ('4fa238b118ef4d4c878dfc7767469ab8', null, null, '修改性别', '10', 'com.fast.admin.web.SysUserController.status()', null, '127.0.0.1', '2018-09-17 22:56:02', null, '2', '1');
INSERT INTO `sys_log` VALUES ('51961f2acfdd4f7184e4a96f7efb9dcf', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-17 02:03:40', null, '2', '1');
INSERT INTO `sys_log` VALUES ('51d24e0b62f74213bdc56475654d5e4d', null, null, '获取登录用户信息', '1', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-17 01:13:34', null, '2', '1');
INSERT INTO `sys_log` VALUES ('51d947b5b27147de9ab6d192d79b1057', null, null, '用户添加', '4', 'com.fast.admin.web.SysUserController.add()', null, '127.0.0.1', '2018-09-17 22:43:24', null, '2', '1');
INSERT INTO `sys_log` VALUES ('52166b42488a4045b1ef80bb4fd8bfba', null, null, '用户列表', '6', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-17 02:17:40', null, '2', '1');
INSERT INTO `sys_log` VALUES ('526caad93cd54c3fb9fd83177aff2499', null, null, '根据id查询', '7', 'com.fast.admin.web.SysUserController.get()', null, '127.0.0.1', '2018-09-18 00:51:04', null, '2', '1');
INSERT INTO `sys_log` VALUES ('52f03e4372ef498db0a7dd637d93a08a', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-17 02:25:46', null, '2', '1');
INSERT INTO `sys_log` VALUES ('537d300921b94bf89be098aa1b864bb6', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-17 23:01:48', null, '2', '1');
INSERT INTO `sys_log` VALUES ('53ad2409e222460381f711fbec25c110', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-17 02:23:47', null, '2', '1');
INSERT INTO `sys_log` VALUES ('53c343ac73ac4d528be1fb4f87e9e97e', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-17 01:38:16', null, '2', '1');
INSERT INTO `sys_log` VALUES ('53f52fd5deae4326af131fc9cb95a617', null, null, '用户列表', '61', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-17 01:39:11', null, '2', '1');
INSERT INTO `sys_log` VALUES ('553b14c257e6430ea70b7b13fb3ae1c0', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-17 02:27:25', null, '2', '1');
INSERT INTO `sys_log` VALUES ('56ca5947041f48ffa409aac2499e23bc', null, null, '登录', '31', 'com.fast.admin.web.LoginController.login()', null, '127.0.0.1', '2018-09-17 01:04:06', null, '2', '1');
INSERT INTO `sys_log` VALUES ('5723482a3cc94292827ec795cb38dfb0', null, null, '获取登录信息', '1', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-15 21:06:27', null, '2', '1');
INSERT INTO `sys_log` VALUES ('57a1333a06724bc8921d0c3f777d9885', null, null, '修改性别', '12', 'com.fast.admin.web.SysUserController.sex()', null, '127.0.0.1', '2018-09-17 22:56:55', null, '2', '1');
INSERT INTO `sys_log` VALUES ('5809c9c3e42849d382da5fbdfbdf9d1d', null, null, '登录', '27', 'com.fast.admin.web.LoginController.login()', null, '127.0.0.1', '2018-09-17 00:58:26', null, '2', '1');
INSERT INTO `sys_log` VALUES ('5820db6cf9b74d48b5566fb502b9b283', null, null, '用户列表', '6', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('58f9b3615a7a490595b636f582c01994', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-17 01:24:08', null, '2', '1');
INSERT INTO `sys_log` VALUES ('594c74c5aa62412195f3de566653f5b5', null, null, '修改性别', '17', 'com.fast.admin.web.SysUserController.status()', null, '127.0.0.1', '2018-09-18 00:53:48', null, '2', '1');
INSERT INTO `sys_log` VALUES ('59ad237e79694946b5729e105058a137', null, null, '用户列表', '8', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-18 01:18:54', null, '2', '1');
INSERT INTO `sys_log` VALUES ('59fdd32c619c442d96eef680f471eaeb', null, null, '修改性别', '10', 'com.fast.admin.web.SysUserController.sex()', null, '127.0.0.1', '2018-09-17 22:27:48', null, '2', '1');
INSERT INTO `sys_log` VALUES ('5a0b769cc3104b15bf223e9cd2a7eb89', null, null, '获取登录信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('5a2b6b5b5e064fadac72142c2a5c273c', null, null, '用户批量删除', '4', 'com.fast.admin.web.SysUserController.dels()', null, '127.0.0.1', '2018-09-17 02:12:13', null, '2', '1');
INSERT INTO `sys_log` VALUES ('5a2fb05f1f444598b65dbdc2254cba0e', null, null, '用户列表', '75', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-17 01:02:25', null, '2', '1');
INSERT INTO `sys_log` VALUES ('5a3e0369b23b477592eeb1ecfce339b7', null, null, '获取登录信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('5b10440b6482474ea6671abbb7f31d6a', null, null, '用户列表', '10', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-17 02:05:58', null, '2', '1');
INSERT INTO `sys_log` VALUES ('5b57cd90698e488181358b3ecbd691ce', null, null, '用户列表', '6', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('5b7392d5197b429999f6b9f720acf860', null, null, '获取登录信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-15 21:14:48', null, '2', '1');
INSERT INTO `sys_log` VALUES ('5c57534e3e7447b880d4e61cf104dd08', null, null, '用户添加', '8', 'com.fast.admin.web.SysUserController.add()', null, '127.0.0.1', '2018-09-17 02:09:56', null, '2', '1');
INSERT INTO `sys_log` VALUES ('5cc0f600512f4c4bae596a6434618b8b', null, null, '用户列表', '6', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-18 01:15:29', null, '2', '1');
INSERT INTO `sys_log` VALUES ('5d7ac217664548888d0c16b2dba95d20', null, null, '用户列表', '6', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('5d8f2b745b034a00bd9d80489dbd7a9a', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-18 02:12:51', null, '2', '1');
INSERT INTO `sys_log` VALUES ('5dfb7adcede24ecb95c47a113a66c340', null, null, '用户列表', '7', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-17 02:16:55', null, '2', '1');
INSERT INTO `sys_log` VALUES ('5f1ce89b78a14c078d1c96dd0045b5e1', null, null, '获取登录信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('5f5f3fd65d864d098913d4658d4fbd83', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-17 22:40:37', null, '2', '1');
INSERT INTO `sys_log` VALUES ('5f91b29c6fc94be8b3b257294018c39f', null, null, '用户列表', '8', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-17 22:33:40', null, '2', '1');
INSERT INTO `sys_log` VALUES ('5fa6c393e96e419f99837ad3b4ac85a4', null, null, '修改性别', '10', 'com.fast.admin.web.SysUserController.status()', null, '127.0.0.1', '2018-09-17 22:56:01', null, '2', '1');
INSERT INTO `sys_log` VALUES ('600bef5fd5b245788b3d7d8ed387a5dd', null, null, '用户列表', '7', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-18 00:55:06', null, '2', '1');
INSERT INTO `sys_log` VALUES ('60472fe239f94aecbfc19b1fca625b22', null, null, '用户列表', '8', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-17 22:56:29', null, '2', '1');
INSERT INTO `sys_log` VALUES ('6047b843f5eb470cb68114b2345babb8', null, null, '修改性别', '7', 'com.fast.admin.web.SysUserController.sex()', null, '127.0.0.1', '2018-09-17 22:39:47', null, '2', '1');
INSERT INTO `sys_log` VALUES ('60687015fcf44ff88abe8218799894bb', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-17 02:22:35', null, '2', '1');
INSERT INTO `sys_log` VALUES ('60ad6cec145148a7a61e5556b29a0521', null, null, '修改性别', '7', 'com.fast.admin.web.SysUserController.sex()', null, '127.0.0.1', '2018-09-17 22:39:48', null, '2', '1');
INSERT INTO `sys_log` VALUES ('6130cc133fa94b05b52e8f7119b79628', null, null, '角色列表', '6', 'com.fast.admin.web.SysRoleController.page()', null, '127.0.0.1', '2018-09-18 02:10:06', null, '2', '1');
INSERT INTO `sys_log` VALUES ('62b99415da8c4d32ba81ea8e2bc227bf', null, null, '用户列表', '5', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-18 00:55:09', null, '2', '1');
INSERT INTO `sys_log` VALUES ('62bb1c209425444b8aac573d365aed8e', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-18 22:48:37', null, '2', '1');
INSERT INTO `sys_log` VALUES ('62c1a9d6de3f4ea788be806c87601219', null, null, '用户编辑', '18', 'com.fast.admin.web.SysUserController.edit()', null, '127.0.0.1', '2018-09-18 00:52:27', null, '2', '1');
INSERT INTO `sys_log` VALUES ('62fb7cce7248465a8aad01181f5fb21f', null, null, '用户列表', '8', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('6301f886029646758935db40eecdee50', null, null, '登录', '30', 'com.fast.admin.web.LoginController.login()', null, '127.0.0.1', '2018-09-17 22:59:18', null, '2', '1');
INSERT INTO `sys_log` VALUES ('6322a43774034bb6920b6669f5258909', null, null, '登录', '2449', 'com.fast.admin.web.LoginController.login()', null, '127.0.0.1', '2018-09-17 00:54:18', null, '2', '1');
INSERT INTO `sys_log` VALUES ('635f36b9bdd94e6caec7ec986c8668ef', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-17 23:02:28', null, '2', '1');
INSERT INTO `sys_log` VALUES ('64236dd80b2d4e0e8fe9dfeca811b8ef', null, null, '角色列表', '6', 'com.fast.admin.web.SysRoleController.page()', null, '127.0.0.1', '2018-09-18 02:05:15', null, '2', '1');
INSERT INTO `sys_log` VALUES ('647f8afff5bb4eea9130f10f57daa808', null, null, '修改性别', '12', 'com.fast.admin.web.SysUserController.status()', null, '127.0.0.1', '2018-09-17 22:55:56', null, '2', '1');
INSERT INTO `sys_log` VALUES ('64c7b15f3cb5408391eb9555e118190f', null, null, '用户列表', '18', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-18 00:55:11', null, '2', '1');
INSERT INTO `sys_log` VALUES ('64e2cf42bbb54b52ab8fa6736132029b', null, null, '用户列表', '7', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-18 01:21:11', null, '2', '1');
INSERT INTO `sys_log` VALUES ('65524000b0234ed39d94c47f674f5d7c', null, null, '用户添加', '10', 'com.fast.admin.web.SysUserController.add()', null, '127.0.0.1', '2018-09-18 22:14:57', null, '2', '1');
INSERT INTO `sys_log` VALUES ('659c6e1d6b4b47a9a85c34c56193acdb', null, null, '用户列表', '6', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-17 23:00:05', null, '2', '1');
INSERT INTO `sys_log` VALUES ('65b3a4986c184fb99910cec7d5e6dd23', null, null, '角色列表', '5', 'com.fast.admin.web.SysRoleController.page()', null, '127.0.0.1', '2018-09-18 02:14:14', null, '2', '1');
INSERT INTO `sys_log` VALUES ('66232f9d5d2547b9bc3e661e88707a06', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-17 22:48:17', null, '2', '1');
INSERT INTO `sys_log` VALUES ('66856159d4594c01bd202bfda05d105d', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-18 01:41:58', null, '2', '1');
INSERT INTO `sys_log` VALUES ('66fac5ea1b0d4c81aa56c799f753dc14', null, null, '修改性别', '7', 'com.fast.admin.web.SysUserController.sex()', null, '127.0.0.1', '2018-09-17 22:39:49', null, '2', '1');
INSERT INTO `sys_log` VALUES ('67165a37dd9e4ccd89d33075c0fe1b46', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-17 02:23:43', null, '2', '1');
INSERT INTO `sys_log` VALUES ('67512f8144db45b4bf869f4cb9820b67', null, null, '用户列表', '7', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-17 23:00:04', null, '2', '1');
INSERT INTO `sys_log` VALUES ('675c4c6248074e69aebdead7e1092ddc', null, null, '获取登录信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('6872c6176360435aa76bde45f12ded9b', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-19 00:02:39', null, '2', '1');
INSERT INTO `sys_log` VALUES ('69e63660bae24a29913cefee074b4b6d', null, null, '用户列表', '11', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-17 23:00:00', null, '2', '1');
INSERT INTO `sys_log` VALUES ('6b5581f6431442abb13d321c2f53df58', null, null, '用户列表', '8', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('6b56a5e872414994b02876ca086dbab7', null, null, '用户列表', '8', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-18 00:54:29', null, '2', '1');
INSERT INTO `sys_log` VALUES ('6c732d4ef7a94b21afd768a27d981d32', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-17 01:52:55', null, '2', '1');
INSERT INTO `sys_log` VALUES ('6cf81a04e2b0440d85a8602a9fe51abb', null, null, '用户列表', '8', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-17 22:55:05', null, '2', '1');
INSERT INTO `sys_log` VALUES ('6d1a6a45ce514ed69ea1075b874259dc', null, null, '修改性别', '7', 'com.fast.admin.web.SysUserController.sex()', null, '127.0.0.1', '2018-09-17 22:39:50', null, '2', '1');
INSERT INTO `sys_log` VALUES ('6d4b8c1f26cb43ddab27baf92de218e2', null, null, '获取登录信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-15 21:13:07', null, '2', '1');
INSERT INTO `sys_log` VALUES ('6dbac2b108274e5399bdae9cb209d033', null, null, '获取登录信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('6f019260356f4b88874449161c817267', null, null, '用户列表', '11', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-18 00:52:27', null, '2', '1');
INSERT INTO `sys_log` VALUES ('70b2eaeb95124f3996b43e4c577dd401', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-18 01:21:47', null, '2', '1');
INSERT INTO `sys_log` VALUES ('70c4e1fa19ad4340a8cddcd591c81fc3', null, null, '用户列表', '7', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-17 23:00:16', null, '2', '1');
INSERT INTO `sys_log` VALUES ('7195fa68de984b88bcee93584cb8a944', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-18 01:09:31', null, '2', '1');
INSERT INTO `sys_log` VALUES ('71a7fecb5a5749a19f86e7bb76db8954', null, null, '用户列表', '5', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-17 02:27:25', null, '2', '1');
INSERT INTO `sys_log` VALUES ('729d69677ef14b57bc0c9bda739c2474', null, null, '修改性别', '10', 'com.fast.admin.web.SysUserController.status()', null, '127.0.0.1', '2018-09-17 22:59:42', null, '2', '1');
INSERT INTO `sys_log` VALUES ('749a0f9204c34dc3ac0442256ed5a58f', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-18 23:10:22', null, '2', '1');
INSERT INTO `sys_log` VALUES ('75654ac0e7f74f8e8e90207265b1a549', null, null, '用户列表', '5', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('75b7ff14f626445788033f6f1aea849f', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-17 22:42:35', null, '2', '1');
INSERT INTO `sys_log` VALUES ('75dc952e44374f119b4e4059eb956582', null, null, '角色列表', '9', 'com.fast.admin.web.SysRoleController.page()', null, '127.0.0.1', '2018-09-18 02:04:35', null, '2', '1');
INSERT INTO `sys_log` VALUES ('765d97f412234e62921188bf19ea775e', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-17 02:25:06', null, '2', '1');
INSERT INTO `sys_log` VALUES ('7695d497dbab41d182a031634a60fb10', null, null, '获取登录信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('76ecb579d7864be0b5446cba9ccc0561', null, null, '用户列表', '6', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-18 02:12:58', null, '2', '1');
INSERT INTO `sys_log` VALUES ('76f48fc134a642e99e8c37447b08237c', null, null, '用户列表', '11', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('7802a374e4974c489e02ef5839ff781c', null, null, '用户列表', '7', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-17 23:00:15', null, '2', '1');
INSERT INTO `sys_log` VALUES ('78826c8c9180471eb7678b4c14cf2bc8', null, null, '用户列表', '12', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-17 23:07:02', null, '2', '1');
INSERT INTO `sys_log` VALUES ('78937a7f5095437c91a2d56759b52986', null, null, '修改性别', '8', 'com.fast.admin.web.SysUserController.sex()', null, '127.0.0.1', '2018-09-17 22:39:44', null, '2', '1');
INSERT INTO `sys_log` VALUES ('792de1e660f24cf1bfaec8b55862af4b', null, null, '用户列表', '7', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-17 02:10:56', null, '2', '1');
INSERT INTO `sys_log` VALUES ('7973aa165f9c4a1998500527cb15f299', null, null, '用户列表', '7', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-18 00:55:05', null, '2', '1');
INSERT INTO `sys_log` VALUES ('79c70c43f9114f1497623dfec001c6cf', null, null, '用户列表', '10', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('79f1fb9682f3425fb091fa566f693f7d', null, null, '修改性别', '19', 'com.fast.admin.web.SysUserController.sex()', null, '127.0.0.1', '2018-09-17 22:53:17', null, '2', '1');
INSERT INTO `sys_log` VALUES ('7a45c08d6c654656a93c17845f335266', null, null, '用户列表', '8', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-15 21:15:12', null, '2', '1');
INSERT INTO `sys_log` VALUES ('7ab14d3c872142fcb8bf20b79b92118e', null, null, '获取登录信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('7abc020c10764f70833b21ed136a796d', null, null, '用户列表', '6', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-17 02:12:09', null, '2', '1');
INSERT INTO `sys_log` VALUES ('7af254d383034c0288b7199bd49fd409', null, null, '用户列表', '7', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-17 22:27:10', null, '2', '1');
INSERT INTO `sys_log` VALUES ('7afec70b52ec41198c9e679be4984310', null, null, '修改性别', '8', 'com.fast.admin.web.SysUserController.sex()', null, '127.0.0.1', '2018-09-17 22:39:45', null, '2', '1');
INSERT INTO `sys_log` VALUES ('7b40ac195d76433ea16991ea9f8dd04e', null, null, '登录', '31', 'com.fast.admin.web.LoginController.login()', null, '127.0.0.1', '2018-09-17 02:12:01', null, '2', '1');
INSERT INTO `sys_log` VALUES ('7be1a126404c483297459c0e293b3812', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-17 01:40:28', null, '2', '1');
INSERT INTO `sys_log` VALUES ('7bfc5ee1f26e4eebb283509c38d1b7f3', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-17 01:38:06', null, '2', '1');
INSERT INTO `sys_log` VALUES ('7c14d39b14db4c758e9eae68c31abb1d', null, null, '用户列表', '9', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-17 02:17:10', null, '2', '1');
INSERT INTO `sys_log` VALUES ('7c801103ef7649f4861a8e5399cd6911', null, null, '用户列表', '5', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-17 02:26:43', null, '2', '1');
INSERT INTO `sys_log` VALUES ('7ca346b04a2841eaa6b3e4d5c4a907f2', null, null, '用户添加', '15', 'com.fast.admin.web.SysUserController.add()', null, '127.0.0.1', '2018-09-18 22:51:11', null, '2', '1');
INSERT INTO `sys_log` VALUES ('7caace7b01a1479ab5a771bef8839d18', null, null, '用户列表', '5', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('7cae1fea86cb4632a766631ba3bc93a4', null, null, '根据id查询', '4', 'com.fast.admin.web.SysUserController.get()', null, '127.0.0.1', '2018-09-17 22:26:28', null, '2', '1');
INSERT INTO `sys_log` VALUES ('7da4fc51b73949f49b59699339985f46', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-17 23:01:36', null, '2', '1');
INSERT INTO `sys_log` VALUES ('7db1180be0f6416592568231fb249742', null, null, '用户列表', '9', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-17 22:55:10', null, '2', '1');
INSERT INTO `sys_log` VALUES ('7e028a5e7c6349a18a9c85ba8386bec9', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-18 02:04:15', null, '2', '1');
INSERT INTO `sys_log` VALUES ('7e981397d07b4b3aa20c0e557f1c1355', null, null, '用户列表', '71', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-15 21:06:29', null, '2', '1');
INSERT INTO `sys_log` VALUES ('7ebdd7a8a83c4265bd70bdd9f8db8c57', null, null, '用户列表', '6', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-18 01:21:21', null, '2', '1');
INSERT INTO `sys_log` VALUES ('7f8428f8c71e4946abf1e24be4f8a594', null, null, '修改性别', '7', 'com.fast.admin.web.SysUserController.sex()', null, '127.0.0.1', '2018-09-17 22:39:44', null, '2', '1');
INSERT INTO `sys_log` VALUES ('7f881f245b4b4b1a8b9fc74b35eacb9c', null, null, '用户列表', '62', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-17 01:54:47', null, '2', '1');
INSERT INTO `sys_log` VALUES ('7ff35e628536487d81850a8c9cf66b74', null, null, '用户列表', '8', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-18 02:09:42', null, '2', '1');
INSERT INTO `sys_log` VALUES ('809021b82d6f4b6b945a999f6784a150', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-17 02:23:05', null, '2', '1');
INSERT INTO `sys_log` VALUES ('80aaece96c4c4831bb5e9444a1d7ddc0', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-17 01:05:57', null, '2', '1');
INSERT INTO `sys_log` VALUES ('8182af31835544e5a72a669cfff12790', null, null, '用户列表', '6', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-18 00:55:07', null, '2', '1');
INSERT INTO `sys_log` VALUES ('81997b27908c4d448b969e756db53165', null, null, '角色列表', '13', 'com.fast.admin.web.SysRoleController.page()', null, '127.0.0.1', '2018-09-18 22:14:28', null, '2', '1');
INSERT INTO `sys_log` VALUES ('825950ffe265419aba250ae00064fa48', null, null, '修改性别', '7', 'com.fast.admin.web.SysUserController.sex()', null, '127.0.0.1', '2018-09-17 22:39:48', null, '2', '1');
INSERT INTO `sys_log` VALUES ('82b8fefb428845e38c0ad4fa61204e07', null, null, '修改性别', '7', 'com.fast.admin.web.SysUserController.sex()', null, '127.0.0.1', '2018-09-17 22:46:06', null, '2', '1');
INSERT INTO `sys_log` VALUES ('82d51cbe7c5244ef8f94af0dcd51ca1f', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-18 01:15:06', null, '2', '1');
INSERT INTO `sys_log` VALUES ('82ff0677cc864a478307102f84d6eb1b', null, null, '用户列表', '5', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('83499bce4ee5461b9c2b0122d29f0add', null, null, '修改性别', '5', 'com.fast.admin.web.SysUserController.sex()', null, '127.0.0.1', '2018-09-17 22:46:15', null, '2', '1');
INSERT INTO `sys_log` VALUES ('834f7d9043a1450d9c9e4b059ef3f0be', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-17 23:14:47', null, '2', '1');
INSERT INTO `sys_log` VALUES ('8350faa38a6f462a84af585195f62dc1', null, null, '用户列表', '8', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('83b1b2180e904570bf2cce1e33ab829e', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-17 22:59:19', null, '2', '1');
INSERT INTO `sys_log` VALUES ('856007f405b64cc6abc9f2172fd6ff66', null, null, '用户列表', '8', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-17 01:41:37', null, '2', '1');
INSERT INTO `sys_log` VALUES ('8571baf0a37a45c88153957e4c10bdc6', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-17 01:40:06', null, '2', '1');
INSERT INTO `sys_log` VALUES ('8635ded9735a408294bc89aa1824e61f', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-17 22:26:06', null, '2', '1');
INSERT INTO `sys_log` VALUES ('86702a14f7e4442c8d713fabd7d439be', null, null, '角色列表', '6', 'com.fast.admin.web.SysRoleController.page()', null, '127.0.0.1', '2018-09-18 02:12:51', null, '2', '1');
INSERT INTO `sys_log` VALUES ('86c34763bd2640d3ada621ed5296461e', null, null, '获取登录信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('86d52e2a306145c58aa8fb23df1c3864', null, null, '获取登录信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('8703754bc27e462781251e437b6a2d11', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-18 01:12:59', null, '2', '1');
INSERT INTO `sys_log` VALUES ('8761c5e28489406aa21b36f9dfbcfd5f', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-17 02:25:30', null, '2', '1');
INSERT INTO `sys_log` VALUES ('878ac0cd217245e48c288380fe933012', null, null, '获取登录信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('883cb16769c74bddb0546ea2ed595165', null, null, '登录', '173', 'com.fast.admin.web.LoginController.login()', null, '127.0.0.1', '2018-09-17 01:19:05', null, '2', '1');
INSERT INTO `sys_log` VALUES ('8878763d116f4274baa66dcfae0aa84d', null, null, '用户列表', '9', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-17 23:14:49', null, '2', '1');
INSERT INTO `sys_log` VALUES ('88db760aaa0c41fa98aa1efc8c581b7c', null, null, '修改性别', '9', 'com.fast.admin.web.SysUserController.status()', null, '127.0.0.1', '2018-09-17 22:34:47', null, '2', '1');
INSERT INTO `sys_log` VALUES ('8915feab3f51429e9a22f1f44fbcd133', null, null, '获取登录信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('899335b6b97d4f6ab84274a299962500', null, null, '获取登录信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-15 21:14:21', null, '2', '1');
INSERT INTO `sys_log` VALUES ('89a6f99d2740421fa783ceece0b92110', null, null, '用户列表', '6', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('8a1e36fe9ab5494f954cd89a7fff409a', null, null, '用户列表', '5', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('8aff6f0ac42649858e576b15cf63076f', null, null, '用户列表', '8', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-18 02:05:07', null, '2', '1');
INSERT INTO `sys_log` VALUES ('8b0d2a6dc34e404185e6d92000b5eaa0', null, null, '用户列表', '5', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('8bcddf47620f428ca4c163f089340613', null, null, '登录', '3851', 'com.fast.admin.web.LoginController.login()', null, '127.0.0.1', '2018-09-17 00:50:59', null, '2', '1');
INSERT INTO `sys_log` VALUES ('8c59801d4cf8464f8efed1bdbb351373', null, null, '登录', '3173', 'com.fast.admin.web.LoginController.login()', null, '127.0.0.1', '2018-09-17 00:55:05', null, '2', '1');
INSERT INTO `sys_log` VALUES ('8d224c805bbc46e2a544a89ae9b93614', null, null, '获取登录信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('8d4c0eb3521544d58e75130746ae88f5', null, null, '用户列表', '8', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('8d6a167461c04259803d66e5e3c28cfe', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-18 22:17:50', null, '2', '1');
INSERT INTO `sys_log` VALUES ('8d7b22dfaf4e4f4fa70293d7af5f26d1', null, null, '登录', '33', 'com.fast.admin.web.LoginController.login()', null, '127.0.0.1', '2018-09-19 00:08:02', null, '2', '1');
INSERT INTO `sys_log` VALUES ('8de0e4aecda04539a724002d4bfc5801', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-19 00:08:02', null, '2', '1');
INSERT INTO `sys_log` VALUES ('8de58c522c804a95b63f622ce3444b84', null, null, '用户列表', '6', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('8def1b08f3ec4454b4db80b1ae6e4ba7', null, null, '登录', '171', 'com.fast.admin.web.LoginController.login()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('8e0fc695350e474586c2b85ae2d4793d', null, null, '用户列表', '6', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-17 02:26:57', null, '2', '1');
INSERT INTO `sys_log` VALUES ('8ebce20d1dd44e878019437b9e85cba6', null, null, '用户列表', '11', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-17 23:00:04', null, '2', '1');
INSERT INTO `sys_log` VALUES ('8ef75142d5444a549dcc265f5aae55fc', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-18 02:12:31', null, '2', '1');
INSERT INTO `sys_log` VALUES ('8f66a04f71604290ae891713d3cf20f9', null, null, '用户列表', '6', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-17 02:23:47', null, '2', '1');
INSERT INTO `sys_log` VALUES ('8fe50e216cba458fb3c0a593354ee3be', null, null, '登录', '2088', 'com.fast.admin.web.LoginController.login()', null, '127.0.0.1', '2018-09-17 00:52:50', null, '2', '1');
INSERT INTO `sys_log` VALUES ('904fa4ef0a7046e9973c2e33abf63e78', null, null, '获取登录信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('9059e209fbef4f7296d92f31e5ef599f', null, null, '用户列表', '6', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-18 00:55:08', null, '2', '1');
INSERT INTO `sys_log` VALUES ('921ae5a6a23842b18b364231db23211e', null, null, '修改性别', '9', 'com.fast.admin.web.SysUserController.sex()', null, '127.0.0.1', '2018-09-17 22:39:49', null, '2', '1');
INSERT INTO `sys_log` VALUES ('92d98a1891a844f9ae7966352f0d1cc6', null, null, '修改性别', '9', 'com.fast.admin.web.SysUserController.sex()', null, '127.0.0.1', '2018-09-17 22:27:49', null, '2', '1');
INSERT INTO `sys_log` VALUES ('93ca5063859c4ba3a6df7f85981dff50', null, null, '用户列表', '4', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('94103ce5f7094f5c9d065d9c91aaf630', null, null, '用户列表', '5', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-17 02:22:36', null, '2', '1');
INSERT INTO `sys_log` VALUES ('944cb772db514f48be35b0de93439d0b', null, null, '用户列表', '7', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('94f6a71e587d4454b7ac5bd31ca9b6f0', null, null, '用户列表', '10', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('95086d297e8944939929130b9d2c2207', null, null, '修改性别', '10', 'com.fast.admin.web.SysUserController.status()', null, '127.0.0.1', '2018-09-18 00:54:51', null, '2', '1');
INSERT INTO `sys_log` VALUES ('954334f347c04ffbab8dcfd1ea692182', null, null, '用户列表', '69', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-19 00:03:23', null, '2', '1');
INSERT INTO `sys_log` VALUES ('954e4d84427a4bf9935847689cdb92c9', null, null, '用户列表', '6', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('963be688c4ad4cbcae954575f60c7f9b', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-18 02:14:02', null, '2', '1');
INSERT INTO `sys_log` VALUES ('96501ec9ad1d41418389bc6de8fc8e75', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-17 22:33:48', null, '2', '1');
INSERT INTO `sys_log` VALUES ('96d007f6d0d140d38b2816476dc167b4', null, null, '获取登录信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('9738fc2e0133492e9e4133aa47d2e5bd', null, null, '登录', '25', 'com.fast.admin.web.LoginController.login()', null, '127.0.0.1', '2018-09-17 23:14:47', null, '2', '1');
INSERT INTO `sys_log` VALUES ('97edc3017ef24f5fafc7eb28a4cb3637', null, null, '修改性别', '6', 'com.fast.admin.web.SysUserController.sex()', null, '127.0.0.1', '2018-09-17 22:39:50', null, '2', '1');
INSERT INTO `sys_log` VALUES ('9861c664810d41338b9b22e657f391ec', null, null, '用户列表', '6', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-18 00:55:06', null, '2', '1');
INSERT INTO `sys_log` VALUES ('98fc0eef1cdb4fcdb4bd11ab62630b3c', null, null, '用户列表', '284', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-17 22:04:19', null, '2', '1');
INSERT INTO `sys_log` VALUES ('993cff021a1e4aef821a585cf84ae160', null, null, '用户列表', '6', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('994aca08e756438cab8ca55b4dea9d34', null, null, '用户列表', '8', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-17 22:26:09', null, '2', '1');
INSERT INTO `sys_log` VALUES ('998885fdbff347118972860df7a52be2', null, null, '用户列表', '5', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('99945fc3bf0d428a9853da902c8b1aaa', null, null, '角色列表', '8', 'com.fast.admin.web.SysRoleController.page()', null, '127.0.0.1', '2018-09-18 02:04:31', null, '2', '1');
INSERT INTO `sys_log` VALUES ('9996793738594105bd212413047705b2', null, null, '用户列表', '7', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-18 02:12:45', null, '2', '1');
INSERT INTO `sys_log` VALUES ('99f023d412fe42058fc1aab51b524895', null, null, '用户列表', '6', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-18 01:21:24', null, '2', '1');
INSERT INTO `sys_log` VALUES ('9a04a33f54fb4cbbb56b1f53f73d66a8', null, null, '角色列表', '5', 'com.fast.admin.web.SysRoleController.page()', null, '127.0.0.1', '2018-09-18 02:14:15', null, '2', '1');
INSERT INTO `sys_log` VALUES ('9a1c814aacbb4a0e817f6d1eb3e082db', null, null, '获取登录信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('9a7c59f750cf42ab8e93e2c80bbdec0a', null, null, '用户列表', '83', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('9a8446e2ba724ab29b86e8e4eb20133e', null, null, '用户列表', '9', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('9add51ca41164adb963e4a1ee77a5d2a', null, null, '获取登录信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('9ae3faacb7184c19bc3fbfee394ee78d', null, null, '登录', '28', 'com.fast.admin.web.LoginController.login()', null, '127.0.0.1', '2018-09-17 01:05:56', null, '2', '1');
INSERT INTO `sys_log` VALUES ('9b5ba7927c1945628a88af63faf8256e', null, null, '用户列表', '8', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-17 02:17:39', null, '2', '1');
INSERT INTO `sys_log` VALUES ('9b69a9f6120c480f945badefc12ec33b', null, null, '获取登录信息', '1', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('9bf77c8f39214be8881368d45f545f53', null, null, '用户列表', '7', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('9c16220ba0854f42a78c943c507c476b', null, null, '修改性别', '11', 'com.fast.admin.web.SysUserController.sex()', null, '127.0.0.1', '2018-09-17 22:56:53', null, '2', '1');
INSERT INTO `sys_log` VALUES ('9c97cf4b84864a549d7da30fe381b427', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-17 22:56:28', null, '2', '1');
INSERT INTO `sys_log` VALUES ('9ce0ea99278f419ea11c24fe9b82ba8b', null, null, '登录', '22', 'com.fast.admin.web.LoginController.login()', null, '127.0.0.1', '2018-09-17 22:27:07', null, '2', '1');
INSERT INTO `sys_log` VALUES ('9da70ad6af134f2b9aa25c44821efd5b', null, null, '用户列表', '12', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-17 22:59:38', null, '2', '1');
INSERT INTO `sys_log` VALUES ('9db0e2ee13314e0b96c7d0161fcf51eb', null, null, '登录', '142', 'com.fast.admin.web.LoginController.login()', null, '127.0.0.1', '2018-09-18 22:48:37', null, '2', '1');
INSERT INTO `sys_log` VALUES ('9fc98063072c4025ba169059ac85daaf', null, null, '登录', '30', 'com.fast.admin.web.LoginController.login()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('a041dbbf8386493a99f219ca8d4457b9', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-18 00:54:53', null, '2', '1');
INSERT INTO `sys_log` VALUES ('a1335ce8b8ac4fc7a2164cb7eabdb897', null, null, '用户列表', '8', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('a22a42d49d3044a59f4b91410bac24b5', null, null, '用户列表', '5', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('a2b44a9bd8614a098f7f9a219ee9a021', null, null, '用户列表', '7', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-18 02:10:09', null, '2', '1');
INSERT INTO `sys_log` VALUES ('a38739cd75cc4e4d9f2f4bd29743b777', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-18 01:41:44', null, '2', '1');
INSERT INTO `sys_log` VALUES ('a43f6c8e8fa34dd69ceb34eb5b20decd', null, null, '用户列表', '7', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-15 21:14:48', null, '2', '1');
INSERT INTO `sys_log` VALUES ('a4d745b245c44996a59482b941e136f6', null, null, '用户添加', '6', 'com.fast.admin.web.SysUserController.add()', null, '127.0.0.1', '2018-09-15 21:15:12', null, '2', '1');
INSERT INTO `sys_log` VALUES ('a549ad6f3a894c6f920ceee4fca4f1f1', null, null, '修改性别', '8', 'com.fast.admin.web.SysUserController.sex()', null, '127.0.0.1', '2018-09-18 02:13:56', null, '2', '1');
INSERT INTO `sys_log` VALUES ('a58f214abd734d0bad6f4fa87762128c', null, null, '用户列表', '8', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-17 23:00:13', null, '2', '1');
INSERT INTO `sys_log` VALUES ('a592eda20cce43319c33c1ff429b22a4', null, null, '登录', '7', 'com.fast.admin.web.LoginController.login()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('a65862352f0c419ba8e41e590257ad12', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-17 01:02:10', null, '2', '1');
INSERT INTO `sys_log` VALUES ('a67f4badbb5c4f90b7475bb6829ef221', null, null, '用户列表', '5', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-17 23:02:36', null, '2', '1');
INSERT INTO `sys_log` VALUES ('a72924ef1d5349b7b40236a8c01c1741', null, null, '用户列表', '13', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('a73467a3288e4dc4b46524a5c72fba11', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-18 01:19:08', null, '2', '1');
INSERT INTO `sys_log` VALUES ('a7813814d978451c93ad55b2f3585bba', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-17 23:00:57', null, '2', '1');
INSERT INTO `sys_log` VALUES ('a7b3970a953b4b97a0e70957090941f2', null, null, '用户列表', '8', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-17 02:09:56', null, '2', '1');
INSERT INTO `sys_log` VALUES ('a80f0843aa1643a78c3c9e236e8355c1', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-18 01:09:48', null, '2', '1');
INSERT INTO `sys_log` VALUES ('a83e32d0943543449df30c74804c3645', null, null, '修改性别', '8', 'com.fast.admin.web.SysUserController.sex()', null, '127.0.0.1', '2018-09-17 22:27:47', null, '2', '1');
INSERT INTO `sys_log` VALUES ('a8bca747036849e98e801d68c505de31', null, null, '用户列表', '6', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('a8e398a383de415fbe1eef728ea3c808', null, null, '获取登录信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('a8f45ea5c60449338fe053553512815e', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-17 22:37:12', null, '2', '1');
INSERT INTO `sys_log` VALUES ('a9f9dff49ec5486b9d2eae42afd74692', null, null, '角色列表', '6', 'com.fast.admin.web.SysRoleController.page()', null, '127.0.0.1', '2018-09-18 02:10:10', null, '2', '1');
INSERT INTO `sys_log` VALUES ('aafbf6af64dd43af9d09fb5addae31d3', null, null, '用户删除', '22', 'com.fast.admin.web.SysUserController.add()', null, '127.0.0.1', '2018-09-15 21:07:21', null, '2', '1');
INSERT INTO `sys_log` VALUES ('ab3e6515d58f43069926d58774677ea2', null, null, '获取登录信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('ab920284b09342d782e66b56f430f7c9', null, null, '用户列表', '6', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-18 00:55:10', null, '2', '1');
INSERT INTO `sys_log` VALUES ('ac2602d74da6455295e713ef64731a00', null, null, '用户列表', '16', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-17 01:59:07', null, '2', '1');
INSERT INTO `sys_log` VALUES ('ac39995eefdb476d947acecbae73518c', null, null, '登录', '30', 'com.fast.admin.web.LoginController.login()', null, '127.0.0.1', '2018-09-17 23:06:57', null, '2', '1');
INSERT INTO `sys_log` VALUES ('acdfed7c03634886aa2829f90fa10096', null, null, '用户列表', '7', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('ad245d6dd7714a5cb5068e08cef7920e', null, null, '获取登录信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('ad305c6feb7f45f7a6402efa55b65613', null, null, '用户列表', '7', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-18 02:10:06', null, '2', '1');
INSERT INTO `sys_log` VALUES ('ad9391021d4544d3974be1b7876e6d15', null, null, '登录', '6', 'com.fast.admin.web.LoginController.login()', null, '127.0.0.1', '2018-09-17 00:55:12', null, '2', '1');
INSERT INTO `sys_log` VALUES ('ae2addb9346f4245b47474b71dd16561', null, null, '角色列表', '14', 'com.fast.admin.web.SysRoleController.page()', null, '127.0.0.1', '2018-09-18 02:09:41', null, '2', '1');
INSERT INTO `sys_log` VALUES ('ae6318e766944d56a5c7e71a6196e528', null, null, '获取登录信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('af3ccd9208a44ac8bf404a449f98a6b2', null, null, '登录', '416', 'com.fast.admin.web.LoginController.login()', null, '127.0.0.1', '2018-09-18 02:04:14', null, '2', '1');
INSERT INTO `sys_log` VALUES ('af557c5f73f4446ab08fb08c195141bd', null, null, '用户列表', '6', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('b094abcf048349409092a4af602ae2a4', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-17 23:03:22', null, '2', '1');
INSERT INTO `sys_log` VALUES ('b12e5579998f45a78a077189464fcbce', null, null, '用户列表', '24', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-15 21:15:18', null, '2', '1');
INSERT INTO `sys_log` VALUES ('b14b232b832348d29663935aaea4c358', null, null, '获取登录信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('b17a424a389e496fa149eb48c537650e', null, null, '获取登录信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('b2eb2113f55643cd9aea17ac91bc226a', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-17 02:26:43', null, '2', '1');
INSERT INTO `sys_log` VALUES ('b348d2821f2b4acd9cb9e4b56bb3f2db', null, null, '登录', '27', 'com.fast.admin.web.LoginController.login()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('b3fba221c9974e4a8f541aa69eb65035', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-17 21:57:21', null, '2', '1');
INSERT INTO `sys_log` VALUES ('b42db0929e9d4f1d995179f85a1f7b28', null, null, '修改性别', '7', 'com.fast.admin.web.SysUserController.sex()', null, '127.0.0.1', '2018-09-17 22:39:47', null, '2', '1');
INSERT INTO `sys_log` VALUES ('b494d1172b0f4ebf92a5f997ea1d83e6', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-18 01:18:53', null, '2', '1');
INSERT INTO `sys_log` VALUES ('b54c523afbac4ef5a5832c226042e29b', null, null, '用户列表', '70', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-17 01:24:49', null, '2', '1');
INSERT INTO `sys_log` VALUES ('b5e5666798f14bc49ca17ef7966be371', null, null, '获取登录信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('b644cffb4477448b903bc8d2e8149a1f', null, null, '用户列表', '6', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('b65f921a5b4b4d18959db1cc158cb25a', null, null, '用户列表', '6', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-17 22:37:12', null, '2', '1');
INSERT INTO `sys_log` VALUES ('b66bf09397fe4a8aa2420434f349c29c', null, null, '用户列表', '12', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-18 00:53:56', null, '2', '1');
INSERT INTO `sys_log` VALUES ('b6d1c1abeb004d8d8e84105680aa8af9', null, null, '用户列表', '6', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-18 01:21:57', null, '2', '1');
INSERT INTO `sys_log` VALUES ('b7023711b4b54e898c0f712f26ab5c0b', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-18 01:08:34', null, '2', '1');
INSERT INTO `sys_log` VALUES ('b721f3764d864a5f9c9f5c809c01a22b', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-17 22:56:51', null, '2', '1');
INSERT INTO `sys_log` VALUES ('b77900e8108c470887d5b64d2b6e0915', null, null, '用户列表', '6', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-17 22:40:37', null, '2', '1');
INSERT INTO `sys_log` VALUES ('b7d9f24c939c4e5d8617491082eec75c', null, null, '登录', '159', 'com.fast.admin.web.LoginController.login()', null, '127.0.0.1', '2018-09-18 23:10:22', null, '2', '1');
INSERT INTO `sys_log` VALUES ('b7f28eb07efe4df89c99bad4a805aa92', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-17 01:04:06', null, '2', '1');
INSERT INTO `sys_log` VALUES ('b864fd4256c541e2a73bec8156e5955c', null, null, '用户列表', '18', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-15 21:07:09', null, '2', '1');
INSERT INTO `sys_log` VALUES ('b8bc77887c6248fc8cc1ea35d70a3cb5', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-17 02:27:56', null, '2', '1');
INSERT INTO `sys_log` VALUES ('b8d62943fe744428bc05f6f9249bb45a', null, null, '用户列表', '6', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('ba88dbc9a5a14d1b8fcd65ec90cb38b5', null, null, '用户列表', '6', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('bace266927534bd99b1e1066ef3ef0d9', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-18 01:21:11', null, '2', '1');
INSERT INTO `sys_log` VALUES ('bb0febda48444a038268cea8cdffc28c', null, null, '获取登录用户信息', '1', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-18 01:14:42', null, '2', '1');
INSERT INTO `sys_log` VALUES ('bba72e0e918f4c4ebda5dd72b751ecef', null, null, '用户列表', '6', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-17 22:27:34', null, '2', '1');
INSERT INTO `sys_log` VALUES ('be5bdf4ffd30438d9c4133547096ada3', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-18 01:15:20', null, '2', '1');
INSERT INTO `sys_log` VALUES ('be90b6ee174a4a5b9f2fd4e4c436efc3', null, null, '用户列表', '7', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-17 23:00:03', null, '2', '1');
INSERT INTO `sys_log` VALUES ('bee87393ab3548ce9fdf5be72e348605', null, null, '用户列表', '8', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-18 00:54:50', null, '2', '1');
INSERT INTO `sys_log` VALUES ('bf20b0ea29d1448e810542dbcc19eb32', null, null, '角色列表', '8', 'com.fast.admin.web.SysRoleController.page()', null, '127.0.0.1', '2018-09-18 02:10:01', null, '2', '1');
INSERT INTO `sys_log` VALUES ('bf4b6e428a2549428fe4bb77c1bbf039', null, null, '修改性别', '10', 'com.fast.admin.web.SysUserController.status()', null, '127.0.0.1', '2018-09-17 22:56:03', null, '2', '1');
INSERT INTO `sys_log` VALUES ('bf62d647d9f440239d870cc76e64fb6d', null, null, '获取登录信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('c02140b02014419581b86b54c67fe9e1', null, null, '用户列表', '6', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-17 23:00:06', null, '2', '1');
INSERT INTO `sys_log` VALUES ('c099695d445e4c95a5bee72e200d9760', null, null, '获取登录用户信息', '1', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-18 01:15:29', null, '2', '1');
INSERT INTO `sys_log` VALUES ('c0e0749cf2a44538b247784f893d8a7e', null, null, '修改性别', '10', 'com.fast.admin.web.SysUserController.status()', null, '127.0.0.1', '2018-09-18 00:53:49', null, '2', '1');
INSERT INTO `sys_log` VALUES ('c0e92ba0d71741ceb27757c708163d99', null, null, '用户列表', '8', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('c168c0a899264861bea8a985734e3349', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-18 01:12:16', null, '2', '1');
INSERT INTO `sys_log` VALUES ('c18135dd78554435bd504c58acfbf7ff', null, null, '用户列表', '6', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-17 02:27:56', null, '2', '1');
INSERT INTO `sys_log` VALUES ('c26ebf3384044ed4bbda72fee0debfd0', null, null, '获取登录信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('c2a77b0b35fb445fac77c851fa299798', null, null, '用户列表', '72', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-18 00:51:03', null, '2', '1');
INSERT INTO `sys_log` VALUES ('c2b80627805f43ea8f6e44d759b30895', null, null, '用户列表', '5', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-17 22:43:24', null, '2', '1');
INSERT INTO `sys_log` VALUES ('c2c848c6444046a29639a4e5865a7509', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-18 00:39:07', null, '2', '1');
INSERT INTO `sys_log` VALUES ('c2e4d79a1f91419aba0a9a1103ebd245', null, null, '修改性别', '9', 'com.fast.admin.web.SysUserController.sex()', null, '127.0.0.1', '2018-09-18 02:13:56', null, '2', '1');
INSERT INTO `sys_log` VALUES ('c3e6f14936cb48f297946f76bf1ea6eb', null, null, '根据id查询', '3', 'com.fast.admin.web.SysUserController.get()', null, '127.0.0.1', '2018-09-17 23:01:44', null, '2', '1');
INSERT INTO `sys_log` VALUES ('c415e599b7ca4a05bfe5b28d3c22abd2', null, null, '登录', '162', 'com.fast.admin.web.LoginController.login()', null, '127.0.0.1', '2018-09-18 21:50:08', null, '2', '1');
INSERT INTO `sys_log` VALUES ('c473e3de10444a83bc83bb1baf11b16d', null, null, '用户列表', '7', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('c4a31944de0e42079d15807738ce5c8f', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-17 02:05:58', null, '2', '1');
INSERT INTO `sys_log` VALUES ('c4d7d317dcd942329954b0e2ef40a5e6', null, null, '角色列表', '6', 'com.fast.admin.web.SysRoleController.page()', null, '127.0.0.1', '2018-09-18 02:10:05', null, '2', '1');
INSERT INTO `sys_log` VALUES ('c55c817a6f6543e7b6536a26cf0cba50', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-17 01:41:22', null, '2', '1');
INSERT INTO `sys_log` VALUES ('c59e8245b1904708a1a7d4bb9f00e05f', null, null, '用户列表', '8', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-17 01:14:07', null, '2', '1');
INSERT INTO `sys_log` VALUES ('c67f068182ae4ffa9a2dd1c7ee2f2549', null, null, '用户列表', '6', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('c6de1a3e1df14dfd895076a5ed1b0e19', null, null, '用户列表', '10', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-18 02:10:13', null, '2', '1');
INSERT INTO `sys_log` VALUES ('c6ec856d027641bc9448c82cc1e48aeb', null, null, '登录', '190', 'com.fast.admin.web.LoginController.login()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('c710ea3d630b47dab0414e7e68c78219', null, null, '角色列表', '4', 'com.fast.admin.web.SysRoleController.page()', null, '127.0.0.1', '2018-09-18 02:10:14', null, '2', '1');
INSERT INTO `sys_log` VALUES ('c83ba506b823451b85823a4c24ec14a4', null, null, '根据id查询', '4', 'com.fast.admin.web.SysUserController.get()', null, '127.0.0.1', '2018-09-17 23:02:47', null, '2', '1');
INSERT INTO `sys_log` VALUES ('c8cfe3f074b447cb9a2d2814ecef54a5', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-17 02:10:39', null, '2', '1');
INSERT INTO `sys_log` VALUES ('c8d3657c2da649e0ab2608781fb5b88f', null, null, '用户列表', '8', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('c932ac6e38004e1b842eec14f64f9c8f', null, null, '修改性别', '6', 'com.fast.admin.web.SysUserController.sex()', null, '127.0.0.1', '2018-09-17 22:39:47', null, '2', '1');
INSERT INTO `sys_log` VALUES ('c99af8a6d5474d359aa899e9e40ef5f9', null, null, '用户列表', '7', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-17 23:00:00', null, '2', '1');
INSERT INTO `sys_log` VALUES ('ca347d5eb8c2405da29898b5ec1712a8', null, null, '角色列表', '5', 'com.fast.admin.web.SysRoleController.page()', null, '127.0.0.1', '2018-09-18 02:12:31', null, '2', '1');
INSERT INTO `sys_log` VALUES ('ca64b618996e4520832edf040518ebc2', null, null, '获取登录信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('cac11ecc034d46ac9e3296c870eff3aa', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-18 22:55:55', null, '2', '1');
INSERT INTO `sys_log` VALUES ('cad27ed378774bc8a8f57446b250342f', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-18 21:50:09', null, '2', '1');
INSERT INTO `sys_log` VALUES ('caf37035c15d4919b083af583fe88837', null, null, '获取登录信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('cbd2e89c440d405d8d4c288a133bc906', null, null, '用户列表', '296', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-17 03:34:55', null, '2', '1');
INSERT INTO `sys_log` VALUES ('cc4e09c88c634936a01aeff5fbf3bd2d', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-18 01:19:50', null, '2', '1');
INSERT INTO `sys_log` VALUES ('cc62eddff59446e39323fa4e32b8671c', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-17 02:12:09', null, '2', '1');
INSERT INTO `sys_log` VALUES ('ccb5cddf1a874343be2b019d7c05d3bf', null, null, '修改性别', '8', 'com.fast.admin.web.SysUserController.sex()', null, '127.0.0.1', '2018-09-17 22:27:48', null, '2', '1');
INSERT INTO `sys_log` VALUES ('cd1371c164534ef892bf5d54ae61cc28', null, null, '角色列表', '9', 'com.fast.admin.web.SysRoleController.page()', null, '127.0.0.1', '2018-09-18 02:09:43', null, '2', '1');
INSERT INTO `sys_log` VALUES ('cde2cc5ae8d440688486f11f76213ab4', null, null, '用户列表', '7', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-18 00:55:05', null, '2', '1');
INSERT INTO `sys_log` VALUES ('cde5f3c3e02e4ff5b18f1bec64408274', null, null, '用户列表', '7', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-17 02:23:05', null, '2', '1');
INSERT INTO `sys_log` VALUES ('ce0ce98430664f7485ccd526a96921da', null, null, '修改性别', '9', 'com.fast.admin.web.SysUserController.sex()', null, '127.0.0.1', '2018-09-17 22:39:42', null, '2', '1');
INSERT INTO `sys_log` VALUES ('ce4b3e5d48434ad699e2bf479b179296', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-17 01:55:08', null, '2', '1');
INSERT INTO `sys_log` VALUES ('ce657ea496fc483ea25fc5c026025cee', null, null, '用户列表', '8', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-17 22:56:51', null, '2', '1');
INSERT INTO `sys_log` VALUES ('ce92a31655f742eeafab6f598913f6ce', null, null, '登录', '26', 'com.fast.admin.web.LoginController.login()', null, '127.0.0.1', '2018-09-17 02:10:53', null, '2', '1');
INSERT INTO `sys_log` VALUES ('cf60c39a1696485999aea98aedd4bca6', null, null, '获取登录信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-15 21:07:23', null, '2', '1');
INSERT INTO `sys_log` VALUES ('cf88c70f818f420a9900017f02f2e1ab', null, null, '角色列表', '7', 'com.fast.admin.web.SysRoleController.page()', null, '127.0.0.1', '2018-09-18 02:04:35', null, '2', '1');
INSERT INTO `sys_log` VALUES ('d0eda32bfb8e480cbe977c45a7695eb6', null, null, '获取登录信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('d1a81587ea9d43b1b5f27e517147975b', null, null, '用户列表', '7', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('d20968fce2624a74987edead2bfb6701', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-17 01:41:06', null, '2', '1');
INSERT INTO `sys_log` VALUES ('d212d55a956b45989f59f5066e8c5989', null, null, '登录', '2058', 'com.fast.admin.web.LoginController.login()', null, '127.0.0.1', '2018-09-17 00:54:18', null, '2', '1');
INSERT INTO `sys_log` VALUES ('d230fa6a5ff541f0a0ee6bf69ea01d8e', null, null, '用户列表', '7', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-18 00:55:03', null, '2', '1');
INSERT INTO `sys_log` VALUES ('d273f079ee304b9dbcb12d1d7ca194d4', null, null, '用户列表', '6', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-18 02:10:12', null, '2', '1');
INSERT INTO `sys_log` VALUES ('d2fe5fb39b314541a37597269509de3f', null, null, '获取登录信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('d34764d9a0234165a812ba6d7518ccfd', null, null, '获取登录信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('d37bf59348734797b8bdb346b05f2951', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-17 01:59:03', null, '2', '1');
INSERT INTO `sys_log` VALUES ('d437d286da284caa894da55e8ab0d4b3', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-18 01:21:57', null, '2', '1');
INSERT INTO `sys_log` VALUES ('d540e4de0895437fbc1bda7b5cf8864f', null, null, '用户列表', '7', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('d5e20d0819234b11b90d6aaec2d0c970', null, null, '修改性别', '8', 'com.fast.admin.web.SysUserController.sex()', null, '127.0.0.1', '2018-09-17 22:46:05', null, '2', '1');
INSERT INTO `sys_log` VALUES ('d5e44eb911cb42c3a91ea066b854ceaa', null, null, '用户列表', '6', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-17 02:23:43', null, '2', '1');
INSERT INTO `sys_log` VALUES ('d6339740743540c0907067ebdd8799e2', null, null, '用户列表', '7', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-18 00:55:02', null, '2', '1');
INSERT INTO `sys_log` VALUES ('d6afa423c67d4185a239ec39a7e0028a', null, null, '用户列表', '8', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('d74025dc485347729e4c3e583739bc8a', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-17 22:33:40', null, '2', '1');
INSERT INTO `sys_log` VALUES ('d77c5fc39df843938ce4f3c1da61b730', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-17 02:12:02', null, '2', '1');
INSERT INTO `sys_log` VALUES ('d783a405b0b14affbd0c64c2f29dca91', null, null, '修改性别', '9', 'com.fast.admin.web.SysUserController.sex()', null, '127.0.0.1', '2018-09-17 22:27:52', null, '2', '1');
INSERT INTO `sys_log` VALUES ('d7873c88b8504736a02422dc4618fce6', null, null, '用户列表', '8', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-18 01:15:20', null, '2', '1');
INSERT INTO `sys_log` VALUES ('d810001aada6442daf633c9f606d7c03', null, null, '用户列表', '10', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-17 02:12:04', null, '2', '1');
INSERT INTO `sys_log` VALUES ('d815bf766f804bcd80055f4af9b39ad0', null, null, '根据id查询', '7', 'com.fast.admin.web.SysUserController.get()', null, '127.0.0.1', '2018-09-18 00:46:51', null, '2', '1');
INSERT INTO `sys_log` VALUES ('d8230121446a440dab3e1dcb7ea0e4c7', null, null, '登录', '164', 'com.fast.admin.web.LoginController.login()', null, '127.0.0.1', '2018-09-17 01:24:07', null, '2', '1');
INSERT INTO `sys_log` VALUES ('d8527038f6e84a2284013cbd5b6ee5c5', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-18 22:53:29', null, '2', '1');
INSERT INTO `sys_log` VALUES ('d85f56bca99748ed88ceb5f835f829d1', null, null, '修改性别', '10', 'com.fast.admin.web.SysUserController.sex()', null, '127.0.0.1', '2018-09-17 22:56:54', null, '2', '1');
INSERT INTO `sys_log` VALUES ('d8fa6cd47fde4c418bea22a73a3620bd', null, null, '获取登录信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-15 21:13:02', null, '2', '1');
INSERT INTO `sys_log` VALUES ('d9ed51b0beb9409ba59cafe0b70f34fb', null, null, '角色列表', '6', 'com.fast.admin.web.SysRoleController.page()', null, '127.0.0.1', '2018-09-18 02:10:11', null, '2', '1');
INSERT INTO `sys_log` VALUES ('da64ad05da4c46d0af4f06f5753a9e08', null, null, '获取登录信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('dbe6ebb0306a41fe8f0793225b2fe772', null, null, '登录', '161', 'com.fast.admin.web.LoginController.login()', null, '127.0.0.1', '2018-09-18 22:19:53', null, '2', '1');
INSERT INTO `sys_log` VALUES ('dbeff073206a4d17bab41c3e63e22ae0', null, null, '用户列表', '5', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-18 02:14:10', null, '2', '1');
INSERT INTO `sys_log` VALUES ('dc29b17e81794405a8f72f06e1a20ed6', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-17 01:19:06', null, '2', '1');
INSERT INTO `sys_log` VALUES ('dccbc916b0b74eb39aaa5fcb037fbf44', null, null, '用户列表', '10', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('dd62d3721be742228475dee58afc9360', null, null, '登录', '4235', 'com.fast.admin.web.LoginController.login()', null, '127.0.0.1', '2018-09-17 00:55:07', null, '2', '1');
INSERT INTO `sys_log` VALUES ('de7701f0e9b946c79970b28a16b9be0e', null, null, '用户列表', '89', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('dea7eb54c422416890f2af64c81487c3', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-17 01:40:46', null, '2', '1');
INSERT INTO `sys_log` VALUES ('dedbf26add064c36bba1aa74bca9fb92', null, null, '用户列表', '66', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-18 00:46:49', null, '2', '1');
INSERT INTO `sys_log` VALUES ('dfd94f7712f945ada17dff0309b8bfdd', null, null, '用户列表', '8', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-17 02:12:15', null, '2', '1');
INSERT INTO `sys_log` VALUES ('e08fce668b3146bb89df5b33b7e4d59c', null, null, '用户列表', '9', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-18 02:10:04', null, '2', '1');
INSERT INTO `sys_log` VALUES ('e0ceb9e736294a5eb66ddbf78b36b5fd', null, null, '用户列表', '10', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('e0f668dfe8a749eead362028844158ab', null, null, '登录', '163', 'com.fast.admin.web.LoginController.login()', null, '127.0.0.1', '2018-09-17 03:34:50', null, '2', '1');
INSERT INTO `sys_log` VALUES ('e10fe577ee89449eaca35866b6ec882e', null, null, '获取登录信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('e144d59ac49448c183c316e0b3a8ab05', null, null, '用户添加', '6', 'com.fast.admin.web.SysUserController.add()', null, '127.0.0.1', '2018-09-17 22:59:38', null, '2', '1');
INSERT INTO `sys_log` VALUES ('e1d2e2489d9b493d927bdbb06f4f2173', null, null, '用户列表', '9', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('e1e31cdc151548e5bd31af4dd871a47d', null, null, '登录', '36', 'com.fast.admin.web.LoginController.login()', null, '127.0.0.1', '2018-09-18 00:39:06', null, '2', '1');
INSERT INTO `sys_log` VALUES ('e25a59f978384b96903f37a5aed2668f', null, null, '用户列表', '11', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('e26bb6eea6e144bc9575c9f8e80ac6d9', null, null, '根据id查询', '4', 'com.fast.admin.web.SysUserController.get()', null, '127.0.0.1', '2018-09-17 23:07:42', null, '2', '1');
INSERT INTO `sys_log` VALUES ('e3036f8388db4911b085db18ecd83b9a', null, null, '用户列表', '7', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('e3ea909f300b48c68e954a6853dac551', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-18 00:52:21', null, '2', '1');
INSERT INTO `sys_log` VALUES ('e40ae2faf4f04d47be0a1c9cfe8dc70f', null, null, '获取登录信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('e499081272ac43c7855f365274ed8372', null, null, '登录', '28', 'com.fast.admin.web.LoginController.login()', null, '127.0.0.1', '2018-09-17 01:02:09', null, '2', '1');
INSERT INTO `sys_log` VALUES ('e5645e330bf74ca49ba03bade91b9f07', null, null, '用户列表', '6', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-18 00:55:01', null, '2', '1');
INSERT INTO `sys_log` VALUES ('e5a03d65d5ef45229627229951efbfad', null, null, '用户列表', '7', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('e68c9850ddb14c04a20b13a0284bbffe', null, null, '根据id查询', '5', 'com.fast.admin.web.SysUserController.get()', null, '127.0.0.1', '2018-09-17 23:14:52', null, '2', '1');
INSERT INTO `sys_log` VALUES ('e6e4d7acd4b14ed88e77edb8bf412625', null, null, '登录', '3047', 'com.fast.admin.web.LoginController.login()', null, '127.0.0.1', '2018-09-17 22:48:15', null, '2', '1');
INSERT INTO `sys_log` VALUES ('e772aeceaa764cda863510dd4f969ef4', null, null, '角色列表', '72', 'com.fast.admin.web.SysRoleController.page()', null, '127.0.0.1', '2018-09-18 02:04:16', null, '2', '1');
INSERT INTO `sys_log` VALUES ('e7af8ff2020a49ce88dbf61c57ee3bfd', null, null, '角色列表', '8', 'com.fast.admin.web.SysRoleController.page()', null, '127.0.0.1', '2018-09-18 02:04:30', null, '2', '1');
INSERT INTO `sys_log` VALUES ('e872abf6d629459abd0f6239df40b591', null, null, '用户列表', '9', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-17 02:07:45', null, '2', '1');
INSERT INTO `sys_log` VALUES ('e8b0abbffce0473ea652c33c4046744a', null, null, '修改性别', '7', 'com.fast.admin.web.SysUserController.sex()', null, '127.0.0.1', '2018-09-17 22:39:43', null, '2', '1');
INSERT INTO `sys_log` VALUES ('e96011e33e7c4eebb562e8dee3a303ab', null, null, '获取登录信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('ea333b5395884a3f9fb2eeea092c8d04', null, null, '获取登录信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('ea57779371f8422c8e48308cf7e33a41', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-17 01:13:42', null, '2', '1');
INSERT INTO `sys_log` VALUES ('ebf0e38f133f4374a6866a58049c0b6e', null, null, '修改性别', '7', 'com.fast.admin.web.SysUserController.sex()', null, '127.0.0.1', '2018-09-17 22:39:48', null, '2', '1');
INSERT INTO `sys_log` VALUES ('ec946da15ef042efb3964d78acb5724e', null, null, '根据id查询', '4', 'com.fast.admin.web.SysUserController.get()', null, '127.0.0.1', '2018-09-17 23:00:37', null, '2', '1');
INSERT INTO `sys_log` VALUES ('ecda220f9fa34cf086b78468e713f2eb', null, null, '用户列表', '7', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-17 02:10:03', null, '2', '1');
INSERT INTO `sys_log` VALUES ('ee6c1f5addff479795a0b3966f8f1662', null, null, '登录', '298', 'com.fast.admin.web.LoginController.login()', null, '127.0.0.1', '2018-09-17 21:57:20', null, '2', '1');
INSERT INTO `sys_log` VALUES ('ee7115da2f624ba7b13150c114c71285', null, null, '角色列表', '8', 'com.fast.admin.web.SysRoleController.page()', null, '127.0.0.1', '2018-09-18 02:04:27', null, '2', '1');
INSERT INTO `sys_log` VALUES ('eecad0748e3a420f966518664694aff4', null, null, '用户列表', '7', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-17 22:59:22', null, '2', '1');
INSERT INTO `sys_log` VALUES ('efafb8c67a914913abe52e895dfd268b', null, null, '角色列表', '8', 'com.fast.admin.web.SysRoleController.page()', null, '127.0.0.1', '2018-09-18 02:09:56', null, '2', '1');
INSERT INTO `sys_log` VALUES ('f0a16baaded74d9d9809c86d46978230', null, null, '用户列表', '6', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('f0db12121f504b73b27b9f581cdaaf66', null, null, '获取登录信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('f20698d2e110486fb6c73f5af672abb3', null, null, '用户列表', '67', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-17 01:19:39', null, '2', '1');
INSERT INTO `sys_log` VALUES ('f2714f014e984e35b0c1886d6270b403', null, null, '用户列表', '7', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('f29fdaa1048b448d9f3a5629dea97eff', null, null, '用户批量删除', '13', 'com.fast.admin.web.SysUserController.add()', null, '127.0.0.1', '2018-09-17 01:59:07', null, '2', '1');
INSERT INTO `sys_log` VALUES ('f2a329d64d914dd9bde88674914596b5', null, null, '用户列表', '5', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('f2b488fef32e46e99837c6883a9c823f', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-18 02:12:56', null, '2', '1');
INSERT INTO `sys_log` VALUES ('f304c86c297e4c92bd868ca1556d92e7', null, null, '用户列表', '5', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-17 22:33:49', null, '2', '1');
INSERT INTO `sys_log` VALUES ('f34372f657f6442ea30928bfd867623d', null, null, '根据id查询', '4', 'com.fast.admin.web.SysUserController.get()', null, '127.0.0.1', '2018-09-17 23:07:05', null, '2', '1');
INSERT INTO `sys_log` VALUES ('f40d5e1a31694806b08282f946762e14', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-17 03:34:50', null, '2', '1');
INSERT INTO `sys_log` VALUES ('f4a45238300e4a05b37cef3511b0d723', null, null, '获取登录信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('f4b5753c6d4f454b8acd4238b3d05c6d', null, null, '用户列表', '17', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-18 02:12:35', null, '2', '1');
INSERT INTO `sys_log` VALUES ('f4c81ae196eb42a5bd319045aad0081f', null, null, '用户列表', '9', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-17 01:04:14', null, '2', '1');
INSERT INTO `sys_log` VALUES ('f4d078a7dd904b698b6b5ce339529ed9', null, null, '修改性别', '8', 'com.fast.admin.web.SysUserController.sex()', null, '127.0.0.1', '2018-09-17 22:39:47', null, '2', '1');
INSERT INTO `sys_log` VALUES ('f5fce83300c5419a8004c89151c5e1a0', null, null, '获取登录信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('f61d829510204e54b4d24ec823d3633e', null, null, '修改性别', '8', 'com.fast.admin.web.SysUserController.sex()', null, '127.0.0.1', '2018-09-17 22:39:44', null, '2', '1');
INSERT INTO `sys_log` VALUES ('f72767dfac9e4d47a9f3d4662d9d8de4', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-17 22:55:04', null, '2', '1');
INSERT INTO `sys_log` VALUES ('f74863b4bbbb4e3798490c28cf892dbc', null, null, '修改性别', '8', 'com.fast.admin.web.SysUserController.sex()', null, '127.0.0.1', '2018-09-17 22:39:44', null, '2', '1');
INSERT INTO `sys_log` VALUES ('f782ad72bf1a477daeef9d2b9e1f97c2', null, null, '用户列表', '67', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('f7c859bf4c1d47f1b348524f7272afdd', null, null, '登录', '2686', 'com.fast.admin.web.LoginController.login()', null, '127.0.0.1', '2018-09-17 00:52:29', null, '2', '1');
INSERT INTO `sys_log` VALUES ('f7c9434c7e7a490caa5600add9613baa', null, null, '角色列表', '4', 'com.fast.admin.web.SysRoleController.page()', null, '127.0.0.1', '2018-09-18 02:14:17', null, '2', '1');
INSERT INTO `sys_log` VALUES ('f847e5a315dd4abf93ce2792758ba04a', null, null, '登录', '502', 'com.fast.admin.web.LoginController.login()', null, '127.0.0.1', '2018-09-18 22:53:28', null, '2', '1');
INSERT INTO `sys_log` VALUES ('f864a154b7674c3fa23a4f7b0083a91e', null, null, '获取登录用户信息', '1', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-17 23:06:58', null, '2', '1');
INSERT INTO `sys_log` VALUES ('f90433b3e1534b2fa18dec5ed7eae83b', null, null, '获取登录信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('f94938fd6a234d258396bc51c43a81dd', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-17 01:41:39', null, '2', '1');
INSERT INTO `sys_log` VALUES ('fa65c7ef430a4783b770cbb0ae316e8f', null, null, '获取登录信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('fa68acd1cb324daa9d20942e85cc81c0', null, null, '获取登录信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('fc02c5e343774e3a919086e6c8ea7288', null, null, '用户列表', '6', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-17 02:17:32', null, '2', '1');
INSERT INTO `sys_log` VALUES ('fd6d4707b91c4dc3a2c484ad73e79c2c', null, null, '用户列表', '6', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-18 01:21:26', null, '2', '1');
INSERT INTO `sys_log` VALUES ('febb4ac57f704f67be68eaf4385ba6c3', null, null, '获取登录用户信息', '0', 'com.fast.admin.web.HomeController.login()', null, '127.0.0.1', '2018-09-18 00:52:05', null, '2', '1');
INSERT INTO `sys_log` VALUES ('fee7f292f60c48b2b009f7e355f8f179', null, null, '用户列表', '7', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', '2018-09-17 01:41:39', null, '2', '1');
INSERT INTO `sys_log` VALUES ('fef69aa99f0c4715ac846c23f0dcd17e', null, null, '角色列表', '6', 'com.fast.admin.web.SysRoleController.page()', null, '127.0.0.1', '2018-09-18 02:05:10', null, '2', '1');
INSERT INTO `sys_log` VALUES ('ff4b69412c014abcaa9ce1abb91b4468', null, null, '用户列表', '6', 'com.fast.admin.web.SysUserController.page()', null, '127.0.0.1', null, null, '2', '1');
INSERT INTO `sys_log` VALUES ('ff98c3a38a4a4877a17058a76484e118', null, null, '修改性别', '17', 'com.fast.admin.web.SysUserController.sex()', null, '127.0.0.1', '2018-09-17 22:27:47', null, '2', '1');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(11) DEFAULT NULL COMMENT '类型     0：目录  1：菜单   2：按钮   ',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  `create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) NOT NULL DEFAULT '2' COMMENT '是否删除 1是 2否',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '版本号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=181 DEFAULT CHARSET=utf8 COMMENT='菜单管理';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '0', '基础管理', '', '', '0', 'fa fa-bars', '0', null, null, '2', '1');
INSERT INTO `sys_menu` VALUES ('2', '3', '系统菜单', 'sys/menu/', 'sys:menu:menu', '1', 'fa fa-th-list', '2', null, null, '2', '1');
INSERT INTO `sys_menu` VALUES ('3', '0', '系统管理', null, null, '0', 'fa fa-desktop', '1', null, null, '2', '1');
INSERT INTO `sys_menu` VALUES ('6', '3', '用户管理', 'sys/user/', 'sys:user:user', '1', 'fa fa-user', '0', null, null, '2', '1');
INSERT INTO `sys_menu` VALUES ('7', '3', '角色管理', 'sys/role', 'sys:role:role', '1', 'fa fa-paw', '1', null, null, '2', '1');
INSERT INTO `sys_menu` VALUES ('12', '6', '新增', '', 'sys:user:add', '2', '', '0', null, null, '2', '1');
INSERT INTO `sys_menu` VALUES ('13', '6', '编辑', '', 'sys:user:edit', '2', '', '0', null, null, '2', '1');
INSERT INTO `sys_menu` VALUES ('14', '6', '删除', null, 'sys:user:remove', '2', null, '0', null, null, '2', '1');
INSERT INTO `sys_menu` VALUES ('15', '7', '新增', '', 'sys:role:add', '2', '', '0', null, null, '2', '1');
INSERT INTO `sys_menu` VALUES ('20', '2', '新增', '', 'sys:menu:add', '2', '', '0', null, null, '2', '1');
INSERT INTO `sys_menu` VALUES ('21', '2', '编辑', '', 'sys:menu:edit', '2', '', '0', null, null, '2', '1');
INSERT INTO `sys_menu` VALUES ('22', '2', '删除', '', 'sys:menu:remove', '2', '', '0', null, null, '2', '1');
INSERT INTO `sys_menu` VALUES ('24', '6', '批量删除', '', 'sys:user:batchRemove', '2', '', '0', null, null, '2', '1');
INSERT INTO `sys_menu` VALUES ('25', '6', '停用', null, 'sys:user:disable', '2', null, '0', null, null, '2', '1');
INSERT INTO `sys_menu` VALUES ('26', '6', '重置密码', '', 'sys:user:resetPwd', '2', '', '0', null, null, '2', '1');
INSERT INTO `sys_menu` VALUES ('27', '91', '系统日志', 'common/log', 'common:log', '1', 'fa fa-warning', '0', null, null, '2', '1');
INSERT INTO `sys_menu` VALUES ('28', '27', '刷新', null, 'sys:log:list', '2', null, '0', null, null, '2', '1');
INSERT INTO `sys_menu` VALUES ('29', '27', '删除', null, 'sys:log:remove', '2', null, '0', null, null, '2', '1');
INSERT INTO `sys_menu` VALUES ('30', '27', '清空', null, 'sys:log:clear', '2', null, '0', null, null, '2', '1');
INSERT INTO `sys_menu` VALUES ('48', '77', '代码生成', 'common/generator', 'common:generator', '1', 'fa fa-code', '3', null, null, '2', '1');
INSERT INTO `sys_menu` VALUES ('55', '7', '编辑', '', 'sys:role:edit', '2', '', null, null, null, '2', '1');
INSERT INTO `sys_menu` VALUES ('56', '7', '删除', '', 'sys:role:remove', '2', null, null, null, null, '2', '1');
INSERT INTO `sys_menu` VALUES ('57', '91', '运行监控', '/druid/index.html', '', '1', 'fa fa-caret-square-o-right', '1', null, null, '2', '1');
INSERT INTO `sys_menu` VALUES ('61', '2', '批量删除', '', 'sys:menu:batchRemove', '2', null, null, null, null, '2', '1');
INSERT INTO `sys_menu` VALUES ('62', '7', '批量删除', '', 'sys:role:batchRemove', '2', null, null, null, null, '2', '1');
INSERT INTO `sys_menu` VALUES ('71', '1', '文件管理', '/common/sysFile', 'common:sysFile:sysFile', '1', 'fa fa-folder-open', '2', null, null, '2', '1');
INSERT INTO `sys_menu` VALUES ('72', '77', '计划任务', 'common/job', 'common:taskScheduleJob', '1', 'fa fa-hourglass-1', '4', null, null, '2', '1');
INSERT INTO `sys_menu` VALUES ('73', '3', '部门管理', '/sys/dept', 'system:sysDept:sysDept', '1', 'fa fa-users', '3', null, null, '2', '1');
INSERT INTO `sys_menu` VALUES ('74', '73', '增加', '/sys/dept/add', 'system:sysDept:add', '2', null, '1', null, null, '2', '1');
INSERT INTO `sys_menu` VALUES ('75', '73', '刪除', 'sys/dept/remove', 'system:sysDept:remove', '2', null, '2', null, null, '2', '1');
INSERT INTO `sys_menu` VALUES ('76', '73', '编辑', '/sys/dept/edit', 'system:sysDept:edit', '2', null, '3', null, null, '2', '1');
INSERT INTO `sys_menu` VALUES ('77', '0', '系统工具', '', '', '0', 'fa fa-gear', '4', null, null, '2', '1');
INSERT INTO `sys_menu` VALUES ('78', '1', '数据字典', '/common/sysDict', 'common:sysDict:sysDict', '1', 'fa fa-book', '1', null, null, '2', '1');
INSERT INTO `sys_menu` VALUES ('79', '78', '增加', '/common/sysDict/add', 'common:sysDict:add', '2', null, '2', null, null, '2', '1');
INSERT INTO `sys_menu` VALUES ('80', '78', '编辑', '/common/sysDict/edit', 'common:sysDict:edit', '2', null, '2', null, null, '2', '1');
INSERT INTO `sys_menu` VALUES ('81', '78', '删除', '/common/sysDict/remove', 'common:sysDict:remove', '2', '', '3', null, null, '2', '1');
INSERT INTO `sys_menu` VALUES ('83', '78', '批量删除', '/common/sysDict/batchRemove', 'common:sysDict:batchRemove', '2', '', '4', null, null, '2', '1');
INSERT INTO `sys_menu` VALUES ('91', '0', '系统监控', '', '', '0', 'fa fa-video-camera', '5', null, null, '2', '1');
INSERT INTO `sys_menu` VALUES ('92', '91', '在线用户', 'sys/online', '', '1', 'fa fa-user', null, null, null, '2', '1');
INSERT INTO `sys_menu` VALUES ('97', '0', '图表管理', '', '', '0', 'fa fa-bar-chart', '7', null, null, '2', '1');
INSERT INTO `sys_menu` VALUES ('98', '97', '百度chart', '/chart/graph_echarts.html', '', '1', 'fa fa-area-chart', null, null, null, '2', '1');
INSERT INTO `sys_menu` VALUES ('151', '1', '公司信息管理', '/sign/appCompany', null, '1', 'fa fa-file-code-o', '6', null, null, '2', '1');
INSERT INTO `sys_menu` VALUES ('152', '151', '查看', null, 'sign:appCompany:appCompany', '2', null, '6', null, null, '2', '1');
INSERT INTO `sys_menu` VALUES ('153', '151', '新增', null, 'sign:appCompany:add', '2', null, '6', null, null, '2', '1');
INSERT INTO `sys_menu` VALUES ('154', '151', '修改', null, 'sign:appCompany:edit', '2', null, '6', null, null, '2', '1');
INSERT INTO `sys_menu` VALUES ('155', '151', '删除', null, 'sign:appCompany:remove', '2', null, '6', null, null, '2', '1');
INSERT INTO `sys_menu` VALUES ('156', '151', '批量删除', null, 'sign:appCompany:batchRemove', '2', null, '6', null, null, '2', '1');
INSERT INTO `sys_menu` VALUES ('157', '1', '出差管理', '/sign/appOutWork', null, '1', 'fa fa-file-code-o', '6', null, null, '2', '1');
INSERT INTO `sys_menu` VALUES ('158', '157', '查看', null, 'sign:appOutWork:appOutWork', '2', null, '6', null, null, '2', '1');
INSERT INTO `sys_menu` VALUES ('159', '157', '新增', null, 'sign:appOutWork:add', '2', null, '6', null, null, '2', '1');
INSERT INTO `sys_menu` VALUES ('160', '157', '修改', null, 'sign:appOutWork:edit', '2', null, '6', null, null, '2', '1');
INSERT INTO `sys_menu` VALUES ('161', '157', '删除', null, 'sign:appOutWork:remove', '2', null, '6', null, null, '2', '1');
INSERT INTO `sys_menu` VALUES ('162', '157', '批量删除', null, 'sign:appOutWork:batchRemove', '2', null, '6', null, null, '2', '1');
INSERT INTO `sys_menu` VALUES ('163', '1', '考勤管理', '/sign/appSign', null, '1', 'fa fa-file-code-o', '6', null, null, '2', '1');
INSERT INTO `sys_menu` VALUES ('164', '163', '查看', null, 'sign:appSign:appSign', '2', null, '6', null, null, '2', '1');
INSERT INTO `sys_menu` VALUES ('165', '163', '新增', null, 'sign:appSign:add', '2', null, '6', null, null, '2', '1');
INSERT INTO `sys_menu` VALUES ('166', '163', '修改', null, 'sign:appSign:edit', '2', null, '6', null, null, '2', '1');
INSERT INTO `sys_menu` VALUES ('167', '163', '删除', null, 'sign:appSign:remove', '2', null, '6', null, null, '2', '1');
INSERT INTO `sys_menu` VALUES ('168', '163', '批量删除', null, 'sign:appSign:batchRemove', '2', null, '6', null, null, '2', '1');
INSERT INTO `sys_menu` VALUES ('169', '1', '员工管理', '/sign/appUser', null, '1', 'fa fa-file-code-o', '6', null, null, '2', '1');
INSERT INTO `sys_menu` VALUES ('170', '169', '查看', null, 'sign:appUser:appUser', '2', null, '6', null, null, '2', '1');
INSERT INTO `sys_menu` VALUES ('171', '169', '新增', null, 'sign:appUser:add', '2', null, '6', null, null, '2', '1');
INSERT INTO `sys_menu` VALUES ('172', '169', '修改', null, 'sign:appUser:edit', '2', null, '6', null, null, '2', '1');
INSERT INTO `sys_menu` VALUES ('173', '169', '删除', null, 'sign:appUser:remove', '2', null, '6', null, null, '2', '1');
INSERT INTO `sys_menu` VALUES ('174', '169', '批量删除', null, 'sign:appUser:batchRemove', '2', null, '6', null, null, '2', '1');
INSERT INTO `sys_menu` VALUES ('175', '1', '系统配置', '/common/config', null, '1', 'fa fa-file-code-o', '6', null, null, '2', '1');
INSERT INTO `sys_menu` VALUES ('176', '175', '查看', null, 'common:config:config', '2', null, '6', null, null, '2', '1');
INSERT INTO `sys_menu` VALUES ('177', '175', '新增', null, 'common:config:add', '2', null, '6', null, null, '2', '1');
INSERT INTO `sys_menu` VALUES ('178', '175', '修改', null, 'common:config:edit', '2', null, '6', null, null, '2', '1');
INSERT INTO `sys_menu` VALUES ('179', '175', '删除', null, 'common:config:remove', '2', null, '6', null, null, '2', '1');
INSERT INTO `sys_menu` VALUES ('180', '175', '批量删除', null, 'common:config:batchRemove', '2', null, '6', null, null, '2', '1');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` varchar(36) CHARACTER SET utf8mb4 NOT NULL,
  `role_name` varchar(80) DEFAULT NULL COMMENT '角色名称',
  `role_sign` varchar(80) DEFAULT NULL COMMENT '角色标识',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `create_user_id` varchar(36) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '创建人',
  `create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) NOT NULL DEFAULT '2' COMMENT '是否删除 1是 2否',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '版本号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('admin', '超级用户角色', 'admin', '超级管理员', null, '2018-09-18 00:57:30', null, '2', '1');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` varchar(36) NOT NULL,
  `role_id` varchar(36) DEFAULT NULL COMMENT '角色ID',
  `menu_id` varchar(36) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色与菜单对应关系';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('1064', '54', '53');
INSERT INTO `sys_role_menu` VALUES ('1095', '55', '2');
INSERT INTO `sys_role_menu` VALUES ('1096', '55', '6');
INSERT INTO `sys_role_menu` VALUES ('1097', '55', '7');
INSERT INTO `sys_role_menu` VALUES ('1098', '55', '3');
INSERT INTO `sys_role_menu` VALUES ('1099', '55', '50');
INSERT INTO `sys_role_menu` VALUES ('1100', '55', '49');
INSERT INTO `sys_role_menu` VALUES ('1101', '55', '1');
INSERT INTO `sys_role_menu` VALUES ('1856', '53', '28');
INSERT INTO `sys_role_menu` VALUES ('1857', '53', '29');
INSERT INTO `sys_role_menu` VALUES ('1858', '53', '30');
INSERT INTO `sys_role_menu` VALUES ('1859', '53', '27');
INSERT INTO `sys_role_menu` VALUES ('1860', '53', '57');
INSERT INTO `sys_role_menu` VALUES ('1861', '53', '71');
INSERT INTO `sys_role_menu` VALUES ('1862', '53', '48');
INSERT INTO `sys_role_menu` VALUES ('1863', '53', '72');
INSERT INTO `sys_role_menu` VALUES ('1864', '53', '1');
INSERT INTO `sys_role_menu` VALUES ('1865', '53', '7');
INSERT INTO `sys_role_menu` VALUES ('1866', '53', '55');
INSERT INTO `sys_role_menu` VALUES ('1867', '53', '56');
INSERT INTO `sys_role_menu` VALUES ('1868', '53', '62');
INSERT INTO `sys_role_menu` VALUES ('1869', '53', '15');
INSERT INTO `sys_role_menu` VALUES ('1870', '53', '2');
INSERT INTO `sys_role_menu` VALUES ('1871', '53', '61');
INSERT INTO `sys_role_menu` VALUES ('1872', '53', '20');
INSERT INTO `sys_role_menu` VALUES ('1873', '53', '21');
INSERT INTO `sys_role_menu` VALUES ('1874', '53', '22');
INSERT INTO `sys_role_menu` VALUES ('2247', '63', '-1');
INSERT INTO `sys_role_menu` VALUES ('2248', '63', '84');
INSERT INTO `sys_role_menu` VALUES ('2249', '63', '85');
INSERT INTO `sys_role_menu` VALUES ('2250', '63', '88');
INSERT INTO `sys_role_menu` VALUES ('2251', '63', '87');
INSERT INTO `sys_role_menu` VALUES ('2252', '64', '84');
INSERT INTO `sys_role_menu` VALUES ('2253', '64', '89');
INSERT INTO `sys_role_menu` VALUES ('2254', '64', '88');
INSERT INTO `sys_role_menu` VALUES ('2255', '64', '87');
INSERT INTO `sys_role_menu` VALUES ('2256', '64', '86');
INSERT INTO `sys_role_menu` VALUES ('2257', '64', '85');
INSERT INTO `sys_role_menu` VALUES ('2258', '65', '89');
INSERT INTO `sys_role_menu` VALUES ('2259', '65', '88');
INSERT INTO `sys_role_menu` VALUES ('2260', '65', '86');
INSERT INTO `sys_role_menu` VALUES ('2262', '67', '48');
INSERT INTO `sys_role_menu` VALUES ('2263', '68', '88');
INSERT INTO `sys_role_menu` VALUES ('2264', '68', '87');
INSERT INTO `sys_role_menu` VALUES ('2265', '69', '89');
INSERT INTO `sys_role_menu` VALUES ('2266', '69', '88');
INSERT INTO `sys_role_menu` VALUES ('2267', '69', '86');
INSERT INTO `sys_role_menu` VALUES ('2268', '69', '87');
INSERT INTO `sys_role_menu` VALUES ('2269', '69', '85');
INSERT INTO `sys_role_menu` VALUES ('2270', '69', '84');
INSERT INTO `sys_role_menu` VALUES ('2271', '70', '85');
INSERT INTO `sys_role_menu` VALUES ('2272', '70', '89');
INSERT INTO `sys_role_menu` VALUES ('2273', '70', '88');
INSERT INTO `sys_role_menu` VALUES ('2274', '70', '87');
INSERT INTO `sys_role_menu` VALUES ('2275', '70', '86');
INSERT INTO `sys_role_menu` VALUES ('2276', '70', '84');
INSERT INTO `sys_role_menu` VALUES ('2277', '71', '87');
INSERT INTO `sys_role_menu` VALUES ('2278', '72', '59');
INSERT INTO `sys_role_menu` VALUES ('2279', '73', '48');
INSERT INTO `sys_role_menu` VALUES ('2280', '74', '88');
INSERT INTO `sys_role_menu` VALUES ('2281', '74', '87');
INSERT INTO `sys_role_menu` VALUES ('2282', '75', '88');
INSERT INTO `sys_role_menu` VALUES ('2283', '75', '87');
INSERT INTO `sys_role_menu` VALUES ('2284', '76', '85');
INSERT INTO `sys_role_menu` VALUES ('2285', '76', '89');
INSERT INTO `sys_role_menu` VALUES ('2286', '76', '88');
INSERT INTO `sys_role_menu` VALUES ('2287', '76', '87');
INSERT INTO `sys_role_menu` VALUES ('2288', '76', '86');
INSERT INTO `sys_role_menu` VALUES ('2289', '76', '84');
INSERT INTO `sys_role_menu` VALUES ('2292', '78', '88');
INSERT INTO `sys_role_menu` VALUES ('2293', '78', '87');
INSERT INTO `sys_role_menu` VALUES ('2294', '78', null);
INSERT INTO `sys_role_menu` VALUES ('2295', '78', null);
INSERT INTO `sys_role_menu` VALUES ('2296', '78', null);
INSERT INTO `sys_role_menu` VALUES ('2308', '80', '87');
INSERT INTO `sys_role_menu` VALUES ('2309', '80', '86');
INSERT INTO `sys_role_menu` VALUES ('2310', '80', '-1');
INSERT INTO `sys_role_menu` VALUES ('2311', '80', '84');
INSERT INTO `sys_role_menu` VALUES ('2312', '80', '85');
INSERT INTO `sys_role_menu` VALUES ('2328', '79', '72');
INSERT INTO `sys_role_menu` VALUES ('2329', '79', '48');
INSERT INTO `sys_role_menu` VALUES ('2330', '79', '77');
INSERT INTO `sys_role_menu` VALUES ('2331', '79', '84');
INSERT INTO `sys_role_menu` VALUES ('2332', '79', '89');
INSERT INTO `sys_role_menu` VALUES ('2333', '79', '88');
INSERT INTO `sys_role_menu` VALUES ('2334', '79', '87');
INSERT INTO `sys_role_menu` VALUES ('2335', '79', '86');
INSERT INTO `sys_role_menu` VALUES ('2336', '79', '85');
INSERT INTO `sys_role_menu` VALUES ('2337', '79', '-1');
INSERT INTO `sys_role_menu` VALUES ('2338', '77', '89');
INSERT INTO `sys_role_menu` VALUES ('2339', '77', '88');
INSERT INTO `sys_role_menu` VALUES ('2340', '77', '87');
INSERT INTO `sys_role_menu` VALUES ('2341', '77', '86');
INSERT INTO `sys_role_menu` VALUES ('2342', '77', '85');
INSERT INTO `sys_role_menu` VALUES ('2343', '77', '84');
INSERT INTO `sys_role_menu` VALUES ('2344', '77', '72');
INSERT INTO `sys_role_menu` VALUES ('2345', '77', '-1');
INSERT INTO `sys_role_menu` VALUES ('2346', '77', '77');
INSERT INTO `sys_role_menu` VALUES ('3178', '56', '68');
INSERT INTO `sys_role_menu` VALUES ('3179', '56', '60');
INSERT INTO `sys_role_menu` VALUES ('3180', '56', '59');
INSERT INTO `sys_role_menu` VALUES ('3181', '56', '58');
INSERT INTO `sys_role_menu` VALUES ('3182', '56', '51');
INSERT INTO `sys_role_menu` VALUES ('3183', '56', '50');
INSERT INTO `sys_role_menu` VALUES ('3184', '56', '49');
INSERT INTO `sys_role_menu` VALUES ('3185', '56', '-1');
INSERT INTO `sys_role_menu` VALUES ('367', '44', '1');
INSERT INTO `sys_role_menu` VALUES ('368', '44', '32');
INSERT INTO `sys_role_menu` VALUES ('369', '44', '33');
INSERT INTO `sys_role_menu` VALUES ('370', '44', '34');
INSERT INTO `sys_role_menu` VALUES ('371', '44', '35');
INSERT INTO `sys_role_menu` VALUES ('372', '44', '28');
INSERT INTO `sys_role_menu` VALUES ('373', '44', '29');
INSERT INTO `sys_role_menu` VALUES ('374', '44', '30');
INSERT INTO `sys_role_menu` VALUES ('375', '44', '38');
INSERT INTO `sys_role_menu` VALUES ('376', '44', '4');
INSERT INTO `sys_role_menu` VALUES ('377', '44', '27');
INSERT INTO `sys_role_menu` VALUES ('378', '45', '38');
INSERT INTO `sys_role_menu` VALUES ('379', '46', '3');
INSERT INTO `sys_role_menu` VALUES ('380', '46', '20');
INSERT INTO `sys_role_menu` VALUES ('381', '46', '21');
INSERT INTO `sys_role_menu` VALUES ('382', '46', '22');
INSERT INTO `sys_role_menu` VALUES ('383', '46', '23');
INSERT INTO `sys_role_menu` VALUES ('384', '46', '11');
INSERT INTO `sys_role_menu` VALUES ('385', '46', '12');
INSERT INTO `sys_role_menu` VALUES ('386', '46', '13');
INSERT INTO `sys_role_menu` VALUES ('387', '46', '14');
INSERT INTO `sys_role_menu` VALUES ('388', '46', '24');
INSERT INTO `sys_role_menu` VALUES ('389', '46', '25');
INSERT INTO `sys_role_menu` VALUES ('390', '46', '26');
INSERT INTO `sys_role_menu` VALUES ('391', '46', '15');
INSERT INTO `sys_role_menu` VALUES ('392', '46', '2');
INSERT INTO `sys_role_menu` VALUES ('393', '46', '6');
INSERT INTO `sys_role_menu` VALUES ('394', '46', '7');
INSERT INTO `sys_role_menu` VALUES ('4146', '57', '79');
INSERT INTO `sys_role_menu` VALUES ('4147', '57', '80');
INSERT INTO `sys_role_menu` VALUES ('4148', '57', '152');
INSERT INTO `sys_role_menu` VALUES ('4149', '57', '153');
INSERT INTO `sys_role_menu` VALUES ('4150', '57', '154');
INSERT INTO `sys_role_menu` VALUES ('4151', '57', '155');
INSERT INTO `sys_role_menu` VALUES ('4152', '57', '156');
INSERT INTO `sys_role_menu` VALUES ('4153', '57', '158');
INSERT INTO `sys_role_menu` VALUES ('4154', '57', '159');
INSERT INTO `sys_role_menu` VALUES ('4155', '57', '160');
INSERT INTO `sys_role_menu` VALUES ('4156', '57', '161');
INSERT INTO `sys_role_menu` VALUES ('4157', '57', '162');
INSERT INTO `sys_role_menu` VALUES ('4158', '57', '164');
INSERT INTO `sys_role_menu` VALUES ('4159', '57', '165');
INSERT INTO `sys_role_menu` VALUES ('4160', '57', '166');
INSERT INTO `sys_role_menu` VALUES ('4161', '57', '167');
INSERT INTO `sys_role_menu` VALUES ('4162', '57', '168');
INSERT INTO `sys_role_menu` VALUES ('4163', '57', '170');
INSERT INTO `sys_role_menu` VALUES ('4164', '57', '171');
INSERT INTO `sys_role_menu` VALUES ('4165', '57', '172');
INSERT INTO `sys_role_menu` VALUES ('4166', '57', '173');
INSERT INTO `sys_role_menu` VALUES ('4167', '57', '174');
INSERT INTO `sys_role_menu` VALUES ('4168', '57', '28');
INSERT INTO `sys_role_menu` VALUES ('4169', '57', '29');
INSERT INTO `sys_role_menu` VALUES ('4170', '57', '30');
INSERT INTO `sys_role_menu` VALUES ('4171', '57', '57');
INSERT INTO `sys_role_menu` VALUES ('4172', '57', '92');
INSERT INTO `sys_role_menu` VALUES ('4173', '57', '151');
INSERT INTO `sys_role_menu` VALUES ('4174', '57', '157');
INSERT INTO `sys_role_menu` VALUES ('4175', '57', '163');
INSERT INTO `sys_role_menu` VALUES ('4176', '57', '169');
INSERT INTO `sys_role_menu` VALUES ('4177', '57', '27');
INSERT INTO `sys_role_menu` VALUES ('4178', '57', '91');
INSERT INTO `sys_role_menu` VALUES ('4179', '57', '-1');
INSERT INTO `sys_role_menu` VALUES ('4180', '57', '1');
INSERT INTO `sys_role_menu` VALUES ('4181', '57', '78');
INSERT INTO `sys_role_menu` VALUES ('4262', '1', '71');
INSERT INTO `sys_role_menu` VALUES ('4263', '1', '79');
INSERT INTO `sys_role_menu` VALUES ('4264', '1', '80');
INSERT INTO `sys_role_menu` VALUES ('4265', '1', '81');
INSERT INTO `sys_role_menu` VALUES ('4266', '1', '83');
INSERT INTO `sys_role_menu` VALUES ('4267', '1', '20');
INSERT INTO `sys_role_menu` VALUES ('4268', '1', '21');
INSERT INTO `sys_role_menu` VALUES ('4269', '1', '22');
INSERT INTO `sys_role_menu` VALUES ('4270', '1', '61');
INSERT INTO `sys_role_menu` VALUES ('4271', '1', '12');
INSERT INTO `sys_role_menu` VALUES ('4272', '1', '13');
INSERT INTO `sys_role_menu` VALUES ('4273', '1', '14');
INSERT INTO `sys_role_menu` VALUES ('4274', '1', '24');
INSERT INTO `sys_role_menu` VALUES ('4275', '1', '25');
INSERT INTO `sys_role_menu` VALUES ('4276', '1', '26');
INSERT INTO `sys_role_menu` VALUES ('4277', '1', '15');
INSERT INTO `sys_role_menu` VALUES ('4278', '1', '55');
INSERT INTO `sys_role_menu` VALUES ('4279', '1', '56');
INSERT INTO `sys_role_menu` VALUES ('4280', '1', '62');
INSERT INTO `sys_role_menu` VALUES ('4281', '1', '74');
INSERT INTO `sys_role_menu` VALUES ('4282', '1', '75');
INSERT INTO `sys_role_menu` VALUES ('4283', '1', '76');
INSERT INTO `sys_role_menu` VALUES ('4284', '1', '48');
INSERT INTO `sys_role_menu` VALUES ('4285', '1', '72');
INSERT INTO `sys_role_menu` VALUES ('4286', '1', '28');
INSERT INTO `sys_role_menu` VALUES ('4287', '1', '29');
INSERT INTO `sys_role_menu` VALUES ('4288', '1', '30');
INSERT INTO `sys_role_menu` VALUES ('4289', '1', '57');
INSERT INTO `sys_role_menu` VALUES ('4290', '1', '92');
INSERT INTO `sys_role_menu` VALUES ('4291', '1', '78');
INSERT INTO `sys_role_menu` VALUES ('4292', '1', '2');
INSERT INTO `sys_role_menu` VALUES ('4293', '1', '6');
INSERT INTO `sys_role_menu` VALUES ('4294', '1', '7');
INSERT INTO `sys_role_menu` VALUES ('4295', '1', '73');
INSERT INTO `sys_role_menu` VALUES ('4296', '1', '3');
INSERT INTO `sys_role_menu` VALUES ('4297', '1', '77');
INSERT INTO `sys_role_menu` VALUES ('4298', '1', '27');
INSERT INTO `sys_role_menu` VALUES ('4299', '1', '91');
INSERT INTO `sys_role_menu` VALUES ('4300', '1', '175');
INSERT INTO `sys_role_menu` VALUES ('4301', '1', '176');
INSERT INTO `sys_role_menu` VALUES ('4302', '1', '177');
INSERT INTO `sys_role_menu` VALUES ('4303', '1', '178');
INSERT INTO `sys_role_menu` VALUES ('4304', '1', '179');
INSERT INTO `sys_role_menu` VALUES ('4305', '1', '180');
INSERT INTO `sys_role_menu` VALUES ('4306', '1', '-1');
INSERT INTO `sys_role_menu` VALUES ('4307', '1', '1');
INSERT INTO `sys_role_menu` VALUES ('598', '50', '38');
INSERT INTO `sys_role_menu` VALUES ('632', '38', '42');
INSERT INTO `sys_role_menu` VALUES ('737', '51', '38');
INSERT INTO `sys_role_menu` VALUES ('738', '51', '39');
INSERT INTO `sys_role_menu` VALUES ('739', '51', '40');
INSERT INTO `sys_role_menu` VALUES ('740', '51', '41');
INSERT INTO `sys_role_menu` VALUES ('741', '51', '4');
INSERT INTO `sys_role_menu` VALUES ('742', '51', '32');
INSERT INTO `sys_role_menu` VALUES ('743', '51', '33');
INSERT INTO `sys_role_menu` VALUES ('744', '51', '34');
INSERT INTO `sys_role_menu` VALUES ('745', '51', '35');
INSERT INTO `sys_role_menu` VALUES ('746', '51', '27');
INSERT INTO `sys_role_menu` VALUES ('747', '51', '28');
INSERT INTO `sys_role_menu` VALUES ('748', '51', '29');
INSERT INTO `sys_role_menu` VALUES ('749', '51', '30');
INSERT INTO `sys_role_menu` VALUES ('750', '51', '1');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` varchar(36) NOT NULL COMMENT '主键 uuid',
  `username` varchar(30) NOT NULL COMMENT '用户名',
  `password` varchar(80) DEFAULT NULL COMMENT '密码',
  `realname` varchar(30) DEFAULT NULL COMMENT '真实姓名',
  `sex` int(1) NOT NULL DEFAULT '1' COMMENT '性别 1男 2女',
  `dept_id` varchar(36) DEFAULT NULL COMMENT '部门id',
  `email` varchar(80) DEFAULT NULL COMMENT 'email',
  `mobile` varchar(255) DEFAULT NULL COMMENT '手机号',
  `status` int(1) NOT NULL DEFAULT '1' COMMENT '状态 1启用 2禁用',
  `birth` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '生日',
  `hobby` varchar(255) DEFAULT NULL COMMENT '爱好',
  `province` varchar(50) DEFAULT NULL COMMENT '省',
  `city` varchar(50) DEFAULT NULL COMMENT '市',
  `district` varchar(50) DEFAULT NULL COMMENT '县',
  `live_address` varchar(255) DEFAULT NULL COMMENT '居住地址',
  `create_user_id` varchar(36) DEFAULT NULL COMMENT '创建人',
  `create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) NOT NULL DEFAULT '2' COMMENT '是否删除 1是 2否',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '版本号',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('01f806e0b92142bb89f4b7691c23aa13', 'admin2', 'admin2', 'admin', '2', null, '575873200@qq.com', '18511893521', '1', '2018-09-17 22:33:37', null, null, null, null, null, null, '2018-09-17 22:33:37', '2018-09-18 02:13:56', '2', '47');
INSERT INTO `sys_user` VALUES ('0604eaf381834ac0b1d5325a6a3ec5f5', 'admin3', 'admin3', 'admin', '2', null, '4123231@qq.com', '12312312312', '1', '2018-09-17 22:54:51', null, null, null, null, null, null, '2018-09-17 22:54:51', '2018-09-18 02:13:55', '2', '16');
INSERT INTO `sys_user` VALUES ('3e5cef60bf984360a5b723571192ce3d', 'fdsafsda123', 'fdsafsda123', 'fdsafsda123', '2', null, 'fdsafsda123@qq.com', '12332123123', '1', null, null, null, null, null, null, null, '2018-09-18 22:23:53', null, '2', '1');
INSERT INTO `sys_user` VALUES ('810d95dbca0d4d758463c8a963b0840f', 'admin6', 'admin6', '444', '2', null, '1231@qq.com', '12312311231', '1', null, null, null, null, null, null, null, '2018-09-17 22:59:38', '2018-09-18 00:54:51', '2', '4');
INSERT INTO `sys_user` VALUES ('adee4f4fed1d4441a506a8fd1c313b1c', 'eeeee123', 'eeeee123', 'admineeeee123', '2', null, 'eeeee123@qq.com', '12312312321', '1', null, null, null, null, null, null, null, '2018-09-18 22:14:57', null, '2', '1');
INSERT INTO `sys_user` VALUES ('admin', 'admin', 'admin', 'test', '2', null, null, null, '1', '2018-09-13 07:32:00', null, null, null, null, null, null, '2018-09-13 07:32:00', '2018-07-16 17:42:38', '2', '15');
INSERT INTO `sys_user` VALUES ('d658e0b949a845149cfb8098709ea12b', 'string', 'string', 'string', '1', null, 'string', 'string', '1', null, null, null, null, null, null, null, '2018-09-18 22:51:11', null, '2', '1');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` varchar(36) CHARACTER SET utf8mb4 NOT NULL,
  `user_id` varchar(36) CHARACTER SET utf8mb4 NOT NULL COMMENT '用户ID',
  `role_id` varchar(36) CHARACTER SET utf8mb4 NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`),
  KEY `wfk_sys_user_role_user_id` (`user_id`),
  KEY `wfk_sys_user_role_role_id` (`role_id`),
  CONSTRAINT `wfk_sys_user_role_role_id` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`id`),
  CONSTRAINT `wfk_sys_user_role_user_id` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户与角色对应关系';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
