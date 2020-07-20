<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메일 보내기</title>
<link href="../css/reset.css" rel="stylesheet">
<link href="../css/style.css" rel="stylesheet">
</head>
<body>

<jsp:include page="../includ/header.jsp"/>
    <div align="center">
        <form action="SendMail.jsp" method="post">
            <table>
                <tr><th colspan="2">메일 보내기</th></tr>
                <tr><td>from</td><td><input type="text" name="from"/ value="@naver.com
                "></td></tr>
                 <tr><td>비밀번호</td><td><input type="password" name="pass" /></td></tr>
                <tr><td>to</td><td><input type="text" name="to" placeholder="받는사람" /></td></tr>
                <tr><td>subject</td><td><input type="text" name="subject" placeholder="제목"/></td></tr>
                <tr><td>content</td><td><textarea name="content" style="width:170px; height:200px;" p
                "내용작성"></textarea></td></tr>
                <tr><td colspan="2" style="text-align:right;"><input type="submit" value="보내기"/></td></tr>
            </table>
        </form>
    </div>
    <jsp:include page="../includ/footer.jsp"/>
</body>
</html>

