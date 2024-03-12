<%@page import="com.konan.model.Post"%>
<%@page import="com.konan.model.PostDAO"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="java.util.List"%>
<%@page import="com.konan.model.UserInfoDAO"%>
<%@page import="com.konan.model.UserInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>메인페이지</title>

<link rel="stylesheet" href="./css/PostList.css">
<link rel="stylesheet" href="">

</head>

<body>
	<%@ include file="Header.jsp"%>
	<%
	PostDAO dao = new PostDAO();

	int qCount = dao.maxRow("Q"); // 총 질문 개수
	int showNum = 5; // 한 페이지에 보여줄 글 개수(고정)

	int btnNum = qCount / showNum; // 더보기 버튼이 몇 번 나올지
	int first = btnNum == 0 ? qCount : showNum; // 첫번째 페이지에서 보여줄 글 개수

	int now = qCount; //남은 보여줄 글 개수

	List<Post> list = dao.postList("Q");
	%>


	<div class="container">
		<!-- 검색창 -->
		<div class="search-container">
			<span class="search-icon"><ion-icon name="search-outline"></ion-icon></span>
			<input type="text" class="search-input">
		</div>

		<!-- 글쓰기 버튼 -->
		<a href="QnaForm.jsp">
		<div class="post-button">
			<ion-icon class="post-icon" name="pencil"></ion-icon>
		</div>
		</a>

		<!-- 인기게시물 -->
		<div class="most-viewed-questions-container">
			<div class="content-box"></div>
		</div>


		<!-- 답변을 기다리는 질문 -->
		<div class="quest-container-cov">답변을 기다리는 질문</div>
		<div class="wait-quest-container shadow-div">
			<!-- db에서 질문 리스트 불러오기 -->
			<%
			for (int i = qCount - 1; i > qCount - 6; i--) {
				Post post = list.get(i);
			%>
			<div class="quest-container-in">
				<div class="quest-title">
					<a href="CommuContent.jsp?idx=<%=post.getPost_id()%>"><%=post.getTitle()%></a>
				</div><!-- quest-title -->
				<div class="quest-content">
					<%
					if (post.getPost_content().length() > 50) {
						out.print(post.getPost_content().substring(0, 30) + "⋯");
					} else {
						out.print(post.getPost_content());
					}
					%>
				</div><!-- quest-content -->
				<div class="res-container">
					<span>답변</span> 
					<span class="res-icon"><ion-icon name="chatbox-outline"></ion-icon></span>
					<span><!--dao.ansCount(post.getPost_id()) %> --></span>
					<span>&nbsp;&nbsp;</span>
					<span>좋아요</span>
					<span class="res-icon"><ion-icon name="heart-outline"></ion-icon></span>
					<span><!--dao.ansCount(post.getPost_id()) %> --></span><!-- like -->
				</div><!-- res-container -->
			</div><!-- quest-container-in -->
			<%}%>
		<%
		if (first == showNum) {
			now -= 15;
		%>
		
		<button id="more-btn" class="more-button" onclick="moreList();">
			<ion-icon name="chevron-down-circle-outline"></ion-icon>
		</button>
		
		<%}%>
	</div><!-- wait-quest-container -->

	<script type="text/javascript"
		src="https://code.jquery.com/jquery-1.10.2.min.js" /></script>

	<script>
		function moreList() {
			const questionContainers = document.querySelectorAll(".question-container-inside");
			var idx = questionContainers.length; //더보기 전 게시글 수를 알아내기 위해서 해당 div의 length를 구함.
			//console.log("startNum", startNum); //콘솔로그로 startNum에 값이 들어오는지 확인

			$.ajax({
				url : "PagingController",
				type : "get",
				data : {
					"postType" : "Q",	
					"idx" : idx
				},
				dataType : "json",
				success : function(data) {
					console.log(data);
					var itr = data.length>5?5:data.length;
					let addHtml = "";
					for (var i = 0; i < itr; i++) {
						addHtml += "<div class='question-container-inside'> <div class='question-title'> <a href='CommuContent.jsp?idx=";
						addHtml += data[i].post_id + "'>" + data[i].title;
						addHtml += "</a></div> <div class='question-content'>";
					} //for
					if (data.length < 5) {
						$("#btn-area").remove(); // 더보기 버튼을 div 클래스로 줘야 할 수도 있음
					}
					$(".question-container-cover").append(addHtml);
				} //success
			}) //ajax
		}; //moreList
	</script>

</body>
</html>