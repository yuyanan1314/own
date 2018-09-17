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
public class SysUserEditBo {
	
	/**
     * 主键 uuid
     */
	@NotBlank
    private String id;
    
    /**
     * 用户名
     */
    @NotBlank
    private String username;
    /**
     * 真实姓名
     */
    private String realname;
    /**
     * 性别
     */
    private SexEnum sex;
    /**
     * email
     */
    private String email;
    /**
     * 手机号
     */
    private String mobile;
    /**
     * 状态
     */
    private SysUserStatusEnum status;
}
