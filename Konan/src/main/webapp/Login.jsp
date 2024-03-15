<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.konan.model.UserInfo"%>
<%@page import="com.konan.model.UserInfoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
         <%
         try {
            boolean isSuccess = (boolean) session.getAttribute("isSuccess");
            if (isSuccess == false) {
         %>
         <div style="position: relative; margin: 0 auto; color: red;">
            <p>아이디 혹은 비밀번호를 확인해주세요.</p>
         </div>
         <%
         }
         } catch (Exception e) {
         e.printStackTrace();
         }
         %>
         <form class="login-form" action="LoginController" method="post">
            <input type="text" name="userId" placeholder="아이디를 입력하세요"> <input
               type="password" name="userPw" placeholder="PW를 입력하세요"> <input
               type="submit" value="LogIn" class="login_btn">
            <!-- 카카오 로그인 버튼 -->
            <a href="#" onclick="kakaoLogin()" class="kakao-login-btn"> <img
               src="https://developers.kakao.com/tool/resource/static/img/button/login/full/ko/kakao_login_medium_wide.png"
               alt="카카오 로그인">
            </a>
            <!-- 회원가입 버튼 -->
            <button class="join_btn">
                <a href="Join.jsp">회원가입</a>
             </button>
         </form>
      </div>




    <!-- 카카오 스크립트 -->
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <script>
    Kakao.init('395d1c4b3a93016219cd87d0a7135a25'); //발급받은 키 중 javascript키를 사용해준다.
    console.log(Kakao.isInitialized()); // sdk초기화여부판단
    //카카오로그인
    function kakaoLogin() {
        Kakao.Auth.login({
          success: function (response) {
            Kakao.API.request({
              url: '/v2/user/me',
              success: function (response) {
                  console.log(response)
              },
              fail: function (error) {
                console.log(error)
              },
            })
          },
          fail: function (error) {
            console.log(error)
          },
        })
      }
    //카카오로그아웃  
    function kakaoLogout() {
        if (Kakao.Auth.getAccessToken()) {
          Kakao.API.request({
            url: '/v1/user/unlink',
            success: function (response) {
                console.log(response)
            },
            fail: function (error) {
              console.log(error)
            },
          })
          Kakao.Auth.setAccessToken(undefined)
        }
      }  
    </script>
   </body>
</html>