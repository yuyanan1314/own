package com.fast.user.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;

import lombok.Data;

import com.fast.common.supers.SuperEntity;
import java.util.Date;

/**
 * <p>
 * 菜单管理
 * </p>
 *
 * @author yuyanan
 * @since 2018-07-16
 */
@TableName("sys_menu")
@Data
public class SysMenu extends SuperEntity {
	
	@TableField(exist = false)
	private static final long serialVersionUID = 1L;
	
		  /**
   * 父菜单ID，一级菜单为0
   */
		    @TableField(value="parent_id")
		 	 private Long parentId;
		  /**
   * 菜单名称
   */
		 	 private String name;
		  /**
   * 菜单URL
   */
		 	 private String url;
		  /**
   * 授权(多个用逗号分隔，如：user:list,user:create)
   */
		 	 private String perms;
		  /**
   * 类型     0：目录  1：菜单   2：按钮   
   */
		 	 private Integer type;
		  /**
   * 菜单图标
   */
		 	 private String icon;
		  /**
   * 排序
   */
		    @TableField(value="order_num")
		 	 private Integer orderNum;
					
}

