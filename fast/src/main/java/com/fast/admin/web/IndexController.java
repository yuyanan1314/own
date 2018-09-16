package com.fast.admin.web;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

import com.fast.common.annotation.Log;
import com.fast.common.supers.SuperController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * 基本导航
 *
 * @author yuyanan
 */
@Api("admin基本导航")
@Controller
public class IndexController extends SuperController {

	@ApiOperation(value = "首页")
    @RequestMapping(value = {"/", ""}, method = RequestMethod.GET)
    String welcome(Model model) {
        return "index";
    }

	@ApiOperation(value = "登陆地址")
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    ModelAndView login() {
        return new ModelAndView("login");
    }

}
