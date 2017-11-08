package com.taskconsole.controller;

import com.taobao.pamirs.schedule.ConsoleManager;
import com.taobao.pamirs.schedule.strategy.ManagerFactoryInfo;
import com.taskconsole.service.impl.ZookeeperServiceImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 功能说明: <br>
 * 系统版本: 1.0 <br>
 * 开发人员: dengqz
 * 开发时间: 2017/10/26<br>
 * <br>
 */
@Controller
@RequestMapping("managerFactoryInfo")
public class ManageFactoryListController {

    @Resource
    private ZookeeperServiceImpl zookeeperService;

    @RequestMapping("getManagerFactoryInfoList")
    public String  getManagerFactoryInfoList(HttpServletRequest request, HttpServletResponse response, Model model){
        List<ManagerFactoryInfo> managerFactoryInfoList = null;
        managerFactoryInfoList = zookeeperService.getManagerFactoryInfoList();
        model.addAttribute("managerFactoryInfoList",managerFactoryInfoList);
        return "schedule/managerFactoryList";
    }

    @RequestMapping("managerFactoryDeal")
    public String managerFactoryDeal(HttpServletRequest request,HttpServletResponse response,Model model){
        boolean isRefreshParent = false;
        String result="";
        String action = request.getParameter("action");
        String uuid = request.getParameter("uuid");
        try {
            if (action.equalsIgnoreCase("startManagerFactory")) {
                ConsoleManager.getScheduleStrategyManager().updateManagerFactoryInfo(uuid,true);
                isRefreshParent = true;
            } else if (action.equalsIgnoreCase("stopManagerFactory")) {
                ConsoleManager.getScheduleStrategyManager().updateManagerFactoryInfo(uuid,false);
                isRefreshParent = true;
            }else{
                throw new Exception("不支持的操作：" + action);
            }
        } catch (Throwable e) {
            e.printStackTrace();
            result ="ERROR:" + e.getMessage();
            isRefreshParent = false;
        }
        model.addAttribute("result",result);
        model.addAttribute("isRefreshParent",isRefreshParent);
        return "schedule/managerFactoryDeal";
    }
}
