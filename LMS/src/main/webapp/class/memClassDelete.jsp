<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="../config/dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강삭제하기</title>
</head>
<body>	
	<%
		String cl_no = request.getParameter("cl_no");
	
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try{
			String sql = "select m_no, b_no from class where cl_no =?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cl_no);
			rs = pstmt.executeQuery();
			if(rs.next()){
				int m_no = rs.getInt("m_no");
				int b_no = rs.getInt("b_no");
				sql = "delete from class where cl_no =?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, cl_no);
				pstmt.executeUpdate();
				sql = "update member set m_countY = m_countY-1, m_countM = m_countM -1 where m_no =?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, m_no);
				pstmt.executeUpdate();
				sql = "delete from report where m_no =? and b_no =?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, m_no);
				pstmt.setInt(2,b_no);
				pstmt.executeUpdate();
			}}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
	
	%>
	<script>
		alert("선택하신과정이 삭제 되었습니다");
		location.href = "memClassConfirm.jsp";
	</script>
</body>
</html>