/**
 * All rights Reserved, Designed By www.tydic.com
 * @Title:  WebSecurityConfig.java
 * @Package com.fast.admin.web.config
 * @Description:
 * @author: yuyanan
 * @date:   2018年9月13日
 * @version V1.0
 * @Copyright:  yuyanan
 *
 */
package com.fast.admin.web.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.InterceptorRegistration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurationSupport;

/**
 * 权限拦截器
 *
 * @author: yuyanan
 * @date: 2018年9月13日
 */
@Configuration
public class WebSecurityConfig extends WebMvcConfigurationSupport {

	/**
	 * 自定义权限拦截器bean
	 *
	 * @return
	 */
	@Bean
	public SecurityInterceptor getSecurityInterceptor() {
		return new SecurityInterceptor();
	}

	@Override
	public void addCorsMappings(CorsRegistry registry) {
		registry.addMapping("/**");
	}

	@Override
	protected void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/**").addResourceLocations(
				"classpath:/static/");
		super.addResourceHandlers(registry);
	}

	/**
	 * 加入自定义拦截器
	 */
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		InterceptorRegistration addInterceptor = registry
				.addInterceptor(getSecurityInterceptor());

		// 排除配置
		addInterceptor.excludePathPatterns("/o/login");
		addInterceptor.excludePathPatterns("/login");
		addInterceptor.excludePathPatterns("/favicon.ico");
		addInterceptor.excludePathPatterns("/error");
		// 拦截配置
		addInterceptor.addPathPatterns("/admin/**");
	}

}
