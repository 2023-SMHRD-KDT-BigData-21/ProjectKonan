<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티 게시글</title>
<link rel="stylesheet" href="./css/CommuContent.css">
<link rel="stylesheet" href="./css/HeartBtn.css">
</head>
<body>
	<%@ include file="Header.jsp"%>
	<!-- body 전체 가운데로 -->
	<div class="container">

		<!-- 게시글 박스-->
		<div class="post-container shadow-div">
			<div class="post-title-container">

				<!-- 해시태그 공간 -->
				<div class="hashtags-container">
					<div class="hashtags">
						<span>#호기심</span> <span>#명탐정코난</span>
					</div>
					<div class="btn-bookmark"></div>
				</div>


				<!-- 포스트 상단 -->
				<div class="post-group">
					<div class="post-title">
						<span>탐정 쉽게 되는 법</span>
					</div>
					<div class="post-author">
						<span>작성자</span><span>유명한</span>
					</div>
					<div class="post-date">
						<span>작성일자</span><span>2024.01.01</span>
					</div>
				</div>
				<!-- post-group -->
			</div>

			<!-- 내용 -->
			<div class="post-container">

				<!-- 사진 -->
				<div></div>

				<!-- 글 내용 -->
				<div class="post">
					<span>머리가 좋으면 됩니다</span>
				</div>


				<div class="likes-replies-container">
					<span class="heart"></span>&nbsp;&nbsp;&nbsp;
					<span class="btn-likes">좋아요</span>&nbsp;<span style="font-size: 0.9em;">1</span>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<ion-icon name="chatbox-ellipses-outline" style="font-size: 1.3em;  color:gray; position: relative; top: -3px;"></ion-icon> &nbsp;&nbsp; 
					<span>답변 </span>&nbsp;&nbsp;<span style="font-size: 0.9em;">25</span>
					
				</div>
				<!-- likes-replies-container -->
			</div>
			<!-- likes-replies-container -->
		</div>
		<!-- post-container -->


		<!-- 댓글! -->
		<div class="comment-text"  style="font-weight: bold; font-size: 1.2em;">
			<span>댓글</span>&nbsp;<span>4</span>
		</div>

		<!-- 댓글 박스 -->
		<div class="comments-container">
			<div class="comment-area">
				<!-- 이미 쓰여 있는 댓글 박스 -->
				<div class="comment-container">

					<!-- 댓글 작성자 -->
					<div class="comment-info">
						<!-- 댓글 작성자 프사 넣는 공간 -->
						<div class="comment-propic"></div>
						<div class="comment-name">이름</div>
					</div>


					<div class="comment-content shadow-div">
						<!-- 댓글 내용 -->
						<span>댓글내용댓글내용댓글내용</span>
						<!-- 수정/삭제/신고 버튼 -->
						<div class="btn-edit">
							<ion-icon name="ellipsis-horizontal-outline"></ion-icon>
						</div>
						<div class="comment-btn">
							<div class="comment-btn-likes">
								<span>좋아요</span>
							</div>
							&nbsp; &nbsp; &nbsp;
							<div class="comment-btn-reply">
								<span>답글</span>
							</div>
						</div>
						<!-- comment-btn -->
					</div>
					<!-- comment-content -->
				</div>
				<!-- comment-container -->
			</div>


			<!-- 대댓글 박스 -->
			<div class="recomments-container">
			<div class="comment-area">
				<!-- 이미 쓰여 있는 댓글 박스 -->
				<div class="comment-container">

					<!-- 댓글 작성자 -->
					<div class="comment-info">
						<!-- 댓글 작성자 프사 넣는 공간 -->
						<div class="comment-propic"></div>
						<div class="comment-name">이름</div>
					</div>


					<div class="comment-content shadow-div" style="background-color: lightgray">
						<!-- 댓글 내용 -->
						<span>대댓글내용대댓글내용대댓글내용</span>
						<!-- 수정/삭제/신고 버튼 -->
						<div class="btn-edit">
							<ion-icon name="ellipsis-horizontal-outline"></ion-icon>
						</div>
						<div class="comment-btn">
							<div class="comment-btn-likes">
								<span>좋아요</span>
							</div>
							&nbsp; &nbsp; &nbsp;
							<div class="comment-btn-reply">
								<span>답글</span>
							</div>
						</div>
						<!-- comment-btn -->
					</div>
					<!-- comment-content -->
				</div>
				<!-- comment-container -->
			</div>

			<!-- 댓글 쓰기 박스-->
			<div class="user-reply-container">
				<div class="profile-img"></div>
				<div class="content-container">
					<div class="post-reply">
						<span>댓글 쓰기</span>
					</div>
					<input type="text" name="reply-comment" class="reply-comment"
						placeholder="남기고 싶은 이야기를 적으셈">
				</div>
			</div>
			<div class="reply-btn">
				<button type="submit">
					<span>게시하기</span>
				</button>
			</div>

		</div>
	</div>


	</div>


	<!-- footer 
    <div class="footer-container">
        <div class="footer-item">
            <p1>21기 빅데이터 개발자 과정</p1>
        </div>
        <div class="footer-item">
            <h3>@국민탐정</h3>
        </div>
        <div class="footer-item">
            <p2>project.konan@smhrd.com</p2>
        </div>
    </div>
-->

	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
	<script>
		//하트 버튼
		$(document).ready(function() {
			$('.heart').click(function() {
				$('.heart').toggleClass("heart-active")
			});
		});
	</script>
</body>

</html>