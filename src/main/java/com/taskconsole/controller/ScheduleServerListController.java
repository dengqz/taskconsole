package com.taskconsole.controller;

import com.taobao.pamirs.schedule.taskmanager.ScheduleServer;
import com.taskconsole.service.impl.ZookeeperServiceImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * 功能说明: <br>
 * 系统版本: 1.0 <br>
 * 开发人员: dengqz
 * 开发时间: 2017/11/1<br>
 * <br>
 */
@Controller
@RequestMapping("scheduleserverlist")
public class ScheduleServerListController {

    @Resource
    private ZookeeperServiceImpl zookeeperService;

    /**
     * get获得
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping(value = "getscheduleserverlist")
    public String getScheduleServerList(HttpServletRequest request, HttpServletResponse response, Model model){
        String managerFactoryUUID = request.getParameter("managerFactoryUUID");
        String baseTaskType =  request.getParameter("baseTaskType");
        String ownSign =  request.getParameter("ownSign");
        String ip =  request.getParameter("ip");
        String orderStr =  request.getParameter("orderStr");
        List<ScheduleServer> serverList = null;
        List<Map<String,Object>> bgColorList = new ArrayList<Map<String,Object>>();
        serverList = zookeeperService.getScheduleServerList(managerFactoryUUID,baseTaskType,ownSign,ip,orderStr);
        bgColorList = zookeeperService.getScheduleServerBgColor(serverList);
        model.addAttribute("serverList",serverList);
        model.addAttribute("bgColorList",bgColorList);
        model.addAttribute("managerFactoryUUID",managerFactoryUUID);
        return "schedule/serverList";
    }

}
