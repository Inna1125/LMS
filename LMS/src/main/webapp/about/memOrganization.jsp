<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>체계도</title>
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
	<div class = "orga">
		<div class = "desc">
		<h2> < 체계도 ></h2>
		<p>책을 통한 상시학습은 조직차원과 개인차원의<br>
		체계적인 경력개발을 실현시켜준다.<br><br>
		책을 통한 상시학습은 조직구성원들에게 요구되어지는<br>
		주.소.창(주도력, 소통력, 창의력) 이 3가지 역량을 쌓아준다.<br><br>
		책을 통한 상시학습은 궁극적인 목적인<br>
		고객에게 지식과 기쁨을 선사한다.</p>
		</div>
		<img src = "/tomcatImg/update-gbd22f0541_640.png" class = "upgrade">
		<img src = "/tomcatImg/organization.png" class = "map">
	</div>
	<%@ include file = "../Menu/footer.jsp" %>
</body>
</html>