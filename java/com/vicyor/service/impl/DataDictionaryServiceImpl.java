package com.vicyor.service.impl;

import com.vicyor.mapper.DataDictionaryMapper;
import com.vicyor.pojo.DataDictionary;
import com.vicyor.service.DataDictionaryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class DataDictionaryServiceImpl implements DataDictionaryService {
    @Autowired
    private DataDictionaryMapper dictionaryMapper;
    public List<DataDictionary> queryAllAppStatus() {
        List<DataDictionary> dataDictionaries = dictionaryMapper.queryAllAppStatus();
        return dataDictionaries;
    }

    public List<DataDictionary> queryAllAppFlatForm() {
        List<DataDictionary> dataDictionaries = dictionaryMapper.queryAllAppFlatform();
        return dataDictionaries;
    }
}
