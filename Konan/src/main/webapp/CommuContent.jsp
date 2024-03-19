<%@page import="com.konan.model.CommentHierarchyView"%>
<%@page import="java.util.List"%>
<%@page import="com.konan.model.PostComment"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.konan.model.UserReaction"%>
<%@page import="com.konan.model.UserReactionDAO"%>
<%@page import="com.konan.model.PostCommentDAO"%>
<%@page import="com.konan.model.UserInfoDAO"%>
<%@page import="com.konan.model.Post"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="com.konan.model.PostDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티 게시글</title>
<link rel="stylesheet" href="./css/CommuContent.css">
<link rel="stylesheet" href="./css/HeartBtn.css">
</head>
<body>

	<!-- 대댓글에서 수정해야 하는 부분
	1. commentId를 컨트롤러로 보내줘야함 
	2. 그래서 comments-container 에다가 data-values라는 임의의 값 추가 후 거기에 commentId 담음
	3. 근데 js 에서 data-values를 받아오지 못해 대댓글 전송이 안됨ㅠ
	
	for문에서 comment.getComment_id로 값이 가져와지는 건 확인함
	아무래도 data-values에 담기는 과정에서 문제가 생긴듯 -->


	<%@ include file="Header.jsp"%>
	<%
	BigDecimal postId = BigDecimal.valueOf(Double.valueOf(request.getParameter("idx")));
	pageContext.setAttribute("postId", postId);

	PostDAO postDao = new PostDAO();
	UserInfoDAO userDao = new UserInfoDAO();
	PostCommentDAO commntDao = new PostCommentDAO();
	UserReactionDAO reactionDao = new UserReactionDAO();

	SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd"); //날짜 형식 맞춰 줌

	Post post = postDao.postContent(postId);
	UserInfo userInfo = userDao.getUser(post.getUser_id());
	List<CommentHierarchyView> postComments = commntDao.getComments(postId);
	
	boolean isPostWriter = false;
	boolean isReplyWriter = false;
	%>
	<!-- body 전체 가운데로 -->
	<div class="container">

		<!-- 게시글 박스-->
		<div class="post-container shadow-div">
			<div class="post-title-container">

				<!-- 해시태그 공간 -->
				<div class="hashtags-container">
					<div class="hashtags">
						<span>#호기심</span> <span>#명탐정코난</span>
					</div>
					<div class="btn-bookmark"></div>
					
					<!-- 게시글 작성자만 볼 수 있도록 -->
					<%
					if(user!=null){
						if(post.getUser_id().equals(user.getUser_id())){
							isPostWriter = true;
					%>
					<!-- 수정 버튼 -->
					<a href="CommuUpdate.jsp?idx=<%=postId%>">
					<div id="edit-btn" style="position:absolute; right:30px; top: -10px;font-size: 2em; color:gray;">
						<ion-icon name="pencil-outline"></ion-icon>
					</div>
					</a>
					<%}
					}%>
					
					<!-- 삭제 버튼 -->
					<div id="delete-btn" style="display:none; position:absolute; right:0px; top: -10px;font-size: 2em; color:gray;">
						<ion-icon name="close-outline"></ion-icon>
					</div>
					
					
				</div>


				<!-- 포스트 상단 -->
				<div class="post-group">
					<div class="post-title">
						<span><%=post.getTitle()%></span>
					</div>
					<div class="post-author">
						<span>작성자</span><span><%=userInfo.getName()%></span>
					</div>
					<div class="post-date">
						<span>작성일자</span><span><%=simpleDateFormat.format(post.getWrite_date())%></span>
					</div>
				</div>
				<!-- post-group -->
			</div>

			<!-- 내용 -->
			<div class="post-container">

				<!-- 사진 -->
				<div></div>

				<!-- 글 내용 -->
				<div class="post">
					<span style="line-height: 2.1em;"><%=post.getPost_content()%></span>
				</div>


				<div class="likes-replies-container">
					<span class="heart"></span>&nbsp;&nbsp;&nbsp; <span
						class="btn-likes">좋아요</span>&nbsp;
					<!-- 좋아요 값이 들어가야 함 -->
					<span style="font-size: 0.9em;" id="<%=post.getPost_id()%>"><%=reactionDao.countLike(post.getPost_id())%></span>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<ion-icon name="chatbox-ellipses-outline"
						style="font-size: 1.3em;  color:gray; position: relative; top: -3px;"></ion-icon>
					&nbsp;&nbsp; <span>댓글 </span>&nbsp;&nbsp; <span
						style="font-size: 0.9em;"><%=commntDao.countComments(post.getPost_id())%></span>

				</div>
				<!-- likes-replies-container -->
			</div>
			<!-- likes-replies-container -->
		</div>
		<!-- post-container -->

	
		<!-- 대댓글에서 수정해야 하는 부분
		1. commentId를 컨트롤러로 보내줘야함 
		2. 그래서 comments-container 에다가 data-values라는 임의의 값 추가 후 거기에 commentId 담음
		3. 근데 js 에서 data-values를 받아오지 못해 대댓글 전송이 안됨ㅠ
		
		for문에서 comment.getComment_id로 값이 가져와지는 건 확인함
		아무래도 data-values에 담기는 과정에서 문제가 생긴듯 -->	
		<%
		if (commntDao.countComments(post.getPost_id()) > 0) {
		%>
		<!-- 댓글 부분!! -->
		<div class="comment-text" style="font-weight: bold; font-size: 1.2em;">
			<span>댓글</span>&nbsp;<span><%=commntDao.countComments(post.getPost_id())%></span>
		</div>
		<%
		for (int i = 0; i < postComments.size(); i++) {
			CommentHierarchyView comment = postComments.get(i);
			UserInfo commentWriter = userDao.propicContent(comment.getUser_id());
			if ((comment.getLv()).compareTo(BigDecimal.valueOf(1)) == 0) {
		%>
		<!-- 댓글 박스, value로 코멘트 아이디 넣어놓음 //지호 한칸 밑에 넣어놨어요!! -->
		<div class="comments-container">
			<div class="comment-area" style="margin-bottom: 10px;">
				<!-- 이미 쓰여 있는 댓글 박스 -->
				<div class="comment-container" data-value="<%=comment.getComment_id() %>">
					<!-- 댓글의 아이디 -->
					<!-- 댓글 작성자 -->
					<a href="Profile.jsp?targetId=<%=commentWriter.getUser_id()%>"
						class="link">
						<div class="comment-info">
							<!-- 댓글 작성자 프사 넣는 공간 -->
							<%
							if (commentWriter.getPropic() != null) {
							%>
							<div class="comment-propic"
								style="background-image: url('data:image/jpg;base64,<%=commentWriter.getPropic()%>')"></div>
							<%
							} else {
							%>
							<div class="comment-propic"></div>
							<%
							}
							%>
						</div>
					</a>

					<!-- 작성자 이름 누르면 프로필로 이동 -->
					<div class="comment-content shadow-div">
						<a href="Profile.jsp?targetId=<%=commentWriter.getUser_id()%>"
							class="link">
							<div class="comment-name"><%=commentWriter.getName()%></div>
						</a>
						<!-- 댓글 내용 -->
						<span><%=comment.getComment_content()%></span>
					
					
					<!-- 댓글 작성자만 볼 수 있도록 js처리를 위해 -->
					<%
					if(user!=null){
						if(commentWriter.getUser_id().equals(user.getUser_id())){
							isReplyWriter = true;
					%>
					<!-- 수정 버튼 -->
					<div id="reply-edit-btn" data-value="<%=comment.getComment_id() %>" style="position: absolute; right: 69px; top: 5px; font-size: 1.5em; color: gray;">
						<ion-icon name="pencil-outline"></ion-icon>
					</div>

					<!-- 삭제 버튼 -->
					<div id="reply-delete-btn" onclick="deleteReply(this)" data-value="<%=comment.getComment_id() %>"
						style="position: absolute; right: 17px; top: -1px; font-size: 2em; color: gray;">
						<ion-icon name="close-outline"></ion-icon>
					</div>
					<%}
					}%>



						<div class="comment-btn">
							<div class="comment-btn-likes">
								<span>좋아요</span>
							</div>
							&nbsp; &nbsp; &nbsp;
							<div class="comment-btn-reply">
								<span onclick="recomment(this)">답글</span>
							</div>
						</div>
					</div><!-- comment-btn -->
				</div><!-- comment-content -->
			</div><!-- comment-container -->
			<%
			} else {
			%>

			<!-- 대댓글 박스, value로 코멘트 아이디 넣어놓음 //지호 이건 전체 댓글 컨테이너라 밑에 이미 쓰인 댓글 박스에 넣어줬어요! -->
			<div class="recomments-container" style="margin-top: 0px;">
				<div class="comment-area">
					<!-- 이미 쓰여 있는 댓글 박스 -->
					<div class="comment-container" data-value="<%=comment.getComment_id() %>">
						<!-- 댓글 작성자 -->
						<a href="Profile.jsp?targetId=<%=commentWriter.getUser_id()%>"
							class="link">
							<div class="comment-info">
								<!-- 댓글 작성자 프사 넣는 공간 -->
								<%
								if (commentWriter.getPropic() != null) {
								%>
								<div class="comment-propic"
									style="background-image: url('data:image/jpg;base64,<%=commentWriter.getPropic()%>')"></div>
								<%
								} else {
								%>
								<div class="comment-propic"></div>
								<%
								}
								%>
							</div>
						</a>

						<div class="comment-content shadow-div"  style="background-color: lightgray;">
							<a href="Profile.jsp?targetId=<%=commentWriter.getUser_id()%>"
								class="link">
								<div class="comment-name"><%=commentWriter.getName()%></div>
							</a>
							<!-- 댓글 내용 -->
							<span><%=comment.getComment_content()%></span>
							<!-- 수정/삭제/신고 버튼 -->
							<div class="btn-edit">
								<ion-icon name="ellipsis-horizontal-outline"></ion-icon>
							</div>
							<div class="comment-btn">
								<div class="comment-btn-likes">
									<span>좋아요</span>
								</div>
								&nbsp; &nbsp; &nbsp;
								<div class="comment-btn-reply">
									<span onclick="recomment(this)">답글</span>
								</div>
							</div><!-- comment-btn -->
						</div><!-- comment-content -->
					</div><!-- comment-container -->
				</div><!-- comment-area -->
			</div><!-- recomments-container -->
			<%
			} //else
			} //for
			} //if - 댓글이 0개가 아니라면
			%>
			<%
			if (user != null) {
			%>
			<!-- 댓글 쓰기 박스-->
			<div class="comment-container" style="margin-top:50px;margin-bottom:50px;">
				<a href="Profile.jsp?targetId=<%=user.getUser_id()%>" class="link">
					<div class="comment-info">
						<!-- 댓글 작성자 프사 넣는 공간 -->
						<%
						;
						if (user.getPropic() != null) {
						%>
						<div class="comment-propic"
							style="background-image: url('data:image/jpg;base64,<%=userDao.propicContent(user.getUser_id()).getPropic()%>')"></div>
						<%
						} else {
						%>
						<div class="comment-propic"></div>
						<%
						}
						%>
					</div>
				</a>
				<form action="CommentInsertController" class="comment-area">
					<input type="hidden" name="post_id" value="<%=post.getPost_id() %>">
					<input type="hidden" name="user_id" value="<%=user.getUser_id() %>">
					<div class="comment-write-container shadow-div"
						style="box-shadow: 0px 0px 20px rgba(218, 196, 248, 1);">
						<textarea name="comment_content" placeholder="남기고 싶은 이야기를 적으셈"
							class="comment" rows="4" cols="300"></textarea>
					</div>
					<button id="submit" type="submit">게시하기</button>
				</form>
			</div>
			<%
			}
			%>
		</div>
	</div>


	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
	<script type="text/javascript"
		src="https://code.jquery.com/jquery-1.10.2.min.js" /></script>
	<script>
		<%if (user != null) {%>	
		//하트 버튼
		function start() {
			const postId = "<%=post.getPost_id()%>";
			const userId = "<%=user.getUser_id()%>";
			
			$.ajax({
				type :"post", // 타입 (get, post, put 등등)    
				url : "LikeController", // 요청할 서버url    
				async : true, // 비동기화 여부 (default : true)    
				dataType : "json", // 데이터 타입 (html, xml, json, text 등등), 여러개 보낼 땐 보통 json으로 보냄
				data : {
					"modify" : "F",
					"postId" : postId,
					"userId" : userId,
					"type" : "L"
				},
				success : function(result) {
					// 성공 콜백함수        
					console.log(result)
					console.log("이미 좋아요 한 글")
					if(result==2){
						$('.heart').toggleClass("heart-active")
					}
				},
				error : function(request, status, error) {
					//에러 콜백함수        
					console.log("좋아요 안 한 글")
					console.log(request.responseText)
					console.log(error)
				}
			})//ajax
		}
		start();
		$(document).ready(function() {
			
			$('.heart').click(function() {
				const postId = "<%=post.getPost_id()%>";
				const userId = "<%=user.getUser_id()%>";

				$.ajax({
					type : "post", // 타입 (get, post, put 등등)    
					url : "LikeController", // 요청할 서버url    
					async : true, // 비동기화 여부 (default : true)    
					dataType : "json", // 데이터 타입 (html, xml, json, text 등등), 여러개 보낼 땐 보통 json으로 보냄
					data : {
						"modify" : "T",
						"postId" : postId,
						"userId" : userId,
						"type" : "L"
					},
					success : function(result) {
						// 성공 콜백함수        
						console.log(result)
						console.log("좋아요 반영 성공")
						if (result == 1) {
							$('.heart').toggleClass("heart-active")
							let like_cnt = document.getElementById(postId);

							let currentValue = parseInt(like_cnt.innerHTML);
							let newValue = currentValue + 1;

							// 결과를 다시 innerHTML에 할당하여 화면에 반영
							like_cnt.innerHTML = newValue;
						} else if (result == -1) {
							$('.heart').toggleClass("heart-active")
							let like_cnt = document.getElementById(postId);

							let currentValue = parseInt(like_cnt.innerHTML);
							let newValue = currentValue - 1;

							// 결과를 다시 innerHTML에 할당하여 화면에 반영
							like_cnt.innerHTML = newValue;
						}
					},
					error : function(request, status, error) {
						//에러 콜백함수        
						console.log("좋아요 반영 실패")
						console.log(request.responseText)
						console.log(error)
					}
				})//ajax
			});//$('.heart').click(function()


		});//$(document).ready(function()
		
		//답글 버튼이 눌리면
		function recomment(button){
			 
		    let commentContainer = button.closest('.comment-container'); // 가장 가까운 .comment-container를 변수로 받아옴
		    console.log(commentContainer.dataset.value); //(지호) 이렇게도 접근 가능!
		    let value = commentContainer.getAttribute('data-value');
		    console.log(value); //(지호) 찬우씨것도 혹시 몰라서 찍어봤어요 - 동일하게 나옴
			 
		    let recommentDiv = document.createElement('div');
		    recommentDiv.classList.add('recomment-container'); // 새로운 div에 클래스 추가
		    recommentDiv.innerHTML = `<!-- 대댓글 쓰기 박스-->
			<div class="recomment-container" style="margin-bottom:50px;margin-top: 10px; display:flex;">
				<a href="Profile.jsp?targetId=$<%=user.getUser_id()%>&commentId=${value}" class="link">
					<div class="comment-info">
						<!-- 댓글 작성자 프사 넣는 공간 -->
						<%
						if (user.getPropic() != null) {
						%>
						<div class="comment-propic"
							style="background-image: url('data:image/jpg;base64,<%=userDao.propicContent(user.getUser_id()).getPropic()%>')"></div>
						<%
						} else {
						%>
						<div class="comment-propic"></div>
						<%
						}
						%>
					</div>
				</a>
				<form action="CommentInsertController" class="comment-area" style="width:100%;">
					<input type="hidden" name="post_id" value="<%=post.getPost_id() %>">
					<input type="hidden" name="user_id" value="<%=user.getUser_id() %>">
					<div class="comment-write-container shadow-div"
						style="box-shadow: 0px 0px 20px rgba(218, 196, 248, 1);background-color: lightgray;">
						<textarea name="comment_content" placeholder="남기고 싶은 이야기를 적으셈"
							class="comment" rows="4" cols="300"></textarea>
					</div>
					<button id="submit" type="submit" style="bottom:60px; height: 30px;">게시하기</button>
				</form>
			</div>
			</div>
		    `
		    // 부모 요소의 다음 형제로 새로운 div를 추가
		    commentContainer.parentNode.insertBefore(recommentDiv, commentContainer.nextSibling);
		}
	<%}%>
		
	</script>
	
	<script>
	// 포스팅 삭제 버튼
	document.addEventListener("DOMContentLoaded", function() {
		if (<%=isPostWriter%>){
			var deleteButton = document.getElementById("delete-btn");
			deleteButton.style.display = "block"; //버튼 보이게
	        
			deleteButton.addEventListener("click", function() {
				if (confirm("삭제하시겠습니까?")) {
	    			$.ajax({
	    				url:"PostDeleteController",
	    				type:"post",
	    				data:{
	    					"postId" : <%=postId%>
	    				}
	    			}) //ajax
	    			var check = confirm("삭제되었습니다.");
	        		if(check==true){
	        			window.location.href = "Main.jsp";
	        		}else if(check==false){
	        			window.location.href = "Main.jsp";
	        		}
	    		} //if
			}) //addEventListener
		} //if
	})//addEventListenr
	
	//댓글 삭제 버튼
	function deleteReply(button){
		let commentContainer = button.closest('.comment-container');
		let commentId = commentContainer.dataset.value;
	
		if (confirm("삭제하시겠습니까?")) {
    		$.ajax({
    			url:"CommentDeleteController",
    			type:"post",
    			data:{
    				"commentId" : commentId
    			}
    		}) //ajax
    		var check = confirm("삭제되었습니다.");
    		window.location.href = window.location.href; //새로고침
    		}//else
		};//funciton
	</script>
</body>

</html>