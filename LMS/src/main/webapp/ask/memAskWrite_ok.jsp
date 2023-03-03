<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../config/dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질문</title>
</head>
<body>
	<%	
		request.setCharacterEncoding("UTF-8");
		String m_id = (String)session.getAttribute("m_id");
	
		String m_name = request.getParameter("m_name");
		String c_name = request.getParameter("c_name");
		String a_title = request.getParameter("a_title");
		String a_content = request.getParameter("a_content");
		String a_passwd = request.getParameter("a_passwd");
		String a_category = request.getParameter("a_category");
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			String sql = "select m_no from member where m_id =?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,m_id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				int m_no = rs.getInt("m_no");
				sql = "insert into ask(a_category, a_title, a_content, a_passwd, a_date, ad_id, m_no, a_reply) values (?,?,?,?,sysdate(),null,?,?)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, a_category);
				pstmt.setString(2, a_title);
				pstmt.setString(3, a_content);
				pstmt.setString(4, a_passwd);
				pstmt.setInt(5, m_no);
				pstmt.setString(6, null);
				pstmt.executeUpdate();
			
%>
<input type ="hidden" value = "<%=m_no %>">
			<script>
 				alert("질문이 등록되었습니다. 평균 1,2일내로 답변이 완료 됩니다.");
 				location.href = "../home/memIndex.jsp";
 			</script> 
<%		}}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(rs != null) rs.close();
			if(pstmt != null)pstmt.close();
			if(conn !=null) conn.close();
		}
	%>
	
</body>
</html>