package com.konan.controller.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.konan.model.UserInfo;
import com.konan.model.UserInfoDAO;


public class JoinController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		//html에서 가져오기
		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");
		String email = request.getParameter("email");
		String name = request.getParameter("name");
		String phone_number = request.getParameter("phone_number");
					
		System.out.println("user_id: "+user_id);
		System.out.println("user_pw: "+user_pw);
		System.out.println("email: "+email);
		System.out.println("name: "+name);
		System.out.println("phone_number: "+phone_number);
				
			
			
		UserInfoDAO dao = new UserInfoDAO();
		
		UserInfo userInfo = new UserInfo(user_id,user_pw,email,name,phone_number);
		int rownum = dao.joinDefault(userInfo);
		System.out.println(rownum);
		
		if(rownum > 0) {
			//가입 성공시
			HttpSession session = request.getSession();
			session.setAttribute("userInfo", userInfo);
			System.out.println(userInfo.getUser_id());
			response.sendRedirect("JoinAsDetective.jsp");
		}else {
			//가입 실패시
			response.sendRedirect("Join.jsp");
		}
    }
}
