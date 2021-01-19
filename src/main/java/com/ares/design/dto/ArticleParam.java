package com.ares.design.dto;

import lombok.Data;

import java.util.List;

@Data
public class ArticleParam {
    private Integer articleId;

    private String articleTitle;

    private String articleContent;
    private Integer articleCategoryId;

//    private Integer articleParentCategoryId;
//
//    private Integer articleChildCategoryId;

//    private Integer articleOrder;

    private Integer articleStatus;
    private String articleSummary;

//    private List<Integer> articleTagIds;
}
