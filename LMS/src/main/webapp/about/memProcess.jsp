<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학습과정</title>
<link rel = "stylesheet" href = "../css/about.css">
</head>
<body>
	<%
		String Id = (String)session.getAttribute("m_id");
		if(Id.equals("admin")){
	%> <%@ include file = "../Menu/adminHeader.jsp" %>
	<%}else{ %>
	<%@ include file = "../Menu/memHeader.jsp" %>
	<%} %>
	<div class = "pro">
	<div class = "descript">
	<h2>< 학습개요 ></h2>
		<p>온라인공간내에서 <br>
			학습관리시스템(LMS:Learning Management System)을<br>
			활용하여 학습하는 원격훈련<br><br>
			한 달에 한 권씩 책을 읽고 전문가로부터 첨삭지도를 받아
			실시하는 자기주도적 학습으로서 교육수료 후<br>
			교육 시간 3시간을 인정받음으로써 상시학습
			체계에 안성맞춤형 교육훈련<br><br></p>
	</div>
	<img src = "/tomcatImg/online-education-g2e804f577_640.jpg" class = "edu">
	<div class = "processMap">
	<h2> < 학습과정 ></h2>
	<img src = "/tomcatImg/process.png" class = "pMap">
	</div>
	</div>
	<%@ include file = "../Menu/footer.jsp" %>
</body>
</html>