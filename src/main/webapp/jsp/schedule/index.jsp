<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.taobao.pamirs.schedule.ConsoleManager"%>
<%@ page contentType="text/html; charset=GB2312" %>

<html>
<head>
<title>
Schedule���ȹ���
</title>
<STYLE type=text/css>
TH{height:20px;color:#5371BA;font-weight:bold;font-size:12px;text-align:center;border:#8CB2E3 solid;border-width:0 1 1 0;background-color:#E4EFF1;display:block;}
TD{background-color: ;border:#8CB2E3 solid;border-width:0 1 1 0;font-size:12px;}
</STYLE>
</head>
<body style="font-size:12px;">
<h1 align="center">TaobaoSchedule���ȹ������̨</h1>
<a id="strategyList" onclick="linkOnclick(this);"  target="content" href="${pageContext.request.contextPath}/ssl/getScheduleStrategyList" style="color:#0000CD">���Ȳ���</a>
<a id="taskTypeList" onclick="linkOnclick(this);" target="content" href="${pageContext.request.contextPath}/tasktypelist/getTaskTypeList" style="color:#0000CD">�������</a>
<a id="managerFactoryList" onclick="linkOnclick(this);" target="content" href="${pageContext.request.contextPath}/managerFactoryInfo/getManagerFactoryInfoList" style="color:#0000CD">��������</a>
<a id="serverList" onclick="linkOnclick(this);" target="content" href="${pageContext.request.contextPath}/scheduleserverlist/getscheduleserverlist" style="color:#0000CD">�����߳����б�</a>
	<a id="config" onclick="linkOnclick(this);" target="content" href="${pageContext.request.contextPath}/init/getZookeeperConfig" style="color:#0000CD">Zookeeper��������</a>
	<a id="zookeeperData" onclick="linkOnclick(this);" target="content" href="${pageContext.request.contextPath}/zookeeper/getZookeeperData" style="color:#0000CD">Zookeeper����</a>
	<a id="zookeeperDataExport" onclick="linkOnclick(this);" target="content" href="${pageContext.request.contextPath}/zookeeper/initExprortConfig" style="color:#0000CD">Export��������</a>
	<a id="zookeeperDataImport" onclick="linkOnclick(this);" target="content" href="${pageContext.request.contextPath}/zookeeper/initimportconfig" style="color:#0000CD">Import��������</a>

&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp��ο���<a href="http://code.taobao.org/p/tbschedule/wiki/index/">tbschedule��Դ��Ŀ</a>
&nbsp&nbsp<font style="color:red;font-size:15">[����ʹ��IE8]</font>
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
