<%@page import="com.konan.model.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.konan.model.PostDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시물 관리</title>
</head>
<body>
    <div class="upper">
        <%
            PostDAO dao = new PostDAO();
            response.setContentType("text/html;charset=UTF-8");
            List<Post> postList = dao.reportedPost();
            for (Post post : postList) {
        %>
            <p>
                <span><%= post.getTitle() %></span> |
                <span><%= post.getPost_content() %></span> |
                <span><%= post.getUser_id() %></span> |
                <span><%= post.getReport_cnt() %></span> |
                <a href="ReportDController=<%= post.getPost_id() %>">삭제</a>
            </p>
        <%
            }
        %>
    </div>
</body>
</html>