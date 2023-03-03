<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "../config/dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<%
		request.setCharacterEncoding("UTF-8");	
		
		String c_code = request.getParameter("c_code");
		String c_name = request.getParameter("c_name");
		String c_countY = request.getParameter("c_countY");
		String c_countM = request.getParameter("c_countM");
		String c_type = request.getParameter("c_type");
		String c_limit = request.getParameter("c_limit");
		String c_limscore = request.getParameter("c_limscore");
		
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			String sql = "update company set c_name =?, c_countY =?, c_countM =?, c_type =?, c_limit =?, c_limscore =? where c_code =?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, c_name);
			pstmt.setString(2, c_countY);
			pstmt.setString(3, c_countM);
			pstmt.setString(4, c_type);
			pstmt.setString(5, c_limit);
			pstmt.setString(6, c_limscore);
			pstmt.setString(7, c_code);

			pstmt.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
		%>
		<script>
			window.close();
			opener.location.reload();
		</script>


</body>
</html>