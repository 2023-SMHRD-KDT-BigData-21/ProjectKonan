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
		<form action="PostInsertController" method="post">
	        <div class="question-container">
	            <div class="user-question">질문 작성</div>
	            <div class="user-question-container">
	            	<input type="radio" name="isAnonymous"> 실명
	            	<input type="radio" name="isAnonymous"> 익명
	                <input type="text" name="title" class="user-question-title" placeholder="제목입력" style="border-bottom: 1px solid;">
	                <input type="text" name="postContent" class="user-question-content" placeholder="본문입력">
	            </div>
	        </div>
	        </form>
	
	        <!-- 사진추가 박스 -->
	        <form action="#">
	        <div class="add-photo-container">
	            <div class="add-photo-text">사진추가</div>
	            <div class="add-photo-img-container">
	            	<input type="file" name="img" class="form-control" id="photo">
	            </div>
	        </div>
	        </form>
	        
	        <!-- 해시태그 -->
	        <form action="#">
	        	<input type="text" id="tag">
	        </form>
	           
	        <!-- 질문하기 버튼 -->
	        <button type="submit" class="question-btn">질문등록</button>
	</div>
</body>
</html>