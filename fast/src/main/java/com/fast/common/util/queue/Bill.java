/**  
 * All rights Reserved, Designed By www.tydic.com
 * @Title:  Bill.java   
 * @Package queue   
 * @Description:   
 * @author: yuyanan  
 * @date:   2018年9月23日   
 * @version V1.0 
 * @Copyright:  yuyanan
 * 
 */
package com.fast.common.util.queue;

import java.io.Serializable;

/**
 * 队列数据类
 * 
 * @author: yuyanan
 * @date: 2018年9月23日
 */
public class Bill<T> implements Serializable
{
    private static final long serialVersionUID = 1L;
    
    /**
     * 入队时间
     */
    private long inTime;
    
    /**
     * 出队时间
     */
    private long outTime;
    
    /**
     * 数据
     */
    private T data;
    
    /**
     * 构建实例方法
     * 
     * @param data
     * @return
     */
    public static <T> Bill<T> instance(T data)
    {
        return new Bill<T>(data);
    }
    
    private Bill(T data)
    {
        this.data = data;
    }

    public long getIntoTime()
    {
        return inTime;
    }

    public void setIntoTime(long intoTime)
    {
        this.inTime = intoTime;
    }

    public long getOutTime()
    {
        return outTime;
    }

    public void setOutTime(long outTime)
    {
        this.outTime = outTime;
    }

    public T getData()
    {
        return data;
    }

    public void setData(T data)
    {
        this.data = data;
    }
    
}
