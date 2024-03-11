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
		
		List<UserFollowing> targetFollowers = followDao.getFollowers(targetId);
		pageContext.setAttribute("targetFollowers",targetFollowers);
		System.out.println(targetFollowers.size());
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${targetId}</title>
<link rel="stylesheet" href="./css/Follow.css">
</head>
<body>
	<%@ include file="Header.jsp" %>
    <div class="container">
        <div class="upper">
            <h2><span name="username">${targetId}</span>님<span class="normal">의 팔로워 정보</span></h2>
            <hr>
        </div>
    	<div class="follow-container">
            <div class="follow-list shadow-div">
        
                <!-- 여기에 팔로워 리스트 동적 구현-->
                <% for(int i = 0; i < targetFollowers.size(); i++){
                		UserFollowing follower = targetFollowers.get(i);
                		String followerId = follower.getUser_id();
                		System.out.print(followerId+"!");
                		UserInfo followerInfo = dao.propicContent(followerId);
                		pageContext.setAttribute("followerInfo",followerInfo);
                %>
                	
                    <div class="follow shadow-div-in">
                        <div class="user-container">
                            <%if(followerInfo.getPropic()==null){%>
                				<div class = "propic shadow-div" style="border-radius: 50%; background-image: url('./img/defaultPropic.png')"></div>                	
                			<%}else{%>
                				<div class = "propic shadow-div" style="border-radius: 50%; background-image: url('data:image/jpg;base64,${followerInfo.getPropic()}')"></div>
                			<%} %>
                            <div class="user-info">
                                <h3 name="user_name" class="user-name">${followerInfo.getName()}</h3>
                                <span class="user-id">@<span name="user_id">${followerInfo.getUser_id()}</span></span>
                            </div>
                        </div>
                	
                	<%
                	
                } %>
                    </div>
                </div>
            </div>

    </div>
</body>
</html>
