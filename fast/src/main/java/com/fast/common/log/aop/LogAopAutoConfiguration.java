package com.fast.common.log.aop;

import org.springframework.boot.autoconfigure.condition.ConditionalOnClass;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;

/**
 * 启用LogAop配置
 * @author: yuyanan
 * @date: 2018年9月21日
 */
@ConditionalOnClass(LogAop.class)
@ConditionalOnMissingBean(LogAop.class)
public class LogAopAutoConfiguration extends LogAop
{

}
