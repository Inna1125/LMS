<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리포트쓰기</title>
<link rel = "stylesheet" href = "../css/report.css">
	<script>
		function ChkByte(){
			var minByte =1000;
			var obj = document.getElementById("r_content").value;
			var text_val = obj.toString();
			var text_len = Object.keys(obj).length;
			
			var totalByte = 0;
			for(var i =0; i<text_len;i++){
				var each_char = text_val.charAt(i);
				var uni_char = escape(each_char);
				if(uni_char.length>4){
					totalByte +=2;
				}else{
					totalByte +=1;
				}
			}
			if(totalByte<minByte){
				document.getElementById("reportByte").value = totalByte;
				document.getElementById("reportByte").style.color = "red";
			}else{
				document.getElementById("reportByte").value = totalByte;
				document.getElementById("reportByte").style.color = "black";
			}
		}
		
		function sub(){
			if(document.getElementById("reportByte").value<1000){
				alert("리포트 작성은 1000자 이상이 되어야 제출가능합니다. 글자 수 출력 버튼을 눌러주세요.");
			}else{
				var conf = confirm("리포트 제출 후에는 수정되지 않습니다. 수정을 원하실 경우 임시저장을 눌러주세요. 제출하시겠습니까?");
				if(conf){
					reportfrm.action = "memReportWrite_ok.jsp";
				}
			}
		}
		function sav(){
			alert("임시저장만 가능하며 제출시에는 제출버튼을 눌러주세요.");
		}
		
	</script>

</head>
<body>
<%@ include file = "../Menu/memHeader.jsp" %>
<%
	String m_no = request.getParameter("m_no");
	
	pstmt = null;
	rs = null;
	try{
		String sql = "select cl.b_no, m.m_name, b.b_code, b.b_image, b.b_name, b.b_author , b.b_pub from book b join class cl on b.b_no= cl.b_no join member m on cl.m_no = m.m_no where cl.m_no =?";
		pstmt =conn.prepareStatement(sql);
		pstmt.setString(1, m_no);
		rs= pstmt.executeQuery();
		if(rs.next()){
			String b_no = rs.getString("b_no");
			String m_name = rs.getString("m_name");
			String b_image = rs.getString("b_image");
			String b_name = rs.getString("b_name");
			String b_author = rs.getString("b_author");
			String b_pub = rs.getString("b_pub");
%>
<div class = "context">
	<h2>학습평가리포트</h2>
	<hr>
	<table class = "reportInfo">
		<tr>
			<td rowspan = "3"><img src = "/tomcatImg/<%=b_image%>" style = "width:100px; height :180px;"></td>
			<td width = "100px">과정명</td>
			<td colspan = "3" width="300px"><%=b_name%></td>
		</tr>
		<tr>
			<td>저자</td>
			<td><%=b_author%></td>
			<td>출판사</td>
			<td width="130px"><%=b_pub%></td>
		</tr>
		<tr>
			<td>작성자</td>
			<td colspan = "3"><%=m_name%></td>
		</tr>
	</table>
	<div class = "reportfrm">
	<%
		sql = "select r_content, r_done from report where b_no =? and m_no =?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, b_no);
		pstmt.setString(2, m_no);
		rs = pstmt.executeQuery();
		if(rs.next()){
		String r_content = rs.getString("r_content");
		String r_done = rs.getString("r_done");
	%>
		<h4>리포트 작성</h4>
		<hr>
		<p> 다음문제를 읽고 학습한 도서내용을 바탕으로 각 문제의 유형에 따라 해당 답안을 선택 또는 작성하십시오.
		<p> 학습한 도서 내용을 요약하고 자신의 생각이나 느낌을 기술하세요.[ 1000 byte 이상]
		<form name = "reportfrm" method = "post" class = "texta" >
		<%if(r_content == null){ %>
			<textarea cols = "100" rows = "25" name = "r_content" id = "r_content"  ></textarea>
		<%}else{ %>
			<textarea cols = "100" rows = "25" name = "r_content" id = "r_content"><%=r_content%></textarea>
		<%} %>
			<div class= "countByte"><input type = "text" id = "reportByte" readonly>byte <input type = "button" value = "글자 수 출력" onclick = "ChkByte()"></div>
			
		<%if(r_done.equals("n")){%>
				<div>
					<input type = "submit" value = "제출" onclick = "sub()" class = "but" >
					<input type = "submit" value = "임시저장" onclick = "sav()" formaction = "memReportModify_ok.jsp" class = "but">
				</div>
		<%}else{%>
			<div><p><a href = "memReportList.jsp" class = "backList">목록가기</a></p></div>
		<%}%>
		</form>
	</div>
	<%}}}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(rs!=null)rs.close();
			if(pstmt != null)pstmt.close();
			if(conn !=null)conn.close();	
		}%>
	</div>
	<%@include file = "../Menu/footer.jsp" %>
</body>
</html>