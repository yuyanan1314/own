package com.fast.admin.web;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.fast.admin.model.bo.SysUserAddBo;
import com.fast.admin.model.bo.SysUserEditBo;
import com.fast.admin.model.bo.SysUserPageBo;
import com.fast.common.api.ApiException;
import com.fast.common.api.ApiResult;
import com.fast.common.log.annotation.Log;
import com.fast.common.util.Constant.Sys;
import com.fast.user.entity.SysUser;
import com.fast.user.entity.SysUserRole;
import com.fast.user.entity.enums.SexEnum;
import com.fast.user.entity.enums.SysUserStatusEnum;
import com.fast.user.service.SysRoleService;
import com.fast.user.service.SysUserRoleService;
import com.fast.user.service.SysUserService;
import com.google.common.collect.Lists;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * 用户表 前端控制器
 * </p>
 *
 * @author yuyanan
 * @since 2018-07-16
 */
@Api(tags = {"admin-用户管理"})
@RestController
@RequestMapping("/admin/sysUser")
public class SysUserController extends BasicController {

	@Autowired
	private SysUserService sysUserService;
	
	@Autowired
	private SysUserRoleService sysUserRoleService;

	@ApiOperation("用户列表")
	@Log("用户列表")
	@GetMapping("/list")
	ApiResult<IPage<SysUser>> page(SysUserPageBo pageBo) {
		
		return ApiResult.ok(sysUserService.page(pageBo));
	}

	@ApiOperation(value = "用户添加")
	@Log("用户添加")
	@PostMapping("/add")
	ApiResult<Object> add(@Validated SysUserAddBo addBo) {
		if (addBo == null) {
			throw ApiException.ApiExceptionBuilder.error("参数[user]为空");
		}
		try {
			SysUser user = new SysUser();
			BeanUtils.copyProperties(addBo, user);
			user.setStatus(SysUserStatusEnum.OPEN);
			sysUserService.save(user);
			//添加用户角色关系
			SysUserRole userRole = new SysUserRole();
			userRole.setUserId(user.getId());
			userRole.setRoleId(addBo.getRoleId());
			sysUserRoleService.save(userRole);
		} catch (DuplicateKeyException e) {
			throw ApiException.ApiExceptionBuilder.warn("用户名已存在");
		}
		return ApiResult.ok(null);
	}

	@ApiOperation("用户批量删除")
	@Log("用户批量删除")
	@PostMapping("/dels")
	ApiResult<Object> dels(@RequestParam("ids[]") String[] ids) {
		if (ids == null || ids.length == 0) {
			throw ApiException.ApiExceptionBuilder.error("参数[id]为空");
		}
		List<String> idList = Lists.newArrayList(ids);
		sysUserService.removeByIds(idList);
		return ApiResult.ok(null);
	}

	@ApiOperation("用户id删除")
	@Log("用户id删除")
	@PostMapping("/del")
	ApiResult<Object> del(String id) {
		sysUserService.removeById(id);
		return ApiResult.ok(null);
	}

	@ApiOperation("修改性别")
	@Log("修改性别")
	@PostMapping("/sex")
	ApiResult<Object> sex(String id, SexEnum sex) {
		sysUserService.updateSex(id, sex);
		return ApiResult.ok(null);
	}

	@ApiOperation("帐号锁定")
	@Log("修改性别")
	@PostMapping("/status")
	ApiResult<Object> status(String id, SysUserStatusEnum statusEnum) {
		if (id.equals(SysUserService.admin_id)){
			throw ApiException.ApiExceptionBuilder.warn("admin帐号是系统管理员,不允许锁定");
		}
		sysUserService.updateStatus(id, statusEnum);
		return ApiResult.ok(null);
	}
	
	@ApiOperation("根据id查询")
	@Log("根据id查询")
	@PostMapping("/get")
	ApiResult<SysUser> get(String id) {
		if (StringUtils.isBlank(id)) {
			throw ApiException.ApiExceptionBuilder.error("参数[id]为空");
		}
		SysUser user = sysUserService.getById(id);
		return ApiResult.ok(user);
	}
	
	@ApiOperation("用户编辑")
	@Log("用户编辑")
	@PostMapping("/edit")
	ApiResult<Object> edit(@Validated SysUserEditBo user) {
		if (user == null) {
			throw ApiException.ApiExceptionBuilder.error("参数[user]为空");
		}
		if (user.getId() == null) {
			throw ApiException.ApiExceptionBuilder.error("参数[userId]为空");
		}
		try {
			SysUser old = sysUserService.getById(user.getId());
			if (old == null) {
				throw ApiException.ApiExceptionBuilder.error("参数[userId]无效");
			}
			BeanUtils.copyProperties(user, old);
			sysUserService.updateById(old);
		} catch (DuplicateKeyException e) {
			throw ApiException.ApiExceptionBuilder.warn("用户名已存在");
		}
		return ApiResult.ok(null);
	}
}
