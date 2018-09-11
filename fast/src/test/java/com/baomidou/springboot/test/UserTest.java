package com.baomidou.springboot.test;


import java.util.List;

import lombok.extern.slf4j.Slf4j;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.fast.Application;
import com.fast.user.entity.SysUser;
import com.fast.user.service.SysUserService;


@Slf4j
@RunWith(SpringRunner.class)
//@WebAppConfiguration
@EnableTransactionManagement
@SpringBootTest(classes = Application.class)
public class UserTest {

    @Autowired
    private SysUserService userService;

    @Rollback(false)
    @Test
    public void testSelect() {
    	
       
       
        
   	int count =   userService.count(new QueryWrapper<SysUser>().like("username", "admin") );
    	System.out.println(count);
    	IPage<SysUser> page = new Page<SysUser>(1,2);
    	page.setCurrent(1);
    	page.setSize(1);
    IPage<SysUser> p = 	userService.page(page,new QueryWrapper<SysUser>().like("username", "admin"));
    System.out.println(p.getRecords().size());
    
    }

    
    
    
    
}