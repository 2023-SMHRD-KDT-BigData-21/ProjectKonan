package com.konan.controller.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.konan.model.MemberDAO;

/**
 * Servlet implementation class IdCheckController
 */
public class IdCheckController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String user_id = request.getParameter("user_id");
		System.out.println(user_id);
		
		MemberDAO dao = new MemberDAO();
		boolean isExist = dao.idCheck(user_id);
		
		PrintWriter out = response.getWriter();
		if (isExist) {
			out.print("true");
		} else {
			out.print("false");
		}
	}
}
