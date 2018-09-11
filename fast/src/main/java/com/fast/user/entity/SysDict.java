package com.fast.user.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fast.common.supers.SuperEntity;
import lombok.Data;

/**
 * 字典表
 *  
 * @author: yuyanan
 * @date:   2018年7月21日
 */
@TableName("sys_dict")
@Data
public class SysDict extends SuperEntity {
	
	@TableField(exist = false)
	private static final long serialVersionUID = 1L;
	
    /**
     * 标签名
     */
    private String name;
    /**
     * 数据值
     */
    private String value;
    /**
     * 类型
     */
    private String type;
    /**
     * 描述
     */
    private String description;
    /**
     * 排序（升序）
     */
    private Integer sort;
    /**
     * 父级编号
     */
    @TableField(value = "parent_id")
    private String parentId;
    /**
     * 创建者
     */
    @TableField(value = "create_user_id")
    private Integer createUserId;
    /**
     * 更新者
     */
    @TableField(value = "update_user_id")
    private Long updateUserId;
    /**
     * 备注信息
     */
    private String remarks;

}

