<%@page import="com.konan.model.UserFollowingDAO"%>
<%@page import="com.konan.model.UserFollowing"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="java.util.List"%>
<%@page import="com.konan.model.UserInfoDAO"%>
<%@page import="com.konan.model.UserInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%
		String targetId = request.getParameter("targetId"); 
		pageContext.setAttribute("targetId", targetId);
		
		UserInfoDAO dao = new UserInfoDAO();
		UserFollowingDAO followDao = new UserFollowingDAO();
		
		List<UserFollowing> targetFollowings = followDao.getFollowings(targetId);
		pageContext.setAttribute("targetFollowings",targetFollowings);
		System.out.println(targetFollowings.size());
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${targetId}님의 팔로잉</title>
<link rel="stylesheet" href="./css/Follow.css">
</head>
<body>
	<%@ include file="Header.jsp" %>
    <div class="container">
        <div class="upper">
            <h2><span name="username">${targetId}</span>님<span class="normal">의 팔로잉 정보</span></h2>
            <hr>
        </div>
    
    
    	<div class="follow-container">
            <div class="follow-list shadow-div">
        
                <!-- 여기에 팔로워 리스트 동적 구현-->
              
                <% 
                System.out.println("타겟 유저 아이디: "+targetId);
                System.out.println("타겟 유저 팔로잉 리스트 사이즈: "+targetFollowings.size());
             // 타겟유저의 팔로잉 리스트를 받아와 팔로잉 리스트의 사이즈 만큼 for문 돌림
                for(int i = 0; i < targetFollowings.size(); i++){
                		UserFollowing following = targetFollowings.get(i);
                		String followingId = following.getTarget_id();
                		System.out.println("팔로잉 아이디:"+followingId);
                		
                		UserInfo followingInfo = dao.propicContent(followingId);//유저 인포 객체 + 프사 정보를 base64로 변환하여 가져옴
                		pageContext.setAttribute("followingInfo",followingInfo);//followingInfo라는 이름으로 객체 저장
                		System.out.println("팔로잉 프사 주소:"+followingInfo.getPropic());
                %>
                	
                    <div class="follow">
                        <div class="user-container">
                            <%if(followingInfo.getPropic()==null){%>
                            	<!-- 프로필사진이 없다면 -->
                				<div class = "propic shadow-div" style="border-radius: 50%; background-image: url('./img/defaultPropic.png')"></div>                	
                			<%}else{%>
                				<!-- 프로필 사진이 있다면 -->
                				<div class = "propic shadow-div" style="border-radius: 50%; background-image: url('data:image/jpg;base64,${followingInfo.getPropic()}')"></div>
                			<%} %>
                			<!-- 팔로잉 중인 사람 정보 -->
                            <div class="user-info">
                                <a href="Profile.jsp?targetId=${followingInfo.getUser_id()}" style="text-decoration: none;"><h3 name="user_name" class="user-name">${followingInfo.getName()}</h3></a>
                                <span class="user-id">@<span name="user_id">${followingInfo.getUser_id()}</span></span>
                            </div>
                            <!-- 팔로잉 버튼 -->
                            <%if(user!=null){ %>
                            <!-- 로그인 중이면 -->
                            <%UserFollowing userFollowing = new UserFollowing(user.getUser_id(),followingId);
                             //이미 팔로잉 중인 사용자일 때
                             if(followDao.isFollowing(userFollowing)>0){%>
                            <!-- active-btn 클래스 추가 -->
                            <!-- following_btn 클래스 절대 삭제하면 안됨(js와 연결 담당) -->
                            <button id="following_btn" class="following_btn active-btn" type="button" value="${followingInfo.getUser_id()}">팔로잉</button>
                            <%}
                             else if(followingInfo.getUser_id().equals(user.getUser_id())){
                            	 System.out.println("로그인 사용자 == 팔로잉");
                             }
                             else{%>
                            <!-- active-btn 클래스 해제 + 팔로우로 텍스트 변경 -->             
                            <button id="following_btn" class="following_btn" type="button" value="${followingInfo.getUser_id()}">팔로우</button>
                            <%}
                            }//if
                            else{
                            // 로그인 하지 않았으면%>
                            <button class="following_btn"  type="button">팔로우</button>
                            <%}//else %>
                        </div>
                	</div>
                <%}%>
                    
                </div>
            </div>

    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script>
  	//팔로잉 버튼 누르기 
	document.querySelectorAll(".following_btn").forEach(function(btn) {
		btn.addEventListener('click', function() {
			
			const targetId = this.value;
			
			console.log(targetId);
			console.log("눌림!");
			
			if(btn.matches('.active-btn')){
				// 팔로잉 팔로우 글자 바꾸기 클래스 유무로 
				console.log("언팔로우");
				btn.innerHTML = "팔로우"
			}else{
				console.log("팔로잉");
				btn.innerHTML = "팔로잉"
			}
			
			this.classList.toggle('active-btn');
			
			
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
	});
    
    </script>
</body>
</html>