<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../config/dbconn.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>(관리자)응답</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		
		String ad_id = (String)session.getAttribute("m_id");
		String a_no = request.getParameter("a_no");
		String a_reply = request.getParameter("a_reply");
		String[] a_repReply = request.getParameterValues("a_repReply");
		String[] a_repNo = request.getParameterValues("a_repNo");
		String[] a_step = request.getParameterValues("a_step");
		
		PreparedStatement pstmt = null;
		
		try{
			String sql = "update ask set a_reply = ?, ad_id =? where a_no =?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, a_reply);
			pstmt.setString(2, ad_id);
			pstmt.setString(3, a_no);
			pstmt.executeUpdate();
	
			if(a_repNo !=null){
			for(int i =0;i<a_repNo.length;i++){
				sql = "update ask set a_repReply =?, ad_id =? where a_repNo =? and a_step =?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, a_repReply[i]);
				pstmt.setString(2, ad_id);
				pstmt.setString(3, a_repNo[i]);
				pstmt.setString(4, a_step[i]);
				pstmt.executeUpdate();
			}}
			
		
	%>
	
	<script>
		alert("답변이 완료되었습니다.");
		location.href = "adminAskDetail.jsp?a_no=<%=a_no%>";
 	</script>
<%
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(pstmt != null)pstmt.close();
			if(conn !=null) conn.close();
		}

%>
</body>
</html>