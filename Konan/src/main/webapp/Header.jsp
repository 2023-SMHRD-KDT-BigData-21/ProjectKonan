<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage=""%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>국민탐정</title>
    <link  rel="stylesheet" type="text/css" href="./css/Header.css">
</head>
<body>
	<!-- 공통 header -->
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<%-- 헤더 구조 --%>	
	<header class = "header">
	<a href = "Main.jsp"><img class = "logo" src = "./img/logo/logo_ori.png" alt = "logo"></a>
		<ul class="nav">
        	<li class="nav_item"><a href="#">커뮤니티</a></li>
            <li class="nav_item"><a href="#">Q&A</a></li>
            <li class="nav_item"><a href="#">탐정소식</a></li>
            
            <%-- 브라우저가 최초의 요청을 발생시키고 브라우저를 닫을 때 까지
			SessionScope에서는 session영역에 저장되어 있는 데이터나 객체를 자유롭게 사용 가능 --%>
			<!-- c:when:: 로그아웃 상태인 경우에만 표시될 항목 -->
			<!-- c:otherwise:: 로그인 상태인 경우에만 표시될 항목 -->
            <c:choose>
            	
            	
                <c:when test="${empty sessionScope.id}"> 					 
            		<li class="nav_item"><a href="Login.jsp">로그인</a></li>
            		<li class="nav_item"><a href="JoinId">회원가입</a></li>
            	</c:when>
            	
            	<c:otherwise>
            		<li class="nav_item"><a href="LogoutProcess.jsp">로그아웃</a></li>
            	</c:otherwise>
            	
            </c:choose>
         </ul>
	</header>
</body>
</html>