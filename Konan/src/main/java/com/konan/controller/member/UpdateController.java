package com.konan.controller.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.konan.model.UserInfo;
import com.konan.model.UserInfoDAO;

public class UpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		//ID 가져오기
		//1.세션 활용
//		HttpSession session = request.getSession();
//		Member loginMember = (Member)session.getAttribute("member");
//		String id = loginMember.getId();
		
		//2.input 태그 활용
		//	1) update.jsp에서 <input type="hidden"> 추가
		String user_id = request.getParameter("user_id");
		
		String user_pw = request.getParameter("user_pw");
		String phone_number = request.getParameter("phone_number");
		String region = request.getParameter("region");
		
		UserInfo member = new UserInfo(user_id,user_pw,phone_number,region);
		
		UserInfoDAO dao = new UserInfoDAO();
		int res = dao.update(member);
		
		if(res>0) {
			HttpSession session = request.getSession();
			session.setAttribute("member", member);
			response.sendRedirect("index.jsp");
		}else
			response.sendRedirect("update.jsp");
	}
}
