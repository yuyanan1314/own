package com.fast.user.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;

import lombok.Data;

import com.fast.common.supers.SuperEntity;
/**
 * <p>
 * 角色与菜单对应关系
 * </p>
 *
 * @author yuyanan
 * @since 2018-07-16
 */
@TableName("sys_role_menu")
@Data
public class SysRoleMenu extends SuperEntity {
	
	@TableField(exist = false)
	private static final long serialVersionUID = 1L;
	
		  /**
   * 角色ID
   */
		    @TableField(value="role_id")
		 	 private String roleId;
		  /**
   * 菜单ID
   */
		    @TableField(value="menu_id")
		 	 private String menuId;
	
}

