package com.konan.controller.postwrite;

import java.io.IOException;
import java.math.BigDecimal;
import java.text.DecimalFormat;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.konan.model.PostDAO;

public class PostDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BigDecimal postId = BigDecimal.valueOf(Double.valueOf(request.getParameter("postId"))); //삭제 페이지에서 삭제 버튼에 연결 필요
		String postType = request.getParameter("postType");
		
		PostDAO dao = new PostDAO();
		int row = dao.delete(postId);

		if(row>0) {
			System.out.println("포스팅 삭제 성공!");
			if(postType.equals("C"))
				response.sendRedirect("CommuList.jsp");
			else
				response.sendRedirect("QnaList.jsp");
		}else {
			System.out.println("포스팅 삭제 실패...");
			if(postType.equals("C"))
				response.sendRedirect("CommuContent.jsp?idx="+postId);
			else
				response.sendRedirect("QnaContent.jsp?idx="+postId);
		}

	}
}
