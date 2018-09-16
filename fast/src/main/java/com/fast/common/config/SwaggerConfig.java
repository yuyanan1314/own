/**  
 * All rights Reserved, Designed By www.tydic.com
 * @Title:  SwaggerConfig.java   
 * @Package com.fast.common.config   
 * @Description:   
 * @author: yuyanan  
 * @date:   2018年9月16日   
 * @version V1.0 
 * @Copyright:  yuyanan
 * 
 */
package com.fast.common.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;

import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

/**
 * SwaggerConfig
 * 
 * @author: yuyanan
 * @date: 2018年9月16日
 */
@EnableSwagger2
@Profile({ "dev" })
@Configuration
public class SwaggerConfig {
	@Bean
	public Docket docket() {
		return new Docket(DocumentationType.SWAGGER_2)
				.apiInfo(apiInfo())
				.select()
				// 当前包路径
				.apis(RequestHandlerSelectors
						.basePackage("com.fast.admin.web"))
				.paths(PathSelectors.any()).build();

	}

	// 构建api文档的详细信息函数
	private ApiInfo apiInfo() {
		return new ApiInfoBuilder()
		// 页面标题
				.title("FAST ADMIN API")
                .description("fast项目后台api接口文档")
                .version("1.0")
				// 版本号
				.version("1.0")
				// 描述
				.description("API 描述").build();
	}

}
