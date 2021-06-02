<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE html>
<html>
<head>
<title>파일 업로드 기본 폼</title>
</head>
<body>
<form method="POST" action="fileUpload.jsp" enctype="multipart/form-data">
제목 : <input type="text" name="title"><br>
파일 : <input type="file" name="fileName"><br>
<input type="submit" value=" 파일 올리기 ">
</form>
</body>
</html>