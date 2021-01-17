package com.ares.design.controller;

import com.ares.design.domain.Article;
import com.ares.design.domain.Comment;
import com.ares.design.service.ArticleService;
import com.ares.design.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class ArticleController {
    @Autowired
    private ArticleService articleService;
    @Autowired
    private CommentService commentService;
//    @Autowired
//    private CommentService commentService;//等着那边写出来

    //测试热部署
//    @RequestMapping(value="/article")
//    @ResponseBody
//    public String test(){
//        return "hhhhh";
//    }

    @RequestMapping(value = "/article/{articleId}")
    public String getArticleDetailPage(@PathVariable("articleId") Integer articleId, Model model) {
        //System.out.println("进入ArticleController");
        //System.out.println("articleId="+articleId);
        //获得文章信息、作者信息
        Article article = articleService.getArticleById(articleId);
        //System.out.println("得到article");
        if (article == null) {
            System.out.println("article为null");
            return "Error/404";
        }

        List<Comment> commentList =null;
        commentList= commentService.listCommentByArticleId(articleId);
        model.addAttribute("commentList", commentList);
        int commentListCount = 0;
        System.out.println("commentList's size is "+commentList.size());
        commentListCount = commentList.size();
        model.addAttribute("commentListCount", commentListCount);

        //文章信息放进model
        model.addAttribute("article", article);

        //获得评论列表
//        List<Comment> commentList = commentService.listCommentByArticleId(articleId);
//        model.addAttribute("commentList", commentList);

        //获取访问量高的3篇文章用于推荐
        List<Article> mostViewArticleList = articleService.getArticleListByViewCount(3);
        model.addAttribute("mostViewArticleList", mostViewArticleList);

        return "ArticleDetailPage";
    }

    //点赞数增加
    @RequestMapping(value = "/article/like", method = {RequestMethod.POST})
    @ResponseBody
    public Integer increaseLikeCount(HttpServletRequest request) throws Exception {
        Integer articleId = Integer.valueOf(request.getParameter("articleId"));
        Article article = articleService.getArticleById(articleId);
        //System.out.println("获得当前点赞数："+article.getArticleLikeCount());
        Integer newArticleLikeCount = article.getArticleLikeCount() + 1;
        article.setArticleLikeCount(newArticleLikeCount);
        articleService.update(article);
        return newArticleLikeCount;
    }

    //访问量增加
    @RequestMapping(value = "/article/view", method = {RequestMethod.POST})
    @ResponseBody
    public Integer increaseViewCount(HttpServletRequest request) throws Exception {
        //System.out.println("进入ArticleController");
        Integer articleId = Integer.valueOf(request.getParameter("articleId"));
        Article article = articleService.getArticleById(articleId);
        //System.out.println("获得当前访问量："+article.getArticleViewCount());
        Integer newarticleCount = article.getArticleViewCount() + 1;
        article.setArticleViewCount(newarticleCount);
        articleService.update(article);
        return newarticleCount;
    }
}