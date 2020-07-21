<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <!--
 부산 아이티윌 교육센터
 개인 실습용 프로젝트 (학습용) 
 이름 : 이상권
 사진 출처 : https://www.doosanbears.com/
 

   -->   
    
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>두산 베어스</title>
    <link href="css/reset.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
</head>
<body>
    <div id="header">
        <a href="index.jsp"> <div class="h_logo"></div> </a>
       
        <ul class="h_menu">
            <li class="menu1"><a href="#">BRAND</a></li>
            <li class="menu2"><a href="#">MEDICAL ADVISER</a></li>
            <li class="menu3"><a href="Gallry/index.jsp?type=코칭스태프">Member</a></li>
            <li class="menu4"><a href="#">COMMUNITY</a></li>
            <li class="menu5"><a href="#">CUSTOMER</a></li>
        </ul>
        
        
        
     <%
		
		String id = (String)session.getAttribute("id");
        Integer point = (Integer)session.getAttribute("point");
        
		if(id == null){
		
	%>	
		 <ul class="h_util">
            <li><a href="buy/notice.jsp">구매목록</a></li>
            <li><a href="board/notice.jsp">게시판</a></li>
            <li><a href="login/login.jsp">로그인</a></li>
            <li><a href="login/Signup.jsp">회원가입</a></li>
            <li><a href="DateRoom/DateList.jsp">자료실</a></li>
            <li><a href="buy/buy.jsp">ONLINE SHOP</a></li>
        </ul>
	<%		
		}else{
	%>
		
			<b><%=id %></b>님 환영합니다! &nbsp;<b>Point :</b> <%=point %> &nbsp;&nbsp;&nbsp;
		    <a href="login/logout.jsp">logout</a>&nbsp;<small>|</small>
			<a href="login/update.jsp">회원정보 수정</a>&nbsp;<small>|</small>
			<a href="login/pointUp.jsp">충전하기</a>
			
		  <br><br>
		 <ul class="h_util">
            <li><a href="buy/notice.jsp">구매목록</a></li>
            <li><a href="board/notice.jsp">게시판</a></li>
            <li><a href="mail/MailForm.jsp">메일 보내기</a></li>
            <li><a href="DateRoom/DateList.jsp">자료실</a></li>
            <li><a href="buy/buy.jsp">ONLINE SHOP</a></li>
            
        </ul>
       
        	
	<%	 	
		}
	%>
  
            
    </div>
    <div id="main_visual"></div>
    <div id="container">
        <div class="con_top">
            <div class="top1"><a href="#">about</a></div>
            <div class="top2"><a href="#">review</a></div>
            <div class="top3"><a href="#">awards</a></div>
        </div>
        <div class="con_line"></div>
        <div class="con_bot">
            <div class="bota">
                <div class="a1"><a href="Gallry/index.jsp?type=1st">Member</a></div>
                <div class="a2"><a href="#">에어로</a></div>
            </div>
            <div class="botb">
                <div class="b1"><a href="#">News</a></div>
                <div class="b2"><a href="#">루나</a></div>
                <div class="b3"><a href="#">선물</a></div>
            </div>
            <div class="botc">
                <div class="c1"><a href="#">insta</a></div>
                <div class="c2"><a href="#">카페</a></div>
                <div class="c3"><a href="#">상담</a></div>
            </div>
        </div>
    </div>
    <div id="footer">
        <div class="footer_in">
            <div class="f_logo"></div>
            <div class="f_right">
                <ul class="f_util">
                    <li><a href="#">이용약관</a></li>
                    <li><a href="#">개인정보취급방침</a></li>
                </ul>
                <p class="f_lot">
                    경기도 성남시 분당구 성남대로 330번길 8, 5F(정자동, 킨스타워)대표전화 : 1544-9492
                </p>
                <p class="f_copy">
                    COPYRIGHT 2014 YKBnC CP.LTD. ALL RIGHT RESERVED
                </p>
                <div class="f_site"><a href="#">FAMILY SITE</a></div>
            </div>
        </div>
    </div>
</body>
</html>
