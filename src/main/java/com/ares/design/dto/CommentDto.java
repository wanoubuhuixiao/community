package com.ares.design.dto;

import com.ares.design.domain.Article;
import lombok.Data;

import java.util.Date;

@Data
public class CommentDto {
    private static final long serialVersionUID = -1038897351672911219L;
    //评论id，用于编号
    private Integer commentId;
    //回复的父类评论id
    private Integer commentPid;
    //应该是回复的父类评论名称
    private String commentPname;
    //评论的文章id
    private Integer commentArticleId;
    //评论者名字
    private String commentAuthorName;
    //评论者邮箱
    private String commentAuthorEmail;
    //评论者url
    private String commentAuthorUrl;
    //评论者封面
    private String commentAuthorAvatar;
    //内容
    private String commentContent;

    private String commentAgent;
    //评论ip
    private String commentIp;
    //时间
    private Date commentCreateTime;

    /**
     * 角色(管理员1，访客0)
     */
    private Integer commentRole;

    /**
     * 非数据库字段
     */
    private Article article;

}
