package com.ares.design.controller;

import com.ares.design.domain.*;
import com.ares.design.service.*;
import com.ares.design.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class AdminController {
    @Autowired
    private UserService userService;
    @Autowired
    private ArticleService articleService;
    @Autowired
    private CommentService commentService;

    //管理员登录扔到这里
    @RequestMapping("/admin")
    public String getAdminIndex(Model model) {
        List<Comment> commentList=commentService.getRecentComment(7);
        //最近文章列表
        List<Article> articleList = articleService.getRecentArticle(5);
        String name = ((UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getUsername();
        User user = userService.getUserByName(name);
        model.addAttribute("articleList", articleList);
        model.addAttribute("commentList",commentList);
        model.addAttribute("articleService",articleService);
        model.addAttribute("user",user);
        //最近评论列表 等那边写好
//        List<Comment> commentList = commentService.listRecentComment(5);
//        model.addAttribute("commentList", commentList);
        return "admin/index";
    }

    //测试用
    @RequestMapping("/testaaa")
    public String test(Model model){
        Integer a=1;
        model.addAttribute("a", a);
        return "test2";
    }

}
