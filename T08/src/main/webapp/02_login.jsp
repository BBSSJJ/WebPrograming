<%@ page contentType="text/html; charset=UTF-8" session="true"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 예제</title>
</head>
<body>
<%
if(session.getAttribute("id") == null){
%>
<form action="02_member_ok.jsp" method="post">
<label for="id">아이디</label>
<input type="text" name="id" id="id" placeholder="아이디 입력" required>
<label for="pass">비밀번호</label>
<input type="text" name="pass" id="pass" placeholder="비밀번호 입력" required>
<input type="submit" value="로그인">
</form>
<%
} else{
%>
<form action="02_logout.jsp" method="post">
<h2><%=session.getAttribute("id") %>님 환영합니다.</h2>
<input type="submit" value="로그아웃">
</form>
<%
}
%>
</body>
</html>