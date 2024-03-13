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
	<!-- 글쓰기 버튼 -->
	<div class="post-button">
		<a href="QnaForm.jsp">
			<ion-icon class="post-icon" name="pencil"></ion-icon>
		</a>
	</div>

	<%
	PostDAO dao = new PostDAO();

	int max = dao.maxRow("Q"); // 총 보여줄 글 개수
	int showNum = 5; // 한 페이지에 보여줄 글 개수(고정)
	
	List<Post> list = dao.firstList("Q"); // 첫 페이지에 보여줄 글 목록 불러오기
	%>


	<div class="container">
		<!-- 검색창 -->
		<div class="search-container">
			<span class="search-icon"><ion-icon name="search-outline"></ion-icon></span>
			<input type="text" class="search-input">
		</div>


		<!-- 답변을 기다리는 질문 -->
		<div class="quest-container-cov">답변을 기다리는 질문</div>
		<div class="wait-quest-container shadow-div">
			<%
			for (int i = 0; i < list.size(); i++) {
				Post post = list.get(i);
			%>
			<div class="quest-container-in">
				<div class="quest-title">
					<a href="QnaContent.jsp?idx=<%=post.getPost_id()%>"><%=post.getTitle()%></a>
				</div><!-- quest-title -->
				<div class="quest-content">
					<%
					if (post.getPost_content().length() > 43)
						out.print(post.getPost_content().substring(0, 43) + "⋯");
					else
						out.print(post.getPost_content());
					%>
				</div><!-- quest-content -->
				<div class="res-container">
					<span>답변</span> 
					<span class="res-icon"><ion-icon name="chatbox-outline"></ion-icon></span>
					<span><%=dao.ansCount(post.getPost_id()) %></span>
					<span>&nbsp;&nbsp;</span>
					<span>좋아요</span>
					<span class="res-icon"><ion-icon name="heart-outline"></ion-icon></span>
					<span><!--dao.ansCount(post.getPost_id()) %> --></span><!-- like -->
				</div><!-- res-container -->
			</div><!-- quest-container-in -->
			<%}%>
		<%
		// 첫 페이지에 보여줄 게시글이 5개 이상이면
		if (list.size() == showNum) {
		%>
		<div class="more-container"></div>
		
		<button id="more-btn" class="more-button" onclick="moreList();">
			<ion-icon name="chevron-down-circle-outline"></ion-icon>
		</button>
		
		<%}%>
	</div><!-- wait-quest-container -->

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
					"postType" : "Q",	
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
						addHtml += "<div class='quest-container-in'> <div class='quest-title'> <a href='QnaContent.jsp?idx="
								+ post.post_id + "'>" + post.title
								+ "</a></div> <div class='quest-content'>";
						if (post.post_content.length > 43)
							addHtml += post.post_content.substring(0, 43) + "⋯";
						else
							addHtml += post.post_content
						addHtml += "</div> <div class='res-container'> <span>답변</span>"
								+ "<span class='res-icon'><ion-icon name='chatbox-outline'></ion-icon></span>"
								+ "</div> </div>";
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