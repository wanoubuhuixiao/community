package com.ares.design.service.impl;

import com.ares.design.domain.User;
import com.ares.design.service.UserService;
import com.ares.design.dao.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Service
@Transactional
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;

    @Override
    public User getUserById(Integer id) {
        return userDao.getUserById(id);
    }

    @Override
    public User getUserByName(String name) {
        return userDao.getUserByName(name);
    }

    @Override
    public User insertUser(User user) {
        user.setUserRegisterTime(new Date());
        userDao.insert(user);
        return user;
    }

    @Override
    public void updateUser(User user) {
        userDao.update(user);
    }

    @Override
    public void deleteUser(Integer id) {
        userDao.deleteById(id);
    }

    @Override
    public List<User> getAllUser() {
        List<User> userList = userDao.getAllUser();
        return userList;
    }
}