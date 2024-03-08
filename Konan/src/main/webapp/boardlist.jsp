<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="java.util.List"%>
<%@page import="com.konan.model.PostDAO"%>
<%@page import="com.konan.model.Post"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    
<%-- tag lib 사용전에 이거 꼭 작성 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<%
PostDAO dao = new PostDAO();
	//List<Post> boardList = dao.boardList();
	pageContext.setAttribute("boardList",boardList);//jstl, el표기로 사용하려면 자바변수를 페이지 내부에 저장해야함
	System.out.print(boardList.size());
%>
<div class="container">
  <h2>빅데이터반 게시판😎😎</h2>
  <div class="panel panel-default">
    <div class="panel-heading">게시판</div>
    <div class="panel-body" id="list">
    	  <table class="table table-bordered">
		    <thead>
		      <tr>
		        <th>번호</th>
		        <th>제목</th>
		        <th>작성자</th>
		        <th>작성일</th>
		        <th>삭제</th>
		      </tr>
		    </thead>
		    <tbody>
			<!-- 게시물 출력 -->
			<c:forEach items = "${boardList}" var="board" varStatus = "status">
				<tr>
					<td>${status.count}</td>
					<td><a href="boardcontent.jsp?idx=${board.idx}">${board.title}</a></td>
					<td>${board.writer}</td>
					<td>${board.indate}</td>
					<td>${board.content}</td>
				</tr>
			</c:forEach>



		      <tr>
		      	<td colspan="4">
		      		<button onclick="location.href='boardform.jsp'" class="btn btn-sm btn-success">글작성</button>
		      	</td>
		      </tr>
		    </tbody>
		  </table>
    
    </div>
    <div class="panel-footer">빅데이터 분석서비스 개발자 과정 (담임 : 주미리)</div>
  </div>
</div>
</body>
</html>





