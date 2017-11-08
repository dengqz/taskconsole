<%@ page contentType="text/html; charset=GB2312" %>
<html>
<head>
<STYLE type=text/css>

TH{color:#5371BA;font-weight:bold;font-size:12px;background-color:#E4EFF1;display:block;}
TD{font-size:12px;}

</STYLE>
</head>
<body>
<form id="scheduleStrategyForm" method="get" name="scheduleStrategyForm" action="${pageContext.request.contextPath}/ssl/dealScheduleStrategy">
<input type="hidden" name="action" value="${actionName}"/>
<table>
<tr>
	<td>��������:</td>
	<td><input type="text" id="strategyName" name="strategyName"  ${editSts} value="${scheduleStrategy.strategyName}" width="30"></td>
	<td>������д�����������ĺ������ַ�</td>
</tr>
<tr>
	<td>��������:</td>
	<td><input type="text" id="kind" name="kind"   value="${scheduleStrategy.kind}" width="30"></td>
	<td>��ѡ���ͣ�Schedule,Java,Bean ��Сд����</td>
</tr>
<tr>
	<td>��������:</td>
	<td><input type="text" id="taskName" name="taskName"  value="${scheduleStrategy.taskName}" width="30"></td>
	<td>����������ƥ����������磺1��������������õ���������(��ӦSchedule) 2��Class����(��Ӧjava) 3��Bean������(��ӦBean)</td>
</tr>
<tr>
	<td>�������:</td>
	<td><input type="text" id="taskParameter" name="taskParameter"   value="${scheduleStrategy.taskParameter}" width="30"></td>
	<td>���ŷָ���Key-Value�� ����������ΪSchedule����Ч����Ҫͨ��������������õ�</td>
</tr>

<tr>
	<td>��JVM����߳�������:</td>
	<td><input type="text" name="numOfSingleServer" value="${scheduleStrategy.numOfSingleServer}" width="30"></td>
	<td>��JVM����߳��������������0�����ʾû������.ÿ̨�������е��߳������� =����/������ </td>
</tr>
<tr>
	<td>����߳���������</td>
	<td><input type="text" name="assignNum" value="${scheduleStrategy.assignNum}"  width="30"></td>
	<td>���з������ܹ����е��������</td>
</tr>
<tr>
	<td>IP��ַ(���ŷָ�)��</td>
	<td><input type="text" name="ips" value="${ips}" width="30"></td>
	<td>127.0.0.1����localhost�������л���������</td>
</tr>
</table>
<br/>
<input type="button" value="����" onclick="save();" style="width:100px" >

</form>

</body>
</html>

<script>
function save(){
	var strategyName = document.all("strategyName").value;
	var reg = /.*[\u4e00-\u9fa5]+.*$/; 
	if(reg.test(strategyName)){
	   alert('�������Ͳ��ܺ�����');
	   return;
	}
	if(strategyName==null||strategyName==''||isContainSpace(strategyName)){
        console.log(strategyName);
		alert('�������Ͳ���Ϊ�ջ���ڿո�');
		return;
	}
    document.getElementById("scheduleStrategyForm").submit();
}
  
function isContainSpace(array) {   
	if(array.indexOf(' ')>=0){
		return true;
	}
    return false;
}
</script>