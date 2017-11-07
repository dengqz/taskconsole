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
	<td>策略名称:</td>
	<td><input type="text" id="strategyName" name="strategyName"  ${editSts} value="${scheduleStrategy.strategyName}" width="30"></td>
	<td>必须填写，不能有中文和特殊字符</td>
</tr>
<tr>
	<td>任务类型:</td>
	<td><input type="text" id="kind" name="kind"   value="${scheduleStrategy.kind}" width="30"></td>
	<td>可选类型：Schedule,Java,Bean 大小写敏感</td>
</tr>
<tr>
	<td>任务名称:</td>
	<td><input type="text" id="taskName" name="taskName"  value="${scheduleStrategy.taskName}" width="30"></td>
	<td>与任务类型匹配的名称例如：1、任务管理中配置的任务名称(对应Schedule) 2、Class名称(对应java) 3、Bean的名称(对应Bean)</td>
</tr>
<tr>
	<td>任务参数:</td>
	<td><input type="text" id="taskParameter" name="taskParameter"   value="${scheduleStrategy.taskParameter}" width="30"></td>
	<td>逗号分隔的Key-Value。 对任务类型为Schedule的无效，需要通过任务管理来配置的</td>
</tr>

<tr>
	<td>单JVM最大线程组数量:</td>
	<td><input type="text" name="numOfSingleServer" value="${scheduleStrategy.numOfSingleServer}" width="30"></td>
	<td>单JVM最大线程组数量，如果是0，则表示没有限制.每台机器运行的线程组数量 =总量/机器数 </td>
</tr>
<tr>
	<td>最大线程组数量：</td>
	<td><input type="text" name="assignNum" value="${scheduleStrategy.assignNum}"  width="30"></td>
	<td>所有服务器总共运行的最大数量</td>
</tr>
<tr>
	<td>IP地址(逗号分隔)：</td>
	<td><input type="text" name="ips" value="${ips}" width="30"></td>
	<td>127.0.0.1或者localhost会在所有机器上运行</td>
</tr>
</table>
<br/>
<input type="button" value="保存" onclick="save();" style="width:100px" >

</form>

</body>
</html>

<script>
function save(){
	var strategyName = document.all("strategyName").value;
	var reg = /.*[\u4e00-\u9fa5]+.*$/; 
	if(reg.test(strategyName)){
	   alert('任务类型不能含中文');
	   return;
	}
	if(strategyName==null||strategyName==''||isContainSpace(strategyName)){
        console.log(strategyName);
		alert('任务类型不能为空或存在空格');
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