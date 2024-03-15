package com.konan.controller.admin;

import java.io.IOException;
import java.math.BigDecimal;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.konan.model.PostDAO;

public class ReportDController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String postIdStr = request.getParameter("id");
        BigDecimal postId = new BigDecimal(postIdStr);
        
        PostDAO dao = new PostDAO();
        int row = dao.delete(postId);
        
        if(row>0) {
			System.out.println("포스팅 삭제 성공!");
			
				response.sendRedirect("AdminReport.jsp");
		}else {
			System.out.println("포스팅 삭제 실패...");
			
		}
        
        // 삭제된 행의 수(row)를 사용하려면 여기서 처리할 수 있습니다.
    }
}
