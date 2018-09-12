package com.fast.user.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fast.common.supers.SuperEntity;
import lombok.Data;

/**
 * 系统日志
 *  
 * @author yuyanan
 * @date   2018年7月21日
 */
@TableName("sys_log")
@Data
public class SysLog extends SuperEntity {

	@TableField(exist = false)
	private static final long serialVersionUID = 1L;
	
	/**
     * 用户id
     */
    @TableField(value = "user_id")
    private String userId;
    /**
     * 用户名
     */
    private String username;
    /**
     * 用户操作
     */
    private String operation;
    /**
     * 响应时间
     */
    private Integer time;
    /**
     * 请求方法
     */
    private String method;
    /**
     * 请求参数
     */
    private String params;
    /**
     * IP地址
     */
    private String ip;

}

