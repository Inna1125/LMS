<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file= "../config/dbconn.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정/자세히보기</title>
<link rel = "stylesheet" href = "../css/member.css">
<script>
		function idcheck(){
			var idPop = window.open("idSearch.jsp", "pop3", "width=600, height=600, top=0, left=0 resizable=yes");
		}
		
		function idCallBack(m_id){
			document.memfrm.m_id.value = m_id;
		}
		function goPopup() {
			// 주소검색을 수행할 팝업 페이지를 호출합니다.
			// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://business.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
			var pop = window.open("jusoPopup.jsp", "pop2",
					"width=570,height=420, scrollbars=yes, resizable=yes");
		
			// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://business.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
			//var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
		}
		
		function ConjusoCallBack(m_addr, m_addrDetail, m_zipNo) {
			// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
		
			document.memfrm.m_addr.value = m_addr;
			document.memfrm.m_addrDetail.value = m_addrDetail;
			document.memfrm.m_zipNo.value = m_zipNo;
		}
		function findCom(){
			var pop = window.open("findCom.jsp", "pop1","width=600, height=500,top=0,left=0,resizable=yes");	
			
		}
		function comCallBack(c_code){
			
			document.memfrm.c_code.value = c_code;
		}
		function checking(){

			var regName = /^[가-힣]*$/
			var regTel = /^[0-9]*$/
			var regEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*$/
			var regDept = /^[0-9가-힣]*$/
			var regPosition = /^[0-9가-힣]*$/
			
			
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
</head>
<body>
	<div class = "detail">
		<fieldset>
		<legend>회원정보수정</legend>
			<% 
				String m_no = request.getParameter("m_no");
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				try{
					String sql = "select * from member where m_no =?";
					pstmt=conn.prepareStatement(sql);
					pstmt.setString(1, m_no);
					rs = pstmt.executeQuery();
					if(rs.next()){
						String m_id = rs.getString("m_id");
						String m_name = rs.getString("m_name");
						String m_passwd = rs.getString("m_passwd");
						String Rm_zipNo = rs.getString("m_zipNo");
						String Rm_addr =rs.getString("m_addr");
						String Rm_addrDetail = rs.getString("m_addrDetail");
						String m_tel =rs.getString("m_tel");
						String m_phone = rs.getString("m_phone");
						String m_email = rs.getString("m_email");
						String m_sendOk = rs.getString("m_sendOk");
						String m_dept = rs.getString("m_dept");
						String m_position = rs.getString("m_position");
						String rC_code = rs.getString("c_code");
						String m_tel1 = m_tel.substring(0, 3);
						String m_tel2 = m_tel.substring(4, 7);
						String m_tel3 = m_tel.substring(8, 12);
						String m_phone1 = m_phone.substring(0, 3);
						String m_phone2 = m_phone.substring(4, 8);
						String m_phone3 = m_phone.substring(9, 13);
						String m_pass = rs.getString("m_pass");
						String m_count = rs.getString("m_count");
						String [] m_emailArray = m_email.split("@");
						String m_email1 = m_emailArray[0];
						String m_email2 = m_emailArray[1];
			%>
		<form method="post" name="memfrm" action="adminEditInfo_ok.jsp">
			<table>
				<tr>
					<th>회원ID</th>
					<td><input type="text" name="m_id" value = "<%=m_id%>" class ="inText" readonly ></td>
					<td><input type="button" value="중복확인" onclick="idcheck()" class = "detailCheck"></td>
					<td></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" name="m_name" class ="inText" value = "<%=m_name%>"></td>
					<td colspan = "2"></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="text" name="m_passwd" class ="inText" value = "<%=m_passwd%>"></td>
					<td colspan = "2"></td>
				</tr>
				<tr>
					<th>직장주소</th>
					<td><input type="text" name="m_zipNo" class ="inText" value = "<%=Rm_zipNo %>" readonly></td>
					<td><input type="button" value="우편번호" onclick="goPopup()" class = "detailCheck"></td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td colspan="3"><input type="text" name="m_addr" class = "addr" value = "<%=Rm_addr %>" readonly></td>
				</tr>
				<tr>
					<td></td>
					<td colspan="3"><input type="text" class = "addr" name="m_addrDetail" value = "<%=Rm_addrDetail %>" readonly></td>
				</tr>
				<tr>
					<th>직장전화번호</th>
					<td colspan="3"><select name="m_tel1" class ="inText">
							<option selected>선택</option>
							<option value="02" <%if(m_tel1.equals("02")){%>selected<%}%>>02</option>
							<option value="031" <%if(m_tel1.equals("031")){%>selected<%}%>>031</option>
							<option value="032" <%if(m_tel1.equals("032")){%>selected<%}%>>032</option>
							<option value="033" <%if(m_tel1.equals("033")){%>selected<%}%>>033</option>
							<option value="041" <%if(m_tel1.equals("041")){%>selected<%}%>>041</option>
							<option value="042" <%if(m_tel1.equals("042")){%>selected<%}%>>042</option>
							<option value="043" <%if(m_tel1.equals("043")){%>selected<%}%>>043</option>
							<option value="051" <%if(m_tel1.equals("051")){%>selected<%}%>>051</option>
							<option value="052" <%if(m_tel1.equals("052")){%>selected<%}%>>052</option>
							<option value="053" <%if(m_tel1.equals("053")){%>selected<%}%>>053</option>
							<option value="054" <%if(m_tel1.equals("054")){%>selected<%}%>>054</option>
							<option value="055" <%if(m_tel1.equals("055")){%>selected<%}%>>055</option>
							<option value="061" <%if(m_tel1.equals("061")){%>selected<%}%>>061</option>
							<option value="062" <%if(m_tel1.equals("062")){%>selected<%}%>>062</option>
							<option value="063" <%if(m_tel1.equals("063")){%>selected<%}%>>063</option>
							<option value="064" <%if(m_tel1.equals("064")){%>selected<%}%>>064</option>
					</select> -<input type="text" name="m_tel2" maxlength="4" class ="inText" value = "<%=m_tel2%>"> -<input
						type="text" name="m_tel3" maxlength="4" class ="inText" value = "<%=m_tel3%>"></td>
				</tr>
				<tr>
					<th>휴대전화번호</th>
					<td colspan="3"><select name="m_phone1" class ="inText">
							<option selected>선택</option>
							<option value="010" <%if(m_phone1.equals("010")){%>selected<%}%>>010</option>
							<option value="011" <%if(m_phone1.equals("011")){%>selected<%}%>>011</option>
							<option value="016" <%if(m_phone1.equals("016")){%>selected<%}%>>016</option>
							<option value="017" <%if(m_phone1.equals("017")){%>selected<%}%>>017</option>
							<option value="018" <%if(m_phone1.equals("018")){%>selected<%}%>>018</option>
							<option value="019" <%if(m_phone1.equals("019")){%>selected<%}%>>019</option>
					</select> -<input type="text" name="m_phone2" class ="inText" value = "<%=m_phone2%>"> -<input type="text"
						name="m_phone3" class ="inText" value = "<%=m_phone3%>"></td>
				</tr>
				<tr>
					<th>E-mail</th>
					<td colspan="3"><input type="text" name="m_email1" class ="inText" value = "<%=m_email1%>"> @<select
						name="m_email2" class ="inText">
							<option selected>선택</option>
							<option value="naver.com" <%if(m_email2.equals("naver.com")){%>selected<%}%>>naver.com</option>
							<option value="daum.net" <%if(m_email2.equals("daum.net")){%>selected<%}%>>daum.net</option>
							<option value="korea.com" <%if(m_email2.equals("korea.com")){%>selected<%}%>>korea.com</option>
							<option value="hanmail.net" <%if(m_email2.equals("hanmail.net")){%>selected<%}%>>hanmail.net</option>
							<option value="korea.kr" <%if(m_email2.equals("korea.kr")){%>selected<%}%>>korea.kr</option>
							<option value="gmail.com" <%if(m_email2.equals("gmail.com")){%>selected<%}%>>gmail.com</option>
							<option value="chol.com" <%if(m_email2.equals("chol.com")){%>selected<%}%>>chol.com</option>
							<option value="dreamwiz.com" <%if(m_email2.equals("dreamwiz.com")){%>selected<%}%>>dreamwiz.com</option>
							<option value="empal.com" <%if(m_email2.equals("empal.com")){%>selected<%}%>>empal.com</option>
							<option value="yahoo.com" <%if(m_email2.equals("yahoo.com")){%>selected<%}%>>yahoo.com</option>
							<option value="paran.com" <%if(m_email2.equals("paran.com")){%>selected<%}%>>paran.com</option>
					</select></td>
				</tr>
				<tr>
					<th>E-mail 수신여부</th>
					<td colspan="2"><input type="radio" name="m_sendOk" value="Y" <%if(m_sendOk.equals("Y")){%>checked<%} %>> 수신 
					<input type="radio" name="m_sendOk" value="N"  <%if(m_sendOk.equals("N")){%>checked<%} %>>
						수신거부</td>
					<td></td>
				</tr>
				<tr>
					<th>부서</th>
					<td><input type="text" name="m_dept"  class ="inText" value = "<%=m_dept%>"></td>
					<td colspan = "2"></td>
					
				</tr>
				<tr>
					<th>직급</th>
					<td><input type="text" name="m_position" class ="inText" value = "<%=m_position%>"></td>
					<td >ex)행정7급</td>
					<td></td>
				</tr>
				<tr>
					<th>직장정보</th>
					<td><input type="text" name="c_code" value="<%=rC_code%>" class ="inText" readonly ></td>
					<td><input type="button" value="찾기" onclick="findCom()" class = "detailCheck"></td>
					<td></td>
				</tr>
			</table>
			<input type = "hidden" name = "m_count" value ="<%=m_count %>">
			<input type = "hidden" name = "m_pass" value ="<%=m_pass %>">
			<%}}catch(Exception e){
				e.printStackTrace();
				}finally{
					if(rs != null)rs.close();
					if(pstmt !=null)pstmt.close();
					if(conn!=null) conn.close();
				}
				%>
		</form>
	</fieldset>
		<input type="button" value="정보수정" onclick="checking()" class = "but"> 
	</div>
</body>
</html>