package com.vicyor.service;

import com.vicyor.pojo.DataDictionary;

import java.util.List;

public interface DataDictionaryService {
    public List<DataDictionary> queryAllAppStatus();
    public List<DataDictionary> queryAllAppFlatForm();
}
