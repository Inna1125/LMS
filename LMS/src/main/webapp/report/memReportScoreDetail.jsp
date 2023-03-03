<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../config/dbconn.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리포트쓰기</title>
<link rel = "stylesheet" href="../css/report.css">
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
</script>
</head>
<body>
<div class = "detail">
<%
	String r_no = request.getParameter("r_no");
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	try{
		String sql = "select b.b_no, m.m_no, m.m_name, b.b_image, b.b_name, b.b_author, b.b_pub from book b join report r on b.b_no= r.b_no join member m on r.m_no = m.m_no where r_no =?";
		pstmt =conn.prepareStatement(sql);
		pstmt.setString(1, r_no);
		rs= pstmt.executeQuery();
		if(rs.next()){
			String b_no = rs.getString("b_no");
			String m_no = rs.getString("m_no");
			String m_name = rs.getString("m_name");
			String b_image = rs.getString("b_image");
			String b_name = rs.getString("b_name");
			String b_author = rs.getString("b_author");
			String b_pub = rs.getString("b_pub");
%>
	<fieldset>
		<legend>학습평가리포트</legend>
			<table class = "detailfrm">
				<tr>
					<td rowspan = "3"><img src = "/tomcatImg/<%=b_image%>" style = "width:100px; height :180px;"></td>
					<td class = "inText">과정명</td>
					<td colspan = "3" class = "inText"><%=b_name%></td>
				</tr>
				<tr>
					<td class = "inText">저자</td>
					<td class = "inText"><%=b_author%></td>
					<td class = "inText">출판사</td>
					<td class = "inText"><%=b_pub%></td>
				</tr>
				<tr>
					<td class = "inText">작성자</td>
					<td colspan = "3" class = "inText"><%=m_name%></td>
				</tr>
			</table>
		<div class = "frm">
		<%
			sql = "select r_content, r_score, r_reply from report where b_no =? and r_no =?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, b_no);
			pstmt.setString(2, r_no);
			rs = pstmt.executeQuery();
			if(rs.next()){
			String r_content = rs.getString("r_content");
			String r_score = rs.getString("r_score");
			String r_reply = rs.getString("r_reply");
		%>
			<h4>리포트 작성</h4>
			<p> 다음문제를 읽고 학습한 도서내용을 바탕으로 각 문제의 유형에 따라 해당 답안을 선택 또는 작성하십시오.
			<p> 학습한 도서 내용을 요약하고 자신의 생각이나 느낌을 기술하세요.[ 1000 byte 이상 ]
			<form name = "reportfrm" method = "post">
			<textarea cols = "100" rows = "25" name = "r_content" id = "r_content" ><%=r_content%></textarea>
			<input type = "text" id = "reportByte" readonly class = "but">byte <input type = "button" class = "but" value = "글자 수 출력" onclick = "ChkByte()">
			<p><input type = "text" name = "r_score" value = "<%=r_score%>"class = "but">/100점
			<p>관리자 : <textarea cols = "50" rows = "10" name = "r_reply"><%=r_reply%></textarea>
			<p style = "font-family: 'Nanum Gothic', sans-serif;"><input type = "button" value = "닫기" class = "but" onclick = "window.close();">
			</form>
		</div>
		<%}}}catch(Exception e){
				e.printStackTrace();
			}finally{
				if(rs!=null)rs.close();
				if(pstmt != null)pstmt.close();
				if(conn !=null)conn.close();	
			}%>
			</fieldset>
		</div>
</body>
</html>