package com.fast.admin.model.bo;

import lombok.Data;

import com.fast.admin.model.basic.SuperPageBo;

/**
 * 分页查询参数类
 *
 * @author yuyanan
 * @date 2018年9月11日
 */
@Data
public class SysUserPageBo extends SuperPageBo {

    private String username;

    private String realname;

    private String mobile;
}
