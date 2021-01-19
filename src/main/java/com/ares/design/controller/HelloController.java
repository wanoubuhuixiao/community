package com.ares.design.controller;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HelloController {
    @RequestMapping({"/index1"})
    public String index(Model model) {
        model.addAttribute("welcome", "Hello World!");
        System.out.println(SecurityContextHolder.getContext().getAuthentication().getPrincipal().toString());
        return "index1";
    }
}
