package com.vicyor.controller;

import com.github.pagehelper.PageInfo;
import com.vicyor.dto.AppInfoDTO;
import com.vicyor.pojo.AppCategory;
import com.vicyor.pojo.AppInfo;
import com.vicyor.pojo.DataDictionary;
import com.vicyor.pojo.DevUser;
import com.vicyor.service.AppCategoryService;
import com.vicyor.service.AppInfoService;
import com.vicyor.service.DataDictionaryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.sql.Date;
import java.util.List;

@Controller
@RequestMapping("/app")
public class DevAppController {
    @Autowired
    private AppInfoService service;
    @Autowired
    private DataDictionaryService dataDictionaryService;
    @Autowired
    private AppCategoryService categoryService;

    @RequestMapping("/index/{id}")
    public String index(@PathVariable("id") Long id, Model model, HttpSession session) {
        PageInfo<AppInfo> pageInfo = new PageInfo<AppInfo>();
//       设置页的大小
        pageInfo.setPageSize(5);
//       设置当前页
        pageInfo.setPageNum(1);
        pageInfo = service.queryByManyCondition(id, new AppInfoDTO(), pageInfo);
        model.addAttribute("page", pageInfo);
        List<DataDictionary> flatForms = dataDictionaryService.queryAllAppFlatForm();
        session.setAttribute("flatform", flatForms);
        List<DataDictionary> status = dataDictionaryService.queryAllAppStatus();
        session.setAttribute("status", status);
        List<AppCategory> ac1 = categoryService.queryAppCategoryLevel1();
        session.setAttribute("ac1", ac1);
        return "/app/index";
    }

    @RequestMapping("/query")
    public String query(AppInfoDTO dto, HttpSession session, HttpServletRequest rq) {
        PageInfo<AppInfo> pageInfo = new PageInfo<AppInfo>();
        session.setAttribute("dto", dto);
        pageInfo.setPageSize(5);
        pageInfo.setPageNum(dto.getPageNum());
        DevUser user = (DevUser) session.getAttribute("devUser");
        Long id = user.getId();
        PageInfo<AppInfo> page = service.queryByManyCondition(id, dto, pageInfo);
        rq.setAttribute("page", page);
        return "/app/index";
    }

    @RequestMapping("/add")
    public String addAppInfo(HttpServletRequest request) {
        String softwareName = request.getParameter("softwareName");
        String apkName = request.getParameter("APKName");
        String supportROM = request.getParameter("supportROM");
        String interfaceLanguage = request.getParameter("interfaceLanguage");
        String softwareSize = request.getParameter("softwareSize");
        BigDecimal decimal = new BigDecimal(softwareSize);
        String appinfo = request.getParameter("appinfo");
        String levelOne = request.getParameter("levelOne");
        String levelTwo = request.getParameter("levelTwo");
        String levelThree = request.getParameter("levelThree");
        String appStatus = request.getParameter("appStatus");
        String appFlatform = request.getParameter("appFlatform");
        AppInfo info = new AppInfo();
        info.setSoftwareName(softwareName);
        info.setAPKName(apkName);
        info.setSupportROM(supportROM);
        info.setInterfaceLanguage(interfaceLanguage);
        info.setSoftwareSize(decimal);
        info.setAppInfo(appinfo);
        AppCategory one = new AppCategory();
        one.setId(Long.parseLong(levelOne));
        info.setCategoryLevel1(one);
        AppCategory two = new AppCategory();
        two.setId(Long.parseLong(levelTwo));
        info.setCategoryLevel2(two);
        AppCategory three = new AppCategory();
        three.setId(Long.parseLong(levelThree));
        info.setCategoryLevel3(three);
        info.setStatus(Long.parseLong(appStatus));
        info.setCreationDate(new Date(System.currentTimeMillis()));
        info.setFlatformId(Long.parseLong(appFlatform));
        DevUser devUser = (DevUser) request.getSession().getAttribute("devUser");
        info.setDevUser(devUser);
        service.insertAppInfo(info);
//        查询插入的appinfo
        AppInfoDTO dto = new AppInfoDTO();
        long id = devUser.getId();
        dto.setDevId((int) id);
        dto.setAppFlatform(Integer.parseInt(appFlatform));
        dto.setAppStatus(Integer.parseInt(appStatus));
        dto.setLevelOne(Integer.parseInt(levelOne));
        dto.setLevelTwo(Integer.parseInt(levelTwo));
        dto.setLevelThree(Integer.parseInt(levelThree));
        dto.setPageNum(1);
        dto.setSoftwareName(softwareName);
        query(dto, request.getSession(), request);
        return "/app/index";
    }

    @RequestMapping("/delete/{id}")
    public String delete(@PathVariable("id") long id, HttpServletRequest request) {
        service.deleteAppInfoById(id);
        AppInfoDTO dto = (AppInfoDTO) request.getSession().getAttribute("dto");
        query(dto, request.getSession(), request);
        return "/app/index";
    }

    @RequestMapping("/modify/{id}")
    public String modifyAppInfoById(@PathVariable("id") long id, HttpServletRequest request) {
        AppInfoDTO dto = new AppInfoDTO();
        dto.setAppInfoId((int) id);
        request.getSession().setAttribute("infoId",id );
        PageInfo<AppInfo> pageInfo = new PageInfo<AppInfo>();
        pageInfo.setPageNum(1);
        pageInfo.setPageSize(5);
        DevUser devUser = (DevUser) request.getSession().getAttribute("devUser");
        Long id1 = devUser.getId();
        pageInfo = service.queryByManyCondition(id1, dto, pageInfo);
        AppInfo info = pageInfo.getList().get(0);
        Long id2 = info.getCategoryLevel1().getId();
        System.out.println("id2:::"+id2);
        request.setAttribute("appInfo", info);
        System.out.println("AppInfo");
        System.out.println(info);

        return "/app/modify";
    }

    //查询单条appinfo
    @RequestMapping("/status/{id}")
    public String queryAppInfoStatusById(@PathVariable("id") long id, HttpServletRequest request) {
        AppInfoDTO dto = new AppInfoDTO();
        dto.setAppInfoId((int) id);

        PageInfo<AppInfo> pageInfo = new PageInfo<AppInfo>();
        pageInfo.setPageNum(1);
        pageInfo.setPageSize(5);
        DevUser devUser = (DevUser) request.getSession().getAttribute("devUser");
        Long id1 = devUser.getId();
        pageInfo = service.queryByManyCondition(id1, dto, pageInfo);
        AppInfo info = pageInfo.getList().get(0);
        request.setAttribute("appInfo", info);
        System.out.println("AppInfo");
        System.out.println(info);
        return "/app/status";
    }
    @RequestMapping("/change")
    public String changeAppInfo(HttpServletRequest request){
         long infoId=(Long) request.getSession().getAttribute("infoId");
        //先删除,再添加
        delete(infoId, request);
        addAppInfo(request);
        return "/app/index";
    }
}
