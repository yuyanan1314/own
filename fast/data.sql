/*
Navicat MySQL Data Transfer

Source Server         : 本地库
Source Server Version : 50721
Source Host           : 10.26.1.16:3306
Source Database       : yyn

Target Server Type    : MYSQL
Target Server Version : 50721
File Encoding         : 65001

Date: 2018-07-16 19:12:51
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `id` varchar(36) NOT NULL COMMENT 'id',
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
  `id` varchar(36) COLLATE utf8_bin NOT NULL COMMENT '编号',
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
  `id` varchar(36) NOT NULL,
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
  `id` varchar(36) NOT NULL,
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
INSERT INTO `sys_role` VALUES ('1', '超级用户角色', 'admin', '超级管理员', null, null, null, '2', '1');
INSERT INTO `sys_role` VALUES ('56', '普通用户', null, '普通用户', null, null, null, '2', '1');
INSERT INTO `sys_role` VALUES ('57', '签到系统', null, null, null, null, null, '2', '1');

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
  `sex` tinyint(1) DEFAULT '1' COMMENT '性别 1男 2女',
  `dept_id` varchar(36) DEFAULT NULL COMMENT '部门id',
  `email` varchar(80) DEFAULT NULL COMMENT 'email',
  `mobile` varchar(255) DEFAULT NULL COMMENT '手机号',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态 1启用 2禁用',
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
INSERT INTO `sys_user` VALUES ('8f3c1b01fe544ed99afc4c9f49863891', 'admin2', 'admin', null, '2', null, null, null, '1', null, null, null, null, null, null, null, '2018-07-13 01:51:27', '2018-07-13 01:35:31', '2', '1');
INSERT INTO `sys_user` VALUES ('admin', 'admin', 'admin', 'test', '1', null, null, null, '1', null, null, null, null, null, null, null, '2018-07-13 12:44:58', '2018-07-16 17:42:38', '2', '15');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` varchar(36) NOT NULL,
  `user_id` varchar(36) DEFAULT NULL COMMENT '用户ID',
  `role_id` varchar(36) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户与角色对应关系';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('106', '124', '1');
INSERT INTO `sys_user_role` VALUES ('110', '1', '1');
INSERT INTO `sys_user_role` VALUES ('111', '2', '1');
INSERT INTO `sys_user_role` VALUES ('113', '131', '48');
INSERT INTO `sys_user_role` VALUES ('117', '135', '1');
INSERT INTO `sys_user_role` VALUES ('120', '134', '1');
INSERT INTO `sys_user_role` VALUES ('121', '134', '48');
INSERT INTO `sys_user_role` VALUES ('123', '130', '1');
INSERT INTO `sys_user_role` VALUES ('124', null, '48');
INSERT INTO `sys_user_role` VALUES ('125', '132', '52');
INSERT INTO `sys_user_role` VALUES ('126', '132', '49');
INSERT INTO `sys_user_role` VALUES ('127', null, '1');
INSERT INTO `sys_user_role` VALUES ('128', null, '1');
INSERT INTO `sys_user_role` VALUES ('129', null, '1');
INSERT INTO `sys_user_role` VALUES ('130', '36', '48');
INSERT INTO `sys_user_role` VALUES ('131', '137', '57');
INSERT INTO `sys_user_role` VALUES ('73', '30', '48');
INSERT INTO `sys_user_role` VALUES ('74', '30', '49');
INSERT INTO `sys_user_role` VALUES ('75', '30', '50');
INSERT INTO `sys_user_role` VALUES ('76', '31', '48');
INSERT INTO `sys_user_role` VALUES ('77', '31', '49');
INSERT INTO `sys_user_role` VALUES ('78', '31', '52');
INSERT INTO `sys_user_role` VALUES ('79', '32', '48');
INSERT INTO `sys_user_role` VALUES ('80', '32', '49');
INSERT INTO `sys_user_role` VALUES ('81', '32', '50');
INSERT INTO `sys_user_role` VALUES ('82', '32', '51');
INSERT INTO `sys_user_role` VALUES ('83', '32', '52');
INSERT INTO `sys_user_role` VALUES ('84', '33', '38');
INSERT INTO `sys_user_role` VALUES ('85', '33', '49');
INSERT INTO `sys_user_role` VALUES ('86', '33', '52');
INSERT INTO `sys_user_role` VALUES ('87', '34', '50');
INSERT INTO `sys_user_role` VALUES ('88', '34', '51');
INSERT INTO `sys_user_role` VALUES ('89', '34', '52');
