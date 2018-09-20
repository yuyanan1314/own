package com.fast.common.log;

import lombok.extern.slf4j.Slf4j;

import com.fast.common.log.annotation.Log;
import com.fast.common.log.aop.ILogBeforeProcessor;

/**
 * 默认日志前处理器
 * 
 * @author: yuyanan
 * @date: 2018年9月21日
 */
@Slf4j
public class DefaultLogBeforeProcessor implements ILogBeforeProcessor
{
    
    @Override
    public void execute(Log logVo)
    {
        log.debug("before log info:{}", logVo.toString());
    }
    
}
