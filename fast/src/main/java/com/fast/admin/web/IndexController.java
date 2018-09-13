package com.fast.admin.web;

import com.fast.common.supers.SuperController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * 登陆
 *
 * @author yuyanan
 */
@Controller
public class IndexController extends SuperController {


    @RequestMapping({"/", ""})
    String welcome(Model model) {
        return "index";
    }

    @RequestMapping("/login")
    ModelAndView login() {
        return new ModelAndView("temp/login");
    }

    @RequestMapping("/403")
    String error403() {
        return "403";
    }

}
