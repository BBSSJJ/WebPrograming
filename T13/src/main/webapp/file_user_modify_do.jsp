<%@ page contentType="text/html; charset=UTF-8" 
import="java.sql.*,com.oreilly.servlet.*, com.oreilly.servlet.multipart.*"
import="java.io.*"
errorPage="error.jsp"%>

<%
request.setCharacterEncoding("utf-8");
ServletContext context = getServletContext();
String realFolder = context.getRealPath("upload");
int maxsize = 1024*1024*5;
MultipartRequest multi = new MultipartRequest(request, realFolder, maxsize, "utf-8",
		new DefaultFileRenamePolicy());
int idx = Integer.parseInt(multi.getParameter("idx"));
String id = multi.getParameter("id");
String name = multi.getParameter("name");
String pwd = multi.getParameter("pwd");

String fileName = multi.getFilesystemName("fileName");

Class.forName("org.mariadb.jdbc.Driver");
String url = "jdbc:mariadb://localhost:3306/mydb?useSSL=false";

Connection con = DriverManager.getConnection(url, "admin", "1234");
PreparedStatement pstmt = null;
ResultSet rs = null;
String sql = null;
if(fileName != null){
	sql = "select fileName from member where idx=?";
	pstmt = con.prepareStatement(sql);
	pstmt.setInt(1,idx);
	rs = pstmt.executeQuery();
	rs.next();
	String oldFileName = rs.getString("fileName");
	
	File oldFile = new File(realFolder + "\\" + oldFileName);
	oldFile.delete();
	
	sql = "update member set id=?, name=?, pwd=?, fileName=? where idx=?";
	pstmt = con.prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.setString(2, name);
	pstmt.setString(3, pwd);
	pstmt.setString(4, fileName);
	pstmt.setInt(5, idx);
} else{
	sql = "update member set id=?, name=?, pwd=? where idx=?";
	pstmt = con.prepareStatement(sql);
	pstmt.setString(1,id);
	pstmt.setString(2,name);
	pstmt.setString(3,pwd);
	pstmt.setInt(4,idx);
}
pstmt.executeUpdate();

if(pstmt!=null) pstmt.close();
if(rs != null) rs.close();
if(con != null) con.close();
response.sendRedirect("file_user_list.jsp");
%>