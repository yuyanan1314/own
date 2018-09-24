/**  
 * All rights Reserved, Designed By www.tydic.com
 * @Title:  CustomLogAfterProcessor.java   
 * @Package com.fast.admin.config.impl   
 * @Description:   
 * @author: yuyanan  
 * @date:   2018年9月21日   
 * @version V1.0 
 * @Copyright:  yuyanan
 * 
 */
package com.fast.admin.config.impl;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.fast.common.log.annotation.Log;
import com.fast.common.log.aop.ILogAfterProcessor;
import com.fast.common.util.HttpContextTool;
import com.fast.common.util.IpTool;
import com.fast.user.entity.SysLog;
import com.fast.user.service.SysLogService;

/**    
 *  
 * @author: yuyanan
 * @date:   2018年9月21日      
 */
@Slf4j
public class CustomLogAfterProcessor implements ILogAfterProcessor
{

    @Autowired
    private SysLogService logService;
    
    @Override
    public void execute(Log logVo, long executeTime)
    {
         SysLog sysLog = new SysLog();
         log.info("after log value:{}", logVo.value());

         // 获取request
         HttpServletRequest request = HttpContextTool.getHttpServletRequest();
         // 设置IP地址
         sysLog.setIp(IpTool.getIpAddr(request));
         // 用户名
         sysLog.setTime((int) executeTime);
         // 保存系统日志
         logService.save(sysLog);
        
    }
    
}
