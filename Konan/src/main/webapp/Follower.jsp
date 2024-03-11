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
        

            <div class="follow-container">
                <h1>Follower List</h1>
                <!-- 여기에 팔로워 리스트 동적 구현-->
                <div class="follow-list shadow-div">
                    <div class="follow">
                        <div class="user-container">
                            <img src="./img/defaulPropic.png" alt="프로필 사진">
                            <div class="user-info">
                                <strong name="user_name" class="user-name">User1</strong>
                                <br>
                                <span class="user-id">@<span name="user_id">user1Id</span></span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

    </div>
</body>
</html>
