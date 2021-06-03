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

int idx = Integer.parseInt(multi.getParameter("idx"));
String title = multi.getParameter("title");
String thumbnail_src = multi.getFilesystemName("thumbnail_src");
String explanation = multi.getParameter("explanation");
Date now = new Date();
SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
String date = sf.format(now);
String category = multi.getParameter("category");

Connection con = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
String sql = null;

con = DriverManager.getConnection(URL, USER, PASSWORD);

//새로운 썸네일을 선택한 경우
if(thumbnail_src != null){
	sql = "SELECT thumbnail_src FROM video_info WHERE idx=?";
	pstmt = con.prepareStatement(sql);
	pstmt.setInt(1, idx);
	rs = pstmt.executeQuery();
	rs.next();
	String old_thumbnail_src = rs.getString("thumbnail_src");
	File old_thumbnail = new File(realFolder + "\\" + old_thumbnail_src);
	old_thumbnail.delete();
	
	sql = "UPDATE video_info SET title=?, thumbnail_src=?, explanation=?, date=?, category=? WHERE idx=?";
	pstmt = con.prepareStatement(sql);
	pstmt.setString(1, title);
	pstmt.setString(2, thumbnail_src);
	pstmt.setString(3, explanation);
	pstmt.setString(4, date);
	pstmt.setString(5, category);
	pstmt.setInt(6, idx);
	
} else{	//새로운 썸네일을 선택하지 않은 경우
	sql = "UPDATE video_info SET title=?, explanation=?, date=?, category=? WHERE idx=?";
	pstmt = con.prepareStatement(sql);
	pstmt.setString(1, title);
	pstmt.setString(2, explanation);
	pstmt.setString(3, date);
	pstmt.setString(4, category);
	pstmt.setInt(5, idx);
}
pstmt.executeUpdate();
if(pstmt != null) pstmt.close();
if(rs != null) rs.close();
if(con != null) con.close();

response.sendRedirect("video_watch.jsp?idx=" + idx);
%>