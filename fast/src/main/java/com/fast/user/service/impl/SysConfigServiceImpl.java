package com.fast.user.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.fast.common.supers.SuperServiceImpl;
import com.fast.user.dao.SysConfigDao;
import com.fast.user.entity.SysConfig;
import com.fast.user.service.SysConfigService;

/**
 * 系统配置表-服务实现类
 *  
 * @author yuyanan
 * @date   2018年7月21日
 */
@Service
public class SysConfigServiceImpl extends SuperServiceImpl<SysConfigDao, SysConfig> implements SysConfigService {

    @Override
    public SysConfig getByKey(String k) {
        SysConfig entity = new SysConfig();
        entity.setK(k);
        return baseMapper.selectOne(new QueryWrapper<SysConfig>(entity));
    }

    @Override
    public String getValuByKey(String k) {
        SysConfig bean = this.getByKey(k);
        return bean == null ? "" : bean.getV();
    }

    @Override
    public void updateKV(Map<String, String> kv) {
        for (Map.Entry<String, String> entry : kv.entrySet()) {
            SysConfig config = this.getByKey(entry.getKey());
            config.setV(entry.getValue());
            super.updateById(config);
        }
    }

    @Override
    public List<SysConfig> findListByKvType(int kvType) {
        SysConfig configDO = new SysConfig();
        configDO.setKvType(kvType);
        QueryWrapper<SysConfig> ew = new QueryWrapper<>(configDO);
        List<SysConfig> list = super.list(ew);
        return list;
    }
}
