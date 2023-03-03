<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리포트</title>
<link rel = "stylesheet" href = "../css/report.css">
</head>
<body>
<%@include file ="../Menu/memHeader.jsp" %>
<div class = "context">
	<h2>현재 수강하고 있는 과정</h2>
	<hr>
	<table>
		<tr>
			<th width = "150px">도서코드</th>
			<th width = "150px">도서이미지</th>
			<th width = "150px">과정명</th>
			<th width = "150px">저자</th>
			<th width = "150px">발행일</th>
		</tr>
<%
		request.setCharacterEncoding("UTF-8");
		m_id = (String)session.getAttribute("m_id");

		pstmt = null;
		rs = null;
		
		try{
			String sql = "select m_no from member where m_id =?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,m_id);
			rs=pstmt.executeQuery();
			if(rs.next()){
				int m_no = rs.getInt("m_no");	
				sql = "select distinct b.b_code, b.b_image, b.b_name, b.b_author, b.b_date from book b join class cl on b.b_no= cl.b_no join report r on cl.b_no = r.b_no where cl.m_no =? and r.r_score =0";	
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, m_no);
				rs=pstmt.executeQuery();
				while(rs.next()){
					String b_code = rs.getString("b_code");
					String b_image = rs.getString("b_image");
					String b_name = rs.getString("b_name");
					String b_author = rs.getString("b_author");
					String b_date = rs.getString("b_date");
%>
					<tr>
						<td><%=b_code %></td>
						<td><img src = "/tomcatImg/<%=b_image%>" style = "width:80px; height:110px;"></td>
						<td><a href = "memReportWrite.jsp?m_no=<%=m_no%>" ><%=b_name%></a></td>
						<td><%=b_author %></td>
						<td><%=b_date%></td>
					</tr>	
					<%}}}catch(Exception e){
						e.printStackTrace();
					}finally{
						if(rs!=null)rs.close();
						if(pstmt != null)pstmt.close();
						if(conn !=null)conn.close();	
					}%>
	</table>
	</div>
	<%@ include file = "../Menu/footer.jsp" %>
</body>
</html>