/**  
 * All rights Reserved, Designed By www.tydic.com
 * @Title:  CustomLogConfig.java   
 * @Package com.fast.admin.config   
 * @Description:   
 * @author: yuyanan  
 * @date:   2018年9月21日   
 * @version V1.0 
 * @Copyright:  yuyanan
 * 
 */
package com.fast.admin.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.fast.admin.config.impl.CustomLogAfterProcessor;
import com.fast.common.log.EnableAutoLog;
import com.fast.common.log.aop.ILogAfterProcessor;
import com.fast.common.log.aop.LogAop;

/**    
 *  
 * @author: yuyanan
 * @date:   2018年9月21日      
 */
@Configuration
@EnableAutoLog
public class CustomLogConfig 
{
    
    @Bean
    public ILogAfterProcessor setAfterProcessor()
    {
        ILogAfterProcessor after =  new CustomLogAfterProcessor();
        return after;
    }
    
}
