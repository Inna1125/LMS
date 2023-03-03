<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%
		String c_code = request.getParameter("c_code");
		String c_name = request.getParameter("c_name");
%>
<script>
		location.href = "findCom.jsp?c_code=<%=c_code%>"
</script>
</head>
<body>

</body>
</html>