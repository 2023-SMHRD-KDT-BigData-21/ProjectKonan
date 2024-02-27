
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
		String name = request.getParameter("name");
		String email = request.getParameter("email");
	%>
    <div id = "container" class="container">
        <h1>회원가입</h1>
        
        <%-- Join.java로 넘김 --%>
        <form action="Join" method="post"> 

			<%-- JoinMemberInfo 에서 받아온 값들 --%>
			<input type="hidden" id = "id" name = "id" value = "<%=id%>" >
        	<input type="hidden" id = "name" name = "name" value = "<%=name%>" >
        	<input type="hidden" id = "email" name = "email" value = "<%=email%>" >
            
            
            <div class="input-group">
                <label for="password">비밀번호:</label>
                <input type="password" id="password" name="password">
            </div>
            <div class="input-group">
                <label for="password">비밀번호 확인:</label>
                <input type="password" id="password_check">
                <div id="password_error" class="error"></div>
            </div>
            <button type="submit">가입하기</button>
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