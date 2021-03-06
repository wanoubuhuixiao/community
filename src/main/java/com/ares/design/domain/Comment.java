package com.ares.design.domain;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * 文章评论
 * @author liuyanzhao
 */
@Data
public class Comment implements Serializable{

    private static final long serialVersionUID = -1038897351672911219L;
    private Integer commentId;

    private Integer commentPid;

    private String commentPname;

    private Integer commentArticleId;

    private String commentAuthorName;

    private String commentAuthorEmail;

    private String commentAuthorUrl;

    private String commentAuthorAvatar;

    private String commentContent;

    private String commentAgent;

    private String commentIp;

    private Date commentCreateTime;

    private Integer commentAuthorId;//用于记录用户的id

    /**
     * 角色(管理员1，访客0)
     */
    private Integer commentRole;

    /**
     * 非数据库字段
     */
    private Article article;
    //用于记录是否被举报，默认为0，被举报为1，此时应该在管理员处显示
    private Integer commentStatus;

}