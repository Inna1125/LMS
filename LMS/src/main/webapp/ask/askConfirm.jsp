<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../config/dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비회원 질문 목록</title>
<link rel = "stylesheet" href = "../css/ask.css">
</head>
<body>
<%@ include file = "../Menu/header.jsp" %>
<div class = "askfrm">
	<fieldset class = "writefield">
		<legend>비회원용 문의내역</legend>
			<table class = "writefrm">
			<tr>
				<th class = "label" width = "150px" style = "padding-bottom :20px; font-size:15pt;">번호</th>
				<th class = "label"  width = "350px" style = "padding-bottom :20px; font-size:15pt;">분류</th>
				<th class = "label"  width = "350px" style = "padding-bottom :20px; font-size:15pt;">제목</th>
				<th class = "label"  width = "150px" style = "padding-bottom :20px; font-size:15pt;">게시날짜</th>
				<th class = "label"  width = "150px" style = "padding-bottom :20px; font-size:15pt;">관리자명</th>
			</tr>
	<%
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int i  = 1;
		try{
			String sql = "select a_no, a_category, a_title, a_date, ad_id from ask where a_repNo is null and m_no is null order by a_no desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				String a_no = rs.getString("a_no");
				String a_category = rs.getString("a_category");
				String a_title = rs.getString("a_title");
				String a_date = rs.getString("a_date");
				String ad_id = rs.getString("ad_id");
	%>
			<tr>
				<td class = "list"><%=i %></td>
				<td class = "list"><%=a_category%></td>
				<td class = "list"><a href = "askEnterCheck.jsp?a_no=<%=a_no%>"><%=a_title%></a></td>
				<td class = "list"><%=a_date%></td>
				<%if(ad_id==null){ %><td class = "list"></td>
				<%}else{ %><td class = "list"><%=ad_id %></td><%} %>
			</tr>
	<%			i++;	
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(rs != null) rs.close();
			if(pstmt != null)pstmt.close();
			if(conn !=null) conn.close();
		}
	%>
	</table>
	</fieldset>
</div>	
	<%@ include file = "../Menu/footer.jsp" %>
</body>
</html>