<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=GB2312" %>

<html>
<head>
<title>
���Ȳ��Թ���
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
     	<th>���</th>
     	<th>����</th>
     	<th>��������</th>
     	<th>����״̬</th>
     	<th>��������</th>
     	<th>��������</th>
     	<th>�������</th>
     	<th>��JVM����߳�������</th>
    	<th>����߳�������</th>
     	<th>IP��ַ(���ŷָ�)</th>
     </tr>
	<c:if test="${!empty scheduleStrategyList}">
		<c:forEach var="scheduleStrategy" items="${scheduleStrategyList}" varStatus="idxStatus">
			<tr onclick="openDetail(this,'${scheduleStrategy.strategyName}')">
				<td>${idxStatus.index+1}</td>
				<td width="100" align="center">
					<a target="strategyDetail" href="${pageContext.request.contextPath}/ssl/editScheduleStrategy?taskType=${scheduleStrategy.strategyName}" style="color:#0000CD">�༭</a>
					<a target="strategyDetail" href="javascript:void(0)" onclick="validateDel('${scheduleStrategy.strategyName}')">ɾ��</a>
					<c:if test="${scheduleStrategy.sts=='pause'}">
						<a target="strategyDetail" href="${pageContext.request.contextPath}/ssl/dealScheduleStrategy?action=resumeTaskType&strategyName=${scheduleStrategy.strategyName}" style="color:#0000CD">�ָ�</a>
					</c:if>
					<c:if test="${scheduleStrategy.sts=='resume'}">
						<a target="strategyDetail" href="${pageContext.request.contextPath}/ssl/dealScheduleStrategy?action=pauseTaskType&strategyName=${scheduleStrategy.strategyName}" style="color:#0000CD">ֹͣ</a>
					</c:if>
				</td>
				<td>${scheduleStrategy.strategyName}</td>
				<c:if test="${scheduleStrategy.sts=='pause'}">
					<td>ֹͣ</td>
				</c:if>
				<c:if test="${scheduleStrategy.sts=='resume'}">
					<td>����</td>
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
<a target="strategyDetail" href="${pageContext.request.contextPath}/ssl/editScheduleStrategy?taskType=-1" style="color:#0000CD">�����²���...</a>
�����ڸ��������ϵķ��������
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
    var flag = window.confirm("ȷ��ɾ������"+str+"?");
    if(flag) {
        window.location.href="${pageContext.request.contextPath}/ssl/dealScheduleStrategy?action=deleteScheduleStrategy&strategyName="+str;
    }
}
</script>