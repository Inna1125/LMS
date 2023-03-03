<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색어 찾기</title>
<link rel = "stylesheet" href = "../css/company.css">
<style>

</style>
<script>
	function del(){
		var conf = confirm("선택하신 회사를 삭제하시겠습니까? 삭제시 소속되어있는 회원과 리포트가 자동 삭제처리 됩니다.");
		if(conf){
			comfrm.submit();
		}
</script>
</head>
<body>
	<%@include file="../Menu/adminHeader.jsp"%>
	<div class = "context">
		<h2>회사검색</h2>
		<hr>
	<%
		request.setCharacterEncoding("utf-8");
	
		String method = request.getParameter("method");
		String keyword = request.getParameter("keyword");
	%>
	<h3 class="keyword">'<%=keyword%>' 의 검색 결과</h3>
	<form method = "post" name = "comfrm" action = "adminComDelete.jsp">
	<table>
		<tr>
			<th></th>
			<th width = "150px">번호</th>
			<th width = "250px">회사명</th>
			<th width = "150px">교육인원</th>
		</tr>
		<%
		int block = 5; //페이지 묶음(block) 변수처리
		int currentBlock; // 현재블록
		int curPage; //현재페이지
		int unit = 5; //한 block당 보여질 레코드(행 갯수) 변수처리 
		String cPage = request.getParameter("cPage"); //현재페이지값을 파라메타로 받음
		if (cPage == null || cPage.length() == 0) { //첫페이지에는 파라메타 값이 null이므로 값 1을 넣어줌
			cPage = "1";
		}
		try {
			curPage = Integer.parseInt(cPage); //현재페이지값 정수변환
		} catch (Exception e) {
			curPage = 1;
		}
		int idxNo = (curPage - 1) * unit; //0에서부터 원하는지점까지 가는 indexNo 변수처리
		currentBlock = curPage % block == 0 ? curPage / block : (curPage / block) + 1;

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select count(*) from company where " + method + " LIKE ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, "%" + keyword + "%");
		rs = pstmt.executeQuery();
		rs.next();
		int total = rs.getInt(1); //전체 데이터 갯수
		int totalPage = total % unit == 0 ? total / unit : (total / unit) + 1;
		if (totalPage == 0) {
			totalPage = 1;
		}
		int i = total - idxNo; //listNotice.jsp에서 보여지는 글번호
		int startPage = (currentBlock - 1) * block + 1;
		int endPage = startPage + block - 1;
		int lastPage = (int) Math.ceil((double) total / unit);
		if(endPage > totalPage)endPage = totalPage;
		try {
			sql = "select c.c_code, c.c_name, ifnull(c_count,0) as c_count from company c left outer join (select c_code, count(*) as c_count from member group by c_code) as m on c.c_code = m.c_code where "+method+" like ? limit "+idxNo+","+unit;
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + keyword + "%");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String c_code = rs.getString("c_code");
				String c_name = rs.getString("c_name");
				String c_count = rs.getString("c_count");
		%>
		<tr>
			<td><input type = "checkbox" name = "choice" value = "<%=c_code%>"></td>
			<td><%=i%></td>
			<td><a href = # onclick = "window.open('adminComDetail.jsp?c_code=<%=c_code%>', 'pop', 'width=600, height=900, top=0, left=0 resizable=yes')"><%=c_name%></a></td>
			<td><%=c_count%></td>	
		</tr>
		<%
			i--;
		}
		} catch (Exception e) {
		e.printStackTrace();
		} finally {
				if (rs != null)rs.close();
				if (pstmt != null)pstmt.close();
				if (conn != null)conn.close();
		}
		%>
	</table>
		<input type = "button" name = "choice" onclick = "del()" value = "선택삭제" class = "but">
	</form>
	<div style="width: 600px; text-align: center; margin-top: 10px;">
		<ul class = "justify-content-center">
			<%if(startPage == 1 ){%>
			<li class = "page-item disable"><a class = "page-link" href = "#" tabindex ="-1" aria-disabled="true">Previous</a></li>
			<%}else{%>
			<li class = "page-item"><a class = "page-link" href="comSearch_ok.jsp?cPage=<%=startPage-1%>&method=<%=method%>&keyword=<%=keyword%>" tabindex="-1" aria-disabled="true">Previous</a></li>
			<%}%>
			<%for(int p = startPage;p<=endPage;p++){ %>
			<li class = "page-item">
				<a class = "page-link" href = "comSearch_ok.jsp?cPage=<%=p%>&method=<%=method%>&keyword=<%=keyword%>"><%=p %></a></li>
			<%}%>
			<%if(totalPage == endPage){ %>
			<li class = "page-item disabled"><a class = "page-link" href ="#">Next</a></li>
			<%}else{ %>
			<li class = "page-item">
				<a class = "page-link" href = "comSearch_ok.jsp?cPage=<%=endPage+1%>&method=<%=method%>&keyword=<%=keyword%>">Next</a>
			</li>
			<%} %>
		</ul>
	</div>
		<a href="adminComList.jsp" class="backList">목록가기</a>
	</div>
		<%@include file = "../Menu/footer.jsp" %>
</body>
</html>