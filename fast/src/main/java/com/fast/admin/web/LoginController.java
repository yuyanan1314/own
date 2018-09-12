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
 * admin登录
 *
 * @author yuyanan
 * @date 2018年9月11日
 */
@RestController
public class LoginController extends SuperController {

    @Autowired
    private SysUserService userService;

    @Log("登录")
    @PostMapping("/admin/login")
    ApiResult login(String username, String password) {
        SysUser user = userService.login(username, password);
        setSessionUser(user);
        return ApiResult.ok(null);
    }

}
