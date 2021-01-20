package com.ares.design.service.impl;

import com.ares.design.dao.ArticleDao;
import com.ares.design.dao.CategoryDao;
import com.ares.design.domain.*;
import com.ares.design.service.ArticleService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

@Service
@Slf4j
@Transactional
public class ArticleServiceImpl implements ArticleService {
    @Autowired
    private ArticleDao articleDao;

    @Autowired
    private CategoryDao categoryDao;


    public Article getArticleById(Integer articleId) {
        Article article = articleDao.getArticleById(articleId);
        if (article != null) {
            //System.out.println("获得文章！");
            List<Category> categoryList = categoryDao.listCategoryByArticleId(article.getArticleId());
//            List<Tag> tagList = articleTagRefMapper.listTagByArticleId(article.getArticleId());
            article.setCategoryList(categoryList);
//            article.setTagList(tagList);
        }
        return article;
    }

    public List<Article> getArticleListByViewCount(int limit) {
        List<Article> articleList = articleDao.getArticleListByViewCount(limit);
        return articleList;
    }

    public Integer update(Article article) {
        return articleDao.update(article);
    }

    public Integer insert(Article article) {
        return articleDao.insert(article);
    }

    public Integer deleteById(Integer articleId) {
        return articleDao.deleteById(articleId);
    }

    public List<Article> listRandomArticle(Integer limit) {
        return articleDao.listRandomArticle(limit);
    }

    public List<Article> listArticleByCommentCount(Integer limit) {
        return articleDao.listArticleByCommentCount(limit);
    }

    //文章分类
    public List<Article> findArticleByCategoryId(Integer categoryId, Integer limit) {
        List<Article> articleList=articleDao.findArticleByCategoryId(categoryId, limit);
        for (int i = 0; i < articleList.size(); i++) {
            //封装CategoryList
            List<Category> categoryList = categoryDao.listCategoryByArticleId(articleList.get(i).getArticleId());
            if (categoryList == null || categoryList.size() == 0) {
                categoryList = new ArrayList<>();
                categoryList.add(Category.Default());
            }
            articleList.get(i).setCategoryList(categoryList);
////            //封装TagList
////            List<Tag> tagList = articleTagRefMapper.listTagByArticleId(articleList.get(i).getArticleId());
////            articleList.get(i).setTagList(tagList);
        }
        return articleList;
    }

    //获取评论数最多的limit篇文章给首页显示
    public List<Article> getArticleListForIndex(Integer limit) {
        return articleDao.listArticleByCommentCount(limit);
    }

    //获取“我的文章”
    public List<Article> findArticleByUserId(Integer userId, Integer limit) {
        return articleDao.findArticleByUserId(userId, limit);
    }

    public List<Article> getRecentArticle(Integer limit) {
        return articleDao.getRecentArticle(limit);
    }

    public Integer countArticle() {
        return articleDao.countArticle();
    }

    public List<Article> AllArticle() {
        return articleDao.AllArticle();
    }

    public List<Article> indexArticle(Integer pageSize, Integer pageIndex) {
        return articleDao.indexArticle(pageSize,pageIndex);
    }

    public PageInfo<Article> pageArticle(Integer pageIndex,
                                         Integer pageSize,
                                         HashMap<String, Object> criteria) {
        PageHelper.startPage(pageIndex, pageSize);
        List<Article> articleList = articleDao.findAll(criteria);
        for (int i = 0; i < articleList.size(); i++) {
            //封装CategoryList
            List<Category> categoryList = categoryDao.listCategoryByArticleId(articleList.get(i).getArticleId());
            if (categoryList == null || categoryList.size() == 0) {
                categoryList = new ArrayList<>();
                categoryList.add(Category.Default());
            }
            articleList.get(i).setCategoryList(categoryList);
////            //封装TagList
////            List<Tag> tagList = articleTagRefMapper.listTagByArticleId(articleList.get(i).getArticleId());
////            articleList.get(i).setTagList(tagList);
        }
        return new PageInfo<>(articleList);

    }

    public Integer countArticleByUser(Integer userid) {
        return articleDao.countArticleByUser(userid);
    }

    @Transactional(rollbackFor = Exception.class)
    public void insertArticle(Article article) {
        //添加文章
        article.setArticleCreateTime(new Date());
        article.setArticleUpdateTime(new Date());

        article.setArticleViewCount(0);
        article.setArticleLikeCount(0);
        article.setArticleCommentCount(0);
        articleDao.insert(article);
        //添加分类和文章关联
        for (int i = 0; i < article.getCategoryList().size(); i++) {
            categoryDao.insert(article.getArticleId(), article.getCategoryList().get(i).getCategoryId());
        }
    }

    @Transactional(rollbackFor = Exception.class)
    public void updateArticleDetail(Article article) {
        article.setArticleUpdateTime(new Date());
        articleDao.update(article);

        if (article.getCategoryList() != null) {
            //删除分类和文章关联
            categoryDao.deleteByArticleId(article.getArticleId());
            //添加分类和文章关联
            for (int i = 0; i < article.getCategoryList().size(); i++) {
                categoryDao.insert(article.getArticleId(), article.getCategoryList().get(i).getCategoryId());
            }
        }
    }

}
