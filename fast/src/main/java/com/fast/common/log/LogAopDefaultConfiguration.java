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
package com.fast.common.log;

import org.springframework.boot.autoconfigure.condition.ConditionalOnClass;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;

import com.fast.common.log.aop.ILogAfterProcessor;
import com.fast.common.log.aop.ILogBeforeProcessor;
import com.fast.common.log.aop.LogAop;

/**
 * 
 * @author: yuyanan
 * @date: 2018年9月21日
 */
// 存在LogAop这个类才装配当前类
@Configuration
@ConditionalOnMissingBean(LogAop.class)
public class LogAopDefaultConfiguration extends LogAop
{

}
