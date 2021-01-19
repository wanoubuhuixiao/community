package com.ares.design.service.impl;


import com.ares.design.dao.ArticleDao;
import com.ares.design.domain.Article;
import com.ares.design.domain.Comment;
import com.ares.design.service.CommentService;
import com.ares.design.dao.CommentDao;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
public class CommentServiceImpl implements CommentService {

    @Autowired
    private CommentDao commentDao;
    @Autowired
    private ArticleDao articleDao;


    @Override
    public void insertComment(Comment comment) {
        try {
            commentDao.insert(comment);
        } catch (Exception e) {
            e.printStackTrace();
            log.error("创建评论失败：comment:{}, cause:{}", comment, e);
        }
    }

    @Override
    public List<Comment> listCommentByArticleId(Integer articleId) {
        List<Comment> commentList = null;
        try {
            commentList = commentDao.listCommentByArticleId(articleId);
        } catch (Exception e) {
            e.printStackTrace();
            log.error("根据文章ID获得评论列表失败，articleId:{},cause:{}", articleId, e);
        }
        return commentList;
    }

    @Override
    public Comment getCommentById(Integer id) {
        Comment comment = null;
        try {
            comment = commentDao.getCommentById(id);
        } catch (Exception e) {
            e.printStackTrace();
            log.error("根据评论ID获得评论，id:{}, cause:{}", id, e);
        }
        return comment;
    }

    @Override
    public List<Comment> listComment() {
        List<Comment> commentList = null;
        try {
            commentList = commentDao.listComment();
            for (int count = 0; count < commentList.size(); count++) {
                Article article = articleDao.getArticleById(commentList.get(count).getCommentArticleId());
                commentList.get(count).setArticle(article);
            }
        } catch (Exception e) {
            e.printStackTrace();
            log.error("获得评论列表失败：cause:{}", e);
        }
        return commentList;
    }

    @Override
    public void deleteComment(Integer id) {
        try {
            commentDao.deleteById(id);
        } catch (Exception e) {
            e.printStackTrace();
            log.error("删除评论失败, id:{}, cause:{}", id, e);
        }
    }

    @Override
    public void updateComment(Comment comment) {
        try {
            commentDao.update(comment);
        } catch (Exception e) {
            e.printStackTrace();
            log.error("更新评论，comment:{}, cause:{}", comment, e);
        }
    }

    @Override
    public Integer countComment() {
        Integer commentCount = null;
        try {
            commentCount = commentDao.countComment();
        } catch (Exception e) {
            e.printStackTrace();
            log.error("统计评论数量失败, cause:{}", e);
        }
        return commentCount;
    }

    @Override
    public List<Comment> listRecentComment(Integer limit) {
        List<Comment> recentCommentList = null;

        try {
            recentCommentList = commentDao.listRecentComment(limit);
            for (int count = 0; count < recentCommentList.size(); count++) {
                Article article = articleDao.getArticleById(recentCommentList.get(count).getCommentArticleId());
                recentCommentList.get(count).setArticle(article);
            }
            /*commentList = commentDao.listRecentComment(limit);*/
        } catch (Exception e) {
            e.printStackTrace();
            log.error("获得最新评论失败, limit:{}, cause:{}", limit, e);
        }
        return recentCommentList;
    }

   /* @Override
    public List<Comment> listRecentComment(Integer limit) {
        List<Comment> commentList = null;
        try {
            commentList = commentDao.listRecentComment(limit);
            for (int i = 0; i < commentList.size(); i++) {
<<<<<<< Updated upstream
                Article article = commentDao.getArticleByStatusAndId(ArticleStatus.PUBLISH.getValue(), commentList.get(i).getCommentArticleId());
=======
                Article article = articleMapper.getArticleByStatusAndId(ArticleStatus.PUBLISH.getValue(), commentList.get(i).getCommentArticleId());
>>>>>>> Stashed changes
                commentList.get(i).setArticle(article);
            }
        } catch (Exception e) {
            e.printStackTrace();
            log.error("获得最新评论失败, limit:{}, cause:{}", limit, e);
        }
        return commentList;
    }*/

    @Override
    public List<Comment> listChildComment(Integer id) {
        List<Comment> childCommentList = null;
        try {
            childCommentList = commentDao.listChildComment(id);
        } catch (Exception e) {
            e.printStackTrace();
            log.error("获得子评论失败, id:{}, cause:{}", id, e);
        }
        return childCommentList;
    }

    @Override
    public List<Comment> listCommentByAuthorId(Integer authorid, Integer articleid) {
        List<Comment> commentByAuthorIdList = null;
        try {
            commentByAuthorIdList = commentDao.listCommentByAuthorId(authorid, articleid);
        } catch (Exception e) {
            e.printStackTrace();
            log.error("获得子评论失败, id:{}, cause:{}", authorid, e);
        }
        return commentByAuthorIdList;
    }

    @Override
    public List<Comment> listCommentByCommentStatus(Integer commentStatus) {
        List<Comment> commentByCommentStatusList = null;
        try {
            commentByCommentStatusList = commentDao.listCommentByCommentStatus(commentStatus);
        } catch (Exception e) {
            e.printStackTrace();
            log.error("获得子评论失败, id:{}, cause:{}", commentStatus, e);
        }
        return commentByCommentStatusList;
    }

    @Override
    public void updateStatus(Comment comment) {
        List<Comment> commentStatusList = null;
        try {
            int temp = commentDao.updateStatus(comment);
        } catch (Exception e) {
            e.printStackTrace();
            log.error("获得子评论失败, id:{}, cause:{}", comment, e);
        }
    }


   /* @Override
    public List<Comment> listCommentByArticleIdAndPageNumber(Integer articleId, Integer pageNumber) {
        List<Comment> articleIdAndPageNumberList=null;
        try {
            articleIdAndPageNumberList=commentDao.listCommentByArticleIdAndPageNumber(articleId,pageNumber);
            commentDao.update(comment);
        } catch (Exception e) {
            e.printStackTrace();
            log.error("更新评论，comment:{}, cause:{}", comment, e);
        }

        return null;
    }

    @Override
    public List<Comment> listCommentByAuthorId(Integer authorId) {
        List<Comment>
        try {
            commentDao.update(comment);
        } catch (Exception e) {
            e.printStackTrace();
            log.error("更新评论，comment:{}, cause:{}", comment, e);
        }

        return null;
    }
*/

}
