package com.taskconsole.controller;

import com.taobao.pamirs.schedule.ConsoleManager;
import com.taobao.pamirs.schedule.strategy.ScheduleStrategy;
import com.taobao.pamirs.schedule.strategy.ScheduleStrategyRunntime;
import com.taskconsole.service.impl.ZookeeperServiceImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 * 功能说明: <br>
 * 系统版本: 1.0 <br>
 * 开发人员: dengqz
 * 开发时间: 2017/10/25<br>
 * <br>
 */
@Controller
@RequestMapping("ssl")
public class ScheduleStrategyListController {

    @Resource
    private ZookeeperServiceImpl zookeeperService;

    @RequestMapping("getScheduleStrategyList")
    public String getScheduleStrategyList (HttpServletRequest request, HttpServletResponse response, Model model){
        List<ScheduleStrategy> scheduleStrategyList = null;
        scheduleStrategyList = zookeeperService.getScheduleStrategyList();
        model.addAttribute("scheduleStrategyList",scheduleStrategyList);
        return "schedule/scheduleStrategyList";
    }

    @RequestMapping("editScheduleStrategy")
    public String editScheduleStrategy(HttpServletRequest request, HttpServletResponse response, Model model){
        try {
            String taskTypeName= request.getParameter("taskType");
            ScheduleStrategy scheduleStrategy =  ConsoleManager.getScheduleStrategyManager().loadStrategy(taskTypeName);
            boolean isNew = false;
            String actionName ="editScheduleStrategy";
            String editSts="";
            String ips ="";
            if(scheduleStrategy != null){
                String[] ipList =scheduleStrategy.getIPList();
                for(int i=0;ipList!=null&& i<ipList.length;i++){
                    if(i>0){
                        ips = ips+ ",";
                    }
                    ips = ips + ipList[i];
                }
                editSts="style=\"background-color: blue\" readonly=\"readonly\"";
            }else{
                scheduleStrategy = new ScheduleStrategy();
                scheduleStrategy.setStrategyName("");
                scheduleStrategy.setKind(ScheduleStrategy.Kind.Schedule);
                scheduleStrategy.setTaskName("");
                scheduleStrategy.setTaskParameter("");
                scheduleStrategy.setNumOfSingleServer(0);
                scheduleStrategy.setAssignNum(2);
                ips = "127.0.0.1";

                isNew = true;
                actionName ="createScheduleStrategy";
            }
            model.addAttribute("scheduleStrategy",scheduleStrategy);
            model.addAttribute("isNew",isNew);
            model.addAttribute("actionName",actionName);
            model.addAttribute("editSts",editSts);
            model.addAttribute("ips",ips);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "schedule/scheduleStrategyEdit";
    }
    @RequestMapping("dealScheduleStrategy")
    public String dealScheduleStrategy(HttpServletRequest request,HttpServletResponse response,Model model){
        String action = (String) request.getParameter("action");
        String result = "";
        boolean isRefreshParent = false;
        ScheduleStrategy scheduleStrategy = new ScheduleStrategy();
        scheduleStrategy.setStrategyName(request
                .getParameter("strategyName"));
        try {
            if (action.equalsIgnoreCase("createScheduleStrategy")
                    || action.equalsIgnoreCase("editScheduleStrategy")) {
                scheduleStrategy.setKind(ScheduleStrategy.Kind
                        .valueOf(request.getParameter("kind")));
                scheduleStrategy.setTaskName(request
                        .getParameter("taskName"));
                scheduleStrategy.setTaskParameter(request
                        .getParameter("taskParameter"));

                scheduleStrategy.setNumOfSingleServer(request
                        .getParameter("numOfSingleServer") == null ? 0
                        : Integer.parseInt(request
                        .getParameter("numOfSingleServer")));
                scheduleStrategy.setAssignNum(request
                        .getParameter("assignNum") == null ? 0 : Integer
                        .parseInt(request.getParameter("assignNum")));
                if (request.getParameter("ips") == null) {
                    scheduleStrategy.setIPList(new String[0]);
                } else {
                    scheduleStrategy.setIPList(request.getParameter("ips")
                            .split(","));
                }
                if (action.equalsIgnoreCase("createScheduleStrategy")) {
                    ConsoleManager.getScheduleStrategyManager().createScheduleStrategy(scheduleStrategy);
                    isRefreshParent = true;
                } else if (action.equalsIgnoreCase("editScheduleStrategy")) {
                    ConsoleManager.getScheduleStrategyManager().updateScheduleStrategy(scheduleStrategy);
                    isRefreshParent = true;
                }
            } else if (action.equalsIgnoreCase("deleteScheduleStrategy")) {
                ConsoleManager.getScheduleStrategyManager()
                        .deleteMachineStrategy(
                                scheduleStrategy.getStrategyName());
                isRefreshParent = true;
            } else if (action.equalsIgnoreCase("pauseTaskType")) {
                ConsoleManager.getScheduleStrategyManager().pause(
                        scheduleStrategy.getStrategyName());
                isRefreshParent = true;
            } else if (action.equalsIgnoreCase("resumeTaskType")) {
                ConsoleManager.getScheduleStrategyManager().resume(
                        scheduleStrategy.getStrategyName());
                isRefreshParent = true;
            } else {
                throw new Exception("不支持的操作：" + action);
            }
        } catch (Throwable e) {
            e.printStackTrace();
            result = "ERROR:" + e.getMessage();
            isRefreshParent = false;
        }
        model.addAttribute("result",result);
        model.addAttribute("isRefreshParent",isRefreshParent);
        return "schedule/scheduleStrategyDeal";
    }

    @RequestMapping("scheduleStrategyRuntime")
    public String scheduleStrategyRuntime(HttpServletRequest request,HttpServletResponse response,Model model){
        String strategyName =request.getParameter("strategyName");
        String uuid =request.getParameter("uuid");
        List<ScheduleStrategyRunntime> runntimeList = null;
        try {
            if(strategyName != null && strategyName.trim().length() > 0){
                runntimeList =ConsoleManager.getScheduleStrategyManager().loadAllScheduleStrategyRunntimeByTaskType(strategyName);
            }else if(uuid != null && uuid.trim().length() > 0){
                runntimeList =ConsoleManager.getScheduleStrategyManager().loadAllScheduleStrategyRunntimeByUUID(uuid);
            }else{
                runntimeList =new ArrayList<ScheduleStrategyRunntime>();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("runntimeList",runntimeList);
        return "schedule/scheduleStrategyRuntime";
    }


    @ResponseBody
    @RequestMapping("getScheduleStrategyListJson")
    public List<ScheduleStrategy> getScheduleStrategyListJsons (HttpServletRequest request, HttpServletResponse response, Model model){
        List<ScheduleStrategy> scheduleStrategyList = null;
        scheduleStrategyList = zookeeperService.getScheduleStrategyList();
        return scheduleStrategyList;
    }

}
