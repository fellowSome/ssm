package com.vicyor.controller;

import com.vicyor.pojo.DevUser;
import com.vicyor.service.DevUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/person")
public class PersonalController {
    @Autowired
    private DevUserService service;

    @RequestMapping("/upload")
    @ResponseBody
    public Map<String, Integer> fileUpLoad(MultipartFile file, HttpSession session) {
        Map<String, Integer> map = new HashMap<String, Integer>();
        try {
            InputStream inputStream = file.getInputStream();
            //文件长度
            int length = inputStream.available();
            byte[] filedata = new byte[length];
            inputStream.read(filedata);
            //将图片写入数据库
            DevUser devUser = (DevUser) session.getAttribute("devUser");
            service.pushImage(filedata, devUser.getId());
            //将session的devUser字段的picdata改变为新生成的字段
            devUser.setPicData(filedata);
            session.setAttribute("devUser",devUser );
            map.put("code", 200);
        } catch (Exception e) {
            map.put("code", 400);
            e.printStackTrace();
        }
        return map;
    }

    @RequestMapping("/load")
    public void load(HttpSession session, HttpServletResponse response) {
        DevUser devUser = (DevUser) session.getAttribute("devUser");
        byte[] picData = devUser.getPicData();
        try {
            response.getOutputStream().write(picData);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
