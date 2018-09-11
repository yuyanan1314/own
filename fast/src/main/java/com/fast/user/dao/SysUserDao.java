package com.fast.user.dao;

import java.util.Date;

import com.fast.common.supers.SuperDao;
import com.fast.user.entity.SysUser;

/**
 * <p>
 * 用户表-db接口
 * </p>
 *
 * @author yuyanan
 * @since 2018-07-16
 */
public interface SysUserDao extends SuperDao<SysUser> {
	int selectByTime(Date date);
}