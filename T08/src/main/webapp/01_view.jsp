<%--<%@ page contentType="text/html; charset=UTF-8" errorPage="01_error.jsp"%> --%>

<%@ page contentType="text/html; charset=UTF-8" %>
<%
request.setCharacterEncoding("utf-8");

int sn1 = Integer.parseInt(request.getParameter("num1"));
String sop = request.getParameter("op");
int sn2= Integer.parseInt(request.getParameter("num2"));


int result = 0;
if(sop.equals("+")){
	result = sn1 + sn2;
}
else if(sop.equals("-")){
	result = sn1 - sn2;
}
else if(sop.equals("*")){
	result = sn1 * sn2;
}
else if(sop.equals("/")){
	result = sn1 / sn2;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사칙연산 계산기 결과</title>
</head>
<body>
결과 : <%=sn1 %> <%=sop %> <%=sn2 %> = <%=result %>
</body>
</html>