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

<link rel="stylesheet" href="">
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
		<%
		if (user == null) {
		%>

		<a href="Join.jsp"><button>회원가입</button></a> <a href="Login.jsp"><button>로그인</button></a>

		<%
		} else {
		%>
		<%=user.getName()%>
		<a href="LogoutController"><button>로그아웃</button></a> <a
			href="Profile.jsp?targetId=${userId}"><button>프로필</button></a>
		<%
		}
		%>
	</div>

	<div class="container">
		<div class="search-container">
			<div class="search-icon"></div>
			<input type="text" class="search-input">
		</div>

		<div class="most-viewed-questions">
			인기 질문
			<div class="content-box"></div>

			<!-- 글쓰기 버튼 -->
			<div class="post-button">
				<a href="QnaForm.jsp">글쓰기</a>
			</div>
		</div>

		<div class="waiting-questions-container">
			<div class="question-container-cover"
				style="border-bottom: 1px solid;">답변을 기다리는 질문</div>
			<%
			for (int i = qCount - 1; i > qCount - 6; i--) {
				Post post = list.get(i);
			%>
			<div class="question-container-inside">
				<div class="question-title">
					<a href="CommuContent.jsp?idx=<%=post.getPost_id()%>"><%=post.getTitle()%>
					</a>
				</div>
				<div class="question-content">
					<%
					if (post.getPost_content().length() > 50) {
						out.print(post.getPost_content().substring(0, 30) + "⋯");
					} else {
						out.print(post.getPost_content());
					}
					%>
				</div>
				<div class="response-container">
					<span>답변 <!--dao.ansCount(post.getPost_id()) %> --></span> <span>좋아요
					</span>
				</div>
			</div>
			<%}%>
		</div>
		<%
		if (first == showNum) {
			now -= 15;
		%>
		<div id="btn-area">
			<button id="more-btn" onclick="moreList();">
				<span>더 보기</span>
			</button>
		</div>
		<%
		}
		%>
	</div>

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