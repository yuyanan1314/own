package com.fast.user.service.impl;

import org.springframework.stereotype.Service;

import com.fast.common.supers.SuperServiceImpl;
import com.fast.user.dao.SysDictDao;
import com.fast.user.entity.SysDict;
import com.fast.user.service.SysDictService;

/**
 * 字典表-服务实现类
 *  
 * @author: yuyanan
 * @date:   2018年7月21日
 */
@Service
public class SysDictServiceImpl extends SuperServiceImpl<SysDictDao, SysDict> implements SysDictService {

}
