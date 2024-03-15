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
		<form action="UpdateController" method="post" enctype="multipart/form-data" >
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
					<td><input type="text" name = "region" placeholder="주소를 입력하세요" ></td>
				</tr>
				<tr>
					<td align="right">성별</td>
                	<td><input type="radio" name="gender" value="남자">남자 <input type="radio" name="gender" value="여자"> 여자</td>
				</tr>
				
				
				
				<tr>
					<td><input type="submit" value="수정" class="button fit"></td>
				</tr>
			</table>
		</form>
		<button><a href="JoinAsDetective.jsp">탐정승인</a></button>
	</div>
	
	
</body>
</html>