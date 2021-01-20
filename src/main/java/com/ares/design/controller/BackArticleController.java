package com.ares.design.controller;

import cn.hutool.http.HtmlUtil;
import com.ares.design.dto.ArticleParam;
import com.ares.design.service.ArticleService;
import com.ares.design.service.CategoryService;
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
@RequestMapping("/admin/article")
public class BackArticleController {
    @Autowired
    private ArticleService articleService;
    @Autowired
    private CategoryService categoryService;
    @Autowired
    private UserService userService;

    //后台显示所有文章列表
    @RequestMapping(value = "")
    public String index(@RequestParam(required = false, defaultValue = "1") Integer pageIndex,
                        @RequestParam(required = false, defaultValue = "10") Integer pageSize,
                        @RequestParam(required = false) String status, Model model) {
        HashMap<String, Object> criteria = new HashMap<>(1);
        if (status == null) {
            model.addAttribute("pageUrlPrefix", "/admin/article?pageIndex");
        } else {
            criteria.put("status", status);
            model.addAttribute("pageUrlPrefix", "/admin/article?status=" + status + "&pageIndex");
        }
        PageInfo<Article> articlePageInfo = articleService.pageArticle(pageIndex, pageSize, criteria);
        String name = ((UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getUsername();
        User user = userService.getUserByName(name);
        model.addAttribute("user",user);
        model.addAttribute("pageInfo", articlePageInfo);
        return "admin/article";
    }

    //后台显示未审核文章列表
    @RequestMapping(value = "/examine")
    public String examine(@RequestParam(required = false, defaultValue = "1") Integer pageIndex,
                        @RequestParam(required = false, defaultValue = "10") Integer pageSize,
                        @RequestParam(required = false) String status, Model model) {
        HashMap<String, Object> criteria = new HashMap<>(1);
//        if (status == null) {
//            model.addAttribute("pageUrlPrefix", "/admin/article?pageIndex");
//        } else {
            criteria.put("status", 0);
            model.addAttribute("pageUrlPrefix", "/admin/article?status=" + status + "&pageIndex");
       // }
        PageInfo<Article> articlePageInfo = articleService.pageArticle(pageIndex, pageSize, criteria);
        String name = ((UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getUsername();
        User user = userService.getUserByName(name);
        model.addAttribute("user",user);
        model.addAttribute("pageInfo", articlePageInfo);
        return "admin/articleExamine";
    }

    //通过/不通过审核
    @RequestMapping(value = "/examinepass/{id}/{status}", method = RequestMethod.POST)
    public void editArticleSubmit(@PathVariable("id") Integer id,@PathVariable("status") Integer status) {
        Article article = new Article();
        article.setArticleId(id);
        article.setArticleStatus(status);
        articleService.update(article);
    }

    //编辑文章
    @RequestMapping(value = "/edit/{id}")
    public ModelAndView editArticleView(@PathVariable("id") Integer id) {
        ModelAndView modelAndView = new ModelAndView();

        Article article = articleService.getArticleById(id);
        modelAndView.addObject("article", article);

        List<Category> categoryList = categoryService.listCategory();
        modelAndView.addObject("categoryList", categoryList);

        modelAndView.setViewName("admin/articleEdit");
        return modelAndView;
    }

    //添加文章
    //通过实体Bean接收请求参数
    @RequestMapping(value = "/insertSubmit", method = RequestMethod.POST)
    public String insertArticleSubmit(HttpSession session, ArticleParam articleParam) {
        Article article = new Article();
        //获得用户
        String name=((UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getUsername();
        User user=userService.getUserByName(name);
        //User user = (User) session.getAttribute("user");
        if (user != null) {
            article.setArticleUserId(user.getUserId());
        }
        article.setArticleTitle(articleParam.getArticleTitle());
        //文章摘要
        int summaryLength = 150;
        String summaryText = HtmlUtil.cleanHtmlTag(articleParam.getArticleContent());
        if (summaryText.length() > summaryLength) {
            String summary = summaryText.substring(0, summaryLength);
            article.setArticleSummary(summary);
        } else {
            article.setArticleSummary(summaryText);
        }
        article.setArticleContent(articleParam.getArticleContent());
        article.setArticleStatus(articleParam.getArticleStatus());
        //填充分类
        List<Category> categoryList = new ArrayList<>();
        if (articleParam.getArticleCategoryId() != null) {
            categoryList.add(new Category(articleParam.getArticleCategoryId()));
        }
        article.setCategoryList(categoryList);
        //填充标签
//        List<Tag> tagList = new ArrayList<>();
//        if (articleParam.getArticleTagIds() != null) {
//            for (int i = 0; i < articleParam.getArticleTagIds().size(); i++) {
//                Tag tag = new Tag(articleParam.getArticleTagIds().get(i));
//                tagList.add(tag);
//            }
//        }
//        article.setTagList(tagList);

        articleService.insertArticle(article);
        return "redirect:/admin/article";
    }

    //删除文章
    @RequestMapping(value = "/delete/{id}")
    public void deleteArticle(@PathVariable("id") Integer id) {
        articleService.deleteById(id);
    }

    //编辑文章提交
    @RequestMapping(value = "/editSubmit", method = RequestMethod.POST)
    public String editArticleSubmit(ArticleParam articleParam) {
        Article article = new Article();
        article.setArticleId(articleParam.getArticleId());
        article.setArticleTitle(articleParam.getArticleTitle());
        article.setArticleContent(articleParam.getArticleContent());
        article.setArticleStatus(articleParam.getArticleStatus());
        //文章摘要
        int summaryLength = 150;
        String summaryText = HtmlUtil.cleanHtmlTag(article.getArticleContent());
        if (summaryText.length() > summaryLength) {
            String summary = summaryText.substring(0, summaryLength);
            article.setArticleSummary(summary);
        } else {
            article.setArticleSummary(summaryText);
        }
        //填充分类
        List<Category> categoryList = new ArrayList<>();
        if (articleParam.getArticleCategoryId() != null) {
            categoryList.add(new Category(articleParam.getArticleCategoryId()));
        }

        article.setCategoryList(categoryList);
        articleService.updateArticleDetail(article);
        return "redirect:/admin/article";
    }

    //后台写文章
    @RequestMapping(value = "/insert")
    public String insertArticleView(Model model) {
        List<Category> categoryList = categoryService.listCategory();
        model.addAttribute("categoryList", categoryList);
        return "admin/articleInsert";
    }

}
