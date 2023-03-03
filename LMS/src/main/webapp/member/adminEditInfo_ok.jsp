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
			
			String m_no = request.getParameter("m_no");
			String m_id = request.getParameter("m_id");
			String m_name = request.getParameter("m_name");
			String m_passwd = request.getParameter("m_passwd");
			String m_zipNo = request.getParameter("m_zipNo");
			String m_addr = request.getParameter("m_addr");
			String m_addrDetail = request.getParameter("m_addrDetail");
			String m_tel = request.getParameter("m_tel1") + "-" + request.getParameter("m_tel2") + "-" + request.getParameter("m_tel3");
			String m_phone = request.getParameter("m_phone1") + "-" + request.getParameter("m_phone2") + "-" + request.getParameter("m_phone3");
			String m_email = request.getParameter("m_email1") + "@" + request.getParameter("m_email2");
			String m_sendOk = request.getParameter("m_sendOk");
			String m_dept  = request.getParameter("m_dept");
			String m_position = request.getParameter("m_position");
			String m_pass = request.getParameter("m_pass");
			String m_count = request.getParameter("m_count");
			String c_code = request.getParameter("c_code");

			
			
			PreparedStatement pstmt = null;
			
			try{
				String sql = "update member set m_id =?, m_name =?, m_passwd =?, m_zipNo =?, m_addr =?, m_addrDetail =?, m_tel =?, m_phone =?, m_email =?, m_sendOk =?, m_dept =?, m_position =?, m_count =?, m_pass =?, c_code =? where m_no =?";
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1,m_id);
				pstmt.setString(2,m_name);
				pstmt.setString(3,m_passwd);
				pstmt.setString(4,m_zipNo);
				pstmt.setString(5,m_addr);
				pstmt.setString(6,m_addrDetail);
				pstmt.setString(7,m_tel);
				pstmt.setString(8,m_phone);
				pstmt.setString(9,m_email);
				pstmt.setString(10,m_sendOk);
				pstmt.setString(11,m_dept);
				pstmt.setString(12,m_position);
				pstmt.setString(13,m_count);
				pstmt.setString(14,m_pass);
				pstmt.setString(15,c_code);
				pstmt.setString(16,m_no);
				pstmt.executeUpdate();
				
%>
				<script>
					alert("회원정보수정이 완료되었습니다");
					history.back();
				</script>
<%
				
			}catch(SQLException e){
				e.printStackTrace();
			}finally{
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}
			
	%>
</body>
</html>