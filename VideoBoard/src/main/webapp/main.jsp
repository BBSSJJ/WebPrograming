<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="design.css">
<title>Video Board</title>
</head>
<body>
<h1 id="homepage_name"><a href="main.jsp">Video Board</a></h1>
<hr>
<div id="nav">
	<ul>
		<li><a href="main.jsp">메인메뉴</a>
		<li>카테고리
		<ul id="category">
			<li><a href="main.jsp">#게임</a>
			<li><a href="main.jsp">#유머</a>
			<li><a href="main.jsp">#스포츠</a>
			<li><a href="main.jsp">#연예인</a>
			<li><a href="main.jsp">#동물</a>
			<li><a href="main.jsp">#음악</a>
			<li><a href="main.jsp">#기타</a>
		</ul>
	</ul>
</div>

<div id="content">
<table id="mainpage_head">
<tr>
<td><input type="text" id="search"><input type="button" value="검색">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<select id="order" name="order">
	<option value="최근 날짜순">최근 날짜순</option>
	<option value="오래된 날짜순">오래된 날짜순</option>
	<option value="조회수 순">조회수 순</option>
</select></td>
<td><input type="button" value="영상 업로드"></td>
</tr>
</table>

<table id="posted_video">
<tr><td rowspan="5" id="posted_video_thumbnail"><img id="thumbnail" src="Inha.png"></td>
<td id="posted_video_title">이 공간은 제목이 들어가는 공간입니다. </td><td><img src="ximage.png" width="15px" height="15px" onClick=""></td></tr>
<tr><td colspan="2">2021-05-11 14:05:21</td></tr>
<tr><td colspan="2">조회수 1</td></tr>
<tr><td>#공부</td><td width="40px">편집</td></tr>
</table>

<table id="posted_video">
<tr><td rowspan="5" id="posted_video_thumbnail"><img id="thumbnail" src="Inha.png"></td>
<td id="posted_video_title">이 공간은 제목이 들어가는 공간입니다. </td><td><img src="ximage.png" width="15px" height="15px" onClick=""></td></tr>
<tr><td colspan="2">2021-05-11 14:05:21</td></tr>
<tr><td colspan="2">조회수 1</td></tr>
<tr><td>#공부</td><td width="40px">편집</td></tr>
</table>

<table id="posted_video">
<tr><td rowspan="5" id="posted_video_thumbnail"><img id="thumbnail" src="Inha.png"></td>
<td id="posted_video_title">이 공간은 제목이 들어가는 공간입니다. </td><td><img src="ximage.png" width="15px" height="15px" onClick=""></td></tr>
<tr><td colspan="2">2021-05-11 14:05:21</td></tr>
<tr><td colspan="2">조회수 1</td></tr>
<tr><td>#공부</td><td width="40px">편집</td></tr>
</table>

</div>
</body>
</html>