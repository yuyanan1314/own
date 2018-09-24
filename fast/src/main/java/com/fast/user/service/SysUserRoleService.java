package com.fast.user.service;

import java.util.List;

import com.fast.user.entity.SysUserRole;
import com.fast.common.supers.SuperService;

/**
 * 用户与角色对应关系-服务类
 *  
 * @author yuyanan
 * @date   2018年7月21日
 */
public interface SysUserRoleService extends SuperService<SysUserRole> {
	
    /**
     * 根据userId查询
     * @param userId
     * @return
     */
    SysUserRole getByUserId(String userId);
    
    /**
     * 根据userIds查询
     * @param userId
     * @return
     */
    List<SysUserRole> getByUserId(List<String> userIds);
}
