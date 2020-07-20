<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <title>선수 등록하기</title>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>파일 업로드 폼</title>
<link href="../css/reset.css" rel="stylesheet">
<link href="../css/style.css" rel="stylesheet">
</head>

<jsp:include page="../includ/header.jsp"/>
 
<center>

	<h1>선수 등록</h1>
   
   <form action="fileUpload.jsp" method="post" enctype="Multipart/form-data">
   
   <table>
        <tr><td>소속    :</td> <td> <select name="name">
        	<option value="투수">투수</option> 
        	<option value="타자">타자</option>
        	<option value="코칭스태프">코칭스태프</option>
          </select> </td></tr>
        <br/>
   <tr> <td>이름 :</td> <td><input type="text" name="name2"></td></tr>
 <tr>  <td>포지션 :</td> <td><select name="position">
   			<optgroup label="투수">
        	<option value="선발투수">선발투수</option> 
        	<option value="구원투수">구원투수</option>
         <optgroup label="야수">
         	<option value="내야수">내야수</option> 
        	<option value="외야수">외야수</option>
        <optgroup label="코치">
        	<option value="1군 코치">1군 코치</option> 
        	<option value="2군 코치">2군 코치</option>
          </select> </td></tr>
   <tr> <td>연봉 :</td><td><input type="number" name="salary" step="1000" min="0" value="0" > 만원 </td></tr>
  <tr>   <td> 사진 : </td><td><input type="file" name="fileName1"></td></tr>
      </table>
      <br>
        <input type="submit" value="전송">  
        <input type="reset" value="취소">
        <input type="button" value="돌아가기" onclick="location.href='index.jsp'">
        <br>
  
    </form>
</center>
<br>
<jsp:include page="../includ/footer.jsp"/>
