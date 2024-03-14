<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>  
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
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
		<form action="PostInsertController" method="post" enctype="multipart/form-data">
	        <div class="question-container">
	            <div class="user-question">질문 작성</div>
	            <div class="user-question-container">
	            	<input type="radio" name="isAnonymous" formaction="PostInsertController" value="F" checked="checked"> 실명
	            	<input type="radio" name="isAnonymous" formaction="PostInsertController" value="T"> 익명
	            	<input type="hidden" name="postType" formaction="PostInsertController" value="Q">
	                <input type="text" name="title" formaction="PostInsertController" class="user-question-title" placeholder="제목입력" style="border-bottom: 1px solid;">
	                <input type="text" name="postContent" formaction="PostInsertController" class="user-question-content" placeholder="본문입력">
	            </div>
	        </div>

			<label for="img0">
	        <div class="add-photo-container">+
	        </div><!-- add-photo-container -->
	        </label>
	        <input type="file" id="img0" onchange="setThumbnail(event);" name="img0" formaction="PostImageController" class="form-control">
	        
	       	<div class="add-photo-container">
	            <div class="add-photo-text">사진추가</div>
	            <div class="add-photo-img-container">
	            	<input type="file" onchange="setThumbnail(event);" name="img2" formaction="PostImageController" class="form-control">
	            </div><!-- add-photo-img-container -->
	        </div><!-- add-photo-container -->
	        
	        <div class="add-photo-container">
	            <div class="add-photo-text">사진추가</div>
	            <div class="add-photo-img-container">
	            	<input type="file" onchange="setThumbnail(event);" name="img3" formaction="PostImageController" class="form-control">
	            </div><!-- add-photo-img-container -->
	        </div><!-- add-photo-container -->
	        
	        <div class="add-photo-container">
	            <div class="add-photo-text">사진추가</div>
	            <div class="add-photo-img-container">
	            	<input type="file" onchange="setThumbnail(event);" name="img4" formaction="PostImageController" class="form-control">
	            </div><!-- add-photo-img-container -->
	        </div><!-- add-photo-container -->
	        
	        <div class="add-photo-container">
	            <div class="add-photo-img-container">
	            	<input type="file" onchange="setThumbnail(event);" name="img5" formaction="PostImageController" class="form-control">
	            </div><!-- add-photo-img-container -->
	        </div><!-- add-photo-container -->
	        
	        
	        <!-- 질문하기 버튼 -->
	        <button type="submit" class="question-btn">질문등록</button>
	        
	        <!-- 해시태그
	        <div class="add-tag-container">
	        	<input type="text" id="tag">
	        </div>
	         -->
	        </form>
	        
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