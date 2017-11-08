<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=GB2312" %>
<html>
<head>
<title>
调度策略管理
</title>
<STYLE type=text/css>
TH{height:20px;color:#5371BA;font-weight:bold;font-size:12px;text-align:center;border:#8CB2E3 solid;border-width:0 1 1 0;background-color:#E4EFF1;white-space:nowrap;overflow:hidden;}
TD{background-color: ;border:#8CB2E3 1px solid;border-width:0 1 1 0;font-size:12px;}
table{border-collapse:collapse}
</STYLE>
</head>
<body style="font-size:12px;">

<table id="contentTable" border="1" >
     <tr>
     	<th width="50" >序号</th>
     	<th width="100" >管理</th>
     	<th >任务处理机</th>
     	<th width="50" >状态</th>
     </tr>
	<c:if test="${!empty managerFactoryInfoList}">
		<c:forEach items="${managerFactoryInfoList}" var="managerFactoryInfo" varStatus="idxStatus">
		<tr onclick="openDetail(this,'${managerFactoryInfo.uuid}')">
			<td align="center">${idxStatus.index+1}</td>

			<c:if test="${managerFactoryInfo.start=='true'}">
			<td align="center">
				<a target="scheduleStrategyRuntime" href="managerFactoryDeal.jsp?action=stopManagerFactory&uuid=${managerFactoryInfo.uuid}" style="color:#0000CD">停止</a>
			</td>
			</c:if>
			<c:if test="${!managerFactoryInfo.start=='true'}">
			<td align="center">
				<a target="scheduleStrategyRuntime" href="managerFactoryDeal.jsp?action=stopManagerFactory&uuid=${managerFactoryInfo.uuid}" style="color:#0000CD">启动</a>
			</td>
			</c:if>
			<td>${managerFactoryInfo.uuid}</td>
			<c:if test="${managerFactoryInfo.start=='true'}">
				<td>运行</td>
			</c:if>
			<c:if test="${!managerFactoryInfo.start=='true'}">
				<td>休眠</td>
			</c:if>
		</tr>
	 </c:forEach>
	</c:if>
</table>
<br/>
此调度器上的任务分配情况：
<iframe  name="scheduleStrategyRuntime" height="150" width="100%"></iframe>
此调度器上的服务情况
<iframe  name="servlerList" height="230" width="100%"></iframe>
</body>
</html>
<script>

var oldSelectRow = null;
function openDetail(obj,uuid){
	if(oldSelectRow != null){
		oldSelectRow.bgColor="";
	}
	obj.bgColor="#FFD700";
	oldSelectRow = obj;
    document.all("servlerList").src = "${pageContext.request.contextPath}/scheduleserverlist/getscheduleserverlist?managerFactoryUUID=" + uuid;
    document.all("scheduleStrategyRuntime").src = "${pageContext.request.contextPath}/ssl/scheduleStrategyRuntime?uuid=" + uuid;
}
if(contentTable.rows.length >1){
	contentTable.rows[1].click();
}

</script>