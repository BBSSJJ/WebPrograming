<%@ page contentType="text/html; charset=UTF-8" errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="style.css">
<title>영상 업로드</title>
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
<h3 id="head">영상 업로드</h3>
<form action="video_upload_do.jsp" method="post" enctype="multipart/form-data">
<table id="upload_form">
<tr>
	<td><label for="title">제목</label></td>
	<td><input type="text" id="title" name="title" maxlength='50' required></td>
</tr>
<tr>
	<td><label for="video_src">영상 소스</label></td>
	<td><input type="file" id="video_src" name="video_src" accept="video/*" required></td>
</tr>
<tr>
	<td><label for="thumbnail_src">썸네일 소스</label></td>
	<td><input type="file" id="thumbnail_src" name="thumbnail_src" accept="image/*" required></td>
</tr>
<tr>
	<td style="vertical-align:top"><label for="explanation">영상 설명</label></td>
	<td><textarea rows="7" cols="72" id="explanation" name="explanation" style="resize:none;"></textarea></td>
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
	<td style="text-align:right;"><input type="button" value="취소" onclick="history.back()"> <input type="submit" value="업로드"></td>
</tr>
</table>
</form>
</div>
</body>
</html>