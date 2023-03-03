<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../config/dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질문하기</title>
</head>
<body>
	<%	
		request.setCharacterEncoding("UTF-8");

		String a_title = request.getParameter("a_title");
		String a_content = request.getParameter("a_content");
		String a_passwd = request.getParameter("a_passwd");
		String a_category = request.getParameter("a_category");
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			String sql = "insert into ask(a_category, a_title, a_content, a_passwd, a_date, ad_id, m_no, a_reply) values (?,?,?,?,sysdate(),null,null,?)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, a_category);
				pstmt.setString(2, a_title);
				pstmt.setString(3, a_content);
				pstmt.setString(4, a_passwd);
				pstmt.setString(5, null);
				pstmt.executeUpdate();
			
%>
			<script>
 				alert("질문이 등록되었습니다. 평균 1,2일내로 답변이 완료 됩니다.");
 				location.href = "../home/askConfirm.jsp";
 			</script> 
<%		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(rs != null) rs.close();
			if(pstmt != null)pstmt.close();
			if(conn !=null) conn.close();
		}
%>
	
</body>
</html>