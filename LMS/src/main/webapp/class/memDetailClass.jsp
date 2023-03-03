<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../config/dbconn.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>(회원용)도서자세히</title>
<link rel = "stylesheet" href = "../css/class.css">
</head>
<body>
<div class = "detail">
	<%
		request.setCharacterEncoding("UTF-8");
		
		String m_id = (String)session.getAttribute("m_id");
		String b_no = request.getParameter("b_no");
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try{
			String sql = "select b_no, b_code, b_name, b_author, b_pub, b_date, b_price, b_pageNo, b_desc, b_index, b_comment, b_image, b_categoryF, b_categoryS, b_regDate, b_purpose from book where b_no =?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, b_no);
			rs = pstmt.executeQuery();
			if(rs.next()){
				b_no = rs.getString("b_no");
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
	<form method = "post" name = "bookfrm" enctype = "multipart/form-data" action = "memClassInsert.jsp?b_no=<%=b_no%>&m_id=<%=m_id%>">
			<fieldset>
				<table>
				<tr>
					<td class = "label">도서코드</td>
					<td><input type = "text" name = b_code class = "inText" value = "<%=b_code %>" readonly></td>
				</tr>
				<tr>
					<td class = "label">도서명</td>
					<td><input type = "text" name = "b_name" class = "inText" value = "<%=b_name %>" readonly></td>
				</tr>
				<tr>
					<td class = "label">저자</td>
					<td><input type = "text" name = "b_author" class = "inText" value = "<%=b_author %>" readonly></td>
				</tr>
				<tr>
					<td class = "label">출판사</td>
					<td><input type = "text" name = "b_pub" class = "inText" value = "<%=b_pub %>" readonly></td>
				</tr>
				<tr>
					<td class = "label">출판일</td>
					<td><input type = "text" name = "b_date" class = "inText" value = "<%=b_date %>" readonly></td>
				</tr>
				<tr>
					<td class = "label">정상가격</td>
					<td><input type = "text" name = "b_price" class = "inText" value = "<%=b_price %>" readonly></td>
				</tr>
				<tr>
					<td class = "label">페이지 수</td>
					<td><input type = "text" name = "b_pageNo" class = "inText" value = "<%=b_pageNo %>" readonly></td>
				</tr>
				<tr>
					<td class = "label">도서소개</td>
					<td><textarea rows="10" cols="40" name = "b_desc" class="texta" onchange="changeEduPurpose(this.value)" readonly><%=b_desc %></textarea></td>
				</tr>
				<tr>
					<td class = "label">도서목차/내용</td>
					<td><textarea rows="10" cols="40" name = "b_index" class="texta" readonly><%=b_index %></textarea></td>
				</tr>
				<tr>
					<td class = "label">출판서평</td>
					<td><textarea rows="10" cols="40" name = "b_comment" class="texta" readonly><%=b_comment %></textarea></td>
				</tr>
				<tr>
					<td class = "label">도서이미지</td>
					<td><img src = "/tomcatImg/<%=b_image%>" style="width:170px;height:250px"/></td>
				</tr>
				<tr>
					<td class = "label">대분류 : <%=b_categoryF %></td>
					<td class = "label">소분류 :<%=b_categoryS %></td>
				</tr>
				<tr>
					<td class = "label">학습목적</td>
					<td><textarea rows="10" cols="40" name = "b_purpose" class="texta" readonly><%=b_purpose %></textarea></td>
				</tr>
				</table>
				</fieldset>
	<%			}
		}catch(Exception e){
					e.printStackTrace();
				}finally{
					if(rs!=null)rs.close();
					if(pstmt!=null)pstmt.close();
					if(conn!=null)conn.close();
					}
	%>	
				<p><input type = "button" onclick = "window.close()" value = "닫기" class = "but">
				<%if(((String)session.getAttribute("m_id")).equals("admin")){ %>
					<input type = "button" onclick = "location.href='adminEditBook.jsp?b_no=<%=b_no%>'" class = "but" value = "수정하기">
				<%}else{%>
					<input type = "submit" value = "수강신청하기" class = "but">
				<%}%>	
			</form>
		</div>
</body>
</html>