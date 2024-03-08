<%@page import="java.util.List"%>
<%@page import="com.konan.model.UserInfoDAO"%>
<%@page import="com.konan.model.UserInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
</head>
<body>

<div class="container">
	<%
	try{ 
		boolean isSuccess = (boolean)session.getAttribute("isSuccess");
			    if(isSuccess==true){
		    UserInfo user = (UserInfo)session.getAttribute("user");
	%>
		    <h3><%=user.getUserId()%>님 환영합니다!</h3>
	<%
	}
			  }catch (Exception e){
		  e.printStackTrace();
			  }
	%>
	
</div>

</body>
</html>