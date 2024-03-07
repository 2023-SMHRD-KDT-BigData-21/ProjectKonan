<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div class="actions vertical">
		<h5>회원가입</h5>
		<form action="JoinController" method="post">
			<table>
				<tr>
					<td><input type="text" name = "id" id="id" placeholder="아이디를 입력하세요" ></td>
					<td><input type="button" name="" value="아이디 중복 확인" onclick="checkId()"><br>
					<span id="errorMessage"></span></td>
				</tr>
				<tr>
					<td><input type="password" name = "pw" placeholder="PW를 입력하세요" ></td>
				</tr>
				
				<tr>
					<td><input type="email" name="email" placeholder="e_mail을 입력하세요"></td>
				</tr>
				<tr>
					<td><input type="email" name="name" placeholder="성함을 입력하세요"></td>
				</tr>
				<tr>
					<td><input type="text" name = "tel" placeholder="전화번호를 입력하세요" ></td>
				</tr>
				<tr>
					<td><input type="text" name = "gender" placeholder="성별 입력하세요" ></td>
				</tr>
				<tr>
					<td><input type="file" name = "img" id="photo" ></td>
				</tr>
				<tr>
					<td><input type="submit" value="JoinUs" class="button fit"></td>
				</tr>
				
				
			</table>
		</form>
	</div>
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script>
		function checkId(){
			let id = document.getElementById("id")
			console.log(id.value)
			
			$.ajax({    
			type : "get", // 타입 (get, post, put 등등)    
			url : "IdCheckController", // 요청할 서버url    
			async : true,  // 비동기화 여부 (default : true)    
			dataType : "text", // 데이터 타입 (html, xml, json, text 등등), 여러개 보낼 땐 보통 json으로 보냄
			data : {"id" : id.value},
			success : function(result) { // 성공 콜백함수        
						console.log(result);
						if(result == "true"){
							$("#errorMessage").text("사용할 수 없는 아이디입니다.")							
						}else{
							$("#errorMessage").text("사용할 수 있는 아이디입니다.")														
						}
					},    
			error : function(request, status, error) { //에러 콜백함수        
						console.log("중복체크 실패")    
					}
			})
		}
		
		
	</script>	
</body>
</html>