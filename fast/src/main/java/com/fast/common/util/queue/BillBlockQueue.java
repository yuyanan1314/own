/**  
 * All rights Reserved, Designed By www.tydic.com
 * @Title:  BillBlockQueue.java   
 * @Package queue   
 * @Description:   
 * @author: yuyanan  
 * @date:   2018年9月22日   
 * @version V1.0 
 * @Copyright:  yuyanan
 * 
 */
package com.fast.common.util.queue;

import java.util.concurrent.BlockingQueue;
import java.util.concurrent.LinkedBlockingQueue;

import lombok.extern.slf4j.Slf4j;

/**
 * <pre>
 *  小票阻塞队列 
 *  以队列的形式存储所有小票
 * </pre>
 * 
 * @author: yuyanan
 * @date: 2018年9月22日
 */
@Slf4j
public class BillBlockQueue
{
    /**
     * 队列的最大容量为10
     */
    private static BlockingQueue<Bill<?>> queue = new LinkedBlockingQueue<>(50);
    
    /**
     * 如果队列不为空，则取出，否则阻塞等待
     * 
     * @return
     * @throws InterruptedException
     */
    public static Bill<?> get()
        throws InterruptedException
    {
        Bill<?> bill = (Bill<?>)queue.take();
        long nowtime = System.currentTimeMillis();
        // 设置出队时间
        bill.setOutTime(nowtime);
        log.info("the bill life time is:{} 毫秒", nowtime - bill.getIntoTime());
        return bill;
    }
    
    /**
     * 如果队列不满，则放入，否则阻塞等待
     * 
     * @param data Bill
     * @throws InterruptedException
     */
    public static void put(Bill<?> data)
        throws InterruptedException
    {
        buildData(data);
        queue.put(data);
    }
    
    /**
     * 如果队列不满，则也会放入失败 返回false
     * 
     * @param data Bill
     * @throws InterruptedException
     * @return 入队成功true 失败false
     */
    public static boolean offer(Bill<?> data)
        throws InterruptedException
    {
        buildData(data);
        return queue.offer(data);
    }
    
    /**
     * 入队数据处理
     * 
     * @param data Bill
     */
    private static void buildData(Bill<?> data)
    {
        if (data == null)
        {
            log.error("empty bill can not put!");
            return;
        }
        if (data.getData() == null)
        {
            log.error("empty bill data can not put!");
            return;
        }
        // 设置入队时间
        data.setIntoTime(System.currentTimeMillis());
    }
    
}
