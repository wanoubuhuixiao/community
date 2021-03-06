package com.ares.design.service;


import com.ares.design.domain.Article;
import com.github.pagehelper.PageInfo;

import java.util.HashMap;
import java.util.List;

public interface ArticleService {
    Article getArticleById(Integer articleId);

    List<Article> getArticleListByViewCount(int limit);

    Integer insert(Article article);

    Integer update(Article article);

    Integer deleteById(Integer articleId);

    List<Article> listRandomArticle(Integer limit);

    List<Article> listArticleByCommentCount(Integer limit);

    List<Article> findArticleByCategoryId(Integer categoryId, Integer limit);

    //获取首页显示的limit篇文章（评论数最多的）
    List<Article> getArticleListForIndex(Integer limit);

    //我的文章
    List<Article> findArticleByUserId(Integer userId, Integer limit);

    List<Article> getRecentArticle(Integer limit);

    Integer countArticle();

    List<Article> AllArticle();

    List<Article> indexArticle(Integer pageSize, Integer pageIndex);

    PageInfo<Article> pageArticle(Integer pageIndex,
                                  Integer pageSize, HashMap<String, Object> criteria);

    Integer countArticleByUser(Integer userid);

    //添加文章
    void insertArticle(Article article);

    void updateArticleDetail(Article article);

}
