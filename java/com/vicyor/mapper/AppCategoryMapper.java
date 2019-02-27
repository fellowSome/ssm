package com.vicyor.mapper;

import com.vicyor.pojo.AppCategory;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AppCategoryMapper {
    public List<AppCategory> queryAppCategoryLevel1();
    public List<AppCategory> queryAppCategoryLevel2(@Param("parentId") int id);
    public List<AppCategory> queryAppCategoryLevel3(@Param("parentId") int id);
}