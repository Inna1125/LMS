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
			
			String id = request.getParameter("m_id");
			String name = request.getParameter("m_name");
			String passwd = request.getParameter("m_passwd");
			String zipcode = request.getParameter("m_zipNo");
			String addr = request.getParameter("m_addr");
			String addrdetail = request.getParameter("m_addrDetail");
			String tel = request.getParameter("m_tel1") + "-" + request.getParameter("m_tel2") + "-" + request.getParameter("m_tel3");
			String phone = request.getParameter("m_phone1") + "-" + request.getParameter("m_phone2") + "-" + request.getParameter("m_phone3");
			String email = request.getParameter("m_email1") + "@" + request.getParameter("m_email2");
			String sendOk = request.getParameter("m_sendOk");
			String dept  = request.getParameter("m_dept");
			String position = request.getParameter("m_position");
			int countM = 0;
			int countY = 0;
			int count = 0;
			String pass = "Y";
			String company = request.getParameter("c_code");
						
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			try{
				String sql = "select c_countY, c_countM from company where c_code =?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,company);
				rs = pstmt.executeQuery();
				if(rs.next()){
					countY = rs.getInt("c_countY");
					countM = rs.getInt("c_countM");
					sql = "INSERT INTO member(m_id, m_name, m_passwd, m_zipNo, m_addr, m_addrDetail, m_tel, m_phone, m_email, m_sendOk, m_dept, m_position, m_count, m_countY, m_countM, m_pass, c_code)";
					sql = sql+ " VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1,id);
					pstmt.setString(2,name);
					pstmt.setString(3,passwd);
					pstmt.setString(4,zipcode);
					pstmt.setString(5,addr);
					pstmt.setString(6,addrdetail);
					pstmt.setString(7,tel);
					pstmt.setString(8,phone);
					pstmt.setString(9,email);
					pstmt.setString(10,sendOk);
					pstmt.setString(11,dept);
					pstmt.setString(12,position);
					pstmt.setInt(13,count);
					pstmt.setInt(14,countY);
					pstmt.setInt(15,countM);
					pstmt.setString(16,pass);
					pstmt.setString(17,company);
					
					pstmt.executeUpdate();
					
					session.setAttribute("id", id);
					session.setAttribute("name", name);
					
				}}catch(SQLException e){
				e.printStackTrace();
			}finally{
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}
	%>
		<script>
			window.close();
			opener.location.reload();
		</script>
</body>
</html>