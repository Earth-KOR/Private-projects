<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div id="header">
       <a href="../index.jsp"> <div class="h_logo"></div> </a>
        
        <ul class="h_menu">
            <li class="menu1"><a href="#">BRAND</a></li>
            <li class="menu2"><a href="#">MEDICAL ADVISER</a></li>
            <li class="menu3"><a href="../Gallry/index.jsp?type=1st">Member</a></li>
            <li class="menu4"><a href="#">COMMUNITY</a></li>
            <li class="menu5"><a href="#">CUSTOMER</a></li>
        </ul>
        
        
        
     <%
		
		String id = (String)session.getAttribute("id");
     Integer point = (Integer)session.getAttribute("point");
		
		if(id == null){
		
	%>	
		 <ul class="h_util">
            <li><a href="../buy/notice.jsp">구매목록</a></li>
            <li><a href="../board/notice.jsp">게시판</a></li>
            <li><a href="../login/login.jsp">로그인</a></li>
            <li><a href="../login/Signup.jsp">회원가입</a></li>
            <li><a href="../DateRoom/DateList.jsp">자료실</a></li>
            <li><a href="../buy/buy.jsp">ONLINE SHOP</a></li>
        </ul>
	<%		
		}else{
	%>
			<b><%=id %></b>님 환영합니다! &nbsp;<b>Point :</b> <%=point %> &nbsp;&nbsp;&nbsp;
		    <a href="../login/logout.jsp">logout</a>&nbsp;<small>|</small>
			<a href="../login/update.jsp">회원정보 수정</a>&nbsp;<small>|</small>
			<a href="../login/pointUp.jsp">충전하기</a>
		  <br><br>
		 <ul class="h_util">
            <li><a href="../buy/notice.jsp">구매목록</a></li>
            <li><a href="../board/notice.jsp">게시판</a></li>
            <li><a href="../mail/MailForm.jsp">메일 보내기</a></li>
            <li><a href="../DateRoom/DateList.jsp">자료실</a></li>
            <li><a href="../buy/buy.jsp">ONLINE SHOP</a></li>
            
        </ul>
        
        	
	<%	 	
		}
	%>
  
            
    </div>
</body>
</html>