<%@page import="com.taobao.pamirs.schedule.zk.ZKManager"%>
<%@page import="java.util.Properties"%>
<%@page import="com.taobao.pamirs.schedule.ConsoleManager"%>
<%@page import="com.taobao.pamirs.schedule.strategy.ScheduleStrategy"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=GB2312" %>

<html>
<head>
<STYLE type=text/css>

TH{color:#5371BA;font-weight:bold;font-size:12px;background-color:#E4EFF1;display:block;}
TD{font-size:12px;}

</STYLE>
</head>
<body>
<h1>基础信息配置</h1>
<form id="configForm" method="get" name="configForm" action="configDeal.jsp">
<table>
<tr>
	<td>Zookeeper地址:</td>
	<td><input type="text" name="zkConnectString"  value="${zkMap.zkConnect}" style="width:300"></td>
	<td>格式: IP地址：端口</td>
</tr>
<tr>
	<td>Zookeeper超时:</td>
	<td><input type="text" name="zkSessionTimeout" value="${zkMap.zkSession}" style="width:300"></td>
	<td>单位毫秒</td>
</tr>
<tr>
	<td>Zookeeper根目录：</td>
	<td><input type="text" name="rootPath" value="${zkMap.zkRootPath}" style="width:300"></td>
	<td>例如：/taobao-pamirs-schedule/huijin,，可以是一级目录，也可以是多级目录，注意不同调度域间不能有父子关系<br/>
	    通过切换此属性来实现多个调度域的管理
	</td>
</tr>
<tr>
	<td>Zookeeper用户：</td>
	<td><input type="text" name="userName" value="${zkMap.zkUserName}" style="width:300"></td>
	<td></td>
</tr>
<tr>
	<td>Zookeeper密码：</td>
	<td><input type="text" name="password" value="${zkMap.zkPassword}" style="width:300"	></td>
	<td></td>
</tr>
</table>
<br/>
<input type="button" value="保存" onclick="save();" style="width:100px" >
<a href="${pageContext.request.contextPath}/ssl/getScheduleStrategyList">管理主页...</a>
<br/><br/>
	<c:if test="${zkMap.isInitial=='false'}">
		<b>有几种原因导致你需要配置这些信息：</b><br>
		&nbsp&nbsp&nbsp&nbsp 1、你是第一次启动<br>
		&nbsp&nbsp&nbsp&nbsp 2、你的配置信息被删除&nbsp<b>${zkMap.configFile}</b><br>
		&nbsp&nbsp&nbsp&nbsp 3、连接不上你配置的Zookeeper服务器<br>
	</c:if>
</form>

</body>
</html>

<script>
function save(){
    document.getElementById("configForm").submit();
}
</script>