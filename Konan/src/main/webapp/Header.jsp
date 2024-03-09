<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>국민탐정</title>
    <link rel="stylesheet" href="./css/Header.css" type="text/css">
</head>

<body>
    <div class="navigation">
        <ul>
            <li class="list active_header">
                <a href="Main.jsp">
                    <span class="icon"><ion-icon name="home-outline"></ion-icon></span>
                    <span class="title">메인페이지</span>
                </a>
            </li>
            <li class="list">
                <a href="Profile.jsp">
                    <span class="icon"><ion-icon name="person-outline"></ion-icon></span>
                    <span class="title">내 프로필</span>
                </a>
            </li>
            <li class="list">
                <a href="CommuList.jsp">
                    <span class="icon"><ion-icon name="chatbubbles-outline"></ion-icon></span>
                    <span class="title">커뮤니티</span>
                </a>
            </li>
            <li class="list">
                <a href="Mypage.jsp">
                    <span class="icon"><ion-icon name="settings-outline"></ion-icon></span>
                    <span class="title">마이페이지</span>
                </a>
            </li>
            <li class="list">
                <a href="LogoutController">
                    <span class="icon"><ion-icon name="log-out-outline"></ion-icon></span>
                    <span class="title">로그아웃</span>
                </a>
            </li>
        </ul>
    </div>
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    <script src="./js/Header.js"></script>
</body>
</html>