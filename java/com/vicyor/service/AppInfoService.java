package com.vicyor.service;

import com.github.pagehelper.PageInfo;
import com.vicyor.dto.AppInfoDTO;
import com.vicyor.pojo.AppInfo;

public interface AppInfoService {

    PageInfo<AppInfo> queryByManyCondition(long userId, AppInfoDTO dto, PageInfo<AppInfo> pageInfo);

    void insertAppInfo(AppInfo info);

    void deleteAppInfoById(long id);

}
