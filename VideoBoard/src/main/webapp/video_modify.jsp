<%@ page contentType="text/html; charset=UTF-8" import="java.sql.*" %>
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
String sql = "SELECT title, explanation, category FROM video_info WHERE idx=?";
pstmt = con.prepareStatement(sql);
pstmt.setInt(1, idx);
rs = pstmt.executeQuery();
rs.next();


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="design.css">
<script>
function modify_confirm(idx){
	if(confirm("정말 수정하시겠습니까?")){
		location.href = "video_modify_do.jsp?idx=" + idx;
	} else{
		return;
	}
}
window.onload = function(){
	var category = "<%=rs.getString("category")%>";
	console.log(category);
	var select = document.getElementById("category");
	if(category === "기타") select.options[0].value.selected = true;
	else if(category === "게임") select.options[1].selected = true;
	else if(category === "유머") select.options[2].value.selected = true;
	else if(category === "스포츠") select.options[3].selected = true;
	else if(category === "연예인") select.options[4].selected = true;
	else if(category === "동물") select.options[5].selected = true;
	else if(category === "음악") select.options[6].selected = true;
}
</script>
<title>영상 수정</title>
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
<h3 id="head">영상 업로드</h3>
<form action="video_modify_do.jsp?idx=<%=idx %>" method="post" enctype="multipart/form-data">
<table id="upload_form">
<tr>
	<td><label for="title">제목</label></td>
	<td><input type="text" id="title" name="title" value="<%=rs.getString("title") %>" required></td>
</tr>
<tr>
	<td><label for="video_src">영상 소스</label></td>
	<td><input type="file" id="video_src" name="video_src" accept="video/*" disabled></td>
</tr>
<tr>
	<td><label for="thumbnail_src">썸네일 소스</label></td>
	<td><input type="file" id="thumbnail_src" name="thumbnail_src" accept="image/*"></td>
</tr>
<tr>
	<td style="vertical-align:top"><label for="explanation">영상 설명</label></td>
	<td><textarea rows="7" cols="72" id="explanation" name="explanation"><%=rs.getString("explanation") %></textarea></td>
</tr>
<tr>
	<td><label for="category">카테고리</label></td>
	<td><select id="category" name="category">
	<option value="기타">기타</option>
	<option value="게임">게임</option>
	<option value="유머">유머</option>
	<option value="스포츠">스포츠</option>
	<option value="연예인">연예인</option>
	<option value="동물">동물</option>
	<option value="음악">음악</option>
	</select></td>
</tr>
<tr>
	<td></td>
	<td style="text-align:right;"><input type="button" value="취소" onclick="history.back()"> <input type="submit" value="수 정" onClick="modify_confirm(<%=idx %>)"></td>
</tr>
</table>
</form>
</div>
</body>
</html>

<%
con.close();
pstmt.close();
rs.close();
%>