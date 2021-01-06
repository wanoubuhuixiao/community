package com.ares.design.service;

import com.ares.design.domain.User;

import java.util.List;

public interface UserService {

    User getUserById(Integer id);

    User getUserByName(String name);

    User insertUser(User user);

    void updateUser(User user);

    void deleteUser(Integer id);

    List<User> getAllUser();
}
