package com.konan.model;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.konan.database.SqlSessionManager;

public class PostDAO {
	
	SqlSessionFactory sessionFactory = SqlSessionManager.getSqlSessionFactory();
	String postMapper = "com.konan.database.PostMapper.";
	
	
	//공통 조회 기능
	// 특정 포스팅 조회
	public Post postContent(BigDecimal post_id) {
		SqlSession sqlSession = sessionFactory.openSession(true);
		Post post = sqlSession.selectOne(postMapper+"select", post_id);
		sqlSession.close();
		return post;
	}
	
	// 작성자의 최근 작성 포스팅 조회(작성,수정 후 보여줄 상세페이지)
	public BigDecimal recentPost(String user_id) {
		SqlSession sqlSession = sessionFactory.openSession(true);
		BigDecimal post_id = sqlSession.selectOne(postMapper+"selectRecent", user_id);
		sqlSession.close();
		return post_id;
	}
	
	// 타입별 포스팅 개수 세기 (최신순 정렬)
	public int maxRow(String post_type) {
		SqlSession sqlSession = sessionFactory.openSession(true);
		int max = sqlSession.selectOne(postMapper+"selectMaxRow", post_type);
		sqlSession.close();
		return max;
	}
	
	// 첫 페이지 타입별 포스팅 목록 조회
	public List<Post> firstList(String post_type) {
		SqlSession sqlSession = sessionFactory.openSession(true);
		List<Post> list = sqlSession.selectList(postMapper+"selectFirst", post_type);
		sqlSession.close();
		return list;
	}
	
	// 더보기 버튼으로 보여줄 포스팅 목록 조회
	public List<Post> moreList(String post_type, int idx){ 
		SqlSession sqlSession = sessionFactory.openSession(true);		 
		Map<String, Object> map = new HashMap<>(); 
		int cnt = 5;

		System.out.println("게시글 타입: "+post_type);
		System.out.println("시작 인덱스: "+idx);
		System.out.println("가져올 행 개수: "+cnt);
		
		map.put("post_type", post_type);
		map.put("idx", idx); 
		map.put("cnt", cnt); 
		List<Post> list = sqlSession.selectList(postMapper+"selectMore", map); 
		return list; 
	}
	
	
	
	//Main
	// 답변 포스팅 개수 조회
	public int ansCount(BigDecimal post_id) {
		SqlSession sqlSession = sessionFactory.openSession(true);
		int cnt = sqlSession.selectOne(postMapper+"ansCount", post_id);
		sqlSession.close();
		return cnt;
	}
	
	

	//PostWrite
	// 포스팅 작성
	public int insert(Post post) {
		SqlSession sqlSession = sessionFactory.openSession(true);
		int rownum = sqlSession.insert(postMapper+"insert", post);
		sqlSession.close();
		return rownum;
	}
	
	// 포스팅 수정
	public int update(Post post) {
		SqlSession sqlSession = sessionFactory.openSession(true);
		int rownum = sqlSession.update(postMapper+"update", post);
		sqlSession.close();
		return rownum;
	}
	
	// 포스팅 삭제
	public int delete(BigDecimal post_id) {
		SqlSession sqlSession = sessionFactory.openSession(true);
		int rownum = sqlSession.delete(postMapper+"delete", post_id);
		sqlSession.close();
		return rownum;
	}
}
