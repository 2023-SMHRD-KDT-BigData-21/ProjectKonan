package com.konan.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.konan.model.Board;
import com.konan.model.BoardDAO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class BoardInsertController
 */
public class BoardInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		//DefaultFileRenamePolicy -> 같은 이름의 파일이 들어올떄 임의로 이름 바꿔줌
		
		int sizeLimit = 2*1024*1024;//2메가 넘으면 예외 발생
		String savePath = request.getServletContext().getRealPath("/upload"); 
		MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit, "UTF-8", new DefaultFileRenamePolicy());
		
		String title = multi.getParameter("title");
		String content = multi.getParameter("content");
		String writer = multi.getParameter("writer");
		String img = multi.getOriginalFileName("img");//img 파일 받을떄
		
		System.out.println(title);
		System.out.println(content);
		System.out.println(writer);
		System.out.println(img);
		
		Board board = new Board(title, content, writer, img);
		BoardDAO dao = new BoardDAO();
		int rownum = dao.insert(board);
		System.out.println(rownum);
		
		
	}

}
