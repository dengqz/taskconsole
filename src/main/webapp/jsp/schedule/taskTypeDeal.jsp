<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=GB2312" %>
<html>
<head>
<title>
������������
</title>
</head>
<body bgcolor="#ffffff">
${result}
-----------
${isRefreshParent}
<input value="${isRefreshParent}" type="text">
</body>
</html>
<c:if test="${isRefreshParent=='true'}">
	<script>
        parent.location.reload();
	</script>
</c:if>
