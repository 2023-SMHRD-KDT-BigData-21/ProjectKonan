package com.konan.controller.postwrite;

import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.konan.model.Post;
import com.konan.model.PostDAO;
import com.konan.model.PostImage;
import com.konan.model.PostImageDAO;
import com.konan.model.UserInfo;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class PostInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession(); 
		
		UserInfo user = (UserInfo)session.getAttribute("userInfo");
		
		
		//사진 저장 처리
		String savePath = request.getServletContext().getRealPath("/upload");
		int sizeLimit = 5*1024*1024; //5메가 제한 넘어서면 예외발생
		MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit, "UTF-8", new DefaultFileRenamePolicy());

		//매개변수 가져오기
		String postType = multi.getParameter("postType");
		String userId = user.getUser_id();
		String title = multi.getParameter("title");
		String postContent = multi.getParameter("content");
				
		//포스팅 객체 생성
		Post post = null;
		if(postType.equals("Q")) { //질문 포스팅 시
			String isAnonymous = multi.getParameter("isAnonymous");
			post = new Post(postType,userId,title,postContent,isAnonymous);
			
		}else if(postType.equals("A")) { //답변 포스팅 시
			BigDecimal questionId = BigDecimal.valueOf(Double.valueOf(request.getParameter("questionId")));
			post = new Post(postType,questionId,userId,title,postContent,BigDecimal.valueOf(0));
		}
		else { //커뮤니티 포스팅일 경우
			post = new Post(postType,userId,title,postContent);
		}
		
		//포스팅 작성
		PostDAO dao = new PostDAO();
		int row = dao.insert(post);

		if(row>0)
			System.out.println("포스팅 작성 성공!");
		else
			System.out.println("포스팅 작성 실패...");

		
		//작성한 게시글의 post_id 구하기(이미지 작성 및 작성된 글 보여주는 페이지로 넘겨주기 위함)
		BigDecimal postId = dao.recentPost(userId);
		
		
		//이미지 처리
		PostImageDAO daoImg = new PostImageDAO();
        Enumeration<String> files = multi.getFileNames();
        
        while (files.hasMoreElements()) {
        	String temp = files.nextElement();
        	System.out.println("nextElement:" + temp);
        	String fileName = multi.getFilesystemName(temp);
        	System.out.println(fileName);
        	if(fileName!=null) {
            	//포스팅에 연결하여 이미지 작성
            	PostImage img = new PostImage(postId, fileName);
            	int rowImg = daoImg.insert(img);
            	if(rowImg>0)
            		System.out.println("사진 작성 성공!");
            	else
            		System.out.println("사진 작성 실패...");
        	}
        }

		
		// 작성된 글 보여주는 페이지로 넘겨주기
		if(postType.equals("C"))
			response.sendRedirect("CommuContent.jsp?idx="+postId);
		else
			response.sendRedirect("QnaContent.jsp?idx="+postId);
	}
}
