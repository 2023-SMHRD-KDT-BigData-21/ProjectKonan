<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String sessionId = session.getId();
	// 세션 무효화 (로그아웃)
	session.removeAttribute("id");
	response.sendRedirect("Main.jsp");
%>
</body>
</html>