<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보 수정</title>
<link href="../css/reset.css" rel="stylesheet">
<link href="../css/style.css" rel="stylesheet">
<jsp:include page="../includ/header.jsp"/>


<%
String id = (String)session.getAttribute("id");

if(id == null){
	response.sendRedirect("login.jsp");	
}

%>

</head>
<body>

<script src="https://code.jquery.com/jquery-latest.min.js"></script>


<center>
<article>
	<h1>회원정보 수정</h1>
	<br>
	<form action="updatePro.jsp" id="fr" name="fr" method="post">
		<fieldset>
			<br>
			<label>User ID :</label>
			<input type="text" name="id" value="<%=id %>" disabled="disabled"><br><br>
			<label>Password :</label>
			<input type="password" id="passwd" name="passwd" required="required"><br><br>
			<label>Password Check :</label>
			<input type="password" id="passwd2" name = "passwd2" required="required"><br><br>
		</fieldset>
		<br>
		<div id="buttons">
			<input type="submit" value="회원정보 수정" class="submit">
			<input type="reset" value="다시작성" class="cancel">
		</div>
	</form>
	<br>
</article>
</center>
<jsp:include page="../includ/footer.jsp"/>


</body>
</html>