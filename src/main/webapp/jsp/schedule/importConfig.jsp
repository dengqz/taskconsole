<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@page import="com.taobao.pamirs.schedule.ConsoleManager"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=GB2312"%>
<%--<%
	if (ConsoleManager.isInitial() == false) {
		response.sendRedirect("config.jsp");
	}
	StringWriter writer = new StringWriter();
	boolean isUpdate = false;
	String configContent = "";
	try {
		if ("POST".equals(request.getMethod())) {
			configContent = request.getParameter("configContent");
			StringReader strReader = new StringReader(configContent);
			BufferedReader bufReader = new BufferedReader(strReader);
			String line = null;
			boolean isUploadConfig = false;
			isUpdate = Boolean
					.valueOf(request.getParameter("isUpdate"));
			while ((line = bufReader.readLine()) != null) {
				isUploadConfig = true;
				if (line.contains("strategy")
						|| line.contains("baseTaskType")) {
					ConsoleManager.getScheduleStrategyManager()
							.importConfig(line, writer, isUpdate);
				} else {
					writer.write("<h3><font color=\"red\">�Ƿ�������Ϣ��\n\t\t</font>"
							+ line + "</h3>");
				}
			}
			if (!isUploadConfig) {
				writer.append("<h3><font color=\"red\">������Ϣ��\n\t</font>û��ѡ����������ļ�</h3>");
			}
		}
	} catch (Exception e) {
		StringWriter strWriter = new StringWriter();
		PrintWriter printWriter = new PrintWriter(strWriter);
		e.printStackTrace(printWriter);
		writer.append("<h3><font color=\"red\">������Ϣ��ջ��\n\t\t</font>"
				+ e.getMessage() + "\n" + strWriter.toString()
				+ "</h3>");
	}
%>--%>
<!-- encType="multipart/form-data" -->
<html>
<body style="font-size: 12px;">
<form id="taskTypeForm" method="post" name="taskTypeForm"
	action="${pageContext.request.contextPath}/zookeeper/importConfig"><pre
	style="width: 100px; float: left;">�����ı���Ϣ��</pre> <textarea
	name="configContent" style="width: 1000px; height: 150px;">${configContent}<%--<%=configContent%>--%></textarea>
<br />
�Ƿ�ǿ�Ƹ��£�&nbsp;&nbsp; <select name="isUpdate">
		<option value="true" <c:if test="${isUpdate=='true'}">selected</c:if>><%--<%if (isUpdate) {%> selected <%}%>>--%>��</option>
	<option value="false" <c:if test="${isUpdate=='false'}">selected</c:if>><%--<%if (!isUpdate) {%> selected <%}%>>--%>��</option>
</select> <input type="button" onclick="importConfig();" value="��������" /></form>
<pre>
	<h3>
${writer}<%--<%=writer.toString()%>--%>
	</h3>
</pre>
<script>
	// ���������ļ�
	function importConfig() {
		document.getElementById("taskTypeForm").submit();
	}
	function insertTitle(tValue) {
		var t1 = tValue.lastIndexOf("\\");
		var t2 = tValue.lastIndexOf(".");
		if (t1 >= 0 && t1 < t2 && t1 < tValue.length) {
			document.getElementById("fileName").value = tValue
					.substring(t1 + 1);
		}
	}
</script>
</body>
</html>
