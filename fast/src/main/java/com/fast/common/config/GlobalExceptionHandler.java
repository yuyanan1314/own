package com.fast.common.config;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.validation.BindException;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import com.fast.common.api.ApiErrorCode;
import com.fast.common.api.ApiException;
import com.fast.common.api.ApiResult;
import com.fast.common.api.IErrorCode;
import com.fast.common.util.JsonTool;

/**
 * <p>
 * 通用 Api Controller 全局异常处理
 * </p>
 */
@RestControllerAdvice
public class GlobalExceptionHandler {
	private static final Logger logger = LoggerFactory
			.getLogger(GlobalExceptionHandler.class);

	/**
	 * <p>
	 * 自定义 REST 业务异常
	 * <p>
	 *
	 * @param e
	 *            异常类型
	 * @return
	 */
	@ExceptionHandler(value = Exception.class)
	public ApiResult handleBadRequest(Exception e) {
		e.printStackTrace();
		/*
		 * 业务逻辑警告提示
		 */
		if (e instanceof ApiException) {
			IErrorCode errorCode = ((ApiException) e).getErrorCode();
			if (null != errorCode) {
				logger.debug("Rest request error, {}", e.getMessage());
				return ApiResult.fail(errorCode.getCode(), e.getMessage());
			}
			logger.debug("Rest request error, {}", e.getMessage());
			return ApiResult.fail(ApiErrorCode.ERROR.getCode(), e.getMessage());
		}

		/*
		 * 参数校验异常
		 */
		if (e instanceof BindException) {
			BindingResult bindingResult = ((BindException) e)
					.getBindingResult();
			if (null != bindingResult && bindingResult.hasErrors()) {
				List<Object> jsonList = new ArrayList<>();
				bindingResult.getFieldErrors().stream().forEach(fieldError -> {
					Map<String, Object> jsonObject = new HashMap<>(2);
					jsonObject.put("name", fieldError.getField());
					jsonObject.put("msg", fieldError.getDefaultMessage());
					jsonList.add(jsonObject);
				});
				return ApiResult.fail(jsonList, ApiErrorCode.ERROR.getCode(),
						JsonTool.beanToJson(jsonList));
			}
		}
		
		/*
		 * 数据关联删除异常
		 */
		if (e instanceof DataIntegrityViolationException) {
			return ApiResult.fail(ApiErrorCode.ERROR.getCode(), "数据关联唯一性限制");
		}
		
		
		/**
		 * 系统内部异常，打印异常栈
		 */
		logger.error("Error: System Exception", e);
		return ApiResult.fail(ApiErrorCode.ERROR.getCode(), e.getMessage());
	}
}
