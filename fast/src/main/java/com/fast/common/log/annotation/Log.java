package com.fast.common.log.annotation;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import com.fast.common.log.EnableAutoLog;
import com.fast.common.log.aop.LogAop;

/**
 * 
 * <p>
 * 日志注解组件 基于[约定大于配置]模式  
 * </p>
 * <ul>
 * <li>注解的处理请查看类{@link LogAop}
 * <li>开启方法：
 * <li>启用注解{@link EnableAutoLog},会提供默认约定处理 可配置自定义 ILogAfterProcessor 或者  ILogBeforeProcessor
 * </ul>
 * 
 * @author yuyanan
 * @date 2018年9月21日
 */
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface Log
{
    /**
     * 
     * @return 方法的操作描述
     */
    String value() default "";
}
