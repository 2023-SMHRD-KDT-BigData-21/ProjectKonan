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
<title>메인페이지</title>

<link rel="stylesheet" href="./css/PostList.css">
<link rel="stylesheet" href="">


</head>

<body>
<%@ include file="Header.jsp"%>
	<%
	PostDAO dao = new PostDAO();

	int max = dao.maxRow("Q"); // 총 보여줄 글 개수
	int showNum = 5; // 한 페이지에 보여줄 글 개수(고정)
	
	List<Post> list = dao.firstList("Q"); // 첫 페이지에 보여줄 글 목록 불러오기
	
	UserReactionDAO reactionDao = new UserReactionDAO();//좋아요 개수 세려고
	%>
	
	<%if(user!=null){%>
	<!-- 글쓰기 버튼 -->
	<a href="QnaForm.jsp">
		<div class="post-button">
			<ion-icon class="post-icon" name="pencil"></ion-icon>
		</div>
	</a>
	<%} %>


	<div class="container">
		<!-- 검색창 -->
		<div class="search-container">
			<span class="search-icon"><ion-icon name="search-outline"></ion-icon></span>
			<input type="text" class="search-input">
		</div>


		<!-- 답변을 기다리는 질문 -->
		<div class="quest-container-cov">탐정에게 질문을 해보세요.</div>
		<%if(user==null){%>
		<div class="notice">회원가입 후 질문을 할 수 있습니다.</div>
		<%} %>
		<div class="wait-quest-container shadow-div">
			<%
			for (int i = 0; i < list.size(); i++) {
				Post post = list.get(i);
			%>
			<a href="QnaContent.jsp?idx=<%=post.getPost_id()%>" class="link">
			<div class="quest-container-in">
				<div class="quest-title">
					<b>[Q] </b><%=post.getTitle()%>
				</div><!-- quest-title -->
				<div class="quest-content">
					<%
					if (post.getPost_content().length() > 43)
						out.print(post.getPost_content().substring(0, 43) + "⋯");
					else
						out.print(post.getPost_content());
					%>
				</div><!-- quest-content -->
				
				<!-- 채택여부 -->
				<div class="adopt-container">
					<div class="adopt">
						<span >
							<%
							String adopt = null;
							if(post.getIs_adopted().equals("F")){
								if(dao.ansCount(post.getPost_id())!=0)
									adopt = "채택대기";
								adopt = "답변대기";
							}else{
								adopt = "채택완료";
							}
							%>
							<%=adopt %>
						</span>
					</div><!-- adopt -->
				</div><!-- adopt-container -->
				
				<div class="res-container">
					<span>답변</span> 
					<span class="res-icon"><ion-icon name="chatbox-outline"></ion-icon></span>
					<span><%=dao.ansCount(post.getPost_id()) %></span>
					<span>&nbsp;&nbsp;</span>
					<span>좋아요</span>
					<span class="res-icon"><ion-icon name="heart-outline"></ion-icon></span>
					<span><%=reactionDao.countLike(post.getPost_id()) %></span>
				</div><!-- res-container -->
			</div><!-- quest-container-in -->
			</a>
			<%}%>
		<%
		// 첫 페이지에 보여줄 게시글이 5개 이상이면
		if (list.size() == showNum) {
		%>
		<div class="more-container"></div>
		
		<button id="more-btn" class="more-button" onclick="moreList();">
			<ion-icon name="add-circle-outline"></ion-icon>
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
					let addHtml = "";
					for (var i = 0; i < data.length; i++) {
						var post = data[i];
						//제목
						addHtml += "<a href='QnaContent.jsp?idx=" + post.post_id
								+ `'class="link"><div class='quest-container-in'> <div class='quest-title'><b>[Q] </b>`
								+ post.title + "</div> <div class='quest-content'>";
						//내용
						if (post.post_content.length > 43)
							addHtml += post.post_content.substring(0, 43) + "⋯";
						else
							addHtml += post.post_content
						//채택여부
						let adopt;
						addHtml += "<div class='adopt-container'> <div class='adopt'><span>"
						if(post.is_adopted=="F"){
							if(post.answer_cnt!=0)
								adopt = "채택대기";
							adopt = "답변대기";
						}else{
							adopt = "채택완료";
						}
						addHtml += adopt + "</span></div></div>"
						//답변, 좋아요
						addHtml += `
						<div class="res-container">
							<span>답변</span> 
							<span class="res-icon"><ion-icon name="chatbox-outline"></ion-icon></span>
							<span>`+post.answer_cnt+`</span>
							<span>&nbsp;&nbsp;</span>
							<span>좋아요</span>
							<span class="res-icon"><ion-icon name="heart-outline"></ion-icon></span>
							<span>`+post.like_cnt+`</span>
						</div>
					</div></div></a>`
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