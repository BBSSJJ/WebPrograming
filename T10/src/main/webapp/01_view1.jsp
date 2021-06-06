<%@ page contentType="text/html; charset=UTF-8" %>
<%
request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp beans action 연습</title>
</head>
<body>
<jsp:useBean id="cal" class="myBean.Calculator" scope="page"/>
<jsp:setProperty property="*" name="cal"/>
<p>
JSP Beans Action tag 사용 결과
</p>
실행 결과:
<jsp:getProperty property="num1" name="cal"/>
<jsp:getProperty property="oper" name="cal"/>
<jsp:getProperty property="num2" name="cal"/>
= <jsp:getProperty property="result" name="cal"/>
</body>
</html>