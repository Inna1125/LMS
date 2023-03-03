<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../config/dbconn.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강신청하기</title>
</head>
<body>
	<%
			request.setCharacterEncoding("UTF-8");
		
			String m_id = (String)session.getAttribute("m_id");
			PreparedStatement pstmt = null;
			ResultSet rs = null;
				try{
					String b_no = request.getParameter("choice");
					if(b_no==null||b_no==""){
						b_no = request.getParameter("b_no");
						String sql = "select m.m_no, m.m_countY, m.m_countM, c.c_countY, c.c_countM from member m join company c on c.c_code=m.c_code where m_id =?";
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1,m_id);
						rs = pstmt.executeQuery();
						if(rs.next()){
							String m_no = rs.getString("m_no");
							int m_countY = rs.getInt("m_countY");
							int m_countM = rs.getInt("m_countM");
							int c_countY = rs.getInt("c_countY");
							int c_countM = rs.getInt("c_countM");
						if(m_countY<c_countY&&m_countM<c_countM){
							sql = "insert into class(b_no, m_no) values (?,?)";
							pstmt = conn.prepareStatement(sql);
							pstmt.setString(1, b_no);
							pstmt.setString(2,m_no);
							pstmt.executeUpdate();
							sql = "update member set m_countY = m_countY+1, m_countM = m_countM+1 where m_no =?";
							pstmt = conn.prepareStatement(sql);
							pstmt.setString(1,m_no);
							pstmt.executeUpdate();
							sql = "insert into report(r_date, r_score, b_no, m_no, r_done) values (sysdate(),0,?,?,'n')";
							pstmt = conn.prepareStatement(sql);
							pstmt.setString(1, b_no);
							pstmt.setString(2, m_no);	
							pstmt.executeUpdate();
							%>
						<script>
							alert("선택하신 도서가 수강신청 되었습니다.");
							opener.location.href = "memClassConfirm.jsp";
							window.close();	
						</script>
						<%}else{%>
						<script>
							alert("수강가능횟수를 초과했습니다. 자세한 사항은 질문게시판으로 문의주세요");
							history.back();
						</script>
							
				<%}
						}}else{
						String sql = "select m.m_no, m.m_countY, m.m_countM, c.c_countY, c.c_countM from member m join company c on c.c_code=m.c_code where m_id =?";
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1,m_id);
						rs = pstmt.executeQuery();
						if(rs.next()){
							String m_no = rs.getString("m_no");
							int m_countY = rs.getInt("m_countY");
							int m_countM = rs.getInt("m_countM");
							int c_countY = rs.getInt("c_countY");
							int c_countM = rs.getInt("c_countM");
						if(m_countY<c_countY&&m_countM<c_countM){
							sql = "insert into class(b_no, m_no) values (?,?)";
							pstmt = conn.prepareStatement(sql);
							pstmt.setString(1, b_no);
							pstmt.setString(2,m_no);
							pstmt.executeUpdate();
							sql = "update member set m_countY = m_countY+1, m_countM = m_countM+1 where m_no =?";
							pstmt = conn.prepareStatement(sql);
							pstmt.setString(1,m_no);
							pstmt.executeUpdate();
							sql = "insert into report(r_date, r_score, b_no, m_no, r_done) values (sysdate(),0,?,?,'n')";
							pstmt = conn.prepareStatement(sql);
							pstmt.setString(1, b_no);
							pstmt.setString(2, m_no);	
							pstmt.executeUpdate();
							%>
						<script>
							alert("선택하신 도서가 수강신청 되었습니다.");
							location.href = "memClassConfirm.jsp";
						</script>
						<%}else{%>
						<script>
							alert("수강가능횟수를 초과했습니다. 자세한 사항은 질문게시판으로 문의주세요");
							history.back();
						</script>
						<%
							}
						}}}catch(Exception e){
						e.printStackTrace();
					}finally{
						if(pstmt != null) pstmt.close();
						if(conn != null) conn.close();
					}
		%>
</body>
</html>