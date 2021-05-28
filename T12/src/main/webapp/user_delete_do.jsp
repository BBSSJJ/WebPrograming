<%@ page contentType="text/html; charset=UTF-8" import="myBean.db.*"%>

<%
request.setCharacterEncoding("utf-8");
String idx = request.getParameter("idx");

ArticleDB db = new ArticleDB();
db.deleteRecord(Integer.parseInt(idx));
db.close();

response.sendRedirect("user_list.jsp");
%>