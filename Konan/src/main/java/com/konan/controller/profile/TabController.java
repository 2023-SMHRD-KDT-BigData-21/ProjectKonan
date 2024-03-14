package com.konan.controller.profile;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.konan.model.Post;
import com.konan.model.PostDAO;
import com.konan.model.UserInfo;

public class TabController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		PostDAO dao = new PostDAO();
		
		//유저 아이디 가져오기
		UserInfo userInfo = (UserInfo)session.getAttribute("userInfo");
		String userId = userInfo.getUser_id();
		//탭 아이디 가져오기
		String tabId = request.getParameter("tabId");
		System.out.println(tabId);
		
		//탭별 리스트 가져오기
		List<Post> myList = new ArrayList<Post>();
		if(tabId.equals("community"))
			myList = dao.myList(userId,"C");
		else if(tabId.equals("question"))
			myList = dao.myList(userId, "Q");
		else
			myList = dao.myList(userId, "A");
		
		System.out.println("list확인:" + myList);
		ObjectMapper mapper = new ObjectMapper(); //JSON 형식으로 변환하기 위해
		String jsonString = mapper.writeValueAsString(myList);
		
        // JSON 응답 반환
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsonString);
	}
}
