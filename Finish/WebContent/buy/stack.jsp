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
int updatePrice = Integer.parseInt(request.getParameter("stackUpdate") );

buyDAO StackUpdate = new buyDAO() ;

boolean check = StackUpdate.StackUpdate(name, updatePrice);

if(check == true) { %>
	<script type="text/javascript">
 	alert("재고 변경 완료 !");
	location.href="../index.jsp";
 	</script>
	
<%} else { %>

	<script type="text/javascript">
 	alert("재고 변경 실패 !");
	location.href="../index.jsp";
 	</script>
	

<%		
	
}
%>

