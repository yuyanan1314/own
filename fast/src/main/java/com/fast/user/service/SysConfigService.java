package com.fast.user.service;

import java.util.List;
import java.util.Map;

import com.fast.common.supers.SuperService;
import com.fast.user.entity.SysConfig;

/**
 * 系统配置表-服务类
 *  
 * @author: yuyanan
 * @date:   2018年7月21日
 */
public interface SysConfigService extends SuperService<SysConfig> {

    SysConfig getByKey(String k);

    String getValuByKey(String k);

    void updateKV(Map<String, String> kv);

    List<SysConfig> findListByKvType(int kvType);
}
