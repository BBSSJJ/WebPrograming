<%@ page contentType="text/html; charset=UTF-8" import="myBean.db.*" %>
<%
request.setCharacterEncoding("utf-8");

String sidx = request.getParameter("idx");
String sid = request.getParameter("id");
String name = request.getParameter("name");
String pwd = request.getParameter("pwd");

Article art = new Article();
art.setIdx(Integer.parseInt(sidx));
art.setId(sid);
art.setName(name);
art.setPwd(pwd);

ArticleDB db = new ArticleDB();
db.updateRecord(art);
db.close();

response.sendRedirect("user_list.jsp");
%>
