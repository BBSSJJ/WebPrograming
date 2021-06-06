<%@ page contentType="text/html; charset=UTF-8" isErrorPage="true" %>
<!-- 에러 페이지 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ERROR PAGE</title>
</head>
<body>
<h1>오류가 발생했습니다!</h1>
오류 내용 : <%=exception.getMessage() %>
<h2>다시 시도해주세요.</h2>
</body>
</html>