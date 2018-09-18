package com.fast.user.service.impl;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.fast.admin.model.bo.SysUserPageBo;
import com.fast.common.api.ApiException;
import com.fast.common.supers.SuperServiceImpl;
import com.fast.user.dao.SysUserDao;
import com.fast.user.entity.SysRole;
import com.fast.user.entity.SysUser;
import com.fast.user.entity.SysUserRole;
import com.fast.user.entity.enums.SexEnum;
import com.fast.user.entity.enums.SysUserStatusEnum;
import com.fast.user.service.SysRoleService;
import com.fast.user.service.SysUserRoleService;
import com.fast.user.service.SysUserService;
import com.google.common.collect.Lists;

/**
 * 用户表-服务实现类
 *
 * @author yuyanan
 * @date 2018年7月21日
 */
@Service
public class SysUserServiceImpl extends SuperServiceImpl<SysUserDao, SysUser> implements SysUserService
{
    
    @Autowired
    private SysRoleService roleService;
    
    @Autowired
    private SysUserRoleService userRoleService;
    
    /**
     * 登陆
     *
     * @param username 用户名
     * @param password 密码
     * @return SysUser
     */
    @Transactional
    @Override
    public SysUser login(String username, String password)
    {
        
        if (StringUtils.isAllBlank(username))
        {
            throw ApiException.ApiExceptionBuilder.warn("用户名不能为空");
        }
        if (StringUtils.isAllBlank(password))
        {
            throw ApiException.ApiExceptionBuilder.warn("用户名不能为空");
        }
        Wrapper<SysUser> wrapper = new QueryWrapper<SysUser>().eq("username", username);
        SysUser sysUser = this.baseMapper.selectOne(wrapper);
        if (sysUser == null)
        {
            throw ApiException.ApiExceptionBuilder.warn("帐号不存在");
        }
        if (!password.trim().equals(sysUser.getPassword().trim()))
        {
            throw ApiException.ApiExceptionBuilder.warn("密码不正确");
        }
        
        // 查询用户角色
        SysUserRole userRole = userRoleService.getOne(new QueryWrapper<SysUserRole>().eq("user_id", sysUser.getId()));
        if (userRole != null)
        {
            SysRole role = roleService.getById(userRole.getRoleId());
            sysUser.setRoleId(role.getId());
            sysUser.setRoleName(role.getRoleName());
        }
        return sysUser;
    }
    
    /**
     * 更新性别
     * 
     * @param id id
     * @param sexEnum 性别
     */
    @Transactional
    @Override
    public void updateSex(String id, SexEnum sexEnum)
    {
        if (StringUtils.isBlank(id))
        {
            throw ApiException.ApiExceptionBuilder.error("参数[id]为空");
        }
        if (sexEnum == null)
        {
            throw ApiException.ApiExceptionBuilder.error("参数[sexEnum]为空");
        }
        SysUser sysUser = getById(id);
        if (sysUser == null)
        {
            throw ApiException.ApiExceptionBuilder.error("参数[id]无效");
        }
        sysUser.setSex(sexEnum);
        updateById(sysUser);
    }
    
    /**
     * 帐号锁定/解除
     *
     * @param id id
     * @param statusEnum 性别
     */
    @Transactional
    @Override
    public void updateStatus(String id, SysUserStatusEnum statusEnum)
    {
        if (StringUtils.isBlank(id))
        {
            throw ApiException.ApiExceptionBuilder.error("参数[id]为空");
        }
        if (statusEnum == null)
        {
            throw ApiException.ApiExceptionBuilder.error("参数[statusEnum]为空");
        }
        SysUser sysUser = getById(id);
        if (sysUser == null)
        {
            throw ApiException.ApiExceptionBuilder.error("参数[id]无效");
        }
        sysUser.setStatus(statusEnum);
        updateById(sysUser);
    }
    
    @Transactional
    @Override
    public void removeById(String id)
    {
        if (StringUtils.isBlank(id))
        {
            throw ApiException.ApiExceptionBuilder.error("参数[id]为空");
        }
        if (id.equals(admin_id))
        {
            throw ApiException.ApiExceptionBuilder.warn("admin帐号是系统管理员,不允许删除");
        }
        
        // 删除用户角色
        SysUserRole userRole = userRoleService.getOne(new QueryWrapper<SysUserRole>().eq("user_id", id));
        if (userRole != null)
        {
            userRoleService.removeById(userRole);
        }
        // 删除用户
        super.removeById(id);
    }
    
    @Transactional
    @Override
    public void removeByIds(List<String> ids)
    {
        if (ids == null || ids.isEmpty())
        {
            return;
        }
        List<String> idList = Lists.newArrayList(ids);
        if (idList.contains(admin_id))
        {
            throw ApiException.ApiExceptionBuilder.warn("admin帐号是系统管理员,不允许删除");
        }
        // 删除用户角色
        List<SysUserRole> roList = userRoleService.list(new QueryWrapper<SysUserRole>().in("id", idList));
        if (!roList.isEmpty())
        {
            userRoleService.removeByIds(roList);
        }
        // 删除用户
        super.removeByIds(ids);
    }
    
    @Override
    public IPage<SysUser> page(SysUserPageBo pageBo)
    {
        if (pageBo == null)
        {
            throw ApiException.ApiExceptionBuilder.error("参数[SysUserPageBo]为空");
        }
        
        QueryWrapper<SysUser> queryWrapper = new QueryWrapper<>();
        // 条件
        if (StringUtils.isNotBlank(pageBo.getUsername()))
        {
            queryWrapper.like("username", pageBo.getUsername());
        }
        if (StringUtils.isNotBlank(pageBo.getRealname()))
        {
            queryWrapper.like("realname", pageBo.getRealname());
        }
        if (StringUtils.isNotBlank(pageBo.getMobile()))
        {
            queryWrapper.like("mobile", pageBo.getMobile());
        }
        // 排序
        if (StringUtils.isNotBlank(pageBo.getField()))
        {
            queryWrapper.orderBy(true, pageBo.isAsc(), pageBo.getField());
        }
        else
        {
            queryWrapper.orderBy(true, false, "createTime");
        }
        
        IPage<SysUser> page = super.page(new Page<SysUser>(pageBo.getPage(), pageBo.getLimit()), queryWrapper);
        
        // 查询角色信息
        List<String> userIds = page.getRecords().stream().map(SysUser::getId).collect(Collectors.toList());
        if (userIds.isEmpty())
        {
            return page;
        }
        // 差roleId
        List<SysUserRole> userRoles = userRoleService.list(new QueryWrapper<SysUserRole>().in("user_id", userIds));
        if (userRoles.isEmpty())
        {
            return page;
        }
        Map<String, String> userRoleMap =
            userRoles.stream().collect(Collectors.toMap(SysUserRole::getUserId, SysUserRole::getRoleId));
        page.getRecords().forEach(x -> {
            x.setRoleId(userRoleMap.get(x.getId()));
        });
        // 赋值roleName
        List<String> roleIds = userRoles.stream().map(SysUserRole::getRoleId).collect(Collectors.toList());
        List<SysRole> roles = roleService.list(new QueryWrapper<SysRole>().in("id", roleIds));
        if (roles.isEmpty())
        {
            return page;
        }
        Map<String, String> roleMap =
            roles.stream().collect(Collectors.toMap(SysRole::getId, SysRole::getRoleName, (value1, value2) -> {
                return value2;
            }));
        page.getRecords().forEach(x -> {
            x.setRoleName(roleMap.get(x.getRoleId()));
        });
        return page;
    }
    
}
