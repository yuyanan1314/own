package com.fast.admin.web;

import com.fast.common.api.ApiResult;
import com.fast.user.entity.enums.SexEnum;
import org.springframework.web.bind.annotation.PostMapping;

/**
 * 静态数据获取
 *
 * @author yuyanan
 * @date 2018年9月11日
 */
public class StaticDataController {

    /**
     * 性别
     *
     * @return ApiResult
     */
    @PostMapping("/o/user-sex")
    ApiResult getUser() {
        return ApiResult.ok(SexEnum.values());
    }

}
