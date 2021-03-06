<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@page import="java.util.*,board.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:useBean id="boardDAO" class="board.BoardDAO"/>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	function send(form){
		if(form.search.value ==""){
			alert('검색어 입력 바람');
			form.search.focus();
			return false;
		}
		form.submit();
	}
</script>
<meta charset="UTF-8">
<title>게시글 리스트</title>

</head>
<body>
<%-- 페이징 처리??Go ? no .. PASS --%>

<% int boardcnt = boardDAO.boardCount(); %> 

<table border ="0" align="center">
	<tr> <td align='left'> [게시글 수 : <%=boardcnt %>]</td>
		<td align='center'> <font style='bold'>게시글 리스트 </font></td>
		<td align='right'> [<a href='write.jsp'>글쓰기</a>]</td>
	</tr>
</table> <!-- 상단 테이블 --><br>

<table width="600" align="center" border="1">
	<tr>
		<td width="10%">&nbsp;번호</td>
		<td width="40%">&nbsp;제목</td>
		<td width="15%">&nbsp;이름</td>
		<td width="10%">&nbsp;일자</td>
		
	</tr>
	
	<%
	ArrayList list = boardDAO.getBoardList(); 
	System.out.println("리스트 가져옴");
	// 빈 가져옴
	for(int i=0;i<list.size();i++){
		BoardDTO boardDTO = (BoardDTO)list.get(i);
	%>
	
	<tr>
		<td><%=boardDTO.getIdx() %></td>
		<td><a href='content.jsp?idx=<%=boardDTO.getIdx()%>'> <%=boardDTO.getTitle() %></a></td>
		<td> <%=boardDTO.getName() %></td>
		<td> <%=boardDTO.getWrite_date() %></td>
	</tr>
	<%} %>
</table><br>
	<!-- 검색 폼 -->
	<div align="center">
	<form action='search.jsp' method="post" name="searchform">
		<select name='type'>
			<option value=name>이름</option>
			<option value=title selected="selected">제목</option>
			<option value=content>내용</option>
		</select>
	
	<input type="text" name="search" size="20">
	<input type="button" value='찾기' onclick='send(this.form);'>
	</form>
	</div>


</body>
</html>