
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
	
	<%
	request.setCharacterEncoding("UTF-8");
	//id값 가져오기
	String id = request.getParameter("id");
	%>
	
    <div id = "container" class="container">
        <h1>회원가입</h1>
        <form action="JoinPw.jsp" method="post">
        	<%-- 받아온 id 값 --%>
        	
        	<input type="hidden" id = "id" name = "id" value = "<%=id%>" >
        	
        	
            <div class="input-group">
                <label for="name">이름:</label>
                <input type="text" id="name" name="name" autofocus="autofocus">
			</div>
            <div class="input-group">
                <label for="email">이메일:</label>
                <input type="text" id="email" name="email">
            </div>
            <button type="submit">확인</button>
        </form>
    </div>
	<script>
		// 비밀번호가 일치하지 않으면 폼 전송이 안되게 하는 함수
		document.getElementById('container').addEventListener('submit',function(event){
			let password = document.getElementById('password').value
			let password_check = document.getElementById('password_check').value
			let errorElement = document.getElementById('password_error')
			
			if(password !== password_check){
				errorElement.innerHTML = "<p style = 'color:red; '>비밀번호가 일치하지 않습니다.</p>"
	            event.preventDefault(); // 폼 전송 방지
			}else{
				errorElement.textContent = ''
			}
		}) 
	</script>


</body>
</html>