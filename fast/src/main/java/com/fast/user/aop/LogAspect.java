package com.fast.user.aop;

import java.lang.reflect.Method;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Component;

import com.fast.common.annotation.Log;
import com.fast.common.util.HttpContextTool;
import com.fast.common.util.IpTool;
import com.fast.common.util.JsonTool;
import com.fast.user.entity.SysLog;
import com.fast.user.service.SysLogService;



/**
 * 日志切面
 *  
 * @author yuyanan
 * @date   2018年7月21日
 */
@Aspect
@Component
@Lazy
public class LogAspect {
	
	@Autowired
	private SysLogService logService;
	
	private static final String default_user_id = "default";
	private static final String user_info_empty = "获取用户信息为空";

	@Pointcut("@annotation(com.fast.common.annotation.Log)")
	public void logPointCut() {
	}

	/**
	 * 
	 */
	@Around("logPointCut()")
	public Object around(ProceedingJoinPoint point) throws Throwable {
		long beginTime = System.currentTimeMillis();
		// 执行方法
		Object result = point.proceed();
		// 执行时长(毫秒)
		long time = System.currentTimeMillis() - beginTime;
		// 保存日志
		saveLog(point, time);
		return result;
	}

	/**
	 * 保存日志
	 * 
	 * @param joinPoint 
	 * @param time
	 */
	private void saveLog(ProceedingJoinPoint joinPoint, long time) {
		MethodSignature signature = (MethodSignature) joinPoint.getSignature();
		Method method = signature.getMethod();
		SysLog sysLog = new SysLog();
		Log syslog = method.getAnnotation(Log.class);
		if (syslog != null) {
			// 注解上的描述
			sysLog.setOperation(syslog.value());
		}
		// 请求的方法名
		String className = joinPoint.getTarget().getClass().getName();
		String methodName = signature.getName();
		sysLog.setMethod(className + "." + methodName + "()");
		// 请求的参数
		Object[] args = joinPoint.getArgs();
		try {
			String params = JsonTool.beanToJson(args[0]).substring(0, 4999);
			sysLog.setParams(params);
		} catch (Exception e) {

		}
		// 获取request
		HttpServletRequest request = HttpContextTool.getHttpServletRequest();
		// 设置IP地址
		sysLog.setIp(IpTool.getIpAddr(request));
		// 用户名
		sysLog.setTime((int) time);
		// 系统当前时间
		Date date = new Date();
		// 保存系统日志
		logService.save(sysLog);
	}
}
