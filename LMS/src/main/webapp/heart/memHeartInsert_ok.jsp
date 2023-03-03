<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../config/dbconn.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>찜하기</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		
		String m_id = request.getParameter("m_id");
		String b_no = request.getParameter("b_no");
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			String sql = "select m_no from member where m_id =?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m_id);
			rs=pstmt.executeQuery();
			if(rs.next()){
				String m_no = rs.getString("m_no");
				sql = "insert into heart(m_no, b_no) values (?,?)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, m_no);
				pstmt.setString(2, b_no);
				pstmt.executeUpdate();
				sql = "update book set b_count = b_count+1 where b_no =?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, b_no);
				pstmt.executeUpdate();
				
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(rs!=null)rs.close();
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
		%>
		<script>
			var conf = confirm("찜하기목록에 추가 되었습니다. 목록을 확인하시겠습니까?");
			if(conf){
				window.close();
				opener.location.href = "memHeartList.jsp?m_id=<%=m_id%>";
			}else{
				history.back();
			}
			
		</script>

</body>
</html>