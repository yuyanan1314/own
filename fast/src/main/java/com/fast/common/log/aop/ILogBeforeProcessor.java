package com.fast.common.log.aop;

import com.fast.common.log.annotation.Log;

/**
 * 
 * 日志 前处理器
 * 
 * @author: yuyanan
 * @date: 2018年9月21日
 */
public interface ILogBeforeProcessor
{
    /**
     * 日志处理
     * 
     * @param log Log
     */
    public void execute(Log logVo);
}
