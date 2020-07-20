<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link href="../css/reset.css" rel="stylesheet">
<link href="../css/style.css" rel="stylesheet">
</head>
<body>

<jsp:include page="../includ/header.jsp"/>

<div height: 1572px>
<center>
<article>
	<h1>로그인</h1>
	<br>
	<form action="loginPro.jsp" id="join" method="post">
		<fieldset>
			<br>
			<label>User ID :</label>
			<input type="text" name="id" required="required"><br><br>
			<label>Password :</label>
			<input type="password" name="passwd" required="required"><br><br>
		</fieldset>
		<br>
		<div id="buttons">
			<input type="submit" value="로그인" class="submit">
			<input type="reset" value="다시작성" class="cancel">
			<input type="button" value="회원가입" onclick="location='Signup.jsp'">
		</div>
	</form>
</article>
</center>
<br>
</div>
<jsp:include page="../includ/footer.jsp"/>
</body>
</html>

