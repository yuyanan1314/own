package com.fast.common.supers;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;


/**
 * mapper父类，注意这个类不要让 mp 扫描到！！
 *
 * @author yuyanan
 * @since 2018-07-13
 */
public interface SuperDao<T> extends BaseMapper<T> {

    // 这里可以放一些公共的方法

}
