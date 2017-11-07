package com.taskconsole.service;

import com.taobao.pamirs.schedule.strategy.ManagerFactoryInfo;
import com.taobao.pamirs.schedule.strategy.ScheduleStrategy;
import com.taobao.pamirs.schedule.taskmanager.ScheduleServer;
import com.taobao.pamirs.schedule.taskmanager.ScheduleTaskType;

import java.util.List;
import java.util.Map;
import java.util.Properties;

/**
 * 功能说明: <br>
 * 系统版本: 1.0 <br>
 * 开发人员: dengqz
 * 开发时间: 2017/10/25<br>
 * <br>
 */
public interface ZookeeperService {
    void initZookeeper();
    List<ScheduleStrategy> getScheduleStrategyList() throws Exception;
    List<ScheduleTaskType> getScheduleTaskTypeList() throws Exception;
    boolean isInitial();
    List<ManagerFactoryInfo> getManagerFactoryInfoList() throws Exception;
    Properties getZookeeperConfig() throws Exception;
    String getConfigFile();
    String getZookeeperData();
    String getRootPath();
    List<ScheduleServer> getScheduleServerList(String managerFactoryUUID, String baseTaskType, String ownSign, String ip, String orderStr) throws Exception;
    List<Map<String,Object>> getScheduleServerBgColor(List<ScheduleServer> scheduleServers);
}
