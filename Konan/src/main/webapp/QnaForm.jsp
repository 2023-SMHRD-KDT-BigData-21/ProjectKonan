<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>  
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>질문 작성</title>
    <link rel="stylesheet" href="./css/Default2.css">
    <link rel="stylesheet" href="./css/QnaForm.css">
</head>

<body>
<%@ include file="Header.jsp" %> 
	<div class="container">
	<!-- 질문작성 -->
		<div class="post-container">
		<form action="PostInsertController" method="post" enctype="multipart/form-data">
	    	<div class="post-pre-title"><span>질문 작성</span></div>
                <input type="hidden" formaction="PostInsertController" name="postType" value="Q">
                <input type="radio" formaction="PostInsertController" name="isAnonymous" value="F" checked="checked"> 실명으로 작성
	            <input type="radio" formaction="PostInsertController" name="isAnonymous" value="T"> 익명으로 작성
                <div class="post-title-container">
                    <input type="text" class="post-title" placeholder="제목입력" name="title" required>
                    <textarea class="post-content" placeholder="본문입력" name="content" required></textarea>
                </div>
                <div class="add-photo-container">
                    <div class="add-photo-text"><span>사진추가</span></div>
                    <div class="add-photo-img-container">
                        <label for="photo1">
                            <div class="add-photo-img" id="img1">
                    			<input type="file" id="photo1" name="photo1" accept="image/*" style="display: none;" formaction="PostImageController" onchange="setThumbnail(event,1);">
                            </div>
                        </label>
                        <label for="photo2">
                            <div class="add-photo-img" id="img2">
                            	<input type="file" id="photo2" name="photo2" accept="image/*" style="display: none;" formaction="PostImageController" onchange="setThumbnail(event,2);">
                            </div>
                        </label>
                        <label for="photo3">
                            <div class="add-photo-img" id="img3">
                            <input type="file" id="photo3" name="photo3" accept="image/*" style="display: none;" formaction="PostImageController" onchange="setThumbnail(event,3);">
                            </div>
                        </label>
                        <label for="photo4">
                            <div class="add-photo-img" id="img4">
                            	<input type="file" id="photo4" name="photo4" accept="image/*" style="display: none;" formaction="PostImageController" onchange="setThumbnail(event,4);">
                            </div>
                        </label>
                        <label for="photo5">
                            <div class="add-photo-img" id="img5">
                            	<input type="file" id="photo5" name="photo5" accept="image/*" style="display: none;" formaction="PostImageController" onchange="setThumbnail(event,5);">
                            </div>
                        </label>
                    </div> <!-- add-photo-img-container -->
                </div> <!-- add-photo-container -->
                <div class="btn-post">
                    <button type="submit">
                        <span>질문등록</span>
                    </button>
                </div> <!-- btn-post -->
                
            </form>
        </div> <!-- post-container -->

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
	
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.10.2.min.js" /></script>
	
	<script>
    
	function setThumbnail(event, num) {
	    var reader = new FileReader();

	    reader.onload = function (event) {
	        var imgSrc = event.target.result;
	        
	        // 썸네일
	        var container = document.querySelector("div#img" + num);
	        container.style.backgroundImage = "url('" + imgSrc + "')";
	        container.style.backgroundSize = "cover";
	    };

	    reader.readAsDataURL(event.target.files[0]);
	}
	</script>
</body>
</html>