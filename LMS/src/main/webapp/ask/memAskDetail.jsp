<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의글보기</title>
<link rel = "stylesheet" href = "../css/ask.css">
<script>
	function send(){
		if(repAskfrm.a_repContent.value !=""){
			repAskfrm.submit();
		}else{
			alert("내용을 입력하세요");
		}
	}
</script>
</head>
<body>
<%@include file = "../Menu/memHeader.jsp"%>	
	<div class = "askfrm">
		<fieldset class = "writefield">
			<legend>문의글 확인</legend>
				<table class = "writefrm">
					<%
						m_id = (String)session.getAttribute("m_id");
						String a_no = request.getParameter("a_no");
						pstmt = null;
						rs = null;
						try{
							String sql = "select a.a_title, a.a_category, a.a_content, a.a_date, a.ad_id, a.a_reply, m.m_name from ask a join member m on a.m_no=m.m_no where m_id = ? and a_no =?";
							pstmt = conn.prepareStatement(sql);
							pstmt.setString(1,m_id);
							pstmt.setString(2,a_no);
							rs = pstmt.executeQuery();
							if(rs.next()){
								String a_title = rs.getString("a_title");
								String a_category = rs.getString("a_category");
								String a_content = rs.getString("a_content");
								String a_date = rs.getString("a_date");
								String ad_id = rs.getString("ad_id");
								String a_reply = rs.getString("a_reply");
								String m_name = rs.getString("m_name");		
					%>
						<tr>
							<th class = "label">작성자</th>
							<td class = "list"><%=m_name %></td>
							<th class = "label">제목</th>
							<td colspan = "2" class = "list"><%=a_title %></td>
						</tr>
						<tr>
							<th class = "label">카테고리</th>
							<td class = "list"><%=a_category %></td>
							<th class = "label">작성일</th>
							<td class = "list"><%=a_date %></td>
							<td></td>
						</tr>
						<tr>
							<th class = "label">문의내용</th>
							<td colspan = "4" class = "list" style = "border-bottom:1px solid #FFFDEE;"><textarea cols="30" rows = "10" readonly><%=a_content%></textarea></td>
						</tr>
		<%if(a_reply !=null){ %>
				<tr>
					<th class = "label">관리자</th>
					<td><textarea cols="30" rows = "10" readonly><%=a_reply%></textarea></td>
				</tr>
			<%}%>
		</table>
		<%	
			sql = "select a_date,a_repContent, a_repReply from ask where a_repNo =?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,a_no);
			rs = pstmt.executeQuery();
			while(rs.next()){
				a_date = rs.getString("a_date");
				String a_repContent = rs.getString("a_repContent");
				String a_repReply = rs.getString("a_repReply");
			%>
					<table>
						<tr>
							<th class = "label">추가문의내용</th>
							<td><textarea cols="30" rows = "10" ><%=a_repContent%></textarea></td>
							<th class = "label" >작성일</th>
							<td class = "list" style = "border-bottom:1px solid #FFFDEE;"><%=a_date%></td>
						</tr>
						<%if(a_repReply != null){ %>
						<tr>
							<th class = "label">관리자답변</th>
							<td><textarea cols="20" rows = "15"><%=a_repReply%></textarea></td>
							<td></td>
							<td></td>
						</tr>
						<%} %>
					</table>
		<%
			}}}catch(Exception e){e.printStackTrace();
		}finally{}
	%>
		<div class = "butArea">
			<input type = "button" value = "홈으로" class = "but" onclick = "location.href='../member/memIndex.jsp'">
			<input type = "button" value = "질문방으로" class = "but" onclick = "location.href='memAskHome.jsp'">
		</div>
		<details class = "addition">
				<summary style = "padding:10px;">추가 문의하기</summary>
			<form name = "repAskfrm" method="post" action = "memRepAskWrite_ok.jsp">
				<%
					pstmt = null;
					rs = null;
					try{
						String sql = "select a_category, a_title, a_content, a_date from ask where a_no =?";
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1,a_no);
						rs = pstmt.executeQuery();
						if(rs.next()){
							String a_category = rs.getString("a_category");
							String a_title = rs.getString("a_title");
							String a_date = rs.getString("a_date");
							sql = "select a_step from ask where a_no =? order by a_step desc limit 1 ";
							pstmt = conn.prepareStatement(sql);
							pstmt.setString(1, a_no);
							rs = pstmt.executeQuery();
							if(rs.next()){
								int a_step = rs.getInt("a_step");		
				%>
				<table class = "writefrm">
					<tr>
						<th class = "label">문의사항</th>
						<td><textarea cols="20" rows = "5" name = "a_repContent"class = "texta"></textarea>
					</tr>
				</table>
				<input type = "hidden" name = "a_step" value = "<%=a_step %>">
				<input type = "hidden" name = "a_repNo" value = "<%=a_no%>">
				<input type = "hidden" name = "a_category" value = "<%=a_category%>">
				<input type = "hidden" name = "a_title" value = "<%=a_title%>">
				<input type = "hidden" name = "a_date" value = "<%=a_date%>">
				<input type = "button" value = "추가문의하기" onclick = "send()" class = "but" style = "width:200px; height:40px;">
				<%
							}}}catch(Exception e){
					e.printStackTrace();
					}finally{
						if(rs != null) rs.close();
						if(pstmt != null)pstmt.close();
						if(conn !=null) conn.close();
					}
				%>
			</form>
			</details>
			</fieldset>
		</div>
		<%@ include file = "../Menu/footer.jsp" %>
</body>
</html>