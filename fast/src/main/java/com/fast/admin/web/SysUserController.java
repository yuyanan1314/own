package com.fast.admin.web;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.fast.admin.model.bo.SysUserPageBo;
import com.fast.common.annotation.Log;
import com.fast.common.api.ApiResult;
import com.fast.user.entity.SysUser;
import com.fast.user.service.SysUserService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * 用户表  前端控制器
 * </p>
 *
 * @author yuyanan
 * @since 2018-07-16
 */
@RestController
@RequestMapping("/admin/sysUser")
public class SysUserController {

    @Autowired
    private SysUserService sysUserService;

    @Log("用户列表")
    @GetMapping("/list")
    ApiResult page(SysUserPageBo pageBo) {
        QueryWrapper<SysUser> queryWrapper = new QueryWrapper<>();
        //条件
        if(pageBo != null) {
            if(StringUtils.isNotBlank(pageBo.getUsername())){
                queryWrapper.like("username", pageBo.getUsername());
            }
            if(StringUtils.isNotBlank(pageBo.getRealname())){
                queryWrapper.like("realname", pageBo.getRealname());
            }
            if(StringUtils.isNotBlank(pageBo.getMobile())){
                queryWrapper.like("mobile", pageBo.getMobile());
            }
        }
        //排序
        if(StringUtils.isNotBlank(pageBo.getField())){
        	queryWrapper.orderBy(true, pageBo.isAsc(), pageBo.getField());
        }else{
        	queryWrapper.orderBy(true, false, "createTime");
        }
        
        IPage<SysUser>  page = sysUserService.page(new Page<SysUser>(pageBo.getPage(), pageBo.getLimit()), queryWrapper);
        return ApiResult.ok(page);
    }
}
