package com.fast.common.log;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import org.springframework.context.annotation.Import;

import com.fast.common.log.annotation.Log;
import com.fast.common.log.aop.LogAop;

/**
 * 开启{@link Log}处理 提供默认约定的前后日志处理器
 * 
 * @author: yuyanan
 * @date: 2018年9月21日
 */
@Target({ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
@Documented
@Import(LogAopDefaultConfiguration.class)
public @interface EnableAutoLog
{
    
}
