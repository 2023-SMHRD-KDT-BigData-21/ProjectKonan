package com.konan.controller.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.konan.model.Member;
import com.konan.model.MemberDAO;

/**
 * Servlet implementation class JoinController
 */
public class JoinController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		
		MemberDAO dao = new MemberDAO();

		request.setCharacterEncoding("UTF-8");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String tel = request.getParameter("tel");
		String address = request.getParameter("address");
		
		Member member = new Member(id,pw,tel,address);
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
