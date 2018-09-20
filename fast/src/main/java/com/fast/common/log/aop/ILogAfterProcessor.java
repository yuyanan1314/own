package com.fast.common.log.aop;

import com.fast.common.log.annotation.Log;

/**
 * 
 * 日志 后处理器
 * 
 * @author: yuyanan
 * @date: 2018年9月21日
 */
public interface ILogAfterProcessor
{
    /**
     * 日志处理
     * 
     * @param log Log
     * @param executeTime 业务方法消耗的时间
     */
    public void afterExecute(Log logVo, long executeTime);
}
