package com.konan.controller.postreact;

import java.io.IOException;
import java.math.BigDecimal;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.konan.model.PostComment;
import com.konan.model.PostCommentDAO;

/**
 * Servlet implementation class CommentInsertController
 */
public class CommentInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(request.getParameter("post_id"));
		
		BigDecimal postId = new BigDecimal(request.getParameter("post_id"));
		String userId = request.getParameter("user_id");
		String commentContent = request.getParameter("comment_content");

		System.out.println(userId+">> "+postId+"에 댓글 데이터 삽입 요청");
		
		PostComment postComment = new PostComment(postId,userId,commentContent);
		PostCommentDAO dao = new PostCommentDAO();
		int rownum = dao.insertComment(postComment);
		if(rownum>0) {
			System.out.println(userId+">> "+postId+"에 댓글 데이터 삽입 성공");
		}else {
			System.out.println(userId+">> "+postId+"에 댓글 데이터 삽입 실패");
		}
		response.sendRedirect("CommuContent.jsp?idx="+request.getParameter("post_id"));
	}

}
