/**
 * All rights Reserved, Designed By www.tydic.com
 * @Title:  WebSecurityConfig.java
 * @Package com.fast.admin.config
 * @Description:
 * @author: yuyanan
 * @date:   2018年9月13日
 * @version V1.0
 * @Copyright:  yuyanan
 *
 */
package com.fast.admin.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.format.FormatterRegistry;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;
import org.springframework.web.filter.CorsFilter;
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
	
	 @Bean
	    public CorsFilter corsFilter() {
	        final UrlBasedCorsConfigurationSource urlBasedCorsConfigurationSource = new UrlBasedCorsConfigurationSource();
	        final CorsConfiguration corsConfiguration = new CorsConfiguration();
	        corsConfiguration.setAllowCredentials(true);
	        corsConfiguration.addAllowedOrigin("*");
	        corsConfiguration.addAllowedHeader("*");
	        corsConfiguration.addAllowedMethod("*");
	        urlBasedCorsConfigurationSource.registerCorsConfiguration("/**", corsConfiguration);
	        return new CorsFilter(urlBasedCorsConfigurationSource);
	    }

	/**
	 * 跨域
	 */
	@Override
	public void addCorsMappings(CorsRegistry registry) {
		registry.addMapping("/**");
	}

	/**
	 * 资源映射
	 */
	@Override
	protected void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/**").addResourceLocations(
				"classpath:/static/");
		//swagger2配置 否则swagger-ui.html会被拦截而导致404
		registry.addResourceHandler("swagger-ui.html").addResourceLocations("classpath:/META-INF/resources/").setCachePeriod(0);
		registry.addResourceHandler("/webjars/**").addResourceLocations("classpath:/META-INF/resources/webjars/").setCachePeriod(0);
		super.addResourceHandlers(registry);
	}
	
	/**
	 * 注册枚举转换器
	 */
	@Override
    public void addFormatters(FormatterRegistry registry) {
        registry.addConverterFactory(new StringToBaseEnumConverterFactory());
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
		addInterceptor.excludePathPatterns("swagger-ui.html");
		addInterceptor.excludePathPatterns("/webjars/**");
		
		// 拦截配置
		addInterceptor.addPathPatterns("/admin/**");
	}

}
