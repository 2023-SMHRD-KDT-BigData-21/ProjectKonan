package com.konan.model;

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
	
	public List<Article> firstList() {
		SqlSession sqlSession = sessionFactory.openSession(true);
		List<Article> list = sqlSession.selectList(articleMapper+"selectFirst");
		sqlSession.close();
		return list;
	}
	public List<Article> moreList(int idx){ 
		SqlSession sqlSession = sessionFactory.openSession(true);		 
		Map<String, Object> map = new HashMap<>(); 
		int cnt = 5;
		map.put("idx", idx); 
		map.put("cnt", cnt); 
		List<Article> list = sqlSession.selectList(articleMapper+"selectMore", map); 
		return list; 
	}
}
