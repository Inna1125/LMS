<%@page import="javax.naming.PartialResultException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../config/dbconn.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>점수입력</title>
</head>
<body>
<%
		request.setCharacterEncoding("UTF-8");
		String score = request.getParameter("r_score");
		int r_score = Integer.valueOf(score);
		String r_reply = request.getParameter("r_reply");
		String r_no = request.getParameter("r_no");
		String b_no = request.getParameter("b_no");
	
		PreparedStatement pstmt = null;
		ResultSet rs = null;
	
		try{
			String sql = "update report set r_score =?, r_reply =? where r_no =? and b_no =?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, r_score);
			pstmt.setString(2, r_reply);
			pstmt.setString(3, r_no);
			pstmt.setString(4, b_no);
			pstmt.executeUpdate();
			sql = "select m_no from report where r_no = ? and b_no =?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, r_no);
			pstmt.setString(2, b_no);
			rs = pstmt.executeQuery();
			if(rs.next()){
				String m_no = rs.getString("m_no");
				sql = "update class set cl_done = 'y' where b_no =? and m_no =?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,b_no);
				pstmt.setString(2,m_no);
				pstmt.executeUpdate();
				sql = "select c_limscore from company where c_code = (select c_code from member where m_no =?)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, m_no);
				rs = pstmt.executeQuery();
				if(rs.next()){
					int c_limscore = rs.getInt("c_limscore");
					if(r_score<c_limscore){
						sql = "update member set m_pass ='n' where m_no =?";
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, m_no);
						pstmt.executeUpdate();
					}
				}
			}}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(rs != null) rs.close();
			if(pstmt != null)pstmt.close();
			if(conn !=null)conn.close();
		}
%>
<script>
	alert("채점이 완료 되었습니다.");
	window.close();
	opener.location.href = "adminReportScore.jsp";
	
</script>
</body>
</html>