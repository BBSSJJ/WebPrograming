<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE html>
<html>
<head><title>사용자 추가</title></head>
<body>
<!--1.  file 업로드를 위한 enctype 속성 추가 -->
<form method="POST" action="file_user_add_do.jsp" enctype="multipart/form-data">
아이디:<input type="text" name="id"><br>
이름 : <input type="text" name="name"><br>
암호 : <input type="password" name="pwd"><br>
<!-- 2. name="fileName"인 파일 업로드 필드 추가  -->
사진 : <input type="file" name="fileName"><br>
<br> 
<input type="submit" value="사용자 추가">
</form>
</body>
</html>