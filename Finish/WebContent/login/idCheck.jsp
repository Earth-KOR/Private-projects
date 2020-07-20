
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String id = request.getParameter("id");

MemberDAO mdao = new MemberDAO();

int check = mdao.idCheck(id);

if(check==1){
	out.println("이미 사용중인 아이디 입니다");
	
}else if (check==0){
	out.println("사용가능한 아이디 입니다");
}else {
	out.println("오류발생");
}

%>