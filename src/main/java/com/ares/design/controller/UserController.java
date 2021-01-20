package com.ares.design.controller;

import cn.hutool.http.HtmlUtil;
import com.ares.design.domain.Article;
import com.ares.design.domain.Category;
import com.ares.design.domain.User;
import com.ares.design.dto.ArticleParam;
import com.ares.design.dto.UserDto;
import com.ares.design.service.ArticleService;
import com.ares.design.service.CategoryService;
import com.ares.design.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;

@Controller
public class UserController {
    @Autowired
    private UserService userService;
    @Autowired
    private ArticleService articleService;
    //为了获得类型列表
    @Autowired
    private CategoryService categoryService;

    @GetMapping({"/", "/index"})
    public String index(ModelMap model) {
        String redirect = "redirect:/index/1";
        return redirect;
    }

    //主页
    @GetMapping(value = "/index/{pageIndex}")
    public String indexAndPage(@PathVariable Integer pageIndex, ModelMap model) {
        int pageSize = 8;//limit 每页文章数
        Integer offset = pageSize * (pageIndex - 1);
        List<Article> articleList = articleService.indexArticle(pageSize, offset);
        model.put("articleList", articleList);
        if ((SecurityContextHolder.getContext().getAuthentication().getPrincipal()).equals("anonymousUser")) {
            model.put("login", false);
        } else {
            String name = ((UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getUsername();
            User user = userService.getUserByName(name);
            model.put("login", true);
            model.put("user", user);
        }
        return "index";
    }
    @Secured("ROLE_USER")
    @RequestMapping(value = "/test")
    public String test(ModelMap model) {
        model.put("user", getUser(1));
        model.put("users", getAllUsers());

        String name = ((UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getUsername();
        User user = userService.getUserByName(name);
        System.out.println(name);

        //返回模板文件名称
        return "test";
    }

    @GetMapping(value = "/space")
    public String space(ModelMap model) {
        String name = ((UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getUsername();
        User user = userService.getUserByName(name);
        String redirect = "redirect:/space/" + user.getUserId();
        return redirect;
    }

    @GetMapping(value = "/space/{id}")
    public String space(@PathVariable Integer id, ModelMap model) {
        String name = ((UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getUsername();
        User user = userService.getUserByName(name);
        List<Article> articleList = articleService.findArticleByUserId(user.getUserId(), 10);
        model.put("articleList", articleList);
        model.put("articleCount", articleService.countArticleByUser(id));
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
        String name = ((UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getUsername();
        User user = userService.getUserByName(name);
        model.put("articleCount", articleService.countArticleByUser(user.getUserId()));
        model.put("user", user);
        model.put("userDto", userDto);
        model.put("identity", "owner");
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

        update(userDto);


        return "redirect:/info";
    }

    @GetMapping(value = "/publish")
    public String publish(Article article, ModelMap model) {
        //加了:获得类型列表
        List<Category> categoryList = categoryService.listCategory();
        model.put("categoryList", categoryList);

        String name = ((UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getUsername();
        User user = userService.getUserByName(name);
        model.put("articleCount", articleService.countArticleByUser(user.getUserId()));
        model.put("user", user);
        model.put("identity", "owner");
        model.put("article", article);
        return "publish";
    }

    @PostMapping(value = "/publish")
    public String publishArticle(ArticleParam articleParam) {
        Article article = new Article();
        //获得用户
        String name=((UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getUsername();
        User user=userService.getUserByName(name);
        if (user != null) {
            article.setArticleUserId(user.getUserId());
        }
        article.setArticleTitle(articleParam.getArticleTitle());
        //文章简介
        article.setArticleSummary(articleParam.getArticleSummary());
        article.setArticleContent(articleParam.getArticleContent());
        article.setArticleStatus(0);
        //填充分类
        List<Category> categoryList = new ArrayList<>();
        if (articleParam.getArticleCategoryId() != null) {
            categoryList.add(new Category(articleParam.getArticleCategoryId()));
        }
        article.setCategoryList(categoryList);
//        if (bindingResult.hasErrors()) {
//            redirectAttributes.addFlashAttribute("article", article);
//            System.out.println("error");
//
//            return "redirect:/publish";
//        }
        articleService.insertArticle(article);
        return "redirect:/space";
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
            userService.signup(user);
        } catch (DataIntegrityViolationException e) {
            bindingResult.rejectValue("name", "error.userName", "Name already exists");
        }
        System.out.println("5");
        return "redirect:/signin";
    }

    @GetMapping("/signin")
    public String getAccessConfirmation() {
        if ((SecurityContextHolder.getContext().getAuthentication().getPrincipal()).equals("anonymousUser")) {
            return "signin";
        } else {
            String name = ((UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getUsername();
            User user = userService.getUserByName(name);
            return "redirect:/index";
        }
    }

    @GetMapping("/signup")
    public String createSignupForm(UserDto user, Model model) {
        if ((SecurityContextHolder.getContext().getAuthentication().getPrincipal()).equals("anonymousUser")) {
            model.addAttribute("user", user);
            return "signup";
        } else {
            String name = ((UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getUsername();
            User userr = userService.getUserByName(name);
            return "redirect:/index";
        }
    }

    private List<User> getAllUsers() {
        return userService.getAllUser();
    }

    private User getUser(Integer id) {
        return userService.getUserById(id);
    }

    private void update(UserDto userDto) {
        System.out.println("execute --update()-- method.");
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        String name = ((UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getUsername();
        User user = userService.getUserByName(name);
        user.setUserPassword(passwordEncoder.encode(userDto.getUserPassword()));
        user.setUserEmail(userDto.getUserEmail());
        userService.updateUser(user);
    }
}
