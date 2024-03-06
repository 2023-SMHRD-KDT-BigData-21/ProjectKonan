<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DevEric Chatting</title>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<link rel="stylesheet" href="./css/style.css">
</head>
<body>
	<div id="main-container">
		<div id="chat-container"><%-- 메세지가 띄워지는 공간 --%>
			<% %>
		</div>
		<div id="bottom-container"><%-- 입력창 --%>
			<input id="inputMessage" type="text">
			<input id="btn-submit" type="submit" value="전송" >
		</div>
	</div>
	<script>
		let webSocket = new WebSocket("ws://localhost:8080/mavenmember/chat")
		
		let input = document.getElementById("inputMessage")
		$("#btn-submit").click(function(){
				let msg = input.value
				webSocket.send(msg)
				
				let chat = `<div class = "my-chat-box"><div class = "chat my-chat">`+msg+`</div></div>`
				$("#chat-container").append(chat)
				input.value=""
		})
		
		//onopen
		webSocket.onopen = function(e){
			console.log("Socket 연결")
		} 
		//onclose
		webSocket.onclose = function(e){
			console.log("Socket 해제")
		} 
		
		webSocket.onerror = function(e){
			console.log(e.data)
		}
		
		webSocket.onmessage = function(e){
			console.log(e.data)
			let chat = `<div class = "chat-box"><div class = "chat my-chat">`+e.data+`</div></div>`
			$("#chat-container").append(chat)
		} 
	</script>
</body>
</html>