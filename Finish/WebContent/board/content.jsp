<%@page import="Comment.CommentDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Comment.CommentDAO"%>
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
<title>글내용</title>
<link href="../css/reset.css" rel="stylesheet">
<link href="../css/style.css" rel="stylesheet">

</head>

<jsp:include page="../includ/header.jsp"/>
<%

	// num  pageNum 가져오기
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	
	//전달받은 글num을 이용하여 글을 검색 하기 위해 BoardDAO객체를 생성하고 
	BoardDAO dao = new BoardDAO();
	
	//검색하는 하나의 글정보의 조회수를 1증가 시킨다.
	dao.updateReadCount(num);
	 
	//하나의 글정보를 검색 하여 얻는다.
	BoardBean bBean = dao.getBoard(num); 
	int DBnum = bBean.getNum(); //조회한 글번호 
	String DBName = bBean.getName(); //조회한 작성자 
	int DBReadcount = bBean.getReadcount();//조회한 조회수
	int DBidx = bBean.getIdx();
	
	//날짜형식을 조작할수 있는 SimpleDataFormat객체의 format()메소드 사용
	SimpleDateFormat f = new SimpleDateFormat("yyyy/MM/dd");
	Timestamp DBDate =  bBean.getDate();//조회한 작성일
	String newDate = f.format(DBDate);
	
	String DBContent = "";
	
	if(bBean.getContent() != null){//조회한 글내용이 존재하면
	
		//조회한 글내용을 변수에 저장. 단! 작성한 글내용중 엔터키로 줄바꿈 한것들을 똑같이 처리하여 반환			
		DBContent = bBean.getContent().replace("\r\n","<br/>");
	}
	
	
	String DBSubject = bBean.getSubject();//조회한 글제목

	
	int DBRe_ref = bBean.getRe_ref(); //조회한 주글의 그룹번호
	int DBRe_lev = bBean.getRe_lev(); //조회한 주글의 들여쓰기 정도값
	int DBRe_seq = bBean.getRe_seq(); //주글들 내의  조회한 주글의 순서값
	
%> 
<body>
<div id="wrap">

<center>
<!-- 게시판 -->
<article>
<h1>Notice Content</h1>
<table id="notice" border="1px soild">
	<tr>
		<td>글번호</td>
		<td><%=DBnum%></td>
		<td>조회수</td>
		<td><%=DBReadcount%></td>
	</tr>
	<tr>
		<td>작성자</td>
		<td><% out.print(DBName);%></td>
		<td>작성일</td>
		<td><% out.print(newDate);%></td>
	</tr>	
	<tr>
		<td>글제목</td>
		<td colspan="3"><%=DBSubject%></td>
	</tr>
	<tr>
		<td>글내용</td>
		<td colspan="3"><%=DBContent%></td>
	</tr>
</table>
<div id="table_search">
<br>
<%
//각각페이지에서 로그인후 현재 페이지로 이동해 올때  session내장객체 메모리에 값이 존재하는지
//존재하지 않는디 판단하여 아래의 search버튼만 보이게 하거나 search버튼과 글쓰기버튼을 모두 보이게 처리 하기

String id = (String)session.getAttribute("id");

//session영역에 값이 저장되어 있으면   글수정, 글삭제, 답글쓰기  버튼 보이게 설정
if(id != null){
%>	
	<input type="button" 
		   value="글수정" 
		   class="btn" 
		   onclick="location.href='update.jsp?num=<%=DBnum%>&pageNum=<%=pageNum%>'">
		   
	<input type="button" 
		   value="글삭제" 
		   class="btn" 
		   onclick="location.href='delete.jsp?num=<%=DBnum%>&pageNum=<%=pageNum%>&num2=<%=DBRe_ref%>'">
		   
		   
	<input type="button" 
		   value="답글쓰기" 
		   class="btn" 
		   onclick="location.href='reWrite.jsp?num=<%=DBnum%>&re_ref=<%=DBRe_ref%>&re_lev=<%=DBRe_lev%>&re_seq=<%=DBRe_seq%>'">
<%}%>

	<input type="button" 
		   value="목록보기" 
		   class="btn" 
		   onclick="location.href='notice.jsp?pageNum=<%=pageNum%>'">
</div>
<div class="clear"></div>
<div id="page_control"></div>
</article>

<form action="CommentPro.jsp" method="post" border="1px">
<input type="hidden" name="num" value="<%=num%>">
<input type="hidden" name="num2" value="<%=DBidx%>">
<br><br><br><br>
아이디 : <input type="text" value="<%=id %>" disabled="disabled" border="3px soild">
<br>
댓글
<textarea name="comment" cols="40" rows="8" required="required"></textarea><br>
<input type="submit" value="확인">
<input type="reset" value="다시작성">
</form>
<br><br>

<%
// DB안의 Commnet2 테이블에서 정보를 가져와서 출력함
CommentDAO cdao=new CommentDAO();
ArrayList arr2= new ArrayList();
arr2=cdao.selectcomment(DBidx);
%>

<%
for(Object o:arr2){ CommentDTO cdto=(CommentDTO)o;
%>
<br>
<b>ID :</b>&nbsp<%=cdto.getId() %> &nbsp |&nbsp<b>Date :</b> &nbsp<%=cdto.getDate()%><br><br>
<%=cdto.getContent()%> <br><br>
<hr width="800px">

<%
}
%>

</center>
<div class="clear"></div>

<jsp:include page="../includ/footer.jsp"/>

</div>

</body>
</html>





