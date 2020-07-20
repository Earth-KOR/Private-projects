<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>주소변경</title>


<%
String id = request.getParameter("id");
session.setAttribute("id", id);
%>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>

<script type="text/JavaScript" src="http://code.jquery.com/jquery-1.7.min.js"></script>

	<script type="text/JavaScript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

	<script type="text/javascript">

		function openDaumZipAddress() {

			new daum.Postcode({

				oncomplete:function(data) {

					jQuery("#postcode1").val(data.postcode1);

					jQuery("#postcode2").val(data.postcode2);

					jQuery("#zonecode").val(data.zonecode);

					jQuery("#address").val(data.address);

					jQuery("#address_etc").focus();

					console.log(data);

				}

			}).open();
			
		}
</script>


<link href="../css/reset.css" rel="stylesheet">
<link href="../css/style.css" rel="stylesheet">

</head>
<jsp:include page="../includ/header.jsp"/>
<center>

<body>

	                 주소변경 :
	
	<form action="positionPro.jsp" method="get"	border="1px">	
			
		  <input id="postcode1" type="text" value="" style="width:50px;" readonly/>

			&nbsp;-&nbsp;

			<input id="postcode2" type="text" value="" style="width:50px;" readonly/>

			&nbsp;&nbsp;

			<input id="zonecode" type="text" value="" style="width:50px;" readonly/>

			&nbsp;

			<input type="button" onClick="openDaumZipAddress();" value = "주소 찾기" />

			<br/>

			<input type="text" id="address" value="" style="width:240px;" name="address" readonly/>

			<input type="text" id="address_etc" value="" name="address2" style="width:200px;" required="required"/>
		<br>
			<input type="submit" value="수정하기">
			<input type="reset" value="다시작성">
		</form>
</center>
	<jsp:include page="../includ/footer.jsp"/>		
</body>
</html>