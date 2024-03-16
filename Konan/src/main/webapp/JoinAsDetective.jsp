<%@page import="com.konan.model.UserInfo"%>
<%@ page isELIgnored="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>탐정으로 가입 신청</title>
<link rel="stylesheet" href="./css/Default.css" type="text/css">
<link rel="stylesheet" href="./css/JoinAsDetective.css" type="text/css">
</head>
<body>
	<div class="container" style="text-align: center; top:20px;">
		<h2>탐정 승인 신청</h2>
		<br>
		<%
		UserInfo user = (UserInfo) session.getAttribute("userInfo");
		String userId = user.getUser_id();

		pageContext.setAttribute("userId", userId);
		%>
		<form action="JoinAsDetectiveController" method="post"
			enctype="multipart/form-data">
			<label for="proofShot">
				<div class="add-photo-img shadow-div" id="img1">
					<ion-icon name="cloud-upload-outline"></ion-icon>
					<!-- accept="image/*"로 인풋 파일을 이미지로 제한 -->
					<input type="file" id="proofShot" name="proof_shot" accept="image/*" style="display: none;">
				</div>
			</label>
			<%-- userInfo 세션에서 아이디 빼 넣어주기 --%>
			<input type="hidden" name="user_id" value="${userId}" class="btn" style="border-radius: 20px; font-weight: bold;">
			<input type="submit" value="승인 신청" class="btn" style="margin-top: 15px">
			
		</form>
		
		<!-- 메인 페이지로 넘어가기 -->
		<a href="JoinSuccess.jsp"><button class="btn" style="background-color: var(--lightmain); font-weight: bold; color: var(--maincolor);"> 지금은 넘어가기</button></a>
	</div>
</body>
</html>