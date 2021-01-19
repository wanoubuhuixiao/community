package com.ares.design.domain;

import lombok.Data;

import java.io.Serializable;

@Data
public class Category implements Serializable {
    private static final long serialVersionUID = 6687286913317513141L;

    private Integer categoryId;

    private String categoryName;

    private String categoryDescription;

//    private Integer categoryOrder;
//    private Integer categoryPid;

    private String categoryIcon;

    /**
     * 文章数量(非数据库字段)
     */
    private Integer articleCount;

    public Category(Integer categoryId, String categoryName, String categoryDescription,String categoryIcon,Integer articleCount) {
        this.categoryId = categoryId;
        this.categoryName = categoryName;
        this.categoryDescription = categoryDescription;
        this.categoryIcon = categoryIcon;
        this.articleCount = articleCount;
    }
    public Category(Integer categoryId, String categoryName, String categoryDescription,String categoryIcon) {
        this.categoryId = categoryId;
        this.categoryName = categoryName;
        this.categoryDescription = categoryDescription;
        this.categoryIcon = categoryIcon;
    }

    public Category(Integer categoryId, String categoryName) {
        this.categoryId = categoryId;
        this.categoryName = categoryName;
    }

    public Category(Integer categoryId) {
        this.categoryId = categoryId;
    }

    //未分类
    public static Category Default() {
        return new Category(100000000, "未分类");
    }

}
