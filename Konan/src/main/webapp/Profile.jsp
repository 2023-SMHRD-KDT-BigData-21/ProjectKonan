<%@page import="java.util.List"%>
<%@page import="com.konan.model.UserFollowing"%>
<%@page import="com.konan.model.UserFollowingDAO"%>
<%@page import="com.konan.model.UserInfoDAO"%>
<%@page import="com.konan.model.UserInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 
	// 로그인 한 회원 정보 뽑아오기
	UserInfo user = (UserInfo)session.getAttribute("targetInfo");
	
	String userId = user.getUser_id();
	String name = user.getName();
	String propic = user.getPropic();
		
	pageContext.setAttribute("userId", userId);
	pageContext.setAttribute("name", name);
	pageContext.setAttribute("propic", propic);
--%>

<%
	String targetId = request.getParameter("targetId");
	pageContext.setAttribute("targetId", targetId);
	
	UserInfoDAO dao = new UserInfoDAO();
	UserInfo targetInfo = dao.getUser(targetId);//
	pageContext.setAttribute("targetInfo",targetInfo);
	
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
        <div class = "profile-container">
            <div class = "profile-background"></div>

            <!-- 프로필 페이지 상단 유저 정보 담은 부분 -->
            <div class = "user-container shadow-div">
                <!-- 프사 -->
                <div class = "propic shadow-div" style="border-radius: 50%;"></div>
                <!-- 이름, 아이디 -->                
                <div class = "user-info"></div>
                    <h3 name="user_name" style="margin:0px; padding:0px;">${targetInfo.getName()}</h3>
                    <span>@<span name="user_id">${targetInfo.getUser_id()}</span></span>
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
	       <%  }
	       }else{
	       %>
	       	   <button class="fix-btn" type="button">팔로잉</button>
	       <%}%>
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
  		
    		<div>
      			<h2>This is code section</h2>
      			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Error neque saepe commodi blanditiis fugiat nisi aliquam ratione porro quibusdam in, eveniet accusantium cumque. Dolore officia reprehenderit perferendis quod libero omnis.</p>
    		</div>
  		</div>
  		
  		
	</div>
</div>
	<script src="./js/Profile.js"></script>
    <script> 
		function showPostsByType(){
			
			let post_type = document.getElementById("post_type")//post 아이디로 가져옴
			console.log(post_type.value)//C/A/Q 중 하나
			
			$.ajax({    
			type : "", // 타입 (get, post, put 등등)    
			url : "", // 요청할 서버url    
			async : true,  // 비동기화 여부 (default : true)    
			dataType : "", // 데이터 타입 (html, xml, json, text 등등), 여러개 보낼 땐 보통 json으로 보냄
			data : {"" : post_type.value},
			success : function(result) { 
				// 성공 콜백함수        
						
					},    
			error : function(request, status, error) { 
						//에러 콜백함수        
						console.log("중복체크 실패")    
						console.log(request.responseText)    
						console.log(error)    
					}
			})
		}
		
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