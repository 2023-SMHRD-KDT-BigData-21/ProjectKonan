<%@page import="com.konan.model.UserInfoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kor">
<%
		String targetId = request.getParameter("targetId"); 
		pageContext.setAttribute("targetId", targetId);
%>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지</title>
    <link rel="stylesheet" href="./css/Default.css" type="text/css">
    <link rel="stylesheet" href="./css/MyPage.css" type="text/css">
</head>
<body>
	<%@ include file="Header.jsp" %>
    <div class="container">
        <div class="upper">
            <a href="#"><img class="propic" src="./img/defaultPropic.png"></a>
            <h2><span name="username"><%=user.getName()%></span>님<span class="normal">의 정보</span></h2>
            <hr>
        </div>
        
        <div class="info-container">
            <!-- 상단부분 -->
            <div class="tier-container">
                <div class = "mytier shadow-div">
                    <img class = "tier-image" src="./img/tier/lv2.png" alt = "티어 메달 사진">
                    <div class = "user-info">
                        <strong><span name="username"><%=user.getName()%></span>님은</strong>
                        <h3>유명한 탐정입니다</h3>
                        <p>작성 답변 수: </p><span></span>
                        <p>채택 답변 수: </p><span></span>
                    </div>
                </div>

                <!-- 티어 소개 -->
                <div class = "tier-info shadow-div">
                    <strong>탐정 등급</strong>
                    <div class="chart">
                        <canvas id="bar-chart"></canvas>
                    </div>
                </div>
            </div>
        </div>

        <br>

        <!-- 나의 활동 컨테이터 -->
        <div class="my-activity-btn-container align-item">
            <a href = "#"><button id="answer_btn" class="page-btn">내 댓글 확인</button></a>
            <hr class = "vertical">
            <a href = ""><button id="check_like_list_btn" class="page-btn">좋아요 히스토리</button></a>
            <hr class = "vertical">
            <a href = ""><button id="check_block_list_btn" class="page-btn">차단한 사용자 확인</button></a>
        </div>

        <div class="page-btn-container align-item">
            <button id="commu_btn" class="page-btn bold">나의 게시글</button>
            <hr class = "vertical">
            <button id="quest_btn" class="page-btn bold">나의 질문</button>
            <hr class = "vertical">
            <button id="answer_btn" class="page-btn bold">나의 답변</button>
        </div>
        <hr>
        <!-- 내가 쓴 글 모아보기 컨테이너 -->
        <div class="comment-container">
            <div class="comment">
                <a href="#"><strong>컨텐츠 제목</strong></a>
                <p>내용</p>
            </div>
        </div>

    </div>
    <script src="https://cdn.jsdelivr.net/npm/chart.js@4.0.1/dist/chart.umd.min.js"></script>
    <script src="./js/MyPageChart.js"></script>
    <script src="./js/Animation.js"></script>
</body>
</html>