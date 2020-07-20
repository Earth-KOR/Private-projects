<%@page import="Comment.CommentDTO"%>
<%@page import="Comment.CommentDAO"%>
<%@page import="DateRoom.DateRoomDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DateRoom.DateRoomDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>파일 게시물</title>
<link href="../css/reset.css" rel="stylesheet">
<link href="../css/style.css" rel="stylesheet">

</head>

<jsp:include page="../includ/header.jsp"/>
 <%
 request.setCharacterEncoding("UTF-8");
	int num=Integer.parseInt(request.getParameter("num"));
	String id=(String)session.getAttribute("id");
 %>
    
   
    <%
        // post방식에 대한 한글 인코딩 방식 지정 get방식은 서버의 server.xml에서 Connector태그에 URIEncoding="UTF-8" 추가
      
 
    
    DateRoomDAO ddto=new DateRoomDAO();
    ArrayList arr= new ArrayList();
    
    arr=ddto.FileDown(num);
         for(Object o:arr){
        	 DateRoomDTO dd= (DateRoomDTO)o;
         
        // input type="name" 의 value값을 가져옴
        String name =dd.getName() ;
        // input type="subject" 의 value값을 가져옴
        String subject = dd.getSubject();
        // 중복방지용으로 만들어져 넘겨진 파일명을 가져옴
        String fileName1 = dd.getFileName1();
        // 본래의 파일명을 가져오기
        String originalName1 =dd.getOriginalName1();
        int idx = dd.getIdx();
      
  %>
  <center>
  <h1 align="center">자료실</h1>
  <br><br>
  <table border="1px soild">
    <tr>
    <th>NO.</th><th>ID</th><th>ReadCount</th><th>Subject</th><th>Content</th><th>File</th>
    </tr> 
    <tr>
    <td><%=num %></td><td><%=name %></td><td><%=dd.getReadcount() %></td><td><%=subject %></td><td><%=dd.getCotent() %></td><td><a id="downA" href="#"><%=originalName1%></td>
    </tr>
    </table>
    <br>
    
    
   
    <script type="text/javascript">
        // 영문파일은 그냥 다운로드 클릭시 정상작동하지만 한글파일명을 쿼리문으로 날릴경우 인코딩 문제가 발생할 수 있다. 한글이 깨져 정상작동하지 않을 수 있음
        // 따라서, 쿼리문자열에 한글을 보낼 때는 항상 인코딩을 해서 보내주도록 하자.
        document.getElementById("downA").addEventListener("click", function(event) {
            event.preventDefault(); // a 태그의 기본 동작을 막음
            event.stopPropagation(); // 이벤트의 전파를 막음
            // fileName1을 utf-8로 인코딩한다.
            var fName = encodeURIComponent("<%=fileName1%>");
            // 인코딩된 파일이름을 쿼리문자열에 포함시켜 다운로드 페이지로 이동
            window.location.href = "fileDown1.jsp?file_name="+fName;
        });
         
    </script>
 
<form action="CommentPro.jsp" method="post" border="1px">
<input type="hidden" name="num" value="<%=num%>">
<input type="hidden" name="num2" value="<%=idx%>">

<br><br><br><br>
아이디 : <input type="text" value="<%=id %>" disabled="disabled" border="3px soild">
<br>
댓글
<textarea name="comment" cols="40" rows="8" required="required"></textarea><br>
<input type="submit" value="확인">
<input type="reset" value="다시작성">
<input type="button" value="목록" onclick="location.href='DateList.jsp'"> 
</form>
<br><br>

<%
// DB안의 Commnet2 테이블에서 정보를 가져와서 출력함
CommentDAO cdao=new CommentDAO();
ArrayList arr2= new ArrayList();
arr2=cdao.selectcomment2(idx);
%>

<%
for(Object c:arr2){ CommentDTO cdto=(CommentDTO)c; 
%>
<br>
<b>ID :</b>&nbsp<%=cdto.getId() %> &nbsp |&nbsp<b>Date :</b> &nbsp<%=cdto.getDate()%><br><br>
<%=cdto.getContent()%> <br><br>
<hr width="800px">
<%
}
%>


<%
}
%>
</table>
</center>
<jsp:include page="../includ/footer.jsp"/>