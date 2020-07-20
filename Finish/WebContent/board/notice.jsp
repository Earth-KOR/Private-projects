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
<title>게시판</title>
<link href="../css/reset.css" rel="stylesheet">
<link href="../css/style.css" rel="stylesheet">

</head>

<jsp:include page="../includ/header.jsp"/>

<%
	String id = (String)session.getAttribute("id");
	BoardDAO boardDAO = new BoardDAO();

	int count = boardDAO.getBoardCount();
	int pageSize = 5;
	String pageNum = request.getParameter("pageNum");
	
	if(pageNum == null){
		pageNum = "1";
	}
	
	int currentPage = Integer.parseInt(pageNum);
	int startRow = (currentPage - 1) * pageSize;
	
	List<BoardBean> list = null;
	
	if(count > 0){
	
		list = boardDAO.getBoardList(startRow,pageSize);
		System.out.println(list.size());   
	}	
%> 

<body>
<div id="wrap">

<center>
<article>
<h1>게시판</h1><br><br>
<table id="notice" border="1px" width="1000px">
<tr><th class="tno">No.</th>
    <th class="ttitle">Title</th>
    <th class="twrite">Writer</th>
    <th class="tdate">Date</th>
    <th class="tread">Read</th></tr>
<%

if(count > 0){
	
	for(int i=0; i<list.size(); i++){
		
		BoardBean bean = list.get(i);
%>
	<tr onclick="location.href='content.jsp?num=<%=bean.getNum()%>&pageNum=<%=pageNum%>'">
		<td><%=bean.getNum()%></td>
		<td class="left">
		<%
			int wid = 0; //답변글에 대한 들여쓰기 값 저장
			
			//답변글에 대한 들여쓰기 값이 0보다 크므로
			//답변글이라면? 
			if(bean.getRe_lev() > 0){
				//들여쓰기 값 처리
				wid = bean.getRe_lev() * 10;	
		%>	
		<img src="../img/level.gif" width="<%=wid%>" height="15">
		<img src="../img/re.gif">
		<%} %>	
		<%=bean.getSubject()%>
		</td>
		<td><%=bean.getName()%></td>
		<td><%=new SimpleDateFormat("yyyy.MM.dd").format(bean.getDate())%></td>
		<td><%=bean.getReadcount()%></td>
	</tr>
<%		
	}
}else{
%>
	<tr>
		<td colspan="5" align="center">게시판 글 없음</td>
	</tr>
<%	
}
%>
</table>
<br>
<%

if(id != null){
%>	
<div id="table_search">
	<input type="button" value="글쓰기" class="btn" onclick="location.href='write.jsp'"/>
	<input type="text" name="search" class="input_box">
	<input type="button" value="검색" class="btn">
</div>
<%}else{%>
<br><br>
<div id="table_search">
	<input type="button" value="로그인" onclick="location='../login/login.jsp'">
	<input type="text" name="search" class="input_box">
	<input type="button" value="검색" class="btn">
</div>

<%}
	if(count>0){//DB에 글이 저장되어 있다면
		
//전체 페이지수 구하기 -> 글 20개 ->한페이지당 보여줄글수 10개 -> 몇개의 페이지? 2개의 페이지
//					 글 25개 ->한페이지당 보여줄 글수 10개-> 몇개의 페이지? 3개의 페이지
//전체 페이지수 = 전체글수 / 한페이지당 보여줄 글수  + (전체글수를 한페이지에 보여줄 글수로 나눈 나머지값)
		int pageCounet = count/pageSize+(count%pageSize==0?0:1);
	    
//하나의 화면(하나의 블럭)에 보여줄 페이지수 설정
		int pageBlock = 2;
		
//시작페이지 번호 구하기
// 1 ~ 10 => 1 , 11~20 => 11 , 21~30=>21
// ((현재 선택한 페이지번호/한블럭에 보여줄 페이지수)
//	-(현재 선택한 페이지번호를 하나의블럭에 보여줄 페이지수로 나눈 나머지값))
// * 한블럭에 보여줄 페이지수 + 1
		int startPage = ((currentPage/pageBlock)
						-(currentPage%pageBlock==0?1:0))*pageBlock+1;
//끝페이지 번호 구하기
// 1 ~ 10 =>10,  11~20 => 20
//시작페이지번호 + 현재블럭에 보여줄 페이지수 -1
		int endPage = startPage+pageBlock-1;

//끝페이지번호가 전체페이지수보다 클떄??
		if(endPage > pageCounet){
			//끝페이지번호를 전체페이지수로 저장
			endPage = pageCounet;
		}
                            
		//[이전] 시작페이지 번호가 하나의 블럭에 보여줄페이지수보다 클때~
		if(startPage > pageBlock){
%>			
			<a href="notice.jsp?pageNum=<%=startPage-pageBlock%>">[이전]</a>
<%	
		}
	  
		// [1] [2] [3]....[10] 페이지번호
		for(int i=startPage; i<=endPage; i++){
%>	
			<a href="notice.jsp?pageNum=<%=i%>">[<%=i%>]</a>			
<% 
		}

		//[다음] 끝페이지 번호가 전체페이지 수 보다 작을때..
		if(endPage < pageCounet){
%>			
			<a href="notice.jsp?pageNum=<%=startPage+pageBlock%>">[다음]</a>
<%			
		}
	}

%>
<br><br>

</div>
</article>
</center>

<div class="clear"></div>

<jsp:include page="../includ/footer.jsp"/>

</div>

</body>
</html>





