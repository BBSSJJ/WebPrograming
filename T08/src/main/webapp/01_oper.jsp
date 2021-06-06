<%@ page contentType="text/html; charset=UTF-8" %>
<%--
[문제] 다음의 사칙연산 입력 양식을 통해 입력 받은 값을 사용하여 사칙 연산 결과를 출력하기 위한 페이지 
		01_view.jsp를 작성하시오.
	1. 0으로 나눌 경우에는 page지시어 상에 isErrorPage 속성을 사용하여 예외처리 하시오.
	2. 숫자이외의 문자가 입력될 경우에는 
		web.xml상에 exception-type 요소를 사용하여 예외처리 하시오.
	3. action="01_view1.jsp"로 파일명을 잘못 지정할 경우엔, 
		web.xml 상에 error-code 요소를 사용하여 예외처리하시오.
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사칙연산</title>
</head>
<body>
<form method="get" action="01_view.jsp">
<input type="text" name="num1">
<select name="op">
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