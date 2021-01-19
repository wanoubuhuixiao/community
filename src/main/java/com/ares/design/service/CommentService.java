package com.ares.design.service;

import com.ares.design.domain.Comment;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public interface CommentService {

    /**
     * 添加评论
     *
     * @param comment 评论
     */
    void insertComment(Comment comment);

    /**
     * 根据文章id获取评论列表
     *
     * @param articleId 文章ID
     * @return 列表
     */
    List<Comment> listCommentByArticleId(Integer articleId);

    /**
     * 根据id获取评论
     *
     * @param id
     * @return
     */
    Comment getCommentById(Integer id);

    /**
     * 获取所有评论列表
     *
     * @param pageIndex 第几页开始
     * @param pageSize  一页显示数量
     * @return 列表
    PageInfo<Comment> listCommentByPage(
    Integer pageIndex,
    Integer pageSize);
     */

    /**
     * 获得评论列表
     *
     * @return 列表
     */
    List<Comment> listComment();


    /**
     * 删除评论
     *
     * @param id ID
     */
    void deleteComment(Integer id);

    /**
     * 修改评论
     *
     * @param comment 评论
     */
    void updateComment(Comment comment);

    /**
     * 统计评论数
     *
     * @return 数量
     */
    Integer countComment();
    /*
     *//**
     * 获得最近评论
     *
     * @param limit 查询数量
     *
     * @return 列表
     */
    List<Comment> listRecentComment(Integer limit);
    /**
     * 获得评论的子评论
     *
     * @param id 评论ID
     * @return 列表
     */
    List<Comment> listChildComment(Integer id);

    List<Comment> listCommentByAuthorId(Integer authorid, Integer articleid);

    /*List<Comment> listCommentByArticleIdAndPageNumber(Integer articleId,Integer pageNumber);//按照每一页10条进行评论展示
    //暂时无法实现一个评论下面有很多子评论，目前只能一个评论回复另一个评论。

    List<Comment> listCommentByAuthorId(Integer authorId);//用于对相应id的评论查找*/

    //管理员用于查看被举报的评论
    //commentStatus

    List<Comment> listCommentByCommentStatus(Integer commentStatus);
    //更新被举报的状态
    void updateStatus(Comment comment);
}
