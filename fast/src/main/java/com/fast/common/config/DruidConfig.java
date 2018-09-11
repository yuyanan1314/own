/*
 * Copyright (c) 2018. Beyondsoft Corporation.
 * All Rights Reserved.
 *
 * BEYONDSOFT CONFIDENTIALITY
 *
 * The information in this file is confidential and privileged from Beyondsoft Corporation,
 * which is intended only for use solely by Beyondsoft Corporation.
 * Disclosure, copying, distribution, or use of the contents of this file by persons other than Beyondsoft Corporation
 * is strictly prohibited and may violate applicable laws.
 */
package com.fast.common.config;

import com.alibaba.druid.support.http.StatViewServlet;
import com.alibaba.druid.support.http.WebStatFilter;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.boot.web.servlet.ServletRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * druid 配置
 *  
 * @author: yuyanan
 * @date:   2018年7月21日
 */
@Configuration
public class DruidConfig {

    /**
     * 允许访问的标示.
     */
    private static final String ALLOW = "allow";

    /**
     * 禁止访问的标示.
     */
    private static final String DENY = "deny";

    /**
     * 所有资源.
     */
    private static final String ALL = "*";

    /**
     * 访问servlet资源的用户名标示.
     */
    private static final String  LOGIN_USER_NAME = "loginUsername";

    /**
     * 访问servlet资源的密码标示.
     */
    private static final String  LOGIN_PASSWORD = "loginPassword";

    /**
     * 是否刷新标示.
     */
    private static final String  RESET_ENABLE = "resetEnable";

    /**
     * 自定义用户名.
     */
    @Value("${druid.username:root}")
    private String userName;

    /**
     * 自定义用户名.
     */
    @Value("${druid.password:100085}")
    private String password;

    /**
     * 是否开启重置统计数据的选项.
     */
    @Value("${druid.reset-enable:false}")
    private String resetEnable;

    /**
     * 注册StatViewServlet
     *
     * @return  注册StatViewServlet
     */
    @Bean
    public ServletRegistrationBean DruidStatViewServlet(){
        //注册StatViewServlet到容器.
        ServletRegistrationBean servletRegistrationBean = new ServletRegistrationBean(new StatViewServlet(), "/druid/*");

        //添加初始化参数：initParams
        //白名单：
        //servletRegistrationBean.addInitParameter(ALLOW, ALL);
        //IP黑名单 (存在共同时，deny优先于allow) : 如果满足deny的话提示:Sorry, you are not permitted to view this page.
        servletRegistrationBean.addInitParameter(DENY,"");
        //登录查看信息的账号密码.
        servletRegistrationBean.addInitParameter(LOGIN_USER_NAME, userName);
        servletRegistrationBean.addInitParameter(LOGIN_PASSWORD, password);
        //是否能够重置数据.
        servletRegistrationBean.addInitParameter(RESET_ENABLE, resetEnable);
        return servletRegistrationBean;
    }

    /**
     * 注册一个：filterRegistrationBean
     * @return
     */
    @Bean
    public FilterRegistrationBean druidStatFilter(){

        FilterRegistrationBean filterRegistrationBean = new FilterRegistrationBean(new WebStatFilter());

        //添加过滤规则.
        filterRegistrationBean.addUrlPatterns("/sys/*", "/p/*", "/c/*", "/l/*");

        //添加不需要忽略的格式信息.
        filterRegistrationBean.addInitParameter("exclusions","*.js,*.gif,*.jpg,*.png,*.css,*.ico,/druid2/*");
        return filterRegistrationBean;
    }
}
