package com.fast.common.config;

import com.baomidou.mybatisplus.core.handlers.MetaObjectHandler;
import java.util.Date;
import org.apache.ibatis.reflection.MetaObject;
import org.springframework.stereotype.Component;

/**
 * mybatis-plus 填充配置
 *  
 * @author: yuyanan
 * @date:   2018年7月21日
 */
@Component
public class MetaObjectHandlerConfig implements MetaObjectHandler  {

    @Override
    public void insertFill(MetaObject metaObject) {
        System.out.println("插入方法实体填充");
        //setFieldValByName("testDate", new Date(), metaObject);
    }

    @Override
    public void updateFill(MetaObject metaObject) {
        setFieldValByName("updateTime",new Date(),metaObject);
        System.out.println("更新方法实体填充");
    }
}