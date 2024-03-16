package com.konan.model;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.konan.database.SqlSessionManager;

public class ArticleDAO {
	SqlSessionFactory sessionFactory = SqlSessionManager.getSqlSessionFactory();
	String articleMapper = "com.konan.database.ArticleMapper.";
	
	// 기사 개수 세기 (최신순 정렬)
	public int maxRow() {
		SqlSession sqlSession = sessionFactory.openSession(true);
		int max = sqlSession.selectOne(articleMapper+"selectMaxRow");
		sqlSession.close();
		return max;
	}
	
	// 첫 페이지 기사 목록 조회
	public List<Article> firstList() {
		SqlSession sqlSession = sessionFactory.openSession(true);
		List<Article> list = sqlSession.selectList(articleMapper+"selectFirst");
		sqlSession.close();
		return list;
	}
	
	// 더보기 버튼으로 보여줄 포스팅 목록 조회
	public List<Article> moreList(int idx){ 
		SqlSession sqlSession = sessionFactory.openSession(true);		 
		Map<String, Object> map = new HashMap<>(); 
		int cnt = 5;
		map.put("idx", idx); 
		map.put("cnt", cnt); 
		List<Article> list = sqlSession.selectList(articleMapper+"selectMore", map); 
		return list; 
	}
	
	// 첫 페이지 키워드 목록 조회
	public List<String> firstKeyList(BigDecimal article_id) {
		SqlSession sqlSession = sessionFactory.openSession(true);
		List<String> list = sqlSession.selectList(articleMapper+"selectFirstKey", article_id);
		sqlSession.close();
		return list;
	}
	
	
}
