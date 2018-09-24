/**  
 * All rights Reserved, Designed By www.tydic.com
 * @Title:  LogAopProperties.java   
 * @Package com.fast.common.log.aop   
 * @Description:   
 * @author: yuyanan  
 * @date:   2018年9月22日   
 * @version V1.0 
 * @Copyright:  yuyanan
 * 
 */
package com.fast.common.log.aop;

import lombok.Data;
import lombok.extern.slf4j.Slf4j;

import org.springframework.boot.context.properties.ConfigurationProperties;

/**    
 * LopAop配置类
 * @author: yuyanan
 * @date:   2018年9月22日      
 */
@Data
@ConfigurationProperties(prefix = "log-aop")
public class LogAopProperties
{
    //开关
    private boolean enabled;
}
