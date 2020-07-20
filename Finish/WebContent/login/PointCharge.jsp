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

String id = (String) session.getAttribute("id");
Integer point = (Integer)session.getAttribute("point");



int price =Integer.parseInt(request.getParameter("asd"));
String idc = request.getParameter("id");

MemberDAO memberdao = new MemberDAO() ;
int Check = memberdao.priceCharge(id, price);

if(Check == 1) {
%>
<%
MemberDAO point2 = new MemberDAO();
	  int point123 = point2.priceCheck(id);
	 
	    session.setAttribute("point", point123);
%>
 <script type="text/javascript">
 alert("충전완료")
 location="../index.jsp"
 </script>	
<%}else if(Check==-1){%>
<script type="text/javascript">
 alert("충전실패")
 location="../index.jsp"
 </script>	
	
<%	
}else{%>
<script type="text/javascript">
 alert("오류발생2")
 location="../index.jsp"
 </script>	

<%	
}
%>
</body>
</html>