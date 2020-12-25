package com.ares.design.service.dao;

import com.ares.design.domain.User;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
@Mapper
public interface UserDao {
    public List<User> findAll();
    public User selectById(Integer id);
}
