package com.fast.user.service;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.fast.user.entity.SysUser;
import com.fast.common.supers.SuperService;
import java.util.Map;

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

	@Override
	IPage<Map<String, Object>> pageMaps(IPage<SysUser> page, Wrapper<SysUser> queryWrapper);
}
