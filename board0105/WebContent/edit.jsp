<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@page import="board.*" %>
    
    <jsp:useBean id="boardDTO" class="board.BoardDTO"/>
    <jsp:useBean id="boardDAO" class="board.BoardDAO"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
int idx = Integer.parseInt(request.getParameter("idx"));
boardDTO = boardDAO.boardView(idx);
%>

<center> 글수정 </center>
<form name="boardform" method="post" action="edit_ok.jsp">
<input type="hidden" name="idx" value="<%=boardDTO.getIdx()%>">
<table width="600" border="1" align="center">
	<tr><td width="15%"> 이름 </td> <td><input type="text" readonly="readonly" name="name" size="15" value="<%=boardDTO.getName()%>"></td> </tr>
	<tr><td> 이메일 </td> <td><input type="text" name="email" size="30" value="<%=boardDTO.getEmail()%>"></td> </tr>
	<tr><td> 제목 </td> <td><input type="text" name="title" size="50" value="<%=boardDTO.getTitle()%>"></td> </tr>
	<tr><td> 내용 </td> <td><textarea name="content" rows="10" cols="40"><%=boardDTO.getContent() %></textarea></td> </tr>
	<tr><td> 비밀번호 </td> <td><input type="password" name="password" size="20"></td> </tr>
	<tr>
	<td colspan="2" align="center"><input type="submit" value="수정하기">&nbsp;&nbsp;<input type="reset" value="다시쓰기"></td>
	</tr>
	<tr> <td align="center">[<a href="./content.jsp?idx=<%=boardDTO.getIdx()%>">돌아가기</a>]</td> </tr>
</table>
</form>

</body>
</html>