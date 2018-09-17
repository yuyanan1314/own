package com.fast.user.service;

import com.fast.common.supers.SuperService;
import com.fast.user.entity.SysUser;
import com.fast.user.entity.enums.SexEnum;
import com.fast.user.entity.enums.SysUserStatusEnum;

/**
 * 用户表-服务类
 *
 * @author yuyanan
 * @date 2018年7月21日
 */
public interface SysUserService extends SuperService<SysUser> {

    /**
     * 登陆
     *
     * @param username 用户名
     * @param password 密码
     * @return SysUser
     */
    SysUser login(String username, String password);

    /**
     * 更新性别
     *
     * @param id id
     * @param sexEnum 性别
     */
    void updateSex(String id, SexEnum sexEnum);

    /**
     * 帐号锁定/解除
     *
     * @param id id
     * @param statusEnum 性别
     */
    void updateStatus(String id, SysUserStatusEnum statusEnum);
}
