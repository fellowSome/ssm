package com.vicyor.service.impl;

import com.vicyor.mapper.AppCategoryMapper;
import com.vicyor.pojo.AppCategory;
import com.vicyor.service.AppCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class AppCategoryServiceImpl implements AppCategoryService {
    @Autowired
    private AppCategoryMapper mapper;
    public List<AppCategory> queryAppCategoryLevel1() {
        List<AppCategory> level1 = mapper.queryAppCategoryLevel1();
        return level1;
    }

    public List<AppCategory> queryAppCategoryLevel2(int id) {
        List<AppCategory> level2 = mapper.queryAppCategoryLevel2(  id);
        return level2;
    }

    public List<AppCategory> queryAppCategoryLevel3(int id) {
        List<AppCategory> level3 = mapper.queryAppCategoryLevel3(  id);
        return level3;
    }
}
