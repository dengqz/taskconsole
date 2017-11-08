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

<table id="contentTable" border="1">
     <tr>
     	<th>序号</th>
     	<th>管理</th>
     	<th>策略名称</th>
     	<th>任务状态</th>
     	<th>任务类型</th>
     	<th>任务名称</th>
     	<th>任务参数</th>
     	<th>单JVM最大线程组数量</th>
    	<th>最大线程组数量</th>
     	<th>IP地址(逗号分隔)</th>
     </tr>
	<c:if test="${!empty scheduleStrategyList}">
		<c:forEach var="scheduleStrategy" items="${scheduleStrategyList}" varStatus="idxStatus">
			<tr onclick="openDetail(this,'${scheduleStrategy.strategyName}')">
				<td>${idxStatus.index+1}</td>
				<td width="100" align="center">
					<a target="strategyDetail" href="${pageContext.request.contextPath}/ssl/editScheduleStrategy?taskType=${scheduleStrategy.strategyName}" style="color:#0000CD">编辑</a>
					<a target="strategyDetail" href="javascript:void(0)" onclick="validateDel('${scheduleStrategy.strategyName}')">删除</a>
					<c:if test="${scheduleStrategy.sts=='pause'}">
						<a target="strategyDetail" href="${pageContext.request.contextPath}/ssl/dealScheduleStrategy?action=resumeTaskType&strategyName=${scheduleStrategy.strategyName}" style="color:#0000CD">恢复</a>
					</c:if>
					<c:if test="${scheduleStrategy.sts=='resume'}">
						<a target="strategyDetail" href="${pageContext.request.contextPath}/ssl/dealScheduleStrategy?action=pauseTaskType&strategyName=${scheduleStrategy.strategyName}" style="color:#0000CD">停止</a>
					</c:if>
				</td>
				<td>${scheduleStrategy.strategyName}</td>
				<c:if test="${scheduleStrategy.sts=='pause'}">
					<td>停止</td>
				</c:if>
				<c:if test="${scheduleStrategy.sts=='resume'}">
					<td>正常</td>
				</c:if>
				<td>${scheduleStrategy.kind}</td>
				<td>${scheduleStrategy.taskName}</td>
				<td>${scheduleStrategy.taskParameter}</td>

				<td align="center">${scheduleStrategy.numOfSingleServer}</td>
				<td align="center">${scheduleStrategy.assignNum}</td>
				<td>
				<c:forEach  var="cost" items="${scheduleStrategy.IPList}" varStatus="st">
					${cost}
				</c:forEach>
				</td>
			</tr>

		</c:forEach>
	</c:if>


</table>
<br/>
<a target="strategyDetail" href="${pageContext.request.contextPath}/ssl/editScheduleStrategy?taskType=-1" style="color:#0000CD">创建新策略...</a>
任务在各个机器上的分配情况：
<iframe id="showStrategyDetail" name="strategyDetail" height="80%" width="100%"></iframe>
</body>
</html>
<script>

var oldSelectRow = null;
function openDetail(obj,strategyName){
	if(oldSelectRow != null){
		oldSelectRow.bgColor="";
	}
	obj.bgColor="#FFD700";
	oldSelectRow = obj;
	document.getElementById("showStrategyDetail").src = "${pageContext.request.contextPath}/ssl/scheduleStrategyRuntime?strategyName=" + strategyName;
}
if(contentTable.rows.length >1){
	contentTable.rows[1].click();
}

function validateDel(str) {
    var flag = window.confirm("确认删除策略"+str+"?");
    if(flag) {
        window.location.href="${pageContext.request.contextPath}/ssl/dealScheduleStrategy?action=deleteScheduleStrategy&strategyName="+str;
    }
}
</script>