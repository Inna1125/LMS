<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>(회원용)도서목록</title>
<link rel="stylesheet" href="../css/booklist.css" />
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
		function selectAll(selectAll)  {
			  const checkboxes 
			       = document.getElementsByName('book');
			  
			  checkboxes.forEach((checkbox) => {
			    checkbox.checked = selectAll.checked;
			  })
			}
		function del(){
			var conf = confirm("선택하신 도서를 삭제하시겠습니까?");
			if(conf){
				bookfrm.submit();
			}
		}
		
</script>
</head>
<body>
	<%@include file = "../Menu/memHeader.jsp" %>
	<div class = "context">
		<h2>도서목록</h2>
		<hr>
	<div class = "searchfrm">
	<form name = "search" method = "get" action = "memSearch_ok.jsp">
		<select name = "method">
			<option value = "">선택하세요.</option>
			<option value = "b_name">도서명</option>
			<option value = "b_author">저자명</option>
			<option value = "b_pub">출판사</option>
		</select>
		<input type = "text" name = "keyword" placeholder = "검색어를 입력하세요">
		<input type = "button" value = "검색" onclick = "check()">
	</form>
	</div>
	<form name = "bookfrm" method="get" action = "adminDeleteBook.jsp">
	<table>
		<tr>
			<%if(((String)session.getAttribute("m_id")).equals("admin")){ %>
			<th><input type = checkbox name = "book" value = "selectAll" onclick="selectAll(this)"></th>
			<%} %>
			<th width = "150px">글번호</th>
			<th width = "150px">도서코드</th>
			<th width = "150px">도서이미지</th>
			<th width = "350px">도서명</th>
			<th width = "150px">출판일</th>
			<th width = "150px">도서가격</th>
			<th width = "150px">출판사</th>
			<th width = "150px">등록일</th>
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
			pstmt = null;
		 	rs= null;
		 	try{		
			 	String sql = "select count(*) from book";
			 	pstmt = conn.prepareStatement(sql);
			 	rs = pstmt.executeQuery();
				rs.next();
				int total = rs.getInt(1); //전체 데이터 갯수
				int totalPage = total%unit ==0? total/unit :(total/unit)+1;
				if(totalPage ==0){totalPage = 1;}
				int i = total- idxNo;	//listBook.jsp에서 보여지는 글번호
				int startPage = (currentBlock-1)*block+1; 
				int endPage = startPage + block -1;
				int lastPage = (int)Math.ceil((double)total/unit);
				if(endPage > totalPage)endPage = totalPage;
			try{

				sql = "select b_no, b_code,b_image, b_name, date_format(b_date,'%Y.%m.%d')as b_date, b_price, b_pub, date_format(b_regDate,'%Y.%m.%d')as b_regDate from book order by b_no desc limit "+idxNo+"," + unit;
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()){
					int b_no = rs.getInt("b_no");
					String b_code = rs.getString("b_code");
					String b_image = rs.getString("b_image");
					String b_name = rs.getString("b_name");
					String b_date = rs.getString("b_date");
					int b_price = rs.getInt("b_price");
					String b_pub = rs.getString("b_pub");
					String b_regDate = rs.getString("b_regDate");
					
		%>
		<tr>
			<%if(((String)session.getAttribute("m_id")).equals("admin")){ %>
			<td><input type = "checkbox" name = "book" value = "<%=b_no%>">
			<%} %>
			<td><%=i%></td>
			<td><%=b_code %></td>
			<td><img src = "/tomcatImg/<%=b_image%>" style = "width:80px; height:110px;"></td>
			<td><a href = # onclick = "window.open('memDetailBook.jsp?b_no=<%=b_no%>', 'pop','width=600, height=900, top=0, left=0 resizable=yes')"><%=b_name %></a></td>
			<td><%=b_date%></td>
			<td><%=b_price%></td>
			<td><%=b_pub%></td>
			<td><%=b_regDate%></td>
		</tr>
		<%
			i--;}
				}catch(Exception e){e.printStackTrace();}finally{}%>
	</table>
	</form>
	<div style = "width: 100%;
    display: flex;
    align-items: center;
    justify-content: center;">
	<div class = "page" style="width: 600px; text-align: center; margin-top: 10px;">
		<ul class = "justify-content-center">
			<%if(startPage == 1 ){%>
			<li class = "page-item disable"><a class = "page-link" href = "#" tabindex ="-1" aria-disabled="true">Previous</a></li>
			<%}else{%>
			<li class = "page-item"><a class = "page-link" href="memBookList.jsp?cPage=<%=startPage-1%>" tabindex="-1" aria-disabled="true">Previous</a></li>
			<%}%>
			<%for(int p = startPage;p<=endPage;p++){ %>
			<li class = "page-item">
				<a class = "page-link" href = "memBookList.jsp?cPage=<%=p%>"><%=p %></a></li>
			<%}%>
			<%if(totalPage == endPage){ %>
			<li class = "page-item disabled"><a class = "page-link" href ="#">Next</a></li>
			<%}else{ %>
			<li class = "page-item">
				<a class = "page-link" href = "memBookList.jsp?cPage=<%=endPage+1%>">Next</a>
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
	</div>
	</div>
	<div style = "display: flex;
    justify-content: center;
    align-items: center;
    flex-wrap: wrap;
    flex-direction: row;
    align-content: space-around;
    background-color:#1F1F1F;">
		<%if(((String)session.getAttribute("m_id")).equals("admin")){ %>
			<p><input type = "button" value = "등록하기" class ="adminBut" onclick="window.open('adminInsertBook.jsp','popfrm','width=600, height=900, top=0, left=0 resizable=yes')"></p>
			<p><input type = "button" value = "선택삭제" class ="adminBut" onclick="del()"></p>
		<%}%>
	</div>
	
	<%@include file = "../Menu/footer.jsp" %>
</body>
</html>