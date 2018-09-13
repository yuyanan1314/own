package com.fast.user.entity;

import com.baomidou.mybatisplus.annotation.SqlCondition;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fast.common.supers.SuperEntity;
import com.fast.user.entity.enums.SexEnum;
import java.util.Date;
import java.util.List;

import lombok.Data;

/**
 * <p>
 * 用户表
 * </p>
 *
 * @author yuyanan
 * @since 2018-07-16
 */
@TableName("sys_user")
@Data
public class SysUser extends SuperEntity {
	
	@TableField(exist = false)
	private static final long serialVersionUID = 1L;
	
	@TableField(exist = false)
	private List<String> auths;
	
    /**
     * 用户名
     */
	@TableField(condition = SqlCondition.EQUAL)
    private String username;
    /**
     * 密码
     */
    private String password;
    /**
     * 真实姓名
     */
    private String realname;
    /**
     * 性别 1男 2女
     */
    private SexEnum sex;
    /**
     * 部门id
     */
    @TableField(value = "dept_id")
    private String deptId;
    /**
     * email
     */
    private String email;
    /**
     * 手机号
     */
    private String mobile;
    /**
     * 状态 1启用 2禁用
     */
    private Integer status;
    /**
     * 生日
     */
    private Date birth;
    /**
     * 爱好
     */
    private String hobby;
    /**
     * 省
     */
    private String province;
    /**
     * 市
     */
    private String city;
    /**
     * 县
     */
    private String district;
    /**
     * 居住地址
     */
    @TableField(value = "live_address")
    private String liveAddress;
    /**
     * 创建人
     */
    @TableField(value = "create_user_id")
    private String createUserId;

}

