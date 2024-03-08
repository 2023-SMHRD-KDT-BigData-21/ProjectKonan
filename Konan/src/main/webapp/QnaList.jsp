<%@page import="com.konan.model.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.konan.model.PostDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <link rel="stylesheet" href="">
    <link rel="stylesheet" href="">

</head>

<body>
<%
	PostDAO dao = new PostDAO();
	
	int qCount = dao.qpostCount(); // 총 질문 개수
	
	int showNum = 15; // 한 페이지에 보여줄 글 개수(고정)
	int btnNum = qCount / showNum; // 더보기 버튼이 몇 번 나올지
	int now; // 현재 페이지에서 보여줄 글 개수(변수)
	int remainNum = qCount % showNum; // 더보기 이후 마지막 페이지 게시글 개수
	
	List<Post> list = dao.QpostList();
%>
    <div class="container">
        <div class="search-container">
            <div class="search-icon"></div>
            <input type="text" class="search-input">
        </div>

        <div class="most-viewed-questions">
            인기 질문
            <div class="content-box"></div>

            <!-- 글쓰기 버튼 -->
            <div class="post-button"></div>
        </div>

        <div class="waiting-questions-container">
            <div class="question-container-cover" style="border-bottom: 1px solid;">답변을 기다리는 질문</div>
            <%
            	now = btnNum==0?qCount:showNum; // 첫 번째 페이지에 보여줄 게시글 개수

            	for(int i=0; i<now; i++){
            		Post post=list.get(i);
            %>
          		<div class="question-container-inside" >
          		    <div class="question-title">
          		    <a href="CommuContent.jsp?idx=<%=post.getPost_id()%>"><%=post.getTitle() %>
          		    </a></div>
          		    <div class="question-content">
          		    <%if(post.getPost_content().length()>30){ 
          		    	out.print(post.getPost_content().substring(0,30));
          		    	}else{
          		    	out.print(post.getPost_content());
          		    	}%>
                	</div>
                	<div class="response-container">
                		<span>답변 <%=dao.ansCount(post.getPost_id()) %></span>
                		<span>좋아요 <%= %></span>
                	</div>
                </div>
            <%}%>
        </div>
        
        <% if(btnNum>0){%>
                <button id="more-btn">
                <span>더 보기</span>
            	</button>
        <%}%>
    </div>
    
    <script> // 더보기 이후 게시글을 보여줄 로직 구현
		let qCount = "<%=qCount-15%>"; // 남은 질문 개수
		var showNum = "<%=showNum%>"; // 한 페이지에 보여줄 글 개수(고정)
		let btnNum = "<%=btnNum%>"; // 더보기 버튼이 몇 번 나올지
    	let now;
		
    	let more-btn = document.getElementById("more-btn");
    	let movieArea = document.getElementsByClassName("waiting-questions-container")[0];
    	
        const getPostList = function () {

            const render = function (pageList) {
                let resultHTML = `
      		        <div class="question-container-inside" >
  		            <div class="question-title">
  		            <a href="CommuContent.jsp?idx=<%=post.getPost_id()%>"><%=post.getTitle() %>
  		            </a></div>
  		            <div class="question-content">
                    `;

                // 게시글 수만큼 반복하면서 resultHTML에 정보를 담아줄 로직
                for (let i = 0; i < pageList.length; i++) {
                    let post = pageList[i];

                    if(post.getPost_content().length()>30){ 
          		    	out.print(post.getPost_content().substring(0,30));
          		    	}else{
          		    	out.print(post.getPost_content());
          		    	}
                    
                    resultHTML += `
                        </div>
                	    <div class="response-container">
            		    	<span>답변 <%=dao.ansCount(post.getPost_id()) %></span>
            		    	<span>좋아요 <%= %></span>
            	    	</div>
                        </div>
                    `
                }

                resultHTML += '</div>';
                container.innerHTML = resultHTML;
            }

            $.ajax({
                url: movieUrl,
                success: function (result) {
                    console.log("요청성공!");
                    console.log(result);
                    console.log(result.boxOfficeResult.dailyBoxOfficeList);
                    let pageList = result.boxOfficeResult.dailyBoxOfficeList;

                    // 한 페이지에 나올 게시글을 출력
                    render(pageList);
                },
                error: function () {
                    console.log("요청실패!");
                }
            })
        }
        moreBtn.addEventListener("click", getPostList);
	</script>

</body>
</html>