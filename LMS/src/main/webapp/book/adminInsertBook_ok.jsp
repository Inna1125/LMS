<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.*"%>
<%@page import="com.oreilly.servlet.*"%>
<%@page import = "java.io.*" %>  
<%@include file = "../config/dbconn.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<%
		MultipartRequest multi = new MultipartRequest(request,"C:/JSP/LMS/src/main/webapp/images", 5*1024*1024, "utf-8", new DefaultFileRenamePolicy());
		
		Enumeration files = multi.getFileNames();
		
		String name = (String)files.nextElement();
		String b_image = multi.getFilesystemName(name);
			
		request.setCharacterEncoding("UTF-8");
		
		String b_name = multi.getParameter("b_name");
		String b_author = multi.getParameter("b_author");
		String b_pub = multi.getParameter("b_pub");
		String b_date = multi.getParameter("b_date");
		String b_price = multi.getParameter("b_price");
		String b_pageNo = multi.getParameter("b_pageNo");
		String b_desc = multi.getParameter("b_desc");
		String b_index = multi.getParameter("b_index");
		String b_comment = multi.getParameter("b_comment");
		String b_categoryF = multi.getParameter("b_categoryF");
		String b_categoryS = multi.getParameter("b_categoryS");
		String b_purpose = multi.getParameter("b_purpose");
				
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			String sql = "insert into book(b_code, b_name, b_author, b_pub, b_date, b_price, b_pageNo, b_desc, b_index, b_comment, b_image, b_count, b_categoryF, b_categoryS, b_regDate, b_purpose)";
			sql = sql+" values ('a',?,?,?,?,?,?,?,?,?,?,0,?,?,sysdate(),?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, b_name);
			pstmt.setString(2, b_author);
			pstmt.setString(3, b_pub);
			pstmt.setString(4, b_date);
			pstmt.setString(5, b_price);
			pstmt.setString(6, b_pageNo);
			pstmt.setString(7, b_desc);
			pstmt.setString(8, b_index);
			pstmt.setString(9, b_comment);
			pstmt.setString(10, b_image);
			pstmt.setString(11, b_categoryF);
			pstmt.setString(12, b_categoryS);
			pstmt.setString(13, b_purpose);

			pstmt.executeUpdate();
			
			try{
				sql = "select b_no, concat(b_categoryF,b_no) as b_code from book where b_name =?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, b_name);
				rs = pstmt.executeQuery();
				if(rs.next()){
					int b_no = rs.getInt("b_no");
					String b_code = rs.getString("b_code");
					sql  = "update book set b_code =? where b_no =?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, b_code);
					pstmt.setInt(2, b_no);
					pstmt.executeUpdate();
				}
				
			}catch(Exception e){e.printStackTrace();}finally{}
		
		}catch(Exception e){
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