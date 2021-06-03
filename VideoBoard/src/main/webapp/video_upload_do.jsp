<%@ page contentType="text/html; charset=UTF-8" import="com.oreilly.servlet.*, com.oreilly.servlet.multipart.*"
import="java.sql.*, java.io.*, java.util.Date, java.text.SimpleDateFormat" %>
<%
request.setCharacterEncoding("utf-8");
Class.forName("org.mariadb.jdbc.Driver");
String URL = "jdbc:mariadb://localhost:3306/movieboard?useSSL=false";
String USER = "admin";
String PASSWORD = "1234";

ServletContext context = getServletContext();
String realFolder = context.getRealPath("upload");

int maxsize = 1024 * 1024 * 5;

MultipartRequest multi = new MultipartRequest(request, realFolder, maxsize, "utf-8", new DefaultFileRenamePolicy());
String title = multi.getParameter("title");
String video_src = multi.getFilesystemName("video_src");
String thumbnail_src = multi.getFilesystemName("thumbnail_src");
String explanation = multi.getParameter("explanation");
Date now = new Date();
SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
String date = sf.format(now);
String category = multi.getParameter("category");

Connection con = null;
PreparedStatement pstmt = null;

con = DriverManager.getConnection(URL, USER, PASSWORD);
String sql = "INSERT INTO video_info(title, video_src, thumbnail_src, explanation, date, category) VALUES(?, ?, ?, ?, ?, ?)";
pstmt = con.prepareStatement(sql);

pstmt.setString(1, title);
pstmt.setString(2, video_src);
pstmt.setString(3, thumbnail_src);
pstmt.setString(4, explanation);
pstmt.setString(5, date);
pstmt.setString(6, category);

pstmt.executeUpdate();

pstmt.close();
con.close();

response.sendRedirect("video_list.jsp");
%>
