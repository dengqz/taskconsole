<%@ page contentType="text/html; charset=GB2312" %>

<script>
	if(parent != null){
	  parent.location.href ="${pageContext.request.contextPath}/init/initSchedule";
	}else{
	  window.location.href ="${pageContext.request.contextPath}/init/initSchedule";
	}
</script>
