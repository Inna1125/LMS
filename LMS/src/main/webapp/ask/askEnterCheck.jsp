<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의글보기</title>

</head>
<body>

	<%@include file = "../config/dbconn.jsp"%>	
	<%
		String a_no = request.getParameter("a_no");
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			String sql = "select a_passwd from ask where a_no =?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,a_no);
			rs = pstmt.executeQuery();
			if(rs.next()){
				String a_passwd = rs.getString("a_passwd");	
	%>
	<input type = "hidden" name = "a_passwd" id = "a_passwd" value ="<%=a_passwd%>">
	<script>
		var passwd = prompt("조회를 위한 비밀번호를 입력해주세요");
		var a_passwd = document.getElementById("a_passwd").value;
		if(passwd!=a_passwd){
			alert("비밀번호를 다시 입력해주세요");
			window.location.reload();
		}else{
			location.href = "askDetail.jsp?a_no=<%=a_no%>";
		}
	</script>
	<%}}catch(Exception e){e.printStackTrace();}finally{
		if(rs != null) rs.close();
		if(pstmt != null)pstmt.close();
		if(conn !=null) conn.close();
	} %>
	
	
</body>
</html>