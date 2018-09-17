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
 * 角色
 * </p>
 *
 * @author yuyanan
 * @since 2018-07-16
 */
@TableName("sys_role")
@Data
public class SysRole extends SuperEntity {

	@TableField(exist = false)
	private static final long serialVersionUID = 1L;

	/**
	 * 角色名称
	 */
	@TableField(value = "role_name")
	private String roleName;
	/**
	 * 角色标识
	 */
	@TableField(value = "role_sign")
	private String roleSign;
	/**
	 * 备注
	 */
	private String remark;
	/**
	 * 创建人
	 */
	@TableField(value = "create_user_id")
	private String createUserId;

}
