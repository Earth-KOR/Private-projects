<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입 양식</title>
<link href="../css/reset.css" rel="stylesheet">
<link href="../css/style.css" rel="stylesheet">
<jsp:include page="../includ/header.jsp"/>

<% int a = 0 ; %>
	
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

		
		var check = false ;
		$(document).ready(function(){
		 	
	 		
	 		
	 		// 아이디 중복 체크
	 		$('#ibtn').click(function(){
				
	 			var idPattern = /^[A-Za-z]{1}[A-Za-z0-9]{5,12}$/;
				var idn = document.getElementById("id");

	 			
	 			if(idPattern.test(idn.value) == false){
	 		       
	 				alert("아이디를 잘못 입력 하셨습니다.");
	 				return;
	 			 }
	 	
	 		
				if($('#id').val() == '') {
					window.alert("아이디를 입력해 주세요");
					return ;
				}
				
	 			$.ajax({
	 				url : 'idCheck.jsp',
	 				data:{id:$('#id').val()},
	 				success:function(sdata){
	 					$("#div").html(sdata);
	 					  }
	 				
	 					
	 				
	 			});
	 		
	 	
	 			$('#ss').val('원하는 값');
	 			
	 			
			});
	 		
	 		
	 		
	 		$('#ibtn2').click(function(){
	 			
	 			
	 			$('#dd').val('원하는 값');
	 		});
	 		
	 	});
	
	
	</script>




</head>
<body>
<center>
<article>
	<h1>회원가입</h1>
	<br>
	<form action="SignupPro.jsp" id="join" method="post">
		<fieldset>
			<br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;
			User ID :
            <input type="text" name="id" id="id" required="required" > <input type="button" value="중복확인" id="ibtn"> <small>&nbsp;&nbsp; * 영문 , 숫자로 6~12자리로 입력해주세요 </small>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b><span id="div">중복확인 해주세요</span><br><br></b>
			Password : 
			<input type="password" name="passwd" required="required"> <small>&nbsp;&nbsp;* 소문자 , 숫자로 6~18자리로 입력해주세요</small> <br><br>
		    Password Check :
			<input type="password" name="passwd2" required="required"> <small>&nbsp;&nbsp;* 소문자 , 숫자로 6~18자리로 입력해주세요</small> <br><br>
			Address :
		    <input id="postcode1" type="text" value="" style="width:50px;" readonly/>

	&nbsp;-&nbsp;

	<input id="postcode2" type="text" value="" style="width:50px;" readonly/>

	&nbsp;&nbsp;

	<input id="zonecode" type="text" value="" style="width:50px;" readonly required="required" />

	&nbsp;

	<input type="button" onClick="openDaumZipAddress();" value = "주소 찾기" id="ibtn2" />

	<br/>

	<input type="text" id="address" value="" style="width:240px;" name="address" readonly required="required" />

	<input type="text" id="address_etc" value="" name="address2" style="width:200px;" required="required" />
			<br><br>
	<input type=hidden name= "id_check" id="ss" >		
	<input type=hidden name= "id_check2" id="dd" >
		
		</fieldset>
		<br>
			<input type="submit" value="회원가입" class="submit">
			<input type="reset" value="다시작성" class="cancel">
	
	</form>
	<br>
</article>
</center>
<jsp:include page="../includ/footer.jsp"/>
</body>
</html>
