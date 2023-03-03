<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../config/dbconn.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리포트등록</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");	

	String r_content = request.getParameter("r_content");
	String m_id = (String)session.getAttribute("m_id");

	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try{
		String sql = "select m.m_no, cl.b_no from member m join class cl on m.m_no = cl.m_no where m.m_id =? and cl.cl_done ='n'";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, m_id);
		rs = pstmt.executeQuery();
		if(rs.next()){
			int m_no = rs.getInt("m_no");
			int b_no = rs.getInt("b_no");
			sql = "select r_content from report where m_no =? and b_no =?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, m_no);
			pstmt.setInt(2, b_no);
			rs = pstmt.executeQuery();
			if(rs.next()){
				sql = "update report set r_date =sysdate(), r_content = ?, r_ip = ?, r_done = 'y' where m_no =? and b_no =?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, r_content);
				pstmt.setString(2, request.getRemoteAddr());
				pstmt.setInt(3, m_no);
				pstmt.setInt(4, b_no);
				pstmt.executeUpdate();
				sql = "update class set cl_done = 'y' where m_no =? and b_no =?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1,m_no);
				pstmt.setInt(2,b_no);
				pstmt.executeUpdate();
						
%>				
				<script>
					alert("리포트 제출이 완료되었습니다.")
					location.href = "memReportList.jsp";
				</script>
<%			}
		}
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(rs!=null)rs.close();
		if(pstmt != null)pstmt.close();
		if(conn !=null)conn.close();	
	}
%>

</body>
</html>