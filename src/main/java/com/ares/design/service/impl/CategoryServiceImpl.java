package com.ares.design.service.impl;

import com.ares.design.dao.CategoryDao;
import com.ares.design.domain.Category;
import com.ares.design.service.CategoryService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Slf4j
@Transactional
public class CategoryServiceImpl implements CategoryService {

    @Autowired
    private CategoryDao categoryDao;

    //获得类别列表
    public List<Category> listCategory() {
        List<Category> categoryList = null;
        try {
            categoryList = categoryDao.listCategory();
        } catch (Exception e) {
            e.printStackTrace();
            log.error("根据文章获得分类列表失败, cause:{}", e);
            System.out.println("根据文章获得分类列表失败");
        }
        return categoryList;
    }
}
