package com.ares.design.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class HelloController {
    @RequestMapping("/index")
    public String index(Model model){
        model.addAttribute("welcome","Hello World!");
        return "index";
    }
}
