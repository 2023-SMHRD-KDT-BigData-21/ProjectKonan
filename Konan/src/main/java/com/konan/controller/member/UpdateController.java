package com.konan.controller.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.konan.model.UserInfo;
import com.konan.model.UserInfoDAO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class UpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		//ID 가져오기
		//1.세션 활용
		HttpSession session = request.getSession();
		UserInfo userInfo = (UserInfo)session.getAttribute("userInfo");
		String user_id = userInfo.getUser_id();
		
		//savepath 설정 및 multi 가져오기
		String savePath = request.getServletContext().getRealPath("/upload");
		int sizeLimit = 5*1024*1024; //5메가 제한 넘어서면 예외발생
		MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit, "UTF-8", new DefaultFileRenamePolicy());
		
		
		//2.input 태그 활용
		//	1) update.jsp에서 <input type="hidden"> 추가
		String user_pw = multi.getParameter("user_pw");
		String email = multi.getParameter("email");
		String name = multi.getParameter("name");
		String phone_number = multi.getParameter("phone_number");
		String region = multi.getParameter("region");
		String gender = multi.getParameter("gender");
		String propic = multi.getOriginalFileName("propic");
		System.out.println(userInfo.getName() + email + name + phone_number);
		
		UserInfoDAO dao = new UserInfoDAO();
		if(propic!=null) {
			userInfo.setPropic(propic);			
		}
		int res = dao.update(userInfo);
		
		if(res>0) {
			userInfo = dao.getUser(user_id);
			session.setAttribute("userInfo", userInfo);
			response.sendRedirect("Profile.jsp");
		}else
			response.sendRedirect("Profile.jsp");
	}
}
