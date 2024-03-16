<%@page import="com.konan.model.DetectiveInfoDAO"%>
<%@page import="com.konan.model.DetectiveInfo"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="com.konan.model.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.konan.model.PostDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	 <div class="upper">
        <%
            DetectiveInfoDAO dao = new DetectiveInfoDAO();
            response.setContentType("text/html;charset=UTF-8");
            List<DetectiveInfo> postList = dao.acceptList();
            for (DetectiveInfo post : postList) {
        %>
            <p>
                <span><%= post.getUser_id() %></span> |
                <span><%= post.getProof_shot() %></span> |
                <span><%= post.getReqdate() %></span> |
            
                <a href="ReportDController?id=<%= post.getUser_id() %>">승인</a>
            </p>
        <%
            }
        %>
    </div>
</body>
</html>