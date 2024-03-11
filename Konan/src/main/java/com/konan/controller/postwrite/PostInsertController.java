package com.konan.controller.postwrite;

import java.io.IOException;
import java.math.BigDecimal;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.konan.model.Post;
import com.konan.model.PostDAO;
import com.konan.model.UserInfo;

public class PostInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession(); 
		
		UserInfo user = (UserInfo)session.getAttribute("loginInfo");
		
		String postType = request.getParameter("postType");
		String userId = user.getUser_id();
		String title = request.getParameter("title");
		String postContent = request.getParameter("postContent");
		
		Post post = null;
		
		if(postType.equals("Q")) { //질문 포스팅 시
			String isAnonymous = request.getParameter("isAnonymous");
			post = new Post(postType,userId,title,postContent,isAnonymous);
		}else if(postType.equals("A")) { //답변 포스팅 시
			BigDecimal questionId = BigDecimal.valueOf(Double.valueOf(request.getParameter("questionId")));
			post = new Post(postType,questionId,userId,title,postContent,0);
		}
		else { //커뮤니티 포스팅일 경우
			post = new Post(postType,userId,title,postContent);
		}
		
		PostDAO dao = new PostDAO();
		int row = dao.insert(post);

		if(row>0)
			System.out.println("작성 성공!");
		else
			System.out.println("작성 실패...");

		
		// 작성된 글 보여주는 페이지로 넘겨주기
		BigDecimal postId = dao.recentPost(userId);
		
		if(postType.equals("C"))
			response.sendRedirect("CommuContent.jsp?idx="+postId);
		else
			response.sendRedirect("QnaContent.jsp?idx="+postId);
	}
}
