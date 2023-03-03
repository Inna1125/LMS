<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질문확인하기</title>
<link rel = "stylesheet" href = "../css/ask.css">
</head>
<body>
<%@include file = "../Menu/memHeader.jsp" %>
	<div class = "askfrm">
		<fieldset class = "writefield">
			<legend>회원용 문의내역</legend>
				<table class = "writefrm">
					<tr>
						<th class = "label" width = "150px" style = "padding-bottom :20px; font-size:15pt;">번호</th>
						<th class = "label"  width = "350px" style = "padding-bottom :20px; font-size:15pt;">분류</th>
						<th class = "label"  width = "350px" style = "padding-bottom :20px; font-size:15pt;">제목</th>
						<th class = "label"  width = "150px" style = "padding-bottom :20px; font-size:15pt;">게시날짜</th>
						<th class = "label"  width = "150px" style = "padding-bottom :20px; font-size:15pt;">회원명</th>
						<th class = "label"  width = "150px" style = "padding-bottom :20px; font-size:15pt;">관리자명</th>
					</tr>
						<%
							m_id = (String)session.getAttribute("m_id");
						
							pstmt = null;
							rs = null;
							int i  = 1;
							try{
								String sql = "select a.a_no, a.a_category, a.a_title, a.a_date, m.m_name, a.ad_id from ask a join member m on a.m_no=m.m_no where m_id =? and a_repNo is null";
								pstmt = conn.prepareStatement(sql);
								pstmt.setString(1,m_id);
								rs = pstmt.executeQuery();
								while(rs.next()){
									String a_no = rs.getString("a_no");
									String a_category = rs.getString("a_category");
									String a_title = rs.getString("a_title");
									String a_date = rs.getString("a_date");
									String m_name = rs.getString("m_name");
									String ad_id = rs.getString("ad_id");
						%>
					<tr>
						<td class = "list"><%=i %></td>
						<td class = "list"><%=a_category %></td>
						<td class = "list"><a href = "memAskEnterCheck.jsp?a_no=<%=a_no%>"><%=a_title %></a></td>
						<td class = "list"><%=a_date %></td>
						<td class = "list"><%=m_name %></td>
						<%if(ad_id==null){ %><td class = "list"></td>
						<%}else{ %><td class = "list"><%=ad_id %></td><%} %>
					</tr>		
				<%			
					i++;	
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
<%@include file = "../Menu/footer.jsp" %>
</body>
</html>