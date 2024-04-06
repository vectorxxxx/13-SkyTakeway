package com.sky.mapper;

import com.sky.entity.OrderDetail;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @author VectorX
 * @version V1.0
 * @description
 * @date 2024-04-06 15:04:43
 */
@Mapper
public interface OrderDetailMapper
{
    /**
     * 批量插入订单明细数据
     *
     * @param orderDetails
     */
    void insertBatch(List<OrderDetail> orderDetails);
}
