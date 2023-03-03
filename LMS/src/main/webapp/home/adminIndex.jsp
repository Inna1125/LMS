<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자index</title>
<link rel = "stylesheet" href = "../css/adminIndex.css">
</head>
<body>
	<%@include file = "../Menu/adminHeader.jsp" %>
		<div id = "con">
			<ul>
				<li id = "icon">
					<img src="../images/memberIcon.png" onclick = "location.href ='../member/adminMemList.jsp'">
				</li>
				<li id = "icon">
					<img src="../images/companyIcon.png" onclick = "location.href ='../company/adminComList.jsp'">
				</li>
				<li id = "icon">
					<img src="../images/bookIcon.png" onclick = "location.href ='../book/memBookList.jsp'">
				</li>   
				<li id = "icon">
					<img src="../images/noticeIcon.png" onclick = "location.href ='../notice/memListNotice.jsp'">
				</li>  
				<li id = "icon">
					<img src="../images/askIcon.png" onclick = "location.href ='../ask/adminAskConfirm.jsp'">
				</li>  
				<li id = "icon">
					<img src="../images/reportIcon.png" onclick = "location.href ='../report/adminReportScore.jsp'">
				</li>  
			</ul>
		</div>
	<%@ include file = "../Menu/footer.jsp"%>
</body>
</html>