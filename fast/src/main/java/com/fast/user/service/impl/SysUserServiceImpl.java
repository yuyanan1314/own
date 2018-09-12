package com.fast.user.service.impl;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.fast.common.api.ApiErrorCode;
import com.fast.common.api.ApiException;
import com.fast.common.supers.SuperServiceImpl;
import com.fast.user.dao.SysUserDao;
import com.fast.user.entity.SysUser;
import com.fast.user.service.SysUserService;
import org.springframework.stereotype.Service;

/**
 * 用户表-服务实现类
 *
 * @author yuyanan
 * @date 2018年7月21日
 */
@Service
public class SysUserServiceImpl extends SuperServiceImpl<SysUserDao, SysUser> implements SysUserService {

    /**
     * 登陆
     *
     * @param username 用户名
     * @param password 密码
     * @return SysUser
     */
    @Override
    public SysUser login(String username, String password) {
        Wrapper<SysUser> wrapper = new QueryWrapper<SysUser>().eq("username", username);
        SysUser sysUser = this.baseMapper.selectOne(wrapper);
		if(sysUser == null){
		    throw new ApiException("帐号不存在");
        }
        if(!password.trim().equals(sysUser.getPassword().trim())){
            throw new ApiException("密码不正确");
        }
        return sysUser;
    }

}
