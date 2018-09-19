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

import com.fast.user.entity.enums.SexEnum;
import com.fast.user.entity.enums.SysUserStatusEnum;

/**    
 *  
 * @author: yuyanan
 * @date:   2018年9月17日      
 */
@Data
@ApiModel("返回响应信息")
public class SysUserAddBo {
	
    /**
     * 用户名
     */
	@ApiModelProperty("用户名")
    @NotBlank
    private String username;
    
    /**
     * 密码
     */
	@ApiModelProperty("密码")
    @NotBlank
    private String password;
    
    /**
     * 真实姓名
     */
	@ApiModelProperty("真实姓名")
    private String realname;
	
    /**
     * 性别
     */
	@ApiModelProperty("性别")
    private SexEnum sex;
    /**
     * email
     */
	@ApiModelProperty("email")
    private String email;
    /**
     * 手机号
     */
	@ApiModelProperty("手机号")
    private String mobile;
    
    /**
     * 角色id
     */
	@ApiModelProperty("角色id")
    @NotBlank
    private String roleId;
}
