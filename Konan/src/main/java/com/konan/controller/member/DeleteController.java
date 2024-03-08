package com.konan.controller.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.konan.model.UserInfo;
import com.konan.model.UserInfoDAO;

/**
 * Servlet implementation class DeleteController
 */
public class DeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserInfoDAO dao = new UserInfoDAO();

		response.setContentType("text/html;charset=UTF-8");
		
		String userId = request.getParameter("userId");
		
		Integer user = dao.delete(userId);	
		System.out.println(user);
		
		try {
			if(user != null) {
				System.out.println(userId);
			}else {
				System.out.println("삭제 실패");
			}
			response.sendRedirect("Main.jsp");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("삭제 실패");
			response.sendRedirect("Main.jsp");
		}
	}

}
