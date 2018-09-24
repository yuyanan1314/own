package com.fast.user.service.impl;

import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.assertj.core.util.Lists;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fast.common.supers.SuperServiceImpl;
import com.fast.user.dao.SysRoleDao;
import com.fast.user.entity.SysRole;
import com.fast.user.entity.SysUserRole;
import com.fast.user.service.SysRoleService;
import com.fast.user.service.SysUserRoleService;
import com.google.common.collect.Maps;

/**
 * 角色-服务实现类
 * 
 * @author yuyanan
 * @date 2018年7月21日
 */
@Service
public class SysRoleServiceImpl extends SuperServiceImpl<SysRoleDao, SysRole> implements SysRoleService
{
    
    @Autowired
    private SysUserRoleService sysUserRoleService;
    
    @Override
    public SysRole getByUserId(String userId)
    {
        SysUserRole userRole = sysUserRoleService.getByUserId(userId);
        if (userRole == null)
        {
            return null;
        }
        SysRole role = this.getById(userRole.getRoleId());
        return role;
    }
    
    @Override
    public List<SysRole> getByUserIds(List<String> userIds)
    {
        
        return (List<SysRole>)getMapByUserIds(userIds).values();
    }
    
    @Override
    public Map<String, SysRole> getMapByUserIds(List<String> userIds)
    {
        if (userIds.isEmpty())
        {
            return Maps.newHashMap();
        }
        // 查询roleId
        List<SysUserRole> userRoles = sysUserRoleService.getByUserId(userIds);
        if (userRoles.isEmpty())
        {
            return Maps.newHashMap();
        }
        List<String> roleIds = userRoles.stream().map(SysUserRole::getRoleId).collect(Collectors.toList());
        Collection<SysRole> roles = listByIds(roleIds);
        if (roles.isEmpty())
        {
            return Maps.newHashMap();
        }
        Map<String, SysRole> roleMap = roles.stream().collect(Collectors.toMap(SysRole::getId, x -> {
            return x;
        }, (value1, value2) -> {
            return value2;
        }));
        //用户id ：角色
        Map<String, SysRole> result = userRoles.stream().collect(Collectors.toMap(SysUserRole::getUserId, x -> {
            return roleMap.get(x.getRoleId());
        }, (value1, value2) -> {
            return value2;
        }));
        return result;
    }
    
}
