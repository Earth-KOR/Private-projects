
<%@page import="java.util.List"%>
<%@page import="img.imgDAO"%>
<%@page import="img.imgDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<title>선수단 갤러리</title>
	<head>
		
<link href="../css/reset.css" rel="stylesheet">
<link href="../css/style.css" rel="stylesheet">


</head>

<script src="https://code.jquery.com/jquery-latest.min.js"></script>

	<script type="text/JavaScript" src="http://code.jquery.com/jquery-1.7.min.js"></script>
	


<jsp:include page="../includ/header.jsp"/>
	<body>

<script type="text/javascript">

function IdFind(obj) {
	var tr = $(obj)
	var td = tr.children();
	var tc = td.val();
	
	window.open("delete2.jsp?", "pop1", ' top=150,left=500 width=600, height=500, fullscreen=no scrollbars=no, status=yes'); 
	fr.target = "pop1";
	
	HttpSession session = request.getSession();
	session.setAttribute("type", tc);
	
}

</script>

<center border="1px solid">
	
	
	
	<center>
	<ul class="h_util_3">
  <li><a href="index.jsp?type=코칭스태프">코칭스태프</a></li>
  <li><a href="index.jsp?type=투수">투수</a></li>
  <li><a href="index.jsp?type=타자">타자</a></li>
    </ul>
    </center>
  <br><br>
			
	<%
	String type = "1st";
	type = request.getParameter("type");
	
	imgDTO img = new imgDTO();
	imgDAO imga = new imgDAO();
	List<imgDTO> list = null;
	
	int count = imga.getImgCount();
			
			if(count > 0){
				
				list = imga.getimgList(type);
				  
			}	
			
	if(count > 0){%>
		

		<%for(int i=0; i<list.size(); i++){
			 if(i%5 == 0) {%>
			
			<br><br>
			<%}
				imgDTO bean = list.get(i);%>
		   <a href="#" onclick="location.href='delete2.jsp?type=<%=bean.getImg()%>&name=<%=bean.getName2()%>&type2=<%=bean.getType()%>&salary=<%=bean.getSalary()%>&position=<%=bean.getPosition()%>'">
		   
		   <input type="image" id="img" src="../img2/<%=bean.getImg()%>" alt="Submit" width="166" height="221" value="<%=bean.getImg()%> ">
		   
		   
		   
		   </a>

					
							
							<%} }else{%>
							
					등록된 선수가 없습니다.		
							<%
							}
	%>
	<br><br>
	<input type="button" onclick="location.href='fileUploadForm.jsp'" value="선수 등록"/>&nbsp;&nbsp; 
	
</center>
		<br><br>
	</body>
	<jsp:include page="../includ/footer.jsp"/>
</html>
