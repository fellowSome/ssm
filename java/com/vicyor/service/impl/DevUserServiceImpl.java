package com.vicyor.service.impl;

import com.mysql.cj.exceptions.ExceptionInterceptor;
import com.mysql.cj.jdbc.Blob;
import com.mysql.cj.log.Log;
import com.vicyor.dto.DevUserDto;
import com.vicyor.mapper.DevUserMapper;
import com.vicyor.pojo.DevUser;
import com.vicyor.service.DevUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service

public class DevUserServiceImpl implements DevUserService {
    @Autowired
    DevUserMapper mapper;

    public DevUser login(DevUser user) {
        user = mapper.login(user);
        return user;
    }

    public void pushImage(byte[] filedata, Long id) {
        DevUser user=new DevUser();
        user.setId(id);
        user.setPicData(filedata);
        mapper.pushImage(user);
    }

    public List<DevUserDto> queryAllUser() {

        return mapper.queryAllUser();
    }

    public void editUser( DevUserDto dto) {
        mapper.updateUser(dto);
    }

    public void deleteUser(long id) {
        mapper.deleteUserById(id);
    }
}
