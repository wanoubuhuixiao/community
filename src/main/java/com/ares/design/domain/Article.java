package com.ares.design.domain;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

@Data
public class Article implements Serializable {
    private static final long serialVersionUID = 5207865247400761539L;

    private Integer articleId;

    private Integer articleUserId;
    private User user;

    private String articleTitle;
    private String articleContent;
    private Integer articleViewCount;
    private Integer articleCommentCount;
    private Integer articleLikeCount;
    private Date articleCreateTime;
    private Date articleUpdateTime;
    //private Integer articleIsComment;
    //private Integer articleStatus;
    //private Integer articleOrder;
    private String articleSummary;

//    private List<Tag> tagList;
//    private List<Category> categoryList;
}
