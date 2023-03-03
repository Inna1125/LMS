<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자권한</title>
</head>
<body>
	<%
		String sess_id = (String)session.getAttribute("m_id");
		if(sess_id != null){
			if(!sess_id.equals("admin")){
		%>
		<script>
			alert("관리자권한이 필요합니다.");
			history.back();
		</script>
		<%}
			}else{%>
		<script>
			alert("로그인 후 이용가능합니다.");
			location.href = "../login/login.jsp";
		</script>
		<%} %>
</body>
</html>