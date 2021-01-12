package com.ares.design.service;

import com.ares.design.domain.User;
import com.ares.design.dto.UserDto;

import java.util.List;

public interface UserService {

    User getUserById(Integer id);

    User getUserByName(String name);

    User insertUser(User user);

    void signup(UserDto userDto);

    void updateUser(User user);

    void deleteUser(Integer id);

    List<User> getAllUser();
}
