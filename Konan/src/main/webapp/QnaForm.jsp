<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>  
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

<body>
<%@ include file="Header.jsp" %> 
	<div class="container">
		<form action="PostInsertController" method="post" enctype="multipart/form-data">
	        <div class="question-container">
	            <div class="user-question">질문 작성</div>
	            <div class="user-question-container">
	            	<input type="radio" name="isAnonymous" formaction="PostInsertController" value="F"> 실명
	            	<input type="radio" name="isAnonymous" formaction="PostInsertController" value="T"> 익명
	            	<input type="hidden" name="postType" formaction="PostInsertController" value="Q">
	                <input type="text" name="title" formaction="PostInsertController" class="user-question-title" placeholder="제목입력" style="border-bottom: 1px solid;">
	                <input type="text" name="postContent" formaction="PostInsertController" class="user-question-content" placeholder="본문입력">
	            </div>
	        </div>

	        <div class="add-photo-container">
	            <div class="add-photo-text">사진추가</div>
	            <div class="add-photo-img-container">
	            	<input type="file" name="img" formaction="PostImageController" class="form-control" id="photo" multiple>
	            </div> 
	        </div>
	        
	        <!-- 질문하기 버튼 -->
	        <button type="submit" class="question-btn">질문등록</button>
	        
	        <!-- 해시태그
	        <div class="add-tag-container">
	        	<input type="text" id="tag">
	        </div>
	         -->
	        </form>
	        
	</div>
	
</body>
</html>