<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회사목록</title>
<link rel = "stylesheet" href = "../css/company.css">
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
			var conf = confirm("기업을 삭제하시면 하위의 모든 사용자도 함께 삭제가 됩니다. 삭제 하시겠습니까?");
			if(conf){
				memfrm.submit();
			}
		}
</script>
</head>
<body>
	<%@include file = "../Menu/adminHeader.jsp" %>
	<div class = "context">
		<h2>회사목록</h2>
	<hr>
	<div class = "searchfrm">
		<form name = "search" method = "get" action = "comSearch_ok.jsp">
			<select name = "method">
				<option value = "">선택하세요.</option>
				<option value = "c_name">회사명</option>
			</select>
			<input type = "text" name = "keyword" placeholder = "검색어를 입력하세요">
			<input type = "button" value = "검색" onclick = "check()" class = "but">
		</form>
	</div>
	<form method = "post" name = "memfrm" action = "adminComDelete.jsp">
	<table>
		<tr>
			<th></th>
			<th width = "150px">번호</th>
			<th width = "250px">회사명</th>
			<th width = "150px">교육인원</th>
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
			 	String sql = "select count(*) from company";
			 	pstmt = conn.prepareStatement(sql);
			 	rs = pstmt.executeQuery();
				rs.next();
				int total = rs.getInt(1); //전체 데이터 갯수
				int totalPage = total%unit ==0? total/unit :(total/unit)+1;
				if(totalPage ==0){totalPage = 1;}
				int i = total- idxNo;	//listNotice.jsp에서 보여지는 글번호
				int startPage = (currentBlock-1)*block+1; 
				int endPage = startPage + block -1;
				int lastPage = (int)Math.ceil((double)total/unit);
				if(endPage > totalPage)endPage = totalPage;
				try{
					sql = "select c.c_code, c.c_name, ifnull(c_count,0) as c_count from company c left outer join (select c_code, count(*) as c_count from member group by c_code) as m on c.c_code = m.c_code limit "+idxNo+","+unit;
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
						while(rs.next()){
							String c_code = rs.getString("c_code");
							String c_name = rs.getString("c_name");
							String c_count = rs.getString("c_count");
					%>
					<tr>
						<td><input type = "checkbox" name = "choice" value = "<%=c_code%>"></td>
						<td><%=i%></td>
						<td><a href = # onclick = "window.open('adminComDetail.jsp?c_code=<%=c_code%>', 'pop', 'width=800px, height=1080px, top=0, left=0 resizable=yes')"><%=c_name%></a></td>
						<td><%=c_count%></td>	
					</tr>
					<%
						i--;
					}
					}catch(Exception e){e.printStackTrace();}finally{}%>
				</table>
			<div class = "butArea">
				<input type = "button" value = "선택삭제" onclick = "del()" class = "but"> 
				<input type = "button" value = "기업추가" class = "but" onclick = "window.open('adminComInsert.jsp', 'pop', 'width=750px, height=900px, top=0, left=0 resizable=yes')">
			</div>
	</form>
	<div class = "page" style="width: 600px; text-align: center; margin-top: 10px;">
		<ul class = "justify-content-center">
			<%if(startPage == 1 ){%>
			<li class = "page-item disable"><a class = "page-link" href = "#" tabindex ="-1" aria-disabled="true">Previous</a></li>
			<%}else{%>
			<li class = "page-item"><a class = "page-link" href="adminComList.jsp?cPage=<%=startPage-1%>" tabindex="-1" aria-disabled="true">Previous</a></li>
			<%}%>
			<%for(int p = startPage;p<=endPage;p++){ %>
			<li class = "page-item">
				<a class = "page-link" href = "adminComList.jsp?cPage=<%=p%>"><%=p %></a></li>
			<%}%>
			<%if(totalPage == endPage){ %>
			<li class = "page-item disabled"><a class = "page-link" href ="#">Next</a></li>
			<%}else{ %>
			<li class = "page-item">
				<a class = "page-link" href = "adminComList?cPage=<%=endPage+1%>">Next</a>
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
	<%@include file = "../Menu/footer.jsp" %>
</body>
</html>