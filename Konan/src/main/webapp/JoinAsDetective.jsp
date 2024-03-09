<%@page import="com.konan.model.UserInfo"%>
<%@ page isELIgnored="false"  language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>탐정으로 가입 신청</title>
</head>
<body>
	<% 
		UserInfo user = (UserInfo)session.getAttribute("userInfo");
		String userId = user.getUser_id();
		
		pageContext.setAttribute("userId", userId);
	%>
	<form action="JoinAsDetectiveController" method="post" enctype="multipart/form-data">
		<%-- userInfo 세션에서 아이디 빼 넣어주기 --%>
		<input type="hidden" name="user_id" value="${userId}"> 
		<input type="file" name="proof_shot" id="proofShot">
		<input type="submit" value="승인 신청">
	</form>
	<a href="JoinSuccess.jsp"><button>지금은 넘어가기</button></a>
</body>
</html>