<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
	function idCheck(){
		
		var regId = /^[a-z|A-Z|0-9]*$/;
		var id = document.memfrm.m_id;
		
		if(!id.value){
			alert("아이디를 입력하세요");
			id.focus();
			return false;
		}
		
		if(memfrm.m_id.value.length>15){
			alert("아이디는 15자 이내로 작성해주세요");
			memfrm.m_id.value=""
			memfrm.m_id.focus();
			return false;
		}
		
		if(!regId.test(id.value)){
			alert("아이디는 영문자, 숫자으로만 만들어주세요")
			memfrm.m_id.value = " ";
			memfrm.m_id.focus();
			return false;
		}
		
		document.memfrm.submit();
	}

	
</script>
<title>아이디 중복조회</title>
<link rel = "stylesheet" href = "../css/join.css">
</head>
<body onload = "memfrm.id.focus()" >
<%
	String m_id = request.getParameter("id");
	
%> 
<div class = "idcheck">
<%
		if(m_id == null){
%>	
	<form name = "memfrm" method = "post" action = "idsearch_ok.jsp" class = "idfrm">
		<p>* 가입하고자 하는 아이디를 입력하세요 
		<p><input type = "text" name = "m_id">
		<input type = "button" value = "아이디 중복조회" onclick = "idCheck()" class = "but">
	</form>

<%
		} else{
%>
	<script>
		opener.memfrm.m_id.value = "<%=m_id%>";
		window.close();
	</script>
<%			
		}
%>
</div>
</body>
</html>