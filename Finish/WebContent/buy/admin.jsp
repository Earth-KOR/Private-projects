<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<title>관리자 페이지</title>
<%
request.setCharacterEncoding("UTF-8");

String id = request.getParameter("adminId");
int pwd = Integer.parseInt((request.getParameter("adminPaw")));
if(id.equals("admin")) {
	if(pwd == 1234) {
%>		

<center>
		
		  <h1> 가 격 변 경</h1>
		  <form action="pricePro.jsp?pwd=1234">
		     제품 이름 :  <select name="name">
        			<option value="hat">두산 베어스 모자</option> 
        			<option value="case">두산 베어스 케이스</option>
        			<option value="doosan">두산 베어스 유니폼</option>
          </select> <br><br>
		     바꿀 가격 :   <input type="text" name="priceUpdate"> <br><br>
		     
		    <input type="submit">
		  </form>
		  <br>
		  <hr>
		  <h1> 재 고 변 경 </h1>
		  <form action="stack.jsp">
		     제품 이름 :   <select name="name">
        			<option value="hat">두산 베어스 모자</option> 
        			<option value="case">두산 베어스 케이스</option>
        			<option value="doosan">두산 베어스 유니폼</option>
          </select> <br><br>
		     바꿀 수량 :   <input type="text" name="stackUpdate"> <br><br>
		    <input type="submit">
		  </form>
		<hr><br>
		 <input type ="button" name="exit" value="나가기" onclick="location='buy.jsp'">
		
	</center>	
<% 	}else {%>
		<script type="text/javascript">
	 	alert("아이디를 재확인 해주세요!");
		location.href="../index.jsp";
	 	</script>
<% 		}
} else { 
%>

	<script type="text/javascript">
	 	alert("비밀번호를 재확인 해주세요 !");
		location.href="../index.jsp";
	 	</script>


<% 
}
%>