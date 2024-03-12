package com.konan.controller.postview;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.konan.model.Post;
import com.konan.model.PostDAO;

public class PagingController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String postType = request.getParameter("postType");
		int idx = Integer.parseInt(request.getParameter("idx"));
		
		PostDAO dao = new PostDAO();
		
		List<Post> list = dao.moreList(postType,idx);
		
        // JSON 형식으로 변환
        ObjectMapper mapper = new ObjectMapper();
        String jsonString = mapper.writeValueAsString(list);

        // JSON 응답 반환
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsonString);
	}
}
