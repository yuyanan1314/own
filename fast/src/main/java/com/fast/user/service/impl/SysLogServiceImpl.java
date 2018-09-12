package com.fast.user.service.impl;

import org.springframework.stereotype.Service;

import com.fast.common.supers.SuperServiceImpl;
import com.fast.user.dao.SysLogDao;
import com.fast.user.entity.SysLog;
import com.fast.user.service.SysLogService;

/**
 * 系统日志-服务实现类
 *  
 * @author yuyanan
 * @date   2018年7月21日
 */
@Service
public class SysLogServiceImpl extends SuperServiceImpl<SysLogDao, SysLog> implements SysLogService {
	
}
