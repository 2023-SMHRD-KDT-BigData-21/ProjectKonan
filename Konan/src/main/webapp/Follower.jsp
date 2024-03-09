<%@page import="com.konan.model.FollowerInfo"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="java.util.List"%>
<%@page import="com.konan.model.UserInfoDAO"%>
<%@page import="com.konan.model.UserInfo"%>
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
	UserInfo userInfo = (UserInfo)session.getAttribute("loginId"); 
	System.out.print(userInfo);
	System.out.print(userInfo.getUser_id());
	%>
	
	<div class="upper">

	</div>
	
	
	
</body>
</html>


