<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=GB2312" %>

<html>
<head>
<title>
���ȶ�̬�������
</title>
<STYLE type=text/css>


TH{height:20px;color:#5371BA;font-weight:bold;font-size:12px;text-align:center;border:#8CB2E3 solid;border-width:0 1 1 0;background-color:#E4EFF1;white-space:nowrap;overflow:hidden;}
TD{background-color: ;border:#8CB2E3 1px solid;border-width:0 1 1 0;font-size:12px;}
table{border-collapse:collapse}
</STYLE>
</head>
<body style="font-size:12px;">
<table border="1" >
     <tr>
     	<th>���</th>
     	<th>��������</th>
     	<th>�������</th>
    	<th>�߳�������</th>
    	<th>������Ϣ</th>
     </tr>

	<c:if test="${!empty runntimeList}">
	<c:forEach items="${runntimeList}" var="runntime" varStatus="idxStatus">
		<tr >
			<td>${idxStatus.index+1}</td>
			<td>${runntimeList.strategyName}</td>
			<td align="center">${runntimeList.uuid}</td>
			<td align="center">${runntimeList.requestNum}</td>
			<td align="center" style="" ><p style="color:red">${runntimeList.message}</p></td>
		</tr>
	</c:forEach>
	</c:if>
</table>
</body>
</html>