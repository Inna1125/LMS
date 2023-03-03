<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../config/dbconn.jsp" %>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login_ok</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		
		String m_id = request.getParameter("m_id");
		String m_passwd = request.getParameter("m_passwd");
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			String sql = "select m_id, m_passwd from member where m_id =? union select ad_id, ad_passwd from admin where ad_id =?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m_id);
			pstmt.setString(2, m_id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				String rId = rs.getString("m_id");
				String rPasswd = rs.getString("m_passwd");
				if(rId.equals(m_id)){
					if(rPasswd.equals(m_passwd)){
						if(rId.equals("admin")){
							session.setAttribute("m_id", m_id);
							response.sendRedirect("../home/adminIndex.jsp");
						}else{
							session.setAttribute("m_id", m_id);
							response.sendRedirect("../home/memIndex.jsp");
						}
					}else{
			%>
				<script>alert("비밀번호를 확인하세요");
						history.back();</script>
			<%
					}
				}else{
					%>
					<script>alert("아이디를 확인하세요");
						history.back();</script>
					<%				}
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