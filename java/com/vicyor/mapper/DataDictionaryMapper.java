package com.vicyor.mapper;

import com.vicyor.pojo.DataDictionary;

import java.util.List;

public interface DataDictionaryMapper {
    List<DataDictionary>queryAllAppStatus();
    List<DataDictionary>queryAllAppFlatform();
}