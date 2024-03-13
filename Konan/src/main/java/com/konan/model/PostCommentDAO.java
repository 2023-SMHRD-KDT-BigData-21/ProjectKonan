package com.konan.model;

import java.math.BigDecimal;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.konan.database.SqlSessionManager;

public class PostCommentDAO {
	SqlSessionFactory sessionFactory = SqlSessionManager.getSqlSessionFactory();
	String postCommentMapper = "com.konan.database.PostCommentMapper.";
	
	// 포스트별 댓글 개수 세기
	public int countComments(BigDecimal post_id) {
		SqlSession sqlSession = sessionFactory.openSession(true);
		int max = sqlSession.selectOne(postCommentMapper+"countCommentsByPostId", post_id);
		sqlSession.close();
		return max;
	}
}
