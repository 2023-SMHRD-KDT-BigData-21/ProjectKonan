package com.konan.model;

import java.math.BigDecimal;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.konan.database.SqlSessionManager;

public class UserReactionDAO {
	SqlSessionFactory sessionFactory = SqlSessionManager.getSqlSessionFactory();
	String userReactionMapper = "com.konan.database.UserReactionMapper.";
	
	// 포스트별 좋아요 개수 세기
	public Integer countLike(BigDecimal post_id) {
		SqlSession sqlSession = sessionFactory.openSession(true);
		Integer count = (Integer)sqlSession.selectOne(userReactionMapper+"countLikeByPostId", post_id);
		sqlSession.close();
		
		System.out.println("해당 포스트의 좋아요 개수:"+count);

		if(count==null) {
			count = 0;
		}
		return count;
	}//countLike
}
