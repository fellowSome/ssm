package com.vicyor.mapper;


import com.vicyor.dto.AppInfoDTO;
import com.vicyor.pojo.AppInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AppInfoMapper {

    List<AppInfo> queryByManyCondition(@Param("devUserId") Long id, @Param("dto") AppInfoDTO dto);

    void insertAppInfo(AppInfo info);

    void deleteAppInfoById(long id);
}