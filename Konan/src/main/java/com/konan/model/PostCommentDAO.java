package com.konan.model;

import java.math.BigDecimal;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.konan.database.SqlSessionManager;

public class PostCommentDAO {
	SqlSessionFactory sessionFactory = SqlSessionManager.getSqlSessionFactory();
	String postCommentMapper = "com.konan.database.PostCommentMapper.";
	
	//댓글 삽입
	public int insertComment(PostComment postComment) {
		SqlSession sqlSession = sessionFactory.openSession(true);
		int rownum = sqlSession.insert(postCommentMapper+"insertComment", postComment);
		sqlSession.close();
		
		return rownum;
	}
	
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
	
	//포스트별 댓글 불러오기
	public List<CommentHierarchyView> getComments(BigDecimal post_id) {
		SqlSession sqlSession = sessionFactory.openSession(true);
		List<CommentHierarchyView> comments = sqlSession.selectList(postCommentMapper+"commentsByPostId", post_id);
		sqlSession.close();
		
		return comments;
	}
}
