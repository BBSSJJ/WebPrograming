<%@ page contentType="text/html; charset=UTF-8" import="java.sql.*, java.io.*" errorPage="error.jsp" %>
<%
request.setCharacterEncoding("utf-8");
//삭제 버튼 클릭했을 때 보낸 idx값 저장
int idx = Integer.parseInt(request.getParameter("idx"));

Class.forName("org.mariadb.jdbc.Driver");
String URL = "jdbc:mariadb://localhost:3306/movieboard?useSSL=false";
String USER = "admin";
String PASSWORD = "1234";

Connection con = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

con = DriverManager.getConnection(URL, USER, PASSWORD);
//idx값을 통해 삭제할 video_src와 thumbnail_src값 가져온다.
String sql = "SELECT video_src, thumbnail_src FROM video_info WHERE idx=?";
pstmt = con.prepareStatement(sql);
pstmt.setInt(1, idx);
rs = pstmt.executeQuery();
rs.next();
String video_src = rs.getString("video_src");
String thumbnail_src = rs.getString("thumbnail_src");

//upload 이름을 가지는 실제 서버의 경로명 저장
ServletContext context = getServletContext();
String realFolder = context.getRealPath("upload");

//경로명과 파일명으로 파일 객체 생성후 삭제
File old_video = new File(realFolder + "\\" + video_src);
File old_thumbnail = new File(realFolder + "\\" + thumbnail_src);
old_video.delete();
old_thumbnail.delete();

//idx값에 해당하는 모든 data 삭제
sql = " DELETE FROM video_info WHERE idx=?";
pstmt = con.prepareStatement(sql);
pstmt.setInt(1, idx);
pstmt.executeUpdate();

pstmt.close();
con.close();
rs.close();

//video_list.jsp로 이동
response.sendRedirect("video_list.jsp");
%>