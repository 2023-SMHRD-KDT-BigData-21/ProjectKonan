package com.konan.model;

import java.math.BigDecimal;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.konan.database.SqlSessionManager;

public class PostImageDAO {
	
	SqlSessionFactory sessionFactory = SqlSessionManager.getSqlSessionFactory();
	String imageMapper = "com.konan.database.PostImageMapper.";
	
	public int insert(PostImage img) {
		SqlSession sqlSession = sessionFactory.openSession(true);
		int rownum = sqlSession.insert(imageMapper+"insert", img);
		sqlSession.close();
		return rownum;
	}
	
	public List<String> select(BigDecimal post_id){
		SqlSession sqlSession = sessionFactory.openSession(true);
		List<String> resultList = sqlSession.selectList(imageMapper + "select", post_id);
		sqlSession.close();
		return resultList;
	}
}
