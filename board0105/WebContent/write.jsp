<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
<script type="text/javascript">
	/* function check(form){
		if(form.name.value==""){
			alert('이름 기입');
			form.name.focus();
			return false;
		}
	} */
</script>
</head>
<body>
<center> 게시판 글쓰기 </center>

<form name="boardform" method="post" action="write_ok.jsp">
<table width="600" border="1" align="center">
	<tr><td width="20%"> 이름 </td> <td><input type="text" name="name" size="15"></td> </tr>
	<tr><td> 이메일 </td> <td><input type="text" name="email" size="30"></td> </tr>
	<tr><td> 제목 </td> <td><input type="text" name="title" size="50"></td> </tr>
	<tr><td> 내용 </td> <td><textarea name="content" rows="10" cols="40"></textarea></td> </tr>
	<tr><td> 비밀번호 </td> <td><input type="password" name="password" size="20"></td> </tr>
	<tr>
	<td colspan="2" align="center"><input type="submit" value="글쓰기">&nbsp;&nbsp;<input type="reset" value="다시쓰기"></td>
	</tr>
	<tr> <td align="center">[<a href="./list.jsp">리스트</a>]</td> </tr>
</table>
</form>

</body>
</html>