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
<title>메인페이지</title>
</head>
<body>

<div class="container">
	<%UserInfo user = (UserInfo)session.getAttribute("loginInfo");
	
	%>
	
	<%if(user==null){%>
	
	<a href="Join.jsp"><button>회원가입</button></a>
	<a href="Login.jsp"><button>로그인</button></a>
	
	<%}else{%>
		<%=user.getName() %>
		<a href="LogoutController"><button>로그아웃</button></a>
		<a href="Profile.jsp"><button>프로필</button></a>
	<%} %>
	
	
</div>

</body>
</html>