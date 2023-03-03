<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../config/dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기업삭제</title>
</head>
<body>
<%
		request.setCharacterEncoding("UTF-8");

		String[] choice = request.getParameterValues("choice");
		
		PreparedStatement pstmt = null;
		try{
			if(choice != null){
				for(int i=0; i<choice.length;i++){
					String b =choice[i];
					String sql = "delete from company where c_code =?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, b);
					pstmt.executeUpdate();
%>
		<script>
			alert("삭제되었습니다.");
			location.href = "adminComList.jsp";
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