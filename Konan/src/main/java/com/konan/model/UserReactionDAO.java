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
	
	//반응 넣기
	public int insertReaction(UserReaction userReaction) {
		SqlSession sqlSession = sessionFactory.openSession(true);
		int count = (int)sqlSession.insert(userReactionMapper+"insertReaction", userReaction);
		
		if(count>0) {
			System.out.println("성공");;
		}else {
			System.out.println("실패");
		}
		
		sqlSession.close();
		return count;
	}
	
	public int deleteReaction(UserReaction userReaction) {
		SqlSession sqlSession = sessionFactory.openSession(true);
		int count = (int)sqlSession.delete(userReactionMapper+"deleteReaction", userReaction);
		
		if(count>0) {
			System.out.println("성공");;
		}else {
			System.out.println("실패");
		}
		
		sqlSession.close();
		return count;
	}
	
	//사용자, 포스트, 반응 종류가 일치하는 row가 db에 존재하는 지 확인
	public int findReaction(UserReaction userReaction) {
		SqlSession sqlSession = sessionFactory.openSession(true);
		int count = (int)sqlSession.selectOne(userReactionMapper+"findReaction", userReaction);
		
		if(count>0) {
			System.out.println("성공");;
		}else {
			System.out.println("실패");
		}
		
		sqlSession.close();
		return count;
	}
}
