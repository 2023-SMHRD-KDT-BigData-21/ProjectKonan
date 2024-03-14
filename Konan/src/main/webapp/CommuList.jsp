<%@page import="com.konan.model.PostCommentDAO"%>
<%@page import="com.konan.model.UserReactionDAO"%>
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
<title>커뮤니티 리스트</title>

<link rel="stylesheet" href="./css/PostList.css">
<link rel="stylesheet" href="">

</head>

<body>
	<%@ include file="Header.jsp"%>
	<!-- 글쓰기 버튼 -->
	<%if(user!=null){ %>
	<div class="post-button">
		<a href="CommuForm.jsp"> <ion-icon class="post-icon" name="pencil"></ion-icon>
		</a>
	</div>
	<%} %>

	<%
	PostDAO dao = new PostDAO();
	PostCommentDAO commntDao = new PostCommentDAO();
	UserReactionDAO reactionDao = new UserReactionDAO();
	
	int max = dao.maxRow("C");
	int showNum = 5; // 한 페이지에 보여줄 글 개수(고정)
	int leftPost = 5; //ajax 안에 있는 for문을 위한 수
	
	List<Post> list = dao.firstList("C"); // 첫 페이지에 보여줄 글 목록 불러오기
	%>


	<div class="container">
		<!-- 검색창 -->
		<div class="search-container">
			<span class="search-icon"><ion-icon name="search-outline"></ion-icon></span>
			<input type="text" class="search-input">
		</div>


		<!-- 답변을 기다리는 질문 -->
		<div class="quest-container-cov">커뮤니티 리스트</div>
		<div class="wait-quest-container shadow-div">
			<%
			for (int i = 0; i < list.size(); i++) {
				Post post = list.get(i);
				System.out.println(post.getPost_id());
			%>
			<div class="quest-container-in">
				<div class="quest-title">
					<a href="CommuContent.jsp?idx=<%=post.getPost_id()%>" class="link"><%=post.getTitle()%></a>
				</div>
				<!-- quest-title -->
				<div class="quest-content">
					<%
					if (post.getPost_content().length() > 50)
						out.print(post.getPost_content().substring(0, 50) + "⋯");
					else
						out.print(post.getPost_content());
					%>
				</div>
				<!-- quest-content -->
				<div class="res-container">
					<span>댓글</span> <span class="res-icon"><ion-icon
							name="chatbox-outline"></ion-icon></span> <span><%=commntDao.countComments(post.getPost_id()) %></span>
					<span>&nbsp;&nbsp;</span> <span>좋아요</span> <span class="res-icon"><ion-icon
							name="heart-outline"></ion-icon></span> <span><%=reactionDao.countLike(post.getPost_id()) %></span>
					<!-- like -->
				</div><!-- res-container -->
			</div><!-- quest-container-in -->
			<%}//for문%>
			<%
		// 첫 페이지에 보여줄 게시글이 5개 이상이면
		if (list.size() == showNum) {
		%>
			<div class="more-container"></div>

			<button id="more-btn" class="more-button" onclick="moreList();">
				<ion-icon name="add-circle-outline"></ion-icon>
			</button>

			<%}%>
		</div>
		<!-- wait-quest-container -->

		<script type="text/javascript"
			src="https://code.jquery.com/jquery-1.10.2.min.js" /></script>

		<script>
	let div = document.getElementsByTagName("div")[0];
		function moreList() {
			const questionContainers = document.querySelectorAll(".quest-container-in");
			var max = "<%=max%>"
			var idx = questionContainers.length; //더보기 전 게시글 수를 알아내기 위해서 해당 div의 length를 구함
			//console.log("idx", idx); //콘솔로그로 값이 들어오는지 확인

			$.ajax({
				url : "PagingController",
				type : "get",
				data : {
					"postType" : "C",	
					"idx" : idx
				},
				dataType : "json",
				success : function(data) {
					console.log(max,data.length);
					var itr = data.length>5?5:data.length; //for문 돌아갈 횟수
					// 더보기 클릭 후 보여줄 게시글(data)이 5개이상이면 5번, 아니면 남은 게시글 수 
					let addHtml = "";
					for (var i = 0; i < itr; i++) {
						var post = data[i];
						console.log(post)
						addHtml += "<div class='quest-container-in'> <div class='quest-title'> <a href='QnaContent.jsp?idx="
								+ post.post_id + "' class='link'>" + post.title
								+ "</a></div> <div class='quest-content'>";
						if (post.post_content.length > 43)
							addHtml += post.post_content.substring(0, 43) + "⋯";
						else
							addHtml += post.post_content
							
						addHtml += `
						<div class="res-container">
							<span>댓글</span> 
							<span class="res-icon"><ion-icon name="chatbox-outline"></ion-icon></span>
							<span>`+post.comment_cnt+`</span>
							<span>&nbsp;&nbsp;</span>
							<span>좋아요</span>
							<span class="res-icon"><ion-icon name="heart-outline"></ion-icon></span>
							<span>`+post.like_cnt+`</span>
						</div>
					</div></div>`
					} //for
					$(".more-container").append(addHtml);
					if (max-idx<=5) { // 더보기 클릭 후 보여줄 게시글(data)이 5개 이하이면 더보기 버튼 없앰
						$("#more-btn").remove();
					}
				} //success
			}) //ajax
		}; //moreList
	</script>
</body>
</html>