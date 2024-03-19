package com.konan.controller.postreact;

import java.io.IOException;
import java.math.BigDecimal;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.konan.model.PostCommentDAO;
import com.konan.model.PostDAO;

public class CommentDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BigDecimal postId = BigDecimal.valueOf(Double.valueOf(request.getParameter("postId"))); 
		BigDecimal commentId = BigDecimal.valueOf(Double.valueOf(request.getParameter("commentId"))); //삭제 페이지에서 삭제 버튼에 연결 필요
		
		PostCommentDAO dao = new PostCommentDAO();
		int row = dao.delete(commentId);

		if(row>0)
			System.out.println("댓글 삭제 성공!");
		else
			System.out.println("댓글 삭제 실패...");
	}
}
