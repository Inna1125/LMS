<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강신청확인하기</title>
<link rel = "stylesheet" href = "../css/class.css">
	<script>
	function del(){
		if(confirmfrm.choice.value){
			var conf = confirm("선택하신도서를 삭제하시겠습니까?");
			if(conf){
				confirmfrm.submit();
			}
		}
	}
	</script>
</head>
<%@include file = "../Menu/memHeader.jsp" %>
<body>
	<div class = "context">
		<fieldset>
			<legend>현재수강목록</legend>
		<form method = "get" name = "confirmfrm" action = "memClassDelete.jsp">
			<table>
				<tr>
					<th width = "200px">도서코드</th>
					<th width = "150px">도서이미지</th>
					<th width = "350px">도서명</th>
					<th width = "150px">저자</th>
					<th width = "150px">출판일</th>
					<th width = "150px">선택</th>
				</tr>
<%
					m_id = (String)session.getAttribute("m_id");
					pstmt = null;
					rs = null;
					
					try{
						String sql = "select m_no from member where m_id =?";
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, m_id);
						rs = pstmt.executeQuery();
						if(rs.next()){
							int m_no = rs.getInt("m_no");
							sql = "select cl.cl_no, cl.cl_done, b.b_code, b.b_image, b.b_name, b.b_author, b.b_date from class cl join book b on cl.b_no = b.b_no where m_no =?";
							pstmt = conn.prepareStatement(sql);
							pstmt.setInt(1, m_no);
							rs=pstmt.executeQuery();
							while(rs.next()){
								int cl_no = rs.getInt("cl_no");
								String cl_done = rs.getString("cl_done");
								String b_code = rs.getString("b_code");
								String b_image = rs.getString("b_image");
								String b_name = rs.getString("b_name");
								String b_author = rs.getString("b_author");
								String b_date = rs.getString("b_date");
								if(cl_done.equals("n")||cl_done.equals("n")){ %>
						<tr>
							<td><%=b_code %></td>
							<td><img src ="/tomcatImg/<%=b_image%>" style = "width:80px; height:110px;"/></td>
							<td><%=b_name %></td>
							<td><%=b_author %></td>
							<td><%=b_date %><input type = "hidden" name = "cl_no" value = "<%=cl_no%>"></td>
							<td><input type = "radio" name = "choice" value ="b_code"></td>
						</tr>
						
<%					
						}}}}catch(Exception e){e.printStackTrace();}finally{}
%>					
					</table>
					<input type = "button" class = "but" value = "선택삭제하기" onclick="del()">
				</form>
					</fieldset>
					
		<fieldset>
			<legend>지난수강목록</legend>
		<div>
			<table>
				<tr>
					<th width = "200px">도서코드</th>
					<th width = "150px">도서이미지</th>
					<th width = "350px">도서명</th>
					<th width = "150px">저자</th>
					<th width = "150px">출판일</th>
					<th width = "150px">선택</th>
				</tr>
	<%
					m_id = (String)session.getAttribute("m_id");
					pstmt = null;
					rs = null;
					
					try{
						String sql = "select m_no from member where m_id =?";
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, m_id);
						rs = pstmt.executeQuery();
						if(rs.next()){
							int m_no = rs.getInt("m_no");
							sql = "select cl.cl_no, cl.cl_done, b.b_code, b.b_image, b.b_name, b.b_author, b.b_date from class cl join book b on cl.b_no = b.b_no where m_no =?";
							pstmt = conn.prepareStatement(sql);
							pstmt.setInt(1, m_no);
							rs=pstmt.executeQuery();
							while(rs.next()){
								int cl_no = rs.getInt("cl_no");
								String cl_done = rs.getString("cl_done");
								String b_code = rs.getString("b_code");
								String b_image = rs.getString("b_image");
								String b_name = rs.getString("b_name");
								String b_author = rs.getString("b_author");
								String b_date = rs.getString("b_date");
								
	%>
						<%if(cl_done.equals("y")||cl_done.equals("Y")){ %>
						<tr>
							<td><%=b_code %></td>
							<td><img src ="/tomcatImg/<%=b_image%>" style = "width:80px; height:110px;"/></td>
							<td><%=b_name %></td>
							<td><%=b_author %></td>
							<td><%=b_date %></td>
						</tr>
<%				}}}}catch(Exception e){
							e.printStackTrace();
							}finally{
								if(rs!=null)rs.close();
								if(pstmt != null)pstmt.close();
								if(conn !=null)conn.close();
							}	
					%>
					</table>
					</div>
			</fieldset>
	</div>
<%@include file = "../Menu/footer.jsp" %>
</body>
</html>