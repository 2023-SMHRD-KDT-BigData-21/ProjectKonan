
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<!--  시험 페이지, 이 구성으로 가는 거 아님 되는 지 확인해 본 것! -->

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <link rel="stylesheet" type="text/css" href="./css/Join.css">
</head>

<body>
    <div id = "container" class="container">
        <h1>회원가입</h1>
        <form action="JoinMemberInfo.jsp" method="post"> <!-- post 방식으로 전송한다는 뜻 -->
            <div class="input-group">
                <label for="id">아이디:</label>
                <input type="text" id="id" name="id" autofocus="autofocus">
                <div id="errorElement"></div>
			</div>
            <button type="submit">확인</button>
        </form>
    </div>

<script>
	// 비밀번호가 일치하지 않으면 폼 전송이 안되게 하는 함수
	console.log("js 정상 작동")
	document.getElementById('container').addEventListener('submit',function(event){
		let inputID = document.getElementById('id').value
		let errorElement = document.getElementById('errorElement')
		console.log(inputID.length)
		if(inputID.length < 8){
			errorElement.innerHTML = "<p style = 'color:red; '>너무 짧은 아이디입니다. 6자 이상 입력해주세요</p>"
            event.preventDefault(); // 폼 전송 방지
		}
		
		//db에서 중복 조회해보기 > select문으로 inputID값과 같은 아이디를 조회했을때 row num이 1이면
		let rowNum = 0
		if(rowNum > 0){
			errorElement.innerHTML = "<p style = 'color:red; '>이미 존재하는 아이디입니다.</p>"
            event.preventDefault(); // 폼 전송 방지
		}
	}) 
</script>


</body>
</html>