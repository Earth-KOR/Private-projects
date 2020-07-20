<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
<link href="../css/reset.css" rel="stylesheet">
<link href="../css/style.css" rel="stylesheet">

</head>
<jsp:include page="../includ/header.jsp"/>
<%
	//세션영역에 저장된 값 얻어오기
	//얻어오는 이유 :글쓰기 화면에 글작성하는 사람의 id를 입력공간에 나타나게 하기 위해
	String id = (String)session.getAttribute("id");
	
	//세션영역에 값이 저장되어 있지 않으면  login.jsp로 다시 이동
	if(id == null){
		//재요청(포워딩)
		response.sendRedirect("../member/login.jsp");
	}
%>

<body>

<center>
<article>
	<h1>글쓰기</h1>
	<%--새글 정보를 입력 한후 writePro.jsp로 글쓰기 요청을 함 --%>
	<form action="writePro.jsp" method="post">
		<table id="notice">
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" value="<%=id%>" disabled="disabled" size="38"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="passwd" size="38"></td>
			</tr>
			<tr>
				<td>글제목</td>
				<td><input type="text" name="subject" size="38"></td>
			</tr>	
			<tr>
				<td>글내용</td>
				<td><textarea name="content" rows="13" cols="40"></textarea> </td>
			</tr>				
		</table>
		<div id="table_search" align="center">
		<br>
			<input type="submit" value="글쓰기" class="btn">
			<input type="reset" value="다시작성" class="btn">
			<input type="button" value="글목록" class="btn" onclick="location.href='notice.jsp'">			
		</div>
	</form>
	<br>
	<div class="clear"></div>
	<div id="page_control"></div>
</article>
</center>



<jsp:include page="../includ/footer.jsp"/>



</body>
</html>





