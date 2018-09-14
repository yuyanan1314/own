package com.fast.admin.model.basic;

import com.fast.common.supers.IBindEnum;

import lombok.Data;

/**
 * 分页查询参数基类
 *
 * @author yuyanan
 * @date 2018年9月11日
 */
@Data
public class SuperPageBo {

    /**
     * 页号
     */
    private Integer page;

    /**
     * 每页数量
     */
    private Integer limit;
    
    /**
     * 排序属性
     */
    private String field;
    
    /**
     * 正序/倒序 asc/desc
     */
    private OrderEnum order;
    
    /**
     * 是否升序
     * @return
     */
    public boolean isAsc(){
		if(order == OrderEnum.asc ){
			return true;
		}
		return false;
	}
    
    /**
     * 排序
     *  
     * @author: yuyanan
     * @date:   2018年9月15日
     */
    public enum OrderEnum implements IBindEnum{
    	asc("asc"),desc("desc");
    	private String value;

    	/**
		 * @return the value
		 */
		public String getValue() {
			return value;
		}
    	
		/**
		 * @param value
		 */
		private OrderEnum(String value) {
			this.value = value;
		}

		@Override
		public String getKey() {
			return value;
		}
  	
    }

}


