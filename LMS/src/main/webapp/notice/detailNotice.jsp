<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "../config/dbconn.jsp"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 자세히보기</title>
<link rel="stylesheet" href="../css/notice.css" />
</head>
<body>
<%@include file = "../Menu/header.jsp" %>
	<div class = "detail">
	<form method = "get" name = "noticefrm">
	<%
		request.setCharacterEncoding("UTF-8");
		
		String n_no = request.getParameter("n_no");
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try{
			String sql = "select n_title, n_content from notice where n_no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, n_no);
			rs = pstmt.executeQuery();
			if(rs.next()){
				String n_title = rs.getString("n_title");
				String n_content = rs.getString("n_content");
	%>			<p>제목 : <input type = "text" name = "n_title" value = "<%=n_title%>" readonly>
				<input type = "hidden" name = "n_no" value = <%=n_no %>>
				<p> <textarea cols = "25" rows = "10" name = "n_content" readonly><%=n_content%></textarea></p>
				
				
	<%
				sql = "update notice set n_readNo = n_readNo+1 where n_no ="+n_no;
				pstmt = conn.prepareStatement(sql);
				pstmt.executeUpdate();
		}
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
				}
	%>
	</form>
		<a href = "listNotice.jsp" class = "backList">목록가기</a>
	</div>
	<%@include file = "../Menu/footer.jsp" %>
</body>
</html>