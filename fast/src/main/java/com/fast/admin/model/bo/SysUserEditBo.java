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


import java.io.Serializable;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

import javax.validation.constraints.NotBlank;

import lombok.Data;

import com.fast.user.entity.enums.SexEnum;
import com.fast.user.entity.enums.SysUserStatusEnum;

/**    
 *  
 * @author: yuyanan
 * @date:   2018年9月17日      
 */
@Data
@ApiModel("用户编辑入参")
public class SysUserEditBo implements Serializable{
	
	private static final long serialVersionUID = 1L;

	@NotBlank
    private String id;
    
    @ApiModelProperty("用户名")
    private String realname;
    
    @ApiModelProperty("性别")
    private SexEnum sex;
    
    @ApiModelProperty("邮箱")
    private String email;
    
    @ApiModelProperty("手机号")
    private String mobile;
    
    @ApiModelProperty("账号状态")
    private SysUserStatusEnum status;
    
    /**
     * 角色id
     */
    @ApiModelProperty("角色id")
    private String roleId;
}
