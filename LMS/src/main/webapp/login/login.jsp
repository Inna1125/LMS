<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인창</title>
<link rel = "stylesheet" href = "../css/login.css"/>
<script>
	function goBack(){
		var res = confirm("이 창을 벗어나면 로그인을 하실 수 없습니다. 메인페이지로 넘어가시겠습니까?")
		if(res){
			location.href = "../home/index.jsp";
		}
	}
	function pass(){
		if(!login.m_id.value){
			alert("아이디를 입력하세요");
			return false;
		}
		if(!login.m_passwd.value){
			alert("비밀번호를 입력하세요");
			return false;
		}
		login.submit();
	}

</script>
</head>
<body>
	<%@include file = "../Menu/header.jsp" %>
	<div class = "login">
	<form method = "post" name = "login" action = "login_ok.jsp">
		<fieldset class = "frmlogin">
		<legend>LOGIN</legend>
		<p>ID : <input type = "text" name = "m_id" class = "inputbox" placeholder = "아이디를 입력하세요">
		<p>PASSWORD : <input type = "password" name = "m_passwd" class = "inputbox" placeholder = "비밀번호를 입력하세요">
		<p><input type = "button" value = "LOGIN" onclick = "pass()" class = "loginbut"> <input type = "button" value = "CANCEL" onclick = "goBack()" class = "loginbut">
	</fieldset>
		
	</form>
	</div>
	<%@include file = "../Menu/footer.jsp" %>
</body>
</html>