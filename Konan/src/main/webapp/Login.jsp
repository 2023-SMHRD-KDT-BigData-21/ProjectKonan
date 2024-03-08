<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.konan.model.UserInfo"%>
<%@page import="com.konan.model.UserInfoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>Forty by HTML5 UP</title>
		<meta charset="UTF-8" />
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		
		<!-- css -->
		<link rel="stylesheet" href="./css/Login.css" type="text/css">
		<link rel="stylesheet" href="./css/Default.css" type="text/css">
	</head>
	<body>
		<div class="container">
			<!-- Menu -->

			<div class="login-container">
				<h3>로그인</h3>
				<%try{
					 boolean isSuccess = (boolean)session.getAttribute("isSuccess");
			    	 if(isSuccess==false){%>
					 	 <div style="position: relative; margin: 0 auto; color:red;">
							 <p>아이디 혹은 비밀번호를 확인해주세요.</p>
						 </div>
				<%	}
			  	  }catch(Exception e){
			  		  e.printStackTrace();
		      	  }%>
				<form class = "login-form" action="LoginController" method="post">
				 	<input type="text" name="userId" placeholder="아이디를 입력하세요">
					<input type="password" name = "userPw" placeholder="PW를 입력하세요">
					<input type="submit" value="LogIn" class="login_btn">
				</form>
			</div>
		</div>
	</body>
</html>

