<%@ page contentType="text/html;charset=utf-8" import="myBean.db.*" %>
<%
String idx = request.getParameter("idx");
ArticleDB db = new ArticleDB();
Article art = db.getRecord(Integer.parseInt(idx));
%>
<!DOCTYPE html>
<html>
<head>
<title>회원 저장</title>
</head>
<body>
<form action="user_modify_do.jsp" method="post">
번호(idx) : <input type="text" name="idx" readOnly value="<%=art.getIdx()%>"><br>
ID : <input type="text" name="id" maxlength="8" size="8" value="<%=art.getId()%>"><br>
성명 : <input type="text" name="name" maxlength="12" size="12" value="<%=art.getName()%>"><br>
암호 : <input type="password" name="pwd" value="<%=art.getPwd()%>"><br>
<input type="submit" value=" 수  정 ">
</form>
</body>
</html>
<%
db.close();
%>
