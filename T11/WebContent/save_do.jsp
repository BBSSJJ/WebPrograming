<%@ page  contentType="text/html;charset=utf-8" import="java.sql.*" %>
<%
request.setCharacterEncoding("utf-8");		//URL 인코딩 : UTF-8. MySQL 인코딩 : utf8

String id = request.getParameter("id");  //1. 입력양식 id에 입력한 값을 알아낸다.
String name = request.getParameter("name"); //2. 입력양식 name에 입력한 값을 알아낸다.
String pwd = request.getParameter("pwd"); //3. 입력양식 pwd에 입력한 값을 알아낸다.

try {

	 //4. JDBC 드라이버를 로드하기 위해 클래스 패키지를 지정한다.
	 
	String DB_URL ="jdbc:mariadb://localhost:3306/mydb?useSSL=false";

	//5. 연결자 생성
	Connection con = DriverManager.getConnection(DB_URL, "admin", "1234");
	
	//6. member 테이블에 id, name, pwd를 삽입하기 위한 쿼리 문자열 구성.
	String sql = "INSERT INTO member(id, name, pwd) VALUES(?, ?, ?)";
	
	PreparedStatement pstmt = con.prepareStatement(sql);
	
	//7. pstmt에 사용자로부터 입력받은 값들로 온전한 쿼리를 구성.
	pstmt.setString(1, id);
	pstmt.setString(2, name);
	pstmt.setString(3, pwd);

	//8. 쿼리 실행
	pstmt.executeUpdate();

	pstmt.close();
	con.close();

}catch(SQLException e) {
	out.print(e);
	return;
}
//9. 리스트 출력페이지로 이동시킴
response.sendRedirect("list.jsp");
%>