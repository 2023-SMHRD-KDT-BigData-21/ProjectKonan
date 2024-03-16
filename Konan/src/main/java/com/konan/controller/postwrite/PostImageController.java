package com.konan.controller.postwrite;

import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.konan.converter.ImageToBase64;
import com.konan.model.PostImage;
import com.konan.model.PostImageDAO;

public class PostImageController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		BigDecimal postId = BigDecimal.valueOf(Double.valueOf(request.getParameter("postId")));
		
		PostImageDAO dao = new PostImageDAO();
		List<String> list = dao.select(postId);
		
		String chanu = "C:\\workplace\\git\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\konan\\upload\\";
		String jiho = "C:\\Users\\USER\\Desktop\\WebServer\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\konan\\upload\\";
		String jiholg = "C:\\Users\\jiho_\\OneDrive\\Desktop\\Java Server\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\konan\\upload\\";
		try {
			if(list.size()>0) {
				for(int i=0; i<list.size(); i++) {
					File file = new File(jiholg + list.get(i));
					ImageToBase64 converter = new ImageToBase64();
					String fileStringValue = converter.convert(file);
					list.set(i, fileStringValue);
				}
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		
		ObjectMapper mapper = new ObjectMapper(); //JSON 형식으로 변환하기 위해
		String jsonString = mapper.writeValueAsString(list);
		
        // JSON 응답 반환
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsonString);
	}
}