<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴 확인</title>
<!-- css -->
<link rel="stylesheet" href="./css/Default.css" type="text/css">
<link rel="stylesheet" href="./css/Login.css" type="text/css">
</head>
<body style="background-image: url('./img/background.gif'); background-size: cover;">
	<div class="container" style="top: 20px;">
		<div class="login-container">
			<img src="./img/logo.png" style="width: 300px; height: auto;">
			<form action="DeleteController" method="post">
				<h4 style="margin-top: 80px;">비밀번호를 다시 입력해주세요</h4>
				<input type="text" name="user_pw" class="input"> 
				<br>
				<input type="submit" value="탈퇴"
					class="login_btn" style="cursor: pointer;">
			</form>
		</div>
	</div>
</body>
</html>