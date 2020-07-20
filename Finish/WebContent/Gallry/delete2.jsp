<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선수 정보</title>

<%
	request.setCharacterEncoding("UTF-8");
String a = (String) request.getParameter("type");
String b = (String) request.getParameter("type2");
String c = (String) request.getParameter("name");
String d = (String) request.getParameter("position");
String e = (String) request.getParameter("salary");
%>
<link href="../css/reset.css" rel="stylesheet">
<link href="../css/style.css" rel="stylesheet">


</head>

	


<jsp:include page="../includ/header.jsp"/>
<body>
<center>
	<table>
	<tr align="center">
	<td colspan="2"><input type="image" src="../img2/<%=a%>" alt="Submit" width="166" height="221"></td>
	</tr>
	<tr align="center">
	<td>이름 : </td>
	<td><%=c%></td>
	</tr>
	<tr align="center">
	<td>구분 : </td><td><%=b%></td>
	</tr>
	<tr align="center">
	<td>포지션 :</td><td><%=d%></td>
	</tr>
	<tr align="center">
	<td>연 봉 :</td><td><%=e%>만원</td>
	</tr>
	</table> <br>
 	<input type="button" value="말소" onclick="location.href='delete2Pro.jsp?type=<%=a%>'">
 	<input type="button" value="돌아가기" onclick="location.href='index.jsp?type=coach'">
 	<br><br>
 	
 </center>
</body>
<jsp:include page="../includ/footer.jsp"/>
</html>