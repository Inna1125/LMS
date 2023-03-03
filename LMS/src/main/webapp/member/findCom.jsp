<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../config/dbconn.jsp" %> 
<%
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String c_code = request.getParameter("c_code");
	String c_name = request.getParameter("c_name");
%>
<!DOCTYPE html>
<html>
<head>
<script>
			function closewin(){
				opener.memfrm.c_code.value = "<%=c_code%>";
				window.close();
			}
	</script>
<meta charset="UTF-8">
<title>Insert title here</title>
	
</head>
<body onload = "init()">
<%
		if(c_code == null){
%>
	<form name = "findCom" method = "post" action = "findCom_ok.jsp" >
<%
			try{
				String sql = "select c_code, c_name from company";			
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()){
					c_code = rs.getString("c_code");
					c_name = rs.getString("c_name");
					
					%>

		<p>근무하고있는 직장을 고르세요.

		<p><input type = "radio" name = "c_code" value = "<%=c_code%>"> <%=c_name%>
<%
}
			}catch(Exception e){
					e.printStackTrace();
				}finally{
					if(rs != null) rs.close();
					if(pstmt != null) pstmt.close();
					if(conn != null) conn.close();
				}
%>
		<p><input type = "submit" value = "확인">
<%
		}else{
%>			
		<input type = "button" value = "닫기" onclick = "closewin()">
<% 
} 
%>
	</form>
</body>
</html>