<%@page import="buy.buyDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<%

request.setCharacterEncoding("UTF-8"); 
String name = request.getParameter("name");
int updatePrice = Integer.parseInt(request.getParameter("priceUpdate") );

buyDAO priceUpdate = new buyDAO() ;

boolean check = priceUpdate.priceUpdate(name, updatePrice);

if(check == true) { %>
	<script type="text/javascript">
 	alert("가격 변경 완료 !");
	location.href="../index.jsp";
 	</script>
	
<%} else { %>

	<script type="text/javascript">
 	alert("가격 변경 실패 !");
	location.href="../index.jsp";
 	</script>
	

<%		
	
}
%>

