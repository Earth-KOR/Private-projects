<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>파일 업로드</title>
<link href="../css/reset.css" rel="stylesheet">
<link href="../css/style.css" rel="stylesheet">
</head>

<jsp:include page="../includ/header.jsp"/>
 
<center>
<%
request.setCharacterEncoding("UTF-8");
String id=(String)session.getAttribute("id");
if(id==null){
	%>
	<script type="text/javascript">
	alert("로그인 먼저 해주세요 !");
	location.href="../login/login.jsp";
	</script>
	<%
}


%>

   
   <form action="fileUpload.jsp" method="post" enctype="Multipart/form-data">
   <h1>파일 업로드</h1> 
   
   <br>
   <table>
     <tr><td>아이디     :</td><td><input type="text" name="name"></td></tr>
        <tr><td>제목        :</td><td><input type="text" name="subject"></td></tr>
        <tr><td>내용        :</td><td><input type="text" name="content"></td></tr>
       <tr><td>파일명1 :</td><td><input type="file" name="fileName1"></td></tr>
        <tr><td colspan="2"><input type="submit" value="전송"> 
        <input type="reset" value="다시작성">
        <input type="button" value="목록" onclick="location.href='DateList.jsp'"</td></tr>
    </table>
  
    </form>
</center>
<br>
<jsp:include page="../includ/footer.jsp"/>
