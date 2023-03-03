<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 수정</title>
<link rel="stylesheet" href="../css/notice.css" /> 
<script>
			function editadmit(){
				
				if(!editfrm.n_title.value){
					alert("제목을 입력해주세요");
					editfrm.n_title.focus();
					return false;
				}
				
				if(!editfrm.n_content.value){
					alert("내용을 입력해주세요");
					editfrm.n_content.focus();
					return false;
				}
				
				editfrm.submit();
			}
		</script>
</head>
<body>
	<%@include file = "../Menu/adminHeader.jsp" %>
	<div class="context">
		<%
			request.setCharacterEncoding("UTF-8");
		
			String n_no = request.getParameter("n_no");
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try{
				String sql = "select n_title, n_content from notice where n_no = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, n_no);
				rs = pstmt.executeQuery();
				if(rs.next()){
					String n_title = rs.getString("n_title");
					String n_content = rs.getString("n_content");
		%>			
					<form method = "get" name = "editfrm" action = "adminEditNotice_ok.jsp">
					<p>제목 : <input type = "text" name = "n_title" value = "<%=n_title%>">
					<input type = "hidden" name = "n_no" value = "<%=n_no %>">
					<p>내용 : <textarea cols = "25" rows = "10" name = "n_content"><%=n_content%></textarea></p>
					<input type = "button" value = "수정하기" class = "bigbut" onclick = "editadmit()">
					<input type = "button" value = "삭제하기" class = "bigbut" onclick = "location.href = 'adminDeleteNotice.jsp?n_no=<%=n_no%>'">
					</form>
					
		<%
			}
				}catch(Exception e){
					e.printStackTrace();
				}finally{
					if(rs!=null)rs.close();
					if(pstmt!=null)pstmt.close();
					if(conn!=null)conn.close();
					}
		%>
	</div>
	<%@include file = "../Menu/footer.jsp" %>
</body>
</html>