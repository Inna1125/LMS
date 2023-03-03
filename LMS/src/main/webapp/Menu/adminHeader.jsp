<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file = "../config/dbconn.jsp" %>
<%@ include file = "../admin/accessAdmin.jsp" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
<link rel = "stylesheet" href = "../css/header.css"/>
</head>
<body>
	<% String m_id = (String)session.getAttribute("m_id"); %>
	<div id="container">
		<header>
			<div id="logo">
				<a href="../home/adminIndex.jsp">
					<h1>LMS</h1>
				</a>
			</div>
			<nav>
				<ul id="topMenu">
					<li><a href="#">About</a>
						<ul>
							<li><a href="../about/memOrganization.jsp">체계도</a></li>
							<li><a href="../about/memProcess.jsp">학습과정</a></li>
							<li><a href = "../notice/memListNotice.jsp">공지사항관리</a></li>
							<li><a href="../ask/adminAskConfirm.jsp">고객상담관리</a></li>
						</ul>
					</li>
					<li><a href="#">Book List</a>
						<ul>
							<li><a href= "../book/memBookList.jsp">과정관리</a></li>
							<li><a href="../book/memCategoryList.jsp">분야별도서목록</a></li>
							<li><a href="../book/memNewList.jsp">신간도서목록</a></li>
							<li><a href="../book/memBestList.jsp">Best도서목록</a></li>
						</ul></li>
					<li><a href="#">User</a>
						<ul>
							<li><a href="../company/adminComList.jsp">기업관리</a></li>
							<li><a href="../member/adminMemList.jsp">회원관리</a></li>
						</ul>
					</li>
					<li><a href="#">Report</a>
						<ul>
							<li><a href="../report/adminReportScore.jsp">리포트관리</a></li>
						</ul>
					</li>
				</ul>
			</nav>
				<div id="buttonArea">
					<div id = "sessionMark"><h3><%=m_id%>님이 로그인 중입니다.</h3></div>
					<form method=post name=btn1 action="../login/logout.jsp">
						<input type="submit" value="Logout" id="button1">
					</form>
				</div>
		</header>
		</div>
</body>
</html>