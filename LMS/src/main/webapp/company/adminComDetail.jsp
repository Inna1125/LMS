<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../config/dbconn.jsp" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기업자세히보기/수정하기</title>
<link rel = "stylesheet" href = "../css/company.css">
</head>
<body>
<%	
	request.setCharacterEncoding("UTF-8");

	String c_code = request.getParameter("c_code");

	PreparedStatement pstmt = null;
	ResultSet rs = null;
	try{
		String sql = "select * from company where c_code =?";	
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,c_code);
		rs = pstmt.executeQuery();
		if(rs.next()){
			c_code = rs.getString("c_code");
			String c_name = rs.getString("c_name");
			String c_type = rs.getString("c_type");
			int c_countY = rs.getInt("c_countY");
			int c_countM = rs.getInt("c_countM");
			String c_limit = rs.getString("c_limit");
			int c_limscore = rs.getInt("c_limscore");
%>
<div class = "detail">
		<form method="post" name="comfrm" action="adminComUpdate_ok.jsp">
		<fieldset>
			<p style = "color:#1F1F1F;">모든정보를 정확하게 입력해주셔야합니다.
			<p style = "color:#1F1F1F;">기업정보입력
			<table class = "comInfo">
				<tr>
					<th class = "label" >회사코드</th>
					<td><input type="text" name="c_code" value = "<%=c_code%>" class = "inText" readonly></td>
					<td style = "color:#1F1F1F;">회사코드는 변경 불가능 합니다.</td>
				</tr>
				<tr>
					<th class = "label" >회사명</th>
					<td><input type="text" name="c_name" value = "<%=c_name%>" class = "inText"></td>
					<td></td>
				</tr>
				<tr>
					<th class = "label">회사구분</th>
					<td colspan = "2" class = "label">공기업 <input type = "radio" name = "c_type" value = "공기업" <%if(c_type.equals("공기업")){%>checked<%}%>>
									일반기업 <input type = "radio" name = "c_type" value = "일반기업" <%if(c_type.equals("일반기업")){%>checked<%}%>>
					</td>
				</tr>
				<tr>
					<th class = "label">수강횟수(연/월)</th>
					<td colspan = "2">
						연 <select name = "c_countY">
							<option>연도별 수강횟수</option>
							<%for(int i =0 ;i<13; i++){ %>
							<option value = <%=i%> <%if(c_countY==i){%>selected<%}%>><%=i%>회</option>
							<%} %>
						</select>
						월 <select name = "c_countM">
							<option>월별 수강횟수</option>
							<%for(int j =0 ;j<13; j++){ %>
							<option value = <%=j%> <%if(c_countM==j){%>selected<%}%>><%=j%>회</option>
							<%} %>
						</select>
					</td>
				</tr>
				<tr>
					<th class = "label">수강제한</th>
					<td><input type = "radio" name = "c_limit" value = "y" <%if(c_limit.equals("y")){%>checked<%}%>> 사용
						<input type = "radio" name = "c_limit" value = "n" <%if(c_limit.equals("n")){%>checked<%}%>> 미사용</td>
					<td><select name = "c_limscore">
						<option value = 60 <%if(c_limscore==60){%>selected<%}%>>60점</option>
						<option value = 70 <%if(c_limscore==70){%>selected<%}%>>70점</option>
					</select></td>
				</tr>
				<tr>
					<th class = "label">수강인원명단</th>
					<td colspan = "2">
						<fieldset>
						<% 
							sql = "select m_name from member where c_code =?";
							pstmt = conn.prepareStatement(sql);
							pstmt.setString(1, c_code);
							rs = pstmt.executeQuery();
							while(rs.next()){
								String m_name = rs.getString("m_name");
							%>
							<ul type ="none" class = "memList">
								<li><%=m_name%></li>
							</ul>
							<%} %>
						</fieldset>
					</td>
				</tr>
				<%}}catch(Exception e){
					e.printStackTrace();
					}finally{
						if(rs!=null)rs.close();
						if(pstmt != null)pstmt.close();
						if(conn !=null)conn.close();}
				%>
			</table>
			<input type="button" value="수정하기" onclick="check()" class = "but"> <input type = "button" value = "소속회원삭제" class = "but"onclick = "memDel()">
			</fieldset>
		</form>
	</div>
<script>
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
		function memDel(){
			var conf = confirm("삭제하시면 기업정보는 남아있지만 소속되어있는 회원과 리포트가 모두 삭제됩니다. 삭제하시겠습니까?");
			if(conf){
				location.href = "adminComMemDelete.jsp?c_code=<%=c_code%>";
			}
		}
</script>
</body>
</html>