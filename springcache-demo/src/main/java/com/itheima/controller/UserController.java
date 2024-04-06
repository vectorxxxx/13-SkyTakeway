package com.itheima.controller;

import com.itheima.entity.User;
import com.itheima.mapper.UserMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/user")
@Slf4j
public class UserController
{

    @Autowired
    private UserMapper userMapper;

    /**
     * CachePut：将方法返回值放入缓存
     * <p>
     * value：缓存的名称，每个缓存名称下面可以有多个key
     * <p>
     * key：缓存的key
     */
    @PostMapping
    @CachePut(value = "userCache",
              key = "#user.id")
    public User save(
            @RequestBody
                    User user) {
        userMapper.insert(user);
        return user;
    }

    @DeleteMapping
    // 删除某个key对应的缓存数据
    @CacheEvict(cacheNames = "userCache",
                key = "#id")
    public void deleteById(Long id) {
        userMapper.deleteById(id);
    }

    @DeleteMapping("/delAll")
    // 删除userCache下所有的缓存数据
    @CacheEvict(cacheNames = "userCache",
                allEntries = true)
    public void deleteAll() {
        userMapper.deleteAll();
    }

    /**
     * Cacheable：在方法执行前spring先查看缓存中是否有数据，如果有数据，则直接返回缓存数据；若没有数据，调用方法并将方法返回值放到缓存中
     * <p>
     * value：缓存的名称，每个缓存名称下面可以有多个key
     * <p>
     * key：缓存的key
     */
    @GetMapping
    @Cacheable(value = "userCache",
               key = "#id")
    public User getById(Long id) {
        User user = userMapper.getById(id);
        return user;
    }

}
