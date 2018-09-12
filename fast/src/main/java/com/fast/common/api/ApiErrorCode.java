/**  
 * All rights Reserved, Designed By www.tydic.com
 * @Title:  ApiErrorCode.java   
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
 * api 返回码
 * 
 * @author yuyanan
 * @date 2018年9月11日
 */
public enum ApiErrorCode implements IErrorCode {

	/**
	 * 成功
	 */
	SUCCESS("0", "成功"),
	
	/**
	 * 失败
	 */
	FAILED("1", "失败"),

	/**
	 * 失败
	 */
	LOGIN_INVALID("101", "登录超时"),

	;

	private final String code;
	private final String msg;

	ApiErrorCode(final String code, final String msg) {
		this.code = code;
		this.msg = msg;
	}

	public static ApiErrorCode fromCode(String code) {
		ApiErrorCode[] ecs = ApiErrorCode.values();
		for (ApiErrorCode ec : ecs) {
			if (ec.getCode() .equals(code) ) {
				return ec;
			}
		}
		return SUCCESS;
	}

	@Override
	public String getCode() {
		return code;
	}

	@Override
	public String getMsg() {
		return msg;
	}

	@Override
	public String toString() {
		return String.format(" ErrorCode:{code=%s, msg=%s} ", code, msg);
	}
}
