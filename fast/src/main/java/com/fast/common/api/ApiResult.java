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

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

import java.util.Optional;

import com.fast.common.api.ApiException.Builder;

import lombok.Data;

/**
 * api 返回类
 * 
 * @author yuyanan
 * @date 2018年9月11日
 */
@ApiModel(value = "ApiResult", description = "返回响应数据")
@Data
public class ApiResult<T> {
	/**
	 * 业务错误码
	 */
	@ApiModelProperty(value = "错误编号 0:请求成功,其它值为请求错误  1:警告信息,需要给用户进行提示  2：系统错误:程序已知或者未知的逻辑错误")
	private long code;

	/**
	 * 结果集
	 */
	@ApiModelProperty(value = "响应数据 无值时为null")
	private T data;

	/**
	 * 描述
	 */
	@ApiModelProperty(value = "错误信息")
	private String msg;

	public ApiResult() {
		// to do nothing
	}

	public static <T> ApiResult<T> ok(T data) {
		return restResult(data, ApiErrorCode.SUCCESS.getCode(),
				ApiErrorCode.SUCCESS.getMsg());
	}

	public static <T> ApiResult<T> fail(long code, String msg) {
		return restResult(null, code, msg);
	}

	public static <T> ApiResult<T> fail(T data, long code, String msg) {
		return restResult(data, code, msg);
	}

	private static <T> ApiResult<T> restResult(T data, long code, String msg) {
		ApiResult<T> apiResult = new ApiResult<T>();
		apiResult.setCode(code);
		apiResult.setData(data);
		apiResult.setMsg(msg);
		return apiResult;
	}

	public boolean ok() {
		return ApiErrorCode.SUCCESS.getCode() == this.code;
	}

	/**
	 * 服务间调用非业务正常，异常直接释放
	 */
	public Object serviceData() {
		if (!ok()) {
			throw Builder.error(this.msg);
		}
		return data;
	}
}
