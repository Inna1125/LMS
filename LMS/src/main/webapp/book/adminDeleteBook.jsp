<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../config/dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서삭제</title>
</head>
<body>
<%
		request.setCharacterEncoding("UTF-8");

		String[] book = request.getParameterValues("book");
		
		PreparedStatement pstmt = null;
		try{
			if(book != null){
				for(int i=0; i<book.length;i++){
					String a =book[i];
			String sql = "delete from heart where b_no =?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, a);
			pstmt.executeUpdate();
			sql = "delete from book where b_no =?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, a);
			pstmt.executeUpdate();
%>
		<script>
			alert("삭제되었습니다.");
			location.href = "memBookList.jsp";
		</script>
<%
		}}}catch(Exception e){
			e.printStackTrace();
			
		}finally{
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
		
		
 %>
</body>
</html>