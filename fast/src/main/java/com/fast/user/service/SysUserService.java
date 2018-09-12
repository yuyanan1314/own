package com.fast.user.service;

import com.fast.user.entity.SysUser;
import com.fast.common.supers.SuperService;

/**
 * 用户表-服务类
 *  
 * @author yuyanan
 * @date   2018年7月21日
 */
public interface SysUserService extends SuperService<SysUser> {
	
	/**
	 * 登陆
	 * @param username 用户名
	 * @param password 密码
	 * @return SysUser
	 */
	SysUser login(String username,String password);
}
