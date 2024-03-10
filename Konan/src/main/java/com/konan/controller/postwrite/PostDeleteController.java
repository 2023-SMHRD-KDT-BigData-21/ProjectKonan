package com.konan.controller.postwrite;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.MemberDAO;

public class PostDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String postId = request.getParameter("postId");
		String postType = request.getParameter("postType");
		
		PostDAO dao = new PostDAO();
		int row = dao.delete(postId,postType);

		if(postType.equals("C"))
			response.sendRedirect("CommuList.jsp");
		else
			response.sendRedirect("QnaList.jsp");
	}
}
