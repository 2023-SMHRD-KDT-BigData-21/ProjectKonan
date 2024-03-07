package com.konan.controller.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.konan.model.Member;
import com.konan.model.MemberDAO;


public class JoinController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		
		MemberDAO dao = new MemberDAO();

		request.setCharacterEncoding("UTF-8");
		
		String user_id = request.getParameter("id");
		String user_pw = request.getParameter("pw");
		String email = request.getParameter("email");
		String name = request.getParameter("name");
		String phone_number = request.getParameter("phone_number");
		String region = request.getParameter("region");
		String gender = request.getParameter("gender");
		String propic = request.getParameter("propic");
		
		
		Member member = new Member(user_id,user_pw,email,name,phone_number,region,gender,propic);
		int rownum = dao.join(member);
		System.out.println(rownum);
		
		if(rownum > 0) {
			HttpSession session = request.getSession();
			session.setAttribute("Member", member);
			response.sendRedirect("joinSuccess.jsp");
		}else {
			response.sendRedirect("Join.jsp");
		}
    }

}
