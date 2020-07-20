<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardBean"%>
<%@page import="java.util.List"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글수정</title>
<link href="../css/reset.css" rel="stylesheet">
<link href="../css/style.css" rel="stylesheet">

</head>
<jsp:include page="../includ/header.jsp"/>
<%
// 글 수정을 위한 글상세보기 화면

//세션값 가져오기
String id = (String)session.getAttribute("id");

//세션값이 존재 하지 않으면 login.jsp로 가서 로그인하고 오세요
if(id == null){
	response.sendRedirect("../member/login.jsp");	
}

//content.jsp에서 글수정버튼을 클릭했을때 전달받는 num, pageNum -> request영역에서 꺼내오기
request.setCharacterEncoding("UTF-8");
int num = Integer.parseInt(request.getParameter("num")); //수정할 글번호
String pageNum = request.getParameter("pageNum"); //수정할 글번호가 속해 있는 페이지번호 

//글을 수정하기 전에 하나의 글정보를 검색해서 가져오기
BoardDAO dao  = new BoardDAO();
BoardBean boardBean = dao.getBoard(num);

//검색한 하나의 글정보를 얻자
int DBnum = boardBean.getNum();//글번호
String DBName = boardBean.getName(); //글작성자
String DBSubject = boardBean.getSubject();//글제목
String DBContent = ""; //글내용을 저장할 변수

if(boardBean.getContent() != null){//검색한 글내용이 있을떄
	//검색한 글내용을 얻어 엔터키 처리후 저장
	DBContent = boardBean.getContent().replace("\r\n","<br>");
}
	
%> 
<body>
<div id="wrap">

<center>
<article>
	<h1>글 수정</h1>
<form action="updatePro.jsp?pageNum=<%=pageNum%>" method="post">
	
	
	<input type="hidden" name="num" value="<%=num%>">

	<table id="notice">
		<tr>
			<td>이름</td>
			<td><input type="text" name="name" value="<%=DBName%>">  </td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" name="passwd">  </td>
		</tr>
		<tr>
			<td>글제목</td>
			<td><input type="text" name="subject" value="<%=DBSubject %>"></td>
		</tr>
		<tr>
			<td>글내용</td>
			<td>
				<textarea name="content" rows="13" cols="40"><%=DBContent %></textarea>
			</td>
		</tr>
	</table>
	<br>
	<div id="table_search">
		<input type="submit" value="글수정" class="btn">
		<input type="reset" value="다시작성" class="btn">
		<input type="button" value="목록보기" class="btn" onclick="location.href='notice.jsp'">
	</div>
</form>		
	<div class="clear"></div>
	<div id="page_control"></div>
</article>
<br>
</center>


<jsp:include page="../includ/footer.jsp"/>

</div>

</body>
</html>





