package com.taskconsole.controller;

import com.taobao.pamirs.schedule.ConsoleManager;
import com.taobao.pamirs.schedule.zk.ZKManager;
import com.taskconsole.service.impl.ZookeeperServiceImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

/**
 * 功能说明: <br>
 * 系统版本: 1.0 <br>
 * 开发人员: dengqz
 * 开发时间: 2017/10/25<br>
 * <br>
 */
@Controller
@RequestMapping("init")
public class InitController {
    @Resource
    private ZookeeperServiceImpl zookeeperService;

    @RequestMapping("initSchedule")
    public String InitSchedule(HttpServletRequest request, HttpServletResponse response, Model model){
        zookeeperService.initZookeeper();
        return "schedule/index";
    }

    @RequestMapping("getZookeeperConfig")
    public String getZookeeperConfig(HttpServletRequest request, HttpServletResponse response, Model model){
        Properties properties = null;
        properties = zookeeperService.getZookeeperConfig();
        String zkConnect = properties.getProperty(ZKManager.keys.zkConnectString.toString());
        String zkSession = properties.getProperty(ZKManager.keys.zkSessionTimeout.toString());
        String zkRootPath = properties.getProperty(ZKManager.keys.rootPath.toString());
        String zkUserName = properties.getProperty(ZKManager.keys.userName.toString());
        String zkPassword = properties.getProperty(ZKManager.keys.password.toString());
        boolean isInitial = zookeeperService.isInitial();
        String configFile = zookeeperService.getConfigFile();
        Map<String,Object> zkMap = new HashMap<String,Object>();
        zkMap.put("zkConnect",zkConnect);
        zkMap.put("zkSession",zkSession);
        zkMap.put("zkRootPath",zkRootPath);
        zkMap.put("zkUserName",zkUserName);
        zkMap.put("zkPassword",zkPassword);
        zkMap.put("isInitial",isInitial);
        zkMap.put("configFile",configFile);
        model.addAttribute("zkMap",zkMap);
        return "schedule/config";
    }

    @RequestMapping("configDeal")
    public String configDeal(HttpServletRequest request,HttpServletResponse response,Model model){
        Properties p = new Properties();
        p.setProperty(ZKManager.keys.zkConnectString.toString(),request.getParameter(ZKManager.keys.zkConnectString.toString()));
        p.setProperty(ZKManager.keys.rootPath.toString(),request.getParameter(ZKManager.keys.rootPath.toString()));
        p.setProperty(ZKManager.keys.userName.toString(),request.getParameter(ZKManager.keys.userName.toString()));
        p.setProperty(ZKManager.keys.password.toString(),request.getParameter(ZKManager.keys.password.toString()));
        p.setProperty(ZKManager.keys.zkSessionTimeout.toString(),request.getParameter(ZKManager.keys.zkSessionTimeout.toString()));
        try{
            ConsoleManager.saveConfigInfo(p);
        }catch(Exception e){
            e.printStackTrace();
        }
        return "schedule/configDeal";
    }
}
