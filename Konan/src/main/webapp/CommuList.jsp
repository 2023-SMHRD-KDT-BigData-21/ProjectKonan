<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="/Konan/css/Default2.css">
    <link rel="stylesheet" href="/Konan/css/Jisik.css">
</head>
<body>
    <div class="container">
        <!-- 검색란 -->
        <div class="search-container">
            <div class="search-icon"></div>
            <input type="text" class="search-input">
        </div>


        <div class="wait-quest-container">
            <div class="quest-container-group">
                <div class="quest-container-cov">
                    <span>게시글</span>
                </div>
                <div class="quest-container-in">
                    <div class="quest-title"><span>게시글 제목</span></div>
                    <div class="quest-content"><span>글 내용이 보입니다. 몇 줄 이상이면 줄임표 처리..(메이비)</span></div>
                </div>
                <div class="res-container">
                    <span>답변</span>&nbsp;<span>0</span>&nbsp;&nbsp;&nbsp;&nbsp;
                    <span>좋아요</span>&nbsp;<span>0</span>
                </div>
                <!-- 글쓰기 버튼 -->
                <button class="post-button" style="top: 30%;">
                    <img src="/Konan/img/post.png" alt="Icon" class="post-img">
                </button>
            </div>
        </div>
        
        <div class="more-button">
            <span>더 보기</span>
        </div>
    </div>

    <!-- footer -->
    <div class="footer-container">
        <div class="footer-item">
            <h3>@국민탐정</h3>
        </div>
        <div class="footer-item">
            <p>21기 빅데이터 개발자 과정</p>
        </div>
        <div class="footer-item">
            <p>project.konan@smhrd.com</p>
        </div>
    </div>
</body>

</html>