<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="Header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String sessionId = session.getId();
	String userId = (String)session.getAttribute("id");
	
	if(userId!=null){
		isLoggedIn = true;
	}
%>

<h1><%=userId %></h1>

</body>
</html>