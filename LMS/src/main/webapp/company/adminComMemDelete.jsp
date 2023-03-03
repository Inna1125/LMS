<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../config/dbconn.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>소속회원삭제</title>
</head>
<body>
	<%
		String c_code = request.getParameter("c_code");
	
		PreparedStatement pstmt =null;
		
		try{
			String sql = "delete from member where c_code =?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, c_code);
			pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(pstmt != null) pstmt.close();
			if(conn != null) pstmt.close();
		}
	%>
	<script>
		alert("소속회원이 모두 삭제 되었습니다.");
		history.back();
	</script>
</body>
</html>