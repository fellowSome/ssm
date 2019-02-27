package com.vicyor.controller;

import com.vicyor.dto.DevUserDto;
import com.vicyor.pojo.DevUser;
import com.vicyor.service.DevUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/dev")
public class DevUserController {
    @Autowired
    private DevUserService service;

    @RequestMapping("/toLogin")
    public String toLogin() {
        return "/dev/login";
    }

    @RequestMapping("/login")
    public String login(HttpServletRequest request) {
        String vcode = request.getParameter("vcode");
        String text = (String) request.getSession().getAttribute("text");
        if(!vcode.toUpperCase().equals(text.toUpperCase())){
            request.setAttribute("imageMess", "验证码输入错误");
            request.setAttribute("errMsg", "登录失败");
            return "/dev/login";
        }
        String title = request.getParameter("devCode");
        String password = request.getParameter("password");
        DevUser user = new DevUser();
        user.setDevCode(title);
        user.setDevPassword(password);
        user = service.login(user);
        System.out.println(user);
        if (user != null) {
            //登录成功
            request.getSession().setAttribute("devUser", user);
            return "redirect:/jsp/dev/index.jsp";
        } else {
            //登录失败
            request.setAttribute("errMsg", "登录失败");
            return "/dev/login";
        }
    }

    @RequestMapping("/logout/{id}")
    public String logout(@PathVariable("id") Integer id, HttpSession session) {
        System.out.println("abcdefg");
        session.invalidate();
        return "redirect:/";
    }

    @RequestMapping("/qy")
    @ResponseBody
    public List<DevUserDto> qy() {
        List<DevUserDto> devUsers = service.queryAllUser();
        return devUsers;
    }

    @RequestMapping("/edit")
    @ResponseBody
    public void editUser(DevUserDto dto, HttpServletResponse response, HttpServletRequest request) {
        response.setCharacterEncoding("UTF-8");
        //设定修改者id
        DevUser devUser = (DevUser) request.getSession().getAttribute("devUser");
        Long id = devUser.getId();
        dto.setXid(id);
        //设定修改时间
        Date date = new Date(System.currentTimeMillis());
        dto.setModifyDate(date);
        service.editUser(dto);
        try {
            response.getWriter().write("成功了");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping("/del")
    @ResponseBody
    public Map<String, Integer> deleteUser(long id,HttpSession session) {
        Map<String, Integer> map = new HashMap<String, Integer>();
        DevUser devUser = (DevUser) session.getAttribute("devUser");
        Long sid = devUser.getId();
        if(sid.equals(id)){
            map.put("status", 300);
            return map;
        }
        try {
            service.deleteUser(id);
        }catch (Exception e){
            e.printStackTrace();
            map.put("status",500 );
            return map;
        }
        map.put("status", 200);
        return map;
    }
}
