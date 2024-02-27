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
	<%

		boolean isLoggedIn = false;
	 %>
	<header>

		<nav>
        	<div><a href="#">커뮤니티</a></div>
            <div><a href="#">Q&A</a></div>
            <div><a href="#">탐정소식</a></div>
            <!-- 로그아웃 상태인 경우에만 표시될 항목 -->
            <c:choose>
                <c:when test="${empty sessionScope.id}">
            		<div><a href="Login.jsp">로그인</a></div>
            		<div><a href="JoinId">회원가입</a></div>
            <!-- 로그인 상태인 경우에만 표시될 항목 -->
            	</c:when>
            	<c:otherwise>
            		<div><a href="LogoutProcess.jsp">로그아웃</a></div>
            	</c:otherwise>
            </c:choose>
		</nav>
	</header>
</body>
</html>