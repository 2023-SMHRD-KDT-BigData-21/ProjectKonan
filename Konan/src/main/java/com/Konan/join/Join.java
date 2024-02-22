package com.Konan.join;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Join
 */
@WebServlet("/Join")
public class Join extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
        response.setContentType("text/html;charset=UTF-8");
        
        PrintWriter out = response.getWriter();
        String title = "회원가입 결과";
        String docType = "<!doctype html public \"-//w3c//dtd html 4.0 " +
                "transitional//ko\">\n";

        // 폼에서 전송된 데이터 받기
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        out.println(docType +
                "<html>\n" +
                "<head><title>" + title + "</title></head>\n" +
                "<body bgcolor=\"#f0f0f0\">\n" +
                "<h1 align=\"center\">" + title + "</h1>\n" +
                "<ul>\n" +
                "  <li><b>이름:</b> " + name + "</li>\n" +
                "  <li><b>이메일:</b> " + email + "</li>\n" +
                "  <li><b>비밀번호:</b> " + password + "</li>\n" +
                "</ul>\n" +
                "</body></html>");
	}
}
