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
		
		UserInfo userInfo = new UserInfo(userId, userPw);
		UserInfo user = dao.login(userInfo);
		
		HttpSession session = request.getSession();		
		try {
			if(user != null) {
				System.out.println(userInfo.getUserId());
				session.setAttribute("user", user);
				session.setAttribute("isSuccess", true);
				response.sendRedirect("Main.jsp");
				
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
