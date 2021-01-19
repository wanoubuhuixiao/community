package com.ares.design.dao;

import com.ares.design.domain.User;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface UserDao {
    //查询用户 输入参数：userId，返回：用户
    User getUserById(Integer userId);

    //查询用户 输入参数：userName，返回：用户
    User getUserByName(String userName);

    //添加用户 输入参数：user，返回：影响的行数
    int insert(User user);

    //更新用户 输入参数：user，返回：影响的行数
    int update(User user);

    //删除用户 输入参数：userID，返回：影响的行数
    int deleteById(Integer userId);

    //查询用户列表 返回：用户列表
    List<User> getAllUser();
}
