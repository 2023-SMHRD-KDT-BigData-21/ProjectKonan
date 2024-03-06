package com.konan.controller.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.konan.model.Member;
import com.konan.model.MemberDAO;

/**
 * Servlet implementation class DeleteController
 */
public class DeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberDAO dao = new MemberDAO();

		response.setContentType("text/html;charset=UTF-8");
		
		String id = request.getParameter("id");
		
		Integer user = dao.delete(id);	
		System.out.println(user);
		
		try {
			if(user != null) {
				System.out.println(id);
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
