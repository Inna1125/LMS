<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리포트</title>
<link rel = "stylesheet" href="../css/report.css">
</head>
<body>
<%@include file ="../Menu/memHeader.jsp" %>
<div class="context">
	<h2>리포트 점수 확인</h2>
	<hr>
	<table>
		<tr>
			<th width="150px">도서코드</th>
			<th width="150px">과정명</th>
			<th width="150px">저자</th>
			<th width="150px">제출일</th>
			<th width="150px">리포트점수</th>
		</tr>
<%
		request.setCharacterEncoding("UTF-8");
		m_id = (String)session.getAttribute("m_id");

		pstmt = null;
		rs = null;
		
		try{
			String sql = "select r.m_no, r.b_no from member m join report r on r.m_no = m.m_no where m_id =?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,m_id);
			rs=pstmt.executeQuery();
			if(rs.next()){
				int m_no = rs.getInt("m_no");	
				int b_no = rs.getInt("b_no");
				sql = "select r.r_no, b.b_code, b.b_name, b.b_author, r.r_date, r_score from report r join book b on r.b_no = b.b_no where r.m_no =? and r.b_no =?";	
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, m_no);
				pstmt.setInt(2, b_no);
				rs=pstmt.executeQuery();
				while(rs.next()){
					int r_no = rs.getInt("r_no");
					String b_code = rs.getString("b_code");
					String b_name = rs.getString("b_name");
					String b_author = rs.getString("b_author");
					String r_date = rs.getString("r_date");
					String r_score = rs.getString("r_score");
%>
					<tr>
						<td><%=b_code %></td>
						<td><a href =# onclick="window.open('memReportScoreDetail.jsp?r_no=<%=r_no%>', 'pop', 'width=800px, height=1000px, top=0, left=0 resizable=yes')"><%=b_name%></a></td>
						<td><%=b_author %></td>
						<td><%=r_date%></td>
						<td><%=r_score%></td>
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