<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질문하기</title>
<link rel = "stylesheet" href = "../css/ask.css">
<script>
		function send(){
			var regPasswd = /^[0-9]*$/
			var a_passwd = document.getElementById("a_passwd").value;
			
			if(!askfrm.a_title.value){
				alert("제목을 입력해주세요");
				askfrm.a_title.focus();
				return false;
			}
			if(!askfrm.a_content.value){
				alert("내용을 입력해주세요");
				askfrm.a_content.focus();
				return false;
			}
			if(!regPasswd.test(a_passwd)){
				alert("비밀번호는 숫자로만 작성해주세요");
				askfrm.a_passwd.focus();
				return false;
			}
			if(!askfrm.a_passwd.value){
				alert("비밀번호를 입력해주세요");
				askfrm.a_passwd.focus();
				return false;
			}	
			
			askfrm.submit();
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
	<%request.setCharacterEncoding("UTF-8");%>
	<%@include file = "../Menu/header.jsp" %>
		<div class = "askfrm">
			<form method = "post" name = "askfrm" action = "askWrite_ok.jsp" >
				<fieldset class = "writefield">
					<legend>학습질문 및 신규과정(도서)신청 서비스</legend>
						<table class = "writefrm">
							<tr>
								<td class = "label">문의사항분류</td>
								<td> 
									<select name = "a_category" class = "inText">
											<option value = "수강신청 관련 문의" selected>수강신청 관련 문의</option>
											<option value = "교재변경 및 교재배송 문의">교재변경 및 교재배송 문의</option>
											<option value = "학습기간 및 일정 문의">학습기간 및 일정 문의</option>
											<option value = "학습장 오류 문의">학습장 오류 문의</option>
											<option value = "수료 관련 문의">수료 관련 문의</option>
											<option value = "리포트 문제 내용 문의">리포트 문제 내용 문의</option>
											<option value = "교재 학습 내용 문의">교재 학습 내용 문의</option>
											<option value = "리포트 평가 문의">리포트 평가 문의</option>
									</select> 
								</td>
							</tr>
							<tr>
								<td class = "label">제목</td>
								<td><input type = "text" name = "a_title" class = "inText" ></td>
							</tr>
							<tr>
								<td class = "label">내용</td>
								<td><textarea cols = "55" rows = "15" placeholder="내용을 입력하세요" name = "a_content" class = "texta"></textarea></td>
							</tr>
							<tr>
								<td class = "label">비밀번호</td>
								<td><input type = "text" name = "a_passwd" id="a_passwd" class = "inText"></td>
							</tr>
							<tr>
								<td></td>
								<td class = "label">비밀번호는 질문글 조회,삭제시 사용되니 숫자로 필수 입력해주세요</td>
							</tr>
						</table>
				</fieldset>
				<div class = "butArea">
					<input type = "button" value = "등록하기" class = "but" onclick = "send()" > 
					<input type = "button" value = "취소하기" class = "but" onclick="cancel()">
					<input type = "button" value = "홈으로" class = "but" onclick = "location.href='../home/index.jsp'">
				</div>
			</form>
		</div>
	<%@include file = "../Menu/footer.jsp" %>
</body>
</html>