package com.konan.controller.postreact;

import java.io.IOException;
import java.math.BigDecimal;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.konan.model.UserReaction;
import com.konan.model.UserReactionDAO;

/**
 * Servlet implementation class LikeController
 */
public class LikeController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("좋아요 컨트롤러!");
		
		request.setCharacterEncoding("UTF-8");
		
		/*"postId" : postId,
		 * "userId" : userId,
		 * "type" : "L"*/
		System.out.println("postId:"+request.getParameter("postId"));
		System.out.println("userId:"+request.getParameter("userId"));
		System.out.println("type:"+request.getParameter("type"));

		BigDecimal postId = new BigDecimal(request.getParameter("postId"));
		String userId = request.getParameter("userId");
		String type = request.getParameter("type");
		String modify = request.getParameter("modify");
		
		UserReaction userReaction = new UserReaction(postId,userId, type);
		UserReactionDAO dao = new UserReactionDAO();
		
		int rownum = dao.findReaction(userReaction);
		//db에 동일한 값이 없으면
		if(modify.equals("T")){
			if(rownum==0) {
				rownum = dao.insertReaction(userReaction);
				if(rownum>0) {
					System.out.println("좋아요 db 반영 성공!");
				}else {
					System.out.println("좋아요 db 반영 실패");
				}
			}else {
				
				rownum = dao.deleteReaction(userReaction);	
				if (rownum > 0) {
					rownum = -1;
				}
			}
		}else{
			if(rownum>0) {
				rownum = 2;//이미 있으면 rownum = 2							
			}
		}
		// 클라이언트에게 응답을 보냄 (여기서는 rownum 그대로 보냄)
        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(String.valueOf(rownum));
	}

}
