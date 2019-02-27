package com.vicyor.service;

import com.vicyor.pojo.AppCategory;

import java.util.List;

public interface AppCategoryService {
    public List<AppCategory> queryAppCategoryLevel1();
    public List<AppCategory> queryAppCategoryLevel2(int id);
    public List<AppCategory> queryAppCategoryLevel3(int id);
}
