<%@ page contentType="text/html; charset=UTF-8" import="java.sql.*" errorPage="error.jsp" %>
<%
request.setCharacterEncoding("utf-8");
Class.forName("org.mariadb.jdbc.Driver");
String URL = "jdbc:mariadb://localhost:3306/movieboard?useSSL=false";
String USER = "admin";
String PASSWORD = "1234";


Connection con = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
String sql = null;

con = DriverManager.getConnection(URL, USER, PASSWORD);

//넘겨받을 category와 keyword값 정의
//null일 경우에는 넘겨받지 않은 것
String category = null;
category = request.getParameter("category");
String keyword = null;
keyword = request.getParameter("keyword");

//왼쪽 메뉴의 카테고리를 클릭하여 이 페이지를 접근했을 경우
if(category != null){ 
	sql = "SELECT * FROM video_info WHERE category=?";
	pstmt = con.prepareStatement(sql);
	pstmt.setString(1, category);
}
//검색을 통해 이 페이지를 접근했을 경우
else if(keyword != null){
	sql = "SELECT * FROM video_info WHERE title LIKE ?";
	pstmt = con.prepareStatement(sql);
	pstmt.setString(1, "%" + keyword+ "%");
}
//둘 다 아닐 경우
else if(keyword == null && category == null){
	sql = "SELECT * FROM video_info";
	pstmt = con.prepareStatement(sql);
}

rs = pstmt.executeQuery();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="style.css">
<script>
//삭제 버튼 클릭 시 알림창
function delete_confirm(idx){
	if(confirm("정말 삭제하시겠습니까?")){
		location.href = "video_delete_do.jsp?idx=" + idx;
	} else{
		return;
	}
}
//입력 후 검색 버튼 클릭시, 혹은 입력 후 enter입력 시
function do_search(){
	var keyword = document.getElementById("keyword").value;
	location.href="video_list.jsp?keyword=" + keyword;
}
</script>
<title>Video Board</title>
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
<table id="mainpage_head">
<tr>
<td><input type="text" id="keyword" onKeyPress="if(event.keyCode==13){do_search();}"><input type="button" value="검색" onClick="do_search()">
<td><input type="button" value="영상 업로드" onClick="location.href='video_upload.jsp'"></td>
</tr>
</table>

<%
while(rs.next()) {
%>
<table id="posted_video">
<tr>
<td rowspan="5" id="posted_video_thumbnail">
<a href="#" onClick="location.href='video_watch.jsp?idx=<%=rs.getInt("idx")%>'"><img id="thumbnail" src="./upload/<%=rs.getString("thumbnail_src")%>"></a>
</td>
<td id="posted_video_title"><%=rs.getString("title") %></td><td style="text-align:right;">
<a href="#" onClick="delete_confirm(<%=rs.getInt("idx")%>)"><img src="ximage.png" width="15px" height="15px"></a></td>
</tr>
<tr><td colspan="2"><%=rs.getString("date").substring(0,19) %></td></tr>
<tr><td colspan="2">#<%=rs.getString("category") %></td></tr>
<tr><td colspan="2" style="text-align:right;"><input type="button" value="편집" onClick="location.href='video_modify.jsp?idx=<%=rs.getInt("idx")%>'"></td></tr>
</table>
<%
}
rs.close();
pstmt.close();
con.close();
%>
</div>
</body>
</html>