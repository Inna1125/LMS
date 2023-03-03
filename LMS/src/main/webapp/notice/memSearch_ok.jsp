<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색어 찾기</title>
<link rel="stylesheet" href="../css/notice.css" />
</head>
<body>
	<%@include file="../Menu/memHeader.jsp"%>
	<div class = "context">
		<h2>공지 검색결과</h2>
		<hr>
	<%
		request.setCharacterEncoding("utf-8");
	
		String method = request.getParameter("method");
		String keyword = request.getParameter("keyword");
	%>
	<h3 class = "keyword">'<%=keyword%>' 의 검색 결과</h3>
	<table class = "noticefrm">
		<tr>
			<th width = "150px">글번호</th>
			<th width = "400px">제목</th>
			<th width = "150px">작성자</th>
			<th width = "150px">조회수</th>
			<th width = "150px">작성일</th>
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

		pstmt = null;
		rs = null;

		String sql = "select count(*) from notice where " + method + " LIKE ?";
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
			sql = "select n_no, n_title, ad_id, n_readNo, date_format(n_date, '%Y.%m.%d') as n_date from notice where " + method
			+ " LIKE ? order by n_no desc limit " + idxNo + "," + unit;
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + keyword + "%");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int n_no = rs.getInt("n_no");
				String n_title = rs.getString("n_title");
				String ad_id = rs.getString("ad_id");
				int n_readNo = rs.getInt("n_readNo");
				String n_date = rs.getString("n_date");
		%>
		<tr>
			<td><%=i%></td>
			<td><a href="detailNotice.jsp?n_no=<%=n_no%>"><%=n_title%></a></td>
			<td><%=ad_id%></td>
			<td><%=n_readNo%></td>
			<td><%=n_date%></td>
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
	<div style="text-align: center; margin-top: 10px;" class = "page">
		<ul class = "justify-content-center">
			<%if(startPage == 1 ){%>
			<li class = "page-item disable"><a class = "page-link" href = "#" tabindex ="-1" aria-disabled="true">Previous</a></li>
			<%}else{%>
			<li class = "page-item"><a class = "page-link" href="memSearch_ok.jsp?cPage=<%=startPage-1%>&method=<%=method%>&keyword=<%=keyword%>" tabindex="-1" aria-disabled="true">Previous</a></li>
			<%}%>
			<%for(int p = startPage;p<=endPage;p++){ %>
			<li class = "page-item">
				<a class = "page-link" href = "memSearch_ok.jsp?cPage=<%=p%>&method=<%=method%>&keyword=<%=keyword%>"><%=p %></a></li>
			<%}%>
			<%if(totalPage == endPage){ %>
			<li class = "page-item disabled"><a class = "page-link" href ="#">Next</a></li>
			<%}else{ %>
			<li class = "page-item">
				<a class = "page-link" href = "memSearch_ok.jsp?cPage=<%=endPage+1%>&method=<%=method%>&keyword=<%=keyword%>">Next</a>
			</li>
			<%} %>
		</ul>
		</div>
		<a href="memListNotice.jsp" class="backList">목록가기</a>
	</div>
		<%@include file = "../Menu/footer.jsp" %>
</body>
</html>