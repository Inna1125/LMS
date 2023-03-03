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
	<%@include file = "../Menu/memHeader.jsp" %>
	<div class = "askfrm">
	<form method = "post" name = "askfrm" action = "memAskWrite_ok.jsp" >
		<fieldset class = "writefield">
			<legend>학습질문 및 신규과정(도서)신청 서비스</legend>
				<table class = "writefrm">
				<%
					request.setCharacterEncoding("UTF-8");	
				
					m_id = (String)session.getAttribute("m_id");
				
					pstmt = null;
					rs = null;
					
					try{
						String sql = "select m.m_name, m.m_phone, c.c_name from member m join company c on m.c_code = c.c_code where m_id =?";
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1,m_id);
						rs = pstmt.executeQuery();
						if(rs.next()){
							String m_phone = rs.getString("m_phone");
							String m_name = rs.getString("m_name");
							String c_name = rs.getString("c_name");
						
				%>
				<tr>
					<th class = "label">핸드폰번호</th>
					<td><input type = "text" name = "m_phone" class = "inText" value = "<%=m_phone%>"></td>
				</tr>
				<tr>
					<th class = "label">문의사항분류</th>
					<td> <select name = "a_category" class = "inText">
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
					<th class = "label">제목</th>
					<td><input type = "text" name = "a_title" class = "inText"></td>
				</tr>
				<tr>
					<th class = "label">내용</th>
					<td><textarea cols = "55" rows = "10" class = "texta" placeholder="내용을 입력하세요" name = "a_content"></textarea></td>
				</tr>
				<tr>
					<th class = "label"> 비밀번호</th>
					<td><input type = "text" name = "a_passwd" id="a_passwd" class = "inText"></td>
				</tr>
				<tr>
					<td></td>
					<td class = "text" style = "padding-bottom:30px;">질문글 조회,삭제시 사용되니 필수입력해주세요. 숫자로만 적어주세요.</td>
				</tr>
				</table>
			<div class = "butArea">
				<input type = "button" value = "등록하기" class = "but" onclick = "send()" > 
				<input type = "button" value = "취소하기" class = "but" onclick="cancel()">
				<input type = "button" value = "홈으로" class = "but" onclick = "location.href='../home/memIndex.jsp'">
			</div>
			<input type = "hidden" value = "<%=m_name %>" name = "m_name">
			<input type = "hidden" value = "<%=c_name %>" name = "c_name">
		</fieldset>
	</form>
	<%}
		}catch(Exception e){
			e.printStackTrace();	
		}finally{
			if(rs != null)rs.close();
			if(pstmt!=null)pstmt.close();
			if(conn !=null)conn.close();
		}
	%>
	</div>
	<%@include file = "../Menu/footer.jsp" %>
</body>
</html>