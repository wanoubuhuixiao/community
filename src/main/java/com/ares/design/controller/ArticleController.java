package com.ares.design.controller;

import com.ares.design.domain.*;
import com.ares.design.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

import static java.lang.Thread.sleep;

@Controller
public class ArticleController {
    @Autowired
    private ArticleService articleService;
    @Autowired
    private CommentService commentService;
    @Autowired
    private UserService userService;

    //测试热部署
//    @RequestMapping(value="/article")
//    @ResponseBody
//    public String test(){
//        return "hhhhh";
//    }

    @RequestMapping(value="/article/{articleId}")
    public String getArticleDetailPage(@PathVariable("articleId") Integer articleId, Model model){
        //System.out.println("进入ArticleController");
        //System.out.println("articleId="+articleId);
        //获得文章信息、作者信息
        Article article = articleService.getArticleById(articleId);
        //System.out.println("得到article");
        if (article == null) {
            System.out.println("article为null");
            return "error/404";
        }
        //文章信息放进model
        model.addAttribute("article", article);

        String name = ((UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getUsername();
        User user = userService.getUserByName(name);
        model.addAttribute("user", user);
        //获得评论列表
        List<Comment> commentList = commentService.listCommentByArticleId(articleId);
        model.addAttribute("commentList", commentList);

        //获取访问量高的3篇文章用于推荐
        List<Article> mostViewArticleList = articleService.getArticleListByViewCount(3);
        model.addAttribute("mostViewArticleList", mostViewArticleList);

        int commentListCount = 0;
        if(commentList!=null){
            commentListCount = commentList.size();
        }
        model.addAttribute("commentListCount", commentListCount);
        model.addAttribute("commentService", commentService);
        model.addAttribute("userService", userService);
        if ((SecurityContextHolder.getContext().getAuthentication().getPrincipal()).equals("anonymousUser")) {
            model.addAttribute("login", false);
        } else {
            model.addAttribute("login", true);
        }
        return "ArticleDetailPage";
    }

    //点赞数增加
    @RequestMapping(value = "/article/like", method = {RequestMethod.POST})
    @ResponseBody
    public Integer increaseLikeCount(HttpServletRequest request) throws Exception{
        Integer articleId = Integer.valueOf(request.getParameter("articleId"));
        Integer newArticleLikeCount = 0;
        synchronized (this) {
            Article article = articleService.getArticleById(articleId);
            //System.out.println("旧点赞数："+article.getArticleLikeCount());
            //sleep(60000);//睡一分钟
            newArticleLikeCount = article.getArticleLikeCount() + 1;
            article.setArticleLikeCount(newArticleLikeCount);
            articleService.update(article);
            //System.out.println("新点赞数："+article.getArticleLikeCount());
        }
        return newArticleLikeCount;
    }

    //访问量增加
    @RequestMapping(value = "/article/view", method = {RequestMethod.POST})
    @ResponseBody
    public Integer increaseViewCount(HttpServletRequest request) throws Exception{
        //System.out.println("进入ArticleController");
        Integer articleId = Integer.valueOf(request.getParameter("articleId"));
        Integer newarticleCount =0;
        synchronized (this){
            Article article = articleService.getArticleById(articleId);
            //sleep(100000);
            newarticleCount = article.getArticleViewCount() + 1;
            article.setArticleViewCount(newarticleCount);
            articleService.update(article);
            //System.out.println("当前访问量："+article.getArticleViewCount());
        }

        return newarticleCount;
    }

//    @RequestMapping(value="/category/{categoryId}")
//    public String getArticleCategoriesPage(@PathVariable("categoryId") Integer categoryId, Model model){
//        Integer limit=5;//分类主页要显示多少篇文章？
//        List<Article> articleList=articleService.findArticleByCategoryId(categoryId,limit);
//        model.addAttribute("articleCategoriesList", articleList);
//        return "ArticleCategoriesPage";//分类页面
//    }
//    @RequestMapping(value="/hahaha")
//    public String test(){
//        System.out.println("进入ArticleController test()");
//        return "test2";
//    }
}
