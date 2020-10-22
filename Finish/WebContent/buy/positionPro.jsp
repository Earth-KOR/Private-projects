<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<%
request.setCharacterEncoding("UTF-8");
String id = (String)session.getAttribute("id");
String a = request.getParameter("address");
String aa = request.getParameter("address2");

String aaa = a +" " + aa ;

%>

<%
   	if(a.equals("")) { %>
			<script>
    	 alert("주소를 입력해 주세여");
    	location.href = "position.jsp";
	
    </script>   		
   	<% return ;}
   %> 	
   
</head>
<body>
<%
	MemberDAO memberdao = new MemberDAO();
	
	int check = memberdao.Update2(id, aaa);
 
	if(check == 1){
		
%>		
 
    <script>
    	 alert("주소 수정 완료!");

    	location.href = "notice.jsp";

    </script>
	
	
<%		
		
	}else if(check == 0){
%>
		<script type="text/javascript">
			window.alert("주소 수정 실패");
			
			location.href = "position.jsp"
		</script>	
<%		
	}else{  
%>
	   <script>
	   		window.alert("오류");
	   		
	   		location.href = "position.jsp"
	   </script>
<%			
	}
%>


	}
</body>
</html>