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
<h1>������Ϣ����</h1>
<form id="configForm" method="get" name="configForm" action="configDeal.jsp">
<table>
<tr>
	<td>Zookeeper��ַ:</td>
	<td><input type="text" name="zkConnectString"  value="${zkMap.zkConnect}" style="width:300"></td>
	<td>��ʽ: IP��ַ���˿�</td>
</tr>
<tr>
	<td>Zookeeper��ʱ:</td>
	<td><input type="text" name="zkSessionTimeout" value="${zkMap.zkSession}" style="width:300"></td>
	<td>��λ����</td>
</tr>
<tr>
	<td>Zookeeper��Ŀ¼��</td>
	<td><input type="text" name="rootPath" value="${zkMap.zkRootPath}" style="width:300"></td>
	<td>���磺/taobao-pamirs-schedule/huijin,��������һ��Ŀ¼��Ҳ�����Ƕ༶Ŀ¼��ע�ⲻͬ������䲻���и��ӹ�ϵ<br/>
	    ͨ���л���������ʵ�ֶ��������Ĺ���
	</td>
</tr>
<tr>
	<td>Zookeeper�û���</td>
	<td><input type="text" name="userName" value="${zkMap.zkUserName}" style="width:300"></td>
	<td></td>
</tr>
<tr>
	<td>Zookeeper���룺</td>
	<td><input type="text" name="password" value="${zkMap.zkPassword}" style="width:300"	></td>
	<td></td>
</tr>
</table>
<br/>
<input type="button" value="����" onclick="save();" style="width:100px" >
<a href="${pageContext.request.contextPath}/ssl/getScheduleStrategyList">������ҳ...</a>
<br/><br/>
	<c:if test="${zkMap.isInitial=='false'}">
		<b>�м���ԭ��������Ҫ������Щ��Ϣ��</b><br>
		&nbsp&nbsp&nbsp&nbsp 1�����ǵ�һ������<br>
		&nbsp&nbsp&nbsp&nbsp 2�����������Ϣ��ɾ��&nbsp<b>${zkMap.configFile}</b><br>
		&nbsp&nbsp&nbsp&nbsp 3�����Ӳ��������õ�Zookeeper������<br>
	</c:if>
</form>

</body>
</html>

<script>
function save(){
    document.getElementById("configForm").submit();
}
</script>