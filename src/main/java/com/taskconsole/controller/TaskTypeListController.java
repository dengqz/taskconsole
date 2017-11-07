package com.taskconsole.controller;

import com.taobao.pamirs.schedule.ConsoleManager;
import com.taobao.pamirs.schedule.taskmanager.ScheduleTaskType;
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
@RequestMapping("tasktypelist")
public class TaskTypeListController {

    @Resource
    private ZookeeperServiceImpl zookeeperServiceImpl;

    @RequestMapping("getTaskTypeList")
    public String getTaskTypeList(HttpServletRequest request, HttpServletResponse response,Model model){
        if(zookeeperServiceImpl.isInitial()){
            List<ScheduleTaskType> scheduleTaskTypes= null;
            scheduleTaskTypes = zookeeperServiceImpl.getScheduleTaskTypeList();
            model.addAttribute("scheduleTaskTypes",scheduleTaskTypes);
            return "schedule/taskTypeList";
        }else{
            return "schedule/config";
        }

    }
    @RequestMapping("editTaskType")
    public String editTaskType(HttpServletRequest request, HttpServletResponse response,Model model){
        try {
            String isManager= request.getParameter("manager");
            String taskTypeName= request.getParameter("taskType");
            ScheduleTaskType taskType =  ConsoleManager.getScheduleDataManager().loadTaskTypeBaseInfo(taskTypeName);
            String taskItems ="";
            boolean isNew = false;
            String actionName ="editTaskType";
            String editSts ="";
            if(taskType != null){
                String[] taskItemList = taskType.getTaskItems();
                for(int j=0;j<taskItemList.length;j++){
                    if(j>0){
                        taskItems = taskItems+ ",";
                    }
                    taskItems = taskItems + taskItemList[j];
                }
                editSts="style=\"background-color: blue\" readonly=\"readonly\"";
            }else{
                taskType = new ScheduleTaskType();
                taskType.setBaseTaskType("请输入新的任务类型...");
                taskType.setDealBeanName("");
                isNew = true;
                actionName ="createTaskType";
            }
            model.addAttribute("taskType",taskType);
            model.addAttribute("editSts",editSts);
            model.addAttribute("actionName",actionName);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "schedule/taskTypeEdit";
    }

    @RequestMapping("dealTaskType")
    public String dealTaskType(HttpServletRequest request, HttpServletResponse response,Model model){
        String action = (String)request.getParameter("action");
        String result = "";
        boolean isRefreshParent = false;
        String baseTaskType = (String)request.getParameter("taskType");
        try {
            if (action.equalsIgnoreCase("createTaskType")||action.equalsIgnoreCase("editTaskType")) {
                isRefreshParent = false;
                ScheduleTaskType taskType = new ScheduleTaskType();
                taskType.setBaseTaskType(baseTaskType);
                taskType.setDealBeanName(request.getParameter("dealBean"));
                taskType.setHeartBeatRate(request.getParameter("heartBeatRate")==null?0: ((int)Double.parseDouble(request.getParameter("heartBeatRate"))*1000));
                taskType.setJudgeDeadInterval(request.getParameter("judgeDeadInterval")==null?0: ((int)Double.parseDouble(request.getParameter("judgeDeadInterval"))*1000));
                taskType.setThreadNumber(request.getParameter("threadNumber")==null?0: Integer.parseInt(request.getParameter("threadNumber")));
                taskType.setFetchDataNumber(request.getParameter("fetchNumber")==null?0: Integer.parseInt(request.getParameter("fetchNumber")));
                taskType.setExecuteNumber(request.getParameter("executeNumber")==null?0: Integer.parseInt(request.getParameter("executeNumber")));
                taskType.setSleepTimeNoData(request.getParameter("sleepTimeNoData")==null?0: (int)(Double.parseDouble(request.getParameter("sleepTimeNoData"))*1000));
                taskType.setSleepTimeInterval(request.getParameter("sleepTimeInterval")==null?0: ((int)Double.parseDouble(request.getParameter("sleepTimeInterval"))*1000));
                taskType.setProcessorType(request.getParameter("processType"));
                //taskType.setExpireOwnSignInterval(request.getParameter("expireOwnSignInterval")==null?0: Integer.parseInt(request.getParameter("threadNumber")));
                taskType.setPermitRunStartTime(request.getParameter("permitRunStartTime"));
                taskType.setPermitRunEndTime(request.getParameter("permitRunEndTime"));
                String s= request.getParameter("maxTaskItemsOfOneThreadGroup");
                taskType.setMaxTaskItemsOfOneThreadGroup(s==null || s.trim().length() ==0?0:Integer.parseInt(request.getParameter("maxTaskItemsOfOneThreadGroup")));
                taskType.setTaskParameter(request.getParameter("taskParameter"));

                String itemDefines  =request.getParameter("taskItems");
                itemDefines = itemDefines.replaceAll("\r","");
                itemDefines = itemDefines.replaceAll("\n","");
                taskType.setTaskItems(ScheduleTaskType.splitTaskItem(itemDefines));
                taskType.setSts(request.getParameter("sts"));
                if(action.equalsIgnoreCase("createTaskType")){
                    ConsoleManager.getScheduleDataManager().createBaseTaskType(taskType);
                    result = "任务" + baseTaskType + "创建成功！！！！";
                }else{
                    ConsoleManager.getScheduleDataManager().updateBaseTaskType(taskType);
                    result = "任务" + baseTaskType + "修改成功！！！！";
                }
                isRefreshParent = true;

            } else if (action.equalsIgnoreCase("clearTaskType")) {
                ConsoleManager.getScheduleDataManager().clearTaskType(
                        baseTaskType);
                result = "任务" + baseTaskType + "运行期信息清理成功！！！！";
                isRefreshParent = false;
            } else if (action.equalsIgnoreCase("deleteTaskType")) {
                ConsoleManager.getScheduleDataManager().deleteTaskType(
                        baseTaskType);
                result = "任务" + baseTaskType + "删除成功！！！！";
                isRefreshParent = true;
            } else if (action.equalsIgnoreCase("pauseTaskType")) {
                ConsoleManager.getScheduleDataManager().pauseAllServer(baseTaskType);
                isRefreshParent = true;
            } else if (action.equalsIgnoreCase("resumeTaskType")) {
                ConsoleManager.getScheduleDataManager().resumeAllServer(baseTaskType);
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
        return "schedule/taskTypeDeal";
    }


}
