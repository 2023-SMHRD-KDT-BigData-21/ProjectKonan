<%@page import="com.konan.model.PostDAO"%>
<%@page import="com.konan.model.UserInfoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kor">
<%
String targetId = request.getParameter("targetId");
pageContext.setAttribute("targetId", targetId);

PostDAO postDao = new PostDAO();
%>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>마이페이지</title>
<link rel="stylesheet" href="./css/Default.css" type="text/css">
<link rel="stylesheet" href="./css/MyPage.css" type="text/css">
</head>
<body>
	<%@ include file="Header.jsp"%>
	<div class="container">
		<div class="upper">
			<a href="#"><img class="propic" src="./img/defaultPropic.png"></a>
			<h2>
				<span name="username"><%=user.getName()%></span>님<span
					class="normal">의 정보</span>
			</h2>
			<hr>
		</div>

		<div class="info-container">
			<!-- 상단부분 -->
			<div class="tier-container">
				<div class="mytier shadow-div">
					<img class="tier-image" src="./img/tier/lv2.png" alt="티어 메달 사진">
					<div class="user-info">
						<strong><span name="username"><%=user.getName()%></span>님은</strong>
						<h3>유명한 탐정입니다</h3>
						<span>작성 답변 수: </span><span><%=postDao.myList(user.getUser_id(), "A").size()%></span>
					</div>
				</div>

				<!-- 티어 소개 -->
				<div class="tier-info shadow-div">
					<strong>탐정 등급</strong>
					<div class="chart">
						<canvas id="bar-chart"></canvas>
					</div>
				</div>
			</div>
		</div>

		<br>

		<!-- 나의 활동 컨테이터 -->
		<!-- 나의 활동 내역(좋아요, 댓글, 차단목록 확인 버튼)
             좋아요한 게시글 목록 확인/삭제
             댓글 단 게시글 목록 확인/삭제 
             차단 목록 확인/삭제
             
             계정관리
             :: 아래 페이지로 이동할 수 있는 목록 정렬을 위한 페이지
             목록 조회(아래 페이지로 이동할 수 있는)
             비밀번호 확인 페이지(c,d,e로 이동하기 전에 거치는 페이지)
             회원정보 수정 페이지(탐정 추후 요청)
             비밀번호 변경 페이지
             회원탈퇴 페이지
             회원탈퇴 완료 
      -->
		<h3>&nbsp;나의 활동 기록</h3>
		
		<div class="activity shadow-div" style="margin-top: 10px">
			<ul id="active-list ">
				<div class="my-activity-btn-container align-item">
					<ul>
						<li class="list active_header"><a href="Main.jsp" class="link">
						<ion-icon name="search-circle-outline" style="font-size: 1.5em;position:relative; top:7px;"></ion-icon>
						<span style="font-size: 1em;">&nbsp;&nbsp;나의 댓글 목록</span>
						</a></li>
						<br>
						<li class="list"><a href="AccModify.jsp" class="link"> 
						<ion-icon name="person-circle-outline" style="font-size: 1.5em;position:relative; top:7px;"></ion-icon>
						<span style="font-size: 1em;">&nbsp;&nbsp;회원 정보 수정</span>
						</a></li>
						<br>
						<li class="list"><a href="AccOut.jsp" class="link"> 
						<ion-icon name="chatbubbles-outline" style="font-size: 1.5em;position:relative; top:7px;"></ion-icon>
						<span style="font-size: 1em;">&nbsp;&nbsp;회원 탈퇴</span>
						</a></li>
					</ul>
				</div>
			</ul>
		</div>
	</div>
	<%@ include file="Footer.jsp"%>
	<script
		src="https://cdn.jsdelivr.net/npm/chart.js@4.0.1/dist/chart.umd.min.js"></script>
	<script src="./js/MyPageChart.js"></script>
	<script src="./js/Animation.js"></script>
</body>
</html>