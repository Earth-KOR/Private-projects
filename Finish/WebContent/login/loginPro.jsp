<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	
	
	MemberDAO memberdao = new MemberDAO();
	
	int check = memberdao.userCheck(id, passwd);
 
	if(check == 1){
		
		 MemberDAO point2 = new MemberDAO();
	        int point = point2.priceCheck(id);
	        
		session.setAttribute("id", id);
		session.setAttribute("point", point);
		
		response.sendRedirect("../index.jsp");
	}else if(check == 0){
%>
		<script type="text/javascript">
			window.alert("비밀번호 틀림");
			
			history.back();
		</script>	
<%		
	}else{  
%>
	   <script>
	   		window.alert("아이디없음");
	   		
			history.go(-1);
	   </script>
<%			
	}
%>