<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원index</title>
<link rel = "stylesheet" href = "../css/mainPage.css"/>
</head>
<body>
	<%@include file = "../Menu/memHeader.jsp" %>
	<div id = "mainImg"></div>
	<div id = "contents">
		<div id = "slide_new">
		<h2>이달의 신간도서</h2>
		<hr>
	<% 
		pstmt = null;
		rs = null;
		
		try{
			String sql = "select b_image, b_date, b_name from book order by b_date";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				String b_image = rs.getString("b_image");
				String b_name = rs.getString("b_name");
	%>
			<img src = "/tomcatImg/<%=b_image%>">
	<%}%>
	<hr>
		</div>
		<div id = "links">	
			<ul>
				<li>
					<img src = "/tomcatImg/register.png" style = "width:100px ; height:100px;" onclick = "location.href='../class/memClassList.jsp'">
					<p>수강신청하러가기</p>
				</li>
				<li>
					<img src = "/tomcatImg/report.png" style = "width:100px ; height:100px;" onclick = "location.href='../report/memReportList.jsp'">
					<p>리포트작성하기</p>
				</li>
				<li>
					<img src = "/tomcatImg/books.png" style = "width:100px ; height:100px;" onclick = "location.href='../book/memBookList.jsp'">
					<p>전체도서보기</p>
				</li>
				<li>
					<img src = "/tomcatImg/free-icon-faq-5623413.png" style = "width:100px ; height:100px;" onclick = "location.href='../ask/memAskHome.jsp'">
					<p>문의하기</p>
				</li>
			</ul>
		</div>
		<div id = "slide_best">
		<h2>이달의 베스트도서</h2>
		<hr>
<% 
		sql = "select b_image, b_name from book order by b_count desc"; 
 			pstmt = conn.prepareStatement(sql); 
 			rs = pstmt.executeQuery(); 
 			while(rs.next()){ 
				String b_image = rs.getString("b_image"); 
				String b_name = rs.getString("b_name"); 
%>
 			<img src = "/tomcatImg/<%=b_image%>"> 
 		
		<%}}catch(Exception e){ e.printStackTrace();}finally{
			if(rs!=null)rs.close();
			if(pstmt != null)pstmt.close();
			if(conn !=null)conn.close();
		}
			%>
			<hr>
		</div>
	</div>
<script>
	var current = 0;  // 첫 번째 이미지
	showSlides();  // 기본적으로 첫 번째 이미지 표시
	showSlides_best();
	
	function showSlides() {
	  var slides_new = document.querySelectorAll("#slide_new > img");  
	  for (let i = 0; i < slides_new.length; i++) {
		  slides_new[i].style.display = "none"; // 모든 이미지 감춤
		 
	  }
	  current++; // 다음 이미지로 이동
	  if(current > slides_new.length)  current = 1;   // 첫 번째로 이동
	  slides_new[current - 1 ].style.display = "block";  // 현재 위치 이미지 표시
	  setTimeout(showSlides, 2000);
	}
	function showSlides_best() {
		  var slide_best = document.querySelectorAll("#slide_best > img");  
		  for (let i = 0; i < slide_best.length; i++) {
			  slide_best[i].style.display = "none"; // 모든 이미지 감춤
			 
		  }
		  current++; // 다음 이미지로 이동
		  if(current > slide_best.length)  current = 1;   // 첫 번째로 이동
		  slide_best[current - 1 ].style.display = "block";  // 현재 위치 이미지 표시
		  setTimeout(showSlides_best, 2000);
		}
	
</script>
	<%@ include file = "../Menu/footer.jsp"%>
</body>
</html>