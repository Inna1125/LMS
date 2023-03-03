	function goPopup() {
			// 주소검색을 수행할 팝업 페이지를 호출합니다.
			// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://business.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
			var pop = window.open("jusoPopupEdit.jsp", "pop",
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
			var pop = window.open("findCom.jsp", "pop1","width=600, height=500,top=0,left=0,resizable=yes");	
			
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
	function idcheck(){
			var idPop = window.open("idSearch.jsp", "pop3", "width=600, height=600, top=0, left=0 resizable=yes");
			}
			
	function idCallBack(m_id){
			document.memfrm.m_id.value = m_id;
			}

