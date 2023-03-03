<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../config/dbconn.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("m_id");
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try{
		String sql = "select m_id from member where m_id =? union select ad_id from admin where ad_id =?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,id);
		pstmt.setString(2,id);
		rs = pstmt.executeQuery();
		if(rs.next()){
			String m_id = rs.getString("m_id");
			if(m_id.equals(id)){
%>					
			<script>
			alert("사용할 수 없는 아이디 입니다.");
			history.back();  //window.close()랑 같음
			</script>
<%			
			}	
		}else{
%>
	<script>
		alert("사용할 수 있는 아이디 입니다.");
		location.href = "idSearch.jsp?id=<%=id%>";  //window.close()랑 같음
	</script>
<%
		}

	}catch(SQLException e){
		e.printStackTrace();
	}finally{
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(conn != null) conn.close();
	}
%>
</body>
</html>