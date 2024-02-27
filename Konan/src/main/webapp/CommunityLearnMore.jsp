<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
	<form action="Header.jsp">
		<input type="submit", value ="forward">
	</form>
	
	<div class = container>
		<h5>게시글</h5>
		<div id = "title"></div>
		<div id = "info">
			<div id="profile">
				<a><img id="propic"></a> 
				<span id="writer"></span>
			</div>
			<span id="date"></span>
		</div><!-- info -->
	</div> <!-- container -->

	<hr>
	
	<div id ="content">
	</div><!-- content -->
	
	<h5>댓글</h5>
	<div id = "commmentArea"></div>
	
	
</body>
</html>