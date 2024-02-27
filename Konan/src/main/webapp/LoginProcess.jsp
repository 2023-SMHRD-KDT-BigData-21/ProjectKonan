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
	String id = request.getParameter("id");


	//중요 정보는 쿠키에 담으면 안됨
	//Cookie cookie = new Cookie("user_id",id); //삭제 메서드는 없어서 삭제하고 싶은 쿠키와 같은 name을 가진 쿠키를 설정
	//cookie.setMaxAge(60*60*24*365);//초단위
	//response.addCookie(cookie);//client한테 쿠키 보냄
	
	//Session이란: 서버에서 클라이언트에게 임의적으로, 자동적으로 부여하는 아이디 값으로 절대 겹치지 않음
	//서버에서 정보를 관리, 아이디값을 저장하고있는건 클라이언트
	// 세션을 가져오거나 새로 생성
	
	//세션 생성 및 유저 이름 저장
    session.setAttribute("id", id);
    session.setMaxInactiveInterval(60*60*24*365); //1년 기한
	response.sendRedirect("Main.jsp");
%>
</body>
</html>