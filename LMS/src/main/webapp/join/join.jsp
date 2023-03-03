<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 창</title>
<script src = "joinJS.js"></script>
<link rel = "stylesheet" href = "../css/join.css">
</head>
<body>
<%@ include file = "../Menu/header.jsp" %>
	<div class = "context">
		<div class = "step">
			<h2>회원가입</h2>
			<hr>
			<ul>
				<li style = "color :#FFFDEE;">약관 및 정책 동의&nbsp;>&nbsp;</li>
				<li style = "color : #B9DFEA;">회원정보입력</li>
				<li style = "color :#FFFDEE;">&nbsp;>&nbsp;가입완료</li>
			</ul>
		<hr>
	</div>
	<div>
		<form method="post" name="memfrm" action="join_ok.jsp">
			<p class = "text">모든정보를 정확하게 입력해주셔야합니다.
			<fieldset class ="joinfrm">
				<legend>회원정보입력</legend>
			<table>
				<tr>
					<th>회원ID</th>
					<td><input type="text" name="m_id" readonly class = "inText"></td>
					<td><input type="button" value="중복확인" onclick="idcheck()" class = "check"></td>
					<td>ID는
						영문/숫자를 이용해 15자 이내로 입력해 주세요.</td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" name="m_name" class = "inText"></td>
					<td colspan = "2"></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="m_passwd" class = "inText"></td>
					<td colspan = "2">비밀번호는 영문/숫자를 혼합해 4~15자 이내로 입력해 주세요.</td>
				</tr>
				<tr>
					<th>비밀번호확인</th>
					<td><input type="password" name="m_passwd1" class = "inText"></td>
					<td colspan = "2"></td>
				</tr>
				<tr>
					<th>직장주소</th>
					<td><input type="text" name="m_zipNo" readonly class = "inText"></td>
					<td><input type="button" value="우편번호" onclick="goPopup()" class = "check"></td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td colspan="3"><input type="text" name="m_addr" readonly class = "addr"></td>
				</tr>
				<tr>
					<td></td>
					<td colspan="3"><input type="text" name="m_addrDetail" class = "addr" readonly></td>
				</tr>
				<tr>
					<th>직장전화번호</th>
					<td colspan="3"><select name="m_tel1" class = "inText">
							<option selected>선택</option>
							<option value="02">02</option>
							<option value="031">031</option>
							<option value="032">032</option>
							<option value="033">033</option>
							<option value="041">041</option>
							<option value="042">042</option>
							<option value="043">043</option>
							<option value="051">051</option>
							<option value="052">052</option>
							<option value="053">053</option>
							<option value="054">054</option>
							<option value="055">055</option>
							<option value="061">061</option>
							<option value="062">062</option>
							<option value="063">063</option>
							<option value="064">064</option>
					</select> -<input type="text" name="m_tel2" maxlength="4" class = "inText"> - 
					<input type="text" name="m_tel3" maxlength="4" class = "inText"></td>
				</tr>
				<tr>
					<th>휴대전화번호</th>
					<td colspan="3"><select name="m_phone1" class = "inText" >
							<option selected>선택</option>
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="018">018</option>
							<option value="019">019</option>
					</select> -<input type="text" name="m_phone2" class = "inText"> - 
					<input type="text" name="m_phone3" class = "inText"></td>
				</tr>
				<tr>
					<th>E-mail</th>
					<td colspan="3"><input type="text" name="m_email1" class = "inText"> @<select
						name="m_email2" class = "inText">
							<option selected>선택</option>
							<option value="naver.com">naver.com</option>
							<option value="daum.net">daum.net</option>
							<option value="korea.com">korea.com</option>
							<option value="hanmail.net">hanmail.net</option>
							<option value="korea.kr">korea.kr</option>
							<option value="gmail.com">gmail.com</option>
							<option value="chol.com">chol.com</option>
							<option value="dreamwiz.com">dreamwiz.com</option>
							<option value="empal.com">empal.com</option>
							<option value="yahoo.com">yahoo.com</option>
							<option value="paran.com">paran.com</option>
					</select></td>
				</tr>
				<tr>
					<th>E-mail 수신여부</th>
					<td><input type="radio" name="m_sendOk" value="Y"
						checked> 수신 <input type="radio" name="m_sendOk" value="N">
						수신거부</td>
					<td colspan = "2"></td>
				</tr>
				<tr>
					<th>부서</th>
					<td><input type="text" name="m_dept" class = "inText"></td>
					<td colspan="2"></td>
				</tr>
				<tr>
					<th>직급</th>
					<td><input type="text" name="m_position" class = "inText"></td>
					<td>ex)행정7급</td>
					<td></td>
				</tr>
				<tr>
					<th>직장정보</th>
					<td><input type="text" name="c_code" readonly class = "inText"></td>
					<td><input type="button" value="찾기" onclick="findCom()" class = "check"></td>
					<td></td>
				</tr>
			</table>
			</fieldset>
			<input type="button" value="회원가입" onclick="check()" class = "but"> 
			<input type="button" value="가입취소" onclick = "goBack()" class = "but">
		</form>
	</div>
	</div>
<%@ include file = "../Menu/footer.jsp" %>
</body>
</html>