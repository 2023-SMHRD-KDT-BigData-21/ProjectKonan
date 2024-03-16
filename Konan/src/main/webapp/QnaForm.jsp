<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>질문 작성</title>
<link rel="stylesheet" href="./css/Default.css">
<link rel="stylesheet" href="./css/QnaForm.css">
</head>

<body>
	<%@ include file="Header.jsp"%>
	<div class="container">
		<!-- 질문작성 -->
		<div class="post-container">
			<form action="PostInsertController" method="post"
				enctype="multipart/form-data">
				<input type="hidden" name="postType"
					formaction="PostInsertController" value="Q">
				<fieldset>
					<label> <input type="radio" name="isAnonymous"
						value="email" formaction="PostInsertController" value="F" checked />
						<span>실명으로 작성</span>
					</label> <label> <input type="radio" name="isAnonymous"
						value="phone" formaction="PostInsertController" value="T" /> <span>익명으로
							작성</span>
					</label>

				</fieldset>
				<div class="post-title-container">
					<input type="text" class="post-title" placeholder="제목입력"
						formaction="PostInsertController" name="title" required> <br>
					<hr>
					<br>
					<textarea class="post-content" placeholder="본문입력"
						formaction="PostInsertController" name="content" required></textarea>
				</div>
				<div class="add-photo-container">
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
						<span>질문등록</span>
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

	<%@ include file="Footer.jsp"%>
	<script>
		// 이미지가 추가되면 "+" 기호를 숨김
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