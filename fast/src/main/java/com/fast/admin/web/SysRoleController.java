package com.fast.admin.web;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.fast.admin.model.bo.SysRoleAddBo;
import com.fast.admin.model.bo.SysRoleEditBo;
import com.fast.admin.model.bo.SysRolePageBo;
import com.fast.common.annotation.Log;
import com.fast.common.api.ApiException;
import com.fast.common.api.ApiResult;
import com.fast.user.entity.SysRole;
import com.fast.user.service.SysRoleService;
import com.google.common.collect.Lists;

/**
 * <p>
 * 角色 前端控制器
 * </p>
 *
 * @author yuyanan
 * @since 2018-07-16
 */
@Api(value = "admin 角色管理", tags = " ")
@RestController
@RequestMapping("/admin/role")
public class SysRoleController extends BasicController {

	@Autowired
	private SysRoleService roleService;

	@ApiOperation("角色列表")
	@Log("角色列表")
	@GetMapping("/list")
	ApiResult<IPage<SysRole>> page(SysRolePageBo pageBo) {
		if (pageBo == null) {
			throw ApiException.ApiExceptionBuilder.error("参数[SysRolePageBo]为空");
		}

		QueryWrapper<SysRole> queryWrapper = new QueryWrapper<>();
		// 条件
		if (StringUtils.isNotBlank(pageBo.getRoleName())) {
			queryWrapper.like("roleName", pageBo.getRoleName());
		}
		// 排序
		if (StringUtils.isNotBlank(pageBo.getField())) {
			queryWrapper.orderBy(true, pageBo.isAsc(), pageBo.getField());
		} else {
			queryWrapper.orderBy(true, false, "createTime");
		}

		IPage<SysRole> page = roleService.page(
				new Page<SysRole>(pageBo.getPage(), pageBo.getLimit()),
				queryWrapper);
		return ApiResult.ok(page);
	}

	@ApiOperation("角色添加")
	@Log("角色添加")
	@PostMapping("/add")
	ApiResult<Object> add(@Validated SysRoleAddBo addBo) {
		if (addBo == null) {
			throw ApiException.ApiExceptionBuilder.error("参数[SysRoleAddBo]为空");
		}
		SysRole role = new SysRole();
		BeanUtils.copyProperties(addBo, role);
		roleService.save(role);
		return ApiResult.ok(null);
	}

	@ApiOperation("角色批量删除")
	@Log("角色批量删除")
	@PostMapping("/dels")
	ApiResult<Object> dels(@RequestParam("ids[]") String[] ids) {
		if (ids == null || ids.length == 0) {
			throw ApiException.ApiExceptionBuilder.error("参数[id]为空");
		}
		List<String> idList = Lists.newArrayList(ids);
		if (idList.contains(admin_id)) {
			throw ApiException.ApiExceptionBuilder.warn("admin帐号是系统管理员,不允许删除");
		}
		roleService.removeByIds(idList);
		return ApiResult.ok(null);
	}

	@ApiOperation("角色id删除")
	@Log("角色id删除")
	@PostMapping("/del")
	ApiResult<Object> del(String id) {
		if (StringUtils.isBlank(id)) {
			throw ApiException.ApiExceptionBuilder.error("参数[id]为空");
		}
		if (id.equals(admin_id)) {
			throw ApiException.ApiExceptionBuilder.warn("admin帐号是系统管理员,不允许删除");
		}
		roleService.removeById(id);
		return ApiResult.ok(null);
	}

	@ApiOperation("根据id查询")
	@Log("根据id查询")
	@PostMapping("/get")
	ApiResult<SysRole> get(String id) {
		if (StringUtils.isBlank(id)) {
			throw ApiException.ApiExceptionBuilder.error("参数[id]为空");
		}
		SysRole user = roleService.getById(id);
		return ApiResult.ok(user);
	}

	@ApiOperation("角色编辑")
	@Log("角色编辑")
	@PostMapping("/edit")
	ApiResult<Object> edit(@Validated SysRoleEditBo user) {
		if (user == null) {
			throw ApiException.ApiExceptionBuilder.error("参数[user]为空");
		}
		if (user.getId() == null) {
			throw ApiException.ApiExceptionBuilder.error("参数[userId]为空");
		}
		try {
			SysRole old = roleService.getById(user.getId());
			if (old == null) {
				throw ApiException.ApiExceptionBuilder.error("参数[userId]无效");
			}
			BeanUtils.copyProperties(user, old);
			roleService.updateById(old);
		} catch (DuplicateKeyException e) {
			throw ApiException.ApiExceptionBuilder.warn("角色名已存在");
		}
		return ApiResult.ok(null);
	}
}
