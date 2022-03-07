package com.crazymaker.springcloud.stock.consumer;

import lombok.AccessLevel;
import lombok.NoArgsConstructor;

/**
 * Canal监听SQL类型
 *
 * @author Yu
 * @date 2019/09/08 00:18
 **/
@NoArgsConstructor(access = AccessLevel.PRIVATE)
public class SQLType {

    /**
     * 插入
     */
    public static final String INSERT = "INSERT";
    /**
     * 更新
     */
    public static final String UPDATE = "UPDATE";
    /**
     * 删除
     */
    public static final String DELETE = "DELETE";

}