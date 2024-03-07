package com.konan.controller.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.konan.model.Member;
import com.konan.model.MemberDAO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


public class JoinController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		
		MemberDAO dao = new MemberDAO();

		request.setCharacterEncoding("UTF-8");
		
		String savePath=request.getServletContext().getRealPath("/upload");
		int sizeLimit = 5*1024*1024; //5메가 제한 넘어서면 예외발생
		System.out.println(savePath);
		MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit, "UTF-8", new DefaultFileRenamePolicy());
		
		String user_id = multi.getParameter("user_id");
		String user_pw = multi.getParameter("user_pw");
		String email = multi.getParameter("email");
		String name = multi.getParameter("name");
		String phone_number = multi.getParameter("phone_number");
		String region = multi.getParameter("region");
		String gender = multi.getParameter("gender");
		String propic = multi.getOriginalFileName("propic");

		
		
		
		
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
