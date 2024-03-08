<%@page import="com.konan.model.BoardDAO"%>
<%@page import="com.konan.model.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  isELIgnored="false"%>
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
	int idx= Integer.parseInt(request.getParameter("idx"));
	BoardDAO dao = new BoardDAO();
	Board content = dao.getBoard(idx);
	pageContext.setAttribute("content",content);
	//pageContext.setAttribute(content);
%>

<div class="container">
  <h2>빅데이터반 게시판😎😎</h2>
  <div class="panel panel-default">
    <div class="panel-heading">게시판</div>
    <div class="panel-body">
    	<table class="table table-bordered">
    		<tr>
    			<td>번호</td>
    			<td>${content.idx}</td>
    		</tr>
    		<tr>
    			<td>제목</td>
    			<td>${content.title}</td>
    		</tr>
    		<tr>
    			<td>내용</td>
    			<td>${content.content}</td>
    		</tr>
    		<tr>
    			<td>작성자</td>
    			<td>${content.writer}</td>
    		</tr>
    		<tr>
    			<td>작성일</td>
    			<td>${content.indate}</td>
    		</tr>
    		<tr>
    			<td>이미지</td>
    			<td><img src="data:img/jpg;base64,${content.img}"></td>
    		</tr>
    		<tr>
    			<td colspan="2" align="center">
    				<a href="boardlist.jsp"><button class="btn btn-sm btn-success">리스트</button></a>    			
    			</td>
    		</tr>
    	</table>
    
    </div>
    <div class="panel-footer">빅데이터 분석서비스 개발자 과정 (담임 : 주미리)</div>
  </div>
</div>

</body>
</html>
