package com.konan.model;

import java.math.BigDecimal;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.konan.database.SqlSessionManager;

public class KeywordDAO {
	SqlSessionFactory sessionFactory = SqlSessionManager.getSqlSessionFactory();
	String keywordMapper = "com.konan.database.KeywordMapper.";
	
	public List<Keyword> firstList(BigDecimal article_id) {
		SqlSession sqlSession = sessionFactory.openSession(true);
		List<Keyword> list = sqlSession.selectList(keywordMapper+"selectKeyword", article_id);
		sqlSession.close();
		return list;
	}
}
