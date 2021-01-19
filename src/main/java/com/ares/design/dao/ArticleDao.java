package com.ares.design.dao;

import com.ares.design.domain.Article;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;

@Repository
@Mapper
public interface ArticleDao {
    Article getArticleById(Integer articleId);
    List<Article> getArticleListByViewCount(Integer limit);
    Integer insert(Article article);
    Integer update(Article article);
    Integer deleteById(Integer articleId);
    List<Article> listRandomArticle(Integer limit);
    List<Article> listArticleByCommentCount(Integer limit);
    List<Article> findArticleByCategoryId(@Param("categoryId") Integer categoryId, @Param("limit") Integer limit);
    List<Article> findArticleByUserId(@Param("userId") Integer userId, @Param("limit") Integer limit);

    List<Article> getRecentArticle(Integer limit);
    Integer countArticle();
    List<Article> AllArticle();
    List<Article> pageArticle(@Param(value = "pageIndex") Integer pageIndex,
                              @Param(value = "pageSize") Integer pageSize);
    Integer countArticleByUser(Integer userid);
    List<Article> findAll(HashMap<String, Object> criteria);

}
