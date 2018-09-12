package com.fast.common.config;

import com.baomidou.mybatisplus.core.parser.ISqlParser;
import com.baomidou.mybatisplus.extension.plugins.OptimisticLockerInterceptor;
import com.baomidou.mybatisplus.extension.plugins.PaginationInterceptor;
import com.baomidou.mybatisplus.extension.plugins.PerformanceInterceptor;
import com.baomidou.mybatisplus.extension.plugins.tenant.TenantHandler;
import com.baomidou.mybatisplus.extension.plugins.tenant.TenantSqlParser;

import java.util.ArrayList;
import java.util.List;

import net.sf.jsqlparser.expression.Expression;
import net.sf.jsqlparser.expression.LongValue;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;

/**
 * mybatis-plus configuration
 * 
 * @author yuyanan
 * @date 2018年7月21日
 */
@Configuration
@MapperScan("com.fast.*.dao.*Dao")
public class MybatisPlusConfig {

	/***
	 * plus 的性能优化 设置 dev test 环境开启
	 *
	 * @return PerformanceInterceptor
	 */
	@Bean
	@Profile({ "dev", "test" })
	public PerformanceInterceptor performanceInterceptor() {
		PerformanceInterceptor performanceInterceptor = new PerformanceInterceptor();
		/* <!-- SQL 执行性能分析，开发环境使用，线上不推荐。 maxTime 指的是 sql 最大执行时长 --> */
		performanceInterceptor.setMaxTime(1000);
		/* <!--SQL是否格式化 默认false--> */
		performanceInterceptor.setFormat(true);
		return performanceInterceptor;
	}

	/**
	 * 乐观锁 插件
	 *
	 * @return
	 */
	@Bean
	public OptimisticLockerInterceptor optimisticLoker() {
		return new OptimisticLockerInterceptor();
	}

	/**
	 * 分页插件，自动识别数据库类型
	 * 
	 * @return PaginationInterceptor
	 */
	@Bean
	public PaginationInterceptor paginationInterceptor() {
		PaginationInterceptor paginationInterceptor = new PaginationInterceptor();
		return paginationInterceptor;
	}

}
