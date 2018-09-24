/**  
 * All rights Reserved, Designed By www.tydic.com
 * @Title:  ApiException.java   
 * @Package com.fast.common.api   
 * @Description:   
 * @author yuyanan
 * @date   2018年9月11日
 * @version V1.0 
 * @Copyright:  yuyanan
 * 
 */
package com.fast.common.api;

/**
 * api 异常类
 * 
 * @author yuyanan
 * @date 2018年9月11日
 */
public class ApiException extends RuntimeException {
    
	/**
	 * 错误码
	 */
	private IErrorCode errorCode;
	
	private ApiException(IErrorCode errorCode) {
		super(errorCode.getMsg());
		this.errorCode = errorCode;
	}
	
	private ApiException(IErrorCode errorCode, String warnMessage) {
		super(warnMessage);
		this.errorCode = errorCode;
	}
	
	private ApiException(String message) {
		super(message);
	}

	private ApiException(Throwable cause) {
		super(cause);
	}

	private ApiException(String message, Throwable cause) {
		super(message, cause);
	}

	public IErrorCode getErrorCode() {
		return errorCode;
	}
	
	/**
	 * 构造类
	 *  
	 * @author: yuyanan
	 * @date:   2018年9月24日
	 */
	public static class Builder{
		
		public static ApiException warn(String message){
			return new ApiException(ApiErrorCode.WARN, message);
		}
		
		public static ApiException other(IErrorCode errorCode){
			return new ApiException(errorCode);
		}
		
		public static ApiException error(String message){
			return new ApiException(message);
		}
		
	}
}
