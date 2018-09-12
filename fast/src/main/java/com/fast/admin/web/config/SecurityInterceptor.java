/**  
 * All rights Reserved, Designed By www.tydic.com
 * @Title:  SecurityInterceptor.java   
 * @Package com.fast.admin.web.config   
 * @Description:   
 * @author: yuyanan  
 * @date:   2018年9月13日   
 * @version V1.0 
 * @Copyright:  yuyanan
 * 
 */
package com.fast.admin.web.config;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lombok.extern.slf4j.Slf4j;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.fast.common.api.ApiErrorCode;
import com.fast.common.api.ApiResult;
import com.fast.common.supers.SuperController;
import com.fast.common.util.JsonTool;
import com.fast.user.entity.SysUser;

/**    
 *  登录拦截器
 * @author: yuyanan
 * @date:   2018年9月13日      
 */
@Slf4j
public class SecurityInterceptor extends HandlerInterceptorAdapter {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
	        log.info("==============执行顺序: 1、preHandle================");    
	        String requestUri = request.getRequestURI();  
	        String contextPath = request.getContextPath();  
	        String url = requestUri.substring(contextPath.length());  
	        
	        log.info("requestUri:"+requestUri);    
	        log.info("contextPath:"+contextPath);    
	        log.info("url:"+url);    
	          
	        SysUser user =  (SysUser)request.getSession().getAttribute(SuperController.SESSION_USER);   
	        if(user == null){  
	            log.info("Interceptor：登录超时"); 
	            response.setCharacterEncoding("UTF-8");
	            response.getWriter().write(JsonTool.beanToJson(ApiResult.restResult(null, ApiErrorCode.LOGIN_INVALID)));
	            return false;  
	        }else  
	            return true;    
	}
}
