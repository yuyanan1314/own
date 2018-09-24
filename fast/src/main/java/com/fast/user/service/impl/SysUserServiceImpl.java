package com.fast.user.service.impl;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.fast.admin.model.bo.SysUserAddBo;
import com.fast.admin.model.bo.SysUserEditBo;
import com.fast.admin.model.bo.SysUserPageBo;
import com.fast.common.api.ApiException;
import com.fast.common.supers.SuperServiceImpl;
import com.fast.common.util.BeanTool;
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
            throw ApiException.Builder.warn("用户名不能为空");
        }
        if (StringUtils.isAllBlank(password))
        {
            throw ApiException.Builder.warn("用户名不能为空");
        }
        Wrapper<SysUser> wrapper = new QueryWrapper<SysUser>().eq("username", username);
        SysUser sysUser = this.baseMapper.selectOne(wrapper);
        if (sysUser == null)
        {
            throw ApiException.Builder.warn("帐号不存在");
        }
        if (!password.trim().equals(sysUser.getPassword().trim()))
        {
            throw ApiException.Builder.warn("密码不正确");
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
            throw ApiException.Builder.error("参数[id]为空");
        }
        if (sexEnum == null)
        {
            throw ApiException.Builder.error("参数[sexEnum]为空");
        }
        SysUser sysUser = getById(id);
        if (sysUser == null)
        {
            throw ApiException.Builder.error("参数[id]无效");
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
            throw ApiException.Builder.error("参数[id]为空");
        }
        if (statusEnum == null)
        {
            throw ApiException.Builder.error("参数[statusEnum]为空");
        }
        SysUser sysUser = getById(id);
        if (sysUser == null)
        {
            throw ApiException.Builder.error("参数[id]无效");
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
            throw ApiException.Builder.error("参数[id]为空");
        }
        if (id.equals(admin_id))
        {
            throw ApiException.Builder.warn("admin帐号是系统管理员,不允许删除");
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
            throw ApiException.Builder.warn("admin帐号是系统管理员,不允许删除");
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
            throw ApiException.Builder.error("参数[SysUserPageBo]为空");
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
        Map<String, SysRole> roleMap = roleService.getMapByUserIds(userIds);
        
        page.getRecords().forEach(x -> {
            x.setRole(roleMap.get(x.getId()));
        });
        return page;
    }
    
    @Override
    public SysUser getUser(String id)
    {
        SysUser user = getById(id);
        if (user == null)
        {
            return user;
        }
        SysRole role = roleService.getByUserId(user.getId());
        user.setRole(role);
        return user;
    }
    
    /*
     * (non-Javadoc)
     * 
     * @see com.fast.user.service.SysUserService#addUser(com.fast.admin.model.bo.SysUserAddBo)
     */
    @Override
    public void addUser(SysUserAddBo addBo)
    {
        if (addBo == null)
        {
            throw ApiException.Builder.error("参数[user]为空");
        }
        try
        {
            SysUser user = new SysUser();
            BeanUtils.copyProperties(addBo, user);
            user.setStatus(SysUserStatusEnum.OPEN);
            save(user);
            // 添加用户角色关系
            SysUserRole userRole = new SysUserRole();
            userRole.setUserId(user.getId());
            userRole.setRoleId(addBo.getRoleId());
            userRoleService.save(userRole);
        }
        catch (DuplicateKeyException e)
        {
            throw ApiException.Builder.warn("用户名已存在");
        }
    }
    
    /*
     * (non-Javadoc)
     * 
     * @see com.fast.user.service.SysUserService#editUser(com.fast.admin.model.bo.SysUserEditBo)
     */
    @Override
    public void editUser(SysUserEditBo user)
    {
        if (user == null)
        {
            throw ApiException.Builder.error("参数[user]为空");
        }
        if (user.getId() == null)
        {
            throw ApiException.Builder.error("参数[userId]为空");
        }
        try
        {
            // 更新用户
            SysUser old = getById(user.getId());
            if (old == null)
            {
                throw ApiException.Builder.error("参数[userId]无效");
            }
            BeanTool.copyProperties(user, old);
            updateById(old);
        }
        catch (DuplicateKeyException e)
        {
            throw ApiException.Builder.warn("用户名已存在");
        }
        // 维护用户角色关系
        if (StringUtils.isNotBlank(user.getRoleId()))
        {
            SysUserRole userRole = userRoleService.getOne(new QueryWrapper<SysUserRole>().eq("user_id", user.getId()));
            if (userRole == null)
            {
                throw ApiException.Builder.error("用户角色数据关系错误");
            }
            userRole.setRoleId(user.getRoleId());
            userRoleService.updateById(userRole);
        }
    }
}
