<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean id="boardDAO" class="board.BoardDAO"/>
<html>
<head>
<%
int idx=Integer.parseInt(request.getParameter("idx"));
String pwd = request.getParameter("password");
boolean flag=false; 
flag = boardDAO.boardDelete(idx,pwd);
if(flag){ //암호가 일치하면
	out.println("<Script type=\"text/javascript\">");
	out.println("alert(\"글이 삭제 되었습니다\")");
	 out.println("location.href=\'list.jsp\'"); 
	out.println("</script>");
}else{ //암호가 일치하지 않으면
	out.println("<Script type=\"text/javascript\">");
	out.println("alert(\"암호가 일치하지 않습니다\")");
	out.println("history.back()");
	out.println("</script>");
	
} 
%>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
</body>
</html>