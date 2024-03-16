<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
<link rel="stylesheet" href="./css/Default.css" type="text/css">
<link rel="stylesheet" href="./css/AccModify.css" type="text/css">
</head>
<body
	style="background-image: url('./img/background.gif'); background-size: cover;">
	<div class="container" style="text-align: center; top: 20px;">
		<div class="actions-vertical">
			<img src="./img/logo.png" style="width: 300px; height: auto;">
			<h5>회원정보수정</h5>
			<form action="UpdateController" method="post"
				enctype="multipart/form-data" class="modify-form">
				<table>

					<tr>
						<td><input type="password" name="user_pw"
							placeholder="PW를 입력하세요"></td>
					</tr>
					<tr>
						<td><input type="text" name="email"
							placeholder="email을 입력하세요"></td>
					</tr>
					<tr>
						<td><input type="text" name="name" placeholder="이름을 입력하세요"></td>
					</tr>
					<tr>
						<td><input type="text" name="phone_number"
							placeholder="전화번호를 입력하세요"></td>
					</tr>
					<tr>
						<td><input type="text" name="region" placeholder="주소를 입력하세요"></td>
					</tr>
					<!-- <tr>
						<td align="right">성별</td>
	                	<td><input type="radio" name="gender" value="남자">남자 <input type="radio" name="gender" value="여자"> 여자</td>
					</tr> -->



					<tr>
						<td><input type="submit" value="수정" class="modify_btn"></td>
					</tr>
				</table>
			</form>
			<button class="join_as_detective"
				style="background-image: url('./img/background.gif'); background-size: cover;">
				<a href="JoinAsDetective.jsp" style="color: white;">탐정승인</a>
			</button>

		</div>
	</div>

</body>
</html>