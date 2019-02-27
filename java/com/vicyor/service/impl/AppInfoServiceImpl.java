package com.vicyor.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.vicyor.dto.AppInfoDTO;
import com.vicyor.mapper.AppInfoMapper;
import com.vicyor.pojo.AppInfo;
import com.vicyor.service.AppInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AppInfoServiceImpl implements AppInfoService {
    @Autowired
    private AppInfoMapper appInfoMapper;

    public PageInfo<AppInfo> queryByManyCondition(long userId, AppInfoDTO dto,PageInfo<AppInfo> pageInfo) {
        PageHelper.startPage(pageInfo.getPageNum(),pageInfo.getPageSize() );
        List<AppInfo> appInfos = appInfoMapper.queryByManyCondition(userId, dto);
        pageInfo=new PageInfo<AppInfo>(appInfos);
        return pageInfo;
    }

    public void insertAppInfo(AppInfo  info) {
          appInfoMapper.insertAppInfo(info);
    }

    public void deleteAppInfoById(long id) {
        appInfoMapper.deleteAppInfoById(id);
    }

}
