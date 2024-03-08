package com.konan.model;

import java.math.BigDecimal;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.konan.database.SqlSessionManager;

public class PostDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSessionFactory();
	String postMapper = "com.konan.database.PostMapper.";
	
	// 커뮤니티 포스팅 목록 조회
	public List<Post> postList() {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		List<Post> resultList = sqlSession.selectList(postMapper+"selectPost");
		sqlSession.close();
		return resultList;
	}
	
	// 질문 포스팅 목록 조회
	public List<Post> QpostList() {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		List<Post> resultList = sqlSession.selectList(postMapper+"selectQpost");
		sqlSession.close();
		return resultList;
	}
	
	// 커뮤니티 포스팅 개수 세기
	public int postCount() {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int countPost = sqlSession.selectOne(postMapper+"postCount");
		sqlSession.close();
		return countPost;
	}
	
	// 질문 포스팅 개수 세기
	public int qpostCount() {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int countQpost = sqlSession.selectOne(postMapper+"qpostcount");
		sqlSession.close();
		return countQpost;
	}
	
	// 답변 포스팅 개수 세기
	public int ansCount(BigDecimal question_id) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int countAns = sqlSession.selectOne(postMapper+"anscount");
		sqlSession.close();
		return countAns;
	}
	
	
	
	public int insert(Post post) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int rownum = sqlSession.insert(postMapper+"insert", post);
		sqlSession.close();
		
		return rownum;
	}
}
