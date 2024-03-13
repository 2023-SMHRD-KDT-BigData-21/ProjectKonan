package com.konan.model;

import java.math.BigDecimal;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.konan.database.SqlSessionManager;

public class PostCommentDAO {
	SqlSessionFactory sessionFactory = SqlSessionManager.getSqlSessionFactory();
	String postCommentMapper = "com.konan.database.PostCommentMapper.";
	
	// 포스트별 댓글 개수 세기
	public Integer countComments(BigDecimal post_id) {
		SqlSession sqlSession = sessionFactory.openSession(true);
		Integer count = (Integer)sqlSession.selectOne(postCommentMapper+"countCommentsByPostId", post_id);
		sqlSession.close();
		
		if(count==null) {
			count = 0;
		}
		return count;
		
	}//countComments
}
