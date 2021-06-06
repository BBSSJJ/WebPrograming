<%@ page contentType="text/html; charset=UTF-8" %>
<%--
[문제] 다음의 사칙연산 입력 양식을 통해 입력 받은 값을 사용하여 사칙 연산 결과를 출력하기 위한 페이지 
		01_view1.jsp를 작성하시오.
		단, JSP 빈즈를 활용하여 입력 받은 결과와 계산 결과를 출력하시오.
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사칙연산</title>
</head>
<body>
<form method="get" action="01_view2.jsp">
<input type="text" name="num1">
<select name="oper">
	<option value="+">+</option>
	<option value="-">-</option>
	<option value="*">*</option>
	<option value="/">/</option>
</select>
<input type="text" name="num2">
<input type="submit" value="계산하기">
</form>
</body>
</html>