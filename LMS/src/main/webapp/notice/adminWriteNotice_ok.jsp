<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "../config/dbconn.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String n_title = request.getParameter("n_title");
		String n_content = request.getParameter("n_content");
		String n_ip = request.getParameter("n_ip");
		String ad_id = request.getParameter("ad_id");
		
		PreparedStatement pstmt = null;
		
		try{
			String sql = "insert into notice(n_title, n_content,n_readNo, n_date, n_ip, ad_id)";
			sql = sql+" values (?,?,0,sysdate(),?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, n_title);
			pstmt.setString(2, n_content);
			pstmt.setString(3,n_ip);
			pstmt.setString(4,ad_id);
			
			pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
	%>
	<script>
			location.href = "memListNotice.jsp";	
	</script>
</body>
</html>