<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그아웃창</title>
</head>
<body>
	<%
		String m_id = (String)session.getAttribute("m_id");
		if(m_id != null && request.isRequestedSessionIdValid()){
			session.invalidate();
	%>
		<script>
			alert("정상적으로 로그아웃 되었습니다.");
			location.href = "../home/index.jsp";
		</script>
		
	<%}response.sendRedirect("../home/index.jsp");%>
</body>
</html>