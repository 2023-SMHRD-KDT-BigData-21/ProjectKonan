package com.konan.controller.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.konan.model.UserInfoDAO;

/**
 * Servlet implementation class IdCheckController
 */
public class IdCheckController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		System.out.println(userId);
		
		UserInfoDAO dao = new UserInfoDAO();
		boolean isExist = dao.idCheck(userId); //error
		
		PrintWriter out = response.getWriter();
		if (isExist) {
			out.print("true");
		} else {
			out.print("false");
		}
	}
}
