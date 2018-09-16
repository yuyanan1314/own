package com.fast.admin.web;


import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

import com.fast.admin.model.basic.SessionSysUser;
import com.fast.common.annotation.Log;
import com.fast.common.api.ApiResult;
import com.fast.common.supers.SuperController;
import com.fast.user.service.SysUserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 * home
 *
 * @author yuyanan
 * @date 2018年9月11日
 */
@Api("admin登陆后的基本功能")
@RestController
public class HomeController extends SuperController {

    @Autowired
    private SysUserService userService;

	@ApiOperation(value = "获取登录用户信息")
    @Log("获取登录用户信息")
    @PostMapping("/admin/get-own")
    ApiResult<SessionSysUser> login() {
        SessionSysUser user = getSessionUser();
        return ApiResult.ok(user);
    }
    
    @ApiOperation("退出登录")
	@Log("退出登录")
	@RequestMapping(value = "/admin/logout", method = RequestMethod.GET)
	String logout() {
		request.getSession().invalidate();
		return "redirect:/login";
	}

}
