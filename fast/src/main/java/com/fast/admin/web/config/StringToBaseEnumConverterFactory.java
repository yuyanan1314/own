/**  
 * All rights Reserved, Designed By www.tydic.com
 * @Title:  StringToBaseEnumConverterFactory.java   
 * @Package com.fast.admin.web.config   
 * @Description:   
 * @author: yuyanan  
 * @date:   2018年9月15日   
 * @version V1.0 
 * @Copyright:  yuyanan
 * 
 */
package com.fast.admin.web.config;

import org.springframework.core.convert.converter.Converter;
import org.springframework.core.convert.converter.ConverterFactory;

import com.fast.common.supers.IBindEnum;

/**    
 * 解决mvc String转换为枚举的问题
 * @author: yuyanan
 * @date:   2018年9月15日      
 */
public class StringToBaseEnumConverterFactory implements ConverterFactory<String, IBindEnum>{

	/* (non-Javadoc)
	 * @see org.springframework.core.convert.converter.ConverterFactory#getConverter(java.lang.Class)
	 */
	@Override
	public <T extends IBindEnum> Converter<String, T> getConverter(
			Class<T> targetType) {
		if (!targetType.isEnum()) {
            throw new UnsupportedOperationException("只支持转换到枚举类型");
        }
        return new StringToBaseEnumConverter(targetType);
	}

	 private class StringToBaseEnumConverter<T extends IBindEnum> implements Converter<String, T> {
	        private final Class<T> enumType;

	        public StringToBaseEnumConverter(Class<T> enumType) {
	            this.enumType = enumType;
	        }

	        @Override
	        public T convert(String s) {
	            for (T t : enumType.getEnumConstants()) {
	                if (s.equals(t.getKey())) {
	                    return t;
	                }
	            }
	            return null;
	        }
	    }
	

}
