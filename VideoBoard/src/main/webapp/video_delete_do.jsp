<%@ page contentType="text/html; charset=UTF-8" import="java.sql.*, java.io.*"%>
<%
request.setCharacterEncoding("utf-8");
int idx = Integer.parseInt(request.getParameter("idx"));

Class.forName("org.mariadb.jdbc.Driver");
String URL = "jdbc:mariadb://localhost:3306/movieboard?useSSL=false";
String USER = "admin";
String PASSWORD = "1234";

Connection con = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

con = DriverManager.getConnection(URL, USER, PASSWORD);
String sql = "SELECT video_src, thumbnail_src FROM video_info WHERE idx=?";
pstmt = con.prepareStatement(sql);
pstmt.setInt(1, idx);
rs = pstmt.executeQuery();
rs.next();
String video_src = rs.getString("video_src");
String thumbnail_src = rs.getString("thumbnail_src");

ServletContext context = getServletContext();
String realFolder = context.getRealPath("upload");

File old_video = new File(realFolder + "\\" + video_src);
File old_thumbnail = new File(realFolder + "\\" + thumbnail_src);
old_video.delete();
old_thumbnail.delete();

sql = " DELETE FROM video_info WHERE idx=?";
pstmt = con.prepareStatement(sql);
pstmt.setInt(1, idx);
pstmt.executeUpdate();

pstmt.close();
con.close();
rs.close();

response.sendRedirect("video_list.jsp");
%>