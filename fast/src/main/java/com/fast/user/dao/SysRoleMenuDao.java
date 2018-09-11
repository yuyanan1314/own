package com.fast.user.dao;

import java.io.Serializable;
import java.util.List;

import com.fast.common.supers.SuperDao;
import com.fast.user.entity.SysRoleMenu;

/**
 * <p>
 * 角色与菜单对应关系-db接口
 * </p>
 *
 * @author yuyanan
 * @since 2018-07-16
 */
public interface SysRoleMenuDao extends SuperDao<SysRoleMenu> {

	/**
	 * 查询角色所有菜单
	 * @param roleId
	 * @return
	 */
	List<String> listMenuIdByRoleId(String roleId);
	
	/**
	 * 删除角色所有菜单
	 * @param roleId
	 * @return
	 */
	int removeByRoleId(String roleId);
	
	/**
	 * 角色授权
	 * @param list
	 * @return
	 */
	int batchSave(List<SysRoleMenu> list);
}