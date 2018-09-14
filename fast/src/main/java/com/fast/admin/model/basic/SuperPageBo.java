package com.fast.admin.model.basic;

import lombok.Data;

/**
 * 分页查询参数基类
 *
 * @author yuyanan
 * @date 2018年9月11日
 */
@Data
public class SuperPageBo {

    /**
     * 页号
     */
    Integer page;

    /**
     * 每页数量
     */
    Integer limit;

}
