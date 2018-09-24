/**  
 * All rights Reserved, Designed By www.tydic.com
 * @Title:  Demo.java   
 * @Package com.fast.common.util.queue.demo   
 * @Description:   
 * @author: yuyanan  
 * @date:   2018年9月23日   
 * @version V1.0 
 * @Copyright:  yuyanan
 * 
 */
package com.fast.common.util.queue.demo;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;

import com.fast.common.util.queue.Bill;
import com.fast.common.util.queue.BillBlockQueue;

/**
 * 一个生产者与消费者的demo
 * @author: yuyanan
 * @date: 2018年9月23日
 */
public class Demo
{
    @SuppressWarnings("unchecked")
    public static void main(String[] args)
        throws InterruptedException
    { 
        /*
         *  创建一个单线程消费者  一直从队列里取东西 取不到的时候便会等待 直到队列里有数据
         */
        ExecutorService threadPool1 = Executors.newSingleThreadExecutor();
        Runnable run = new Runnable()
        {
            @Override
            public void run()
            {
                while (true)
                {
                    Bill<String> bill;
                    try
                    {
                        bill = (Bill<String>)BillBlockQueue.get();
                        System.out.println("取到小票数据:" + bill.getData());
                    }
                    catch (InterruptedException e)
                    {
                        //TODO 如果发生了中断信号 不做处理 保持线程继续执行 只需记录日志
                        e.printStackTrace();
                    }
                }
            }
        };
        //开始执行
        threadPool1.execute(run);
        
        
        
        /**
         * 创建一个生产者  每一秒往队列里加入两条数据
         */
        for (int i = 0; i < 10; i++)
        {
            final int index = i;
            Bill<String> bill = Bill.instance("小票数据" + index);
            try
            {
                BillBlockQueue.put(bill);
                BillBlockQueue.put(bill);
                Thread.sleep(1000);
            }
            catch (InterruptedException e)
            {
                //TODO 此处根据业务场景自行处理
                e.printStackTrace();
            }
        }
        
    }
}
