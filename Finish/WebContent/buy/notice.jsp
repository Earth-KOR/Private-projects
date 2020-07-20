<%@page import="member.MemberDAO"%>
<%@page import="get.getDAO"%>
<%@page import="get.getDTO"%>
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
<title>구매목록</title>
<link href="../css/reset.css" rel="stylesheet">
<link href="../css/style.css" rel="stylesheet">

</head>

<jsp:include page="../includ/header.jsp"/>

<script src="https://code.jquery.com/jquery-latest.min.js"></script>

	<script type="text/JavaScript" src="http://code.jquery.com/jquery-1.7.min.js"></script>

	<script type="text/JavaScript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>





<%
	request.setCharacterEncoding("UTF-8");
	String id = (String)session.getAttribute("id");
Integer point = (Integer)session.getAttribute("point");
    
	
    
	if(id == null){
		
%>		
	<script type="text/javascript">
 	alert("로그인을 먼저 해주세요 !");
	location.href="../login/login.jsp";
 	</script>
		
<%		
	}else{
%>				
				
<%	}
%>

<%
	getDAO getDAO = new getDAO();
	getDTO bea = new getDTO();
	
	int count2 = getDAO.getCount(id);
	
	
%>

<%
	BoardDAO boardDAO = new BoardDAO();
	
	int pageSize = 5;
		
	
	String pageNum = request.getParameter("pageNum");

	if(pageNum == null){
		pageNum = "1";
	}
	
	int currentPage = Integer.parseInt(pageNum);
	

	int startRow = (currentPage - 1) * pageSize;
	
	List<getDTO> list = null;
	
	if(count2 > 0){

		list = getDAO.getBoardList(startRow, pageSize,id);
		  
	}	
%>

<script type="text/javascript">

function deleteLine(obj) {
    var tr = $(obj).parent().parent();
   
    var td = tr.children();
	 var userid = td.eq(1).text();
	location.href="rowDelete.jsp?num="+userid+"&pageNum="+<%=pageNum%> ;
}
</script>


<%
	String result = "";
 if(count2 > 10) {
	 result = "골드회원 입니다";
 }else if(count2 >5) {
	 result = "실버회원 입니다";
 }else {
	 result = "일반회원 입니다";
 }
%> 
<script type="text/javascript"> 
function pop() {
	alert("준비중입니다~")
}

</script>


    
<body>
<center>
<article>
<h1><%=id %>님 ! 전체 구매 수 : <%=count2%></h1> <br>
<h5><%=id %>님은  <%=result%></h5><br>
<table id="notice" border="2px solid" width="1000px">
<tr>
<th class="tno">NUM</th>
<th id="asd">No.1</th>
<th id="tno">ID</th>
<th class="ttitle">Name</th>
<th>img</th>
<th class="twrite">Price</th>
<th class="tdate">Total Count</th>
<th>Total Price</th>
<th colspan="2">조회</th>  
</tr>

<% MemberDAO memberdao = new MemberDAO() ;
String Point = memberdao.address(id);
 %>



배송지 : <input type="text" value="<%=Point%>" size="35"/><input type="button" value="수정하기" onclick="location='position.jsp?id=<%=id%>'">
<br><br>    
<%

if(count2 > 0){
	
	for(int i=0; i<list.size(); i++){
	
		getDTO bean = list.get(i);
%>
	<tr align="center">
		<td><%=i+1%></td>
		<td id="asd"><%=bean.getIdx() %></td>
		<td><%=bean.getId() %></td>
		<td><%=bean.getName()%></td>
		<td><img src="../img/<%=bean.getName()%>.jpg" alt="My Image" width="100px" height="100px"></td>
		<td>\<%=bean.getPrice()%></td>
		<td><%=bean.getCount()%>개</td>
		<td>\<%=bean.getPrice() * bean.getCount()%> </td>
 		<td><input type="button" value="배송조회"  id="ibtn"  onclick="pop();"></td>
		<td><input type="button" value="삭제하기" id='ibtn2' onclick="deleteLine(this);" ></td>
	</tr>
	
<%		
	}
}else{
%>
	<tr>
		<td colspan="10" align="center">구매 목록 없음</td>
	</tr>
<%	
}
%>
</table>
<br>
<%


%>	
<div id="table_search">
	<input type="button" value="쇼핑하기" class="btn" onclick="location.href='buy.jsp'"/>
	<input type="button" value="홈으로" class="btn" onclick="location.href='../index.jsp'"/>
</div>
<br>
<div class="clear"></div>
<div id="page_control">

<%
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
			<a href="notice.jsp?pageNum=<%=startPage-pageBlock%>">[이전]</a>
<%	
		}
	  
	
		for(int i=startPage; i<=endPage; i++){
%>	
			<a href="notice.jsp?pageNum=<%=i%>">[<%=i%>]</a>			
<% 
		}

	
		if(endPage < pageCounet){
%>			
			<a href="notice.jsp?pageNum=<%=startPage+pageBlock%>">[다음]</a>
<%			
		}
	}

%>


</div>
</article>
</center>
<br>

<jsp:include page="../includ/footer.jsp"/>

</div>
</body>
</html>





