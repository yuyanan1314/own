package com.fast.common.supers;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.baomidou.mybatisplus.annotation.Version;
import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 实体父类
 *
 * @author yuyanan
 * @since 2018-07-13
 */
@Data
public class SuperEntity implements Serializable {

    /**
     * 主键 uuid
     */
    @TableId(type = IdType.UUID)
    private String id;

    /**
     * 创建时间
     */
    @TableField(value = "create_time", fill = FieldFill.INSERT)
    private Date createTime;

    /**
     * 更新时间
     */
    @TableField(value = "update_time", fill = FieldFill.UPDATE)
    private Date updateTime;

//    /**
//     * 是否删除 1是 0否
//     */
//    @TableLogic
//    @TableField(value = "deleted")
//    private Integer deleted;
//
//    /**
//     * 乐观锁-版本号
//     */
//    @Version
//    @TableField(value = "version")
//    private Integer version;

}
