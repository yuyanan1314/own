package com.fast.user.entity.enums;

import com.baomidou.mybatisplus.core.enums.IEnum;
import com.fast.common.supers.IBindEnum;
import com.fasterxml.jackson.annotation.JsonFormat;

/**
 * 用户帐号状态
 *
 * @author yuyanan
 * @date 2018年7月21日
 */
@JsonFormat(shape = JsonFormat.Shape.OBJECT)
public enum  SysUserStatusEnum implements IEnum<Integer>,
                                          IBindEnum {

    OPEN(1,"启用"),LOCK(2,"禁用"),;

    private Integer value;
    private String desc;

    SysUserStatusEnum(final int value, final String desc) {
        this.value = value;
        this.desc = desc;
    }

    SysUserStatusEnum(final int value) {
        this.value = value;
    }

    @Override
    public String getKey() {
        return value.toString();
    }

    @Override
    public Integer getValue() {
        return value;
    }

    public String getDesc() {
        return desc;
    }

}
