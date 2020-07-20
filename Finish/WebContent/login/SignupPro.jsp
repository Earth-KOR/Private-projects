<%@page import="java.util.regex.Matcher"%>
<%@page import="java.util.regex.Pattern"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>












 <%
 
    request.setCharacterEncoding("UTF-8");
	
 
    String a = request.getParameter("id_check");
    String b = request.getParameter("id_check2");
    
    
    if(a.equals("")) {  %>
    	 <script>
    	 alert("중복확인 해주세요!");
    	location.href = "Signup.jsp";

    </script>
    <%
    	return;}
    
    if(b.equals("")) {  %>
	 <script>
	 alert("주소를 입력 해주세요!");
	location.href = "Signup.jsp";
 return;
	</script>
		<%
			}
        
        
        
    	String id = request.getParameter("id");
    	
    	String passwd = request.getParameter("passwd");
    	String passwd2 = request.getParameter("passwd2");
   
    	
    	 Pattern p = Pattern.compile("([a-z0-9_-]{6,18})");

    	 Matcher m = p.matcher(passwd);
    	 Matcher n = p.matcher(id);
    	boolean abc = m.find();
    	boolean zxc = n.find();
    	
 
		if(zxc == true){
			
		}else{ %>
			 <script>
	    	 alert("아이디가 올바르지 않습니다 !");
	    	location.href = "Signup.jsp";

	    </script>
		<% return;}
    	
		if(abc == true){
			
		 if(passwd.equals(passwd2) == true) {
			 
		 }else{ %>
		 
	<script>
    	 alert("비밀번호가 다릅니다 !");
    	location.href = "Signup.jsp";

    </script>
			 
		<% return;}
			}else {  %>
			
		 <script>
    	 alert("비밀번호가 올바르지 않습니다 !");
    	location.href = "Signup.jsp";

    </script>

<%			
		return;
			}
  %>	
    	
  <%  	int point = 0;
    	
    	
    	String ab = request.getParameter("address");
    	String aa = request.getParameter("address2");
   %>
   
   <%
   	if(ab.equals("")) { %>
			<script>
    	 alert("주소를 입력해 주세여");
    	location.href = "Signup.jsp";
		
    </script>   		
   	<% return ;}
   %> 	
	<%
    	String aaa = ab +" " + aa ;
    	
    	MemberDAO memberdao = new MemberDAO();
     
    	int check2 = memberdao.idCheck(id);

    	if (check2 == 0) {

    		int Check = memberdao.Signup(id, passwd, aaa, point);

    		if (Check == 1) {
    %> 		
    <script>
    	 alert("회원가입 완료!");
    	location.href = "../index.jsp";

    </script>
 <%		
 	}else if (Check == 0) {
%> 	
    <script>
   	 alert("회원가입 실패!");
   	location.href = "../index.jsp";

   </script>
 <%	}else{ %>
 		<script>
    	 alert("오류발생!");
    	location.href = "../index.jsp";

    </script>
 <%	}
	}else{
 %>
    <script>
    	 alert("아이디 중복입니다!!");
    	location.href = "Signup.jsp";

    </script>
 <%
	}
 %>