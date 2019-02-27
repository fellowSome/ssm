package com.vicyor.service;

import com.vicyor.dto.DevUserDto;
import com.vicyor.pojo.DevUser;

import java.util.List;

public interface DevUserService {
    DevUser login(DevUser user);

    void pushImage(byte[] filedata, Long id);

    List<DevUserDto> queryAllUser();


    void editUser( DevUserDto dto);


    void deleteUser(long id);
}
