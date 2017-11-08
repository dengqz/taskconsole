<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=GB2312" %>
<html>
<head>
<title>
Schedule���ȹ���
</title>
<STYLE type=text/css>

TH{height:20px;color:#5371BA;font-weight:bold;font-size:12px;text-align:center;border:#8CB2E3 solid;border-width:0 1 1 0;background-color:#E4EFF1;}
TD{background-color: ;border:#8CB2E3 1px solid;border-width:0 1 1 0;font-size:12px;}
table{border-collapse:collapse}
</STYLE>

</head>
<body style="font-size:12px;">
<table id="list" border="1" >
<thead>
     <tr>
     	<th>���</th>
     	<th >����</th>
     	<th>��������</th>
     	<th>������Bean</th>
     	<th>����Ƶ��(��)</th>
     	<th>�������(��)</th>
     	<th>�߳���</th>
     	<th>ÿ�λ�ȡ������</th>
     	<th>ÿ��ִ������</th>
     	<th>û������ʱ����ʱ��(��)</th>
     	<th>����ģʽ</th>
     	<th>ÿ�δ��������ݺ�����ʱ��(��)</th>
    	<th>�����������Ϣʱ��(Сʱ)</th>
     	<th>ִ�п�ʼʱ��</th>
     	<th>ִ�н���ʱ��</th>
     	<th>���߳������������</th>
     	<th>�Զ������</th>
     	<th>������</th>
     </tr>
     </thead>
     <tbody>
	 <c:if test="${!empty scheduleTaskTypes}">
		 <c:forEach items="${scheduleTaskTypes}" var="scheduleTask" varStatus="idxStatus">
	          <tr onclick="openDetail(this,'${scheduleTask.baseTaskType}')">
				  <td>${idxStatus.index+1}</td>
				  <td width="120" align="center">
					  <a target="taskDetail" href="${pageContext.request.contextPath}/tasktypelist/editTaskType?taskType=${scheduleTask.baseTaskType}" style="color:#0000CD">�༭</a>
					  <a target="taskDetail" href="${pageContext.request.contextPath}/tasktypelist/dealTaskType?action=clearTaskType&taskType=${scheduleTask.baseTaskType}" style="color:#0000CD">����</a>
					  <a target="taskDetail" href="javascript:void(0)"  onclick="validateDel('${scheduleTask.baseTaskType}')"  style="color:#0000CD">ɾ��</a>
				  </td>
				  <td>${scheduleTask.baseTaskType}</td>
				  <td>${scheduleTask.dealBeanName}</td>
				  <td>${scheduleTask.heartBeatRate/1000.0}</td>
				  <td>${scheduleTask.judgeDeadInterval/1000.0}</td>
				  <td>${scheduleTask.threadNumber}</td>
				  <td>${scheduleTask.fetchDataNumber}</td>
				  <td>${scheduleTask.executeNumber}</td>
				  <c:if test="${scheduleTask.sleepTimeNoData==0}">
				  <td>--</td>
				  </c:if>
				  <c:if test="${scheduleTask.sleepTimeNoData!=0}">
				  <td>${scheduleTask.sleepTimeNoData/1000.0}</td>
				  </c:if>
				  <td>${scheduleTask.processorType}</td>
				  <c:if test="${scheduleTask.sleepTimeInterval==0}">
				  <td>--</td>
				  </c:if>
				  <c:if test="${scheduleTask.sleepTimeInterval!=0}">
				  <td>${scheduleTask.sleepTimeInterval/1000.0}</td>
				  </c:if>
				  <td>${scheduleTask.expireOwnSignInterval}</td>
				  <c:if test="${scheduleTask.permitRunStartTime==null}">
				  <td>--</td>
				  </c:if>
				  <c:if test="${scheduleTask.permitRunStartTime!=null}">
				  <td>${scheduleTask.permitRunStartTime}</td>
				  </c:if>
				  <c:if test="${scheduleTask.permitRunEndTime==null}">
				  <td>--</td>
				  </c:if>
				  <c:if test="${scheduleTask.permitRunEndTime!=null}">
				  <td>${scheduleTask.permitRunEndTime}</td>
				  </c:if>
				  <td>${scheduleTask.maxTaskItemsOfOneThreadGroup}</td>
				  <c:if test="${scheduleTask.taskParameter==null}">
				  <td>--</td>
				  </c:if>
				  <c:if test="${scheduleTask.taskParameter!=null}">
				  <td>${scheduleTask.taskParameter}</td>
				  </c:if>
				  <td>
					  <c:forEach  var="taskItems" items="${scheduleStrategy.taskItems}" varStatus="st">
						  ${taskItems}
					  </c:forEach>
				  </td>
		 </c:forEach>
     </c:if>
</tbody>
</table>
<br/>
<a target="taskDetail" href="${pageContext.request.contextPath}/tasktypelist/editTaskType?taskType=-1" style="color:#0000CD">����������...</a>
��������Ϣ��<br/>
<iframe id="showTaskDetail" name="taskDetail"  height="80%" width="100%"></iframe>
</body>
</html>
<script>
var oldSelectRow = null;
function openDetail(obj,baseTaskType){
	if(oldSelectRow != null){
		oldSelectRow.bgColor="";
	}
	obj.bgColor="#FFD700";
	oldSelectRow = obj;
	document.getElementById("showTaskDetail").src = "${pageContext.request.contextPath}/jsp/schedule/taskTypeInfo.jsp?baseTaskType=" + baseTaskType;
}

if(list.rows.length >1){
	list.rows[1].click();
}

function deleteTaskType(baseTaskType){
	//return window.confirm("��ȷ�����еĵ��������Ѿ�ֹͣ������ᵼ�µ������쳣��");
		
}

function validateDel(str) {
    var flag = window.confirm("ȷ��ɾ������"+str+"?");
    if(flag) {
        window.location.href="${pageContext.request.contextPath}/tasktypelist/dealTaskType?action=deleteTaskType&taskType="+str;
    }
    return false;
}
</script>