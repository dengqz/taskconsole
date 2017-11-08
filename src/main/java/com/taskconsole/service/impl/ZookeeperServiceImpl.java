package com.taskconsole.service.impl;

import com.taobao.pamirs.schedule.ConsoleManager;
import com.taobao.pamirs.schedule.strategy.ManagerFactoryInfo;
import com.taobao.pamirs.schedule.strategy.ScheduleStrategy;
import com.taobao.pamirs.schedule.taskmanager.ScheduleServer;
import com.taobao.pamirs.schedule.taskmanager.ScheduleTaskType;
import com.taskconsole.service.ZookeeperService;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.io.StringWriter;
import java.util.*;

/**
 * 功能说明: <br>
 * 系统版本: 1.0 <br>
 * 开发人员: dengqz
 * 开发时间: 2017/10/25<br>
 * @author  dengqz
 * <br>
 */
@Service
public class ZookeeperServiceImpl implements ZookeeperService {

    @Override
    public void initZookeeper() {
        try {
            ConsoleManager.initial();
            ConsoleManager.getScheduleDataManager();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<ScheduleStrategy> getScheduleStrategyList() {
        List<ScheduleStrategy> scheduleStrategyList = null;
        try {
            scheduleStrategyList = ConsoleManager.getScheduleStrategyManager().loadAllScheduleStrategy();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return scheduleStrategyList;
    }

    @Override
    public List<ScheduleTaskType> getScheduleTaskTypeList()  {
        List<ScheduleTaskType> scheduleTaskTypes = null;
        try {
            scheduleTaskTypes = ConsoleManager.getScheduleDataManager().getAllTaskTypeBaseInfo();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return scheduleTaskTypes;
    }

    @Override
    public boolean isInitial() {
        boolean isInittial= false;
        try {
            isInittial = ConsoleManager.isInitial();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return isInittial;
    }

    @Override
    public List<ManagerFactoryInfo> getManagerFactoryInfoList()  {
        List<ManagerFactoryInfo> managerFactoryInfos = null;
        try {
            managerFactoryInfos =  ConsoleManager.getScheduleStrategyManager().loadAllManagerFactoryInfo();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return managerFactoryInfos;
    }

    @Override
    public Properties getZookeeperConfig(){
        Properties properties = null;
        try {
            properties = ConsoleManager.loadConfig();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return properties;
    }

    @Override
    public String getConfigFile() {
        return ConsoleManager.configFile;
    }

    @Override
    public String getZookeeperData() {
        String zookeeperData = null;
        StringWriter writer = new StringWriter();
        try {
            ConsoleManager.getScheduleStrategyManager().printTree(
                    ConsoleManager.getScheduleStrategyManager().getRootPath(),writer,"<br/>");
        } catch (Exception e) {
            e.printStackTrace();
        }
        zookeeperData=writer.getBuffer().toString();
        return zookeeperData;
    }

    @Override
    public String getRootPath() {
        String rootPath = null;
        try {
            rootPath = ConsoleManager.getScheduleStrategyManager().getRootPath();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rootPath;
    }

    @Override
    public List<ScheduleServer> getScheduleServerList(String managerFactoryUUID, String baseTaskType, String ownSign, String ip, String orderStr) {
        List<ScheduleServer> serverList = null;
        try {
            if(managerFactoryUUID != null && managerFactoryUUID.trim().length() >0){
                serverList = ConsoleManager.getScheduleDataManager().selectScheduleServerByManagerFactoryUUID(managerFactoryUUID);
            }else{
                serverList = ConsoleManager.getScheduleDataManager()
                        .selectScheduleServer(baseTaskType,ownSign,ip,orderStr);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return serverList;
    }

    @Override
    public List<Map<String, Object>> getScheduleServerBgColor(List<ScheduleServer> scheduleServers) {
        List<Map<String,Object>> bgColorList = new ArrayList<Map<String,Object>>();
        try {
            for(int j =0;j<scheduleServers.size();j++) {
                Map<String,Object> bgColorMap = new HashMap<String,Object>();
                String bgColor = "";
                ScheduleTaskType base = ConsoleManager.getScheduleDataManager().loadTaskTypeBaseInfo(scheduleServers.get(j).getBaseTaskType());
                if (scheduleServers.get(j).getCenterServerTime().getTime() - scheduleServers.get(j).getHeartBeatTime().getTime() > base.getJudgeDeadInterval()) {
                    bgColor = "BGCOLOR='#A9A9A9'";
                } else if (scheduleServers.get(j).getLastFetchDataTime() == null || scheduleServers.get(j).getCenterServerTime().getTime() - scheduleServers.get(j).getLastFetchDataTime().getTime() > base.getHeartBeatRate() * 20) {
                    bgColor = "BGCOLOR='#FF0000'";
                }
                bgColorMap.put("bgcolor",bgColor);
                bgColorList.add(bgColorMap);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return bgColorList;
    }
}
