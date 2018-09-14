/**  
 * All rights Reserved, Designed By www.tydic.com
 * @Title:  IErrorCode.java   
 * @Package com.fast.common.supers   
 * @Description:   
 * @author yuyanan
 * @date   2018年9月11日
 * @version V1.0 
 * @Copyright:  yuyanan
 * 
 */
package com.fast.common.api;

/**
 * <p>
 * REST API 错误码接口
 * </p>
 *
 * @author hubin
 * @since 2018-06-05
 */
public interface IErrorCode {

    /**
     * 错误编码 0、失败 1、正常
     */
    long getCode();

    /**
     * 错误描述
     */
    String getMsg();
}
