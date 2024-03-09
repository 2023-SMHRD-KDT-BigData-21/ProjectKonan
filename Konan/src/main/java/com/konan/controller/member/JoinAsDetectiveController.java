package com.konan.controller.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.konan.model.DetectiveInfo;
import com.konan.model.DetectiveInfoDAO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class JoinAsDetectiveController
 */
public class JoinAsDetectiveController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
request.setCharacterEncoding("UTF-8");
		
		//파일 업로드를 위한 multipartrequest
		//1.xml에 cos 라이브러리 추가
		//2.MultiPartRequest(request, 저장경로, 파일사이즈제한, 파일이름인코딩방식, DefaultFileRenamePolicy) 객체 생성
		//	- DefaultFileRenamePolicy: 똑같은 이름을 가진 파일이 존재한다면 파일명(default)에 1, 2, 3 으로 붙게 해주는 클래스
		//3.워크스페이스 C:\Users\USER\Desktop\WebServer\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps
		//	에 upload 폴더 추가
		
		String savePath = request.getServletContext().getRealPath("/upload");
		int sizeLimit = 5*1024*1024; //5메가 제한 넘어서면 예외발생
		
		MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit, "UTF-8", new DefaultFileRenamePolicy());
		
		String user_id = multi.getParameter("user_id");
		String proof_shot = multi.getOriginalFileName("proof_shot");
		
		DetectiveInfo user = new DetectiveInfo(user_id, proof_shot);
		
		DetectiveInfoDAO dao = new DetectiveInfoDAO();
		int rownum = dao.joinReq(user);
		System.out.println(rownum);
		
		if(rownum>0) {
			response.sendRedirect("JoinSuccess.jsp");
		}else {
			response.sendRedirect("Main.jsp");
		}
	
	}

}
