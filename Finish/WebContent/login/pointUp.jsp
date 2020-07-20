<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>충전하기</title>
</head>
<body>
<link href="../css/reset.css" rel="stylesheet">
<link href="../css/style.css" rel="stylesheet">
<jsp:include page="../includ/header.jsp"/>

<%

String id = (String) session.getAttribute("id");
if(id == null){
	response.sendRedirect("login.jsp");	
}
MemberDAO memberdao = new MemberDAO() ;
int Point = memberdao.priceCheck(id);

%>
<center>
<article>
	<h1>포인트 충전</h1>
	<br>
<form action="PointCharge.jsp" id="join" method="post">
		<fieldset>
			<br>
			<label>회원 ID :</label>
			<input type="text" name="id" value=<%=id%> disabled="disabled"><br><br>
			<label>회원 Point :</label>
			<input type="text" name="ids" value=<%=Point%> disabled="disabled"><br><br>
			<label>충전금액 :</label>
			<input type="text" name="asd" placeholder="충전금액을 입력해 주세요" required="required" >
			<br><br>
		</fieldset>
		<br>
		<input type="submit" value="충전하기"/>
		<input type="reset" value="다시작성"/>
	</form>
	<br>
	</article>
	</center>
	
</body>

<jsp:include page="../includ/footer.jsp"/>


</html>