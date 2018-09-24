package com.fast.user.service.impl;

import java.util.List;

import com.fast.common.supers.SuperServiceImpl;
import com.fast.user.dao.SysUserRoleDao;
import com.fast.user.entity.SysUserRole;
import com.fast.user.service.SysUserRoleService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import org.springframework.stereotype.Service;

/**
 * 用户与角色对应关系-服务实现类
 * 
 * @author yuyanan
 * @date 2018年7月21日
 */
@Service
public class SysUserRoleServiceImpl extends SuperServiceImpl<SysUserRoleDao, SysUserRole> implements SysUserRoleService
{
    
    @Override
    public SysUserRole getByUserId(String userId)
    {
        return getOne(new QueryWrapper<SysUserRole>().eq("user_id", userId));
    }
    
    @Override
    public List<SysUserRole> getByUserId(List<String> userIds)
    {
        List<SysUserRole> userRoles = list(new QueryWrapper<SysUserRole>().in("user_id", userIds));
        return userRoles;
    }
    
}
