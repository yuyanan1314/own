package com.fast.admin.model.basic;

import com.fast.user.entity.enums.SexEnum;
import lombok.Data;

/**
 * session里存储的用户
 *
 * @author yuyanan
 * @date 2018年9月11日
 */
@Data
public class SessionSysUser {

    private String username;

    private String realname;

    private SexEnum sex;

}
