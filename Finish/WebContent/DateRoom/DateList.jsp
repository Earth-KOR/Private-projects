
<%@page import="java.util.List"%>

<%@page import="DateRoom.DateRoomDTO"%>
<%@page import="DateRoom.DateRoomDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DateRoom.DateRoomDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자료실</title>
<link href="../css/reset.css" rel="stylesheet">
<link href="../css/style.css" rel="stylesheet">
</head>
<body>

<jsp:include page="../includ/header.jsp"/>
<center>
<article>

<%
	DateRoomDAO datedao = new DateRoomDAO();
	DateRoomDTO bea = new DateRoomDTO();
	
	int count2 = datedao.getCount();
	
	
%>

<%
	DateRoomDAO boardDAO = new DateRoomDAO();
	
	int pageSize = 5;
		
	String pageNum = request.getParameter("pageNum");
	

	if(pageNum == null){
		pageNum = "1";
	}
	
	int currentPage = Integer.parseInt(pageNum);
	

	int startRow = (currentPage - 1) * pageSize;
	
	List<DateRoomDTO> list = null; %>
	
	 <h1 align="center">자료실</h1>
		<table border="1" width="1000px" height="2">
		<tr>
		<th>No.</th>
		<th>Name</th>
		<th>Subject</th>
		<th>Content</th>
		<th>ReadCount</th>
		</tr>
		<br><br>
		
		<%
	
	if(count2 > 0){
	 list = boardDAO.getBoardList(startRow, pageSize);
for(Object o:list){ DateRoomDTO ddto=(DateRoomDTO)o;
%>
	
	<tr onclick="location.href='../DateRoom/fileCheck.jsp?num=<%=ddto.getNum()%>'">
	<td><%=ddto.getNum()%></td>
	<td><%=ddto.getName()%></td>
	<td><%=ddto.getSubject()%></td>
	<td><%=ddto.getCotent()%></td>
	<td><%=ddto.getReadcount()%></td>
	</tr>
	
	
<%
	
}%>
		
	 
		  
	<% }else {%>
	
	<tr>
	<td colspan="5" align="center"> 게시물이 없습니다 </td>
	</tr>
	
	
	
	<%}%>

		</table>
<%
request.setCharacterEncoding("UTF-8");


	if(count2>0){
		

		int pageCounet = count2/pageSize+(count2%pageSize==0?0:1);
	    

		int pageBlock = 2;
		
		int startPage = ((currentPage/pageBlock)
						-(currentPage%pageBlock==0?1:0))*pageBlock+1;

		int endPage = startPage+pageBlock-1;


		if(endPage > pageCounet){
			
			endPage = pageCounet;
		}
                            
		
		if(startPage > pageBlock){
%>			
			<a href="DateList.jsp?pageNum=<%=startPage-pageBlock%>">[이전]</a>
<%	
		}
	  
	
		for(int i=startPage; i<=endPage; i++){
%>	
			<a href="DateList.jsp?pageNum=<%=i%>">[<%=i%>]</a>			
<% 
		}

	
		if(endPage < pageCounet){
%>			
			<a href="DateList.jsp?pageNum=<%=startPage+pageBlock%>">[다음]</a>
<%			
		}
	}

%>
<br>
<br>
<input type="button" value="글쓰기"onclick="location.href='../DateRoom/fileUploadForm.jsp'">
<input type="button" value="홈으로"onclick="location.href='../index.jsp'">
<br><br>
</article>
</center>
<jsp:include page="../includ/footer.jsp"/>
</body>

</html>