<%@ page contentType="text/html; charset=UTF-8" import="java.sql.*" %>
<%
request.setCharacterEncoding("utf-8");
Class.forName("org.mariadb.jdbc.Driver");
String URL = "jdbc:mariadb://localhost:3306/movieboard?useSSL=false";
String USER = "admin";
String PASSWORD = "1234";

Connection con = null;
PreparedStatement pstmt = null;
ResultSet rs = null;


con = DriverManager.getConnection(URL, USER, PASSWORD);
String sql = "SELECT * FROM video_info";
pstmt = con.prepareStatement(sql);
rs = pstmt.executeQuery();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="design.css">
<script>
function delete_confirm(idx){
	if(confirm("정말 삭제하시겠습니까?")){
		location.href = "video_delete_do.jsp?idx=" + idx;
	} else{
		return;
	}
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
		<ul id="category">
			<li><a href="video_list.jsp">#게임</a>
			<li><a href="video_list.jsp">#유머</a>
			<li><a href="video_list.jsp">#스포츠</a>
			<li><a href="video_list.jsp">#연예인</a>
			<li><a href="video_list.jsp">#동물</a>
			<li><a href="video_list.jsp">#음악</a>
			<li><a href="video_list.jsp">#기타</a>
		</ul>
	</ul>
</div>

<div id="content">
<table id="mainpage_head">
<tr>
<td><input type="text" id="search"><input type="button" value="검색">

<!--
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<select id="order" name="order">
	<option value="최근 날짜순">최근 날짜순</option>
	<option value="오래된 날짜순">오래된 날짜순</option>
	<option value="조회수 순">조회수 순</option>
</select></td>
 -->
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
<tr><td colspan="2" style="text-align:right; margin-right:10px;"><input type="button" value="편집" onClick="location.href='video_modify.jsp?idx=<%=rs.getInt("idx")%>'"></td></tr>
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