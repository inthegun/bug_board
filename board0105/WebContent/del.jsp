<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<% String idx =request.getParameter("idx"); %>
<meta charset="UTF-8">
<title>게시글 삭제</title>
</head>
<body>
<br><br><br>
<form method="post" action="del_ok.jsp?idx=<%=idx %>">
<div align="center">
	<p> 암호를 입력하세요 </p>
	<input type="password" name="password" size="20">&nbsp;<input type="submit" value="삭제">
</div>
</form>

</body>
</html>