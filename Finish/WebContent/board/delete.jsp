<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글삭제</title>
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
	
	//content.jsp(글상세보기화면)에서 전달한 삭제할 글번호, 삭제할 글이 속해있는 페이지 넘버 얻기
	String num1 = request.getParameter("num");
	int num = Integer.parseInt(num1); //삭제할 글번호 "1" -> 정수 1 로 변환해서 저장
	
	String pageNum = request.getParameter("pageNum");
	String pageNum2 = request.getParameter("num2");
	int num2 = Integer.parseInt(pageNum2);
%>

<body>

<center>
<!-- 게시판 -->
<article>
	<h1>글 삭제</h1>
	<%-- 글을 삭제하기 위해 비밀번호를 입력하여 글삭제 요청을? deletePro.jsp로 요청함 --%>
	<form action="deletePro.jsp?pageNum=<%=pageNum%>" method="post">
		
		<input type="hidden" name="num" value="<%=num%>">
		<input type="hidden" name="num2" value="<%=num2%>">
		
		<table id="notice">
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="passwd"></td>
			</tr>
		</table>
		<br>
		<div id="table_search">
			<input type="submit" value="글삭제" class="btn">
			<input type="reset" value="다시입력" class="btn">
			<input type="button" 
				   value="글목록요청" 
				   class="btn" 
				   onclick="location.href='notice.jsp?pageNum=<%=pageNum%>'">			
		</div>
		
	</form>
	<br>
	<div class="clear"></div>
	<div id="page_control"></div>
</article>
</center>


</div>
<jsp:include page="../includ/footer.jsp"/>
</body>
</html>





