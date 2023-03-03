<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
function idcheck(){
	var idPop = window.open("idSearch.jsp", "pop4", "width=600, height=600, top=0, left=0 resizable=yes");
}

function idCallBack(m_id){
	document.memfrm.m_id.value = m_id;
}

function goPopup() {
	// 주소검색을 수행할 팝업 페이지를 호출합니다.
	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://business.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
	var pop = window.open("jusoPopup.jsp", "pop5",
			"width=570,height=420, scrollbars=yes, resizable=yes");

	// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://business.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
	//var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
}

function jusoCallBack(m_addr, m_addrDetail, m_zipNo) {
	// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.

	document.memfrm.m_addr.value = m_addr;
	document.memfrm.m_addrDetail.value = m_addrDetail;
	document.memfrm.m_zipNo.value = m_zipNo;
}
function findCom(){
	var pop = window.open("findCom.jsp", "pop6","width=600, height=500,top=0,left=0,resizable=yes");	
	
}
function comCallBack(c_code){
	
	document.memfrm.c_code.value = c_code;
}

function check(){

	var regName = /^[가-힣]*$/
	var regTel = /^[0-9]*$/
	var regEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*$/
	var regDept = /^[0-9가-힣]*$/
	var regPosition = /^[0-9가-힣]*$/
	
	if(!memfrm.m_id.value){
		alert("아이디를 입력하세요");
		memfrm.m_id.focus();
		return false;
	}
	if(!memfrm.m_name.value){
		alert("이름을 입력하세요");
		memfrm.m_name.focus();
		return false;
	}	
	if(!regName.test(memfrm.m_name.value)){
		alert("이름은 한글로만 입력해주세요.")
		memfrm.m_name.value = "";
		memfrm.m_name.focus();
		return false;
	}
	if(!memfrm.m_passwd.value){
		alert("비밀번호를 입력하세요");
		memfrm.m_passwd.focus();
		return false;
	}
	if(memfrm.m_passwd.value.length < 4 || memfrm.m_passwd.value.length>15){
		alert("비밀번호를 4자이상 15자 이하로 설정하세요")
		memfrm.m_passwd.value = "";
		memfrm.m_passwd.focus();
		return false;
	}
	if(memfrm.m_passwd.value != memfrm.m_passwd1.value){
		alert("비밀번호와 비밀번호 확인이 다릅니다. 확인해주세요.")
		memfrm.m_passwd1.value = "";
		memfrm.m_passwd1.focus();
		return false;
	}
	if(!memfrm.m_zipNo.value){
		alert("직장주소를 입력해주세요");
		memfrm.zipNo.focus();
		return false;
	}
	if(!memfrm.m_tel2.value||!memfrm.m_tel3.value){
		alert("직장전화번호를 입력하세요");
		return false;
	}
	if(!regTel.test(memfrm.m_tel2.value)){
		alert("직장전화번호는 숫자로만 입력해주세요.")
		memfrm.tel2.focus();
		return false;
		}
	if(!regTel.test(memfrm.m_tel3.value)){
		alert("직장전화번호는 숫자로만 입력해주세요.")
		memfrm.tel3.focus();
		return false;
	}
	if(!memfrm.m_phone2.value||!memfrm.m_phone3.value){
		alert("휴대전화번호를 입력하세요");
		memfrm.m_phone2.focus();
		return false;
	}
	if(!regTel.test(memfrm.m_phone2.value)){
		alert("휴대전화번호는 숫자로만 입력해주세요.")
		memfrm.m_phone2.focus();
		return false;
		}
	if(!regTel.test(memfrm.m_phone3.value)){
		alert("휴대전화번호는 숫자로만 입력해주세요.")
		memfrm.m_phone3.focus();
		return false;
	}
	if(!memfrm.m_email1.value){
		alert("E-mail을 입력하세요");
		memfrm.m_email1.focus();
		return false;
	}
	if(!regEmail.test(memfrm.m_email1.value)){
		alert("E-mail은 영문자,숫자,기호(-_.)만 입력가능합니다.");
		memfrm.m_email1.focus();
		return false;
	}
	if(!memfrm.m_dept.value){
		alert("부서를 입력하세요");
		memfrm.m_dept.focus();
		return false;
	}
	if(!regDept.test(memfrm.m_dept.value)){
		alert("부서는 한글과 숫자만 입력가능합니다");
		memfrm.m_dept.focus();
		return false;
	}
	if(!memfrm.m_position.value){
		alert("직급을 입력하세요");
		memfrm.m_position.focus();
		return false;
	}
	if(!regPosition.test(memfrm.m_position.value)){
		alert("직급은 한글과 숫자만 입력가능합니다");
		memfrm.m_dept.focus();
		return false;
	}
	if(!memfrm.c_code.value){
		alert("직장정보를 입력하세요");
		memfrm.m_position.focus();
		return false;
	}
		document.memfrm.submit();
}
</script>
<title>(관리자)회원추가</title>
<link rel = "stylesheet" href = "../css/member.css">
</head>
<body>
<div class = "detail">
	<fieldset>
	<legend>회원정보입력</legend>
		<form method="post" name="memfrm" action="adminMemInsert_ok.jsp">
			<p>모든정보를 정확하게 입력해주셔야합니다.
			<table>
				<tr>
					<th>회원ID</th>
					<td><input type="text" name="m_id" class ="inText" readonly></td>
					<td><input type="button" value="중복확인" onclick="idcheck()"class = "dCheck"></td>
					<td width = "350px">ID는 영문/숫자를 이용해 15자 이내로 입력해 주세요.</td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" name="m_name" class ="inText"></td>
					<td colspan = "2"></td>
					
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="m_passwd" class ="inText"></td>
					<td colspan="2">비밀번호는 영문/숫자를 혼합해 4~15자 이내로 입력해 주세요.</td>
				</tr>
				<tr>
					<th>비밀번호확인</th>
					<td><input type="password" name="m_passwd1" class ="inText"></td>
					<td colspan = "2"></td>
				</tr>
				<tr>
					<th>직장주소</th>
					<td><input type="text" name="m_zipNo" class ="inText" readonly></td>
					<td><input type="button" value="우편번호" onclick="goPopup()" class = "dCheck"></td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td colspan="3"><input type="text" name="m_addr" class = "addr" readonly></td>
				</tr>
				<tr>
					<td></td>
					<td colspan="3"><input type="text" name="m_addrDetail" class = "addr"
						readonly></td>
				</tr>
				<tr>
					<th>직장전화번호</th>
					<td colspan="3"><select name="m_tel1" class ="inText">
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
					</select> -<input type="text" name="m_tel2" maxlength="4" class ="inText"> -<input
						type="text" name="m_tel3" maxlength="4" class ="inText"></td>
				</tr>
				<tr>
					<th>휴대전화번호</th>
					<td colspan="3"><select name="m_phone1" class ="inText">
							<option selected>선택</option>
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="018">018</option>
							<option value="019">019</option>
					</select> -<input type="text" name="m_phone2" class ="inText"> -<input type="text"
						name="m_phone3" class ="inText"></td>
				</tr>
				<tr>
					<th>E-mail</th>
					<td colspan="3"><input type="text" name="m_email1" class ="inText"> @<select
						name="m_email2" class ="inText">
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
					<td colspan="2"><input type="radio" name="m_sendOk" value="Y"
						checked> 수신 <input type="radio" name="m_sendOk" value="N">
						수신거부</td>
					<td colspan = "2"></td>
				</tr>
				<tr>
					<th>부서</th>
					<td><input type="text" name="m_dept" class ="inText"></td>
					<td colspan = "2"></td>
				</tr>
				<tr>
					<th>직급</th>
					<td><input type="text" name="m_position" class ="inText"class ="inText"></td>
					<td >ex)행정7급</td>
					<td></td>
				</tr>
				<tr>
					<th>직장정보</th>
					<td><input type="text" name="c_code" class ="inText" readonly></td>
					<td><input type="button" value="찾기" onclick="findCom()" class = "dCheck"></td>
					<td></td>
				</tr>
			</table>
			<input type="button" value="회원가입" onclick="check()" class = "but"> 
			<input type="button" value="가입취소" onclick = "goBack()" class = "but">
		</form>
	</fieldset>
	</div>
</body>
</html>