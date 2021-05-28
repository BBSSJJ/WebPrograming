<%@ page contentType="text/html; charset=UTF-8" import="myBean.db.*, java.sql.*, javax.naming.*" %>
<%
request.setCharacterEncoding("utf-8");
String id = request.getParameter("id");
String name = request.getParameter("name");
String pwd = request.getParameter("pwd");

Article art = new Article();
art.setId(id);
art.setName(name);
art.setPwd(pwd);

try{
ArticleDB db = new ArticleDB();
db.insertRecord(art);
db.close();
} catch(NamingException e){
	out.print(e);
	return;
}
catch(SQLException e){
	out.print(e);
	return;
}
response.sendRedirect("user_list.jsp");

%>