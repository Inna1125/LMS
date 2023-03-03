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
			
			String a_repNo = request.getParameter("a_repNo");
			String a_repContent = request.getParameter("a_repContent");
			String a_category = request.getParameter("a_category");
			String a_title = request.getParameter("a_title");
			String a_date = request.getParameter("a_date");
			String step = request.getParameter("a_step");
			int a_step = Integer.valueOf(step);
			
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			try{
				String sql = "insert into ask(a_category, a_title, a_date, a_repNo, a_repContent, a_step) values (?,?,sysdate(),?,?,?)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,a_category);
				pstmt.setString(2,a_title);
				pstmt.setString(3,a_repNo);
				pstmt.setString(4,a_repContent);
				pstmt.setInt(5,a_step+1);
				pstmt.executeUpdate();
	%>
				<script>
					alert("추가질문이 등록되었습니다. 답변은 평균 1~2일이 소요됩니다.");
					window.location.href = "askDetail.jsp?a_no=<%=a_repNo%>";
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