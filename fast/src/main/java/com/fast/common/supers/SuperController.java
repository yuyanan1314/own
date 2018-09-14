package com.fast.common.supers;


import com.fast.admin.model.basic.SessionSysUser;
import com.fast.user.entity.SysUser;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.BeanUtils;
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

    public static final String SESSION_USER = "sysUser";

    protected void setSessionUser(SysUser user) {
        SessionSysUser sessionSysUser = new SessionSysUser();
        BeanUtils.copyProperties(user,sessionSysUser);
        request.getSession().setAttribute(SESSION_USER, sessionSysUser);
    }

    protected SessionSysUser getSessionUser() {
        return (SessionSysUser) request.getSession().getAttribute(SESSION_USER);
    }

}
