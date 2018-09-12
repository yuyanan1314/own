package com.fast.admin.web;


import com.fast.common.annotation.Log;
import com.fast.common.api.ApiResult;
import com.fast.common.supers.SuperController;
import com.fast.user.entity.SysUser;
import com.fast.user.service.SysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * home
 *
 * @author yuyanan
 * @date 2018年9月11日
 */
@RestController
public class HomeController extends SuperController {

    @Autowired
    private SysUserService userService;

    @Log("获取登录信息")
    @PostMapping("/admin/get-own")
    ApiResult login(String username, String password) {
        SysUser user = getSessionUser();
        return ApiResult.ok(user);
    }

}
