<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../config/dbconn.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>(관리자용)도서수정</title>
<link rel = "stylesheet" href = "../css/bookdetail.css">

<script>
		function firstChange() {// 대분류 변한 경우
			 var x = document.bookfrm.b_categoryF.options.selectedIndex;
			 var groups=document.bookfrm.b_categoryF.options.length;
			 var group=new Array(groups);//배열 생성
			 for (i=0; i<groups; i++) {
			  group[i]=new Array();
			 }//for
			 // 옵션(<option>) 생성
			 group[0][0]=new Option("기타나라소설","기타나라소설");
			 group[0][0]=new Option("대분류를 먼저 선택하세요","");
			 group[1][0]=new Option("한국소설","한국소설");//결과 <option value="ss">삼성</option>
			 group[1][1]=new Option("영미소설","영미소설");
			 group[1][2]=new Option("일본소설","일본소설");
			 group[1][3]=new Option("기타나라소설","기타나라소설");
			 group[1][4]=new Option("세계고전및 문학","세계고전및");
			 group[1][5]=new Option("한국고전소설","한국고전소설");
			 group[2][0]=new Option("나라별/테마별에세이","나라별/테마별에세이");
			 group[2][1]=new Option("지혜/상식","지혜/상식");
			 group[2][2]=new Option("인물/자전적에세이","인물/자전적에세이");
			 group[2][3]=new Option("시/희곡","시/희곡");
			 group[3][0]=new Option("재테크/금융","재테크/금융");
			 group[3][1]=new Option("경제일반 및 이론","경제일반 및 이론");
			 group[3][2]=new Option("마케팅세일즈","마케팅세일즈");
			 group[3][3]=new Option("경영전략","경영전략");
			 group[3][4]=new Option("경영일반 및 이론","경영일반 및 이론");
			 group[3][5]=new Option("경영관리","경영관리");
			 group[3][6]=new Option("경제/경영기타","경제/경영기타");
			 group[3][7]=new Option("기업 및 각국경제","기업 및 각국경제");
			 group[4][0]=new Option("성공/처세","성공/처세");
			 group[4][1]=new Option("자기능력개발","자기능력개발");
			 group[4][2]=new Option("인간관계","인간관계");
			 group[4][3]=new Option("화술/협상","화술/협상");
			 group[4][4]=new Option("비즈니스능력개발","비즈니스능력개발");
			 group[5][0]=new Option("인문학일반","인문학일반");
			 group[5][1]=new Option("심리학","심리학");
			 group[5][2]=new Option("철학","철학");
			 group[5][3]=new Option("인문기타","인문기타");
			 group[5][4]=new Option("독서/글쓰기","독서/글쓰기");
			 group[5][5]=new Option("비평","비평");
			 group[5][6]=new Option("명리/주역/풍수","명리/주역/풍수");
			 group[6][0]=new Option("과학/기술공학 외","과학/기술공학 외");
			 group[6][1]=new Option("한국사/민속학","한국사/민속학");
			 group[6][2]=new Option("서양사/동양사/세계사","서양사/동양사/세계사");
			 group[6][3]=new Option("역사인물/기행","역사인물/기행");
			 group[6][4]=new Option("지리학/문화사/문화일반","지리학/문화사/문화일반");
			 group[7][0]=new Option("기독교/가톨릭/불교","기독교/가톨릭/불교");
			 group[7][1]=new Option("종교일반","종교일반");
			 group[7][2]=new Option("그외종교","그외종교");
			 group[7][3]=new Option("역학/사주","역학/사주");
			 group[8][0]=new Option("행정/정책","행정/정책");
			 group[8][1]=new Option("정치/외교","정치/외교");
			 group[8][2]=new Option("교육","교육");
			 group[8][3]=new Option("사회비평","사회비평");
			 group[8][4]=new Option("국방/군사","국방/군사");
			 group[8][5]=new Option("사회학 외","사회학 외");
			 group[8][6]=new Option("대중문화","대중문화");
			 group[8][7]=new Option("미술","미술");
			 group[8][8]=new Option("사진","사진");
			 group[9][0]=new Option("오피스활용","오피스활용");
			 group[9][1]=new Option("컴퓨터입문/활용","컴퓨터입문/활용");
			 group[9][2]=new Option("컴퓨터/IT기타","컴퓨터/IT기타");
			 group[9][3]=new Option("프로그래밍","프로그래밍");
			 group[9][4]=new Option("모바일","모바일");
			 group[9][5]=new Option("그래픽/디자인","그래픽/디자인");
			 group[9][6]=new Option("네트워크","네트워크");
			 group[10][0]=new Option("영어","영어");
			 group[10][1]=new Option("일본어","일본어");
			 group[10][2]=new Option("중국어","중국어");
			 group[10][3]=new Option("기타언어","기타언어");		 
			 group[11][0]=new Option("육아/자녀교육","육아/자녀교육");
			 group[11][1]=new Option("인테리어","인테리어");
			 group[11][2]=new Option("임신/출산","임신/출산");
			 group[11][3]=new Option("요리","요리");
			 group[11][4]=new Option("결혼/가정","결혼/가정");
			 group[12][0]=new Option("질병과치료법","질병과치료법");
			 group[12][1]=new Option("다이어트/운동/트레이닝","다이어트/운동/트레이닝");
			 group[12][2]=new Option("의학/약학/한의학","의학/약학/한의학");
			 group[12][3]=new Option("자연건강/건강식사","자연건강/건강식사");
			 group[12][4]=new Option("건강일반/뇌건강","건강일반/뇌건강");
			 group[13][0]=new Option("국내여행","국내여행");
			 group[13][1]=new Option("해외여행","해외여행");
			 group[13][2]=new Option("테마여행","테마여행");
			 group[13][3]=new Option("여행에세이","여행에세이");
			 group[13][4]=new Option("유학/이민","유학/이민");
			 group[14][0]=new Option("패션/수공예","패션/수공예");
			 group[14][1]=new Option("오락/퍼즐/스도쿠기타","오락/퍼즐/스도쿠기타");
			 group[14][2]=new Option("반려동물","반려동물");
			 group[14][3]=new Option("등산/낚시/바둑","등산/낚시/바둑");

			 temp = document.bookfrm.b_categoryS;//두번 째 셀렉트 얻기(<select name=second>)
			 
			 for (m = temp.options.length-1 ; m > 0 ; m--) {//현재 값 지우기
			 	temp.options[m]=null
			 }
			 
			 for (i=0;i<group[x].length;i++){//값 셋팅
			  //예) <option value="ss">삼성</option>
			   temp.options[i]=new Option(group[x][i].text,group[x][i].value);
			 }
			 
			 	temp.options[0].selected=true//인덱스 0번째, 즉, 첫번째 선택
			}//firstChange
			
			
		function changeEduPurpose(text) {
				if (document.bookfrm.b_purpose.value == "") {
					parseText = text.split('.');
					parseText.length = 4;

					document.bookfrm.b_purpose.value = parseText.join('.')+'.';
				}
			}
			
		function goSave(){

				var regPrice = /^[0-9]*$/
				
				if(!bookfrm.b_name.value){
					alert("도서명을 입력하세요.");
					bookfrm.b_name.focus();
					return false;
				}
				if(!bookfrm.b_author.value){
					alert("저자를 입력하세요");
					bookfrm.b_author.focus();
					return false;
				}	
				if(!bookfrm.b_pub.value){
					alert("출판사를 입력하세요");
					bookfrm.b_pub.focus();
					return false;
				}
				if(!bookfrm.b_date.value){
					alert("출판일을 입력해주세요");
					bookfrm.b_date.focus();
					return false;
				}
				if(!bookfrm.b_price.value){
					alert("도서가격을 입력하세요");
					bookfrm.b_price.focus();
					return false;
				}
				if(!regPrice.test(bookfrm.b_price.value)){
					alert("도서가격은 숫자로만 입력해주세요")
					bookfrm.b_price.focus();
					return false;
					}
				if(!bookfrm.b_pageNo.value){
					alert("페이지 수를 입력하세요");
					bookfrm.b_pageNo.focus();
					return false;
				}
				if(!regPrice.test(bookfrm.b_pageNo.value)){
					alert("페이지 수는 숫자로만 입력해주세요");
					bookfrm.b_pageNo.focus();
					return false;
				}
				if(!bookfrm.b_desc.value){
					alert("도서소개를 입력하세요");
					bookfrm.b_desc.focus();
					return false;
				}
				if(!bookfrm.b_categoryF.value){
					alert("대분류를 입력하세요");
					return false;
				}
				if(!bookfrm.b_categoryS.value){
					alert("소분류를 입력하세요");
					return false;
				}
				bookfrm.submit();
			}
</script>
</head>
<body> 
<div class = "detail">
	<form method = "post" name = "bookfrm" action ="adminEditBook_ok.jsp" enctype = "multipart/form-data">
		<fieldset>
<%
			request.setCharacterEncoding("UTF-8");
		
			String b_no = request.getParameter("b_no");
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try{
				String sql = "select b_code, b_name, b_author, b_pub, b_date, b_price, b_pageNo, b_desc, b_index, b_comment, b_image, b_categoryF, b_categoryS, b_regDate, b_purpose from book where b_no =?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, b_no);
				rs = pstmt.executeQuery();
				if(rs.next()){
					String b_code = rs.getString("b_code");
					String b_name =rs.getString("b_name");
					String b_author =rs.getString("b_author");
					String b_pub =rs.getString("b_pub");
					String b_date =rs.getString("b_date");
					int b_price =rs.getInt("b_price");
					int b_pageNo =rs.getInt("b_pageNo");
					String b_desc =rs.getString("b_desc");
					String b_index =rs.getString("b_index");
					String b_comment =rs.getString("b_comment");
					String b_image =rs.getString("b_image");
					String b_categoryF =rs.getString("b_categoryF");
					String b_categoryS =rs.getString("b_categoryS");
					String b_regDate =rs.getString("b_regDate");
					String b_purpose =rs.getString("b_purpose");
%>			
				<table>
				<tr>
					<td class = "label">도서명</td>
					<td><input type = "text" name = "b_name" class = "inText" value = "<%=b_name%>"></td>
				</tr>
				<tr>
					<td class = "label">저자</td>
					<td><input type = "text" name = "b_author" class = "inText" value = "<%=b_author%>"></td>
				</tr>
				<tr>
					<td class = "label">출판사</td>
					<td><input type = "text" name = "b_pub" class = "inText" value = "<%=b_pub%>"></td>
				</tr>
				<tr>
					<td class = "label">출판일</td>
					<td><input type = "text" name = "b_date" class = "inText" value = "<%=b_date%>"></td>
				</tr>
				<tr>
					<td class = "label">정상가격</td>
					<td><input type = "text" name = "b_price" class = "inText" value = "<%=b_price%>"></td>
				</tr>
				<tr>
					<td class = "label">페이지 수</td>
					<td><input type = "text" name = "b_pageNo" class = "inText" value = "<%=b_pageNo%>"></td>
				</tr>
				<tr>
					<td class = "label">도서소개</td>
					<td><textarea rows="8" cols="30" name = "b_desc" class="texta" onchange="changeEduPurpose(this.value)"><%=b_desc%></textarea></td>
				</tr>
				<tr>
					<td class = "label">도서목차/내용</td>
					<td><textarea rows="8" cols="30" name = "b_index" class="texta"><%=b_index%></textarea></td>
				</tr>
				<tr>
					<td class = "label">출판서평</td>
					<td><textarea rows="8" cols="30" name = "b_comment" class="texta"><%=b_comment%></textarea></td>
				</tr>
				<tr>
					<td class = "label">도서이미지</td>
					<td style = "display: flex;
							    flex-direction: column;
							    flex-wrap: wrap;
							    align-items: flex-start;">
					<input type = "file" name = "b_image"> <img src = "/tomcatImg/<%=b_image%>" style="width:100px;height:160px"/><input type = "hidden" name = "b_old_image" value = <%=b_image%>></td>
				</tr>
				<tr>
				<td class = "label">분류</td>
					<td>대분류 : <select name = "b_categoryF" size=1 onchange="firstChange()">
									<option value = ''>선택하세요</option>
									<option value = '3B' <% if(b_categoryF.equals("3B")){%> selected <%}%>>소설</option>
									<option value = '3D' <% if(b_categoryF.equals("3D")){%> selected <%}%>>시/에세이</option>
									<option value = '3I' <% if(b_categoryF.equals("3I")){%> selected <%}%>>경제/경영</option>
									<option value = '3A' <% if(b_categoryF.equals("3A")){%> selected <%}%>>자기계발</option>
									<option value = '3C' <% if(b_categoryF.equals("3C")){%> selected <%}%>>인문</option>
									<option value = '3G' <% if(b_categoryF.equals("3G")){%> selected <%}%>>역사/문화/과학</option>
									<option value = '3M' <% if(b_categoryF.equals("3M")){%> selected <%}%>>종교</option>
									<option value = '3O' <% if(b_categoryF.equals("3O")){%> selected <%}%>>정치/사회/문화</option>
									<option value = '3J' <% if(b_categoryF.equals("3J")){%> selected <%}%>>컴퓨터/IT</option>
									<option value = '3N' <% if(b_categoryF.equals("3N")){%> selected <%}%>>외국어</option>
									<option value = '3E' <% if(b_categoryF.equals("3E")){%> selected <%}%>>가정/생활</option>
									<option value = '3F' <% if(b_categoryF.equals("3F")){%> selected <%}%>>건강</option>
									<option value = '3L' <% if(b_categoryF.equals("3L")){%> selected <%}%>>여행/기행</option>
									<option value = '3H' <% if(b_categoryF.equals("3H")){%> selected <%}%>>취미/스포츠</option>
								</select>
						소분류 <select name="b_categoryS" size=1 >
									<option value="<%=b_categoryS%>"><%=b_categoryS%></option>
								 </select> </td>
				</tr>
				<tr>
					<td class = "label">학습목적</td>
					<td><textarea rows="8" cols="30" name = "b_purpose" class="texta"><%=b_purpose %></textarea></td>
				</tr>
			</table>
				<input type = "hidden" name = "b_code" value = "<%=b_code%>">
				</fieldset>
				<p><input type = "button" class = "but" onclick = "goSave()" value = "수정하기">
			</form>
								
				<%
				}}catch(Exception e){
					e.printStackTrace();
				}finally{
					if(rs!=null)rs.close();
					if(pstmt!=null)pstmt.close();
					if(conn!=null)conn.close();
					}
		%>
	</div>
</body>
</html>