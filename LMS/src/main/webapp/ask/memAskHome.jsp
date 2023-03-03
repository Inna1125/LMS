<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질문홈</title>
<link rel = "stylesheet" href = "../css/ask.css">
</head>
<body>
	<%@include file = "../Menu/memHeader.jsp" %>
	
	<div class = "askHome">
		<div class = "icon">
		<img src = "/tomcatImg/support.gif" onclick = "location.href = 'memAskWrite.jsp'" style = "width:300px; height:300px;">
		<p>질문하기</p>
		</div>
		<div class = "icon">
		<img src = "/tomcatImg/techSupport.gif" onclick = "location.href = 'memAskConfirm.jsp'" style = "width:300px; height:300px;">
		<p>질문확인하기</p>
		</div>
	</div>
	<%@include file = "../Menu/footer.jsp" %>
</body>
</html>