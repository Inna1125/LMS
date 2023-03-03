<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가입축하</title>
<link rel = "stylesheet" href = "../css/join.css">
</head>
<body>
<%@include file = "../Menu/header.jsp" %>
	<div class = "context">
		<div class = "step">
			<h2>회원가입</h2>
				<ul>
					<li style = "color :#FFFDEE;">약관 및 정책 동의</li>
					<li style = "color :#FFFDEE;"> > 회원정보입력 > </li>
					<li style = "color : #B9DFEA;">가입완료</li>
				</ul>
				<hr>	
		</div>
	<p class = "wel"><h3 class = "wel" style = "font-size:20pt;"><%=(String)session.getAttribute("name")%>님 가입을 축하드립니다.</h3>
	<p class = "wel">사이트이용시 로그인 부탁드립니다.
	<p><input type = "button" value = "HOME" onclick = "location.href='../home/index.jsp'" class= "but">
		<input type = "button" value = "LOGIN" onclick = "location.href='../login/login.jsp'" class= "but">
	</div>
<%@include file = "../Menu/footer.jsp" %>
</body>
</html>