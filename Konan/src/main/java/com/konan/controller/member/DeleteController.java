package com.konan.controller.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.konan.model.UserInfo;
import com.konan.model.UserInfoDAO;

/**
 * Servlet implementation class DeleteController
 */
public class DeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    request.setCharacterEncoding("UTF-8");

	    // 세션에서 사용자 정보 가져오기
	    HttpSession session = request.getSession();
	    UserInfo userInfo = (UserInfo) session.getAttribute("userInfo");
	    String user_id = userInfo.getUser_id();
	    String user_pw = request.getParameter("user_pw");
	    
		UserInfoDAO dao = new UserInfoDAO();

		response.setContentType("text/html;charset=UTF-8");
		
		UserInfo deleteUserInfo = new UserInfo();
		deleteUserInfo.setUser_id(user_id);
		deleteUserInfo.setUser_pw(user_pw);
		
		Integer deleterow = dao.delete(deleteUserInfo);	
		System.out.println(deleterow);
		
		
		
		try {
		    if (deleterow != null) {
		        System.out.println(user_id);
		        session.invalidate();
		    } else {
		        System.out.println("삭제 실패");
		    }
		    response.sendRedirect("Main.jsp");
		} catch (Exception e) {
		    e.printStackTrace();
		    System.out.println("삭제 실패");
		    response.sendRedirect("Main.jsp");
		}
	}

}
