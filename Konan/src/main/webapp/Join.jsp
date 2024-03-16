<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<!-- css -->
<link rel="stylesheet" href="./css/Default.css" type="text/css">
<link rel="stylesheet" href="./css/Login.css" type="text/css">
</head>
<body
	style="background-image: url('./img/background.gif'); background-size: cover;">
	<div class="container" style="top:20px;">
		<!-- 회원가입 컨테이너 -->
		<div class="login-container">
			<img src="./img/logo.png" style="width: 300px; height: auto;">
			<h5>회원가입</h5>

			<form action="JoinController" method="post" class="login-form">
				<input type="text" name="user_id" id="user_id"
					placeholder="아이디를 입력하세요"> 
				<input type="button" name=""
					value="아이디 중복 확인" onclick="checkId()" class="login_btn" style="background-color: var(--lightmain); border: 0px; color: var(--maincolor); font-weight: bold;"> 
				<span id="errorMessage"></span> 
				<input type="password" name="user_pw" placeholder="PW를 입력하세요"> 
				<input type="text" name="email" placeholder="email을 입력하세요"> 
				<input type="text" name="name" placeholder="이름을 입력하세요"> 
				<input type="text" name="phone_number" placeholder="전화번호를 입력하세요"> 
				<input type="submit" value="가입하기" class="login_btn" >
			</form>
		</div>
	</div>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script>
		function checkId() {

			let user_id = document.getElementById("user_id")
			console.log(user_id.value)

			$.ajax({
				type : "get", // 타입 (get, post, put 등등)    
				url : "IdCheckController", // 요청할 서버url    
				async : true, // 비동기화 여부 (default : true)    
				dataType : "text", // 데이터 타입 (html, xml, json, text 등등), 여러개 보낼 땐 보통 json으로 보냄
				data : {
					"userId" : user_id.value
				},
				success : function(result) { // 성공 콜백함수        
					console.log(result);
					if (result == "true") {
						$("#errorMessage").text("사용할 수 없는 아이디입니다.")
					} else {
						$("#errorMessage").text("사용할 수 있는 아이디입니다.")
					}
				},
				error : function(request, status, error) { //에러 콜백함수        
					console.log("중복체크 실패")
					console.log(request.responseText)
					console.log(error)
				}
			})
		}
	</script>
</body>
</html>