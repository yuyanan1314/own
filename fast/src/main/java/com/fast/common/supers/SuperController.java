package com.fast.common.supers;


import com.fast.user.entity.SysUser;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * web接口父类
 *
 * @author yuyanan
 * @date 2018年7月21日
 */
public class SuperController {

    @Autowired
    protected HttpServletRequest request;

    private static final String SESSION_USER = "sysUser";

    protected void setSessionUser(SysUser user) {
        request.getSession().setAttribute(SESSION_USER, user);
    }

    protected SysUser getSessionUser() {
        return (SysUser) request.getSession().getAttribute(SESSION_USER);
    }

}
