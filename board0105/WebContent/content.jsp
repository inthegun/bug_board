<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="board.*" %>
    <jsp:useBean id="boardDTO" class="board.BoardDTO"/>
    <jsp:useBean id="boardDAO" class="board.BoardDAO"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function update(idx){
		location.href="edit.jsp?idx="+idx;
	}
	function del(idx){
		location.href="del.jsp?idx="+idx
	}
</script>
</head>
<body>
<%
int idx = Integer.parseInt(request.getParameter("idx"));
// 조회수 올려? ...
	 
boardDTO = boardDAO.boardView(idx); // 글 보기
%>
<center> 글보기 </center>

<table width="600" border="1" align="center">
	<tr><td width="15%"> 이름 </td> <td><%=boardDTO.getName() %></td> </tr>
	<tr><td> 이메일 </td> <td><a href="mailto:<%=boardDTO.getEmail() %>"><%=boardDTO.getEmail() %></a></td> </tr>
	<tr><td> 제목 </td> <td><%=boardDTO.getTitle() %></td> </tr>
	<tr><td> 내용 </td> <td valign="top"><%=boardDTO.getContent() %></td> </tr>
	<tr><td> 작성일 </td> <td><%=boardDTO.getWrite_date() %></td> </tr>
	<tr> <td colspan="2"><input type="button" value="수정" onclick="update(<%=boardDTO.getIdx() %>)">&nbsp;&nbsp;
		<input type="button" value="삭제" onclick="del(<%=boardDTO.getIdx() %>)">&nbsp;&nbsp;
	    [<a href="./list.jsp">리스트</a>]</td> </tr>
</table>




</body>
</html>