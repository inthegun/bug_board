<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<jsp:useBean id="boardDTO" class="board.BoardDTO"/>
<jsp:useBean id="boardDAO" class="board.BoardDAO"/>

<jsp:setProperty property="*" name="boardDTO"/>
<%

boardDAO.boardInsert(boardDTO); 
%>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	document.location.href="list.jsp";
</script>
<!-- <meta http-equiv="refresh" content="0;url=./list.jsp"> -->
</head>
<body>

</body>
</html>