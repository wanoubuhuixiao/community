package com.ares.design.controller;

import com.ares.design.domain.Article;
import com.ares.design.service.ArticleService;
import com.ares.design.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class AdminController {
    @Autowired
    private UserService userService;
    @Autowired
    private ArticleService articleService;
    //@Autowired
    //private CommentService commentService;

    //管理员登录扔到这里
    @RequestMapping("/admin")
    public String getAdminIndex(Model model) {
        //最近文章列表
        List<Article> articleList = articleService.getRecentArticle(5);
        model.addAttribute("articleList", articleList);
        //最近评论列表 等那边写好
//        List<Comment> commentList = commentService.listRecentComment(5);
//        model.addAttribute("commentList", commentList);
        return "admin/index";
    }


}
