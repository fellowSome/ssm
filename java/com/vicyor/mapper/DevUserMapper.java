package com.vicyor.mapper;

import com.vicyor.dto.DevUserDto;
import com.vicyor.pojo.DevUser;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DevUserMapper {
    public DevUser login(DevUser user);
    public void pushImage(DevUser user);

    List<DevUserDto> queryAllUser();


    void updateUser(DevUserDto dto);

    void deleteUserById(@Param("id") long id);
}