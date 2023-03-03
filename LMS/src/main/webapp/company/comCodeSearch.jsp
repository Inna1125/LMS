<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%
	String c_code = request.getParameter("c_code");
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
	function comCheck(){
		
		var regCode = /^[a-zA-Z]*$/
			
		if(!comfrm.c_code.value){
			alert("회사코드을 입력하세요");
			comfrm.c_code.focus();
			return false;
		}	
		document.comfrm.submit();
	}
</script>
<title>아이디 중복조회</title>
<link rel = "stylesheet" href = "../css/company.css">
</head>
<body>
<div class = "detail">
<%
		if(c_code == null){
%>	
	<form name = "comfrm" method = "post" action = "comCodesearch_ok.jsp" class = "comfrm">
		<p>* 등록하고자하는 회사 코드를 영어로만 입력하세요</p> 
		<p><input type = "text" name = "c_code"></p>
		<input type = "button" value = "회사코드 중복조회" onclick = "comCheck()" class = "but" style = "margin-left:120px;">
	</form>
</div>
<%
		} else{
%>
	<script>
		opener.comfrm.c_code.value = "<%=c_code%>";
		window.close();
	</script>

<%			
		}
%>

</body>
</html>