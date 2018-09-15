package com.fast.admin.web;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.fast.admin.model.bo.SysUserPageBo;
import com.fast.common.annotation.Log;
import com.fast.common.api.ApiException;
import com.fast.common.api.ApiResult;
import com.fast.user.entity.SysUser;
import com.fast.user.service.SysUserService;
import com.google.common.collect.Lists;
import java.util.List;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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

    @Log("用户添加")
    @PostMapping("/add")
        ApiResult add(@Validated SysUser user) {

        try {
            sysUserService.save(user);
        }catch (DuplicateKeyException e){
            throw new ApiException("帐号已存在");
        }
        return ApiResult.ok(null);
    }

    @Log("用户删除")
    @PostMapping("/del")
    ApiResult add(@RequestParam("ids[]") String[] ids) {
        if(ids == null ||ids.length == 0){
            throw new ApiException("参数为空");
        }
        try {
            sysUserService.removeByIds(Lists.newArrayList(ids));
        }catch (DuplicateKeyException e){
            throw new ApiException("帐号已存在");
        }
        return ApiResult.ok(null);
    }
}
