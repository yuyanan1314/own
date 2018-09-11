package com.fast.user.dao;

import java.util.List;

import com.fast.common.supers.SuperDao;
import com.fast.user.entity.SysMenu;

/**
 * <p>
 * 菜单管理-db接口
 * </p>
 *
 * @author yuyanan
 * @since 2018-07-16
 */
public interface SysMenuDao extends SuperDao<SysMenu> {
	
	/**
	 * 查询用户所有目录与菜单
	 * 
	 * @param id 用户id
	 * @return List<SysMenu>
	 */
	List<SysMenu> listMenuByUserId(String userId);
	
	/**
	 * 查询用户所有按钮权限
	 * 
	 * @param userId 用户id
	 * @return String
	 */
	List<String> listUserPerms(String userId);
}