<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
     <% request.setCharacterEncoding("utf-8"); %>
    <jsp:useBean id="boardDTO" class="board.BoardDTO"/>
    <jsp:useBean id="boardDAO" class="board.BoardDAO"/>
    <jsp:setProperty property="*" name="boardDTO"/>
    
<!DOCTYPE html>
<html>
<head>
<%
int idx = boardDTO.getIdx();
boolean flag;
flag= boardDAO.Update(boardDTO); // 비밀번호맞으면 참 틀리면 거짓
System.out.println(flag);


 if(!flag){ //암호가 일치하지 않으면
	out.println("<Script type=\"text/javascript\">");
	out.println("alert(\"암호가 일치하지 않습니다\")");
	out.println("history.back()");
	out.println("</script>");
}  
else{ //암호가 일치하면
	out.println("<Script type=\"text/javascript\">");
	out.println("alert(\"글이 수정되었습니다\")");
	out.println("location.href=\'content.jsp?idx="+idx+"\'");
	out.println("</script>");
} 

%>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>



</body>
</html>