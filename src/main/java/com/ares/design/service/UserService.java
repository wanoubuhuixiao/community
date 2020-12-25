package com.ares.design.service;

import com.ares.design.domain.User;

import java.util.List;

public interface UserService {
    public List<User> findAll();
    public User selectById(Integer id);
}
