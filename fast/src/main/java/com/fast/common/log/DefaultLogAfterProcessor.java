package com.fast.common.log;

import com.fast.common.log.annotation.Log;
import com.fast.common.log.aop.ILogAfterProcessor;

import lombok.extern.slf4j.Slf4j;

/**
 * 默认日志后处理器
 * 
 * @author: yuyanan
 * @date: 2018年9月21日
 */
@Slf4j
public class DefaultLogAfterProcessor implements ILogAfterProcessor
{
    
    @Override
    public void afterExecute(Log logVo, long executeTime)
    {
        log.debug("after log info:{}", logVo.toString());
    }
    
}
