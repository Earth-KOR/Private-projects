<%@page import="get.getDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<% int a = Integer.parseInt(request.getParameter("num"));

%>

<%

request.setCharacterEncoding("UTF-8");

int pageNum = Integer.parseInt(request.getParameter("pageNum"));


getDAO bdao = new getDAO();
int check = bdao.deleteBoard(a);
 
//check == 1  "삭제성공" 메세지창을 띄워주고 , notice.jsp 재요청해서 이동	
if(check == 1){
%>	
	<script type="text/javascript">
		alert("삭제 성공");
		location.href="notice.jsp?pageNum=<%=pageNum%>";
	</script>
<%	
}else{//check == 0  "비밀번호 틀림" 메세지창을 띄워주고, delete.jsp(비밀번호입력화면)로 이동

%>	
	<script type="text/javascript">
		alert("삭제 실패");
		history.back();
	</script>
<%			

}
%>
	
</body>
</html>