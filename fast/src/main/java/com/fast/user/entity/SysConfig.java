package com.fast.user.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fast.common.supers.SuperEntity;

import lombok.Data;

/**
 * 系统配置表
 *  
 * @author: yuyanan
 * @date:   2018年7月21日
 */
@TableName("sys_config")
@Data
public class SysConfig extends SuperEntity {
	
	@TableField(exist = false)
	private static final long serialVersionUID = 1L;
	
    /**
     * 键
     */
    private String k;
    /**
     * 值
     */
    private String v;
    /**
     * 备注
     */
    private String remark;
    /**
     * 类型编码
     */
    @TableField(value = "kv_type")
    private Integer kvType;

}

