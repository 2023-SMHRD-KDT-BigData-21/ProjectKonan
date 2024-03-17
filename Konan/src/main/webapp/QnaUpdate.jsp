<%@page import="com.konan.model.Post"%>
<%@page import="com.konan.model.PostDAO"%>
<%@page import="java.math.BigDecimal"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질문 수정</title>
<link rel="stylesheet" href="./css/Default2.css">
<link rel="stylesheet" href="./css/QnaForm.css">
</head>

<body>
	<%@ include file="Header.jsp"%>
	<%
	// 수정 시 게시글 정보 불러오기
	BigDecimal postId = BigDecimal.valueOf(Double.valueOf(request.getParameter("idx")));
	PostDAO postDao = new PostDAO();
	Post post = postDao.postContent(postId);
	
	%>
	
	<div class="container">
		<!-- 질문작성 -->
		<div class="post-container">
			<form action="PostUpdateController" method="post" enctype="multipart/form-data">
				<div class="post-pre-title">
					<span>질문 수정</span>
				</div>
				<input type="hidden" name="post_id" value=<%=postId%>>
				<input type="hidden" name="postType" value="Q"> 
				<input type="radio" name="isAnonymous" value="F" checked="checked"> 실명으로 작성 
				<input type="radio" name="isAnonymous" value="T">익명으로 작성
				<div class="post-title-container">
					<input type="text" class="post-title" placeholder="제목입력" name="title" value="<%=post.getTitle()%>" required>
					<textarea class="post-content" placeholder="본문입력" name="content" required><%=post.getPost_content()%></textarea>
				</div>
				<div class="add-photo-container">
					<div class="add-photo-text">
						<span>사진추가</span>
					</div>
					<div class="add-photo-img-container">
						<label for="photo1">
							<div class="add-photo-img" id="img1">
								<input type="file" id="photo1" name="photo1" accept="image/*"
									style="display: none;" onchange="setThumbnail(event,1);">
							</div>
						</label> <label for="photo2">
							<div class="add-photo-img" id="img2">
								<input type="file" id="photo2" name="photo2" accept="image/*"
									style="display: none;" onchange="setThumbnail(event,2);">
							</div>
						</label> <label for="photo3">
							<div class="add-photo-img" id="img3">
								<input type="file" id="photo3" name="photo3" accept="image/*"
									style="display: none;" onchange="setThumbnail(event,3);">
							</div>
						</label> <label for="photo4">
							<div class="add-photo-img" id="img4">
								<input type="file" id="photo4" name="photo4" accept="image/*"
									style="display: none;" onchange="setThumbnail(event,4);">
							</div>
						</label> <label for="photo5">
							<div class="add-photo-img" id="img5">
								<input type="file" id="photo5" name="photo5" accept="image/*"
									style="display: none;" onchange="setThumbnail(event,5);">
							</div>
						</label>
					</div>
					<!-- add-photo-img-container -->
				</div>
				<!-- add-photo-container -->
				<div class="btn-post">
					<button type="submit">
						<span>질문수정</span>
					</button>
				</div>
				<!-- btn-post -->

			</form>
		</div>
		<!-- post-container -->

		<!-- 해시태그
	        <div class="add-tag-container">
	        	<input type="text" id="tag">
	        </div>
	         -->

	</div>

	<!-- footer -->
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

	<script>
		// 이미지가 추가되면 "+" 기호를 숨
		function setThumbnail(event, num) {
			var reader = new FileReader();

			reader.onload = function(event) {
				var imgSrc = event.target.result;

				// 썸네일 설정
				var container = document.querySelector("div#img" + num);
				container.style.backgroundImage = "url('" + imgSrc + "')";
				container.style.backgroundSize = "cover";

				// "+" 기호 숨기기
				var addPhotoImg = document.querySelector(".add-photo-img#img"
						+ num);
				addPhotoImg.classList.add('hide-plus');
			};

			reader.readAsDataURL(event.target.files[0]);
		}
	</script>

</body>
</html>