/**  
 * All rights Reserved, Designed By www.tydic.com
 * @Title:  IBindEnum.java   
 * @Package com.fast.common.supers   
 * @Description:   
 * @author: yuyanan  
 * @date:   2018年9月15日   
 * @version V1.0 
 * @Copyright:  yuyanan
 * 
 */
package com.fast.common.supers;

/**    
 * 枚举转换接口 
 * mvc在接收参数时需如果需要转换为枚举
 * 则枚举类实现此接口
 * @author: yuyanan
 * @date:   2018年9月15日      
 */
public interface IBindEnum {
	/**
	 * 枚举key
	 * @return
	 */
	String getKey();
}
