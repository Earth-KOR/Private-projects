<%@page import="member.MemberDAO"%>
<%@page import="get.getDAO"%>
<%@page import="buy.buyDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%

request.setCharacterEncoding("UTF-8");
Integer point = (Integer)session.getAttribute("point");
String name = request.getParameter("name");
int price = Integer.parseInt(request.getParameter("price")) ;
int get2 = Integer.parseInt(request.getParameter("count")) ;


String id = (String)session.getAttribute("id");
buyDAO count = new buyDAO () ;
getDAO count2 = new getDAO () ;
boolean check = count.count(name, get2);


if(check == true) {
	
	boolean check2 = count2.get(id, name, price, get2);
		if(check2 == true) {
	
		MemberDAO point2 = new MemberDAO();
	  int point123 = point2.priceCheck(id);
	 
	    session.setAttribute("point", point123);
		
	%>
	
	

	<script type="text/javascript">
 	alert( " <%=id %> 님 구매  완료 !");
 	location.href="notice.jsp";
 	</script>
	
<%} else { %>

	<script type="text/javascript">
 	alert("관리자에게 문의 바랍니다 !! Tel : 010-8320-5995 담당자 : 이상권");
	location.href="../index.jsp";
 	</script>
	

<%		
	
}
}else{ %>
	<script type="text/javascript">
 	alert("관리자에게 문의 바랍니다 ! Tel : 010-8320-5995 담당자 : 이상권");
	location.href="../index.jsp";
 	</script>
<%	
}
%>

