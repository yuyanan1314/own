/**  
 * All rights Reserved, Designed By www.tydic.com
 * @Title:  SuperServiceImpl.java   
 * @Package com.fast.common.supers   
 * @Description:    TODO(用一句话描述该文件做什么)   
 * @author: yuyanan  
 * @date:   2018年7月21日   
 * @version V1.0 
 * @Copyright:  yuyanan
 * 
 */
package com.fast.common.supers;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

/**
 * 
 * @author: yuyanan
 * @date: 2018年7月21日
 */
public abstract class SuperServiceImpl<M extends SuperDao<T>, T> extends
		ServiceImpl<M, T> implements SuperService<T> {
}
