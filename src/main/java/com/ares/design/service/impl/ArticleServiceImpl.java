package com.ares.design.service.impl;

import com.ares.design.dao.ArticleDao;
import com.ares.design.domain.Article;
import com.ares.design.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class ArticleServiceImpl implements ArticleService {
    @Autowired
    private ArticleDao articleDao;

    public Article getArticleById(Integer articleId){
        Article article = articleDao.getArticleById(articleId);
        if (article != null) {
            //System.out.println("获得文章！");
//            List<Category> categoryList = articleCategoryRefMapper.listCategoryByArticleId(article.getArticleId());
//            List<Tag> tagList = articleTagRefMapper.listTagByArticleId(article.getArticleId());
//            article.setCategoryList(categoryList);
//            article.setTagList(tagList);
        }
        return article;
    }

    public List<Article> getArticleListByViewCount(int limit){
        List<Article> articleList=articleDao.getArticleListByViewCount(limit);
        return articleList;
    }
    public Integer update(Article article){
        return articleDao.update(article);
    }

    public Integer insert(Article article){
        return articleDao.insert(article);
    }

    public Integer deleteById(Integer articleId){
        return articleDao.deleteById(articleId);
    }

    public List<Article> listRandomArticle(Integer limit){
        return articleDao.listRandomArticle(limit);
    }
    public List<Article> listArticleByCommentCount(Integer limit){
        return articleDao.listArticleByCommentCount(limit);
    }
    //文章分类
    public List<Article> findArticleByCategoryId(Integer catgeoyrId, Integer limit){
        return articleDao.findArticleByCategoryId(catgeoyrId, limit);
    }

    //获取评论数最多的limit篇文章给首页显示
    public List<Article> getArticleListForIndex(Integer limit){
        return articleDao.listArticleByCommentCount(limit);
    }
}
