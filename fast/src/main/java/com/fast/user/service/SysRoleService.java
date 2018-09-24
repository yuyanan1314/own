package com.fast.user.service;

import java.util.List;
import java.util.Map;

import com.fast.user.entity.SysRole;
import com.fast.common.supers.SuperService;

/**
 * 角色-服务类
 *  
 * @author yuyanan
 * @date   2018年7月21日
 */
public interface SysRoleService extends SuperService<SysRole> {
	
    /**
     * 根据用户id查询
     * @param userId
     * @return
     */
    SysRole getByUserId(String userId);
    
    /**
     * 根据用户id集合查询
     * @param userIds
     * @return
     */
     Map<String,SysRole> getMapByUserIds(List<String> userIds);
    
    /**
     * 根据用户id集合查询
     * @param userIds
     * @return userid : SysRole
     */
     List<SysRole> getByUserIds(List<String> userIds);
}
