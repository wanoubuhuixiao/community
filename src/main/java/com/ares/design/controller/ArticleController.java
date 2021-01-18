package com.ares.design.controller;

import com.ares.design.domain.Article;
import com.ares.design.domain.User;
import com.ares.design.service.ArticleService;
import com.ares.design.domain.Comment;
import com.ares.design.service.CommentService;
import com.ares.design.service.UserService;
import com.ares.design.util.PagingResult;
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

@Controller
public class ArticleController {
    @Autowired
    private UserService userService;
    @Autowired
    private ArticleService articleService;
    @Autowired
    private CommentService commentService;

    //测试热部署
//    @RequestMapping(value="/article")
//    @ResponseBody
//    public String test(){
//        return "hhhhh";
//    }

    //主页
    @RequestMapping({"/", "/index"})
    public String index(ModelMap model) {
        int pageSize = 3;//limit 每页文章数
        int pageIndex = 1;
        Integer offset = pageSize * (pageIndex - 1);
        List<Article> articleList = articleService.pageArticle(pageIndex, pageSize);
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

    /*
    * @PathVariable String urlName, @PathVariable Integer page, Model model,
                                            HttpServletRequest request
    * */

    /**
     * 分页显示某个类别下的商品
     *
     * @RequestMapping(value = "/category/{urlName}/{page}",method = RequestMethod.GET)
     * public String listDealsOfDealCategory(@PathVariable String urlName, @PathVariable Integer page, Model model,
     * HttpServletRequest request){
     * DealCategory dealCategory=dealCategoryService.getByUrlName(urlName);
     * model.addAttribute("dealCategory",dealCategory);
     * PagingResult<Deal> pagingResult=dealService.getDealOfCategories(dealCategory.getSelfAndChildrenIds(),
     * super.getAreaId(request),page, DealConstant.DEAL_NUM_PER_PAGE_IN_DEALS_OF_CATEGORY_PAGE);
     * model.addAttribute("pagingDealList", pagingResult);
     * return "/deal/category";
     * }
     */
    @RequestMapping(value = "/article/{articleId}")
    public String getArticleDetailPage(
            @PathVariable("articleId") Integer articleId, Model model) {
        //System.out.println("进入ArticleController");
        //System.out.println("articleId="+articleId);
        //获得文章信息、作者信息
        Article article = articleService.getArticleById(articleId);
        //System.out.println("得到article");
        if (article == null) {
            System.out.println("article为null");
            return "Error/404";
        }
        String name = ((UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getUsername();
        User user = userService.getUserByName(name);
        model.addAttribute("user", user);
        System.out.println("user.getUserId is " + user.getUserId());
        List<Comment> commentList = null;
        commentList = commentService.listCommentByArticleId(articleId);
        model.addAttribute("commentList", commentList);
        int commentListCount = 0;
        System.out.println("commentList's size is " + commentList.size());
        commentListCount = commentList.size();
        model.addAttribute("commentListCount", commentListCount);
        model.addAttribute("commentService", commentService);
        model.addAttribute("userService", userService);



        PagingResult<Comment> pagingResult = new PagingResult<>();
        pagingResult.setPage(1);
        pagingResult.setRows(commentList);
        pagingResult.setPageSize(5);
        pagingResult.setTotal(commentListCount);
        model.addAttribute("pagingDealList", pagingResult);


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

    @RequestMapping(value = "/category/{categoryId}")
    public String getArticleCategoriesPage(@PathVariable("categoryId") Integer categoryId, Model model) {
        Integer limit = 5;//分类主页要显示多少篇文章？
        List<Article> articleList = articleService.findArticleByCategoryId(categoryId, limit);
        model.addAttribute("articleCategoriesList", articleList);
        return "ArticleCategoriesPage";//分类页面
    }

    @RequestMapping(value = "/hahaha")
    public String test() {
        System.out.println("进入ArticleController test()");
        return "test2";
    }
}
