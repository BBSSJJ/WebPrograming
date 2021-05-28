<%@ page contentType="text/html; charset=UTF-8" isErrorPage="true" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오류 페이지</title>
</head>
<body>
<p>오류가 발생했습니다.</p>
<p>
<%=exception.toString() %>
</p>
</body>
</html>