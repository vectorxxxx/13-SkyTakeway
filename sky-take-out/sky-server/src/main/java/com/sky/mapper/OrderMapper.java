package com.sky.mapper;

import com.sky.entity.Orders;
import org.apache.ibatis.annotations.Mapper;

/**
 * @author VectorX
 * @version V1.0
 * @description
 * @date 2024-04-06 15:02:24
 */
@Mapper
public interface OrderMapper
{
    /**
     * 插入订单数据
     *
     * @param order
     */
    void insert(Orders order);
}
