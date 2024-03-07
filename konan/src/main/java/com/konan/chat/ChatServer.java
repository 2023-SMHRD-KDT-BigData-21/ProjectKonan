package com.konan.chat;

import java.io.IOException;
import java.util.Collections;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/chat")
public class ChatServer {
	//1. 현재 소켓에 연결된 세션 관리(여기에서 사용되는 건 웹소켓 세션)
	//	- set 형태로 제작, 동기화 죈 set 생성
	//	1) hash set - 
	Set<Session> sessions = Collections.synchronizedSet(new java.util.HashSet<Session>());
	
	//On open: 클라이언트가 접속했을 때 호출되는 이벤트
	@OnOpen
	public void handleOpen(Session session){
		System.out.println("클라이언트 접속");
		System.out.println("세션 아이디:"+session.getId());
		sessions.add(session);
	}
	
	//On close:클라이언트가 연결은 해제 헸을 때 연결되는 이벤트
	@OnClose
	public void handleClose(Session session) {
		System.out.println(session.getId()+"클라이언트 접속 종료");
		sessions.remove(session);		
	}
	//On error: 오류발샐시 호풀되는 이벤트
	@OnError
	public void handleError(Throwable t) {
		t.printStackTrace();
	}
//	//On message: 메세지를 받으면 호출되는 이벤트
	@OnMessage
	public void handleMessage(String message, Session session) {
		System.out.println(message);
		for(Session s: sessions) {
			if(!s.getId().equals(session.getId())) {
				try {
					s.getBasicRemote().sendText(message);
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}
}
