package com.fast.common.log.annotation;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Inherited;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import org.springframework.context.annotation.Import;

import com.fast.common.log.aop.LogAopAutoConfiguration;

/**
 * 开启{@link Log}处理 提供默认约定的前后日志处理器
 * 
 * @author: yuyanan
 * @date: 2018年9月21日
 */
@Inherited
@Target({ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
@Documented
@Import(LogAopAutoConfiguration.class)
public @interface EnableAutoLog
{
    
}
