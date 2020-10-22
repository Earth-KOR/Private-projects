<%@page import="buy.buyDAO"%>
<%@page import="buy.buyDTO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
Integer Point = (Integer) session.getAttribute("point") ;
int price = Integer.parseInt(request.getParameter("price"));
String id = (String)session.getAttribute("id");
int count = Integer.parseInt(request.getParameter("count"));
int price1 = (price * count) ;
String name = (String)request.getParameter("name");

buyDAO count3 = new buyDAO () ;
boolean check2 = count3.count2(name, count);

if( check2==false) {%>

<script type="text/javascript">
alert("재고가 부족합니다")
location="buy.jsp"
</script>
		
	<%return;}else{


if(Point < price1) { %>
 <script type="text/javascript">
 alert("잔액 부족합니다")
 location="../login/pointUp.jsp"
 </script>
<%
	

return;}else{
	


 MemberDAO memberdao = new MemberDAO() ;
 int check = memberdao.price(id, price1);
 
 if(check == 1) {
%>
 <script type="text/javascript">
 alert("구매완료")
 </script>	
 <jsp:forward page="Count.jsp"></jsp:forward>
<%}else if(check==-3){%>
<script type="text/javascript">
 alert("구매실패")
 location="notice.jsp"
 </script>	
	
<%	
return;}else{%>
<script type="text/javascript">
 alert("오류발생")
 location="../index.jsp"
 </script>	

<%	
return;}
%>
<%	
} }
%>


</body>
</html>