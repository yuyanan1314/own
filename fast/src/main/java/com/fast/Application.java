/*
 *
 *  * Copyright (c) 2018. Beyondsoft Corporation.
 *  * All Rights Reserved.
 *  *
 *  * BEYONDSOFT CONFIDENTIALITY
 *  *
 *  * The information in this file is confidential and privileged from Beyondsoft Corporation,
 *  * which is intended only for use solely by Beyondsoft Corporation.
 *  * Disclosure, copying, distribution, or use of the contents of this file by persons other than Beyondsoft Corporation
 *  * is strictly prohibited and may violate applicable laws.
 *
 */

package com.fast;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import com.fast.common.log.aop.EnableAutoLog;

/**
 * 程序入口类
 *
 * @author Deament
 * @date 2017/1/1
 */
@MapperScan("com.fast.*.dao")
@SpringBootApplication
public class Application {

    /**
     * @EnableAutoConfiguration //这个注解可以根据你依赖的包自动生成相关配置
     * @EnableAdminServer spring boot admin监控 ，不喜欢可以不要
     **/
    public static void main(String[] args) {
        // 禁用重启
        // System.setProperty("spring.devtools.restart.enabled", "false");
        SpringApplication.run(Application.class, args);
    }

}
