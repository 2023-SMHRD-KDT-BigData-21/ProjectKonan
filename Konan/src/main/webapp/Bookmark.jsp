<%@page import="java.math.BigDecimal"%>
<%@page import="java.util.List"%>
<%@page import="com.konan.model.PostImageDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
BigDecimal postId = new BigDecimal("58");
PostImageDAO dao = new PostImageDAO();
List<String> list = dao.select(postId);
for(int i = 0; i < list.size(); i++){
System.out.println(list.get(i));
}
%>
</body>
</html>