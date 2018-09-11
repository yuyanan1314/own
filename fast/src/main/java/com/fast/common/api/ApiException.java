/**  
 * All rights Reserved, Designed By www.tydic.com
 * @Title:  ApiException.java   
 * @Package com.fast.common.api   
 * @Description:   
 * @author: yuyanan  
 * @date:   2018年9月11日   
 * @version V1.0 
 * @Copyright:  yuyanan
 * 
 */
package com.fast.common.api;

/**
 * api 异常类
 * 
 * @author: yuyanan
 * @date: 2018年9月11日
 */
public class ApiException extends RuntimeException {
	/**
	 * 错误码
	 */
	private IErrorCode errorCode;

	public ApiException(IErrorCode errorCode) {
		super(errorCode.getMsg());
		this.errorCode = errorCode;
	}

	public ApiException(String message) {
		super(message);
	}

	public ApiException(Throwable cause) {
		super(cause);
	}

	public ApiException(String message, Throwable cause) {
		super(message, cause);
	}

	public IErrorCode getErrorCode() {
		return errorCode;
	}
}
