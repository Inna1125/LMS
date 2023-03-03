<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색어 찾기</title>
<script>
		function check(){
			if(!search.method.value){
				alert("검색방법을 선택하세요");
				return false;
			}
			if(!search.keyword.value){
				alert("검색어를 입력하세요");
				return false;
			}
			search.submit();
	
		}
		function del(){
			var conf = confirm("선택하신 회원을 삭제하시겠습니까?");
			if(conf){
				memfrm.submit();
			}
		}
</script>
<link rel = "stylesheet" href = "../css/member.css">
</head>
<body>
	<%@include file="../Menu/memHeader.jsp"%>
	<div class = "content">
		<h2>회원검색목록</h2>
		<hr>
	<%
		request.setCharacterEncoding("utf-8");
	
		String method = request.getParameter("method");
		String keyword = request.getParameter("keyword");
	%>
	<h3 class="keyword">'<%=keyword%>' 의 검색 결과</h3>
	<form method = "post" name = "memfrm" action = "adminMemDelete.jsp"  class = "memList">
	<table width = "1200px">
		<tr>
			<th width = "50px"></th>
			<th width = "150px">이름</th>
			<th width = "150px">소속회사명</th>
			<th width = "150px">부서명</th>
			<th width = "150px">직위</th>
			<th width = "200px">연락처</th>
			<th width = "150px">수강횟수</th>
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

		String sql = "select count(*) from member where " + method + " LIKE ?";
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
			sql = "select m.m_no, m.m_name, c.c_name,m.m_dept, m.m_position, m.m_phone, m.m_count from member m join company c on m.c_code = c.c_code where "+method+" like ? order by m_no desc limit "+idxNo+","+unit;
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + keyword + "%");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int m_no = rs.getInt("m_no");
				String m_name = rs.getString("m_name");
				String c_name = rs.getString("c_name");
				String m_dept = rs.getString("m_dept");
				String m_position = rs.getString("m_position");
				String m_phone = rs.getString("m_phone");
				int m_count = rs.getInt("m_count");
		%>
		<tr>
			<td><input type = "checkbox" name = "choice" value = "<%=m_no%>"></td>
			<td><a href = # onclick = "window.open('adminMemDetail.jsp?m_no=<%=m_no%>', 'pop', 'width=600, height=900, top=0, left=0 resizable=yes')"><%=m_name%></a></td>
			<td><%=c_name%></td>
			<td><%=m_dept%></td>
			<td><%=m_position%></td>
			<td><%=m_phone%></td>
			<td><%=m_count%></td>
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
		<div class = "butArea">
			<input type = "button" value = "선택삭제" onclick = "del()" class = "but">  
			<input type = "button" value = "회원추가" class = "but" onclick = "window.open('adminMemInsert.jsp', 'pop', 'width=800px, height=1000px, top=0, left=0 resizable=yes')">
		</div>
	</form>
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
		<a href="adminMemList.jsp" class="backList">목록가기</a>
	</div>
		<%@include file = "../Menu/footer.jsp" %>
</body>
</html>