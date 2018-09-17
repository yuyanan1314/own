/**  
 * All rights Reserved, Designed By www.tydic.com
 * @Title:  SysUserEditBo.java   
 * @Package com.fast.admin.model.bo   
 * @Description:   
 * @author: yuyanan  
 * @date:   2018年9月17日   
 * @version V1.0 
 * @Copyright:  yuyanan
 * 
 */
package com.fast.admin.model.bo;


import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

import javax.validation.constraints.NotBlank;

import lombok.Data;

/**    
 * 角色添加参数类
 *  
 * @author: yuyanan
 * @date:   2018年9月17日      
 */
@ApiModel("角色添加参数类")
@Data
public class SysRoleAddBo {
    
	@ApiModelProperty("角色名称")
    @NotBlank
    private String roleName;
  
}
