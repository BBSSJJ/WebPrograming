<%@ page contentType="text/html;charset=utf-8" import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head><title>저장 결과</title></head>
<body>
<%
Class.forName("org.mariadb.jdbc.Driver");
String DB_URL = "jdbc:mariadb://localhost:3306/mydb?useSSL=false";
String DB_USER = "admin";
String DB_PASSWORD= "1234";

Connection con=null;
PreparedStatement pstmt = null;
ResultSet rs=null;
try {
	//1. DB 연결자 정보를 획득한다.
	con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
	
	//2. member 테이블에서 모든 필드의 레코드를 가져오는 퀴리 문자열을 구성한다. 
	String sql = "SELECT * FROM member";
	
	//3. sql문을 실행하기 위한 PreparedStatement 객체를 생성한다.
	pstmt = con.prepareStatement(sql);

	//4. 쿼리 실행
	rs = pstmt.executeQuery();
%>
<p><a href="file_user_input.jsp">멤버 추가</a></p>
<table border="1">
	<tr>
		<th>번호</th>
		<th>아이디</th>
		<th>성명</th>
		<th>암호</th>
		<th>사진</th>
		<th>비고</th>
	</tr>
<%
	while(rs.next()) {
%>
		<tr>
			<td><%= rs.getInt("idx") %> </td>
			<td><%= rs.getString("id")%></td>
			<td><%= rs.getString("name") %> </td>
			<td><%= rs.getString("pwd") %></td>
			<td>
			<!-- 7. upload 디렉토리의 그림출력 -->
				<img src="./upload/<%=rs.getString("fileName") %>" width="50" height="50">
			</td>
			<td>
			<!--8.  삭제 링크 추가 -->
				<a href="file_user_delete_do.jsp?idx=<%=rs.getInt("idx") %>">삭제</a>
				<a href="file_user_modify.jsp?idx=<%=rs.getInt("idx") %>">수정</a>
			</td>
		</tr>
<%
	}
	
	rs.close();
	pstmt.close();
	con.close();
}catch(SQLException e) {
	out.println(e);
}
%>
</table>
</body>
</html>