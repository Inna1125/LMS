<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>(관리자)문의글보기</title>
<link rel = "stylesheet" href = "../css/ask.css">
</head>
<body>
<%@include file = "../Menu/adminHeader.jsp" %>	
	<div class = "askfrm">
		<fieldset class = "writefield">
			<legend>문의글 확인</legend>
				<table class = "writefrm">
					<tr>
						<%
			
						String a_no = request.getParameter("a_no");
						PreparedStatement pstmt = null;
						ResultSet rs = null;
						
						try{
							String sql = "select m_no, a_title, a_category, a_content, a_date, ad_id, a_reply from ask where a_no = ?";
							pstmt = conn.prepareStatement(sql);
							pstmt.setString(1,a_no);
							rs = pstmt.executeQuery();
							if(rs.next()){
								String a_title = rs.getString("a_title");
								String a_category = rs.getString("a_category");
								String a_content = rs.getString("a_content");
								String a_date = rs.getString("a_date");
								String ad_id = rs.getString("ad_id");
								String a_reply = rs.getString("a_reply");
								String m_no = rs.getString("m_no");
								if(m_no != null || m_no != ""){
								sql = "select m_name from member where m_no =?";
								pstmt = conn.prepareStatement(sql);
								pstmt.setString(1,m_no);
								rs = pstmt.executeQuery();
								if(rs.next()){
									String m_name = rs.getString("m_name");
						%>
						
							<th class = "label">작성자</th>
							<td class = "list"><%=m_name %></td>
							<%}else{ %>
							<th class = "label">작성자</th>
							<td class = "list">게스트</td>
						<%} %>
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
							<td colspan = "4"><textarea cols="30" rows = "10" class = "texta" readonly><%=a_content%></textarea></td>
						</tr>
					</table>
			<form name = "askfrm" method = "post" action = "adminAskReply_ok.jsp">
					<table>
					<%if(a_reply != null){ %>
						<tr>
							<th class = "label">관리자</th>
							<td><textarea cols="20" rows = "5" name = "a_reply" class = "texta"><%=a_reply %></textarea></td>
						</tr>
					<%}else{ %>
						<tr>
							<th class = "label">관리자</th>
							<td><textarea cols="20" rows = "5" name = "a_reply" class = "texta"></textarea></td>
						</tr>
					<%} %>
					</table>
					<input type = "hidden" name = "a_no" value = "<%=a_no%>">
			
		<%	
			sql = "select a_repNo, a_date, a_repContent, a_repReply, a_step from ask where a_repNo =?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,a_no);
			rs = pstmt.executeQuery();
			while(rs.next()){
				String a_repNo = rs.getString("a_repNo");
				a_date = rs.getString("a_date");
				String a_repContent = rs.getString("a_repContent");
				String a_repReply = rs.getString("a_repReply");
				String a_step = rs.getString("a_step");
			%>
				
					<table>
						<tr>
							<th class = "label">추가문의내용</th>
							<td><textarea cols="30" rows = "10"  readonly class = "texta"><%=a_repContent%></textarea></td>
							<th class = "label">작성일</th>
							<td class = "list" style = "border-bottom:1px solid #FFFDEE;"><%=a_date%></td>
							<td><input type = "hidden" name = "a_repNo" value = "<%=a_repNo%>"></td>
							<td><input type = "hidden" name = "a_step" value = "<%=a_step%>"></td>
						</tr>
						<%if(a_repReply != null){ %>
						<tr>
							<th class = "label">관리자답변</th>
							<td><textarea cols="20" rows = "5" name = "a_repReply" class = "texta"><%=a_repReply%></textarea></td>
							<td></td>
							<td></td>
						</tr>
						<%}else{ %>
						<tr>
							<th class = "label">관리자답변</th>
							<td><textarea cols="20" rows = "5" name = "a_repReply" class = "texta" ></textarea></td>
							<td></td>
							<td></td>
						</tr>
						<%} %>
					</table>

		<%
		}}}}catch(Exception e){
				e.printStackTrace();
				}finally{
					if(rs != null) rs.close();
					if(pstmt != null)pstmt.close();
					if(conn !=null) conn.close();
				}
	%>
				<input type = "submit" value = "답변달기" class = "but">
			</form>
		<input type = "button" value = "홈으로" class = "but" onclick = "location.href='../home/adminIndex.jsp'">
		<input type = "button" value = "질문방으로" class = "but" onclick = "location.href='adminAskConfirm.jsp'">
		</fieldset>
		</div>
		<%@include file = "../Menu/footer.jsp" %>
</body>
</html>