package com.fast.common.log.annotation;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import com.fast.common.log.aop.LogAop;

/**
 * 
 * <p>
 * 日志注解组件 基于[约定大于配置]模式
 * </p>
 * 
 * <pre>
 * 注解的处理请查看类{@link LogAop}
 * 开启方法：
 * 启用注解{@link EnableAutoLog},会提供默认约定处理 
 * 可自定义前置处理器{@link ILogAfterProcessor}  或者{@link ILogBeforeProcessor}  
 * </pre>
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
