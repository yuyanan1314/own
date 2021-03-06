package com.fast.common.log.aop;

import java.lang.reflect.Method;

import lombok.extern.slf4j.Slf4j;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.beans.factory.InitializingBean;

import com.fast.common.log.DefaultLogAfterProcessor;
import com.fast.common.log.DefaultLogBeforeProcessor;
import com.fast.common.log.annotation.Log;

/**
 * 日志{@link Log}aop处理类
 * <pre>
 *  可分别进行前后处理
 * </pre>
 *
 * @author yuyanan
 * @date 2018年9月21日
 */
@Slf4j
@Aspect
public class LogAop implements InitializingBean
{
    
    /**
     * 日志 前处理器
     */
    private ILogAfterProcessor afterProcessor;
    
    /**
     * 后日志处理器
     */
    private ILogBeforeProcessor beforeProcessor;
    
    public LogAop()
    {
        
    }
    
    /**
     * 初始化完成
     */
    @Override
    public void afterPropertiesSet()
        throws Exception
    {
        if (beforeProcessor == null)
        {
            beforeProcessor = new DefaultLogBeforeProcessor();
        }
        if (afterProcessor == null)
        {
            afterProcessor = new DefaultLogAfterProcessor();
        }
        log.info(" LogAop init success !");
    }
    
    /**
     * 设置后处理器
     *
     * @param beforeProcessor ILogBeforeProcessor
     */
    public void setBeforeProcessor(ILogBeforeProcessor beforeProcessor)
    {
        this.beforeProcessor = beforeProcessor;
    }
    
    /**
     * 设置后处理器
     *
     * @param afterProcessor ILogAfterProcessor
     */
    public void setAfterProcessor(ILogAfterProcessor afterProcessor)
    {
        this.afterProcessor = afterProcessor;
    }
    
    /**
     * 捕捉注解{@link Log}
     */
    @Pointcut("@annotation(com.fast.common.log.annotation.Log)")
    public void logPointCut()
    {
    }
    
    /**
     * 对带有注解{@link Log}的方法进行aop处理
     */
    @Around("logPointCut()")
    public Object around(ProceedingJoinPoint point)
        throws Throwable
    {
        long beginTime = System.currentTimeMillis();
        MethodSignature signature = (MethodSignature)point.getSignature();
        Method method = signature.getMethod();
        Log logBo = method.getAnnotation(Log.class);
        
        // 方法前处理
        this.beforeProcessor.execute(logBo);
        
        // 执行方法
        Object result = point.proceed();
        
        // 执行时长(毫秒)
        long executeTime = System.currentTimeMillis() - beginTime;
        if (executeTime > 5000)
        {
            log.warn("方法执行时间过长:{}秒", executeTime);
        }
        
        // 方法后处理
        afterProcessor.execute(logBo, executeTime);
        return result;
    }
    
}
