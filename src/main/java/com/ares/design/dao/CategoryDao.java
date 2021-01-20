package com.ares.design.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import com.ares.design.domain.Category;

import java.util.List;

@Repository
@Mapper
public interface CategoryDao {
    List<Category> listCategoryByArticleId(Integer articleId);

    List<Category> listCategory();

    int insert(@Param(value = "articleId") Integer articleId,
               @Param(value = "categoryId") Integer categoryId);

    int deleteByArticleId(Integer articleId);


}
