<%@page import="buy.buyDAO"%>
<%@page import="org.eclipse.jdt.internal.compiler.lookup.MemberTypeBinding"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매하기</title>

<%
	String id = (String)session.getAttribute("id");
    Integer point = (Integer)session.getAttribute("point");
%>

<%

request.setCharacterEncoding("UTF-8");
String name = request.getParameter("name");

String aa = "제품을 선택해 주세요";
int bb = 0;
int cc = 0;
int dd = 1;
if(name != null) {
	
	buyDAO buydao = new buyDAO() ;
	aa = buydao.name(name);
	bb = buydao.price(name);
	cc = buydao.stack(name);
	
}


%>
<link href="../css/reset.css" rel="stylesheet">
<link href="../css/style.css" rel="stylesheet">

</head>
<jsp:include page="../includ/header.jsp"/>
<center>

<br>
<body>
<form action="buy2.jsp" method="get" >
<Input type="button" name ="사이다" value="두산 베어스 유니폼" onclick="location='buy.jsp?name=doosan'">&nbsp;&nbsp;
<Input type="button" name ="사이다" value="두산 베어스 케이스 " onclick="location='buy.jsp?name=case'">&nbsp;&nbsp;
<Input type="button" name ="사이다" value="두산 베어스 모자" onclick="location='buy.jsp?name=hat'">
<br><br>
<%
 if(request.getParameter("name") != null) {
%>
	<img src="../img/<%=aa%>.jpg" alt="My Image" width="200px" height="200px">
<%

 }

%>
<br><br>
이름 : <input type="text" name="name" value="<%= aa %>" placeholder="가방을 선택해 주세요 !" readonly="readonly"> <br><br>
가격 : <input type="text" name="price" value="<%= bb %>" placeholder="가방을 선택해 주세요 !"  readonly="readonly"> <br><br>
재고 : <input type="text" name="stack" value="<%= cc %>"  placeholder="가방을 선택해 주세요 !"  readonly="readonly"> <br><br>
수량 : <input type="text" name="count" placeholder="수량을 적어주세요!" required="required"> <br><br>
<br>
<%
 if(request.getParameter("name") != null) {
%>
   	  
	 <Input type="submit" name ="구매" value="구매하기" >&nbsp;&nbsp;&nbsp;
	 <input type="reset" value="다시작성">
<%

 }

%>

</form>

<br>
 
<form action="admin.jsp">

<legened>관리자 로그인</legened>
<fieldset>
<br>
아이디 : <input type="text" name="adminId" required="required"><br><br>
비밀번호 : <input type="text" name="adminPaw" required="required"><br><br>
<input type="submit" value="관리자 접속">&nbsp;&nbsp;&nbsp;
<input type="reset" value="초기화">
</fieldset>
</form>
</center>
<jsp:include page="../includ/footer.jsp"/>
</body>
</html>