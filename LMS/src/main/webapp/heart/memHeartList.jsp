<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>(회원용)찜하기목록</title>
<link rel = "stylesheet" href = "../css/heart.css">
</head>
<body>
	<%@include file = "../Menu/memHeader.jsp" %>
	<div class = "context">
		<h2>찜하기 목록</h2>
		<hr>
	<form name = "heartfrm" method = "get" action = "memHeartDelete_ok.jsp">
	<table class = "heartfrm">
		<tr>
			<th width = "150px;">선택</th>
			<th width = "200px;">도서코드</th>
			<th width = "350px;">도서명</th>
			<th width = "150px;">저자</th>
			<th width = "150px;">출판사</th>
		</tr>
		<%		
			pstmt = null;
		 	rs= null;
		 	m_id = request.getParameter("m_id");
		 	try{
		 		String sql = "select m_no from member where m_id =?";
		 		pstmt = conn.prepareStatement(sql);
		 		pstmt.setString(1, m_id);
		 		rs=pstmt.executeQuery();
		 		if(rs.next()){
		 			String m_no = rs.getString("m_no");
					try{
						sql = "select h.h_no,h.b_no, b.b_code, b.b_name, b.b_author, b.b_pub from heart h join book b on h.b_no = b.b_no where h.m_no = ? order by h.h_no desc";
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, m_no);
						rs = pstmt.executeQuery();
						while(rs.next()){
							int h_no = rs.getInt("h_no");
							int b_no = rs.getInt("b_no");
							String b_code = rs.getString("b_code");
							String b_name = rs.getString("b_name");
							String b_author = rs.getString("b_author");
							String b_pub = rs.getString("b_pub");
		
		%>
		<tr>
			<td style = "padding:10px;"><input type = "radio" name="choice" value = "<%=b_no%>"><input type = "hidden" name = "h_no" value="<%=h_no %>"> </td>
			<td style = "padding:10px;"><%=b_code %></td>
			<td style = "padding:10px;"><%=b_name %></td>
			<td style = "padding:10px;"><%=b_author%></td>
			<td style = "padding:10px;"><%=b_pub%></td>
		</tr>
		<script>
			function del(){
					if(!heartfrm.choice.value){
						alert("선택한 도서가 없습니다.");
					}else{
						var conf = confirm("선택하신도서를 삭제하시겠습니까?");
						if(conf){
							heartfrm.submit();
						}
				}
			}
			function reg(){
				var conf = confirm("선택하신도서를 수강신청하시겠습니까?");
				if(conf){
					location.href = "../class/memClassInsert.jsp?m_no=<%=m_no%>&choice=<%=b_no%>";
				}
			}
		</script>
		<%
						}
					}catch(Exception e){e.printStackTrace();}
					finally{}
				 		}
					}catch(Exception e){
							e.printStackTrace();
					}finally{
						if(rs!=null)rs.close();
						if(pstmt != null)pstmt.close();
						if(conn !=null)conn.close();
					}
					%>
	</table>
		<div class = "butArea">
		<input type = "button" value = "찜하기 취소" onclick = "del()" class = "but">
		<input type = "button" value = "수강신청하기" onclick = "reg()" class = "but">
		</div>
	</form>
	</div>
	<%@include file = "../Menu/footer.jsp" %>

</body>
</html>