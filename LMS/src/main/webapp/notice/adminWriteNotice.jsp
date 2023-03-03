<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항글쓰기</title>
<link rel="stylesheet" href="../css/notice.css" />
<script>
		function send(){
			if(!noticefrm.n_title.value){
				alert("제목을 입력해주세요");
				notice.n_title.focus();
				return false;
			}
			if(!noticefrm.n_content.value){
				alert("내용을 입력해주세요");
				notice.n_content.focus();
				return false;
			}
			noticefrm.submit();
		}
		function cancel(){
			var resp = confirm("이 페이지를 벗어나면 작성한 내용은 사라집니다. 취소하시겠습니까?");
			
			 if(resp){
				 history.back();
			 }
		}
	</script>
</head>
<body>
	<%@include file = "../Menu/adminHeader.jsp" %>
	<div class="context">
		<h2>글쓰기</h2>
		<hr>
	<form method = "get" name = "noticefrm" action = "adminWriteNotice_ok.jsp" >
		<p>제목 : <input type = "text" name = "n_title">
			<input type = "hidden" name = "ad_id" value="<%=(String)session.getAttribute("m_id")%>">
			<input type = "hidden" name = "n_ip" value = "<%=request.getRemoteAddr()%>">
		<p>내용 : <textarea cols = "25" rows = "10" placeholder="내용을 입력하세요" name = "n_content"></textarea></p>
		<input type = "button" value = "등록하기" class = "bigbut" onclick = "send()" > <input type = "button" value = "취소하기" class = "bigbut" onclick="cancel()">
	</form>
	</div>
	<%@include file = "../Menu/footer.jsp" %>
</body>
</html>