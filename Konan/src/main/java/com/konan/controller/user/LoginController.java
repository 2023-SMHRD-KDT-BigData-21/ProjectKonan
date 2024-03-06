package com.konan.controller.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.konan.model.Member;
import com.konan.model.MemberDAO;

public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberDAO dao = new MemberDAO();

		response.setContentType("text/html;charset=UTF-8");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw"); 
		
		Member member = new Member(id, pw);
		Member user = dao.login(member);
		
		HttpSession session = request.getSession();		
		try {
			if(user != null) {
				System.out.println(user.getId());
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
