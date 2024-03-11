<%@page import="java.util.List"%>
<%@page import="com.konan.model.UserFollowing"%>
<%@page import="com.konan.model.UserFollowingDAO"%>
<%@page import="com.konan.model.UserInfoDAO"%>
<%@page import="com.konan.model.UserInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String targetId = request.getParameter("targetId");
	pageContext.setAttribute("targetId", targetId);
	
	UserInfoDAO dao = new UserInfoDAO();
	
	UserInfo targetInfo = dao.propicContent(targetId);
	pageContext.setAttribute("targetInfo",targetInfo);
	
	String targetPropic = targetInfo.getPropic();
	pageContext.setAttribute("targetPropic",targetInfo.getPropic());	
	
	UserFollowingDAO followDao = new UserFollowingDAO();
	List<UserFollowing> targetFollowings = followDao.getFollowings(targetId);
	pageContext.setAttribute("targetFollowings",targetFollowings);

	List<UserFollowing> targetFollowers = followDao.getFollowers(targetId);
	pageContext.setAttribute("targetFollowers",targetFollowers);
%>
<!DOCTYPE html>
<html lang="kor">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${targetId}님의 프로필</title>
    <link rel="stylesheet" href="./css/Default.css">
    <link rel="stylesheet" href="./css/Profile.css">
</head>
<body>
	<%@ include file="Header.jsp" %>
    <div class = "container">
        <!-- 프로필 컨테이터 -->
        <div class = "profile-container shadow-div">
            <div class = "profile-background"></div>

            <!-- 프로필 페이지 상단 유저 정보 담은 부분 -->
            <div class = "user-container" style="border-top-left-radius: 0 0;border-top-right-radius: 0 0;">
                <!-- 프사 -->
                <!-- 프사가 없을 때 -->
                <%if(targetPropic==null){%>
                	<div class = "propic shadow-div" style="border-radius: 50%; background-image: url('./img/defaultPropic.png')"></div>                	
                <%}else{%>
                	<div class = "propic shadow-div" style="border-radius: 50%; background-image: url('data:image/jpg;base64,${targetPropic}')"></div>
                <%} %>
                <!-- 이름, 아이디 -->                
                <div class = "user-info"></div>
                    <h3 name="user_name" style="margin:0px; padding:0px;">${targetInfo.getName()}</h3>
                    <span style="font-size:0.8em;">@<span name="user_id">${targetInfo.getUser_id()}</span></span>  
	        	<!-- 팔로잉/팔로워 버튼 -->
	            <div class = "relation-container" style="text-decoration: none;">
	                <a href="Following.jsp?targetId=${targetId}">
	                	<button class="relation-btn" style="text-decoration: none;">팔로잉&nbsp;<span name="following">${targetFollowings.size()}</span></button>
	                </a>
	                <span>&nbsp;&nbsp;&nbsp;</span>
	                <a href="Follower.jsp?targetId=${targetId}">
	                	<button class="relation-btn">팔로워&nbsp;<span name="follower">${targetFollowers.size()}</span></button>
	                </a>
	       </div><!-- user-container -->
	       
	       <!-- user = target00 -->
	       
	       <%
	       if(user != null){
	           if(user.getUser_id().equals(targetId)){%>
		       <button onclick="openModal()" class="fix-btn">프로필 수정</button>
		       <div id="modal" style="display:none; z-index:1;">
		           <form action="UpdateController" method="post" enctype="multipart/form-data">
                        <input type="file" name="propic">
                        <button type="submit" class="btn btn-primary">사진변경</button>
                   </form>
		       </div>	       
	       <%}else{%>
	       	   <!-- following_btn은 자바스크립트 함수를 위해 만듦! -->
	       	   <%
	       	   UserFollowing userFollowing = new UserFollowing(user.getUser_id(),targetId);
	       	   if(followDao.isFollowing(userFollowing)>0){%>
	       	      <button id="following_btn" class="fix-btn active-btn" type="button">팔로잉</button>
	       <%}//if
	       	   else{ %>
	       	      <button id="following_btn" class="fix-btn" type="button">팔로우</button>	       		   
	       	 <%}
	       	   }//else
	       }//if
	       else{
	       %>
	       	   <!-- following_btn은 자바스크립트 함수를 위해 만듦! -->
	       	   <button id="following_btn" class="fix-btn" type="button">팔로잉</button>
	       <%}//else%>
	       <!-- 회원 정보 수정 -->
	       
	       
       </div><!-- profile-contain -->
	        	
	</div>
    <!-- 만일 자신의 프로필이라면 visibility을 hidden에서 visible로 변경 -->
            

            <br>


            <!-- 지호씨 -->
    <!-- 유저 게시글/유저 질문 전환 탭-->
	<div class="content-tab">
		<div class="tab-header">
    		<div id="community" class="active">
      			<i class="fa fa-code"></i> 게시글
    		</div>
    		<div id="question">
      			<i class="fa fa-pencil-square-o"></i> 질문
    		</div>
    		<div id="answer">
      			<i class="fa fa-bar-chart"></i> 답변
    		</div>
  		</div>
  
  		<!-- 탭 버튼 누르면 따라다니는 막대기ㅎㅎ-->
  		<div class="tab-indicator"></div>
  	
  		<!--  내용 넣는 곳, onclick으로 비동기 페이지 전환 -->
  		<div class="tab-body">
    		<div class="post-container">
      			<h2>제목</h2>
      			<p>내용</p>
    		</div>
  		</div>
  		
  		
	</div>
</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	<script src="./js/Profile.js"></script>
    <script> 
    	//팔로잉 버튼 누르기 
    	let btn = document.getElementById("following_btn");
    	btn.addEventListener('click', function() {
    		const url = new URL(window.location.href);
    		const urlParameter = window.location.search;
    		const urlParams = url.searchParams;

    		const targetId = urlParams.get('targetId');
    		
    		console.log(targetId);
    		
    		console.log("눌림!");
    		this.classList.toggle('active-btn');
    		
    		//if(){
    			// 팔로잉 팔로우 글자 바꾸기 클래스 유무로 
    		//}
    		
			$.ajax({    
				type : "post", // 타입 (get, post, put 등등)    
				url : "FollowController", // 요청할 서버url    
				async : true,  // 비동기화 여부 (default : true)    
				dataType : "", // 데이터 타입 (html, xml, json, text 등등), 여러개 보낼 땐 보통 json으로 보냄
				data : {"targetId" : targetId},
				success : function(result) { 
							// 성공 콜백함수        
							console.log("btn 성공")
						},    
				error : function(request, status, error) { 
							//에러 콜백함수        
							console.log("btn 실패")
							btn.classList.toggle('active-btn')
							console.log(request.responseText)    
							console.log(error)    
						}
				})//ajax
    	});//addEventListener
		
		// 모달 열기
		function openModal() {
		    document.getElementById("modal").style.display = "block";  
		  }
		// 모달 닫기
		function closeModal() {
		    var modal = document.getElementById("modal");
		    modal.style.display = "none";
		  }
		  
    </script>
</body>
</html>