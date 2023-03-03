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

	String c_code = request.getParameter("c_code");
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try{
		String sql = "select c_code from company where c_code =?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,c_code);
		rs = pstmt.executeQuery();
		if(rs.next()){
			String Rc_code = rs.getString("c_code");
			if(Rc_code.equals(c_code)){
%>					
			<script>
			alert("사용할 수 없는 회사코드 입니다.");
			history.back();  //window.close()랑 같음
			</script>
<%			
			}	
		}else{
%>
	<script>
		alert("사용할 수 있는 회사코드 입니다.");
		location.href = "comCodeSearch.jsp?c_code=<%=c_code%>";  //window.close()랑 같음
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