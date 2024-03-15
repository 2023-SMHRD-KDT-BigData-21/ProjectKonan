<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>  
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>질문 작성</title>
    <link rel="stylesheet" href="./css/Default2.css">
    <link rel="stylesheet" href="./css/QnaForm.css">
    <style>
	    .add-photo-container {
	    padding: 20px 30px;
	    display: block;
	    width: 200px;
	    margin: 5vh auto;
	    height: 200px;
	    border: 1px solid #dbdbdb;
	    -webkit-box-sizing: border-box;
	    -moz-box-sizing: border-box;
	    box-sizing: border-box;
		}
		
		.form-control {
		display: none;
		}
    </style>
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
                        <label for="photo0">
                            <div class="add-photo-img">
                    			<input type="file" id="photo1" name="photo1" accept="image/*" style="display: none;" formaction="PostImageController" onchange="setThumbnail(event);">
                            </div>
                        </label>
                        <label for="photo1">
                            <div class="add-photo-img">
                            	<input type="file" id="photo2" name="photo2" accept="image/*" style="display: none;" formaction="PostImageController" onchange="setThumbnail(event);">
                            </div>
                        </label>
                        <label for="photo2">
                            <div class="add-photo-img">
                            <input type="file" id="photo3" name="photo3" accept="image/*" style="display: none;" formaction="PostImageController" onchange="setThumbnail(event);">
                            </div>
                        </label>
                        <label for="photo3">
                            <div class="add-photo-img">
                            	<input type="file" id="photo4" name="photo4" accept="image/*" style="display: none;" formaction="PostImageController" onchange="setThumbnail(event);">
                            </div>
                        </label>
                        <label for="photo4">
                            <div class="add-photo-img">
                            	<input type="file" id="photo5" name="photo5" accept="image/*" style="display: none;" formaction="PostImageController" onchange="setThumbnail(event);">
                            </div>
                        </label>
                    </div>
                </div>
                <div class="btn-delete">
                    <button type="submit">
                        <span>삭제하기</span>
                    </button>
                </div>
                <div class="btn-post">
                    <button type="submit">
                        <span>질문등록</span>
                    </button>
                </div>
                
            </form>
        </div>       

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
    
	function setThumbnail(event) {
	    var reader = new FileReader();

	    reader.onload = function (event) {
	        var img = document.createElement("img");
	        img.setAttribute("src", event.target.result);
	        img.setAttribute("class", "col-lg-6");
	        
	        // 이미지의 너비와 높이를 설정합니다.
	        img.style.width = "200px"; // 너비를 200px로 설정


	        document.querySelector("div.add-photo-container").appendChild(img);
	    };

	    reader.readAsDataURL(event.target.files[0]);
	}
	</script>
</body>
</html>