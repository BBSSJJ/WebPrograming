<%@ page contentType="text/html; charset=UTF-8" import="java.sql.*" errorPage="error.jsp" %>
<%
request.setCharacterEncoding("utf-8");
//넘겨받은 idx값 int형으로 저장
int idx = Integer.parseInt(request.getParameter("idx"));

Class.forName("org.mariadb.jdbc.Driver");
String URL = "jdbc:mariadb://localhost:3306/movieboard?useSSL=false";
String USER = "admin";
String PASSWORD = "1234";

Connection con = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

//idx에 맞는 video_info 테이블의 모든 값 선택
con = DriverManager.getConnection(URL, USER, PASSWORD);
String sql = "SELECT * FROM video_info WHERE idx=?";
pstmt = con.prepareStatement(sql);
pstmt.setInt(1, idx);
rs = pstmt.executeQuery();
rs.next();


%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="style.css">
<meta charset="UTF-8">
<script>
//삭제 버튼 클릭 시 알림창
function delete_confirm(idx){
	if(confirm("정말 삭제하시겠습니까?")){
		location.href = "video_delete_do.jsp?idx=" + idx;
	} else{
		return;
	}
}
</script>
<title>영상 보기</title>
</head>
<body>
<h1 id="homepage_name"><a href="video_list.jsp">Video Board</a></h1>
<hr>
<div id="nav">
	<ul>
		<li><a href="video_list.jsp">메인메뉴</a>
		<li>카테고리
		<ul id="menu_category">
			<li><a href="video_list.jsp?category=게임">#게임</a>
			<li><a href="video_list.jsp?category=유머">#유머</a>
			<li><a href="video_list.jsp?category=스포츠">#스포츠</a>
			<li><a href="video_list.jsp?category=연예인">#연예인</a>
			<li><a href="video_list.jsp?category=동물">#동물</a>
			<li><a href="video_list.jsp?category=음악">#음악</a>
			<li><a href="video_list.jsp?category=기타">#기타</a>
		</ul>
	</ul>
</div>
<div id="content">
<h3 id="head"><%=rs.getString("title") %></h3>

<table class="video_info">
	<tr><td colspan="2" id="show_video" style="text-align:center; background-color:black;">
	<video src="./upload/<%=rs.getString("video_src") %>" controls autoplay width="576px" height="450px"></video>
	</td></tr>
	<tr><td id="video_info1">#<%=rs.getString("category") %></td>
	<td id="video_info2"><%=rs.getString("date").substring(0,19) %></td></tr>
	<tr><td colspan="2" id="video_info3"><%=rs.getString("explanation") %></td></tr>
	<tr><td colspan="2" id="video_info4">
	<input type="button" value="편집" onClick="location.href='video_modify.jsp?idx=<%=idx%>'">
	<input type="button" value="삭제" onClick="delete_confirm(<%=idx %>)">
	</td></tr>
</table>
</div>
</body>
</html>