<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>(회원용)도서검색</title>
<link rel = "stylesheet" href = "../css/report.css">
<script>
	function selectAll(selectAll)  {
		  const checkboxes 
		       = document.getElementsByName('report');
		  
		  checkboxes.forEach((checkbox) => {
		    checkbox.checked = selectAll.checked;
		  })
		}
	function del(){
		var conf = confirm("선택하신 리포트를 삭제하시겠습니까?");
		if(conf){
			reportfrm.submit();
		}
	}
</script>
</head>
<body>
	<%@include file="../Menu/adminHeader.jsp"%>
	<div class = "context">
		<div>
			<h2>리포트관리 검색결과</h2>
			<hr>
		</div>
	<%
		request.setCharacterEncoding("utf-8");
	
		String method = request.getParameter("method");
		String keyword = request.getParameter("keyword");
	%>
	<h3 class = "keyword"> '<%=keyword%>' 의 검색 결과 </h3>
	<form name = classfrm method = "post" action = "adminReportDelete.jsp">
		<table>
			<tr>
				<th><input type = checkbox name = "report" value = "selectAll" onclick="selectAll(this)"></th>
				<th width = "150px">리포트번호</th>
				<th width = "250px">도서명</th>
				<th width = "150px">저자</th>
				<th width = "150px">회사명</th>
				<th width = "150px">작성자</th>
				<th width = "150px">작성일</th>
				<th width = "150px">작성자IP</th>
				<th width = "100px">제출여부</th>
			</tr>
			<%
					int block = 5;	//페이지 묶음(block) 변수처리
					int currentBlock; // 현재블록
					int curPage;		//현재페이지
					int unit = 5;	//한 block당 보여질 레코드(행 갯수) 변수처리 
					String cPage = request.getParameter("cPage");	//현재페이지값을 파라메타로 받음
					if(cPage == null || cPage.length() == 0){				//첫페이지에는 파라메타 값이 null이므로 값 1을 넣어줌
						cPage = "1";
					}
					try{
						 curPage = Integer.parseInt(cPage);	//현재페이지값 정수변환
					}catch(Exception e){
						 curPage = 1; 
					}
					
					int idxNo = (curPage-1)*unit;	//0에서부터 원하는지점까지 가는 indexNo 변수처리
					currentBlock = curPage % block ==0 ? curPage / block : (curPage/block) +1;
					PreparedStatement pstmt = null;
				 	ResultSet rs= null;
					try{
						String sql = "select count(*) from report r join book b on r.b_no = b.b_no join member m on r.m_no = m.m_no join company c on m.c_code = c.c_code where " + method + " like ? group by r_no ";
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, "%" + keyword + "%");
						rs = pstmt.executeQuery();
						rs.next();
						int total = rs.getInt("count(*)"); //전체 데이터 갯수
						int totalPage = total%unit ==0? total/unit :(total/unit)+1;
						if(totalPage ==0){totalPage = 1;}
						int i = total- idxNo;	//listBook.jsp에서 보여지는 글번호
						int startPage = (currentBlock-1)*block+1; 
						int endPage = startPage + block -1;
						int lastPage = (int)Math.ceil((double)total/unit);
						if(endPage > totalPage)endPage = totalPage;
						try{
							sql = "select r.b_no, r.r_no, b.b_name, b.b_author, m.m_name, r.r_date, c.c_name, r.r_ip, r.r_done from report r join book b on r.b_no = b.b_no join member m on r.m_no = m.m_no join company c on m.c_code = c.c_code where " + method + " like ? ";
							pstmt = conn.prepareStatement(sql);
							pstmt.setString(1, "%" + keyword + "%");
							rs = pstmt.executeQuery();
							while(rs.next()){
								int b_no = rs.getInt("b_no");
								int r_no = rs.getInt("r_no");
								String b_name = rs.getString("b_name");
								String b_author = rs.getString("b_author");
								String m_name = rs.getString("m_name");
								String r_date = rs.getString("r_date");
								String c_name = rs.getString("c_name");
								String r_ip = rs.getString("r_ip");
								String r_done = rs.getString("r_done");
%>
					<tr>
						<td><input type = "checkbox" name = "choice" value = "<%=r_no%>"></td>
						<td><%=i %></td>
						<td><a href = # onclick = "window.open('adminReportDetail.jsp?r_no=<%=r_no%>&b_no=<%=b_no %>', 'pop', 'width=800px, height=1000px, top=0, left=0 resizable=yes')"><%=b_name %></a></td>
						<td><%=b_author %></td>
						<td><%=c_name %></td>
						<td><%=m_name %></td>
						<td><%=r_date %></td>
						<td><%=r_ip %></td>
						<td><%=r_done %></td>
					</tr>
					<%
			i--;}
				}catch(Exception e){e.printStackTrace();}finally{}%>	
			</table>
		<input type = "button" value = "선택삭제하기" onclick="del()" class = "but">
	</form>
	<div class = "page" style="text-align: center; margin-top: 10px;">
		<ul class = "justify-content-center">
			<%if(startPage == 1 ){%>
			<li class = "page-item disable"><a class = "page-link" href = "#" tabindex ="-1" aria-disabled="true">Previous</a></li>
			<%}else{%>
			<li class = "page-item"><a class = "page-link" href="adminReportScore.jsp?cPage=<%=startPage-1%>" tabindex="-1" aria-disabled="true">Previous</a></li>
			<%}%>
			<%for(int p = startPage;p<=endPage;p++){ %>
			<li class = "page-item">
				<a class = "page-link" href = "adminReportScore.jsp?cPage=<%=p%>"><%=p %></a></li>
			<%}%>
			<%if(totalPage == endPage){ %>
			<li class = "page-item disabled"><a class = "page-link" href ="#">Next</a></li>
			<%}else{ %>
			<li class = "page-item">
				<a class = "page-link" href = "adminReportScore.jsp?cPage=<%=endPage+1%>">Next</a>
			</li>
			<%} %>
		</ul>
<%
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				if(rs!=null)rs.close();
				if(pstmt != null)pstmt.close();
				if(conn !=null)conn.close();
			}
%>	
	</div>
		<a href="adminReportScore.jsp" class="backList">목록가기</a>
	</div>
	<%@include file = "../Menu/footer.jsp" %>
	
</body>
</html>