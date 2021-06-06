<%@ page contentType="text/html; charset=UTF-8" isErrorPage="true"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오류메세지 출력</title>
</head>
<body>
오류메세지 : <%=exception.getMessage() %><br>
<%=exception.getClass().getName() %>
</body>
</html>