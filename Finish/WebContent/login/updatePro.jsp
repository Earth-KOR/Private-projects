<%@page import="java.util.regex.Matcher"%>
<%@page import="java.util.regex.Pattern"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    <%
	request.setCharacterEncoding("UTF-8");
	
	String id = (String)session.getAttribute("id");
	String passwd = request.getParameter("passwd");
	String passwd2 = request.getParameter("passwd2");
	
	Pattern p = Pattern.compile("([a-z0-9_-]{6,18})");

	 Matcher m = p.matcher(passwd);
	 
	 boolean abc = m.find();
 	
	 
		if(abc == true){
		
	if(passwd.equals(passwd2)) {
	
	MemberDAO memberdao = new MemberDAO();
	
	int check = memberdao.Update(passwd, id);
 
	if(check == 1){
		session.invalidate();
%>		
 
    <script>
    	 alert("회원 정보 수정 완료!");
  
    	location.href = "update.jsp";

    </script>
	
	
<%		
		
	}else if(check == 0){
%>
		<script type="text/javascript">
			window.alert("회원수정 실패");
			
			location.href = "update.jsp"
		</script>	
<%		
	}else{  
%>
	   <script>
	   		window.alert("오류");
	   		
	   		location.href = "update.jsp"
	   </script>
<%			
	}



	}else{%>
	<script>
    	 alert("비밀번호가 불일치 합니다");
  
    	location.href = "update.jsp";

    </script>
	
	<%} }else{%>
	
	<script>
    	 alert("비밀번호가 올바르지 않습니다");
  
    	location.href = "update.jsp";

    </script>
	
	<%}%>