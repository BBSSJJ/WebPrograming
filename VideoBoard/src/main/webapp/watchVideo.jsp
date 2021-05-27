<%@ page contentType="text/html; charset=UTF-8" import="myBean.*" %>
<!DOCTYPE html>
<html>
<head>
<%request.setCharacterEncoding("utf-8");%>
<link rel="stylesheet" type="text/css" href="design.css">
<jsp:useBean id="videoInfo" class="myBean.VideoInfo" scope="page"/>
<jsp:setProperty name="videoInfo" property="*"/>
<meta charset="UTF-8">
<title>영상 보기</title>

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
<h3 id="head"><jsp:getProperty name="videoInfo" property="title"/></h3>

<table class="video_info">
	<tr><td colspan="2" id="show_video"><img src="<jsp:getProperty name="videoInfo" property="thumbnail_src"/>" alt="비디오가 들어갈 자리입니다." width="576px" height="360px"></td></tr>
	<tr><td id="video_info1">조회수 1</td><td id="video_info1" style="text-align:right;">2021-05-22</td></tr>
	<tr><td colspan="2" id="video_info2">#<jsp:getProperty name="videoInfo" property="category"/></td></tr>
	<tr><td colspan="2" id="video_info3"><jsp:getProperty name="videoInfo" property="explanation"/></td></tr>
	<tr><td colspan="2" style="text-align:right;">편집</td></tr>
</table>
</div>
</body>
</html>