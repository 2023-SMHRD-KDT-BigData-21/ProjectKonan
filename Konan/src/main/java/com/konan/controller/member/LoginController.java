package com.konan.controller.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.konan.model.UserInfo;
import com.konan.model.UserInfoDAO;

public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserInfoDAO dao = new UserInfoDAO();

		response.setContentType("text/html;charset=UTF-8");
		
		String userId = request.getParameter("userId");
		String userPw = request.getParameter("userPw"); 
		
		UserInfo member = new UserInfo(userId, userPw);
		
		
		// 세션 생성
		HttpSession session = request.getSession();	
		session.setMaxInactiveInterval(3600);
		try {
			//가끔 오류 나서 try 구문 안에 넣음
			UserInfo user = dao.login(member);

			if(user.getUser_id() != null) {	
				System.out.println("로그인 컨트롤러, 로그인 아이디:"+user.getUser_id());
				if(session.getAttribute("userInfo")==null || session.getAttribute("userInfo")=="") {
					session.setAttribute("userInfo", user);
					session.setAttribute("isSuccess", true);
					response.sendRedirect("Main.jsp");									
				}
			}else {
				System.out.println("로그인 실패");
				session.setAttribute("isSuccess", false);
				response.sendRedirect("Login.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("Login.jsp");
		}
	}

}
