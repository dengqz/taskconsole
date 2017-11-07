<%@page import="com.taobao.pamirs.schedule.taskmanager.ScheduleTaskType"%>
<%@page import="com.taobao.pamirs.schedule.taskmanager.ScheduleServer"%>
<%@page import="com.taobao.pamirs.schedule.ConsoleManager"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html; charset=GB2312" %>
<html>
<head>
<title>
调动服务器历史信息
</title>
<STYLE type=text/css>


TH{height:20px;color:#5371BA;font-weight:bold;font-size:12px;text-align:center;border:#8CB2E3 solid;border-width:0 1 1 0;background-color:#E4EFF1;white-space:nowrap;overflow:hidden;}
TD{background-color: ;border:#8CB2E3 1px solid;border-width:0 1 1 0;font-size:12px;}
table{border-collapse:collapse}
</STYLE>

</head>
<body style="font-size:12px;">

<%
String managerFactoryUUID = request.getParameter("managerFactoryUUID");
String baseTaskType =  request.getParameter("baseTaskType");
String ownSign =  request.getParameter("ownSign");
String ip =  request.getParameter("ip");
String orderStr =  request.getParameter("orderStr");
%>

<c:if test="${fn:length(managerFactoryUUID) == 0||empty managerFactoryUUID}">
<table border="0">
  <tr>
  	<td>任务类型：</td><td><input type="text" id="baseTaskType" value="<%=baseTaskType==null?"":baseTaskType%>"> </td>
  	<td>任务域：</td><td><input type="text" id="ownSign" value="<%=ownSign==null?"":ownSign%>"> </td>
  	<td>IP：</td><td><input type="text" id="ip" value="<%=ip==null?"":ip%>"> </td>
  	<td>排序：</td><td><input type="text" id="orderStr" value="<%=orderStr==null?"":orderStr%>"> </td>
  	<td><input type="button"  onclick="query()" value="查询" style="width:100;"></td>
  </tr>  
</table>
</c:if>

   <table id="list" border="1" style=";border-COLLAPSE: collapse;display:block;">
   <tr >
   <th nowrap>序号</th>
   <th>任务类型<BR/>[TASK_TYPE]</th>
   <th>域<BR/>[OWN_SIGN]</th>
   <th>IP地址<BR/>[IP]</th>
   <th>主机名称[HOST_NAME]</th>
   <th nowrap>线程<BR/>[THREAD_NUM]</th>
   <th>注册时间<BR/>[REGISTER_TIME]</th>
   <th>心跳时间<BR/>[HEARTBEAT_TIME]</th>
   <th>取数时间<BR/>[LAST_FETCH_DATA_TIME]</th>
   <th nowrap>版本<BR/>[VERSION]</th>
   <th nowrap>下次开始<BR/>[NEXT_RUN_START_TIME]</th>
   <th nowrap>下次结束<BR/>[NEXT_RUN_END_TIME]</th>
   <th>处理器<BR/>[MANAGER_FACTORY]</th>
   <th>处理详情</th>   
   </tr>

       <c:forEach items="${bgColorList}" var="bgColor" varStatus="idxStatus">
       <tr onclick="openDetail(this)" ${bgColor.bgColor}>
       </c:forEach>
       <c:forEach items="${serverList}" var="server" varStatus="idxStatus">
	   <td>${idxStatus.index+1}</td>
       <td>${server.baseTaskType}</td>
       <td>${server.ownSign}</td>
       <td nowrap>${server.ip}</td>
       <td nowrap>${server.hostName}</td>
       <td>${server.threadNum}</td>
       <td nowrap>${server.registerTime}</td>
       <td nowrap>${server.heartBeatTime}</td>
       <c:if test="${server.lastFetchDataTime==null}">
           <td nowrap>--</td>
       </c:if>
       <c:if test="${server.lastFetchDataTime!=null}">
           <td nowrap>${server.lastFetchDataTime}</td>
       </c:if>
       <td nowrap>${server.version}</td>
       <c:if test="${server.nextRunStartTime==null}">
           <td nowrap>--</td>
       </c:if>
       <c:if test="${server.nextRunStartTime!=null}">
           <td nowrap>${server.nextRunStartTime}</td>
       </c:if>
       <c:if test="${server.nextRunEndTime==null}">
           <td nowrap>--</td>
       </c:if>
       <c:if test="${server.nextRunEndTime!=null}">
           <td nowrap>${server.nextRunEndTime}</td>
       </c:if>
       <td nowrap>${server.managerFactoryUUID}</td>
       <td nowrap>${server.dealInfoDesc}</td>
	   </tr>
       </c:forEach>
   </table>
</body>
</html>

<script>

function query(){
	 var baseTaskType=document.all("baseTaskType").value;
	 var ownSign=document.all("ownSign").value;
	 var ip=document.all("ip").value;
	 var orderStr=document.all("orderStr").value;	 
	 var url =  "serverList.jsp?a=1";
	 if(baseTaskType != null && baseTaskType != ""){
		 url = url + "&baseTaskType=" + baseTaskType;
	 }
	 if(ownSign != null&& ownSign != ""){
		 url = url + "&ownSign=" + ownSign;
	 }
	 if(ip != null&& ip != ""){
		 url = url + "&ip=" + ip;
	 }
	 if(orderStr != null&& orderStr != ""){
		 url = url + "&orderStr=" + orderStr;
	 }
	 window.location.href =  url;
}


var oldSelectRow = null;
var oldBgColor=null;
function openDetail(obj){
	if(oldSelectRow != null){
		oldSelectRow.bgColor=oldBgColor;
	}
	oldBgColor=obj.bgColor;
	obj.bgColor="#FFD700";
	oldSelectRow = obj;
}

</script>
