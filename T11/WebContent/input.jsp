<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 양식</title>
</head>
<body>
<form action="save_do.jsp" method="post">
id: <input type="text" name="id" maxlength="8" size="8"><br>
성명: <input type="text" name="name" maxlength="12" size="12"><br>
암호: <input type="text" name="pwd" maxlength="8" size="8"><br>
<input type="submit" value="저 장">
</form>
</body>
</html>