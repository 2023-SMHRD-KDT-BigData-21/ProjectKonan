package com.konan.model;

import java.math.BigDecimal;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.konan.database.SqlSessionManager;

public class KeywordDAO {
	SqlSessionFactory sessionFactory = SqlSessionManager.getSqlSessionFactory();
	String keywordMapper = "com.konan.database.KeywordMapper.";
	
	public List<String> firstList(BigDecimal article_id) {
		SqlSession sqlSession = sessionFactory.openSession(true);
		List<String> list = sqlSession.selectList(keywordMapper+"selectFirst", article_id);
		sqlSession.close();
		return list;
	}
}
