<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원전용페이지</title>
</head>
<body>
	<%
		String id = "";
	
		if(session.getAttribute("m_id") != null){
			id = (String)session.getAttribute("m_id");
		}else{
	%>
		<script>
			alert("로그인 후 이용가능합니다");
			location.href = "../login/login.jsp";
		</script>
	<%
		}
	%>
</body>
</html>