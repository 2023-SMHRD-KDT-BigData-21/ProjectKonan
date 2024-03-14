<%@page import="com.konan.model.Keyword"%>
<%@page import="com.konan.model.KeywordDAO"%>
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
	ArticleDAO dao = new ArticleDAO();
	KeywordDAO dao2 = new KeywordDAO();

	int max = dao.maxRow(); // 총 보여줄 글 개수
	int showNum = 5; // 한 페이지에 보여줄 글 개수(고정)
	
	List<Article> list = dao.firstList(); // 첫 페이지에 보여줄 글 목록 불러오기
	
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
				Article article = list.get(i);
				List<Keyword> keywordList = dao2.getKeyword(article.getArticle_id());
			%>
			<div class="quest-container-in">
				<div class="quest-title">
					<a href="<%=article.getUrl()%>"><%=article.getTitle()%></a>
				</div><!-- quest-title -->
				<div class="quest-content">
					<%
					if (article.getArticle_content().length() > 50)
						out.print(article.getArticle_content().substring(0, 50) + "⋯");
					else
						out.print(article.getArticle_content());
					%>
				</div><!-- quest-content -->
				<div class="Key-word">
					<%
						for(int j =0; j<keywordList.size();j++){
							out.print('#'+keywordList.get(j).getKey_word()+' ');
						}
					%>
				</div>
				<div class="res-container">
					<img class = "news-img" src="<%=article.getImg() %>">
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
	            "idx" : idx
	        },
	        dataType : "json",
	        success : function(data) {
	            var itr = data.length > 5 ? 5 : data.length; //for문 돌아갈 횟수
	            // 더보기 클릭 후 보여줄 게시글(data)이 5개이상이면 5번, 아니면 남은 게시글 수 
	            let addHtml = "";
	            for (var i = 0; i < itr; i++) {
	                var article = data[i];
	                
	                addHtml += "<div class='quest-container-in'> <div class='quest-title'> <a href='" + article.url + "'>" + article.title
	                        + "</a></div> <div class='quest-content'>";
	                        
	                if (article.article_content.length > 50)
	                    addHtml += article.article_content.substring(0, 50) + "⋯";
	                else
	                    addHtml += article.article_content;
	                
	                addHtml += "</div><div class='keyword-container'>";

	                // 키워드 추가
	                for (var j = 0; j < article.keyword_list.length; j++) {
	                    addHtml += "<span class='keyword'>#" + article.keyword_list[j].key_word + "</span>";
	                }
	                addHtml += "</div>"; // keyword-container 닫기
	                
	                addHtml += "<div class='res-container'>"
	                        + "<img src='" + article.img + "' class='news-img'>" //여기다가 사진 넣습니다.
	                        + "</div> </div>";
	            } //for
	            $(".more-container").append(addHtml);
	            if (max - idx <= 5) { // 더보기 클릭 후 보여줄 게시글(data)이 5개 이하이면 더보기 버튼 없앰
	                $("#more-btn").remove();
	            }
	        } //success
	    }); //ajax
	} //moreList
	</script>

</body>
</html>