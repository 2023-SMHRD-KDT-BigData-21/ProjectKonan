package com.konan.controller.postview;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.konan.model.Paging;
import com.konan.model.Post;
import com.konan.model.PostCommentDAO;
import com.konan.model.PostDAO;
import com.konan.model.UserReactionDAO;

import lombok.AllArgsConstructor;

public class PagingController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String postType = request.getParameter("postType");
		int idx = Integer.parseInt(request.getParameter("idx"));
		
		PostDAO dao = new PostDAO();
		UserReactionDAO reactionDao = new UserReactionDAO();//좋아요 개수 세려고
		PostCommentDAO commentDao = new PostCommentDAO();//댓글 개수 세려고
		List<Post> list = dao.moreList(postType,idx);
		List<Paging> resultList = new ArrayList<>();
		
		for(Post post : list) {
			Paging page = new Paging();
			page.setPost_id(post.getPost_id());
			page.setUser_id(post.getUser_id());
			page.setTitle(post.getTitle());
			page.setPost_content(post.getPost_content());
			page.setIs_adopted(post.getIs_adopted());
			page.setIs_anonymous(post.getIs_anonymous());
			page.setLike_cnt(reactionDao.countLike(post.getPost_id()));
			page.setComment_cnt(commentDao.countComments(post.getPost_id()));
			page.setAnswer_cnt(dao.ansCount(post.getPost_id()));
			
			System.out.println(commentDao.countComments(post.getPost_id()));
			
			resultList.add(page);
		}
		
		
        // JSON 형식으로 변환
        ObjectMapper mapper = new ObjectMapper();
        String jsonString = mapper.writeValueAsString(resultList);

        // JSON 응답 반환
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsonString);
	}
}
