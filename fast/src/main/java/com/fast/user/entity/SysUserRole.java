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
 * 用户与角色对应关系
 * </p>
 *
 * @author yuyanan
 * @since 2018-07-16
 */
@TableName("sys_user_role")
@Data
public class SysUserRole extends SuperEntity {
	
	@TableField(exist = false)
	private static final long serialVersionUID = 1L;
	
		  /**
   * 用户ID
   */
		    @TableField(value="user_id")
		 	 private String userId;
		  /**
   * 角色ID
   */
		    @TableField(value="role_id")
		 	 private String roleId;
	
}

