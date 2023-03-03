<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="../config/dbconn.jsp" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 삭제</title>
</head>
<body>
	<% String n_no = request.getParameter("n_no"); %>
		<script>
			var conf = confirm("삭제된 게시물은 복구 되지 않습니다. 삭제하시겠습니까?");
			if(conf){
				location.href = "adminDeleteNotice_ok.jsp?n_no=<%=n_no%>";
			}else{
				history.back();
			}
		</script>
		
</body>
</html>