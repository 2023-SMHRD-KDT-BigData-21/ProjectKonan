package com.konan.model;

import java.io.File;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.konan.converter.ImageToBase64;
import com.konan.database.SqlSessionManager;

public class BoardDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSessionFactory();
	String boardMapper = "com.konan.database.BoardMapper.";
	
	public List<Board> boardList() {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		List<Board> resultList = sqlSession.selectList(boardMapper+"selectAll");
		sqlSession.close();
		
		return resultList;
	}
	
	public int insert(Board board) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int rownum = sqlSession.insert(boardMapper+"insert", board);
		sqlSession.close();
		
		return rownum;
	}
	
	public Board getBoard(int idx) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		Board board = sqlSession.selectOne(boardMapper+"selectOne", idx);
		sqlSession.close();
		
		//img를 보내기위한 코드, img: 파일의 제목, 확장자에 대한 정보만 있음
		//가지고 온 파일을 텍스트로 변환하여 브라우저로 보내야함 (converter 만들고 > base64로 텍스트로 변환)
		
		//1. bring File
		String fPath = "C:\\workplace\\java\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\konan\\upload\\";
		File file = new File(fPath+board.getImg());
		System.out.println(fPath+board.getImg());
		
		ImageToBase64 converter = new ImageToBase64();
		String fileToString = converter.convert(file);
		System.out.println(fileToString);
		
		Board result = new Board(board.getIdx(),board.getTitle(),board.getContent(),board.getWriter(),fileToString, board.getIndate());
		
		return result;
	}
}
