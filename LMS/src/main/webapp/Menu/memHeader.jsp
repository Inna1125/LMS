<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file = "../config/dbconn.jsp" %>
<%@ include file = "../member/accessMem.jsp" %>	
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
<%
			String m_id = (String)session.getAttribute("m_id");
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try{
				String sql = "select m_id from member where m_id =? union select ad_id from admin where ad_id =?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, m_id);
				pstmt.setString(2, m_id);
				rs = pstmt.executeQuery();
				if(rs.next()){
					String rId = rs.getString("m_id");
					if(rId.equals("admin")){
%>
						<a href="../home/adminIndex.jsp">
						<h1>LMS</h1>
						</a>
				<%}else{ %>	
					<a href="../home/memIndex.jsp">
							<h1>LMS</h1>
					</a>
				<%		}
					}
				}catch(Exception e){
					e.printStackTrace();
				}finally{
				}
					%>
			</div>
			<nav>
				<ul id="topMenu">
					<li><a href="#">About</a>
						<ul>
							<li><a href="../about/memOrganization.jsp">체계도</a></li>
							<li><a href="../about/memProcess.jsp">학습과정</a></li>
							<li><a href = "../notice/memListNotice.jsp">공지사항</a></li>
							<li><a href="../ask/memAskHome.jsp">고객상담</a></li>
						</ul></li>
					<li><a href="#">Book List</a>
						<ul>
							<li><a href= "../book/memBookList.jsp">전체도서</a></li>
							<li><a href="../book/memCategoryList.jsp">분야별도서목록</a></li>
							<li><a href="../book/memNewList.jsp">신간도서목록</a></li>
							<li><a href="../book/memBestList.jsp">Best도서목록</a></li>
						</ul></li>
					<li><a href="#">Registration</a>
						<ul>
							<li><a href="../class/memClassList.jsp">수강신청 </a></li>
							<li><a href="../class/memClassConfirm.jsp">수강신청확인</a></li>
							<li><a href="../heart/memHeartList.jsp?m_id=<%=m_id %>">찜한목록</a></li>
						</ul></li>
					<li><a href="#">Report</a>
						<ul>
							<li><a href="../report/memReportList.jsp">리포트작성</a></li>
							<li><a href="../report/memReportScoreConfirm.jsp">리포트성적확인</a></li>
							<li><a href="../report/memReportOldList.jsp">지난리포트확인</a></li>
						</ul></li>
				</ul>
			</nav>
				<div id="buttonArea">
					<div id = "sessionMark"><h3><%=m_id%>님이 로그인 중입니다.</h3></div>
					<form method=post name=btn1 action="../login/logout.jsp">
						<input type="submit" value="Logout" id="button1">
					</form>
					<form method=post name=btn1 action="../member/memEditinfo.jsp">
						<input type="submit" value="EditInfo" id="button1">
					</form>
				</div>
		</header>
		</div>
</body>
</html>