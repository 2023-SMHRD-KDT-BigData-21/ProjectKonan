package com.konan.model;

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
}
