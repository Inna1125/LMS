<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
<link rel = "stylesheet" href = "../css/header.css"/>
</head>
<body>
	<div id="container">
		<header>
			<div id="logo">
				<a href="../home/index.jsp">
					<h1>LMS</h1>
				</a>
			</div>
			<nav>
				<ul id="topMenu">
					<li><a href="#">About</a>
						<ul>
							<li><a href="../about/organization.jsp">체계도</a></li>
							<li><a href="../about/process.jsp">학습과정</a></li>
						</ul>
					</li>
					<li><a href="#">Book List</a>
						<ul>
							<li><a href="../book/listBook.jsp">전체도서</a></li>
							<li><a href="../book/categoryList.jsp">분야별도서목록</a></li>
							<li><a href="../book/newList.jsp">신간도서목록</a></li>
							<li><a href="../book/bestList.jsp">Best도서목록</a></li>
						</ul>
					</li>
					<li><a href="../notice/listNotice.jsp">Notice</a></li>
					<li><a href="../ask/askHome.jsp">Ask</a></li>
					
				</ul>
			</nav>
			<div id="buttonArea">
				<form method=post name=btn1 action="../login/login.jsp">
					<input type="submit" value="Login" id="button1">
				</form>
				<form method=post name=btn1 action="../join/termOfUse.jsp">
					<input type="submit" value="Sign Up" id="button1">
				</form>	
			</div>
		</header>
	</div>
</body>
</html>