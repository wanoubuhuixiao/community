package com.ares.design.dao;

import com.ares.design.domain.Article;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

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
    List<Article> findArticleByCategoryId(@Param("categoryId") Integer catgeoyrId, @Param("limit") Integer limit);

}
