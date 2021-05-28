<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE html>
<html>
<head>
<title>회원 저장</title>
</head>
<body>
<form action="user_save_do.jsp" method="post">
ID : <input type="text" name="id" maxlength="8" size="8"><br>
성명 : <input type="text" name="name" maxlength="12" size="12"><br>
암호 : <input type="password" name="pwd"><br>
<input type="submit" value=" 저  장 ">
</form>
</body>
</html>