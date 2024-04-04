package com.sky.annotation;

import com.sky.enumeration.OperationType;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * @author VectorX
 * @version V1.0
 * @description 自定义注解，用于标识某个方法需要进行功能字段自动填充处理
 * @date 2024-04-04 15:55:36
 */
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
public @interface AutoFill
{
    // 数据库操作类型：UPDATE INSERT
    OperationType value();
}
