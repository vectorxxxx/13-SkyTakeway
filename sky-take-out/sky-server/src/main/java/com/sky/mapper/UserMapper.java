package com.sky.mapper;

import com.sky.entity.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.time.LocalDateTime;
import java.util.Map;

/**
 * @author VectorX
 * @version V1.0
 * @description
 * @date 2024-04-05 14:31:58
 */

@Mapper
public interface UserMapper
{
    /**
     * 根据动态条件统计用户数量
     *
     * @param map
     * @return
     */
    Integer countByMap(Map<String, LocalDateTime> map);

    /**
     * 根据openid查询用户
     *
     * @param openid
     * @return
     */
    @Select("select * from user where openid = #{openid}")
    User getByOpenid(String openid);

    /**
     * 插入数据
     *
     * @param user
     */
    void insert(User user);

    /**
     * @param userId
     * @return {@link User}
     */
    @Select("select * from user where id = #{userId}")
    User getById(Long userId);
}
