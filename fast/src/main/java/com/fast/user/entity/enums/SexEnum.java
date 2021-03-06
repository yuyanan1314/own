package com.fast.user.entity.enums;

import com.baomidou.mybatisplus.core.enums.IEnum;
import com.fast.common.supers.IBindEnum;
import com.fasterxml.jackson.annotation.JsonFormat;


/**
 * 用户性别
 *
 * @author yuyanan
 * @date   2018年7月21日
 */
@JsonFormat(shape = JsonFormat.Shape.OBJECT)
public enum SexEnum implements IEnum<Integer>,
                               IBindEnum{
    MAN(1, "男"), WOMAN(2, "女"),;

    private Integer value;
    private String desc;

    SexEnum(final int value, final String desc) {
        this.value = value;
        this.desc = desc;
    }

    SexEnum(final int value) {
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
