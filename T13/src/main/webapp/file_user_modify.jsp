<%@ page contentType="text/html;charset=utf-8" import="java.sql.*"
errorPage="error.jsp" %>
<%
request.setCharacterEncoding("utf-8");
int idx = Integer.parseInt(request.getParameter("idx"));

Class.forName("org.mariadb.jdbc.Driver");
String url = "jdbc:mariadb://localhost:3306/mydb?useSSL=false";

Connection con = DriverManager.getConnection(url, "admin", "1234");
String sql = "select id, name, pwd, fileName from member where idx=?";
PreparedStatement pstmt = con.prepareStatement(sql);
pstmt.setInt(1, idx);
ResultSet rs = pstmt.executeQuery();
rs.next();

%>
<!DOCTYPE html>
<html>
<head><title>사용자 추가</title></head>
<body>
<form method="POST" action="file_user_modify_do.jsp" enctype="multipart/form-data">
번호: <%=idx %> <input type="hidden" name="idx" value="<%=idx %>"><br>
아이디:<input type="text" name="id" value="<%=rs.getString("id")%>"><br>
이름 : <input type="text" name="name" value="<%=rs.getString("name")%>"><br>
암호 : <input type="password" name="pwd" value="<%=rs.getString("pwd")%>"><br>
파일명:<%=rs.getString("fileName") %>
<img src="./upload/<%=rs.getString("fileName") %>" width="100" height="100">
<p>변경할 사진 : <input type="file" name="fileName"></p>
<input type="submit" value="수   정">
</form>
</body>
</html>
<%
rs.close();
pstmt.close();
con.close();
%>