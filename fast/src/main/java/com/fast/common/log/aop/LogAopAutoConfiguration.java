/**  
 * All rights Reserved, Designed By www.tydic.com
 * @Title:  LogAopAutoConfiguration.java   
 * @Package com.fast.common.log   
 * @Description:   
 * @author: yuyanan  
 * @date:   2018年9月21日   
 * @version V1.0 
 * @Copyright:  yuyanan
 * 
 */
package com.fast.common.log.aop;

import org.springframework.boot.autoconfigure.condition.ConditionalOnClass;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * 
 * @author: yuyanan
 * @date: 2018年9月21日
 */
@Configuration
// // 存在LogAop这个类才装配当前类
@ConditionalOnClass(LogAop.class)
// 配置文件存在这个logAop-config.enabled=true才启动，允许不存在该配置
@ConditionalOnProperty(name = "log-aop.enabled", havingValue = "true", matchIfMissing = true)
@EnableConfigurationProperties(LogAopProperties.class)
public class LogAopAutoConfiguration
{
    /**
     * 没有LogAop这个类才进行装配
     * @param testServiceProperties
     * @return LogAop
     */
    @Bean
    @ConditionalOnMissingBean
    public LogAop defaultLogAop(LogAopProperties logAopProperties)
    {
        return new LogAop(logAopProperties);
    }
}
