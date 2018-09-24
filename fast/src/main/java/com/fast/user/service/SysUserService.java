package com.fast.user.service;

import java.util.List;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.fast.admin.model.bo.SysUserAddBo;
import com.fast.admin.model.bo.SysUserEditBo;
import com.fast.admin.model.bo.SysUserPageBo;
import com.fast.common.supers.SuperService;
import com.fast.user.entity.SysUser;
import com.fast.user.entity.enums.SexEnum;
import com.fast.user.entity.enums.SysUserStatusEnum;

/**
 * 用户表-服务类
 *
 * @author yuyanan
 * @date 2018年7月21日
 */
public interface SysUserService extends SuperService<SysUser> {
	
	//系统管理员  角色 账号id值  不允许删除
	public static final String admin_id = "admin";
	
	/**
	 * 分页查询
	 * @param pageBo
	 * @return
	 */
	IPage<SysUser> page(SysUserPageBo pageBo);

    /**
     * 登陆
     *
     * @param username 用户名
     * @param password 密码
     * @return SysUser
     */
    SysUser login(String username, String password);

    /**
     * 更新性别
     *
     * @param id id
     * @param sexEnum 性别
     */
    void updateSex(String id, SexEnum sexEnum);

    /**
     * 帐号锁定/解除
     *
     * @param id id
     * @param statusEnum 性别
     */
    void updateStatus(String id, SysUserStatusEnum statusEnum);
    
    /**
     * 删除
     * @param id id
     */
    void removeById(String id);
    
    /**
     * 批量删除
     * @param id
     */
    void removeByIds(List<String> ids);
    
    /**
     * 根据id查询用户信息 包括用户角色等
     * @param id
     * @return
     */
    SysUser getUser(String id);
    
    void addUser(SysUserAddBo addBo);
    
    void editUser(SysUserEditBo editBo);
}
