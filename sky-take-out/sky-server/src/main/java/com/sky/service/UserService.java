package com.sky.service;

import com.sky.dto.UserLoginDTO;
import com.sky.entity.User;

/**
 * @author VectorX
 * @version V1.0
 * @description
 * @date 2024-04-05 14:30:08
 */
public interface UserService
{
    /**
     * 微信登录
     *
     * @param userLoginDTO
     * @return
     */
    User wxLogin(UserLoginDTO userLoginDTO);
}
