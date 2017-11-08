<%@page import="com.taobao.pamirs.schedule.ConsoleManager"%>
<%@page import="com.taobao.pamirs.schedule.strategy.ScheduleStrategy"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=GB2312" %>
<html>
<head>
<title>
创建调度任务
</title>
</head>
<body bgcolor="#ffffff">
${result}
${result}
-----------
${isRefreshParent}
<input value="${isRefreshParent}" hidden="hidden">
</body>
</html>
<c:if test="${isRefreshParent=='true'}">
	<script>
        parent.location.reload();
	</script>
</c:if>