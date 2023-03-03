<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="../config/dbconn.jsp" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 삭제</title>
</head>
<body>
<%
		request.setCharacterEncoding("UTF-8");

		String n_no = request.getParameter("n_no");
		
		PreparedStatement pstmt = null;
		
		try{
			String sql = "delete from notice where n_no =?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, n_no);
			pstmt.executeUpdate();
%>
		<script>
			alert("삭제되었습니다.");
			location.href = "memListNotice.jsp";
		</script>
<%
		}catch(Exception e){
			e.printStackTrace();
			
		}finally{
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
		
 %>
</body>
</html>