<%@ page contentType="text/html; charset=UTF-8" import="myBean.Calculator"%>
<%
request.setCharacterEncoding("utf-8");
Calculator cal = new Calculator(); 
cal.setNum1(Double.parseDouble(request.getParameter("num1")));
cal.setNum2(Double.parseDouble(request.getParameter("num2")));
String sop = request.getParameter("oper");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 빈즈(스크립트) 사용</title>
</head>
<body>
<%=cal.getNum1() %> <%=cal.getOper() %> <%=cal.getNum2() %>
 = <%=cal.getResult() %>
</body>
</html>