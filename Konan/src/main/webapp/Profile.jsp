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

<!DOCTYPE html>
<html lang="kor">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>S{userName}님의 프로필</title>
    <link rel="stylesheet" href="./css/Default.css">
    <link rel="stylesheet" href="./css/Profile.css">
</head>
<body>
<%
	String targetId = request.getParameter("targetId");
	UserInfoDAO dao = new UserInfoDAO();
	UserInfo targetInfo = dao.getUser(targetId);//
	pageContext.setAttribute("targetInfo",targetInfo);
%>
	<%@ include file="Header.jsp" %>
    <div class = "container">
        <!-- 동현씨 -->
        <!-- 프로필 컨테이터 -->
        <div class = "profile-contain">
            <div class = "profile-background"></div>

            <!-- 프로필 페이지 상단 유저 정보 담은 부분 -->
            <div class = "user-container">
                <!-- 프사 -->
                <div class = "propic"></div>
                <!-- 프사수정 -->
                <button class = "update_btn"></button>
                <!-- 이름, 아이디 -->                
                <div class = "user-info"></div>
                    <strong name="user_name">${targetInfo.getName()}</strong>
                    <br>
                    <span>@<span name="user_id">${targetInfo.getUser_id()}</span></span>
	        	<!-- 팔로잉/팔로워 버튼 -->
	            <div class = "relation-container">
	                <a href="Following.jsp">
	                	<button class="relation-btn">팔로잉&nbsp;<span name="following">${followingCnt}</span></button>
	                </a>
	                <span>&nbsp;&nbsp;&nbsp;</span>
	                <a href="Follower.jsp">
	                	<button class="relation-btn">팔로워&nbsp;<span name="follower">S{follwerCnt}</span></button>
	                </a>
	            </div>
           </div>
	        	
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
    </script>
</body>
</html>