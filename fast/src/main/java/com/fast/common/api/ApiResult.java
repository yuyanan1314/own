/**  
 * All rights Reserved, Designed By www.tydic.com
 * @Title:  ApiResult.java   
 * @Package com.fast.common.supers   
 * @Description:   
 * @author yuyanan
 * @date   2018年9月11日
 * @version V1.0 
 * @Copyright:  yuyanan
 * 
 */
package com.fast.common.api;

import java.util.Optional;

import lombok.Data;

/**
 * api 返回类
 * 
 * @author yuyanan
 * @date 2018年9月11日
 */
@Data
public class ApiResult {
	/**
	 * 业务错误码
	 */
	private String code;
	/**
	 * 结果集
	 */
	private Object data;
	/**
	 * 描述
	 */
	private String msg;

	public ApiResult() {
		// to do nothing
	}

	public ApiResult(IErrorCode errorCode) {
		errorCode = Optional.ofNullable(errorCode).orElse(ApiErrorCode.FAILED);
		this.code = errorCode.getCode();
		this.msg = errorCode.getMsg();
	}

	public static ApiResult ok(Object data) {
		return restResult(data, ApiErrorCode.SUCCESS);
	}

	public static ApiResult failed(String msg) {
		return restResult(null, ApiErrorCode.FAILED.getCode(), msg);
	}

	public static ApiResult failed(IErrorCode errorCode) {
		return restResult(null, errorCode);
	}

	public static ApiResult restResult(Object data, IErrorCode errorCode) {
		return restResult(data, errorCode.getCode(), errorCode.getMsg());
	}

	private static ApiResult restResult(Object data, String code, String msg) {
		ApiResult apiResult = new ApiResult();
		apiResult.setCode(code);
		apiResult.setData(data);
		apiResult.setMsg(msg);
		return apiResult;
	}

	public boolean ok() {
		return ApiErrorCode.SUCCESS.getCode().equals(this.code);
	}

	/**
	 * 服务间调用非业务正常，异常直接释放
	 */
	public Object serviceData() {
		if (!ok()) {
			throw new ApiException(this.msg);
		}
		return data;
	}
}
