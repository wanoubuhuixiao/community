package com.ares.design.controller;

import com.ares.design.domain.User;
import com.ares.design.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class UserController {
    @Autowired
    private UserService userService;

    @RequestMapping(value = "test")
    public String test(ModelMap model) {
        model.put("user", getUser(1));
        model.put("users", getAllUsers());
        //返回模板文件名称
        return "test";
    }

    private List<User> getAllUsers() {
        return userService.findAll();
    }

    private User getUser(Integer id) {
        return userService.selectById(id);
    }

}
