<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="actions vertical">
		<h5>회원정보수정</h5>
		<form action="UdateController" method="post">
			<table>
				
				<tr>
					<td><input type="password" name= "user_pw" placeholder="PW를 입력하세요" ></td>
				</tr>
				<tr>
					<td><input type="text" name= "email" placeholder="email을 입력하세요" ></td>
				</tr>
				<tr>
					<td><input type="text" name="name" placeholder="이름을 입력하세요" ></td>
				</tr>
				<tr>
					<td><input type="text" name = "phone_number" placeholder="전화번호를 입력하세요" ></td>
				</tr>
				
				<tr>
					<td><input type="submit" value="JoinUs" class="button fit"></td>
				</tr>
			</table>
		</form>
	</div>
	
	
</body>
</html>