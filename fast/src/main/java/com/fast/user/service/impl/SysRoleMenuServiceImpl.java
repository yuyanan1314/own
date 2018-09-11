package com.fast.user.service.impl;

import org.springframework.stereotype.Service;

import com.fast.common.supers.SuperServiceImpl;
import com.fast.user.dao.SysRoleMenuDao;
import com.fast.user.entity.SysRoleMenu;
import com.fast.user.service.SysRoleMenuService;

/**
 * <p>
 * 角色与菜单对应关系-服务实现类
 * </p>
 *
 * @author yuyanan
 * @since 2018-07-16
 */
@Service
public class SysRoleMenuServiceImpl extends SuperServiceImpl<SysRoleMenuDao, SysRoleMenu> implements SysRoleMenuService {
	
}
