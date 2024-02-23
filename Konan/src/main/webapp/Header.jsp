<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage=""%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>국민탐정</title>
</head>
<body>
	<!-- 공통 header -->
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%boolean isLoggedIn = false; %>
	<header>
		<nav>
        	<div><a href="#">커뮤니티</a></div>
            <div><a href="#">Q&A</a></div>
            <div><a href="#">탐정소식</a></div>
            <!-- 로그인 상태인 경우에만 표시될 항목 -->
            <%if(isLoggedIn){ // 로그인 상태를 반환해주는 isLoggedIn 변수가 있다는 가정 하에 코드 짜봄%>
            	<div><a href="#">로그인</a></div>
            	<div><a href="#">회원가입</a></div>

            <!-- 로그아웃 상태인 경우에만 표시될 항목 -->
            <%}else{%>
            	<div><a href="#">로그인</a></div>
            	<div><a href="#">회원가입</a></div>
            <%}%>
		</nav>
	</header>
	
	<% for(int i = 0 ; i <10 ; i++){
		out.print(i);
	}%>
	
	<!-- tag lib 사용해보기 -->
	
	<c:forEach var="i" begin = "1" end = "10" step = "1">
		
	</c:forEach>
</body>
</html>