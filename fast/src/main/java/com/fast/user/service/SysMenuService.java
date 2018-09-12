package com.fast.user.service;

import java.util.List;
import java.util.Set;

import com.baomidou.mybatisplus.extension.service.IService;
import com.fast.user.entity.SysMenu;
import com.fast.user.entity.SysUser;
import com.fast.common.supers.SuperService;
import com.fast.common.util.Tree;


/**
 * 菜单管理-服务类
 *  
 * @author yuyanan
 * @date   2018年7月21日
 */
public interface SysMenuService extends SuperService<SysMenu> {
	
	/**
	 * 查询用户菜单Tree
	 * 
	 * @param id 用户id
	 * @return Tree<SysMenu>
	 */
	Tree<SysMenu> getSysMenuTree(String userId);

	/**
	 * 查询用户菜单Tree
	 * @param id
	 * @return
	 */
    List<Tree<SysMenu>> listMenuTree(String userId);

    /**
	 * 查询所有菜单 并组成一个tree
	 * 
	 * @return Tree<SysMenu>
	 */
    Tree<SysMenu> getTree();

    /**
	 * 所有tree中 角色拥有的tree为选中状态
	 * @param roleId
	 * @return
	 */
    Tree<SysMenu> getTree(String roleId);

    /**
	 * 查询用户所有按钮权限
	 * 
	 * @param userId 用户id
	 * @return String
	 */
    Set<String> listPerms(String userId);
    
}
