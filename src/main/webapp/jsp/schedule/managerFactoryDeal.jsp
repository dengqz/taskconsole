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
</body>
</html>
<c:if test="${isRefreshParent=='true'}">
	<script>
        parent.location.reload();
	</script>
</c:if>