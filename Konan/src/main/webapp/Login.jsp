<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link  rel="stylesheet" type="text/css" href="./css/Login.css">
</head>
<body>

<div class="loginContainer">
    <h2>로그인</h2>
    <form action="LoginProcess.jsp" method="post">
        <input type="text" id="id" name="id" placeholder="아이디" required autofocus="autofocus"><br>
        <input type="password" id="pw" name="pw" placeholder="비밀번호" required><br>
        <button type="submit">로그인</button>
        <div id="errorElement"></div>
    </form>
</div>
<script>
	console.log("js 정상 작동")
	document.getElementsByClassName('loginContainer')[0].addEventListener("submit",function(event){
		let errorElement = document.getElementById('errorElement')
		let id = document.getElementById('id').value
		let pw = document.getElementById('pw').value
		console.log(id, pw)
		
		//원래라면 db에서 검색해 ㄱㅊ은지 확인하는 시스템이겠으나 일단은 대충 만들어봄
		if(id!="admin" || pw!="0000"){
			errorElement.innerHTML = "<p style = 'color:red; '>아이디 혹은 비밀번호가 잘못 되었습니다.</p>"
	        event.preventDefault(); // 폼 전송 방지
		}
	})
</script>
</body>
</html>