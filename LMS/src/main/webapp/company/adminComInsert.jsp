<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
function comcheck(){
	var comPop = window.open("comCodeSearch.jsp", "pop6", "width=600, height=600, top=0, left=0 resizable=yes");
}
function comCallBack(c_code){
	document.comfrm.c_code.value = c_code;
}
function check(){
	
	if(!comfrm.c_code.value){
		alert("회사코드을 입력하세요");
		comfrm.c_code.focus();
		return false;
	}	
	if(!comfrm.c_name.value){
		alert("회사명을 입력해주세요");
		comfrm.c_name.focus();
		return false;
	}
	if(!comfrm.c_countY.value||!comfrm.c_countM.value){
		alert("수강횟수를 입력하세요");
		return false;
	}
	if(!comfrm.c_limit.value){
		alert("수강제한여부를 입력하세요");
		return false;
	}
		document.comfrm.submit();
}
</script>
<title>기업정보입력</title>
<link rel = "stylesheet" href = "../css/company.css">
</head>
<body>
	<div class = "detail">
		<form method="post" name="comfrm" action="adminComInsert_ok.jsp">
		<fieldset>
			<p style = "color:#1F1F1F;">모든정보를 정확하게 입력해주셔야합니다.
			<p style = "color:#1F1F1F;">기업정보입력
			<table class = "comInfo">
				<tr>
					<th class = "label">회사코드</th>
					<td><input type="text" name="c_code" readonly class = "inText"></td>
					<td><input type="button" value="중복확인" onclick="comcheck()" class  ="check"></td>
				</tr>
				<tr>
					<th class = "label">회사명</th>
					<td><input type="text" name="c_name" class = "inText"></td>
					<td></td>
				</tr>
				<tr>
					<th class = "label">회사구분</th>
					<td colspan = "2">공기업 <input type = "radio" name = "c_type" value = "공기업">
									일반기업 <input type = "radio" name = "c_type" value = "일반기업">
					</td>
				</tr>
				<tr>
					<th class = "label">수강횟수(연/월)</th>
					<td colspan = "2">
						<select name = "c_countY">
							<option>연도별 수강횟수</option>
							<%for(int i =1 ;i<13; i++){ %>
							<option value = "<%=i%>"><%=i%>회</option>
							<%} %>
						</select>
						<select name = "c_countM">
							<option>월별 수강횟수</option>
							<%for(int i =1 ;i<13; i++){ %>
							<option value = "<%=i%>" ><%=i%>회</option>
							<%} %>
						</select>
					</td>
				</tr>
				<tr>
					<th class = "label">수강제한</th>
					<td><input type = "radio" name = "c_limit" value = "y"> 사용
						<input type = "radio" name = "c_limit" value = "n"> 미사용</td>
					<td><select name = "c_limscore">
						<option value = "60">60점</option>
						<option value = "70">70점</option>
					</select></td>
				</tr>
			</table>
			<input type="button" value="등록" onclick="check()" class = "but"> 
			</fieldset>
		</form>
	</div>
	
</body>
</html>