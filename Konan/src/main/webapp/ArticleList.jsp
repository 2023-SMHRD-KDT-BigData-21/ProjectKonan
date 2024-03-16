<%@page import="com.konan.model.Article"%>
<%@page import="com.konan.model.ArticleDAO"%>
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
<title>탐정뉴스</title>

<link rel="stylesheet" href="./css/PostList.css">
<link rel="stylesheet" href="">

</head>

<body>
	<%@ include file="Header.jsp"%>
	<!-- 글쓰기 버튼 -->
	<div class="post-button">
		<a href="QnaForm.jsp"> <ion-icon class="post-icon" name="pencil"></ion-icon>
		</a>
	</div>

	<%
	ArticleDAO dao = new ArticleDAO();

	int max = dao.maxRow(); // 총 보여줄 글 개수
	int showNum = 5; // 한 페이지에 보여줄 글 개수(고정)

	List<Article> list = dao.firstList(); // 첫 페이지에 보여줄 글 목록 불러오기

	List<String> keywordList = null;
	%>


	<div class="container">
		<!-- 검색창 -->
		<div class="search-container">
			<span class="search-icon"><ion-icon name="search-outline"></ion-icon></span>
			<input type="text" class="search-input">
		</div>


		<!-- 최근 탐정 소식 -->
		<div class="quest-container-cov">최근 탐정 소식</div>
		<div class="wait-quest-container shadow-div">
			<%
			for (int i = 0; i < list.size(); i++) {
				Article article = list.get(i);
				keywordList = dao.keyList(article.getArticle_id());
			%>
			<div class="quest-container-in" style="display: flex;">
				<div style="flex-direction: column;">
					<a href="<%=article.getUrl()%>" class="link"><div class="quest-title">
						<br> <%=article.getTitle()%>
					</div><!-- quest-title -->
					<div class="quest-content">
						<%
						if (article.getArticle_content().length() > 37)
							out.print(article.getArticle_content().substring(0, 37) + "⋯");
						else
							out.print(article.getArticle_content());
						%>
					</div><!-- quest-content -->
					<div class="keyword-container">
						<div class="keyword">
							<%
							for (int j = 0; j < keywordList.size(); j++) {
								out.print("#" + keywordList.get(j) + " ");
							}
							%>
						</div><!-- keyword -->
					</div><!-- keyword-container -->
					</a>
			</div><!-- flex -->
				<div class="image-container">
					<img style="height:100%; width:100%; object-fit:cover" src="<%=article.getImg()%>">
				</div><!-- image-container -->
			</div><!-- quest-container-in -->
			<%
			}
			%>
			<div class="more-container"></div>

			<button id="more-btn" class="more-button" onclick="moreList();">
				<ion-icon name="chevron-down-circle-outline"></ion-icon>
			</button>

			</div><!-- wait-quest-container -->
		</div><!-- container -->
		

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
						"idx" : idx
					},
					dataType : "json",
					success : function(data) {
						let addHtml = "";
						for (var i = 0; i < data.length; i++) {
							var article = data[i];
							addHtml += `
								<div class="quest-container-in" style="display: flex;">
									<div style="flex-direction: column;">
									<a href="`
									+ article.url + `" class="link">
									<div class="quest-title">
									<br>`
									+ article.title + `</div>
									<div class="quest-content">`;

							if (article.article_content.length > 37)
								addHtml += article.article_content.substring(0, 37)+ "⋯";
							else
								addHtml += article.article_content;

							addHtml += `
								</div>
								<div class="keyword-container">
									<div class="keyword">`;

							// 키워드 추가
							for (var j = 0; j < article.keyword_list.length; j++) {
								addHtml += "#" + article.keyword_list[j] + " ";
							} //for
							
							addHtml += `</div>
								</div>
								</a>
								</div>
								<div class="image-container">
									<img style="height:100%; width:100%; object-fit:cover" src="`
									+ article.img + '"></div></div>';
						} //for
						$(".more-container").append(addHtml);
						// 더보기 클릭 후 보여줄 게시글(data)이 5개 이하이면 더보기 버튼 없앰
						if (max - idx <= 5)
							$("#more-btn").remove();
					} //success
				}); //ajax
			} //moreList
		</script>
</body>
</html>