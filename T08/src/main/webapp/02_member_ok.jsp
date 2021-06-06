<%@ page contentType="text/html; charset=UTF-8"%>
<%

request.setCharacterEncoding("utf-8");

String id = request.getParameter("id");
String pass = request.getParameter("pass");

if(id.equals("admin") && pass.equals("1234")){
	session.setAttribute("id", id);
	response.sendRedirect("02_login.jsp");
}
else if(id.equals("admin")){
	out.println("<script>alert('비밀번호가 틀렸습니다.'); history.back();</script>");
}
else if(pass.equals("1234")){
	out.println("<script>alert('아이디가 틀렸습니다.'); history.back();</script>");
}else{
%>
<script>
alert("아이디와 비밀번호가 틀렸습니다.");
history.go(-1);
</script>
<%
}
%>