package com.fast.admin.model.bo;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import com.fast.admin.model.basic.SuperPageBo;

/**
 * 角色分页查询参数类
 *
 * @author yuyanan
 * @date 2018年9月11日
 */
@ApiModel("角色分页查询参数类")
@Data
public class SysRolePageBo extends SuperPageBo {
	
	@ApiModelProperty("角色名称")
    private String roleName;
    
}
