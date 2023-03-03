<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../config/dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>찜하기목록 삭제</title>
</head>
<body>
<%
		request.setCharacterEncoding("UTF-8");

		String h_no = request.getParameter("h_no");
		String m_id = (String)session.getAttribute("m_id");
		String b_no = request.getParameter("choice");
		
		PreparedStatement pstmt = null;
		
		try{
			String sql = "delete from heart where h_no=? and b_no =(select b_no from book where b_no =?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, h_no);
			pstmt.setString(2, b_no);
			pstmt.executeUpdate();
%>
		<script>
			alert("삭제되었습니다.");
			location.href = "memHeartList.jsp?m_id=<%=m_id%>";
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