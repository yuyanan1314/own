package com.fast.admin.web;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.fast.common.annotation.Log;
import com.fast.common.api.ApiResult;
import com.fast.common.supers.SuperController;
import com.fast.user.entity.SysUser;
import com.fast.user.service.SysUserService;

/**
 * admin登录
 *
 * @author yuyanan
 * @date 2018年9月11日
 */
@Api(tags = "admin-登陆")
@RestController
public class LoginController extends SuperController {

	@Autowired
	private SysUserService userService;

	@ApiOperation(value = "登陆")
	@Log("登录")
	@PostMapping("/o/login")
	ApiResult<Object> login(String username, String password) {
		
		SysUser user = userService.login(username, password);
		setSessionUser(user);
		return ApiResult.ok(null);
	}

}
