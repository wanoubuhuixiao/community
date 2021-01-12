package com.ares.design.controller;

import com.ares.design.domain.User;
import com.ares.design.dto.UserDto;
import com.ares.design.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import javax.validation.Valid;
import javax.validation.constraints.Null;
import java.util.List;

@Controller
public class UserController {
    @Autowired
    private UserService userService;

    @RequestMapping(value = "/test")
    public String test(ModelMap model) {
        model.put("user", getUser(1));
        model.put("users", getAllUsers());

        User user = userService.getUserByName(SecurityContextHolder.getContext().getAuthentication().getPrincipal().toString());
        String name = user.getUserName();
        System.out.println(name);

        //返回模板文件名称
        return "test";
    }

    @GetMapping(value = "/space")
    public String space(ModelMap model) {
        User user = userService.getUserByName(SecurityContextHolder.getContext().getAuthentication().getPrincipal().toString());
        String redirect = "redirect:/space/" + user.getUserId();
        return redirect;
    }

    @GetMapping(value = "/space/{id}")
    public String space(@PathVariable Integer id, ModelMap model) {
        User user = userService.getUserByName(SecurityContextHolder.getContext().getAuthentication().getPrincipal().toString());
        model.put("user", userService.getUserById(id));
        if (user.getUserId() == id) {
            model.put("identity", "owner");
        } else {
            model.put("identity", "visitor");
        }
        //返回模板文件名称
        return "space";
    }

    @GetMapping(value = "/info")
    public String info(UserDto userDto, ModelMap model) {
        User user = userService.getUserByName(SecurityContextHolder.getContext().getAuthentication().getPrincipal().toString());
        model.put("user", user);
        model.put("userDto", userDto);
        return "info";
    }

    @PostMapping(value = "/info")
    public String update(@Valid @ModelAttribute("userDto") UserDto userDto,
                         BindingResult bindingResult, RedirectAttributes redirectAttributes) {
        if (!userDto.getUserPassword().equals(userDto.getUserRePassword())) {
            bindingResult.rejectValue("userRePassword", "error.userRePassword", "两次输入密码不一致");
        }

        if (bindingResult.hasErrors()) {
            redirectAttributes.addFlashAttribute("userDto", userDto);
            System.out.println("error");
            return "redirect:/info";
        }

        try {
            update(userDto);
        } catch (DataIntegrityViolationException e) {
            bindingResult.rejectValue("name", "error.userName", "Name already exists");
        }

        return "redirect:/info";
    }

    @PostMapping("/signup")
    public String signup(@Valid @ModelAttribute("user") UserDto user,
                         BindingResult bindingResult, RedirectAttributes redirectAttributes) {
        System.out.println("1");
        if (userService.getUserByName(user.getUserName()) != null) {
            bindingResult.rejectValue("userName", "error.userName", "该用户名已存在");
        }
        if (!user.getUserPassword().equals(user.getUserRePassword())) {
            bindingResult.rejectValue("userRePassword", "error.userRePassword", "两次输入密码不一致");
        }
        System.out.println("3");
        if (bindingResult.hasErrors()) {
            redirectAttributes.addFlashAttribute("user", user);
            System.out.println("error");
            return "signup";
        }
        System.out.println("4");
        try {
            signup(user);
        } catch (DataIntegrityViolationException e) {
            bindingResult.rejectValue("name", "error.userName", "Name already exists");
        }
        System.out.println("5");
        return "redirect:/signin";
    }

    @GetMapping("/signin")
    public String getAccessConfirmation() {
        User user = userService.getUserByName(SecurityContextHolder.getContext().getAuthentication().getPrincipal().toString());
        if (user == null)
            return "signin";
        else
            return "redirect:/index";
    }

    @GetMapping("/signup")
    public String createSignupForm(UserDto user, Model model) {
        User userr = userService.getUserByName(SecurityContextHolder.getContext().getAuthentication().getPrincipal().toString());
        if (userr == null) {
            model.addAttribute("user", user);
            return "signup";
        } else
            return "redirect:/index";
    }

    private List<User> getAllUsers() {
        return userService.getAllUser();
    }

    private User getUser(Integer id) {
        return userService.getUserById(id);
    }

    private void signup(UserDto userDto) {
        System.out.println("execute --signup()-- method.");
        User user = new User();
        user.setUserName(userDto.getUserName());
        user.setUserPassword(userDto.getUserPassword());
        user.setUserStatus(userDto.getUserStatus());
        userService.insertUser(user);
    }

    private void update(UserDto userDto) {
        System.out.println("execute --update()-- method.");
        User user = userService.getUserByName(SecurityContextHolder.getContext().getAuthentication().getPrincipal().toString());
        user.setUserPassword(userDto.getUserPassword());
        user.setUserEmail(userDto.getUserEmail());
        userService.updateUser(user);
    }
}
