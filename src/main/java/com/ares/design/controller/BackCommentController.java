package com.ares.design.controller;

import cn.hutool.http.HtmlUtil;
import com.ares.design.dto.ArticleParam;
import com.ares.design.service.ArticleService;
import com.ares.design.service.CategoryService;
import com.ares.design.service.CommentService;
import com.ares.design.service.UserService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.ares.design.domain.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.security.core.context.SecurityContextHolder;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping("/admin/comment")
public class BackCommentController {
    @Autowired
    private ArticleService articleService;
    @Autowired
    private CategoryService categoryService;
    @Autowired
    private UserService userService;
    @Autowired
    private CommentService commentService;

    //后台显示所有文章列表
    @RequestMapping(value = "")
    public String index(@RequestParam(required = false, defaultValue = "1") Integer pageIndex,
                        @RequestParam(required = false, defaultValue = "10") Integer pageSize,
                        @RequestParam(required = false) String status, Model model) {
        HashMap<String, Object> criteria = new HashMap<>(1);
        if (status == null) {
            model.addAttribute("pageUrlPrefix", "/admin/comment?pageIndex");
        } else {
            criteria.put("status", status);
            model.addAttribute("pageUrlPrefix", "/admin/comment?status=" + status + "&pageIndex");
        }
        List<Comment> commentList = commentService.listCommentByCommentStatus(1);
        model.addAttribute("commentList", commentList);
        model.addAttribute("articleService",articleService);
        return "admin/comment";
    }

    //通过/不通过审核
    @RequestMapping(value = "/commentexaminepass/{id}/{status}", method = RequestMethod.POST)
    public void editArticleSubmit(@PathVariable("id") Integer id, @PathVariable("status") Integer status) {
        System.out.println("启动程序进行搞事");
        Comment comment = new Comment();
        comment.setCommentId(id);
        comment = commentService.getCommentById(id);
        if (status == 1) {
            comment.setCommentStatus(0);
            commentService.updateComment(comment);
        } else {
            commentService.deleteComment(id);
        }
    }


}
