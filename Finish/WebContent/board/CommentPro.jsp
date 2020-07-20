<%@page import="java.sql.Timestamp"%>
<%@page import="Comment.CommentDAO"%>
<%@page import="Comment.CommentDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
// content.jsp에서 댓글 정보 가져오기
request.setCharacterEncoding("UTF-8");
String id=(String)session.getAttribute("id");
int num=Integer.parseInt(request.getParameter("num"));
int num2=Integer.parseInt(request.getParameter("num2"));
String content=request.getParameter("comment");
Timestamp timedate=new Timestamp(System.currentTimeMillis());

// 로그인 판단여부

// 1) 로그인이 되었다면 ? CommentDTO 객체 생성 후 insertCommet2() 함수를 이용하여 DB에 저장하기
if(id!=null){
CommentDTO cdto=new CommentDTO();
CommentDAO cdao=new CommentDAO();
cdto.setContent(content);
cdto.setId(id);
cdto.setDate(timedate);
cdto.setNum(num2);
cdao. insertComment(cdto);
response.sendRedirect("content.jsp?num="+num);

// 2) 로그인이 안되었다면? login 페이지로 이동
}else{
%>
<script type="text/javascript">
alert("로그인이필요합니다"); 
location.href="../login/login.jsp"; 
</script>
<%
}
%>
</body>
</html>