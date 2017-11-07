<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.taobao.pamirs.schedule.ConsoleManager"%>
<%@ page contentType="text/html; charset=GB2312" %>

<html>
<head>
<title>
Schedule调度管理
</title>
<STYLE type=text/css>
TH{height:20px;color:#5371BA;font-weight:bold;font-size:12px;text-align:center;border:#8CB2E3 solid;border-width:0 1 1 0;background-color:#E4EFF1;display:block;}
TD{background-color: ;border:#8CB2E3 solid;border-width:0 1 1 0;font-size:12px;}
</STYLE>
</head>
<body style="font-size:12px;">
<h1 align="center">TaobaoSchedule调度管理控制台</h1>
<a id="strategyList" onclick="linkOnclick(this);"  target="content" href="${pageContext.request.contextPath}/ssl/getScheduleStrategyList" style="color:#0000CD">调度策略</a>
<a id="taskTypeList" onclick="linkOnclick(this);" target="content" href="${pageContext.request.contextPath}/tasktypelist/getTaskTypeList" style="color:#0000CD">任务管理</a>
<a id="managerFactoryList" onclick="linkOnclick(this);" target="content" href="${pageContext.request.contextPath}/managerFactoryInfo/getManagerFactoryInfoList" style="color:#0000CD">机器管理</a>
<a id="serverList" onclick="linkOnclick(this);" target="content" href="${pageContext.request.contextPath}/scheduleserverlist/getscheduleserverlist" style="color:#0000CD">处理线程组列表</a>
	<a id="config" onclick="linkOnclick(this);" target="content" href="${pageContext.request.contextPath}/init/getZookeeperConfig" style="color:#0000CD">Zookeeper连接配置</a>
	<a id="zookeeperData" onclick="linkOnclick(this);" target="content" href="${pageContext.request.contextPath}/zookeeper/getZookeeperData" style="color:#0000CD">Zookeeper数据</a>
	<a id="zookeeperDataExport" onclick="linkOnclick(this);" target="content" href="${pageContext.request.contextPath}/zookeeper/initExprortConfig" style="color:#0000CD">Export配置数据</a>
	<a id="zookeeperDataImport" onclick="linkOnclick(this);" target="content" href="${pageContext.request.contextPath}/zookeeper/initimportconfig" style="color:#0000CD">Import配置数据</a>

&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp请参考：<a href="http://code.taobao.org/p/tbschedule/wiki/index/">tbschedule开源项目</a>
&nbsp&nbsp<font style="color:red;font-size:15">[建议使用IE8]</font>
<iframe  name="content" FRAMEBORDER="0"  height="85%" width="100%" src="${pageContext.request.contextPath}/ssl/getScheduleStrategyList"></iframe>
</body>
</html>

<script>
function linkOnclick(obj){
	taskTypeList.style.backgroundColor="";
	strategyList.style.backgroundColor="";
	managerFactoryList.style.backgroundColor="";
	serverList.style.backgroundColor="";
	config.style.backgroundColor="";
	zookeeperData.style.backgroundColor="";
	zookeeperDataExport.style.backgroundColor="";
	zookeeperDataImport.style.backgroundColor="";
	
	obj.style.backgroundColor="#FF0000";	
}

</script>
