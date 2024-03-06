<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<button onclick="chat()" class="chat_btn">채팅하기</button> <!-- onclick이 제일 먼저 와야함 -->

<script type="text/javascript">
	function chat(){
		//채팅창 띄우기
		console.log("실행")
		window.open("<%= request.getContextPath()%>/chat2.jsp", "chat_win", "width=640, height=800")
	}
</script>
</body>
</html>