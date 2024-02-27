package com.Konan.join;

import java.io.IOException;
import java.io.PrintWriter;

//join_date값 생성을 위한 date time 변환 라이브러리
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

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
        request.setCharacterEncoding("UTF-8");
        
        PrintWriter out = response.getWriter();
        String title = "회원가입 결과";
        String docType = "<!doctype html public \"-//w3c//dtd html 4.0 " +
                "transitional//ko\">\n";


        SimpleDateFormat dateParser = new SimpleDateFormat("MM/dd/yy HH:mm:ss");
        {
          try {
        	  // 폼에서 전송된 데이터 받기          
              String id = request.getParameter("id");
              String name = request.getParameter("name");
              String email = request.getParameter("email");
              String password = request.getParameter("password");
              
              String now = dateParser.format(new Date());
              Date dateTime = dateParser.parse(now);
              
              out.println(docType +
                      "<html>\n" +
                      "<head><title>" + title + "</title></head>\n" +
                      "<body bgcolor=\"#f0f0f0\">\n" +
                      "<h1 align=\"center\">" + title + "</h1>\n" +
                      "<ul>\n" +
                      "  <li><b>아이디:</b> " + id + "</li>\n" +
                      "  <li><b>이름:</b> " + name + "</li>\n" +
                      "  <li><b>이메일:</b> " + email + "</li>\n" +
                      "  <li><b>비밀번호:</b> " + password + "</li>\n" +
                      "  <li><b>가입일자:</b> " + dateTime + "</li>\n" +
                      "</ul>\n" +
                      "</body></html>");
              
              

          }catch (ParseException e) {
        	  e.printStackTrace();
          }
       }
	}
}
