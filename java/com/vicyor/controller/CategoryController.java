package com.vicyor.controller;

import com.vicyor.pojo.AppCategory;
import com.vicyor.service.AppCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/category")
public class CategoryController {
    @Autowired
    AppCategoryService service;

    @RequestMapping("/qb1/{parentId}")
    @ResponseBody
    public List<AppCategory> queryLevelTwoByLevelOne(@PathVariable("parentId") Integer id) {
        List<AppCategory> appCategories = service.queryAppCategoryLevel2(id);
        return appCategories;
    }
    @RequestMapping("/qb2/{parentId}")
    @ResponseBody
    public List<AppCategory> queryLevelTwoByLevelTwo(@PathVariable("parentId") Integer id) {
        List<AppCategory> appCategories = service.queryAppCategoryLevel3(id);
        return appCategories;
    }
}
