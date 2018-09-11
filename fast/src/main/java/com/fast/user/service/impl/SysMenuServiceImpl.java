package com.fast.user.service.impl;

import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import com.google.common.collect.Lists;
import com.fast.common.supers.SuperServiceImpl;
import com.fast.common.util.Tree;
import com.fast.common.util.TreeBuild;
import com.fast.user.dao.SysMenuDao;
import com.fast.user.dao.SysRoleMenuDao;
import com.fast.user.entity.SysMenu;
import com.fast.user.service.SysMenuService;

/**
 * 菜单管理-服务实现类
 *  
 * @author: yuyanan
 * @date:   2018年7月21日
 */
@Service
public class SysMenuServiceImpl extends SuperServiceImpl<SysMenuDao, SysMenu> implements SysMenuService {

	@Autowired
    SysRoleMenuDao roleMenuMapper;

	/**
	 * 查询用户菜单Tree
	 * 
	 * @param id 用户id
	 * @return Tree<SysMenu>
	 */
    @Cacheable
    @Override
    public Tree<SysMenu> getSysMenuTree(String userId) {
        List<Tree<SysMenu>> trees = getUserTree(userId);
        // 默认顶级菜单为０，根据数据库实际情况调整
        Tree<SysMenu> t = TreeBuild.build(trees);
        return t;
    }

    /**
     * 获取用户tree集合
     * @param userId
     * @return
     */
	private List<Tree<SysMenu>> getUserTree(String userId) {
		List<Tree<SysMenu>> trees = Lists.newArrayList();
        List<SysMenu> SysMenus = baseMapper.listMenuByUserId(userId);
        for (SysMenu sysSysMenu : SysMenus) {
            Tree<SysMenu> tree = new Tree<SysMenu>();
            tree.setId(sysSysMenu.getId().toString());
            tree.setParentId(sysSysMenu.getParentId().toString());
            tree.setText(sysSysMenu.getName());
            Map<String, Object> attributes = new HashMap<>(16);
            attributes.put("url", sysSysMenu.getUrl());
            attributes.put("icon", sysSysMenu.getIcon());
            tree.setAttributes(attributes);
            trees.add(tree);
        }
		return trees;
	}
    
	/**
	 * 查询用户菜单Tree
	 * @param id
	 * @return
	 */
    @Override
    public List<Tree<SysMenu>> listMenuTree(String userId) {
        List<Tree<SysMenu>> trees = getUserTree(userId);
        // 默认顶级菜单为０，根据数据库实际情况调整
        List<Tree<SysMenu>> list = TreeBuild.buildList(trees, "0");
        return list;
    }

    
    /**
	 * 查询所有菜单 并组成一个tree
	 * 
	 * @return Tree<SysMenu>
	 */
    @Override
    public Tree<SysMenu> getTree() {
        List<Tree<SysMenu>> trees = Lists.newArrayList();
        List<SysMenu> SysMenus = baseMapper.selectList(null);
        for (SysMenu sysSysMenu : SysMenus) {
            Tree<SysMenu> tree = new Tree<SysMenu>();
            tree.setId(sysSysMenu.getId().toString());
            tree.setParentId(sysSysMenu.getParentId().toString());
            tree.setText(sysSysMenu.getName());
            trees.add(tree);
        }
        // 默认顶级菜单为０，根据数据库实际情况调整
        Tree<SysMenu> t = TreeBuild.build(trees);
        return t;
    }

    @Override
    public Tree<SysMenu> getTree(String roleId) {
        // 根据roleId查询权限
        List<SysMenu> menus = baseMapper.selectList(null);
        List<String> menuIds = roleMenuMapper.listMenuIdByRoleId(roleId);
        List<String> temp = menuIds;
        for (SysMenu menu : menus) {
            if (temp.contains(menu.getParentId())) {
                menuIds.remove(menu.getParentId());
            }
        }
        List<Tree<SysMenu>> trees = Lists.newArrayList();
        List<SysMenu> SysMenus = baseMapper.selectList(null);
        for (SysMenu sysSysMenu : SysMenus) {
            Tree<SysMenu> tree = new Tree<SysMenu>();
            tree.setId(sysSysMenu.getId().toString());
            tree.setParentId(sysSysMenu.getParentId().toString());
            tree.setText(sysSysMenu.getName());
            Map<String, Object> state = new HashMap<>(16);
            String menuId = sysSysMenu.getId();
            if (menuIds.contains(menuId)) {
                state.put("selected", true);
            } else {
                state.put("selected", false);
            }
            tree.setState(state);
            trees.add(tree);
        }
        // 默认顶级菜单为０，根据数据库实际情况调整
        Tree<SysMenu> t = TreeBuild.build(trees);
        return t;
    }

    /**
   	 * 查询用户所有按钮权限
   	 * 
   	 * @param userId 用户id
   	 * @return String
   	 */
    @Override
    public Set<String> listPerms(String userId) {
        List<String> perms = baseMapper.listUserPerms(userId);
        Set<String> permsSet = new HashSet<>();
        for (String perm : perms) {
            if (StringUtils.isNotBlank(perm)) {
                permsSet.addAll(Arrays.asList(perm.trim().split(",")));
            }
        }
        return permsSet;
    }

}
