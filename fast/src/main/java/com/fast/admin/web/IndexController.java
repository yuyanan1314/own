package com.fast.admin.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fast.common.annotation.Log;
import com.fast.common.supers.SuperController;
import com.fast.user.service.SysUserService;

/**
 * 登陆
 * 
 * @author yuyanan
 *
 */
@Controller
public class IndexController extends SuperController {


	@Log("重定向到登录")
	@GetMapping({ "/", "" })
	String welcome(Model model) {
		return "redirect:/login";
	}

	@Log("页登录")
	@GetMapping("/login")
	ModelAndView login() {
		return new ModelAndView("login");
	}

	@GetMapping("/logout")
	@Log("退出")
	String logout() {
		// ShiroTool.logout();
		return "redirect:/login";
	}

	@Log("主页")
	@GetMapping("/index")
	String main() {
		return "index";
	}

	@Log("错误403")
	@GetMapping("/403")
	String error403() {
		return "403";
	}

}
